class SavedLettersController < ApplicationController
    def index
        @saved_letters = Letter.where(id: current_user.saved_letters.all.pluck(:letter_id))
    end
    def create
        saved = SavedLetter.find_by(user_id: current_user.id, letter_id: params[:letter])
        if saved.present?
          saved.destroy
          redirect_to(letters_path)
          return
        end

        save = SavedLetter.new
        save.user_id = current_user.id
        save.letter_id = params[:letter]
        respond_to do |format|
          if save.save
            format.html { redirect_to letters_path, notice: 'Save was successfully created.' }
            format.json { render :show, status: :created, location: letters_path }
          else
            # format.html { redirect_to letters_path, notice: 'Like failed' }
            format.json { render json: 'errors', status: :unprocessable_entity }
          end
        end
    end
    def destroy
        @save.destroy
    end
end
