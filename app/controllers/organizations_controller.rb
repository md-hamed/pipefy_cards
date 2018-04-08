class OrganizationsController < ApplicationController
  def import
    if Pipefy::SyncOrganizationGraph.new(organization_id: 92858, pipe_id: 335557).perform
      flash[:notice] = 'Organization imported successfully!'
    else
      flash[:error] = 'Organization was not imported due to an error.'
    end
    
    redirect_to root_path
  end
end
