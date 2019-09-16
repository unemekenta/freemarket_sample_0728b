require 'rails_helper'

RSpec.describe Size, type: :model do
  describe 'sizesモデルはproductsとsize_typesと適切なアソシエーションを組めているか' do
    before do
      category = FactoryBot.create(:category)
      @size_type = FactoryBot.create(:size_type)
      @size = FactoryBot.create(:size)

      @product1 = FactoryBot.build(:product, category_id: category.id, size_id: @size.id) do |product|
        product.product_images.build(FactoryBot.attributes_for(:product_image))
      end
      @product1.save

      @product2 = FactoryBot.build(:product, category_id: category.id, size_id: @size.id) do |product|
        product.product_images.build(FactoryBot.attributes_for(:product_image))
      end
      @product2.save
    end

    it 'sizesとproductsは1対多のアソシエーションである1' do
      @size.products.each do |product|
        expect(product.name).to eq "test"
      end
    end

    it 'sizesとproductsは1対多のアソシエーションである2' do
      expect(@product1.size.size).to eq "XXS以下"
    end

    it 'size_typesとsizesは1対多のアソシエーションである1' do
      @size_type.sizes.each do |size|
        expect(size.size).to eq "XXS以下"
      end
    end

    it 'size_typesとsizesは1対多のアソシエーションである2' do
      expect(@size.size_type.size_type).to eq "AdultWearSize"
    end
  end
end
