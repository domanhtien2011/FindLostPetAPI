require 'rails_helper'
require 'byebug'

RSpec.describe 'LostPets API', type: :request do
  let(:user) { create(:user) }
  let!(:lost_pets) do
    10.times do
      create(:lost_pet, :with_lost_feature_and_lost_location, user: user)
    end
    LostPet.all
  end

  let(:name) { 'Vietnam U23 Captain' }
  let(:lost_time) { Time.current.to_s }
  let(:breed) { 'dog' }
  let(:weight) { 5.5 }
  let(:fur_color) { 'black and white' }
  let(:others) { 'brown eyes' }
  let(:age) { 2.5 }
  let(:city) { 'Ho Chi Minh' }
  let(:district) { 'Tan Binh' }
  let(:lost_pet_id) { lost_pets.first.id }
  let(:user_id) { user.id }
  let(:headers) { valid_headers }

  describe 'GET /lost_pets' do
    before { get '/lost_pets', params: {}, headers: headers }
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
    before { get "/lost_pets/#{lost_pet_id}", params: {}.to_json, headers: headers }

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
          user_id:   user_id,
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
      before { post '/lost_pets', params: valid_attributes.to_json, headers: headers }

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
            user_id:   user_id,
            lost_time: lost_time,
            breed:     breed
          }
        }
      end

      let(:invalid_lost_feature) do
        {
          lost_pet:      {
            user_id:   user_id,
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
            user_id:   user_id,
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
               params:  invalid_lost_pet.to_json,
               headers: headers
        end
        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end
        it 'returns a validation failure message' do
          expect(response.body)
            .to match(/Có các lỗi sau: Tên thú cưng không thể để trắng/)
        end
      end

      context 'invalid lost feature' do
        before do
          post '/lost_pets',
               params:  invalid_lost_feature.to_json,
               headers: headers
        end
        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end
        it 'returns a validation failure message' do
          expect(response.body)
            .to match(/Có các lỗi sau: Cân nặng thú cưng không thể để trắng/)
        end
      end

      context 'invalid lost location' do
        before do
          post '/lost_pets',
               params:  invalid_lost_location.to_json,
               headers: headers
        end
        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end
        it 'returns a validation failure message' do
          expect(response.body)
            .to match(/Có các lỗi sau: Thành phố không thể để trắng/)
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