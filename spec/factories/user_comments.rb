FactoryBot.define do
  factory :user_comment do
    sequence(:content) { |n| "Content #{n}" }
    post
    user
  end
end
