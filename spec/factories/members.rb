# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ppworks, class: Member do
    id 1
    name "Koshikawa"
    #image_url "MyString"
  end
  factory :fukajun, class: Member do
    id 2
    name "Fukaya"
  end
  factory :tkawa, class: Member do
    id 3
    name "Kawamura"
  end
end
