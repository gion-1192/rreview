module RReview
  class ItemReview < Review
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

    def _use_info(data)
      unless data.empty?
        %i[usage employer used_number].map.with_index do |key, index|
          { key => data[index].inner_text }
        end
      end
    end
  end
end
