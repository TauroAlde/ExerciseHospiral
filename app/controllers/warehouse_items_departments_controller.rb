class WarehouseItemsDepartmentsController < ApplicationController

  def index
    @warehouse_items_departments = WarehouseItemsDepartment.all
  end

  def new
    @warehouse_items_departments = WarehouseItemsDepartment.new
  end

  def show
    @warehouse_items_departments = WarehouseItemsDepartment.find(params[:id])
  end
  
  def create
    @warehouse_items_departments = WarehouseItemsDepartment.new(warehouse_items_departments_params)
    if @warehouse_items_departments.save
      redirect_to warehouse_items_departments_path
    else
      render :new
    end
  end

  def edit
    @warehouse_items_departments = WarehouseItemsDepartment.find(params[:id])
  end

  def update
    @warehouse_items_departments = WarehouseItemsDepartment.find(params[:id])
    if @warehouse_items_departments.update_attributes(warehouse_items_departments_params)
      redirect_to warehouse_items_department_path(@warehouse_items_departments)
    else
      render :edit
    end
  end

  def destroy
     @warehouse_items_departments = WarehouseItemsDepartment.find(params[:id]);
     @warehouse_items_departments.destroy
     redirect_to warehouse_items_departments_path
   end

  def warehouse_items_departments_params
    params.require(:warehouse_items_department).permit(:warehouse_item_id, :source_department_id, :quantity, :destination_department_id, :admin_user_id)
  end

end
