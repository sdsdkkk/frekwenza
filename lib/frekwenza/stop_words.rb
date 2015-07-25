module Frekwenza
  class StopWords
    attr_reader :stop_words

    def initialize(file)
      string = read(file)
      build_list(string)
    end

    private
    def read(file)
      string = ""
      File.open(file, "r") do |f|
        string = f.read
      end
      string
    end

    def build_list(string)
      @stop_words = string.downcase.gsub(/[^a-z0-9]/, ' ').split(' ').uniq
    end
  end
end
