module RuFindit

  class Tokenizer

		attr_accessor :document
		attr_reader   :tokens, :tokenizer

		def initialize(document, options={})
			@document = document
			@tokens = []
			@tokenizer = options[:tokenizer] || " "
		end

		def tokenize
			@tokens = @document.gsub(/\r\n/," ").downcase.split(@tokenizer)
			cleanse_tokens
		end

		def cleanse_tokens
			@tokens.collect!{|token| token.gsub(/\.|\-|\+/,'')}
		end

	end

end