require 'rails_helper'

RSpec.describe Order do
  context "validations" do
    it {should belong_to(:user)}
    it {should have_many(:order_items)}
    it {should have_many(:items).through(:order_items)}
  end
  
  it "should calculate total" do
  end
  
end
