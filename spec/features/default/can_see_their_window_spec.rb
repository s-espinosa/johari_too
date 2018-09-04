require 'rails_helper'

describe "As a default user" do
  describe "when I visit my window" do
    it "I see my attributes listed in categories" do
      VCR.use_cassette('/features/default/see_attributes', record: :new_episodes) do
        user_1 = CensusUser.new({"first_name" => "Valerie",
                                 "last_name" =>"Trudell",
                                 "id" => 81})
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

          a1 = Adjective.create(name: "Nice")
          a2 = Adjective.create(name: "Intelligent")
          a3 = Adjective.create(name: "Honest")
          Adjective.create(name: "Silly")

          self_eval = user_1.assignments.create(giver_id: user_1.id, receiver_id: user_1.id)

          self_eval.johari_attributes.create(adjective: a1)
          self_eval.johari_attributes.create(adjective: a3)

          user_2 = CensusUser.new({"first_name" => "Sal",
                                   "last_name" => "Espinosa",
                                   "id" => 56})

          partner_eval = user_2.assignments.create(receiver_id: user_1.id)

          partner_eval.johari_attributes.create(adjective: a1)
          partner_eval.johari_attributes.create(adjective: a2)

          visit window_path(user_1.id)

          within(".arena") do
            expect(page).to have_content("Nice")
          end

          within(".blind_spot") do
            expect(page).to have_content("Intelligent")
          end

          within(".facade") do
            expect(page).to have_content("Honest")
          end

          within(".unknown") do
            expect(page).to have_content("Silly")
          end
      end
    end
  end
end
