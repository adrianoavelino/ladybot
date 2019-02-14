class InterpretService
  def self.call(action, params)
    case action
    when 'translate_pt-en'
      params["direction_of_translation"] = 'pt-en'
      "A tradução é *#{TranslatorModule::TranslateService.new(params).call()}*"
    when 'translate_en-pt'
      params["direction_of_translation"] = 'en-pt'
      "A tradução é *#{TranslatorModule::TranslateService.new(params).call()}*"
    when 'help'
      HelpService.call()
    else
      'Não entendi o que você quer. Digite *help* para ver as opções válidas'
    end
  end
end
