require 'rails_helper'

describe  'Omniauth' do
  describe '新規登録ページに情報を渡せる' do

    let(:condition){ FactoryBot.create(:condition) }
    let(:status){ FactoryBot.create(:status) }
    let(:category){ FactoryBot.create(:category) }
    let(:brand){ FactoryBot.create(:brand) }

    let(:product) {
      FactoryBot.create(
        :product, :skip_validate,
        seller_id: user.id,
        condition_id: condition.id,
        status_id: status.id,
        category_id: category.id,
        brand_id: brand.id
      )
    }

    before do
      @product = build(:product)
      category1 = create(:category, id: 1)
      category2 = create(:category, id: 2)
      category3 = create(:category, id: 3)
      category7 = create(:category, id: 7)
      visit root_path
      OmniAuth.config.mock_auth[:facebook] = nil
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] 
      Rails.application.env_config['omniauth.auth'] = facebook_mock
      click_link "ログイン"
      click_link "Facebookでログイン"
    end

    it "provider:facebookをstep1に反映できる" do
      expect(page).to have_field '例) メルカリ太郎', with: 'mockuser'
    end

    it "uidをstep1に反映できる" do
      expect(page).to have_field 'PC・携帯どちらでも可', with: 'sample@test.com'
    end
  end
end
