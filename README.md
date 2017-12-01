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
