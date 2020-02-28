class WarrantyReturnsController < ApplicationController
  before_action :claim_id_find, only: [:show, :edit, :update]
  before_action :require_admin

  def index
    @warranty = WarrantyReturn.all.order(created_at: :desc)
  end

  def new
    @warranty = WarrantyReturn.new
  end

  def create
    @warranty = WarrantyReturn.new(warranty_params)
    if @warranty.save
      flash[:notice] = "Saved next return"
      redirect_to new_warranty_return_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def claim_id_find
    @warranty = WarrantyReturn.find(params[:id])
  end

  def warranty_params
    params.require(:warranty_return).permit(:rma_no, :remote, :stand, :damage)
  end


  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
