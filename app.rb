require 'sinatra'

get('/') do
  erb(:application_layout)
end
