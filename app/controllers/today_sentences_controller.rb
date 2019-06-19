class TodaySentencesController < ApplicationController
    def index
        @today_sentences = TodaySentence.order(created_at: :desc)
    end
    def new
        @today_sentence = TodaySentence.new
        selected_date = DateTime.now.to_date
    end
    def create
        @today_sentences = TodaySentence.new(today_sentence_params)
        @today_sentences.save
        redirect_to admin_path
    end
    def update
        @today_sentences.update(today_letter_params)
    end
    def destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
      def set_today_sentence
        @today_sentences = TodaySentence.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def today_sentence_params
        params.require(:today_sentence).permit(:day, :body)
      end
end
