require "page-object/platforms/selenium_webdriver/table_row"
require 'gwt-widgets/platforms/selenium_webdriver/row_container'
module GwtWidgets
  module Platforms
    module SeleniumWebDriver
      module GwtGroupingGrid
        include GwtWidgets::Platforms::SeleniumWebDriver::RowContainer

        private

        def get_groups
          element.find_elements(:xpath, "//div[contains(@class, 'x-grid-group ')]")
        end

      end
    end
  end
end
