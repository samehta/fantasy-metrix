require 'rails_helper'

feature "Post User Process:", js: true do

  before do
    user = create(:user)
    visit root_path
    login(user)
  end

  scenario "user creates new post" do
    topic = create(:topic)
    visit topic_path(topic)
    click_link "New Post"
    fill_in "Title", with: "First Post"
    fill_in "Body", with: "The is the first official post of FantasyMetrix"
    click_button "Submit"

    expect(page).to have_content("Post was successfully created.")
  end

  scenario "user edits post" do
    topic = create(:topic)
    visit topic_path(topic)
    click_link "New Post"
    fill_in "Title", with: "First Post"
    fill_in "Body", with: "The is the first official post of FantasyMetrix"
    click_button "Submit" 
    click_link "Edit Post"
    fill_in "Title", with: "Edit First Post"
    fill_in "Body", with: "The is a new post for FantasyMetrix"
    click_button "Submit"

    expect(page).to have_content("Post was successfully updated.")
  end

  scenario "user deletes post" do
    topic = create(:topic)
    visit topic_path(topic)
    click_link "New Post"
    fill_in "Title", with: "First Post"
    fill_in "Body", with: "The is the first official post of FantasyMetrix"
    click_button "Submit"
    accept_alert("Are you sure you want to delete this post?") do
      click_link "Delete Post"
    end

    expect(page).to have_content("Post was successfully deleted.")
  end

  # scenario "user cannot edit someone else's post" do 
  # end

  # scenario "user cannot delete someone else's post" do
  # end
end