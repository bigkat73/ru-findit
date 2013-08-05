module RuFindit

  class Tokenizer

    attr_reader   :document, :tokens, :tokenator

    def initialize(document, options={})
      @document = document
      @tokenator = options[:tokenizer] || " "
    end

    def tokenize
      @tokens ||= document_body.gsub(/\r\n/," ").downcase.split(@tokenator)
      cleanse_tokens
    end

    def document
      document ||= document
    end

    def document_body
      @document.respond_to?(:body) ? @document.body : document
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