class ProductsController < ApplicationController

  include CommonActions
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:index, :show, :search]

  def index
    products =  []

    [1, 2, 8, 6].each do |n|
      @category = Category.find(n)
      @categories = [
        @category,
        @category.children,
        @category.children.map { |category| category.children }
      ].flatten.compact
      products << Product.where(category_id: @categories).order("id DESC").limit(10)
    end

    # レディース
    @products_ladies = products[0]

    # メンズ
    @products_mens = products[1]

    # 家電・スマホ・カメラ
    @products_electronics = products[2]

    # おもちゃ・ホビー・グッズ
    @products_toys = products[3]

    # ブランド別新着アイテム
    @products_chanel = Product.where(brand_id: 1).order("id DESC").limit(10)
    @products_vuitton = Product.where(brand_id: 3).order("id DESC").limit(10)
    @products_supreme = Product.where(brand_id: 4).order("id DESC").limit(10)
    @products_nike = Product.where(brand_id: 2).order("id DESC").limit(10)

    @all_ranks = Product.find(Like.group(:product_id).order('count(product_id) desc').limit(5).pluck(:product_id))

  end

  def show
    @seller = User.find(@product.seller_id)
    points = Point.where(user_id: user_signed_in? ? current_user.id : 0 )
    @point = 0
    points.each do |po|
      @point += po.point
    end
    @comment = Comment.new
    @comments = Comment.where(product_id: @product.id)

    @relate_id = @product.category.id
    @relate_items = Product.where(category_id: @relate_id).order("RAND()").limit(3)
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

  def search
    @search_words = search_params[:name_has_every_term]
    @brands = Brand.all
    @statuses = Status.all
    @conditions = Condition.all

    @q = Product.search(search_params)
    @q.build_sort if @q.sorts.empty?
    @search_results = @q.result
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :detail, :status_id, :condition_id, :category_id, :brand_id, :size_id, delivery_attributes: [:id, :shipping_fee, :deliver_method_id, :estimated_date_id, :deliver_region_id], product_images_attributes: [:id, :image, :remove_image]).merge(seller_id: current_user.id)
  end

  def search_params
    params.require(:q).permit(:name_has_every_term, :brand_id_eq, {status_id_in: []}, {delivery_shipping_fee_eq_any: []}, {status_id_eq_any: []}, {condition_id_in: []}, :price_gteq, :price_lteq, :s)
  end

end