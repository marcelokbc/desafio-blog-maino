require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }

  it { is_expected.to have_many(:posts).dependent(:destroy) }
  it { is_expected.to have_many(:user_comments).dependent(:destroy) }
  it { is_expected.to have_one_attached(:photo) }
  
end
