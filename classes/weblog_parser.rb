class WeblogParser

  def initialize(file_name)
    @file_name = file_name
  end

  def run
    parse_web_log
  end

  private

  attr_reader :file_name

  def parse_web_log
    raise 'File does not exist!' unless File.exists?(file_name)
    data = File.read(file_name)
    traffic = data.split("\n")
    real_traffic, pages, ip_addresses = [], [], []
    traffic.each do |row|
      page, ip = parse_line(row)
      next unless real_ip?(ip)

      real_traffic.push(row)
      pages.push(page)
      ip_addresses.push(ip)
    end
    [pages, ip_addresses, real_traffic]
  end

  def parse_line(row)
    [row.split(' ').first, row.split(' ').last]
  end

  def real_ip?(ip)
    true if ip =~ /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/
  end
end
