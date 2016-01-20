require 'rails_helper'

feature "User views article", js: true do

  before do
    user = create(:user)
    visit root_path
    login(user)
  end

  scenario "index page" do
    article = create(:article)
    visit articles_path

    expect(page).to have_content("Article Title")
    expect(page).to_not have_link("New Article")
  end

  scenario "show page" do
    article = create(:article)
    visit articles_path
    click_link "Article Title"

    expect(page).to have_content("Article Title")
    expect(page).to have_content("This is the first official Article of FantasyMetrix.")
    expect(page).to have_content(article.user.username)
    expect(page).to_not have_link("Edit Article")
    expect(page).to_not have_link("Delete Article")
  end
end