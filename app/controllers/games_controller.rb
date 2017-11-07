require 'net/http'
require 'json'


class GamesController < ApplicationController



  def new
    @letters = (0...10).map { ('a'..'z').to_a[rand(26)] }.join
  end

  def score
    @word = params[:word].downcase
    @letters = params[:letters].downcase.split(" ")
    @letters.each do |letter|

    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response_parse = JSON.parse(response)
    @valid = response_parse["found"]
    if @valid == true && @letters.include? @word
      @message = "Congratulations, #{@word} is a valid word!"
    elsif @valid == false && @letters.include? @word
      @message = "Sorry, #{@word} is not a english word!"
    else
      @message = "Sorry, #{@word} is not a valid word!"
    end

  end


end


