require 'rubygems'
require 'bundler'

Bundler.require

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
