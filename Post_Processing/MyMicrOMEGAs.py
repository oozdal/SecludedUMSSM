import os
import shutil
import subprocess
import time
import sys

class MyMicrOMEGAs():
    def __init__(self):
        pass

    def RenameAndCopy(self,currentLHAFilePath, newLHAFilePath):
        self.currentLHAFullPath  = os.path.abspath(currentLHAFilePath)
        self.currentLHAdirPath   = os.path.dirname(self.currentLHAFullPath)
        self.currentLHAFileName  = os.path.basename(self.currentLHAFullPath)

        self.newLHAFullPath      = os.path.abspath(newLHAFilePath)
        self.newLHAdirPath       = os.path.dirname(self.newLHAFullPath)
        self.newLHAFileName      = os.path.basename(self.newLHAFullPath)
    
        self.old_file = os.path.join(self.currentLHAdirPath, self.currentLHAFileName)
        self.new_file = os.path.join(self.newLHAdirPath, self.newLHAFileName)
        shutil.copy2(self.old_file, self.new_file)


    def RunMicrOMEGAs(self, LHAInput):

        p = subprocess.call("timeout 60 ./../../../softwares/micromegas_5.0.8/secluded_UMSSM/myOmega "+str(LHAInput),shell=True)

    def LHAwithDM(self, PathLHAfile, PathMicrOMEGAsResult, PathLHAfileWithDM):
#        c = subprocess.call("timeout 5 cat "+str(PathLHAfile)+" "+str(PathMicrOMEGAsResult)+" > "+str(PathLHAfileWithDM),shell=True)

        filenames = [PathLHAfile, PathMicrOMEGAsResult]
        with open(PathLHAfileWithDM, 'w') as outfile:
            for fname in filenames:
                with open(fname) as infile:
                    for line in infile:
                        outfile.write(line)

    def handler(signum, frame):
        print 'Signal handler called with signal', signum


    def Erase(self,FilePathToErase):
        self.FilePathToErase = FilePathToErase
        os.remove(self.FilePathToErase)
        print "LHA File Removed!"

