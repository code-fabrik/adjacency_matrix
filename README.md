# AdjacencyMatrix

Adjacency Matrix datastructure.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'adjacency_matrix'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install adjacency_matrix

## Usage

### Create a graph

```ruby
nodes = ['A', 'B', 'C', 'D', 'E']

graph = WeightedGraph::PositiveWeightedGraph.new
graph.add_undirected_edge('A', 'B', 2)
graph.add_undirected_edge('B', 'C', 2)
graph.add_undirected_edge('C', 'D', 2)
graph.add_undirected_edge('A', 'D', 10)
graph.add_undirected_edge('B', 'E', 1)
```

### Create the matrix

```ruby
matrix = AdjacencyMatrix::Matrix.new(nodes, graph)
```

### Accessors

Get the value of a specific edge:

```ruby
matrix.get('A', 'D')
#=> 10
```

Change the value of a specific edge:

```ruby
matrix.set('A', 'D', 12)
matrix.get('A', 'D')
#=> 12
```

Print the matrix

```ruby
puts matrix

        A       B       C       D       E
A       0       2       999999  10      999999
B       2       0       2       999999  1
C       999999  2       0       2       999999
D       10      999999  2       0       999999
E       999999  1       999999  999999  0
```

Clone the matrix

```ruby
copy = matrix.clone
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/code-fabrik/adjacency_matrix. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/code-fabrik/adjacency_matrix/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AdjacencyMatrix project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/code-fabrik/adjacency_matrix/blob/master/CODE_OF_CONDUCT.md).
