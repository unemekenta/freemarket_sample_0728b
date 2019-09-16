require 'rails_helper'

RSpec.describe ProductImage, type: :model do
  describe '#new, #edit' do
    it "is invalid without a product_id" do
      product_image = build(:product_image, product_id: "")
      product_image.valid?
      expect(product_image.errors[:product]).to include("must exist")
    end
  end

  context 'callbacks' do
    it { is_expected.to callback(:delete_records).after(:update) }
  end
end
