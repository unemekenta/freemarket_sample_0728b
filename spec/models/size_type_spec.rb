require 'rails_helper'

RSpec.describe SizeType, type: :model do
  describe 'size_typeモデルはcategoriesとsizesと適切なアソシエーションを組めているか' do
    
      let(:size_type) { FactoryBot.create(:size_type) }
      let(:category1) { FactoryBot.create(:category, category: 'カテゴリ1', size_type: size_type) }
      let(:category2) { FactoryBot.create(:category, category: 'カテゴリ2', size_type: size_type) }
      let(:size1) { FactoryBot.create(:size, size: "size1", size_type: size_type) }
      let(:size2) { FactoryBot.create(:size, size: "size2", size_type: size_type) }
    
    it 'size_typesとcategoriesは1対多のアソシエーションである1' do
      expect(category1.size_type).to eq size_type
    end
    it 'size_typesとcategoriesは1対多のアソシエーションである2' do
      expect(size_type.categories).to eq [category1, category2]
    end
    it 'size_typesとsizesは1対多のアソシエーションである1' do
      expect(size1.size_type).to eq size_type
    end
    it 'size_typesとsizesは1対多のアソシエーションである2' do
      expect(size_type.sizes).to eq [size1, size2]
    end
  end
end