require 'spec_helper'

RSpec.describe RReview do
  it 'review_get_check' do
    expect(p RReview.get('', 1000)[999])
  end
end
