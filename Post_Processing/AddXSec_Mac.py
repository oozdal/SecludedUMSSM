import pyslha
import fnmatch
import os, re
from MyPySLHA import *

maindirpath      = os.path.abspath("/Volumes/LaCie/Iridis/projects/Secluded_UMSSM")
###########################################################

def is_non_zero_file(fpath):
    return os.path.isfile(fpath) and os.path.getsize(fpath) > 0

###########################################################

numberofoutputdir = len(fnmatch.filter(os.listdir(maindirpath), 'Sec*'))

for i in range(1,numberofoutputdir+1):
    f_filename       = "Sec"+str(i)
    outputdir        = f_filename + "/SPhenoOutputs"
    numberofoutput   = len(fnmatch.filter(os.listdir(outputdir), 'SPheno.spc.sec_UMSSM.*'))
    print f_filename

    MicromegasOutdir = f_filename + "/MicromegasOutputs"

    for j in range(1,numberofoutput):
    	outputfilefullpath   = os.path.abspath(outputdir+"/SPheno.spc.sec_UMSSM."+str(j))
	print outputfilefullpath
	DestinationFullPath  = os.path.abspath(outputdir+"/SecUMSSM."+str(j))

	MicromegasOutputFullPath = os.path.abspath(MicromegasOutdir+"/MicroXSEC."+str(j))

    	SLHA = MyPySLHA()
	if (SLHA.CheckLHAexist(outputfilefullpath) and SLHA.CheckLHAexist(MicromegasOutputFullPath) and is_non_zero_file(MicromegasOutputFullPath) == True) and SLHA.CheckLHAexist(DestinationFullPath) == False:
#        	SLHA.LoadLHAFile(outputfilefullpath)
		SLHA.ReadMicrOmegasOutput(MicromegasOutputFullPath)

		SLHA.RenameAndCopy(outputfilefullpath, DestinationFullPath)

		SLHA.AddXSecBlock(DestinationFullPath,"-1000024","1000024",SLHA.xsecCha1Cha1)
		SLHA.AddXSecBlock(DestinationFullPath,"1000023","1000024",SLHA.xsecChi2Cha1)
		SLHA.AddXSecBlock(DestinationFullPath,"-1000024","1000023",SLHA.xsecChi2AntiCha1)
