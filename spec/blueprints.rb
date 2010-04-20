require 'machinist/active_record'
require 'sham'
require 'faker'

require 'digest/sha2'

Sham.define do
  name { Faker::Lorem.words.join(' ') }
  title { Faker::Lorem.words }
  text { Faker::Lorem.paragraph }
  description { Faker::Lorem.paragraph }
  full_description { Faker::Lorem.paragraphs.join(' ') }
  created_at { Time.now }
  finish_at { Time.now }
  begin_at { Time.now }
  birth_date { Time.now } 
  welcome_text { Faker::Lorem.paragraph }
  email { Faker::Internet.email }
  phone_number { Faker::PhoneNumber.phone_number }
end

########### Blueprints
