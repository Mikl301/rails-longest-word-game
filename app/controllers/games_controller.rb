# frozen_string_literal: true

# games controller
class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end

  def score
    @letters = params[:letters].split(' ')
    @word = params[:word].upcase

    # JSON call
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    response = URI.open(url)
    @json_response = JSON.parse(response.read)

    # Check the number of each letter of the word
    @letter_included = @word.chars.all? do |letter|
      @word.count(letter) <= @letters.count(letter)
    end

    # Increment current session score
    session[:score] += @word.length**2
  end
end
