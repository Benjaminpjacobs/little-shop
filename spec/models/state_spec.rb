require 'rails_helper'

RSpec.describe State do
  context "validations" do
    it {should validate_presence_of(:name)}
    it {should have_many(:addresses)}
  end
end
