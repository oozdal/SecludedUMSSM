! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 1:18 on 7.11.2019   
! ----------------------------------------------------------------------  
 
 
Module CouplingsForDecays_sec_UMSSM
 
Use Control 
Use Settings 
Use Model_Data_sec_UMSSM 
Use RGEs_sec_UMSSM 
Use Couplings_sec_UMSSM 
Use LoopCouplings_sec_UMSSM 
Use Tadpoles_sec_UMSSM 
 Use TreeLevelMasses_sec_UMSSM 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Use StandardModel 
Contains 
 
 
 
Subroutine CouplingsFor_Sd_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvinput,          & 
& MSv2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,pGinput,        & 
& TWinput,TWpinput,UMinput,UPinput,vinput,ZAinput,ZDinput,ZDLinput,ZDRinput,             & 
& ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,ZURinput,           & 
& ZVinput,ZVLinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,          & 
& gpinput,Ydinput,Yeinput,laminput,Yvinput,kapinput,Yuinput,Tdinput,Teinput,             & 
& Tlaminput,Tvinput,Tkinput,Tuinput,mq2input,ml2input,mHd2input,mHu2input,               & 
& md2input,mu2input,me2input,ms2input,ms12input,ms22input,ms32input,mv2input,            & 
& M1input,M2input,M3input,M4input,vdinput,vuinput,vSinput,vS1input,vS2input,             & 
& vS3input,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,               & 
& cplGluFdcSdL,cplGluFdcSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVZ,cplSdcSdVZp,               & 
& cplSucSdVWm,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,gpinput,mHd2input,mHu2input,ms2input,ms12input,               & 
& ms22input,ms32input,vdinput,vuinput,vSinput,vS1input,vS2input,vS3input

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,Yvinput(3,3),kapinput,Yuinput(3,3),Tdinput(3,3),   & 
& Teinput(3,3),Tlaminput,Tvinput(3,3),Tkinput,Tuinput(3,3),mq2input(3,3),ml2input(3,3),  & 
& md2input(3,3),mu2input(3,3),me2input(3,3),mv2input(3,3),M1input,M2input,               & 
& M3input,M4input

