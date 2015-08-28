# Frekwenza

## Installation

```
$ gem install frekwenza
```

Or in your Gemfile.

```rb
gem 'frekwenza'
```

Add this line in your Ruby code to use Frekwenza.

```rb
require 'frekwenza'
```

## Usage

Based on [ruby-tf-idf](https://github.com/mathieuripert/ruby-tf-idf) gem, Frekwenza can be used in a similar manner with ruby-tf-idf.

Two parameters are required to be passed to `Frekwenza::TfIdf`'s constructor for Frekwenza to calculate TF-IDF score.
- Corpus, an array of strings.
- Limit, the number of most relevant words taken from each string in the corpus array.

```rb
corpus = [
  'A big enough hammer can usually fix anything',
  'A bird in the hand is a big mistake .',
  'A bird in the hand is better than one overhead!',
  'A career is a job that takes about 20 more hours a week.',
  'A clean desk is a sign of a cluttered desk drawer.',
  'A cynic smells flowers and looks for the casket.'
]

limit = 3
```

Given the corpus and limit, can calculate the TF-IDF score and acquire the top _n_ relevant words in each corpus strings (where _n_ = limit).

```rb
t = Frekwenza::TfIdf.new corpus, limit
t.tf_idf
```

Unlike ruby-tf-idf, Frekwenza has no hardcoded stop words. But we can provide a list of stop words for Frekwenza to use, and pass it as a third (optional) parameter to `Frekwenza::TfIdf`'s constructor. We can pass the name of a text file containing the stop words as the third parameter, or an array of stop words we loaded beforehand.

```rb
# Read file "stop_words.txt" and take its content as the stop words
t = Frekwenza::TfIdf.new corpus, limit, "stop_words.txt"
t.tf_idf

# Pass an array of words as the stop words
t = Frekwenza::TfIdf.new corpus, limit, ["some", "stop", "words"]
t.tf_idf
```

The following is an example output of Frekwenza.

```
 [
  {
    "anything"=>0.7781512503836436,
    "fix"=>0.7781512503836436,
    "enough"=>0.7781512503836436
  },
  {
    "mistake"=>0.7781512503836436,
    "bird"=>0.47712125471966244,
    "in"=>0.47712125471966244
  },
  {
    "overhead"=>0.7781512503836436,
    "better"=>0.7781512503836436,
    "one"=>0.7781512503836436
  },
  ...
]
```

## Authors

- [Mathieu Ripert](https://github.com/mathieuripert), author of [ruby-tf-idf](https://github.com/mathieuripert/ruby-tf-idf) gem.
- [Edwin Tunggawan](htps://github.com/sdsdkkk)
