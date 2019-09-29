class CommentsController < ApplicationController
  before_action :set_product

  def create
    @comment = @product.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html {redirect_to product_path(@product.id), notice: "コメントを投稿しました"}
        format.json
      end
    else
      redirect_to product_path(@product.id), alert: "コメント投稿に失敗しました"
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to product_path(params[:product_id]), notice: "コメントが更新されました"
    else
      render :edit, alert: "更新に失敗しました"
    end
  end

  def destroy
    @comment = @product.comments.find(params[:id])
    if @comment.destroy
      redirect_to product_path(params[:product_id]), notice: "コメントが削除されました"
    else
      redirect_to root_path, alert: "削除に失敗しました"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
