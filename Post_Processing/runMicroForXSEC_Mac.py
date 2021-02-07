######## Packages ###########
from math import *
import fnmatch
import numpy as np
import os
import sys
sys.path.append("/Volumes/LaCie/Iridis/projects/Secluded_UMSSM/pyslha-3.2.3/")
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


