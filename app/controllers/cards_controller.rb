class CardsController < ApplicationController
  def index
    @organizations = Organization.includes(pipes: [phases: :cards])
  end
end
