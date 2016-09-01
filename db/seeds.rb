# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

15.times do
  User.create(
    email: FFaker::Internet.email,
    password: 'climb',
    username: FFaker::Internet.user_name,
    image: FFaker::Avatar.image
  )
end
  a= 1
  b= 1
  for i in 0..5
        for i in 0..5

        Comment.create(
          title: FFaker::CheesyLingo.title,
          body: FFaker::DizzleIpsum.paragraph,
          user_id: a,
          climb_id: b
        )
         b = b+1
        end
        a=a+1
  end
