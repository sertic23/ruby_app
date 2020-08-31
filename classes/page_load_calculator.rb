class PageLoadCalculator

  def initialize(pages)
    @pages = pages
  end

  def run
    calculate_traffic_per_page
  end

  private

  attr_reader :pages

  def calculate_traffic_per_page
    raise 'No data to calculate from!' if pages.nil? || pages.empty?

    unique_pages = pages.uniq
    page_load = unique_pages.each_with_object({}) do |page, result|
      result[page] = pages.count(page)
    end
    page_load.sort_by { |_key, value| value }.reverse.to_h
  end
end
