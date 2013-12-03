class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])

    if @contact.valid?
      ContactMailer.contact_message(params[:contact]).deliver
      flash[:success] = 'Mensagem enviada com sucesso!'
      redirect_to :action => 'new'
      return
    end

    render :action => 'new'
  end

end