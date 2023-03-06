require 'rails_helper'


 
  
  RSpec.describe 'ユーザー新規登録' do

    before do
      @user = FactoryBot.build(:user)
    end
      
   describe 'ユーザー新規登録' do
      context '新規登録できる時' do
        it "すべての入力項目が存在すれば登録できる" do
          expect(@user).to be_valid
          end
        end
      
        context '新規登録できない時' do
    it 'nameが空では登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Name can't be blank"
    end
  
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
  
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
  
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  
    it 'second_nameが空では登録できない' do
      @user.second_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name can't be blank"
    end
  
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
  
    it 'second_name_kanaが空では登録できない' do
      @user.second_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name kana can't be blank"
    end
  
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
  
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  
    it '重複したemailが存在する場合は登録できない' do
      user = FactoryBot.create(:user, email: 'test@example.com')
  another_user = FactoryBot.build(:user, email: 'test@example.com')
  another_user.valid?
  expect(another_user.errors[:email]).to include('has already been taken')
    end
    
    
    it 'emailが@を含まない場合は登録できないこと' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include'Email is invalid'
    end
    
    it 'passwordが6文字未満では登録できないこと' do
      @user.password = '00000'
     @user.password_confirmation = '00000'
     @user.valid?
    expect(@user.errors.full_messages).to include'Password is too short (minimum is 6 characters)'
    end

    
    
    it '英字のみのパスワードでは登録できないこと' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 8 characters)'
    end
    
    it '数字のみのパスワードでは登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 8 characters)'
    end
    
    it '全角文字を含むパスワードでは登録できないこと' do
      @user.password = 'あいうえおabc123'
      @user.password_confirmation = 'あいうえおabc123'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password は英字と数字をそれぞれ1文字以上含めて設定してください'
    end
    
    it 'パスワードとパスワード（確認用）が不一致だと登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
    
    it '姓（全角）に半角文字が含まれていると登録できないこと' do
      @user.second_name = 'Yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Second name is invalid'
    end
    
    it '名（全角）に半角文字が含まれていると登録できないこと' do
      @user.first_name = 'Taro'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name is invalid'
    end
    
    it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できないこと' do
      @user.second_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Second name kana はカタカナで入力してください'
      
      end
    end
    
      end
end