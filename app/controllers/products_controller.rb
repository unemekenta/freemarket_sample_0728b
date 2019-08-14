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

end
