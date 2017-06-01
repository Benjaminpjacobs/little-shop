require 'rails_helper'

RSpec.describe Address do
  it {should validate_presence_of(:address_type)}
  it {should belong_to(:user)}
  it {should belong_to(:city)}
  it {should belong_to(:state)}
  it {should belong_to(:zipcode)}
end
