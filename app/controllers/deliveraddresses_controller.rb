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
      redirect_to root_path
    else
      redirect_to new_user_deliveraddress_path
    end
  end

  def update
    @deliveraddress = Deliveraddress.find(params[:id])
    if @deliveraddress.update(deliveraddress_params)
      redirect_to root_path
    else
      redirect_to new_user_deliveraddress_path
    end
  end

  private

  def deliveraddress_params
    params.require(:deliveraddress).permit(:family_name, :first_name, :family_name_pseudonym, :first_name_pseudonym, :post_number, :prefecture, :city, :street, :building, :phone_number).merge(user_id: current_user.id)
  end
end