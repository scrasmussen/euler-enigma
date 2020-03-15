#
# Going through two data sets to produce the imdb links to easily add the movies
# to an icheckmovie list
#

import numpy as np
import pandas as pd

# 'data/imdb_filmography.txt'

# --- handle wiki data ---
wiki_file = 'data/wiki_film.txt'
w_file = open(wiki_file, 'r')
w_names = ['year','film','credited']

# setup wiki dataframe
wiki = pd.DataFrame(columns = w_names)
while True:
    line = w_file.readline().strip()
    if len(line) == 0:
        break
    elif (line[0:2] == "|-"):
        year = w_file.readline().strip()
        film = w_file.readline().strip()
        w_file.readline()
        uncredited = w_file.readline()
        if (uncredited[0:12] == "| Uncredited"):
            uncredited = True
        else:
            uncredited = False
        wiki = wiki.append({w_names[0]:year, w_names[1]:film,
                            w_names[2]:uncredited}, ignore_index=True)
    else:
        w_file.readline()
