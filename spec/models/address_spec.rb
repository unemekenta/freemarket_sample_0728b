require 'rails_helper'

RSpec.describe Address, type: :model do
    describe '#create' do

      it "is valid with a post_number, prefecture, city, street" do
        address = build(:address)
        expect(address).to be_valid
      end

      it "is invalid without a post_number" do
        address = build(:address, post_number: "")
        address.valid?
        expect(address.errors[:post_number]).to include("translation missing: ja.activerecord.errors.models.address.attributes.post_number.blank")
      end

      it "is invalid without a prefecture" do
        address = build(:address, prefecture: nil)
        address.valid?
        expect(address.errors[:prefecture]).to include("translation missing: ja.activerecord.errors.models.address.attributes.prefecture.blank")
      end

      it "is invalid without a city" do
        address = build(:address, city: nil)
        address.valid?
        expect(address.errors[:city]).to include("translation missing: ja.activerecord.errors.models.address.attributes.city.blank")
      end

      it "is invalid without a street" do
        address = build(:address, street: nil)
        address.valid?
        expect(address.errors[:street]).to include("translation missing: ja.activerecord.errors.models.address.attributes.street.blank")
      end

    end
    
  end
  
  