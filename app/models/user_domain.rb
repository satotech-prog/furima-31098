class UserDomain
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :town, :number, :build, :photo_number, :user_id, :item_id

  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :post_number
    validates :town
    validates :number
    #validates :build
    validates :photo_number
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    Domain.create(post_number: post_number, town: town, number: number, photo_number: photo_number, prefecture_id: prefecture_id)
  end
end


#build: bulid