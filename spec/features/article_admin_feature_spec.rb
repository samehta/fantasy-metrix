require 'rails_helper'

feature "Article Admin Process:", js: true do

  before do
    admin = create(:admin)
    visit root_path
    login(admin)
  end

  scenario "admin user creates new article" do
    visit articles_path
    click_link "New Article"
    fill_in "Title", with: "Article Title"
    fill_in "Body", with: "This is the first official article of FantasyMetrix."
    click_button "Submit"

    expect(page).to have_content("Article was successfully created.")
  end

  scenario "admin user edits article" do
    article = create(:article)
    visit article_path(article)
    click_link "Edit Article"
    fill_in "Title", with: "Edit Article Title"
    fill_in "Body", with: "This is a new article for FantasyMetrix."
    click_button "Submit"

    expect(page).to have_content("Article was successfully updated.")
  end

  scenario "admin user deletes article" do
    article = create(:article)
    visit article_path(article)
    accept_alert("Are you sure you want to delete this article?") do
      click_link "Delete Article"
    end
    
    expect(page).to have_content("Article was successfully deleted.")
  end
end