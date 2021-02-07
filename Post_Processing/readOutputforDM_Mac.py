import pyslha
import fnmatch
import os, re
from MyPySLHA_Mac import *

datafilepath     = os.path.abspath("/Volumes/LaCie/Iridis/projects/Secluded_UMSSM/data/March26_II.txt")
dataRDpath       = os.path.abspath("/scratch/oo4g19/projects/Secluded_UMSSM/data/RD_test.txt")
ExcludedDataPath = os.path.abspath("/scratch/oo4g19/projects/Secluded_UMSSM/data/ExcludedData_test.txt")
maindirpath      = os.path.abspath("/Volumes/LaCie/Iridis/projects/Secluded_UMSSM")
MGdirectory      = "/home/oo4g19/softwares/MG5_aMC_v2_6_7/secUMSSM_pptozp/Events"

###########################################################

def is_non_zero_file(fpath):
    return os.path.isfile(fpath) and os.path.getsize(fpath) > 0

###########################################################

numberofoutputdir = len(fnmatch.filter(os.listdir(maindirpath), 'Sec*'))

for i in range(1,numberofoutputdir):
#for i in range(5,10):
    f_filename       = "Sec"+str(i)
    outputdir        = f_filename + "/SPhenoOutputs"
    numberofoutput   = len(fnmatch.filter(os.listdir(outputdir), 'SPheno.spc.sec_UMSSM.*'))
    print f_filename

    MicromegasOutdir = f_filename + "/MicromegasOutputs"

    for j in range(1,numberofoutput):
    	outputfilefullpath   = os.path.abspath(outputdir+"/SPheno.spc.sec_UMSSM."+str(j))
    	MGoutputfilefullpath = os.path.abspath(MGdirectory+"/Sec"+str(i)+"_"+str(j)+"/Sec"+str(i)+"_"+str(j)+"_tag_1_banner.txt")
#    	FullSysErrPath       = os.path.abspath(MGdirectory+"/Sec2"+str(i)+"/parton_systematics.log")
	print outputfilefullpath

	MicromegasOutputFullPath = os.path.abspath(MicromegasOutdir+"/Micromegas."+str(j))

        SModelS_dirPath = f_filename + "/SModelS_Results"
        SmodelS_FullFilePath = os.path.abspath(SModelS_dirPath+"/SModelS."+str(j))


    	SLHA = MyPySLHA()
#	if SLHA.CheckLHAexist(outputfilefullpath) == True:
#	if SLHA.CheckLHAexist(outputfilefullpath) and SLHA.MassBounds() == True:
	if (SLHA.CheckLHAexist(outputfilefullpath) and SLHA.CheckLHAexist(MicromegasOutputFullPath) and is_non_zero_file(MicromegasOutputFullPath) == True and SLHA.CheckLHAexist(SmodelS_FullFilePath) and is_non_zero_file(SmodelS_FullFilePath)):
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
		SLHA.QS1charge    = SLHA.allcontent.blocks["EXTPAR"][208]
		SLHA.gpGUT        = SLHA.allcontent.blocks["GAUGEGUT"][5]
		SLHA.gpSUSY       = SLHA.allcontent.blocks["GAUGE"][5]
		SLHA.gLSUSY       = SLHA.allcontent.blocks["GAUGE"][2]
		SLHA.m0           = SLHA.allcontent.blocks["MINPAR"][1]
		SLHA.m12          = SLHA.allcontent.blocks["MINPAR"][2]
		SLHA.tanBeta      = SLHA.allcontent.blocks["MINPAR"][3]
		SLHA.Azero        = SLHA.allcontent.blocks["MINPAR"][5]
		SLHA.AzeroOverm0  = SLHA.Azero/SLHA.m0

                SLHA.LambdaInput  = SLHA.allcontent.blocks["EXTPAR"][61]
                SLHA.KappaInput   = SLHA.allcontent.blocks["EXTPAR"][62]
                SLHA.ALambdaInput = SLHA.allcontent.blocks["EXTPAR"][63]
                SLHA.AKappaInput  = SLHA.allcontent.blocks["EXTPAR"][64]
		SLHA.vSInput      = SLHA.allcontent.blocks["EXTPAR"][65]
		SLHA.v1Input      = SLHA.allcontent.blocks["EXTPAR"][101]
		SLHA.v2Input      = SLHA.allcontent.blocks["EXTPAR"][102]
		SLHA.v3Input      = SLHA.allcontent.blocks["EXTPAR"][103]

		SLHA.DAMU         = SLHA.allcontent.blocks["SPHENOLOWENERGY"][21]
		SLHA.Chi1         = SLHA.allcontent.blocks["MASS"][1000022]           
		SLHA.Chi2	  = SLHA.allcontent.blocks["MASS"][1000023]
		SLHA.Chi3         = SLHA.allcontent.blocks["MASS"][1000025]
		SLHA.Cha1         = SLHA.allcontent.blocks["MASS"][1000024]               
		SLHA.Sv1          = SLHA.allcontent.blocks["MASS"][1000012]
                
                SLHA.Se1          = SLHA.allcontent.blocks["MASS"][1000011]
                SLHA.Se2          = SLHA.allcontent.blocks["MASS"][1000013]
                SLHA.Se3          = SLHA.allcontent.blocks["MASS"][1000015]
                SLHA.Se4          = SLHA.allcontent.blocks["MASS"][2000011]
