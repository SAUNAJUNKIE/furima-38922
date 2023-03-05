require 'rails_helper'


 
  
  RSpec.describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
  
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
  end
  
  
