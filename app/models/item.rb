class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category 
  belongs_to_active_hash :status
  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :infomation, length: { maximum: 1000 }
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id
    validates :shipping_id	
    validates :prefecture_id	
    validates :shipping_date_id	
    validates :price
    validates :user
  end
end
