# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Brokers" do
    describe "Admin" do
      describe "brokers" do
        login_refinery_user

        describe "brokers list" do
          before do
            FactoryGirl.create(:broker, :name => "UniqueTitleOne")
            FactoryGirl.create(:broker, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.brokers_admin_brokers_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.brokers_admin_brokers_path

            click_link "Add New Broker"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Brokers::Broker.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Brokers::Broker.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:broker, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.brokers_admin_brokers_path

              click_link "Add New Broker"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Brokers::Broker.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:broker, :name => "A name") }

          it "should succeed" do
            visit refinery.brokers_admin_brokers_path

            within ".actions" do
              click_link "Edit this broker"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:broker, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.brokers_admin_brokers_path

            click_link "Remove this broker forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Brokers::Broker.count.should == 0
          end
        end

      end
    end
  end
end
