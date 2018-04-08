RSpec.shared_examples 'pipefy entity' do |parameter|
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :pipefy_id }
  it { is_expected.to validate_uniqueness_of :pipefy_id }
end
