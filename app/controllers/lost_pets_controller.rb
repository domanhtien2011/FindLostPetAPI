class LostPetsController < ApplicationController
  def index
    @lost_pets = LostPet.all
    json_response(@lost_pets)
  end

  def show
    @lost_pet = LostPet.find(params[:id])
    json_response(@lost_pet)
  end

  def create
    @lost_pet = LostPet.new.tap do |lost_pet|
      lost_pet.name      = params[:name]
      lost_pet.lost_time = params[:lost_time]
      lost_pet.breed     = params[:breed]
      lost_pet.save!
      lost_pet.create_lost_feature!(weight:    params[:weight],
                                    fur_color: params[:fur_color],
                                    others:    params[:others],
                                    age:       params[:age])
      lost_pet.create_lost_location!(city:     params[:city],
                                     district: params[:district])
    end
    json_response(@lost_pet, :created)
  end

end
