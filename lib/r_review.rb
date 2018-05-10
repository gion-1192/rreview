require 'r_review/version'
require 'r_review/review'
require 'r_review/shop_review'
require 'r_review/item_review'
require 'r_review/connection'

module RReview
  # Your code goes here...
  class << self
    def get(url, count)
      md = url.match(/^https:\/\/review.rakuten.co.jp\/(shop|item)\/\d+\/\d+_\d+\//)
      unless md.nil?
        RReview::Connection.get_review_data(md[0], count, md[1])
      else
        puts 'Error! The URL is invalid.'
      end
    end
  end
end
