require 'rails_helper'

describe "As an admin" do
  describe "when I visit a cohort show page" do
    it "I can make assignments" do
      VCR.use_cassette('features/admin/delete_assignments', record: :new_episodes) do
        cohort = CensusCohort.create_from_name("1407-BE")
        User.create(id: 61)
        User.create(id: 54)
        User.create(id: 70)
        Assignment.create!(giver_id: 61, receiver_id: 54)
        Assignment.create!(giver_id: 54, receiver_id: 70)
        admin  = User.create(role: "admin")

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit(admin_cohort_assignments_path(cohort.id))

        find("[data-method='DELETE']", match: :first).click

        expect(page).to have_content("Successfully deleted assignment.")
      end
    end
  end
end
