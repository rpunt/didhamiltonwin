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

### Pre-race, event tracker

```bash
curl -s https://api.formula1.com/v1/event-tracker -H "apikey: qPgPPRJyGCIPxFT3el4MF7thXHyJCzAP" -H "locale: en"
# curl -s https://api.formula1.com/v1/event-tracker -H "apikey: qPgPPRJyGCIPxFT3el4MF7thXHyJCzAP" -H "locale: en" | jq '.seasonContext.timetables[] | select(.description == "Race")'
```

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

### In-race, season context

```bash
curl -s https://api.formula1.com/v1/context/season -H "apikey: qPgPPRJyGCIPxFT3el4MF7thXHyJCzAP" -H "locale: en" | jq
```

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
