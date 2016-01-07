require 'rails_helper'

feature "Article Process:", js: true do

  before do
    @admin = create(:admin)
    visit root_path
    click_link "Login"
    fill_in :user_email, with: @admin.email
    fill_in :user_password, with: "password"
    click_button "Sign in"
    expect(current_path).to eq('/')
    expect(page).to have_content("Signed in successfully")
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
    @article = create(:article)
    visit articles_path
    click_link "New Article"
    fill_in :article_title, with: @article.title
    fill_in :article_body, with: @article.body
    click_button "Submit" 
    click_link "Edit Article"
    fill_in "Title", with: "Edit Article Title"
    fill_in "Body", with: "This is a new article for FantasyMetrix."
    click_button "Submit"

    expect(page).to have_content("Article was successfully updated.")
  end

  scenario "admin user deletes article" do
    @article = create(:article)
    visit articles_path
    click_link "New Article"
    fill_in :article_title, with: @article.title
    fill_in :article_body, with: @article.body
    click_button "Submit"
    click_link "Delete Article"
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content("Article was successfully deleted.")
  end
end