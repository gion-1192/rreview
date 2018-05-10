module RReview
  class ShopReview < Review
    private

    def _point_details(data)
      %i[assortment information_volume payment_method
         staff_response packing delivery].map.with_index do |key, index|
        { key => data.inner_text[index] }
      end
    end

    def _user_icon(data)
      data.css('img').attribute('src').value
    end

    def _user_name(data)
      name = data.css('a').inner_text
      name.empty? ? '購入者' : name
    end

    def _review_item(data)
      unless data.empty?
        tmp = {
          name: data.xpath('.//dt[@class="revRvwUserEntryItemName"]').css('a').inner_text,
          point: data.xpath('.//span[@class="revSubRvwerNum"]').inner_text,
          content: data.xpath('.//dd[@class="revRvwUserEntryCmt"]').inner_text
        }
        url = data.xpath('.//dt[@class="revRvwUserEntryItemName"]').css('a')
        url.empty? ? tmp : tmp.merge(url: url.attribute('href').value)
      end
    end

    def _review_item_img(data)
      unless data.empty?
        if data.css('a').css('img').empty?
          'https://r.r10s.jp/com/img/review/share/201403/nopicture_160x160.gif'
        else
          data.css('a').css('img').attribute('src').value
        end
      end
    end
  end
end
