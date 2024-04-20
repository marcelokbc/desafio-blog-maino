FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Name #{n}" }
    sequence(:email) { |n| "Email #{n}" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
