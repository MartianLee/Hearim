class LikesController < ApplicationController
    def index
    end
    def create
        liked = Like.find_by(user_id: current_user.id, letter_id: params[:letter])
        if liked.present?
          liked.destroy
          redirect_to(letters_path)
          return
        end

        like = Like.new
        like.user_id = current_user.id
        like.letter_id = params[:letter]
        respond_to do |format|
          if like.save
            format.html { redirect_to letters_path, notice: 'Like was successfully created.' }
            format.json { render :show, status: :created, location: letters_path }
          else
            # format.html { redirect_to letters_path, notice: 'Like failed' }
            format.json { render json: 'errors', status: :unprocessable_entity }
          end
        end
    end
    def destroy
        @like.destroy
    end
end
