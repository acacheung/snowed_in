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

    factory :requester do
      role "requester"
    end

    factory :shoveler do
      role "shoveler"
    end
  end

  factory :request do
    requester
    job_size "small"
    offer 20
    state "open"

    factory :open_request do
      state "open"
    end

    factory :completed_request do
      state "complete"
    end

    factory :matched_request do
      state "matched"
    end
  end

  # factory :old_requester do
  #   sequence(:email)      { |n| "email#{n}@example.com" }
  #   password              "password"
  #   password_confirmation "password"
  #   name                  "Amanda"
  #   street                "377 Summer Street"
  #   city                  "Boston"
  #   state                 "MA"
  #   zipcode               "02210"
  #   role                  "requester"
  #   old_or_disabled       "true"
  # end

  # factory :requester do
  #   sequence(:email)      { |n| "email#{n}@example.com" }
  #   password              "password"
  #   password_confirmation "password"
  #   name                  "Amanda"
  #   street                "377 Summer Street"
  #   city                  "Boston"
  #   state                 "MA"
  #   zipcode               "02210"
  #   role                  "requester"
  # end

  # factory :request do
  #   association :requester, factory: :requester
  #   job_size "small"
  #   offer 20
  # end

end
