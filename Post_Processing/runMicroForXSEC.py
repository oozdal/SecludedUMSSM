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
import subprocess

from MyPySLHA import *

########################################################

numberofoutput = len(fnmatch.filter(os.listdir("SPhenoOutputs"), 'SPheno.spc.sec_UMSSM.*'))

for j in range(1,numberofoutput):
	outputfilefullpath          = "SPhenoOutputs/SPheno.spc.sec_UMSSM."+str(j)
	fileformicromegas           = "MicromegasOutputs/SPheno.spc.sec_UMSSM" 	
	outputfilefullpath_Exist    = os.path.isfile(outputfilefullpath)

	MicromegasNewFileName       = "MicroXSEC."+str(j)
	FullDestForMicromegas       = "MicromegasOutputs/"+MicromegasNewFileName
	FullDestForMicromegas_Exist = os.path.isfile(FullDestForMicromegas)

        ChannelsNewFileName         = "Channels."+str(j)
       	FullDestForChannels         = "MicromegasOutputs/"+ChannelsNewFileName
        FullDestForChannels_Exist   = os.path.isfile(FullDestForChannels)

	if outputfilefullpath_Exist == True and FullDestForMicromegas_Exist == False:
		LHA = MyPySLHA()

		LHA.RenameAndCopy(outputfilefullpath,fileformicromegas)

		os.chdir("MicromegasOutputs")
		os.system("pwd")
		p = subprocess.call("timeout 300s ./myOmega SPheno.spc.sec_UMSSM",shell=True)
        	#os.system("./myOmega SPheno.spc.sec_UMSSM")
		os.chdir("../")

		PathforMicrOMEGAsResult = "MicromegasOutputs/Block_micrOMEGAs.out"
		PathforChannelsOutput   = "MicromegasOutputs/Channels.out"
		PathforDecaysOutput     = "MicromegasOutputs/DECAYS.out"

        	LHA.PathforMicrOMEGAsResult = PathforMicrOMEGAsResult
        	LHA.PathforChannelsOutput   = PathforChannelsOutput
        	LHA.PathforDecaysOutput     = PathforDecaysOutput

        	LHA.MicrOMEGA_Result_exist  = os.path.isfile(LHA.PathforMicrOMEGAsResult)
        	LHA.Channels_exist          = os.path.isfile(LHA.PathforChannelsOutput)	

                LHA.MicromegasNewFileName = "MicroXSEC."+str(j)
                LHA.FullDestForMicromegas = "MicromegasOutputs/"+LHA.MicromegasNewFileName
		LHA.FullDestForMicromegas_Exist = os.path.isfile(LHA.FullDestForMicromegas)

                LHA.ChannelsNewFileName = "Channels."+str(j)
                LHA.FullDestForChannels = "MicromegasOutputs/"+LHA.ChannelsNewFileName
		LHA.FullDestForChannels_Exist = os.path.isfile(LHA.FullDestForChannels)

		if (LHA.FullDestForMicromegas_Exist) == False: LHA.MicroDestFile_Check = True

        	if (LHA.MicrOMEGA_Result_exist and LHA.FullDestForChannels_Exist and LHA.MicroDestFile_Check) == True:
             		LHA.RenameAndCopy(LHA.PathforMicrOMEGAsResult, LHA.FullDestForMicromegas)
#			LHA.RenameAndCopy(LHA.PathforChannelsOutput,LHA.FullDestForChannels)

	     		LHA.Erase(fileformicromegas)
             		LHA.Erase(LHA.PathforMicrOMEGAsResult)
             		LHA.Erase(LHA.PathforChannelsOutput)

		else:
			LHA.Erase(fileformicromegas)



#fileno = len(fnmatch.filter(os.listdir(destPathforNewSLHA), 'SPheno.spc.secluded_UMSSM.*'))


#while fileno < MaxNumberOfSolution:
#    LHA = MyPySLHA()

#    LHA.LHAFileFullPath         = LHAFileFullPath
#    LHA.LHAFiledirPath          = LHAFiledirPath
#    LHA.LHAFileName             = LHAFileName
#    LHA.newLHAFileFullPath      = newLHAFileFullPath
#    LHA.newLHAFileName          = newLHAFileName
#    LHA.SLHAFileFullPath        = SLHAFileFullPath
#    LHA.SLHAFiledirPath         = SLHAFiledirPath
#    LHA.SLHAFileName            = SLHAFileName
#    LHA.destPathforNewSLHA      = destPathforNewSLHA
#    LHA.PathforMicrOMEGAsResult = PathforMicrOMEGAsResult
#    LHA.PathforChannelsOutput   = PathforChannelsOutput
#    LHA.PathforDecaysOutput     = PathforDecaysOutput


#    LHA.LoadLHAFile(LHA.SLHAFileName)
############# Check Constraints  ################################################################
#            if LHA.MassBounds() and LHA.CheckWhoIsLSP() and LHA.CheckBPhysics() == True:
#                fileno = len(fnmatch.filter(os.listdir(LHA.destPathforNewSLHA), "SPheno.spc.secluded_UMSSM.*"))
#                newfileno = fileno + 1
#                LHA.NewSLHAFileName = "SPheno.spc.secluded_UMSSM."+str(newfileno)
#                LHA.NewSLHAFileFullPath = "SPhenoOutputs/" + LHA.NewSLHAFileName
#		LHA.RenameAndCopy(LHA.SLHAFileName,LHA.NewSLHAFileFullPath)
#		LHA.Erase(LHA.SLHAFileName)		        
#	    else:
#		LHA.Erase(LHA.SLHAFileName)
#	else:
#            LHA.Erase(LHA.newLHAFileName)
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
