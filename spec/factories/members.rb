# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ppworks, class: Member do
    id 1
    name "Koshikawa"
    image_url "https://si0.twimg.com/profile_images/2900491556/9d2bf873770958647f18b8e61af31f1a_normal.png"
  end
  factory :fukajun, class: Member do
    id 2
    name "Fukaya"
    image_url "https://si0.twimg.com/profile_images/2858628753/5642fbccdb7db9a55ebe66aa789c060f_normal.jpeg"
  end
  factory :tkawa, class: Member do
    id 3
    name "Kawamura"
    image_url "https://si0.twimg.com/profile_images/69862547/07280001_normal.jpg"
  end
end
