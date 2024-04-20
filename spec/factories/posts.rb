FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "Title #{n}" }
    sequence(:subtitle) { |n| "Subtitle #{n}" }
    sequence(:content) { |n| "Content #{n}" }
    banner { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'assets', 'banner.jpg'), 'image/jpg') }
    user
  end
end
