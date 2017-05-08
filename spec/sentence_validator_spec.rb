require "spec_helper"

RSpec.describe SentenceValidator do
  context 'when the sentence does not include a verb' do
    let(:sentence) { ['abcd', 'e'] }

    it 'the sentence should be invalid' do
      expect(described_class.new(sentence).valid_sentence?) .to eq false
    end
  end

  context 'when the sentence includes a verb' do
    context 'when the sentence does not include two articles '\
      'or a noun' do
      let(:sentence) { ['a', 'bcd'] }

      it 'the sentence should be invalid' do
        expect(described_class.new(sentence).valid_sentence?) .to eq false
      end
    end

    context 'when the sentence includes a noun but not two articles' do
      let(:sentence) { ['bc', 'def', 'e'] }

      it 'the sentence should be valid' do
        expect(described_class.new(sentence).valid_sentence?) .to eq true
      end
    end

    context 'when the sentence includes two articles but not a noun' do
      let(:sentence) { ['a', 'bcd', 'e'] }

      it 'the sentence should be valid' do
        expect(described_class.new(sentence).valid_sentence?) .to eq true
      end
    end
  end
end

