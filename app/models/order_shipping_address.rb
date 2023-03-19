class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :street, :building, :phone
  attr_accessor :token

  with_options presence: true do
    validates :city
    validates :street
    validates :phone, length: { minimum: 10, maximum: 11 }, numericality: { only_integer: true }
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
 validates :token, presence: true
 validate :token_present

 def token_present
   errors.add(:token, "がありません") unless token.present?
 end
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, phone: phone, street: street, building: building, order_id: order.id)
  end

end
