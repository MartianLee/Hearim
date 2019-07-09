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
    redirect_to admini_path
  end

  def update
    @today_sentence.update(today_letter_params)
  end

  def destroy
    @today_sentence = set_today_sentence
    @today_sentence.destroy
    respond_to do |format|
      format.html { redirect_to today_sentences_path, notice: 'Letter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_today_sentence
    @today_sentence = TodaySentence.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def today_sentence_params
    params.require(:today_sentence).permit(:day, :body)
  end
end
