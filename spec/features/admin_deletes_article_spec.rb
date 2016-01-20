require 'rails_helper'

feature "Admin deletes article", js: true do

  before do
    admin = create(:admin)
    visit root_path
    login(admin)
  end

  scenario do
    article = create(:article)
    visit article_path(article)
    accept_alert("Are you sure you want to delete this article?") do
      click_link "Delete Article"
    end
    
    expect(page).to have_content("Article was successfully deleted.")
  end
end