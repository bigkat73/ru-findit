module RuFindit
  class Stopper

    def initialize
      @stop_words = []
      root = File.expand_path "../../../support", __FILE__
      File.open(File.join(root, "stopwords.txt")) do |f|
        while line = f.gets
          @stop_words << line.chomp
        end
      end
    end

    def matches(word)
      @stop_words.include?(word)
    end

  end
end