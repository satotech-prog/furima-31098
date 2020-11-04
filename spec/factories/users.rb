FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    lastname { '山田' }
    firstname { '太郎' }
    lastname_kana { 'ヤマダ' }
    firstname_kana { 'タロウ' }
    birthday { '2000-01-01' }
  end
end
