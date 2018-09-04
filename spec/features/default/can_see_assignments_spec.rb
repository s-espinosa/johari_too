require 'rails_helper'

describe "As a default user" do
  describe "when I visit my dashboard" do
    it "I can see a list of outstanding assignments" do
      VCR.use_cassette('features/default/see_assignments', record: :new_episodes) do
        user_1 = CensusUser.new({"first_name" => "Valerie",
                                 "last_name" =>"Trudell",
                                 "id" => 81})
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1.instance_variable_get(:@user))

        user_2 = CensusUser.new({"first_name" => "Daniel",
                                 "last_name" => "Olson",
                                 "id" => 79})
        user_3 = CensusUser.new({"first_name" => "Edilene",
                                 "last_name" => "da Cruz",
                                 "id" => 77})

        user_1.assignments.create(receiver_id: user_2.id)
        user_1.assignments.create(receiver_id: user_3.id)

        visit dashboard_path

        expect(page).to have_link("Daniel Olson")
        expect(page).to have_link("Edilene da Cruz")
      end
    end
  end
end
