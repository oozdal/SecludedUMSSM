######## Packages ###########
from math import *
import fnmatch
import numpy as np
import os
import sys
sys.path.append("/home/oo1m20/softwares/pyslha-3.2.3/")
import pyslha
import pandas as pd
import signal
import time
#from scipy.stats import beta
#from scipy.stats import lognorm
#import xslha

# generate random integer values
from random import seed
from random import randint
from random import choice
from random import uniform
# seed random number generator
seed(randint(1,1000000))

from MyPySLHA import *

######## Current LesHouches File Paths ###############
LHAFileFullPath    = os.path.abspath("LesHouches.in.sec_UMSSM")
LHAFiledirPath     = os.path.dirname(LHAFileFullPath)
LHAFileName        = os.path.basename(LHAFileFullPath)
newLHAFileFullPath = os.path.abspath("LesHouches.in.sec_UMSSM_new")
newLHAFileName     = os.path.basename(newLHAFileFullPath)
######## SLHA File Paths ################################
SLHAFileFullPath   = os.path.abspath("SPheno.spc.sec_UMSSM")
SLHAFiledirPath    = os.path.dirname(SLHAFileFullPath)
SLHAFileName       = os.path.basename(SLHAFileFullPath)
destPathforNewSLHA = os.path.dirname("SPhenoOutputs/SPheno.spc.sec_UMSSM.*")
######## Desired MicrOMEGAs Output File Paths ##########
PathforMicrOMEGAsResult = os.path.abspath("Block_micrOMEGAs.out")
PathforChannelsOutput = os.path.abspath("Channels.out")
PathforDecaysOutput = os.path.abspath("DECAYS.out")
########################################################

#d = pd.read_csv('/scratch/oo4g19/projects/Secluded_UMSSM/data/RD_test.txt', header=None,sep=" ")
#d.columns =["MZp", "widthmassratio","BRZptoll","BRZptoqq","QQcharge","gpGUT","gpSUSY","DAMU","Chi1","Chi2","Cha1", "BRCha1toWChi1", "BRZptoCha1Cha1","chi2","RelicDensity","xsecpptoZp","SIproton", "SIneutron", "sigmaV", "Sv1", "tanBeta", "m0", "m12", "AzeroOverm0", "LambdaInput", "KappaInput", "ALambdaInput", "AKappaInput", "vSInput", "v1Input", "v2Input", "v3Input","QS1charge", "NMIX11","NMIX12","NMIX13","NMIX14","NMIX15","NMIX16","NMIX17","NMIX18","NMIX19"]

d = pd.read_csv('/scratch/oo1m20/projects/Secluded_UMSSM/data/July4.txt', header=None,sep=" ")
#d.columns =["MZp", "widthmassratio","BRZptoll","BRZptoqq","QQcharge","gpGUT","gpSUSY","DAMU","Chi1","Chi2","Cha1", "BRCha1toWChi1", "BRZptoCha1Cha1","chi2","RelicDensity","xsecpptoZp","SIproton", "SIneutron", "sigmaV", "Sv1", "tanBeta", "m0", "m12", "AzeroOverm0", "LambdaInput", "KappaInput", "ALambdaInput", "AKappaInput", "vSInput", "v1Input", "v2Input", "v3Input","QS1charge","NMIX11","NMIX12","NMIX13","NMIX14","NMIX15","NMIX16","NMIX17","NMIX18","NMIX19","Se1","Se2","Se3","Se4", "Chi3","r_value"]

d.columns =["MZp", "widthmassratio","BRZptoll","BRZptoqq","QQcharge","gpGUT","gpSUSY","DAMU","Chi1","Chi2","Cha1", "BRCha1toWChi1", "BRZptoCha1Cha1","chi2","RelicDensity","xsecpptoZp","SIproton", "SIneutron", "sigmaV", "Sv1", "tanBeta", "m0", "m12", "AzeroOverm0", "LambdaInput", "KappaInput", "ALambdaInput", "AKappaInput", "vSInput", "v1Input", "v2Input", "v3Input","QS1charge","NMIX11","NMIX12","NMIX13","NMIX14","NMIX15","NMIX16","NMIX17","NMIX18","NMIX19","Se1","Se2","Se3","Se4", "Chi3","r_value","SecNo","Index","NMIX21","NMIX22","NMIX23","NMIX24","NMIX25","NMIX26","NMIX27","NMIX28","NMIX29", "Chi3_","NMIX31","NMIX32","NMIX33","NMIX34","NMIX35","NMIX36","NMIX37","NMIX38","NMIX39","Yv11"]


