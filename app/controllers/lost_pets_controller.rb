class LostPetsController < ApplicationController
  def index
    @lost_pets = LostPet.all
    json_response(@lost_pets)
  end

  def show
    @lost_pet = LostPet.find(params[:id])
    json_response(@lost_pet)
  end
end
