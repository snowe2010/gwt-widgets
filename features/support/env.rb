$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))

require 'rspec/expectations'
require 'page-object'
require 'page-object/page_factory'
require 'gwt-widgets'

World(PageObject::PageFactory)
