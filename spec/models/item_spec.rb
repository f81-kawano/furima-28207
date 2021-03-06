require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかない' do
      it '画像が選択されてない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空欄' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空欄' do
        @item.infomation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Infomation can't be blank")
      end
      it 'カテゴリーが選択されてない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it '商品の状態が選択されてない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Select')
      end
      it '配送料の負担について選択されてない' do
        @item.shipping_id =  1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping Select')
      end
      it '発送元の地域について選択されてない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it '発送までの日数について選択されてない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping date Select')
      end
      it '価格が空欄' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が半角英数字以外である' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it '半角英数混合では登録できないこと' do
        @item.price = '300en'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it '半角英語だけでは登録できないこと' do
        @item.price = 'price'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it '299円以下では登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it '10,000,000以上では登録できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
