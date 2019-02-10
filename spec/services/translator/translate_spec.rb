require_relative './../../spec_helper.rb'

describe 'TranslatorModule::Translate' do

  let(:translateText) { TranslatorModule::Translate.new({"text" => "livro", "direction_of_translation" => 'pt-en'}) }

  describe '#call' do
    context 'Without params' do
      it 'Will receive an error without text' do
        translateTextWithoutParams = TranslatorModule::Translate.new({})
        response = translateTextWithoutParams.call()
        expect(response).to match('Texto em português é obrigatório')
      end

      it 'Will receive an error without lang' do
        translateTextWithoutParams = TranslatorModule::Translate.new({ "text" => 'livro' })
        response = translateTextWithoutParams.call()
        expect(response).to match('Parâmetro lang obrigatório')
      end
    end

    context 'With valid params' do
      it 'Receive a translate' do
        allow(translateText).to receive(:call)
          .and_return("book")
        response = translateText.call()
        expect(response).to  be_an_instance_of(String)
      end

      it 'Receive an error message with wrong secret api' do
        allow(translateText).to receive(:call)
          .and_return('Chave secreta da api inválida')
        response = translateText.call()
        expect(response).to match('Chave secreta da api inválida')
      end

      it 'Receive an error message with invalid lang' do
        allow(translateText).to receive(:call)
        .and_return('Parâmetro lang de tradução não suportado')
        response = translateText.call()
        expect(response).to match('Parâmetro lang de tradução não suportado')
      end

      it 'Receive an error message with generic message' do
        allow(translateText).to receive(:call)
        .and_return('Erro não encontrado. Erro:')
        response = translateText.call()
        expect(response).to match('Erro não encontrado')
      end
    end
  end
end
