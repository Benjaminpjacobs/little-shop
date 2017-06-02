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
end
