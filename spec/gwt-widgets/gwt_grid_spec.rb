require 'gwt-widgets'

describe GwtWidgets do

  describe "interface" do
    let(:gwt_grid_element) { double('gwt_grid_element') }

    before(:each) do
      gwt_grid_element.stub(:find_elements).and_return(gwt_grid_element)
    end

    context "for watir" do
      let(:watir_gwt_grid) { GwtWidgets::GwtGrid.new(gwt_grid_element, :platform => :watir_webdriver) }

      before(:each) do
        gwt_grid_element.stub(:trs).and_return(gwt_grid_element)
      end

      it "should return a table row when indexed" do
        gwt_grid_element.stub(:[]).with(1).and_return(gwt_grid_element)
        watir_gwt_grid[1].should be_instance_of GwtWidgets::GwtGridRow
      end

      it "should return the first row" do
        gwt_grid_element.stub(:[]).with(0).and_return(gwt_grid_element)
        watir_gwt_grid.first_row.should be_instance_of GwtWidgets::GwtGridRow
      end

      it "should return the last row" do
        gwt_grid_element.stub(:[]).with(-1).and_return(gwt_grid_element)
        watir_gwt_grid.last_row.should be_instance_of GwtWidgets::GwtGridRow
      end

      it "should return the number of rows" do
        gwt_grid_element.stub(:wd).and_return(gwt_grid_element)
        gwt_grid_element.should_receive(:find_elements).with(:xpath, ".//descendant::tr").and_return(gwt_grid_element)
        gwt_grid_element.should_receive(:size).and_return(2)
        watir_gwt_grid.rows.should == 2
      end

      it "should iterate over the table rows" do
        watir_gwt_grid.should_receive(:rows).and_return(2)
        gwt_grid_element.should_receive(:[]).twice
        count = 0
        watir_gwt_grid.each { |e| count += 1 }
        count.should == 2
      end

      it "should return a header row" do
        gwt_grid_element.stub(:header).and_return(gwt_grid_element)
        gwt_grid_element.should_receive(:[]).with(0)
        watir_gwt_grid.header.should be_instance_of GwtWidgets::GwtGridHeaderRow
      end
    end

    context "for selenium" do
      before(:each) do
        gwt_grid_element.stub(:[]).and_return(gwt_grid_element)
      end
      let(:selenium_gwt_grid) { GwtWidgets::GwtGrid.new(gwt_grid_element, :platform => :selenium_webdriver) }

      it "should return a table row when indexed" do
        gwt_grid_element.should_receive(:find_elements).with(:xpath, ".//descendant::tr").and_return(gwt_grid_element)
        selenium_gwt_grid[1].should be_instance_of GwtWidgets::GwtGridRow
      end

      it "should return the first row" do
        gwt_grid_element.stub(:[]).with(0).and_return(gwt_grid_element)
        selenium_gwt_grid.first_row.should be_instance_of GwtWidgets::GwtGridRow
      end

      it "should return the last row" do
        gwt_grid_element.stub(:[]).with(-1).and_return(gwt_grid_element)
        selenium_gwt_grid.last_row.should be_instance_of GwtWidgets::GwtGridRow
      end

      it "should return the number of rows" do
        gwt_grid_element.should_receive(:find_elements).with(:xpath, ".//descendant::tr").and_return(gwt_grid_element)
        gwt_grid_element.should_receive(:size).and_return(2)
        selenium_gwt_grid.rows.should == 2
      end

      it "should iterate over the table rows" do
        selenium_gwt_grid.should_receive(:rows).and_return(2)
        count = 0
        selenium_gwt_grid.each { |e| count += 1 }
        count.should == 2
      end

      it "should return a header row" do
        gwt_grid_element.stub(:header).and_return(gwt_grid_element)
        selenium_gwt_grid.header.should be_instance_of GwtWidgets::GwtGridHeaderRow
      end
    end
  end
end
