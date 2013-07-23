module GwtWidgets
  class GwtGroupColumnMenu < GwtWidgets::GwtColumnMenu
    include ::GwtWidgets::GroupableColumn

    PageObject.register_widget(:gwt_group_column_menu, GwtGroupColumnMenu, 'div')

  end
end
