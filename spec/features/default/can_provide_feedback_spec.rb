require 'rails_helper'

describe "As a default user" do
  describe "when I visit an assignment show page" do
    it "I can provide feedback" do
      VCR.use_cassette('features/default/provide_feedback', record: :new_episodes) do
        user_1 = CensusUser.new({"first_name" => "Valerie",
                                 "last_name" =>"Trudell",
                                 "id" => 81})
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

        user_2 = CensusUser.new({"first_name" => "Daniel",
                                 "last_name" => "Olson",
                                 "id" => 79})
        assignment = user_1.assignments.create(receiver_id: user_2.id)
        a1 = Adjective.create(name: "Nice")
        a2 = Adjective.create(name: "Honest")
        Adjective.create(name: "Intelligent")

        visit assignment_path(assignment)

        check("adjective-#{a1.id}")
        check("adjective-#{a2.id}")

        click_on "Submit Attributes"

        expect(page).to have_content("Attributes successfully submitted.")
        expect(Attribute.count).to eq(2)
      end
    end
  end
end
