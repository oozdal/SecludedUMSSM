! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 1:12 on 7.11.2019   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_sec_UMSSM 
 
Use Control 
Use Settings 
Use Couplings_sec_UMSSM 
Use Model_Data_sec_UMSSM 
Use LoopCouplings_sec_UMSSM 
Use Glu3Decays_sec_UMSSM 
Use Chi3Decays_sec_UMSSM 
Use Cha3Decays_sec_UMSSM 
Use Sd3Decays_sec_UMSSM 
Use Su3Decays_sec_UMSSM 
Use Se3Decays_sec_UMSSM 
Use Sv3Decays_sec_UMSSM 
Use TreeLevelDecays_sec_UMSSM 
Use OneLoopDecays_sec_UMSSM


 Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MCha,MCha2,MChi,           & 
& MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,              & 
& MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,              & 
& TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,             & 
& betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,              & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,gPSd,           & 
& gTSd,BRSd,gPSu,gTSu,BRSu,gPSe,gTSe,BRSe,gPSv,gTSv,BRSv,gPhh,gThh,BRhh,gPAh,            & 
& gTAh,BRAh,gPHpm,gTHpm,BRHpm,gPVZp,gTVZp,BRVZp,gPGlu,gTGlu,BRGlu,gPChi,gTChi,           & 
& BRChi,gPCha,gTCha,BRCha,gPFu,gTFu,BRFu)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(inout) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp),Intent(in) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(in) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp),Intent(inout) :: vd,vu,vS,vS1,vS2,vS3

Real(dp),Intent(inout) :: gPSd(6,2094),gTSd(6),BRSd(6,2094),gPSu(6,2094),gTSu(6),BRSu(6,2094),gPSe(6,1971),     & 
& gTSe(6),BRSe(6,1971),gPSv(6,1971),gTSv(6),BRSv(6,1971),gPhh(6,329),gThh(6),            & 
& BRhh(6,329),gPAh(6,327),gTAh(6),BRAh(6,327),gPHpm(2,134),gTHpm(2),BRHpm(2,134),        & 
& gPVZp(1,268),gTVZp,BRVZp(1,268),gPGlu(1,239),gTGlu,BRGlu(1,239),gPChi(9,1337),         & 
& gTChi(9),BRChi(9,1337),gPCha(2,529),gTCha(2),BRCha(2,529),gPFu(3,120),gTFu(3),         & 
& BRFu(3,120)

Complex(dp) :: cplHiggsPP(6),cplHiggsGG(6),cplPseudoHiggsPP(6),cplPseudoHiggsGG(6),cplHiggsZZvirt(6),& 
& cplHiggsWWvirt(6)

