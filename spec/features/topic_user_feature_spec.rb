require 'rails_helper'

feature "Topic User Process:", js: true do

  before do
    user = create(:user)
    visit root_path
    click_link "Login"
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    click_button "Sign in"
    expect(current_path).to eq('/')
    expect(page).to have_content("Signed in successfully.")
  end

  scenario "user views topic index page" do
    topic = create(:topic)
    visit topics_path

    expect(page).to have_content("First Topic")
    expect(page).to_not have_content("New Topic")
  end

  scenario "user views topic show page" do
    topic = create(:topic)
    visit topics_path
    click_link "First Topic"

    expect(page).to have_content("First Topic")
    expect(page).to_not have_content("Edit Topic")
    expect(page).to_not have_content("Delete Topic")
  end

end