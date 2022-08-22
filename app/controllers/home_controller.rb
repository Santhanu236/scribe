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
      @pagy, @my_posts = pagy(Blog.where(users_id: get_user_id))
      render 'blog/my_blogs'
  end

  def saved
    @saved_blogs = SavedBlog.where(users_id: get_user_id)
    render 'blog/saved_blogs'
  end

  def my_account
    @user_details = User.find(get_user_id)
    render 'blog/my_account'
  end

  def new_blog
    render 'blog/create_blog'
  end

  def user_page
    @view_user_details = User.find(params[:vuid])
    @pagy, @view_user_blogs = pagy(Blog.where(users_id: params[:vuid]))
    @blog_own = User.find(params[:vuid])
    render 'blog/user_page'
  end

  def blog_page
    if is_user_logged
      @view_blog_id = params[:vbid]
      @view_blog = Blog.find(params[:vbid])
      @comments = Comment.where(blogs_id: params[:vbid])
      render 'blog/blog_page'
    else
      redirect_to '/'
    end
  end

  def edit_blog
    @edit_blog = Blog.find(params[:eblog_id])
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

  private
  def get_user_id
    session[:user_id]['id']
  end
end
