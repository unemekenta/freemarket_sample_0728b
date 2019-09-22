require 'rails_helper'

RSpec.describe EstimatedDate, type: :model do
  describe '#create' do
    it "is valid with a date" do
        estimated_date = build(:estimated_date)
        expect(estimated_date).to be_valid
    end

    it "is invalid without a date" do
        estimated_date = build(:estimated_date, date: "")
        estimated_date.valid?
        expect(estimated_date.errors[:date]).to include("can't be blank")
    end
  end
end