SmodelS = d[:][(d["Chi1"] > 0) & (d["Chi1"] < 300) & (d["Cha1"] > 200) & (d["Cha1"] < 800) & (d["r_value"] < 3.0)]

d_Cha1Chi1 = d[:][(d["Cha1"] <= 800) & (d["Chi1"] <= 300)]
d_RD = d[:][(d['RelicDensity'] <= 100)]

## Consistent with r-value
rval = d[:][(d['r_value'] < 1.)]
RD = rval[:][(rval['RelicDensity']>= 0.09130) & (rval['RelicDensity']<0.1398)]     # Consistent with Main + RD constraints
#RD_highsig = RD[:][(RD['MZp']<= 3500) & (RD['BRCha1toWChi1'] > 0.8)]
#RD_highsig = RD[:][(RD["xsecpptoZp"]*RD["BRZptoCha1Cha1"]*RD["BRCha1toWChi1"] == 0.0075465824476689996)]
#DAMU_2sig_lowZp = rval[:][(rval['DAMU']*10**10 >= 12.7) & (rval['DAMU']*10**10 < 44.7) & (rval['MZp'] < 3500) & (rval['BRCha1toWChi1'] > 0.9)]

DAMU2sig_RD_lowZp = rval[:][(rval['RelicDensity']>= 0.09130) & (rval['RelicDensity'] < 0.1398) & (rval['DAMU']*10**10 >= 12.7) & (rval['DAMU']*10**10 <= 44.7) & (rval['MZp'] < 3750)] 


fileno = len(fnmatch.filter(os.listdir(destPathforNewSLHA), 'SPheno.spc.sec_UMSSM.*'))
MaxNumberOfSolution = 5000

MCMC = d_RD

while fileno < MaxNumberOfSolution:
    LHA = MyPySLHA()

    LHA.LHAFileFullPath         = LHAFileFullPath
    LHA.LHAFiledirPath          = LHAFiledirPath
    LHA.LHAFileName             = LHAFileName
    LHA.newLHAFileFullPath      = newLHAFileFullPath
    LHA.newLHAFileName          = newLHAFileName
    LHA.SLHAFileFullPath        = SLHAFileFullPath
    LHA.SLHAFiledirPath         = SLHAFiledirPath
    LHA.SLHAFileName            = SLHAFileName
    LHA.destPathforNewSLHA      = destPathforNewSLHA
    LHA.PathforMicrOMEGAsResult = PathforMicrOMEGAsResult
    LHA.PathforChannelsOutput   = PathforChannelsOutput
    LHA.PathforDecaysOutput     = PathforDecaysOutput


    if LHA.CheckLHAexist(LHA.LHAFileName) == True:
        with open(LHA.LHAFileName, 'r') as file:
            LHA.filedata = file.read()
             
            upperlim = 1.2
	    lowerlim = 0.8

	    RandomNumber =  choice(MCMC.index)
            m0input      = '%.7E' % np.random.uniform(MCMC["m0"][RandomNumber]*lowerlim,MCMC["m0"][RandomNumber]*upperlim)
            LHA.filedata = LHA.filedata.replace("m0input",m0input)
            LHA.filedata = LHA.filedata.replace("m12input",'%.7E' % np.random.uniform(MCMC["m12"][RandomNumber]*lowerlim,MCMC["m12"][RandomNumber]*upperlim))
            LHA.filedata = LHA.filedata.replace("tanbetainput",'%.7E' % np.random.uniform(MCMC["tanBeta"][RandomNumber]*lowerlim,MCMC["tanBeta"][RandomNumber]*upperlim))
            LHA.filedata = LHA.filedata.replace("azeroinput",'%.7E' % np.random.uniform(MCMC["AzeroOverm0"][RandomNumber]*lowerlim,MCMC["AzeroOverm0"][RandomNumber]*upperlim))
	    LHA.filedata = LHA.filedata.replace("lambdainput",'%.7E' % np.random.uniform(MCMC["LambdaInput"][RandomNumber]*lowerlim,MCMC["LambdaInput"][RandomNumber]*upperlim))
	    LHA.filedata = LHA.filedata.replace("kappainput",'%.7E' % np.random.uniform(MCMC["KappaInput"][RandomNumber]*lowerlim,MCMC["KappaInput"][RandomNumber]*upperlim)) 
	    LHA.filedata = LHA.filedata.replace("lambdaInverseInput",'%.7E' % np.random.uniform(MCMC["ALambdaInput"][RandomNumber]*lowerlim,MCMC["ALambdaInput"][RandomNumber]*upperlim))
	    LHA.filedata = LHA.filedata.replace("kappaInverseInput",'%.7E' % np.random.uniform(MCMC["AKappaInput"][RandomNumber]*lowerlim,MCMC["AKappaInput"][RandomNumber]*upperlim))	
	    LHA.filedata = LHA.filedata.replace("vSinput",'%.7E' % np.random.uniform(MCMC["vSInput"][RandomNumber]*lowerlim,MCMC["vSInput"][RandomNumber]*upperlim))
            LHA.filedata = LHA.filedata.replace("v1input",'%.7E' % np.random.uniform(MCMC["v1Input"][RandomNumber]*lowerlim,MCMC["v1Input"][RandomNumber]*upperlim))
            LHA.filedata = LHA.filedata.replace("v2input",'%.7E' % np.random.uniform(MCMC["v2Input"][RandomNumber]*lowerlim,MCMC["v2Input"][RandomNumber]*upperlim))
            LHA.filedata = LHA.filedata.replace("v3input",'%.7E' % np.random.uniform(MCMC["v3Input"][RandomNumber]*lowerlim,MCMC["v3Input"][RandomNumber]*upperlim))
            alphaInput = np.random.uniform(np.random.uniform(MCMC["QQcharge"][RandomNumber]*lowerlim,MCMC["QQcharge"][RandomNumber]*upperlim))
            deltaInput = np.random.uniform(np.random.uniform(MCMC["QS1charge"][RandomNumber]*lowerlim,MCMC["QS1charge"][RandomNumber]*upperlim))

