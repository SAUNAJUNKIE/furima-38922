require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
    
  describe '商品出品' do
    context '保存できる時' do
      it "すべての入力項目が存在すれば保存できる" do
        expect(@item).to be_valid
      end
    end

    context '保存できない時' do
      it '画像が空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名が空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      
      it '商品の説明が空では保存できない' do
        @item.description  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      
      it 'カテゴリーが選択されていなければ保存できない' do
        @item.category_id  = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      
      it '商品の状態が選択されていなければ保存できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      
      it '配送料の負担が選択されていなければ保存できない' do
        @item.seller_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Seller can't be blank"
      end
      
      it '発送元の地域が選択されていなければ保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      
      it '発送までの日数が選択されていなければ保存できない' do
        @item.shipping_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Shipping day can't be blank"
        end
      
        it '金額が空では保存できないこと' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Price is not a number"
        end

        it 'ユーザーが紐付いていなければ保存できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end
        

        it '金額は半角数字でないと保存できないこと' do
          @item.price = '１２３４'
          @item.valid?
          expect(@item.errors.full_messages).to include "Price is not a number"
        end
     
        it '金額は300から9999999までの間しか保存できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include"Price must be greater than or equal to 300"
          
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include"Price must be less than or equal to 9999999"
        end
      
      
        end
    
          
    end
    end