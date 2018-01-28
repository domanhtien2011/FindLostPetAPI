FactoryBot.define do

  factory :user do
    name { Faker::Name.name }
    sequence(:email) { |n| "#{name.split(' ').join('_')}_#{n}_@gmail.com" }
    phone { '123456789' }
    password 'password'
  end

  factory :lost_pet do
    name { Faker::Name.name }
    breed 'dog'
    status 'finding'
    lost_time { Time.current }
    user
    trait :with_lost_feature_and_lost_location do
      after(:create) do |lost_pet|
        create(:lost_feature, lost_pet: lost_pet)
        create(:lost_location, lost_pet: lost_pet)
      end
    end
  end

  factory :lost_feature do
    age 2.5
    fur_color 'Vàng Đen'
    weight 8.5
  end

  factory :lost_location do
    city 'Hồ Chí Minh'
    district 'Tân Bình'
  end

end