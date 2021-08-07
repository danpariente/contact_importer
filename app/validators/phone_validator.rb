class PhoneValidator < ActiveModel::EachValidator
  FORMAT = /\(\+\d{2}\) \d{3}[- ]\d{3}[- ]\d{2}[- ]\d{2}[- ]\d{2}/

  def validate_each(record, attribute, value)
    unless value&.match?(FORMAT)
      record.errors.add(attribute, "Invalid format.")
    end
  end
end
