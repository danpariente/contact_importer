class NameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value && value.include?("-")
      record.errors.add(attribute, "Invalid format.")
    end
  end
end
