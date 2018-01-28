# Prevent duplicate data
def database_empty?
  User.all.empty? &&
    LostPet.all.empty? &&
    LostLocation.all.empty? &&
    LostFeature.all.empty?
end

if database_empty?
  10.times do |number|
    name = Faker::Name.name
    user = User.create!(
      name:     name,
      email:    "#{name.split(' ').join('_')}_#{number + 1}_@gmail.com",
      phone:    '123456789',
      password: 'password'
    )
    puts "Successfully created user #{number + 1}"
    30.times do |lost_pet_number|
      user.lost_pets.create!(
        name:      'My Dog',
        status:    'finding',
        lost_time: Time.current,
        breed:     'dog'
      )
      puts "Successfully created #{lost_pet_number + 1} lost pet(s)
            for the user #{user.id}"
    end
  end
  LostPet.all.each do |lost_pet|
    LostLocation.create!(
      city:     'Ho Chi Minh',
      district: 'Tan Binh',
      lost_pet: lost_pet
    )
    LostFeature.create!(
      age:       2.5,
      weight:    5.5,
      fur_color: 'black and white',
      others:    'brown eyes',
      lost_pet:  lost_pet
    )
    puts "Successfully created lost location and lost feature for the
          lost pet #{lost_pet.name}"
  end
  puts 'Successfully seeding data!!!'
end
