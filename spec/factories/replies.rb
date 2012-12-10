# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reply_1, class: Reply do
    name "Kuranuki"
    body "Thank you."
    card_id 1
  end
end
