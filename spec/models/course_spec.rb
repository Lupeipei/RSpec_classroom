require 'rails_helper'

RSpec.describe Course do
  it { is_expected.to validate_presence_of(:title)}
  it { is_expected.to belong_to(:user)}
end
