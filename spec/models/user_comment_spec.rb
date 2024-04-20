require 'rails_helper'

RSpec.describe UserComment, type: :model do
  it { is_expected.to validate_presence_of(:content) }

  it { is_expected.to belong_to(:user).optional }
  it { is_expected.to belong_to(:post) }
end
