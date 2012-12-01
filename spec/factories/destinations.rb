# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sonic_garden, class: Destination do
    email "dest@sonicgarden.jp"
    name "SonicGarden Inc."
  end

  factory :fjord, class: Destination do
    email "dest@fjord.jp"
    name "Fjord, LLC."
  end
end
