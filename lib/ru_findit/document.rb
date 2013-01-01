require_relative 'tokenable'

class Document
  include RuFindit::Tokenable

  attr_accessor :body, :id

  def initialize(body, id=nil, options={})
    @body = body
    @id = id
    @tokenator = options[:tokenator] || ' '
  end
  
end