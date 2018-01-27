require 'rails_helper'

RSpec.describe 'LostPets API', type: :request do
  let!(:lost_pets) do
    10.times do
      create(:lost_pet, :with_lost_feature_and_lost_location)
    end
    LostPet.all
  end

  let(:name) { 'captain_u23_vn' }
  let(:lost_time) { Time.current }
  let(:breed) { 'dog' }
  let(:weight) { 5.5 }
  let(:fur_color) { 'Vàng xanh' }
  let(:others) { 'Mắt nâu đỏ, huyền đề 4 chân, đốm lưỡi' }
  let(:age) { 2.5 }
  let(:city) { 'Hồ Chí Minh' }
  let(:district) { 'Tân Bình' }
  let(:lost_pet_id) { lost_pets.first.id }

  describe 'GET /lost_pets' do

    before { get '/lost_pets' }

    it 'returns lost_pets' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /lost_pets/:id
  describe 'GET /lost_pets/:id' do
    before { get "/lost_pets/#{lost_pet_id}" }

    context 'when the record exists' do
      it 'returns the lost pet' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(lost_pet_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:lost_pet_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find LostPet/)
      end
    end
  end

  # Test suite for POST /lost_pets
  describe 'POST /lost_pets' do
    # valid payload
    let(:valid_attributes) do
      {
        lost_pet:      {
          name:      name,
          lost_time: lost_time,
          breed:     breed
        },
        lost_feature:  {
          weight:    weight,
          fur_color: fur_color,
          others:    others,
          age:       age
        },
        lost_location: {
          city:     city,
          district: district
        }
      }
    end

    context 'when the request is valid' do
      before { post '/lost_pets', params: valid_attributes }

      it 'creates a lost pet' do
        expect(json['name']).to eq(name)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_lost_pet) do
        {
          lost_pet: {
            lost_time: lost_time,
            breed:     breed
          }
        }
      end

      let(:invalid_lost_feature) do
        {
          lost_pet:      {
            name:      name,
            lost_time: lost_time,
            breed:     breed
          },
          lost_feature:  {
            fur_color: fur_color,
            others:    others,
            age:       age
          },
          lost_location: {
            city:     city,
            district: district
          }
        }
      end

      let(:invalid_lost_location) do
        {
          lost_pet:      {
            name:      name,
            lost_time: lost_time,
            breed:     breed
          },
          lost_feature:  {
            weight:    weight,
            fur_color: fur_color,
            others:    others,
            age:       age
          },
          lost_location: {
            district: district
          }
        }
      end

      context 'invalid lost pet' do
        before do
          post '/lost_pets',
               params: invalid_lost_pet
        end
        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end
        it 'returns a validation failure message' do
          expect(response.body)
            .to match(/Validation failed: Name can't be blank/)
        end
      end

      context 'invalid lost feature' do
        before do
          post '/lost_pets',
               params: invalid_lost_feature
        end
        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end
        it 'returns a validation failure message' do
          expect(response.body)
            .to match(/Validation failed: Weight can't be blank/)
        end
      end

      context 'invalid lost location' do
        before do
          post '/lost_pets',
               params: invalid_lost_location
        end
        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end
        it 'returns a validation failure message' do
          expect(response.body)
            .to match(/Validation failed: City can't be blank/)
        end
      end
    end
  end

# # Test suite for PUT /lost_pets/:id
# describe 'PUT /lost_pets/:id' do
#   let(:valid_attributes) { { title: 'Shopping' } }

#   context 'when the record exists' do
#     before { put "/lost_pets/#{todo_id}", params: valid_attributes }

#     it 'updates the record' do
#       expect(response.body).to be_empty
#     end

#     it 'returns status code 204' do
#       expect(response).to have_http_status(204)
#     end
#   end
# end

# # Test suite for DELETE /lost_pets/:id
# describe 'DELETE /lost_pets/:id' do
#   before { delete "/lost_pets/#{todo_id}" }

#   it 'returns status code 204' do
#     expect(response).to have_http_status(204)
#   end
# end
end