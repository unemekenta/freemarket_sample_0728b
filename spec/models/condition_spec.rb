require 'rails_helper'

RSpec.describe Condition, type: :model do
  describe 'association' do

    let(:condition) { FactoryBot.create(:condition)}
    let(:product) { FactoryBot.build(:product)}

    it "generates associated condition data from a factory" do
      expect(product.condition.condition).to eq("新品、未使用")
    end
  end
end