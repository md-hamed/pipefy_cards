require 'rails_helper'

RSpec.describe Organization, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :pipefy_id }
  it { is_expected.to validate_uniqueness_of :pipefy_id }
end