# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ppworks, class: Member do
    name "Koshikawa"
    #image_url "MyString"
  end
  factory :fukajun, class: Member do
    name "Fukaya"
  end
  factory :tkawa, class: Member do
    name "Kawamura"
  end
end
