require 'rails_helper'

feature "User views topic", js: true do

  before do
    user = create(:user)
    visit root_path
    login(user)
  end

  scenario "index page" do
    topic = create(:topic)
    visit topics_path

    expect(page).to have_content("Topic Name")
    expect(page).to_not have_link("New Topic")
  end

  scenario "show page" do
    topic = create(:topic)
    visit topics_path
    click_link "Topic Name"

    expect(page).to have_content("Topic Name")
    expect(page).to_not have_link("Edit Topic")
    expect(page).to_not have_link("Delete Topic")
  end
end