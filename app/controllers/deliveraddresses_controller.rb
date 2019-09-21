class DeliveraddressesController < ApplicationController

  def new
    if current_user.deliveraddress
      @deliveraddress = current_user.deliveraddress
      render :edit
    else
      @deliveraddress = Deliveraddress.new
    end
  end

  def edit
  end

  def create
    @deliveraddress = Deliveraddress.new(deliveraddress_params)
    if @deliveraddress.save
      redirect_to root_path, notice: "新規作成完了"
    else
      redirect_to new_user_deliveraddress_path, alert: "入力に誤りがあります。再度入力して下さい。"
    end
  end

  def update
    @deliveraddress = Deliveraddress.find(params[:id])
    if @deliveraddress.update(deliveraddress_params)
      redirect_to root_path, notice: "編集が完了しました"
    else
      redirect_to new_user_deliveraddress_path, alert: "未入力の項目がございました、もう一度入力して下さい。"
    end
  end

  private

  def deliveraddress_params
    params.require(:deliveraddress).permit(:family_name, :first_name, :family_name_pseudonym, :first_name_pseudonym, :post_number, :prefecture, :city, :street, :building, :phone_number).merge(user_id: current_user.id)
  end
end