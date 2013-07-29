module RuFindit

	module Tokenable

		module ClassMethods
			attr_accessor :document
			attr_reader   :tokens, :tokenator
		end

		def self.included(base)
			base.extend ClassMethods
		end

		def tokenize
			@tokens ||= document_body.gsub(/\r\n/," ").downcase.split(@tokenator)
			cleanse_tokens
		end

		def document_body
			if self.respond_to?(:body)
				self.body
			else
				self
				end
		end

		def cleanse_tokens
			@tokens.collect!{|token| token.gsub(/\.|\-|\+|,/,'')}
		end

		def tokens
			tokenize
		end

		def word_count
			@word_count ||= tokens.size
		end

	end

end
