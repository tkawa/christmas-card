require 'factory_girl'

Destination.delete_all

FactoryGirl.create(:sonic_garden)
FactoryGirl.create(:fjord)
