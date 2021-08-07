require "csv"

module ExtractContacts
  extend self

  MAPPINGS = {
    "Name" => :name,
    "Date of Birth" => :dob,
    "Phone" => :phone,
    "Address" => :address,
    "Credit Card" => :credit_card,
    "Franchise" => :franchise,
    "Email" => :email,
  }.freeze

  def call(path)
    CSV.foreach(path, headers: true) do |record|
      data = record.to_h.transform_keys { |key| MAPPINGS[key] }
      Contact.create(data)
    end
  end
end