################################################################################
##            m0input      = '%.7E' % np.random.uniform(0.,5000.)
##            LHA.filedata = LHA.filedata.replace("m0input",m0input)
##            LHA.filedata = LHA.filedata.replace("m12input",'%.7E' % np.random.uniform(750., 5000.))
##            LHA.filedata = LHA.filedata.replace("tanbetainput",'%.7E' % np.random.uniform(2.7, 52.))
##            LHA.filedata = LHA.filedata.replace("azeroinput",'%.7E' % np.random.uniform(-3.*float(m0input),3.*float(m0input)))

##            LHA.filedata = LHA.filedata.replace("lambdainput",'%.7E' % np.random.uniform(0.04005367, 0.5352015))
##            LHA.filedata = LHA.filedata.replace("kappainput",'%.7E' % np.random.uniform(0.5004799, 2.606122))
##            LHA.filedata = LHA.filedata.replace("lambdaInverseInput",'%.7E' % np.random.uniform(2.8000000E+03, 5.5000000E+03))
##            LHA.filedata = LHA.filedata.replace("kappaInverseInput",'%.7E' % np.random.uniform(-6.0000000E+03, -327.2744))
##            LHA.filedata = LHA.filedata.replace("vSinput",'%.7E' % np.random.uniform(1.0000000E+03, 1.0000000E+04))
##            vS13input   = '%.7E' % np.random.uniform(2339.,10000.)
##            LHA.filedata = LHA.filedata.replace("v1input", vS13input)
##            LHA.filedata = LHA.filedata.replace("v2input", '%.7E' % np.random.uniform(1113.,9740.))
##            LHA.filedata = LHA.filedata.replace("v3input", vS13input)

