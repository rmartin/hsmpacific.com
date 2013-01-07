# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Properties" do
    describe "Admin" do
      describe "area_codes" do
        login_refinery_user

        describe "area_codes list" do
          before do
            FactoryGirl.create(:area_code, :name => "UniqueTitleOne")
            FactoryGirl.create(:area_code, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.properties_admin_area_codes_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.properties_admin_area_codes_path

            click_link "Add New Area Code"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Properties::AreaCode.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Properties::AreaCode.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:area_code, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.properties_admin_area_codes_path

              click_link "Add New Area Code"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Properties::AreaCode.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:area_code, :name => "A name") }

          it "should succeed" do
            visit refinery.properties_admin_area_codes_path

            within ".actions" do
              click_link "Edit this area code"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:area_code, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.properties_admin_area_codes_path

            click_link "Remove this area code forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Properties::AreaCode.count.should == 0
          end
        end

      end
    end
  end
end