Real(dp) :: gGluFdcFdChi(1,3,3,9),gGluFdcFucCha(1,3,3,2),gGluFucFuChi(1,3,3,9),gChiChicChaCha(9,9,2,2),& 
& gChiChiChiChi(9,9,9,9),gChiChicFdFd(9,9,3,3),gChiChicFeFe(9,9,3,3),gChiChicFuFu(9,9,3,3),& 
& gChiChicFvFv(9,9,3,3),gChiChacFdFu(9,2,3,3),gChiChacFeFv(9,2,3,3),gChiFdcFdGlu(9,3,3,1),& 
& gChiFucFuGlu(9,3,3,1),gChaChacChaCha(2,2,2,2),gChaChaChiChi(2,2,9,9),gChaChacFdFd(2,2,3,3),& 
& gChaChacFeFe(2,2,3,3),gChaChacFuFu(2,2,3,3),gChaChacFvFv(2,2,3,3),gChaChicFuFd(2,9,3,3),& 
& gChaChicFvFe(2,9,3,3),gChaFdcFuGlu(2,3,3,1),gSdAhChaFu(6,6,2,3),gSdAhChiFd(6,6,9,3),   & 
& gSdAhFdGlu(6,6,3,1),gSdSuChaChi(6,6,2,9),gSdChaFdcHpm(6,2,3,2),gSdhhChaFu(6,6,2,3),    & 
& gSdChaGluSu(6,2,1,6),gSdSdChacCha(6,6,2,2),gSdSdChiChi(6,6,9,9),gSdhhChiFd(6,6,9,3),   & 
& gSdHpmChiFu(6,2,9,3),gSdChiGluSd(6,9,1,6),gSdFdFdcSd(6,3,3,6),gSdFdFecSe(6,3,3,6),     & 
& gSdFuFdcSu(6,3,3,6),gSdFdFvcSv(6,3,3,6),gSdHpmFdcCha(6,2,3,2),gSdSdFdcFd(6,6,3,3),     & 
& gSdFdSecFe(6,3,6,3),gSdSuFdcFu(6,6,3,3),gSdFdSvcFv(6,3,6,3),gSdFuFecSv(6,3,3,6),       & 
& gSdSdFucFu(6,6,3,3),gSdFuSecFv(6,3,6,3),gSdhhFdGlu(6,6,3,1),gSdHpmFuGlu(6,2,3,1),      & 
& gSdGluGluSd(6,1,1,6),gSdSdFecFe(6,6,3,3),gSdSdFvcFv(6,6,3,3),gSdSuFecFv(6,6,3,3),      & 
& gSuAhChiFu(6,6,9,3),gSuAhFdcCha(6,6,3,2),gSuAhFuGlu(6,6,3,1),gSuSuChiChi(6,6,9,9),     & 
& gSucHpmChiFd(6,2,9,3),gSuhhChiFu(6,6,9,3),gSuChiGluSu(6,9,1,6),gSuSdChicCha(6,6,9,2),  & 
& gSuFdFucSd(6,3,3,6),gSuFdFvcSe(6,3,3,6),gSuhhFdcCha(6,6,3,2),gSuSuFdcFd(6,6,3,3),      & 
& gSuFdSvcFe(6,3,6,3),gSucHpmChaFu(6,2,2,3),gSuFuFecSe(6,3,3,6),gSuFuFucSu(6,3,3,6),     & 
& gSuFuFvcSv(6,3,3,6),gSucChaFuHpm(6,2,3,2),gSuSdFucFd(6,6,3,3),gSuFuSecFe(6,3,6,3),     & 
& gSuSuFucFu(6,6,3,3),gSuFuSvcFv(6,3,6,3),gSucHpmFdGlu(6,2,3,1),gSuhhFuGlu(6,6,3,1),     & 
& gSuGluGluSu(6,1,1,6),gSuGluSdcCha(6,1,6,2),gSuSdFvcFe(6,6,3,3),gSuSuChacCha(6,6,2,2),  & 
& gSuSuFecFe(6,6,3,3),gSuSuFvcFv(6,6,3,3),gSeAhChaFv(6,6,2,3),gSeAhChiFe(6,6,9,3),       & 
& gSeSvChaChi(6,6,2,9),gSeChaFecHpm(6,2,3,2),gSehhChaFv(6,6,2,3),gSeSeChacCha(6,6,2,2),  & 
& gSeSeChiChi(6,6,9,9),gSehhChiFe(6,6,9,3),gSeHpmChiFv(6,2,9,3),gSeFeFdcSd(6,3,3,6),     & 
& gSeFeFecSe(6,3,3,6),gSeFeFucSu(6,3,3,6),gSeFvFecSv(6,3,3,6),gSeHpmFecCha(6,2,3,2),     & 
& gSeFeSdcFd(6,3,6,3),gSeSeFecFe(6,6,3,3),gSeFeSucFu(6,3,6,3),gSeSvFecFv(6,6,3,3),       & 
& gSeFvFdcSu(6,3,3,6),gSeFvSdcFu(6,3,6,3),gSeSeFvcFv(6,6,3,3),gSeSeFdcFd(6,6,3,3),       & 
& gSeSeFucFu(6,6,3,3),gSeSvFdcFu(6,6,3,3),gSvAhChiFv(6,6,9,3),gSvAhFecCha(6,6,3,2),      & 
& gSvSvChiChi(6,6,9,9),gSvcHpmChiFe(6,2,9,3),gSvhhChiFv(6,6,9,3),gSvSeChicCha(6,6,9,2),  & 
& gSvFeFucSd(6,3,3,6),gSvFeFvcSe(6,3,3,6),gSvhhFecCha(6,6,3,2),gSvFeSucFd(6,3,6,3),      & 
& gSvSvFecFe(6,6,3,3),gSvcHpmChaFv(6,2,2,3),gSvFvFdcSd(6,3,3,6),gSvFvFucSu(6,3,3,6),     & 
& gSvFvFvcSv(6,3,3,6),gSvcChaFvHpm(6,2,3,2),gSvFvSdcFd(6,3,6,3),gSvSeFvcFe(6,6,3,3),     & 
& gSvFvSucFu(6,3,6,3),gSvSvFvcFv(6,6,3,3),gSvSeFucFd(6,6,3,3),gSvSvChacCha(6,6,2,2),     & 
& gSvSvFdcFd(6,6,3,3),gSvSvFucFu(6,6,3,3)

