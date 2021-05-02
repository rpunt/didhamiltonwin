# API usage

## API Key

Got API key from the source of [the results page](https://www.formula1.com/en/results.html/2021/races.html).

```javascript
  <script>
    window.fom || (fom = {});
    fom.config || (fom.config = {});
    fom.config.siteStructure = {
      unsupportedBrowserPage : "/content/fom-website/en/error/unsupported-browser.html"
    };
      fom.config.services = {
          "contextpath" : "/v1/event-tracker",
          "endpoint": "api.formula1.com",
          "apiKey": "qPgPPRJyGCIPxFT3el4MF7thXHyJCzAP",
          "locale": "en",
          "geoIPService": "https://svc.formula1.com/whereami",
          "paymentplan" : "/v1/account/payment-plans/countries/",
          "instagramAppId" : "252983635559206",
          "instagramClientToken" : "bb4db84e0a89c89767f7e766524decc4"
    };
    fom.config.lead_source = {
      "formula1": "web_f1core"
       };
      fom.underscoreSetting = {
          interpolate: /\<\@\=(.+?)\@\>/gim,
          evaluate: /\<\@([\s\S]+?)\@\>/gim,
          escape: /\<\@\-(.+?)\@\>/gim
      };
      fom.config.ooyalaURLs = {
      "player": "//player.ooyala.com/core/32b4d2fb0c01426fbdcb5c46aeb4bbe5",
      "analytics": "//player.ooyala.com/static/v4/production/analytics-plugin/googleAnalytics.min.js"
    };
  </script>
  ```

## API Results

### Event Tracker

```bash
curl -s https://api.formula1.com/v1/event-tracker -H "apikey: qPgPPRJyGCIPxFT3el4MF7thXHyJCzAP" -H "locale: en"
# curl -s https://api.formula1.com/v1/event-tracker -H "apikey: qPgPPRJyGCIPxFT3el4MF7thXHyJCzAP" -H "locale: en" | jq '.seasonContext.timetables[] | select(.description == "Race")'
```

#### Pre-race

```json
{
    "raceHubId": "5OEc3LgWfOzpQXNf7jVD51",
    "locale": "en",
    "createdAt": "2021-03-09T14:33:44.399Z",
    "updatedAt": "2021-04-16T14:43:15.550Z",
    "fomRaceId": "1066",
    "brandColourHexadecimal": "ee0000",
    "circuitSmallImage": {
        "title": "Portugal.png",
        "path": "/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Portugal.png",
        "url": "https://www.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Portugal.png"
    },
    "links": [],
    "seasonContext": {
        "id": "4kUSabodBuSKy8I2ce68iW",
        "contentType": "f1SeasonContext",
        "createdAt": "2018-05-24T08:30:54.749Z",
        "updatedAt": "2021-04-19T14:01:15.153Z",
        "locale": "en",
        "seasonYear": "2021",
        "currentOrNextMeetingKey": "1066",
        "state": "IDLE",
        "eventState": "IDLE",
        "liveEventId": "1087",
        "liveTimingsSource": "https://livetiming.formula1.com/signalr",
        "liveBlog": {
            "contentType": "atomLiveBlogScribbleLive",
            "title": "Emilia Romagna 2021 Race",
            "scribbleEventId": "/event/2954409/37480"
        },
        "seasonState": "DURING-SEASON",
        "raceListingOverride": 2021,
        "driverAndTeamListingOverride": 2021,
        "timetables": [
            {
                "state": "upcoming",
                "session": "p3",
                "gmtOffset": "+01:00",
                "description": "Practice 3",
                "endTime": "2021-05-01T13:00:00",
                "startTime": "2021-05-01T12:00:00"
            },
            {
                "state": "upcoming",
                "session": "p2",
                "gmtOffset": "+01:00",
                "description": "Practice 2",
                "endTime": "2021-04-30T16:00:00",
                "startTime": "2021-04-30T15:00:00"
            },
            {
                "state": "upcoming",
                "session": "r",
                "gmtOffset": "+01:00",
                "description": "Race",
                "endTime": "2021-05-02T17:00:00",
                "startTime": "2021-05-02T15:00:00"
            },
            {
                "state": "upcoming",
                "session": "p1",
                "gmtOffset": "+01:00",
                "description": "Practice 1",
                "endTime": "2021-04-30T12:30:00",
                "startTime": "2021-04-30T11:30:00"
            },
            {
                "state": "upcoming",
                "session": "q",
                "gmtOffset": "+01:00",
                "description": "Qualifying",
                "endTime": "2021-05-01T16:00:00",
                "startTime": "2021-05-01T15:00:00"
            }
        ],
        "replayBaseUrl": "https://livetiming.formula1.com/static/",
        "seasonContextUIState": 5
    },
    "raceResults": [],
    "race": {
        "meetingCountryName": "Portugal",
        "meetingStartDate": "2021-04-30T11:55:00.000Z",
        "meetingOfficialName": "Formula 1 Heineken Grande Prémio De Portugal 2021",
        "meetingEndDate": "2021-05-02T16:00:00.000Z"
    },
    "seasonYearImage": "https://www.formula1.com/content/dam/fom-website/2018-redesign-assets/year%20icon/2021.png"
}
```

#### Race Started

```json
{
  "raceHubId": "fUQ5fHzVeatuvWVarxS6B",
  "locale": "en",
  "createdAt": "2021-01-18T09:42:51.598Z",
  "updatedAt": "2021-04-17T14:09:24.208Z",
  "fomRaceId": "1065",
  "brandColourHexadecimal": "ee0000",
  "circuitSmallImage": {
    "title": "Emilia Romagna.png",
    "path": "/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Emilia%20Romagna.png",
    "url": "https://www.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Emilia%20Romagna.png"
  },
  "links": [],
  "seasonContext": {
    "id": "4kUSabodBuSKy8I2ce68iW",
    "contentType": "f1SeasonContext",
    "createdAt": "2018-05-24T08:30:54.749Z",
    "updatedAt": "2021-04-18T12:55:30.129Z",
    "locale": "en",
    "seasonYear": "2021",
    "currentOrNextMeetingKey": "1065",
    "state": "RACE",
    "eventState": "IDLE",
    "liveEventId": "1087",
    "liveTimingsSource": "https://livetiming.formula1.com/signalr",
    "liveBlog": {
      "contentType": "atomLiveBlogScribbleLive",
      "title": "Emilia Romagna 2021 Race",
      "scribbleEventId": "/event/2954409/37480"
    },
    "seasonState": "DURING-SEASON",
    "raceListingOverride": 2021,
    "driverAndTeamListingOverride": 2021,
    "timetables": [
      {
        "state": "completed",
        "session": "p3",
        "gmtOffset": "+02:00",
        "description": "Practice 3",
        "endTime": "2021-04-17T12:00:00",
        "startTime": "2021-04-17T11:00:00"
      },
      {
        "state": "completed",
        "session": "p2",
        "gmtOffset": "+02:00",
        "description": "Practice 2",
        "endTime": "2021-04-16T15:30:00",
        "startTime": "2021-04-16T14:30:00"
      },
      {
        "state": "started",
        "session": "r",
        "gmtOffset": "+02:00",
        "description": "Race",
        "endTime": "2021-04-18T17:00:00",
        "startTime": "2021-04-18T15:00:00"
      },
      {
        "state": "completed",
        "session": "p1",
        "gmtOffset": "+02:00",
        "description": "Practice 1",
        "endTime": "2021-04-16T12:00:00",
        "startTime": "2021-04-16T11:00:00"
      },
      {
        "state": "completed",
        "session": "q",
        "gmtOffset": "+02:00",
        "description": "Qualifying",
        "endTime": "2021-04-17T15:00:00",
        "startTime": "2021-04-17T14:00:00"
      }
    ],
    "replayBaseUrl": "https://livetiming.formula1.com/static/",
    "seasonContextUIState": 5
  },
  "raceResults": [],
  "race": {
    "meetingCountryName": "Italy",
    "meetingStartDate": "2021-04-16T07:30:00.000Z",
    "meetingOfficialName": "Formula 1 Pirelli Gran Premio Del Made In Italy E Dell'emilia Romagna 2021",
    "meetingEndDate": "2021-04-18T15:00:00.000Z"
  },
  "seasonYearImage": "https://www.formula1.com/content/dam/fom-website/2018-redesign-assets/year%20icon/2021.png",
  "sessionLinkSets": {
    "replayLinks": [
      {
        "session": "p1",
        "text": "replay",
        "url": "https://livetiming.formula1.com/static/2021/2021-04-18_Emilia_Romagna_Grand_Prix/2021-04-16_Practice_1/",
        "linkType": "Replay"
      },
      {
        "session": "p2",
        "text": "replay",
        "url": "https://livetiming.formula1.com/static/2021/2021-04-18_Emilia_Romagna_Grand_Prix/2021-04-16_Practice_2/",
        "linkType": "Replay"
      },
      {
        "session": "p3",
        "text": "replay",
        "url": "https://livetiming.formula1.com/static/2021/2021-04-18_Emilia_Romagna_Grand_Prix/2021-04-17_Practice_3/",
        "linkType": "Replay"
      },
      {
        "session": "q",
        "text": "replay",
        "url": "https://livetiming.formula1.com/static/2021/2021-04-18_Emilia_Romagna_Grand_Prix/2021-04-17_Qualifying/",
        "linkType": "Replay"
      }
    ]
  }
}
```

#### Race Complete

```json
{
  "raceHubId": "5OEc3LgWfOzpQXNf7jVD51",
  "locale": "en",
  "createdAt": "2021-03-09T14:33:44.399Z",
  "updatedAt": "2021-05-02T16:00:06.561Z",
  "fomRaceId": "1066",
  "brandColourHexadecimal": "ee0000",
  "headline": "Hamilton beats Verstappen and Bottas to win in Portimao",
  "curatedSection": {
    "contentType": "assemblySimpleArticleList",
    "title": "Event Tracker Portugal 2021 - Curated Articles",
    "items": [
      {
        "id": "2ePUSr7DbPpE95DpqQeQmM",
        "updatedAt": "2021-05-09T00:00:00.000Z",
        "realUpdatedAt": "2021-05-02T16:34:54.257Z",
        "locale": "en",
        "title": "AS IT HAPPENED: Follow all the action from the Portuguese Grand Prix",
        "slug": "live-coverage-follow-all-the-action-from-the-portuguese-grand-prix-at",
        "articleType": "Live Blog",
        "metaDescription": "Live coverage of Sunday's Formula 1 Heineken Grande Premio de Portugal 2021 in Portimao.",
        "thumbnail": {
          "image": {
            "title": "1315864991",
            "path": "/content/dam/fom-website/sutton/2021/Portugal/Sunday/1315864991.jpg",
            "url": "https://www.formula1.com/content/dam/fom-website/sutton/2021/Portugal/Sunday/1315864991.jpg"
          }
        },
        "isLive": false
      },
      {
        "id": "5jxpjolcJnFSJ38iarOgg6",
        "updatedAt": "2021-05-02T15:46:50.275Z",
        "realUpdatedAt": "2021-05-02T16:41:10.252Z",
        "locale": "en",
        "title": "Hamilton takes victory in Portugal after crucial overtakes on Verstappen and Bottas",
        "slug": "hamilton-takes-victory-in-portugal-after-crucial-overtakes-on-verstappen-and",
        "articleType": "Report",
        "metaDescription": "A brilliantly managed race from Mercedes’ Lewis Hamilton saw him take his second win of the 2021 season at the Portuguese Grand Prix, the Briton finishing ahead of Red Bull’s Max Verstappen, as Hamilton’s polesitting team mate Valtteri Bottas came home third.\n\n",
        "thumbnail": {
          "image": {
            "title": "GettyImages-1315857251.jpg",
            "path": "/content/dam/fom-website/Upgrade/PortugalManualUploads/Sunday/GettyImages-1315857251.jpg",
            "url": "https://www.formula1.com/content/dam/fom-website/Upgrade/PortugalManualUploads/Sunday/GettyImages-1315857251.jpg"
          }
        }
      }
    ]
  },
  "circuitSmallImage": {
    "title": "Portugal.png",
    "path": "/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Portugal.png",
    "url": "https://www.formula1.com/content/dam/fom-website/2018-redesign-assets/Track%20icons%204x3/Portugal.png"
  },
  "links": [
    {
      "text": "RESULTS",
      "url": "https://www.formula1.com/en/results.html/2021/races/1066/portugal/race-result.html"
    }
  ],
  "seasonContext": {
    "id": "4kUSabodBuSKy8I2ce68iW",
    "contentType": "f1SeasonContext",
    "createdAt": "2018-05-24T08:30:54.749Z",
    "updatedAt": "2021-05-02T16:01:03.265Z",
    "locale": "en",
    "seasonYear": "2021",
    "currentOrNextMeetingKey": "1066",
    "state": "POST-RACE",
    "eventState": "IDLE",
    "liveEventId": "1087",
    "liveTimingsSource": "https://livetiming.formula1.com/signalr",
    "liveBlog": {
      "contentType": "atomLiveBlogScribbleLive",
      "title": "Portugal 2021 Race",
      "scribbleEventId": "/event/2955747/37480"
    },
    "seasonState": "DURING-SEASON",
    "raceListingOverride": 2021,
    "driverAndTeamListingOverride": 2021,
    "timetables": [
      {
        "state": "completed",
        "session": "p3",
        "gmtOffset": "+01:00",
        "description": "Practice 3",
        "endTime": "2021-05-01T13:00:00",
        "startTime": "2021-05-01T12:00:00"
      },
      {
        "state": "completed",
        "session": "p2",
        "gmtOffset": "+01:00",
        "description": "Practice 2",
        "endTime": "2021-04-30T16:00:00",
        "startTime": "2021-04-30T15:00:00"
      },
      {
        "state": "completed",
        "session": "r",
        "gmtOffset": "+01:00",
        "description": "Race",
        "endTime": "2021-05-02T17:00:00",
        "startTime": "2021-05-02T15:00:00"
      },
      {
        "state": "completed",
        "session": "p1",
        "gmtOffset": "+01:00",
        "description": "Practice 1",
        "endTime": "2021-04-30T12:30:00",
        "startTime": "2021-04-30T11:30:00"
      },
      {
        "state": "completed",
        "session": "q",
        "gmtOffset": "+01:00",
        "description": "Qualifying",
        "endTime": "2021-05-01T16:00:00",
        "startTime": "2021-05-01T15:00:00"
      }
    ],
    "replayBaseUrl": "https://livetiming.formula1.com/static/",
    "seasonContextUIState": 5
  },
  "raceResults": [
    {
      "driverTLA": "HAM",
      "driverFirstName": "Lewis",
      "driverLastName": "Hamilton",
      "teamName": "Mercedes",
      "positionNumber": "1",
      "raceTime": "1:34:31.421",
      "teamColourCode": "00d2be",
      "gapToLeader": "0.0",
      "driverImage": "https://www.formula1.com/content/dam/fom-website/drivers/L/LEWHAM01_Lewis_Hamilton/lewham01.png"
    },
    {
      "driverTLA": "VER",
      "driverFirstName": "Max",
      "driverLastName": "Verstappen",
      "teamName": "Red Bull Racing",
      "positionNumber": "2",
      "raceTime": "1:35:00.569",
      "teamColourCode": "0600ef",
      "gapToLeader": "29.148",
      "driverImage": "https://www.formula1.com/content/dam/fom-website/drivers/M/MAXVER01_Max_Verstappen/maxver01.png"
    },
    {
      "driverTLA": "BOT",
      "driverFirstName": "Valtteri",
      "driverLastName": "Bottas",
      "teamName": "Mercedes",
      "positionNumber": "3",
      "raceTime": "1:35:04.951",
      "teamColourCode": "00d2be",
      "gapToLeader": "33.53",
      "driverImage": "https://www.formula1.com/content/dam/fom-website/drivers/V/VALBOT01_Valtteri_Bottas/valbot01.png"
    }
  ],
  "race": {
    "meetingCountryName": "Portugal",
    "meetingStartDate": "2021-04-30T11:55:00.000Z",
    "meetingOfficialName": "Formula 1 Heineken Grande Prémio De Portugal 2021",
    "meetingEndDate": "2021-05-02T16:00:00.000Z"
  },
  "seasonYearImage": "https://www.formula1.com/content/dam/fom-website/2018-redesign-assets/year%20icon/2021.png",
  "sessionLinkSets": {
    "replayLinks": [
      {
        "session": "p1",
        "text": "replay",
        "url": "https://livetiming.formula1.com/static/2021/2021-05-02_Portuguese_Grand_Prix/2021-04-30_Practice_1/",
        "linkType": "Replay"
      },
      {
        "session": "p2",
        "text": "replay",
        "url": "https://livetiming.formula1.com/static/2021/2021-05-02_Portuguese_Grand_Prix/2021-04-30_Practice_2/",
        "linkType": "Replay"
      },
      {
        "session": "p3",
        "text": "replay",
        "url": "https://livetiming.formula1.com/static/2021/2021-05-02_Portuguese_Grand_Prix/2021-05-01_Practice_3/",
        "linkType": "Replay"
      },
      {
        "session": "q",
        "text": "replay",
        "url": "https://livetiming.formula1.com/static/2021/2021-05-02_Portuguese_Grand_Prix/2021-05-01_Qualifying/",
        "linkType": "Replay"
      },
      {
        "session": "r",
        "text": "replay",
        "url": "https://livetiming.formula1.com/static/2021/2021-05-02_Portuguese_Grand_Prix/2021-05-02_Race/",
        "linkType": "Replay"
      }
    ]
  }
}
```

### Season Context

```bash
curl -s https://api.formula1.com/v1/context/season -H "apikey: qPgPPRJyGCIPxFT3el4MF7thXHyJCzAP" -H "locale: en" | jq
```

#### Pre-race

```json
{
    "id": "4kUSabodBuSKy8I2ce68iW",
    "contentType": "f1SeasonContext",
    "createdAt": "2018-05-24T08:30:54.749Z",
    "updatedAt": "2021-04-19T14:01:15.153Z",
    "locale": "en",
    "seasonYear": "2021",
    "currentOrNextMeetingKey": "1066",
    "state": "IDLE",
    "eventState": "IDLE",
    "liveEventId": "1087",
    "liveTimingsSource": "https://livetiming.formula1.com/signalr",
    "liveBlog": {
        "contentType": "atomLiveBlogScribbleLive",
        "title": "Emilia Romagna 2021 Race",
        "scribbleEventId": "/event/2954409/37480"
    },
    "seasonState": "DURING-SEASON",
    "raceListingOverride": 2021,
    "driverAndTeamListingOverride": 2021,
    "timetables": [
        {
            "state": "upcoming",
            "session": "p3",
            "gmtOffset": "+01:00",
            "description": "Practice 3",
            "endTime": "2021-05-01T13:00:00",
            "startTime": "2021-05-01T12:00:00"
        },
        {
            "state": "upcoming",
            "session": "p2",
            "gmtOffset": "+01:00",
            "description": "Practice 2",
            "endTime": "2021-04-30T16:00:00",
            "startTime": "2021-04-30T15:00:00"
        },
        {
            "state": "upcoming",
            "session": "r",
            "gmtOffset": "+01:00",
            "description": "Race",
            "endTime": "2021-05-02T17:00:00",
            "startTime": "2021-05-02T15:00:00"
        },
        {
            "state": "upcoming",
            "session": "p1",
            "gmtOffset": "+01:00",
            "description": "Practice 1",
            "endTime": "2021-04-30T12:30:00",
            "startTime": "2021-04-30T11:30:00"
        },
        {
            "state": "upcoming",
            "session": "q",
            "gmtOffset": "+01:00",
            "description": "Qualifying",
            "endTime": "2021-05-01T16:00:00",
            "startTime": "2021-05-01T15:00:00"
        }
    ],
    "replayBaseUrl": "https://livetiming.formula1.com/static/",
    "seasonContextUIState": 5
}
```
#### Race Started

```json
{
  "id": "4kUSabodBuSKy8I2ce68iW",
  "contentType": "f1SeasonContext",
  "createdAt": "2018-05-24T08:30:54.749Z",
  "updatedAt": "2021-04-18T12:55:30.129Z",
  "locale": "en",
  "seasonYear": "2021",
  "currentOrNextMeetingKey": "1065",
  "state": "RACE",
  "eventState": "IDLE",
  "liveEventId": "1087",
  "liveTimingsSource": "https://livetiming.formula1.com/signalr",
  "liveBlog": {
    "contentType": "atomLiveBlogScribbleLive",
    "title": "Emilia Romagna 2021 Race",
    "scribbleEventId": "/event/2954409/37480"
  },
  "seasonState": "DURING-SEASON",
  "raceListingOverride": 2021,
  "driverAndTeamListingOverride": 2021,
  "timetables": [
    {
      "state": "completed",
      "session": "p3",
      "gmtOffset": "+02:00",
      "description": "Practice 3",
      "endTime": "2021-04-17T12:00:00",
      "startTime": "2021-04-17T11:00:00"
    },
    {
      "state": "completed",
      "session": "p2",
      "gmtOffset": "+02:00",
      "description": "Practice 2",
      "endTime": "2021-04-16T15:30:00",
      "startTime": "2021-04-16T14:30:00"
    },
    {
      "state": "started",
      "session": "r",
      "gmtOffset": "+02:00",
      "description": "Race",
      "endTime": "2021-04-18T17:00:00",
      "startTime": "2021-04-18T15:00:00"
    },
    {
      "state": "completed",
      "session": "p1",
      "gmtOffset": "+02:00",
      "description": "Practice 1",
      "endTime": "2021-04-16T12:00:00",
      "startTime": "2021-04-16T11:00:00"
    },
    {
      "state": "completed",
      "session": "q",
      "gmtOffset": "+02:00",
      "description": "Qualifying",
      "endTime": "2021-04-17T15:00:00",
      "startTime": "2021-04-17T14:00:00"
    }
  ],
  "replayBaseUrl": "https://livetiming.formula1.com/static/",
  "seasonContextUIState": 5
}
```

#### Race Complete

```json
{
  "id": "4kUSabodBuSKy8I2ce68iW",
  "contentType": "f1SeasonContext",
  "createdAt": "2018-05-24T08:30:54.749Z",
  "updatedAt": "2021-05-02T16:01:03.265Z",
  "locale": "en",
  "seasonYear": "2021",
  "currentOrNextMeetingKey": "1066",
  "state": "POST-RACE",
  "eventState": "IDLE",
  "liveEventId": "1087",
  "liveTimingsSource": "https://livetiming.formula1.com/signalr",
  "liveBlog": {
    "contentType": "atomLiveBlogScribbleLive",
    "title": "Portugal 2021 Race",
    "scribbleEventId": "/event/2955747/37480"
  },
  "seasonState": "DURING-SEASON",
  "raceListingOverride": 2021,
  "driverAndTeamListingOverride": 2021,
  "timetables": [
    {
      "state": "completed",
      "session": "p3",
      "gmtOffset": "+01:00",
      "description": "Practice 3",
      "endTime": "2021-05-01T13:00:00",
      "startTime": "2021-05-01T12:00:00"
    },
    {
      "state": "completed",
      "session": "p2",
      "gmtOffset": "+01:00",
      "description": "Practice 2",
      "endTime": "2021-04-30T16:00:00",
      "startTime": "2021-04-30T15:00:00"
    },
    {
      "state": "completed",
      "session": "r",
      "gmtOffset": "+01:00",
      "description": "Race",
      "endTime": "2021-05-02T17:00:00",
      "startTime": "2021-05-02T15:00:00"
    },
    {
      "state": "completed",
      "session": "p1",
      "gmtOffset": "+01:00",
      "description": "Practice 1",
      "endTime": "2021-04-30T12:30:00",
      "startTime": "2021-04-30T11:30:00"
    },
    {
      "state": "completed",
      "session": "q",
      "gmtOffset": "+01:00",
      "description": "Qualifying",
      "endTime": "2021-05-01T16:00:00",
      "startTime": "2021-05-01T15:00:00"
    }
  ],
  "replayBaseUrl": "https://livetiming.formula1.com/static/",
  "seasonContextUIState": 5
}
```
