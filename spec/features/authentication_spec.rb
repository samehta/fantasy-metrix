require 'rails_helper'

feature "Sign Up Process:", js: true do
  
  before do 
    visit root_path
    click_link "Sign Up"
    fill_in 'Username', with: "Sahil"
    fill_in 'Email', with: "samehta91@gmail.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_button 'Sign up'
  end
  
  scenario "user receives confirmation email" do
    expect(page).to have_content("A message with a confirmation link has been sent to your email address.")
    expect(ActionMailer::Base.deliveries.first.body).to match(/Confirm my account/)
  end

  scenario "user attempts to sign up with duplicate email" do
    visit root_path
    click_link "Sign Up"
    fill_in 'Username', with: "Sam"
    fill_in 'Email', with: "samehta91@gmail.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_button 'Sign up'

    expect(page).to have_content("Email has already been taken")
  end
end

feature "Sign In Process:", js: true do
  
  before do
    @user = create(:user)
    visit root_path
    login(@user)
  end

  scenario "displays username when signed in" do
    expect(page).to have_content("#{@user.username}")
  end
  
  scenario "user signs out" do
    click_link "Logout"
    find_link("Login").visible?
    find_link("Sign Up").visible?
  end
end