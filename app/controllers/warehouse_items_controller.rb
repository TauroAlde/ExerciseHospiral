class WarehouseItemsController < ApplicationController

  before_action :validation_permition, only: [:new, :edit, :destroy]

  def index
    @warehouse_items = WarehouseItem.all
  end

  def new
    @warehouse_item = WarehouseItem.new
  end

  def create
    @warehouse_item = WarehouseItem.new(misparams)
    if @warehouse_item.save
      redirect_to warehouse_items_path
    else
      render :new
    end
  end

  def edit
    @warehouse_item = WarehouseItem.find(params[:id])
  end

  def update
    @warehouse_item = WarehouseItem.find(params[:id])
    if @warehouse_item.update_attributes(misparams)
      redirect_to warehouse_item_path(@warehouse_item)
    else
      render :edit
    end
  end

  def show
    @warehouse_item = WarehouseItem.find(params[:id])
  end

  def destroy
     @warehouse_item = WarehouseItem.find(params[:id]);
     @warehouse_item.destroy
     redirect_to warehouse_items_path
   end

  def misparams
    params.require(:warehouse_item).permit(:item_name,
      :quantity_total, warehouse_items_departments_attributes: [:id,:source_department_id, :warehouse_item_id, :quantity, :destination_department_id])
  end

  def validation_permition
    unless current_user.admin?    
      redirect_to warehouse_items_path
    end
  end
end
