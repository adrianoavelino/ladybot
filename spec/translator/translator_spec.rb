require_relative './../spec_helper.rb'

describe Translator do
  context 'Has attributes' do
    it 'original_text' do
      t = Translator.new
      t.original_text = 'livro'
      expect(t).to have_attributes(original_text: (be_instance_of String))
    end

    it 'translated_text' do
      t = Translator.new
      t.translated_text = 'book'
      expect(t).to have_attributes(translated_text: (be_instance_of String))
    end

    it 'direction_of_translation' do
      t = Translator.new
      t.direction_of_translation = 'pt-en'
      expect(t).to have_attributes(direction_of_translation: (be_instance_of String))
    end

  end

end
