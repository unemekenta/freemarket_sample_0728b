require 'rails_helper'

RSpec.describe SizeType, type: :model do
  describe 'size_typeモデルはcategoriesとsizesと適切なアソシエーションを組めているか' do
    
      let(:size_type) { FactoryBot.create(:size_type) }
      let(:category1) { FactoryBot.create(:category, category: 'カテゴリ1') }
      let(:category2) { FactoryBot.create(:category, category: 'カテゴリ2') }
      let(:size1) { FactoryBot.create(:size, size: "size1") }
      let(:size2) { FactoryBot.create(:size, size: "size2") }
    
    it 'size_typesとcategoriesは1対多のアソシエーションである1' do
      expect(size_type).to be_valid
      expect(category1.size_type.size_type).to eq "AdultWearSize"
    end
    it 'size_typesとcategoriesは1対多のアソシエーションである2' do
      size_type.categories.each do |category|
        expect(category.category).to eq "テストカテゴリー1"
      end
    end
    it 'size_typesとsizesは1対多のアソシエーションである1' do
      expect(size1.size_type.size_type).to eq "AdultWearSize"
    end
    it 'size_typesとsizesは1対多のアソシエーションである2' do
      size_type.sizes.each do |size|
        expect(size.size).to eq "XXS以下"
      end
    end
  end
end