#                SLHA.Se5          = SLHA.allcontent.blocks["MASS"][2000013]
#                SLHA.Se6          = SLHA.allcontent.blocks["MASS"][2000015]                

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

#                SLHA.OrderingScalarParticles(SLHA.Se1,SLHA.Se2,SLHA.Se3,SLHA.Se4,SLHA.Se5,SLHA.Se6)
#                SLHA.stau1      = SLHA.NonDeg[0]
#                SLHA.stau2      = SLHA.NonDeg[1]
#                SLHA.selectron1 = SLHA.deglight[0]
#                SLHA.selectron2 = SLHA.degheavy[0]                
#                SLHA.smuon1     = SLHA.deglight[1]
#                SLHA.smuon2     = SLHA.degheavy[1]  

		SLHA.ReadMicrOmegasOutput(MicromegasOutputFullPath)
		SLHA.Chi1Content()
                SLHA.Chi2Content()
                SLHA.Chi3Content()

                SLHA.ReadSModelSResults(SmodelS_FullFilePath)

		if SLHA.chi2STU() == True and SLHA.MassBounds() == True and SLHA.CheckWhoIsLSP() == True and SLHA.CheckBPhysics() == True:
#                and SLHA.Cha1Chi1Excl(SLHA.Cha1,SLHA.Chi1) == False
#		 and (SLHA.Zptotalwidth/SLHA.MZp)*100 < 1. and SLHA.chi2 < 5. :       
#		if SLHA.Cha1Chi1Excl(SLHA.Cha1,SLHA.Chi1) == False:
			g= open(datafilepath,"a+")
                	g.write("%.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.0f %.0f" % (SLHA.MZp, SLHA.Zptotalwidth/SLHA.MZp, SLHA.BRZptoll, SLHA.BRZptoqq, SLHA.QQcharge, SLHA.gpGUT, SLHA.gpSUSY, SLHA.DAMU, SLHA.Chi1, SLHA.Chi2, SLHA.Cha1, SLHA.BRCha1toWChi1, SLHA.BRZptoCha1Cha1, SLHA.chi2, SLHA.RelicDensity, SLHA.xsecpptoZp, SLHA.SIproton, SLHA.SIneutron, SLHA.sigmaV, SLHA.Sv1, SLHA.tanBeta, SLHA.m0, SLHA.m12, SLHA.AzeroOverm0, SLHA.LambdaInput, SLHA.KappaInput, SLHA.ALambdaInput, SLHA.AKappaInput, SLHA.vSInput, SLHA.v1Input, SLHA.v2Input, SLHA.v3Input, SLHA.QS1charge, SLHA.NMIX11, SLHA.NMIX12, SLHA.NMIX13, SLHA.NMIX14, SLHA.NMIX15, SLHA.NMIX16, SLHA.NMIX17, SLHA.NMIX18, SLHA.NMIX19, SLHA.Se1, SLHA.Se2, SLHA.Se3, SLHA.Se4, SLHA.Chi3, SLHA.r_value, i, j, SLHA.NMIX21, SLHA.NMIX22, SLHA.NMIX23, SLHA.NMIX24, SLHA.NMIX25, SLHA.NMIX26, SLHA.NMIX27, SLHA.NMIX28, SLHA.NMIX29, SLHA.Chi3, SLHA.NMIX31, SLHA.NMIX32, SLHA.NMIX33, SLHA.NMIX34, SLHA.NMIX35, SLHA.NMIX36, SLHA.NMIX37, SLHA.NMIX38, SLHA.NMIX39))
       	 		g.write('\n')
        		g.close()
