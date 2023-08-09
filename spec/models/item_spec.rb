require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '商品登録が出来る場合' do
      it '全ての必須項目が正しく入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録が出来ない場合' do
      it '商品画像が空欄では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空欄では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it '商品の説明が空欄では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーが空欄では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'カテゴリーが「---]では登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が空欄では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '商品の状態が「---]では登録できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担が空欄では登録できない' do
        @item.shipping_fee_responsibility_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee responsibility can't be blank")
      end

      it '配送料の負担が「---]では登録できない' do
        @item.shipping_fee_responsibility_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee responsibility can't be blank")
      end

      it '発送元の地域が空欄では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送元の地域が「---]では登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数が空欄では登録できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end

      it '発送までの日数が「---]では登録できない' do
        @item.days_to_ship_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end

      it '販売価格が300未満の場合は登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '販売価格が10,000,000以上の場合は登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
