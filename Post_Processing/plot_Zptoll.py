from __future__ import division
from math import *
import numpy as np
import sys
import os
from MySPheno import *
from matplotlib.ticker import LogFormatter #import matplotlib.pyplot as plt
from matplotlib.ticker import LogFormatterExponent
from matplotlib.ticker import LogFormatterSciNotation

import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt

import matplotlib.cm as cm

matplotlib.rcParams['text.usetex'] = True
matplotlib.rcParams['text.latex.unicode'] = True
from matplotlib.ticker import MultipleLocator, FormatStrFormatter
from matplotlib.ticker import AutoMinorLocator
from matplotlib.ticker import FuncFormatter
from scipy.interpolate import griddata
from scipy.interpolate import interp1d
import scipy
import pylab, subprocess
import pandas as pd
import shutil
import os.path
from scipy.interpolate import CubicSpline
#import seaborn as sns

import matplotlib.colors as colors
import matplotlib.cbook as cbook

sys.path.append("/usr/local/lib/python2.7/site-packages/")
from shapely.geometry import Point, Polygon


pylab.rcParams['figure.figsize'] = (8.0, 6.0)
#pylab.rcParams['figure.figsize'] = (10.0, 8.0)

#def exec_full(filepath):
#   global_namespace = {
#        "__file__": filepath,
#        "__name__": "__main__",
#   }
#   with open(filepath, 'rb') as file:
#        exec(compile(file.read(         
#        ), filepath, 'exec'), global_namespace)

# execute the file
#exec_full("/Users/oozdal/ExpDATA/ExDATA.py")

exec(open("/Users/oozdal/ExpDATA/ExDATA.py").read())

coord = []
for i in range(len(observedATLAS_CharNeut_139fb_Cha1)):
    coord.append((observedATLAS_CharNeut_139fb_Cha1[i], observedATLAS_CharNeut_139fb_Chi1[i]))
poly = Polygon(coord)



def ConvertGeVminus2toPb(valueforGeVminus2):

    return (0.38937929e9)*valueforGeVminus2

#############################################################################################################
"""
MG = pd.read_csv('/Users/oozdal/projects/Secluded_UMSSM/pptoZp.txt', header=0,sep="               |         ")
MG.columns =["run_name","MZp", "cross", "width"]
#######################################################################3
"""

d = pd.read_csv('/Users/oozdal/projects/Secluded_UMSSM/data/ZptollExcl_test.txt', header=None,sep=" ")
#d.columns =["MZp", "widthmassratio","BRZptoll","BRZptoqq","xsectionZp","QQcharge","gpGUT","gpSUSY","DAMU","Chi1","Chi2","Cha1"]
d.columns =["MZp", "widthmassratio","BRZptoll","BRZptoqq","QQcharge","gpGUT","gpSUSY","DAMU","Chi1","Chi2","Cha1", "BRCha1toWChi1", "BRZptoCha1Cha1","chi2","RelicDensity","xsecpptoZp","SIproton", "SIneutron", "sigmaV", "Sv1", "tanBeta", "m0", "m12", "AzeroOverm0", "LambdaInput", "KappaInput", "ALambdaInput", "AKappaInput", "vSInput", "v1Input", "v2Input", "v3Input","QS1charge","NMIX11","NMIX12","NMIX13","NMIX14","NMIX15","NMIX16","NMIX17","NMIX18","NMIX19"]

e = pd.read_csv('/Users/oozdal/projects/Secluded_UMSSM/data/ExcludedData_test.txt', header=None,sep=" ")
#e.columns =["MZp", "widthmassratio","BRZptoll","BRZptoqq","xsectionZp","QQcharge","gpGUT","gpSUSY","DAMU","Chi1","Chi2","Cha1"]
e.columns =["MZp", "widthmassratio","BRZptoll","BRZptoqq","QQcharge","gpGUT","gpSUSY","DAMU","Chi1","Chi2","Cha1", "BRCha1toWChi1", "BRZptoCha1Cha1","chi2","RelicDensity","xsecpptoZp","SIproton", "SIneutron", "sigmaV", "Sv1", "tanBeta", "m0", "m12", "AzeroOverm0", "LambdaInput", "KappaInput", "ALambdaInput", "AKappaInput", "vSInput", "v1Input", "v2Input", "v3Input","QS1charge"]

###################################################

BinoPrimeLike = np.array(d["NMIX11"])**2
BinoLike      = np.array(d["NMIX12"])**2
BinoMixing    = np.array(d["NMIX11"])**2 + np.array(d["NMIX12"])**2
WinoLike      = np.array(d["NMIX13"])**2
HiggsinoLike  = np.array(d["NMIX14"])**2 + np.array(d["NMIX15"])**2
SLike         = np.array(d["NMIX16"])**2
S1S2S3Like    = np.array(d["NMIX17"])**2 + np.array(d["NMIX18"])**2 + np.array(d["NMIX19"])**2
AllScalarCont = np.array(d["NMIX16"])**2 + np.array(d["NMIX17"])**2 + np.array(d["NMIX18"])**2 + np.array(d["NMIX19"])**2

###################################################


ee = MySPheno()

y_values = np.linspace(start = -0.5, stop = 0.5, num = 1000)
y_values = y_values.tolist()

QQ_list  = []
Qu_list  = []
Qd_list  = []
Ql_list  = []
Qv_list  = []
Qe_list  = []
QHu_list = []
QHd_list = []
Qs_list  = []
Qs1_list = []
Qs2_list = []
Qs3_list = []

for i in range(len(y_values)):
    ee.U1ChargeGenerator(1./27.,y_values[i],1./3.,-0.5)
    QQ_list.append(ee.QQ_charge)
    Qu_list.append(ee.Qu_charge)
    Qd_list.append(ee.Qd_charge)
    Ql_list.append(ee.Ql_charge)
    Qv_list.append(ee.Qv_charge)
    Qe_list.append(ee.Qe_charge)
    QHu_list.append(ee.QHu_charge)
    QHd_list.append(ee.QHd_charge)
    Qs_list.append(ee.Qs_charge)
    Qs1_list.append(ee.Qs1_charge)
    Qs2_list.append(ee.Qs2_charge)
    Qs3_list.append(ee.Qs3_charge)

############################################    Plot #1 ####################################################
"""

#cm = plt.cm.get_cmap('rainbow')

fig, ax1 = plt.subplots()
#col = np.array(MG["width"])/np.array(MG["MZp"])
sc1 = ax1.plot(np.array(d["MZp"])/1000., np.array(d["xsectionZp"]*d["BRZptoll"]), c="blue", marker=".", zorder=50,label=r"$ {\rm\ Secluded\ UMSSM} $ ")
#sc1 = ax1.plot(np.array(d["MZp"])/1000., np.array(d["cross"])*0.026, c="red", marker=".", zorder=50,label=r"$ {\rm\ Secluded\ UMSSM\ BR(Z^\prime \to \ell \ell ) = 2.6\% } $")
#cbar1 = plt.colorbar(sc1, format = "%.0f", extend="both")
#cbar1.set_label(r"$\displaystyle v^\prime {\rm\ SU(2)_R\ and\ BL\ SSB\ scale\ [TeV]}$", fontsize=20)

ax1.text(2.7, 3e-6, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, \mathcal{L} = 36.1\ fb^{-1}$", size=15)
ax1.text(2.7, 1e-6, r"$\displaystyle Z^\prime \to \ell^+ \ell^- (\ell = e, \mu) $", size=15)

ax1.plot(observedxsection13TeVZpmassforll,observedxsection13TeVZpll,label=r"$ {\rm\ ATLAS\ Observed\ Limit} $",color='r', zorder=40,alpha=0.7)

ax1.plot(expectedxsection13TeVZpmassforll,expectedxsection13TeVZpll,'--',label=r"$ {\rm\ Expected\ Limit} $",color='k', linewidth=2.0, zorder=30,alpha=0.7)

ax1.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll2sigmamin, expectedxsection13TeVZpll2sigmamax, label=r"$ {\rm\ Expected\ \pm\ 2 \sigma} $", facecolor = 'gold', interpolate=True, alpha=.2,linewidth=0.0, zorder=10)

ax1.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll1sigmamin, expectedxsection13TeVZpll1sigmamax, label=r"$ {\rm\ Expected\ \pm\ 1 \sigma} $", facecolor = 'lime', interpolate=True, alpha=.2,linewidth=0.0, zorder=20)

xmin = 0.2
xmax = 5.0
ymin = 1e-7
ymax = 1e-1

ax1.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{Z^\prime} {\rm\ [TeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle \sigma \times BR {\rm\ [pb]}$", fontsize=20)


ax1.xaxis.set_major_locator(MultipleLocator(0.5))
ax1.xaxis.set_minor_locator(MultipleLocator(0.1))

#ax1.yaxis.set_major_locator(MultipleLocator(5))
#ax1.yaxis.set_minor_locator(MultipleLocator(1))

plt.yscale('log')

# Set both ticks to be outside
ax1.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='best',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/Zptoll_limit.png", dpi = 300)   # save the figure to file
plt.close(fig)
"""
#####################################   Plot #2  #########################################################
"""
fig, ax2 = plt.subplots()

ax2.plot(np.array(MG["Wp"])/1000., np.array(MG["Zp"])/1000., linestyle='-', marker='o', color='blue', zorder=50, label=r"$ {\rm\ ALRM\ (g_L = g_R)} $")

ax2.plot(np.array(LRSM["Wp"])/1000., np.array(LRSM["Zp"])/1000., linestyle='-', color='green', zorder=50, label=r"$ {\rm\ LRSM\ (2 m_{\nu_R} \simeq m_{W_R},\ g_L = g_R)} $")

ax2.plot(np.array(ALRM_difgR["Wp"])/1000., np.array(ALRM_difgR["Zp"])/1000., linestyle='-', color='darkviolet', zorder=55, marker='o', label=r"$ {\rm\ ALRM\ (g_L \neq g_R = 0.37)} $")


ax2.plot(np.array(LRSM_difgLgR["Wp"])/1000., np.array(LRSM_difgLgR["Zp"])/1000., linestyle='-', color='orange', zorder=55, label=r"$ {\rm\ LRSM\ (2 m_{\nu_R} \simeq m_{W_R},\ g_L \neq g_R = 0.37)} $")


ax2.plot(np.array(ALRM_gRgtgL["Wp"])/1000., np.array(ALRM_gRgtgL["Zp"])/1000., linestyle='-', color='lime', zorder=60, label=r"$ {\rm\ ALRM\ (g_L \neq g_R = 0.768)} $")

#ax2.plot(WRZRnotequalgLgR_WRmass/1000., WRZRnotequalgLgR_ZRmass/1000., linestyle='-', marker='8', color='green', zorder=30, label=r"$g_L \neq g_R, g_R = 0.37, g_{B-L} = 1.51, g_L = 0.66$")

xmin = 1.0
xmax = 4.2
ymin = 1.0
ymax = 8.1

ax2 = plt.xlabel(r"$\displaystyle M_{W_R} {\rm\ [TeV]} $ ", fontsize=20)
ax2 = plt.ylabel(r"$\displaystyle M_{Z_R} {\rm\ [TeV]} $ ", fontsize=20)

plt.xlim([xmin,xmax])
plt.ylim([ymin,ymax])

plt.text(2.5, 2.3, r"$\displaystyle \frac{M_{Z_R}}{M_{W_R}} \simeq 1.20 $", fontsize=10, bbox=dict(facecolor='blue', alpha=0.5))

plt.text(3.2, 4.7, r"$\displaystyle \frac{M_{Z_R}}{M_{W_R}} \simeq 1.67 $", fontsize=10, bbox=dict(facecolor='green', alpha=0.5))


plt.text(1.75, 5.4, r"$\displaystyle \frac{M_{Z_R}}{M_{W_R}} \simeq 3.05 $", fontsize=10, bbox=dict(facecolor='darkviolet', alpha=0.5))


plt.text(1.4, 7.0, r"$\displaystyle \frac{M_{Z_R}}{M_{W_R}} \simeq 5.12 $", fontsize=10, bbox=dict(facecolor='orange', alpha=0.5))



plt.minorticks_on()

plt.tick_params(axis='both', which='both', labelsize=14, direction='in', top="on", right="on", length=6)

plt.tick_params(which='minor', length=3, color='k', direction='in', top="on", right="on")

# Set both ticks to be outside
plt.tick_params(which='both', direction='out')

leg=plt.legend(loc='upper right',frameon=True)
leg.set_zorder(800)

fig.savefig("plot/WRvsZR.png", dpi = 300)   # save the figure to file
plt.close(fig)
"""
##################################### Plot #3 ##########################################################
"""
pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax3 = plt.subplots()

col = np.array(MG["vp"])/1000.

sc3 = ax3.scatter(np.array(MG["Wp"])/1000., np.array(MG["Zp"])/1000., c=col, cmap=cm ,marker='*', label=r"$ {\rm\ ALRM} $")

cbar3 = plt.colorbar(sc3, format = "%.0f", extend="both")
#cbar3 = plt.colorbar(sc3)
cbar3.set_label(r"$\displaystyle v^\prime {\rm\ SU(2)_R\ and\ BL\ SSB\ scale\ [TeV]}$", fontsize=20)

ax3 = plt.xlabel(r"$\displaystyle M_{W_R} {\rm\ [TeV]} $ ", fontsize=20)
ax3 = plt.ylabel(r"$\displaystyle M_{Z_R} {\rm\ [TeV]} $ ", fontsize=20)

plt.text(3.0, 2, r"$\displaystyle \frac{M_{Z_R}}{M_{W_R}} \simeq 1.20 $", fontsize=15, bbox=dict(facecolor='blue', alpha=0.5))

#plt.text(1.9, 16.5, r"$\displaystyle \frac{M_{Z_R}}{M_{W_R}} = 6.01 $", fontsize=15, bbox=dict(facecolor='green', alpha=0.5))

plt.minorticks_on()

plt.tick_params(axis='both', which='both', labelsize=14, direction='in', top="on", right="on", length=6)

plt.tick_params(which='minor', length=3, color='k', direction='in', top="on", right="on")

# Set both ticks to be outside
plt.tick_params(which='both', direction='out')

#plt.legend()
leg=plt.legend(loc='best',frameon=True)
leg.set_zorder(800)

fig.savefig('ALRM_WRvsZR_withvp.png',dpi = 300)   # save the figure to file
plt.close(fig)
"""
############################################    Plot #4 ####################################################
"""
pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax4 = plt.subplots()

col = np.array(d["BRZptoll"])*100

formatter = LogFormatter(10, labelOnlyBase=True) 

sc4 = ax4.plot(np.array(d["MZp"])/1000., np.array(d["xsectionZp"]*d["BRZptoll"]), marker='.', zorder=45, color="black")

sc4 = ax4.scatter(np.array(d["MZp"])/1000., np.array(d["xsectionZp"]*d["BRZptoll"]), c=col, cmap=cm ,norm=colors.LogNorm(), marker='.', zorder=50, label=r"$ {\rm\ Secluded\ UMSSM} $")

cbar4 = plt.colorbar(sc4, extend="both", format=formatter)
#cbar4 = plt.colorbar(sc4)
cbar4.set_label(r"$\displaystyle BR(Z^\prime \to \ell^+ \ell^-) {\rm\ [\%]} $", fontsize=20)


sc4 = ax4.plot(observedxsection13TeVZpmassforll,observedxsection13TeVZpll,label=r"$ {\rm\ ATLAS\ Observed\ Limit} $",color='r', linewidth=2.0, zorder=40,alpha=0.7)

sc4 = ax4.plot(expectedxsection13TeVZpmassforll,expectedxsection13TeVZpll,'--',label=r"$ {\rm\ Expected\ Limit} $",color='k', linewidth=2.0, zorder=30,alpha=0.7)

ax4.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll2sigmamin, expectedxsection13TeVZpll2sigmamax, label=r"$ {\rm\ Expected\ \pm\ 2 \sigma} $", facecolor = 'gold', interpolate=True, alpha=.2,linewidth=0.0, zorder=10)

ax4.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll1sigmamin, expectedxsection13TeVZpll1sigmamax, label=r"$ {\rm\ Expected\ \pm\ 1 \sigma} $", facecolor = 'lime', interpolate=True, alpha=.2,linewidth=0.0, zorder=20)


    
ax4.text(2.0, 2e-5, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, \mathcal{L} = 36.1\ fb^{-1}$", size=15)
ax4.text(2.0, 7e-6, r"$\displaystyle Z^\prime \to \ell^+ \ell^- (\ell = e, \mu) $", size=15)


xmin = 0.2
xmax = 5.0
ymin = 1e-7
ymax = 2e-2


ax4.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{Z^\prime} {\rm\ [TeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle \sigma \times BR {\rm\ [pb]}$", fontsize=20)


ax4.xaxis.set_major_locator(MultipleLocator(0.5))
ax4.xaxis.set_minor_locator(MultipleLocator(0.1))

#ax4.yaxis.set_major_locator(MultipleLocator(5))
#ax4.yaxis.set_minor_locator(MultipleLocator(1))

plt.yscale('log')

# Set both ticks to be outside
ax4.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='lower right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/Zptoll_limit_withBR.png",dpi = 300)   # save the figure to file
plt.close(fig)

"""

