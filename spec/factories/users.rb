FactoryBot.define do
    factory :user do
      name                  {'test'}
      email                 {'test@example'}
      password              {'000000'}
      password_confirmation {password}
      second_name           {'kakuninn'}
      first_name            {'test'}
      second_name_kana      {'カクニン'}
      first_name_kana       {'テスト'}
      birthday              {Faker::Date.birthday}
      
    end
  

end

