module LoginHelper
  def login(admin)
    click_link "Login"
    fill_in :user_email, with: admin.email
    fill_in :user_password, with: admin.password
    click_button "Sign in"
    expect(current_path).to eq('/')
    expect(page).to have_content("Signed in successfully.")
  end

  def login(user)
    click_link "Login"
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    click_button "Sign in"
    expect(current_path).to eq('/')
    expect(page).to have_content("Signed in successfully.")
  end
end

RSpec.configure do |config|
  # Make the LoginHelper methods available to all feature specs
  config.include LoginHelper, type: :feature
end