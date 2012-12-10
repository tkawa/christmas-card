# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment_1, class: Comment do
    id 1
    body "Merry Christmas and a Happy New Year!"
    card_id 1
    member_id 1
  end
end
