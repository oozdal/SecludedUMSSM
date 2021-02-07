#!/usr/bin/env python3

from __future__ import print_function
"""
.. module:: Example
   :synopsis: Basic main file example for using SModelS.   
   This file must be run under the installation folder.
"""
""" Import basic functions (this file must be executed in the installation folder) """

import os
import sys
sys.path.append("/home/oo1m20/softwares/smodels-1.2.2/")

from smodels import particlesLoader
from smodels.theory import slhaDecomposer,lheDecomposer
from smodels.tools.physicsUnits import fb, GeV, TeV
from smodels.theory.theoryPrediction import theoryPredictionsFor
from smodels.experiment.databaseObj import Database
from smodels.tools import coverage
from smodels.tools.smodelsLogging import setLogLevel
setLogLevel("info")

class MySModelS():
    def __init__(self):
        pass
    
    def RunSModelS(self,SLHAFilePath,SummaryFilePath):
        # Set the path to the database
        database = Database("/home/oo1m20/softwares/smodels-1.2.2/smodels-database")

        self.SummaryFilePath = os.path.abspath(SummaryFilePath)

        #Define your model (list of rEven and rOdd particles)
        particlesLoader.load( 'smodels.share.models.secumssm' ) #Make sure all the model particles are up-to-date
    
        # Path to input file (either a SLHA or LHE file)
        self.SLHAFilePath = SLHAFilePath
        slhafile = self.SLHAFilePath
        #lhefile = 'inputFiles/lhe/gluino_squarks.lhe'

        # Set main options for decomposition
        sigmacut = 0.01 * fb
        mingap = 5. * GeV

    
        # Decompose model (use slhaDecomposer for SLHA input or lheDecomposer for LHE input)
        slhaInput = True
        if slhaInput:
            toplist = slhaDecomposer.decompose(slhafile, sigmacut, doCompress=True, doInvisible=True, minmassgap=mingap)
        else:
            toplist = lheDecomposer.decompose(lhefile, doCompress=True,doInvisible=True, minmassgap=mingap)
        # Access basic information from decomposition, using the topology list and topology objects:
        f= open(self.SummaryFilePath,"a+")
        print( "\n Decomposition Results: ", file=f )
        print( "\t  Total number of topologies: %i " %len(toplist), file=f )
        nel = sum([len(top.elementList) for top in toplist])
        print( "\t  Total number of elements = %i " %nel , file=f)
        #Print information about the m-th topology (if it exists):
        m = 2
        if len(toplist) > m:
            top = toplist[m]
            print( "\t\t %i-th topology  = " %m,top,"with total cross section =",top.getTotalWeight(), file=f )
            #Print information about the n-th element in the m-th topology:
            n = 0
            el = top.elementList[n]
            print( "\t\t %i-th element from %i-th topology  = " %(n,m),el, end="", file=f )
            print( "\n\t\t\twith final states =",el.getFinalStates(),"\n\t\t\twith cross section =",el.weight,"\n\t\t\tand masses = ",el.getMasses(), file=f )
            
        # Load the experimental results to be used.
        # In this case, all results are employed.
        listOfExpRes = database.getExpResults()

        # Print basic information about the results loaded.
        # Count the number of loaded UL and EM experimental results:
        nUL, nEM = 0, 0
        for exp in listOfExpRes:
            expType = exp.getValuesFor('dataType')[0]
            if expType == 'upperLimit':
                nUL += 1
            elif  expType == 'efficiencyMap':
                nEM += 1
        print( "\n Loaded Database with %i UL results and %i EM results " %(nUL,nEM), file=f )

        # Compute the theory predictions for each experimental result and print them:
        print("\n Theory Predictions and Constraints:", file=f)
        rmax = 0.
        bestResult = None
        for expResult in listOfExpRes:
            predictions = theoryPredictionsFor(expResult, toplist, combinedResults=False, marginalize=False)
            if not predictions: continue # Skip if there are no constraints from this result
            print('\n %s ' %expResult.globalInfo.id, file=f)
            for theoryPrediction in predictions:
                dataset = theoryPrediction.dataset
                datasetID = dataset.dataInfo.dataId            
                mass = theoryPrediction.mass
                txnames = [str(txname) for txname in theoryPrediction.txnames]
                PIDs =  theoryPrediction.PIDs         
                print( "------------------------", file=f )
                print( "Dataset = ", datasetID, file=f )   #Analysis name
                print( "TxNames = ", txnames, file=f )  
                print( "Prediction Mass = ",mass, file=f )   #Value for average cluster mass (average mass of the elements in cluster)
                print( "Prediction PIDs = ",PIDs, file=f )   #Value for average cluster mass (average mass of the elements in cluster)
                print( "Theory Prediction = ",theoryPrediction.xsection, file=f )  #Signal cross section
                print( "Condition Violation = ",theoryPrediction.conditions, file=f ) #Condition violation values
              
                # Get the corresponding upper limit:
                print( "UL for theory prediction = ",theoryPrediction.upperLimit, file=f )

                # Compute the r-value
                r = theoryPrediction.getRValue()
                print( "r = ",r , file=f)
                #Compute likelihhod and chi^2 for EM-type results:
                if dataset.dataInfo.dataType == 'efficiencyMap':
                    theoryPrediction.computeStatistics()
                    print( 'Chi2, likelihood=', theoryPrediction.chi2, theoryPrediction.likelihood, file=f )
                if r > rmax:
                    rmax = r
                    bestResult = expResult.globalInfo.id

        # Print the most constraining experimental result
        print( "\nThe largest r-value (theory/upper limit ratio) is ",rmax, file=f )
        if rmax > 1.:
            print( "(The input model is likely excluded by %s)" %bestResult, file=f )
        else:
            print( "(The input model is not excluded by the simplified model results)", file=f )

        f.close()

