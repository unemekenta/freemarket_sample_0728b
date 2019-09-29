class EvaluationsController < ApplicationController

  before_action :set_user, only: [:new, :create]

  def new
    @evaluation_all = Evaluation.group(:seller_id).size[@user.id]
    @evaluation = Evaluation.new
  end


  def create
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      redirect_to introduction_user_path(@user.id), notice: "評価が送信されました"
    else
      redirect_to introduction_user_path, notice: "評価が正常に送信できませんでした。もう一度行ってください。"
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_params
    params.require(:user)
  end

  def evaluation_params
    params.require(:evaluation).permit(:rating, :comment).merge(buyer_id: current_user.id, seller_id: @user.id)
  end
end
