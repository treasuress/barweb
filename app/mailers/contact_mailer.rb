class ContactMailer < ActionMailer::Base
  #todo rodar - seu email aqui (quem está enviando)
  #todo now - testar colokr akih @contact.email
  default from: "email"

  def contact_message(contact)
    @contact = contact
    #todo rodar - colokr seu email pra poder ver resultado
    mail(:to => 'siac.bar.moraesg@gmail.com', :subject => @contact['subject'])
  end

  def alert_when_error_should_never_happen(comment)
    mail(:to => "siac.bar@gmail.com", :subject => "ERRO - " + comment, :body => comment)
  end

end

#todo now - n tah funcionando (n sei c local funciona)