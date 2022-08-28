#!/usr/bin/env ruby
# frozen_string_literal: true

require 'httparty'
require 'git'

g = Git.open(__dir__)
g.checkout('main')
# g.pull

headers = {
  'apiKey' => 'qPgPPRJyGCIPxFT3el4MF7thXHyJCzAP',
  'locale' => 'en'
}

begin
  response = HTTParty.get('https://api.formula1.com/v1/event-tracker', headers: headers)
rescue HTTParty::Error => e
  puts "had an error: #{e}"
rescue StandardError => e
  puts ":shrug: StandardError: #{e}"
end

race_status = JSON.parse(response.body)
raceinfo = race_status['seasonContext']['timetables'].select { |hash| hash['description'] == 'Race' }.first
raceStart = Time.parse("#{raceinfo['startTime']} #{raceinfo['gmtOffset']}").utc

config = YAML.load_file("#{__dir__}/_config.yml")
config['description'] = "#{race_status['race']['meetingCountryName']}: #{raceStart.strftime('%d %B %Y')}"
File.write("#{__dir__}/_config.yml", config.to_yaml)

case raceinfo['state']
when 'upcoming'
  answer = "The race hasn't started yet"
when 'started'
  answer = "# They're racing now"
when 'completed'
  winner = race_status['raceResults'].select { |hash| hash['positionNumber'] == '1' }.first
  answer = winner['driverLastName'].downcase == 'hamilton' ? 'YES' : 'NO'
end
File.write("#{__dir__}/index.md", "# #{answer}")
File.write("#{__dir__}/api_results/#{Time.now.strftime('%Y%m%d-%H%M%S')}.json", JSON.pretty_generate(race_status))

if g.status.changed.count.positive?
  g.add(all: true)
  g.commit_all("updating for #{race_status['race']['meetingCountryName']}: #{raceStart.strftime('%d %B %Y')}; race #{raceinfo['state']}")
  g.push(g.remote('origin'), 'main')
end
