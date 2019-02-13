class HelpService
  def self.call
    response  = "*Meus comandos* \n\n"
    response += "`help`\n"
    response += "`Traduza x para inglês`\n"
    response += "`Traduza x para português`\n"
    response
  end
end
