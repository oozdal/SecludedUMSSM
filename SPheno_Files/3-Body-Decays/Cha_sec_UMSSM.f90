! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 1:00 on 7.11.2019   
! ----------------------------------------------------------------------  
 
 
Module Cha3Decays_sec_UMSSM 
 
Use Control 
Use Settings 
Use CouplingsForDecays_sec_UMSSM 
Use ThreeBodyPhaseSpace 
 
Contains 
 
Subroutine ChaThreeBodyDecay(n_in,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,            & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,              & 
& ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,             & 
& Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,             & 
& ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gTAh,gThh,gTHpm,gTSd,              & 
& gTSe,gTSu,gTSv,gTVWm,gTVZ,gTVZp,gChaChacChaCha,gChaChaChiChi,gChaChacFdFd,             & 
& gChaChacFeFe,gChaChacFuFu,gChaChacFvFv,gChaChicFuFd,gChaChicFvFe,gChaFdcFuGlu,         & 
& epsI,deltaM,CheckRealStates,gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(in) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Complex(dp) :: cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),  & 
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

Real(dp),Intent(in) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp),Intent(inout) :: gChaChacChaCha(2,2,2,2),gChaChaChiChi(2,2,9,9),gChaChacFdFd(2,2,3,3),gChaChacFeFe(2,2,3,3),& 
& gChaChacFuFu(2,2,3,3),gChaChacFvFv(2,2,3,3),gChaChicFuFd(2,9,3,3),gChaChicFvFe(2,9,3,3),& 
& gChaFdcFuGlu(2,3,3,1)

Real(dp),Intent(in) :: gTAh(6),gThh(6),gTHpm(2),gTSd(6),gTSe(6),gTSu(6),gTSv(6),gTVWm,gTVZ,gTVZp

Real(dp) :: gChaChacChaChai(2,2,2),gChaChaChiChii(2,9,9),gChaChacFdFdi(2,3,3),gChaChacFeFei(2,3,3),& 
& gChaChacFuFui(2,3,3),gChaChacFvFvi(2,3,3),gChaChicFuFdi(9,3,3),gChaChicFvFei(9,3,3),   & 
& gChaFdcFuGlui(3,3,1)

Real(dp) :: gTAhtemp(6),gThhtemp(6),gTHpmtemp(2),gTSdtemp(6),gTSetemp(6),gTSutemp(6)              & 
& ,gTSvtemp(6),gTVWmtemp,gTVZtemp,gTVZptemp
Integer :: NVs,NVst,NSs,NVVst,NVVss,NVSss,NVSst,NSSss,NSSst
Complex(dp), Allocatable :: IntegralVVst(:,:),IntegralVSss(:,:),IntegralVSst(:,:),IntegralSSss(:,:)               & 
& ,IntegralSSst(:,:)
Real(dp), Allocatable :: IntegralVs(:,:),IntegralVst(:,:),IntegralSs(:,:),IntegralVVss(:,:)
Real(dp), Intent(inout), Optional :: BR(:,:), gPartial(:,:) 
Real(dp), Intent(inout) :: gT(:) 
Integer, Intent(in) :: n_in 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Intent(in) ::  CheckRealStates 
Integer :: i_start, i_end, i_run, n_out, n_length, gt1, gt2, gt3, i1 
Logical :: check 
Iname = Iname +1 
NameOfUnit(Iname) = 'ChaThreeBodyDecay' 
 
Allocate( IntegralVs(25000,9) ) 
Allocate( IntegralVst(25000,12) ) 
Allocate( IntegralSs(500000,10) ) 
Allocate( IntegralVVst(25000,12) ) 
Allocate( IntegralVVss(500000,12) ) 
Allocate( IntegralVSss(500000,12) ) 
Allocate( IntegralVSst(500000,16) ) 
Allocate( IntegralSSss(500000,12) ) 
Allocate( IntegralSSst(500000,16) ) 

 
If (CheckRealStates) Then 
gTAhtemp = 0._dp 
gThhtemp = 0._dp 
gTHpmtemp = 0._dp 
gTSdtemp = 0._dp 
gTSetemp = 0._dp 
gTSutemp = 0._dp 
gTSvtemp = 0._dp 
gTVWmtemp = 0._dp 
gTVZtemp = 0._dp 
gTVZptemp = 0._dp 
Else 
gTAhtemp = gTAh 
gThhtemp = gThh 
gTHpmtemp = gTHpm 
gTSdtemp = gTSd 
gTSetemp = gTSe 
gTSutemp = gTSu 
gTSvtemp = gTSv 
gTVWmtemp = gTVWm 
gTVZtemp = gTVZ 
gTVZptemp = gTVZp 
End If 
 
check=CheckRealStates 

 
If (n_in.Lt.0) Then 
 i_start = 1 
 i_end = 2 
 Else If ( (n_in.Ge.1).And.(n_in.Le. 2) ) Then 
 i_start = n_in 
 i_end = n_in 
Else 
 If (ErrorLevel.Ge.-1) Then 
   Write (ErrCan, *) 'Problem in subroutine'//NameOfUnit(Iname) 
   Write (ErrCan, *) 'Value of n_in out of range, (n_in,2) = ',n_in,2 
 End If 
 
 If (ErrorLevel.Gt.0) Call TerminateProgram 
 
 If (Present(BR)) BR = 0._dp 
 Iname = Iname - 1 
 Return 
End If 
 
Do i_run = i_start, i_end 
 
Call CouplingsFor_Cha_decays_3B(MCha(i_run),i_run,MAh,MAh2,MCha,MCha2,MChi,           & 
& MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,              & 
& MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,              & 
& TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,cplcChacFuSdL,     & 
& cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,   & 
& cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,               & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,             & 
& cplcChaFdcSuR,cplcChaFecSvL,cplcChaFecSvR,cplcFdChaSuL,cplcFdChaSuR,cplcFdFdAhL,       & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcFdFdVZR,cplcFeChaSvL,cplcFeChaSvR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,cplcFuChiSuL,            & 
& cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,      & 
& cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplcFvChiSvL,cplcFvChiSvR,cplcFvFecHpmL,         & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvAhL,cplcFvFvAhR,cplcFvFvhhL,         & 
& cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZpL,cplcFvFvVZpR,cplcFvFvVZR,cplChaFucSdL,            & 
& cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,       & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplGluFdcSdL,cplGluFdcSdR,deltaM)

IntegralVs = 0._dp 
NVs = 0  
IntegralVst = 0._dp 
NVst = 0  
IntegralSs = 0._dp 
NSs = 0  
IntegralVVst = 0._dp 
NVVst = 0  
IntegralVVss = 0._dp 
NVVss = 0  
IntegralVSss = 0._dp 
NVSss = 0  
IntegralVSst = 0._dp 
NVSst = 0  
IntegralSSss = 0._dp 
NSSss = 0  
IntegralSSst = 0._dp 
NSSst = 0  

 
gChaChacChaChai = 0._dp 
Call ChaToChacChaCha(i_run,MCha,MVZ,MVZp,MAh,Mhh,cplcChaChaAhL,cplcChaChaAhR,         & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,             & 
& IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZtemp,        & 
& gTVZptemp,gTAhtemp,gThhtemp,deltaM,epsI,check,gChaChacChaChai)

gChaChacChaCha(i_run,:,:,:) = gChaChacChaChai 
gT(i_run) = gT(i_run) + Sum(gChaChacChaChai) 
 
gChaChaChiChii = 0._dp 
Call ChaToChaChiChi(i_run,MCha,MChi,MVZ,MVZp,MVWm,MHpm,MAh,Mhh,cplcChaChaAhL,         & 
& cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,            & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,              & 
& cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,            & 
& IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,          & 
& NVVst,gTVZtemp,gTVZptemp,gTVWmtemp,gTHpmtemp,gTAhtemp,gThhtemp,deltaM,epsI,            & 
& check,gChaChaChiChii)

gChaChaChiChi(i_run,:,:,:) = gChaChaChiChii 
gT(i_run) = gT(i_run) + Sum(gChaChaChiChii) 
 
gChaChacFdFdi = 0._dp 
Call ChaToChacFdFd(i_run,MCha,MFd,MVZ,MVZp,MSu,MAh,Mhh,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFdChaSuL,cplcFdChaSuR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,             & 
& IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZtemp,gTVZptemp,gTSutemp,        & 
& gTAhtemp,gThhtemp,deltaM,epsI,check,gChaChacFdFdi)

gChaChacFdFd(i_run,:,:,:) = gChaChacFdFdi 
gT(i_run) = gT(i_run) + Sum(gChaChacFdFdi) 
 
gChaChacFeFei = 0._dp 
Call ChaToChacFeFe(i_run,MCha,MFe,MVZ,MVZp,MSv,MAh,Mhh,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFeChaSvL,cplcFeChaSvR,cplcFeFeAhL,cplcFeFeAhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,             & 
& IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZtemp,gTVZptemp,gTSvtemp,        & 
& gTAhtemp,gThhtemp,deltaM,epsI,check,gChaChacFeFei)

gChaChacFeFe(i_run,:,:,:) = gChaChacFeFei 
gT(i_run) = gT(i_run) + Sum(gChaChacFeFei) 
 
gChaChacFuFui = 0._dp 
Call ChaToChacFuFu(i_run,MCha,MFu,MVZ,MVZp,MSd,MAh,Mhh,cplcChacFuSdL,cplcChacFuSdR,   & 
& cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplChaFucSdL,cplChaFucSdR,           & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,             & 
& IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZtemp,gTVZptemp,gTSdtemp,        & 
& gTAhtemp,gThhtemp,deltaM,epsI,check,gChaChacFuFui)

gChaChacFuFu(i_run,:,:,:) = gChaChacFuFui 
gT(i_run) = gT(i_run) + Sum(gChaChacFuFui) 
 
gChaChacFvFvi = 0._dp 
Call ChaToChacFvFv(i_run,MCha,MFv,MVZ,MVZp,MSe,MAh,Mhh,cplcChacFvSeL,cplcChacFvSeR,   & 
& cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,   & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplcFvFvAhL,cplcFvFvAhR,cplcFvFvhhL,cplcFvFvhhR,         & 
& cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,cplChaFvcSeL,cplChaFvcSeR,           & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,             & 
& IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZtemp,gTVZptemp,gTSetemp,        & 
& gTAhtemp,gThhtemp,deltaM,epsI,check,gChaChacFvFvi)

gChaChacFvFv(i_run,:,:,:) = gChaChacFvFvi 
gT(i_run) = gT(i_run) + Sum(gChaChacFvFvi) 
 
gChaChicFuFdi = 0._dp 
Call ChaToChicFuFd(i_run,MChi,MFu,MFd,MVWm,MHpm,MSu,MSd,MCha,cplcChacFuSdL,           & 
& cplcChacFuSdR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplChiFdcSdL,cplChiFdcSdR,IntegralSs,IntegralSSss,         & 
& IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,NSs,NSSss,              & 
& NSSst,NVs,NVSss,NVSst,NVVss,gTVWmtemp,gTHpmtemp,gTSutemp,gTSdtemp,deltaM,              & 
& epsI,check,gChaChicFuFdi)

gChaChicFuFd(i_run,:,:,:) = gChaChicFuFdi 
gT(i_run) = gT(i_run) + Sum(gChaChicFuFdi) 
 
gChaChicFvFei = 0._dp 
Call ChaToChicFvFe(i_run,MChi,MFv,MFe,MVWm,MHpm,MSv,MSe,MCha,cplcChacFvSeL,           & 
& cplcChacFvSeR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFvChiSvL,cplcFvChiSvR,cplcFvFecHpmL,cplcFvFecHpmR,     & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplChiFecSeL,cplChiFecSeR,IntegralSs,IntegralSSss,         & 
& IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,NSs,NSSss,              & 
& NSSst,NVs,NVSss,NVSst,NVVss,gTVWmtemp,gTHpmtemp,gTSvtemp,gTSetemp,deltaM,              & 
& epsI,check,gChaChicFvFei)

