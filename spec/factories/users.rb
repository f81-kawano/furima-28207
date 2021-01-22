FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.unique.name}
    email                 {Faker::Internet.unique.email}
    password              { 'test11' }
    password_confirmation { password }
    last_name { 'お' }
    first_name { 'お' }
    last_name_kana { 'オ' }
    first_name_kana { 'オ' }
    birthday { '1930-01-01' }
  end
end
