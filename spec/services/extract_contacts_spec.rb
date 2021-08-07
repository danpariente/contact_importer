require "rails_helper"

RSpec.describe ExtractContacts do
  describe ".call" do
    it "extracts all the contacts from CSV file" do
      path = Rails.root.join("spec/support/data/example.csv")

      ExtractContacts.(path)

      expect(Contact.last.name).to eq("Daniel Pariente")
    end
  end
end
