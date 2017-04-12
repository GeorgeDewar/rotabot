require 'test_helper'

class MonthTest < ActiveSupport::TestCase
  test "gets current month right" do
    Date.stubs(:today).returns(Date.new(2017,4,18))

    this_month = Month.this
    assert_equal "2017-04-01", this_month.start_date.to_s
    assert_equal "2017-04-30", this_month.end_date.to_s

    # month number is correct
    assert_equal 2017, this_month.year
    assert_equal 4,    this_month.month
  end

  test "generates future months" do
    month = Month.new(2017, 10)
    months = month.next(4)

    assert_equal [2017, 2017, 2018, 2018], months.map(&:year)
    assert_equal [11, 12, 1, 2], months.map(&:month)
    months.map(&:start_date) # no error means months are valid
  end
end
