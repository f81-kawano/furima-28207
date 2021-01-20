FactoryBot.define do
  factory :buy_address do
    postal_code { '854-0043' }
    prefecture_id { 43 }
    city { '諫早市' }
    house_num { '立石町１０２７−４' }
    building {}
    phone_num { '09012345678' }
  end
end