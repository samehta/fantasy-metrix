require 'rails_helper'

feature "Post Admin Process:", js: true do

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

  scenario "admin user creates new post" do
    topic = create(:topic)
    visit topic_path(topic)
    click_link "New Post"
    fill_in "Title", with: "First Post"
    fill_in "Body", with: "The is the first official post of FantasyMetrix"
    click_button "Submit"

    expect(page).to have_content("Post was successfully created.")
  end

  scenario "admin user edits post" do
    topic = create(:topic)
    visit topic_path(topic)
    post = create(:post, topic: topic)
    visit topic_post_path(post.topic, post) 
    click_link "Edit Post"
    fill_in "Title", with: "Edit First Post"
    fill_in "Body", with: "The is a new post for FantasyMetrix"
    click_button "Submit"

    expect(page).to have_content("Post was successfully updated.")
  end

  scenario "admin user deletes post" do
    topic = create(:topic)
    visit topic_path(topic)
    post = create(:post, topic: topic)
    visit topic_post_path(post.topic, post)
    accept_alert("Are you sure you want to delete this post?") do
      click_link "Delete Post"
    end

    expect(page).to have_content("Post was successfully deleted.")
  end

  # scenario "admin user edits any user's post" do
  # end

  # scenario "admin user deletes any user's post" do 
  # end
end