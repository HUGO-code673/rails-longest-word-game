class GamesController < ApplicationController

  def new
      @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
      @word = params[:word]
      @letters = params[:letters]
      @score = run_game(@word, @letters)
  end

  def run_game(word, letters)
    if word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
      if english_word?(word)
        "Congratulations! #{word.upcase} is a valid English word!"
      else
        "Sorry but #{word.upcase} does not seem to be a valid English word..."
      end
    else
      "Sorry but #{word.upcase} can't be built out of #{letters}"
    end
  end

  def english_word?(word)
    @url = "https://wagon-dictionary.herokuapp.com/#{word}"
    @data = url.parsed_response
    raise
  end
end
