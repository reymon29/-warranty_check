class Reports::WarrantyReturnsController < ApplicationController
  def index
    if params[:from].present?
      @searchdatefrom = params[:from]
      @searchdateto = params[:to]
      @status = params[:status]
      # dates_validates(@searchdatefrom, @searchdateto)
      @datefrom = date_format = Date.strptime(@searchdatefrom, '%m/%d/%Y')
      @dateto = date_format = Date.strptime(@searchdateto, '%m/%d/%Y')
      if @status == "Compeleted for payment" || @status == "Denied"
        @warranty = WarrantyReturn.where("created_at >= ? AND created_at <= ? AND status ILIKE ?", @datefrom, @dateto, @status)
      else @status == "All"
        @warranty = WarrantyReturn.where("created_at >= ? AND created_at <= ?", @datefrom, @dateto)
      end
      respond_to do |format|
        format.html
        format.csv { send_data @warranty.to_csv, filename: "warranty_items-#{Date.today}.csv" }
     end
    else
      @warranty = WarrantyReturn.where("created_at > ? AND created_at < ?", Time.now.beginning_of_month, Time.now.end_of_month)
      respond_to do |format|
        format.html
        format.csv { send_data @warranty.to_csv, filename: "warranty_items-#{Date.today}.csv" }
     end
    end
  end
end
