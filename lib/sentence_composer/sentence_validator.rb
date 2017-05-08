require_relative './dictionary'

class SentenceValidator
  include Dictionary

  def initialize(sentence)
    @sentence = sentence
  end

  def valid_sentence?
    includes_verb? && (includes_a_noun? || includes_two_articles?)
  end

  private

  def includes_verb?
    DICTIONARY[:verbs].any? { |verb| @sentence.include?(verb) }
  end

  def includes_a_noun?
    DICTIONARY[:nouns].any? { |noun| @sentence.include?(noun) }
  end

  def includes_two_articles?
    DICTIONARY[:articles].select { |article| @sentence.include?(article) }.count >= 2
  end
end
