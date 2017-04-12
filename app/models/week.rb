class Week
  WEEKS_IN_YEAR = 52
  MONDAY = 1
  SUNDAY = 7

  attr_reader :year, :week

  #
  # @year a calendar year (e.g. 2017)
  # @week week index (0-51)
  #
  def initialize(year, week)
    @year = year
    @week = week
  end

  def self.this
    Week.new(Date.today.year, Date.today.cweek)
  end

  def start_date
    Date.commercial(@year, @week, MONDAY)
  end

  def end_date
    Date.commercial(@year, @week, SUNDAY)
  end

  def next(count)
    result = []
    for i in 0..count-1
      year, week = (@year * WEEKS_IN_YEAR + @week + i).divmod(WEEKS_IN_YEAR)
      result << Week.new(year, week + 1)
    end
    result
  end
end