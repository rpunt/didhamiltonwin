# Did Hamilton win?

## An up-to-the-minute measure of whether the latest F1 race was worth watching: [https://didhamiltonwin.com/](https://didhamiltonwin.com/)

If you're not a fan of [Formula 1](https://formula1.com), you're probably not familiar with the extent to which [@MercedesAMGF1](https://twitter.com/MercedesAMGF1) and [@LewisHamilton](https://twitter.com/lewishamilton) have dominated the last 6 years. For me, it's gotten to the point that I don't bother watching the race if I know Hamilton won, or at least I don't make it a priority. But how to know in advance whether the race was worth watching without spoiling the results?

F1 doesn't have a publicly-available API I could find, so I've resorted to scraping their race results page. No, seriously.

```bash
function hamilton() {
  results=$(curl -s https://www.formula1.com/en/results.html/$(date +%Y)/races.html)
  gp=$(echo "$results" | nokogiri -e 'puts $_.at_xpath("//table[@class=\"resultsarchive-table\"]/tbody/tr[last()]/td[2]/a").text.strip' 2>/dev/null)
  date=$(echo "$results" | nokogiri -e 'puts $_.at_xpath("//table[@class=\"resultsarchive-table\"]/tbody/tr[last()]/td[3]").text' 2>/dev/null)
  winner=$(echo "$results" | nokogiri -e 'puts $_.at_xpath("//table[@class=\"resultsarchive-table\"]/tbody/tr[last()]/td[4]/span[2]").text' 2>/dev/null | tr 'A-Z' 'a-z')
  echo -e "Did Hamilton win?\n${gp}: ${date}\n"
  if [ "$winner" == "hamilton" ]; then
    echo "YES. I'm guessing Ferrari botched team orders, and Williams probably came last."
  else
    echo "NO. ANYTHING IS POSSIBLE. REVEL IN THE UNPREDICTABLITY OF LIFE."
  fi
}
```

But how to get that result if I'm away from home? Simple: have a Raspberry Pi do the scraping for me. I set up [this site](https://didhamiltonwin.com/), hosted it on [GitHub Pages](https://pages.github.com/), and since the site was now just a git repo, it was easy enough to just run this script every minute of every Sunday, and have up-to-the-minute race results anywhere.

```bash
#!/bin/bash

command -v nokogiri 1>/dev/null 2>&1 || { echo >&2 "I require nokogiri but it's not installed. apt install ruby-nokogiri"; exit 1; }

pushd ~/dev/didhamiltonwin/ 1>/dev/null 2>&1
git checkout master 1>/dev/null 2>&1
git pull  1>/dev/null 2>&1

results=$(curl -s https://www.formula1.com/en/results.html/$(date +%Y)/races.html)
gp=$(echo "$results" | nokogiri -e 'puts $_.at_xpath("//table[@class=\"resultsarchive-table\"]/tbody/tr[last()]/td[2]/a").text.strip' 2>/dev/null)
date=$(echo "$results" | nokogiri -e 'puts $_.at_xpath("//table[@class=\"resultsarchive-table\"]/tbody/tr[last()]/td[3]").text' 2>/dev/null)
winner=$(echo "$results" | nokogiri -e 'puts $_.at_xpath("//table[@class=\"resultsarchive-table\"]/tbody/tr[last()]/td[4]/span[2]").text' 2>/dev/null | tr 'A-Z' 'a-z')
if [ "$winner" == "hamilton" ]; then
  echo -e "# YES.\n\n#### I'm guessing Ferrari botched team orders, and Williams probably came last." >index.md
else
  echo -e "# NO.\n\n#### ANYTHING IS POSSIBLE. REVEL IN THE UNPREDICTABLITY OF LIFE." >index.md
fi

if [[ $(git status --porcelain | wc -l) -gt 0 ]]; then
  sed -i'' -e "s/description.*/description: \"${gp}: ${date}\"/g" _config.yml
  git add .
  git commit -m "updating for ${gp}: ${date}"
  git push origin master
fi

popd 1>/dev/null 2>&1

exit 0
```

Sure, it'd be nice to know if the race were currently running, which lap they were on, and maybe some other data. For now, this will do.