gChaChicFvFe(i_run,:,:,:) = gChaChicFvFei 
gT(i_run) = gT(i_run) + Sum(gChaChicFvFei) 
 
gChaFdcFuGlui = 0._dp 
Call ChaToFdcFuGlu(i_run,MFd,MFu,MGlu,MSu,MSd,MCha,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuGluSuL,cplcFuGluSuR,cplGluFdcSdL,cplGluFdcSdR,       & 
& IntegralSs,IntegralSSss,IntegralSSst,NSs,NSSss,NSSst,gTSutemp,gTSdtemp,deltaM,         & 
& epsI,check,gChaFdcFuGlui)

gChaFdcFuGlu(i_run,:,:,:) = gChaFdcFuGlui 
gT(i_run) = gT(i_run) + Sum(gChaFdcFuGlui) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=1,2
  Do gt2=1,2
    Do gt3=gt1,2
gPartial(i1,n_length)= gChaChacChaCha(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,2
  Do gt2=1,9
    Do gt3=gt2,9
gPartial(i1,n_length)= gChaChaChiChi(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gChaChacFdFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gChaChacFeFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gChaChacFuFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gChaChacFvFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,9
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gChaChicFuFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,9
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gChaChicFvFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,1
gPartial(i1,n_length)= gChaFdcFuGlu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
If (Present(BR).And.(gT(i1).Gt.0._dp)) Then 
BR(i1,:)=gPartial(i1,:)/gT(i1)
Else If (Present(BR)) Then
BR(i1,:)=0._dp
End If
 
End Do 
End if 
Deallocate( IntegralVs ) 
Deallocate( IntegralVst ) 
Deallocate( IntegralSs ) 
Deallocate( IntegralVVst ) 
Deallocate( IntegralVVss ) 
Deallocate( IntegralVSss ) 
Deallocate( IntegralVSst ) 
Deallocate( IntegralSSss ) 
Deallocate( IntegralSSst ) 
Iname = Iname - 1 
 
End Subroutine ChaThreeBodyDecay
 
 
Subroutine ChaToChacChaCha(iIN,MCha,MVZ,MVZp,MAh,Mhh,cplcChaChaAhL,cplcChaChaAhR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,             & 
& IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZ,            & 
& gTVZp,gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MCha(2),MVZ,MVZp,MAh(6),Mhh(6)

Complex(dp),Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),  & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16),IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gTAh(6),gThh(6)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MCha(iIN) 
 
Isum = 196 
Allocate( gSum(2,2,2, Isum) ) 
Allocate( Contribution(2,2,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,2
        Do gt3=gt1, iIN-1
Isum = 0 
 
If(Abs(MCha(iIN)).gt.(Abs(MCha(gt3))+Abs(MCha(gt2))+Abs(MCha(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup(2) = Conjg(cplcChaChaVZL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZR(iIN,gt1)) 
coup(4) = Conjg(cplcChaChaVZL(gt2,gt3)) 
coup(3) = Conjg(cplcChaChaVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaChaVZL(iIN,gt3)) 
coup(1) = Conjg(cplcChaChaVZR(iIN,gt3)) 
coup(4) = Conjg(cplcChaChaVZL(gt2,gt1)) 
coup(3) = Conjg(cplcChaChaVZR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt3) 
coup2(2) = cplcChaChaVZR(iIN,gt3) 
coup2(3) = Conjg(cplcChaChaVZL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZR(gt1,iIN))  
coup2(5) = cplcChaChaVZL(gt2,gt1) 
coup2(6) = cplcChaChaVZR(gt2,gt1) 
coup2(7) = Conjg(cplcChaChaVZL(gt3,gt2)) 
coup2(8) = Conjg(cplcChaChaVZR(gt3,gt2)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZp 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZp 
Boson2(2) =gTVZp 
 
Boson4(1) = MVZp 
Boson4(2) =gTVZp 
Boson4(3) = MVZp 
Boson4(4) =gTVZp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup(2) = Conjg(cplcChaChaVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZpR(iIN,gt1)) 
coup(4) = Conjg(cplcChaChaVZpL(gt2,gt3)) 
coup(3) = Conjg(cplcChaChaVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaChaVZpL(iIN,gt3)) 
coup(1) = Conjg(cplcChaChaVZpR(iIN,gt3)) 
coup(4) = Conjg(cplcChaChaVZpL(gt2,gt1)) 
coup(3) = Conjg(cplcChaChaVZpR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt3) 
coup2(2) = cplcChaChaVZpR(iIN,gt3) 
coup2(3) = Conjg(cplcChaChaVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt1,iIN))  
coup2(5) = cplcChaChaVZpL(gt2,gt1) 
coup2(6) = cplcChaChaVZpR(gt2,gt1) 
coup2(7) = Conjg(cplcChaChaVZpL(gt3,gt2)) 
coup2(8) = Conjg(cplcChaChaVZpR(gt3,gt2)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MAh(i1) 
Boson2(2) =gTAh(i1) 
 
Boson4(1) = MAh(i1) 
Boson4(2) =gTAh(i1) 
Boson4(3) = MAh(i1) 
Boson4(4) =gTAh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup(2) = Conjg(cplcChaChaAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChaAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcChaChaAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcChaChaAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaChaAhL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcChaChaAhR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcChaChaAhL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcChaChaAhR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaAhL(iIN,gt3,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i1)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i1))  
coup2(5) = cplcChaChaAhL(gt2,gt1,i1) 
coup2(6) = cplcChaChaAhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcChaChaAhL(gt3,gt2,i1)) 
coup2(7) = Conjg(cplcChaChaAhR(gt3,gt2,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup(2) = Conjg(cplcChaChahhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChahhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcChaChahhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcChaChahhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaChahhL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcChaChahhR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcChaChahhL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcChaChahhR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChahhL(iIN,gt3,i1) 
coup2(2) = cplcChaChahhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i1)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i1))  
coup2(5) = cplcChaChahhL(gt2,gt1,i1) 
coup2(6) = cplcChaChahhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i1)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZp 
Boson4(4) = gTVZp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(3) = Conjg(cplcChaChaVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt1,iIN))  
coup2(5) = cplcChaChaVZL(gt2,gt3) 
coup2(6) = cplcChaChaVZR(gt2,gt3) 
coup2(7) = Conjg(cplcChaChaVZpL(gt3,gt2)) 
coup2(8) = Conjg(cplcChaChaVZpR(gt3,gt2)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt3) 
coup2(2) = cplcChaChaVZR(iIN,gt3) 
coup2(3) = Conjg(cplcChaChaVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt1,iIN))  
coup2(5) = cplcChaChaVZL(gt2,gt1) 
coup2(6) = cplcChaChaVZR(gt2,gt1) 
coup2(7) = Conjg(cplcChaChaVZpL(gt3,gt2)) 
coup2(8) = Conjg(cplcChaChaVZpR(gt3,gt2)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChaVZL(iIN,gt3) 
coup2(2) = cplcChaChaVZR(iIN,gt3) 
coup2(3) = Conjg(cplcChaChaVZpL(gt3,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt3,iIN))  
coup2(5) = cplcChaChaVZL(gt2,gt1) 
coup2(6) = cplcChaChaVZR(gt2,gt1) 
coup2(7) = Conjg(cplcChaChaVZpL(gt1,gt2)) 
coup2(8) = Conjg(cplcChaChaVZpR(gt1,gt2)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(3) = Conjg(cplcChaChaVZpL(gt3,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt3,iIN))  
coup2(5) = cplcChaChaVZL(gt2,gt3) 
coup2(6) = cplcChaChaVZR(gt2,gt3) 
coup2(7) = Conjg(cplcChaChaVZpL(gt1,gt2)) 
coup2(8) = Conjg(cplcChaChaVZpR(gt1,gt2)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaVZL(gt2,gt3) 
coup2(6) = cplcChaChaVZR(gt2,gt3) 
coup2(8) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt3) 
coup2(2) = cplcChaChaVZR(iIN,gt3) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaVZL(gt2,gt1) 
coup2(6) = cplcChaChaVZR(gt2,gt1) 
coup2(8) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt3,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChaVZL(iIN,gt3) 
coup2(2) = cplcChaChaVZR(iIN,gt3) 
coup2(4) = Conjg(cplcChaChaAhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaVZL(gt2,gt1) 
coup2(6) = cplcChaChaVZR(gt2,gt1) 
coup2(8) = Conjg(cplcChaChaAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaVZL(gt2,gt3) 
coup2(6) = cplcChaChaVZR(gt2,gt3) 
coup2(8) = Conjg(cplcChaChaAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt1,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaVZL(gt2,gt3) 
coup2(6) = cplcChaChaVZR(gt2,gt3) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt3) 
coup2(2) = cplcChaChaVZR(iIN,gt3) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaVZL(gt2,gt1) 
coup2(6) = cplcChaChaVZR(gt2,gt1) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChaVZL(iIN,gt3) 
coup2(2) = cplcChaChaVZR(iIN,gt3) 
coup2(4) = Conjg(cplcChaChahhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaVZL(gt2,gt1) 
coup2(6) = cplcChaChaVZR(gt2,gt1) 
coup2(8) = Conjg(cplcChaChahhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaVZL(gt2,gt3) 
coup2(6) = cplcChaChaVZR(gt2,gt3) 
coup2(8) = Conjg(cplcChaChahhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt1,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaVZpL(gt2,gt3) 
coup2(6) = cplcChaChaVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt3) 
coup2(2) = cplcChaChaVZpR(iIN,gt3) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaVZpL(gt2,gt1) 
coup2(6) = cplcChaChaVZpR(gt2,gt1) 
coup2(8) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt3,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt3) 
coup2(2) = cplcChaChaVZpR(iIN,gt3) 
coup2(4) = Conjg(cplcChaChaAhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaVZpL(gt2,gt1) 
coup2(6) = cplcChaChaVZpR(gt2,gt1) 
coup2(8) = Conjg(cplcChaChaAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaVZpL(gt2,gt3) 
coup2(6) = cplcChaChaVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcChaChaAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt1,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: VZp,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Ah'
      End Do 



!-------------- 
!  VZp, hh 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaVZpL(gt2,gt3) 
coup2(6) = cplcChaChaVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt3) 
coup2(2) = cplcChaChaVZpR(iIN,gt3) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaVZpL(gt2,gt1) 
coup2(6) = cplcChaChaVZpR(gt2,gt1) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt3) 
coup2(2) = cplcChaChaVZpR(iIN,gt3) 
coup2(4) = Conjg(cplcChaChahhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaVZpL(gt2,gt1) 
coup2(6) = cplcChaChaVZpR(gt2,gt1) 
coup2(8) = Conjg(cplcChaChahhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaVZpL(gt2,gt3) 
coup2(6) = cplcChaChaVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcChaChahhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt1,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: VZp,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,hh'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaAhL(gt2,gt3,i1) 
coup2(6) = cplcChaChaAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaAhL(iIN,gt3,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaAhL(gt2,gt1,i1) 
coup2(6) = cplcChaChaAhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChaAhL(iIN,gt3,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaAhL(gt2,gt1,i1) 
coup2(6) = cplcChaChaAhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcChaChaAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt1,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaAhL(gt2,gt3,i1) 
coup2(6) = cplcChaChaAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcChaChaAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChaAhR(gt1,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaAhL(gt2,gt3,i1) 
coup2(6) = cplcChaChaAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaAhL(iIN,gt3,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcChaChaAhL(gt2,gt1,i1) 
coup2(6) = cplcChaChaAhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChaAhL(iIN,gt3,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaAhL(gt2,gt1,i1) 
coup2(6) = cplcChaChaAhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt1,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt3,iIN,i2))  
coup2(5) = cplcChaChaAhL(gt2,gt3,i1) 
coup2(6) = cplcChaChaAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt1,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt3) 
 
coup2(1) = cplcChaChahhL(iIN,gt1,i1) 
coup2(2) = cplcChaChahhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcChaChahhL(gt2,gt3,i1) 
coup2(6) = cplcChaChahhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MCha(gt3) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChahhL(iIN,gt3,i1) 
coup2(2) = cplcChaChahhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcChaChahhL(gt2,gt1,i1) 
coup2(6) = cplcChaChahhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(3) = -MCha(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChahhL(iIN,gt3,i1) 
coup2(2) = cplcChaChahhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt3,iIN,i2))  
coup2(5) = cplcChaChahhL(gt2,gt1,i1) 
coup2(6) = cplcChaChahhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt1,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MCha(gt2) 
 
coup2(1) = cplcChaChahhL(iIN,gt1,i1) 
coup2(2) = cplcChaChahhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt3,iIN,i2))  
coup2(5) = cplcChaChahhL(gt2,gt3,i1) 
coup2(6) = cplcChaChahhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcChaChahhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcChaChahhR(gt1,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cCha Cha Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,2
        Do gt3=gt1, iIN-1
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:196))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MCha(iIN))**3*g
End Subroutine ChaToChacChaCha 
 
 
Subroutine ChaToChaChiChi(iIN,MCha,MChi,MVZ,MVZp,MVWm,MHpm,MAh,Mhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,            & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,              & 
& cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,            & 
& IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,          & 
& NVVst,gTVZ,gTVZp,gTVWm,gTHpm,gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MCha(2),MChi(9),MVZ,MVZp,MVWm,MHpm(2),MAh(6),Mhh(6)

Complex(dp),Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),  & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),         & 
& cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9),   & 
& cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChiChacVWmL(9,2),cplChiChacVWmR(9,2),   & 
& cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),       & 
& cplChiChiVZL(9,9),cplChiChiVZR(9,9),cplChiChiVZpL(9,9),cplChiChiVZpR(9,9)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16),IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gTVWm,gTHpm(2),gTAh(6),gThh(6)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MCha(iIN) 
 
Isum = 289 
Allocate( gSum(2,9,9, Isum) ) 
Allocate( Contribution(2,9,9, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,9
        Do gt3=gt2,9
Isum = 0 
 
If(Abs(MCha(iIN)).gt.(Abs(MChi(gt3))+Abs(MChi(gt2))+Abs(MCha(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplcChaChaVZL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZR(iIN,gt1)) 
coup(4) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(3) = Conjg(cplChiChiVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup(2) = Conjg(cplcChaChaVZL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZR(iIN,gt1)) 
coup(4) = Conjg(cplChiChiVZL(gt3,gt2)) 
coup(3) = Conjg(cplChiChiVZR(gt3,gt2))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(3) = Conjg(cplcChaChaVZL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZR(gt1,iIN))  
coup2(5) = cplChiChiVZL(gt3,gt2) 
coup2(6) = cplChiChiVZR(gt3,gt2) 
coup2(7) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup2(8) = Conjg(cplChiChiVZR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZp 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZp 
Boson2(2) =gTVZp 
 
Boson4(1) = MVZp 
Boson4(2) =gTVZp 
Boson4(3) = MVZp 
Boson4(4) =gTVZp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplcChaChaVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZpR(iIN,gt1)) 
coup(4) = Conjg(cplChiChiVZpL(gt2,gt3)) 
coup(3) = Conjg(cplChiChiVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup(2) = Conjg(cplcChaChaVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZpR(iIN,gt1)) 
coup(4) = Conjg(cplChiChiVZpL(gt3,gt2)) 
coup(3) = Conjg(cplChiChiVZpR(gt3,gt2))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(3) = Conjg(cplcChaChaVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt1,iIN))  
coup2(5) = cplChiChiVZpL(gt3,gt2) 
coup2(6) = cplChiChiVZpR(gt3,gt2) 
coup2(7) = Conjg(cplChiChiVZpL(gt2,gt3)) 
coup2(8) = Conjg(cplChiChiVZpR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWm 
Boson2(2) =gTVWm 
 
Boson4(1) = MVWm 
Boson4(2) =gTVWm 
Boson4(3) = MVWm 
Boson4(4) =gTVWm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MChi(gt2) 
mass(3) = -MChi(gt3) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaChiVWmL(iIN,gt2)) 
coup(1) = Conjg(cplcChaChiVWmR(iIN,gt2)) 
coup(4) = Conjg(cplChiChacVWmL(gt3,gt1)) 
coup(3) = Conjg(cplChiChacVWmR(gt3,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MChi(gt3) 
mass(3) = -MChi(gt2) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaChiVWmL(iIN,gt3)) 
coup(1) = Conjg(cplcChaChiVWmR(iIN,gt3)) 
coup(4) = Conjg(cplChiChacVWmL(gt2,gt1)) 
coup(3) = Conjg(cplChiChacVWmR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MChi(gt2) 
mass(4) = MChi(gt3) 
mass(3) = -MCha(gt1) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt3) 
coup2(2) = cplcChaChiVWmR(iIN,gt3) 
coup2(4) = cplcChaChiVWmL(iIN,gt2) 
coup2(3) = cplcChaChiVWmR(iIN,gt2)  
coup2(5) = cplChiChacVWmL(gt2,gt1) 
coup2(6) = cplChiChacVWmR(gt2,gt1) 
coup2(8) = cplChiChacVWmL(gt3,gt1) 
coup2(7) = cplChiChacVWmR(gt3,gt1) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm'



!-------------- 
!  Hpm 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = MHpm(i1) 
Boson2(2) =gTHpm(i1) 
 
Boson4(1) = MHpm(i1) 
Boson4(2) =gTHpm(i1) 
Boson4(3) = MHpm(i1) 
Boson4(4) =gTHpm(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MChi(gt2) 
mass(3) = -MChi(gt3) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaChiHpmL(iIN,gt2,i1)) 
coup(1) = Conjg(cplcChaChiHpmR(iIN,gt2,i1)) 
coup(4) = Conjg(cplChiChacHpmL(gt3,gt1,i1)) 
coup(3) = Conjg(cplChiChacHpmR(gt3,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MChi(gt3) 
mass(3) = -MChi(gt2) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaChiHpmL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcChaChiHpmR(iIN,gt3,i1)) 
coup(4) = Conjg(cplChiChacHpmL(gt2,gt1,i1)) 
coup(3) = Conjg(cplChiChacHpmR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MChi(gt2) 
mass(4) = MChi(gt3) 
mass(3) = -MCha(gt1) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt3,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt3,i1) 
coup2(4) = cplcChaChiHpmL(iIN,gt2,i1) 
coup2(3) = cplcChaChiHpmR(iIN,gt2,i1)  
coup2(5) = cplChiChacHpmL(gt2,gt1,i1) 
coup2(6) = cplChiChacHpmR(gt2,gt1,i1) 
coup2(8) = cplChiChacHpmL(gt3,gt1,i1) 
coup2(7) = cplChiChacHpmR(gt3,gt1,i1) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm'
      End Do 



!-------------- 
!  Ah 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MAh(i1) 
Boson2(2) =gTAh(i1) 
 
Boson4(1) = MAh(i1) 
Boson4(2) =gTAh(i1) 
Boson4(3) = MAh(i1) 
Boson4(4) =gTAh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplcChaChaAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChaAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplChiChiAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup(2) = Conjg(cplcChaChaAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChaAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplChiChiAhL(gt3,gt2,i1)) 
coup(3) = Conjg(cplChiChiAhR(gt3,gt2,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i1)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i1))  
coup2(5) = cplChiChiAhL(gt3,gt2,i1) 
coup2(6) = cplChiChiAhR(gt3,gt2,i1) 
coup2(8) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup2(7) = Conjg(cplChiChiAhR(gt2,gt3,i1)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplcChaChahhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChahhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplChiChihhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup(2) = Conjg(cplcChaChahhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChahhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplChiChihhL(gt3,gt2,i1)) 
coup(3) = Conjg(cplChiChihhR(gt3,gt2,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MCha(gt1) 
mass(3) = -MChi(gt3) 
mass(4) = MChi(gt2) 
 
coup2(1) = cplcChaChahhL(iIN,gt1,i1) 
coup2(2) = cplcChaChahhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i1)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i1))  
coup2(5) = cplChiChihhL(gt3,gt2,i1) 
coup2(6) = cplChiChihhR(gt3,gt2,i1) 
coup2(8) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup2(7) = Conjg(cplChiChihhR(gt2,gt3,i1)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZp 
Boson4(4) = gTVZp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(3) = Conjg(cplcChaChaVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt1,iIN))  
coup2(5) = cplChiChiVZL(gt2,gt3) 
coup2(6) = cplChiChiVZR(gt2,gt3) 
coup2(7) = Conjg(cplChiChiVZpL(gt2,gt3)) 
coup2(8) = Conjg(cplChiChiVZpR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, VWm 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVWm 
Boson4(4) = gTVWm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(4) = MCha(gt1) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = cplcChaChiVWmL(iIN,gt2) 
coup2(3) = cplcChaChiVWmR(iIN,gt2)  
coup2(5) = cplChiChiVZL(gt2,gt3) 
coup2(6) = cplChiChiVZR(gt2,gt3) 
coup2(8) = cplChiChacVWmL(gt3,gt1) 
coup2(7) = cplChiChacVWmR(gt3,gt1) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = cplcChaChiVWmL(iIN,gt3) 
coup2(3) = cplcChaChiVWmR(iIN,gt3)  
coup2(5) = cplChiChiVZL(gt2,gt3) 
coup2(6) = cplChiChiVZR(gt2,gt3) 
coup2(8) = cplChiChacVWmL(gt2,gt1) 
coup2(7) = cplChiChacVWmR(gt2,gt1) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZ,VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VWm'



!-------------- 
!  VZ, Hpm 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(4) = MCha(gt1) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = cplcChaChiHpmL(iIN,gt2,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt2,i2)  
coup2(5) = cplChiChiVZL(gt2,gt3) 
coup2(6) = cplChiChiVZR(gt2,gt3) 
coup2(8) = cplChiChacHpmL(gt3,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt3,gt1,i2) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = cplcChaChiHpmL(iIN,gt3,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt3,i2)  
coup2(5) = cplChiChiVZL(gt2,gt3) 
coup2(6) = cplChiChiVZR(gt2,gt3) 
coup2(8) = cplChiChacHpmL(gt2,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZ,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Hpm'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplChiChiVZL(gt2,gt3) 
coup2(6) = cplChiChiVZR(gt2,gt3) 
coup2(8) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChiAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplChiChiVZL(gt2,gt3) 
coup2(6) = cplChiChiVZR(gt2,gt3) 
coup2(8) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChihhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZp, VWm 
!-------------- 
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MVWm 
Boson4(4) = gTVWm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(4) = MCha(gt1) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = cplcChaChiVWmL(iIN,gt2) 
coup2(3) = cplcChaChiVWmR(iIN,gt2)  
coup2(5) = cplChiChiVZpL(gt2,gt3) 
coup2(6) = cplChiChiVZpR(gt2,gt3) 
coup2(8) = cplChiChacVWmL(gt3,gt1) 
coup2(7) = cplChiChacVWmR(gt3,gt1) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = cplcChaChiVWmL(iIN,gt3) 
coup2(3) = cplcChaChiVWmR(iIN,gt3)  
coup2(5) = cplChiChiVZpL(gt2,gt3) 
coup2(6) = cplChiChiVZpR(gt2,gt3) 
coup2(8) = cplChiChacVWmL(gt2,gt1) 
coup2(7) = cplChiChacVWmR(gt2,gt1) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZp,VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,VWm'



!-------------- 
!  VZp, Hpm 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(4) = MCha(gt1) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = cplcChaChiHpmL(iIN,gt2,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt2,i2)  
coup2(5) = cplChiChiVZpL(gt2,gt3) 
coup2(6) = cplChiChiVZpR(gt2,gt3) 
coup2(8) = cplChiChacHpmL(gt3,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt3,gt1,i2) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = cplcChaChiHpmL(iIN,gt3,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt3,i2)  
coup2(5) = cplChiChiVZpL(gt2,gt3) 
coup2(6) = cplChiChiVZpR(gt2,gt3) 
coup2(8) = cplChiChacHpmL(gt2,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZp,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Hpm'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplChiChiVZpL(gt2,gt3) 
coup2(6) = cplChiChiVZpR(gt2,gt3) 
coup2(8) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChiAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZp,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Ah'
      End Do 



!-------------- 
!  VZp, hh 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplChiChiVZpL(gt2,gt3) 
coup2(6) = cplChiChiVZpR(gt2,gt3) 
coup2(8) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChihhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VZp,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,hh'
      End Do 



!-------------- 
!  VWm, Hpm 
!-------------- 
  Do i2=1,2
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(3) = -MChi(gt3) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt2) 
coup2(2) = cplcChaChiVWmR(iIN,gt2) 
coup2(4) = cplcChaChiHpmL(iIN,gt2,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt2,i2)  
coup2(5) = cplChiChacVWmL(gt3,gt1) 
coup2(6) = cplChiChacVWmR(gt3,gt1) 
coup2(8) = cplChiChacHpmL(gt3,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt3,gt1,i2) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt2) 
mass(4) = MChi(gt3) 
mass(3) = -MCha(gt1) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt3) 
coup2(2) = cplcChaChiVWmR(iIN,gt3) 
coup2(4) = cplcChaChiHpmL(iIN,gt2,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt2,i2)  
coup2(5) = cplChiChacVWmL(gt2,gt1) 
coup2(6) = cplChiChacVWmR(gt2,gt1) 
coup2(8) = cplChiChacHpmL(gt3,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt3,gt1,i2) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(3) = -MChi(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt3) 
coup2(2) = cplcChaChiVWmR(iIN,gt3) 
coup2(4) = cplcChaChiHpmL(iIN,gt3,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt3,i2)  
coup2(5) = cplChiChacVWmL(gt2,gt1) 
coup2(6) = cplChiChacVWmR(gt2,gt1) 
coup2(8) = cplChiChacHpmL(gt2,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt2,gt1,i2) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(4) = MChi(gt2) 
mass(3) = -MCha(gt1) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt2) 
coup2(2) = cplcChaChiVWmR(iIN,gt2) 
coup2(4) = cplcChaChiHpmL(iIN,gt3,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt3,i2)  
coup2(5) = cplChiChacVWmL(gt3,gt1) 
coup2(6) = cplChiChacVWmR(gt3,gt1) 
coup2(8) = cplChiChacHpmL(gt2,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VWm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Hpm'
      End Do 



!-------------- 
!  VWm, Ah 
!-------------- 
  Do i2=1,6
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MChi(gt2) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt2) 
coup2(2) = cplcChaChiVWmR(iIN,gt2) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplChiChacVWmL(gt3,gt1) 
coup2(6) = cplChiChacVWmR(gt3,gt1) 
coup2(8) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChiAhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MChi(gt3) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt3) 
coup2(2) = cplcChaChiVWmR(iIN,gt3) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplChiChacVWmL(gt2,gt1) 
coup2(6) = cplChiChacVWmR(gt2,gt1) 
coup2(8) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChiAhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VWm,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Ah'
      End Do 



!-------------- 
!  VWm, hh 
!-------------- 
  Do i2=1,6
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MChi(gt2) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt2) 
coup2(2) = cplcChaChiVWmR(iIN,gt2) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplChiChacVWmL(gt3,gt1) 
coup2(6) = cplChiChacVWmR(gt3,gt1) 
coup2(8) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChihhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MChi(gt3) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt3) 
coup2(2) = cplcChaChiVWmR(iIN,gt3) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplChiChacVWmL(gt2,gt1) 
coup2(6) = cplChiChacVWmR(gt2,gt1) 
coup2(8) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChihhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: VWm,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,hh'
      End Do 



!-------------- 
!  Hpm, Hpm 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(3) = -MChi(gt3) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt2,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt2,i1) 
coup2(4) = cplcChaChiHpmL(iIN,gt2,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt2,i2)  
coup2(5) = cplChiChacHpmL(gt3,gt1,i1) 
coup2(6) = cplChiChacHpmR(gt3,gt1,i1) 
coup2(8) = cplChiChacHpmL(gt3,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt3,gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt2) 
mass(4) = MChi(gt3) 
mass(3) = -MCha(gt1) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt3,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt3,i1) 
coup2(4) = cplcChaChiHpmL(iIN,gt2,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt2,i2)  
coup2(5) = cplChiChacHpmL(gt2,gt1,i1) 
coup2(6) = cplChiChacHpmR(gt2,gt1,i1) 
coup2(8) = cplChiChacHpmL(gt3,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt3,gt1,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(3) = -MChi(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt3,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt3,i1) 
coup2(4) = cplcChaChiHpmL(iIN,gt3,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt3,i2)  
coup2(5) = cplChiChacHpmL(gt2,gt1,i1) 
coup2(6) = cplChiChacHpmR(gt2,gt1,i1) 
coup2(8) = cplChiChacHpmL(gt2,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt2,gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(4) = MChi(gt2) 
mass(3) = -MCha(gt1) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt2,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt2,i1) 
coup2(4) = cplcChaChiHpmL(iIN,gt3,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt3,i2)  
coup2(5) = cplChiChacHpmL(gt3,gt1,i1) 
coup2(6) = cplChiChacHpmR(gt3,gt1,i1) 
coup2(8) = cplChiChacHpmL(gt2,gt1,i2) 
coup2(7) = cplChiChacHpmR(gt2,gt1,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: Hpm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Hpm'
        End Do 
      End Do 



!-------------- 
!  Hpm, Ah 
!-------------- 
Do i1=1,2
  Do i2=1,6
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MChi(gt2) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt2,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt2,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplChiChacHpmL(gt3,gt1,i1) 
coup2(6) = cplChiChacHpmR(gt3,gt1,i1) 
coup2(8) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChiAhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MChi(gt3) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt3,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplChiChacHpmL(gt2,gt1,i1) 
coup2(6) = cplChiChacHpmR(gt2,gt1,i1) 
coup2(8) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChiAhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: Hpm,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Ah'
        End Do 
      End Do 



!-------------- 
!  Hpm, hh 
!-------------- 
Do i1=1,2
  Do i2=1,6
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MChi(gt2) 
mass(3) = -MChi(gt3) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt2,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt2,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplChiChacHpmL(gt3,gt1,i1) 
coup2(6) = cplChiChacHpmR(gt3,gt1,i1) 
coup2(8) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChihhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MCha(gt1) 
mass(4) = MChi(gt3) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt3,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplChiChacHpmL(gt2,gt1,i1) 
coup2(6) = cplChiChacHpmR(gt2,gt1,i1) 
coup2(8) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChihhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: Hpm,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,hh'
        End Do 
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplChiChiAhL(gt2,gt3,i1) 
coup2(6) = cplChiChiAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChiAhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplChiChiAhL(gt2,gt3,i1) 
coup2(6) = cplChiChiAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChihhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcChaChahhL(iIN,gt1,i1) 
coup2(2) = cplcChaChahhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplChiChihhL(gt2,gt3,i1) 
coup2(6) = cplChiChihhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplChiChihhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha Chi Chi Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,9
        Do gt3=gt2,9
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:289))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MCha(iIN))**3*g
End Subroutine ChaToChaChiChi 
 
 
Subroutine ChaToChacFdFd(iIN,MCha,MFd,MVZ,MVZp,MSu,MAh,Mhh,cplcChaChaAhL,             & 
& cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFdChaSuL,cplcFdChaSuR,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,             & 
& IntegralVSst,IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZ,gTVZp,            & 
& gTSu,gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MCha(2),MFd(3),MVZ,MVZp,MSu(6),MAh(6),Mhh(6)

Complex(dp),Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),  & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),         & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),     & 
& cplcFdFdAhL(3,3,6),cplcFdFdAhR(3,3,6),cplcFdFdhhL(3,3,6),cplcFdFdhhR(3,3,6),           & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gTSu(6),gTAh(6),gThh(6)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MCha(iIN) 
 
Isum = 400 
Allocate( gSum(2,3,3, Isum) ) 
Allocate( Contribution(2,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MCha(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(MCha(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcChaChaVZL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZp 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZp 
Boson2(2) =gTVZp 
 
Boson4(1) = MVZp 
Boson4(2) =gTVZp 
Boson4(3) = MVZp 
Boson4(4) =gTVZp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcChaChaVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZpR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZpL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  conj[Su] 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSu(i1) 
Boson2(2) =gTSu(i1) 
 
Boson4(1) = MSu(i1) 
Boson4(2) =gTSu(i1) 
Boson4(3) = MSu(i1) 
Boson4(4) =gTSu(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaFdcSuL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcChaFdcSuR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFdChaSuL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFdChaSuR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su]'
      End Do 



!-------------- 
!  Ah 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MAh(i1) 
Boson2(2) =gTAh(i1) 
 
Boson4(1) = MAh(i1) 
Boson4(2) =gTAh(i1) 
Boson4(3) = MAh(i1) 
Boson4(4) =gTAh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcChaChaAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChaAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFdFdAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFdFdAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcChaChahhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChahhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFdFdhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFdFdhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZp 
Boson4(4) = gTVZp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(3) = Conjg(cplcChaChaVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt1,iIN))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdVZpL(gt3,gt2)) 
coup2(8) = Conjg(cplcFdFdVZpR(gt3,gt2)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, conj[Su] 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MSu(i2) 
Boson4(4) = gTSu(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = cplcChaFdcSuL(iIN,gt3,i2) 
coup2(3) = cplcChaFdcSuR(iIN,gt3,i2)  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(8) = cplcFdChaSuL(gt2,gt1,i2) 
coup2(7) = cplcFdChaSuR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: VZ,conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,conj[Su]'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZp, conj[Su] 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MSu(i2) 
Boson4(4) = gTSu(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = cplcChaFdcSuL(iIN,gt3,i2) 
coup2(3) = cplcChaFdcSuR(iIN,gt3,i2)  
coup2(5) = cplcFdFdVZpL(gt2,gt3) 
coup2(6) = cplcFdFdVZpR(gt2,gt3) 
coup2(8) = cplcFdChaSuL(gt2,gt1,i2) 
coup2(7) = cplcFdChaSuR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: VZp,conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,conj[Su]'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdVZpL(gt2,gt3) 
coup2(6) = cplcFdFdVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: VZp,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Ah'
      End Do 



!-------------- 
!  VZp, hh 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdVZpL(gt2,gt3) 
coup2(6) = cplcFdFdVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: VZp,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,hh'
      End Do 



!-------------- 
!  conj[Su], conj[Su] 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSu(i1) 
Boson4(2) = gTSu(i1) 
Boson4(3) = MSu(i2) 
Boson4(4) = gTSu(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaFdcSuL(iIN,gt3,i1) 
coup2(2) = cplcChaFdcSuR(iIN,gt3,i1) 
coup2(4) = cplcChaFdcSuL(iIN,gt3,i2) 
coup2(3) = cplcChaFdcSuR(iIN,gt3,i2)  
coup2(5) = cplcFdChaSuL(gt2,gt1,i1) 
coup2(6) = cplcFdChaSuR(gt2,gt1,i1) 
coup2(8) = cplcFdChaSuL(gt2,gt1,i2) 
coup2(7) = cplcFdChaSuR(gt2,gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: conj[Su],conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su],conj[Su]'
        End Do 
      End Do 



!-------------- 
!  conj[Su], Ah 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MSu(i1) 
Boson4(2) = gTSu(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcChaFdcSuL(iIN,gt3,i1) 
coup2(2) = cplcChaFdcSuR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFdChaSuL(gt2,gt1,i1) 
coup2(6) = cplcFdChaSuR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdAhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: conj[Su],Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su],Ah'
        End Do 
      End Do 



!-------------- 
!  conj[Su], hh 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MSu(i1) 
Boson4(2) = gTSu(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcChaFdcSuL(iIN,gt3,i1) 
coup2(2) = cplcChaFdcSuR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFdChaSuL(gt2,gt1,i1) 
coup2(6) = cplcFdChaSuR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: conj[Su],hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su],hh'
        End Do 
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdAhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcChaChahhL(iIN,gt1,i1) 
coup2(2) = cplcChaChahhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdhhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdhhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFd Fd Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:400))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MCha(iIN))**3*g
End Subroutine ChaToChacFdFd 
 
 
Subroutine ChaToChacFeFe(iIN,MCha,MFe,MVZ,MVZp,MSv,MAh,Mhh,cplcChaChaAhL,             & 
& cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFeChaSvL,cplcFeChaSvR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,              & 
& cplcFeFeVZpR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,             & 
& IntegralVSst,IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZ,gTVZp,            & 
& gTSv,gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MCha(2),MFe(3),MVZ,MVZp,MSv(6),MAh(6),Mhh(6)

Complex(dp),Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),  & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),         & 
& cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),     & 
& cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6),cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),           & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gTSv(6),gTAh(6),gThh(6)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MCha(iIN) 
 
Isum = 400 
Allocate( gSum(2,3,3, Isum) ) 
Allocate( Contribution(2,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MCha(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(MCha(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcChaChaVZL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZp 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZp 
Boson2(2) =gTVZp 
 
Boson4(1) = MVZp 
Boson4(2) =gTVZp 
Boson4(3) = MVZp 
Boson4(4) =gTVZp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcChaChaVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZpR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZpL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  conj[Sv] 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSv(i1) 
Boson2(2) =gTSv(i1) 
 
Boson4(1) = MSv(i1) 
Boson4(2) =gTSv(i1) 
Boson4(3) = MSv(i1) 
Boson4(4) =gTSv(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChaFecSvL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcChaFecSvR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFeChaSvL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFeChaSvR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: conj[Sv]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Sv]'
      End Do 



!-------------- 
!  Ah 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MAh(i1) 
Boson2(2) =gTAh(i1) 
 
Boson4(1) = MAh(i1) 
Boson4(2) =gTAh(i1) 
Boson4(3) = MAh(i1) 
Boson4(4) =gTAh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcChaChaAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChaAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFeFeAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFeFeAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcChaChahhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChahhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFeFehhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFeFehhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZp 
Boson4(4) = gTVZp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(3) = Conjg(cplcChaChaVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt1,iIN))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFeVZpL(gt3,gt2)) 
coup2(8) = Conjg(cplcFeFeVZpR(gt3,gt2)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, conj[Sv] 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MSv(i2) 
Boson4(4) = gTSv(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = cplcChaFecSvL(iIN,gt3,i2) 
coup2(3) = cplcChaFecSvR(iIN,gt3,i2)  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(8) = cplcFeChaSvL(gt2,gt1,i2) 
coup2(7) = cplcFeChaSvR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: VZ,conj[Sv]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,conj[Sv]'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFeAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZp, conj[Sv] 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MSv(i2) 
Boson4(4) = gTSv(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MCha(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = cplcChaFecSvL(iIN,gt3,i2) 
coup2(3) = cplcChaFecSvR(iIN,gt3,i2)  
coup2(5) = cplcFeFeVZpL(gt2,gt3) 
coup2(6) = cplcFeFeVZpR(gt2,gt3) 
coup2(8) = cplcFeChaSvL(gt2,gt1,i2) 
coup2(7) = cplcFeChaSvR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: VZp,conj[Sv]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,conj[Sv]'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeVZpL(gt2,gt3) 
coup2(6) = cplcFeFeVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFeAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: VZp,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Ah'
      End Do 



!-------------- 
!  VZp, hh 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeVZpL(gt2,gt3) 
coup2(6) = cplcFeFeVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: VZp,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,hh'
      End Do 



!-------------- 
!  conj[Sv], conj[Sv] 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSv(i1) 
Boson4(2) = gTSv(i1) 
Boson4(3) = MSv(i2) 
Boson4(4) = gTSv(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChaFecSvL(iIN,gt3,i1) 
coup2(2) = cplcChaFecSvR(iIN,gt3,i1) 
coup2(4) = cplcChaFecSvL(iIN,gt3,i2) 
coup2(3) = cplcChaFecSvR(iIN,gt3,i2)  
coup2(5) = cplcFeChaSvL(gt2,gt1,i1) 
coup2(6) = cplcFeChaSvR(gt2,gt1,i1) 
coup2(8) = cplcFeChaSvL(gt2,gt1,i2) 
coup2(7) = cplcFeChaSvR(gt2,gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: conj[Sv],conj[Sv]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Sv],conj[Sv]'
        End Do 
      End Do 



!-------------- 
!  conj[Sv], Ah 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MSv(i1) 
Boson4(2) = gTSv(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcChaFecSvL(iIN,gt3,i1) 
coup2(2) = cplcChaFecSvR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFeChaSvL(gt2,gt1,i1) 
coup2(6) = cplcFeChaSvR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFeAhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: conj[Sv],Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Sv],Ah'
        End Do 
      End Do 



!-------------- 
!  conj[Sv], hh 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MSv(i1) 
Boson4(2) = gTSv(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcChaFecSvL(iIN,gt3,i1) 
coup2(2) = cplcChaFecSvR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFeChaSvL(gt2,gt1,i1) 
coup2(6) = cplcFeChaSvR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: conj[Sv],hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Sv],hh'
        End Do 
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeAhL(gt2,gt3,i1) 
coup2(6) = cplcFeFeAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFeAhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeAhL(gt2,gt3,i1) 
coup2(6) = cplcFeFeAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaChahhL(iIN,gt1,i1) 
coup2(2) = cplcChaChahhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFeFehhL(gt2,gt3,i1) 
coup2(6) = cplcFeFehhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFe Fe Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:400))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MCha(iIN))**3*g
End Subroutine ChaToChacFeFe 
 
 
Subroutine ChaToChacFuFu(iIN,MCha,MFu,MVZ,MVZp,MSd,MAh,Mhh,cplcChacFuSdL,             & 
& cplcChacFuSdR,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,   & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,       & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplChaFucSdL,            & 
& cplChaFucSdR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,             & 
& IntegralVSst,IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZ,gTVZp,            & 
& gTSd,gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MCha(2),MFu(3),MVZ,MVZp,MSd(6),MAh(6),Mhh(6)

Complex(dp),Intent(in) :: cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),  & 
& cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),       & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcFuFuAhL(3,3,6),cplcFuFuAhR(3,3,6),         & 
& cplcFuFuhhL(3,3,6),cplcFuFuhhR(3,3,6),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gTSd(6),gTAh(6),gThh(6)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MCha(iIN) 
 
Isum = 400 
Allocate( gSum(2,3,3, Isum) ) 
Allocate( Contribution(2,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MCha(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(MCha(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcChaChaVZL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZp 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZp 
Boson2(2) =gTVZp 
 
Boson4(1) = MVZp 
Boson4(2) =gTVZp 
Boson4(3) = MVZp 
Boson4(4) =gTVZp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcChaChaVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZpR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZpL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  Sd 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSd(i1) 
Boson2(2) =gTSd(i1) 
 
Boson4(1) = MSd(i1) 
Boson4(2) =gTSd(i1) 
Boson4(3) = MSd(i1) 
Boson4(4) =gTSd(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt2) 
mass(3) = -MFu(gt3) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChacFuSdL(iIN,gt2,i1)) 
coup(1) = Conjg(cplcChacFuSdR(iIN,gt2,i1)) 
coup(4) = Conjg(cplChaFucSdL(gt1,gt3,i1)) 
coup(3) = Conjg(cplChaFucSdR(gt1,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd'
      End Do 



!-------------- 
!  Ah 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MAh(i1) 
Boson2(2) =gTAh(i1) 
 
Boson4(1) = MAh(i1) 
Boson4(2) =gTAh(i1) 
Boson4(3) = MAh(i1) 
Boson4(4) =gTAh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcChaChaAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChaAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuFuAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFuFuAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcChaChahhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChahhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuFuhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFuFuhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZp 
Boson4(4) = gTVZp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(3) = Conjg(cplcChaChaVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt1,iIN))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuVZpL(gt3,gt2)) 
coup2(8) = Conjg(cplcFuFuVZpR(gt3,gt2)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, Sd 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MSd(i2) 
Boson4(4) = gTSd(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt2) 
mass(4) = MCha(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = cplcChacFuSdL(iIN,gt2,i2) 
coup2(3) = cplcChacFuSdR(iIN,gt2,i2)  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(8) = cplChaFucSdL(gt1,gt3,i2) 
coup2(7) = cplChaFucSdR(gt1,gt3,i2) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: VZ,Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Sd'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuhhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZp, Sd 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MSd(i2) 
Boson4(4) = gTSd(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt2) 
mass(4) = MCha(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = cplcChacFuSdL(iIN,gt2,i2) 
coup2(3) = cplcChacFuSdR(iIN,gt2,i2)  
coup2(5) = cplcFuFuVZpL(gt2,gt3) 
coup2(6) = cplcFuFuVZpR(gt2,gt3) 
coup2(8) = cplChaFucSdL(gt1,gt3,i2) 
coup2(7) = cplChaFucSdR(gt1,gt3,i2) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: VZp,Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Sd'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuVZpL(gt2,gt3) 
coup2(6) = cplcFuFuVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: VZp,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Ah'
      End Do 



!-------------- 
!  VZp, hh 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuVZpL(gt2,gt3) 
coup2(6) = cplcFuFuVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuhhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: VZp,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,hh'
      End Do 



!-------------- 
!  Sd, Sd 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSd(i1) 
Boson4(2) = gTSd(i1) 
Boson4(3) = MSd(i2) 
Boson4(4) = gTSd(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt2) 
mass(3) = -MFu(gt3) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChacFuSdL(iIN,gt2,i1) 
coup2(2) = cplcChacFuSdR(iIN,gt2,i1) 
coup2(4) = cplcChacFuSdL(iIN,gt2,i2) 
coup2(3) = cplcChacFuSdR(iIN,gt2,i2)  
coup2(5) = cplChaFucSdL(gt1,gt3,i1) 
coup2(6) = cplChaFucSdR(gt1,gt3,i1) 
coup2(8) = cplChaFucSdL(gt1,gt3,i2) 
coup2(7) = cplChaFucSdR(gt1,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: Sd,Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,Sd'
        End Do 
      End Do 



!-------------- 
!  Sd, Ah 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MSd(i1) 
Boson4(2) = gTSd(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MFu(gt2) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcChacFuSdL(iIN,gt2,i1) 
coup2(2) = cplcChacFuSdR(iIN,gt2,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplChaFucSdL(gt1,gt3,i1) 
coup2(6) = cplChaFucSdR(gt1,gt3,i1) 
coup2(8) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuAhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: Sd,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,Ah'
        End Do 
      End Do 



!-------------- 
!  Sd, hh 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MSd(i1) 
Boson4(2) = gTSd(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MFu(gt2) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcChacFuSdL(iIN,gt2,i1) 
coup2(2) = cplcChacFuSdR(iIN,gt2,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplChaFucSdL(gt1,gt3,i1) 
coup2(6) = cplChaFucSdR(gt1,gt3,i1) 
coup2(8) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuhhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: Sd,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,hh'
        End Do 
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuAhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuAhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuAhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuhhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcChaChahhL(iIN,gt1,i1) 
coup2(2) = cplcChaChahhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuhhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuhhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuhhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFu Fu Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:400))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MCha(iIN))**3*g
End Subroutine ChaToChacFuFu 
 
 
Subroutine ChaToChacFvFv(iIN,MCha,MFv,MVZ,MVZp,MSe,MAh,Mhh,cplcChacFvSeL,             & 
& cplcChacFvSeR,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,   & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFvFvAhL,cplcFvFvAhR,cplcFvFvhhL,       & 
& cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,cplChaFvcSeL,            & 
& cplChaFvcSeR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,             & 
& IntegralVSst,IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZ,gTVZp,            & 
& gTSe,gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MCha(2),MFv(3),MVZ,MVZp,MSe(6),MAh(6),Mhh(6)

Complex(dp),Intent(in) :: cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),  & 
& cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),       & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),         & 
& cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),               & 
& cplcFvFvVZpL(3,3),cplcFvFvVZpR(3,3),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16)

Real(dp),Intent(inout) :: gTVZ,gTVZp,gTSe(6),gTAh(6),gThh(6)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MCha(iIN) 
 
Isum = 400 
Allocate( gSum(2,3,3, Isum) ) 
Allocate( Contribution(2,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MCha(iIN)).gt.(Abs(MFv(gt3))+Abs(MFv(gt2))+Abs(MCha(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcChaChaVZL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFvFvVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFv Fv Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZp 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZp 
Boson2(2) =gTVZp 
 
Boson4(1) = MVZp 
Boson4(2) =gTVZp 
Boson4(3) = MVZp 
Boson4(4) =gTVZp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcChaChaVZpL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChaVZpR(iIN,gt1)) 
coup(4) = Conjg(cplcFvFvVZpL(gt2,gt3)) 
coup(3) = Conjg(cplcFvFvVZpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFv Fv Propagator: VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp'



!-------------- 
!  Se 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSe(i1) 
Boson2(2) =gTSe(i1) 
 
Boson4(1) = MSe(i1) 
Boson4(2) =gTSe(i1) 
Boson4(3) = MSe(i1) 
Boson4(4) =gTSe(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFv(gt2) 
mass(3) = -MFv(gt3) 
mass(4) = MCha(gt1) 
 
coup(2) = Conjg(cplcChacFvSeL(iIN,gt2,i1)) 
coup(1) = Conjg(cplcChacFvSeR(iIN,gt2,i1)) 
coup(4) = Conjg(cplChaFvcSeL(gt1,gt3,i1)) 
coup(3) = Conjg(cplChaFvcSeR(gt1,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFv Fv Propagator: Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Se'
      End Do 



!-------------- 
!  Ah 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MAh(i1) 
Boson2(2) =gTAh(i1) 
 
Boson4(1) = MAh(i1) 
Boson4(2) =gTAh(i1) 
Boson4(3) = MAh(i1) 
Boson4(4) =gTAh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcChaChaAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChaAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFvFvAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFvFvAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFv Fv Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcChaChahhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChahhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFvFvhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFvFvhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFv Fv Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZp 
Boson4(4) = gTVZp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(3) = Conjg(cplcChaChaVZpL(gt1,iIN)) 
coup2(4) = Conjg(cplcChaChaVZpR(gt1,iIN))  
coup2(5) = cplcFvFvVZL(gt2,gt3) 
coup2(6) = cplcFvFvVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFvFvVZpL(gt3,gt2)) 
coup2(8) = Conjg(cplcFvFvVZpR(gt3,gt2)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFv Fv Propagator: VZ,VZp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZp'



!-------------- 
!  VZ, Se 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MSe(i2) 
Boson4(4) = gTSe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MCha(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = cplcChacFvSeL(iIN,gt2,i2) 
coup2(3) = cplcChacFvSeR(iIN,gt2,i2)  
coup2(5) = cplcFvFvVZL(gt2,gt3) 
coup2(6) = cplcFvFvVZR(gt2,gt3) 
coup2(8) = cplChaFvcSeL(gt1,gt3,i2) 
coup2(7) = cplChaFvcSeR(gt1,gt3,i2) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFv Fv Propagator: VZ,Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Se'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFvFvVZL(gt2,gt3) 
coup2(6) = cplcFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFvFvAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFvFvAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFv Fv Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcChaChaVZL(iIN,gt1) 
coup2(2) = cplcChaChaVZR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFvFvVZL(gt2,gt3) 
coup2(6) = cplcFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFvFvhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFvFvhhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFv Fv Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZp, Se 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MSe(i2) 
Boson4(4) = gTSe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MCha(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = cplcChacFvSeL(iIN,gt2,i2) 
coup2(3) = cplcChacFvSeR(iIN,gt2,i2)  
coup2(5) = cplcFvFvVZpL(gt2,gt3) 
coup2(6) = cplcFvFvVZpR(gt2,gt3) 
coup2(8) = cplChaFvcSeL(gt1,gt3,i2) 
coup2(7) = cplChaFvcSeR(gt1,gt3,i2) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFv Fv Propagator: VZp,Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Se'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFvFvVZpL(gt2,gt3) 
coup2(6) = cplcFvFvVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcFvFvAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFvFvAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFv Fv Propagator: VZp,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Ah'
      End Do 



!-------------- 
!  VZp, hh 
!-------------- 
  Do i2=1,6
Boson4(1) = MVZp 
Boson4(2) = gTVZp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcChaChaVZpL(iIN,gt1) 
coup2(2) = cplcChaChaVZpR(iIN,gt1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFvFvVZpL(gt2,gt3) 
coup2(6) = cplcFvFvVZpR(gt2,gt3) 
coup2(8) = Conjg(cplcFvFvhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFvFvhhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFv Fv Propagator: VZp,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,hh'
      End Do 



!-------------- 
!  Se, Se 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSe(i1) 
Boson4(2) = gTSe(i1) 
Boson4(3) = MSe(i2) 
Boson4(4) = gTSe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(3) = -MFv(gt3) 
mass(4) = MCha(gt1) 
 
coup2(1) = cplcChacFvSeL(iIN,gt2,i1) 
coup2(2) = cplcChacFvSeR(iIN,gt2,i1) 
coup2(4) = cplcChacFvSeL(iIN,gt2,i2) 
coup2(3) = cplcChacFvSeR(iIN,gt2,i2)  
coup2(5) = cplChaFvcSeL(gt1,gt3,i1) 
coup2(6) = cplChaFvcSeR(gt1,gt3,i1) 
coup2(8) = cplChaFvcSeL(gt1,gt3,i2) 
coup2(7) = cplChaFvcSeR(gt1,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFv Fv Propagator: Se,Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,Se'
        End Do 
      End Do 



!-------------- 
!  Se, Ah 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MSe(i1) 
Boson4(2) = gTSe(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcChacFvSeL(iIN,gt2,i1) 
coup2(2) = cplcChacFvSeR(iIN,gt2,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplChaFvcSeL(gt1,gt3,i1) 
coup2(6) = cplChaFvcSeR(gt1,gt3,i1) 
coup2(8) = Conjg(cplcFvFvAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFvFvAhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFv Fv Propagator: Se,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,Ah'
        End Do 
      End Do 



!-------------- 
!  Se, hh 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MSe(i1) 
Boson4(2) = gTSe(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcChacFvSeL(iIN,gt2,i1) 
coup2(2) = cplcChacFvSeR(iIN,gt2,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplChaFvcSeL(gt1,gt3,i1) 
coup2(6) = cplChaFvcSeR(gt1,gt3,i1) 
coup2(8) = Conjg(cplcFvFvhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFvFvhhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFv Fv Propagator: Se,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,hh'
        End Do 
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChaAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChaAhR(gt1,iIN,i2))  
coup2(5) = cplcFvFvAhL(gt2,gt3,i1) 
coup2(6) = cplcFvFvAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFvFvAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFvFvAhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFv Fv Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcChaChaAhL(iIN,gt1,i1) 
coup2(2) = cplcChaChaAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFvFvAhL(gt2,gt3,i1) 
coup2(6) = cplcFvFvAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFvFvhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFvFvhhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFv Fv Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MCha(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcChaChahhL(iIN,gt1,i1) 
coup2(2) = cplcChaChahhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcChaChahhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcChaChahhR(gt1,iIN,i2))  
coup2(5) = cplcFvFvhhL(gt2,gt3,i1) 
coup2(6) = cplcFvFvhhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFvFvhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFvFvhhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Cha cFv Fv Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:400))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MCha(iIN))**3*g
End Subroutine ChaToChacFvFv 
 
 
Subroutine ChaToChicFuFd(iIN,MChi,MFu,MFd,MVWm,MHpm,MSu,MSd,MCha,cplcChacFuSdL,       & 
& cplcChacFuSdR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplChiFdcSdL,cplChiFdcSdR,IntegralSs,IntegralSSss,         & 
& IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,NSs,NSSss,              & 
& NSSst,NVs,NVSss,NVSst,NVVss,gTVWm,gTHpm,gTSu,gTSd,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MChi(9),MFu(3),MFd(3),MVWm,MHpm(2),MSu(6),MSd(6),MCha(2)

Complex(dp),Intent(in) :: cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),& 
& cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),     & 
& cplcFuChiSuL(3,9,6),cplcFuChiSuR(3,9,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),     & 
& cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplChiFdcSdL(9,3,6),cplChiFdcSdR(9,3,6)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16)

Real(dp),Intent(inout) :: gTVWm,gTHpm(2),gTSu(6),gTSd(6)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MCha(iIN) 
 
Isum = 225 
Allocate( gSum(9,3,3, Isum) ) 
Allocate( Contribution(9,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,9
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MCha(iIN)).gt.(Abs(MFd(gt3))+Abs(MFu(gt2))+Abs(MChi(gt1)))) Then 
!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWm 
Boson2(2) =gTVWm 
 
Boson4(1) = MVWm 
Boson4(2) =gTVWm 
Boson4(3) = MVWm 
Boson4(4) =gTVWm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MChi(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcChaChiVWmL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChiVWmR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFdcVWmL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFdcVWmR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm'



!-------------- 
!  Hpm 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = MHpm(i1) 
Boson2(2) =gTHpm(i1) 
 
Boson4(1) = MHpm(i1) 
Boson4(2) =gTHpm(i1) 
Boson4(3) = MHpm(i1) 
Boson4(4) =gTHpm(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MChi(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcChaChiHpmL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChiHpmR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuFdcHpmL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFuFdcHpmR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm'
      End Do 



!-------------- 
!  conj[Su] 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSu(i1) 
Boson2(2) =gTSu(i1) 
 
Boson4(1) = MSu(i1) 
Boson4(2) =gTSu(i1) 
Boson4(3) = MSu(i1) 
Boson4(4) =gTSu(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MChi(gt1) 
 
coup(2) = Conjg(cplcChaFdcSuL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcChaFdcSuR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFuChiSuL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFuChiSuR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su]'
      End Do 



!-------------- 
!  Sd 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSd(i1) 
Boson2(2) =gTSd(i1) 
 
Boson4(1) = MSd(i1) 
Boson4(2) =gTSd(i1) 
Boson4(3) = MSd(i1) 
Boson4(4) =gTSd(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt2) 
mass(3) = -MFd(gt3) 
mass(4) = MChi(gt1) 
 
coup(2) = Conjg(cplcChacFuSdL(iIN,gt2,i1)) 
coup(1) = Conjg(cplcChacFuSdR(iIN,gt2,i1)) 
coup(4) = Conjg(cplChiFdcSdL(gt1,gt3,i1)) 
coup(3) = Conjg(cplChiFdcSdR(gt1,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd'
      End Do 



!-------------- 
!  VWm, Hpm 
!-------------- 
  Do i2=1,2
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt1) 
coup2(2) = cplcChaChiVWmR(iIN,gt1) 
coup2(4) = cplcChaChiHpmL(iIN,gt1,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt1,i2)  
coup2(5) = cplcFuFdcVWmL(gt2,gt3) 
coup2(6) = cplcFuFdcVWmR(gt2,gt3) 
coup2(8) = cplcFuFdcHpmL(gt2,gt3,i2) 
coup2(7) = cplcFuFdcHpmR(gt2,gt3,i2) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: VWm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Hpm'
      End Do 



!-------------- 
!  VWm, conj[Su] 
!-------------- 
  Do i2=1,6
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MSu(i2) 
Boson4(4) = gTSu(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt3) 
mass(4) = MChi(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt1) 
coup2(2) = cplcChaChiVWmR(iIN,gt1) 
coup2(4) = cplcChaFdcSuL(iIN,gt3,i2) 
coup2(3) = cplcChaFdcSuR(iIN,gt3,i2)  
coup2(5) = cplcFuFdcVWmL(gt2,gt3) 
coup2(6) = cplcFuFdcVWmR(gt2,gt3) 
coup2(8) = cplcFuChiSuL(gt2,gt1,i2) 
coup2(7) = cplcFuChiSuR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: VWm,conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,conj[Su]'
      End Do 



!-------------- 
!  VWm, Sd 
!-------------- 
  Do i2=1,6
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MSd(i2) 
Boson4(4) = gTSd(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt2) 
mass(4) = MChi(gt1) 
mass(3) = -MFd(gt3) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt1) 
coup2(2) = cplcChaChiVWmR(iIN,gt1) 
coup2(4) = cplcChacFuSdL(iIN,gt2,i2) 
coup2(3) = cplcChacFuSdR(iIN,gt2,i2)  
coup2(5) = cplcFuFdcVWmL(gt2,gt3) 
coup2(6) = cplcFuFdcVWmR(gt2,gt3) 
coup2(8) = cplChiFdcSdL(gt1,gt3,i2) 
coup2(7) = cplChiFdcSdR(gt1,gt3,i2) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: VWm,Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Sd'
      End Do 



!-------------- 
!  Hpm, Hpm 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt1,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt1,i1) 
coup2(4) = cplcChaChiHpmL(iIN,gt1,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt1,i2)  
coup2(5) = cplcFuFdcHpmL(gt2,gt3,i1) 
coup2(6) = cplcFuFdcHpmR(gt2,gt3,i1) 
coup2(8) = cplcFuFdcHpmL(gt2,gt3,i2) 
coup2(7) = cplcFuFdcHpmR(gt2,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: Hpm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Hpm'
        End Do 
      End Do 



!-------------- 
!  Hpm, conj[Su] 
!-------------- 
Do i1=1,2
  Do i2=1,6
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MSu(i2) 
Boson4(4) = gTSu(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt3) 
mass(4) = MChi(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt1,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt1,i1) 
coup2(4) = cplcChaFdcSuL(iIN,gt3,i2) 
coup2(3) = cplcChaFdcSuR(iIN,gt3,i2)  
coup2(5) = cplcFuFdcHpmL(gt2,gt3,i1) 
coup2(6) = cplcFuFdcHpmR(gt2,gt3,i1) 
coup2(8) = cplcFuChiSuL(gt2,gt1,i2) 
coup2(7) = cplcFuChiSuR(gt2,gt1,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: Hpm,conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,conj[Su]'
        End Do 
      End Do 



!-------------- 
!  Hpm, Sd 
!-------------- 
Do i1=1,2
  Do i2=1,6
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MSd(i2) 
Boson4(4) = gTSd(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt2) 
mass(4) = MChi(gt1) 
mass(3) = -MFd(gt3) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt1,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt1,i1) 
coup2(4) = cplcChacFuSdL(iIN,gt2,i2) 
coup2(3) = cplcChacFuSdR(iIN,gt2,i2)  
coup2(5) = cplcFuFdcHpmL(gt2,gt3,i1) 
coup2(6) = cplcFuFdcHpmR(gt2,gt3,i1) 
coup2(8) = cplChiFdcSdL(gt1,gt3,i2) 
coup2(7) = cplChiFdcSdR(gt1,gt3,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: Hpm,Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Sd'
        End Do 
      End Do 



!-------------- 
!  conj[Su], conj[Su] 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSu(i1) 
Boson4(2) = gTSu(i1) 
Boson4(3) = MSu(i2) 
Boson4(4) = gTSu(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MChi(gt1) 
 
coup2(1) = cplcChaFdcSuL(iIN,gt3,i1) 
coup2(2) = cplcChaFdcSuR(iIN,gt3,i1) 
coup2(4) = cplcChaFdcSuL(iIN,gt3,i2) 
coup2(3) = cplcChaFdcSuR(iIN,gt3,i2)  
coup2(5) = cplcFuChiSuL(gt2,gt1,i1) 
coup2(6) = cplcFuChiSuR(gt2,gt1,i1) 
coup2(8) = cplcFuChiSuL(gt2,gt1,i2) 
coup2(7) = cplcFuChiSuR(gt2,gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: conj[Su],conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su],conj[Su]'
        End Do 
      End Do 



!-------------- 
!  conj[Su], Sd 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MSu(i1) 
Boson4(2) = gTSu(i1) 
Boson4(3) = MSd(i2) 
Boson4(4) = gTSd(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt2) 
mass(4) = MFd(gt3) 
mass(3) = -MChi(gt1) 
 
coup2(1) = cplcChaFdcSuL(iIN,gt3,i1) 
coup2(2) = cplcChaFdcSuR(iIN,gt3,i1) 
coup2(4) = cplcChacFuSdL(iIN,gt2,i2) 
coup2(3) = cplcChacFuSdR(iIN,gt2,i2)  
coup2(5) = cplcFuChiSuL(gt2,gt1,i1) 
coup2(6) = cplcFuChiSuR(gt2,gt1,i1) 
coup2(8) = cplChiFdcSdL(gt1,gt3,i2) 
coup2(7) = cplChiFdcSdR(gt1,gt3,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: conj[Su],Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Su],Sd'
        End Do 
      End Do 



!-------------- 
!  Sd, Sd 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSd(i1) 
Boson4(2) = gTSd(i1) 
Boson4(3) = MSd(i2) 
Boson4(4) = gTSd(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt2) 
mass(3) = -MFd(gt3) 
mass(4) = MChi(gt1) 
 
coup2(1) = cplcChacFuSdL(iIN,gt2,i1) 
coup2(2) = cplcChacFuSdR(iIN,gt2,i1) 
coup2(4) = cplcChacFuSdL(iIN,gt2,i2) 
coup2(3) = cplcChacFuSdR(iIN,gt2,i2)  
coup2(5) = cplChiFdcSdL(gt1,gt3,i1) 
coup2(6) = cplChiFdcSdR(gt1,gt3,i1) 
coup2(8) = cplChiFdcSdL(gt1,gt3,i2) 
coup2(7) = cplChiFdcSdR(gt1,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFu Fd Propagator: Sd,Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sd,Sd'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,9
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:225))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MCha(iIN))**3*g
End Subroutine ChaToChicFuFd 
 
 
Subroutine ChaToChicFvFe(iIN,MChi,MFv,MFe,MVWm,MHpm,MSv,MSe,MCha,cplcChacFvSeL,       & 
& cplcChacFvSeR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFvChiSvL,cplcFvChiSvR,cplcFvFecHpmL,cplcFvFecHpmR,     & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplChiFecSeL,cplChiFecSeR,IntegralSs,IntegralSSss,         & 
& IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,NSs,NSSss,              & 
& NSSst,NVs,NVSss,NVSst,NVVss,gTVWm,gTHpm,gTSv,gTSe,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MChi(9),MFv(3),MFe(3),MVWm,MHpm(2),MSv(6),MSe(6),MCha(2)

Complex(dp),Intent(in) :: cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),& 
& cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),     & 
& cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),cplcFvFecHpmL(3,3,2),cplcFvFecHpmR(3,3,2),     & 
& cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16)

Real(dp),Intent(inout) :: gTVWm,gTHpm(2),gTSv(6),gTSe(6)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MCha(iIN) 
 
Isum = 225 
Allocate( gSum(9,3,3, Isum) ) 
Allocate( Contribution(9,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,9
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MCha(iIN)).gt.(Abs(MFe(gt3))+Abs(MFv(gt2))+Abs(MChi(gt1)))) Then 
!-------------- 
!  VWm 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWm 
Boson2(2) =gTVWm 
 
Boson4(1) = MVWm 
Boson4(2) =gTVWm 
Boson4(3) = MVWm 
Boson4(4) =gTVWm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MChi(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcChaChiVWmL(iIN,gt1)) 
coup(1) = Conjg(cplcChaChiVWmR(iIN,gt1)) 
coup(4) = Conjg(cplcFvFecVWmL(gt2,gt3)) 
coup(3) = Conjg(cplcFvFecVWmR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFv Fe Propagator: VWm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm'



!-------------- 
!  Hpm 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = MHpm(i1) 
Boson2(2) =gTHpm(i1) 
 
Boson4(1) = MHpm(i1) 
Boson4(2) =gTHpm(i1) 
Boson4(3) = MHpm(i1) 
Boson4(4) =gTHpm(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MChi(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcChaChiHpmL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaChiHpmR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFvFecHpmL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFvFecHpmR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFv Fe Propagator: Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm'
      End Do 



!-------------- 
!  conj[Sv] 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSv(i1) 
Boson2(2) =gTSv(i1) 
 
Boson4(1) = MSv(i1) 
Boson4(2) =gTSv(i1) 
Boson4(3) = MSv(i1) 
Boson4(4) =gTSv(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MChi(gt1) 
 
coup(2) = Conjg(cplcChaFecSvL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcChaFecSvR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFvChiSvL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFvChiSvR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFv Fe Propagator: conj[Sv]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Sv]'
      End Do 



!-------------- 
!  Se 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSe(i1) 
Boson2(2) =gTSe(i1) 
 
Boson4(1) = MSe(i1) 
Boson4(2) =gTSe(i1) 
Boson4(3) = MSe(i1) 
Boson4(4) =gTSe(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFv(gt2) 
mass(3) = -MFe(gt3) 
mass(4) = MChi(gt1) 
 
coup(2) = Conjg(cplcChacFvSeL(iIN,gt2,i1)) 
coup(1) = Conjg(cplcChacFvSeR(iIN,gt2,i1)) 
coup(4) = Conjg(cplChiFecSeL(gt1,gt3,i1)) 
coup(3) = Conjg(cplChiFecSeR(gt1,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFv Fe Propagator: Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Se'
      End Do 



!-------------- 
!  VWm, Hpm 
!-------------- 
  Do i2=1,2
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt1) 
coup2(2) = cplcChaChiVWmR(iIN,gt1) 
coup2(4) = cplcChaChiHpmL(iIN,gt1,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt1,i2)  
coup2(5) = cplcFvFecVWmL(gt2,gt3) 
coup2(6) = cplcFvFecVWmR(gt2,gt3) 
coup2(8) = cplcFvFecHpmL(gt2,gt3,i2) 
coup2(7) = cplcFvFecHpmR(gt2,gt3,i2) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFv Fe Propagator: VWm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Hpm'
      End Do 



!-------------- 
!  VWm, conj[Sv] 
!-------------- 
  Do i2=1,6
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MSv(i2) 
Boson4(4) = gTSv(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MChi(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt1) 
coup2(2) = cplcChaChiVWmR(iIN,gt1) 
coup2(4) = cplcChaFecSvL(iIN,gt3,i2) 
coup2(3) = cplcChaFecSvR(iIN,gt3,i2)  
coup2(5) = cplcFvFecVWmL(gt2,gt3) 
coup2(6) = cplcFvFecVWmR(gt2,gt3) 
coup2(8) = cplcFvChiSvL(gt2,gt1,i2) 
coup2(7) = cplcFvChiSvR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFv Fe Propagator: VWm,conj[Sv]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,conj[Sv]'
      End Do 



!-------------- 
!  VWm, Se 
!-------------- 
  Do i2=1,6
Boson4(1) = MVWm 
Boson4(2) = gTVWm 
Boson4(3) = MSe(i2) 
Boson4(4) = gTSe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MChi(gt1) 
mass(3) = -MFe(gt3) 
 
coup2(1) = cplcChaChiVWmL(iIN,gt1) 
coup2(2) = cplcChaChiVWmR(iIN,gt1) 
coup2(4) = cplcChacFvSeL(iIN,gt2,i2) 
coup2(3) = cplcChacFvSeR(iIN,gt2,i2)  
coup2(5) = cplcFvFecVWmL(gt2,gt3) 
coup2(6) = cplcFvFecVWmR(gt2,gt3) 
coup2(8) = cplChiFecSeL(gt1,gt3,i2) 
coup2(7) = cplChiFecSeR(gt1,gt3,i2) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFv Fe Propagator: VWm,Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWm,Se'
      End Do 



!-------------- 
!  Hpm, Hpm 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt1,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt1,i1) 
coup2(4) = cplcChaChiHpmL(iIN,gt1,i2) 
coup2(3) = cplcChaChiHpmR(iIN,gt1,i2)  
coup2(5) = cplcFvFecHpmL(gt2,gt3,i1) 
coup2(6) = cplcFvFecHpmR(gt2,gt3,i1) 
coup2(8) = cplcFvFecHpmL(gt2,gt3,i2) 
coup2(7) = cplcFvFecHpmR(gt2,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFv Fe Propagator: Hpm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Hpm'
        End Do 
      End Do 



!-------------- 
!  Hpm, conj[Sv] 
!-------------- 
Do i1=1,2
  Do i2=1,6
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MSv(i2) 
Boson4(4) = gTSv(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MChi(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt1,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt1,i1) 
coup2(4) = cplcChaFecSvL(iIN,gt3,i2) 
coup2(3) = cplcChaFecSvR(iIN,gt3,i2)  
coup2(5) = cplcFvFecHpmL(gt2,gt3,i1) 
coup2(6) = cplcFvFecHpmR(gt2,gt3,i1) 
coup2(8) = cplcFvChiSvL(gt2,gt1,i2) 
coup2(7) = cplcFvChiSvR(gt2,gt1,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFv Fe Propagator: Hpm,conj[Sv]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,conj[Sv]'
        End Do 
      End Do 



!-------------- 
!  Hpm, Se 
!-------------- 
Do i1=1,2
  Do i2=1,6
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MSe(i2) 
Boson4(4) = gTSe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MChi(gt1) 
mass(3) = -MFe(gt3) 
 
coup2(1) = cplcChaChiHpmL(iIN,gt1,i1) 
coup2(2) = cplcChaChiHpmR(iIN,gt1,i1) 
coup2(4) = cplcChacFvSeL(iIN,gt2,i2) 
coup2(3) = cplcChacFvSeR(iIN,gt2,i2)  
coup2(5) = cplcFvFecHpmL(gt2,gt3,i1) 
coup2(6) = cplcFvFecHpmR(gt2,gt3,i1) 
coup2(8) = cplChiFecSeL(gt1,gt3,i2) 
coup2(7) = cplChiFecSeR(gt1,gt3,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFv Fe Propagator: Hpm,Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Se'
        End Do 
      End Do 



!-------------- 
!  conj[Sv], conj[Sv] 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSv(i1) 
Boson4(2) = gTSv(i1) 
Boson4(3) = MSv(i2) 
Boson4(4) = gTSv(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MChi(gt1) 
 
coup2(1) = cplcChaFecSvL(iIN,gt3,i1) 
coup2(2) = cplcChaFecSvR(iIN,gt3,i1) 
coup2(4) = cplcChaFecSvL(iIN,gt3,i2) 
coup2(3) = cplcChaFecSvR(iIN,gt3,i2)  
coup2(5) = cplcFvChiSvL(gt2,gt1,i1) 
coup2(6) = cplcFvChiSvR(gt2,gt1,i1) 
coup2(8) = cplcFvChiSvL(gt2,gt1,i2) 
coup2(7) = cplcFvChiSvR(gt2,gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFv Fe Propagator: conj[Sv],conj[Sv]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Sv],conj[Sv]'
        End Do 
      End Do 



!-------------- 
!  conj[Sv], Se 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MSv(i1) 
Boson4(2) = gTSv(i1) 
Boson4(3) = MSe(i2) 
Boson4(4) = gTSe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MFe(gt3) 
mass(3) = -MChi(gt1) 
 
coup2(1) = cplcChaFecSvL(iIN,gt3,i1) 
coup2(2) = cplcChaFecSvR(iIN,gt3,i1) 
coup2(4) = cplcChacFvSeL(iIN,gt2,i2) 
coup2(3) = cplcChacFvSeR(iIN,gt2,i2)  
coup2(5) = cplcFvChiSvL(gt2,gt1,i1) 
coup2(6) = cplcFvChiSvR(gt2,gt1,i1) 
coup2(8) = cplChiFecSeL(gt1,gt3,i2) 
coup2(7) = cplChiFecSeR(gt1,gt3,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFv Fe Propagator: conj[Sv],Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Sv],Se'
        End Do 
      End Do 



!-------------- 
!  Se, Se 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSe(i1) 
Boson4(2) = gTSe(i1) 
Boson4(3) = MSe(i2) 
Boson4(4) = gTSe(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(3) = -MFe(gt3) 
mass(4) = MChi(gt1) 
 
coup2(1) = cplcChacFvSeL(iIN,gt2,i1) 
coup2(2) = cplcChacFvSeR(iIN,gt2,i1) 
coup2(4) = cplcChacFvSeL(iIN,gt2,i2) 
coup2(3) = cplcChacFvSeR(iIN,gt2,i2)  
coup2(5) = cplChiFecSeL(gt1,gt3,i1) 
coup2(6) = cplChiFecSeR(gt1,gt3,i1) 
coup2(8) = cplChiFecSeL(gt1,gt3,i2) 
coup2(7) = cplChiFecSeR(gt1,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Chi cFv Fe Propagator: Se,Se" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,Se'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,9
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:225))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MCha(iIN))**3*g
End Subroutine ChaToChicFvFe 
 
 
Subroutine ChaToFdcFuGlu(iIN,MFd,MFu,MGlu,MSu,MSd,MCha,cplcChacFuSdL,cplcChacFuSdR,   & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuGluSuL,cplcFuGluSuR,cplGluFdcSdL,cplGluFdcSdR,       & 
& IntegralSs,IntegralSSss,IntegralSSst,NSs,NSSss,NSSst,gTSu,gTSd,deltaM,epsI,            & 
& check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFu(3),MGlu,MSu(6),MSd(6),MCha(2)

Complex(dp),Intent(in) :: cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),  & 
& cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6)

Real(dp),Intent(inout) :: IntegralSs(500000,10)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16)

Real(dp),Intent(inout) :: gTSu(6),gTSd(6)

Integer, Intent(inout) :: NSs,NSSss,NSSst
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MCha(iIN) 
 
Isum = 144 
Allocate( gSum(3,3,1, Isum) ) 
Allocate( Contribution(3,3,1, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
Isum = 0 
 
If(Abs(MCha(iIN)).gt.(Abs(MGlu)+Abs(MFu(gt2))+Abs(MFd(gt1)))) Then 
!-------------- 
!  conj[Su] 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSu(i1) 
Boson2(2) =gTSu(i1) 
 
Boson4(1) = MSu(i1) 
Boson4(2) =gTSu(i1) 
Boson4(3) = MSu(i1) 
Boson4(4) =gTSu(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MGlu 
 
coup(2) = Conjg(cplcChaFdcSuL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcChaFdcSuR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuGluSuL(gt2,i1)) 
coup(3) = Conjg(cplcFuGluSuR(gt2,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 4*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Fd cFu Glu Propagator: conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp
Else 
gSum(gt1,gt2,1,Isum)=resD
End If 
Contribution(gt1,gt2,1,Isum)='conj[Su]'
      End Do 



!-------------- 
!  Sd 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
Boson2(1) = MSd(i1) 
Boson2(2) =gTSd(i1) 
 
Boson4(1) = MSd(i1) 
Boson4(2) =gTSd(i1) 
Boson4(3) = MSd(i1) 
Boson4(4) =gTSd(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt2) 
mass(3) = -MGlu 
mass(4) = MFd(gt1) 
 
coup(2) = Conjg(cplcChacFuSdL(iIN,gt2,i1)) 
coup(1) = Conjg(cplcChacFuSdR(iIN,gt2,i1)) 
coup(4) = Conjg(cplGluFdcSdL(gt1,i1)) 
coup(3) = Conjg(cplGluFdcSdR(gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 4*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Fd cFu Glu Propagator: Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp
Else 
gSum(gt1,gt2,1,Isum)=resD
End If 
Contribution(gt1,gt2,1,Isum)='Sd'
      End Do 



!-------------- 
!  conj[Su], conj[Su] 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSu(i1) 
Boson4(2) = gTSu(i1) 
Boson4(3) = MSu(i2) 
Boson4(4) = gTSu(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MGlu 
 
coup2(1) = cplcChaFdcSuL(iIN,gt1,i1) 
coup2(2) = cplcChaFdcSuR(iIN,gt1,i1) 
coup2(4) = cplcChaFdcSuL(iIN,gt1,i2) 
coup2(3) = cplcChaFdcSuR(iIN,gt1,i2)  
coup2(5) = cplcFuGluSuL(gt2,i1) 
coup2(6) = cplcFuGluSuR(gt2,i1) 
coup2(8) = cplcFuGluSuL(gt2,i2) 
coup2(7) = cplcFuGluSuR(gt2,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 4*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Fd cFu Glu Propagator: conj[Su],conj[Su]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp  
Else 
gSum(gt1,gt2,1,Isum)= resS  
End If 
Contribution(gt1,gt2,1,Isum)='conj[Su],conj[Su]'
        End Do 
      End Do 



!-------------- 
!  conj[Su], Sd 
!-------------- 
Do i1=1,6
  Do i2=1,6
Boson4(1) = MSu(i1) 
Boson4(2) = gTSu(i1) 
Boson4(3) = MSd(i2) 
Boson4(4) = gTSd(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt2) 
mass(4) = MFd(gt1) 
mass(3) = -MGlu 
 
coup2(1) = cplcChaFdcSuL(iIN,gt1,i1) 
coup2(2) = cplcChaFdcSuR(iIN,gt1,i1) 
coup2(4) = cplcChacFuSdL(iIN,gt2,i2) 
coup2(3) = cplcChacFuSdR(iIN,gt2,i2)  
coup2(5) = cplcFuGluSuL(gt2,i1) 
coup2(6) = cplcFuGluSuR(gt2,i1) 
coup2(8) = cplGluFdcSdL(gt1,i2) 
coup2(7) = cplGluFdcSdR(gt1,i2) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 4*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Fd cFu Glu Propagator: conj[Su],Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp  
Else 
gSum(gt1,gt2,1,Isum)= resS  
End If 
Contribution(gt1,gt2,1,Isum)='conj[Su],Sd'
        End Do 
      End Do 



!-------------- 
!  Sd, Sd 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Boson4(1) = MSd(i1) 
Boson4(2) = gTSd(i1) 
Boson4(3) = MSd(i2) 
Boson4(4) = gTSd(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt2) 
mass(3) = -MGlu 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcChacFuSdL(iIN,gt2,i1) 
coup2(2) = cplcChacFuSdR(iIN,gt2,i1) 
coup2(4) = cplcChacFuSdL(iIN,gt2,i2) 
coup2(3) = cplcChacFuSdR(iIN,gt2,i2)  
coup2(5) = cplGluFdcSdL(gt1,i1) 
coup2(6) = cplGluFdcSdR(gt1,i1) 
coup2(8) = cplGluFdcSdL(gt1,i2) 
coup2(7) = cplGluFdcSdR(gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 4*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Cha->Fd cFu Glu Propagator: Sd,Sd" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,1,Isum)= 0._dp  
Else 
gSum(gt1,gt2,1,Isum)= resS  
End If 
Contribution(gt1,gt2,1,Isum)='Sd,Sd'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,1,:)= 0._dp  
End If 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=1,3
g(gt1,gt2,1)=Sum(gSum(gt1,gt2,1,1:144))
If (g(gt1,gt2,1).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,1)=0._dp
End If
     End Do 
   End Do 
  g = oo512pi3 / Abs(MCha(iIN))**3*g
End Subroutine ChaToFdcFuGlu 
 
 
End Module Cha3Decays_sec_UMSSM 
 
