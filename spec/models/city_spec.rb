require 'rails_helper'

RSpec.describe City do
  context "validations" do
    it {should validate_presence_of(:name)}
    it {should have_many(:addresses)}
  end
end