##	      alphaInput = np.random.uniform(0.01, 0.125)
##            deltaInput = np.random.uniform(0.2, 0.5)
#################################################################################
            LHA.U1ChargeGenerator(alphaInput,deltaInput)
            LHA.filedata = LHA.filedata.replace("QqInput",'%.5E' % LHA.QQ_charge)
            LHA.filedata = LHA.filedata.replace("QuInput",'%.5E' % LHA.Qu_charge)
            LHA.filedata = LHA.filedata.replace("QdInput",'%.5E' % LHA.Qd_charge)
            LHA.filedata = LHA.filedata.replace("QlInput",'%.5E' % LHA.Ql_charge)
            LHA.filedata = LHA.filedata.replace("QvInput",'%.5E' % LHA.Qv_charge)
            LHA.filedata = LHA.filedata.replace("QeInput",'%.5E' % LHA.Qe_charge)
            LHA.filedata = LHA.filedata.replace("QHuInput",'%.5E' % LHA.QHu_charge)
            LHA.filedata = LHA.filedata.replace("QHdInput",'%.5E' % LHA.QHd_charge)
            LHA.filedata = LHA.filedata.replace("QsInput",'%.5E' % LHA.Qs_charge)
            LHA.filedata = LHA.filedata.replace("Qs1Input",'%.5E' % LHA.Qs1_charge)
            LHA.filedata = LHA.filedata.replace("Qs2Input",'%.5E' % LHA.Qs2_charge)
            LHA.filedata = LHA.filedata.replace("Qs3Input",'%.5E' % LHA.Qs3_charge)

#            Yv_Input     = '%.7E' % np.random.uniform(1.0000000E-08,1.0000000E-07)
            Yv_Input     = '%.7E' % np.random.uniform(MCMC["Yv11"][RandomNumber]*lowerlim,MCMC["Yv11"][RandomNumber]*upperlim)
            LHA.filedata = LHA.filedata.replace("YvInput",Yv_Input)
            
        with open(LHA.newLHAFileFullPath, 'w') as newfile:
            newfile.write(LHA.filedata)

#################################################################################################
        LHA.RunSPheno(LHA.newLHAFileName)
############# Load SPheno Output into PySLHA #####################################################
        if LHA.CheckLHAexist(LHA.SLHAFileName) == True:
	    LHA.Erase(LHA.newLHAFileName)
            LHA.LoadLHAFile(LHA.SLHAFileName)
#	    if    LHA.Read_Decays(1000024,[1000022,24]) == None: LHA.BRCha1toWChi1 = 0
#           else: LHA.BRCha1toWChi1                      = LHA.Read_Decays(1000024,[1000022,24])
##          if    LHA.Read_Decays(31,[-1,1]) == None: LHA.Zpq1q1 = 0
##          else: LHA.Zpq1q1                  =  LHA.Read_Decays(31,[-1,1])
##     	    LHA.MZp          = LHA.ParticleMass
##          LHA.Zptotalwidth = LHA.totalwidth
##	    LHA.chi2STU()
############# Check Constraints  ################################################################
            if (LHA.MassBounds() and LHA.CheckWhoIsLSP() and LHA.CheckBPhysics() and LHA.chi2STU() == True): 
##		LHA.chi2 < 5. and (LHA.Zptotalwidth/LHA.MZp)*100 < 1.:
                fileno = len(fnmatch.filter(os.listdir(LHA.destPathforNewSLHA), "SPheno.spc.sec_UMSSM.*"))
                newfileno = fileno + 1
                LHA.NewSLHAFileName = "SPheno.spc.sec_UMSSM."+str(newfileno)
                LHA.NewSLHAFileFullPath = "SPhenoOutputs/" + LHA.NewSLHAFileName
		LHA.RenameAndCopy(LHA.SLHAFileName,LHA.NewSLHAFileFullPath)
		LHA.Erase(LHA.SLHAFileName)		        
	    else:
		LHA.Erase(LHA.SLHAFileName)
	else:
            LHA.Erase(LHA.newLHAFileName)

################# MicrOMEGAs Part ###############################################################
#                MicrOMEGAs = MyMicrOMEGAs()
#                MicrOMEGAs.RunMicrOMEGAs(SPheno.SLHAFileName)

#                fileno = len(fnmatch.filter(os.listdir(SPheno.destPathforNewSLHA), "SPheno.spc.sUMSSM_freeg1gp.*"))
#                newfileno = fileno + 1
#                SPheno.NewSLHAFileName = "SPheno.spc.sUMSSM_freeg1gp."+str(newfileno)
#                SPheno.NewSLHAFileFullPath = "SPhenoOutputs/" + SPheno.NewSLHAFileName 

##                MicrOMEGA_Result_exist = os.path.isfile(PathforMicrOMEGAsResult)
#                Channels_exist = os.path.isfile(PathforChannelsOutput) 
#                Decays_exist = os.path.isfile(PathforDecaysOutput)

#                MicrOMEGAs.ChannelsNewFileName = os.path.basename("Channels."+str(newfileno))
#                MicrOMEGAs.FullDestForChannels = "SPhenoOutputs/" + MicrOMEGAs.ChannelsNewFileName

