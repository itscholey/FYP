# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Meetings" do
    describe "Admin" do
      describe "meetings", type: :feature do
        refinery_login

        describe "meetings list" do
          before do
            FactoryGirl.create(:meeting, :meeting_title => "UniqueTitleOne")
            FactoryGirl.create(:meeting, :meeting_title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.meetings_admin_meetings_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.meetings_admin_meetings_path

            click_link "Add New Meeting"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Meeting Title", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::Meetings::Meeting, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::Meetings::Meeting, :count)

              expect(page).to have_content("Meeting Title can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:meeting, :meeting_title => "UniqueTitle") }

            it "should fail" do
              visit refinery.meetings_admin_meetings_path

              click_link "Add New Meeting"

              fill_in "Meeting Title", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::Meetings::Meeting, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:meeting, :meeting_title => "A meeting_title") }

          it "should succeed" do
            visit refinery.meetings_admin_meetings_path

            within ".actions" do
              click_link "Edit this meeting"
            end

            fill_in "Meeting Title", :with => "A different meeting_title"
            click_button "Save"

            expect(page).to have_content("'A different meeting_title' was successfully updated.")
            expect(page).not_to have_content("A meeting_title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:meeting, :meeting_title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.meetings_admin_meetings_path

            click_link "Remove this meeting forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Meetings::Meeting.count).to eq(0)
          end
        end

      end
    end
  end
end
