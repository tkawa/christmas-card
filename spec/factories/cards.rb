# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sg_card, class: Card do
    status 'in_progress'
    destination_id 1
  end
end
