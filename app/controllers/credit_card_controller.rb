class CreditCardController < ApplicationController
  
  require "payjp"

  def new
    @path = Rails.application.routes.recognize_path(request.referer)
    card = CreditCard.where(user_id: current_user.id)
    redirect_to user_credit_card_path(current_user, card.id) if card.exists?
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    if params['payjp-token'].blank?
      redirect_to new_user_credit_card_path(current_user)
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        if params[:before_controller] == "purchases"
          product = params[:before_product]
          redirect_to new_product_purchase_path(product), notice: 'クレジットカードを登録しました。'
        else
          redirect_to user_credit_card_path(current_user, @card), notice: 'クレジットカードを登録しました。'
        end

      else
        redirect_to pay_user_credit_card_index_path(current_user), danger: 'クレジットカードの登録に失敗しました。'
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to user_credit_card_path(current_user, 0), notice: 'クレジットカードを削除しました。'
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    if params[:id].to_i != 0
      card = current_user.credit_card
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end