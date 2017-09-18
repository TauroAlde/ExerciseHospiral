require "rails_helper"

describe DepartmentsController do

  describe "GET index" do
    it "returns successfull response" do
      get :index
      expect(response).to be_success
    end
    
    it "reders index template" do
      get :index
      expect(response).to render_template(:index)
    end
    
    it "returns a list of departments" do
      department = Department.create(department_name: "Computo")
      get :index
      expect(assigns(:departments)).to include(department)
    end
  end
  
  describe "PUT update" do
    before(:each) do
      @department = Department.create(department_name: "Computo")
    end

    it "returns successfull response" do
      put :update, id: @department.id, department: { department_name: "cine"}
      expect(response).to redirect_to(department_path)
    end

  end

  describe "GET edit" do
    before(:each) do
      @department = Department.create(department_name: "Computo")
    end

    it "returns successfull response" do
      get :edit, id: @department
      expect(response).to be_success
    end
   
    it "renders edit template" do
      get :edit, id: @department
      expect(response).to render_template(:edit)
    end

    context "params[:id]" do
      it "returns a department" do
        be_a(Department)
      end
    end

  end

  describe "GET new" do
    it "return a new department" do
      department = Department.new(id: 1, department_name: "Computo")
      get :new
      expect(assigns(:department)).to be_a_new(Department)
    end

    it "returns successfull response" do
      get :new
      expect(response).to be_success
    end

    it "renders 'new' template" do
      get :new
      expect(response).to render_template(:new)
    end
    
  end

  describe "POST create" do
    it "returns successfull response" do
      post :create,  department: { department_name: "Computo"}
      expect(response).to redirect_to(departments_path)
    end

    context "params[:department]" do
      it "returns a department" do
        post :create,  department: { department_name: "Computo"}
        expect(assigns(:department)).to be_a(Department)
      end

      it "creates a department" do
        expect { post :create, department: { department_name: "Computo"} }.
          to change {Department.count}.from(0).to(1)
      end

      it "renders 'new' template if reccord isn't saved" do
        post :create,  department: { department_name: "Computo"}
        expect(response).not_to render_template(:new)
      end

      it "redirects to departments_path if reccord is saved" do
        post :create,  department: { department_name: "Computo"}
        expect(response).to redirect_to(departments_path)
      end

      it "rasies error if not present" do
        expect { post :create }.to raise_error(ActionController::ParameterMissing)
      end
    end
  end

  describe "GET show" do
    before(:each) do
      @department = Department.create(department_name: "Computo")
    end

    it "returns successfull response" do
      get :show, id: @department.id
      expect(response).to be_success
    end

    it "reders index template" do
      get :show, id: @department.id
      expect(response).to render_template(:show)
    end
  
    context "params[:id]" do
      it "returns a department" do
        get :show, id: @department.id
        expect(assigns(:department)).to eql(@department)
      end

     it "raises url generation exception if not present" do
      expect { get :show }.
      to raise_error(ActionController::UrlGenerationError)
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      @department = Department.create(department_name: "Computo")
    end

    it "redirects to departments_path" do
      delete :destroy, id: @department.id
      expect(response).to redirect_to(departments_path)
    end

    context "params[:id]" do
      it "destroys a department reccord in database" do
        expect { delete :destroy, id: @department.id }.
          to change {Department.count}.from(1).to(0)
      end

      it "destroy a department" do
        delete :destroy, id: @department.id
        expect(assigns(:department)).to eql(@department)
      end

      it "rasies error if not present" do
        expect { delete :destroy }.
        to raise_error(ActionController::UrlGenerationError)
      end
    end
  end
end