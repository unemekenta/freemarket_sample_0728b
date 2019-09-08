class CategoryController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @categories = [
      @category,
      @category.children,
      @category.children.map { |category| category.children }
    ].flatten.compact
    @products = Product.where(category_id: @categories).where(status_id: 1).order("id DESC").limit(50)
  end
end
