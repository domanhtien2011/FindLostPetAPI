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
    @lost_pet = LostPet.new(lost_pet_params).tap do |lost_pet|
      lost_pet.save!
      lost_pet.create_lost_feature!(lost_feature_params)
      lost_pet.create_lost_location!(lost_location_params)
    end
    json_response(@lost_pet, :created)
  end

  private

    def lost_pet_params
      params.require(:lost_pet).permit(:name,
                                       :lost_time,
                                       :breed)
    end

    def lost_feature_params
      params.require(:lost_feature).permit(:weight,
                                       :fur_color,
                                       :others,
                                       :age)
    end

    def lost_location_params
      params.require(:lost_location).permit(:city,
                                            :district)
    end

end
