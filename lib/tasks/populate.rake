namespace :populate do
  desc "Populate Users"
  task users: :environment do
    User.populate(100) do |user|
      user.name = Faker::Name.name
      user.age = Faker::Number.between(1, 112)
      user.weight = Faker::Number.between(105 ,300)
      user.race = Faker::Color.color_name
      user.hair_color = Faker::Color.color_name
      user.eye_color = Faker::Color.color_name 
      user.alive = [true, false]
      user.dob = Faker::Date.between(Date.today - 111.years, Date.today)
    end
    puts "Created 100 Users"
  end

end
