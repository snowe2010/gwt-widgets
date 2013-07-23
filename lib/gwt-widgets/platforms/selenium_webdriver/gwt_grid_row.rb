require "page-object/platforms/selenium_webdriver/table_row"
module GwtWidgets
  module Platforms
    module SeleniumWebDriver
      module GwtGridRow
        include PageObject::Platforms::SeleniumWebDriver::TableRow

        def find_index_by_title(title)
          first_row = @container.first_row
          first_row.find_index {|column| column.text.include? title }
        end
      end
    end
  end
end
