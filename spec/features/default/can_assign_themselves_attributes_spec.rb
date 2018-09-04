require 'rails_helper'

describe "As a default user" do
  describe "when I visit my dashboard" do
    describe "and I have not assigned myself any attributes" do
      it "I see a button to create my self-evaluation" do
        VCR.use_cassette('features/default/see_self_evaluation_link', record: :new_episodes) do
          user_1 = CensusUser.new({"first_name" => "Valerie",
                                   "last_name" =>"Trudell",
                                   "id" => 81})
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

          visit dashboard_path

          expect(page).to have_link("Complete self-evaluation")
        end
      end

      it "I can create my self-evaluation" do
        VCR.use_cassette('features/default/create_self_evaluation', record: :new_episodes) do
          user_1 = CensusUser.new({"first_name" => "Valerie",
                                   "last_name" =>"Trudell",
                                   "id" => 81})
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)
          a1 = Adjective.create(name: "Nice")
          a2 = Adjective.create(name: "Intelligent")
          Adjective.create(name: "Honest")

          visit dashboard_path
          click_on "Complete self-evaluation"

          check("adjective-#{a1.id}")
          check("adjective-#{a2.id}")

          click_on("Submit Attributes")

          expect(page).to have_content("Successfully completed self-evaluation")
          expect(page).to_not have_link("Complete self-evaluation")
          expect(page).to have_link("See your window")
        end
      end
    end
  end
end
