class TodayLettersController < ApplicationController
    def index
        @today_letters = Letter.where(id: TodayLetter.all.pluck(:letter_id)).order(created_at: :desc)
    end
    def best_liked
        @today_letter.letter_id = Letter.where(created_at: selected_date.beginning_of_day..selected_date.end_of_day).order(:likes_count).last
    end
    def new
        @today_letter = TodayLetter.new
        selected_date = DateTime.now.to_date
        @today_letter.day = DateTime.now.to_date
        best_letter = Letter.where(created_at: selected_date.beginning_of_day..selected_date.end_of_day).order(:likes_count).last
        if best_letter.blank? 
          best_letter = Letter.where("created_at <= ?", selected_date.beginning_of_day).order(:likes_count).last
        end
        @today_letter.letter_id = best_letter.id
    end
    def create
        @today_letter = TodayLetter.new(today_letter_params)
        @today_letter.save
        redirect_to admini_path
    end
    def update
        @today_letter.update(today_letter_params)
    end
    def destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
      def set_today_letter
        @today_letter = TodayLetter.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def today_letter_params
        params.require(:today_letter).permit(:day, :letter_id)
      end
end
