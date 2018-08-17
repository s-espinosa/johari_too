require 'rails_helper'

describe "As a visitor" do
  it "I can see a login page" do
    visit '/'

    expect(page).to have_content("Log In")
  end
end
