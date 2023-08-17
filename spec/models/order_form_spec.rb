require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @orderform = FactoryBot.build(:order_form)
  end

  describe '商品購入' do
    context '商品購入が出来る場合' do
      it '全ての必須項目が正しく入力されていれば購入できる' do
        expect(@orderform).to be_valid
      end
      it '建物名が空欄でも購入できる' do
        @orderform.building_name = ''
        expect(@orderform).to be_valid
      end
    end

    context '商品購入が出来ない場合' do
      it '郵便番号が空欄では購入ができない' do
        @orderform.postal_code = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがなければ購入ができない' do
        @orderform.postal_code = 1234567
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が空欄では購入ができない' do
        @orderform.prefecture_id = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空欄では購入ができない' do
        @orderform.city  = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空欄では購入ができない' do
        @orderform.street_address  = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Street address can't be blank")
      end
      it '電話番号が空欄では購入ができない' do
        @orderform.phone_number  = ''
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると購入ができない' do
        @orderform.phone_number  = '012-3456-7890'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number is invalid. Please enter numbers only")
      end
      it '電話番号が１２桁以上あると購入ができない' do
        @orderform.phone_number  = '012345678900'
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Phone number is invalid. Please enter numbers only")
      end
      it 'トークンが空では購入ができない' do
        @orderform.token  = nil
        @orderform.valid?
        expect(@orderform.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end