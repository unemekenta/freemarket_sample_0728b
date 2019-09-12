require 'rails_helper'

describe Deliveraddress do
  describe '#new, #edit' do
    before do
      @user = FactoryBot.create(:user)
    end

    it "is valid factory of user" do
      user = @user
      expect(user).to be_valid
    end

    it "is valid with a family_name, first_name, family_name_pseudonym, first_name_pseudonym, post_number, prefecture, city, street, building, phone_number and user_id" do
      deliveraddress = build(:deliveraddress)
      expect(deliveraddress).to be_valid
    end

    it "is invalid without a family_name" do
      deliveraddress = build(:deliveraddress, family_name: nil)
      deliveraddress.valid?
      expect(deliveraddress.errors[:family_name]).to include("can't be blank")
    end

    it "is invalid without a first_name" do
      deliveraddress = build(:deliveraddress, first_name: nil)
      deliveraddress.valid?
      expect(deliveraddress.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without a family_name_pseudonym" do
      deliveraddress = build(:deliveraddress, family_name_pseudonym: nil)
      deliveraddress.valid?
      expect(deliveraddress.errors[:family_name_pseudonym]).to include("can't be blank")
    end

    it "is invalid without a first_name_pseudonym" do
      deliveraddress = build(:deliveraddress, first_name_pseudonym: nil)
      deliveraddress.valid?
      expect(deliveraddress.errors[:first_name_pseudonym]).to include("can't be blank")
    end

    it "is invalid without a post_number" do
      deliveraddress = build(:deliveraddress, post_number: nil)
      deliveraddress.valid?
      expect(deliveraddress.errors[:post_number]).to include("can't be blank")
    end

    it "is invalid without a prefecture" do
      deliveraddress = build(:deliveraddress, prefecture: nil)
      deliveraddress.valid?
      expect(deliveraddress.errors[:prefecture]).to include("can't be blank")
    end

    it "is invalid without a city" do
      deliveraddress = build(:deliveraddress, city: nil)
      deliveraddress.valid?
      expect(deliveraddress.errors[:city]).to include("can't be blank")
    end

    it "is invalid without a street" do
      deliveraddress = build(:deliveraddress, street: nil)
      deliveraddress.valid?
      expect(deliveraddress.errors[:street]).to include("can't be blank")
    end

    it "is valid without a building" do
      deliveraddress = build(:deliveraddress, building: nil)
      deliveraddress.valid?
      expect(deliveraddress).to be_valid
    end

    it "is valid without a phone_number" do
      deliveraddress = build(:deliveraddress, phone_number: nil)
      deliveraddress.valid?
      expect(deliveraddress).to be_valid
    end

    it "is valid without a user_id" do
      deliveraddress = build(:deliveraddress, user_id: nil)
      deliveraddress.valid?
      expect(deliveraddress.errors[:user_id]).to include("can't be blank")
    end
  end
end

# RSpec.describe Deliveraddress, type: :model do

# end
