require 'rails_helper'

feature "Article User Process:", js: true do

  before do
    user = create(:user)
    visit root_path
    login(user)
  end

  scenario "user views article index page" do
    article = create(:article)
    visit articles_path

    expect(page).to have_content("First Article Title")
    expect(page).to_not have_link("New Article")
  end

  scenario "user views article show page" do
    article = create(:article)
    visit articles_path
    click_link "First Article Title"

    expect(page).to have_content(article.user.username)
    expect(page).to have_content("First Article Title")
    expect(page).to have_content("This is the first official Article of FantasyMetrix.")
    expect(page).to_not have_link("Edit Article")
    expect(page).to_not have_link("Delete Article")
  end
end