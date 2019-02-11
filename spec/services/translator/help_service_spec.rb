require_relative './../../spec_helper.rb'

describe HelpService do
  describe '#call' do
    it 'Response have the main commands' do
      response = HelpService.call()
      expect(response).to match('Meus comandos')
      expect(response).to match('help')
      expect(response).to match('Traduza x para inglês')
      expect(response).to match('Traduza x para português')
    end
  end
end
