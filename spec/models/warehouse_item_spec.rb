require 'rails_helper'

RSpec.describe WarehouseItem, type: :model do
  describe "creation" do
    it "creates a new object" do
      described_class.create(attributes_for(:warehouse_item))
    end
  end

  describe "Validations" do 
    it "is a valid instance of a departmen" do
      expect(build(:warehouse_item)).to be_valid
    end
    
    it "expect warehouse_items item_name blank" do
      is_expected.to validate_presence_of(:item_name)
    end

    it "expect warehouse_items quantity_total blank" do
      is_expected.to validate_presence_of(:quantity_total)
    end

    it "expect warehouse_items quantity_total be integer" do
      expect(build(:warehouse_item).quantity_total).to be_integer
    end
  end

  describe "Associations" do
    it "has many departments" do
      assc = described_class.reflect_on_association(:departments)
      expect(assc.macro).to eq :has_many
    end

    it "has many warehouse_items_departments" do
      assc = described_class.reflect_on_association(:warehouse_items_departments)
      expect(assc.macro).to eq :has_many
    end
  end

  describe "accept_nested_attributes_for" do
    it { should accept_nested_attributes_for(:warehouse_items_departments) }
  end
end