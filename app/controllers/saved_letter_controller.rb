class SavedLetterController < ApplicationController
    def index
        @saved_letters = SavedLetter.all
    end
end
