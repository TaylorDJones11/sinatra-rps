require 'sinatra'
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get('/') do
  erb(:home)
end

get('/rock') do
  @user_choice = 'rock'
  @computer_choice = ['rock', 'paper', 'scissors'].sample
  @result = determine_result(@user_choice, @computer_choice)
  erb(:rock)
end

get('/paper') do
  @user_choice = 'paper'
  @computer_choice = ['rock', 'paper', 'scissors'].sample
  @result = determine_result(@user_choice, @computer_choice)
  erb(:paper)
end

get('/scissors') do
@user_choice = 'scissors'
@computer_choice =  ['rock', 'paper', 'scissors'].sample
@result = determine_result(@user_choice, @computer_choice)

  erb(:scissors)
end

def determine_result(user_choice, computer_choice)
  if user_choice == computer_choice
    result = "It's a tie!"
  elsif (user_choice == 'rock' && computer_choice == 'scissors') ||
    (user_choice == 'paper' && computer_choice == 'rock') ||
    (user_choice == 'scissors' && computer_choice == 'paper')
    result = "We won!"
  else 
    result = "We lost!"
  end
end
