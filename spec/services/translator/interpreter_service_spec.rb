require_relative './../../spec_helper.rb'

describe 'InterpretService' do
  describe '#call' do
    context 'Invalid command' do
      it 'return doesn\'t find a translation' do
        response = InterpretService.call('', {})
        expect(response)
          .to match("Não entendi o que você quer. Digite *help* para ver as opções válidas")
      end
    end

    context 'Valid command' do
      it 'return a translation' do
        my_params = {"text" => 'livro'}
        response = InterpretService.call('translate_pt-en',my_params)
        expect(response).to match('book')
      end

      it 'return a list of commands' do
        response = InterpretService.call('help', {})
        expect(response).to match('Meus comandos')
        expect(response).to match('help')
        expect(response).to match('Traduza x para inglês')
        expect(response).to match('Traduza x para português')
      end
    end
  end
end
