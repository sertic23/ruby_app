require '../classes/page_load_calculator'
require '../classes/unique_visits_calculator'
require '../classes/weblog_parser'
require '../classes/page_visits_output_formater'

pages, _ips, traffic = WeblogParser.new(ARGV[0]).run
load_per_page = PageLoadCalculator.new(pages).run
puts PageVisitsOutputFormatter.new(load_per_page).run
unique_visits_per_page = UniqueVisitsCalculator.new(traffic).run
puts "\n"
puts PageVisitsOutputFormatter.new(unique_visits_per_page, true).run
