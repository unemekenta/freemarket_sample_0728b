require 'rails_helper'

describe DeliveraddressesController, type: :controller do
  let(:user) {create(:user)}

  describe 'GET #new' do
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