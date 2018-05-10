module RReview
  class Review
    def initialize(review_data)
      review_data.each do |item|
        method = item.keys[0]
        data = item.values[0]

        data = self.class.private_method_defined?("_#{method}".to_sym) ?
               send("_#{method}".to_sym, data) : data.inner_text
        RReview::Review.class_eval { attr_accessor method }
        instance_variable_set("@#{method}", data)
      end
    end
  end
end
