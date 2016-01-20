require 'rails_helper'

feature "User signs up", js: true do
  
  before do 
    visit root_path
    click_link "Sign Up"
    fill_in 'Username', with: "Sahil"
    fill_in 'Email', with: "samehta91@gmail.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_button 'Sign up'
  end
  
  scenario "receives confirmation email" do
    expect(page).to have_content("A message with a confirmation link has been sent to your email address.")
    expect(ActionMailer::Base.deliveries.first.body).to match(/Confirm my account/)
  end

  scenario "with duplicate email" do
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