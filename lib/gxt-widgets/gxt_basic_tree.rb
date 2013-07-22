require 'watir-webdriver'
require 'page-object/platforms/watir_webdriver/table'
require 'gxt-widgets/row_container'
module GxtWidgets
  class GxtBasicTree < PageObject::Elements::Div

    PageObject.register_widget :gxt_basic_tree, GxtBasicTree, 'div'

    def child_nodes
      self.gxt_basic_tree_elements(:xpath=>child_node_xpath)
    end

    def name
      node_contents.span_element(:class=>"x-tree3-node-text").text
    end

    def node(node_name)
      node_index = child_nodes.find_index do |node|
        node.name == node_name
      end
      child_nodes[node_index]
    end

    def joint
      # node_contents.image_element(:xpath=>".//*[ancestor::tr//img[1]]")
      node_contents.image_element(:xpath=> "ancestor-or-self::tr[1]//img[1]")
    end

    def expand
      joint.click unless self.expanded?
      # joint.click
    end

    def expanded?
       self.node_container.visible?
    end

    def collapse
      joint.click unless self.collapsed?
      # joint.click
    end

    def collapsed?
      !self.node_container.visible?
    end

    #this is correct
    def node_contents
      # self.div_element(:xpath=>".//div[contains(@class,'x-tree3-el')]")
      self.div_element(:xpath=>".//div[contains(@class,'gwt-TreeItem')]")
    end

    def node_container
      # self.div_element(:xpath=>".//div[contains(@class,'x-tree3-node-ct')]")
      self.div_element(:xpath=>".//table/following::div[1]")
    end

    @protected
    #this is correct?
    def child_node_xpath
      ".//child::div[contains(@class,'x-tree3-node')]"
    end

    def child_leaf_xpath
      ".//child::div[containts(@class, 'x-tree3-el')]"
    end
  end
end
