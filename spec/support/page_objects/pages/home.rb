require_relative "base"

module PageObjects
  module Pages
    class Home < Base
      def go
        visit root_url
      end
    end
  end
end
