require 'rails_helper'

RSpec.describe Provider, type: :model do

  describe "Provider" do
    it "is provider valid" do
      expect(build(:provider)).to be_valid
    end
  end

  describe "Validations" do
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe "Associations" do
    it "has many warehouse_items" do
      assc = described_class.reflect_on_association(:warehouse_items)
      expect(assc.macro).to eq :has_many
    end

    it "has many warehouse_item_providers" do
      assc = described_class.reflect_on_association(:warehouse_item_providers)
      expect(assc.macro).to eq :has_many
    end
  end

  describe "before_save" do
     it { is_expected.to callback(:set_name).before(:save) }
  end

  describe "priority" do
   it "enumerator value" do
     expect(build(:provider, priority: 0).priority).to eq("contract")
   end

   it "enumerator value" do
     expect(build(:provider, priority: 1).priority).to eq("individual_sale")
   end
    it { is_expected.to define_enum_for(:priority) }
  end

  describe "active" do
    it "active true" do
      create_list(:provider, 5, active: true)
      create_list(:provider, 3, active: false)
      expect(Provider.active.count).to eq(5)
    end
  end

  describe "method :set_name" do
    it "return name with method :set_name eq name_1" do
      expect_name = create(:provider, name: "Amed")
      expect_name1 = create(:provider, name: "Amed")
      expect(exp_name1.name).to eq("Amed_1")
    end

    it "return name with method :set_name name" do
      expect_name = create(:provider, name: "Amed")
      expect(expect_name.name).to eq("Amed")
    end
  end

  describe "method find_by_product_prioritized" do
    it "return contract" do
      warehouse_item = create(:warehouse_item, item_name: "navaja")
      provider = create(:provider, priority: 0)
      warehouse_item_providder = create(:warehouse_item_providers, provider: provider,
        warehouse_item: warehouse_item)
      expect(Provider.find_by_product_prioritized(warehouse_item.id)).
        to match_array(provider)
    end
  end
end
