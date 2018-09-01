require 'rails_helper'

describe "As an admin" do
  describe "when I visit a cohort show page" do
    it "I can make assignments" do
      cohort    = Cohort.create(name: "1808-BE")
      student_1 = User.create(first_name: "Jane", last_name: "Johnson", cohort: cohort, census_id: 1)
      student_2 = User.create(first_name: "John", last_name: "Johnson", cohort: cohort, census_id: 2)
      student_3 = User.create(first_name: "Jessica", last_name: "Johnson", cohort: cohort, census_id: 3)
      User.create(first_name: "Jerry", last_name: "Johnson", cohort: cohort, census_id: 4)
      admin     = User.create(first_name: "Allison", last_name: "Reu Singer")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit(admin_cohort_path(cohort))

      check("student-#{student_1.id}")
      check("student-#{student_2.id}")
      check("student-#{student_3.id}")

      click_on "Create Assignments"

      expect(page).to have_content("Assignments successfully created.")
      expect(Assignment.count).to eq(6)
    end
  end
end