##                MicrOMEGAs.DecaysNewFileName = os.path.basename("DECAYS."+str(newfileno))
#                MicrOMEGAs.FullDestForDecays = "SPhenoOutputs/"+ MicrOMEGAs.DecaysNewFileName

#                if (MicrOMEGA_Result_exist and Channels_exist) == True:
#                    MicrOMEGAs.LHAwithDM(SPheno.SLHAFileName, PathforMicrOMEGAsResult, SPheno.NewSLHAFileFullPath)
#                    MicrOMEGAs.RenameAndCopy(PathforChannelsOutput, MicrOMEGAs.FullDestForChannels)
##                    MicrOMEGAs.RenameAndCopy(PathforDecaysOutput, MicrOMEGAs.FullDestForDecays)
#                    MicrOMEGAs.Erase(PathforMicrOMEGAsResult)
#                    MicrOMEGAs.Erase(PathforChannelsOutput)
##                    MicrOMEGAs.Erase(PathforDecaysOutput)
#                    SPheno.Erase(SPheno.SLHAFileName)
#                else:
#                    SPheno.Erase(SPheno.SLHAFileName)
#            else:
#                SPheno.Erase(SPheno.SLHAFileName)







#        LHA.LoadLHAFile(LHAFileFullPath)            # Load all content to xSLHA

