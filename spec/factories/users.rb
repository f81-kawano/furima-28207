FactoryBot.define do
  factory :user do
    nickname              {"test1"}
    email                 {"test@com"}
    password              {"test11"}
    password_confirmation {password}
    last_name {"お"}
    first_name {"お"}
    last_name_kana {"オ"}
    first_name_kana {"オ"}
    birthday {"1930-01-01"}
  end
end