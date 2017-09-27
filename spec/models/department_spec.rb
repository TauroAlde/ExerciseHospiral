require 'rails_helper'

RSpec.describe Department, type: :model do
  describe "creation" do
    before(:each) do
      @department = create(:department)
    end

    it "creates a new object" do
      described_class.create(attributes_for(:department))
    end
  end

  describe "Validations" do 
    it "is a valid instance of a department" do
      expect(build(:department)).to be_valid
    end

    it "validates department_name" do
      is_expected.to validate_presence_of(:department_name)
    end
  end

  describe "Associations" do
    it "has_many warehouse_items" do
      assc = described_class.reflect_on_association(:warehouse_items)
      expect(assc.macro).to eq :has_many
    end

    it "has_many warehouse_items_departments" do
      assc = described_class.reflect_on_association(:warehouse_items_departments)
      expect(assc.macro).to eq :has_many
    end

    it "has_many sourced_department" do
      assc = described_class.reflect_on_association(:sourced_department)
      expect(assc.macro).to eq :has_many
    end

    it "has_many destined_department" do
      assc = described_class.reflect_on_association(:destined_department)
      expect(assc.macro).to eq :has_many
    end
  end

  describe "accept_nested_attributes_for" do
    it { should accept_nested_attributes_for(:warehouse_items_departments) }
  end
end