require 'rails_helper'

describe "As an admin" do
  describe "when I visit a cohort show page" do
    it "I can make assignments" do
      VCR.use_cassette('features/admin/make_assignments') do
        cohort = CensusCohort.create_from_name("1407-BE")
        admin  = User.create(role: "admin")

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit(admin_cohort_path(cohort.id))

        students = cohort.users

        check("student-#{students[0].id}")
        check("student-#{students[1].id}")
        check("student-#{students[2].id}")

        click_on "Create Assignments"

        expect(page).to have_content("Assignments successfully created.")
        expect(Assignment.count).to eq(6)
      end
    end
  end
end
