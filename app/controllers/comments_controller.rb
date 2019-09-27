class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html {redirect_to product_path(params[:product_id])}
      format.json
    end
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :product_id).merge(user_id: current_user.id)
  end
end
