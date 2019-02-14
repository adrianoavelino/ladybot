class HelpService
  def self.call
    response  = "*Meus comandos* \n"
    response += "`help`: mostra esta lista de comandos\n"
    response += "`Traduza x para inglês`: traduz uma palavra para inglês. _Ex: Traduza menino para inglês_\n"
    response += "`Traduza x para português`: traduz uma palavra para português. _Ex: Traduza house para português_\n"
    response
  end
end
