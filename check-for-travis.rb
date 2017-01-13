#!/usr/bin/env ruby
require 'octokit'

client = Octokit::Client.new :access_token => ENV['GITHUBTEACHER_TOKEN'] || raise("You need a GitHub Teacher access token")

# Get the tree for a sha
tree = client.tree("githubschool/on-demand-github-pages", "f1b10e926e7ace9862bf65b789204f22cccba1e0")

# Select .travis.yml from the tree
travis_yml = tree.tree.select { |t| t.path == ".travis.yml" }

# Get the corresponding blob for the .travis.yml sha
blob = client.blob("githubschool/on-demand-github-pages", travis_yml.first.sha)

# Inspect the content
puts Base64.decode64(blob.content)

# TODO: we need the current commit's `sha`

client.create_status("githubschool/on-demand-github-pages", sha, "failure", {
  :description => "You are not allowed to change .travis.yml"
})
