#
# checkflix.py
# Find which movies in icheckmovies.com lists are on Netflix
# For copyright see LICENSE.md
# Author: Soren Rasmussen github: scrasmussen
# 
from urllib.request import urlopen
from bs4 import BeautifulSoup

# List name
#  |-get a list from iCheckMovies
#  |-check a movie against allflicks.net


def initListList():
    print("Create listList.txt")
    listList=[]
    # from 1 to 8
    for i in range(1,9):
        ICHECKURL="https://www.icheckmovies.com/lists/?page="+str(i)+"&tags=user:icheckmovies"
        print()
        print(ICHECKURL)
        req = urlopen(ICHECKURL);
        soup = BeautifulSoup(req,"lxml")
        titleList = soup.findAll(class_="title")
        for title in titleList[:-1]:
            listList.append(title["href"])

    f = open("listList.txt", 'w')
    for name in listList:
        f.write("%s\n"%name[7:-1])
    f.close()

def readListList():
    listList = []
    f = open("listList.txt")
    listList = f.read().splitlines()
    f.close()
    return listList


print("Start")

readList=1
if readList:
    listList = readListList()
else:
    initListList()

print(listList)

print("Fin")

