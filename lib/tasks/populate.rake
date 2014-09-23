namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
  
  # Create 5 users
      5.times do |n|
      puts "[DEBUG] creating user #{n+1} of 5"
      email = email = "user-#{n+1}@example.com"
      password = "password"
      User.create!( email: email,
                    password: password,
                    password_confirmation: password)
    end

  # Create 10 vehicles by random users
      10.times do |n|
        puts "[DEBUG] creating vehicle #{n+1} of 10"
        name = Faker::Company.name
        user_id = User.order("RANDOM()").first.id
        Vehicle.create!( name: name,
                   user_id: user_id )        
      end

  # Create 100 journalists by random users to random vehicles
      100.times do |n|
        puts "[DEBUG] creating journalists #{n+1} of 100"
        name = Faker::Name.name
        user_id = User.order("RANDOM()").first.id
        vehicle_id = Vehicle.order("RANDOM()").first.id
        Journalist.create!( name: name,
                   user_id: user_id,
                   vehicle_id: vehicle_id )        
      end
  end
end