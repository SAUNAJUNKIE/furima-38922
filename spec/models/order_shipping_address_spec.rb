require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  describe '情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping_address).to be_valid
      end
     
      it '建物名は任意であること' do
        @order_shipping_address.building = ''
        expect(@order_shipping_address).to be_valid
      end
      
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @order_shipping_address.postal_code = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は３桁-４桁の半角入力でないと保存できないこと' do
        @order_shipping_address.postal_code = '1234567'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県を選択していないと保存できないこと' do
        @order_shipping_address.prefecture_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村が空だと保存できないこと' do
        @order_shipping_address.city = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が全角数字だと保存できないこと' do
        @order_shipping_address.street = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Street can't be blank")
      end

      it '電話番号が空では保存できないこと' do
        @order_shipping_address.phone = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone can't be blank")
      end
      
      it '電話番号が10桁以上11桁以下でないと保存できないこと' do
        @order_shipping_address.phone = '1234567891012'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
      end

      it "tokenが空では登録できないこと" do
        @order_shipping_address.token = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
