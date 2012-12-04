# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sg_card, class: Card do
    id 1
    status 'ready'
    destination_id 1
    access_token '8W8MfGTLspVAAgf8jihB'
    #association :destination, factory: :sonic_garden
    #after(:create) do |card|
    #  card.destination = Destination.find_by_email("dest@sonicgarden.jp") || FactoryGirl.create(:sonic_garden)
    #end
  end
end
