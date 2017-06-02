require 'rails_helper'

RSpec.describe Zipcode do
  context "validations" do
    it {should validate_presence_of(:number)}
    it {should have_many(:addresses)}
  end
end
