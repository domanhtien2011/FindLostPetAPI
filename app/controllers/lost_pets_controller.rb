class LostPetsController < ApplicationController
  def index
    @lost_pets = LostPet.all
    json_response(@lost_pets)
  end
end