Real(dp),Intent(in) :: MAhinput(6),MAh2input(6),MChainput(2),MCha2input(2),MChiinput(9),MChi2input(9),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(3),MFv2input(3),MGluinput,MGlu2input,Mhhinput(6),Mhh2input(6),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvinput(6),MSv2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,vinput,ZPinput(2,2),ZZinput(3,3),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),ZAinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZHinput(6,6),ZNinput(9,9),      & 
& ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZVinput(6,6),ZVLinput(3,3),ZVRinput(3,3),     & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp),Intent(out) :: cplAhSdcSd(6,6,6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChiFdcSdL(9,3,6),        & 
& cplChiFdcSdR(9,3,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplhhSdcSd(6,6,6),             & 
& cplHpmSucSd(2,6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplSucSdVWm(6,6)

Real(dp) ::  g1D(284) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Sd_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
gp = gpinput 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
Yv = Yvinput 
kap = kapinput 
Yu = Yuinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tv = Tvinput 
Tk = Tkinput 
Tu = Tuinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
ms2 = ms2input 
ms12 = ms12input 
ms22 = ms22input 
ms32 = ms32input 
mv2 = mv2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
M4 = M4input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
vS1 = vS1input 
vS2 = vS2input 
vS3 = vS3input 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,284,0._dp,tz,deltaM,dt,0._dp,rge284,kont)

End if 
Call GToParameters284(g1D,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,              & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZV = ZVinput 
ZVL = ZVLinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSv = MSvinput 
MSv2 = MSv2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
v = vinput 
End if 
cplAhSdcSd = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSdcSdT(gt1,gt2,gt3,Yd,Td,lam,vu,vS,ZD,ZA,cplAhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSdcSd = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSdcSdT(gt1,gt2,gt3,g1,g2,gp,Yd,Td,lam,vd,vu,vS,vS1,vS2,vS3,            & 
& ZD,ZH,cplhhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplHpmSucSd = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingHpmSucSdT(gt1,gt2,gt3,g2,Yd,Td,lam,Yu,Tu,vd,vu,vS,ZD,ZU,ZP,              & 
& cplHpmSucSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcSdVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSdcSdVZT(gt1,gt2,g1,g2,gp,ZD,TW,TWp,cplSdcSdVZ(gt1,gt2))

 End Do 
End Do 


cplSdcSdVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSdcSdVZpT(gt1,gt2,g1,g2,gp,ZD,TW,TWp,cplSdcSdVZp(gt1,gt2))

 End Do 
End Do 


cplSucSdVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSucSdVWmT(gt1,gt2,g2,ZD,ZU,cplSucSdVWm(gt1,gt2))

 End Do 
End Do 


cplChaFucSdL = 0._dp 
cplChaFucSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFucSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplChaFucSdL(gt1,gt2,gt3)& 
& ,cplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,gp,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)& 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Sd_decays_2B
 
Subroutine CouplingsFor_Su_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvinput,          & 
& MSv2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,pGinput,        & 
& TWinput,TWpinput,UMinput,UPinput,vinput,ZAinput,ZDinput,ZDLinput,ZDRinput,             & 
& ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,ZURinput,           & 
& ZVinput,ZVLinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,          & 
& gpinput,Ydinput,Yeinput,laminput,Yvinput,kapinput,Yuinput,Tdinput,Teinput,             & 
& Tlaminput,Tvinput,Tkinput,Tuinput,mq2input,ml2input,mHd2input,mHu2input,               & 
& md2input,mu2input,me2input,ms2input,ms12input,ms22input,ms32input,mv2input,            & 
& M1input,M2input,M3input,M4input,vdinput,vuinput,vSinput,vS1input,vS2input,             & 
& vS3input,cplAhSucSu,cplChiFucSuL,cplChiFucSuR,cplcChaFdcSuL,cplcChaFdcSuR,             & 
& cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVZ,             & 
& cplSucSuVZp,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,gpinput,mHd2input,mHu2input,ms2input,ms12input,               & 
& ms22input,ms32input,vdinput,vuinput,vSinput,vS1input,vS2input,vS3input

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,Yvinput(3,3),kapinput,Yuinput(3,3),Tdinput(3,3),   & 
& Teinput(3,3),Tlaminput,Tvinput(3,3),Tkinput,Tuinput(3,3),mq2input(3,3),ml2input(3,3),  & 
& md2input(3,3),mu2input(3,3),me2input(3,3),mv2input(3,3),M1input,M2input,               & 
& M3input,M4input

Real(dp),Intent(in) :: MAhinput(6),MAh2input(6),MChainput(2),MCha2input(2),MChiinput(9),MChi2input(9),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(3),MFv2input(3),MGluinput,MGlu2input,Mhhinput(6),Mhh2input(6),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvinput(6),MSv2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,vinput,ZPinput(2,2),ZZinput(3,3),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),ZAinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZHinput(6,6),ZNinput(9,9),      & 
& ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZVinput(6,6),ZVLinput(3,3),ZVRinput(3,3),     & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp),Intent(out) :: cplAhSucSu(6,6,6),cplChiFucSuL(9,3,6),cplChiFucSuR(9,3,6),cplcChaFdcSuL(2,3,6),       & 
& cplcChaFdcSuR(2,3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplhhSucSu(6,6,6),            & 
& cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6)

Real(dp) ::  g1D(284) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Su_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
gp = gpinput 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
Yv = Yvinput 
kap = kapinput 
Yu = Yuinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tv = Tvinput 
Tk = Tkinput 
Tu = Tuinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
ms2 = ms2input 
ms12 = ms12input 
ms22 = ms22input 
ms32 = ms32input 
mv2 = mv2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
M4 = M4input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
vS1 = vS1input 
vS2 = vS2input 
vS3 = vS3input 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,284,0._dp,tz,deltaM,dt,0._dp,rge284,kont)

End if 
Call GToParameters284(g1D,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,              & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZV = ZVinput 
ZVL = ZVLinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSv = MSvinput 
MSv2 = MSv2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
v = vinput 
End if 
cplAhSucSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSucSuT(gt1,gt2,gt3,lam,Yu,Tu,vd,vS,ZU,ZA,cplAhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSucSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSucSuT(gt1,gt2,gt3,g1,g2,gp,lam,Yu,Tu,vd,vu,vS,vS1,vS2,vS3,            & 
& ZU,ZH,cplhhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcHpmcSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingSdcHpmcSuT(gt1,gt2,gt3,g2,Yd,Td,lam,Yu,Tu,vd,vu,vS,ZD,ZU,ZP,             & 
& cplSdcHpmcSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcSucVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSdcSucVWmT(gt1,gt2,g2,ZD,ZU,cplSdcSucVWm(gt1,gt2))

 End Do 
End Do 


cplSucSuVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSucSuVZT(gt1,gt2,g1,g2,gp,ZU,TW,TWp,cplSucSuVZ(gt1,gt2))

 End Do 
End Do 


cplSucSuVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSucSuVZpT(gt1,gt2,g1,g2,gp,ZU,TW,TWp,cplSucSuVZp(gt1,gt2))

 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,gp,Yu,ZU,ZN,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)& 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFdcSuL = 0._dp 
cplcChaFdcSuR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFdcSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcChaFdcSuL(gt1,gt2,gt3)& 
& ,cplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFucSuL = 0._dp 
cplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFucSuT(gt2,gt3,g3,pG,ZU,ZUL,ZUR,cplGluFucSuL(gt2,gt3),cplGluFucSuR(gt2,gt3))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Su_decays_2B
 
Subroutine CouplingsFor_Se_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvinput,          & 
& MSv2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,pGinput,        & 
& TWinput,TWpinput,UMinput,UPinput,vinput,ZAinput,ZDinput,ZDLinput,ZDRinput,             & 
& ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,ZURinput,           & 
& ZVinput,ZVLinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,          & 
& gpinput,Ydinput,Yeinput,laminput,Yvinput,kapinput,Yuinput,Tdinput,Teinput,             & 
& Tlaminput,Tvinput,Tkinput,Tuinput,mq2input,ml2input,mHd2input,mHu2input,               & 
& md2input,mu2input,me2input,ms2input,ms12input,ms22input,ms32input,mv2input,            & 
& M1input,M2input,M3input,M4input,vdinput,vuinput,vSinput,vS1input,vS2input,             & 
& vS3input,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,cplChiFecSeL,cplChiFecSeR,               & 
& cplhhSecSe,cplHpmSvcSe,cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,gpinput,mHd2input,mHu2input,ms2input,ms12input,               & 
& ms22input,ms32input,vdinput,vuinput,vSinput,vS1input,vS2input,vS3input

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,Yvinput(3,3),kapinput,Yuinput(3,3),Tdinput(3,3),   & 
& Teinput(3,3),Tlaminput,Tvinput(3,3),Tkinput,Tuinput(3,3),mq2input(3,3),ml2input(3,3),  & 
& md2input(3,3),mu2input(3,3),me2input(3,3),mv2input(3,3),M1input,M2input,               & 
& M3input,M4input

Real(dp),Intent(in) :: MAhinput(6),MAh2input(6),MChainput(2),MCha2input(2),MChiinput(9),MChi2input(9),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(3),MFv2input(3),MGluinput,MGlu2input,Mhhinput(6),Mhh2input(6),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvinput(6),MSv2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,vinput,ZPinput(2,2),ZZinput(3,3),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),ZAinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZHinput(6,6),ZNinput(9,9),      & 
& ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZVinput(6,6),ZVLinput(3,3),ZVRinput(3,3),     & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp),Intent(out) :: cplAhSecSe(6,6,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplChiFecSeL(9,3,6),        & 
& cplChiFecSeR(9,3,6),cplhhSecSe(6,6,6),cplHpmSvcSe(2,6,6),cplSecSeVZ(6,6),              & 
& cplSecSeVZp(6,6),cplSvcSeVWm(6,6)

Real(dp) ::  g1D(284) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Se_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
gp = gpinput 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
Yv = Yvinput 
kap = kapinput 
Yu = Yuinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tv = Tvinput 
Tk = Tkinput 
Tu = Tuinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
ms2 = ms2input 
ms12 = ms12input 
ms22 = ms22input 
ms32 = ms32input 
mv2 = mv2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
M4 = M4input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
vS1 = vS1input 
vS2 = vS2input 
vS3 = vS3input 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,284,0._dp,tz,deltaM,dt,0._dp,rge284,kont)

End if 
Call GToParameters284(g1D,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,              & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZV = ZVinput 
ZVL = ZVLinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSv = MSvinput 
MSv2 = MSv2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
v = vinput 
End if 
cplAhSecSe = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSecSeT(gt1,gt2,gt3,Ye,Te,lam,vu,vS,ZE,ZA,cplAhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSecSe = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSecSeT(gt1,gt2,gt3,g1,g2,gp,Ye,Te,lam,vd,vu,vS,vS1,vS2,vS3,            & 
& ZE,ZH,cplhhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplHpmSvcSe = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingHpmSvcSeT(gt1,gt2,gt3,g2,Ye,Te,lam,Yv,Tv,vd,vu,vS,ZV,ZE,ZP,              & 
& cplHpmSvcSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSecSeVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSecSeVZT(gt1,gt2,g1,g2,gp,ZE,TW,TWp,cplSecSeVZ(gt1,gt2))

 End Do 
End Do 


cplSecSeVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSecSeVZpT(gt1,gt2,g1,g2,gp,ZE,TW,TWp,cplSecSeVZp(gt1,gt2))

 End Do 
End Do 


cplSvcSeVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSvcSeVWmT(gt1,gt2,g2,ZV,ZE,cplSvcSeVWm(gt1,gt2))

 End Do 
End Do 


cplChaFvcSeL = 0._dp 
cplChaFvcSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFvcSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,ZVL,ZVR,UM,UP,cplChaFvcSeL(gt1,gt2,gt3)& 
& ,cplChaFvcSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFecSeL = 0._dp 
cplChiFecSeR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFecSeT(gt1,gt2,gt3,g1,g2,gp,Ye,ZE,ZN,ZEL,ZER,cplChiFecSeL(gt1,gt2,gt3)& 
& ,cplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Se_decays_2B
 
Subroutine CouplingsFor_Sv_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvinput,          & 
& MSv2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,pGinput,        & 
& TWinput,TWpinput,UMinput,UPinput,vinput,ZAinput,ZDinput,ZDLinput,ZDRinput,             & 
& ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,ZURinput,           & 
& ZVinput,ZVLinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,          & 
& gpinput,Ydinput,Yeinput,laminput,Yvinput,kapinput,Yuinput,Tdinput,Teinput,             & 
& Tlaminput,Tvinput,Tkinput,Tuinput,mq2input,ml2input,mHd2input,mHu2input,               & 
& md2input,mu2input,me2input,ms2input,ms12input,ms22input,ms32input,mv2input,            & 
& M1input,M2input,M3input,M4input,vdinput,vuinput,vSinput,vS1input,vS2input,             & 
& vS3input,cplAhSvcSv,cplChiFvcSvL,cplChiFvcSvR,cplcChaFecSvL,cplcChaFecSvR,             & 
& cplhhSvcSv,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,gpinput,mHd2input,mHu2input,ms2input,ms12input,               & 
& ms22input,ms32input,vdinput,vuinput,vSinput,vS1input,vS2input,vS3input

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,Yvinput(3,3),kapinput,Yuinput(3,3),Tdinput(3,3),   & 
& Teinput(3,3),Tlaminput,Tvinput(3,3),Tkinput,Tuinput(3,3),mq2input(3,3),ml2input(3,3),  & 
& md2input(3,3),mu2input(3,3),me2input(3,3),mv2input(3,3),M1input,M2input,               & 
& M3input,M4input

Real(dp),Intent(in) :: MAhinput(6),MAh2input(6),MChainput(2),MCha2input(2),MChiinput(9),MChi2input(9),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(3),MFv2input(3),MGluinput,MGlu2input,Mhhinput(6),Mhh2input(6),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvinput(6),MSv2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,vinput,ZPinput(2,2),ZZinput(3,3),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),ZAinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZHinput(6,6),ZNinput(9,9),      & 
& ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZVinput(6,6),ZVLinput(3,3),ZVRinput(3,3),     & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp),Intent(out) :: cplAhSvcSv(6,6,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),cplcChaFecSvL(2,3,6),       & 
& cplcChaFecSvR(2,3,6),cplhhSvcSv(6,6,6),cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),          & 
& cplSvcSvVZ(6,6),cplSvcSvVZp(6,6)

Real(dp) ::  g1D(284) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Sv_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
gp = gpinput 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
Yv = Yvinput 
kap = kapinput 
Yu = Yuinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tv = Tvinput 
Tk = Tkinput 
Tu = Tuinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
ms2 = ms2input 
ms12 = ms12input 
ms22 = ms22input 
ms32 = ms32input 
mv2 = mv2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
M4 = M4input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
vS1 = vS1input 
vS2 = vS2input 
vS3 = vS3input 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,284,0._dp,tz,deltaM,dt,0._dp,rge284,kont)

End if 
Call GToParameters284(g1D,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,              & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZV = ZVinput 
ZVL = ZVLinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSv = MSvinput 
MSv2 = MSv2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
v = vinput 
End if 
cplAhSvcSv = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSvcSvT(gt1,gt2,gt3,lam,Yv,Tv,vd,vS,ZV,ZA,cplAhSvcSv(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSvcSv = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSvcSvT(gt1,gt2,gt3,g1,g2,gp,lam,Yv,Tv,vd,vu,vS,vS1,vS2,vS3,            & 
& ZV,ZH,cplhhSvcSv(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSecHpmcSv = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingSecHpmcSvT(gt1,gt2,gt3,g2,Ye,Te,lam,Yv,Tv,vd,vu,vS,ZV,ZE,ZP,             & 
& cplSecHpmcSv(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSecSvcVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSecSvcVWmT(gt1,gt2,g2,ZV,ZE,cplSecSvcVWm(gt1,gt2))

 End Do 
End Do 


cplSvcSvVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSvcSvVZT(gt1,gt2,g1,g2,gp,ZV,TW,TWp,cplSvcSvVZ(gt1,gt2))

 End Do 
End Do 


cplSvcSvVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSvcSvVZpT(gt1,gt2,g1,g2,gp,ZV,TW,TWp,cplSvcSvVZp(gt1,gt2))

 End Do 
End Do 


cplChiFvcSvL = 0._dp 
cplChiFvcSvR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFvcSvT(gt1,gt2,gt3,g1,g2,gp,Yv,ZV,ZN,ZVL,ZVR,cplChiFvcSvL(gt1,gt2,gt3)& 
& ,cplChiFvcSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFecSvL = 0._dp 
cplcChaFecSvR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFecSvT(gt1,gt2,gt3,g2,Ye,Yv,ZV,UM,UP,ZEL,ZER,cplcChaFecSvL(gt1,gt2,gt3)& 
& ,cplcChaFecSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Sv_decays_2B
 
Subroutine CouplingsFor_hh_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvinput,          & 
& MSv2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,pGinput,        & 
& TWinput,TWpinput,UMinput,UPinput,vinput,ZAinput,ZDinput,ZDLinput,ZDRinput,             & 
& ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,ZURinput,           & 
& ZVinput,ZVLinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,          & 
& gpinput,Ydinput,Yeinput,laminput,Yvinput,kapinput,Yuinput,Tdinput,Teinput,             & 
& Tlaminput,Tvinput,Tkinput,Tuinput,mq2input,ml2input,mHd2input,mHu2input,               & 
& md2input,mu2input,me2input,ms2input,ms12input,ms22input,ms32input,mv2input,            & 
& M1input,M2input,M3input,M4input,vdinput,vuinput,vSinput,vS1input,vS2input,             & 
& vS3input,cplHiggsPP,cplHiggsGG,cplHiggsZZvirt,cplHiggsWWvirt,cplAhAhhh,cplAhhhhh,      & 
& cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,            & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFvFvhhL,cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,     & 
& cplhhSucSu,cplhhSvcSv,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,gpinput,mHd2input,mHu2input,ms2input,ms12input,               & 
& ms22input,ms32input,vdinput,vuinput,vSinput,vS1input,vS2input,vS3input

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,Yvinput(3,3),kapinput,Yuinput(3,3),Tdinput(3,3),   & 
& Teinput(3,3),Tlaminput,Tvinput(3,3),Tkinput,Tuinput(3,3),mq2input(3,3),ml2input(3,3),  & 
& md2input(3,3),mu2input(3,3),me2input(3,3),mv2input(3,3),M1input,M2input,               & 
& M3input,M4input

Real(dp),Intent(in) :: MAhinput(6),MAh2input(6),MChainput(2),MCha2input(2),MChiinput(9),MChi2input(9),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(3),MFv2input(3),MGluinput,MGlu2input,Mhhinput(6),Mhh2input(6),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvinput(6),MSv2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,vinput,ZPinput(2,2),ZZinput(3,3),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),ZAinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZHinput(6,6),ZNinput(9,9),      & 
& ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZVinput(6,6),ZVLinput(3,3),ZVRinput(3,3),     & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp),Intent(out) :: cplHiggsPP(6),cplHiggsGG(6),cplHiggsZZvirt(6),cplHiggsWWvirt(6),cplAhAhhh(6,6,6),     & 
& cplAhhhhh(6,6,6),cplAhhhVZ(6,6),cplAhhhVZp(6,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),& 
& cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),cplcFdFdhhL(3,3,6),cplcFdFdhhR(3,3,6),         & 
& cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),cplcFuFuhhL(3,3,6),cplcFuFuhhR(3,3,6),           & 
& cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),cplhhhhhh(6,6,6),cplhhHpmcHpm(6,2,2),            & 
& cplhhHpmcVWm(6,2),cplhhSdcSd(6,6,6),cplhhSecSe(6,6,6),cplhhSucSu(6,6,6),               & 
& cplhhSvcSv(6,6,6),cplhhcVWmVWm(6),cplhhVZVZ(6),cplhhVZVZp(6),cplhhVZpVZp(6)

Real(dp) ::  g1D(284) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Complex(dp) :: ratCha(2),ratFd(3),ratFe(3),ratFu(3),ratHpm(2),ratSd(6),ratSe(6),ratSu(6),ratVWm

Complex(dp) :: ratPCha(2),ratPFd(3),ratPFe(3),ratPFu(3),ratPHpm(2),ratPSd(6),ratPSe(6),              & 
& ratPSu(6),ratPVWm

Complex(dp) :: coup 
Real(dp) :: vev, gNLO, NLOqcd, NNLOqcd, NNNLOqcd, AlphaSQ, AlphaSQhlf 
Real(dp) :: g1SM,g2SM,g3SM,vSM
Complex(dp) ::YuSM(3,3),YdSM(3,3),YeSM(3,3)
Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_hh_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
gp = gpinput 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
Yv = Yvinput 
kap = kapinput 
Yu = Yuinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tv = Tvinput 
Tk = Tkinput 
Tu = Tuinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
ms2 = ms2input 
ms12 = ms12input 
ms22 = ms22input 
ms32 = ms32input 
mv2 = mv2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
M4 = M4input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
vS1 = vS1input 
vS2 = vS2input 
vS3 = vS3input 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,284,0._dp,tz,deltaM,dt,0._dp,rge284,kont)

End if 
Call GToParameters284(g1D,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,              & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
If (m_in.le.Qin) Then 
  If (m_in.le.mz) Then 
    Call RunSM(mz,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  Else 
    Call RunSM(m_in,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  End if 
End if 
! Run always SM gauge couplings if present 
! alphaS(mH/2) for NLO corrections to diphoton rate 
Call RunSMgauge(m_in/2._dp,deltaM, g1,g2,g3) 
AlphaSQhlf=g3**2/(4._dp*Pi) 
! alphaS(mH) for digluon rate 
Call RunSMgauge(m_in,deltaM, g1,g2,g3) 
AlphaSQ=g3**2/(4._dp*Pi) 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZV = ZVinput 
ZVL = ZVLinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
cplAhAhhh = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhAhhhT(gt1,gt2,gt3,g1,g2,gp,lam,Tlam,kap,Tk,vd,vu,vS,vS1,               & 
& vS2,vS3,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhhh = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhhhhhT(gt1,gt2,gt3,lam,Tlam,kap,Tk,ZH,ZA,cplAhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhhhhhT(gt1,gt2,gt3,g1,g2,gp,lam,Tlam,kap,Tk,vd,vu,vS,vS1,               & 
& vS2,vS3,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpmcHpm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhHpmcHpmT(gt1,gt2,gt3,g1,g2,gp,lam,Tlam,vd,vu,vS,vS1,vS2,               & 
& vS3,ZH,ZP,cplhhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSdcSd = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSdcSdT(gt1,gt2,gt3,g1,g2,gp,Yd,Td,lam,vd,vu,vS,vS1,vS2,vS3,            & 
& ZD,ZH,cplhhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSecSe = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSecSeT(gt1,gt2,gt3,g1,g2,gp,Ye,Te,lam,vd,vu,vS,vS1,vS2,vS3,            & 
& ZE,ZH,cplhhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSucSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSucSuT(gt1,gt2,gt3,g1,g2,gp,lam,Yu,Tu,vd,vu,vS,vS1,vS2,vS3,            & 
& ZU,ZH,cplhhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSvcSv = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSvcSvT(gt1,gt2,gt3,g1,g2,gp,lam,Yv,Tv,vd,vu,vS,vS1,vS2,vS3,            & 
& ZV,ZH,cplhhSvcSv(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingAhhhVZT(gt1,gt2,g1,g2,gp,ZH,ZA,TW,TWp,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhhhVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingAhhhVZpT(gt1,gt2,g1,g2,gp,ZH,ZA,TW,TWp,cplAhhhVZp(gt1,gt2))

 End Do 
End Do 


cplhhHpmcVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
Call CouplinghhHpmcVWmT(gt1,gt2,g2,ZH,ZP,cplhhHpmcVWm(gt1,gt2))

 End Do 
End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 6
Call CouplinghhcVWmVWmT(gt1,g2,vd,vu,ZH,cplhhcVWmVWm(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 6
Call CouplinghhVZVZT(gt1,g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,ZH,TW,TWp,cplhhVZVZ(gt1))

End Do 


cplhhVZVZp = 0._dp 
Do gt1 = 1, 6
Call CouplinghhVZVZpT(gt1,g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,ZH,TW,TWp,cplhhVZVZp(gt1))

End Do 


cplhhVZpVZp = 0._dp 
Do gt1 = 1, 6
Call CouplinghhVZpVZpT(gt1,g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,ZH,TW,TWp,cplhhVZpVZp(gt1))

End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)   & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFvhhL = 0._dp 
cplcFvFvhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFvFvhhT(gt1,gt2,gt3,Yv,ZH,ZVL,ZVR,cplcFvFvhhL(gt1,gt2,gt3)              & 
& ,cplcFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


vev = Sqrt(vd**2 + vu**2)
cplHiggsWWvirt = cplhhcVWmVWm/vev 
cplHiggsZZvirt = cplhhVZVZ*Sqrt(7._dp/12._dp-10._dp/9._dp*Sin(TW)**2+40._dp/27._dp*Sin(TW)**4)/vev 
 

!----------------------------------------------------
! Coupling ratios for HiggsBounds 
!----------------------------------------------------
 
rHB_S_VZ(i1) = Abs(-0.5_dp*cplhhVZVZ(i1)*vev/MVZ2) 
rHB_S_VWm(i1) = Abs(-0.5_dp*cplhhcVWmVWm(i1)*vev/MVWm2) 
Do i2=1, 3
rHB_S_S_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)+cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
rHB_S_P_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)-cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
End Do 
Do i2=1, 3
rHB_S_S_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)+cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
rHB_S_P_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)-cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
End Do 
Do i2=1, 3
rHB_S_S_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2,i1)+cplcFeFehhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
rHB_S_P_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2,i1)-cplcFeFehhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
End Do 
Do i2=1, 3
rHB_S_S_Fv(i1,i2) = Abs((cplcFvFvhhL(i2,i2,i1)+cplcFvFvhhR(i2,i2,i1))*vev/(2._dp*MFv(i2))) 
rHB_S_P_Fv(i1,i2) = Abs((cplcFvFvhhL(i2,i2,i1)-cplcFvFvhhR(i2,i2,i1))*vev/(2._dp*MFv(i2))) 
End Do 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSv = MSvinput 
MSv2 = MSv2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
v = vinput 
End if 
!----------------------------------------------------
! Scalar Higgs coupling ratios 
!----------------------------------------------------
 
Do i2=1, 2
ratCha(i2) = cplcChaChahhL(i2,i2,i1)*1._dp*vev/MCha(i2) 
End Do 
Do i2=1, 3
ratFd(i2) = cplcFdFdhhL(i2,i2,i1)*1._dp*vev/MFd(i2) 
End Do 
Do i2=1, 3
ratFe(i2) = cplcFeFehhL(i2,i2,i1)*1._dp*vev/MFe(i2) 
End Do 
Do i2=1, 3
ratFu(i2) = cplcFuFuhhL(i2,i2,i1)*1._dp*vev/MFu(i2) 
End Do 
Do i2=1, 2
ratHpm(i2) = 0.5_dp*cplhhHpmcHpm(i1,i2,i2)*vev/MHpm2(i2) 
End Do 
Do i2=1, 6
ratSd(i2) = 0.5_dp*cplhhSdcSd(i1,i2,i2)*vev/MSd2(i2) 
End Do 
Do i2=1, 6
ratSe(i2) = 0.5_dp*cplhhSecSe(i1,i2,i2)*vev/MSe2(i2) 
End Do 
Do i2=1, 6
ratSu(i2) = 0.5_dp*cplhhSucSu(i1,i2,i2)*vev/MSu2(i2) 
End Do 
ratVWm = -0.5_dp*cplhhcVWmVWm(i1)*vev/MVWm2 
If (HigherOrderDiboson) Then 
  gNLO = Sqrt(AlphaSQhlf*4._dp*Pi) 
Else  
  gNLO = -1._dp 
End if 
Call CoupHiggsToPhoton(m_in,i1,ratCha,ratFd,ratFe,ratFu,ratHpm,ratSd,ratSe,           & 
& ratSu,ratVWm,MCha,MFd,MFe,MFu,MHpm,MSd,MSe,MSu,MVWm,gNLO,coup)

cplHiggsPP(i1) = coup*Alpha 
CoupHPP(i1) = coup 
Call CoupHiggsToPhotonSM(m_in,MCha,MFd,MFe,MFu,MHpm,MSd,MSe,MSu,MVWm,gNLO,coup)

ratioPP(i1) = Abs(cplHiggsPP(i1)/(coup*Alpha)) 
  gNLO = -1._dp 
Call CoupHiggsToGluon(m_in,i1,ratFd,ratFu,ratSd,ratSu,MFd,MFu,MSd,MSu,gNLO,coup)

cplHiggsGG(i1) = coup*AlphaSQ 
CoupHGG(i1) = coup 
Call CoupHiggsToGluonSM(m_in,MFd,MFu,MSd,MSu,gNLO,coup)

If (HigherOrderDiboson) Then 
  NLOqcd = 12._dp*oo48pi2*(95._dp/4._dp - 7._dp/6._dp*NFlav(m_in))*g3**2 
  NNLOqcd = 0.0005785973353112832_dp*(410.52103034222284_dp - 52.326413200014684_dp*NFlav(m_in)+NFlav(m_in)**2 & 
 & +(2.6337085360233763_dp +0.7392866066030529_dp *NFlav(m_in))*Log(m_in**2/mf_u(3)**2))*g3**4 
  NNNLOqcd = 0.00017781840290519607_dp*(42.74607514668917_dp + 11.191050460173795_dp*Log(m_in**2/mf_u(3)**2) + Log(m_in**2/mf_u(3)**2)**2)*g3**6 
Else 
  NLOqcd = 0._dp 
  NNLOqcd = 0._dp 
  NNNLOqcd = 0._dp 
End if 
coup = coup*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
cplHiggsGG(i1) = cplHiggsGG(i1)*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
CoupHGG(i1)=cplHiggsGG(i1) 
ratioGG(i1) = Abs(cplHiggsGG(i1)/(coup*AlphaSQ)) 
If (i1.eq.1) Then 
CPL_A_H_Z = Abs(cplAhhhVZ**2/(g2**2/(cos(TW)**2*4._dp)))
CPL_H_H_Z = 0._dp 
End if 
cplAhAhhh = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhAhhhT(gt1,gt2,gt3,g1,g2,gp,lam,Tlam,kap,Tk,vd,vu,vS,vS1,               & 
& vS2,vS3,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhhh = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhhhhhT(gt1,gt2,gt3,lam,Tlam,kap,Tk,ZH,ZA,cplAhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhhhhhT(gt1,gt2,gt3,g1,g2,gp,lam,Tlam,kap,Tk,vd,vu,vS,vS1,               & 
& vS2,vS3,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpmcHpm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhHpmcHpmT(gt1,gt2,gt3,g1,g2,gp,lam,Tlam,vd,vu,vS,vS1,vS2,               & 
& vS3,ZH,ZP,cplhhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSdcSd = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSdcSdT(gt1,gt2,gt3,g1,g2,gp,Yd,Td,lam,vd,vu,vS,vS1,vS2,vS3,            & 
& ZD,ZH,cplhhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSecSe = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSecSeT(gt1,gt2,gt3,g1,g2,gp,Ye,Te,lam,vd,vu,vS,vS1,vS2,vS3,            & 
& ZE,ZH,cplhhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSucSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSucSuT(gt1,gt2,gt3,g1,g2,gp,lam,Yu,Tu,vd,vu,vS,vS1,vS2,vS3,            & 
& ZU,ZH,cplhhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSvcSv = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSvcSvT(gt1,gt2,gt3,g1,g2,gp,lam,Yv,Tv,vd,vu,vS,vS1,vS2,vS3,            & 
& ZV,ZH,cplhhSvcSv(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingAhhhVZT(gt1,gt2,g1,g2,gp,ZH,ZA,TW,TWp,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhhhVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingAhhhVZpT(gt1,gt2,g1,g2,gp,ZH,ZA,TW,TWp,cplAhhhVZp(gt1,gt2))

 End Do 
End Do 


cplhhHpmcVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
Call CouplinghhHpmcVWmT(gt1,gt2,g2,ZH,ZP,cplhhHpmcVWm(gt1,gt2))

 End Do 
End Do 


cplhhcVWmVWm = 0._dp 
Do gt1 = 1, 6
Call CouplinghhcVWmVWmT(gt1,g2,vd,vu,ZH,cplhhcVWmVWm(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 6
Call CouplinghhVZVZT(gt1,g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,ZH,TW,TWp,cplhhVZVZ(gt1))

End Do 


cplhhVZVZp = 0._dp 
Do gt1 = 1, 6
Call CouplinghhVZVZpT(gt1,g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,ZH,TW,TWp,cplhhVZVZp(gt1))

End Do 


cplhhVZpVZp = 0._dp 
Do gt1 = 1, 6
Call CouplinghhVZpVZpT(gt1,g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,ZH,TW,TWp,cplhhVZpVZp(gt1))

End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)   & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFvhhL = 0._dp 
cplcFvFvhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFvFvhhT(gt1,gt2,gt3,Yv,ZH,ZVL,ZVR,cplcFvFvhhL(gt1,gt2,gt3)              & 
& ,cplcFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_hh_decays_2B
 
Subroutine CouplingsFor_Ah_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvinput,          & 
& MSv2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,pGinput,        & 
& TWinput,TWpinput,UMinput,UPinput,vinput,ZAinput,ZDinput,ZDLinput,ZDRinput,             & 
& ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,ZURinput,           & 
& ZVinput,ZVLinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,          & 
& gpinput,Ydinput,Yeinput,laminput,Yvinput,kapinput,Yuinput,Tdinput,Teinput,             & 
& Tlaminput,Tvinput,Tkinput,Tuinput,mq2input,ml2input,mHd2input,mHu2input,               & 
& md2input,mu2input,me2input,ms2input,ms12input,ms22input,ms32input,mv2input,            & 
& M1input,M2input,M3input,M4input,vdinput,vuinput,vSinput,vS1input,vS2input,             & 
& vS3input,cplPseudoHiggsPP,cplPseudoHiggsGG,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,       & 
& cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,gpinput,mHd2input,mHu2input,ms2input,ms12input,               & 
& ms22input,ms32input,vdinput,vuinput,vSinput,vS1input,vS2input,vS3input

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,Yvinput(3,3),kapinput,Yuinput(3,3),Tdinput(3,3),   & 
& Teinput(3,3),Tlaminput,Tvinput(3,3),Tkinput,Tuinput(3,3),mq2input(3,3),ml2input(3,3),  & 
& md2input(3,3),mu2input(3,3),me2input(3,3),mv2input(3,3),M1input,M2input,               & 
& M3input,M4input

Real(dp),Intent(in) :: MAhinput(6),MAh2input(6),MChainput(2),MCha2input(2),MChiinput(9),MChi2input(9),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(3),MFv2input(3),MGluinput,MGlu2input,Mhhinput(6),Mhh2input(6),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvinput(6),MSv2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,vinput,ZPinput(2,2),ZZinput(3,3),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),ZAinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZHinput(6,6),ZNinput(9,9),      & 
& ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZVinput(6,6),ZVLinput(3,3),ZVRinput(3,3),     & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp),Intent(out) :: cplPseudoHiggsPP(6),cplPseudoHiggsGG(6),cplAhAhAh(6,6,6),cplAhAhhh(6,6,6),            & 
& cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),     & 
& cplcFdFdAhL(3,3,6),cplcFdFdAhR(3,3,6),cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6),           & 
& cplcFuFuAhL(3,3,6),cplcFuFuAhR(3,3,6),cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),           & 
& cplAhhhhh(6,6,6),cplAhhhVZ(6,6),cplAhhhVZp(6,6),cplAhHpmcHpm(6,2,2),cplAhHpmcVWm(6,2), & 
& cplAhSdcSd(6,6,6),cplAhSecSe(6,6,6),cplAhSucSu(6,6,6),cplAhSvcSv(6,6,6)

Real(dp) ::  g1D(284) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Complex(dp) :: ratCha(2),ratFd(3),ratFe(3),ratFu(3),ratHpm(2),ratSd(6),ratSe(6),ratSu(6),ratVWm

Complex(dp) :: ratPCha(2),ratPFd(3),ratPFe(3),ratPFu(3),ratPHpm(2),ratPSd(6),ratPSe(6),              & 
& ratPSu(6),ratPVWm

Complex(dp) :: coup 
Real(dp) :: vev, gNLO, NLOqcd, NNLOqcd, NNNLOqcd, AlphaSQ, AlphaSQhlf 
Real(dp) :: g1SM,g2SM,g3SM,vSM
Complex(dp) ::YuSM(3,3),YdSM(3,3),YeSM(3,3)
Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Ah_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
gp = gpinput 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
Yv = Yvinput 
kap = kapinput 
Yu = Yuinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tv = Tvinput 
Tk = Tkinput 
Tu = Tuinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
ms2 = ms2input 
ms12 = ms12input 
ms22 = ms22input 
ms32 = ms32input 
mv2 = mv2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
M4 = M4input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
vS1 = vS1input 
vS2 = vS2input 
vS3 = vS3input 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,284,0._dp,tz,deltaM,dt,0._dp,rge284,kont)

End if 
Call GToParameters284(g1D,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,              & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
If (m_in.le.Qin) Then 
  If (m_in.le.mz) Then 
    Call RunSM(mz,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  Else 
    Call RunSM(m_in,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  End if 
End if 
! Run always SM gauge couplings if present 
! alphaS(mH/2) for NLO corrections to diphoton rate 
Call RunSMgauge(m_in/2._dp,deltaM, g1,g2,g3) 
AlphaSQhlf=g3**2/(4._dp*Pi) 
! alphaS(mH) for digluon rate 
Call RunSMgauge(m_in,deltaM, g1,g2,g3) 
AlphaSQ=g3**2/(4._dp*Pi) 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZV = ZVinput 
ZVL = ZVLinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
cplAhAhAh = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhAhAhT(gt1,gt2,gt3,lam,Tlam,kap,Tk,ZA,cplAhAhAh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhAhhh = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhAhhhT(gt1,gt2,gt3,g1,g2,gp,lam,Tlam,kap,Tk,vd,vu,vS,vS1,               & 
& vS2,vS3,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhhh = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhhhhhT(gt1,gt2,gt3,lam,Tlam,kap,Tk,ZH,ZA,cplAhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhHpmcHpm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhHpmcHpmT(gt1,gt2,gt3,g2,lam,Tlam,vd,vu,ZA,ZP,cplAhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSdcSd = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSdcSdT(gt1,gt2,gt3,Yd,Td,lam,vu,vS,ZD,ZA,cplAhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSecSe = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSecSeT(gt1,gt2,gt3,Ye,Te,lam,vu,vS,ZE,ZA,cplAhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSucSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSucSuT(gt1,gt2,gt3,lam,Yu,Tu,vd,vS,ZU,ZA,cplAhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSvcSv = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSvcSvT(gt1,gt2,gt3,lam,Yv,Tv,vd,vS,ZV,ZA,cplAhSvcSv(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingAhhhVZT(gt1,gt2,g1,g2,gp,ZH,ZA,TW,TWp,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhhhVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingAhhhVZpT(gt1,gt2,g1,g2,gp,ZH,ZA,TW,TWp,cplAhhhVZp(gt1,gt2))

 End Do 
End Do 


cplAhHpmcVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
Call CouplingAhHpmcVWmT(gt1,gt2,g2,ZA,ZP,cplAhHpmcVWm(gt1,gt2))

 End Do 
End Do 


cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)   & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFvAhL = 0._dp 
cplcFvFvAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFvFvAhT(gt1,gt2,gt3,Yv,ZA,ZVL,ZVR,cplcFvFvAhL(gt1,gt2,gt3)              & 
& ,cplcFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


vev = Sqrt(vd**2 + vu**2)
!----------------------------------------------------
! Coupling ratios for HiggsBounds 
!----------------------------------------------------
 
Do i2=1, 3
rHB_P_S_Fd(i1,i2) = 1._dp*Abs((cplcFdFdAhL(i2,i2,i1)+cplcFdFdAhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
rHB_P_P_Fd(i1,i2) = 1._dp*Abs((cplcFdFdAhL(i2,i2,i1)-cplcFdFdAhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
End Do 
Do i2=1, 3
rHB_P_S_Fu(i1,i2) = 1._dp*Abs((cplcFuFuAhL(i2,i2,i1)+cplcFuFuAhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
rHB_P_P_Fu(i1,i2) = 1._dp*Abs((cplcFuFuAhL(i2,i2,i1)-cplcFuFuAhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
End Do 
Do i2=1, 3
rHB_P_S_Fe(i1,i2) = 1._dp*Abs((cplcFeFeAhL(i2,i2,i1)+cplcFeFeAhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
rHB_P_P_Fe(i1,i2) = 1._dp*Abs((cplcFeFeAhL(i2,i2,i1)-cplcFeFeAhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
End Do 
Do i2=1, 3
rHB_P_S_Fv(i1,i2) = 1._dp*Abs((cplcFvFvAhL(i2,i2,i1)+cplcFvFvAhR(i2,i2,i1))*vev/(2._dp*MFv(i2))) 
rHB_P_P_Fv(i1,i2) = 1._dp*Abs((cplcFvFvAhL(i2,i2,i1)-cplcFvFvAhR(i2,i2,i1))*vev/(2._dp*MFv(i2))) 
End Do 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSv = MSvinput 
MSv2 = MSv2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
v = vinput 
End if 
!----------------------------------------------------
! Pseudo Scalar Higgs coupling ratios 
!----------------------------------------------------
 
Do i2=1, 2
ratPCha(i2) = cplcChaChaAhL(i2,i2,i1)*1._dp*vev/MCha(i2) 
End Do 
Do i2=1, 3
ratPFd(i2) = cplcFdFdAhL(i2,i2,i1)*1._dp*vev/MFd(i2) 
End Do 
Do i2=1, 3
ratPFe(i2) = cplcFeFeAhL(i2,i2,i1)*1._dp*vev/MFe(i2) 
End Do 
Do i2=1, 3
ratPFu(i2) = cplcFuFuAhL(i2,i2,i1)*1._dp*vev/MFu(i2) 
End Do 
Do i2=1, 2
ratPHpm(i2) = 0.5_dp*cplAhHpmcHpm(i1,i2,i2)*vev/MHpm2(i2) 
End Do 
Do i2=1, 6
ratPSd(i2) = 0.5_dp*cplAhSdcSd(i1,i2,i2)*vev/MSd2(i2) 
End Do 
Do i2=1, 6
ratPSe(i2) = 0.5_dp*cplAhSecSe(i1,i2,i2)*vev/MSe2(i2) 
End Do 
Do i2=1, 6
ratPSu(i2) = 0.5_dp*cplAhSucSu(i1,i2,i2)*vev/MSu2(i2) 
End Do 
ratPVWm = 0._dp 
If (HigherOrderDiboson) Then 
  gNLO = g3 
Else  
  gNLO = -1._dp 
End if 
Call CoupPseudoHiggsToPhoton(m_in,i1,ratPCha,ratPFd,ratPFe,ratPFu,ratPHpm,            & 
& ratPSd,ratPSe,ratPSu,ratPVWm,MCha,MFd,MFe,MFu,MHpm,MSd,MSe,MSu,MVWm,gNLO,coup)

cplPseudoHiggsPP(i1) = 2._dp*coup*Alpha 
CoupAPP(i1) = 2._dp*coup 
Call CoupHiggsToPhotonSM(m_in,MCha,MFd,MFe,MFu,MHpm,MSd,MSe,MSu,MVWm,gNLO,coup)

ratioPPP(i1) = Abs(cplPseudoHiggsPP(i1)/(coup*oo4pi*(1._dp-mW2/mZ2)*g2**2)) 
  gNLO = -1._dp 
Call CoupPseudoHiggsToGluon(m_in,i1,ratPFd,ratPFu,ratPSd,ratPSu,MFd,MFu,              & 
& MSd,MSu,gNLO,coup)

If (HigherOrderDiboson) Then 
  NLOqcd = 12._dp*oo48pi2*(97._dp/4._dp - 7._dp/6._dp*NFlav(m_in))*g3**2 
  NNLOqcd = (171.544_dp +  5._dp*Log(m_in**2/mf_u(3)**2))*g3**4/(4._dp*Pi**2)**2 
  NNNLOqcd = 0._dp 
Else 
  NLOqcd = 0._dp 
  NNLOqcd = 0._dp 
  NNNLOqcd = 0._dp 
End if 
cplPseudoHiggsGG(i1) = 2._dp*coup*AlphaSQ*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
CoupAGG(i1) = 2._dp*coup*AlphaSQ*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
Call CoupHiggsToGluonSM(m_in,MFd,MFu,MSd,MSu,gNLO,coup)

coup = coup*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
ratioPGG(i1) = Abs(cplPseudoHiggsGG(i1)/(coup*AlphaSQ)) 

If (i1.eq.3) Then 
CPL_A_A_Z = 0._dp 
End if 
cplAhAhAh = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhAhAhT(gt1,gt2,gt3,lam,Tlam,kap,Tk,ZA,cplAhAhAh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhAhhh = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhAhhhT(gt1,gt2,gt3,g1,g2,gp,lam,Tlam,kap,Tk,vd,vu,vS,vS1,               & 
& vS2,vS3,ZH,ZA,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhhh = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhhhhhT(gt1,gt2,gt3,lam,Tlam,kap,Tk,ZH,ZA,cplAhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhHpmcHpm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhHpmcHpmT(gt1,gt2,gt3,g2,lam,Tlam,vd,vu,ZA,ZP,cplAhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSdcSd = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSdcSdT(gt1,gt2,gt3,Yd,Td,lam,vu,vS,ZD,ZA,cplAhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSecSe = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSecSeT(gt1,gt2,gt3,Ye,Te,lam,vu,vS,ZE,ZA,cplAhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSucSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSucSuT(gt1,gt2,gt3,lam,Yu,Tu,vd,vS,ZU,ZA,cplAhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhSvcSv = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSvcSvT(gt1,gt2,gt3,lam,Yv,Tv,vd,vS,ZV,ZA,cplAhSvcSv(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingAhhhVZT(gt1,gt2,g1,g2,gp,ZH,ZA,TW,TWp,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhhhVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingAhhhVZpT(gt1,gt2,g1,g2,gp,ZH,ZA,TW,TWp,cplAhhhVZp(gt1,gt2))

 End Do 
End Do 


cplAhHpmcVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
Call CouplingAhHpmcVWmT(gt1,gt2,g2,ZA,ZP,cplAhHpmcVWm(gt1,gt2))

 End Do 
End Do 


cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)   & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFvAhL = 0._dp 
cplcFvFvAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFvFvAhT(gt1,gt2,gt3,Yv,ZA,ZVL,ZVR,cplcFvFvAhL(gt1,gt2,gt3)              & 
& ,cplcFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Ah_decays_2B
 
Subroutine CouplingsFor_Hpm_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvinput,          & 
& MSv2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,pGinput,        & 
& TWinput,TWpinput,UMinput,UPinput,vinput,ZAinput,ZDinput,ZDLinput,ZDRinput,             & 
& ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,ZURinput,           & 
& ZVinput,ZVLinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,          & 
& gpinput,Ydinput,Yeinput,laminput,Yvinput,kapinput,Yuinput,Tdinput,Teinput,             & 
& Tlaminput,Tvinput,Tkinput,Tuinput,mq2input,ml2input,mHd2input,mHu2input,               & 
& md2input,mu2input,me2input,ms2input,ms12input,ms22input,ms32input,mv2input,            & 
& M1input,M2input,M3input,M4input,vdinput,vuinput,vSinput,vS1input,vS2input,             & 
& vS3input,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplcFuFdcHpmL,        & 
& cplcFuFdcHpmR,cplcFvFecHpmL,cplcFvFecHpmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVZ,      & 
& cplHpmcHpmVZp,cplSdcHpmcSu,cplSecHpmcSv,cplcHpmVWmVZ,cplcHpmVWmVZp,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,gpinput,mHd2input,mHu2input,ms2input,ms12input,               & 
& ms22input,ms32input,vdinput,vuinput,vSinput,vS1input,vS2input,vS3input

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,Yvinput(3,3),kapinput,Yuinput(3,3),Tdinput(3,3),   & 
& Teinput(3,3),Tlaminput,Tvinput(3,3),Tkinput,Tuinput(3,3),mq2input(3,3),ml2input(3,3),  & 
& md2input(3,3),mu2input(3,3),me2input(3,3),mv2input(3,3),M1input,M2input,               & 
& M3input,M4input

Real(dp),Intent(in) :: MAhinput(6),MAh2input(6),MChainput(2),MCha2input(2),MChiinput(9),MChi2input(9),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(3),MFv2input(3),MGluinput,MGlu2input,Mhhinput(6),Mhh2input(6),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvinput(6),MSv2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,vinput,ZPinput(2,2),ZZinput(3,3),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),ZAinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZHinput(6,6),ZNinput(9,9),      & 
& ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZVinput(6,6),ZVLinput(3,3),ZVRinput(3,3),     & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp),Intent(out) :: cplAhHpmcHpm(6,2,2),cplAhcHpmVWm(6,2),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),    & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFvFecHpmL(3,3,2),cplcFvFecHpmR(3,3,2),   & 
& cplhhHpmcHpm(6,2,2),cplhhcHpmVWm(6,2),cplHpmcHpmVZ(2,2),cplHpmcHpmVZp(2,2),            & 
& cplSdcHpmcSu(6,2,6),cplSecHpmcSv(6,2,6),cplcHpmVWmVZ(2),cplcHpmVWmVZp(2)

Real(dp) ::  g1D(284) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Hpm_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
gp = gpinput 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
Yv = Yvinput 
kap = kapinput 
Yu = Yuinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tv = Tvinput 
Tk = Tkinput 
Tu = Tuinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
ms2 = ms2input 
ms12 = ms12input 
ms22 = ms22input 
ms32 = ms32input 
mv2 = mv2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
M4 = M4input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
vS1 = vS1input 
vS2 = vS2input 
vS3 = vS3input 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,284,0._dp,tz,deltaM,dt,0._dp,rge284,kont)

End if 
Call GToParameters284(g1D,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,              & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
If (m_in.le.Qin) Then 
  If (m_in.le.mz) Then 
    Call RunSM(mz,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  Else 
    Call RunSM(m_in,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  End if 
End if 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZV = ZVinput 
ZVL = ZVLinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSv = MSvinput 
MSv2 = MSv2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
v = vinput 
End if 
cplAhHpmcHpm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingAhHpmcHpmT(gt1,gt2,gt3,g2,lam,Tlam,vd,vu,ZA,ZP,cplAhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpmcHpm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhHpmcHpmT(gt1,gt2,gt3,g1,g2,gp,lam,Tlam,vd,vu,vS,vS1,vS2,               & 
& vS3,ZH,ZP,cplhhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcHpmcSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingSdcHpmcSuT(gt1,gt2,gt3,g2,Yd,Td,lam,Yu,Tu,vd,vu,vS,ZD,ZU,ZP,             & 
& cplSdcHpmcSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSecHpmcSv = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingSecHpmcSvT(gt1,gt2,gt3,g2,Ye,Te,lam,Yv,Tv,vd,vu,vS,ZV,ZE,ZP,             & 
& cplSecHpmcSv(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhcHpmVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
Call CouplingAhcHpmVWmT(gt1,gt2,g2,ZA,ZP,cplAhcHpmVWm(gt1,gt2))

 End Do 
End Do 


cplhhcHpmVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
Call CouplinghhcHpmVWmT(gt1,gt2,g2,ZH,ZP,cplhhcHpmVWm(gt1,gt2))

 End Do 
End Do 


cplHpmcHpmVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHpmcHpmVZT(gt1,gt2,g1,g2,gp,ZP,TW,TWp,cplHpmcHpmVZ(gt1,gt2))

 End Do 
End Do 


cplHpmcHpmVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHpmcHpmVZpT(gt1,gt2,g1,g2,gp,ZP,TW,TWp,cplHpmcHpmVZp(gt1,gt2))

 End Do 
End Do 


cplcHpmVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingcHpmVWmVZT(gt1,g1,g2,gp,vd,vu,ZP,TW,TWp,cplcHpmVWmVZ(gt1))

End Do 


cplcHpmVWmVZp = 0._dp 
Do gt1 = 1, 2
Call CouplingcHpmVWmVZpT(gt1,g1,g2,gp,vd,vu,ZP,TW,TWp,cplcHpmVWmVZp(gt1))

End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,gp,lam,ZP,ZN,UM,UP,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFecHpmL = 0._dp 
cplcFvFecHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFvFecHpmT(gt1,gt2,gt3,Ye,Yv,ZP,ZVL,ZVR,ZEL,ZER,cplcFvFecHpmL(gt1,gt2,gt3)& 
& ,cplcFvFecHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Hpm_decays_2B
 
Subroutine CouplingsFor_VZp_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvinput,          & 
& MSv2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,pGinput,        & 
& TWinput,TWpinput,UMinput,UPinput,vinput,ZAinput,ZDinput,ZDLinput,ZDRinput,             & 
& ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,ZURinput,           & 
& ZVinput,ZVLinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,          & 
& gpinput,Ydinput,Yeinput,laminput,Yvinput,kapinput,Yuinput,Tdinput,Teinput,             & 
& Tlaminput,Tvinput,Tkinput,Tuinput,mq2input,ml2input,mHd2input,mHu2input,               & 
& md2input,mu2input,me2input,ms2input,ms12input,ms22input,ms32input,mv2input,            & 
& M1input,M2input,M3input,M4input,vdinput,vuinput,vSinput,vS1input,vS2input,             & 
& vS3input,cplAhhhVZp,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,         & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,         & 
& cplcFvFvVZpL,cplcFvFvVZpR,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,          & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvcSvVZp,cplcVWmVWmVZp,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,gpinput,mHd2input,mHu2input,ms2input,ms12input,               & 
& ms22input,ms32input,vdinput,vuinput,vSinput,vS1input,vS2input,vS3input

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,Yvinput(3,3),kapinput,Yuinput(3,3),Tdinput(3,3),   & 
& Teinput(3,3),Tlaminput,Tvinput(3,3),Tkinput,Tuinput(3,3),mq2input(3,3),ml2input(3,3),  & 
& md2input(3,3),mu2input(3,3),me2input(3,3),mv2input(3,3),M1input,M2input,               & 
& M3input,M4input

Real(dp),Intent(in) :: MAhinput(6),MAh2input(6),MChainput(2),MCha2input(2),MChiinput(9),MChi2input(9),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(3),MFv2input(3),MGluinput,MGlu2input,Mhhinput(6),Mhh2input(6),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvinput(6),MSv2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,vinput,ZPinput(2,2),ZZinput(3,3),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),ZAinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZHinput(6,6),ZNinput(9,9),      & 
& ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZVinput(6,6),ZVLinput(3,3),ZVRinput(3,3),     & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp),Intent(out) :: cplAhhhVZp(6,6),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChiVZpL(9,9),           & 
& cplChiChiVZpR(9,9),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFeFeVZpL(3,3),              & 
& cplcFeFeVZpR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcFvFvVZpL(3,3),               & 
& cplcFvFvVZpR(3,3),cplhhVZVZp(6),cplhhVZpVZp(6),cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),    & 
& cplSdcSdVZp(6,6),cplSecSeVZp(6,6),cplSucSuVZp(6,6),cplSvcSvVZp(6,6),cplcVWmVWmVZp

Real(dp) ::  g1D(284) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_VZp_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
gp = gpinput 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
Yv = Yvinput 
kap = kapinput 
Yu = Yuinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tv = Tvinput 
Tk = Tkinput 
Tu = Tuinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
ms2 = ms2input 
ms12 = ms12input 
ms22 = ms22input 
ms32 = ms32input 
mv2 = mv2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
M4 = M4input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
vS1 = vS1input 
vS2 = vS2input 
vS3 = vS3input 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,284,0._dp,tz,deltaM,dt,0._dp,rge284,kont)

End if 
Call GToParameters284(g1D,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,              & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
If (m_in.le.Qin) Then 
  If (m_in.le.mz) Then 
    Call RunSM(mz,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  Else 
    Call RunSM(m_in,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  End if 
End if 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZV = ZVinput 
ZVL = ZVLinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSv = MSvinput 
MSv2 = MSv2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
v = vinput 
End if 
cplAhhhVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingAhhhVZpT(gt1,gt2,g1,g2,gp,ZH,ZA,TW,TWp,cplAhhhVZp(gt1,gt2))

 End Do 
End Do 


cplHpmcHpmVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingHpmcHpmVZpT(gt1,gt2,g1,g2,gp,ZP,TW,TWp,cplHpmcHpmVZp(gt1,gt2))

 End Do 
End Do 


cplSdcSdVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSdcSdVZpT(gt1,gt2,g1,g2,gp,ZD,TW,TWp,cplSdcSdVZp(gt1,gt2))

 End Do 
End Do 


cplSecSeVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSecSeVZpT(gt1,gt2,g1,g2,gp,ZE,TW,TWp,cplSecSeVZp(gt1,gt2))

 End Do 
End Do 


cplSucSuVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSucSuVZpT(gt1,gt2,g1,g2,gp,ZU,TW,TWp,cplSucSuVZp(gt1,gt2))

 End Do 
End Do 


cplSvcSvVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSvcSvVZpT(gt1,gt2,g1,g2,gp,ZV,TW,TWp,cplSvcSvVZp(gt1,gt2))

 End Do 
End Do 


cplhhVZVZp = 0._dp 
Do gt1 = 1, 6
Call CouplinghhVZVZpT(gt1,g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,ZH,TW,TWp,cplhhVZVZp(gt1))

End Do 


cplhhVZpVZp = 0._dp 
Do gt1 = 1, 6
Call CouplinghhVZpVZpT(gt1,g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,ZH,TW,TWp,cplhhVZpVZp(gt1))

End Do 


cplHpmcVWmVZp = 0._dp 
Do gt1 = 1, 2
Call CouplingHpmcVWmVZpT(gt1,g1,g2,gp,vd,vu,ZP,TW,TWp,cplHpmcVWmVZp(gt1))

End Do 


cplcVWmVWmVZp = 0._dp 
Call CouplingcVWmVWmVZpT(g2,TW,TWp,cplcVWmVWmVZp)



cplcChaChaVZpL = 0._dp 
cplcChaChaVZpR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZpT(gt1,gt2,g1,g2,gp,UM,UP,TW,TWp,cplcChaChaVZpL(gt1,gt2)        & 
& ,cplcChaChaVZpR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZpL = 0._dp 
cplChiChiVZpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingChiChiVZpT(gt1,gt2,g1,g2,gp,ZN,TW,TWp,cplChiChiVZpL(gt1,gt2)             & 
& ,cplChiChiVZpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFdFdVZpL(gt1,gt2),cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFeFeVZpL(gt1,gt2),cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFuFuVZpL(gt1,gt2),cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZpL = 0._dp 
cplcFvFvVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFvFvVZpL(gt1,gt2),cplcFvFvVZpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_VZp_decays_2B
 
Subroutine CouplingsFor_Glu_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvinput,          & 
& MSv2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,pGinput,        & 
& TWinput,TWpinput,UMinput,UPinput,vinput,ZAinput,ZDinput,ZDLinput,ZDRinput,             & 
& ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,ZURinput,           & 
& ZVinput,ZVLinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,          & 
& gpinput,Ydinput,Yeinput,laminput,Yvinput,kapinput,Yuinput,Tdinput,Teinput,             & 
& Tlaminput,Tvinput,Tkinput,Tuinput,mq2input,ml2input,mHd2input,mHu2input,               & 
& md2input,mu2input,me2input,ms2input,ms12input,ms22input,ms32input,mv2input,            & 
& M1input,M2input,M3input,M4input,vdinput,vuinput,vSinput,vS1input,vS2input,             & 
& vS3input,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,gpinput,mHd2input,mHu2input,ms2input,ms12input,               & 
& ms22input,ms32input,vdinput,vuinput,vSinput,vS1input,vS2input,vS3input

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,Yvinput(3,3),kapinput,Yuinput(3,3),Tdinput(3,3),   & 
& Teinput(3,3),Tlaminput,Tvinput(3,3),Tkinput,Tuinput(3,3),mq2input(3,3),ml2input(3,3),  & 
& md2input(3,3),mu2input(3,3),me2input(3,3),mv2input(3,3),M1input,M2input,               & 
& M3input,M4input

Real(dp),Intent(in) :: MAhinput(6),MAh2input(6),MChainput(2),MCha2input(2),MChiinput(9),MChi2input(9),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(3),MFv2input(3),MGluinput,MGlu2input,Mhhinput(6),Mhh2input(6),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvinput(6),MSv2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,vinput,ZPinput(2,2),ZZinput(3,3),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),ZAinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZHinput(6,6),ZNinput(9,9),      & 
& ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZVinput(6,6),ZVLinput(3,3),ZVRinput(3,3),     & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp),Intent(out) :: cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6)

Real(dp) ::  g1D(284) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Glu_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
gp = gpinput 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
Yv = Yvinput 
kap = kapinput 
Yu = Yuinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tv = Tvinput 
Tk = Tkinput 
Tu = Tuinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
ms2 = ms2input 
ms12 = ms12input 
ms22 = ms22input 
ms32 = ms32input 
mv2 = mv2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
M4 = M4input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
vS1 = vS1input 
vS2 = vS2input 
vS3 = vS3input 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,284,0._dp,tz,deltaM,dt,0._dp,rge284,kont)

End if 
Call GToParameters284(g1D,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,              & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZV = ZVinput 
ZVL = ZVLinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSv = MSvinput 
MSv2 = MSv2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
v = vinput 
End if 
cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


cplGluFucSuL = 0._dp 
cplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFucSuT(gt2,gt3,g3,pG,ZU,ZUL,ZUR,cplGluFucSuL(gt2,gt3),cplGluFucSuR(gt2,gt3))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Glu_decays_2B
 
Subroutine CouplingsFor_Chi_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvinput,          & 
& MSv2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,pGinput,        & 
& TWinput,TWpinput,UMinput,UPinput,vinput,ZAinput,ZDinput,ZDLinput,ZDRinput,             & 
& ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,ZURinput,           & 
& ZVinput,ZVLinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,          & 
& gpinput,Ydinput,Yeinput,laminput,Yvinput,kapinput,Yuinput,Tdinput,Teinput,             & 
& Tlaminput,Tvinput,Tkinput,Tuinput,mq2input,ml2input,mHd2input,mHu2input,               & 
& md2input,mu2input,me2input,ms2input,ms12input,ms22input,ms32input,mv2input,            & 
& M1input,M2input,M3input,M4input,vdinput,vuinput,vSinput,vS1input,vS2input,             & 
& vS3input,cplChiChiAhL,cplChiChiAhR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,      & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,gpinput,mHd2input,mHu2input,ms2input,ms12input,               & 
& ms22input,ms32input,vdinput,vuinput,vSinput,vS1input,vS2input,vS3input

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,Yvinput(3,3),kapinput,Yuinput(3,3),Tdinput(3,3),   & 
& Teinput(3,3),Tlaminput,Tvinput(3,3),Tkinput,Tuinput(3,3),mq2input(3,3),ml2input(3,3),  & 
& md2input(3,3),mu2input(3,3),me2input(3,3),mv2input(3,3),M1input,M2input,               & 
& M3input,M4input

Real(dp),Intent(in) :: MAhinput(6),MAh2input(6),MChainput(2),MCha2input(2),MChiinput(9),MChi2input(9),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(3),MFv2input(3),MGluinput,MGlu2input,Mhhinput(6),Mhh2input(6),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvinput(6),MSv2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,vinput,ZPinput(2,2),ZZinput(3,3),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),ZAinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZHinput(6,6),ZNinput(9,9),      & 
& ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZVinput(6,6),ZVLinput(3,3),ZVRinput(3,3),     & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp),Intent(out) :: cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),  & 
& cplChiChacVWmL(9,2),cplChiChacVWmR(9,2),cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),       & 
& cplChiChiVZL(9,9),cplChiChiVZR(9,9),cplChiChiVZpL(9,9),cplChiChiVZpR(9,9),             & 
& cplChiFdcSdL(9,3,6),cplChiFdcSdR(9,3,6),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),       & 
& cplChiFucSuL(9,3,6),cplChiFucSuR(9,3,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6)

Real(dp) ::  g1D(284) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Chi_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
gp = gpinput 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
Yv = Yvinput 
kap = kapinput 
Yu = Yuinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tv = Tvinput 
Tk = Tkinput 
Tu = Tuinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
ms2 = ms2input 
ms12 = ms12input 
ms22 = ms22input 
ms32 = ms32input 
mv2 = mv2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
M4 = M4input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
vS1 = vS1input 
vS2 = vS2input 
vS3 = vS3input 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,284,0._dp,tz,deltaM,dt,0._dp,rge284,kont)

End if 
Call GToParameters284(g1D,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,              & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZV = ZVinput 
ZVL = ZVLinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSv = MSvinput 
MSv2 = MSv2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
v = vinput 
End if 
cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)   & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,gp,lam,ZP,ZN,UM,UP,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)   & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,gp,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)& 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFecSeL = 0._dp 
cplChiFecSeR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFecSeT(gt1,gt2,gt3,g1,g2,gp,Ye,ZE,ZN,ZEL,ZER,cplChiFecSeL(gt1,gt2,gt3)& 
& ,cplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,gp,Yu,ZU,ZN,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)& 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvcSvL = 0._dp 
cplChiFvcSvR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFvcSvT(gt1,gt2,gt3,g1,g2,gp,Yv,ZV,ZN,ZVL,ZVR,cplChiFvcSvL(gt1,gt2,gt3)& 
& ,cplChiFvcSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacVWmL = 0._dp 
cplChiChacVWmR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 2
Call CouplingChiChacVWmT(gt1,gt2,g2,ZN,UM,UP,cplChiChacVWmL(gt1,gt2),cplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingChiChiVZT(gt1,gt2,g1,g2,gp,ZN,TW,TWp,cplChiChiVZL(gt1,gt2)               & 
& ,cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZpL = 0._dp 
cplChiChiVZpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingChiChiVZpT(gt1,gt2,g1,g2,gp,ZN,TW,TWp,cplChiChiVZpL(gt1,gt2)             & 
& ,cplChiChiVZpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Chi_decays_2B
 
Subroutine CouplingsFor_Cha_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvinput,          & 
& MSv2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,pGinput,        & 
& TWinput,TWpinput,UMinput,UPinput,vinput,ZAinput,ZDinput,ZDLinput,ZDRinput,             & 
& ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,ZURinput,           & 
& ZVinput,ZVLinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,          & 
& gpinput,Ydinput,Yeinput,laminput,Yvinput,kapinput,Yuinput,Tdinput,Teinput,             & 
& Tlaminput,Tvinput,Tkinput,Tuinput,mq2input,ml2input,mHd2input,mHu2input,               & 
& md2input,mu2input,me2input,ms2input,ms12input,ms22input,ms32input,mv2input,            & 
& M1input,M2input,M3input,M4input,vdinput,vuinput,vSinput,vS1input,vS2input,             & 
& vS3input,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,        & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,cplcChaChiHpmR,             & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFecSvL,               & 
& cplcChaFecSvR,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,gpinput,mHd2input,mHu2input,ms2input,ms12input,               & 
& ms22input,ms32input,vdinput,vuinput,vSinput,vS1input,vS2input,vS3input

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,Yvinput(3,3),kapinput,Yuinput(3,3),Tdinput(3,3),   & 
& Teinput(3,3),Tlaminput,Tvinput(3,3),Tkinput,Tuinput(3,3),mq2input(3,3),ml2input(3,3),  & 
& md2input(3,3),mu2input(3,3),me2input(3,3),mv2input(3,3),M1input,M2input,               & 
& M3input,M4input

Real(dp),Intent(in) :: MAhinput(6),MAh2input(6),MChainput(2),MCha2input(2),MChiinput(9),MChi2input(9),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(3),MFv2input(3),MGluinput,MGlu2input,Mhhinput(6),Mhh2input(6),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvinput(6),MSv2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,vinput,ZPinput(2,2),ZZinput(3,3),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),ZAinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZHinput(6,6),ZNinput(9,9),      & 
& ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZVinput(6,6),ZVLinput(3,3),ZVRinput(3,3),     & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp),Intent(out) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),  & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),         & 
& cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9),   & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),   & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6)

Real(dp) ::  g1D(284) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Cha_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
gp = gpinput 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
Yv = Yvinput 
kap = kapinput 
Yu = Yuinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tv = Tvinput 
Tk = Tkinput 
Tu = Tuinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
ms2 = ms2input 
ms12 = ms12input 
ms22 = ms22input 
ms32 = ms32input 
mv2 = mv2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
M4 = M4input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
vS1 = vS1input 
vS2 = vS2input 
vS3 = vS3input 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,284,0._dp,tz,deltaM,dt,0._dp,rge284,kont)

End if 
Call GToParameters284(g1D,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,              & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZV = ZVinput 
ZVL = ZVLinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSv = MSvinput 
MSv2 = MSv2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
v = vinput 
End if 
cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChiHpmL = 0._dp 
cplcChaChiHpmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingcChaChiHpmT(gt1,gt2,gt3,g1,g2,gp,lam,ZP,ZN,UM,UP,cplcChaChiHpmL(gt1,gt2,gt3)& 
& ,cplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFdcSuL = 0._dp 
cplcChaFdcSuR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFdcSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcChaFdcSuL(gt1,gt2,gt3)& 
& ,cplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFecSvL = 0._dp 
cplcChaFecSvR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFecSvT(gt1,gt2,gt3,g2,Ye,Yv,ZV,UM,UP,ZEL,ZER,cplcChaFecSvL(gt1,gt2,gt3)& 
& ,cplcChaFecSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChacFuSdL = 0._dp 
cplcChacFuSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFuSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplcChacFuSdL(gt1,gt2,gt3)& 
& ,cplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChacFvSeL = 0._dp 
cplcChacFvSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFvSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,ZVL,ZVR,UM,UP,cplcChacFvSeL(gt1,gt2,gt3)& 
& ,cplcChacFvSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,gp,UM,UP,TW,TWp,cplcChaChaVZL(gt1,gt2)          & 
& ,cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZpL = 0._dp 
cplcChaChaVZpR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZpT(gt1,gt2,g1,g2,gp,UM,UP,TW,TWp,cplcChaChaVZpL(gt1,gt2)        & 
& ,cplcChaChaVZpR(gt1,gt2))

 End Do 
End Do 


cplcChaChiVWmL = 0._dp 
cplcChaChiVWmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 9
Call CouplingcChaChiVWmT(gt1,gt2,g2,ZN,UM,UP,cplcChaChiVWmL(gt1,gt2),cplcChaChiVWmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Cha_decays_2B
 
Subroutine CouplingsFor_Fu_decays_2B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvinput,          & 
& MSv2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,pGinput,        & 
& TWinput,TWpinput,UMinput,UPinput,vinput,ZAinput,ZDinput,ZDLinput,ZDRinput,             & 
& ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,ZURinput,           & 
& ZVinput,ZVLinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,          & 
& gpinput,Ydinput,Yeinput,laminput,Yvinput,kapinput,Yuinput,Tdinput,Teinput,             & 
& Tlaminput,Tvinput,Tkinput,Tuinput,mq2input,ml2input,mHd2input,mHu2input,               & 
& md2input,mu2input,me2input,ms2input,ms12input,ms22input,ms32input,mv2input,            & 
& M1input,M2input,M3input,M4input,vdinput,vuinput,vSinput,vS1input,vS2input,             & 
& vS3input,cplcFuFuAhL,cplcFuFuAhR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,              & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,         & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,         & 
& cplcChacFuSdR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,gpinput,mHd2input,mHu2input,ms2input,ms12input,               & 
& ms22input,ms32input,vdinput,vuinput,vSinput,vS1input,vS2input,vS3input

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,Yvinput(3,3),kapinput,Yuinput(3,3),Tdinput(3,3),   & 
& Teinput(3,3),Tlaminput,Tvinput(3,3),Tkinput,Tuinput(3,3),mq2input(3,3),ml2input(3,3),  & 
& md2input(3,3),mu2input(3,3),me2input(3,3),mv2input(3,3),M1input,M2input,               & 
& M3input,M4input

Real(dp),Intent(in) :: MAhinput(6),MAh2input(6),MChainput(2),MCha2input(2),MChiinput(9),MChi2input(9),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(3),MFv2input(3),MGluinput,MGlu2input,Mhhinput(6),Mhh2input(6),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvinput(6),MSv2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,vinput,ZPinput(2,2),ZZinput(3,3),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),ZAinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZHinput(6,6),ZNinput(9,9),      & 
& ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZVinput(6,6),ZVLinput(3,3),ZVRinput(3,3),     & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp),Intent(out) :: cplcFuFuAhL(3,3,6),cplcFuFuAhR(3,3,6),cplcFuChiSuL(3,9,6),cplcFuChiSuR(3,9,6),        & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),       & 
& cplcFuFuhhL(3,3,6),cplcFuFuhhR(3,3,6),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),               & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

Real(dp) ::  g1D(284) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fu_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
gp = gpinput 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
Yv = Yvinput 
kap = kapinput 
Yu = Yuinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tv = Tvinput 
Tk = Tkinput 
Tu = Tuinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
ms2 = ms2input 
ms12 = ms12input 
ms22 = ms22input 
ms32 = ms32input 
mv2 = mv2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
M4 = M4input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
vS1 = vS1input 
vS2 = vS2input 
vS3 = vS3input 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,284,0._dp,tz,deltaM,dt,0._dp,rge284,kont)

End if 
Call GToParameters284(g1D,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,              & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
If (m_in.le.Qin) Then 
  If (m_in.le.mz) Then 
    Call RunSM(mz,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  Else 
    Call RunSM(m_in,deltaM,vu/vd,g1,g2,g3,Yu,Yd,Ye,vd,vu) 
  End if 
End if 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZV = ZVinput 
ZVL = ZVLinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSv = MSvinput 
MSv2 = MSv2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
v = vinput 
End if 
cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuChiSuL = 0._dp 
cplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFuChiSuT(gt1,gt2,gt3,g1,g2,gp,Yu,ZU,ZN,ZUL,ZUR,cplcFuChiSuL(gt1,gt2,gt3)& 
& ,cplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuGluSuL = 0._dp 
cplcFuGluSuR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFuGluSuT(gt1,gt3,g3,pG,ZU,ZUL,ZUR,cplcFuGluSuL(gt1,gt3),cplcFuGluSuR(gt1,gt3))

 End Do 
End Do 


cplcChacFuSdL = 0._dp 
cplcChacFuSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFuSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplcChacFuSdL(gt1,gt2,gt3)& 
& ,cplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFuFuVZpL(gt1,gt2),cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fu_decays_2B
 
Subroutine CouplingsFor_Glu_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvinput,          & 
& MSv2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,pGinput,        & 
& TWinput,TWpinput,UMinput,UPinput,vinput,ZAinput,ZDinput,ZDLinput,ZDRinput,             & 
& ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,ZURinput,           & 
& ZVinput,ZVLinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,          & 
& gpinput,Ydinput,Yeinput,laminput,Yvinput,kapinput,Yuinput,Tdinput,Teinput,             & 
& Tlaminput,Tvinput,Tkinput,Tuinput,mq2input,ml2input,mHd2input,mHu2input,               & 
& md2input,mu2input,me2input,ms2input,ms12input,ms22input,ms32input,mv2input,            & 
& M1input,M2input,M3input,M4input,vdinput,vuinput,vSinput,vS1input,vS2input,             & 
& vS3input,cplcChacFuSdL,cplcChacFuSdR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplcFdGluSdL,cplcFdGluSdR,cplcFuChiSuL,cplcFuChiSuR,cplcFuGluSuL,         & 
& cplcFuGluSuR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplGluFdcSdL,         & 
& cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,gpinput,mHd2input,mHu2input,ms2input,ms12input,               & 
& ms22input,ms32input,vdinput,vuinput,vSinput,vS1input,vS2input,vS3input

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,Yvinput(3,3),kapinput,Yuinput(3,3),Tdinput(3,3),   & 
& Teinput(3,3),Tlaminput,Tvinput(3,3),Tkinput,Tuinput(3,3),mq2input(3,3),ml2input(3,3),  & 
& md2input(3,3),mu2input(3,3),me2input(3,3),mv2input(3,3),M1input,M2input,               & 
& M3input,M4input

Real(dp),Intent(in) :: MAhinput(6),MAh2input(6),MChainput(2),MCha2input(2),MChiinput(9),MChi2input(9),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(3),MFv2input(3),MGluinput,MGlu2input,Mhhinput(6),Mhh2input(6),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvinput(6),MSv2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,vinput,ZPinput(2,2),ZZinput(3,3),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),ZAinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZHinput(6,6),ZNinput(9,9),      & 
& ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZVinput(6,6),ZVLinput(3,3),ZVRinput(3,3),     & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp),Intent(out) :: cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),  & 
& cplcFdChiSdL(3,9,6),cplcFdChiSdR(3,9,6),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),           & 
& cplcFuChiSuL(3,9,6),cplcFuChiSuR(3,9,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),           & 
& cplChiFdcSdL(9,3,6),cplChiFdcSdR(9,3,6),cplChiFucSuL(9,3,6),cplChiFucSuR(9,3,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6)

Real(dp) ::  g1D(284) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Glu_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
gp = gpinput 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
Yv = Yvinput 
kap = kapinput 
Yu = Yuinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tv = Tvinput 
Tk = Tkinput 
Tu = Tuinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
ms2 = ms2input 
ms12 = ms12input 
ms22 = ms22input 
ms32 = ms32input 
mv2 = mv2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
M4 = M4input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
vS1 = vS1input 
vS2 = vS2input 
vS3 = vS3input 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,284,0._dp,tz,deltaM,dt,0._dp,rge284,kont)

End if 
Call GToParameters284(g1D,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,              & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZV = ZVinput 
ZVL = ZVLinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSv = MSvinput 
MSv2 = MSv2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
v = vinput 
End if 
cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,gp,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)& 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,gp,Yu,ZU,ZN,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)& 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChiSdL = 0._dp 
cplcFdChiSdR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFdChiSdT(gt1,gt2,gt3,g1,g2,gp,Yd,ZD,ZN,ZDL,ZDR,cplcFdChiSdL(gt1,gt2,gt3)& 
& ,cplcFdChiSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuChiSuL = 0._dp 
cplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFuChiSuT(gt1,gt2,gt3,g1,g2,gp,Yu,ZU,ZN,ZUL,ZUR,cplcFuChiSuL(gt1,gt2,gt3)& 
& ,cplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


cplcChaFdcSuL = 0._dp 
cplcChaFdcSuR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFdcSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcChaFdcSuL(gt1,gt2,gt3)& 
& ,cplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFucSuL = 0._dp 
cplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFucSuT(gt2,gt3,g3,pG,ZU,ZUL,ZUR,cplGluFucSuL(gt2,gt3),cplGluFucSuR(gt2,gt3))

 End Do 
End Do 


cplcFdGluSdL = 0._dp 
cplcFdGluSdR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFdGluSdT(gt1,gt3,g3,pG,ZD,ZDL,ZDR,cplcFdGluSdL(gt1,gt3),cplcFdGluSdR(gt1,gt3))

 End Do 
End Do 


cplcFuGluSuL = 0._dp 
cplcFuGluSuR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFuGluSuT(gt1,gt3,g3,pG,ZU,ZUL,ZUR,cplcFuGluSuL(gt1,gt3),cplcFuGluSuR(gt1,gt3))

 End Do 
End Do 


cplcChacFuSdL = 0._dp 
cplcChacFuSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFuSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplcChacFuSdL(gt1,gt2,gt3)& 
& ,cplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Glu_decays_3B
 
Subroutine CouplingsFor_Chi_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvinput,          & 
& MSv2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,pGinput,        & 
& TWinput,TWpinput,UMinput,UPinput,vinput,ZAinput,ZDinput,ZDLinput,ZDRinput,             & 
& ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,ZURinput,           & 
& ZVinput,ZVLinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,          & 
& gpinput,Ydinput,Yeinput,laminput,Yvinput,kapinput,Yuinput,Tdinput,Teinput,             & 
& Tlaminput,Tvinput,Tkinput,Tuinput,mq2input,ml2input,mHd2input,mHu2input,               & 
& md2input,mu2input,me2input,ms2input,ms12input,ms22input,ms32input,mv2input,            & 
& M1input,M2input,M3input,M4input,vdinput,vuinput,vSinput,vS1input,vS2input,             & 
& vS3input,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,        & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,             & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,          & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFeChaSvL,cplcFeChaSvR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZpL,              & 
& cplcFeFeVZpR,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,          & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplcFvChiSvL,cplcFvChiSvR,cplcFvFvAhL,cplcFvFvAhR,cplcFvFvhhL,cplcFvFvhhR,             & 
& cplcFvFvVZL,cplcFvFvVZpL,cplcFvFvVZpR,cplcFvFvVZR,cplChaFucSdL,cplChaFucSdR,           & 
& cplChaFvcSeL,cplChaFvcSeR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR, & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,        & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplGluFucSuL,cplGluFucSuR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,gpinput,mHd2input,mHu2input,ms2input,ms12input,               & 
& ms22input,ms32input,vdinput,vuinput,vSinput,vS1input,vS2input,vS3input

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,Yvinput(3,3),kapinput,Yuinput(3,3),Tdinput(3,3),   & 
& Teinput(3,3),Tlaminput,Tvinput(3,3),Tkinput,Tuinput(3,3),mq2input(3,3),ml2input(3,3),  & 
& md2input(3,3),mu2input(3,3),me2input(3,3),mv2input(3,3),M1input,M2input,               & 
& M3input,M4input

Real(dp),Intent(in) :: MAhinput(6),MAh2input(6),MChainput(2),MCha2input(2),MChiinput(9),MChi2input(9),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(3),MFv2input(3),MGluinput,MGlu2input,Mhhinput(6),Mhh2input(6),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvinput(6),MSv2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,vinput,ZPinput(2,2),ZZinput(3,3),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),ZAinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZHinput(6,6),ZNinput(9,9),      & 
& ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZVinput(6,6),ZVLinput(3,3),ZVRinput(3,3),     & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp),Intent(out) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),  & 
& cplcChaChaVZL(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcChaChaVZR(2,2),         & 
& cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9),   & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFdChiSdL(3,9,6),cplcFdChiSdR(3,9,6),       & 
& cplcFdFdAhL(3,3,6),cplcFdFdAhR(3,3,6),cplcFdFdhhL(3,3,6),cplcFdFdhhR(3,3,6),           & 
& cplcFdFdVZL(3,3),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,2),& 
& cplcFdFuHpmR(3,3,2),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFdGluSdL(3,6),             & 
& cplcFdGluSdR(3,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),cplcFeChiSeL(3,9,6),         & 
& cplcFeChiSeR(3,9,6),cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6),cplcFeFehhL(3,3,6),          & 
& cplcFeFehhR(3,3,6),cplcFeFeVZL(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),               & 
& cplcFeFeVZR(3,3),cplcFeFvHpmL(3,3,2),cplcFeFvHpmR(3,3,2),cplcFeFvVWmL(3,3),            & 
& cplcFeFvVWmR(3,3),cplcFuChiSuL(3,9,6),cplcFuChiSuR(3,9,6),cplcFuFuAhL(3,3,6),          & 
& cplcFuFuAhR(3,3,6),cplcFuFuhhL(3,3,6),cplcFuFuhhR(3,3,6),cplcFuFuVZL(3,3),             & 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),& 
& cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),         & 
& cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),cplcFvFvVZL(3,3),cplcFvFvVZpL(3,3),              & 
& cplcFvFvVZpR(3,3),cplcFvFvVZR(3,3),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),            & 
& cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),   & 
& cplChiChacVWmL(9,2),cplChiChacVWmR(9,2),cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),       & 
& cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),cplChiChiVZL(9,9),cplChiChiVZpL(9,9),          & 
& cplChiChiVZpR(9,9),cplChiChiVZR(9,9),cplChiFdcSdL(9,3,6),cplChiFdcSdR(9,3,6),          & 
& cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFucSuL(9,3,6),cplChiFucSuR(9,3,6),       & 
& cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),           & 
& cplGluFucSuL(3,6),cplGluFucSuR(3,6)

Real(dp) ::  g1D(284) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Chi_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
gp = gpinput 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
Yv = Yvinput 
kap = kapinput 
Yu = Yuinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tv = Tvinput 
Tk = Tkinput 
Tu = Tuinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
ms2 = ms2input 
ms12 = ms12input 
ms22 = ms22input 
ms32 = ms32input 
mv2 = mv2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
M4 = M4input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
vS1 = vS1input 
vS2 = vS2input 
vS3 = vS3input 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,284,0._dp,tz,deltaM,dt,0._dp,rge284,kont)

End if 
Call GToParameters284(g1D,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,              & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZV = ZVinput 
ZVL = ZVLinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSv = MSvinput 
MSv2 = MSv2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
v = vinput 
End if 
cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)   & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFvAhL = 0._dp 
cplcFvFvAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFvFvAhT(gt1,gt2,gt3,Yv,ZA,ZVL,ZVR,cplcFvFvAhL(gt1,gt2,gt3)              & 
& ,cplcFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,gp,lam,ZP,ZN,UM,UP,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFucSdL = 0._dp 
cplChaFucSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFucSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplChaFucSdL(gt1,gt2,gt3)& 
& ,cplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFvcSeL = 0._dp 
cplChaFvcSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFvcSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,ZVL,ZVR,UM,UP,cplChaFvcSeL(gt1,gt2,gt3)& 
& ,cplChaFvcSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChaSuL = 0._dp 
cplcFdChaSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFdChaSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcFdChaSuL(gt1,gt2,gt3)& 
& ,cplcFdChaSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvL = 0._dp 
cplcFeChaSvR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvT(gt1,gt2,gt3,g2,Ye,Yv,ZV,UM,UP,ZEL,ZER,cplcFeChaSvL(gt1,gt2,gt3)& 
& ,cplcFeChaSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)   & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,gp,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)& 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFecSeL = 0._dp 
cplChiFecSeR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFecSeT(gt1,gt2,gt3,g1,g2,gp,Ye,ZE,ZN,ZEL,ZER,cplChiFecSeL(gt1,gt2,gt3)& 
& ,cplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,gp,Yu,ZU,ZN,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)& 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvcSvL = 0._dp 
cplChiFvcSvR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFvcSvT(gt1,gt2,gt3,g1,g2,gp,Yv,ZV,ZN,ZVL,ZVR,cplChiFvcSvL(gt1,gt2,gt3)& 
& ,cplChiFvcSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChiHpmL = 0._dp 
cplcChaChiHpmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingcChaChiHpmT(gt1,gt2,gt3,g1,g2,gp,lam,ZP,ZN,UM,UP,cplcChaChiHpmL(gt1,gt2,gt3)& 
& ,cplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChiSdL = 0._dp 
cplcFdChiSdR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFdChiSdT(gt1,gt2,gt3,g1,g2,gp,Yd,ZD,ZN,ZDL,ZDR,cplcFdChiSdL(gt1,gt2,gt3)& 
& ,cplcFdChiSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChiSeL = 0._dp 
cplcFeChiSeR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFeChiSeT(gt1,gt2,gt3,g1,g2,gp,Ye,ZE,ZN,ZEL,ZER,cplcFeChiSeL(gt1,gt2,gt3)& 
& ,cplcFeChiSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuChiSuL = 0._dp 
cplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFuChiSuT(gt1,gt2,gt3,g1,g2,gp,Yu,ZU,ZN,ZUL,ZUR,cplcFuChiSuL(gt1,gt2,gt3)& 
& ,cplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvChiSvL = 0._dp 
cplcFvChiSvR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFvChiSvT(gt1,gt2,gt3,g1,g2,gp,Yv,ZV,ZN,ZVL,ZVR,cplcFvChiSvL(gt1,gt2,gt3)& 
& ,cplcFvChiSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFucSuL = 0._dp 
cplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFucSuT(gt2,gt3,g3,pG,ZU,ZUL,ZUR,cplGluFucSuL(gt2,gt3),cplGluFucSuR(gt2,gt3))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFuHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3) & 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFvhhL = 0._dp 
cplcFvFvhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFvFvhhT(gt1,gt2,gt3,Yv,ZH,ZVL,ZVR,cplcFvFvhhL(gt1,gt2,gt3)              & 
& ,cplcFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvHpmL = 0._dp 
cplcFeFvHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFvHpmT(gt1,gt2,gt3,Ye,Yv,ZP,ZVL,ZVR,ZEL,ZER,cplcFeFvHpmL(gt1,gt2,gt3) & 
& ,cplcFeFvHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdGluSdL = 0._dp 
cplcFdGluSdR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFdGluSdT(gt1,gt3,g3,pG,ZD,ZDL,ZDR,cplcFdGluSdL(gt1,gt3),cplcFdGluSdR(gt1,gt3))

 End Do 
End Do 


cplcFuGluSuL = 0._dp 
cplcFuGluSuR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFuGluSuT(gt1,gt3,g3,pG,ZU,ZUL,ZUR,cplcFuGluSuL(gt1,gt3),cplcFuGluSuR(gt1,gt3))

 End Do 
End Do 


cplChiChacVWmL = 0._dp 
cplChiChacVWmR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 2
Call CouplingChiChacVWmT(gt1,gt2,g2,ZN,UM,UP,cplChiChacVWmL(gt1,gt2),cplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,gp,UM,UP,TW,TWp,cplcChaChaVZL(gt1,gt2)          & 
& ,cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZpL = 0._dp 
cplcChaChaVZpR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZpT(gt1,gt2,g1,g2,gp,UM,UP,TW,TWp,cplcChaChaVZpL(gt1,gt2)        & 
& ,cplcChaChaVZpR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingChiChiVZT(gt1,gt2,g1,g2,gp,ZN,TW,TWp,cplChiChiVZL(gt1,gt2)               & 
& ,cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZpL = 0._dp 
cplChiChiVZpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingChiChiVZpT(gt1,gt2,g1,g2,gp,ZN,TW,TWp,cplChiChiVZpL(gt1,gt2)             & 
& ,cplChiChiVZpR(gt1,gt2))

 End Do 
End Do 


cplcChaChiVWmL = 0._dp 
cplcChaChiVWmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 9
Call CouplingcChaChiVWmT(gt1,gt2,g2,ZN,UM,UP,cplcChaChiVWmL(gt1,gt2),cplcChaChiVWmR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFdFdVZpL(gt1,gt2),cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFeFeVZpL(gt1,gt2),cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFuFuVZpL(gt1,gt2),cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWmL = 0._dp 
cplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvVWmT(gt1,gt2,g2,ZVL,ZEL,cplcFeFvVWmL(gt1,gt2),cplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZpL = 0._dp 
cplcFvFvVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFvFvVZpL(gt1,gt2),cplcFvFvVZpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Chi_decays_3B
 
Subroutine CouplingsFor_Cha_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,           & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvinput,          & 
& MSv2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,pGinput,        & 
& TWinput,TWpinput,UMinput,UPinput,vinput,ZAinput,ZDinput,ZDLinput,ZDRinput,             & 
& ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,ZURinput,           & 
& ZVinput,ZVLinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,          & 
& gpinput,Ydinput,Yeinput,laminput,Yvinput,kapinput,Yuinput,Tdinput,Teinput,             & 
& Tlaminput,Tvinput,Tkinput,Tuinput,mq2input,ml2input,mHd2input,mHu2input,               & 
& md2input,mu2input,me2input,ms2input,ms12input,ms22input,ms32input,mv2input,            & 
& M1input,M2input,M3input,M4input,vdinput,vuinput,vSinput,vS1input,vS2input,             & 
& vS3input,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,cplcChaChaAhL,        & 
& cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFecSvL,cplcChaFecSvR,cplcFdChaSuL,cplcFdChaSuR,     & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcFdFdVZR,cplcFeChaSvL,cplcFeChaSvR,cplcFeFeAhL,cplcFeFeAhR,            & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,             & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,     & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplcFvChiSvL,cplcFvChiSvR,          & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvAhL,cplcFvFvAhR,       & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZpL,cplcFvFvVZpR,cplcFvFvVZR,             & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplChiChacHpmL,cplChiChacHpmR,     & 
& cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplChiFecSeL,cplChiFecSeR,cplGluFdcSdL,cplGluFdcSdR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,gpinput,mHd2input,mHu2input,ms2input,ms12input,               & 
& ms22input,ms32input,vdinput,vuinput,vSinput,vS1input,vS2input,vS3input

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,Yvinput(3,3),kapinput,Yuinput(3,3),Tdinput(3,3),   & 
& Teinput(3,3),Tlaminput,Tvinput(3,3),Tkinput,Tuinput(3,3),mq2input(3,3),ml2input(3,3),  & 
& md2input(3,3),mu2input(3,3),me2input(3,3),mv2input(3,3),M1input,M2input,               & 
& M3input,M4input

Real(dp),Intent(in) :: MAhinput(6),MAh2input(6),MChainput(2),MCha2input(2),MChiinput(9),MChi2input(9),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(3),MFv2input(3),MGluinput,MGlu2input,Mhhinput(6),Mhh2input(6),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvinput(6),MSv2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,vinput,ZPinput(2,2),ZZinput(3,3),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),ZAinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZHinput(6,6),ZNinput(9,9),      & 
& ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZVinput(6,6),ZVLinput(3,3),ZVRinput(3,3),     & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp),Intent(out) :: cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),  & 
& cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),   & 
& cplcChaChaVZL(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcChaChaVZR(2,2),         & 
& cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9),   & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),   & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFdFdAhL(3,3,6),cplcFdFdAhR(3,3,6),         & 
& cplcFdFdhhL(3,3,6),cplcFdFdhhR(3,3,6),cplcFdFdVZL(3,3),cplcFdFdVZpL(3,3),              & 
& cplcFdFdVZpR(3,3),cplcFdFdVZR(3,3),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),            & 
& cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6),cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),           & 
& cplcFeFeVZL(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcFeFeVZR(3,3),cplcFuChiSuL(3,9,6),& 
& cplcFuChiSuR(3,9,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),      & 
& cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3,6),cplcFuFuAhR(3,3,6),cplcFuFuhhL(3,3,6),           & 
& cplcFuFuhhR(3,3,6),cplcFuFuVZL(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),               & 
& cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplcFvChiSvL(3,9,6),              & 
& cplcFvChiSvR(3,9,6),cplcFvFecHpmL(3,3,2),cplcFvFecHpmR(3,3,2),cplcFvFecVWmL(3,3),      & 
& cplcFvFecVWmR(3,3),cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),cplcFvFvhhL(3,3,6),           & 
& cplcFvFvhhR(3,3,6),cplcFvFvVZL(3,3),cplcFvFvVZpL(3,3),cplcFvFvVZpR(3,3),               & 
& cplcFvFvVZR(3,3),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChaFvcSeL(2,3,6),          & 
& cplChaFvcSeR(2,3,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChiChacVWmL(9,2),   & 
& cplChiChacVWmR(9,2),cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),cplChiChihhL(9,9,6),       & 
& cplChiChihhR(9,9,6),cplChiChiVZL(9,9),cplChiChiVZpL(9,9),cplChiChiVZpR(9,9),           & 
& cplChiChiVZR(9,9),cplChiFdcSdL(9,3,6),cplChiFdcSdR(9,3,6),cplChiFecSeL(9,3,6),         & 
& cplChiFecSeR(9,3,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6)

Real(dp) ::  g1D(284) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Cha_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
gp = gpinput 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
Yv = Yvinput 
kap = kapinput 
Yu = Yuinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tv = Tvinput 
Tk = Tkinput 
Tu = Tuinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
ms2 = ms2input 
ms12 = ms12input 
ms22 = ms22input 
ms32 = ms32input 
mv2 = mv2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
M4 = M4input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
vS1 = vS1input 
vS2 = vS2input 
vS3 = vS3input 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,284,0._dp,tz,deltaM,dt,0._dp,rge284,kont)

End if 
Call GToParameters284(g1D,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,              & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZV = ZVinput 
ZVL = ZVLinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSv = MSvinput 
MSv2 = MSv2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
v = vinput 
End if 
cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)   & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFvAhL = 0._dp 
cplcFvFvAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFvFvAhT(gt1,gt2,gt3,Yv,ZA,ZVL,ZVR,cplcFvFvAhL(gt1,gt2,gt3)              & 
& ,cplcFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,gp,lam,ZP,ZN,UM,UP,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFucSdL = 0._dp 
cplChaFucSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFucSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplChaFucSdL(gt1,gt2,gt3)& 
& ,cplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFvcSeL = 0._dp 
cplChaFvcSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFvcSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,ZVL,ZVR,UM,UP,cplChaFvcSeL(gt1,gt2,gt3)& 
& ,cplChaFvcSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChaSuL = 0._dp 
cplcFdChaSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFdChaSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcFdChaSuL(gt1,gt2,gt3)& 
& ,cplcFdChaSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvL = 0._dp 
cplcFeChaSvR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvT(gt1,gt2,gt3,g2,Ye,Yv,ZV,UM,UP,ZEL,ZER,cplcFeChaSvL(gt1,gt2,gt3)& 
& ,cplcFeChaSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)   & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,gp,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)& 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFecSeL = 0._dp 
cplChiFecSeR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFecSeT(gt1,gt2,gt3,g1,g2,gp,Ye,ZE,ZN,ZEL,ZER,cplChiFecSeL(gt1,gt2,gt3)& 
& ,cplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChiHpmL = 0._dp 
cplcChaChiHpmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingcChaChiHpmT(gt1,gt2,gt3,g1,g2,gp,lam,ZP,ZN,UM,UP,cplcChaChiHpmL(gt1,gt2,gt3)& 
& ,cplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuChiSuL = 0._dp 
cplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFuChiSuT(gt1,gt2,gt3,g1,g2,gp,Yu,ZU,ZN,ZUL,ZUR,cplcFuChiSuL(gt1,gt2,gt3)& 
& ,cplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvChiSvL = 0._dp 
cplcFvChiSvR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFvChiSvT(gt1,gt2,gt3,g1,g2,gp,Yv,ZV,ZN,ZVL,ZVR,cplcFvChiSvL(gt1,gt2,gt3)& 
& ,cplcFvChiSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFdcSuL = 0._dp 
cplcChaFdcSuR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFdcSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcChaFdcSuL(gt1,gt2,gt3)& 
& ,cplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFecSvL = 0._dp 
cplcChaFecSvR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFecSvT(gt1,gt2,gt3,g2,Ye,Yv,ZV,UM,UP,ZEL,ZER,cplcChaFecSvL(gt1,gt2,gt3)& 
& ,cplcChaFecSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFecHpmL = 0._dp 
cplcFvFecHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFvFecHpmT(gt1,gt2,gt3,Ye,Yv,ZP,ZVL,ZVR,ZEL,ZER,cplcFvFecHpmL(gt1,gt2,gt3)& 
& ,cplcFvFecHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFvhhL = 0._dp 
cplcFvFvhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFvFvhhT(gt1,gt2,gt3,Yv,ZH,ZVL,ZVR,cplcFvFvhhL(gt1,gt2,gt3)              & 
& ,cplcFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuGluSuL = 0._dp 
cplcFuGluSuR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFuGluSuT(gt1,gt3,g3,pG,ZU,ZUL,ZUR,cplcFuGluSuL(gt1,gt3),cplcFuGluSuR(gt1,gt3))

 End Do 
End Do 


cplcChacFuSdL = 0._dp 
cplcChacFuSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFuSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplcChacFuSdL(gt1,gt2,gt3)& 
& ,cplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChacFvSeL = 0._dp 
cplcChacFvSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFvSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,ZVL,ZVR,UM,UP,cplcChacFvSeL(gt1,gt2,gt3)& 
& ,cplcChacFvSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacVWmL = 0._dp 
cplChiChacVWmR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 2
Call CouplingChiChacVWmT(gt1,gt2,g2,ZN,UM,UP,cplChiChacVWmL(gt1,gt2),cplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,gp,UM,UP,TW,TWp,cplcChaChaVZL(gt1,gt2)          & 
& ,cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZpL = 0._dp 
cplcChaChaVZpR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZpT(gt1,gt2,g1,g2,gp,UM,UP,TW,TWp,cplcChaChaVZpL(gt1,gt2)        & 
& ,cplcChaChaVZpR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingChiChiVZT(gt1,gt2,g1,g2,gp,ZN,TW,TWp,cplChiChiVZL(gt1,gt2)               & 
& ,cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZpL = 0._dp 
cplChiChiVZpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingChiChiVZpT(gt1,gt2,g1,g2,gp,ZN,TW,TWp,cplChiChiVZpL(gt1,gt2)             & 
& ,cplChiChiVZpR(gt1,gt2))

 End Do 
End Do 


cplcChaChiVWmL = 0._dp 
cplcChaChiVWmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 9
Call CouplingcChaChiVWmT(gt1,gt2,g2,ZN,UM,UP,cplcChaChiVWmL(gt1,gt2),cplcChaChiVWmR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFdFdVZpL(gt1,gt2),cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFeFeVZpL(gt1,gt2),cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFvFecVWmL = 0._dp 
cplcFvFecVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFecVWmT(gt1,gt2,g2,ZVL,ZEL,cplcFvFecVWmL(gt1,gt2),cplcFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFuFuVZpL(gt1,gt2),cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZpL = 0._dp 
cplcFvFvVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFvFvVZpL(gt1,gt2),cplcFvFvVZpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Cha_decays_3B
 
Subroutine CouplingsFor_Sd_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvinput,          & 
& MSv2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,pGinput,        & 
& TWinput,TWpinput,UMinput,UPinput,vinput,ZAinput,ZDinput,ZDLinput,ZDRinput,             & 
& ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,ZURinput,           & 
& ZVinput,ZVLinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,          & 
& gpinput,Ydinput,Yeinput,laminput,Yvinput,kapinput,Yuinput,Tdinput,Teinput,             & 
& Tlaminput,Tvinput,Tkinput,Tuinput,mq2input,ml2input,mHd2input,mHu2input,               & 
& md2input,mu2input,me2input,ms2input,ms12input,ms22input,ms32input,mv2input,            & 
& M1input,M2input,M3input,M4input,vdinput,vuinput,vSinput,vS1input,vS2input,             & 
& vS3input,cplAhSdcSd,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,           & 
& cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaFdcSuL,              & 
& cplcChaFdcSuR,cplcChaFecSvL,cplcChaFecSvR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,      & 
& cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,              & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdGluSdL,          & 
& cplcFdGluSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,            & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,cplcFuChiSuL,            & 
& cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,      & 
& cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplcFvChiSvL,cplcFvChiSvR,cplcFvFecHpmL,         & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvAhL,cplcFvFvAhR,cplcFvFvhhL,         & 
& cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZpL,cplcFvFvVZpR,cplcFvFvVZR,cplChaFucSdL,            & 
& cplChaFucSdR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,        & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplGluFucSuL,cplGluFucSuR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVZ,cplSdcSdVZp,               & 
& cplSucSdVWm,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,gpinput,mHd2input,mHu2input,ms2input,ms12input,               & 
& ms22input,ms32input,vdinput,vuinput,vSinput,vS1input,vS2input,vS3input

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,Yvinput(3,3),kapinput,Yuinput(3,3),Tdinput(3,3),   & 
& Teinput(3,3),Tlaminput,Tvinput(3,3),Tkinput,Tuinput(3,3),mq2input(3,3),ml2input(3,3),  & 
& md2input(3,3),mu2input(3,3),me2input(3,3),mv2input(3,3),M1input,M2input,               & 
& M3input,M4input

Real(dp),Intent(in) :: MAhinput(6),MAh2input(6),MChainput(2),MCha2input(2),MChiinput(9),MChi2input(9),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(3),MFv2input(3),MGluinput,MGlu2input,Mhhinput(6),Mhh2input(6),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvinput(6),MSv2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,vinput,ZPinput(2,2),ZZinput(3,3),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),ZAinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZHinput(6,6),ZNinput(9,9),      & 
& ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZVinput(6,6),ZVLinput(3,3),ZVRinput(3,3),     & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp),Intent(out) :: cplAhSdcSd(6,6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChacFvSeL(2,3,6),     & 
& cplcChacFvSeR(2,3,6),cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplcChaChahhL(2,2,6),   & 
& cplcChaChahhR(2,2,6),cplcChaChaVZL(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),       & 
& cplcChaChaVZR(2,2),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcChaFdcSuL(2,3,6),   & 
& cplcChaFdcSuR(2,3,6),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFdChaSuL(3,2,6),    & 
& cplcFdChaSuR(3,2,6),cplcFdChiSdL(3,9,6),cplcFdChiSdR(3,9,6),cplcFdFdAhL(3,3,6),        & 
& cplcFdFdAhR(3,3,6),cplcFdFdhhL(3,3,6),cplcFdFdhhR(3,3,6),cplcFdFdVZL(3,3),             & 
& cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,2),              & 
& cplcFdFuHpmR(3,3,2),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFeChiSeL(3,9,6),           & 
& cplcFeChiSeR(3,9,6),cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6),cplcFeFehhL(3,3,6),          & 
& cplcFeFehhR(3,3,6),cplcFeFeVZL(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),               & 
& cplcFeFeVZR(3,3),cplcFuChiSuL(3,9,6),cplcFuChiSuR(3,9,6),cplcFuFdcHpmL(3,3,2),         & 
& cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3,6),         & 
& cplcFuFuAhR(3,3,6),cplcFuFuhhL(3,3,6),cplcFuFuhhR(3,3,6),cplcFuFuVZL(3,3),             & 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),& 
& cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),cplcFvFecHpmL(3,3,2),cplcFvFecHpmR(3,3,2),     & 
& cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),           & 
& cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),cplcFvFvVZL(3,3),cplcFvFvVZpL(3,3),              & 
& cplcFvFvVZpR(3,3),cplcFvFvVZR(3,3),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),            & 
& cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChiChacVWmL(9,2),cplChiChacVWmR(9,2),   & 
& cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),       & 
& cplChiChiVZL(9,9),cplChiChiVZpL(9,9),cplChiChiVZpR(9,9),cplChiChiVZR(9,9),             & 
& cplChiFdcSdL(9,3,6),cplChiFdcSdR(9,3,6),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),       & 
& cplChiFucSuL(9,3,6),cplChiFucSuR(9,3,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),               & 
& cplhhSdcSd(6,6,6),cplHpmSucSd(2,6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplSucSdVWm(6,6)

Real(dp) ::  g1D(284) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Sd_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
gp = gpinput 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
Yv = Yvinput 
kap = kapinput 
Yu = Yuinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tv = Tvinput 
Tk = Tkinput 
Tu = Tuinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
ms2 = ms2input 
ms12 = ms12input 
ms22 = ms22input 
ms32 = ms32input 
mv2 = mv2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
M4 = M4input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
vS1 = vS1input 
vS2 = vS2input 
vS3 = vS3input 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,284,0._dp,tz,deltaM,dt,0._dp,rge284,kont)

End if 
Call GToParameters284(g1D,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,              & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZV = ZVinput 
ZVL = ZVLinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSv = MSvinput 
MSv2 = MSv2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
v = vinput 
End if 
cplAhSdcSd = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSdcSdT(gt1,gt2,gt3,Yd,Td,lam,vu,vS,ZD,ZA,cplAhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSdcSd = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSdcSdT(gt1,gt2,gt3,g1,g2,gp,Yd,Td,lam,vd,vu,vS,vS1,vS2,vS3,            & 
& ZD,ZH,cplhhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplHpmSucSd = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingHpmSucSdT(gt1,gt2,gt3,g2,Yd,Td,lam,Yu,Tu,vd,vu,vS,ZD,ZU,ZP,              & 
& cplHpmSucSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcSdVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSdcSdVZT(gt1,gt2,g1,g2,gp,ZD,TW,TWp,cplSdcSdVZ(gt1,gt2))

 End Do 
End Do 


cplSdcSdVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSdcSdVZpT(gt1,gt2,g1,g2,gp,ZD,TW,TWp,cplSdcSdVZp(gt1,gt2))

 End Do 
End Do 


cplSucSdVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSucSdVWmT(gt1,gt2,g2,ZD,ZU,cplSucSdVWm(gt1,gt2))

 End Do 
End Do 


cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)   & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFvAhL = 0._dp 
cplcFvFvAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFvFvAhT(gt1,gt2,gt3,Yv,ZA,ZVL,ZVR,cplcFvFvAhL(gt1,gt2,gt3)              & 
& ,cplcFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,gp,lam,ZP,ZN,UM,UP,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFucSdL = 0._dp 
cplChaFucSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFucSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplChaFucSdL(gt1,gt2,gt3)& 
& ,cplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChaSuL = 0._dp 
cplcFdChaSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFdChaSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcFdChaSuL(gt1,gt2,gt3)& 
& ,cplcFdChaSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)   & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,gp,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)& 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFecSeL = 0._dp 
cplChiFecSeR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFecSeT(gt1,gt2,gt3,g1,g2,gp,Ye,ZE,ZN,ZEL,ZER,cplChiFecSeL(gt1,gt2,gt3)& 
& ,cplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,gp,Yu,ZU,ZN,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)& 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvcSvL = 0._dp 
cplChiFvcSvR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFvcSvT(gt1,gt2,gt3,g1,g2,gp,Yv,ZV,ZN,ZVL,ZVR,cplChiFvcSvL(gt1,gt2,gt3)& 
& ,cplChiFvcSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChiHpmL = 0._dp 
cplcChaChiHpmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingcChaChiHpmT(gt1,gt2,gt3,g1,g2,gp,lam,ZP,ZN,UM,UP,cplcChaChiHpmL(gt1,gt2,gt3)& 
& ,cplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChiSdL = 0._dp 
cplcFdChiSdR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFdChiSdT(gt1,gt2,gt3,g1,g2,gp,Yd,ZD,ZN,ZDL,ZDR,cplcFdChiSdL(gt1,gt2,gt3)& 
& ,cplcFdChiSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChiSeL = 0._dp 
cplcFeChiSeR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFeChiSeT(gt1,gt2,gt3,g1,g2,gp,Ye,ZE,ZN,ZEL,ZER,cplcFeChiSeL(gt1,gt2,gt3)& 
& ,cplcFeChiSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuChiSuL = 0._dp 
cplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFuChiSuT(gt1,gt2,gt3,g1,g2,gp,Yu,ZU,ZN,ZUL,ZUR,cplcFuChiSuL(gt1,gt2,gt3)& 
& ,cplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvChiSvL = 0._dp 
cplcFvChiSvR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFvChiSvT(gt1,gt2,gt3,g1,g2,gp,Yv,ZV,ZN,ZVL,ZVR,cplcFvChiSvL(gt1,gt2,gt3)& 
& ,cplcFvChiSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFdcSuL = 0._dp 
cplcChaFdcSuR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFdcSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcChaFdcSuL(gt1,gt2,gt3)& 
& ,cplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFecSvL = 0._dp 
cplcChaFecSvR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFecSvT(gt1,gt2,gt3,g2,Ye,Yv,ZV,UM,UP,ZEL,ZER,cplcChaFecSvL(gt1,gt2,gt3)& 
& ,cplcChaFecSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFecHpmL = 0._dp 
cplcFvFecHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFvFecHpmT(gt1,gt2,gt3,Ye,Yv,ZP,ZVL,ZVR,ZEL,ZER,cplcFvFecHpmL(gt1,gt2,gt3)& 
& ,cplcFvFecHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFucSuL = 0._dp 
cplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFucSuT(gt2,gt3,g3,pG,ZU,ZUL,ZUR,cplGluFucSuL(gt2,gt3),cplGluFucSuR(gt2,gt3))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFuHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3) & 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFvhhL = 0._dp 
cplcFvFvhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFvFvhhT(gt1,gt2,gt3,Yv,ZH,ZVL,ZVR,cplcFvFvhhL(gt1,gt2,gt3)              & 
& ,cplcFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdGluSdL = 0._dp 
cplcFdGluSdR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFdGluSdT(gt1,gt3,g3,pG,ZD,ZDL,ZDR,cplcFdGluSdL(gt1,gt3),cplcFdGluSdR(gt1,gt3))

 End Do 
End Do 


cplcFuGluSuL = 0._dp 
cplcFuGluSuR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFuGluSuT(gt1,gt3,g3,pG,ZU,ZUL,ZUR,cplcFuGluSuL(gt1,gt3),cplcFuGluSuR(gt1,gt3))

 End Do 
End Do 


cplcChacFuSdL = 0._dp 
cplcChacFuSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFuSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplcChacFuSdL(gt1,gt2,gt3)& 
& ,cplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChacFvSeL = 0._dp 
cplcChacFvSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFvSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,ZVL,ZVR,UM,UP,cplcChacFvSeL(gt1,gt2,gt3)& 
& ,cplcChacFvSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacVWmL = 0._dp 
cplChiChacVWmR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 2
Call CouplingChiChacVWmT(gt1,gt2,g2,ZN,UM,UP,cplChiChacVWmL(gt1,gt2),cplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,gp,UM,UP,TW,TWp,cplcChaChaVZL(gt1,gt2)          & 
& ,cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZpL = 0._dp 
cplcChaChaVZpR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZpT(gt1,gt2,g1,g2,gp,UM,UP,TW,TWp,cplcChaChaVZpL(gt1,gt2)        & 
& ,cplcChaChaVZpR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingChiChiVZT(gt1,gt2,g1,g2,gp,ZN,TW,TWp,cplChiChiVZL(gt1,gt2)               & 
& ,cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZpL = 0._dp 
cplChiChiVZpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingChiChiVZpT(gt1,gt2,g1,g2,gp,ZN,TW,TWp,cplChiChiVZpL(gt1,gt2)             & 
& ,cplChiChiVZpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFdFdVZpL(gt1,gt2),cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFeFeVZpL(gt1,gt2),cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFvFecVWmL = 0._dp 
cplcFvFecVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFecVWmT(gt1,gt2,g2,ZVL,ZEL,cplcFvFecVWmL(gt1,gt2),cplcFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFuFuVZpL(gt1,gt2),cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZpL = 0._dp 
cplcFvFvVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFvFvVZpL(gt1,gt2),cplcFvFvVZpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Sd_decays_3B
 
Subroutine CouplingsFor_Su_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvinput,          & 
& MSv2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,pGinput,        & 
& TWinput,TWpinput,UMinput,UPinput,vinput,ZAinput,ZDinput,ZDLinput,ZDRinput,             & 
& ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,ZURinput,           & 
& ZVinput,ZVLinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,          & 
& gpinput,Ydinput,Yeinput,laminput,Yvinput,kapinput,Yuinput,Tdinput,Teinput,             & 
& Tlaminput,Tvinput,Tkinput,Tuinput,mq2input,ml2input,mHd2input,mHu2input,               & 
& md2input,mu2input,me2input,ms2input,ms12input,ms22input,ms32input,mv2input,            & 
& M1input,M2input,M3input,M4input,vdinput,vuinput,vSinput,vS1input,vS2input,             & 
& vS3input,cplAhSucSu,cplcChacFuSdL,cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,       & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,          & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFeChaSvL,cplcFeChaSvR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZpL,              & 
& cplcFeFeVZpR,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,          & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFuAhL,cplcFuFuAhR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,             & 
& cplcFuGluSuL,cplcFuGluSuR,cplcFvChiSvL,cplcFvChiSvR,cplcFvFvAhL,cplcFvFvAhR,           & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZpL,cplcFvFvVZpR,cplcFvFvVZR,             & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplChiChacHpmL,cplChiChacHpmR,     & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,        & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVZ,             & 
& cplSucSuVZp,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,gpinput,mHd2input,mHu2input,ms2input,ms12input,               & 
& ms22input,ms32input,vdinput,vuinput,vSinput,vS1input,vS2input,vS3input

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,Yvinput(3,3),kapinput,Yuinput(3,3),Tdinput(3,3),   & 
& Teinput(3,3),Tlaminput,Tvinput(3,3),Tkinput,Tuinput(3,3),mq2input(3,3),ml2input(3,3),  & 
& md2input(3,3),mu2input(3,3),me2input(3,3),mv2input(3,3),M1input,M2input,               & 
& M3input,M4input

Real(dp),Intent(in) :: MAhinput(6),MAh2input(6),MChainput(2),MCha2input(2),MChiinput(9),MChi2input(9),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(3),MFv2input(3),MGluinput,MGlu2input,Mhhinput(6),Mhh2input(6),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvinput(6),MSv2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,vinput,ZPinput(2,2),ZZinput(3,3),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),ZAinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZHinput(6,6),ZNinput(9,9),      & 
& ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZVinput(6,6),ZVLinput(3,3),ZVRinput(3,3),     & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp),Intent(out) :: cplAhSucSu(6,6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChaChaAhL(2,2,6),     & 
& cplcChaChaAhR(2,2,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),cplcChaChaVZL(2,2),     & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcChaChaVZR(2,2),cplcChaChiHpmL(2,9,2),      & 
& cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9),cplcChaFdcSuL(2,3,6),    & 
& cplcChaFdcSuR(2,3,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFdChiSdL(3,9,6),      & 
& cplcFdChiSdR(3,9,6),cplcFdFdAhL(3,3,6),cplcFdFdAhR(3,3,6),cplcFdFdhhL(3,3,6),          & 
& cplcFdFdhhR(3,3,6),cplcFdFdVZL(3,3),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),               & 
& cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFdFuVWmL(3,3),            & 
& cplcFdFuVWmR(3,3),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFeChaSvL(3,2,6),             & 
& cplcFeChaSvR(3,2,6),cplcFeChiSeL(3,9,6),cplcFeChiSeR(3,9,6),cplcFeFeAhL(3,3,6),        & 
& cplcFeFeAhR(3,3,6),cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),cplcFeFeVZL(3,3),             & 
& cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcFeFeVZR(3,3),cplcFeFvHpmL(3,3,2),              & 
& cplcFeFvHpmR(3,3,2),cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcFuChiSuL(3,9,6),           & 
& cplcFuChiSuR(3,9,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFuAhL(3,3,6),      & 
& cplcFuFuAhR(3,3,6),cplcFuFuhhL(3,3,6),cplcFuFuhhR(3,3,6),cplcFuFuVZL(3,3),             & 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),& 
& cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),         & 
& cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),cplcFvFvVZL(3,3),cplcFvFvVZpL(3,3),              & 
& cplcFvFvVZpR(3,3),cplcFvFvVZR(3,3),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),            & 
& cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),   & 
& cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),       & 
& cplChiChiVZL(9,9),cplChiChiVZpL(9,9),cplChiChiVZpR(9,9),cplChiChiVZR(9,9),             & 
& cplChiFdcSdL(9,3,6),cplChiFdcSdR(9,3,6),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),       & 
& cplChiFucSuL(9,3,6),cplChiFucSuR(9,3,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),       & 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),               & 
& cplhhSucSu(6,6,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),cplSucSuVZ(6,6),               & 
& cplSucSuVZp(6,6)

Real(dp) ::  g1D(284) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Su_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
gp = gpinput 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
Yv = Yvinput 
kap = kapinput 
Yu = Yuinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tv = Tvinput 
Tk = Tkinput 
Tu = Tuinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
ms2 = ms2input 
ms12 = ms12input 
ms22 = ms22input 
ms32 = ms32input 
mv2 = mv2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
M4 = M4input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
vS1 = vS1input 
vS2 = vS2input 
vS3 = vS3input 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,284,0._dp,tz,deltaM,dt,0._dp,rge284,kont)

End if 
Call GToParameters284(g1D,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,              & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZV = ZVinput 
ZVL = ZVLinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSv = MSvinput 
MSv2 = MSv2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
v = vinput 
End if 
cplAhSucSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSucSuT(gt1,gt2,gt3,lam,Yu,Tu,vd,vS,ZU,ZA,cplAhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSucSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSucSuT(gt1,gt2,gt3,g1,g2,gp,lam,Yu,Tu,vd,vu,vS,vS1,vS2,vS3,            & 
& ZU,ZH,cplhhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcHpmcSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingSdcHpmcSuT(gt1,gt2,gt3,g2,Yd,Td,lam,Yu,Tu,vd,vu,vS,ZD,ZU,ZP,             & 
& cplSdcHpmcSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSdcSucVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSdcSucVWmT(gt1,gt2,g2,ZD,ZU,cplSdcSucVWm(gt1,gt2))

 End Do 
End Do 


cplSucSuVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSucSuVZT(gt1,gt2,g1,g2,gp,ZU,TW,TWp,cplSucSuVZ(gt1,gt2))

 End Do 
End Do 


cplSucSuVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSucSuVZpT(gt1,gt2,g1,g2,gp,ZU,TW,TWp,cplSucSuVZp(gt1,gt2))

 End Do 
End Do 


cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)   & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFvAhL = 0._dp 
cplcFvFvAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFvFvAhT(gt1,gt2,gt3,Yv,ZA,ZVL,ZVR,cplcFvFvAhL(gt1,gt2,gt3)              & 
& ,cplcFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,gp,lam,ZP,ZN,UM,UP,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFucSdL = 0._dp 
cplChaFucSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFucSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplChaFucSdL(gt1,gt2,gt3)& 
& ,cplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFvcSeL = 0._dp 
cplChaFvcSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFvcSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,ZVL,ZVR,UM,UP,cplChaFvcSeL(gt1,gt2,gt3)& 
& ,cplChaFvcSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChaSuL = 0._dp 
cplcFdChaSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFdChaSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcFdChaSuL(gt1,gt2,gt3)& 
& ,cplcFdChaSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvL = 0._dp 
cplcFeChaSvR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvT(gt1,gt2,gt3,g2,Ye,Yv,ZV,UM,UP,ZEL,ZER,cplcFeChaSvL(gt1,gt2,gt3)& 
& ,cplcFeChaSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)   & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,gp,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)& 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFecSeL = 0._dp 
cplChiFecSeR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFecSeT(gt1,gt2,gt3,g1,g2,gp,Ye,ZE,ZN,ZEL,ZER,cplChiFecSeL(gt1,gt2,gt3)& 
& ,cplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,gp,Yu,ZU,ZN,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)& 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvcSvL = 0._dp 
cplChiFvcSvR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFvcSvT(gt1,gt2,gt3,g1,g2,gp,Yv,ZV,ZN,ZVL,ZVR,cplChiFvcSvL(gt1,gt2,gt3)& 
& ,cplChiFvcSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChiHpmL = 0._dp 
cplcChaChiHpmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingcChaChiHpmT(gt1,gt2,gt3,g1,g2,gp,lam,ZP,ZN,UM,UP,cplcChaChiHpmL(gt1,gt2,gt3)& 
& ,cplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChiSdL = 0._dp 
cplcFdChiSdR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFdChiSdT(gt1,gt2,gt3,g1,g2,gp,Yd,ZD,ZN,ZDL,ZDR,cplcFdChiSdL(gt1,gt2,gt3)& 
& ,cplcFdChiSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChiSeL = 0._dp 
cplcFeChiSeR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFeChiSeT(gt1,gt2,gt3,g1,g2,gp,Ye,ZE,ZN,ZEL,ZER,cplcFeChiSeL(gt1,gt2,gt3)& 
& ,cplcFeChiSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuChiSuL = 0._dp 
cplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFuChiSuT(gt1,gt2,gt3,g1,g2,gp,Yu,ZU,ZN,ZUL,ZUR,cplcFuChiSuL(gt1,gt2,gt3)& 
& ,cplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvChiSvL = 0._dp 
cplcFvChiSvR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFvChiSvT(gt1,gt2,gt3,g1,g2,gp,Yv,ZV,ZN,ZVL,ZVR,cplcFvChiSvL(gt1,gt2,gt3)& 
& ,cplcFvChiSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFdcSdL = 0._dp 
cplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFdcSdT(gt2,gt3,g3,pG,ZD,ZDL,ZDR,cplGluFdcSdL(gt2,gt3),cplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFdcSuL = 0._dp 
cplcChaFdcSuR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFdcSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcChaFdcSuL(gt1,gt2,gt3)& 
& ,cplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplGluFucSuL = 0._dp 
cplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CouplingGluFucSuT(gt2,gt3,g3,pG,ZU,ZUL,ZUR,cplGluFucSuL(gt2,gt3),cplGluFucSuR(gt2,gt3))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFuHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3) & 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFvhhL = 0._dp 
cplcFvFvhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFvFvhhT(gt1,gt2,gt3,Yv,ZH,ZVL,ZVR,cplcFvFvhhL(gt1,gt2,gt3)              & 
& ,cplcFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvHpmL = 0._dp 
cplcFeFvHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFvHpmT(gt1,gt2,gt3,Ye,Yv,ZP,ZVL,ZVR,ZEL,ZER,cplcFeFvHpmL(gt1,gt2,gt3) & 
& ,cplcFeFvHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdGluSdL = 0._dp 
cplcFdGluSdR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFdGluSdT(gt1,gt3,g3,pG,ZD,ZDL,ZDR,cplcFdGluSdL(gt1,gt3),cplcFdGluSdR(gt1,gt3))

 End Do 
End Do 


cplcFuGluSuL = 0._dp 
cplcFuGluSuR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CouplingcFuGluSuT(gt1,gt3,g3,pG,ZU,ZUL,ZUR,cplcFuGluSuL(gt1,gt3),cplcFuGluSuR(gt1,gt3))

 End Do 
End Do 


cplcChacFuSdL = 0._dp 
cplcChacFuSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFuSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplcChacFuSdL(gt1,gt2,gt3)& 
& ,cplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,gp,UM,UP,TW,TWp,cplcChaChaVZL(gt1,gt2)          & 
& ,cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZpL = 0._dp 
cplcChaChaVZpR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZpT(gt1,gt2,g1,g2,gp,UM,UP,TW,TWp,cplcChaChaVZpL(gt1,gt2)        & 
& ,cplcChaChaVZpR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingChiChiVZT(gt1,gt2,g1,g2,gp,ZN,TW,TWp,cplChiChiVZL(gt1,gt2)               & 
& ,cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZpL = 0._dp 
cplChiChiVZpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingChiChiVZpT(gt1,gt2,g1,g2,gp,ZN,TW,TWp,cplChiChiVZpL(gt1,gt2)             & 
& ,cplChiChiVZpR(gt1,gt2))

 End Do 
End Do 


cplcChaChiVWmL = 0._dp 
cplcChaChiVWmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 9
Call CouplingcChaChiVWmT(gt1,gt2,g2,ZN,UM,UP,cplcChaChiVWmL(gt1,gt2),cplcChaChiVWmR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFdFdVZpL(gt1,gt2),cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFeFeVZpL(gt1,gt2),cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFuFuVZpL(gt1,gt2),cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWmL = 0._dp 
cplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvVWmT(gt1,gt2,g2,ZVL,ZEL,cplcFeFvVWmL(gt1,gt2),cplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZpL = 0._dp 
cplcFvFvVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFvFvVZpL(gt1,gt2),cplcFvFvVZpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Su_decays_3B
 
Subroutine CouplingsFor_Se_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvinput,          & 
& MSv2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,pGinput,        & 
& TWinput,TWpinput,UMinput,UPinput,vinput,ZAinput,ZDinput,ZDLinput,ZDRinput,             & 
& ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,ZURinput,           & 
& ZVinput,ZVLinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,          & 
& gpinput,Ydinput,Yeinput,laminput,Yvinput,kapinput,Yuinput,Tdinput,Teinput,             & 
& Tlaminput,Tvinput,Tkinput,Tuinput,mq2input,ml2input,mHd2input,mHu2input,               & 
& md2input,mu2input,me2input,ms2input,ms12input,ms22input,ms32input,mv2input,            & 
& M1input,M2input,M3input,M4input,vdinput,vuinput,vSinput,vS1input,vS2input,             & 
& vS3input,cplAhSecSe,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,           & 
& cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaFdcSuL,              & 
& cplcChaFdcSuR,cplcChaFecSvL,cplcChaFecSvR,cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,       & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcFdFdVZR,cplcFeChaSvL,cplcFeChaSvR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,         & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,         & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcFvChiSvL,            & 
& cplcFvChiSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvAhL,      & 
& cplcFvFvAhR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZpL,cplcFvFvVZpR,             & 
& cplcFvFvVZR,cplChaFvcSeL,cplChaFvcSeR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,    & 
& cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,       & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplhhSecSe,           & 
& cplHpmSvcSe,cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,gpinput,mHd2input,mHu2input,ms2input,ms12input,               & 
& ms22input,ms32input,vdinput,vuinput,vSinput,vS1input,vS2input,vS3input

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,Yvinput(3,3),kapinput,Yuinput(3,3),Tdinput(3,3),   & 
& Teinput(3,3),Tlaminput,Tvinput(3,3),Tkinput,Tuinput(3,3),mq2input(3,3),ml2input(3,3),  & 
& md2input(3,3),mu2input(3,3),me2input(3,3),mv2input(3,3),M1input,M2input,               & 
& M3input,M4input

Real(dp),Intent(in) :: MAhinput(6),MAh2input(6),MChainput(2),MCha2input(2),MChiinput(9),MChi2input(9),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(3),MFv2input(3),MGluinput,MGlu2input,Mhhinput(6),Mhh2input(6),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvinput(6),MSv2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,vinput,ZPinput(2,2),ZZinput(3,3),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),ZAinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZHinput(6,6),ZNinput(9,9),      & 
& ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZVinput(6,6),ZVLinput(3,3),ZVRinput(3,3),     & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp),Intent(out) :: cplAhSecSe(6,6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChacFvSeL(2,3,6),     & 
& cplcChacFvSeR(2,3,6),cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplcChaChahhL(2,2,6),   & 
& cplcChaChahhR(2,2,6),cplcChaChaVZL(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),       & 
& cplcChaChaVZR(2,2),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcChaFdcSuL(2,3,6),   & 
& cplcChaFdcSuR(2,3,6),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFdChiSdL(3,9,6),    & 
& cplcFdChiSdR(3,9,6),cplcFdFdAhL(3,3,6),cplcFdFdAhR(3,3,6),cplcFdFdhhL(3,3,6),          & 
& cplcFdFdhhR(3,3,6),cplcFdFdVZL(3,3),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),               & 
& cplcFdFdVZR(3,3),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),cplcFeChiSeL(3,9,6),          & 
& cplcFeChiSeR(3,9,6),cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6),cplcFeFehhL(3,3,6),          & 
& cplcFeFehhR(3,3,6),cplcFeFeVZL(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),               & 
& cplcFeFeVZR(3,3),cplcFeFvHpmL(3,3,2),cplcFeFvHpmR(3,3,2),cplcFuChiSuL(3,9,6),          & 
& cplcFuChiSuR(3,9,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),      & 
& cplcFuFdcVWmR(3,3),cplcFuFuAhL(3,3,6),cplcFuFuAhR(3,3,6),cplcFuFuhhL(3,3,6),           & 
& cplcFuFuhhR(3,3,6),cplcFuFuVZL(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),               & 
& cplcFuFuVZR(3,3),cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),cplcFvFecHpmL(3,3,2),         & 
& cplcFvFecHpmR(3,3,2),cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplcFvFvAhL(3,3,6),         & 
& cplcFvFvAhR(3,3,6),cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),cplcFvFvVZL(3,3),             & 
& cplcFvFvVZpL(3,3),cplcFvFvVZpR(3,3),cplcFvFvVZR(3,3),cplChaFvcSeL(2,3,6),              & 
& cplChaFvcSeR(2,3,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChiChacVWmL(9,2),   & 
& cplChiChacVWmR(9,2),cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),cplChiChihhL(9,9,6),       & 
& cplChiChihhR(9,9,6),cplChiChiVZL(9,9),cplChiChiVZpL(9,9),cplChiChiVZpR(9,9),           & 
& cplChiChiVZR(9,9),cplChiFdcSdL(9,3,6),cplChiFdcSdR(9,3,6),cplChiFecSeL(9,3,6),         & 
& cplChiFecSeR(9,3,6),cplChiFucSuL(9,3,6),cplChiFucSuR(9,3,6),cplChiFvcSvL(9,3,6),       & 
& cplChiFvcSvR(9,3,6),cplhhSecSe(6,6,6),cplHpmSvcSe(2,6,6),cplSecSeVZ(6,6),              & 
& cplSecSeVZp(6,6),cplSvcSeVWm(6,6)

Real(dp) ::  g1D(284) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Se_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
gp = gpinput 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
Yv = Yvinput 
kap = kapinput 
Yu = Yuinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tv = Tvinput 
Tk = Tkinput 
Tu = Tuinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
ms2 = ms2input 
ms12 = ms12input 
ms22 = ms22input 
ms32 = ms32input 
mv2 = mv2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
M4 = M4input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
vS1 = vS1input 
vS2 = vS2input 
vS3 = vS3input 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,284,0._dp,tz,deltaM,dt,0._dp,rge284,kont)

End if 
Call GToParameters284(g1D,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,              & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZV = ZVinput 
ZVL = ZVLinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSv = MSvinput 
MSv2 = MSv2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
v = vinput 
End if 
cplAhSecSe = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSecSeT(gt1,gt2,gt3,Ye,Te,lam,vu,vS,ZE,ZA,cplAhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSecSe = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSecSeT(gt1,gt2,gt3,g1,g2,gp,Ye,Te,lam,vd,vu,vS,vS1,vS2,vS3,            & 
& ZE,ZH,cplhhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplHpmSvcSe = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingHpmSvcSeT(gt1,gt2,gt3,g2,Ye,Te,lam,Yv,Tv,vd,vu,vS,ZV,ZE,ZP,              & 
& cplHpmSvcSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSecSeVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSecSeVZT(gt1,gt2,g1,g2,gp,ZE,TW,TWp,cplSecSeVZ(gt1,gt2))

 End Do 
End Do 


cplSecSeVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSecSeVZpT(gt1,gt2,g1,g2,gp,ZE,TW,TWp,cplSecSeVZp(gt1,gt2))

 End Do 
End Do 


cplSvcSeVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSvcSeVWmT(gt1,gt2,g2,ZV,ZE,cplSvcSeVWm(gt1,gt2))

 End Do 
End Do 


cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)   & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFvAhL = 0._dp 
cplcFvFvAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFvFvAhT(gt1,gt2,gt3,Yv,ZA,ZVL,ZVR,cplcFvFvAhL(gt1,gt2,gt3)              & 
& ,cplcFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,gp,lam,ZP,ZN,UM,UP,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFvcSeL = 0._dp 
cplChaFvcSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFvcSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,ZVL,ZVR,UM,UP,cplChaFvcSeL(gt1,gt2,gt3)& 
& ,cplChaFvcSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvL = 0._dp 
cplcFeChaSvR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvT(gt1,gt2,gt3,g2,Ye,Yv,ZV,UM,UP,ZEL,ZER,cplcFeChaSvL(gt1,gt2,gt3)& 
& ,cplcFeChaSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)   & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,gp,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)& 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFecSeL = 0._dp 
cplChiFecSeR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFecSeT(gt1,gt2,gt3,g1,g2,gp,Ye,ZE,ZN,ZEL,ZER,cplChiFecSeL(gt1,gt2,gt3)& 
& ,cplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,gp,Yu,ZU,ZN,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)& 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvcSvL = 0._dp 
cplChiFvcSvR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFvcSvT(gt1,gt2,gt3,g1,g2,gp,Yv,ZV,ZN,ZVL,ZVR,cplChiFvcSvL(gt1,gt2,gt3)& 
& ,cplChiFvcSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChiHpmL = 0._dp 
cplcChaChiHpmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingcChaChiHpmT(gt1,gt2,gt3,g1,g2,gp,lam,ZP,ZN,UM,UP,cplcChaChiHpmL(gt1,gt2,gt3)& 
& ,cplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChiSdL = 0._dp 
cplcFdChiSdR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFdChiSdT(gt1,gt2,gt3,g1,g2,gp,Yd,ZD,ZN,ZDL,ZDR,cplcFdChiSdL(gt1,gt2,gt3)& 
& ,cplcFdChiSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChiSeL = 0._dp 
cplcFeChiSeR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFeChiSeT(gt1,gt2,gt3,g1,g2,gp,Ye,ZE,ZN,ZEL,ZER,cplcFeChiSeL(gt1,gt2,gt3)& 
& ,cplcFeChiSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuChiSuL = 0._dp 
cplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFuChiSuT(gt1,gt2,gt3,g1,g2,gp,Yu,ZU,ZN,ZUL,ZUR,cplcFuChiSuL(gt1,gt2,gt3)& 
& ,cplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvChiSvL = 0._dp 
cplcFvChiSvR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFvChiSvT(gt1,gt2,gt3,g1,g2,gp,Yv,ZV,ZN,ZVL,ZVR,cplcFvChiSvL(gt1,gt2,gt3)& 
& ,cplcFvChiSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFdcSuL = 0._dp 
cplcChaFdcSuR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFdcSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcChaFdcSuL(gt1,gt2,gt3)& 
& ,cplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFecSvL = 0._dp 
cplcChaFecSvR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFecSvT(gt1,gt2,gt3,g2,Ye,Yv,ZV,UM,UP,ZEL,ZER,cplcChaFecSvL(gt1,gt2,gt3)& 
& ,cplcChaFecSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFecHpmL = 0._dp 
cplcFvFecHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFvFecHpmT(gt1,gt2,gt3,Ye,Yv,ZP,ZVL,ZVR,ZEL,ZER,cplcFvFecHpmL(gt1,gt2,gt3)& 
& ,cplcFvFecHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFvhhL = 0._dp 
cplcFvFvhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFvFvhhT(gt1,gt2,gt3,Yv,ZH,ZVL,ZVR,cplcFvFvhhL(gt1,gt2,gt3)              & 
& ,cplcFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvHpmL = 0._dp 
cplcFeFvHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFvHpmT(gt1,gt2,gt3,Ye,Yv,ZP,ZVL,ZVR,ZEL,ZER,cplcFeFvHpmL(gt1,gt2,gt3) & 
& ,cplcFeFvHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChacFuSdL = 0._dp 
cplcChacFuSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFuSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplcChacFuSdL(gt1,gt2,gt3)& 
& ,cplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChacFvSeL = 0._dp 
cplcChacFvSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFvSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,ZVL,ZVR,UM,UP,cplcChacFvSeL(gt1,gt2,gt3)& 
& ,cplcChacFvSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacVWmL = 0._dp 
cplChiChacVWmR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 2
Call CouplingChiChacVWmT(gt1,gt2,g2,ZN,UM,UP,cplChiChacVWmL(gt1,gt2),cplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,gp,UM,UP,TW,TWp,cplcChaChaVZL(gt1,gt2)          & 
& ,cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZpL = 0._dp 
cplcChaChaVZpR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZpT(gt1,gt2,g1,g2,gp,UM,UP,TW,TWp,cplcChaChaVZpL(gt1,gt2)        & 
& ,cplcChaChaVZpR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingChiChiVZT(gt1,gt2,g1,g2,gp,ZN,TW,TWp,cplChiChiVZL(gt1,gt2)               & 
& ,cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZpL = 0._dp 
cplChiChiVZpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingChiChiVZpT(gt1,gt2,g1,g2,gp,ZN,TW,TWp,cplChiChiVZpL(gt1,gt2)             & 
& ,cplChiChiVZpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFdFdVZpL(gt1,gt2),cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWmL = 0._dp 
cplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWmL(gt1,gt2),cplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFeFeVZpL(gt1,gt2),cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFvFecVWmL = 0._dp 
cplcFvFecVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFecVWmT(gt1,gt2,g2,ZVL,ZEL,cplcFvFecVWmL(gt1,gt2),cplcFvFecVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFuFuVZpL(gt1,gt2),cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZpL = 0._dp 
cplcFvFvVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFvFvVZpL(gt1,gt2),cplcFvFvVZpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Se_decays_3B
 
Subroutine CouplingsFor_Sv_decays_3B(m_in,i1,MAhinput,MAh2input,MChainput,            & 
& MCha2input,MChiinput,MChi2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,MFvinput,MFv2input,MGluinput,MGlu2input,Mhhinput,Mhh2input,MHpminput,        & 
& MHpm2input,MSdinput,MSd2input,MSeinput,MSe2input,MSuinput,MSu2input,MSvinput,          & 
& MSv2input,MVWminput,MVWm2input,MVZinput,MVZ2input,MVZpinput,MVZp2input,pGinput,        & 
& TWinput,TWpinput,UMinput,UPinput,vinput,ZAinput,ZDinput,ZDLinput,ZDRinput,             & 
& ZEinput,ZELinput,ZERinput,ZHinput,ZNinput,ZPinput,ZUinput,ZULinput,ZURinput,           & 
& ZVinput,ZVLinput,ZVRinput,ZWinput,ZZinput,betaHinput,g1input,g2input,g3input,          & 
& gpinput,Ydinput,Yeinput,laminput,Yvinput,kapinput,Yuinput,Tdinput,Teinput,             & 
& Tlaminput,Tvinput,Tkinput,Tuinput,mq2input,ml2input,mHd2input,mHu2input,               & 
& md2input,mu2input,me2input,ms2input,ms12input,ms22input,ms32input,mv2input,            & 
& M1input,M2input,M3input,M4input,vdinput,vuinput,vSinput,vS1input,vS2input,             & 
& vS3input,cplAhSvcSv,cplcChacFvSeL,cplcChacFvSeR,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,       & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,          & 
& cplcFeChaSvL,cplcFeChaSvR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,           & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,             & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFuFuVZR,cplcFvChiSvL,cplcFvChiSvR,cplcFvFecHpmL,cplcFvFecHpmR,        & 
& cplcFvFvAhL,cplcFvFvAhR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZpL,              & 
& cplcFvFvVZpR,cplcFvFvVZR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,          & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,         & 
& cplhhSvcSv,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,gpinput,mHd2input,mHu2input,ms2input,ms12input,               & 
& ms22input,ms32input,vdinput,vuinput,vSinput,vS1input,vS2input,vS3input

Complex(dp),Intent(in) :: Ydinput(3,3),Yeinput(3,3),laminput,Yvinput(3,3),kapinput,Yuinput(3,3),Tdinput(3,3),   & 
& Teinput(3,3),Tlaminput,Tvinput(3,3),Tkinput,Tuinput(3,3),mq2input(3,3),ml2input(3,3),  & 
& md2input(3,3),mu2input(3,3),me2input(3,3),mv2input(3,3),M1input,M2input,               & 
& M3input,M4input

Real(dp),Intent(in) :: MAhinput(6),MAh2input(6),MChainput(2),MCha2input(2),MChiinput(9),MChi2input(9),       & 
& MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),            & 
& MFvinput(3),MFv2input(3),MGluinput,MGlu2input,Mhhinput(6),Mhh2input(6),MHpminput(2),   & 
& MHpm2input(2),MSdinput(6),MSd2input(6),MSeinput(6),MSe2input(6),MSuinput(6),           & 
& MSu2input(6),MSvinput(6),MSv2input(6),MVWminput,MVWm2input,MVZinput,MVZ2input,         & 
& MVZpinput,MVZp2input,TWinput,TWpinput,vinput,ZPinput(2,2),ZZinput(3,3),betaHinput

Complex(dp),Intent(in) :: pGinput,UMinput(2,2),UPinput(2,2),ZAinput(6,6),ZDinput(6,6),ZDLinput(3,3),            & 
& ZDRinput(3,3),ZEinput(6,6),ZELinput(3,3),ZERinput(3,3),ZHinput(6,6),ZNinput(9,9),      & 
& ZUinput(6,6),ZULinput(3,3),ZURinput(3,3),ZVinput(6,6),ZVLinput(3,3),ZVRinput(3,3),     & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp),Intent(out) :: cplAhSvcSv(6,6,6),cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),cplcChaChaAhL(2,2,6),     & 
& cplcChaChaAhR(2,2,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),cplcChaChaVZL(2,2),     & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcChaChaVZR(2,2),cplcChaChiHpmL(2,9,2),      & 
& cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9),cplcChaFecSvL(2,3,6),    & 
& cplcChaFecSvR(2,3,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFdChiSdL(3,9,6),      & 
& cplcFdChiSdR(3,9,6),cplcFdFdAhL(3,3,6),cplcFdFdAhR(3,3,6),cplcFdFdhhL(3,3,6),          & 
& cplcFdFdhhR(3,3,6),cplcFdFdVZL(3,3),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),               & 
& cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFdFuVWmL(3,3),            & 
& cplcFdFuVWmR(3,3),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),cplcFeChiSeL(3,9,6),         & 
& cplcFeChiSeR(3,9,6),cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6),cplcFeFehhL(3,3,6),          & 
& cplcFeFehhR(3,3,6),cplcFeFeVZL(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),               & 
& cplcFeFeVZR(3,3),cplcFeFvHpmL(3,3,2),cplcFeFvHpmR(3,3,2),cplcFeFvVWmL(3,3),            & 
& cplcFeFvVWmR(3,3),cplcFuChiSuL(3,9,6),cplcFuChiSuR(3,9,6),cplcFuFuAhL(3,3,6),          & 
& cplcFuFuAhR(3,3,6),cplcFuFuhhL(3,3,6),cplcFuFuhhR(3,3,6),cplcFuFuVZL(3,3),             & 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcFuFuVZR(3,3),cplcFvChiSvL(3,9,6),              & 
& cplcFvChiSvR(3,9,6),cplcFvFecHpmL(3,3,2),cplcFvFecHpmR(3,3,2),cplcFvFvAhL(3,3,6),      & 
& cplcFvFvAhR(3,3,6),cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),cplcFvFvVZL(3,3),             & 
& cplcFvFvVZpL(3,3),cplcFvFvVZpR(3,3),cplcFvFvVZR(3,3),cplChaFucSdL(2,3,6),              & 
& cplChaFucSdR(2,3,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplChiChacHpmL(9,2,2),     & 
& cplChiChacHpmR(9,2,2),cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),cplChiChihhL(9,9,6),     & 
& cplChiChihhR(9,9,6),cplChiChiVZL(9,9),cplChiChiVZpL(9,9),cplChiChiVZpR(9,9),           & 
& cplChiChiVZR(9,9),cplChiFdcSdL(9,3,6),cplChiFdcSdR(9,3,6),cplChiFecSeL(9,3,6),         & 
& cplChiFecSeR(9,3,6),cplChiFucSuL(9,3,6),cplChiFucSuR(9,3,6),cplChiFvcSvL(9,3,6),       & 
& cplChiFvcSvR(9,3,6),cplhhSvcSv(6,6,6),cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),           & 
& cplSvcSvVZ(6,6),cplSvcSvVZp(6,6)

Real(dp) ::  g1D(284) 
Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Sv_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
gp = gpinput 
Yd = Ydinput 
Ye = Yeinput 
lam = laminput 
Yv = Yvinput 
kap = kapinput 
Yu = Yuinput 
Td = Tdinput 
Te = Teinput 
Tlam = Tlaminput 
Tv = Tvinput 
Tk = Tkinput 
Tu = Tuinput 
mq2 = mq2input 
ml2 = ml2input 
mHd2 = mHd2input 
mHu2 = mHu2input 
md2 = md2input 
mu2 = mu2input 
me2 = me2input 
ms2 = ms2input 
ms12 = ms12input 
ms22 = ms22input 
ms32 = ms32input 
mv2 = mv2input 
M1 = M1input 
M2 = M2input 
M3 = M3input 
M4 = M4input 
vd = vdinput 
vu = vuinput 
vS = vSinput 
vS1 = vS1input 
vS2 = vS2input 
vS3 = vS3input 
Qin=sqrt(getRenormalizationScale()) 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,g1D)

If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then 
  tz=Log(m_in/Qin) 
  If (m_in.le.mz) tz=Log(mz/Qin)  
  dt=tz/50._dp 
  Call odeint(g1D,284,0._dp,tz,deltaM,dt,0._dp,rge284,kont)

End if 
Call GToParameters284(g1D,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,              & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UM = UMinput 
UP = UPinput 
ZA = ZAinput 
ZD = ZDinput 
ZE = ZEinput 
ZH = ZHinput 
ZN = ZNinput 
ZP = ZPinput 
ZU = ZUinput 
ZV = ZVinput 
ZVL = ZVLinput 
ZVR = ZVRinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MCha = MChainput 
MCha2 = MCha2input 
MChi = MChiinput 
MChi2 = MChi2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
MGlu = MGluinput 
MGlu2 = MGlu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MSd = MSdinput 
MSd2 = MSd2input 
MSe = MSeinput 
MSe2 = MSe2input 
MSu = MSuinput 
MSu2 = MSu2input 
MSv = MSvinput 
MSv2 = MSv2input 
MVWm = MVWminput 
MVWm2 = MVWm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZp = MVZpinput 
MVZp2 = MVZp2input 
v = vinput 
End if 
cplAhSvcSv = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplingAhSvcSvT(gt1,gt2,gt3,lam,Yv,Tv,vd,vS,ZV,ZA,cplAhSvcSv(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhSvcSv = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CouplinghhSvcSvT(gt1,gt2,gt3,g1,g2,gp,lam,Yv,Tv,vd,vu,vS,vS1,vS2,vS3,            & 
& ZV,ZH,cplhhSvcSv(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSecHpmcSv = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingSecHpmcSvT(gt1,gt2,gt3,g2,Ye,Te,lam,Yv,Tv,vd,vu,vS,ZV,ZE,ZP,             & 
& cplSecHpmcSv(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplSecSvcVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSecSvcVWmT(gt1,gt2,g2,ZV,ZE,cplSecSvcVWm(gt1,gt2))

 End Do 
End Do 


cplSvcSvVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSvcSvVZT(gt1,gt2,g1,g2,gp,ZV,TW,TWp,cplSvcSvVZ(gt1,gt2))

 End Do 
End Do 


cplSvcSvVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CouplingSvcSvVZpT(gt1,gt2,g1,g2,gp,ZV,TW,TWp,cplSvcSvVZp(gt1,gt2))

 End Do 
End Do 


cplcChaChaAhL = 0._dp 
cplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcChaChaAhT(gt1,gt2,gt3,g2,lam,ZA,UM,UP,cplcChaChaAhL(gt1,gt2,gt3)        & 
& ,cplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChiAhL = 0._dp 
cplChiChiAhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingChiChiAhT(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZA,ZN,cplChiChiAhL(gt1,gt2,gt3)   & 
& ,cplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFdFdAhT(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)              & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFeFeAhT(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)              & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFuFuAhT(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)              & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFvAhL = 0._dp 
cplcFvFvAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFvFvAhT(gt1,gt2,gt3,Yv,ZA,ZVL,ZVR,cplcFvFvAhL(gt1,gt2,gt3)              & 
& ,cplcFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChacHpmL = 0._dp 
cplChiChacHpmR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingChiChacHpmT(gt1,gt2,gt3,g1,g2,gp,lam,ZP,ZN,UM,UP,cplChiChacHpmL(gt1,gt2,gt3)& 
& ,cplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFucSdL = 0._dp 
cplChaFucSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFucSdT(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,cplChaFucSdL(gt1,gt2,gt3)& 
& ,cplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChaFvcSeL = 0._dp 
cplChaFvcSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChaFvcSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,ZVL,ZVR,UM,UP,cplChaFvcSeL(gt1,gt2,gt3)& 
& ,cplChaFvcSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChahhL = 0._dp 
cplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcChaChahhT(gt1,gt2,gt3,g2,lam,ZH,UM,UP,cplcChaChahhL(gt1,gt2,gt3)        & 
& ,cplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChaSuL = 0._dp 
cplcFdChaSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFdChaSuT(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,cplcFdChaSuL(gt1,gt2,gt3)& 
& ,cplcFdChaSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChaSvL = 0._dp 
cplcFeChaSvR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CouplingcFeChaSvT(gt1,gt2,gt3,g2,Ye,Yv,ZV,UM,UP,ZEL,ZER,cplcFeChaSvL(gt1,gt2,gt3)& 
& ,cplcFeChaSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiChihhL = 0._dp 
cplChiChihhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingChiChihhT(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZH,ZN,cplChiChihhL(gt1,gt2,gt3)   & 
& ,cplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFdcSdL = 0._dp 
cplChiFdcSdR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFdcSdT(gt1,gt2,gt3,g1,g2,gp,Yd,ZD,ZN,ZDL,ZDR,cplChiFdcSdL(gt1,gt2,gt3)& 
& ,cplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFecSeL = 0._dp 
cplChiFecSeR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFecSeT(gt1,gt2,gt3,g1,g2,gp,Ye,ZE,ZN,ZEL,ZER,cplChiFecSeL(gt1,gt2,gt3)& 
& ,cplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFucSuL = 0._dp 
cplChiFucSuR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFucSuT(gt1,gt2,gt3,g1,g2,gp,Yu,ZU,ZN,ZUL,ZUR,cplChiFucSuL(gt1,gt2,gt3)& 
& ,cplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplChiFvcSvL = 0._dp 
cplChiFvcSvR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingChiFvcSvT(gt1,gt2,gt3,g1,g2,gp,Yv,ZV,ZN,ZVL,ZVR,cplChiFvcSvL(gt1,gt2,gt3)& 
& ,cplChiFvcSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChiHpmL = 0._dp 
cplcChaChiHpmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CouplingcChaChiHpmT(gt1,gt2,gt3,g1,g2,gp,lam,ZP,ZN,UM,UP,cplcChaChiHpmL(gt1,gt2,gt3)& 
& ,cplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdChiSdL = 0._dp 
cplcFdChiSdR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFdChiSdT(gt1,gt2,gt3,g1,g2,gp,Yd,ZD,ZN,ZDL,ZDR,cplcFdChiSdL(gt1,gt2,gt3)& 
& ,cplcFdChiSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeChiSeL = 0._dp 
cplcFeChiSeR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFeChiSeT(gt1,gt2,gt3,g1,g2,gp,Ye,ZE,ZN,ZEL,ZER,cplcFeChiSeL(gt1,gt2,gt3)& 
& ,cplcFeChiSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuChiSuL = 0._dp 
cplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFuChiSuT(gt1,gt2,gt3,g1,g2,gp,Yu,ZU,ZN,ZUL,ZUR,cplcFuChiSuL(gt1,gt2,gt3)& 
& ,cplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvChiSvL = 0._dp 
cplcFvChiSvR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CouplingcFvChiSvT(gt1,gt2,gt3,g1,g2,gp,Yv,ZV,ZN,ZVL,ZVR,cplcFvChiSvL(gt1,gt2,gt3)& 
& ,cplcFvChiSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFdFdhhT(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)              & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFeFehhT(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)              & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaFecSvL = 0._dp 
cplcChaFecSvR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChaFecSvT(gt1,gt2,gt3,g2,Ye,Yv,ZV,UM,UP,ZEL,ZER,cplcChaFecSvL(gt1,gt2,gt3)& 
& ,cplcChaFecSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFecHpmL = 0._dp 
cplcFvFecHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFvFecHpmT(gt1,gt2,gt3,Ye,Yv,ZP,ZVL,ZVR,ZEL,ZER,cplcFvFecHpmL(gt1,gt2,gt3)& 
& ,cplcFvFecHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)              & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFuHpmT(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3) & 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFvhhL = 0._dp 
cplcFvFvhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcFvFvhhT(gt1,gt2,gt3,Yv,ZH,ZVL,ZVR,cplcFvFvhhL(gt1,gt2,gt3)              & 
& ,cplcFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvHpmL = 0._dp 
cplcFeFvHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFvHpmT(gt1,gt2,gt3,Ye,Yv,ZP,ZVL,ZVR,ZEL,ZER,cplcFeFvHpmL(gt1,gt2,gt3) & 
& ,cplcFeFvHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChacFvSeL = 0._dp 
cplcChacFvSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CouplingcChacFvSeT(gt1,gt2,gt3,g2,Ye,Yv,ZE,ZVL,ZVR,UM,UP,cplcChacFvSeL(gt1,gt2,gt3)& 
& ,cplcChacFvSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChaChaVZL = 0._dp 
cplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZT(gt1,gt2,g1,g2,gp,UM,UP,TW,TWp,cplcChaChaVZL(gt1,gt2)          & 
& ,cplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


cplcChaChaVZpL = 0._dp 
cplcChaChaVZpR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChaChaVZpT(gt1,gt2,g1,g2,gp,UM,UP,TW,TWp,cplcChaChaVZpL(gt1,gt2)        & 
& ,cplcChaChaVZpR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZL = 0._dp 
cplChiChiVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingChiChiVZT(gt1,gt2,g1,g2,gp,ZN,TW,TWp,cplChiChiVZL(gt1,gt2)               & 
& ,cplChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplChiChiVZpL = 0._dp 
cplChiChiVZpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingChiChiVZpT(gt1,gt2,g1,g2,gp,ZN,TW,TWp,cplChiChiVZpL(gt1,gt2)             & 
& ,cplChiChiVZpR(gt1,gt2))

 End Do 
End Do 


cplcChaChiVWmL = 0._dp 
cplcChaChiVWmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 9
Call CouplingcChaChiVWmT(gt1,gt2,g2,ZN,UM,UP,cplcChaChiVWmL(gt1,gt2),cplcChaChiVWmR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZpL = 0._dp 
cplcFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFdFdVZpL(gt1,gt2),cplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZpL = 0._dp 
cplcFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFeFeVZpL(gt1,gt2),cplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWmL = 0._dp 
cplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWmT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWmL(gt1,gt2),cplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZpL = 0._dp 
cplcFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFuFuVZpL(gt1,gt2),cplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWmL = 0._dp 
cplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvVWmT(gt1,gt2,g2,ZVL,ZEL,cplcFeFvVWmL(gt1,gt2),cplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZpL = 0._dp 
cplcFvFvVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZpT(gt1,gt2,g1,g2,gp,TW,TWp,cplcFvFvVZpL(gt1,gt2),cplcFvFvVZpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Sv_decays_3B
 
Function NFlav(m_in) 
Implicit None 
Real(dp), Intent(in) :: m_in 
Real(dp) :: NFlav 
If (m_in.lt.mf_d(3)) Then 
  NFlav = 4._dp 
Else If (m_in.lt.mf_u(3)) Then 
  NFlav = 5._dp 
Else 
  NFlav = 6._dp 
End if 
End Function

Subroutine RunSM(scale_out,deltaM,tb,g1,g2,g3,Yu, Yd, Ye, vd, vu) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM, tb
Real(dp), Intent(out) :: g1, g2, g3, vd, vu
Complex(dp), Intent(out) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

RunningTopMZ = .false.

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  tz=Log(scale_out/sqrt(mz2)) 
  dt=tz/50._dp 
  Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)

End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 vd=vev/Sqrt(1._dp+tb**2)
 vu=tb*vd
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/vd 
Yd(2,2) =gSM(10)*sqrt(2._dp)/vd 
Yd(3,3) =gSM(11)*sqrt(2._dp)/vd 
Ye(1,1) =gSM(3)*sqrt(2._dp)/vd 
Ye(2,2)=gSM(4)*sqrt(2._dp)/vd 
Ye(3,3)=gSM(5)*sqrt(2._dp)/vd 
Yu(1,1)=gSM(6)*sqrt(2._dp)/vu 
Yu(2,2)=gSM(7)*sqrt(2._dp)/vu 
Yu(3,3)=gSM(8)*sqrt(2._dp)/vu 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

!g2=gSM(1)/sqrt(sinW2) 
!g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 

If (YukawaScheme.Eq.1) Then ! CKM into Yu
 If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
   Yu= Matmul(Transpose(CKM),Transpose(Yu))
 Else 
   Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
 End if 

Else ! CKM into Yd 
 
 If (TransposedYukawa) Then ! 
  Yd= Matmul(Conjg(CKM),Transpose(Yd))
 Else 
  Yd=Transpose(Matmul(Conjg(CKM),Transpose(Yd)))
 End if 

End if ! Yukawa scheme
End If ! Generatoin mixing


End Subroutine RunSM


Subroutine RunSMohdm(scale_out,deltaM,g1,g2,g3,Yu, Yd, Ye, v) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM
Real(dp), Intent(out) :: g1, g2, g3, v
Complex(dp), Intent(out) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  If (abs(scale_out - sqrt(mz2)).gt.1.0E-3_dp) Then 
   tz=Log(scale_out/sqrt(mz2)) 
   dt=tz/50._dp 
   Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)
  End if
End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 v = vev
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/v 
Yd(2,2) =gSM(10)*sqrt(2._dp)/v 
Yd(3,3) =gSM(11)*sqrt(2._dp)/v 
Ye(1,1) =gSM(3)*sqrt(2._dp)/v 
Ye(2,2)=gSM(4)*sqrt(2._dp)/v 
Ye(3,3)=gSM(5)*sqrt(2._dp)/v 
Yu(1,1)=gSM(6)*sqrt(2._dp)/v 
Yu(2,2)=gSM(7)*sqrt(2._dp)/v 
Yu(3,3)=gSM(8)*sqrt(2._dp)/v 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

g2=gSM(1)/sqrt(sinW2) 
g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 

If (YukawaScheme.Eq.1) Then ! CKM into Yu
 If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
   Yu= Matmul(Transpose(CKM),Transpose(Yu))
 Else 
   Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
 End if 

Else ! CKM into Yd 
 
 If (TransposedYukawa) Then ! 
  Yd= Matmul(Conjg(CKM),Transpose(Yd))
 Else 
  Yd=Transpose(Matmul(Conjg(CKM),Transpose(Yd)))
 End if 

End if ! Yukawa scheme
End If ! Generation mixing



End Subroutine RunSMohdm

Subroutine RunSMgauge(scale_out,deltaM,g1,g2,g3) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM
Real(dp), Intent(out) :: g1, g2, g3
Complex(dp) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: v, dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

RunningTopMZ = .false.

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  tz=Log(scale_out/sqrt(mz2)) 
  dt=tz/50._dp 
  Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)

End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 v = vev
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/v 
Yd(2,2) =gSM(10)*sqrt(2._dp)/v 
Yd(3,3) =gSM(11)*sqrt(2._dp)/v 
Ye(1,1) =gSM(3)*sqrt(2._dp)/v 
Ye(2,2)=gSM(4)*sqrt(2._dp)/v 
Ye(3,3)=gSM(5)*sqrt(2._dp)/v 
Yu(1,1)=gSM(6)*sqrt(2._dp)/v 
Yu(2,2)=gSM(7)*sqrt(2._dp)/v 
Yu(3,3)=gSM(8)*sqrt(2._dp)/v 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

g2=gSM(1)/sqrt(sinW2) 
g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 
If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
 Yu= Matmul(Transpose(CKM),Transpose(Yu))
Else 
 Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
End if 
End If


End Subroutine RunSMgauge
End Module CouplingsForDecays_sec_UMSSM
