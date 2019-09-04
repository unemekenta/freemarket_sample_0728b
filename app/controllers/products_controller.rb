class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

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
    @categories_parents = Category.where(parent_id: nil)
    @categories_children = Category.where(parent_id: 14..32)
    @categories_grandchildren_ladies1 = Category.where(parent_id: 14)
    @categories_grandchildren_ladies2 = Category.where(parent_id: 15)
    @categories_grandchildren_ladies3 = Category.where(parent_id: 16)


  end

  def show
    @seller = User.find(@product.seller_id)
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
    else
      # 仮置きで追加。後日きちんと実装予定
      redirect_to new_product_path
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id), notice: "商品情報を編集しました"
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path, notice: "商品が削除されました"
    else
      redirect_to product_path(@product.id), notice: "削除に失敗しました"
    end
  end

  # ビューを表示するためだけの仮のルーティング
  def teltest
  end


  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :detail, :status_id, :condition_id, :category_id, :brand_id, :size_id, delivery_attributes: [:id, :shipping_fee, :deliver_method_id, :estimated_date_id, :deliver_region_id], product_images_attributes: [:id, :image]).merge(seller_id: current_user.id)
  end

end
