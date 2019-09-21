require 'rails_helper'

describe ProductsController do
  # 画像投稿テスト時に必要
  # include CarrierWave::Test::Matchers
  # include ActionDispatch::TestProcess

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

  describe 'POST #create' do
    # 余裕があれば画像投稿も含めてテスト
    # let(:image) { fixture_file_upload('lake.jpg', 'image/jpeg') }
    # let(:image2) { fixture_file_upload('mountain.jpg', 'image/jpeg') }

    let(:params) do {
      params: {
        product: {
          id: "1",
          name: "test",
          price: "2000",
          detail: "testtest",
          status_id: "1",
          condition_id: "1",
          category_id: "1",
          brand_id: "1",
          size_id: "1",
          delivery_attributes: {
            shipping_fee: "1",
            deliver_method_id: "1",
            estimated_date_id: "1",
            deliver_region_id: "1"
          },
          product_images_attributes: {
            "0": {
              image: product.product_images
            },
            "1": {
              image: product.product_images
            }
          },
          seller_id: "1"
        }
      }
    }
    end

    it "saves the new product in the database" do
      login user
      expect do
        post :create, params
      end.to change(Product, :count).by(1)
    end

    it "redirects to products#new" do
      login user
      post :create, params
      expect(response).to redirect_to new_product_path
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