# frozen_string_literal: true

class HomeController < ApplicationController
  def home
    if session[:user_id].nil?
      redirect_to '/'
    else
      render 'blog/home'
    end
  end

  def login
    if !session[:user_id].nil?
      redirect_to '/home'
    else
      render 'blog/login'
    end
  end

  def signup
    render 'blog/signup'
  end

  def my_blogs
    render 'blog/my_blogs'
  end

  def saved
    render 'blog/saved_blogs'
  end

  def my_account
    render 'blog/my_account'
  end

  def new_blog
    render 'blog/create_blog'
  end

  def user_page
    $view_user_id = params[:vuid]
    render 'blog/user_page'
  end

  def blog_page
    $view_blog_id = params[:vbid]
    render 'blog/blog_page'
  end

  def edit_blog
    $edit_blog_id = params[:eblog_id]
    render 'blog/edit_blog'
  end
end
