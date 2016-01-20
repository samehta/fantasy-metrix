require 'rails_helper'

feature "Admin updates post", js: true do

  before do
    admin = create(:admin)
    visit root_path
    login(admin)
  end

  scenario do
    topic = create(:topic)
    visit topic_path(topic)
    post = create(:post, topic: topic)
    visit topic_post_path(post.topic, post) 
    click_link "Edit Post"
    fill_in "Title", with: "Post Title Update"
    fill_in "Body", with: "The is a new post for FantasyMetrix"
    click_button "Submit"

    expect(page).to have_content("Post was successfully updated.")
  end
end