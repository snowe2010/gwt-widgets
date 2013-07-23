class LocalPaginationExample
  include PageObject

  gwt_grid(:grid, :class => "x-grid3")
  gwt_pager(:pager, :class =>"x-toolbar-ct")
end