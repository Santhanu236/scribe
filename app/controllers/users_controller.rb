# frozen_string_literal: true

class UsersController < ApplicationController
  def create_user
    user = User.new(user_params)
    if user.save
      flash[:notice] = 'Registration Successfull! Log in to Continue...'
      redirect_to '/'
    else
      flash[:error] = user.errors.full_messages.first
      redirect_to '/signup'
    end
  end

  def update_user
    cur_user_id = session[:user_id]['id']
    update_user = User.find(cur_user_id)
    update_user.update(params.require(:user).permit(:first_name, :last_name, :bio, :img_url))
    if update_user.save
      flash[:notice] = 'User updated successfully'
      session[:user_id] = update_user
    else
      flash[:error] = update_user.errors.full_messages.first
      puts '==============================='
      puts '==============================='
      puts '==============================='
      puts update_user.errors.full_messages.first
    end
    redirect_to '/home'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
