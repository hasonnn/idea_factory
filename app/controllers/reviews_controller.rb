class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_idea, only:[:create, :destroy]
    def create
        @review = Review.new review_params
        @review.idea = @idea
        @review.user = current_user
        if @review.save
          redirect_to idea_path(@idea), notice: 'Review created!'
        else
          render '/idea/show'
        end
      end
      def destroy
        @review = Review.find params[:id]
        @review.destroy
        redirect_to idea_path(@idea), notice: 'Review Deleted!'
      end
    
    private
    def find_idea
      @idea = Idea.find params[:idea_id]
    end

    def review_params
      params.require(:review).permit(:body)
    end
end
