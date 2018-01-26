require 'rails_helper'

RSpec.describe 'LostPets API', type: :request do
  let!(:lost_pets) do
    10.times do
      create(:lost_pet, :with_lost_feature_and_lost_location)
    end
    LostPet.all
  end


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

  # # Test suite for GET /lost_pets/:id
  # describe 'GET /lost_pets/:id' do
  #   before { get "/lost_pets/#{todo_id}" }

  #   context 'when the record exists' do
  #     it 'returns the todo' do
  #       expect(json).not_to be_empty
  #       expect(json['id']).to eq(todo_id)
  #     end

  #     it 'returns status code 200' do
  #       expect(response).to have_http_status(200)
  #     end
  #   end

  #   context 'when the record does not exist' do
  #     let(:todo_id) { 100 }

  #     it 'returns status code 404' do
  #       expect(response).to have_http_status(404)
  #     end

  #     it 'returns a not found message' do
  #       expect(response.body).to match(/Couldn't find Todo/)
  #     end
  #   end
  # end

  # # Test suite for POST /lost_pets
  # describe 'POST /lost_pets' do
  #   # valid payload
  #   let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }

  #   context 'when the request is valid' do
  #     before { post '/lost_pets', params: valid_attributes }

  #     it 'creates a todo' do
  #       expect(json['title']).to eq('Learn Elm')
  #     end

  #     it 'returns status code 201' do
  #       expect(response).to have_http_status(201)
  #     end
  #   end

  #   context 'when the request is invalid' do
  #     before { post '/lost_pets', params: { title: 'Foobar' } }

  #     it 'returns status code 422' do
  #       expect(response).to have_http_status(422)
  #     end

  #     it 'returns a validation failure message' do
  #       expect(response.body)
  #         .to match(/Validation failed: Created by can't be blank/)
  #     end
  #   end
  # end

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