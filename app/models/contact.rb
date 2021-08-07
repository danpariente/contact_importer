class Contact < ApplicationRecord
  validates :name, presence: true, name: true
  validates :dob, presence: true, dob: true
  validates :phone, presence: true, phone: true
  validates :address, presence: true
  validates :credit_card, presence: true, credit_card_number: true
  validates :franchise, presence: true
  validates :email, presence: true, format: URI::MailTo::EMAIL_REGEXP
end
