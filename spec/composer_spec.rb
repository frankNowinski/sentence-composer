require "spec_helper"

RSpec.describe Composer do
  context 'when the sentence contains words not in the Dictionary' do
    let(:words_not_in_dict) { 'ajk' }

    it 'should return an empty array' do
      expect(described_class.new(words_not_in_dict).compose_sentences)
        .to eq []
    end
  end

  context 'when the sentence contains words in the Dictionary' do
    let(:input_1)  { 'abcdefg' }
    let(:output_1) { [ 'a bc def g', 'a bcd e fg', 'abcd e fg' ] }
    let(:input_2)  { 'abcc' }
    let(:output_2) { [ 'a bc c' ] }
    let(:input_3)  { 'abcd' }
    let(:output_3) { [] }

    it 'should return the expected output' do
      expect(described_class.new('hijc').compose_sentences)
        .to eq output_1
    end

    it 'should return the expected output' do
      expect(described_class.new(input_1).compose_sentences)
        .to eq output_1
    end

    it 'should return the expected output' do
      expect(described_class.new(input_2).compose_sentences)
        .to eq output_2
    end

    it 'should return the expected output' do
      expect(described_class.new(input_3).compose_sentences)
        .to eq output_3
    end
  end

  context 'when a sentence is built' do
    let(:input_1)   { 'abcc' }
    let(:validator) { double(:validator) }

    it 'should check if the sentence is valid' do
      expect(SentenceValidator).to receive(:new).with([ 'a', 'bc', 'c' ]).and_return validator
      expect(validator).to receive(:valid_sentence?)
      described_class.new(input_1).compose_sentences
    end
  end

  context 'when a sentence is built' do
    let(:input_1)   { 'abcc' }
    let(:validator) { double(:validator) }

    it 'should check if the sentence is valid' do
      expect(SentenceValidator).to receive(:new).with([ 'a', 'bc', 'c' ]).and_return validator
      expect(validator).to receive(:valid_sentence?)
      described_class.new(input_1).compose_sentences
    end
  end
end

