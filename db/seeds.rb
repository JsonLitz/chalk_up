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


       User.all.each do | user |

          Comment.create(
            title: FFaker::CheesyLingo.title,
            body: FFaker::DizzleIpsum.paragraph,
            user_id: user.id,
            climb_id: 1
          )
          Comment.create(
            title: FFaker::CheesyLingo.title,
            body: FFaker::DizzleIpsum.paragraph,
            user_id: user.id,
            climb_id: 2
          )
          Comment.create(
            title: FFaker::CheesyLingo.title,
            body: FFaker::DizzleIpsum.paragraph,
            user_id: user.id,
            climb_id: 3
          )
          Comment.create(
            title: FFaker::CheesyLingo.title,
            body: FFaker::DizzleIpsum.paragraph,
            user_id: user.id,
            climb_id: 4
          )
          Comment.create(
            title: FFaker::CheesyLingo.title,
            body: FFaker::DizzleIpsum.paragraph,
            user_id: user.id,
            climb_id: 5
            )
      end
