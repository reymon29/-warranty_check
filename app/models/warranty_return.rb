class WarrantyReturn < ApplicationRecord
  validates :rma_no, presence: true
end