#################  Read LesHouches Accord File  #######################################
#################  Assign Random Values to  LesHouches Accord File  ###################
########## Reading MODSEL ###############################
#        LHA.allcontent.blocks["MODSEL"][1] = 1
#        LHA.allcontent.blocks["MODSEL"][2] = 1
#        LHA.allcontent.blocks["MODSEL"][6] = 1
########## Reading SMINPUTS #############################
#        LHA.allcontent.blocks["SMINPUTS"][2] = '%.6E' % 1.166370E-05    # G_F,Fermi constant
#        LHA.allcontent.blocks["SMINPUTS"][3] = '%.6E' % 1.187000E-01    # alpha_s(MZ) SM MSbar
#        LHA.allcontent.blocks["SMINPUTS"][4] = '%.6E' % 9.118870E+01    # Z-boson pole mass
#        LHA.allcontent.blocks["SMINPUTS"][5] = '%.6E' % 4.180000E+00    # m_b(mb) SM MSbar
#        LHA.allcontent.blocks["SMINPUTS"][6] = '%.6E' % 1.735000E+02    # m_top(pole)
#        LHA.allcontent.blocks["SMINPUTS"][7] = '%.6E' % 1.776690E+00    # m_tau(pole)        
########## Reading MINPAR ################################
#        LHA.allcontent.blocks["MINPAR"][1] = '%.7E' % np.random.uniform(0., 3000.)    # m0
#        LHA.allcontent.blocks["MINPAR"][2] = '%.7E' % np.random.uniform(0., 3000.)    # mhf     
#        LHA.allcontent.blocks["MINPAR"][3] = '%.7E' % np.random.uniform(1.2, 60.)      # TanBeta
#        LHA.allcontent.blocks["MINPAR"][5] = '%.7E' % np.random.uniform(-3.*float(LHA.allcontent.blocks["MINPAR"][1]), 3.*float(LHA.allcontent.blocks["MINPAR"][1]))    # A0
#        LHA.allcontent.blocks["MINPAR"][6] = '%.7E' % 0.00000000E+00
#        LHA.allcontent.blocks["MINPAR"][7] = '%.7E' % 0.00000000E+00
######### Reading EXTPAR ################################
#        LHA.allcontent.blocks["EXTPAR"][61]  = '%.7E' % np.random.uniform(1.0000000E-02, 9.0000000E-02)    # LambdaInput
#        LHA.allcontent.blocks["EXTPAR"][62]  = '%.7E' % np.random.uniform(1.0000000E-01, 9.0000000E-01)    # KappaInput
#        LHA.allcontent.blocks["EXTPAR"][63]  = '%.7E' % np.random.uniform(2.0000000E+03, 3.0000000E+03)    # ALambdaInput
#        LHA.allcontent.blocks["EXTPAR"][64]  = '%.7E' % np.random.uniform(1.0000000E+03, 2.0000000E+03)   # AKappaInput
#        LHA.allcontent.blocks["EXTPAR"][65]  = '%.7E' % np.random.uniform(3.0000000E+03, 7.0000000E+03)   # vSInput
#        LHA.allcontent.blocks["EXTPAR"][101] = '%.7E' % np.random.uniform(5.0000000E+02, 2.0000000E+03)   # v1Input
#        LHA.allcontent.blocks["EXTPAR"][102] = '%.7E' % np.random.uniform(5.0000000E+02, 2.0000000E+03)   # v2Input
#        LHA.allcontent.blocks["EXTPAR"][103] = '%.7E' % np.random.uniform(5.0000000E+02, 2.0000000E+03)   # v3Input    
########## U(1) Prime Charges ############################ 
#        LHA.x_value                          = 1./27
#        LHA.y_value                          = np.random.uniform(-0.5,0.5)
#        LHA.z_value                          = 1./3
#        LHA.d_value                          = -0.5
#        LHA.U1ChargeGenerator(LHA.x_value,LHA.y_value,LHA.z_value,LHA.d_value)
#        LHA.allcontent.blocks["EXTPAR"][200] = '%.7E' % LHA.QQ_charge
#        LHA.allcontent.blocks["EXTPAR"][201] = '%.7E' % LHA.Ql_charge
#        LHA.allcontent.blocks["EXTPAR"][202] = '%.7E' % LHA.QHd_charge
#        LHA.allcontent.blocks["EXTPAR"][203] = '%.7E' % LHA.QHu_charge
#        LHA.allcontent.blocks["EXTPAR"][204] = '%.7E' % LHA.Qd_charge
#        LHA.allcontent.blocks["EXTPAR"][205] = '%.7E' % LHA.Qu_charge
#        LHA.allcontent.blocks["EXTPAR"][206] = '%.7E' % LHA.Qe_charge
#        LHA.allcontent.blocks["EXTPAR"][207] = '%.7E' % LHA.Qs_charge
#        LHA.allcontent.blocks["EXTPAR"][208] = '%.7E' % LHA.Qs1_charge
#        LHA.allcontent.blocks["EXTPAR"][209] = '%.7E' % LHA.Qs2_charge
#        LHA.allcontent.blocks["EXTPAR"][210] = '%.7E' % LHA.Qs3_charge
#        LHA.allcontent.blocks["EXTPAR"][211] = '%.7E' % LHA.Qv_charge
########################################################
#        LHA.allcontent.blocks["YVIN"][1,1] = '%.7E' % np.random.uniform(1.000000E-08, 1.000000E-007)    # Yv(1,1)
#        LHA.allcontent.blocks["YVIN"][1,2] = '%.7E' % 0.000000E+00    # Yv(1,2)
#        LHA.allcontent.blocks["YVIN"][1,3] = '%.7E' % 0.000000E+00    # Yv(1,3)
#        LHA.allcontent.blocks["YVIN"][2,1] = '%.7E' % 0.000000E+00    # Yv(2,1)
#        LHA.allcontent.blocks["YVIN"][2,2] = LHA.allcontent.blocks["YVIN"][1,1]   # Yv(2,2)
#        LHA.allcontent.blocks["YVIN"][2,3] = '%.7E' % 0.000000E+00    # Yv(2,3)
#        LHA.allcontent.blocks["YVIN"][3,1] = '%.7E' % 0.000000E+00    # Yv(3,1)
#        LHA.allcontent.blocks["YVIN"][3,2] = '%.7E' % 0.000000E+00    # Yv(3,2)
#        LHA.allcontent.blocks["YVIN"][3,3] = LHA.allcontent.blocks["YVIN"][1,1]    # Yv(3,3)
######### SPhenoInput Settings #########################
#        LHA.allcontent.blocks["SPHENOINPUT"][2]  = -1
#        LHA.allcontent.blocks["SPHENOINPUT"][2]  =  0
#        LHA.allcontent.blocks["SPHENOINPUT"][7]  =  0
#        LHA.allcontent.blocks["SPHENOINPUT"][8]  =  3
#        LHA.allcontent.blocks["SPHENOINPUT"][9]  =  1
#        LHA.allcontent.blocks["SPHENOINPUT"][10] =  0
#        LHA.allcontent.blocks["SPHENOINPUT"][11] =  1
#        LHA.allcontent.blocks["SPHENOINPUT"][13] =  1
#        LHA.allcontent.blocks["SPHENOINPUT"][14] =  0
#        LHA.allcontent.blocks["SPHENOINPUT"][12]  = '%.3E' % 1.000E-04 # write only branching ratios larger than this value
#        LHA.allcontent.blocks["SPHENOINPUT"][15]  = '%.3E' % 1.000E-30 # write only decay if width larger than this value
#        LHA.allcontent.blocks["SPHENOINPUT"][31]  = -1
#        LHA.allcontent.blocks["SPHENOINPUT"][32]  = 0
#        LHA.allcontent.blocks["SPHENOINPUT"][34]  = '%.3E' % 1.000E-04 # Precision of mass calculation
#        LHA.allcontent.blocks["SPHENOINPUT"][35]  = 40
#        LHA.allcontent.blocks["SPHENOINPUT"][36]  = 5
#        LHA.allcontent.blocks["SPHENOINPUT"][37]  = 1
#        LHA.allcontent.blocks["SPHENOINPUT"][38]  = 2
#        LHA.allcontent.blocks["SPHENOINPUT"][50]  = 0 # Majorana phases: use only positive masses (put 0 to use file with CalcHep/Micromegas!)
#        LHA.allcontent.blocks["SPHENOINPUT"][51]  = 0
#        LHA.allcontent.blocks["SPHENOINPUT"][52]  = 0
#        LHA.allcontent.blocks["SPHENOINPUT"][55]  = 1
#        LHA.allcontent.blocks["SPHENOINPUT"][57]  = 1
#        LHA.allcontent.blocks["SPHENOINPUT"][60]  = 1
#        LHA.allcontent.blocks["SPHENOINPUT"][65]  = 1
#        LHA.allcontent.blocks["SPHENOINPUT"][75]  = 1
#        LHA.allcontent.blocks["SPHENOINPUT"][76]  = 1 # Write HiggsBounds file
#        LHA.allcontent.blocks["SPHENOINPUT"][86]  = 0.
#        LHA.allcontent.blocks["SPHENOINPUT"][510] = 0.
#        LHA.allcontent.blocks["SPHENOINPUT"][515] = 1 # Write parameter values at GUT scale
#        LHA.allcontent.blocks["SPHENOINPUT"][520] = 1. # Write effective Higgs couplings (HiggsBounds blocks): put 0 to use file with MadGraph!
#        LHA.allcontent.blocks["SPHENOINPUT"][525] = 0.
#        LHA.allcontent.blocks["SPHENOINPUT"][530]  = 1.
###########################################################################################
############## Write New LesHouches File #########################################################
#        LHA.LHAFileFullPath = os.path.abspath("LesHouches.in.sUMSSM_freeg1gp")
#        LHA.LHAFiledirPath = os.path.dirname(LHA.LHAFileFullPath)
#        LHA.LHAFileName = os.path.basename(LHA.LHAFileFullPath)
#        LHA.WriteNewSLHAFile(LHA.LHAFileName,LHA.allcontent,6)
############## Run SPheno ########################################################################

