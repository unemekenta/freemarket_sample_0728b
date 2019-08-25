class UsersController < ApplicationController

  before_action :move_to_root

  def mypage
  end

  def notification
  end

  def todo
  end

  def like
  end

  def forsell
  end

  def in_progress
  end

  def completed
  end

  def logout
  end

  private
  def move_to_root
    redirect_to :root unless user_signed_in?
      
  end
end
