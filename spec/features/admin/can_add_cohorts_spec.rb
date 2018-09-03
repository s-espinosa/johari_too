require 'rails_helper'

describe "As an admin" do
  describe "when I visit the cohorts path" do
    it "I can add a cohort" do
      VCR.use_cassette('features/admin/add_cohort') do
        admin = User.new(role: "admin")
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit admin_cohorts_path
        fill_in 'cohort_name', with: "1407-BE"
        click_on "Add Cohort"

        expect(page).to have_content("Successfully added 1407-BE")
        expect(page).to have_link("1407-BE")
      end
    end

    it "I get an error if I try to add a cohort that doesn't exist" do
      VCR.use_cassette('features/admin/add_cohort_failure') do
        admin = User.new(role: "admin")
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit admin_cohorts_path
        fill_in 'cohort_name', with: "NONSENSE"
        click_on "Add Cohort"

        expect(page).to have_content("Sorry. Something went wrong. Check to see if the cohort you are trying to create exists on Census and is spelled correctly.")
      end
    end
  end
end
