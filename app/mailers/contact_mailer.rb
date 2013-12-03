class ContactMailer < ActionMailer::Base
  #todo rodar - seu email aqui (quem está enviando)
  default from: "email"

  def contact_message(contact)
    @contact = contact
    mail(:to => 'siac.bar@gmail.com', :subject => @contact['subject'])
  end

end