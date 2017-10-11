require "rails_helper"

RSpec.feature "User authentication" do
  scenario "exsiting user signs in" do
    create(:user, email: "user@example.com", password: "password")
    visit "/users/sign_in"
    within(".new_user") do
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
    end
    click_button "Log in"
    expect(page).to have_text "user@example.com"
  end
end
