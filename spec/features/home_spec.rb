require "rails_helper"

RSpec.describe "Home" do
  scenario "has navbar element" do
    home_page.go
    expect(page).to have_css "nav.navbar"
  end

  scenario "welcomes user" do
    home_page.go
    expect(page).to have_text "welcome"
  end

  def home_page
    PageObjects::Pages::Home.new
  end
end
