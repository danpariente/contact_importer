require "rails_helper"

RSpec.feature "User lists contacts" do
  scenario "see a list of the imported contacts" do
    setup

    visit contacts_path

    expect(page).to have_content("Daniel Pariente")
  end
end

def setup
  path = Rails.root.join("spec/support/data/example.csv")

  ExtractContacts.(path)
end
