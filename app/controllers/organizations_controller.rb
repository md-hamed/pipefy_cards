class OrganizationsController < ApplicationController
  def import
    if Pipefy::SyncOrganizationGraph.new(organization_id: 92858, pipe_id: 335557).perform
      redirect_to root_path, flash: { notice: 'Organization imported successfully!' }
    else
      redirect_to root_path, flash: { error: 'Organization was not imported due to an error.' }
    end
  end
end
