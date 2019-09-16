require 'rails_helper'

describe CategoryController do
  describe 'GET #show' do
    before do 
      @category = create(:category)
      @product = build(:product)
    end
    it 'リクエストは200 okとなること' do
      expect(response.status).to eq 200
    end

    it "renders the :show template" do
      category = @category
      get :show, params: { id: category}
      expect(response).to render_template :show
    end

    it "assigns the requested category to @category" do
      category = @category
      get :show, params: { id: category}
      expect(assigns(:category)).to eq category
    end
  end
end
