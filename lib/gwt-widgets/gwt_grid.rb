require 'watir-webdriver'
require 'page-object/platforms/watir_webdriver/table'
require 'gwt-widgets/row_container'
module GwtWidgets
  class GwtGrid < GwtWidgets::RowContainer

    PageObject.register_widget :gwt_grid, GwtGrid, 'div'

    def initialize_header(header_element, platform)
      Object::GwtWidgets::GwtGridHeaderRow.new(header_element, self, platform)
    end

    def include_platform_for platform
      super
      if platform[:platform] == :watir_webdriver
        require 'gwt-widgets/platforms/watir_webdriver/gwt_grid'
        self.class.send :include, GwtWidgets::Platforms::WatirWebDriver::GwtGrid
      elsif platform[:platform] == :selenium_webdriver
        require 'gwt-widgets/platforms/selenium_webdriver/gwt_grid'
        self.class.send :include, GwtWidgets::Platforms::SeleniumWebDriver::GwtGrid
      else
        raise ArgumentError, "expect platform to be :watir_webdriver or :selenium_webdriver"
      end
    end
  end
end
