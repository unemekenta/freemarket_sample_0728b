class UsersController < ApplicationController
  def new
    @user = User.new
    @user.build_deliver_address
    @user.addresses.build
  end
  
  def create
    
    binding.pry
    
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:family_name, :first_name, :family_name_pseudonym, :first_name_pseudonym, :birthday, :nickname, :photo, :email, :password, :phone_number, deliver_address_attributes: [:id, :post_number, :prefecture, :city, :street, :building, :phone_number], address_attributes: [:id, :post_number, :prefecture, :city, :street, :building])
  end
end
