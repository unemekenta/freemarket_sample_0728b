class SignupController < ApplicationController
  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      birthday: session[:birthday],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_name_pseudonym: session[:family_name_pseudonym],
      first_name_pseudonym: session[:first_name_pseudonym],
      provider: session["devise.omniauth_data"]['provider'],
      uid: session["devise.omniauth_data"]['uid']

    )
    @user.build_address(user_params[:address_attributes])
    if @user.save
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
      session.delete('devise.omniauth_data')
      redirect_to root_path
    else
      render '/signup/step1'
    end
  end

  def step1
    @user = User.new
  end

  def step2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:birthday] = user_params[:birthday]
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_pseudonym] = user_params[:family_name_pseudonym]
    session[:first_name_pseudonym] = user_params[:first_name_pseudonym]
    @user = User.new
    @user.build_address
  end

  private

    def user_params
      params.require(:user).permit(:family_name, :first_name, :family_name_pseudonym, :first_name_pseudonym, :birthday, :nickname, :photo, :email, :password, :phone_number, deliver_address_attributes: [:id, :post_number, :prefecture, :city, :street, :building, :phone_number], address_attributes: [:id, :post_number, :prefecture, :city, :street, :building])
    end

end
