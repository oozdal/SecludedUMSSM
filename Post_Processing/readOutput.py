import pyslha
import fnmatch
import os
from MyPySLHA import *

datafilepath = os.path.abspath("/home/phylab/projects/Secluded_UMSSM/data/Zptoll.txt")
maindirpath = os.path.abspath("/home/phylab/projects/Secluded_UMSSM")
numberofoutputdir = len(fnmatch.filter(os.listdir(maindirpath), 'Sec*'))
for i in range(1,numberofoutputdir+1):
    f_filename = "Sec"+str(i)
    outputdir = f_filename + "/SPhenoOutputs"
    numberofoutput = len(fnmatch.filter(os.listdir(outputdir), 'SPheno.spc.sUMSSM_QH.*'))
    print numberofoutput

    for j in range(1,numberofoutput):
        outputfilefullpath  = os.path.abspath(outputdir+"/SPheno.spc.sUMSSM_QH."+str(j))

        SLHA = MyPySLHA()
        if SLHA.CheckLHAexist(outputfilefullpath):
            SLHA.LoadLHAFile(outputfilefullpath)
            SLHA.BRZptoee     = SLHA.Read_Decays(31,[-11,11])
            SLHA.BRZptomumu   = SLHA.Read_Decays(31,[-13,13]) 
            SLHA.BRZptoll     = SLHA.BRZptoee + SLHA.BRZptomumu

            if   SLHA.Read_Decays(31,[-1,1]) == None: SLHA.Zpq1q1 = 0
            else: SLHA.Zpq1q1                 = SLHA.Read_Decays(31,[-1,1])
            if SLHA.Read_Decays(31,[-3,3]) == None: SLHA.Zpq3q3 = 0
            else: SLHA.Zpq3q3                 = SLHA.Read_Decays(31,[-3,3])
            if SLHA.Read_Decays(31,[-5,5]) == None: SLHA.Zpq5q5 = 0
            else: SLHA.Zpq5q5                 = SLHA.Read_Decays(31,[-5,5])
            if SLHA.Read_Decays(31,[-2,2]) == None: SLHA.Zpq2q2 = 0
            else: SLHA.Zpq2q2                 = SLHA.Read_Decays(31,[-2,2])
            if SLHA.Read_Decays(31,[-4,4]) == None: SLHA.Zpq4q4 = 0
            else: SLHA.Zpq4q4                 = SLHA.Read_Decays(31,[-4,4])
            if SLHA.Read_Decays(31,[-6,6]) == None: SLHA.Zpq6q6 = 0
            else: SLHA.Zpq6q6                 = SLHA.Read_Decays(31,[-6,6])

            SLHA.BRZptoqq     = SLHA.Zpq1q1 + SLHA.Zpq3q3 + SLHA.Zpq5q5 + SLHA.Zpq2q2 + SLHA.Zpq4q4 + SLHA.Zpq6q6

            SLHA.MZp          = SLHA.ParticleMass
            SLHA.Zptotalwidth = SLHA.totalwidth
            SLHA.QH           = SLHA.Read_Block("EXTPAR",200) 

            g= open(datafilepath,"a+")
            g.write("%.6E %.6E %.6E %.2E %.6E" % (SLHA.MZp, SLHA.Zptotalwidth/SLHA.MZp, SLHA.BRZptoll, SLHA.QH, SLHA.BRZptoqq))
            g.write('\n')
            g.close()
            