Complex(dp) :: coup 
Real(dp) :: vev 
Real(dp) :: gTVZ,gTVWm

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateBR'
 
Write(*,*) "Calculating branching ratios and decay widths" 
gTVWm = gamW 
gTVZ = gamZ 
! One-Loop Decays 
If (OneLoopDecays) Then 
Call CalculateOneLoopDecays(gP1LSd,gP1LSu,gP1LSe,gP1LSv,gP1Lhh,gP1LAh,gP1LHpm,        & 
& gP1LGlu,gP1LChi,gP1LCha,gP1LFu,MSd,MSd2,MSv,MSv2,MSu,MSu2,MSe,MSe2,Mhh,Mhh2,           & 
& MAh,MAh2,MHpm,MHpm2,MChi,MChi2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MFd,MFd2,MFu,              & 
& MFu2,MGlu,MGlu2,MVZ,MVZp,MVZ2,MVZp2,MVWm,MVWm2,ZD,ZV,ZU,ZE,ZH,ZA,ZP,ZN,ZVL,            & 
& ZVR,UM,UP,ZEL,ZER,ZDL,ZDR,ZUL,ZUR,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,gp,Yd,Ye,              & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,epsI,deltaM,kont)

End if 


gPSd = 0._dp 
gTSd = 0._dp 
BRSd = 0._dp 
Call SdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,              & 
& ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,             & 
& Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,             & 
& ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gPSd(:,1:132),gTSd,BRSd(:,1:132))

Do i1=1,6
gTSd(i1) =Sum(gPSd(i1,:)) 
If (gTSd(i1).Gt.0._dp) BRSd(i1,: ) =gPSd(i1,:)/gTSd(i1) 
If (OneLoopDecays) Then 
gT1LSd(i1) =Sum(gP1LSd(i1,:)) 
If (gT1LSd(i1).Gt.0._dp) BR1LSd(i1,: ) =gP1LSd(i1,:)/gT1LSd(i1) 
End if
End Do 
 

gPSu = 0._dp 
gTSu = 0._dp 
BRSu = 0._dp 
Call SuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,              & 
& ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,             & 
& Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,             & 
& ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gPSu(:,1:132),gTSu,BRSu(:,1:132))

Do i1=1,6
gTSu(i1) =Sum(gPSu(i1,:)) 
If (gTSu(i1).Gt.0._dp) BRSu(i1,: ) =gPSu(i1,:)/gTSu(i1) 
If (OneLoopDecays) Then 
gT1LSu(i1) =Sum(gP1LSu(i1,:)) 
If (gT1LSu(i1).Gt.0._dp) BR1LSu(i1,: ) =gP1LSu(i1,:)/gT1LSu(i1) 
End if
End Do 
 

gPSe = 0._dp 
gTSe = 0._dp 
BRSe = 0._dp 
Call SeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,              & 
& ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,             & 
& Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,             & 
& ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gPSe(:,1:123),gTSe,BRSe(:,1:123))

Do i1=1,6
gTSe(i1) =Sum(gPSe(i1,:)) 
If (gTSe(i1).Gt.0._dp) BRSe(i1,: ) =gPSe(i1,:)/gTSe(i1) 
If (OneLoopDecays) Then 
gT1LSe(i1) =Sum(gP1LSe(i1,:)) 
If (gT1LSe(i1).Gt.0._dp) BR1LSe(i1,: ) =gP1LSe(i1,:)/gT1LSe(i1) 
End if
End Do 
 

gPSv = 0._dp 
gTSv = 0._dp 
BRSv = 0._dp 
Call SvTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,              & 
& ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,             & 
& Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,             & 
& ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gPSv(:,1:123),gTSv,BRSv(:,1:123))

Do i1=1,6
gTSv(i1) =Sum(gPSv(i1,:)) 
If (gTSv(i1).Gt.0._dp) BRSv(i1,: ) =gPSv(i1,:)/gTSv(i1) 
If (OneLoopDecays) Then 
gT1LSv(i1) =Sum(gP1LSv(i1,:)) 
If (gT1LSv(i1).Gt.0._dp) BR1LSv(i1,: ) =gP1LSv(i1,:)/gT1LSv(i1) 
End if
End Do 
 

gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,              & 
& ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,             & 
& Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,             & 
& ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gPhh,gThh,BRhh)

Do i1=1,6
gThh(i1) =Sum(gPhh(i1,:)) 
If (gThh(i1).Gt.0._dp) BRhh(i1,: ) =gPhh(i1,:)/gThh(i1) 
If (OneLoopDecays) Then 
gT1Lhh(i1) =Sum(gP1Lhh(i1,:)) 
If (gT1Lhh(i1).Gt.0._dp) BR1Lhh(i1,: ) =gP1Lhh(i1,:)/gT1Lhh(i1) 
End if
End Do 
 

