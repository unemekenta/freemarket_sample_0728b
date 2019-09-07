class BrandsController < ApplicationController

  def show
    @brands = Brand.find(params[:id])
    @products = Product.where(brand_id: params[:id]).where(status_id: 1).order("id DESC").limit(50)
  end

end
