class OrganizationsController < ApplicationController
  def import
    Pipefy::SyncOrganizationGraph.new.perform
    redirect_to root_path, notice: 'Organization imported successfully!'
  end
end
