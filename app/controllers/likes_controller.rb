class LikesController < ApplicationController
    def create
        like = Like.new
        like.user_id = current_user.id
        like.letter_id = params[:letter]
        byebug
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
