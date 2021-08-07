require "rails_helper"

RSpec.describe Contact do
  context "validations" do
    describe "#name" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to allow_value("First Last @$%^").for(:name) }
      it { is_expected.not_to allow_value("First-Last").for(:name) }
    end

    describe "#dob" do
      it { is_expected.to validate_presence_of(:dob) }
      it { is_expected.to allow_value("2021-12-23").for(:dob) }
      it { is_expected.to allow_value("20211223").for(:dob) }
      it { is_expected.not_to allow_value("2021/12/23").for(:dob) }
    end

    describe "#phone" do
      it { is_expected.to validate_presence_of(:phone) }
      it { is_expected.to allow_value("(+57) 320 432 05 09 21").for(:phone) }
      it { is_expected.to allow_value("(+57) 320-432-05-09-21").for(:phone) }
      it { is_expected.not_to allow_value("+573204320509").for(:phone) }
    end

    describe "#address" do
      it { is_expected.to validate_presence_of(:address) }
    end

    describe "#credit_card" do
      it { is_expected.to validate_presence_of(:credit_card) }
      it { is_expected.to allow_value("371449635398431").for(:credit_card) }
      it { is_expected.to allow_value("5555555555554444").for(:credit_card) }
      it { is_expected.not_to allow_value("0000111122224444").for(:credit_card) }
    end

    describe "#franchise" do
      it { is_expected.to validate_presence_of(:franchise) }
    end

    describe "#email" do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to allow_value("user@example.com").for(:email) }
      it { is_expected.not_to allow_value("other@@example.com").for(:email) }
    end
  end
end
