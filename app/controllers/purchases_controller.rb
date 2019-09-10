class PurchasesController < ApplicationController
  
  before_action :set_product

  def new
    @purchase = @product.purchases.build
    @address = current_user.deliveraddress
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @product.status_id == 1
      if @purchase.save
        @product.update(status_id: 4)
        redirect_to root_path, notice: "商品を購入しました"
      else
        # エラー発生時
        redirect_to root_path, alert: 'エラーが発生しました'
      end
    else
      # 売り切れ時
      redirect_to root_path, alert: 'この商品は売り切れました'
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:seller_id, :buyer_id, :product_id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