gPAh = 0._dp 
gTAh = 0._dp 
BRAh = 0._dp 
Call AhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,              & 
& ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,             & 
& Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,             & 
& ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gPAh,gTAh,BRAh)

Do i1=1,6
gTAh(i1) =Sum(gPAh(i1,:)) 
If (gTAh(i1).Gt.0._dp) BRAh(i1,: ) =gPAh(i1,:)/gTAh(i1) 
If (OneLoopDecays) Then 
gT1LAh(i1) =Sum(gP1LAh(i1,:)) 
If (gT1LAh(i1).Gt.0._dp) BR1LAh(i1,: ) =gP1LAh(i1,:)/gT1LAh(i1) 
End if
End Do 
 

! Set Goldstone Widhts 
gTAh(1)=gTVZ
gTAh(2)=gTVZp


gPHpm = 0._dp 
gTHpm = 0._dp 
BRHpm = 0._dp 
Call HpmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,              & 
& ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,             & 
& Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,             & 
& ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gPHpm,gTHpm,BRHpm)

Do i1=1,2
gTHpm(i1) =Sum(gPHpm(i1,:)) 
If (gTHpm(i1).Gt.0._dp) BRHpm(i1,: ) =gPHpm(i1,:)/gTHpm(i1) 
If (OneLoopDecays) Then 
gT1LHpm(i1) =Sum(gP1LHpm(i1,:)) 
If (gT1LHpm(i1).Gt.0._dp) BR1LHpm(i1,: ) =gP1LHpm(i1,:)/gT1LHpm(i1) 
End if
End Do 
 

! Set Goldstone Widhts 
gTHpm(1)=gTVWm


gPVZp = 0._dp 
gTVZp = 0._dp 
BRVZp = 0._dp 
Call VZpTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,              & 
& ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,             & 
& Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,             & 
& ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gPVZp,gTVZp,BRVZp)

Do i1=1,1
gTVZp =Sum(gPVZp(i1,:)) 
If (gTVZp.Gt.0._dp) BRVZp(i1,: ) =gPVZp(i1,:)/gTVZp 
End Do 
 

! Set Goldstone Widhts 
gTAh(2)=gTVZp


gPGlu = 0._dp 
gTGlu = 0._dp 
BRGlu = 0._dp 
Call GluTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,              & 
& ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,             & 
& Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,             & 
& ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gPGlu(:,1:59),gTGlu,               & 
& BRGlu(:,1:59))

Do i1=1,1
gTGlu =Sum(gPGlu(i1,:)) 
If (gTGlu.Gt.0._dp) BRGlu(i1,: ) =gPGlu(i1,:)/gTGlu 
If (OneLoopDecays) Then 
gT1LGlu =Sum(gP1LGlu(i1,:)) 
If (gT1LGlu.Gt.0._dp) BR1LGlu(i1,: ) =gP1LGlu(i1,:)/gT1LGlu 
End if
End Do 
 

gPChi = 0._dp 
gTChi = 0._dp 
BRChi = 0._dp 
Call ChiTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,              & 
& ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,             & 
& Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,             & 
& ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gPChi(:,1:194),gTChi,              & 
& BRChi(:,1:194))

Do i1=1,9
gTChi(i1) =Sum(gPChi(i1,:)) 
If (gTChi(i1).Gt.0._dp) BRChi(i1,: ) =gPChi(i1,:)/gTChi(i1) 
If (OneLoopDecays) Then 
gT1LChi(i1) =Sum(gP1LChi(i1,:)) 
If (gT1LChi(i1).Gt.0._dp) BR1LChi(i1,: ) =gP1LChi(i1,:)/gT1LChi(i1) 
End if
End Do 
 

gPCha = 0._dp 
gTCha = 0._dp 
BRCha = 0._dp 
Call ChaTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,              & 
& ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,             & 
& Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,             & 
& ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gPCha(:,1:116),gTCha,              & 
& BRCha(:,1:116))

Do i1=1,2
gTCha(i1) =Sum(gPCha(i1,:)) 
If (gTCha(i1).Gt.0._dp) BRCha(i1,: ) =gPCha(i1,:)/gTCha(i1) 
If (OneLoopDecays) Then 
gT1LCha(i1) =Sum(gP1LCha(i1,:)) 
If (gT1LCha(i1).Gt.0._dp) BR1LCha(i1,: ) =gP1LCha(i1,:)/gT1LCha(i1) 
End if
End Do 
 

