# frozen_string_literal: true

class HomeController < ApplicationController
  def is_user_logged
    if session[:user_id].nil?
      false
    else
      true
    end
  end

  def home
    if is_user_logged
      @pagy, @all_posts = pagy(Blog.all)
      render 'blog/home'
    else
      redirect_to '/'
    end
  end

  def login
    if is_user_logged
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

  def feedback
    render 'blog/feedback'
  end

  def submit_feedback
    cur_user = session[:user_id]['id']
    feedback = params[:feedback]
    fb = Feedback.create!(
      users_id: cur_user,
      feedback: feedback
    )
    if fb.save
      redirect_to '/home'
    end
  end
end
