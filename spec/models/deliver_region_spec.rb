require 'rails_helper'

RSpec.describe DeliverRegion, type: :model do
  describe '#create' do
    it "is valid with a region" do
        deliver_region = build(:deliver_region)
        expect(deliver_region).to be_valid
    end

    it "is invalid without a region" do
        deliver_region = build(:deliver_region, region: "")
        deliver_region.valid?
        expect(deliver_region.errors[:region]).to include("can't be blank")
    end
  end
end
