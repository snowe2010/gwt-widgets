Given /^I am on the Gwt Examples page$/ do
  @page = visit_page GwtExamplesPage
end

Then /^I should know it is visible$/ do
  @element.should be_visible
end

Then /^I should know it exists$/ do
  @element.should exist
end