import sys
sys.path.append("/scratch/oo1m20/projects/Secluded_UMSSM")
import pyslha
import fnmatch
import os, re
from MyPySLHA import *
from MySModelS import *

###########################################################

def is_non_zero_file(fpath):
    return os.path.isfile(fpath) and os.path.getsize(fpath) > 0

###########################################################

outputdir        = "SPhenoOutputs"
MicromegasOutdir = "MicromegasOutputs"
SModelSdir       = "SModelS_Results"

for filename in os.listdir(outputdir):
    if filename.startswith("SecUMSSM"):
        split_list = filename.split(".")
        fileno = split_list[-1]	
        outputfilefullpath   = os.path.abspath(outputdir+"/SecUMSSM."+str(fileno))
        DestinationFullPath  = os.path.abspath(SModelSdir+"/SModelS."+str(fileno))
        MicromegasOutputFullPath = os.path.abspath(MicromegasOutdir+"/MicroXSEC."+str(fileno))

        SLHA = MyPySLHA()
        SModelS = MySModelS()

        if (SLHA.CheckLHAexist(outputfilefullpath) and SLHA.CheckLHAexist(MicromegasOutputFullPath) and is_non_zero_file(MicromegasOutputFullPath) == True) and (SLHA.CheckLHAexist(DestinationFullPath) == False): SModelS.RunSModelS(outputfilefullpath,DestinationFullPath)

