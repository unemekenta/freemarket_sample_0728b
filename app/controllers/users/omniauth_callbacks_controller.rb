# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  # common callback method
  def callback_for(provider)
    user = User.from_omniauth(request.env["omniauth.auth"])

    if user
      sign_in_and_redirect user, event: :authentication 
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      if (data = request.env["omniauth.auth"])
        session["devise.omniauth_data"] = {
          email: data["extra"]["raw_info"]['email'],
          nickname: data["extra"]["raw_info"]['name'],
          provider: data['provider'],
          uid: data['uid']
        }
      end
      redirect_to step1_users_path
    end
  end

  def failure
    redirect_to new_user_session_path, alert: 'SNSログインできませんでした。やり直してください。'
  end

end
