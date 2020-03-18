import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.axis as ax
import matplotlib.cbook as cbook
from scipy.optimize import curve_fit
import sys

def func(x,a,b,c,d):
    return a * (x**3) + b * (x**2) + c * x + d
initial = (0.5, 0.5, 0.5, 0.5)

f = pd.read_csv('data/uk.csv')

change = f['daily new'].pct_change().dropna()

col_params = {}

fit = f.dropna()
# Curve fit
x_orig = fit['number positive'].index.astype(float).values
y_orig = fit['number positive'].values
params = curve_fit(func, x_orig, y_orig, initial)
col_params = params[0]

# Extrapolate
x = f[pd.isnull(f)].index.astype(float).values
y = func(x, col_params[0], col_params[1], col_params[2], col_params[3])



# --- PLOTTING --
x += 1
plt.plot(x.astype(int),y)
ticks = plt.xticks(x.astype(int))

plt.locator_params(axis='x', nbins=7)

# plt.setp(ticks, visible=False)
# plt.setp(ticks[::2], visible=True)

plt.grid(True)

x_orig += 1
plt.scatter(x_orig, y_orig, color='black')

plt.xlabel("Nth Day of March")
plt.ylabel("Number of Cases")
plt.title("Neil King's Fun Fun Fun Coronavirus Graph")

# img = plt.imread('neilKing.jpeg')
# plt.imshow(img, extent=[0,31,0,5000], aspect='auto')


plt.show()
