#!/usr/bin/env ruby

require 'httparty'
require 'git'

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

# response = %q({
#   "raceHubId": "5OEc3LgWfOzpQXNf7jVD51",
#   "locale": "en",
#   "createdAt": "2021-03-09T14:33:44.399Z",
#   "updatedAt": "2021-05-02T16:00:06.561Z",
#   "fomRaceId": "1066",
#   "brandColourHexadecimal": "ee0000",
#   "headline": "Hamilton beats Verstappen and Bottas to win in Portimao",
#   "curatedSection": {
#     "contentType": "assemblySimpleArticleList",
#     "title": "Event Tracker Portugal 2021 - Curated Articles",
#     "items": [
#       {
#         "id": "2ePUSr7DbPpE95DpqQeQmM",
#         "updatedAt": "2021-05-09T00:00:00.000Z",
#         "realUpdatedAt": "2021-05-02T16:34:54.257Z",
#         "locale": "en",
#         "title": "AS IT HAPPENED: Follow all the action from the Portuguese Grand Prix",
#         "slug": "live-coverage-follow-all-the-action-from-the-portuguese-grand-prix-at",
#         "articleType": "Live Blog",
#         "metaDescription": "Live coverage of Sunday's Formula 1 Heineken Grande Premio de Portugal 2021 in Portimao.",
#         "thumbnail": {
#           "image": {
#             "title": "1315864991",
#             "path": "/content/dam/fom-website/sutton/2021/Portugal/Sunday/1315864991.jpg",
#             "url": "https://www.formula1.com/content/dam/fom-website/sutton/2021/Portugal/Sunday/1315864991.jpg"
#           }
#         },
#         "isLive": false
#       },
#       {
#         "id": "5jxpjolcJnFSJ38iarOgg6",
#         "updatedAt": "2021-05-02T15:46:50.275Z",
#         "realUpdatedAt": "2021-05-02T16:41:10.252Z",
#         "locale": "en",
#         "title": "Hamilton takes victory in Portugal after crucial overtakes on Verstappen and Bottas",
#         "slug": "hamilton-takes-victory-in-portugal-after-crucial-overtakes-on-verstappen-and",
#         "articleType": "Report",
#         "metaDescription": "A brilliantly managed race from Mercedes’ Lewis Hamilton saw him take his second win of the 2021 season at the Portuguese Grand Prix, the Briton finishing ahead of Red Bull’s Max Verstappen, as Hamilton’s polesitting team mate Valtteri Bottas came home third.\n\n",
#         "thumbnail": {
#           "image": {
#             "title": "GettyImages-1315857251.jpg",
#             "path": "/content/dam/fom-website/Upgrade/PortugalManualUploads/Sunday/GettyImages-1315857251.jpg",
#             "url": "https://www.formula1.com/content/dam/fom-website/Upgrade/PortugalManualUploads/Sunday/GettyImages-1315857251.jpg"
#           }
#         }
#       }
#     ]
#   },
#   "circuitSmallImage": {
#     "title": "Portugal.png",
#     "path": "/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Portugal.png",
#     "url": "https://www.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Portugal.png"
#   },
#   "links": [
#     {
#       "text": "RESULTS",
#       "url": "https://www.formula1.com/en/results.html/2021/races/1066/portugal/race-result.html"
#     }
#   ],
#   "seasonContext": {
#     "id": "4kUSabodBuSKy8I2ce68iW",
#     "contentType": "f1SeasonContext",
#     "createdAt": "2018-05-24T08:30:54.749Z",
#     "updatedAt": "2021-05-02T16:01:03.265Z",
#     "locale": "en",
#     "seasonYear": "2021",
#     "currentOrNextMeetingKey": "1066",
#     "state": "POST-RACE",
#     "eventState": "IDLE",
#     "liveEventId": "1087",
#     "liveTimingsSource": "https://livetiming.formula1.com/signalr",
#     "liveBlog": {
#       "contentType": "atomLiveBlogScribbleLive",
#       "title": "Portugal 2021 Race",
#       "scribbleEventId": "/event/2955747/37480"
#     },
#     "seasonState": "DURING-SEASON",
#     "raceListingOverride": 2021,
#     "driverAndTeamListingOverride": 2021,
#     "timetables": [
#       {
#         "state": "completed",
#         "session": "p3",
#         "gmtOffset": "+01:00",
#         "description": "Practice 3",
#         "endTime": "2021-05-01T13:00:00",
#         "startTime": "2021-05-01T12:00:00"
#       },
#       {
#         "state": "completed",
#         "session": "p2",
#         "gmtOffset": "+01:00",
#         "description": "Practice 2",
#         "endTime": "2021-04-30T16:00:00",
#         "startTime": "2021-04-30T15:00:00"
#       },
#       {
#         "state": "completed",
#         "session": "r",
#         "gmtOffset": "+01:00",
#         "description": "Race",
#         "endTime": "2021-05-02T17:00:00",
#         "startTime": "2021-05-02T15:00:00"
#       },
#       {
#         "state": "completed",
#         "session": "p1",
#         "gmtOffset": "+01:00",
#         "description": "Practice 1",
#         "endTime": "2021-04-30T12:30:00",
#         "startTime": "2021-04-30T11:30:00"
#       },
#       {
#         "state": "completed",
#         "session": "q",
#         "gmtOffset": "+01:00",
#         "description": "Qualifying",
#         "endTime": "2021-05-01T16:00:00",
#         "startTime": "2021-05-01T15:00:00"
#       }
#     ],
#     "replayBaseUrl": "https://livetiming.formula1.com/static/",
#     "seasonContextUIState": 5
#   },
#   "raceResults": [
#     {
#       "driverTLA": "HAM",
#       "driverFirstName": "Lewis",
#       "driverLastName": "Hamilton",
#       "teamName": "Mercedes",
#       "positionNumber": "1",
#       "raceTime": "1:34:31.421",
#       "teamColourCode": "00d2be",
#       "gapToLeader": "0.0",
#       "driverImage": "https://www.formula1.com/content/dam/fom-website/drivers/L/LEWHAM01_Lewis_Hamilton/lewham01.png"
#     },
#     {
#       "driverTLA": "VER",
#       "driverFirstName": "Max",
#       "driverLastName": "Verstappen",
#       "teamName": "Red Bull Racing",
#       "positionNumber": "2",
#       "raceTime": "1:35:00.569",
#       "teamColourCode": "0600ef",
#       "gapToLeader": "29.148",
#       "driverImage": "https://www.formula1.com/content/dam/fom-website/drivers/M/MAXVER01_Max_Verstappen/maxver01.png"
#     },
#     {
#       "driverTLA": "BOT",
#       "driverFirstName": "Valtteri",
#       "driverLastName": "Bottas",
#       "teamName": "Mercedes",
#       "positionNumber": "3",
#       "raceTime": "1:35:04.951",
#       "teamColourCode": "00d2be",
#       "gapToLeader": "33.53",
#       "driverImage": "https://www.formula1.com/content/dam/fom-website/drivers/V/VALBOT01_Valtteri_Bottas/valbot01.png"
#     }
#   ],
#   "race": {
#     "meetingCountryName": "Portugal",
#     "meetingStartDate": "2021-04-30T11:55:00.000Z",
#     "meetingOfficialName": "Formula 1 Heineken Grande Prémio De Portugal 2021",
#     "meetingEndDate": "2021-05-02T16:00:00.000Z"
#   },
#   "seasonYearImage": "https://www.formula1.com/content/dam/fom-website/2018-redesign-assets/year%20icon/2021.png",
#   "sessionLinkSets": {
#     "replayLinks": [
#       {
#         "session": "p1",
#         "text": "replay",
#         "url": "https://livetiming.formula1.com/static/2021/2021-05-02_Portuguese_Grand_Prix/2021-04-30_Practice_1/",
#         "linkType": "Replay"
#       },
#       {
#         "session": "p2",
#         "text": "replay",
#         "url": "https://livetiming.formula1.com/static/2021/2021-05-02_Portuguese_Grand_Prix/2021-04-30_Practice_2/",
#         "linkType": "Replay"
#       },
#       {
#         "session": "p3",
#         "text": "replay",
#         "url": "https://livetiming.formula1.com/static/2021/2021-05-02_Portuguese_Grand_Prix/2021-05-01_Practice_3/",
#         "linkType": "Replay"
#       },
#       {
#         "session": "q",
#         "text": "replay",
#         "url": "https://livetiming.formula1.com/static/2021/2021-05-02_Portuguese_Grand_Prix/2021-05-01_Qualifying/",
#         "linkType": "Replay"
#       },
#       {
#         "session": "r",
#         "text": "replay",
#         "url": "https://livetiming.formula1.com/static/2021/2021-05-02_Portuguese_Grand_Prix/2021-05-02_Race/",
#         "linkType": "Replay"
#       }
#     ]
#   }
# })
# race_status = JSON.parse(response)

raceinfo = race_status['seasonContext']['timetables'].select{|hash| hash['description'] == 'Race' }.first
raceStart = Time.parse("#{raceinfo['startTime']} #{raceinfo['gmtOffset']}").utc

config = YAML.load_file('_config.yml')
config['description'] = "#{race_status['race']['meetingCountryName']}: #{raceStart.strftime("%d %B %Y")}"
File.write('_config.yml', config.to_yaml)

case raceinfo['state']
when 'upcoming'
  puts "race hasn't started yet"
  File.write('index.md', "# Race hasn't started yet")
when 'started'
  File.write('index.md', '# Racing now')
when 'completed'
  winner = race_status['raceResults'].select{|hash| hash['positionNumber'] == '1' }.first
  answer = winner['driverLastName'].downcase == 'hamilton' ? 'YES' : 'NO'
  File.write('index.md', "# #{answer}.")
end

# require 'pry'; binding.pry

g = Git.open(ENV['PWD'])
if g.status.changed.count > 0
  g.add(:all=>true)
  g.commit_all("updating for ${gp}: ${date}; #{raceinfo['state']}")
  g.push
end
