class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category 
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping 
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :infomation, length: { maximum: 1000 }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_id	
      validates :prefecture_id	
      validates :shipping_date_id	
    end
    validates :price
    validates :user
  end
end
