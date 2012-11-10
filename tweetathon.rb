require 'rubygems'
require 'bundler'

Bundler.require

Twitter.configure do |config|
  config.consumer_key       = YOUR_CONSUMER_KEY
  config.consumer_secret    = YOUR_CONSUMER_SECRET
  config.oauth_token        = YOUR_OAUTH_TOKEN
  config.oauth_token_secret = YOUR_OAUTH_TOKEN_SECRET
end

class Tweetathon
  REAL_STRING = '@telethon7 is such a good cause for WA kids! Raising $1 for every tweet with the hashtag #telethon7'

  def loop!
    loop { tweet! }
  end

  private

  def random_string
    "#{RandomWord.adjs.to_a.sample} #{RandomWord.nouns.to_a.sample}"
  end

  def tweet_string
    "#{REAL_STRING} #{random_string}"
  end

  def wait
    seconds = rand(10)
    puts "Pausing for #{seconds} seconds"
    sleep seconds
  end

  def tweet!
    text = tweet_string
    puts "Tweeting: #{text}"
    Twitter.update(text)
    wait
  end
end

Tweetathon.new.loop!
