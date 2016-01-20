require 'rails_helper'

feature "Admin deletes post", js: true do

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
    accept_alert("Are you sure you want to delete this post?") do
      click_link "Delete Post"
    end

    expect(page).to have_content("Post was successfully deleted.")
  end
end