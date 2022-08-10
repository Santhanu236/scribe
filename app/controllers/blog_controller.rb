# frozen_string_literal: true

class BlogController < ApplicationController
  def create_new_blog
    blog = Blog.new(user_params)
    if blog.save
      redirect_to '/home'
    else
      render plain: 'fail'
    end
  end

  def update_blog
    update_record = Blog.find($edit_blog_id)
    update_record.update(params.require(:blog).permit(:title, :category, :description, :text, :img_url))
    redirect_to "/my_blogs"
  end

  def save_blog
    save_id = params[:save_id]
    is_exist = SavedBlog.find_by(users_id: get_user_id, blogs_id: save_id).nil?
    if is_exist
      save_record = SavedBlog.create!(
        users_id: get_user_id,
        blogs_id: save_id
      )
      save_record.save
    end
    redirect_back(fallback_location: root_path)
  end

  def delete_saved
    delete_id = params[:del_save_id]
    delete_record = SavedBlog.find_by(users_id: get_user_id, blogs_id: delete_id)
    delete_record.destroy
    redirect_back(fallback_location: root_path)
  end

  def like_blog
    like_id = params[:like_id]
    like_exist = Like.find_by(users_id: get_user_id, blogs_id: like_id).nil?
    if like_exist
      like_record = Like.create!(
        users_id: get_user_id,
        blogs_id: like_id
      )
      like_record.save
    end
    redirect_back(fallback_location: root_path)
  end

  def delete_liked
    delete_id = params[:del_like_id]
    delete_record = Like.find_by(users_id: get_user_id, blogs_id: delete_id)
    delete_record.destroy
    redirect_back(fallback_location: root_path)
  end

  def create_comment
    comment = Comment.new(params.require(:comment).permit(:users_id, :blogs_id, :comment_text))
    if comment.save
      redirect_back(fallback_location: root_path)
    else
      render plain: 'problem with adding comment'
    end
  end

  private

  def get_user_id
    session[:user_id]['id']
  end

  def user_params
    params.require(:blog).permit(:title, :category, :description, :text, :img_url, :users_id)
  end
end
