require 'rails_helper'
describe Product do
  describe '#new, #edit' do
    before do
      @product = build(:product)
      @seller = FactoryBot.create(:user) # 多対多はまだ課題あり
      @status = FactoryBot.create(:status)
      @condition = FactoryBot.create(:condition)
      @category = FactoryBot.create(:category)
      @brand = FactoryBot.create(:brand)
    end

    context "maximum validation test" do
      it "can be up to 40 characters" do
        @product.name = "a" * 64
        @product.valid?
        expect(@product.errors[:name]).to include("is too long (maximum is 40 characters)")
      end

      it "can be up to 1000 characters" do
        @product.detail = "a" * 1024
        @product.valid?
        expect(@product.errors[:detail]).to include("is too long (maximum is 1000 characters)")
      end
    end

    context "association test" do
      it "generates associated product_image data from a factory" do
        @product.product_images.each do |image|
          expect(image.image).to eq("test.jpg")
        end
      end

      it "generates associated status data from a factory" do
        status = @status
        expect(@product.status.status).to eq("出品中")
      end

      it "generates associated condition data from a factory" do
        condition = @condition
        expect(@product.condition.condition).to eq("新品、未使用")
      end

      it "generates associated category data from a factory" do
        category = @category
        expect(@product.category.category).to eq("テストカテゴリー")
      end

      it "generates associated size data from a factory" do
        @product.category.size_type.sizes.each do |size|
          expect(size.size).to eq("XXS以下")
        end
      end

      it "generates associated brand data from a factory" do
        brand = @brand
        expect(@product.brand.brand).to eq("テストブランド")
      end

      # 多対多はまだ課題あり
      it "generates associated seller data from a factory" do
        seller = @seller
        expect(seller.family_name).to eq("山田")
      end
    end

    context "valid test" do
      it "is valid with all columns" do
        @product.product_images.each do |image|
          expect(@product).to be_valid
        end
      end

      it "is valid with a name" do
        expect(@product.name).to eq("test")
      end

      it "is valid with a price" do
        expect(@product.price).to eq(1000)
      end

      it "is valid with a detail" do
        expect(@product.detail).to eq("it is a test for product model")
      end
    end

    context "invalid test" do
      it "is invalid without a name" do
        product = build(:product, name: nil)
        product.valid?
        expect(product.errors[:name]).to include("can't be blank")
      end

      it "is invalid without a price" do
        product = build(:product, price: nil)
        product.valid?
        expect(product.errors[:price]).to include("can't be blank")
      end

      it "is invalid without a detail" do
        product = build(:product, detail: nil)
        product.valid?
        expect(product.errors[:detail]).to include("can't be blank")
      end

      it "is invalid without a status_id" do
        product = build(:product, status_id: nil)
        product.valid?
        expect(product.errors[:status_id]).to include("can't be blank")
      end

      it "is invalid without a condition_id" do
        product = build(:product, condition_id: nil)
        product.valid?
        expect(product.errors[:condition_id]).to include("can't be blank")
      end

      it "is invalid without a category_id" do
        product = build(:product, category_id: nil)
        product.valid?
        expect(product.errors[:category_id]).to include("can't be blank")
      end

      it "is invalid without a seller_id" do
        product = build(:product, seller_id: nil)
        product.valid?
        expect(product.errors[:seller_id]).to include("can't be blank")
      end
    end
  end
end