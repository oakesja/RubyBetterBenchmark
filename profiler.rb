class Profiler
  def self.profile(tag)
    start = Time.now
    yield
    stop = Time.now
    get_times[tag] += (stop - start)
  end

  def self.report
    get_times.each do |key, value|
      puts "#{key}: #{value}"
    end
  end

  private
  def self.get_times
    @times ||= {}
    @times.default = 0
    @times
  end
end