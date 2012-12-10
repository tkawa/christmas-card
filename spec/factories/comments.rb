# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message_1, class: Message do
    id 1
    body "Merry Christmas and a Happy New Year!"
    card_id 1
    member_id 1
  end
end
