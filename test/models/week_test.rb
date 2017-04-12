require 'test_helper'

class WeekTest < ActiveSupport::TestCase
  test "gets current week right" do
    Date.stubs(:today).returns(Date.new(2017,4,1))

    this_week = Week.this
    assert_equal "2017-03-27", this_week.start_date.to_s
    assert_equal "2017-04-02", this_week.end_date.to_s

    # week number is correct
    assert_equal 2017, this_week.year
    assert_equal 13, this_week.week
  end

  test "generates future weeks" do
    week = Week.new(2017, 50)
    weeks = week.next(4)

    assert_equal [2017, 2017, 2018, 2018], weeks.map(&:year)
    assert_equal [51, 52, 1, 2], weeks.map(&:week)
    weeks.map(&:start_date) # no error means weeks are valid
  end
end
