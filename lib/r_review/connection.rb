require 'open-uri'
require 'nokogiri'

module RReview
  class Connection
    class << self
      def get_review_data(url, count, type)
        i = 0
        klass = Object.const_get("RReview::#{type.capitalize}Review")
        review_list = []
        while i < count && (i % 15).zero?
          getdoc(endpoint(url, i)).xpath(node_root).each do |node|
            review_list.push(klass.new(scraping_data(type).map do |k, v|
              { k => node.xpath('.' + v) }
            end))
            i += 1
            break if i >= count
          end
        end
        review_list
      end

      private

      def endpoint(url, index)
        @endpoint = "#{url}#{(index / 15) + 1}.1/"
      end

      def getdoc(url)
        charset = nil
        html = open(url) do |f|
          charset = f.charset
          f.read
        end
        Nokogiri::HTML.parse(html, nil, charset)
      rescue SocketError
        puts 'page not find'
      end

      def node_root
        '//div[@class="revRvwUserSec hreview"]'
      end

      def scraping_data(type)
        raise 'not defined type' unless (type == 'item' || type == 'shop')

        {
          user_icon: '//li[@class="revUserFace"]',
          user_name: '//dt[@class="revUserFaceName reviewer"]',
          average_point: '//span[@class="revUserRvwerNum value"]',
          content: '//dd[@class="revRvwUserEntryCmt description"]',
          date: '//span[@class="revUserEntryDate dtreviewed"]'
        }.merge(send("add_#{type}_scraping_data".to_sym))
      end

      def add_shop_scraping_data
        {
          point_details: '//span[@class="revDispListNum"]',
          review_item: '//div[@class="revRvwUserItemCnt"]',
          review_item_img: '//p[@class="revUserItemImg"]'
        }
      end

      def add_item_scraping_data
        { use_info: '//span[@class="revDispListTxt"]' }
      end
    end
  end
end
