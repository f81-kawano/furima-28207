class Buy < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item, optional: true
  has_one :address
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :prefecture_id
  end
end
