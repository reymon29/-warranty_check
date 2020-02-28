require "csv"
class WarrantyReturn < ApplicationRecord
  has_many :images
  validates :rma_no, presence: true
  accepts_nested_attributes_for :images, allow_destroy: :destroy

    def self.to_csv
    attributes = ["RMA_No",
                  "Remote",
                  "Stand",
                  "Damage",
                  "Images",
                  "Created_at"
                ]
    csv_file = CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |return_item|
        csv << [return_item.rma_no, return_item.remote, return_item.stand, return_item.damage, return_item.images.present? ? "Yes" : "No", return_item.created_at ]
      end
    end
  end
end
