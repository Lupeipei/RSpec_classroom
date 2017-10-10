require "rails_helper"

RSpec.describe "Homepage" do
  it "route root path to course #index " do
    expect(get: "/").to route_to(controller: "courses", action: "index")
  end
end
