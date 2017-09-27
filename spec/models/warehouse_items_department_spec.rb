require 'rails_helper'

RSpec.describe WarehouseItemsDepartment, type: :model do
  describe "Associations" do
    it "belongs_to warehouse_item" do
      assc = described_class.reflect_on_association(:warehouse_item)
      expect(assc.macro).to eq :belongs_to
    end

    it "belongs_to department" do
      assc = described_class.reflect_on_association(:department)
      expect(assc.macro).to eq :belongs_to
    end

    it "belongs_to source_department" do
      assc = described_class.reflect_on_association(:source_department)
      expect(assc.macro).to eq :belongs_to
    end

    it "belongs_to destination_department" do
      assc = described_class.reflect_on_association(:destination_department)
      expect(assc.macro).to eq :belongs_to
    end
  end
end