gPFu = 0._dp 
gTFu = 0._dp 
BRFu = 0._dp 
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,              & 
& ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,             & 
& Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,             & 
& ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gPFu,gTFu,BRFu)

Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
If (OneLoopDecays) Then 
gT1LFu(i1) =Sum(gP1LFu(i1,:)) 
If (gT1LFu(i1).Gt.0._dp) BR1LFu(i1,: ) =gP1LFu(i1,:)/gT1LFu(i1) 
End if
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_Sd)) Then 
If (MaxVal(gTSd).Lt.MaxVal(fac3*Abs(MSd))) Then 
Call SdThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gSdAhChaFu,gSdAhChiFd,gSdAhFdGlu,       & 
& gSdSuChaChi,gSdChaFdcHpm,gSdhhChaFu,gSdChaGluSu,gSdSdChacCha,gSdSdChiChi,              & 
& gSdhhChiFd,gSdHpmChiFu,gSdChiGluSd,gSdFdFdcSd,gSdFdFecSe,gSdFuFdcSu,gSdFdFvcSv,        & 
& gSdHpmFdcCha,gSdSdFdcFd,gSdFdSecFe,gSdSuFdcFu,gSdFdSvcFv,gSdFuFecSv,gSdSdFucFu,        & 
& gSdFuSecFv,gSdhhFdGlu,gSdHpmFuGlu,gSdGluGluSd,gSdSdFecFe,gSdSdFvcFv,gSdSuFecFv,        & 
& epsI,deltaM,.False.,gTSd,gPSd(:,133:2094),BRSd(:,133:2094))

Else 
Call SdThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gSdAhChaFu,gSdAhChiFd,gSdAhFdGlu,       & 
& gSdSuChaChi,gSdChaFdcHpm,gSdhhChaFu,gSdChaGluSu,gSdSdChacCha,gSdSdChiChi,              & 
& gSdhhChiFd,gSdHpmChiFu,gSdChiGluSd,gSdFdFdcSd,gSdFdFecSe,gSdFuFdcSu,gSdFdFvcSv,        & 
& gSdHpmFdcCha,gSdSdFdcFd,gSdFdSecFe,gSdSuFdcFu,gSdFdSvcFv,gSdFuFecSv,gSdSdFucFu,        & 
& gSdFuSecFv,gSdhhFdGlu,gSdHpmFuGlu,gSdGluGluSd,gSdSdFecFe,gSdSdFvcFv,gSdSuFecFv,        & 
& epsI,deltaM,.True.,gTSd,gPSd(:,133:2094),BRSd(:,133:2094))

End If 
 
End If 
Else 
Call SdThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gSdAhChaFu,gSdAhChiFd,gSdAhFdGlu,       & 
& gSdSuChaChi,gSdChaFdcHpm,gSdhhChaFu,gSdChaGluSu,gSdSdChacCha,gSdSdChiChi,              & 
& gSdhhChiFd,gSdHpmChiFu,gSdChiGluSd,gSdFdFdcSd,gSdFdFecSe,gSdFuFdcSu,gSdFdFvcSv,        & 
& gSdHpmFdcCha,gSdSdFdcFd,gSdFdSecFe,gSdSuFdcFu,gSdFdSvcFv,gSdFuFecSv,gSdSdFucFu,        & 
& gSdFuSecFv,gSdhhFdGlu,gSdHpmFuGlu,gSdGluGluSd,gSdSdFecFe,gSdSdFvcFv,gSdSuFecFv,        & 
& epsI,deltaM,.False.,gTSd,gPSd(:,133:2094),BRSd(:,133:2094))

End If 
Do i1=1,6
gTSd(i1) =Sum(gPSd(i1,:)) 
If (gTSd(i1).Gt.0._dp) BRSd(i1,: ) =gPSd(i1,:)/gTSd(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_Su)) Then 
If (MaxVal(gTSu).Lt.MaxVal(fac3*Abs(MSu))) Then 
Call SuThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gSuAhChiFu,gSuAhFdcCha,gSuAhFuGlu,      & 
& gSuSuChiChi,gSucHpmChiFd,gSuhhChiFu,gSuChiGluSu,gSuSdChicCha,gSuFdFucSd,               & 
& gSuFdFvcSe,gSuhhFdcCha,gSuSuFdcFd,gSuFdSvcFe,gSucHpmChaFu,gSuFuFecSe,gSuFuFucSu,       & 
& gSuFuFvcSv,gSucChaFuHpm,gSuSdFucFd,gSuFuSecFe,gSuSuFucFu,gSuFuSvcFv,gSucHpmFdGlu,      & 
& gSuhhFuGlu,gSuGluGluSu,gSuGluSdcCha,gSuSdFvcFe,gSuSuChacCha,gSuSuFecFe,gSuSuFvcFv,     & 
& epsI,deltaM,.False.,gTSu,gPSu(:,133:2094),BRSu(:,133:2094))

