class LikesController < ApplicationController
    before_action :authenticate_user!, only:[:create, :destroy]

    def create
        idea = Idea.find params[:idea_id]
        like = Like.new(idea: idea, user: current_user)

        if !can?(:like, idea)
            flash[:alert] = "You can't like your own idea!"
        elsif like.save
            flash[:notice] = "Idea liked!"
        else
            flash[:alert] = like.errors.full.message.join(', ')
        end
        redirect_to ideas_path
    end

    def destroy
        like = current_user.likes.find params[:id]

        if can?(:destroy, like)
            like.destroy
            flash[:notice] = "Idea Unliked!"
        else
            flash[:alert] = "Could not Unlike Idea"
        end
        redirect_to ideas_path
    end
end
