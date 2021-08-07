class ContactsController < ApplicationController
  def index
    render locals: { contacts: Contact.all }
  end
end
