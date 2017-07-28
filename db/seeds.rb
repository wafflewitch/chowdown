# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'
require 'faker'
USER_IMG_URL = "https://res.cloudinary.com/wafflewitch/image/upload/v150003873"
RECIPE_1_IMG = "https://res.cloudinary.com/wafflewitch/image/upload/v1501250492/recipe1.jpg"
RECIPE_2_IMG = "https://res.cloudinary.com/wafflewitch/image/upload/v1501250492/recipe2.jpg"
RECIPE_3_IMG = "https://res.cloudinary.com/wafflewitch/image/upload/v1501250492/recipe3.jpg"
MEN_PICS = ["5/user0.jpg", "5/user1.jpg", "5/user2.jpg", "5/user3.jpg", "5/user4.jpg", "5/user5.jpg", "5/user6.jpg", "5/user7.jpg"]
WOMEN_PICS = ["5/user8.jpg", "5/user9.jpg", "5/user10.jpg", "5/user11.jpg", "6/user12.jpg", "6/user13.jpg", "6/user14.jpg",
  "6/user15.jpg", "6/user16.jpg", "7/user17.jpg"]
AGES = [18, 20, 22, 25, 26, 27, 28, 29, 30, 31, 33, 34, 36, 40, 42, 47, 50, 55]
BIO_1 = ["I love", "My passions are", "I live for", "Let's chat about", "My favorite things are", "Life is meaningless without"]
BIO_2 = ["cooking", "sports", "music", "cleaning", "running", "gaming", "Paris", "coding"]
BIO_3 = ["dogs", "muffins", "nachos", "the 90's", "hiphop", "movies", "anime", "Trump", "being lazy"]
FOOD_TAGS = ["african", "cajun", "caribbean", "chinese", "ethiopian",
    "filipino", "french", "german", "greek", "indian",
    "italian", "japanese", "jewish", "korean", "mediterranean",
    "mexican", "moroccan", "russian", "spanish", "thai",
    "turkish", "vietnamese", "southern", "pakistani"]
DEV_EMAILS = ["louis.salle.phelippes@duke.edu", "mesophie@gmx.ch", "joeyvk@sbcglobal.net"]
CHOW_STATUS = ["active", "finalized", "finished"]
men_count = 0
women_count = 8

8.times do
  user = User.create!(first_name: Faker::Name.first_name,
                  last_name: Faker::LordOfTheRings.character,
                  facebook_picture_url: "#{USER_IMG_URL}#{MEN_PICS[men_count]}",
                  email: Faker::Internet.email,
                  password: "coolcat",
                  age: AGES.sample,
                  gender: "Male",
                  address: "5333 Casgrain Ave, Montreal, Quebec",
                  bio: "#{BIO_1.sample} #{BIO_2.sample} and #{BIO_3.sample}",
                  pref_meat: [true, false].sample,
                  pref_fish: [true, false].sample,
                  pref_wheat: [true, false].sample,
                  tag1: FOOD_TAGS[0..4].sample,
                  tag2: FOOD_TAGS[5..9].sample,
                  tag3: FOOD_TAGS[10..14].sample,
                  tag4: FOOD_TAGS[15..19].sample,
                  gender_pref: "All",
                  max_distance: 30,
                  min_age: 18,
                  max_age: 55,
                  dating: [true, false].sample
                  )
      men_count += 1
      user_2 = User.find(1)
      chow = Chow.new(user_1_id: user.id, user_2_id: user_2.id, status: CHOW_STATUS.sample)
      if chow.status == "finalized" || chow.status == "finished"
        chow.date = Date.new(2017,7,[1, 2, 3, 4, 5, 10, 11, 12, 23, 24, 25, 29, 30, 31].sample)
      end
      if chow.save
        recipe1 = Recipe.new(user_id: user.id, title: "Pizza Margherita", photo: RECIPE_1_IMG)
        recipe2 = Recipe.new(user_id: user.id, title: "Vegetarian Khow Suey", photo: RECIPE_2_IMG)
        recipe3 = Recipe.new(user_id: user.id, title: "Beef and Broccoli", photo: RECIPE_3_IMG)
      end
end





8.times do
  user = User.create!(first_name: Faker::Name.first_name,
                  last_name: Faker::LordOfTheRings.character,
                  facebook_picture_url: "#{USER_IMG_URL}#{WOMEN_PICS[women_count]}",
                  email: Faker::Internet.email,
                  password: "coolcat",
                  age: AGES.sample,
                  gender: "Female",
                  address: "5333 Casgrain Ave, Montreal, Quebec",
                  bio: "#{BIO_1.sample} #{BIO_2.sample} and #{BIO_3.sample}",
                  pref_meat: [true, false].sample,
                  pref_fish: [true, false].sample,
                  pref_wheat: [true, false].sample,
                  tag1: FOOD_TAGS[0..4].sample,
                  tag2: FOOD_TAGS[5..9].sample,
                  tag3: FOOD_TAGS[10..14].sample,
                  tag4: FOOD_TAGS[15..19].sample,
                  gender_pref: "All",
                  max_distance: 30,
                  min_age: 18,
                  max_age: 55,
                  dating: [true, false].sample
                  )
      women_count += 1
      user_2 = User.find(1)
      chow = Chow.new(user_1_id: user.id, user_2_id: user_2.id, status: CHOW_STATUS.sample)
      if chow.status == "finalized" || chow.status == "finished"
        chow.date = Date.new(2017,7,[1, 2, 3, 4, 5, 10, 11, 12, 23, 24, 25, 29, 30, 31].sample)
      end
      if chow.save
        recipe1 = Recipe.new(user_id: user.id, title: "Pizza Margherita", photo: RECIPE_1_IMG)
        recipe2 = Recipe.new(user_id: user.id, title: "Vegetarian Khow Suey", photo: RECIPE_2_IMG)
        recipe3 = Recipe.new(user_id: user.id, title: "Beef and Broccoli", photo: RECIPE_3_IMG)
      end
end



