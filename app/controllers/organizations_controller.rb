class OrganizationsController < ApplicationController
  def import
    Pipefy::SyncOrganizationGraph.new(organization_id: 114095, pipe_id: 423922).perform
    redirect_to root_path, notice: 'Organization imported successfully!'
  end
end