"""
        SPheno = MySPheno()
        SPheno.RunSPheno(LHA.LHAFileName)
############# Load SPheno Output into PySLHA #####################################################
        if SPheno.CheckSLHAexist(SLHAFileName) == True:
            SPheno.LoadSLHAFile(SLHAFileName)
############# Check Constraints  #######################################################################
            if SPheno.MassBounds() == True:
                fileno = len(fnmatch.filter(os.listdir(destPathforNewSLHA), "SPheno.spc.sUMSSM_freeg1gp.*"))
                newfileno = fileno + 1
                SPheno.NewSLHAFileName = "SPheno.spc.sUMSSM_freeg1gp."+str(newfileno)
                SPheno.NewSLHAFileFullPath = "SPhenoOutputs/" + SPheno.NewSLHAFileName
                SPheno.RenameAndCopy(os.path.abspath("SPheno.spc.sUMSSM_freeg1gp"),SPheno.NewSLHAFileFullPath)
                SPheno.Erase(SLHAFileName)
            else:
                SPheno.Erase(SLHAFileName)


"""
################# MicrOMEGAs Part ############################################################
"""
            MicrOMEGAs = MyMicrOMEGAs()
            MicrOMEGAs.RenameAndCopy(currentLHA.NewLHAFileFullPath, Pathforvars1lha)

            MicrOMEGAs.RunMicrOMEGAs(Pathforvars1lha)

            MicrOMEGAs.LHAFileWithDM = os.path.basename("DM_ALRM."+str(newfileno))
            MicrOMEGAs.FullDestForLHAFileWithDM = dirPathLHAFileWithDM+"/"+MicrOMEGAs.LHAFileWithDM
            MicrOMEGA_Result_exist = os.path.isfile(PathforMicrOMEGAsResult)

            MicrOMEGAs.ChannelsNewFileName = os.path.basename("Channels."+str(newfileno))
            MicrOMEGAs.FullDestForChannels = dirPathLHAFileWithDM+"/"+MicrOMEGAs.ChannelsNewFileName
            Channels_exist = os.path.isfile(PathforChannelsOutput)

            MicrOMEGAs.DecaysNewFileName = os.path.basename("DECAYS."+str(newfileno))
            MicrOMEGAs.FullDestForDecays = dirPathLHAFileWithDM+"/"+MicrOMEGAs.DecaysNewFileName
            Decays_exist = os.path.isfile(PathforDecaysOutput)

            if (MicrOMEGA_Result_exist and Channels_exist and Decays_exist) == True:
                MicrOMEGAs.LHAwithDM(currentLHA.NewLHAFileFullPath, PathforMicrOMEGAsResult, MicrOMEGAs.FullDestForLHAFileWithDM)
                MicrOMEGAs.RenameAndCopy(PathforChannelsOutput, MicrOMEGAs.FullDestForChannels)
                MicrOMEGAs.RenameAndCopy(PathforDecaysOutput, MicrOMEGAs.FullDestForDecays)
                currentLHA.Erase(PathforMicrOMEGAsResult)
                currentLHA.Erase(PathforChannelsOutput)
                currentLHA.Erase(PathforDecaysOutput)
            else:
                currentLHA.Erase(currentLHA.NewLHAFileFullPath)
        
################# Reading MicrOMEGAs Output ###################################

            exist_FullDestForLHAFileWithDM = os.path.isfile(MicrOMEGAs.FullDestForLHAFileWithDM)
            exist_ChannelsNewFileName      = os.path.isfile(MicrOMEGAs.FullDestForChannels)
            exist_DecaysNewFileName        = os.path.isfile(MicrOMEGAs.FullDestForDecays)

            if (exist_FullDestForLHAFileWithDM and exist_ChannelsNewFileName and exist_DecaysNewFileName) == True:
                currentLHA.RunHiggsBounds(MicrOMEGAs.FullDestForLHAFileWithDM)
                currentLHA.RunHiggsSignals(MicrOMEGAs.FullDestForLHAFileWithDM)
                currentLHA.LoadLHAFile(MicrOMEGAs.FullDestForLHAFileWithDM)
                if currentLHA.CheckMicrOMEGABlock() == True:
                    currentLHA.Parameters()
                    currentLHA.NormalizeDMResults()
                    currentLHA.MassesFromMicrOMEGAs()
                    currentLHA.ReadChannels(MicrOMEGAs.FullDestForChannels)
                    currentLHA.CheckHiggsFunnel()                
                    list_RD_diff.append(currentLHA.RD_difference)
                    currentLHA.ReadDecayFile(MicrOMEGAs.FullDestForDecays,2)

                    if (currentLHA.MassConstraints() and currentLHA.Check_RD_diff(list_RD_diff) and currentLHA.RelicDensity_Constraint() and currentLHA.CheckZpMassLimit() and currentLHA.CheckHiggsBounds()) == False:
                        currentLHA.Erase(currentLHA.NewLHAFileFullPath)                        
                        currentLHA.Erase(MicrOMEGAs.FullDestForLHAFileWithDM)
                        currentLHA.Erase(MicrOMEGAs.FullDestForChannels)
                        currentLHA.Erase(MicrOMEGAs.FullDestForDecays)

                            if (ALRM_focus.Check_MassBounds() and ALRM_focus.Check_Minimization() and ALRM_focus.Check_ZpMassLimit())== True:

                                fileno = len(fnmatch.filter(os.listdir(PathForLHAfiles), 'ALRM.*'))
                                newfileno = fileno + 1
                                currentLHA.NewLHAFileName = "ALRM."+str(newfileno)
                                currentLHA.NewLHAFileFullPath = LHAFiledirPath + "/LHAfiles/" + currentLHA.NewLHAFileName
                                currentLHA.WriteNewLHAFile(currentLHA.NewLHAFileFullPath, currentLHA.allcontent, 10)


"""                                
