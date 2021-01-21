require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @buy_address = FactoryBot.build(:buy_address)
  end
  describe '商品購入機能' do
    context '購入がうまくいく' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_address).to be_valid
      end
      it '建物が空' do
        @buy_address.building = nil
        expect(@buy_address).to be_valid
      end
    end

    context '購入がうまくいかない' do
      it 'トークンが空' do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空' do
        @buy_address.postal_code = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがない' do
        @buy_address.postal_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it '都道府県が空' do
        @buy_address.prefecture_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefecture Select")
      end
      it '市区町村が空' do
        @buy_address.city = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空' do
        @buy_address.house_num = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("House num can't be blank")
      end
      it '電話番号が空' do
        @buy_address.phone_num = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone num can't be blank")
      end
      it '電話番号ハイフンがあり11桁以上である' do
        @buy_address.phone_num = '090-12345-67890'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone num Input only number")
      end
      it 'user_idが空' do
        @buy_address.user_id = nil
        @buy_address.valid?
      end
      it 'item_idが空' do
        @buy_address.item_id = nil
        @buy_address.valid?
      end
    end
  end
end
