class InterpretService
  def self.call(action, params)
    case action
    when 'translate'
      TranslatorModule::TranslateService.new(params).call()
    when 'help'
      HelpService.call()
    else
      'Não entendi o que você quer. Digite *help* para ver as opções válidas'
    end
  end
end
