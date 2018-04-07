require 'rails_helper'

RSpec.describe Card, type: :model do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :pipefy_id }
  it { is_expected.to validate_uniqueness_of :pipefy_id }

  it { is_expected.to belong_to :phase }
end
