module EmailValidatable
  extend ActiveSupport::Concern

  class EmailValidator < ActiveModel::EachValidator
    # Domain must be present and have two or more parts.
    def validate_each(record, attribute, value)
      address = Mail::Address.new value
      record.errors[attribute] << (options[:message] || 'is not a valid email') unless (address.address == value && address.domain && address.__send__(:tree).domain.dot_atom_text.elements.size > 1 rescue false)
    end
  end
end