FactoryBot.define do
  factory :buy do
    association :user, :item
  end
end
