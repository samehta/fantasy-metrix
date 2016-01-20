require 'rails_helper'

feature "Admin deletes topic", js: true do

  before do
    admin = create(:admin)
    visit root_path
    login(admin)
  end

  scenario do
    topic = create(:topic)
    visit topic_path(topic)
    accept_alert("Are you sure you want to delete this topic?") do
      click_link "Delete Topic"
    end
    
    expect(page).to have_content("Topic was successfully deleted.")
  end
end