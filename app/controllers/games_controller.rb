require "json"
require "open-uri"

class GamesController < ApplicationController

  DICTIONARY_URL = "https://wagon-dictionary.herokuapp.com/"

  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @word = params['word']
    @letters_grid = params['letters'].split(',')

    @valid_letters = grid_contains_word
    @valid_word = word_in_dictionary if @valid_letters
  end

  private

  def grid_contains_word
    @word.each_char do |letter|
      return false if @letters_grid.none?(letter.upcase)
    end
  end

  def word_in_dictionary
    response = URI.open(DICTIONARY_URL + @word).read
    result = JSON.parse(response)
    result['found'] == true
  end
end
