require "json"
require "rest-client"


response = RestClient.get "https://hacker-news.firebaseio.com/v0/topstories.json"
repos = JSON.parse(response)
repos_new = repos[0...10]

repos_new.each do |id|
  id_url = RestClient.get"https://hacker-news.firebaseio.com/v0/item/#{id}.json"
repos1 = JSON.parse(id_url)
p repos1["title"]
p repos1["url"]

post = Post.new(
  title: repos1["title"],
  url: repos1["url"]
  )
post.save
  puts "#{post.title} - #{post.url}"
end





# => repos is an `Array` of `Hashes`.

# => 30
# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
