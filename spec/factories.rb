FactoryGirl.define do

  factory :user do
    sequence(:email)      { |n| "email#{n}@example.com" }
    password              "password"
    password_confirmation "password"
    name                  "Amanda"
    street                "377 Summer Street"
    city                  "Boston"
    state                 "MA"
    zipcode               "02210"
    role                  "shoveler"
  end

end
