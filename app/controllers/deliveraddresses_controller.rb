class DeliveraddressesController < ApplicationController

  def new
    @path = Rails.application.routes.recognize_path(request.referer)
    if current_user.deliveraddress
      @deliveraddress = current_user.deliveraddress
      render :edit
    else
      @deliveraddress = Deliveraddress.new
    end
  end

  def edit
  end

  def create
    @deliveraddress = Deliveraddress.new(deliveraddress_params)
    if @deliveraddress.save
      if params[:deliveraddress][:before_controller] == "purchases"
        product = params[:deliveraddress][:before_product]
        redirect_to new_product_purchase_path(product), notice: "発送元・お届け先住所変更が完了しました"
      else
        redirect_to mypage_user_path(current_user), notice: "発送元・お届け先住所変更が完了しました"
      end
    else
      redirect_to new_user_deliveraddress_path, alert: "入力に誤りがあります。"
    end
  end

  def update
    @deliveraddress = Deliveraddress.find(params[:id])
    if @deliveraddress.update(deliveraddress_params)
      if params[:deliveraddress][:before_controller] == "purchases"
        product = params[:deliveraddress][:before_product]
        redirect_to new_product_purchase_path(product), notice: "発送元・お届け先住所変更が完了しました"
      else
        redirect_to mypage_user_path(current_user), notice: "発送元・お届け先住所変更が完了しました"
      end
    else
      redirect_to new_user_deliveraddress_path, alert: "未入力の項目があります。"
    end
  end

  private

  def deliveraddress_params
    params.require(:deliveraddress).permit(:family_name, :first_name, :family_name_pseudonym, :first_name_pseudonym, :post_number, :prefecture, :city, :street, :building, :phone_number).merge(user_id: current_user.id)
  end
end