require 'rubygems'
require 'sinatra'
require 'json'

post '/payload' do
  puts "fontfontfont"
  system './addcollaborators -r githubteacher/all-the-hooks -i 1'
  push = JSON.parse(request.body.read)
  puts "I got some JSON: #{push.inspect}"
end

get '/' do
  "Hello, World!"
end

get '/about' do
  "I'm Briana and I love waffles."
end

get '/hello/:name/' do
  "Hello there, #{params[:name]}."
end

get '/hello/:name/:city' do
  "Hey there #{params[:name]} from #{params[:city]}."
end
