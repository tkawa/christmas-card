# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sonic_garden, class: Destination do
    id 1
    email "dest@sonicgarden.jp"
    name "SonicGarden Inc."
  end

  factory :fjord, class: Destination do
    id 2
    email "dest@fjord.jp"
    name "Fjord, LLC."
  end
end
