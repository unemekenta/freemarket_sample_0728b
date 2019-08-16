class ProductsController < ApplicationController
  def index
    products = Product.order("id DESC").limit(32)
    @products_ladies = products[0..3]
    @products_mens = products[4..7]
    @products_kids = products[8..11]
    @products_cosme = products[12..15]
    @products_chanel = products[16..19]
    @products_vuitton = products[20..23]
    @products_supreme = products[24..27]
    @products_nike = products[28..31]
  end

  def show
    @product = Product.find(params[:id])
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
    params.require(:product).permit(:name, :price, :detail, :status_id, :condition_id, delivery_attributes: [:id, :shipping_fee, :deliver_method_id, :estimated_date_id, :deliver_region_id], product_images_attributes: [:id, :image])
  end
end
