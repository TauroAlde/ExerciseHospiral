require "rails_helper"

describe WarehouseItemsController do
  describe "GET index" do
      it "returns successfull response" do
        get :index
        expect(response).to be_success
      end
      
      it "reders index template" do
        get :index
        expect(response).to render_template(:index)
      end
      
      it "returns a list of warehouse_item" do
        warehouse_items = WarehouseItem.create(item_name: "navaja", quantity_total: 20)
        get :index
        expect(assigns(:warehouse_items)).to include(warehouse_items)
      end
    end

  describe "PUT update" do
    before(:each) do
      @warehouse_item = WarehouseItem.create(item_name: "navaja", quantity_total: 20)
    end

    it "updates a warehouse_item with valid params" do
      put :update, id: @warehouse_item, warehouse_item: { item_name: "cuchillo", quantity_total: 20 }
      @warehouse_item.reload
      expect(@warehouse_item.item_name).to eq("cuchillo")
    end

    it "returns successfull response" do
      put :update, id: @warehouse_item, warehouse_item: { item_name: "cuchillo" }
      expect(response).to redirect_to(warehouse_item_path)
    end

    it "does not reder index template" do
      put :update, id: @warehouse_item, warehouse_item: { item_name: "cuchillo",
        quantity_total: 20 }
        expect(response).not_to render_template(:edit)
    end

    it "reders index template becose when the update is failure" do
      put :update, id: @warehouse_item, warehouse_item: { item_name: "cuchillo", quantity_total: "20" }
      expect(response).not_to render_template(:edit)
    end

    context "params[:id]" do
      it "rasies error if params[:id] not present" do
        expect{put :update}.to raise_error(ActionController::UrlGenerationError)
      end

      it "rasies error if params[:id] not exists " do
        expect{put :update, id: WarehouseItem.last.id + 1}.
          to raise_error(ActiveRecord::RecordNotFound)
      end  

      it "rasies error if params[:id] is another character" do
        expect{put :update, id: "asdas"}.
          to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context "params[:warehouse_item]" do
      it "rasies error if params[:warehouse_item] is empty" do
        expect{put :update, id: @warehouse_item.id, warehouse_item: { }}.
          to raise_error(ActionController::ParameterMissing)
      end

      it "rasies error if params[:warehouse_item] is missing" do
        expect{put :update, id: @warehouse_item.id}.
          to raise_error(ActionController::ParameterMissing)
      end
    end
  end

  describe "GET edit" do
    before(:each) do
      @warehouse_items = WarehouseItem.create(item_name: "navaja", quantity_total: 20)
    end

    it "returns successfull response" do
      get :edit, id: @warehouse_items
      expect(response).to be_success
    end
   
    it "renders edit template" do
      get :edit, id: @warehouse_items
      expect(response).to render_template(:edit)
    end

    context "params[:id]" do
      it "returns a warehouse_items" do
        be_a(WarehouseItem)
      end

      it "rasies error if params[:id] not present" do
        expect{get :edit}.to raise_error(ActionController::UrlGenerationError)
      end

      it "rasies error if params[:id] not exists " do
        expect{get :edit, id: WarehouseItem.last.id + 1}.
          to raise_error(ActiveRecord::RecordNotFound)
      end  

      it "rasies error if params[:id] is another character" do
        expect{get :edit, id: "asdas"}.
          to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "GET new" do
    before(:each) do
      @warehouse_items = WarehouseItem.create(item_name: "navaja", quantity_total: 20)
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
    context "params[:warehouse_items]" do
      it "returns a warehouse_items" do
        post :create, id: @warehouse_item,  warehouse_item: { item_name: "navaja", quantity_total: 20 }
        expect(assigns(:warehouse_item)).to be_a( WarehouseItem )
      end

      it "creates a warehouse_items" do
        expect { post :create, warehouse_item: { item_name: "navaja", quantity_total: 20 } }.
          to change { WarehouseItem.count }.from(0).to(1)
      end

      it "renders 'new' template if reccord isn't saved" do
        post :create,  warehouse_item: { item_name: "navaja", quantity_total: 20 }
        expect(response).not_to render_template(:new)
      end

      it "redirects to warehouse_items_path if reccord is saved" do
        post :create,  warehouse_item: { item_name: "navaja", quantity_total: 20 }
        expect(response).to redirect_to(warehouse_items_path)
      end

      it "rasies error if not present" do
        expect { post :create }.to raise_error(ActionController::ParameterMissing)
      end
    end
  end

  describe "GET show" do
    before(:each) do
      @warehouse_items = WarehouseItem.create(item_name: "navaja", quantity_total: 20)
    end

    it "returns successfull response" do
      get :show, id: @warehouse_items.id
      expect(response).to be_success
    end

    it "reders index template" do
      get :show, id: @warehouse_items.id
      expect(response).to render_template(:show)
    end

    context "params[:id]" do
      it "returns a warehouse_items" do
        get :show, id: @warehouse_items.id
        expect(assigns(:warehouse_item)).to eql(@warehouse_items)
      end

     it "raises url generation exception if not present" do
      expect { get :show }.
      to raise_error(ActionController::UrlGenerationError)
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      @warehouse_items = WarehouseItem.create(item_name: "navaja", quantity_total: 20)
    end

    it "redirects to warehouse_items_path" do
      delete :destroy, id: @warehouse_items.id
      expect(response).to redirect_to(warehouse_items_path)
    end

    context "params[:id]" do
      it "destroys a warehouse_items reccord in database" do
        expect { delete :destroy, id: @warehouse_items.id }.
          to change {WarehouseItem.count}.from(1).to(0)
      end

      it "destroy a warehouse_items" do
        delete :destroy, id: @warehouse_items.id
        expect(assigns(:warehouse_item)).to eql(@warehouse_items)
      end

      it "rasies error if not present" do
        expect { delete :destroy }.
        to raise_error(ActionController::UrlGenerationError)
      end
    end
  end
end