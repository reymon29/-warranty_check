class WarrantyReturn < ApplicationRecord
  has_many_attached :photos
  validates :rma_no, presence: true
end
