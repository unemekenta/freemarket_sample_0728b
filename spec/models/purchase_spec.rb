require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with seller, buyer, product' do
        purchase = FactoryBot.create(:purchase)
        expect(purchase).to be_valid
      end
    end
    context 'can not save' do
      it 'is invalid without seller' do
        purchase = FactoryBot.build(:purchase, seller: nil)
        purchase.valid?
        expect(purchase.errors[:seller]).to include("can't be blank")
      end
      it 'is invalid without buyer' do
        purchase = FactoryBot.build(:purchase, buyer: nil)
        purchase.valid?
        expect(purchase.errors[:buyer]).to include("can't be blank")
      end
      it 'is invalid without product' do
        purchase = FactoryBot.build(:purchase, product: nil)
        purchase.valid?
        expect(purchase.errors[:product]).to include("can't be blank")
      end
      it 'is invalid when seller = buyer' do
        user = FactoryBot.build(:user)
        purchase = FactoryBot.build(:purchase, seller: user, buyer: user)
        purchase.valid?
        expect(purchase.errors[:buyer]).to include("エラー発生")
      end
    end
  end
end