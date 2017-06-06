require 'rails_helper'

RSpec.describe Item do
  context "validations" do
    it { should validate_presence_of(:name)}
    it { should validate_uniqueness_of(:name)}
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:price)}
    it { should validate_presence_of(:status)}
    it {should have_many(:category_items)}
    it {should have_many(:categories).through(:category_items)}
  end

  it "knows if it's available" do
    item = create(:item)
    expect(item).to be_available
  end

  it "knows if it's retired" do
    item = create(:item, status: 1)
    expect(item).to be_retired
  end
  
  # it "cannot save a negative price" do
  #   item = build(:item, price: -10.00)
  #   item.save
  #   expect(Item.first.price).to eq(10.00)
  # end

end
