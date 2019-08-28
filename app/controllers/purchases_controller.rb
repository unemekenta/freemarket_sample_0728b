class PurchasesController < ApplicationController
  
  before_action :set_product

  def new
    @purchase = @product.purchases.build
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      @product.status_id = 4
      @product.save
      redirect_to root_path
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
