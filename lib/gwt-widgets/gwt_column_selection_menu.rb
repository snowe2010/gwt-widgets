module GwtWidgets
  class GwtColumnSelectionMenu  < PageObject::Elements::Div
    include ::GwtWidgets::SelectableColumn

    PageObject.register_widget(:gwt_column_selection_menu, GwtColumnSelectionMenu, 'div')
  end
end
