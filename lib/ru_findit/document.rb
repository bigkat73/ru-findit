require 'forwardable'

class Document
  extend Forwardable

  attr_accessor :body, :id

  def initialize(body, id=nil)
    @body = body
    @id = id
    @tokenizer = RuFindit::Tokenizer.new(self)
  end

  def_delegators :@tokenizer, :tokens

  def word_count
    @word_count ||= @tokenizer.tokens.size
  end

end