class BasicGridExample
  include PageObject

  gwt_grid(:grid, :class => "x-grid3")
  gwt_column_menu(:column_menu, :xpath=>"//div[contains(@class,' x-menu-list')]")
  gwt_column_selection_menu(:column_selection_menu, :xpath=>"(//div[contains(@class,'x-menu-list') and not(contains(@class, 'x-menu-list-item'))])[2]")


end