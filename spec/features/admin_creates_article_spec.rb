require 'rails_helper'

feature "Admin creates article", js: true do

  before do
    admin = create(:admin)
    visit root_path
    login(admin)
  end

  scenario do
    visit articles_path
    click_link "New Article"
    fill_in "Title", with: "Article Title"
    fill_in "Body", with: "This is the first official article of FantasyMetrix."
    click_button "Submit"

    expect(page).to have_content("Article was successfully created.")
  end
end