############################################    Plot #1 ####################################################
"""

cm = plt.cm.get_cmap('rainbow')

fig, ax5 = plt.subplots()
col = np.array(MG["width"])/np.array(MG["MZp"])
sc5 = ax5.plot(np.array(MG["MZp"])/1000., np.array(MG["cross"])*0.03, c="black", marker=".", zorder=45, alpha=.2)
sc5 = ax5.scatter(np.array(MG["MZp"])/1000., np.array(MG["cross"])*0.03, c=col, cmap=cm, norm=colors.LogNorm(vmin=0.1, vmax=6e3), marker=".", zorder=50,label=r"$ {\rm\ Secluded\ UMSSM} $")
cbar5 = plt.colorbar(sc5, format = "%.0f", extend="both")
cbar5.set_label(r"$\displaystyle \Gamma/M_{Z^\prime}$", fontsize=20)

ax5.text(2.4, 2e-2, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, \mathcal{L} = 36.1\ fb^{-1}$", size=15)
ax5.text(2.4, 9e-3, r"$\displaystyle Z^\prime \to \ell^+ \ell^- (\ell = e, \mu) $", size=15)

ax5.plot(observedxsection13TeVZpmassforll,observedxsection13TeVZpll,label=r"$ {\rm\ ATLAS\ Observed\ Limit} $",color='r', zorder=40,alpha=0.7)

ax5.plot(expectedxsection13TeVZpmassforll,expectedxsection13TeVZpll,'--',label=r"$ {\rm\ Expected\ Limit} $",color='k', linewidth=2.0, zorder=30,alpha=0.7)

ax5.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll2sigmamin, expectedxsection13TeVZpll2sigmamax, label=r"$ {\rm\ Expected\ \pm\ 2 \sigma} $", facecolor = 'gold', interpolate=True, alpha=.2,linewidth=0.0, zorder=10)

ax5.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll1sigmamin, expectedxsection13TeVZpll1sigmamax, label=r"$ {\rm\ Expected\ \pm\ 1 \sigma} $", facecolor = 'lime', interpolate=True, alpha=.2,linewidth=0.0, zorder=20)

xmin = 0.2
xmax = 6.0
ymin = 1e-5
ymax = 1e0


ax5.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{Z^\prime} {\rm\ [TeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle \sigma \times BR {\rm\ [pb]}$", fontsize=20)

ax5.xaxis.set_major_locator(MultipleLocator(0.5))
ax5.xaxis.set_minor_locator(MultipleLocator(0.1))

#ax5.yaxis.set_major_locator(MultipleLocator(5))
#ax5.yaxis.set_minor_locator(MultipleLocator(1))

plt.yscale('log')

# Set both ticks to be outside
ax5.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='best',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/Zptoll_limit_width.png", dpi = 300)   # save the figure to file
plt.close(fig)
"""

############################################    Plot #6 ####################################################

"""
cm = plt.cm.get_cmap('rainbow')

fig, ax6 = plt.subplots()
col = np.array(d["widthmassratio"]*100)

sc6 = ax6.plot(np.array(d["MZp"])/1000., np.array(d["xsectionZp"]*d["BRZptoll"]), marker='.', zorder=45, color="black")
sc6 = ax6.scatter(np.array(d["MZp"])/1000., np.array(d["xsectionZp"]*d["BRZptoll"]), c=col, cmap=cm, marker=".", zorder=50,label=r"$ {\rm\ Secluded\ UMSSM} $")


cbar6 = plt.colorbar(sc6, format = "%.2f", extend="both")
cbar6.set_label(r"$\displaystyle \Gamma(M_{Z^\prime})/M_{Z^\prime} [\%]$", fontsize=20)

ax6.text(2.0, 2e-5, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, \mathcal{L} = 36.1\ fb^{-1}$", size=15)
ax6.text(2.0, 7e-6, r"$\displaystyle Z^\prime \to \ell^+ \ell^- (\ell = e, \mu) $", size=15)

ax6.plot(observedxsection13TeVZpmassforll,observedxsection13TeVZpll,label=r"$ {\rm\ ATLAS\ Observed\ Limit} $",color='r', zorder=40,alpha=0.7)

ax6.plot(expectedxsection13TeVZpmassforll,expectedxsection13TeVZpll,'--',label=r"$ {\rm\ Expected\ Limit} $",color='k', linewidth=2.0, zorder=30,alpha=0.7)

ax6.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll2sigmamin, expectedxsection13TeVZpll2sigmamax, label=r"$ {\rm\ Expected\ \pm\ 2 \sigma} $", facecolor = 'gold', interpolate=True, alpha=.2,linewidth=0.0, zorder=10)

ax6.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll1sigmamin, expectedxsection13TeVZpll1sigmamax, label=r"$ {\rm\ Expected\ \pm\ 1 \sigma} $", facecolor = 'lime', interpolate=True, alpha=.2,linewidth=0.0, zorder=20)

xmin = 0.2
xmax = 5.0
ymin = 1e-7
ymax = 2e-2




ax6.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{Z^\prime} {\rm\ [TeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle \sigma \times BR {\rm\ [pb]}$", fontsize=20)

ax6.xaxis.set_major_locator(MultipleLocator(0.5))
ax6.xaxis.set_minor_locator(MultipleLocator(0.1))

#ax6.yaxis.set_major_locator(MultipleLocator(0.1))
#ax6.yaxis.set_minor_locator(MultipleLocator(0.05))

plt.yscale('log')

# Set both ticks to be outside
ax6.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='lower right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/BRZpll_widthmassratio.png", dpi = 300)   # save the figure to file
plt.close(fig)

"""

############################################    Plot #7 ####################################################

"""
cm = plt.cm.get_cmap('rainbow')

fig, ax7 = plt.subplots()
col = np.array(d["QH"])
#sc7 = ax6.plot(np.array(d["MZp"])/1000., np.array(MG["cross"])*0.03, c="black", marker=".", zorder=45, alpha=.2)
sc7 = ax7.scatter(np.array(d["MZp"])/1000., np.array(d["BRZptoll"])*100, c=col, cmap=cm, marker=".", zorder=50,label=r"$ {\rm\ Secluded\ UMSSM} $")
#norm=colors.LogNorm(vmin=col.min(), vmax=col.max())
cbar7 = plt.colorbar(sc7, format = "%.2f", extend="both")
cbar7.set_label(r"$\displaystyle Q $", fontsize=20)

#ax7.text(2.4, 2e-2, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, \mathcal{L} = 36.1\ fb^{-1}$", size=15)
#ax7.text(2.4, 1e-2, r"$\displaystyle Z^\prime \to \ell^+ \ell^- (\ell = e, \mu) $", size=15)

#ax7.plot(observedxsection13TeVZpmassforll,observedxsection13TeVZpll,label=r"$ {\rm\ ATLAS\ Observed\ Limit} $",color='r', zorder=40,alpha=0.7)

#ax7.plot(expectedxsection13TeVZpmassforll,expectedxsection13TeVZpll,'--',label=r"$ {\rm\ Expected\ Limit} $",color='k', linewidth=2.0, zorder=30,alpha=0.7)

#ax7.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll2sigmamin, expectedxsection13TeVZpll2sigmamax, label=r"$ {\rm\ Expected\ \pm\ 2 \sigma} $", facecolor = 'gold', interpolate=True, alpha=.2,linewidth=0.0, zorder=10)

#ax7.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll1sigmamin, expectedxsection13TeVZpll1sigmamax, label=r"$ {\rm\ Expected\ \pm\ 1 \sigma} $", facecolor = 'lime', interpolate=True, alpha=.2,linewidth=0.0, zorder=20)

xmin = 0.2
xmax = 6.0
ymin = 1.9
ymax = 2.7


ax7.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{Z^\prime} {\rm\ [TeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle BR {\rm\ (Z^\prime \to \ell \ell )\ [\%]}$", fontsize=20)

ax7.xaxis.set_major_locator(MultipleLocator(0.5))
ax7.xaxis.set_minor_locator(MultipleLocator(0.1))

ax7.yaxis.set_major_locator(MultipleLocator(0.1))
ax7.yaxis.set_minor_locator(MultipleLocator(0.05))

#plt.yscale('log')

# Set both ticks to be outside
ax7.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='best',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/BRZpll_QH.png", dpi = 300)   # save the figure to file
plt.close(fig)


############################################    Plot #8 ####################################################


cm = plt.cm.get_cmap('rainbow')

fig, ax8 = plt.subplots()
col = np.array(d["QH"])
#sc8 = ax6.plot(np.array(d["MZp"])/1000., np.array(MG["cross"])*0.03, c="black", marker=".", zorder=45, alpha=.2)
sc8 = ax8.scatter(np.array(d["MZp"])/1000., np.array(d["BRZptoqq"])*np.array(d["BRZptoll"]), c=col, cmap=cm, marker=".", zorder=50,label=r"$ {\rm\ Secluded\ UMSSM} $")
#norm=colors.LogNorm(vmin=col.min(), vmax=col.max())
cbar8 = plt.colorbar(sc8, format = "%.2f", extend="both")
cbar8.set_label(r"$\displaystyle Q $", fontsize=20)

#ax8.text(2.4, 2e-2, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, \mathcal{L} = 36.1\ fb^{-1}$", size=15)
#ax8.text(2.4, 1e-2, r"$\displaystyle Z^\prime \to \ell^+ \ell^- (\ell = e, \mu) $", size=15)

#ax8.plot(observedxsection13TeVZpmassforll,observedxsection13TeVZpll,label=r"$ {\rm\ ATLAS\ Observed\ Limit} $",color='r', zorder=40,alpha=0.7)

#ax8.plot(expectedxsection13TeVZpmassforll,expectedxsection13TeVZpll,'--',label=r"$ {\rm\ Expected\ Limit} $",color='k', linewidth=2.0, zorder=30,alpha=0.7)

#ax8.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll2sigmamin, expectedxsection13TeVZpll2sigmamax, label=r"$ {\rm\ Expected\ \pm\ 2 \sigma} $", facecolor = 'gold', interpolate=True, alpha=.2,linewidth=0.0, zorder=10)

#ax8.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll1sigmamin, expectedxsection13TeVZpll1sigmamax, label=r"$ {\rm\ Expected\ \pm\ 1 \sigma} $", facecolor = 'lime', interpolate=True, alpha=.2,linewidth=0.0, zorder=20)

xmin = 0.2
xmax = 6.0
ymin = 3e-3
ymax = 6e-3


ax8.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{Z^\prime} {\rm\ [TeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle BR {\rm\ (Z^\prime \to qq )} \times BR {\rm\ (Z^\prime \to \ell \ell )}$", fontsize=20)

ax8.xaxis.set_major_locator(MultipleLocator(0.5))
ax8.xaxis.set_minor_locator(MultipleLocator(0.1))

ax8.yaxis.set_major_locator(MultipleLocator(0.1))
ax8.yaxis.set_minor_locator(MultipleLocator(0.05))

plt.yscale('log')

# Set both ticks to be outside
ax8.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='best',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/BRZpqqBRZpll_QH.png", dpi = 300)   # save the figure to file
plt.close(fig)
"""
############################################    Plot #9 ####################################################
"""
#cm = plt.cm.get_cmap('rainbow')

fig, ax9 = plt.subplots()
#col = np.array(d["QH"])
sc9 = ax9.plot(y_values, QQ_list, c="blue", zorder=45,  label=r"$ Q_Q $")
sc9 = ax9.plot(y_values, Qu_list, c="cyan", zorder=45,  label=r"$ Q_u $")
sc9 = ax9.plot(y_values, Qd_list, c="deepskyblue", zorder=45,  label=r"$ Q_d $")
sc9 = ax9.plot(y_values, Ql_list, c="black", zorder=45,  label=r"$ Q_l $")
sc9 = ax9.plot(y_values, Qv_list, c="purple", zorder=45,  label=r"$ Q_v $")
sc9 = ax9.plot(y_values, Qe_list, c="red",  zorder=45,  label=r"$ Q_e $")
sc9 = ax9.plot(y_values, QHu_list, c="lime",  zorder=45,  label=r"$ Q_{H_u} $")
sc9 = ax9.plot(y_values, QHd_list, c="green",  zorder=45,  label=r"$ Q_{H_d} $")
sc9 = ax9.plot(y_values, Qs_list, c="orange",  zorder=45,  label=r"$ Q_{S} $")
sc9 = ax9.plot(y_values, Qs1_list, c="darkgoldenrod",  zorder=45,  label=r"$ Q_{S_1} = Q_{S_2}$")
##sc9 = ax9.plot(y_values, Qs2_list, c="gray",  zorder=45,  label=r"$ Q_{S_2} $")
sc9 = ax9.plot(y_values, Qs3_list, c="gold", zorder=45,  label=r"$ Q_{S_3} $")

#sc9 = ax9.scatter(np.array(d["MZp"])/1000., np.array(d["BRZptoqq"])*np.array(d["BRZptoll"]), c=col, cmap=cm, marker=".", zorder=50,label=r"$ {\rm\ Secluded\ UMSSM} $")
#norm=colors.LogNorm(vmin=col.min(), vmax=col.max())
#cbar9 = plt.colorbar(sc8, format = "%.2f", extend="both")
#cbar9.set_label(r"$\displaystyle Q $", fontsize=20)

x = np.linspace(-1./3,-1./3,1000)
y = np.linspace(-1.1,1.1,1000)

plt.plot(x, y, color="black", linestyle="--", label=r"$ {\rm\ Leptophobic\ Scenario\ (Q_\ell = Q_e = 0) } $")

ax9.text(0., 1.15, r"$\displaystyle \alpha = \frac{1}{27}, \gamma=\frac{1}{3}, \delta = -0.5 $", size=15)
ax9.text(-0.4, 1.15, r"$\displaystyle \beta = -\frac{1}{3} $", size=15)

#ax9.plot(observedxsection13TeVZpmassforll,observedxsection13TeVZpll,label=r"$ {\rm\ ATLAS\ Observed\ Limit} $",color='r', zorder=40,alpha=0.7)

#ax9.plot(expectedxsection13TeVZpmassforll,expectedxsection13TeVZpll,'--',label=r"$ {\rm\ Expected\ Limit} $",color='k', linewidth=2.0, zorder=30,alpha=0.7)

#ax9.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll2sigmamin, expectedxsection13TeVZpll2sigmamax, label=r"$ {\rm\ Expected\ \pm\ 2 \sigma} $", facecolor = 'gold', interpolate=True, alpha=.2,linewidth=0.0, zorder=10)

#ax9.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll1sigmamin, expectedxsection13TeVZpll1sigmamax, label=r"$ {\rm\ Expected\ \pm\ 1 \sigma} $", facecolor = 'lime', interpolate=True, alpha=.2,linewidth=0.0, zorder=20)

xmin = -0.6
xmax = 0.6
ymin = -1.1
ymax = 1.1


ax9.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle  \beta $", fontsize=20)
plt.ylabel(r"$\displaystyle  U(1)^\prime {\rm\ Charges}$", fontsize=20)

ax9.xaxis.set_major_locator(MultipleLocator(0.1))
ax9.xaxis.set_minor_locator(MultipleLocator(0.05))

ax9.yaxis.set_major_locator(MultipleLocator(0.1))
ax9.yaxis.set_minor_locator(MultipleLocator(0.05))


for k, spine in ax9.spines.items():  #ax.spines is a dictionary
    spine.set_zorder(100)

#ax9.spines['right'].set_zorder(1)

#ax9.xaxis.zorder = 1
ax9.yaxis.zorder = 200

#plt.yscale('log')

# Set both ticks to be outside
ax9.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='lower left',frameon=True, ncol=4)
leg.set_zorder(100)

fig.savefig("plot/U1chargesSecluded.png", dpi = 300)   # save the figure to file
plt.close(fig)
"""

