class Destination < ApplicationRecord
  belongs_to :purchase_item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
