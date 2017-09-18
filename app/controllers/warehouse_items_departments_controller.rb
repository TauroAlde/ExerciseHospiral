class WarehouseItemsDepartmentsController < ApplicationController

  def index
    @warehouse_items_departments = WarehouseItemsDepartment.all
  end

end
