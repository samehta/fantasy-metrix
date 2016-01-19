require 'rails_helper'

feature "Topic User Process:", js: true do

  before do
    user = create(:user)
    visit root_path
    login(user)
  end

  scenario "user views topic index page" do
    topic = create(:topic)
    visit topics_path

    expect(page).to have_content("First Topic")
    expect(page).to_not have_link("New Topic")
  end

  scenario "user views topic show page" do
    topic = create(:topic)
    visit topics_path
    click_link "First Topic"

    expect(page).to have_content("First Topic")
    expect(page).to_not have_link("Edit Topic")
    expect(page).to_not have_link("Delete Topic")
  end
end