Else 
Call SuThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gSuAhChiFu,gSuAhFdcCha,gSuAhFuGlu,      & 
& gSuSuChiChi,gSucHpmChiFd,gSuhhChiFu,gSuChiGluSu,gSuSdChicCha,gSuFdFucSd,               & 
& gSuFdFvcSe,gSuhhFdcCha,gSuSuFdcFd,gSuFdSvcFe,gSucHpmChaFu,gSuFuFecSe,gSuFuFucSu,       & 
& gSuFuFvcSv,gSucChaFuHpm,gSuSdFucFd,gSuFuSecFe,gSuSuFucFu,gSuFuSvcFv,gSucHpmFdGlu,      & 
& gSuhhFuGlu,gSuGluGluSu,gSuGluSdcCha,gSuSdFvcFe,gSuSuChacCha,gSuSuFecFe,gSuSuFvcFv,     & 
& epsI,deltaM,.True.,gTSu,gPSu(:,133:2094),BRSu(:,133:2094))

End If 
 
End If 
Else 
Call SuThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gSuAhChiFu,gSuAhFdcCha,gSuAhFuGlu,      & 
& gSuSuChiChi,gSucHpmChiFd,gSuhhChiFu,gSuChiGluSu,gSuSdChicCha,gSuFdFucSd,               & 
& gSuFdFvcSe,gSuhhFdcCha,gSuSuFdcFd,gSuFdSvcFe,gSucHpmChaFu,gSuFuFecSe,gSuFuFucSu,       & 
& gSuFuFvcSv,gSucChaFuHpm,gSuSdFucFd,gSuFuSecFe,gSuSuFucFu,gSuFuSvcFv,gSucHpmFdGlu,      & 
& gSuhhFuGlu,gSuGluGluSu,gSuGluSdcCha,gSuSdFvcFe,gSuSuChacCha,gSuSuFecFe,gSuSuFvcFv,     & 
& epsI,deltaM,.False.,gTSu,gPSu(:,133:2094),BRSu(:,133:2094))

End If 
Do i1=1,6
gTSu(i1) =Sum(gPSu(i1,:)) 
If (gTSu(i1).Gt.0._dp) BRSu(i1,: ) =gPSu(i1,:)/gTSu(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_Se)) Then 
If (MaxVal(gTSe).Lt.MaxVal(fac3*Abs(MSe))) Then 
Call SeThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gSeAhChaFv,gSeAhChiFe,gSeSvChaChi,      & 
& gSeChaFecHpm,gSehhChaFv,gSeSeChacCha,gSeSeChiChi,gSehhChiFe,gSeHpmChiFv,               & 
& gSeFeFdcSd,gSeFeFecSe,gSeFeFucSu,gSeFvFecSv,gSeHpmFecCha,gSeFeSdcFd,gSeSeFecFe,        & 
& gSeFeSucFu,gSeSvFecFv,gSeFvFdcSu,gSeFvSdcFu,gSeSeFvcFv,gSeSeFdcFd,gSeSeFucFu,          & 
& gSeSvFdcFu,epsI,deltaM,.False.,gTSe,gPSe(:,124:1971),BRSe(:,124:1971))

Else 
Call SeThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gSeAhChaFv,gSeAhChiFe,gSeSvChaChi,      & 
& gSeChaFecHpm,gSehhChaFv,gSeSeChacCha,gSeSeChiChi,gSehhChiFe,gSeHpmChiFv,               & 
& gSeFeFdcSd,gSeFeFecSe,gSeFeFucSu,gSeFvFecSv,gSeHpmFecCha,gSeFeSdcFd,gSeSeFecFe,        & 
& gSeFeSucFu,gSeSvFecFv,gSeFvFdcSu,gSeFvSdcFu,gSeSeFvcFv,gSeSeFdcFd,gSeSeFucFu,          & 
& gSeSvFdcFu,epsI,deltaM,.True.,gTSe,gPSe(:,124:1971),BRSe(:,124:1971))

End If 
 
