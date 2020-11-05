class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery
  belongs_to_active_hash :day
  belongs_to_active_hash :state

  with_options presence: true do
    validates :name
    validates :exposition
    validates :image
    validates :price, format: { with: /\A[0-9]+\z/ }
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id, :state_id, :delivery_id, :area_id, :days_id, numericality: { other_than: 1 }

  has_one_attached :image
  belongs_to :user
  has_one :buy
end
