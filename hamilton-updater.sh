#!/bin/bash

# maybe curl http://ergast.com/api/f1/2020/last/drivers/hamilton/results.json ?
# not sure about the update schedule though

command -v nokogiri 1>/dev/null 2>&1 || { echo >&2 "I require nokogiri but it's not installed. apt install ruby-nokogiri"; exit 1; }

pushd ~/dev/didhamiltonwin/ 1>/dev/null 2>&1
git checkout master 1>/dev/null 2>&1
git pull  1>/dev/null 2>&1

# curl -s https://api.formula1.com/v1/context/season -H "apikey: qPgPPRJyGCIPxFT3el4MF7thXHyJCzAP" -H "locale: en" | jq -r '.timetables[] | select (.description=="Race") | .state'
# upcoming
# started
# completed
# 
# curl -s https://api.formula1.com/v1/event-tracker -H "apikey: qPgPPRJyGCIPxFT3el4MF7thXHyJCzAP" -H "locale: en"

results=$(curl -s https://www.formula1.com/en/results.html/$(date +%Y)/races.html)
gp=$(echo "$results" | nokogiri -e 'puts $_.at_xpath("//table[@class=\"resultsarchive-table\"]/tbody/tr[last()]/td[2]/a").text.strip' 2>/dev/null)
date=$(echo "$results" | nokogiri -e 'puts $_.at_xpath("//table[@class=\"resultsarchive-table\"]/tbody/tr[last()]/td[3]").text' 2>/dev/null)
winner=$(echo "$results" | nokogiri -e 'puts $_.at_xpath("//table[@class=\"resultsarchive-table\"]/tbody/tr[last()]/td[4]/span[2]").text' 2>/dev/null | tr 'A-Z' 'a-z')

if [ "$winner" == "hamilton" ]; then
  answer="YES"
else
  answer="NO"
fi

echo "GP:       ${gp}, ${date}"
echo "Hamilton? ${answer}"
echo -e "# ${answer}." >index.md

sed -i'' -e "s/description.*/description: \"${gp}: ${date}\"/g" _config.yml

if [[ $(git status --porcelain | wc -l) -gt 0 ]]; then
  git add .
  git commit -m "updating for ${gp}: ${date}"
  git push origin master
fi

popd 1>/dev/null 2>&1

exit 0
