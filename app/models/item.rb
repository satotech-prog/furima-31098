class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area, :category, :day, :delivery, :state

  with_options presence: true do
    validates :name
    validates :exposition
    validates :price

    validates :category_id, :state_id, :delivery_id, :area_id, :days_id,  numericality: { other_than: 1 }

  has_one_attached :image
  belongs_to :user
  has_one :buy
end
