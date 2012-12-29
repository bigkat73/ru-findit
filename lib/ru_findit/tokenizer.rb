module RuFindit

  class Tokenizer

    attr_accessor :document
    attr_reader   :tokens, :tokenator

    def initialize(document, options={})
      @document = document
      @tokenator = options[:tokenizer] || " "
    end

    def tokenize
      @tokens ||= document_body.gsub(/\r\n/," ").downcase.split(@tokenator)
      cleanse_tokens
    end

    def document_body
      if @document.respond_to?(:body)
        @document.body
      else
        @document
      end
    end

    def cleanse_tokens
      @tokens.collect!{|token| token.gsub(/\.|\-|\+|,/,'')}
    end

    def tokens
      tokenize
    end

  end

end