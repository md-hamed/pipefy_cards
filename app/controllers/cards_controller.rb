class CardsController < ApplicationController
  def index
    # assumption: only one organization will exist due to
    # the requirements of the test
    @organization = Organization.includes(pipes: [phases: :cards]).first
  end
end
