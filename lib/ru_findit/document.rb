require 'forwardable'

class Document

  extend Forwardable

  attr_accessor :id, :body

  def initialize(body)
    @body = body
    @tokenizer = RuFindit::Tokenizer.new(body)
  end

  def_delegators :@tokenizer, :tokens

  def word_count
    @word_count ||= @tokenizer.tokens.size
  end

end