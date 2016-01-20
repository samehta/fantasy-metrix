require 'rails_helper'

feature "User signs in", js: true do
  
  before do
    @user = create(:user)
    visit root_path
    login(@user)
  end

  scenario do
    expect(page).to have_content("#{@user.username}")
    expect(page).to have_content("Signed in successfully.")
  end
end