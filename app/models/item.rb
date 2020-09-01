class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :arrival_date

  
  validates :name, :explanation, :price, :image, :user, presence: true
  validates :category_id, :status_id, :delivery_fee_id, :prefecture_id,:arrival_date_id, numericality: { other_than: 1, message: 'select' }
  validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price, numericality: { greater_than: 300, less_than: 9999999, message: 'Out of setting range' }  
end
