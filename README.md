# README

Example of bug found in Rails 5.0.1 where group by does not use the correct type.

# Usage

```
git clone https://github.com/trevorrjohn/group-bug-example
cd group-bug-example
bundle install
rails db:migrate db:test:prepare
rails test
```

# Spec

```ruby
test "grouping by name" do
  foo = Foo.create!(name: 42)
  Bar.create!(name: 'Fourty Two', foo: foo)

  assert_equal Bar.joins(:foo).group('foos.name').count, { 42 => 1 }
  assert_equal Foo.joins(:bars).group('bars.name').count, { 'Fourty Two' => 1 }
end
```

# Results

```
$ rails test

# Running:

F

Failure:
BarTest#test_grouping_by_name [/Users/trevor/workspace/draft/group-bug-example/test/models/bar_test.rb:9]:
Expected: {"0"=>1}
  Actual: {"Fourty Two"=>1}

```
