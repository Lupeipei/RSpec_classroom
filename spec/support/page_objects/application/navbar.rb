require_relative "../pages/base"

module PageObjects
  module Application
    class Navbar < Base
      def sign_in
        click_on "Login"
        PageObjects::Devise::Sessions::New.new
      end

      def sign_out(email)
        user_dropdown(email).click_on "Logout"
      end

      def user_dropdown(email)
        dropdown email
      end

      def dropdown(text)
        find ".navbar .dropdown", text: text
      end
    end
  end
end
