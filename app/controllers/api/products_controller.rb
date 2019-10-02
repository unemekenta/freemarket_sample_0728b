class Api::ProductsController < ApplicationController
  def show
    product = Product.find(params[:product_id])
    last_message_id = params[:comment_id].to_i
    @comments = product.comments.where("id > #{last_message_id}")
  end
end