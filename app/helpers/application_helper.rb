module ApplicationHelper

  def flash_messages
    messages = ""
    [:success, :info, :warning, :error, :notice].each do |type|
      if flash[type]
        #todo futuro - fazer funcionar o x
        #messages += "<div class=\"#{type.to_s}\">#{flash[type]}</div>"
        #messages += "<div class=\"alerta alerta-#{type.to_s}\">#{flash[type]}<a class=\"bt-fechar\" href=\"#\" title=\"Dispensar\">×</a></div>"
        messages += "<div class=\"alerta alerta-#{type.to_s}\">#{flash[type]}</div>"
      end
    end
    messages.html_safe
  end

end