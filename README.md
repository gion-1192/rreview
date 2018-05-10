# RReview

楽天のレビューを取得する為のgem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'r_review'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install r_review

## Usage

取得したいお店、または商品のレビューページのURLを引数として、
RReview.getメソッドを呼ぶだけ

```ruby
url = 'レビューページのURL'
RReview.get(url, 取得したいレビューの数)
```

成功したら、ショップならRReview::ShopReview、商品ならRReview::ItemReviewクラスの
入った配列が帰ってくる。  
レビューの各項目をプロパティから取得

例)レビュー内容の表示
```ruby
review = RReview.get(url, 10)
content = review[0].content
```

現在実装済みの項目は下記の通り。

・ショップレビュー  
  user_icon ユーザーアイコン  
  user_name レビューユーザーの名前  
  average_point レビューの点数  
  content レビュー内容  
  date レビュー記入日  
  point_details レビュー点数の詳細  
  assortment 品揃え  
    information_volume 情報量  
    payment_method 決済方法  
    staff_response スタッフの応対  
    packing 梱包  
    delivery 配送  
  review_item レビューした商品  
  review_item_img レビューした商品の画像  

・商品レビュー  
　user_icon ユーザーアイコン  
　user_name レビューユーザーの名前  
　average_point レビューの点数  
　content レビュー内容  
　date レビュー記入日  
　use_info レビューの詳細  
  　usage 使い道  
  　employer 使用者  
  　used_number 購入回数  

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/r_review. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
