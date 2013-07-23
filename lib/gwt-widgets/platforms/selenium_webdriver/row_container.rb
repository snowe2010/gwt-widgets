require "gwt-widgets/gwt_grid_row"
require 'gwt-widgets/gwt_grid_header_row'
require 'page-object/platforms/selenium_webdriver/table'
module GwtWidgets
  module Platforms
    module SeleniumWebDriver
      module RowContainer
        include PageObject::Platforms::SeleniumWebDriver::Table

        def [](idx)
          eles = table_rows
          idx = find_index_by_title(idx, eles) if idx.kind_of?(String)
          return nil unless idx
          initialize_row(eles[idx], :platform => :selenium_webdriver)
        end

      end
    end
  end
end


