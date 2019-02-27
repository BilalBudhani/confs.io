require 'open-uri'
require 'csv'

conf_csv_contents = open(ENV['CSV_URL']) {|f| f.read.force_encoding("UTF-8") }
conf_csv = CSV.parse(conf_csv_contents)

# Remove header
conf_csv.delete_at(0)

conf_csv.each do |c|
  next if c[6].nil?

  conf = Conference.new
  event = Event.new

  conf.name = c.first
  conf.website = c.second
  event.starts_on = Date.parse(c.third) unless c.third.nil?
  event.ends_on = Date.parse(c.fourth) unless c.fourth.nil?
  event.city = c.fifth
  event.country = c[5]
  conf.username = c[6].delete_prefix('@')
  conf.twitter_screen_name = c[6].delete_prefix('@')
  event.cfp_url = c[7]
  event.cfp_ends_on = Date.parse(c[8]) unless c[8].nil?
  conf.events = [event]
  unless conf.save
    byebug
  end
end


puts "#{Conference.count} Conferences Added"