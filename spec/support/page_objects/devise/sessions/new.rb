require_relative "../../pages/base"

module PageObjects
  module Devise
    module Sessions
      class New < Base
        def sign_in(email, password)
          within(".new_user") do
            fill_in 'Email', :with => "user@example.com"
            fill_in 'Password', :with => "password"
          end
          click_button "Log in"
        end
      end
    end
  end
end
