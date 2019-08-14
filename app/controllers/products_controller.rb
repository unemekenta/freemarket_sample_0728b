class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
    @product.product_images.build
    @product.build_delivery
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :detail, :status_id, :condition_id, delivery_attributes: [:id, :shipping_fee, :deliver_method_id, :estimated_date_id], product_images_attributes: [:id, :image])
  end
end
