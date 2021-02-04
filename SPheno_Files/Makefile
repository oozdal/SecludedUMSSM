modname = sec_UMSSM  # as an example  
PreDef = -DGENERATIONMIXING -DONLYDOUBLE
# setting various paths  
InDir = ../include
Mdir = ${InDir}
VPATH = 3-Body-Decays:LoopDecays:TwoLoopMasses:Observables:SM 
name = ../lib/libSPhenosec_UMSSM.a
 
# check if SARAH module and SPheno are compatibel  
minV=330.00 
cVersion =$(shell expr $(version) \>= $(minV))
#  
# options for various compilers  
#  
# Default Compiler  
F90=gfortran
comp= -c -O -module ${Mdir} -I${InDir}  
LFlagsB= -O  
# Intels ifort,debug modus  
ifeq (${F90},ifortg)  
F90=ifort  
comp= -c -g -module ${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# gfortran  
ifeq (${F90},gfortran)  
comp= -c -g -ffree-line-length-none -J${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# g95  
ifeq (${F90},g95)  
comp= -c -O -fmod=${Mdir} -I${InDir}  
LFlagsB= -O  
endif  
# Lahey F95 compiler  
ifeq (${F90},lf95)  
comp=-c -O -M ${Mdir} -I${InDir}  
LFlagsB=-O  
endif  
# NAG f95/2003  
ifeq (${F90},nagfor)  
comp= -c -O -mdir ${Mdir} -I${InDir}  
LFlagsB= -O -DONLYDOUBLE -mdir ${MDir} -I${InDir}  
endif   
.SUFFIXES : .o .ps .f90 .F90 .a 
bin/SPhenosec_UMSSM:
ifeq (${cVersion},1)
	 cd ../src ; ${MAKE} F90=${F90} 
	 ${MAKE} F90=${F90} ${name} 
	 ${MAKE} F90=${F90} SPhenosec_UMSSM.o 
	 ${F90} -o SPhenosec_UMSSM ${LFlagsB} SPhenosec_UMSSM.o ../lib/libSPhenosec_UMSSM.a ../lib/libSPheno.a
	 mv SPhenosec_UMSSM ../bin
	 rm SPhenosec_UMSSM.o  
${name}:  ${name}(Settings.o) ${name}(Model_Data_sec_UMSSM.o)  \
 ${name}(RGEs_sec_UMSSM.o)   \
 ${name}(Couplings_sec_UMSSM.o) ${name}(TreeLevelMasses_sec_UMSSM.o) ${name}(TadpoleEquations_sec_UMSSM.o) \
 ${name}(LoopCouplings_sec_UMSSM.o) ${name}(CouplingsForDecays_sec_UMSSM.o) \
 ${name}(TreeLevel_Decays_sec_UMSSM.o) \
 ${name}(Glu_sec_UMSSM.o)  ${name}(Chi_sec_UMSSM.o)  ${name}(Cha_sec_UMSSM.o)  ${name}(Sd_sec_UMSSM.o)  ${name}(Su_sec_UMSSM.o)  ${name}(Se_sec_UMSSM.o)  ${name}(Sv_sec_UMSSM.o)  \
${name}(AddLoopFunctions.o) ${name}(Kinematics.o) \
 ${name}(EffPotFunctions.o) ${name}(DerivativesEffPotFunctions.o) ${name}(EffectivePotential_sec_UMSSM.o) \
 ${name}(2LPoleFunctions.o) ${name}(2LPole_sec_UMSSM.o) \
 ${name}(LoopMasses_sec_UMSSM.o) \
 ${name}(RGEs_SM_HC.o) ${name}(Couplings_SM_HC.o) ${name}(TreeLevelMasses_SM_HC.o) ${name}(LoopMasses_SM_HC.o)   \
${name}(CouplingsCT_sec_UMSSM.o) \
${name}(Bremsstrahlung.o) ${name}(DecayFFS.o) ${name}(DecayFFV.o) ${name}(DecaySSS.o) ${name}(DecaySSV.o) ${name}(DecaySFF.o) ${name}(DecaySVV.o) \
 ${name}(LoopDecaySd_sec_UMSSM.o)  ${name}(LoopDecaySu_sec_UMSSM.o)  ${name}(LoopDecaySe_sec_UMSSM.o)  ${name}(LoopDecaySv_sec_UMSSM.o)  ${name}(LoopDecayhh_sec_UMSSM.o)  ${name}(LoopDecayAh_sec_UMSSM.o)  ${name}(LoopDecayHpm_sec_UMSSM.o)  ${name}(LoopDecayGlu_sec_UMSSM.o)  ${name}(LoopDecayChi_sec_UMSSM.o)  ${name}(LoopDecayCha_sec_UMSSM.o)  ${name}(LoopDecayFu_sec_UMSSM.o) \
 ${name}(Wrapper_LoopDecay_Sd_sec_UMSSM.o)  ${name}(Wrapper_LoopDecay_Su_sec_UMSSM.o)  ${name}(Wrapper_LoopDecay_Se_sec_UMSSM.o)  ${name}(Wrapper_LoopDecay_Sv_sec_UMSSM.o)  ${name}(Wrapper_LoopDecay_hh_sec_UMSSM.o)  ${name}(Wrapper_LoopDecay_Ah_sec_UMSSM.o)  ${name}(Wrapper_LoopDecay_Hpm_sec_UMSSM.o)  ${name}(Wrapper_LoopDecay_Glu_sec_UMSSM.o)  ${name}(Wrapper_LoopDecay_Chi_sec_UMSSM.o)  ${name}(Wrapper_LoopDecay_Cha_sec_UMSSM.o)  ${name}(Wrapper_LoopDecay_Fu_sec_UMSSM.o) ${name}(OneLoopDecays_sec_UMSSM.o) \
 ${name}(BranchingRatios_sec_UMSSM.o) ${name}(HiggsCS_sec_UMSSM.o) ${name}(RunSM_sec_UMSSM.o) \
${name}(FlavorKit_LFV_sec_UMSSM.o) ${name}(FlavorKit_QFV_sec_UMSSM.o) ${name}(FlavorKit_Observables_sec_UMSSM.o)\
 ${name}(LowEnergy_sec_UMSSM.o) \
 ${name}(Boundaries_sec_UMSSM.o)  ${name}(InputOutput_sec_UMSSM.o) 
else 
	 @echo -------------------------------------------------------------------  
	 @echo ERROR:  
	 @echo The installed SPheno is version not compatibel with this module 
	 @echo Please, upgrade at least to SPheno version 3.3.0.  
	 @echo The current SPheno version can be downloaded from 
	 @echo http://www.hepforge.org/downloads/spheno 
	 @echo ------------------------------------------------------------------- 
endif 
clean: 
	 rm -f *.o *~ */*.o */*~
cleanall: 
	 rm -f bin/SPheno3 lib/*.a *~ */*.o */*~ include/*
#
# Suffix rules
#
.f90.a:
	 ${F90} ${comp} $< 
	 ar -ruc -U $@ $*.o
	 rm -f $*.o
.F90.a:
	 ${F90} ${comp} ${PreDef} $< 
	 ar -ruc -U $@ $*.o
	 rm -f $*.o
.f90.o:
	 ${F90} ${comp} $<
.f90.ps:
	 a2ps -o $*.ps $<
.h.ps:
	 a2ps -o $*.ps $<
