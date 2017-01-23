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

  if repo === "githubschool/open-enrollment-classes-introduction-to-github" && issue == 927
    puts "adding to githubschool/open-enrollment-classes-introduction-to-github"
    Collaborator.addByComment repo_name: "githubschool/open-enrollment-classes-introduction-to-github", issue_num: 927
  elsif repo ===  "githubschool/on-demand-github-pages" && issue == 1
    puts "adding to githubschool/on-demand-github-pages"
    Collaborator.addByComment repo_name: "githubschool/on-demand-github-pages", issue_num: 1
  else
    Collaborator.addByIssue repo_name: repo, issue_num: issue, user_login: user
  end
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
