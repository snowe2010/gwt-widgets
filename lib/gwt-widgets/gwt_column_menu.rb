module GwtWidgets
  class GwtColumnMenu < PageObject::Elements::Div
    include ::GwtWidgets::SortableColumn

    PageObject.register_widget(:gwt_column_menu, GwtColumnMenu, 'div')

    def open_column_selection_menu
      link_element(:text=>"Columns").hover
    end
  end
end
