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
    end
    redirect_to '/home'
  end

  def fpw_page
    render "blog/forgot_pw"
  end

  def generate_otp
    email = params[:fpw_email]
    is_exist = User.find_by(email: email)
    $fpw_user = is_exist
    if is_exist.nil?
      p 'entered if'
      flash[:error] = "Invalid Email! Retry with the Registered Email"
      redirect_to '/forgot_pw'
    else
      session[:otp] = generate_rand

      ForgotPasswordMailer.with(otp: session[:otp], user: is_exist['first_name'], to_email: email).new_otp_email.deliver_now
      render "blog/otp_page"
    end
  end

  def match_otp
    user_otp = params[:otp]
    if session[:otp] == user_otp
      render 'blog/reset_pw'
    else
      flash[:error] = "Invalid 6 Digit Code"
      render 'blog/otp_page'
    end
  end

  def reset_password
    hashes_pw = BCrypt::Password.create(params[:new_pw])
    reset_rec = User.find($fpw_user['id'])
    reset_rec.update(
      password_digest: hashes_pw
    )
    if reset_rec.save
      flash[:notice] = 'Password Reset Successfull!'
      redirect_to '/'
    end
  end

  private
  def generate_rand
    otp = 6.times.map{rand(10)}.join
    otp.to_s
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
