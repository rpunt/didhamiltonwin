#!/usr/bin/env ruby

require 'httparty'
require 'git'

g = Git.open(__dir__)
g.pull

headers = {
  'apikey' => 'qPgPPRJyGCIPxFT3el4MF7thXHyJCzAP',
  'locale' => 'en'
}

begin
  response = HTTParty.get( 'https://api.formula1.com/v1/event-tracker', :headers => headers )
rescue HTTParty::Error => e
  puts "had an error: #{e}"
rescue StandardError => e
  puts ":shrug: StandardError: #{e}"
end

race_status = JSON.parse(response.body)
raceinfo = race_status['seasonContext']['timetables'].select{|hash| hash['description'] == 'Race' }.first
raceStart = Time.parse("#{raceinfo['startTime']} #{raceinfo['gmtOffset']}").utc

config = YAML.load_file("#{__dir__}/_config.yml")
config['description'] = "#{race_status['race']['meetingCountryName']}: #{raceStart.strftime("%d %B %Y")}"
File.write("#{__dir__}/_config.yml", config.to_yaml)

case raceinfo['state']
when 'upcoming'
  puts "race hasn't started yet"
  File.write("#{__dir__}/index.md", "# Race hasn't started yet")
when 'started'
  File.write("#{__dir__}/index.md", '# Racing now')
when 'completed'
  winner = race_status['raceResults'].select{|hash| hash['positionNumber'] == '1' }.first
  answer = winner['driverLastName'].downcase == 'hamilton' ? 'YES' : 'NO'
  File.write("#{__dir__}/index.md", "# #{answer}.")
end

#if g.status.changed.count > 0
#  g.add(:all=>true)
#  g.commit_all("updating for #{race_status['race']['meetingCountryName']}: #{raceStart.strftime("%d %B %Y")}; #{raceinfo['state']}")
#  g.push
#end
