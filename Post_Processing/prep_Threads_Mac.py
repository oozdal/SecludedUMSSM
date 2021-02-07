######## Packages ###########

import os
import shutil
from MyMultiThread import *

######## Current File Paths ########

FullPathForMainDirectories = os.path.abspath("/Volumes/LaCie/Iridis/projects/Secluded_UMSSM/Sec")

PathForMainDirectory = os.path.dirname(FullPathForMainDirectories)

#####################################

Thread = MyMultiThread()

NumberofThread = 10

nb = raw_input("Choose prep or submitSPheno or submitOmega or submitRunSModelS or run_Micromegas: \n")

if nb == "prep":

    for f_no in range(1,NumberofThread+1):
#    for f_no in range(11,70):        
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
            shutil.copy2("MyPySLHA_Mac.py",PathForfDirectory)
            shutil.copy2("submitMe",PathForfDirectory)

#	    shutil.copy2("myOmega",PathForMicromegas)
            shutil.copy2("run_Micromegas_Mac.py",PathForfDirectory)
            shutil.copy2("runMicroForXSEC.py",PathForfDirectory)
            shutil.copy2("submitMicromegas",PathForfDirectory)

            os.chdir(PathForfDirectory)
#	    os.makedirs("SModelS_Results")
#	    shutil.rmtree("MicromegasOutputs/",ignore_errors=True)
            if os.path.isfile("MicromegasOutputs/myOmega") == True: os.remove("MicromegasOutputs/myOmega")

#           os.chdir("MicromegasOutputs")
#	    os.system("ln -s ../../../../../hepwork/micromegas_5.0.9/secUMSSM/myOmega ./")
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

if nb == "run_Micromegas":
#    for f_no in range(1,NumberofThread+1):
    for f_no in range(50,71):        
        PathForfDirectory=PathForMainDirectory+"/Sec"+str(f_no)
        os.chdir(PathForfDirectory)
        ScreenBaseName = "Micro"
        ScreenFullName = ScreenBaseName+'_'+str(f_no)

        os.system("screen -S "+ ScreenFullName +" -dm ipython -i run_Micromegas_Mac.py")
        os.chdir("../")

elif nb == "kill":
    os.system("screen -X -S Micro_1 kill")
    os.system("screen -X -S Micro_2 kill")
    os.system("screen -X -S Micro_3 kill")
    os.system("screen -X -S Micro_4 kill")
    os.system("screen -X -S Micro_5 kill")
    os.system("screen -X -S Micro_6 kill")
    os.system("screen -X -S Micro_7 kill")
    os.system("screen -X -S Micro_8 kill")
    os.system("screen -X -S Micro_9 kill")
    os.system("screen -X -S Micro_10 kill")       
