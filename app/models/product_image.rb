class ProductImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :product
  after_update :delete_records

  def delete_records
    deleted_images = ProductImage.where(image: nil)
    deleted_images.each do |image|
      image.destroy
    end
  end
end
