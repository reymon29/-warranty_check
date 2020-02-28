class Image < ApplicationRecord
  belongs_to :warranty_return
  mount_uploader :image, ImageUploader
end
