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

    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    response = URI.open(url)
    @json_response = JSON.parse(response.read)

    @letter_included = @word.chars.all? { |letter| @word.count(letter) <= @letters.count(letter) }
  end
end
