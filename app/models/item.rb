class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :arrival_date

  
  #空の投稿を保存できないようにする
  # validates :, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  # validates :category_id, numericality: { other_than: 1 }
end
