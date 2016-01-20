require 'rails_helper'

feature "Admin updates topic", js: true do

  before do
    admin = create(:admin)
    visit root_path
    login(admin)
  end

  scenario do
    topic = create(:topic)
    visit topic_path(topic)
    click_link "Edit Topic"
    fill_in "Name", with: "Topic Name"
    click_button "Save"

    expect(page).to have_content("Topic Name was successfully updated.")
  end
end