class BuyAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :buy_id, :postal_code, :prefecture_id, :city, :house_num, :building, :phone_num
  VALID_PHONE_NUMBER_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly" }
  validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
  with_options presence: true do
    validates :city
    validates :house_num
    validates :phone_num, format: { with: VALID_PHONE_NUMBER_REGEX, message: "Input only number" }
  end

  def save
    Buy.create(user_id: user.id, item_id: item.id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_num: house_num, building: building, phone_num: phone_num, buy_id: buy.id)
  end

end