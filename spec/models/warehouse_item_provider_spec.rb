require 'rails_helper'

RSpec.describe WarehouseItemProvider, type: :model do
  describe "Associations" do
    it "belongs_to provider" do
      assc = described_class.reflect_on_association(:provider)
      expect(assc.macro).to eq :belongs_to
    end

    it "belongs_to warehouse_item" do
      assc = described_class.reflect_on_association(:warehouse_item)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
