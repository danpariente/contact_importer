class DobValidator < ActiveModel::EachValidator
  VALID_FORMATS = {
    /\d{4}-\d{2}-\d{2}/ => "%F",
    /\d{4}\d{2}\d{2}/ => "%Y%m%d"
  }.freeze

  def validate_each(record, attribute, value)
    unless value && valid?(value)
      record.errors.add(attribute, "Invalid format.")
    end
  end

  private

  def valid?(date)
    format = VALID_FORMATS.keys.detect { |format| date.match?(format) }
    format && Date.strptime(date.to_s, VALID_FORMATS[format])
  rescue  Date::Error
    false
  end
end