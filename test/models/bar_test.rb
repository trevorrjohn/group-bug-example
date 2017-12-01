require 'test_helper'

class BarTest < ActiveSupport::TestCase
  test "grouping by name" do
    foo = Foo.create!(name: 42)
    Bar.create!(name: 'Fourty Two', foo: foo)

    assert_equal Bar.joins(:foo).group('foos.name').count, { 42 => 1 }
    assert_equal Foo.joins(:bars).group('bars.name').count, { 'Fourty Two' => 1 }
  end
end
