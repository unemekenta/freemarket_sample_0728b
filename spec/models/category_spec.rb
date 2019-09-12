require 'rails_helper'

describe Category do
  describe 'Category #show' do
    it "Categoryテーブルにデータを保存できる" do
      category = build(:category)
      expect(category).to be_valid
    end

    it "Categoryテーブルに保存されたブランド名を呼び出せる" do
      category = build(:category)
      expect(category.category).to eq "テストカテゴリー"
    end
  end
end
