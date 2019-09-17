require 'rails_helper'

describe BrandsController do
  describe 'GET #show' do
    before do 
      @brands = create(:brand)
      @products = build(:product)

    end
    it 'リクエストは200 okとなること' do
      expect(response.status).to eq 200
    end

    it "renders the :show template" do
      get :show, params: { id: @brands}
      expect(response).to render_template :show
    end

    it "assigns the requested brands to @brands" do
      get :show, params: { id: @brands}
      expect(assigns(:brands)).to eq @brands
    end

    it "@productsは@brandsのブランド名を持っていること" do
      expect(@products.brand.brand).to eq "テストブランド"
    end

  end


end
