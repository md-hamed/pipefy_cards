require 'rails_helper'

RSpec.describe 'Organization import', type: :request do
  before(:each) do
    valid_response_body = JSON.parse(file_fixture('valid_organization.json').read).to_s
    stub_show_organization_request(body: valid_response_body)
  end

  describe 'GET /organizations/import' do
    it 'redirect to root path' do
      get import_organizations_path
      expect(response).to redirect_to(root_path)
    end
  end
end
