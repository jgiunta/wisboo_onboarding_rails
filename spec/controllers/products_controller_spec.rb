require 'spec_helper'

RSpec.describe ProductsController, type: :controller do

  context 'when user is logged in with admin role' do

    let(:user) { create(:user, email: 'admin@email.com', password: 'password', role: 'admin') }
    let!(:products) { create_list(:product, 5) }
    let(:json) { {
      name: 'Producto1',
      description: 'Description1',
      quantity: '1',
      image: 'https://f.hubspotusercontent00.net/hubfs/4645251/2007%20-%20Web/Brand/Wisboo_Logo.svg'
    }}
  
    before do
      login_user(user.email, 'password')
    end

    context 'get all products without filter' do
      it { expect(response).to have_http_status(:ok) }

      it 'get all products' do
        get :index
        expect(assigns(:products)).to eq products
      end
    end    

    context 'get products with filter' do
      it { expect(response).to have_http_status(:ok) }

      it 'get products' do
        get :index, query: "#{products.first.name}"
        expect(JSON.parse(response.body)['products'].count).to eq 1
      end
    end

    it { expect(response).to have_http_status :ok }

    it 'create a product' do
      expect { post :create, product: json }.to change(Product, :count).by(1)
    end
  end

end