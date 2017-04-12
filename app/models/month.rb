class Month
  MONTHS_IN_YEAR = 12

  attr_reader :year, :month

  #
  # @year a calendar year (e.g. 2017)
  # @week month number (1-12)
  #
  def initialize(year, month)
    raise "Month number must be between 1 and 12" if month < 1 || month > 12

    @year = year
    @month = month
  end

  def self.this
    Month.new(Date.today.year, Date.today.month)
  end

  def name
    start_date.strftime("%B")
  end

  def start_date
    Date.new(@year, @month)
  end

  def end_date
    start_date.end_of_month
  end

  def next(count)
    result = []
    for i in 0..count-1
      year, month = (@year * MONTHS_IN_YEAR + @month + i).divmod(MONTHS_IN_YEAR)
      result << Month.new(year, month + 1)
    end
    result
  end
end