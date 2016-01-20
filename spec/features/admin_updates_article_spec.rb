require 'rails_helper'

feature "Admin updates article", js: true do

  before do
    admin = create(:admin)
    visit root_path
    login(admin)
  end

  scenario do
    article = create(:article)
    visit article_path(article)
    click_link "Edit Article"
    fill_in "Title", with: "Article Title Update"
    fill_in "Body", with: "This is a new article for FantasyMetrix."
    click_button "Submit"

    expect(page).to have_content("Article was successfully updated.")
  end
end