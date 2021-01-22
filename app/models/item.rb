class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_one :buy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :infomation, length: { maximum: 1000 }
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :prefecture_id
    validates :shipping_date_id
  end
end
