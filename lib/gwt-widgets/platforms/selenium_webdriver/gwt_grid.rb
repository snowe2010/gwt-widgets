require "gwt-widgets/gwt_grid_row"
require 'gwt-widgets/gwt_grid_header_row'
require 'gwt-widgets/platforms/selenium_webdriver/row_container'
module GwtWidgets
  module Platforms
    module SeleniumWebDriver
      module GwtGrid
        include GwtWidgets::Platforms::SeleniumWebDriver::RowContainer

        def header
          initialize_header(table_rows[0], :platform => :selenium_webdriver)
        end

      end
    end
  end
end


