import fnmatch

from classSLHAtoMG import *

#######################################################################

maindirpath   = "/home/oo4g19/projects/Secluded_UMSSM"
FullCardsPath = "/home/oo4g19/softwares/MG5_aMC_v2_6_7/secUMSSM_pptozp/Cards/param_card.dat"
MGrunFile     = "/home/oo4g19/softwares/MG5_aMC_v2_6_7/runZpExclusion"
newMGrunFile  = "/home/oo4g19/softwares/MG5_aMC_v2_6_7/runZpExclusion_new"

MGdirectory    = "/home/oo4g19/softwares/MG5_aMC_v2_6_7/secUMSSM_pptozp/Events"
########################################################################

numberofoutputdir = len(fnmatch.filter(os.listdir(maindirpath), 'Sec*'))

newSLHA = CopySLHAtoMG()
for i in range(1,numberofoutputdir+1):
    f_filename = "Sec"+str(i)
    outputdir = f_filename + "/SPhenoOutputs"
    numberofoutput = len(fnmatch.filter(os.listdir(outputdir), 'SPheno.spc.secluded_UMSSM.*'))

    for j in range(1,numberofoutput):
        outputfilefullpath  = outputdir+"/SPheno.spc.secluded_UMSSM."+str(j)
	MGoutputfilefullpath = os.path.abspath(MGdirectory+"/Sec"+str(i)+"_"+str(j)+"/Sec"+str(i)+"_"+str(j)+"_tag_1_banner.txt")
	if newSLHA.CheckSLHA(outputfilefullpath) == True and newSLHA.CheckSLHA(MGoutputfilefullpath) == False:
		newSLHA.CopySLHAtoCards(outputfilefullpath,FullCardsPath)
		with open(MGrunFile, 'r') as file:
			newSLHA.filedata = file.read()
			newSLHA.filedata = newSLHA.filedata.replace("variable", "Sec"+str(i)+"_"+str(j))

            	with open(newMGrunFile, 'w') as newfile:
                		newfile.write(newSLHA.filedata)

		os.system("./../../softwares/MG5_aMC_v2_6_7/bin/mg5_aMC ../../softwares/MG5_aMC_v2_6_7/runZpExclusion_new")
		
	else:
		continue


