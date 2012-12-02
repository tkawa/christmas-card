require 'factory_girl'

Destination.delete_all
Card.delete_all

# Destination
FactoryGirl.create(:sonic_garden)
FactoryGirl.create(:fjord)

# Card
FactoryGirl.create(:sg_card)

# Member
FactoryGirl.create(:ppworks)
FactoryGirl.create(:fukajun)
FactoryGirl.create(:tkawa)

# Comment
FactoryGirl.create(:merry_happy)
