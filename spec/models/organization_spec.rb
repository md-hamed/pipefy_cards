require 'rails_helper'

RSpec.describe Organization, type: :model do
  it_behaves_like 'pipefy entity'

  it { is_expected.to have_many :pipes }
end
