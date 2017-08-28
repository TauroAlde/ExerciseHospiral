class WarehouseItemsController < ApplicationController

  def index
    @warehouse_items = WarehouseItem.all
  end

  def project_params
    params.require(:warehouse_items).permit(:item_name, :quantity, warehouse_items_departments_attributes: [:id, :department_name])
  end
end
