######## Packages ###########
from math import *
import fnmatch
import numpy as np
import os
import pyslha
import pandas as pd
import signal
import time
from scipy.stats import beta
from scipy.stats import lognorm
#import xslha

from MyPySLHA_Mac import *
#from MySPheno import *
#from MyMicrOMEGAs import *

# generate random integer values
from random import seed
from random import randint
from random import choice
from random import uniform
# seed random number generator
seed(randint(1,1000000))

######## Current LesHouches File Paths ########
LHAFileFullPath = os.path.abspath("LesHouches.in.sec_UMSSM")
LHAFiledirPath = os.path.dirname(LHAFileFullPath)
LHAFileName = os.path.basename(LHAFileFullPath)
######## Updated LesHouches Files Paths #######
UpdatedLHAFileFullPath = os.path.abspath("LesHouches.in.sec_UMSSM_Updated")
UpdatedLHAFiledirPath  = os.path.dirname(UpdatedLHAFileFullPath)
UpdatedLHAFileName     = os.path.basename(UpdatedLHAFileFullPath)
######## Desired SPheno Output File Paths #########
SLHAFileFullPath   = os.path.abspath("SPheno.spc.sec_UMSSM")
SLHAFiledirPath    = os.path.dirname(SLHAFileFullPath)
SLHAFileName       = os.path.basename(SLHAFileFullPath)
destPathforNewSLHA = os.path.dirname("SPhenoOutputs/SPheno.spc.sec_UMSSM.*")
####### Desired MicrOMEGAs Output File Paths #########
PathforMicrOMEGAsResult = os.path.abspath("Block_micrOMEGAs.out")
PathforChannelsOutput = os.path.abspath("Channels.out")
PathforDecaysOutput = os.path.abspath("DECAYS.out")
###################################################################

for filename in os.listdir("SPhenoOutputs/"):
    if filename.startswith("SPheno.spc.sec_UMSSM"):
        split_list = filename.split(".")
        fileno = split_list[3]
        SPhenoFile = "SPheno.spc.sec_UMSSM."+fileno
        SPhenoFileFullPath = "SPhenoOutputs/"+SPhenoFile

        LHA =  MyPySLHA()
        LHA.NewMicromegasFileName     = "MicroXSEC."+str(fileno)
        LHA.NewMicromegasFileFullPath = "MicromegasOutputs/" + LHA.NewMicromegasFileName
        LHA.NewChannelFileName        = "Channels."+str(fileno)
        LHA.NewChannelFileFullPath    = "MicromegasOutputs/" + LHA.NewChannelFileName
        LHA.NewDecayFileName          = "DECAY."+str(fileno)
        LHA.NewDecayFileFullPath      = "MicromegasOutputs/" + LHA.NewDecayFileName

##################### Prep for Micromegas #########################
        LHA.Erase(PathforMicrOMEGAsResult)
        LHA.Erase(PathforChannelsOutput)
        LHA.Erase(PathforDecaysOutput)
        LHA.Erase("SPheno.spc.sec_UMSSM")
##################################################################        
        
        if LHA.CheckLHAexist(SPhenoFileFullPath) == True and LHA.CheckLHAexist(LHA.NewMicromegasFileFullPath) == False and LHA.CheckLHAexist(LHA.NewChannelFileFullPath) == False and LHA.CheckLHAexist(LHA.NewDecayFileFullPath) == False:
            LHA.LoadLHAFile(SPhenoFileFullPath)
            if LHA.MassBounds() == True and LHA.CheckBPhysics() == True and LHA.CheckWhoIsLSP() == True and LHA.chi2STU() == True:
                LHA.RenameAndCopy(SPhenoFileFullPath,"SPheno.spc.sec_UMSSM")
                if LHA.CheckLHAexist("SPheno.spc.sec_UMSSM"):
                    LHA.RunMicrOMEGAs("SPhenoFileFullPath")
                    if LHA.CheckLHAexist(PathforMicrOMEGAsResult) == True and LHA.CheckLHAexist(PathforChannelsOutput) == True and LHA.CheckLHAexist(PathforDecaysOutput) == True: 
                        LHA.ReadMicrOmegasOutput(PathforMicrOMEGAsResult)
                        if len(LHA.LoadMicrOmegasFile.index) > 5:
                            LHA.RenameAndCopy(PathforMicrOMEGAsResult,LHA.NewMicromegasFileFullPath)
                            LHA.RenameAndCopy(PathforChannelsOutput,LHA.NewChannelFileFullPath)
                            LHA.RenameAndCopy(PathforDecaysOutput,LHA.NewDecayFileFullPath)
                            LHA.Erase(PathforMicrOMEGAsResult)
                            LHA.Erase(PathforChannelsOutput)
                            LHA.Erase(PathforDecaysOutput)
                            LHA.Erase("SPheno.spc.sec_UMSSM")
                        else:
                            LHA.Erase(PathforMicrOMEGAsResult)
                            LHA.Erase(PathforChannelsOutput)
                            LHA.Erase(PathforDecaysOutput)
                            LHA.Erase("SPheno.spc.sec_UMSSM")


