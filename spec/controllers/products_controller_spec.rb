require 'rails_helper'

describe ProductsController do
  let(:user) {create(:user)}
  let(:condition){ FactoryBot.create(:condition) }
  let(:status){ FactoryBot.create(:status) }
  let(:category){ FactoryBot.create(:category) }
  let(:brand){ FactoryBot.create(:brand) }

  let(:product) {
    FactoryBot.create(
      :product, :skip_validate,
      seller_id: user.id,
      condition_id: condition.id,
      status_id: status.id,
      category_id: category.id,
      brand_id: brand.id
    )
  }


  describe 'GET #index' do
    before do
      login user
      category1 = create(:category, id: 1)
      category2 = create(:category, id: 2)
      category3 = create(:category, id: 3)
      category7 = create(:category, id: 7)
      get :index
    end

    it "has a 200 status code" do
      expect(response.status).to eq 200
    end

    it "renders the :show template" do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before do
      login user
      get :show, params: { id: product, user_id: user.id}
    end
    
    it "assigns the requested product" do
      expect(assigns(:product)).to eq product
    end

    it "has a 200 status code" do
      expect(response.status).to eq 200
    end

    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before do
      login user
      get :new, params: { user_id: user.id }
    end

    it "assigns the requested product" do
      expect(assigns(:product)).to be_a_new(Product)
    end

    it "has a 200 status code" do
      expect(response.status).to eq 200
    end

    it "renders the :new template" do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before do
      login user
      get :edit, params: { id: product, user_id: user.id}
    end

    it "assigns the requested product" do
      expect(assigns(:product)).to eq product
    end

    it "has a 200 status code" do
      expect(response.status).to eq 200
    end

    it "renders the :edit template" do
      expect(response).to render_template :edit
    end
  end
end