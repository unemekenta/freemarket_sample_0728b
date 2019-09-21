require 'rails_helper'

RSpec.describe ProductImage, type: :model do

  include CarrierWave::Test::Matchers
  include ActionDispatch::TestProcess

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

  it "is valid with jpg, jpeg, gif, png" do
    formats = %w(jpg jpeg gif png)
    formats.each do |f|
      image_path = File.join(Rails.root, "spec/fixtures/lake.#{f}")
      product_image = FactoryBot.build(:product_image, product_id: product.id, image: File.open(image_path))
      expect(product_image).to be_valid
    end
  end

  it "is invalid with rb" do
    image_path = File.join(Rails.root, "spec/fixtures/lake.rb")
    product_image = FactoryBot.build(:product_image, product_id: product.id, image: File.open(image_path))
    expect(product_image).not_to be_valid
  end

  context 'callbacks' do
    it { is_expected.to callback(:delete_records).after(:update) }
  end
end
