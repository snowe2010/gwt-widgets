require 'watir-webdriver'
require 'page-object/platforms/watir_webdriver/table'
require 'gwt-widgets/gwt_grid_group'
require 'gwt-widgets/platforms/selenium_webdriver/gwt_grouping_grid'
require 'gwt-widgets/platforms/watir_webdriver/gwt_grouping_grid'

module GwtWidgets
  class GwtGroupingGrid < GwtWidgets::GwtGrid

    PageObject.register_widget :gwt_grouping_grid, GwtGroupingGrid, 'div'
    attr_reader :current_platform

    def initialize(element, platform)
      super(element,platform)
      @current_platform = platform
    end

    def groups
      get_groups.map do |group|
        initialize_group(group, @current_platform)
      end
    end

    def group(group_index)
      group_index = find_group_index_by_title(group_index, groups) if group_index.kind_of?(String)
      return nil unless group_index
      groups[group_index]
    end

    def initialize_group(group_element, platform)
      Object::GwtWidgets::GwtGridGroup.new(group_element, self, platform)
    end


    def find_group_index_by_title(group_name, group_elements)
      group_elements.find_index { |grp|
        grp.name.include? group_name }
    end

    def include_platform_for platform
      super
      if platform[:platform] == :watir_webdriver
        require 'gwt-widgets/platforms/watir_webdriver/gwt_grid'
        self.class.send :include, GwtWidgets::Platforms::WatirWebDriver::GwtGroupingGrid
      elsif platform[:platform] == :selenium_webdriver
        require 'gwt-widgets/platforms/selenium_webdriver/gwt_grid'
        self.class.send :include, GwtWidgets::Platforms::SeleniumWebDriver::GwtGroupingGrid
      else
        raise ArgumentError, "expect platform to be :watir_webdriver or :selenium_webdriver"
      end
    end
  end
end
