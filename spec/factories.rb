FactoryGirl.define do
  sequence(:email) {|n| "user#{n}@example.com"}
  factory :course do
    title "Course Name"
    description "Description."
    user
  end

  factory :user do
    email
    password "password"
    password_confirmation {password}
  end
end
