require 'rails_helper'

describe Delivery do
    describe '#create' do
      before do
        # @deliver_region =  FactoryBot.create(:deliver_region)
        # @estimated_date =  FactoryBot.create(:estimated_date)
        # @deliver_method =  FactoryBot.create(:deliver_method)
        # @product =  FactoryBot.create(:product)
        # @delivery = build(:delivery, deliver_region_id: deliver_region.id, estimated_date_id: estimated_date.id, product_id: product.id, deliver_method_id: deliver_method.id)
        @delivery = build(:delivery)
      end

      
      it "is valid with a shipping_fee, deliver_method_id, estimated_date_id, product_id, deliver_region_id" do
        expect(@delivery).to be_valid
      end
    end
  end
  