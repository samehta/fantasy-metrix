require 'rails_helper'

feature "User updates post", js: true do

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
    click_link "Edit Post"
    fill_in "Title", with: "Post Title Update"
    fill_in "Body", with: "The is a new post for FantasyMetrix"
    click_button "Submit"

    expect(page).to have_content("Post was successfully updated.")
  end
end