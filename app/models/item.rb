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
    validates :price
  end

    validates :category_id, :state_id, :delivery_id, :area_id, :days_id,  numericality: { other_than: 1 }

  has_one_attached :image
  belongs_to :user
  has_one :buy
end
