require 'rails_helper'

describe DeliveraddressesController, type: :controller do

  describe 'GET #new' do
    let(:user){create(:user)}
    context 'log in' do
      before do
        login user
        get :new, params: { user_id: user.id }
      end

      it 'assigns deliveraddress' do
        expect(assigns(:deliveraddress)).to be_a_new(Deliveraddress)
      end

      it 'redners new' do
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    let(:user){create(:user)}
    context 'log in' do
      before do
        login user
        @deliveraddress = build(:deliveraddress)
        get :edit, params: { id: @deliveraddress, user_id: user.id}
      end

      it "has a 200 status code" do
        expect(response.status).to eq 200
      end

      it "renders the :edit template" do
        deliveraddress = @deliveraddress
        expect(response).to render_template :edit
      end
    end
  end

  describe 'POST #create' do
    let(:user){create(:user)}
    let(:params) do {
      params: {
        deliveraddress: {
          family_name: "太郎",
          first_name: "山田",
          family_name_pseudonym: "ヤマダ",
          first_name_pseudonym: "タロウ",
          post_number: "123-4559",
          prefecture: "北海道",
          city: "横浜市",
          street: "青梅",
          building: "",
          phone_number: "",
          created_at: "2019-09-09 00-00-00",
          updated_at: "2019-09-09, 00-00-00",
          id: "1"
        },
        user_id: "1",
      }
    }
    end

    before do
      login user
    end

    it "saves the new product in the database" do
      expect do
        post :create, params
      end.to change(Deliveraddress, :count).by(1)
    end

    it "redirects to products#index" do
      post :create, params
      expect(response).to redirect_to root_path
    end
  end


  describe 'PATCH #update' do
    let(:user){create(:user)}
    let(:params) do
      { params: {
        deliveraddress: {
          family_name: "山田",
          first_name: "太郎",
          family_name_pseudonym: "ヤマダ",
          first_name_pseudonym: "タロウ",
          post_number: "123-4559",
          prefecture: "北海道",
          city: "横浜市",
          street: "青山1-1-1",
          building: "",
          phone_number: "",
          created_at: "2019-09-09 00-00-00",
          updated_at: "2019-09-09, 00-00-00",
          },
        id: "1",
        user_id: "1"
        }
      }
    end
    before do
      @deliveraddress = create(:deliveraddress,id: "1", user_id: user.id)
      login user
    end

    it "リクエストは302 OKとなること" do
      patch :update, params
      expect(response.status).to eq 302
    end

    it "データベースのdeliveraddressが更新されること" do
      expect do
        patch :update, params
      end.to change(Deliveraddress, :count).by(0)
    end

    it "root_pathへリダイレクトされる" do
      patch :update, params
      expect(response).to redirect_to root_path
    end
  end
end