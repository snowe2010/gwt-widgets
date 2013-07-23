require 'gwt-widgets/gwt_header_cell'
module GwtWidgets
  class GwtGridHeaderRow < GwtGridRow
    protected

    def initialize_cell(row_element, platform)
      Object::GwtWidgets::GwtHeaderCell.new(row_element, platform)
    end

    def include_platform_for platform
      super
      if platform[:platform] == :watir_webdriver
        require 'gwt-widgets/platforms/watir_webdriver/gwt_grid_header_row'
        self.class.send :include, GwtWidgets::Platforms::WatirWebDriver::GwtGridHeaderRow
      elsif platform[:platform] == :selenium_webdriver
        require 'gwt-widgets/platforms/selenium_webdriver/gwt_grid_header_row'
        self.class.send :include, GwtWidgets::Platforms::SeleniumWebDriver::GwtGridHeaderRow
      else
        raise ArgumentError, "expect platform to be :watir_webdriver or :selenium_webdriver"
      end
    end
  end
end
