class UsersController < ApplicationController
    def create_user
        user = User.new(user_params)
        if user.save
            flash[:notice] = "Registration Successfull! Log in to Continue..."
            redirect_to "/"
        else
            flash[:error] = user.errors.full_messages.first
            redirect_to "/signup"
        end
    end

    def update_user
        cur_user_id = session[:user_id]["id"]
        @user = User.find(cur_user_id)
        if @user.update(params.require(:user).permit(:first_name, :last_name, :email, :bio, :img_url))
            flash[:notice] = "User updated successfully"
            session[:user_id] = @user
            redirect_to "/home"
        else
            flash[:error] = @user.errors.full_messages.first
            redirect_to "/home"
        end
    end

    private
    def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
