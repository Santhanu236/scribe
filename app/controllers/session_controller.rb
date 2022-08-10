# frozen_string_literal: true

class SessionController < ApplicationController
  def login_handler
    user = User.find_by(email: user_params['email'])
    if user&.authenticate(user_params['password'])
      session[:user_id] = user
      redirect_to '/home'
    else
      flash[:error] = 'Invalid Email or Password'
      redirect_to '/'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
