class LikesController < ApplicationController
    def index
    end
    def create
        unless current_user.present?
          redirect_to user_session_path
          return
        end
        liked = Like.find_by(user_id: current_user.id, letter_id: params[:letter])
        @letter = Letter.find_by(id: params[:letter])
        if liked.present?
          liked.destroy
          return
        end

        like = Like.new
        like.user_id = current_user.id
        like.letter_id = params[:letter]
        like.save
    end
    def destroy
        @like.destroy
    end
end
