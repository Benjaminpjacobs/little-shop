require 'rails_helper'

RSpec.describe Category do
  context "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_uniqueness_of(:title)}
    it {should have_many(:category_items)}
    it {should have_many(:items).through(:category_items)}
  end
end
