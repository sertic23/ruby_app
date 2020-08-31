class UniqueVisitsCalculator

  def initialize(traffic)
    @traffic = traffic
  end

  def run
    calculate_unique_visits
  end

  private

  attr_reader :traffic

  def calculate_unique_visits
    raise 'No data to calculate from!' if traffic.nil? || traffic.empty?

    unique_pages_load.sort_by {|_key, value| value }.reverse.to_h
  end

  def unique_pages_load
    @unique_pages_load ||= pages_ip_adresses.map {|key, value| [key, value.count]}.to_h
  end

  def pages_ip_adresses
    @pages_ip_adresses ||= traffic.each_with_object({}) do |row, result|
      page, ip = row.split(' ')
      result[page] = page_result(result, page, ip)
    end
  end

  def page_result(result, page, ip)
    return [ip] if result[page].nil?

    result[page].include?(ip) ? result[page] : result[page] + [ip]
  end
end
