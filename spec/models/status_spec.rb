require 'rails_helper'

describe Status, type: :model do
  describe 'association' do

    let(:status) { create(:status)}
    let(:product) { build(:product)}

    it "statusモデルはproductと適切にアソシエーションを組めている" do
      expect(product.status.status).to eq("出品中")
    end
  end
end