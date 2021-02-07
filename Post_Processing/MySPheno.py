import os
import shutil
import subprocess
import time
import sys
import pandas as pd
import numpy as np
sys.path.append("/home/oo4g19/softwares/pyslha-3.2.3/")
import pyslha
from math import *
from scipy.interpolate import interp1d
import subprocess

class MySPheno():
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


    def RunSPheno(self, LHAInput):

        p = subprocess.call("./../../../softwares/SPheno-4.0.3/bin/SPhenosUMSSM_freeg1gp "+str(LHAInput),shell=True)

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

    def LoadSLHAFile(self, SLHAPath):
        self.allcontent = pyslha.read(SLHAPath, ignoreblocks=['SPINFO'])

    def CheckSLHAexist(self,SLHAPath):
                return os.path.isfile(SLHAPath)

    def Read_Block(self, BlockName, id1=None, id2=None, id3=None):
        self.BlockName       = BlockName
        self.id1             = id1
        self.id2             = id2
        self.id3             = id3

        self.list_all_blocks = self.allcontent.blocks
        self.pyslha_Block    = self.allcontent.blocks[self.BlockName]

        if self.id1 != None and self.id2 == None and self.id3 == None:
            self.VarValue1   = self.pyslha_Block[self.id1]
            return self.VarValue1

        elif self.id1 != None and self.id2 != None and self.id3 == None:
            self.VarValue2   = self.pyslha_Block[self.id1,self.id2]
            return self.VarValue2

        else:
            self.VarValue3   = self.pyslha_Block[self.id1,self.id2,self.id3]
            return self.VarValue3

    def Erase(self,FilePathToErase):
        self.FilePathToErase = FilePathToErase
        os.remove(self.FilePathToErase)
        print "SLHA File Removed!"        

    def MassBounds(self):

        self.SMlikeHiggsMass = False

        self.mh1 = self.allcontent.blocks["MASS"][25]
        self.mh2 = self.allcontent.blocks["MASS"][35]
        self.mh3 = self.allcontent.blocks["MASS"][45]
        self.mh4 = self.allcontent.blocks["MASS"][55]
        self.mh5 = self.allcontent.blocks["MASS"][65]
        self.mh6 = self.allcontent.blocks["MASS"][75]
        self.MZp = self.allcontent.blocks["MASS"][31]

        if (self.mh1 >= 122 and self.mh1 <= 128) or (self.mh2 >= 122 and self.mh2 <= 128) or (self.mh3 >= 122 and self.mh3 <= 128) or (self.mh4 >= 122 and self.mh4 <= 128) or (self.mh5 >= 122 and self.mh5 <= 128): self.SMlikeHiggsMass = True

        self.CheckConstraints = self.SMlikeHiggsMass
        return self.CheckConstraints
    
    def CheckWhoIsLSP(self):
        self.LSPcontraint = False

        if (self.allcontent.blocks["LSP"][1] == 1000022) or (self.allcontent.blocks["LSP"][1] == 1000012): self.LSPcontraint = True
        else: self.LSPcontraint == False

        return self.LSPcontraint

    def LSPmass(self):
         
         self.LSPmass = []
         for i in range(len(self.data)):
             if self.param["LSP"][i] == 1000022:
                 self.LSPmass.append(self.param["mchi1"][i])
             elif self.param["LSP"][i] == 1000012:
                 self.LSPmass.append(self.param["MassSv1"][i])
     
         self.LSPmass = abs(np.array(self.LSPmass))

    def NLSPmass(self):
          
         self.NLSPmass = []
         for i in range(len(self.data)):
             if self.param["NLSP"][i] == 1000012:
                 self.NLSPmass.append(self.param["MassSv1"][i])
             elif self.param["NLSP"][i] == 1000023:
                 self.NLSPmass.append(self.param["mchi2"][i])
             elif self.param["NLSP"][i] == 1000024:
                 self.NLSPmass.append(self.param["mcha1"][i])
             elif self.param["NLSP"][i] == 1000011:
                 self.NLSPmass.append(self.param["stau1"][i])
             elif self.param["NLSP"][i] == 1000021:
                 self.NLSPmass.append(self.param["gluino"][i])
             elif self.param["NLSP"][i] == 1000022:
                 self.NLSPmass.append(self.param["mchi1"][i])
             else:
                 self.NLSPmass.append(1e40)


    def U1ChargeGenerator(self,E6Angle):
        self.E6Angle = E6Angle

        self.QQ_chi = -1;self.QQ_psi = 1
        self.Qu_chi = -1;self.Qu_psi = 1
        self.Qd_chi =  3;self.Qd_psi = 1
        self.Ql_chi =  3;self.Ql_psi = 1
        self.Qv_chi = -5;self.Qv_psi = 1
        self.Qe_chi = -1;self.Qe_psi = 1
        self.QHu_chi=  2;self.QHu_psi=-2
        self.QHd_chi= -2;self.QHd_psi=-2
        self.Qs_chi =  0;self.Qs_psi = 4
        self.Qs1_chi=  0;self.Qs1_psi= 2
        self.Qs2_chi=  0;self.Qs2_psi= 4
        self.Qs3_chi=  0;self.Qs3_psi=-4

        Cofactor_chi = sqrt(40);Cofactor_psi = sqrt(24)

        self.QQ_charge = cos(self.E6Angle)*(1./Cofactor_chi)*self.QQ_chi + sin(self.E6Angle)*(1./Cofactor_psi)*self.QQ_psi
        self.Qu_charge = cos(self.E6Angle)*(1./Cofactor_chi)*self.Qu_chi + sin(self.E6Angle)*(1./Cofactor_psi)*self.Qu_psi
        self.Qd_charge = cos(self.E6Angle)*(1./Cofactor_chi)*self.Qd_chi + sin(self.E6Angle)*(1./Cofactor_psi)*self.Qd_psi
        self.Ql_charge = cos(self.E6Angle)*(1./Cofactor_chi)*self.Ql_chi + sin(self.E6Angle)*(1./Cofactor_psi)*self.Ql_psi
        self.Qv_charge = cos(self.E6Angle)*(1./Cofactor_chi)*self.Qv_chi + sin(self.E6Angle)*(1./Cofactor_psi)*self.Qv_psi
        self.Qe_charge = cos(self.E6Angle)*(1./Cofactor_chi)*self.Qe_chi + sin(self.E6Angle)*(1./Cofactor_psi)*self.Qe_psi
        self.QHu_charge = cos(self.E6Angle)*(1./Cofactor_chi)*self.QHu_chi + sin(self.E6Angle)*(1./Cofactor_psi)*self.QHu_psi
        self.QHd_charge = cos(self.E6Angle)*(1./Cofactor_chi)*self.QHd_chi + sin(self.E6Angle)*(1./Cofactor_psi)*self.QHd_psi
        self.Qs_charge = cos(self.E6Angle)*(1./Cofactor_chi)*self.Qs_chi + sin(self.E6Angle)*(1./Cofactor_psi)*self.Qs_psi
        self.Qs1_charge = cos(self.E6Angle)*(1./Cofactor_chi)*self.Qs1_chi + sin(self.E6Angle)*(1./Cofactor_psi)*self.Qs1_psi
        self.Qs2_charge = cos(self.E6Angle)*(1./Cofactor_chi)*self.Qs2_chi + sin(self.E6Angle)*(1./Cofactor_psi)*self.Qs2_psi
        self.Qs3_charge = cos(self.E6Angle)*(1./Cofactor_chi)*self.Qs3_chi + sin(self.E6Angle)*(1./Cofactor_psi)*self.Qs3_psi
