require 'rails_helper'

describe PurchasesController do
  let(:user_a) { FactoryBot.create(:user) }
  let(:user_b) { FactoryBot.create(:user) }
  let(:status) { FactoryBot.create(:status) }
  let(:product) { FactoryBot.create(:product, :skip_validate, seller_id: user_b.id, status_id: status.id) }
  let(:purchase) { FactoryBot.build(:purchase, seller_id: user_b.id, buyer_id: user_a.id, product_id: product.id) }
  let(:condition) { FactoryBot.create(:condition) }
  let(:category) { FactoryBot.create(:category) }

  describe '#new' do
    context 'card.blank? == true' do
      before do
        login user_b
        get :new, params: { product_id: product.id }
      end
      it 'has a 200 status code' do
        expect(response.status).to eq 200
      end
      it 'renders new' do
        expect(response).to render_template :new
      end
    end
    context 'card.blank? == false && deliveraddressを持つ' do
      before do
        login user_a
        FactoryBot.create(:credit_card, user_id: user_a.id)
        @deliveraddress = FactoryBot.create(:deliveraddress, user_id: user_a.id)
        get :new, params: { product_id: product.id }
      end
      it 'assigns @address' do
        # payjpが関係するインスタンスのテストは困難な為、@address, @purchaseのみテスト
        expect(assigns(:address)).to eq @deliveraddress
      end
      it 'assigns @purchase' do
        expect(assigns(:purchase)).to be_a_new(Purchase)
      end
      it 'has a 200 status code' do
        expect(response.status).to eq 200
      end
      it 'renders new' do
        expect(response).to render_template :new
      end
    end
    context 'card.blank? == false && deliveraddressを持たない' do
      before do
        login user_a
        FactoryBot.create(:credit_card, user_id: user_a.id)
        @deliveraddress = nil
        get :new, params: { product_id: product.id }
      end
      it 'assigns @address' do
        expect(assigns(:address)).to eq @deliveraddress
      end
      it 'assigns @purchase' do
        expect(assigns(:purchase)).to be_a_new(Purchase)
      end
      it 'has a 200 status code' do
        expect(response.status).to eq 200
      end
      it 'renders new' do
        expect(response).to render_template :new
      end
    end
  end
  describe '#pay' do
    before do
      user_a = FactoryBot.create(:user)
      user_b = FactoryBot.create(:user)
      @product = FactoryBot.build(:product, status_id: 1, condition_id: condition.id, category_id: category.id, seller_id: user_b.id) do |product|
        product.product_images.build(FactoryBot.attributes_for(:product_image))
      end
      @product.save!

      status_sold = FactoryBot.create(:status, id: 2)
      @product_sold = FactoryBot.build(:product, status_id: status_sold.id, condition_id: condition.id, category_id: category.id, seller_id: user_b.id) do |product|
        product.product_images.build(FactoryBot.attributes_for(:product_image))
      end
      @product_sold.save!

      login user_a
      FactoryBot.create(:credit_card, user_id: user_a.id)
      
      @params = { purchase: attributes_for(:purchase, product_id: @product.id, seller_id: user_b.id, buyer_id: user_a.id), product_id: @product.id  }
    end
    context '@product.status == 1(販売中) && save成功した場合' do
      subject {
        post :pay, params: @params
      }
      it 'has a 302 status code' do
        subject
        expect(response.status).to eq 302
      end
      it 'count up purchase' do
        expect{ subject }.to change(Purchase, :count).by(1)
      end
      it 'redirect to done' do
        subject
        # 下記はpurchases_controllerの34行目、notice: "商品を購入しました" を一時コメントアウトすると通る
        expect(response).to redirect_to done_product_purchases_path(@product)
      end
    end
    context '@product.status == 1(販売中) && save失敗した場合' do
      subject {
        post :pay, params: {purchase: {seller_id: "test", buyer_id: "test", product_id: "test"}, product_id: @product.id}
      }
      it 'has a 302 status code' do
        subject
        expect(response.status).to eq 302
      end
      it 'count not up purchase' do
        expect{ subject }.to change(Purchase, :count).by(0)
      end
      it 'redirect to root' do
        subject
        expect(response).to redirect_to root_path
      end
    end
    context '@product.status == 4(売り切れ)' do
      before do
        @params_sold = { purchase: attributes_for(:purchase, product_id: @product_sold.id, seller_id: user_b.id, buyer_id: user_a.id), product_id: @product_sold.id  }
      end
      subject {
        post :pay, params: @params_sold
      }
      it 'has a 302 status code' do
        subject
        expect(response.status).to eq 302
      end
      it 'count not up purchase' do
        expect{ subject }.to change(Purchase, :count).by(0)
      end
      it 'redirect to root' do
        subject
        expect(response).to redirect_to root_path
      end
    end

  end
end