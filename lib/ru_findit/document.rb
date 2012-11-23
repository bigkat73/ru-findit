class Document

  attr_accessor :id, :body

  def initialize(body)
    @body = body
    @tokenizer = RuFindit::Tokenizer.new(body)
  end

  def tokens
    @tokenizer.tokens
  end

  def word_count
    @word_count ||= @tokenizer.tokens.size
  end


end