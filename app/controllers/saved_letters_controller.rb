class SavedLettersController < ApplicationController
    def index
        @saved_letters = Letter.where(id: current_user.saved_letters.all.pluck(:letter_id)).order(created_at: :desc)
    end
    def create
        unless current_user.present?
          redirect_to user_session_path
          return
        end
        saved = SavedLetter.find_by(user_id: current_user.id, letter_id: params[:letter])
        @letter = Letter.find_by(id: params[:letter])
        if saved.present?
          saved.destroy
          return
        end

        save = SavedLetter.new
        save.user_id = current_user.id
        save.letter_id = params[:letter]
        save.save
    end
    def destroy
        @save.destroy
    end
end
