require 'gwt-widgets/platforms/watir_webdriver/row_container'
module GwtWidgets
  module Platforms
    module WatirWebDriver
      module GwtGroupingGrid
        include GwtWidgets::Platforms::WatirWebDriver::RowContainer

        private
        def get_groups
          element.divs(:xpath, "//div[contains(@class, 'x-grid-group ')]")
        end

      end
    end
  end
end
