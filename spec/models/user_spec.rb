require 'rails_helper'

RSpec.describe User do
  context "validations" do
    it { should have_secure_password }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:role) }
    it { should allow_value("email@address.com").for(:email) }
    it { should_not allow_value("Bob").for(:email) }
    it { should have_many(:addresses) }
  end

  it "can display full name" do
    user1 = create(:user)
    expected = "#{user1.first_name}" + ' ' + "#{user1.last_name}"
    expect(user1.full_name).to eq(expected)
  end
  
  it "can display full address" do
    user1 = create(:user_with_address)
    expected = "#{user1.addresses.first.street_address}" + ' ' + "#{user1.addresses.first.city.name}" + ' ' + "#{user1.addresses.first.state.name}" + ' ' + "#{user1.addresses.first.zipcode.number}" 
    expect(user1.full_address).to eq(expected)
  end
  
end
