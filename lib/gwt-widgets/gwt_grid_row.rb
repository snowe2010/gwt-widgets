module GwtWidgets
  class GwtGridRow < PageObject::Elements::TableRow

    attr_reader :container

    def initialize(element, container,  platform)
      @element = element
      @container = container
      include_platform_for platform
    end

    def parent

    end
    protected

    def initialize_cell(row_element, platform)
      PageObject::Elements::TableCell.new(row_element, platform)
    end

    def include_platform_for platform
      super
      if platform[:platform] == :watir_webdriver
        require 'gwt-widgets/platforms/watir_webdriver/gwt_grid_row'
        self.class.send :include, GwtWidgets::Platforms::WatirWebDriver::GwtGridRow
      elsif platform[:platform] == :selenium_webdriver
        require 'gwt-widgets/platforms/selenium_webdriver/gwt_grid_row'
        self.class.send :include, GwtWidgets::Platforms::SeleniumWebDriver::GwtGridRow
      else
        raise ArgumentError, "expect platform to be :watir_webdriver or :selenium_webdriver"
      end
    end
  end
end
