require "gwt-widgets/gwt_grid_row"
require 'gwt-widgets/gwt_grid_header_row'
require 'gwt-widgets/platforms/watir_webdriver/row_container'
module GwtWidgets
  module Platforms
    module WatirWebDriver
      module GwtGrid
        include GwtWidgets::Platforms::WatirWebDriver::RowContainer

        def header
          initialize_header(row_collection[0], :platform => :watir_webdriver)
        end
      end
    end
  end
end


