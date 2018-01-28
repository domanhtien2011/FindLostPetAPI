require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  # returns a user's object with populated attributes values from factory_bot.rb
  # just like when I do user = User.new(user_params)
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) do
    # returns a hash of user's attributes with the values
    # are populated from factory_bot.rb
    attributes_for(
      :user,
      name:                  user.name,
      email:                 user.email,
      phone:                 user.phone,
      password:              user.password,
      password_confirmation: user.password
    )
  end

  describe 'POST /signup' do
    context 'when valid request' do
      before do
        post '/signup',
             params:  valid_attributes.to_json,
             headers: headers
      end

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before do
        post '/signup',
             params:  { password: user.password }.to_json,
             headers: headers
      end

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(
                /Có các lỗi sau: Tên không thể để trắng, Số điện thoại không thể để trắng, Email không thể để trắng/
              )
      end
    end
  end
end
