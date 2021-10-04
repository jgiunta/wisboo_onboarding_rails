require 'spec_helper'

describe ApplicationController, type: :controller do
  let(:user) { create(:user, email: 'user@email.com', password: 'password') }

  describe 'GET #me' do
    context 'credentials are correct' do
      before :each do
        login_user(user.email, 'password')
        get :me
      end

      it { expect(response).to have_http_status(:ok) }

      it 'returns the correct user' do
        expect(body['id']).to eq user.id
      end
    end
    
    context 'credentials are incorrect' do
      before :each do
        login_user(user.email, 'invalid password')
        get :me
      end

      it { expect(response).to have_http_status(:unauthorized) }
    end
  end
end