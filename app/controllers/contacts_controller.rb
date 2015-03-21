class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request

    unless @contact.deliver
      flash[:alert] = "Cannot send message."
      render :new
    end
  end
end
