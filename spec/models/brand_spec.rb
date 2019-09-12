# require 'rails_helper'

describe Brand do
  describe '#show' do
    it "Brandテーブルにデータを保存できる" do
      brand = build(:brand)
      expect(brand).to be_valid
    end

    it "Brandテーブルに保存されたブランド名を呼び出せる" do
      brand = build(:brand)
      expect(brand.brand).to eq "テストブランド"
    end

    
  end
  
end



