class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end

  def score
    require 'open-uri'
    require 'json'
    @letters = params[:letters].split(' ')
    @word = params[:word].upcase

    @letter_included = @word.chars.all? { |letter| @word.count(letter) <= @letters.count(letter) }

    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    response = open(url)
    @json_response = JSON.parse(response.read)
  end
end
