require 'rails_helper'

RSpec.describe OrderItem do
  context "validations" do
    it {should belong_to(:order)}
    it {should belong_to(:item)}
    it {should validate_presence_of(:qty)}
  end
  
  it "should calculate line item subtotal" do
  end

end
