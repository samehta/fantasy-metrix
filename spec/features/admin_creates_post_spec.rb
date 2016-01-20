require 'rails_helper'

feature "Admin creates post", js: true do

  before do
    admin = create(:admin)
    visit root_path
    login(admin)
  end

  scenario do
    topic = create(:topic)
    visit topic_path(topic)
    click_link "New Post"
    fill_in "Title", with: "Post Title"
    fill_in "Body", with: "The is the first official post of FantasyMetrix"
    click_button "Submit"

    expect(page).to have_content("Post was successfully created.")
  end
end