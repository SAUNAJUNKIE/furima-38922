FactoryBot.define do
    factory :user do
      name                  {'test'}
      email                 {'test@gmail.com'}
      password              {'password0000'}
      password_confirmation {password}
      second_name           {'確認'}
      first_name            {'登録'}
      second_name_kana      {'カクニン'}
      first_name_kana       {'テスト'}
      birthday              {Faker::Date.birthday}
      
    end
  
end

