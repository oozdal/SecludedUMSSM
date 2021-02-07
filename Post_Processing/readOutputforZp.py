import pyslha
import fnmatch
import os, re
from MyPySLHA import *

datafilepath     = os.path.abspath("/scratch/oo4g19/projects/Secluded_UMSSM/data/ZptollExcl.txt")
ExcludedDataPath = os.path.abspath("/scratch/oo4g19/projects/Secluded_UMSSM/data/ExcludedData.txt")
maindirpath      = os.path.abspath("/scratch/oo4g19/projects/Secluded_UMSSM")
MGdirectory      = "/home/oo4g19/softwares/MG5_aMC_v2_6_7/secUMSSM_pptozp/Events"

###########################################################

numberofoutputdir = len(fnmatch.filter(os.listdir(maindirpath), 'Sec*'))

for i in range(1,numberofoutputdir+1):
#for i in range(1,70):
    f_filename     = "Sec"+str(i)
    outputdir      = f_filename + "/SPhenoOutputs"
    numberofoutput = len(fnmatch.filter(os.listdir(outputdir), 'SPheno.spc.sec_UMSSM.*'))
    print f_filename

    for j in range(1,numberofoutput):
    	outputfilefullpath   = os.path.abspath(outputdir+"/SPheno.spc.sec_UMSSM."+str(j))
    	MGoutputfilefullpath = os.path.abspath(MGdirectory+"/Sec"+str(i)+"_"+str(j)+"/Sec"+str(i)+"_"+str(j)+"_tag_1_banner.txt")
#    	FullSysErrPath       = os.path.abspath(MGdirectory+"/Sec2"+str(i)+"/parton_systematics.log")
	print outputfilefullpath

    	SLHA = MyPySLHA()
	if SLHA.CheckLHAexist(outputfilefullpath) == True:
#	if SLHA.CheckLHAexist(outputfilefullpath) and SLHA.MassBounds() == True:
#    	if (SLHA.CheckLHAexist(outputfilefullpath) and SLHA.CheckLHAexist(MGoutputfilefullpath)) == True:
        	SLHA.LoadLHAFile(outputfilefullpath)
                if    SLHA.Read_Decays(31,[-11,11]) == None:        	SLHA.BRZptoee     = 0
		else : SLHA.BRZptoee     = SLHA.Read_Decays(31,[-11,11])
        	if SLHA.Read_Decays(31,[-13,13]) == None:               SLHA.BRZptomumu   = 0
		else : SLHA.BRZptomumu   = SLHA.Read_Decays(31,[-13,13]) 
        	SLHA.BRZptoll     = SLHA.BRZptoee + SLHA.BRZptomumu
		if    SLHA.Read_Decays(1000024,[1000022,24]) == None: SLHA.BRCha1toWChi1 = 0  
		else: SLHA.BRCha1toWChi1                      = SLHA.Read_Decays(1000024,[1000022,24])
                if    SLHA.Read_Decays(31,[1000024,-1000024]) == None: SLHA.BRZptoCha1Cha1 = 0
                else: SLHA.BRZptoCha1Cha1                     = SLHA.Read_Decays(31,[1000024,-1000024])		
		SLHA.QQcharge     = SLHA.allcontent.blocks["XCHARGE"][1]
		SLHA.gpGUT        = SLHA.allcontent.blocks["GAUGEGUT"][5]
		SLHA.gpSUSY       = SLHA.allcontent.blocks["GAUGE"][5]
		SLHA.gLSUSY       = SLHA.allcontent.blocks["GAUGE"][2]
		SLHA.DAMU         = SLHA.allcontent.blocks["SPHENOLOWENERGY"][21]
		SLHA.Chi1         = SLHA.allcontent.blocks["MASS"][1000022]           
		SLHA.Chi2	  = SLHA.allcontent.blocks["MASS"][1000023]
		SLHA.Chi3         = SLHA.allcontent.blocks["MASS"][1000025]
		SLHA.Cha1         = SLHA.allcontent.blocks["MASS"][1000024]

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
#        	if SLHA.Read_Decays(31,[-6,6]) == None: SLHA.Zpq6q6 = 0
#        	else: SLHA.Zpq6q6                 = SLHA.Read_Decays(31,[-6,6])

        	SLHA.BRZptoqq     = SLHA.Zpq1q1 + SLHA.Zpq3q3 + SLHA.Zpq5q5 + SLHA.Zpq2q2 + SLHA.Zpq4q4

        	SLHA.MZp          = SLHA.ParticleMass
        	SLHA.Zptotalwidth = SLHA.totalwidth

#        	SLHA.ReadxSection(MGoutputfilefullpath)
#        	SLHA.ReadUncertainty(FullSysErrPath)
		SLHA.chi2STU()

		if SLHA.chi2STU() == True:        
        		g= open(datafilepath,"a+")
#        		g.write("%.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E" % (SLHA.MZp, SLHA.Zptotalwidth/SLHA.MZp, SLHA.BRZptoll, SLHA.BRZptoqq, SLHA.xsection, SLHA.QQcharge, SLHA.gpGUT, SLHA.gpSUSY, SLHA.DAMU, SLHA.Chi1, SLHA.Chi2, SLHA.Cha1, SLHA.BRCha1toWChi1))
                	g.write("%.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E" % (SLHA.MZp, SLHA.Zptotalwidth/SLHA.MZp, SLHA.BRZptoll, SLHA.BRZptoqq, SLHA.QQcharge, SLHA.gpGUT, SLHA.gpSUSY, SLHA.DAMU, SLHA.Chi1, SLHA.Chi2, SLHA.Cha1, SLHA.BRCha1toWChi1, SLHA.BRZptoCha1Cha1, SLHA.chi2))
       	 		g.write('\n')
        		g.close()
		else:
                        f= open(ExcludedDataPath,"a+")
#                       f.write("%.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E" % (SLHA.MZp, SLHA.Zptotalwidth/SLHA.MZp, SLHA.BRZptoll, SLHA.BRZptoqq, SLHA.xsection, SLHA.QQcharge, SLHA.gpGUT, SLHA.gpSUSY, SLHA.DAMU, SLHA.Chi1, SLHA.Chi2, SLHA.Cha1, SLHA.BRCha1toWChi1))
                        f.write("%.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E" % (SLHA.MZp, SLHA.Zptotalwidth/SLHA.MZp, SLHA.BRZptoll, SLHA.BRZptoqq, SLHA.QQcharge, SLHA.gpGUT, SLHA.gpSUSY, SLHA.DAMU, SLHA.Chi1, SLHA.Chi2, SLHA.Cha1, SLHA.BRCha1toWChi1, SLHA.BRZptoCha1Cha1, SLHA.chi2))
                        f.write('\n')
                        f.close()			
            

