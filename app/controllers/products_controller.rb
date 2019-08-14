class ProductsController < ApplicationController
  def index
    # 下記、カテゴリとブランドの実装が終わり次第修正
    @products_ladies = Product.where(id: 1..4)
    @products_mens = Product.where(id: 5..8)
    @products_kids = Product.where(id: 9..12)
    @products_cosme = Product.where(id: 13..16)
    @products_chanel = Product.where(id: 17..20)
    @products_vuitton = Product.where(id: 21..24)
    @products_supreme = Product.where(id: 25..28)
    @products_nike = Product.where(id: 29..32)
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
