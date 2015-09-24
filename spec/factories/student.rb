FactoryGirl.define do
  factory :student do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    enroll_no '12asasd2asdq'
    gender 'male'
    date_of_birth '06-06-1985'
    phone{Faker::PhoneNumber.phone_number}
    address1{Faker::Address.street_address}
    address2{Faker::Address.secondary_address}
    city{Faker::Address.city}
    country{Faker::Address.country}
    postcode{Faker::Address.postcode}
  end
end
