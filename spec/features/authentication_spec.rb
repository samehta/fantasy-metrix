require 'rails_helper'

feature "Sign Up Process:" do
  
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


feature "Sign In Process:" do
  
  before do
    @user = create(:user)
    visit root_path
    click_link "Login"
    fill_in :user_email, with: @user.email
    fill_in :user_password, with: "password"
    click_button "Sign in"
    expect(current_path).to eq('/')
    expect(page).to have_content("Signed in successfully")
  end

  scenario "displays username when signed in" do
    expect(page).to have_content("#{@user.username}!")
  end
  
  scenario "user signs out" do
    click_link "Logout"
    find_link("Login").visible?
    find_link("Sign Up").visible?
  end
end