class PurchaseItemDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building, :phone_number, :price, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'input correctly include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'select' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :token
    validates :price
    validates :user_id
    validates :item_id
  end

  def save
    purchase_item = PurchaseItem.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_item_id: purchase_item.id)
    Order.create(price: price, token: token)
  end
end