############################################    Plot #4 ####################################################
"""
pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax10 = plt.subplots()

col10 = np.array(d["BRZptoqq"])*100

#formatter = LogFormatter(1, labelOnlyBase=False)

Acceptance = 0.5

#sc10 = ax10.plot(np.array(d["MZp"])/1000., np.array(d["xsectionZp"]*d["BRZptoqq"]*Acceptance), marker='.', zorder=45, color="green")

sc10 = ax10.scatter(np.array(d["MZp"])/1000., np.array(d["xsectionZp"]*d["BRZptoqq"]*Acceptance), c=col10, cmap=cm , marker='.', zorder=50, label=r"$ {\rm\ Secluded\ UMSSM} $")

#norm=colors.LogNorm()
cbar10 = plt.colorbar(sc10, format = "%.0f", extend="both")
#cbar10 = plt.colorbar(sc10)
cbar10.set_label(r"$\displaystyle BR(Z^\prime \to q \overline{q}) {\rm\ [\%]} $", fontsize=20)

sc10 = ax10.plot(observedxsection13TeVZpqq36fb_Zpmass/1000.,observedxsection13TeVZpqq36fb_xsec,label=r"$ {\rm\ CMS\ Observed\ Limit\ 27\ fb^{-1}\ \&\ 36\ fb^{-1}} $",color='blue', linewidth=2.0, zorder=55,alpha=0.7)


sc10 = ax10.plot(observedxsection13TeVZpqq137fb_Zpmass,observedxsection13TeVZpqq137fb_xsec,label=r"$ {\rm\ CMS\ Observed\ Limit\ 137\ fb^{-1}} $",color='black', linewidth=2.0, zorder=60,alpha=0.7)

#sc10 = ax10.plot(expectedxsection13TeVZpmassforll,expectedxsection13TeVZpll,'--',label=r"$ {\rm\ Expected\ Limit} $",color='k', linewidth=2.0, zorder=30,alpha=0.7)

#ax10.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll2sigmamin, expectedxsection13TeVZpll2sigmamax, label=r"$ {\rm\ Expected\ \pm\ 2 \sigma} $", facecolor = 'gold', interpolate=True, alpha=.2,linewidth=0.0, zorder=10)

#ax10.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll1sigmamin, expectedxsection13TeVZpll1sigmamax, label=r"$ {\rm\ Expected\ \pm\ 1 \sigma} $", facecolor = 'lime', interpolate=True, alpha=.2,linewidth=0.0, zorder=20)


#ax10.text(3.0, 2e-0, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, \mathcal{L} = 137\ fb^{-1}$", size=15)
ax10.text(3.0, 1e-0, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, Z^\prime \to q \overline{q}$", size=15)
#ax10.text(3.0, 7e-1, r"$\displaystyle Z^\prime \to q \overline{q} $", size=15)

xmin = 0.2
xmax = 6.0
ymin = 1e-5
ymax = 3e+1

ax10.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{Z^\prime} {\rm\ [TeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle \sigma \times BR \times A {\rm\ [pb]}$", fontsize=20)


ax10.xaxis.set_major_locator(MultipleLocator(0.5))
ax10.xaxis.set_minor_locator(MultipleLocator(0.1))

#ax10.yaxis.set_major_locator(MultipleLocator(5))
#ax10.yaxis.set_minor_locator(MultipleLocator(1))

plt.yscale('log')

# Set both ticks to be outside
ax10.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='upper right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/Zptoqq_limit_withBR.png",dpi = 300)   # save the figure to file
plt.close(fig)
"""
############################################    Plot #11 ####################################################
"""
pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax11 = plt.subplots()

col = np.array(d["BRZptoll"])*100

formatter = LogFormatter(10, labelOnlyBase=True)

#sc11 = ax11.plot(np.array(d["MZp"])/1000., np.array(d["xsectionZp"]*1000*d["BRZptoll"]), marker='.', zorder=45, color="black")

sc11 = ax11.scatter(np.array(d["MZp"])/1000., np.array(d["xsectionZp"]*1000*d["BRZptoll"]), c=col, cmap=cm ,norm=colors.LogNorm(), marker='.', zorder=100, label=r"$ {\rm\ Secluded\ UMSSM} $", alpha=0.7)

cbar11 = plt.colorbar(sc11, extend="both", format=formatter)
#cbar11 = plt.colorbar(sc11)
cbar11.set_label(r"$\displaystyle BR(Z^\prime \to \ell^+ \ell^-) {\rm\ [\%]} $", fontsize=20)

sc11 = ax11.plot(observedxsection13TeVZpll139fb_Zpmass_width0/1000., observedxsection13TeVZpll139fb_xsec_width0,label=r"$ {\rm\ ATLAS\ Observed\ Limit\ \Gamma/M = 0} $",color='black', linewidth=2.0, zorder=80,alpha=0.7)

sc11 = ax11.plot(observedxsection13TeVZpll139fb_Zpmass_width1over2/1000., observedxsection13TeVZpll139fb_xsec_width1over2,label=r"$ {\rm\ ATLAS\ Observed\ Limit\ \Gamma/M = 0.5} $",color='blue', linewidth=2.0, zorder=70,alpha=0.7)

sc11 = ax11.plot(observedxsection13TeVZpll139fb_Zpmass_width1point2/1000., observedxsection13TeVZpll139fb_xsec_width1point2,label=r"$ {\rm\ ATLAS\ Observed\ Limit\ \Gamma/M = 1.2} $",color='green', linewidth=2.0, zorder=60,alpha=0.7)

#sc11 = ax11.plot(expectedxsection13TeVZpmassforll,expectedxsection13TeVZpll,'--',label=r"$ {\rm\ Expected\ Limit} $",color='k', linewidth=2.0, zorder=30,alpha=0.7)

#ax11.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll2sigmamin, expectedxsection13TeVZpll2sigmamax, label=r"$ {\rm\ Expected\ \pm\ 2 \sigma} $", facecolor = 'gold', interpolate=True, alpha=.2,linewidth=0.0, zorder=10)

#ax11.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll1sigmamin, expectedxsection13TeVZpll1sigmamax, label=r"$ {\rm\ Expected\ \pm\ 1 \sigma} $", facecolor = 'lime', interpolate=True, alpha=.2,linewidth=0.0, zorder=20)


#sc11 = ax11.plot(observedxsection13TeVZpmassforll,observedxsection13TeVZpll*1000,label=r"$ {\rm\ ATLAS\ Observed\ Limit} $",color='r', linewidth=2.0, zorder=40,alpha=0.7)

#sc11 = ax11.plot(expectedxsection13TeVZpmassforll,expectedxsection13TeVZpll*1000,'--',label=r"$ {\rm\ Expected\ Limit} $",color='k', linewidth=2.0, zorder=30,alpha=0.7)

#ax11.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll2sigmamin*1000, expectedxsection13TeVZpll2sigmamax*1000, label=r"$ {\rm\ Expected\ \pm\ 2 \sigma} $", facecolor = 'gold', interpolate=True, alpha=.2,linewidth=0.0, zorder=10)

#ax4.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll1sigmamin*1000, expectedxsection13TeVZpll1sigmamax*1000, label=r"$ {\rm\ Expected\ \pm\ 1 \sigma} $", facecolor = 'lime', interpolate=True, alpha=.2,linewidth=0.0, zorder=20)
    
ax11.text(2.3, 4e0, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, \mathcal{L} = 139\ fb^{-1}$", size=15)
ax11.text(2.3, 7e-1, r"$\displaystyle Z^\prime \to \ell^+ \ell^- (\ell = e, \mu) $", size=15)


xmin = 0.2
xmax = 5.0
ymin = 1e-4
ymax = 1e1


ax11.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{Z^\prime} {\rm\ [TeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle \sigma \times BR {\rm\ [fb]}$", fontsize=20)


ax11.xaxis.set_major_locator(MultipleLocator(0.5))
ax11.xaxis.set_minor_locator(MultipleLocator(0.1))

#ax11.yaxis.set_major_locator(MultipleLocator(5))
#ax11.yaxis.set_minor_locator(MultipleLocator(1))

plt.yscale('log')

# Set both ticks to be outside
ax11.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='lower right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/Zptoll_limit_withBR_139fb.png",dpi = 300)   # save the figure to file
plt.close(fig)
"""

############################################    Plot #4 ####################################################


pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax12 = plt.subplots()

col12 = np.array(d["widthmassratio"]*100)

#formatter = LogFormatter(1, labelOnlyBase=False)

Acceptance = 0.5

sc12 = ax12.scatter(np.array(e["MZp"])/1000., np.array(e["xsecpptoZp"]*e["BRZptoqq"]*Acceptance), marker='.', zorder=45, color="grey", label=r"$ {\rm\ Excluded\ Secluded\ UMSSM} $")

sc12 = ax12.scatter(np.array(d["MZp"])/1000., np.array(d["xsecpptoZp"]*d["BRZptoqq"]*Acceptance), c=col12, cmap=cm , marker='.', zorder=50, label=r"$ {\rm\ Accepted\ Secluded\ UMSSM} $")

#norm=colors.LogNorm()

cbar12 = plt.colorbar(sc12, format = "%.2f", extend="both")
cbar12.set_label(r"$\displaystyle \Gamma(M_{Z^\prime})/M_{Z^\prime} [\%]$", fontsize=20)


sc12 = ax12.plot(observedxsection13TeVZpqq36fb_Zpmass/1000.,observedxsection13TeVZpqq36fb_xsec,label=r"$ {\rm\ CMS\ Observed\ Limit\ 27\ fb^{-1}\ \&\ 36\ fb^{-1}} $",color='blue', linewidth=2.0, zorder=55,alpha=0.7)


