class UsersController < ApplicationController

  before_action :move_to_root, except: [:step1, :step2, :create]




  def show

  end

  def mypage

  end

  def notification
  end

  def todo
  end

  def like_show
    @likes = Like.where(user_id: current_user.id)
  end

  def forsell
  end

  def in_progress
  end

  def completed
  end

  def all_evaluations
    @all_evaluations = Evaluation.latest30(current_user)
  end

  def good_evaluations
    @good_evaluations = Evaluation.latest30(current_user).where(rating: 1)
  end

  def normal_evaluations
    @normal_evaluations = Evaluation.latest30(current_user).where(rating: 2)
  end

  def bad_evaluations
    @bad_evaluations = Evaluation.latest30(current_user).where(rating: 3)
  end



  def logout
  end

  def identification
  end

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
    )

    if session["devise.omniauth_data"].present?
      @user[:provider] = session["devise.omniauth_data"]['provider']
      @user[:uid] = session["devise.omniauth_data"]['uid']
    end

    @user.build_address(user_params[:address_attributes])
    if @user.save
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
      redirect_to root_path, notice: 'ユーザー情報を登録しました。'
    else
      render'step1'
      flash.now[:danger] = 'ユーザー情報の登録に失敗しました。'
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

  def profile
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    @user = User.find(current_user[:id])
    if @user.update!(user_params)
      redirect_to mypage_user_path(@user), notice: 'ユーザー情報を編集しました。'
    else
      render'profile'
      flash[:danger] = 'ユーザー情報の編集に失敗しました。'
    end
  end

  def introduction
    @user = User.find(params[:id])
  end


  private
  def move_to_root
    redirect_to :root unless user_signed_in?
  end

  def user_params
    params.require(:user).permit(:family_name, :first_name, :family_name_pseudonym, :first_name_pseudonym, :birthday, :nickname, :photo, :email, :password, :password_confirmation, :phone_number, :profile, :line_token, deliver_address_attributes: [:id, :post_number, :prefecture, :city, :street, :building, :phone_number], address_attributes: [:id, :post_number, :prefecture, :city, :street, :building])
  end

  protected
  # 追記する
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

end
