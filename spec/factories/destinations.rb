# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :destination_1, class: Destination do
    id 1
    email "dest@sonicgarden.jp"
    name "SonicGarden Inc."
  end

  factory :destination_2, class: Destination do
    id 2
    email "dest@fjord.jp"
    name "Fjord, LLC."
  end
end
