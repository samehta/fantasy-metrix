require 'rails_helper'

feature "Article User Process:", js: true do

  before do
    user = create(:user)
    visit root_path
    click_link "Login"
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    click_button "Sign in"
    expect(current_path).to eq('/')
    expect(page).to have_content("Signed in successfully.")
  end

  scenario "user views article index page" do
    article = create(:article)
    visit articles_path

    expect(page).to have_content("First Article Title")
  end

  scenario "user views article show page" do
    article = create(:article)
    visit articles_path
    click_link "First Article Title"

    expect(page).to have_content(article.user.username)
    expect(page).to have_content("First Article Title")
    expect(page).to have_content("This is the first official Article of FantasyMetrix.")
  end

end