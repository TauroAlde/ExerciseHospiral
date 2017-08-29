class DepartmentsController < ApplicationController

  def index
    @departments = Department.all
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(misparams)
    if @department.save
      redirect_to departments_path
    else
      render :new
    end
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])
    if @department.update_attributes(misparams)
      redirect_to department_path(@department)
    else
      render :edit
    end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
  end

  def show
    @department = Department.find(params[:id])
  end

  def destroy
     @department = Department.find(params[:id]);
     @department.destroy
     redirect_to departments_path
   end

  def misparams
     params.require(:department).permit(:department_name, warehouse_item_departments_attributes: [:id, :department_id, :warehouse_item_id, :quantity])
  end

end
