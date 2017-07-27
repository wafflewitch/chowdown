# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

user_1 = User.create!(first_name: "Norman",
                      last_name: "Chomsky",
 facebook_picture_url:"http://www.normanfaitdesvideos.com/wp-content/themes/norman/img/norman1.png",
                      email: "norman@bg.fr",
                      password: "password",
                      age: 25,
                      gender: "Female",
                      address: "5333 Cagrain Avenue, Montreal, Quebec",
                      bio: "I love food more than you.",
                      pref_meat: true,
                      pref_fish: true,
                      pref_wheat: true,
                      tag1: "indian",
                      tag2: "japanese",
                      tag3: "greek",
                      tag4: "cajun",
                      tag5: "french",
                      gender_pref: "all"
                      )

user_2 = User.create!(first_name: "Flavio",
                      last_name: "Fabio",
 facebook_picture_url:"https://pbs.twimg.com/profile_images/621025700909350912/TIUKxxW3.jpg",
                      email: "squeezie@bg.fr",
                      password: "password",
                      age: 27,
                      gender: "Male",
                      address: "5333 Cagrain Avenue, Montreal, Quebec",
                      bio: "Hey y'all, let's cook and chill",
                      pref_meat: false,
                      pref_fish: false,
                      pref_wheat: true,
                      tag1: "indian",
                      tag2: "japanese",
                      tag3: "greek",
                      tag4: "cajun",
                      tag5: "french",
                      gender_pref: "all"
                      )

user_3 = User.create!(first_name: "Steven",
                      last_name: "Smith",
 facebook_picture_url:"http://www.radiovl.fr/wp-content/uploads/2016/04/Cyprien.jpg",
                      email: "cyprien@bg.fr",
                      password: "password",
                      age: 28,
                      gender: "Male",
                      address: "5333 Cagrain Avenue, Montreal, Quebec",
                      bio: "I want to cook all the things.",
                      pref_meat: true,
                      pref_fish: false,
                      pref_wheat: false,
                      tag1: "indian",
                      tag2: "japanese",
                      tag3: "greek",
                      tag4: "cajun",
                      tag5: "french",
                      gender_pref: "all"
                      )

user_4 = User.create!(first_name: "Alex",
                      last_name: "McAdams",
 facebook_picture_url:"https://yt3.ggpht.com/-H-K3tE6RIRg/AAAAAAAAAAI/AAAAAAAAAAA/WOlo1lJj6CU/s100-c-k-no-mo-rj-c0xffffff/photo.jpg",
                      email: "enjoy@bg.fr",
                      password: "password",
                      age: 30,
                      gender: "Other",
                      address: "5333 Cagrain Avenue, Montreal, Quebec",
                      bio: "Cooking is my passion.",
                      pref_meat: false,
                      pref_fish: true,
                      pref_wheat: true,
                      tag1: "indian",
                      tag2: "japanese",
                      tag3: "greek",
                      tag4: "cajun",
                      tag5: "french",
                      gender_pref: "all"
                      )

user_5 = User.create!(first_name: "Seven",
                      last_name: "Thirty",
 facebook_picture_url:"https://yt3.ggpht.com/-pgP7Zk6FWYw/AAAAAAAAAAI/AAAAAAAAAAA/5vykqiLT1Uw/s100-c-k-no-rj-c0xffffff/photo.jpg",
                      email: "doc@bg.fr",
                      password: "password",
                      age: 31,
                      gender: "Other",
                      address: "5333 Cagrain Avenue, Montreal, Quebec",
                      bio: "I love cooking with new people!",
                      pref_meat: true,
                      pref_fish: true,
                      pref_wheat: false,
                      tag1: "indian",
                      tag2: "japanese",
                      tag3: "greek",
                      tag4: "cajun",
                      tag5: "french",
                      gender_pref: "all"
                      )

user_6 = User.create!(first_name: "Jamie",
                      last_name: "Jameson",
 facebook_picture_url:"http://www.normanfaitdesvideos.com/wp-content/themes/norman/img/norman1.png",
                      email: "jean@bg.fr",
                      password: "password",
                      age: 25,
                      gender: "Other",
                      address: "5333 Cagrain Avenue, Montreal, Quebec",
                      bio: "Let's get cooking!",
                      pref_meat: true,
                      pref_fish: true,
                      pref_wheat: true,
                      tag1: "indian",
                      tag2: "japanese",
                      tag3: "greek",
                      tag4: "cajun",
                      tag5: "french",
                      gender_pref: "all"
                      )
