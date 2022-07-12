# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import os, sys
from netCDF4 import num2date, date2num, date2index
from netCDF4 import Dataset
import numpy as np
import datetime
from datetime import date
from datetime import datetime, timedelta
import matplotlib.pyplot as plt
import matplotlib.dates
import warnings

x = date.today()
s = x.strftime("%Y%m%d")
## ARCHIVOS ##
file1 = '/data/ww3/chiloe/' + str(s) + '/ww3_bocaguafo_' + str(s) + '.nc'
file2 = '/data/ww3/chiloe/' + str(s) + '/ww3_int1_' + str(s) + '.nc'
file3 = '/data/ww3/chiloe/' + str(s) + '/ww3_int2_' + str(s) + '.nc'
file4 = '/data/ww3/chiloe/' + str(s) + '/ww3_int3_' + str(s) + '.nc'

data1 = Dataset(file1)
data2 = Dataset(file2)
data3 = Dataset(file3)
data4 = Dataset(file4)
## ARCHIVOS

## VARIABLES ##
hs1 = data1.variables['hs']
fp1 = data1.variables['fp']
tp1 = 1/fp1[:]
hs2 = data2.variables['hs']
fp2 = data2.variables['fp']
tp2 = 1/fp2[:]
hs3 = data3.variables['hs']
fp3 = data3.variables['fp']
tp3 = 1/fp3[:]
hs4 = data4.variables['hs']
fp4 = data4.variables['fp']
tp4 = 1/fp4[:]
nctime = data1.variables['time']
time_units = nctime.units[:]
## VARIABLES ##

## FECHA ##
dates = num2date(nctime[:], time_units)
dates_of_data = [date.strftime('%Y-%m-%d %H:%M:%S') for date in dates[:]]
## FECHA ##

## FIGURAS ## 

## Figura 1 ##
fig1 = plt.figure(figsize=(12,6))
fig1.suptitle('Pronósticos WW3 - Boca del Guafo - X Región de Chile \nLatitud 43.71\u00b0S - Longitud 73.92\u00b0W')
ax = fig1.add_subplot(211)
plt.plot(dates_of_data[0:241], hs1[0:241], c='b')
plt.xticks( dates_of_data[0:241:12] )
ax.grid(True)
ax.set_xticklabels([])
ax.set_ylabel('Altura Significativa de Ola [m]')
axx = fig1.add_subplot(212)
plt.plot(dates_of_data[0:241], tp1[0:241], c='b')
plt.xticks(rotation=75)
plt.xticks( dates_of_data[0:241:12] )
axx.grid(True)
axx.set_xlabel('Tiempo')
axx.set_ylabel('Periodo Punta [s]')
plt.savefig('pronosticoWW3_pto1_' + str(s) + '.png', bbox_inches="tight")
#plt.show()
## Figura 1 ##

## Figura 2 ##
fig2 = plt.figure(figsize=(12,6))
fig2.suptitle('Pronósticos WW3 - Mar Interior de Chiloé - X Región de Chile \nLatitud 43.40\u00b0S - Longitud 73.39\u00b0W')
ax = fig2.add_subplot(211)
plt.plot(dates_of_data[0:241], hs2[0:241], c='b')
plt.xticks( dates_of_data[0:241:12] )
ax.grid(True)
ax.set_xticklabels([])
ax.set_ylabel('Altura Significativa de Ola [m]')
axx = fig2.add_subplot(212)
plt.plot(dates_of_data[0:241], tp2[0:241], c='b')
plt.xticks(rotation=75)
plt.xticks( dates_of_data[0:241:12] )
axx.grid(True)
axx.set_xlabel('Tiempo')
axx.set_ylabel('Periodo Punta [s]')
plt.savefig('pronosticoWW3_pto2_' + str(s) + '.png', bbox_inches="tight")
#plt.show()
## Figura 2 ##

## Figura 3 ##
fig3 = plt.figure(figsize=(12,6))
fig3.suptitle('Pronósticos WW3 - Mar Interior de Chiloé - X Región de Chile \nLatitud 43.10\u00b0S - Longitud 73.16\u00b0W')
ax = fig3.add_subplot(211)
plt.plot(dates_of_data[0:241], hs3[0:241], c='b')
plt.xticks( dates_of_data[0:241:12] )
ax.grid(True)
ax.set_xticklabels([])
ax.set_ylabel('Altura Significativa de Ola [m]')
axx = fig3.add_subplot(212)
plt.plot(dates_of_data[0:241], tp3[0:241], c='b')
plt.xticks(rotation=75)
plt.xticks( dates_of_data[0:241:12] )
axx.grid(True)
axx.set_xlabel('Tiempo')
axx.set_ylabel('Periodo Punta [s]')
plt.savefig('pronosticoWW3_pto3_' + str(s) + '.png', bbox_inches="tight")
#plt.show()
## Figura 3 ##

## Figura 4 ##
fig4 = plt.figure(figsize=(12,6))
fig4.suptitle('Pronósticos WW3 - Mar Interior de Chiloé - X Región de Chile \nLatitud 42.77\u00b0S - Longitud 73.29\u00b0W')
ax = fig4.add_subplot(211)
plt.plot(dates_of_data[0:241], hs4[0:241], c='b')
plt.xticks( dates_of_data[0:241:12] )
ax.grid(True)
ax.set_xticklabels([])
ax.set_ylabel('Altura Significativa de Ola [m]')
axx = fig4.add_subplot(212)
plt.plot(dates_of_data[0:241], tp4[0:241], c='b')
plt.xticks(rotation=75)
plt.xticks( dates_of_data[0:241:12] )
axx.grid(True)
axx.set_xlabel('Tiempo')
axx.set_ylabel('Periodo Punta [s]')
plt.savefig('pronosticoWW3_pto4_' + str(s) + '.png', bbox_inches="tight")
#plt.show()
## Figura 4 ##
