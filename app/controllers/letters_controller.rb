class LettersController < ApplicationController
  before_action :set_letter, only: [:show, :edit, :update, :destroy]

  # GET /letters
  # GET /letters.json
  def index
    @letters = Letter.all.order(created_at: :desc)
    @saved_letters = SavedLetter.find_by(id: current_user)
    @likes = Like.all.find_by(id: current_user)
    # @letters.each do |letter|
    #   letter.liked = ''
    # end
    # if @letters and @likes
    #   intersection = @letters.pluck(:id) & @likes.pluck(:id)
    #   intersection.each do |id|
    #     @letters.find(id).liked = true
    #   end
    # end

  end

  # GET /letters/1
  # GET /letters/1.json
  def show
  end

  # GET /letters/new
  def new
    @letter = Letter.new
    @letter.opened = true
    @sentence = TodaySentence.find_by(day: DateTime.now.to_date.strftime('%Y-%m-%d'))
    unless @sentence.present?
      @sentnece = TodaySentence.order_by(:day).last
    end
  end

  # GET /letters/1/edit
  def edit
  end

  # POST /letters
  # POST /letters.json
  def create
    unless current_user.present?
      redirect_to user_session_path
      return
    end
    @letter = Letter.new(letter_params)
    @letter.user = current_user

    respond_to do |format|
      if @letter.save
        format.html { redirect_to @letter, notice: '편지가 작성되었습니다.' }
        format.json { render :show, status: :created, location: @letter }
      else
        format.html { render :new }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /letters/1
  # PATCH/PUT /letters/1.json
  def update
    respond_to do |format|
      if @letter.update(letter_params)
        format.html { redirect_to @letter, notice: '편지가 수성되었습니다.' }
        format.json { render :show, status: :ok, location: @letter }
      else
        format.html { render :edit }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end


  def my_letters
    @letters = Letter.where(user_id: current_user).order(created_at: :desc)
  end

  # DELETE /letters/1
  # DELETE /letters/1.json
  def destroy
    @letter.destroy
    respond_to do |format|
      format.html { redirect_to letters_url, notice: 'Letter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_letter
      @letter = Letter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def letter_params
      params.require(:letter).permit(:body, :user_id, :opened)
    end
end
