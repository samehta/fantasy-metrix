require 'rails_helper'

feature "User signs out", js: true do

  before do
    user = create(:user)
    visit root_path
    login(user)
  end
  
  scenario do
    click_link "Logout"
    find_link("Login").visible?
    find_link("Sign Up").visible?
    expect(page).to have_content("Signed out successfully.")
  end
end