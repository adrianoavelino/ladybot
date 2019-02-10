module TranslatorModule
  class Translate
    def initialize(params)
      @text = params["text"]
      @direction_of_translation = params["direction_of_translation"]
    end

    def call
      return 'Texto em português é obrigatório' if @text == nil
      return 'Parâmetro lang obrigatório' if @direction_of_translation == nil
      get_translation()
    end

    def get_translation
      begin
        url_api = get_url_api()
        json = RestClient.post(url_api, {text: @text})
      rescue RestClient::ExceptionWithResponse => e
        json = e.response
      end
      response = JSON.parse(json)
      get_message(response)
    end

    def get_message(response)
      codeResponse = response['code']
      case codeResponse
      when 200
        JSON.parse(json)['text'].first
      when 401
        'Chave secreta da api inválida'
      when 501
        'Parâmetro lang de tradução não suportado'
      else
        "Erro não encontrado. Erro #{response['code']}: #{response['message']}"
      end
    end

    def get_url_api
      yandex_api_url = ENV["YANDEX_API_URL"]
      yandex_api_key = ENV["YANDEX_API_KEY"]
      url = "#{yandex_api_url}#{@direction_of_translation}&key=#{yandex_api_key}"
    end

  end

end
