require 'rails_helper'

RSpec.describe Card, type: :model do
  it_behaves_like 'pipefy entity'

  it { is_expected.to belong_to :phase }
end
