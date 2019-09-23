class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    products =  []

    [1, 2, 3, 7].each do |n|
      @category = Category.find(n)
      @categories = [
        @category,
        @category.children,
        @category.children.map { |category| category.children }
      ].flatten.compact
      products << Product.where(category_id: @categories).order("id DESC").limit(4)
    end

    # レディース
    @products_ladies = products[0]

    # メンズ
    @products_mens = products[1]

    # キッズ
    @products_kids = products[2]

    # コスメ
    @products_cosme = products[3]

    # ブランド別新着アイテム
    @products_chanel = Product.where(brand_id: 1).order("id DESC").limit(4)
    @products_vuitton = Product.where(brand_id: 3).order("id DESC").limit(4)
    @products_supreme = Product.where(brand_id: 4).order("id DESC").limit(4)
    @products_nike = Product.where(brand_id: 2).order("id DESC").limit(4)


    # @categories_parents = Category.where(parent_id: nil)
    # @categories_children = Category.where(parent_id: 14..32)
    # @categories_grandchildren_ladies1 = Category.where(parent_id: 14)
    # @categories_grandchildren_ladies2 = Category.where(parent_id: 15)
    # @categories_grandchildren_ladies3 = Category.where(parent_id: 16)
  end

  def show
    @seller = User.find(@product.seller_id)
    points = Point.where(user_id: current_user.id)
    @point = 0
    points.each do |po|
      @point += po.point
    end
  end
  
  def new
    @product = Product.new
    @product.product_images.build
    @product.build_delivery
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice: "出品が完了しました"
    else
      redirect_to new_product_path, alert: "入力項目が不足しています。再度出品してください"
    end
  end

  def edit
  end

  def update
    case @product.product_images.size
    when 1 then
      test = (product_params[:product_images_attributes]["0"][:remove_image] == "1") && (product_params[:product_images_attributes]["1"].nil?)
    when 2 then
      test = (product_params[:product_images_attributes]["0"][:remove_image] == "1") && (product_params[:product_images_attributes]["1"][:remove_image] == "1") && (product_params[:product_images_attributes]["2"].nil?)
    when 3 then
      test = (product_params[:product_images_attributes]["0"][:remove_image] == "1") && (product_params[:product_images_attributes]["1"][:remove_image] == "1") && (product_params[:product_images_attributes]["2"][:remove_image] == "1") && (product_params[:product_images_attributes]["3"].nil?)
    when 4 then
      test = (product_params[:product_images_attributes]["0"][:remove_image] == "1") && (product_params[:product_images_attributes]["1"][:remove_image] == "1") && (product_params[:product_images_attributes]["2"][:remove_image] == "1") && (product_params[:product_images_attributes]["3"][:remove_image] == "1") && (product_params[:product_images_attributes]["4"].nil?)
    when 5 then
      test = (product_params[:product_images_attributes]["0"][:remove_image] == "1") && (product_params[:product_images_attributes]["1"][:remove_image] == "1") && (product_params[:product_images_attributes]["2"][:remove_image] == "1") && (product_params[:product_images_attributes]["3"][:remove_image] == "1") && (product_params[:product_images_attributes]["4"][:remove_image] == "1") && (product_params[:product_images_attributes]["5"].nil?)
    when 6 then
      test = (product_params[:product_images_attributes]["0"][:remove_image] == "1") && (product_params[:product_images_attributes]["1"][:remove_image] == "1") && (product_params[:product_images_attributes]["2"][:remove_image] == "1") && (product_params[:product_images_attributes]["3"][:remove_image] == "1") && (product_params[:product_images_attributes]["4"][:remove_image] == "1") && (product_params[:product_images_attributes]["5"][:remove_image] == "1") && (product_params[:product_images_attributes]["6"].nil?)
    when 7 then
      test = (product_params[:product_images_attributes]["0"][:remove_image] == "1") && (product_params[:product_images_attributes]["1"][:remove_image] == "1") && (product_params[:product_images_attributes]["2"][:remove_image] == "1") && (product_params[:product_images_attributes]["3"][:remove_image] == "1") && (product_params[:product_images_attributes]["4"][:remove_image] == "1") && (product_params[:product_images_attributes]["5"][:remove_image] == "1") && (product_params[:product_images_attributes]["6"][:remove_image] == "1") && (product_params[:product_images_attributes]["7"].nil?)
    when 8 then
      test = (product_params[:product_images_attributes]["0"][:remove_image] == "1") && (product_params[:product_images_attributes]["1"][:remove_image] == "1") && (product_params[:product_images_attributes]["2"][:remove_image] == "1") && (product_params[:product_images_attributes]["3"][:remove_image] == "1") && (product_params[:product_images_attributes]["4"][:remove_image] == "1") && (product_params[:product_images_attributes]["5"][:remove_image] == "1") && (product_params[:product_images_attributes]["6"][:remove_image] == "1") && (product_params[:product_images_attributes]["7"][:remove_image] == "1") && (product_params[:product_images_attributes]["8"].nil?)
    when 9 then
      test = (product_params[:product_images_attributes]["0"][:remove_image] == "1") && (product_params[:product_images_attributes]["1"][:remove_image] == "1") && (product_params[:product_images_attributes]["2"][:remove_image] == "1") && (product_params[:product_images_attributes]["3"][:remove_image] == "1") && (product_params[:product_images_attributes]["4"][:remove_image] == "1") && (product_params[:product_images_attributes]["5"][:remove_image] == "1") && (product_params[:product_images_attributes]["6"][:remove_image] == "1") && (product_params[:product_images_attributes]["7"][:remove_image] == "1") && (product_params[:product_images_attributes]["8"][:remove_image] == "1") && (product_params[:product_images_attributes]["9"].nil?)
    when 10 then
      test = (product_params[:product_images_attributes]["0"][:remove_image] == "1") && (product_params[:product_images_attributes]["1"][:remove_image] == "1") && (product_params[:product_images_attributes]["2"][:remove_image] == "1") && (product_params[:product_images_attributes]["3"][:remove_image] == "1") && (product_params[:product_images_attributes]["4"][:remove_image] == "1") && (product_params[:product_images_attributes]["5"][:remove_image] == "1") && (product_params[:product_images_attributes]["6"][:remove_image] == "1") && (product_params[:product_images_attributes]["7"][:remove_image] == "1") && (product_params[:product_images_attributes]["8"][:remove_image] == "1") && (product_params[:product_images_attributes]["9"][:remove_image] == "1") && (product_params[:product_images_attributes]["10"].nil?)
    end
    if test
      redirect_to edit_product_path, alert: "入力項目が不足しています。再度必須項目をお確かめください"
    else
      if @product.update(product_params)
        redirect_to product_path(@product.id), notice: "商品情報を編集しました"
      else
        redirect_to edit_product_path, alert: "入力項目が不足しています。再度必須項目をお確かめください"
      end
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path, notice: "商品が削除されました"
    else
      redirect_to product_path(@product.id), alert: "削除に失敗しました"
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
    params.require(:product).permit(:name, :price, :detail, :status_id, :condition_id, :category_id, :brand_id, :size_id, delivery_attributes: [:id, :shipping_fee, :deliver_method_id, :estimated_date_id, :deliver_region_id], product_images_attributes: [:id, :image, :remove_image]).merge(seller_id: current_user.id)
  end

end