##                if SLHA.chi2STU() == True and SLHA.MassBounds() == True and SLHA.CheckWhoIsLSP() == True and SLHA.CheckBPhysics() == True and SLHA.Cha1Chi1Excl(SLHA.Cha1,SLHA.Chi1) == False and SLHA.RelicDensity < 1. and SLHA.RelicDensity > 0.07:
#               if SLHA.Cha1Chi1Excl(SLHA.Cha1,SLHA.Chi1) == False:
##                        h= open(dataRDpath,"a+")
##                        h.write("%.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E" % (SLHA.MZp, SLHA.Zptotalwidth/SLHA.MZp, SLHA.BRZptoll, SLHA.BRZptoqq, SLHA.QQcharge, SLHA.gpGUT, SLHA.gpSUSY, SLHA.DAMU, SLHA.Chi1, SLHA.Chi2, SLHA.Cha1, SLHA.BRCha1toWChi1, SLHA.BRZptoCha1Cha1, SLHA.chi2, SLHA.RelicDensity, SLHA.xsecpptoZp, SLHA.SIproton, SLHA.SIneutron, SLHA.sigmaV, SLHA.Sv1, SLHA.tanBeta, SLHA.m0, SLHA.m12, SLHA.AzeroOverm0, SLHA.LambdaInput, SLHA.KappaInput, SLHA.ALambdaInput, SLHA.AKappaInput, SLHA.vSInput, SLHA.v1Input, SLHA.v2Input, SLHA.v3Input, SLHA.QS1charge, SLHA.NMIX11, SLHA.NMIX12, SLHA.NMIX13, SLHA.NMIX14, SLHA.NMIX15, SLHA.NMIX16, SLHA.NMIX17, SLHA.NMIX18, SLHA.NMIX19))
##                        h.write('\n')
##                        h.close()
#		else:
#                        f= open(ExcludedDataPath,"a+")
#                        f.write("%.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E %.6E" % (SLHA.MZp, SLHA.Zptotalwidth/SLHA.MZp, SLHA.BRZptoll, SLHA.BRZptoqq, SLHA.QQcharge, SLHA.gpGUT, SLHA.gpSUSY, SLHA.DAMU, SLHA.Chi1, SLHA.Chi2, SLHA.Cha1, SLHA.BRCha1toWChi1, SLHA.BRZptoCha1Cha1, SLHA.chi2, SLHA.RelicDensity, SLHA.xsecpptoZp, SLHA.SIproton, SLHA.SIneutron, SLHA.sigmaV, SLHA.Sv1, SLHA.tanBeta, SLHA.m0, SLHA.m12, SLHA.AzeroOverm0, SLHA.LambdaInput, SLHA.KappaInput, SLHA.ALambdaInput, SLHA.AKappaInput, SLHA.vSInput, SLHA.v1Input, SLHA.v2Input, SLHA.v3Input,SLHA.QS1charge))
#                        f.write('\n')
#                        f.close()			
#		else:
#			continue            

