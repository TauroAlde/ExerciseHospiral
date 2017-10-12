require 'rails_helper'

RSpec.describe Provider, type: :model do

  describe "Provider" do
    it "is valid" do
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
    it { is_expected.to define_enum_for(:priority) }

    it "returns 'contract' when is 0" do
      expect(build(:provider, priority: 0).priority).to eq("contract")
    end

    it "returns 'individual_sale' when is 1" do
      expect(build(:provider, priority: 1).priority).to eq("individual_sale")
    end
  end

  describe "active scope" do
    it "returns reccords where 'active' = true" do
      create_list(:provider, 5, active: true)
      create_list(:provider, 3, active: false)
      expect(Provider.active.count).to eq(5)
    end
  end

  describe "method :set_name" do
    it "doesn't add sufix '_1' to name when it doesn't exist yet" do
      expect_name = create(:provider, name: "Amed")
      expect(expect_name.name).to eq("Amed")
    end

    it "return name with method :set_name eq Amed_1" do
      expect_name = create(:provider, name: "Amed")
      expect_name1 = create(:provider, name: "Amed")
      expect(expect_name1.name).to eq("Amed_1")
    end

    it "return name with method :set_name eq Amed_1_1" do
      expect_name = create(:provider, name: "Amed")
      expect_name1 = create(:provider, name: "Amed_1")
      expect_name3 = create(:provider, name: "Amed")
      expect(expect_name3.name).to eq("Amed_1_1")
    end
  end

  describe "find_by_product_prioritized" do
    it "returns a list of providers associated to product" do
      warehouse_item = create(:warehouse_item, item_name: "navaja")
      provider = create(:provider, priority: 0)
      warehouse_item_providder = create(:warehouse_item_providers, provider: provider,
        warehouse_item: warehouse_item)
      expect(Provider.find_by_product_prioritized(warehouse_item.id)).
        to match_array(provider)
    end

    it"returns an empty array" do
      warehouse_item = create(:warehouse_item, item_name: "navaja")
      provider = create(:provider, priority: 0)
      warehouse_item_providder = create(:warehouse_item_provider, provider: provider,
        warehouse_item: warehouse_item)

      warehouse_item2 = create(:warehouse_item, item_name: "navaja")
      provider2 = create(:provider, priority: 0)
      warehouse_item_providder2 = create(:warehouse_item_provider, provider: provider,
        warehouse_item: warehouse_item)

      warehouse_item3 = create(:warehouse_item, item_name: "navaja")
      warehouse_item_providder3 = create(:warehouse_item_provider, provider: provider,
        warehouse_item: warehouse_item)

      expect(Provider.find_by_product_prioritized(warehouse_item3.id)).to be_empty
    end

    it "the id don" do
      create_list(:provider 5)
      create_list(:warehouse_item 5)
      
    end
  end
end
