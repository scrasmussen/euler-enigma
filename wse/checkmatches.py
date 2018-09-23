#
# checkmatches.py
# A non-spoiler top prowrestling match finder
# list from http://www.profightdb.com/top-rated-matches.html
# For copyright see LICENSE.md
# Author: Soren Rasmussen github: scrasmussen
#

INTERWEBZ=False

from urllib.request import urlopen
from bs4 import BeautifulSoup
from random import randint
from datetime import datetime as dt
from dateutil.parser import parse
import pandas as pd


def sortTopMatches(df):
  df.to_csv("topMatches.csv", index=False, header=False)

def sortByDate(df):
  df["DATE"] =pd.to_datetime(df.DATE)
  df.sort_values('DATE',inplace=True)
  # print(df)
  df.to_csv("sortByDate.csv", index=False, header=False)


print("Start")
if (INTERWEBZ):
  SEARCHURL="http://www.profightdb.com/top-rated-matches.html"
  req = urlopen(SEARCHURL);
  soup = BeautifulSoup(req,"lxml")
else:
  soup = BeautifulSoup(open("./top-rated-matches.html"),"lxml")
matches = soup.findAll(class_="chequered")
table = soup.find('table')

RATING=[]
DATE=[]
SHOW=[]
MATCH=[]
# print(table)
for row in table.find_all("tr"):
  cell = row.find_all("td")
  if ((len(cell) == 6)):
    RATING.append(cell[0].text.strip())
    DATE.append(parse(cell[1].text.strip()).strftime("%d, %b %Y"))

    SHOW.append(cell[2].text.lstrip().replace('\n',':'))
    if (randint(0,1)):
      match = cell[3].text.lstrip() + "vs " + cell[4].text.lstrip()
    else:
      match = cell[4].text.lstrip() + "vs " + cell[3].text.lstrip()
    MATCH.append(match)

df = pd.DataFrame(RATING)
df["DATE"]=DATE
df["SHOW"]=SHOW
df["MATCH"]=MATCH
df.insert(0,"CHECK",'[ ]')

# Save the sorted by ranking
# sortTopMatches(df)
# Save the sorted by date list
# sortByDate(df)
print("Fin")
