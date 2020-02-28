class WarrantyReturnsController < ApplicationController
  before_action :claim_id_find, only: [:show, :edit, :update]
  before_action :require_admin

  def index
    @warranty = WarrantyReturn.all.order(created_at: :desc)
  end

  def new
    @warranty = WarrantyReturn.new
    @image = @warranty.images.build
  end

  def create
    @warranty = WarrantyReturn.new(warranty_params)
    if @warranty.save
      if params[:images]
        params[:images].each do |image|
          @warranty.images.create(image: image)
        end
      end
      flash[:notice] = "Saved next return"
      redirect_to new_warranty_return_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @warranty.update(warranty_params)
      if params[:images]
        params[:images].each do |image|
          @warranty.images.create(image: image)
        end
      end
      flash[:notice] = "Saved return"
      redirect_to warranty_return_path(@warranty)
    else
      render :edit
    end
  end

  def destroy
  end


  private

  def claim_id_find
    @warranty = WarrantyReturn.find(params[:id])
  end

  def warranty_params
    params.require(:warranty_return).permit(:rma_no, :remote, :stand, :damage, images_attributes: [:image, :warranty_return_id])
  end


  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
