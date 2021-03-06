class UserDomain
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :town, :number, :build, :photo_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_number
    validates :town
    validates :number
    validates :photo_number
    validates :token
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: { other_than: 1 }
  validates :post_number, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :photo_number, format: { with: /\A\d{11}\z/ }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)

    Domain.create(post_number: post_number, town: town, number: number, build: build, photo_number: photo_number, prefecture_id: prefecture_id, buy_id: buy.id)
  end
end
