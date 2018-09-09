require 'rails_helper'

describe "As a default user" do
  describe "when I visit the admin cohorts path" do
    it "I see an error" do
      user = CensusUser.new({"first_name" => "Valerie",
                             "last_name" =>"Trudell",
                             "id" => 81})
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      expect do
        visit admin_cohorts_path
      end.to raise_error("Not Found")
    end
  end
end
