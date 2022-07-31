class BlogController < ApplicationController
    def create_new_blog
        blog = Blog.new(user_params)

        if blog.save
            redirect_to "/home"
        else
            render plain: "fail"
        end
    end

    def save_blog
        save_id = params[:save_id]
        cur_user_id = session[:user_id]["id"]
        is_exist = (SavedBlog.where(users_id: cur_user_id, blogs_id: save_id).length > 0 ? true : false  )
        if is_exist
            redirect_to '/home'
        else
            save_record = SavedBlog.create!(
                users_id: cur_user_id,
                blogs_id: save_id,
            )
            save_record.save

            redirect_to '/home'
        end
    end

    def delete_saved
        delete_id = params[:del_id]
        cur_user_id = session[:user_id]["id"]
        delete_record = SavedBlog.find_by(users_id: cur_user_id, blogs_id: delete_id)
        delete_record.destroy
        delete_record.save
        redirect_to "/saved"
    end

    private
    def user_params
       params.require(:blog).permit(:title, :category, :description, :text, :img_url, :users_id)
    end
end