End If 
Else 
Call SeThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gSeAhChaFv,gSeAhChiFe,gSeSvChaChi,      & 
& gSeChaFecHpm,gSehhChaFv,gSeSeChacCha,gSeSeChiChi,gSehhChiFe,gSeHpmChiFv,               & 
& gSeFeFdcSd,gSeFeFecSe,gSeFeFucSu,gSeFvFecSv,gSeHpmFecCha,gSeFeSdcFd,gSeSeFecFe,        & 
& gSeFeSucFu,gSeSvFecFv,gSeFvFdcSu,gSeFvSdcFu,gSeSeFvcFv,gSeSeFdcFd,gSeSeFucFu,          & 
& gSeSvFdcFu,epsI,deltaM,.False.,gTSe,gPSe(:,124:1971),BRSe(:,124:1971))

End If 
Do i1=1,6
gTSe(i1) =Sum(gPSe(i1,:)) 
If (gTSe(i1).Gt.0._dp) BRSe(i1,: ) =gPSe(i1,:)/gTSe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_Sv)) Then 
If (MaxVal(gTSv).Lt.MaxVal(fac3*Abs(MSv))) Then 
Call SvThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gSvAhChiFv,gSvAhFecCha,gSvSvChiChi,     & 
& gSvcHpmChiFe,gSvhhChiFv,gSvSeChicCha,gSvFeFucSd,gSvFeFvcSe,gSvhhFecCha,gSvFeSucFd,     & 
& gSvSvFecFe,gSvcHpmChaFv,gSvFvFdcSd,gSvFvFucSu,gSvFvFvcSv,gSvcChaFvHpm,gSvFvSdcFd,      & 
& gSvSeFvcFe,gSvFvSucFu,gSvSvFvcFv,gSvSeFucFd,gSvSvChacCha,gSvSvFdcFd,gSvSvFucFu,        & 
& epsI,deltaM,.False.,gTSv,gPSv(:,124:1971),BRSv(:,124:1971))

Else 
Call SvThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gSvAhChiFv,gSvAhFecCha,gSvSvChiChi,     & 
& gSvcHpmChiFe,gSvhhChiFv,gSvSeChicCha,gSvFeFucSd,gSvFeFvcSe,gSvhhFecCha,gSvFeSucFd,     & 
& gSvSvFecFe,gSvcHpmChaFv,gSvFvFdcSd,gSvFvFucSu,gSvFvFvcSv,gSvcChaFvHpm,gSvFvSdcFd,      & 
& gSvSeFvcFe,gSvFvSucFu,gSvSvFvcFv,gSvSeFucFd,gSvSvChacCha,gSvSvFdcFd,gSvSvFucFu,        & 
& epsI,deltaM,.True.,gTSv,gPSv(:,124:1971),BRSv(:,124:1971))

End If 
 
End If 
Else 
Call SvThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gSvAhChiFv,gSvAhFecCha,gSvSvChiChi,     & 
& gSvcHpmChiFe,gSvhhChiFv,gSvSeChicCha,gSvFeFucSd,gSvFeFvcSe,gSvhhFecCha,gSvFeSucFd,     & 
& gSvSvFecFe,gSvcHpmChaFv,gSvFvFdcSd,gSvFvFucSu,gSvFvFvcSv,gSvcChaFvHpm,gSvFvSdcFd,      & 
& gSvSeFvcFe,gSvFvSucFu,gSvSvFvcFv,gSvSeFucFd,gSvSvChacCha,gSvSvFdcFd,gSvSvFucFu,        & 
& epsI,deltaM,.False.,gTSv,gPSv(:,124:1971),BRSv(:,124:1971))

End If 
Do i1=1,6
gTSv(i1) =Sum(gPSv(i1,:)) 
If (gTSv(i1).Gt.0._dp) BRSv(i1,: ) =gPSv(i1,:)/gTSv(i1) 
End Do 
 

! No 3-body decays for hh  
! No 3-body decays for Ah  
! No 3-body decays for Hpm  
! No 3-body decays for VZp  
If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Glu)) Then 
If (gTGlu.Lt.fac3*Abs(MGlu)) Then 
Call GluThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gTSd,gTSu,gGluFdcFdChi,gGluFdcFucCha,   & 
& gGluFucFuChi,epsI,deltaM,.False.,gTGlu,gPGlu(:,60:239),BRGlu(:,60:239))

Else 
Call GluThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gTSd,gTSu,gGluFdcFdChi,gGluFdcFucCha,   & 
& gGluFucFuChi,epsI,deltaM,.True.,gTGlu,gPGlu(:,60:239),BRGlu(:,60:239))

End If 
 
