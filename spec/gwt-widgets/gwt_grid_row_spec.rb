require 'page-object/elements'
require "gwt-widgets/gwt_grid_row"

describe GwtWidgets::GwtGridRow do
  let(:table_cell) { double('table_cell') }
  let(:table_row_driver) { double('table_row_driver') }
  let(:table) { double('table') }

  describe "interface" do

    context "for selenium" do
      it "should return a table cell when indexed" do
        table_row = GwtWidgets::GwtGridRow.new(table_row_driver, table, :platform => :selenium_webdriver)
        table_row.stub(:columns).and_return(2)
        table_row_driver.should_receive(:find_elements).with(:xpath, ".//child::td|th").and_return(table_cell)
        table_cell.should_receive(:[]).and_return(table_cell)
        table_row[0].should be_instance_of PageObject::Elements::TableCell
      end

      it "should return the number of columns" do
        table_row = GwtWidgets::GwtGridRow.new(table_row_driver, table, :platform => :selenium_webdriver)
        table_row_driver.should_receive(:find_elements).with(:xpath, ".//child::td|th").and_return(table_row_driver)
        table_row_driver.should_receive(:size).and_return(3)
        table_row.columns.should == 3
      end

      it "should iterate over the table columns" do
        table_row = GwtWidgets::GwtGridRow.new(table_row_driver, table, :platform => :selenium_webdriver)
        table_row.should_receive(:columns).and_return(2)
        table_row.stub(:[]).and_return(table_row_driver)
        count = 0
        table_row.each { |e| count += 1 }
        count.should == 2
      end
    end

    context "for watir" do
      before(:each) do
        table_row_driver.stub(:find_elements).and_return(table_row_driver)
      end

      it "should return a table cell when indexed" do
        table_row = GwtWidgets::GwtGridRow.new(table_row_driver, table, :platform => :watir_webdriver)
        table_row.stub(:columns).and_return(2)
        table_row_driver.should_receive(:[]).with(1).and_return(table_cell)
        table_row[1].should be_instance_of PageObject::Elements::TableCell
      end

      it "should return the number of columns" do
        table_row = GwtWidgets::GwtGridRow.new(table_row_driver, table, :platform => :watir_webdriver)
        table_row_driver.stub(:wd).and_return(table_row_driver)
        table_row_driver.should_receive(:find_elements).with(:xpath, ".//child::td|th").and_return(table_row_driver)
        table_row_driver.should_receive(:size).and_return(3)
        table_row.columns.should == 3
      end

      it "should iterate over the table columns" do
        table_row = GwtWidgets::GwtGridRow.new(table_row_driver, table, :platform => :watir_webdriver)
        table_row.should_receive(:columns).and_return(2)
        table_row.stub(:[])
        count = 0
        table_row.each { |e| count += 1 }
        count.should == 2
      end
    end
  end
end
