require_relative './dictionary'
require_relative './sentence_validator'

class Composer
  include Dictionary

  def initialize(input)
    @input     = input.split('').sort.join('')
    @sentences = []

    add_root_nodes
  end

  def compose_sentences
    return [] if input_includes_char_after_j?

    @sentences.each { |root| find_children_nodes(root, root.value) }
    build_sentences
  end

  private

  def add_root_nodes
    words_starting_with(@input[0]).each { |value| @sentences << Node.new(value) }
  end

  def words_starting_with(letter)
    available_words.select { |word| word.start_with?(letter) }
  end

  def available_words
    @available_words ||= DICTIONARY.values.map do |words|
      words.map do |word|
        word if @input.include?(word)
      end
    end.flatten.compact.sort
  end

  def input_includes_char_after_j?
    @input[-1] > 'j'
  end

  def find_children_nodes(node, cur_sentence)
    return if cur_sentence.size == @input.length

    next_char = @input[cur_sentence.size]
    words     = words_starting_with(next_char)

    unless words.empty?
      words.each do |word|
        new_node = node.add_children_node(word)

        find_children_nodes(new_node, "#{cur_sentence}#{word}")
      end
    end
  end

  def build_sentences
    @sentences.map do |root_node|
      root_node.children.map do |current_node|
        sentence = [root_node.value]

        while current_node.children.any?
          sentence << current_node.value
          current_node = current_node.children.first
        end

        sentence << current_node.value

        if SentenceValidator.new(sentence).valid_sentence?
          sentence.join(' ')
        end
      end
    end.flatten.compact
  end
end
