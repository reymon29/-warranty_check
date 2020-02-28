class WarrantyReturn < ApplicationRecord
  has_many :images
  validates :rma_no, presence: true
  accepts_nested_attributes_for :images, allow_destroy: :destroy
end
