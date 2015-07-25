# Frekwenza

This gem is based on [Mathieu Ripert](https://github.com/mathieuripert)'s work, [ruby-tf-idf](https://github.com/mathieuripert/ruby-tf-idf). Some changes are made in the gem, aside from the project structure.

## Usage

Mostly similar with ruby-tf-idf, here's an example right from ruby-tf-idf's readme only with the "RubyTfIdf" part replaced with "Frekwenza".

```
require 'frekwenza'

corpus = [
  'A big enough hammer can usually fix anything',
  'A bird in the hand is a big mistake .',
  'A bird in the hand is better than one overhead!',
  'A career is a job that takes about 20 more hours a week.',
  'A clean desk is a sign of a cluttered desk drawer.',
  'A cynic smells flowers and looks for the casket.'
]

limit = 3 #restrict to the top 3 relevant words per document

t = Frekwenza::TfIdf.new corpus, limit
t.tf_idf
```

The main difference lies in the stop words. Frekwenza doesn't include hard coded stop words as ruby-tf-idf.  To use stop words in Frekwenza, add the path to the file containing the stop words as the third parameter.

```
require 'frekwenza'

corpus = [
  'A big enough hammer can usually fix anything',
  'A bird in the hand is a big mistake .',
  'A bird in the hand is better than one overhead!',
  'A career is a job that takes about 20 more hours a week.',
  'A clean desk is a sign of a cluttered desk drawer.',
  'A cynic smells flowers and looks for the casket.'
]

limit = 3 #restrict to the top 3 relevant words per document
stop_words = "stop_words.txt"

t = Frekwenza::TfIdf.new corpus, limit, stop_words
t.tf_idf
```

The following is an example output of Frekwenza (the format is exactly the same as ruby-tf-idf's).

```
 [ {"anything"=>0.7781512503836436, "fix"=>0.7781512503836436, "enough"=>0.7781512503836436}, {"mistake"=>0.7781512503836436, "bird"=>0.47712125471966244, "in"=>0.47712125471966244}, {"overhead!"=>0.7781512503836436, "better"=>0.7781512503836436, "one"=>0.7781512503836436}, {"week"=>0.7781512503836436, "career"=>0.7781512503836436, "hours"=>0.7781512503836436}, {"desk"=>1.5563025007672873, "drawer"=>0.7781512503836436, "clean"=>0.7781512503836436}, {"casket"=>0.7781512503836436, "cynic"=>0.7781512503836436, "smells"=>0.7781512503836436}, ... ]
```

## Special Thanks

[Mathieu Ripert](https://github.com/mathieuripert), author or [ruby-tf-idf](https://github.com/mathieuripert/ruby-tf-idf) gem.
