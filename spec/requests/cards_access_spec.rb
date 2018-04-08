require 'rails_helper'

RSpec.describe 'Cards access', type: :request do
  describe 'GET /cards' do
    it 'returns a success response' do
      get cards_path
      expect(response).to be_success
    end
  end
end