sc12 = ax12.plot(observedxsection13TeVZpqq137fb_Zpmass,observedxsection13TeVZpqq137fb_xsec,label=r"$ {\rm\ CMS\ Observed\ Limit\ 137\ fb^{-1}} $",color='black', linewidth=2.0, zorder=60,alpha=0.7)

#sc12 = ax12.plot(expectedxsection13TeVZpmassforll,expectedxsection13TeVZpll,'--',label=r"$ {\rm\ Expected\ Limit} $",color='k', linewidth=2.0, zorder=30,alpha=0.7)

#ax12.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll2sigmamin, expectedxsection13TeVZpll2sigmamax, label=r"$ {\rm\ Expected\ \pm\ 2 \sigma} $", facecolor = 'gold', interpolate=True, alpha=.2,linewidth=0.0, zorder=10)

#ax12.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll1sigmamin, expectedxsection13TeVZpll1sigmamax, label=r"$ {\rm\ Expected\ \pm\ 1 \sigma} $", facecolor = 'lime', interpolate=True, alpha=.2,linewidth=0.0, zorder=20)


#ax12.text(3.0, 2e-0, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, \mathcal{L} = 137\ fb^{-1}$", size=15)
ax12.text(3.0, 7e-1, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, Z^\prime \to q \overline{q}$", size=15)
#ax12.text(3.0, 7e-1, r"$\displaystyle Z^\prime \to q \overline{q} $", size=15)

xmin = 0.2
xmax = 6.0
ymin = 1e-5
ymax = 3e+1

ax12.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{Z^\prime} {\rm\ [TeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle \sigma \times BR \times A {\rm\ [pb]}$", fontsize=20)


ax12.xaxis.set_major_locator(MultipleLocator(0.5))
ax12.xaxis.set_minor_locator(MultipleLocator(0.1))

#ax12.yaxis.set_major_locator(MultipleLocator(5))
#ax12.yaxis.set_minor_locator(MultipleLocator(1))

plt.yscale('log')

# Set both ticks to be outside
ax12.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='upper right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/Zptoqq_limit_widthmassratio.png",dpi = 300)   # save the figure to file
plt.close(fig)

############################################    Plot #4 ####################################################

pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax13 = plt.subplots()

col13 = np.array(d["QQcharge"])

Acceptance = 0.5

sc13 = ax13.scatter(np.array(e["MZp"])/1000., np.array(e["xsecpptoZp"]*e["BRZptoqq"]*Acceptance), marker='.', zorder=45, color="grey", label=r"$ {\rm\ Excluded\ Secluded\ UMSSM} $")

sc13 = ax13.scatter(np.array(d["MZp"])/1000., np.array(d["xsecpptoZp"]*d["BRZptoqq"]*Acceptance), c=col13, cmap=cm, norm=colors.LogNorm(col13.min(), col13.max()), marker='.', zorder=50, label=r"$ {\rm\ Accepted\ Secluded\ UMSSM} $")

def fmt(x, pos):
    a, b = '{:.0e}'.format(x).split('e')
    b = int(b)
    return r'${} \times 10^{{{}}}$'.format(a, b)


#formatter = LogFormatter(10, labelOnlyBase=False)
#cbar13.formatter = LogFormatterExponent(base=10) # 10 is the default


cbar13 = plt.colorbar(sc13, extend="both", format=FuncFormatter(fmt))
cbar13.set_label(r"$\displaystyle Q_Q = \alpha $", fontsize=20)
cbar13.set_ticks([col13.min(),1e-2,col13.max()])
#cbar13.set_ticklabels([log10(col13.min()),log10(1e-2),log10(col13.max())])


#cbar13.formatter = LogFormatterExponent(base=10) # 10 is the default
cbar13.update_ticks()

sc13 = ax13.plot(observedxsection13TeVZpqq36fb_Zpmass/1000.,observedxsection13TeVZpqq36fb_xsec,label=r"$ {\rm\ CMS\ Observed\ Limit\ 27\ fb^{-1}\ \&\ 36\ fb^{-1}} $",color='blue', linewidth=2.0, zorder=55,alpha=0.7)

sc13 = ax13.plot(observedxsection13TeVZpqq137fb_Zpmass,observedxsection13TeVZpqq137fb_xsec,label=r"$ {\rm\ CMS\ Observed\ Limit\ 137\ fb^{-1}} $",color='black', linewidth=2.0, zorder=60,alpha=0.7)

#sc13 = ax13.plot(expectedxsection13TeVZpmassforll,expectedxsection13TeVZpll,'--',label=r"$ {\rm\ Expected\ Limit} $",color='k', linewidth=2.0, zorder=30,alpha=0.7)

#ax13.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll2sigmamin, expectedxsection13TeVZpll2sigmamax, label=r"$ {\rm\ Expected\ \pm\ 2 \sigma} $", facecolor = 'gold', interpolate=True, alpha=.2,linewidth=0.0, zorder=10)

#ax13.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll1sigmamin, expectedxsection13TeVZpll1sigmamax, label=r"$ {\rm\ Expected\ \pm\ 1 \sigma} $", facecolor = 'lime', interpolate=True, alpha=.2,linewidth=0.0, zorder=20)


#ax13.text(3.0, 2e-0, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, \mathcal{L} = 137\ fb^{-1}$", size=15)
ax13.text(3.0, 1e-7, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, Z^\prime \to q \overline{q}$", size=15)
#ax13.text(3.0, 7e-1, r"$\displaystyle Z^\prime \to q \overline{q} $", size=15)

xmin = 0.2
xmax = 6.0
ymin = 1e-5
ymax = 3e+1

ax13.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{Z^\prime} {\rm\ [TeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle \sigma \times BR \times A {\rm\ [pb]}$", fontsize=20)


ax13.xaxis.set_major_locator(MultipleLocator(0.5))
ax13.xaxis.set_minor_locator(MultipleLocator(0.1))

#ax13.yaxis.set_major_locator(MultipleLocator(5))
#ax13.yaxis.set_minor_locator(MultipleLocator(1))

plt.yscale('log')

# Set both ticks to be outside
ax13.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='upper right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/Zptoqq_limit_QQcharge.png",dpi = 300)   # save the figure to file
plt.close(fig)



############################################    Plot #4 ####################################################

pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax14 = plt.subplots()

#col14 = np.array(d["gpSUSY"])
col14 = np.array(d["MZp"]/d["gpSUSY"])/1000.

#formatter = LogFormatter(1, labelOnlyBase=False)

Acceptance = 0.5

sc14 = ax14.scatter(np.array(e["MZp"])/1000., np.array(e["xsecpptoZp"]*e["BRZptoqq"]*Acceptance), marker='.', zorder=45, color="grey", label=r"$ {\rm\ Excluded\ Secluded\ UMSSM}$")

sc14 = ax14.scatter(np.array(d["MZp"])/1000., np.array(d["xsecpptoZp"]*d["BRZptoqq"]*Acceptance), c=col14, cmap=cm , marker='.', zorder=50, label=r"$ {\rm\ Accepted\ Secluded\ UMSSM}$")

#norm=colors.LogNorm(col14.min(), col14.max())
formatter = LogFormatter(10, labelOnlyBase=False)


#formatter = LogFormatter(10, labelOnlyBase=False)

cbar14 = plt.colorbar(sc14, extend="both")
cbar14.set_label(r"$\displaystyle \frac{M_{Z^\prime}}{g^\prime_{\rm SUSY}} [\rm TeV]$", fontsize=20)

#cbar14.set_ticks([col14.min(),1e-2,col14.max()])
#cbar14.set_ticklabels([col14.min(),1e-2,col14.max()])

#cbar14.formatter = LogFormatterExponent(base=10) # 10 is the default
#cbar14.update_ticks()


sc14 = ax14.plot(observedxsection13TeVZpqq36fb_Zpmass/1000.,observedxsection13TeVZpqq36fb_xsec,label=r"$ {\rm\ CMS\ Observed\ Limit\ 27\ fb^{-1}\ \&\ 36\ fb^{-1}} $",color='blue', linewidth=2.0, zorder=55,alpha=0.7)

sc14 = ax14.plot(observedxsection13TeVZpqq137fb_Zpmass,observedxsection13TeVZpqq137fb_xsec,label=r"$ {\rm\ CMS\ Observed\ Limit\ 137\ fb^{-1}} $",color='black', linewidth=2.0, zorder=60,alpha=0.7)

#sc14 = ax14.plot(expectedxsection13TeVZpmassforll,expectedxsection13TeVZpll,'--',label=r"$ {\rm\ Expected\ Limit} $",color='k', linewidth=2.0, zorder=30,alpha=0.7)

#ax14.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll2sigmamin, expectedxsection13TeVZpll2sigmamax, label=r"$ {\rm\ Expected\ \pm\ 2 \sigma} $", facecolor = 'gold', interpolate=True, alpha=.2,linewidth=0.0, zorder=10)

#ax14.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll1sigmamin, expectedxsection13TeVZpll1sigmamax, label=r"$ {\rm\ Expected\ \pm\ 1 \sigma} $", facecolor = 'lime', interpolate=True, alpha=.2,linewidth=0.0, zorder=20)


#ax14.text(3.0, 2e-0, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, \mathcal{L} = 137\ fb^{-1}$", size=15)
ax14.text(3.0, 7e-1, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, Z^\prime \to q \overline{q}$", size=15)
#ax14.text(3.0, 7e-1, r"$\displaystyle Z^\prime \to q \overline{q} $", size=15)

xmin = 0.2
xmax = 6.0
ymin = 1e-5
ymax = 3e+1

ax14.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{Z^\prime} {\rm\ [TeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle \sigma \times BR \times A {\rm\ [pb]}$", fontsize=20)


ax14.xaxis.set_major_locator(MultipleLocator(0.5))
ax14.xaxis.set_minor_locator(MultipleLocator(0.1))

#ax14.yaxis.set_major_locator(MultipleLocator(5))
#ax14.yaxis.set_minor_locator(MultipleLocator(1))

plt.yscale('log')

# Set both ticks to be outside
ax14.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='upper right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/Zptoqq_limit_gpSUSY.png",dpi = 300)   # save the figure to file
plt.close(fig)


##############################################################################################

pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax15 = plt.subplots()

col15 = np.array(d["Cha1"])

#formatter = LogFormatter(1, labelOnlyBase=False)

sc15 = ax15.scatter(np.array(abs(d["Chi1"]))/1000., np.array(d["DAMU"])*10**10, c=col15, cmap=cm , marker='.', zorder=50, label=r"$ {\rm\ Secluded\ UMSSM} $")

cbar15 = plt.colorbar(sc15, extend="both")
cbar15.set_label(r"$\displaystyle M_{\tilde{\chi}_1^\pm} {\rm\ [GeV]} $", fontsize=20)

ax15.axis([0.,1.,0.0,60])
plt.xlabel(r"$\displaystyle M_{\tilde{\chi}_1^0} {\rm\ [TeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle \Delta a_{\mu} \times 10^{10} $ ", fontsize=20)

ax15.axhspan(20.7,36.7,color='green',fill=True,alpha=.2,linewidth=0.0,zorder=4)
ax15.axhspan(12.7, 44.7,color='yellow',fill=True,alpha=.2,linewidth=0.0,zorder=3)
ax15.axhspan(3.4,55.6,color='navy',fill=True,alpha=.2,linewidth=0.0,zorder=2)

ax15.text(750., 7.4, r"$\displaystyle 3 \sigma$",fontsize=20)
ax15.text(750, 16.2, r"$\displaystyle 2 \sigma$",fontsize=20)
ax15.text(750, 28.3, r"$\displaystyle 1 \sigma$",fontsize=20)

ax15.xaxis.set_major_locator(MultipleLocator(0.1))
ax15.xaxis.set_minor_locator(MultipleLocator(0.025))

ax15.yaxis.set_major_locator(MultipleLocator(5))
ax15.yaxis.set_minor_locator(MultipleLocator(1))

# Set both ticks to be outside
ax15.tick_params(which='both', direction='out')

leg = plt.legend(loc='best',frameon=True)
leg.set_zorder(100)

fig.savefig('plot/secUMSSM_DAMU_Chi1.png',dpi = 300)   # save the figure to file
plt.close(fig)


############################################    Plot #4 ####################################################

pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax16 = plt.subplots()

col16 = np.array(d["BRCha1toWChi1"]*100)

#formatter = LogFormatter(1, labelOnlyBase=False)

sc16 = ax16.scatter(np.array(e["Cha1"])/1000., np.array(abs(e["Chi1"]))/1000., c='gray', marker='.', zorder=45, label=r"$ {\rm\ Excluded\ Secluded\ UMSSM} $")


sc16 = ax16.scatter(np.array(d["Cha1"])/1000., np.array(abs(d["Chi1"]))/1000., c=col16, cmap=cm , marker='.', zorder=50, label=r"$ {\rm\ Accepted\ Secluded\ UMSSM} $")

#norm=colors.LogNorm(col16.min(), col16.max())
formatter = LogFormatter(10, labelOnlyBase=False)

#formatter = LogFormatter(10, labelOnlyBase=False)

cbar16 = plt.colorbar(sc16, extend="both")
cbar16.set_label(r"$\displaystyle BR(\tilde{\chi}_1^\pm \to W \tilde{\chi}_1^0) {\rm\ [\%]} $", fontsize=20)

sc16 = ax16.scatter(np.array(observedATLAS_CharNeut_139fb_Cha1)/1000., np.array(observedATLAS_CharNeut_139fb_Chi1)/1000., c='black', marker='.', linewidth=1, zorder=60, label=r"$ {\rm\ ATLAS\ Observed\ Limit} $", alpha=0.7)

#cbar16.set_ticks([col13.min(),1e-2,col13.max()])
#cbar16.set_ticklabels([col13.min(),1e-2,col13.max()])

#cbar16.formatter = LogFormatterExponent(base=10) # 10 is the default
#cbar16.update_ticks()

#ax16.text(3.0, 2e-0, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, \mathcal{L} = 137\ fb^{-1}$", size=15)
#ax16.text(3.0, 1e-0, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, Z^\prime \to q \overline{q}$", size=15)
#ax16.text(3.0, 7e-1, r"$\displaystyle Z^\prime \to q \overline{q} $", size=15)

xmin = 0.1
xmax = 1.0
ymin = 0.0
ymax = 1.0

ax16.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{\tilde{\chi}_1^\pm} {\rm\ [TeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle M_{\tilde{\chi}_1^0} {\rm\ [TeV]}$", fontsize=20)

ax16.xaxis.set_major_locator(MultipleLocator(0.1))
ax16.xaxis.set_minor_locator(MultipleLocator(0.025))

ax16.yaxis.set_major_locator(MultipleLocator(0.1))
ax16.yaxis.set_minor_locator(MultipleLocator(0.025))

#plt.yscale('log')

# Set both ticks to be outside
ax16.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='upper left',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/secUMSSM_mcha1vsmchi1.png",dpi = 300)   # save the figure to file
plt.close(fig)


############################################    Plot #4 ####################################################
"""
pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax17 = plt.subplots()

col17 = np.array(d["BRZptoCha1Cha1"]*100)

#formatter = LogFormatter(1, labelOnlyBase=False)

sc17 = ax17.scatter(np.array(d["Cha1"]), np.array(abs(d["Chi2"])), c=col17, cmap=cm , marker='.', zorder=50, label=r"$ {\rm\ Secluded\ UMSSM} $")

#norm=colors.LogNorm(col16.min(), col16.max())
formatter = LogFormatter(10, labelOnlyBase=False)


#formatter = LogFormatter(10, labelOnlyBase=False)

cbar17 = plt.colorbar(sc17, extend="both")
cbar17.set_label(r"$\displaystyle BR(Z^\prime \to \tilde{\chi}_1^\pm \tilde{\chi}_1^\mp) {\rm\ [\%]} $", fontsize=20)


sc17 = ax17.scatter(np.array(observedATLAS_CharNeut_139fb_Cha1), np.array(observedATLAS_CharNeut_139fb_Chi1), c='red', marker='.', zorder=60, label=r"$ {\rm\ Secluded\ UMSSM---} $")


#cbar17.set_ticks([col13.min(),1e-2,col13.max()])
#cbar17.set_ticklabels([col13.min(),1e-2,col13.max()])

#cbar17.formatter = LogFormatterExponent(base=10) # 10 is the default
#cbar17.update_ticks()

#ax17.text(3.0, 2e-0, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, \mathcal{L} = 137\ fb^{-1}$", size=15)
#ax17.text(3.0, 1e-0, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, Z^\prime \to q \overline{q}$", size=15)
#ax17.text(3.0, 7e-1, r"$\displaystyle Z^\prime \to q \overline{q} $", size=15)

xmin = 0.0
xmax = 1500.0
ymin = 0.0
ymax = 1500.

ax17.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{\tilde{\chi_1}^\pm} {\rm\ [GeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle M_{\tilde{\chi}_1^0} {\rm\ [GeV]}$", fontsize=20)

ax17.xaxis.set_major_locator(MultipleLocator(100))
ax17.xaxis.set_minor_locator(MultipleLocator(25))

ax17.yaxis.set_major_locator(MultipleLocator(25))
ax17.yaxis.set_minor_locator(MultipleLocator(5))

#plt.yscale('log')

# Set both ticks to be outside
ax17.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='upper right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/secUMSSM_mcha1vsmchi1_BRZtoCha1Cha1.png",dpi = 300)   # save the figure to file
plt.close(fig)
"""


############################################    Plot #18 ####################################################

pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax18 = plt.subplots()

col18 = np.array(d["MZp"]/d["gpSUSY"])/1000.


#formatter = LogFormatter(1, labelOnlyBase=False)

Acceptance = 0.5

#sc18 = ax18.plot(np.array(d["MZp"])/1000., np.array(d["xsectionZp"]*d["BRZptoqq"]*Acceptance), marker='.', zorder=45, color="green")

sc18 = ax18.scatter(np.array(e["MZp"])/1000., np.array(e["chi2"]), c='gray', marker='.', zorder=45, label=r"$ {\rm\ Excluded\ Secluded\ UMSSM\ (\chi^2 > 8.025)} $")

sc18 = ax18.scatter(np.array(d["MZp"])/1000., np.array(d["chi2"]), c=col18, cmap=cm , marker='.', zorder=50, label=r"$ {\rm\ Accepted\ Secluded\ UMSSM (\chi^2 \leq 8.025)} $")

#norm=colors.LogNorm(col14.min(), col14.max())
formatter = LogFormatter(10, labelOnlyBase=False)


#formatter = LogFormatter(10, labelOnlyBase=False)

cbar18 = plt.colorbar(sc18, extend="both")
cbar18.set_label(r"$\displaystyle \frac{M_{Z^\prime}}{g^\prime_{\rm SUSY}} {\rm\ [TeV]} $", fontsize=20)

#cbar18.set_ticks([col13.min(),1e-2,col13.max()])
#cbar18.set_ticklabels([col13.min(),1e-2,col13.max()])

#cbar18.formatter = LogFormatterExponent(base=10) # 10 is the default
#cbar18.update_ticks()


xmin = 0.2
xmax = 6.0
ymin = 0
ymax = 180

ax18.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{Z^\prime} {\rm\ [TeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle \chi^2 $", fontsize=20)


ax18.xaxis.set_major_locator(MultipleLocator(0.5))
ax18.xaxis.set_minor_locator(MultipleLocator(0.1))

ax18.yaxis.set_major_locator(MultipleLocator(25))
ax18.yaxis.set_minor_locator(MultipleLocator(5))

#plt.yscale('log')

# Set both ticks to be outside
ax18.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='upper right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/MZpOvergp_chi2.png",dpi = 300)   # save the figure to file
plt.close(fig)

############################################    Plot #18 ####################################################

pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax19 = plt.subplots()

col19 = np.array(d["chi2"])

#formatter = LogFormatter(1, labelOnlyBase=False)

Acceptance = 0.5

#sc19 = ax19.plot(np.array(d["MZp"])/1000., np.array(d["xsectionZp"]*d["BRZptoqq"]*Acceptance), marker='.', zorder=45, color="green")

sc19 = ax19.scatter(np.array(e["QQcharge"]), np.array(e["MZp"]/e["gpSUSY"])/1000., c='gray', marker='.', zorder=45, label=r"$ {\rm\ Excluded\ Secluded\ UMSSM\ (\chi^2 > 8.025)} $")

sc19 = ax19.scatter(np.array(d["QQcharge"]), np.array(d["MZp"]/d["gpSUSY"])/1000., c=col19, cmap=cm , marker='.', zorder=50, label=r"$ {\rm\ Accepted\ Secluded\ UMSSM (\chi^2 \leq 8.025)} $")

#norm=colors.LogNorm(col19.min(), col19.max())
formatter = LogFormatter(10, labelOnlyBase=False)

cbar19 = plt.colorbar(sc19, extend="both")
cbar19.set_label(r"$\displaystyle \chi^2 $", fontsize=20)

#cbar19.set_ticks([col13.min(),1e-2,col13.max()])
#cbar19.set_ticklabels([col13.min(),1e-2,col13.max()])

#cbar19.formatter = LogFormatterExponent(base=10) # 10 is the default
#cbar19.update_ticks()


xmin = 9e-3
xmax = 1.5e-1
ymin = 0
ymax = 9

ax19.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle Q_Q $", fontsize=20)
plt.ylabel(r"$\displaystyle M_{Z^\prime}/g^{\prime} {\rm\ [TeV]}$", fontsize=20)


ax19.xaxis.set_major_locator(MultipleLocator(0.5))
ax19.xaxis.set_minor_locator(MultipleLocator(0.1))

ax19.yaxis.set_major_locator(MultipleLocator(1))
ax19.yaxis.set_minor_locator(MultipleLocator(0.25))

plt.xscale('log')
#plt.yscale('log')

# Set both ticks to be outside
ax19.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='lower right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/QQchargevsMZpovergp_chi2.png",dpi = 300)   # save the figure to file
plt.close(fig)


#############################################################################################

fig, ax20 = plt.subplots()


sc20 = ax20.scatter(np.array(abs(e["Chi1"])/1000.), np.array(e["RelicDensity"]), c='gray', marker='.', zorder=45, label=r"$ {\rm\ Excluded\ Secluded\ UMSSM} $", s=8)

sc20 = ax20.scatter(np.array(abs(d["Chi1"])/1000.), np.array(d["RelicDensity"]), c='blue', marker='.', zorder=50, label=r"$ {\rm\ Accepted\ Secluded\ UMSSM} $", s=8)

#ax20.text(0.7, 1.5e4, r"$\displaystyle g_L \neq g_R = 0.37 $", size=15)
#ax20.text(0.7, 1.5e4, r"$\displaystyle g_L \neq g_R $", size=15)

xmin = 0.0
xmax = 1.0
ymin = 1e-3
ymax = 1e4

ax20.axhspan(0.096,0.122,color='green',fill=True,alpha=.3,linewidth=0.0,zorder=80, label="Planck Constraints")

mh0_mass = 125.09
mh0_min = (mh0_mass-15.)/1000.
mh0_max = (mh0_mass+15.)/1000.
#ax7.axvspan(mh0_min/2., mh0_max/2., color='purple',fill=True,alpha=.2,linewidth=0.0,zorder=78, label="H$_0$ Funnel")

mZ_mass = 91.1876
mZ_min = (mZ_mass-15.)/1000.
mZ_max = (mZ_mass+15.)/1000.
#ax7.axvspan(mZ_min/2., mZ_max/2., color='blue',fill=True,alpha=.2,linewidth=0.0,zorder=75, label="Z Funnel")

ax20.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{\tilde{\chi}_1^0} {\rm\ [TeV]}$", fontsize=20, labelpad=10)
plt.ylabel(r"$\displaystyle \Omega_{\rm DM} h^2 $ ", fontsize=20)

ax20.xaxis.set_major_locator(MultipleLocator(0.1))
ax20.xaxis.set_minor_locator(MultipleLocator(0.025))

#ax20.yaxis.set_major_locator(MultipleLocator(5))
#ax20.yaxis.set_minor_locator(MultipleLocator(1))

plt.yscale('log')

# Set both ticks to be outside
ax20.tick_params(which='both', direction='out')

#plt.legend(loc='upper left',frameon=True)
leg = plt.legend(loc='upper right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/MassChi1vsRD.png", dpi=150)   # save the figure to file
plt.close(fig)

#############################################################################################

pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax21 = plt.subplots()

col21 = np.array(d["BRZptoqq"])*100

#formatter = LogFormatter(1, labelOnlyBase=False)

Acceptance = 0.5


sc21 = ax21.scatter(np.array(e["MZp"])/1000., np.array(e["xsecpptoZp"]*e["BRZptoqq"]*Acceptance), c='gray', marker='.', zorder=50, label=r"$ {\rm\ Excluded\ Secluded\ UMSSM} $")

sc21 = ax21.scatter(np.array(d["MZp"])/1000., np.array(d["xsecpptoZp"]*d["BRZptoqq"]*Acceptance), c=col21, cmap=cm, marker='.', zorder=51, label=r"$ {\rm\ Accepted\ Secluded\ UMSSM} $")


#norm=colors.LogNorm()
cbar21 = plt.colorbar(sc21, format = "%.0f", extend="both")
#cbar21 = plt.colorbar(sc21)
cbar21.set_label(r"$\displaystyle BR(Z^\prime \to q \overline{q}) {\rm\ [\%]} $", fontsize=20)

sc21 = ax21.plot(observedxsection13TeVZpqq36fb_Zpmass/1000.,observedxsection13TeVZpqq36fb_xsec,label=r"$ {\rm\ CMS\ Observed\ Limit\ 27\ fb^{-1}\ \&\ 36\ fb^{-1}} $",color='blue', linewidth=2.0, zorder=55,alpha=0.7)


sc21 = ax21.plot(observedxsection13TeVZpqq137fb_Zpmass,observedxsection13TeVZpqq137fb_xsec,label=r"$ {\rm\ CMS\ Observed\ Limit\ 137\ fb^{-1}} $",color='black', linewidth=2.0, zorder=60,alpha=0.7)

#sc21 = ax21.plot(expectedxsection13TeVZpmassforll,expectedxsection13TeVZpll,'--',label=r"$ {\rm\ Expected\ Limit} $",color='k', linewidth=2.0, zorder=30,alpha=0.7)

#ax21.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll2sigmamin, expectedxsection13TeVZpll2sigmamax, label=r"$ {\rm\ Expected\ \pm\ 2 \sigma} $", facecolor = 'gold', interpolate=True, alpha=.2,linewidth=0.0, zorder=10)

#ax21.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll1sigmamin, expectedxsection13TeVZpll1sigmamax, label=r"$ {\rm\ Expected\ \pm\ 1 \sigma} $", facecolor = 'lime', interpolate=True, alpha=.2,linewidth=0.0, zorder=20)


#ax21.text(3.0, 2e-0, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, \mathcal{L} = 137\ fb^{-1}$", size=15)
ax21.text(3.0, 7e-1, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, Z^\prime \to q \overline{q}$", size=15)
#ax21.text(3.0, 7e-1, r"$\displaystyle Z^\prime \to q \overline{q} $", size=15)

xmin = 0.2
xmax = 6.0
ymin = 1e-5
ymax = 3e+1

ax21.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{Z^\prime} {\rm\ [TeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle \sigma \times BR \times A {\rm\ [pb]}$", fontsize=20)


ax21.xaxis.set_major_locator(MultipleLocator(0.5))
ax21.xaxis.set_minor_locator(MultipleLocator(0.1))

#ax21.yaxis.set_major_locator(MultipleLocator(5))
#ax21.yaxis.set_minor_locator(MultipleLocator(1))

plt.yscale('log')

# Set both ticks to be outside
ax21.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='upper right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/Zptoqq_limit_withBR.png",dpi = 300)   # save the figure to file
plt.close(fig)

#############################################################################################

pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax22 = plt.subplots()

col22 = np.array(d["tanBeta"])

#formatter = LogFormatter(1, labelOnlyBase=False)

#sc22 = ax22.scatter(np.array(e["Sv1"])/1000., np.array(e["DAMU"])*10**10, c='gray', marker='.', zorder=50, label=r"$ {\rm\ Excluded\ Secluded\ UMSSM} $")

sc22 = ax22.scatter(np.array(d["Sv1"])/1000., np.array(d["DAMU"])*10**10, c=col22, cmap=cm, marker='.', zorder=51, label=r"$ {\rm\ Secluded\ UMSSM} $")

#norm=colors.LogNorm()
cbar22 = plt.colorbar(sc22, format = "%.0f", extend="both")
#cbar22 = plt.colorbar(sc22)
cbar22.set_label(r"$\displaystyle tan \beta $", fontsize=20)

xmin = 0.0
xmax = 3.5
ymin = 1
ymax = 60

ax22.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{\tilde{\chi}_1^0} {\rm\ [TeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle \Delta a_{\mu} \times 10^{10} $ ", fontsize=20)

ax22.axhspan(20.7,36.7,color='green',fill=True,alpha=.2,linewidth=0.0,zorder=4)
ax22.axhspan(12.7, 44.7,color='yellow',fill=True,alpha=.2,linewidth=0.0,zorder=3)
ax22.axhspan(3.4,55.6,color='navy',fill=True,alpha=.2,linewidth=0.0,zorder=2)

ax22.text(3.3, 7.4, r"$\displaystyle 3 \sigma$",fontsize=20)
ax22.text(3.3, 16.2, r"$\displaystyle 2 \sigma$",fontsize=20)
ax22.text(3.3, 28.3, r"$\displaystyle 1 \sigma$",fontsize=20)


plt.xlabel(r"$\displaystyle M_{\tilde{\nu}_1} {\rm\ [TeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle \Delta a_{\mu} \times 10^{10} $ ", fontsize=20)


ax22.xaxis.set_major_locator(MultipleLocator(0.5))
ax22.xaxis.set_minor_locator(MultipleLocator(0.1))

ax22.yaxis.set_major_locator(MultipleLocator(5))
ax22.yaxis.set_minor_locator(MultipleLocator(1))

#plt.yscale('log')

# Set both ticks to be outside
ax22.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='upper right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/DAMUvsSv1_tanBeta.png",dpi = 300)   # save the figure to file
plt.close(fig)


############################################    Plot #10 ####################################################

#pylab.rcParams['figure.figsize'] = (10.0, 8.0)
    
fig, ax23 = plt.subplots()
        
ax23.scatter(np.array(abs(e["Chi1"])/1000.), np.array(e.SIproton), c='grey',linewidth = '1.0', marker=".", zorder=12, label=r"$ {\rm\ Excluded\ Secluded\ UMSSM} $", s=8)

ax23.scatter(np.array(abs(d["Chi1"])/1000.), np.array(d.SIproton), c='blue',linewidth = '1.0', marker=".", zorder=15, label=r"$ {\rm\ Accepted\ Secluded\ UMSSM} $", s=10)
    
sc23 = ax23.plot(XENONWIMPMASS/1000., XENON1TXSECTION, c='lime',label=r"${\rm\ Xenon\ 1T} $",zorder=20, alpha=0.6, linewidth = '3.0')
    
ax23.fill_between(XENONWIMPMASS/1000, XENON1TXSECTION, ymax, facecolor = 'navy', interpolate=True, alpha=.2,linewidth=0.0, zorder=5, label=r"$\displaystyle {\rm\ Excluded\ by\ Xenon\ 1T} $")
    
xmin = 0.0
xmax = 1.0
ymin = 1e-14
ymax = 1e-7
    
ax23.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{\tilde{\chi}_1^0} {\rm\ [TeV]}$", fontsize=20)
#plt.ylabel(r"$\displaystyle \sigma_{SI}^{\rm proton} \rm Min \left( 1, \frac{\Omega_{\rm DM}}{\Omega_{\rm Planck}}\right) {\rm\ [pb]}$", fontsize=20)
plt.ylabel(r"$\displaystyle \sigma_{SI}^{\rm proton} {\rm\ [pb]}$", fontsize=20)
    
ax23.xaxis.set_major_locator(MultipleLocator(0.1))
ax23.xaxis.set_minor_locator(MultipleLocator(0.025))
    
#ax23.yaxis.set_major_locator(MultipleLocator(5))
#ax23.yaxis.set_minor_locator(MultipleLocator(1))
    
plt.yscale('log')
    
# Set both ticks to be outside
ax23.tick_params(which='both', direction='out')
    
#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='lower right',frameon=True)
leg.set_zorder(100)
    
fig.savefig("plot/Chi1vsSIxsection_proton.png",dpi=150)
plt.close(fig)

############################################    Plot #11 ####################################################

#pylab.rcParams['figure.figsize'] = (10.0, 8.0)

fig, ax24 = plt.subplots()

ax24.scatter(np.array(abs(e["Chi1"])/1000.), np.array(e.SIneutron), c='grey',linewidth = '1.0', marker=".", zorder=12, label=r"$ {\rm\ Excluded\ Secluded\ UMSSM} $", s=8)

ax24.scatter(np.array(abs(d["Chi1"])/1000.), np.array(d.SIneutron), c='blue',linewidth = '1.0', marker=".", zorder=15, label=r"$ {\rm\ Accepted\ Secluded\ UMSSM} $", s=10)

#ax24.text(0.025, 1.2e-3, r"$\displaystyle g_L \neq g_R = 0.37 $", size=20)

sc24 = ax24.plot(XENONWIMPMASS/1000., XENON1TXSECTION, c='lime',label=r"${\rm\ Xenon\ 1T} $",zorder=20, alpha=0.6, linewidth = '3.0')

ax24.fill_between(XENONWIMPMASS/1000, XENON1TXSECTION, ymax, facecolor = 'navy', interpolate=True, alpha=.2,linewidth=0.0, zorder=5, label=r"$\displaystyle {\rm\ Excluded\ by\ Xenon\ 1T} $")

xmin = 0.0
xmax = 1.0
ymin = 1e-14
ymax = 1e-7

ax24.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{\tilde{\chi}_1^0} {\rm\ [TeV]}$", fontsize=20)
#plt.ylabel(r"$\displaystyle \sigma_{SI}^{\rm neutron} \rm Min \left( 1, \frac{\Omega_{\rm DM}}{\Omega_{\rm Planck}}\right) {\rm\ [pb]}$", fontsize=20)
plt.ylabel(r"$\displaystyle \sigma_{SI}^{\rm neutron} {\rm\ [pb]}$", fontsize=20)

ax24.xaxis.set_major_locator(MultipleLocator(0.1))
ax24.xaxis.set_minor_locator(MultipleLocator(0.025))

#ax24.yaxis.set_major_locator(MultipleLocator(5))
#ax24.yaxis.set_minor_locator(MultipleLocator(1))

plt.yscale('log')

# Set both ticks to be outside
ax24.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='lower right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/Chi1vsSIxsection_neutron.png",dpi=150)   # save the figure to file
plt.close(fig)


############################################################################################

cm = plt.cm.get_cmap('rainbow')

fig, ax25 = plt.subplots()


ax25.scatter(np.array(abs(e["Chi1"])/1000.), np.array(e.sigmaV), c='grey',linewidth = '1.0', marker=".", zorder=12, label=r"$ {\rm\ Excluded\ Secluded\ UMSSM} $", s=8)

ax25.scatter(np.array(abs(d["Chi1"])/1000.), np.array(d.sigmaV), c='blue',linewidth = '1.0', marker=".", zorder=15, label=r"$ {\rm\ Accepted\ Secluded\ UMSSM} $", s=10)


ax25.plot(fermilatbbbarWIMPmass/1000.,fermilatbbbarsigmav, '--',label=r"$\displaystyle {\rm\ Fermi-LAT\ b\overline{b}} $",color='k', linewidth=2.0, zorder=310,alpha=0.7)

ax25.plot(fermilatWWWIMPmass/1000.,fermilatWWsigmav, '--',label=r"$\displaystyle {\rm\ Fermi-LAT\ W^-W^+} $",color='blue', linewidth=2.0, zorder=300,alpha=0.7)

ax25.plot(fermilattautauWIMPmass/1000.,fermilattautausigmav, '--',label=r"$\displaystyle {\rm\ Fermi-LAT\ \tau^-\tau^+} $",color='m', linewidth=2.0, zorder=305,alpha=0.7)

ax25.plot(fermilatmumuWIMPmass/1000.,fermilatmumusigmav, '--',label=r"$\displaystyle {\rm\ Fermi-LAT\ \mu^-\mu^+} $",color='red', linewidth=2.0, zorder=300,alpha=0.7)

xmin = 0.0
xmax = 1.0
ymin = 1e-33
ymax = 1e-24

ax25.fill_between(fermilatbbbarWIMPmass/1000., fermilatbbbarsigmav, ymax , facecolor = 'yellow', interpolate=True, alpha=.2,linewidth=0.0, zorder=25, label="Excluded by Fermi-LAT")

#cbar25.set_clim(0.0, 700)

ax25.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{\tilde{\chi}_1^0} {\rm\ [TeV]}$", fontsize=20)

#plt.ylabel(r"$\displaystyle < \sigma v> \rm Min \left( 1, (\frac{\Omega_{\rm DM}}{\Omega_{\rm Planck}})^2 \right)$ [pb]", fontsize=20)
#plt.ylabel(r"$\displaystyle < \sigma v> \rm Min \left( 1, \left( \frac{\Omega_{\rm DM}}{\Omega_{\rm Planck}} \right)^2 \right)$ {\rm\ [cm$^3$ s$^{-1}$]}", fontsize=18)
plt.ylabel(r"$\displaystyle \langle \sigma v \rangle $ {\rm\ [cm$^3$ s$^{-1}$]}", fontsize=18)

#ax25.axhspan(20.7,36.7,color='green',fill=True,alpha=.2,linewidth=0.0,zorder=4)
#ax25.axhspan(12.7, 44.7,color='yellow',fill=True,alpha=.2,linewidth=0.0,zorder=3)
#ax25.axhspan(3.4,55.6,color='navy',fill=True,alpha=.2,linewidth=0.0,zorder=2)

#ax25.text(xmax + 0.1, 7.4, r"$\displaystyle 3 \sigma$",fontsize=20)
#ax25.text(xmax + 0.1, 16.2, r"$\displaystyle 2 \sigma$",fontsize=20)
#ax25.text(xmax + 0.1, 28.3, r"$\displaystyle 1 \sigma$",fontsize=20)

ax25.xaxis.set_major_locator(MultipleLocator(0.1))
ax25.xaxis.set_minor_locator(MultipleLocator(0.025))

#ax25.yaxis.set_major_locator(MultipleLocator(5))
#ax25.yaxis.set_minor_locator(MultipleLocator(1))

plt.yscale('log')

# Set both ticks to be outside
ax25.tick_params(which='both', direction='out')

leg = plt.legend(loc='lower right',frameon=True)
leg.set_zorder(900)

fig.savefig("plot/Chi1_sigmav.png", dpi=150)   # save the figure to file
plt.close(fig)


############################################    Plot #4 ####################################################

pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax26 = plt.subplots()

col26 = np.array(d["tanBeta"])

#formatter = LogFormatter(1, labelOnlyBase=False)

sc26 = ax26.scatter(np.array(abs(e["m12"]))/1000.,np.array(abs(e["m0"]))/1000., c='gray', marker='.', zorder=45, label=r"$ {\rm\ Excluded\ Secluded\ UMSSM} $")

sc26 = ax26.scatter(np.array(abs(d["m12"]))/1000., np.array(abs(d["m0"]))/1000., c=col26, cmap=cm , marker='.', zorder=50, label=r"$ {\rm\ Accepted\ Secluded\ UMSSM} $")

#norm=colors.LogNorm(col16.min(), col16.max())
formatter = LogFormatter(10, labelOnlyBase=False)

#formatter = LogFormatter(10, labelOnlyBase=False)

cbar26 = plt.colorbar(sc26, extend="both")
cbar26.set_label(r"$\displaystyle tan \beta $", fontsize=20)

#sc26 = ax26.scatter(np.array(observedATLAS_CharNeut_139fb_Cha1)/1000., np.array(observedATLAS_CharNeut_139fb_Chi1)/1000., c='black', marker='.', linewidth=1, zorder=60, label=r"$ {\rm\ ATLAS\ Observed\ Limit} $", alpha=0.7)

#cbar26.set_ticks([col13.min(),1e-2,col13.max()])
#cbar26.set_ticklabels([col13.min(),1e-2,col13.max()])

#cbar26.formatter = LogFormatterExponent(base=10) # 10 is the default
#cbar26.update_ticks()

#ax26.text(3.0, 2e-0, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, \mathcal{L} = 137\ fb^{-1}$", size=15)
#ax26.text(3.0, 1e-0, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, Z^\prime \to q \overline{q}$", size=15)
#ax26.text(3.0, 7e-1, r"$\displaystyle Z^\prime \to q \overline{q} $", size=15)

xmin = 0.75
xmax = 3.0
ymin = 0.0
ymax = 3.0

ax26.axis([xmin,xmax,ymin,ymax])

plt.xlabel(r"$\displaystyle M_{1/2} {\rm\ [TeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle m_0 {\rm\ [TeV]}$", fontsize=20)

ax26.xaxis.set_major_locator(MultipleLocator(0.25))
ax26.xaxis.set_minor_locator(MultipleLocator(0.05))

ax26.yaxis.set_major_locator(MultipleLocator(0.25))
ax26.yaxis.set_minor_locator(MultipleLocator(0.05))

#plt.yscale('log')

# Set both ticks to be outside
ax26.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='lower left',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/secUMSSM_m0vsm12_tanb.png",dpi = 300)   # save the figure to file
plt.close(fig)

############################################    Plot #4 ####################################################

pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax27 = plt.subplots()

col27 = np.array(d["AzeroOverm0"])

#formatter = LogFormatter(1, labelOnlyBase=False)

sc27 = ax27.scatter(np.array(abs(e["m12"]))/1000.,np.array(abs(e["m0"]))/1000., c='gray', marker='.', zorder=45, label=r"$ {\rm\ Excluded\ Secluded\ UMSSM} $")

sc27 = ax27.scatter(np.array(abs(d["m12"]))/1000., np.array(abs(d["m0"]))/1000., c=col27, cmap=cm , marker='.', zorder=50, label=r"$ {\rm\ Accepted\ Secluded\ UMSSM} $")

#norm=colors.LogNorm(col16.min(), col16.max())
formatter = LogFormatter(10, labelOnlyBase=False)

#formatter = LogFormatter(10, labelOnlyBase=False)

cbar27 = plt.colorbar(sc27, extend="both")
cbar27.set_label(r"$\displaystyle A_0/m_0 $", fontsize=20)

#sc27 = ax27.scatter(np.array(observedATLAS_CharNeut_139fb_Cha1)/1000., np.array(observedATLAS_CharNeut_139fb_Chi1)/1000., c='black', marker='.', linewidth=1, zorder=60, label=r"$ {\rm\ ATLAS\ Observed\ Limit} $", alpha=0.7)

#cbar27.set_ticks([col13.min(),1e-2,col13.max()])
#cbar27.set_ticklabels([col13.min(),1e-2,col13.max()])

#cbar27.formatter = LogFormatterExponent(base=10) # 10 is the default
#cbar27.update_ticks()

#ax27.text(3.0, 2e-0, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, \mathcal{L} = 137\ fb^{-1}$", size=15)
#ax27.text(3.0, 1e-0, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, Z^\prime \to q \overline{q}$", size=15)
#ax27.text(3.0, 7e-1, r"$\displaystyle Z^\prime \to q \overline{q} $", size=15)

xmin = 0.75
xmax = 3.0
ymin = 0.0
ymax = 3.0

ax27.axis([xmin,xmax,ymin,ymax])

plt.xlabel(r"$\displaystyle M_{1/2} {\rm\ [TeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle m_0 {\rm\ [TeV]}$", fontsize=20)

ax27.xaxis.set_major_locator(MultipleLocator(0.25))
ax27.xaxis.set_minor_locator(MultipleLocator(0.05))

ax27.yaxis.set_major_locator(MultipleLocator(0.25))
ax27.yaxis.set_minor_locator(MultipleLocator(0.05))

#plt.yscale('log')

# Set both ticks to be outside
ax27.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='lower left',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/secUMSSM_m0vsm12_AzeroOverm0.png",dpi = 300)   # save the figure to file
plt.close(fig)

############################################    Plot #4 ####################################################

pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax28 = plt.subplots()

col28 = np.array(d["QS1charge"])

Acceptance = 0.5

sc28 = ax28.scatter(np.array(e["MZp"])/1000., np.array(e["xsecpptoZp"]*e["BRZptoqq"]*Acceptance), marker='.', zorder=45, color="grey", label=r"$ {\rm\ Excluded\ Secluded\ UMSSM} $")

sc28 = ax28.scatter(np.array(d["MZp"])/1000., np.array(d["xsecpptoZp"]*d["BRZptoqq"]*Acceptance), c=col28, cmap=cm, norm=colors.LogNorm(2e-1, col28.max()), marker='.', zorder=50, label=r"$ {\rm\ Accepted\ Secluded\ UMSSM} $")

def fmt(x, pos):
    a, b = '{:.0e}'.format(x).split('e')
    b = int(b)
    return r'${} \times 10^{{{}}}$'.format(a, b)


#formatter = LogFormatter(10, labelOnlyBase=False)
#cbar28.formatter = LogFormatterExponent(base=10) # 10 is the default


cbar28 = plt.colorbar(sc28, format=FuncFormatter(fmt))
cbar28.set_label(r"$\displaystyle Q_{S_1} = Q_{S_3} = - \frac{Q_{S_2}}{2} =\delta $", fontsize=20)


cbar28.set_ticks([2e-1, col28.max()])
cbar28.set_ticklabels([r'$2 \times 10^{-1}$', r'$5 \times 10^{-1}$'])


##cbar28.set_ticks([col14.min(),1e-2,col14.max()])
#cbar28.set_ticks([2e-1, 1e-1, col14.max()])
#cbar28.set_ticklabels([2e-1, 1e-1, col14.max()])
#cbar28.set_ticklabels([log10(2e-1),log10(1e-1),log10(col14.max())])


#cbar28.formatter = LogFormatterExponent(base=10) # 10 is the default
#cbar28.update_ticks()

sc28 = ax28.plot(observedxsection13TeVZpqq36fb_Zpmass/1000.,observedxsection13TeVZpqq36fb_xsec,label=r"$ {\rm\ CMS\ Observed\ Limit\ 27\ fb^{-1}\ \&\ 36\ fb^{-1}} $",color='blue', linewidth=2.0, zorder=55,alpha=0.7)

sc28 = ax28.plot(observedxsection13TeVZpqq137fb_Zpmass,observedxsection13TeVZpqq137fb_xsec,label=r"$ {\rm\ CMS\ Observed\ Limit\ 137\ fb^{-1}} $",color='black', linewidth=2.0, zorder=60,alpha=0.7)

#sc28 = ax28.plot(expectedxsection13TeVZpmassforll,expectedxsection13TeVZpll,'--',label=r"$ {\rm\ Expected\ Limit} $",color='k', linewidth=2.0, zorder=30,alpha=0.7)

#ax28.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll2sigmamin, expectedxsection13TeVZpll2sigmamax, label=r"$ {\rm\ Expected\ \pm\ 2 \sigma} $", facecolor = 'gold', interpolate=True, alpha=.2,linewidth=0.0, zorder=10)

#ax28.fill_between(expectedxsection13TeVZpmassforll, expectedxsection13TeVZpll1sigmamin, expectedxsection13TeVZpll1sigmamax, label=r"$ {\rm\ Expected\ \pm\ 1 \sigma} $", facecolor = 'lime', interpolate=True, alpha=.2,linewidth=0.0, zorder=20)


#ax28.text(3.0, 2e-0, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, \mathcal{L} = 137\ fb^{-1}$", size=15)
ax28.text(3.0, 1e-7, r"$\displaystyle \sqrt{s} = 13 {\rm\ TeV}, Z^\prime \to q \overline{q}$", size=15)
#ax28.text(3.0, 7e-1, r"$\displaystyle Z^\prime \to q \overline{q} $", size=15)

xmin = 0.2
xmax = 6.0
ymin = 1e-5
ymax = 3e+1

ax28.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{Z^\prime} {\rm\ [TeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle \sigma \times BR \times A {\rm\ [pb]}$", fontsize=20)


ax28.xaxis.set_major_locator(MultipleLocator(0.5))
ax28.xaxis.set_minor_locator(MultipleLocator(0.1))

#ax28.yaxis.set_major_locator(MultipleLocator(5))
#ax28.yaxis.set_minor_locator(MultipleLocator(1))

plt.yscale('log')

# Set both ticks to be outside
ax28.tick_params(which='both', direction='out')

#plt.legend(loc='best',frameon=True)
leg = plt.legend(loc='upper right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/Zptoqq_limit_QS1charge.png",dpi = 300)   # save the figure to file
plt.close(fig)

#############################################################################################

cm = plt.cm.get_cmap('rainbow')

fig, ax29 = plt.subplots()

col29 = np.array(d["MZp"])/1000.

sc29 = ax29.scatter(np.array(abs(e["Chi1"])/1000.), np.array(e["RelicDensity"]), c='gray', marker='.', zorder=45, label=r"$ {\rm\ Excluded\ Secluded\ UMSSM} $", s=8)

#norm=colors.LogNorm(col29.min(), col29.max())
sc29 = ax29.scatter(np.array(abs(d["Chi1"])/1000.), np.array(d["RelicDensity"]), c=col29, cmap=cm, marker='.', zorder=50, label=r"$ {\rm\ Accepted\ Secluded\ UMSSM} $", s=8)

#ax29.text(0.7, 1.5e4, r"$\displaystyle g_L \neq g_R = 0.37 $", size=15)
#ax29.text(0.7, 1.5e4, r"$\displaystyle g_L \neq g_R $", size=15)

cbar29 = plt.colorbar(sc29, extend="both")
cbar29.set_label(r"$\displaystyle M_{Z^\prime} {\rm\ [TeV]}$", fontsize=20)

#cbar29.set_ticks([col29.min(), col29.max()])
#cbar29.set_ticklabels([r'$1$', r'$2$', r'$3$', r'$4$', r'$5$'])


xmin = 0.0
xmax = 1.0
ymin = 1e-3
ymax = 1e4

ax29.axhspan(0.096,0.122,color='green',fill=True,alpha=.3,linewidth=0.0,zorder=80, label="Planck Constraints")

mh0_mass = 125.09
mh0_min = (mh0_mass-15.)/1000.
mh0_max = (mh0_mass+15.)/1000.
#ax29.axvspan(mh0_min/2., mh0_max/2., color='purple',fill=True,alpha=.2,linewidth=0.0,zorder=78, label="H$_0$ Funnel")

mZ_mass = 91.1876
mZ_min = (mZ_mass-15.)/1000.
mZ_max = (mZ_mass+15.)/1000.
#ax29.axvspan(mZ_min/2., mZ_max/2., color='blue',fill=True,alpha=.2,linewidth=0.0,zorder=75, label="Z Funnel")

ax29.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{\tilde{\chi}_1^0} {\rm\ [TeV]}$", fontsize=20, labelpad=10)
plt.ylabel(r"$\displaystyle \Omega_{\rm DM} h^2 $ ", fontsize=20)

ax29.xaxis.set_major_locator(MultipleLocator(0.1))
ax29.xaxis.set_minor_locator(MultipleLocator(0.025))

#ax29.yaxis.set_major_locator(MultipleLocator(5))
#ax29.yaxis.set_minor_locator(MultipleLocator(1))

plt.yscale('log')

# Set both ticks to be outside
ax29.tick_params(which='both', direction='out')

#plt.legend(loc='upper left',frameon=True)
leg = plt.legend(loc='upper right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/MassChi1vsRD_MassZp.png", dpi=150)   # save the figure to file
plt.close(fig)


##############################################################################################

pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax30 = plt.subplots()

col30 = np.array(d["MZp"]/d["gpSUSY"])/1000.

#formatter = LogFormatter(1, labelOnlyBase=False)

sc30 = ax30.scatter(np.array(abs(d["MZp"]))/1000., np.array(d["DAMU"])*10**10, c=col30, cmap=cm , marker='.', zorder=50, label=r"$ {\rm\ Secluded\ UMSSM} $")

cbar30 = plt.colorbar(sc30, extend="both")
cbar30.set_label(r"$\displaystyle \frac{M_{Z^\prime}}{g^\prime_{\rm SUSY}} {\rm\ [TeV]} $", fontsize=20)

ax30.axis([1.5,5.5,0.0,60])
plt.xlabel(r"$\displaystyle M_{Z^\prime} {\rm\ [TeV]}$", fontsize=20)
plt.ylabel(r"$\displaystyle \Delta a_{\mu} \times 10^{10} $ ", fontsize=20)

ax30.axhspan(20.7,36.7,color='green',fill=True,alpha=.2,linewidth=0.0,zorder=4)
ax30.axhspan(12.7, 44.7,color='yellow',fill=True,alpha=.2,linewidth=0.0,zorder=3)
ax30.axhspan(3.4,55.6,color='navy',fill=True,alpha=.2,linewidth=0.0,zorder=2)

ax30.text(750., 7.4, r"$\displaystyle 3 \sigma$",fontsize=20)
ax30.text(750, 16.2, r"$\displaystyle 2 \sigma$",fontsize=20)
ax30.text(750, 28.3, r"$\displaystyle 1 \sigma$",fontsize=20)

ax30.xaxis.set_major_locator(MultipleLocator(0.5))
ax30.xaxis.set_minor_locator(MultipleLocator(0.1))

ax30.yaxis.set_major_locator(MultipleLocator(5))
ax30.yaxis.set_minor_locator(MultipleLocator(1))

# Set both ticks to be outside
ax30.tick_params(which='both', direction='out')

leg = plt.legend(loc='best',frameon=True)
leg.set_zorder(100)

fig.savefig('plot/secUMSSM_DAMU_MassZp.png',dpi = 300)   # save the figure to file
plt.close(fig)

#############################################################################################

pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax31 = plt.subplots()

col31 = np.array(SLike)*100.

sc31 = ax31.scatter(np.array(abs(e["Chi1"])/1000.), np.array(e["RelicDensity"]), c='gray', marker='.', zorder=45, label=r"$ {\rm\ Excluded\ Secluded\ UMSSM} $", s=8)

sc31 = ax31.scatter(np.array(abs(d["Chi1"])/1000.), np.array(d["RelicDensity"]), c=col31, cmap=cm , marker='.', zorder=50, label=r"$ {\rm\ Accepted\ Secluded\ UMSSM} $", s=10)

#ax31.text(0.7, 1.5e4, r"$\displaystyle g_L \neq g_R = 0.37 $", size=15)
#ax31.text(0.7, 1.5e4, r"$\displaystyle g_L \neq g_R $", size=15)

cbar31 = plt.colorbar(sc31, extend="both")
cbar31.set_label(r"$\displaystyle \tilde{S}-{\rm like} = | N^{\rm MIX}_{16} |^2 {\rm\ [\%]}$", fontsize=20)

xmin = 0.0
xmax = 1.0
ymin = 1e-3
ymax = 1e4

ax31.axhspan(0.096,0.122,color='green',fill=True,alpha=.3,linewidth=0.0,zorder=80, label="Planck Constraints")

mh0_mass = 125.09
mh0_min = (mh0_mass-15.)/1000.
mh0_max = (mh0_mass+15.)/1000.
#ax31.axvspan(mh0_min/2., mh0_max/2., color='purple',fill=True,alpha=.2,linewidth=0.0,zorder=78, label="H$_0$ Funnel")

mZ_mass = 91.1876
mZ_min = (mZ_mass-15.)/1000.
mZ_max = (mZ_mass+15.)/1000.
#ax31.axvspan(mZ_min/2., mZ_max/2., color='blue',fill=True,alpha=.2,linewidth=0.0,zorder=75, label="Z Funnel")

ax31.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{\tilde{\chi}_1^0} {\rm\ [TeV]}$", fontsize=20, labelpad=10)
plt.ylabel(r"$\displaystyle \Omega_{\rm DM} h^2 $ ", fontsize=20)

ax31.xaxis.set_major_locator(MultipleLocator(0.1))
ax31.xaxis.set_minor_locator(MultipleLocator(0.025))

#ax31.yaxis.set_major_locator(MultipleLocator(5))
#ax31.yaxis.set_minor_locator(MultipleLocator(1))

plt.yscale('log')

# Set both ticks to be outside
ax31.tick_params(which='both', direction='out')

#plt.legend(loc='upper left',frameon=True)
leg = plt.legend(loc='upper right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/MassChi1vsRD_SLike.png", dpi=150)   # save the figure to file
plt.close(fig)

#############################################################################################

pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax32 = plt.subplots()

col32 = np.array(HiggsinoLike)*100.

sc32 = ax32.scatter(np.array(abs(e["Chi1"])/1000.), np.array(e["RelicDensity"]), c='gray', marker='.', zorder=45, label=r"$ {\rm\ Excluded\ Secluded\ UMSSM} $", s=8)

sc32 = ax32.scatter(np.array(abs(d["Chi1"])/1000.), np.array(d["RelicDensity"]), c=col32, cmap=cm , marker='.', zorder=50, label=r"$ {\rm\ Accepted\ Secluded\ UMSSM} $", s=10)

#ax32.text(0.7, 1.5e4, r"$\displaystyle g_L \neq g_R = 0.37 $", size=15)
#ax32.text(0.7, 1.5e4, r"$\displaystyle g_L \neq g_R $", size=15)

cbar32 = plt.colorbar(sc32, extend="both")
cbar32.set_label(r"$\displaystyle \tilde{H}-{\rm like} = | N^{\rm MIX}_{14} |^2 + | N^{\rm MIX}_{15} |^2 {\rm\ [\%]}$", fontsize=20)

xmin = 0.0
xmax = 1.0
ymin = 1e-3
ymax = 1e4

ax32.axhspan(0.096,0.122,color='green',fill=True,alpha=.3,linewidth=0.0,zorder=80, label="Planck Constraints")

mh0_mass = 125.09
mh0_min = (mh0_mass-15.)/1000.
mh0_max = (mh0_mass+15.)/1000.
#ax32.axvspan(mh0_min/2., mh0_max/2., color='purple',fill=True,alpha=.2,linewidth=0.0,zorder=78, label="H$_0$ Funnel")

mZ_mass = 91.1876
mZ_min = (mZ_mass-15.)/1000.
mZ_max = (mZ_mass+15.)/1000.
#ax32.axvspan(mZ_min/2., mZ_max/2., color='blue',fill=True,alpha=.2,linewidth=0.0,zorder=75, label="Z Funnel")

ax32.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{\tilde{\chi}_1^0} {\rm\ [TeV]}$", fontsize=20, labelpad=10)
plt.ylabel(r"$\displaystyle \Omega_{\rm DM} h^2 $ ", fontsize=20)

ax32.xaxis.set_major_locator(MultipleLocator(0.1))
ax32.xaxis.set_minor_locator(MultipleLocator(0.025))

#ax32.yaxis.set_major_locator(MultipleLocator(5))
#ax32.yaxis.set_minor_locator(MultipleLocator(1))

plt.yscale('log')

# Set both ticks to be outside
ax32.tick_params(which='both', direction='out')

#plt.legend(loc='upper left',frameon=True)
leg = plt.legend(loc='upper right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/MassChi1vsRD_HiggsinoLike.png", dpi=150)   # save the figure to file
plt.close(fig)

#############################################################################################

pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax33 = plt.subplots()

col33 = np.array(AllScalarCont)*100.

sc33 = ax33.scatter(np.array(abs(e["Chi1"])/1000.), np.array(e["RelicDensity"]), c='gray', marker='.', zorder=45, label=r"$ {\rm\ Excluded\ Secluded\ UMSSM} $", s=8)

sc33 = ax33.scatter(np.array(abs(d["Chi1"])/1000.), np.array(d["RelicDensity"]), c=col33, cmap=cm , marker='.', zorder=50, label=r"$ {\rm\ Accepted\ Secluded\ UMSSM} $", s=10)

#ax33.text(0.7, 1.5e4, r"$\displaystyle g_L \neq g_R = 0.37 $", size=15)
#ax33.text(0.7, 1.5e4, r"$\displaystyle g_L \neq g_R $", size=15)

cbar33 = plt.colorbar(sc33, extend="both")
cbar33.set_label(r"$\displaystyle {\rm\ Singlino\ Cont.} = \sum_{j=6}^{9} | N^{\rm MIX}_{1j} |^2 {\rm\ [\%]}$", fontsize=20)

xmin = 0.0
xmax = 1.0
ymin = 1e-3
ymax = 1e4

ax33.axhspan(0.096,0.122,color='green',fill=True,alpha=.3,linewidth=0.0,zorder=80, label="Planck Constraints")

mh0_mass = 125.09
mh0_min = (mh0_mass-15.)/1000.
mh0_max = (mh0_mass+15.)/1000.
#ax32.axvspan(mh0_min/2., mh0_max/2., color='purple',fill=True,alpha=.2,linewidth=0.0,zorder=78, label="H$_0$ Funnel")

mZ_mass = 91.1876
mZ_min = (mZ_mass-15.)/1000.
mZ_max = (mZ_mass+15.)/1000.
#ax33.axvspan(mZ_min/2., mZ_max/2., color='blue',fill=True,alpha=.2,linewidth=0.0,zorder=75, label="Z Funnel")

ax33.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{\tilde{\chi}_1^0} {\rm\ [TeV]}$", fontsize=20, labelpad=10)
plt.ylabel(r"$\displaystyle \Omega_{\rm DM} h^2 $ ", fontsize=20)

ax33.xaxis.set_major_locator(MultipleLocator(0.1))
ax33.xaxis.set_minor_locator(MultipleLocator(0.025))

#ax33.yaxis.set_major_locator(MultipleLocator(5))
#ax33.yaxis.set_minor_locator(MultipleLocator(1))

plt.yscale('log')

# Set both ticks to be outside
ax33.tick_params(which='both', direction='out')

#plt.legend(loc='upper left',frameon=True)
leg = plt.legend(loc='upper right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/MassChi1vsRD_AllSinglinoLike.png", dpi=150)   # save the figure to file
plt.close(fig)

#############################################################################################

pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax34 = plt.subplots()

col34 = np.array(S1S2S3Like)*100.

sc34 = ax34.scatter(np.array(abs(e["Chi1"])/1000.), np.array(e["RelicDensity"]), c='gray', marker='.', zorder=45, label=r"$ {\rm\ Excluded\ Secluded\ UMSSM} $", s=8)

sc34 = ax34.scatter(np.array(abs(d["Chi1"])/1000.), np.array(d["RelicDensity"]), c=col34, cmap=cm , marker='.', zorder=50, label=r"$ {\rm\ Accepted\ Secluded\ UMSSM} $", s=10)

#ax34.text(0.7, 1.5e4, r"$\displaystyle g_L \neq g_R = 0.37 $", size=15)
#ax34.text(0.7, 1.5e4, r"$\displaystyle g_L \neq g_R $", size=15)

cbar34 = plt.colorbar(sc34, extend="both")
cbar34.set_label(r"$\displaystyle {\rm\ S_1, S_2, S_3 \ Cont.} = \sum_{j=7}^{9} | N^{\rm MIX}_{1j} |^2 {\rm\ [\%]}$", fontsize=20)

xmin = 0.0
xmax = 1.0
ymin = 1e-3
ymax = 1e4

ax34.axhspan(0.096,0.122,color='green',fill=True,alpha=.3,linewidth=0.0,zorder=80, label="Planck Constraints")

mh0_mass = 125.09
mh0_min = (mh0_mass-15.)/1000.
mh0_max = (mh0_mass+15.)/1000.
#ax32.axvspan(mh0_min/2., mh0_max/2., color='purple',fill=True,alpha=.2,linewidth=0.0,zorder=78, label="H$_0$ Funnel")

mZ_mass = 91.1876
mZ_min = (mZ_mass-15.)/1000.
mZ_max = (mZ_mass+15.)/1000.
#ax34.axvspan(mZ_min/2., mZ_max/2., color='blue',fill=True,alpha=.2,linewidth=0.0,zorder=75, label="Z Funnel")

ax34.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{\tilde{\chi}_1^0} {\rm\ [TeV]}$", fontsize=20, labelpad=10)
plt.ylabel(r"$\displaystyle \Omega_{\rm DM} h^2 $ ", fontsize=20)

ax34.xaxis.set_major_locator(MultipleLocator(0.1))
ax34.xaxis.set_minor_locator(MultipleLocator(0.025))

#ax34.yaxis.set_major_locator(MultipleLocator(5))
#ax34.yaxis.set_minor_locator(MultipleLocator(1))

plt.yscale('log')

# Set both ticks to be outside
ax34.tick_params(which='both', direction='out')

#plt.legend(loc='upper left',frameon=True)
leg = plt.legend(loc='upper right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/MassChi1vsRD_S1S2S3Like.png", dpi=150)   # save the figure to file
plt.close(fig)


#############################################################################################

pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax35 = plt.subplots()

col35 = np.array(BinoLike)*100.

sc35 = ax35.scatter(np.array(abs(e["Chi1"])/1000.), np.array(e["RelicDensity"]), c='gray', marker='.', zorder=45, label=r"$ {\rm\ Excluded\ Secluded\ UMSSM} $", s=8)

sc35 = ax35.scatter(np.array(abs(d["Chi1"])/1000.), np.array(d["RelicDensity"]), c=col35, cmap=cm , marker='.', zorder=50, label=r"$ {\rm\ Accepted\ Secluded\ UMSSM} $", s=10)

#ax35.text(0.7, 1.5e4, r"$\displaystyle g_L \neq g_R = 0.37 $", size=15)
#ax35.text(0.7, 1.5e4, r"$\displaystyle g_L \neq g_R $", size=15)

cbar35 = plt.colorbar(sc35, extend="both")
cbar35.set_label(r"$\displaystyle {\rm\ Bino-like} = | N^{\rm MIX}_{12} |^2 {\rm\ [\%]}$", fontsize=20)

xmin = 0.0
xmax = 1.0
ymin = 1e-3
ymax = 1e4

ax35.axhspan(0.096,0.122,color='green',fill=True,alpha=.3,linewidth=0.0,zorder=80, label="Planck Constraints")

mh0_mass = 125.09
mh0_min = (mh0_mass-15.)/1000.
mh0_max = (mh0_mass+15.)/1000.
#ax32.axvspan(mh0_min/2., mh0_max/2., color='purple',fill=True,alpha=.2,linewidth=0.0,zorder=78, label="H$_0$ Funnel")

mZ_mass = 91.1876
mZ_min = (mZ_mass-15.)/1000.
mZ_max = (mZ_mass+15.)/1000.
#ax34.axvspan(mZ_min/2., mZ_max/2., color='blue',fill=True,alpha=.2,linewidth=0.0,zorder=75, label="Z Funnel")

ax35.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{\tilde{\chi}_1^0} {\rm\ [TeV]}$", fontsize=20, labelpad=10)
plt.ylabel(r"$\displaystyle \Omega_{\rm DM} h^2 $ ", fontsize=20)

ax35.xaxis.set_major_locator(MultipleLocator(0.1))
ax35.xaxis.set_minor_locator(MultipleLocator(0.025))

#ax34.yaxis.set_major_locator(MultipleLocator(5))
#ax34.yaxis.set_minor_locator(MultipleLocator(1))

plt.yscale('log')

# Set both ticks to be outside
ax35.tick_params(which='both', direction='out')

#plt.legend(loc='upper left',frameon=True)
leg = plt.legend(loc='upper right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/MassChi1vsRD_BinoLike.png", dpi=150)   # save the figure to file
plt.close(fig)


#############################################################################################

pylab.rcParams['figure.figsize'] = (8.0, 6.0)

cm = plt.cm.get_cmap('rainbow')

fig, ax36 = plt.subplots()

col36 = np.array(BinoPrimeLike)*100.

sc36 = ax36.scatter(np.array(abs(e["Chi1"])/1000.), np.array(e["RelicDensity"]), c='gray', marker='.', zorder=45, label=r"$ {\rm\ Excluded\ Secluded\ UMSSM} $", s=8)

sc36 = ax36.scatter(np.array(abs(d["Chi1"])/1000.), np.array(d["RelicDensity"]), c=col36, cmap=cm , marker='.', zorder=50, label=r"$ {\rm\ Accepted\ Secluded\ UMSSM} $", s=10)

#ax36.text(0.7, 1.5e4, r"$\displaystyle g_L \neq g_R = 0.37 $", size=15)
#ax36.text(0.7, 1.5e4, r"$\displaystyle g_L \neq g_R $", size=15)

cbar36 = plt.colorbar(sc36, extend="both")
cbar36.set_label(r"$\displaystyle \tilde{B}^\prime {\rm-like} = | N^{\rm MIX}_{11} |^2 {\rm\ [\%]}$", fontsize=20)

xmin = 0.0
xmax = 1.0
ymin = 1e-3
ymax = 1e4

ax36.axhspan(0.096,0.122,color='green',fill=True,alpha=.3,linewidth=0.0,zorder=80, label="Planck Constraints")

mh0_mass = 125.09
mh0_min = (mh0_mass-15.)/1000.
mh0_max = (mh0_mass+15.)/1000.
#ax36.axvspan(mh0_min/2., mh0_max/2., color='purple',fill=True,alpha=.2,linewidth=0.0,zorder=78, label="H$_0$ Funnel")

mZ_mass = 91.1876
mZ_min = (mZ_mass-15.)/1000.
mZ_max = (mZ_mass+15.)/1000.
#ax36.axvspan(mZ_min/2., mZ_max/2., color='blue',fill=True,alpha=.2,linewidth=0.0,zorder=75, label="Z Funnel")

ax36.axis([xmin,xmax,ymin,ymax])
plt.xlabel(r"$\displaystyle M_{\tilde{\chi}_1^0} {\rm\ [TeV]}$", fontsize=20, labelpad=10)
plt.ylabel(r"$\displaystyle \Omega_{\rm DM} h^2 $ ", fontsize=20)

ax36.xaxis.set_major_locator(MultipleLocator(0.1))
ax36.xaxis.set_minor_locator(MultipleLocator(0.025))

#ax36.yaxis.set_major_locator(MultipleLocator(5))
#ax36.yaxis.set_minor_locator(MultipleLocator(1))

plt.yscale('log')

# Set both ticks to be outside
ax36.tick_params(which='both', direction='out')

#plt.legend(loc='upper left',frameon=True)
leg = plt.legend(loc='upper right',frameon=True)
leg.set_zorder(100)

fig.savefig("plot/MassChi1vsRD_BinoPrimeLike.png", dpi=150)   # save the figure to file
plt.close(fig)

