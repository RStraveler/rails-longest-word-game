require "open-uri"

class GamesController < ApplicationController
  def new
    sample_letters = ("a".."z").to_a.sample(10)
    @letters = sample_letters
  end



  def score
    payload = URI.open("https://wagon-dictionary.herokuapp.com/#{params[:word]}")
    json = payload.read
    @result = JSON.parse(json)

    @answer = if params[:word].include? params[:letters]
               "Sorry but #{params[:word]} can't be built out of #{params[:letters]}"
              elsif @result["found"] == false
                "Sorry but #{params[:word]} does not seem to be a valid english word..."
              else
                "good"
              end

  # The word can’t be built out of the original grid
  # The word is valid according to the grid, but is not a valid English word
  # The word is valid according to the grid and is an English word
  end
end
