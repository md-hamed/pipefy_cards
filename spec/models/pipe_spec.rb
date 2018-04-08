require 'rails_helper'

RSpec.describe Pipe, type: :model do
  it_behaves_like 'pipefy entity'

  it { is_expected.to belong_to :organization }
  it { is_expected.to have_many :phases }
end
