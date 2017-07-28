# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'
require 'faker'

USER_IMG_1 = "https://res.cloudinary.com/wafflewitch/image/upload/v1500038735/user" # 0~


USER_IMG_ = "https://res.cloudinary.com/wafflewitch/image/upload/v1500038737/user"

RECIPE_1_IMG = "https://res.cloudinary.com/wafflewitch/image/upload/v1501250492/recipe1.jpg"
RECIPE_2_IMG = "https://res.cloudinary.com/wafflewitch/image/upload/v1501250492/recipe2.jpg"
RECIPE_3_IMG = "https://res.cloudinary.com/wafflewitch/image/upload/v1501250492/recipe3.jpg"

MEN_PICS = ["0.jpg", "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg"]

WOMEN_PICS = ["8.jpg", "9.jpg", "10.jpg", "11.jpg", "12.jpg", "13.jpg", "14.jpg",
  "15.jpg", "16.jpg", "17.jpg"]

BIO_1 = ["I love", "My passions are", "I live for", "Let's chat about"]

BIO_2 = ["cooking", "sports", "music", "cleaning", "running", "gaming", "Paris", "coding"]

BIO_3 = ["dogs", "muffins", "nachos", "the 90's", "hiphop", "movies", "anime", "Trump", "being lazy"]

TAGS = ["african", "cajun", "caribbean", "chinese", "ethiopian",
    "filipino", "french", "german", "greek", "indian",
    "italian", "japanese", "jewish", "korean", "mediterranean",
    "mexican", "moroccan", "russian", "spanish", "thai",
    "turkish", "vietnamese", "southern", "pakistani"]

DEV_EMAILS = ["jdpruitt@bama.ua.edu", "louis.salle.phelippes@duke.edu", "mesophie@gmx.ch", "joeyvk@sbcglobal.net"]

CHOW_STATUS = ["active", "finalized", "finished"]

men_count = 0
women_count = 8

MEN_PICS.count.times do
  user = User.new(first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  facebook_picture_url: "#{URL}#{MEN_PICS[men_count]}",
                  email: Faker::Internet.email,
                  password: "coolcat",
                  age: (18..55).sample, # FIX THIS
                  gender: "Male",
                  address: "5333 Casgrain Ave, Montreal, Quebec",
                  bio: "#{BIO_1.sample} #{BIO_2.sample} and #{BIO_3.sample}",
                  pref_meat: [true, false].sample,
                  pref_fish: [true, false].sample,
                  pref_wheat: [true, false].sample,
                  tag1: TAGS[0..4].sample,
                  tag2: TAGS[5..9].sample,
                  tag3: TAGS[10..14].sample,
                  tag4: TAGS[15..19].sample,
                  tag5: TAGS[20..23].sample,
                  gender_pref: "All",
                  )
    if user.save
      men_count += 1
      user_2 = User.where(email: DEV_EMAILS.sample)
      chow = Chow.new(user_1_id: user.id, user_2_id: user_2.id, status: CHOW_STATUS.sample)
      if chow.status == "finalized" || chow.status == "finished"
        chow.date = Date.new(2017,7,[1, 2, 3, 4, 5, 10, 11, 12, 23, 24, 25, 29, 30, 31].sample)
      end
      if chow.save
        recipe = Recipe.new(user_id: user.id, title: "", photo: "")
end

