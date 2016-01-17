require 'rails_helper'

feature "Topic Admin Process:", js: true do

  before do
    admin = create(:admin)
    visit root_path
    click_link "Login"
    fill_in :user_email, with: admin.email
    fill_in :user_password, with: admin.password
    click_button "Sign in"
    expect(current_path).to eq('/')
    expect(page).to have_content("Signed in successfully.")
  end

  scenario "admin user creates new topic" do
    visit topics_path
    click_link "New Topic"
    fill_in "Name", with: "New Topic"
    click_button "Save"

    expect(page).to have_content("Topic was successfully created.")
  end

  scenario "admin user edits topic" do
    topic = create(:topic)
    visit topic_path(topic)
    click_link "Edit Topic"
    fill_in "Name", with: "Edit Topic Name"
    click_button "Save"

    expect(page).to have_content("Edit Topic Name was successfully updated.")
  end

  scenario "admin user deletes topic" do
    topic = create(:topic)
    visit topic_path(topic)
    accept_alert("Are you sure you want to delete this topic?") do
      click_link "Delete Topic"
    end
    
    expect(page).to have_content("Topic was successfully deleted.")
  end
end