End If 
Else 
Call GluThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gTSd,gTSu,gGluFdcFdChi,gGluFdcFucCha,   & 
& gGluFucFuChi,epsI,deltaM,.False.,gTGlu,gPGlu(:,60:239),BRGlu(:,60:239))

End If 
Do i1=1,1
gTGlu =Sum(gPGlu(i1,:)) 
If (gTGlu.Gt.0._dp) BRGlu(i1,: ) =gPGlu(i1,:)/gTGlu 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Chi)) Then 
If (MaxVal(gTChi).Lt.MaxVal(fac3*Abs(MChi))) Then 
Call ChiThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gTAh,gThh,gTHpm,gTSd,gTSe,              & 
& gTSu,gTSv,gTVWm,gTVZ,gTVZp,gChiChicChaCha,gChiChiChiChi,gChiChicFdFd,gChiChicFeFe,     & 
& gChiChicFuFu,gChiChicFvFv,gChiChacFdFu,gChiChacFeFv,gChiFdcFdGlu,gChiFucFuGlu,         & 
& epsI,deltaM,.False.,gTChi,gPChi(:,195:1337),BRChi(:,195:1337))

Else 
Call ChiThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gTAh,gThh,gTHpm,gTSd,gTSe,              & 
& gTSu,gTSv,gTVWm,gTVZ,gTVZp,gChiChicChaCha,gChiChiChiChi,gChiChicFdFd,gChiChicFeFe,     & 
& gChiChicFuFu,gChiChicFvFv,gChiChacFdFu,gChiChacFeFv,gChiFdcFdGlu,gChiFucFuGlu,         & 
& epsI,deltaM,.True.,gTChi,gPChi(:,195:1337),BRChi(:,195:1337))

End If 
 
End If 
Else 
Call ChiThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gTAh,gThh,gTHpm,gTSd,gTSe,              & 
& gTSu,gTSv,gTVWm,gTVZ,gTVZp,gChiChicChaCha,gChiChiChiChi,gChiChicFdFd,gChiChicFeFe,     & 
& gChiChicFuFu,gChiChicFvFv,gChiChacFdFu,gChiChacFeFv,gChiFdcFdGlu,gChiFucFuGlu,         & 
& epsI,deltaM,.False.,gTChi,gPChi(:,195:1337),BRChi(:,195:1337))

End If 
Do i1=1,9
gTChi(i1) =Sum(gPChi(i1,:)) 
If (gTChi(i1).Gt.0._dp) BRChi(i1,: ) =gPChi(i1,:)/gTChi(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Cha)) Then 
If (MaxVal(gTCha).Lt.MaxVal(fac3*Abs(MCha))) Then 
Call ChaThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gTAh,gThh,gTHpm,gTSd,gTSe,              & 
& gTSu,gTSv,gTVWm,gTVZ,gTVZp,gChaChacChaCha,gChaChaChiChi,gChaChacFdFd,gChaChacFeFe,     & 
& gChaChacFuFu,gChaChacFvFv,gChaChicFuFd,gChaChicFvFe,gChaFdcFuGlu,epsI,deltaM,          & 
& .False.,gTCha,gPCha(:,117:529),BRCha(:,117:529))

Else 
Call ChaThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gTAh,gThh,gTHpm,gTSd,gTSe,              & 
& gTSu,gTSv,gTVWm,gTVZ,gTVZp,gChaChacChaCha,gChaChaChiChi,gChaChacFdFd,gChaChacFeFe,     & 
& gChaChacFuFu,gChaChacFvFv,gChaChicFuFd,gChaChicFvFe,gChaFdcFuGlu,epsI,deltaM,          & 
& .True.,gTCha,gPCha(:,117:529),BRCha(:,117:529))

End If 
 
End If 
Else 
Call ChaThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gTAh,gThh,gTHpm,gTSd,gTSe,              & 
& gTSu,gTSv,gTVWm,gTVZ,gTVZp,gChaChacChaCha,gChaChaChiChi,gChaChacFdFd,gChaChacFeFe,     & 
& gChaChacFuFu,gChaChacFvFv,gChaChicFuFd,gChaChicFvFe,gChaFdcFuGlu,epsI,deltaM,          & 
& .False.,gTCha,gPCha(:,117:529),BRCha(:,117:529))

End If 
Do i1=1,2
gTCha(i1) =Sum(gPCha(i1,:)) 
If (gTCha(i1).Gt.0._dp) BRCha(i1,: ) =gPCha(i1,:)/gTCha(i1) 
End Do 
 

! No 3-body decays for Fu  
Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_sec_UMSSM 
 