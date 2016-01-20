require 'rails_helper'

feature "Admin creates topic", js: true do

  before do
    admin = create(:admin)
    visit root_path
    login(admin)
  end

  scenario do
    visit topics_path
    click_link "New Topic"
    fill_in "Name", with: "Topic"
    click_button "Save"

    expect(page).to have_content("Topic was successfully created.")
  end
end