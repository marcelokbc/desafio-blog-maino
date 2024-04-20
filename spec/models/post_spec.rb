require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:subtitle) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_presence_of(:banner) }
  
  it { is_expected.to have_many(:user_comments).dependent(:destroy) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_one_attached(:banner) }
  it { is_expected.to have_rich_text(:content) }
end
