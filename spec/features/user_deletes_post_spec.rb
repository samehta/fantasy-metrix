require 'rails_helper'

feature "User deletes post", js: true do

  before do
    user = create(:user)
    visit root_path
    login(user)
  end

  scenario do
    topic = create(:topic)
    visit topic_path(topic)
    click_link "New Post"
    fill_in "Title", with: "Post Title"
    fill_in "Body", with: "The is the first official post of FantasyMetrix"
    click_button "Submit"
    accept_alert("Are you sure you want to delete this post?") do
      click_link "Delete Post"
    end

    expect(page).to have_content("Post was successfully deleted.")
  end
end