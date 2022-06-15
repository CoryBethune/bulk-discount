class Holiday
  attr_reader :the_three_holidays

  def initialize(parsed)
    collector = {}
    parsed.each do |hash|
      break if collector.count == 3
      collector[hash[:date]] = hash[:name]
    end
    @the_three_holidays = collector
    binding.pry
  end
end
