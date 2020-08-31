class PageVisitsOutputFormatter

  def initialize(load_per_page, unique = false)
    @load_per_page = load_per_page
    @unique = unique
  end

  def run
    format_output
  end

  private

  attr_reader :load_per_page, :unique

  def format_output
    formated_output = ''
    unique_substring = unique ? 'unique views' : 'visits'
    load_per_page.each do |page, visits_counter|
      unique_substring = unique_substring.delete_suffix('s') if visits_counter == 1
      formated_output += page + ' ' + visits_counter.to_s + ' ' + unique_substring + "\n"
    end
    formated_output
  end
end
