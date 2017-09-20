class WarehouseItemsController < ApplicationController

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

  def destroy
    @warehouse_item = WarehouseItem.find(params[:id])
    @warehouse_item.destroy
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
    params.require(:warehouse_item).permit(:item_name, :quantity_total, warehouse_item_departments_attributes: [:id, :department_id, :warehouse_item_id])
  end
end
