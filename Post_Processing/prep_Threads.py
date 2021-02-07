######## Packages ###########

import os
import shutil
from MyMultiThread import *

######## Current File Paths ########

FullPathForMainDirectories = os.path.abspath("/scratch/oo1m20/projects/Secluded_UMSSM/Sec")

PathForMainDirectory = os.path.dirname(FullPathForMainDirectories)

#####################################

Thread = MyMultiThread()

NumberofThread = 70

nb = raw_input("Choose prep or submitSPheno or submitOmega or submitRunSModelS: \n")

if nb == "prep":

    for f_no in range(1,NumberofThread+1):
        PathForfDirectory=PathForMainDirectory+"/Sec"+str(f_no)
        if os.path.exists(PathForfDirectory):
#            os.makedirs(PathForfDirectory)            ####
#            print PathForfDirectory + " is created!"  ####

            PathForOutputFiles = PathForfDirectory+"/SPhenoOutputs"
#            os.makedirs(PathForOutputFiles)           ####
#            print PathForOutputFiles + " is created!" ####
            PathForMicromegas  = PathForfDirectory+"/MicromegasOutputs"
            if not os.path.exists(PathForMicromegas): os.makedirs(PathForMicromegas)
 
            shutil.copy2("LesHouches.in.sec_UMSSM",PathForfDirectory) 
            shutil.copy2("run_Secluded.py",PathForfDirectory)
            shutil.copy2("MyPySLHA.py",PathForfDirectory)
            shutil.copy2("submitMe",PathForfDirectory)

#	    shutil.copy2("myOmega",PathForMicromegas)
            shutil.copy2("run_Micromegas_new.py",PathForfDirectory)
            shutil.copy2("runMicroForXSEC.py",PathForfDirectory)
            shutil.copy2("submitMicromegas",PathForfDirectory)

            os.chdir(PathForfDirectory)
#	    os.makedirs("SModelS_Results")
#	    shutil.rmtree("MicromegasOutputs/",ignore_errors=True)
#            os.remove("MicromegasOutputs/myOmega")
	    os.system("rm -f MicromegasOutputs/core*")
	    os.system("rm -f slurm*")

#            os.chdir("MicromegasOutputs")
#	    os.system("ln -s ../../../../../../home/oo4g19/softwares/micromegas_5.0.8/sec_UMSSM/myOmega .")
#	    os.chdir("../")

            if os.path.isfile("SPheno.spc.sec_UMSSM") == True: os.system("rm SPheno.spc.sec_UMSSM")
            os.chdir("../")

elif nb == "submitSPheno":

    for f_no in range(1,NumberofThread+1):
        PathForfDirectory=PathForMainDirectory+"/Sec"+str(f_no)
        os.chdir(PathForfDirectory)
        os.system("sbatch submitMe")
        os.chdir("../")

elif nb == "submitOmega":

    for f_no in range(1,NumberofThread+1):
#    for f_no in range(11,40):
        PathForfDirectory=PathForMainDirectory+"/Sec"+str(f_no)
        PathForMicromegas = PathForfDirectory+"/MicromegasOutputs"
        if not os.path.exists(PathForMicromegas):
              os.makedirs(PathForMicromegas)	
        shutil.copy2("myOmega",PathForMicromegas)
        os.chdir(PathForfDirectory)
        os.system("sbatch submitMicromegas")
        os.chdir("../")

elif nb == "submitRunSModelS":
    for f_no in range(1,NumberofThread+1):
        PathForfDirectory=PathForMainDirectory+"/Sec"+str(f_no)
        PathForSModelS = PathForfDirectory+"/SModelS_Results"
        if not os.path.exists(PathForSModelS):  os.makedirs(PathForSModelS)
        shutil.copy2("MySModelS.py",PathForfDirectory)
        shutil.copy2("RunSModelS_Parallel.py",PathForfDirectory)
        shutil.copy2("submit_RunSModelS",PathForfDirectory)
        os.chdir(PathForfDirectory)
        os.system("sbatch submit_RunSModelS")
        os.chdir("../")
