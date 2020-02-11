require "json"
require "rest-client"
# require_relative "../app/models/post"

# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
response = RestClient.get "https://hacker-news.firebaseio.com/v0/topstories.json"
repos = JSON.parse(response).first(10)

repos.each do |post|
  url = RestClient.get "https://hacker-news.firebaseio.com/v0/item/#{post}.json"
  hash_from_hacker_news = JSON.parse(url)
  title = hash_from_hacker_news["title"]
  url = hash_from_hacker_news["url"]
  article_from_api = Article.new(title: title, content: url)
  article_from_api.save
end
