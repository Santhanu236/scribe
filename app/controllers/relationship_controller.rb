class RelationshipController < ApplicationController
    def create_relationship
        user_id = params[:fol_usr_id]
        ur = UserRelationship.create!(
            user: user_id,
            follower: session[:user_id]["id"]
        )
        if ur.save
            redirect_back(fallback_location: root_path)
        end
    end

    def del_relationship
        user_id = params[:unfol_id]
        UserRelationship.find_by(user: user_id, follower: session[:user_id]["id"]).delete
        redirect_back(fallback_location: root_path)
    end

end
