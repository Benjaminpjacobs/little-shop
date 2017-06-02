
RSpec.feature "When a user is logged in" do
  it "can logout" do

    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    click_on "Logout"
    expect(page).to_not have_content("Logout")
    expect(page).to have_content("Login")
  end
end
