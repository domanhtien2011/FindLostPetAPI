FactoryBot .define do
  factory :lost_pet do
    name {Faker::Name.name }
    type 0
    status 0
    lost_time { Time.current }
  end

  factory :lost_feature do
    age 2.5
    fur_color 'Vàng Đen'
    weight 8.5
    lost_pet
  end

  factory :lost_location do
    city 'Hồ Chí Minh'
    district 'Tân Bình'
    lost_pet
  end

end