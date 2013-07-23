module GwtWidgets
  class GwtPager < PageObject::Elements::Div
    PageObject.register_widget :gwt_pager, GwtPager, 'table'

    def first
      first_cell = cell_elements(:class=>"x-toolbar-cell")[0]
      first_cell.button_element(:tag_name=>"button").click
    end

    def previous
      next_cell = cell_elements(:class=>"x-toolbar-cell")[1]
      next_cell.button_element(:tag_name=>"button").click
    end

    def last
      next_cell = cell_elements(:class=>"x-toolbar-cell")[8]
      next_cell.button_element(:tag_name=>"button").click
    end

    def next
      next_cell = cell_elements(:class=>"x-toolbar-cell")[7]
      next_cell.button_element(:tag_name=>"button").click
    end

    def page
      page_cell = cell_elements(:class=>"x-toolbar-cell")[4]
      page_cell.text_field_element.value
    end

    def page=(page_number)
      page_cell = cell_elements(:class=>"x-toolbar-cell")[4]
      page_cell.text_field_element.value=page_number
      page_cell.text_field_element.send_keys :return
    end
  end
end
