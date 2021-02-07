import pyslha
import fnmatch
import os, re
from MyPySLHA import *
from MySModelS import *

#DataSModelSPath = os.path.abspath("/scratch/oo4g19/projects/Secluded_UMSSM/data/DataSModelS.dat")
maindirpath      = os.path.abspath("/scratch/oo1m20/projects/Secluded_UMSSM")
###########################################################

def is_non_zero_file(fpath):
    return os.path.isfile(fpath) and os.path.getsize(fpath) > 0

###########################################################

numberofoutputdir = len(fnmatch.filter(os.listdir(maindirpath), 'Sec*'))

for i in range(1,numberofoutputdir+1):
    f_filename       = "Sec"+str(i)
    outputdir        = f_filename + "/SPhenoOutputs"
    numberofoutput   = len(fnmatch.filter(os.listdir(outputdir), 'SecUMSSM.*'))
    print(f_filename)

    MicromegasOutdir = f_filename + "/MicromegasOutputs"
    SModelSdir       = f_filename + "/SModelS_Results"

    for j in range(1,numberofoutput):
        outputfilefullpath   = os.path.abspath(outputdir+"/SecUMSSM."+str(j))
        DestinationFullPath  = os.path.abspath(SModelSdir+"/SModelS."+str(j))

        MicromegasOutputFullPath = os.path.abspath(MicromegasOutdir+"/MicroXSEC."+str(j))

        SLHA = MyPySLHA()
        SModelS = MySModelS()
        if (SLHA.CheckLHAexist(outputfilefullpath) and SLHA.CheckLHAexist(MicromegasOutputFullPath) and is_non_zero_file(MicromegasOutputFullPath) == True) and (SLHA.CheckLHAexist(DestinationFullPath) == False):
                SModelS.RunSModelS(outputfilefullpath,DestinationFullPath)
#                f= open(DataSModelSPath,"a+")
#                f.write("%2.f,%5.f,%.8E,%s" % (i,j,SModelS.rmax,SModelS.bestResult))
#                f.write('\n')
#                f.close()

