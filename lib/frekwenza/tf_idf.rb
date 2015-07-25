module Frekwenza
  class TfIdf
    attr_reader :tf, :idf, :tf_idf

    def initialize(docs, limit, stop_words_file=nil)
      @docs = split_docs(docs)
      @tf = []
      @idf = {}
      @tf_idf = []
      @docs_size = @docs.size
      calculate_tf_and_idf
      calculate_tf_idf(limit, stop_words_file)
    end

    private
    def split_docs(docs)
      words = []
      docs.each do |d|
        words << d.downcase.gsub(/[^a-z0-9]/, ' ').split(' ')
      end
      words
    end

    def calculate_tf_and_idf
      @docs.each do |words|
        terms_freq = words.inject(Hash.new(0)){|h, e| h[e]+=1; h}
        @tf.push(terms_freq)
        distinct_words = words.uniq
        distinct_words.each do |w|
          if @idf.has_key?(w)
            y = @docs_size / ( 10**(@idf[w]) )
            y += 1
            @idf[w] = Math.log10(@docs_size / y)
          else
            @idf[w] = Math.log10(@docs_size)
          end
        end
      end
    end

    def calculate_tf_idf(limit, stop_words_file)
      @tf.each do |tf_freq|
        tfidf = Hash.new(0)
        tf_freq.each do |k, v|
          tfidf[k] = @idf[k] * v
        end
        if stop_words_file
          sw = StopWords.new(stop_words_file)
          tfidf.reject!{|k| sw.stop_words.include?(k)}
        end
        tfidf = Hash[tfidf.sort_by{|k, v| -v}[0..limit-1]]
        @tf_idf.push(tfidf)
      end
    end
  end
end
