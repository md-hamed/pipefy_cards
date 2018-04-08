require 'rails_helper'

RSpec.describe Phase, type: :model do
  it_behaves_like 'pipefy entity'

  it { is_expected.to belong_to :pipe }
  it { is_expected.to have_many :cards }
end
