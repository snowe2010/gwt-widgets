module GwtWidgets
  module Platforms
    module SeleniumWebDriver
      module GwtGridHeaderRow
        include GwtWidgets::Platforms::SeleniumWebDriver::GwtGridRow

        #
        # Return the PageObject::Elements::TableCell for the index provided.  Index
        # is zero based.  If the index provided is a String then it
        # will be matched with the text from the columns in the first row.
        # The text can be a substring of the full column text.
        #
        def [](idx)
          els = table_cells
          idx = find_index_by_title(idx) if idx.kind_of?(String)
          return nil unless idx  && columns >= idx + 1
          initialize_cell(els[idx], :platform => :selenium_webdriver)
        end

      end
    end
  end
end