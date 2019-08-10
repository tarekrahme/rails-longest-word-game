require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    array = ('A'..'Z').to_a
    @letters = array.sample(10)
  end

  def score
    @word = params['word']
    @letters = params['letters']

    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    url_output = open(url).read
    word_validity = JSON.parse(url_output)['found']

    result = @word.chars.all? { |letter| @word.count(letter) <= @letters.downcase.count(letter) }

    if word_validity == false
      @outcome = 'Your word is not an English word!'
    elsif result
      @outcome = "CONGRATS!"
    else
      @outcome = 'Your letters don\'t match the grid!'
    end
  end
end
