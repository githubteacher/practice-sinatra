require 'rubygems'
require 'sinatra'
require 'json'
require_relative 'collaborators'

jsontest = "none"

post '/payload' do
  push = JSON.parse(request.body.read)
  puts "I got some JSON: #{push.inspect}"

  repo = push["repository"]["full_name"].to_s
  issue = push["issue"]["number"].to_i
  user = push["issue"]["user"]["login"].to_s

  Collaborator.addByIssue repo_name: repo, issue_num: issue, user_login: user
end

get '/' do
  jsontest
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
