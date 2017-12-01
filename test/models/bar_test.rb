require 'test_helper'

class BarTest < ActiveSupport::TestCase
  test "grouping by name" do
    foo = Foo.create!(name: 42)
    Bar.create!(name: 'Fourty Two', foo: foo)

    assert_equal({ 42 => 1 }, Bar.joins(:foo).group('foos.name').count)
    assert_equal({ 'Fourty Two' => 1 }, Foo.joins(:bars).group('bars.name').count)
  end
end
