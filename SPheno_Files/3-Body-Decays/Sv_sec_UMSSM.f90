! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 1:01 on 7.11.2019   
! ----------------------------------------------------------------------  
 
 
Module Sv3Decays_sec_UMSSM 
 
Use Control 
Use Settings 
Use CouplingsForDecays_sec_UMSSM 
Use ThreeBodyPhaseSpaceS 
 
Contains 
 
Subroutine SvThreeBodyDecay(n_in,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,             & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,              & 
& ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,             & 
& Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,             & 
& ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,gSvAhChiFv,gSvAhFecCha,            & 
& gSvSvChiChi,gSvcHpmChiFe,gSvhhChiFv,gSvSeChicCha,gSvFeFucSd,gSvFeFvcSe,gSvhhFecCha,    & 
& gSvFeSucFd,gSvSvFecFe,gSvcHpmChaFv,gSvFvFdcSd,gSvFvFucSu,gSvFvFvcSv,gSvcChaFvHpm,      & 
& gSvFvSdcFd,gSvSeFvcFe,gSvFvSucFu,gSvSvFvcFv,gSvSeFucFd,gSvSvChacCha,gSvSvFdcFd,        & 
& gSvSvFucFu,epsI,deltaM,CheckRealStates,gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(in) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Complex(dp) :: cplAhSvcSv(6,6,6),cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),cplcChaChaAhL(2,2,6),     & 
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

Real(dp),Intent(in) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp),Intent(inout) :: gSvAhChiFv(6,6,9,3),gSvAhFecCha(6,6,3,2),gSvSvChiChi(6,6,9,9),gSvcHpmChiFe(6,2,9,3),  & 
& gSvhhChiFv(6,6,9,3),gSvSeChicCha(6,6,9,2),gSvFeFucSd(6,3,3,6),gSvFeFvcSe(6,3,3,6),     & 
& gSvhhFecCha(6,6,3,2),gSvFeSucFd(6,3,6,3),gSvSvFecFe(6,6,3,3),gSvcHpmChaFv(6,2,2,3),    & 
& gSvFvFdcSd(6,3,3,6),gSvFvFucSu(6,3,3,6),gSvFvFvcSv(6,3,3,6),gSvcChaFvHpm(6,2,3,2),     & 
& gSvFvSdcFd(6,3,6,3),gSvSeFvcFe(6,6,3,3),gSvFvSucFu(6,3,6,3),gSvSvFvcFv(6,6,3,3),       & 
& gSvSeFucFd(6,6,3,3),gSvSvChacCha(6,6,2,2),gSvSvFdcFd(6,6,3,3),gSvSvFucFu(6,6,3,3)

Real(dp) :: gSvAhChiFvi(6,9,3),gSvAhFecChai(6,3,2),gSvSvChiChii(6,9,9),gSvcHpmChiFei(2,9,3),      & 
& gSvhhChiFvi(6,9,3),gSvSeChicChai(6,9,2),gSvFeFucSdi(3,3,6),gSvFeFvcSei(3,3,6),         & 
& gSvhhFecChai(6,3,2),gSvFeSucFdi(3,6,3),gSvSvFecFei(6,3,3),gSvcHpmChaFvi(2,2,3),        & 
& gSvFvFdcSdi(3,3,6),gSvFvFucSui(3,3,6),gSvFvFvcSvi(3,3,6),gSvcChaFvHpmi(2,3,2),         & 
& gSvFvSdcFdi(3,6,3),gSvSeFvcFei(6,3,3),gSvFvSucFui(3,6,3),gSvSvFvcFvi(6,3,3),           & 
& gSvSeFucFdi(6,3,3),gSvSvChacChai(6,2,2),gSvSvFdcFdi(6,3,3),gSvSvFucFui(6,3,3)

Real(dp), Intent(inout), Optional :: BR(:,:), gPartial(:,:) 
Real(dp), Intent(inout) :: gT(:) 
Integer, Intent(in) :: n_in 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Intent(in) ::  CheckRealStates 
Integer :: i_start, i_end, i_run, n_out, n_length, gt1, gt2, gt3, i1 
Logical :: check 
Iname = Iname +1 
NameOfUnit(Iname) = 'SvThreeBodyDecay' 
 

 
If (CheckRealStates) Then 
Else 
End If 
 
check=CheckRealStates 

 
If (n_in.Lt.0) Then 
 i_start = 1 
 i_end = 6 
 Else If ( (n_in.Ge.1).And.(n_in.Le. 6) ) Then 
 i_start = n_in 
 i_end = n_in 
Else 
 If (ErrorLevel.Ge.-1) Then 
   Write (ErrCan, *) 'Problem in subroutine'//NameOfUnit(Iname) 
   Write (ErrCan, *) 'Value of n_in out of range, (n_in,6) = ',n_in,6 
 End If 
 
 If (ErrorLevel.Gt.0) Call TerminateProgram 
 
 If (Present(BR)) BR = 0._dp 
 Iname = Iname - 1 
 Return 
End If 
 
Do i_run = i_start, i_end 
 
Call CouplingsFor_Sv_decays_3B(MSv(i_run),i_run,MAh,MAh2,MCha,MCha2,MChi,             & 
& MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,              & 
& MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,              & 
& TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,           & 
& md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,vS,vS1,vS2,vS3,cplAhSvcSv,        & 
& cplcChacFvSeL,cplcChacFvSeR,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,   & 
& cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,cplcChaChiHpmL,              & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,              & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,             & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeChaSvL,cplcFeChaSvR,         & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFuAhL,cplcFuFuAhR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,             & 
& cplcFvChiSvL,cplcFvChiSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFvAhL,cplcFvFvAhR,         & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZpL,cplcFvFvVZpR,cplcFvFvVZR,             & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplChiChacHpmL,cplChiChacHpmR,     & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,        & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplhhSvcSv,cplSecHpmcSv,           & 
& cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,deltaM)


 
gSvAhChiFvi = 0._dp 
Call SvToAhChiFv(i_run,MAh,MChi,MFv,MSv,cplAhSvcSv,cplcFvFvAhL,cplcFvFvAhR,           & 
& cplChiChiAhL,cplChiChiAhR,cplChiFvcSvL,cplChiFvcSvR,deltaM,epsI,check,gSvAhChiFvi)

gSvAhChiFv(i_run,:,:,:) = gSvAhChiFvi 
gT(i_run) = gT(i_run) + Sum(gSvAhChiFvi) 
 
gSvAhFecChai = 0._dp 
Call SvToAhFecCha(i_run,MAh,MFe,MCha,MSv,cplAhSvcSv,cplcChaChaAhL,cplcChaChaAhR,      & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFeFeAhL,cplcFeFeAhR,deltaM,epsI,check,gSvAhFecChai)

gSvAhFecCha(i_run,:,:,:) = gSvAhFecChai 
gT(i_run) = gT(i_run) + Sum(gSvAhFecChai) 
 
gSvSvChiChii = 0._dp 
Call SvToSvChiChi(i_run,MSv,MChi,MVZ,MVZp,MAh,Mhh,MFv,cplAhSvcSv,cplhhSvcSv,          & 
& cplSvcSvVZ,cplSvcSvVZp,cplcFvChiSvL,cplcFvChiSvR,cplChiChiAhL,cplChiChiAhR,            & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFvcSvL,cplChiFvcSvR,deltaM,epsI,check,gSvSvChiChii)

gSvSvChiChi(i_run,:,:,:) = gSvSvChiChii 
gT(i_run) = gT(i_run) + Sum(gSvSvChiChii) 
 
gSvcHpmChiFei = 0._dp 
Call SvTocHpmChiFe(i_run,MHpm,MChi,MFe,MSe,MFv,MCha,MSv,cplSecHpmcSv,cplcChaFecSvL,   & 
& cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplChiChacHpmL,cplChiChacHpmR,               & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,deltaM,epsI,check,gSvcHpmChiFei)

gSvcHpmChiFe(i_run,:,:,:) = gSvcHpmChiFei 
gT(i_run) = gT(i_run) + Sum(gSvcHpmChiFei) 
 
gSvhhChiFvi = 0._dp 
Call SvTohhChiFv(i_run,Mhh,MChi,MFv,MSv,cplhhSvcSv,cplcFvFvhhL,cplcFvFvhhR,           & 
& cplChiChihhL,cplChiChihhR,cplChiFvcSvL,cplChiFvcSvR,deltaM,epsI,check,gSvhhChiFvi)

gSvhhChiFv(i_run,:,:,:) = gSvhhChiFvi 
gT(i_run) = gT(i_run) + Sum(gSvhhChiFvi) 
 
gSvSeChicChai = 0._dp 
Call SvToSeChicCha(i_run,MSe,MChi,MCha,MVWm,MHpm,MFv,MFe,MSv,cplSecHpmcSv,            & 
& cplSecSvcVWm,cplcChacFvSeL,cplcChacFvSeR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,cplcFeChiSeL,cplcFeChiSeR,cplChiFvcSvL,     & 
& cplChiFvcSvR,deltaM,epsI,check,gSvSeChicChai)

gSvSeChicCha(i_run,:,:,:) = gSvSeChicChai 
gT(i_run) = gT(i_run) + Sum(gSvSeChicChai) 
 
gSvFeFucSdi = 0._dp 
Call SvToFeFucSd(i_run,MFe,MFu,MSd,MCha,MSv,cplcChaFecSvL,cplcChaFecSvR,              & 
& cplChaFucSdL,cplChaFucSdR,deltaM,epsI,check,gSvFeFucSdi)

gSvFeFucSd(i_run,:,:,:) = gSvFeFucSdi 
gT(i_run) = gT(i_run) + Sum(gSvFeFucSdi) 
 
gSvFeFvcSei = 0._dp 
Call SvToFeFvcSe(i_run,MFe,MFv,MSe,MCha,MChi,MSv,cplcChaFecSvL,cplcChaFecSvR,         & 
& cplChaFvcSeL,cplChaFvcSeR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,         & 
& deltaM,epsI,check,gSvFeFvcSei)

gSvFeFvcSe(i_run,:,:,:) = gSvFeFvcSei 
gT(i_run) = gT(i_run) + Sum(gSvFeFvcSei) 
 
gSvhhFecChai = 0._dp 
Call SvTohhFecCha(i_run,Mhh,MFe,MCha,MSv,cplhhSvcSv,cplcChaChahhL,cplcChaChahhR,      & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFeFehhL,cplcFeFehhR,deltaM,epsI,check,gSvhhFecChai)

gSvhhFecCha(i_run,:,:,:) = gSvhhFecChai 
gT(i_run) = gT(i_run) + Sum(gSvhhFecChai) 
 
gSvFeSucFdi = 0._dp 
Call SvToFeSucFd(i_run,MFe,MSu,MFd,MCha,MSv,cplcChaFecSvL,cplcChaFecSvR,              & 
& cplcFdChaSuL,cplcFdChaSuR,deltaM,epsI,check,gSvFeSucFdi)

gSvFeSucFd(i_run,:,:,:) = gSvFeSucFdi 
gT(i_run) = gT(i_run) + Sum(gSvFeSucFdi) 
 
gSvSvFecFei = 0._dp 
Call SvToSvFecFe(i_run,MSv,MFe,MVZ,MVZp,MAh,Mhh,MCha,cplAhSvcSv,cplhhSvcSv,           & 
& cplSvcSvVZ,cplSvcSvVZp,cplcChaFecSvL,cplcChaFecSvR,cplcFeChaSvL,cplcFeChaSvR,          & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,deltaM,epsI,check,gSvSvFecFei)

gSvSvFecFe(i_run,:,:,:) = gSvSvFecFei 
gT(i_run) = gT(i_run) + Sum(gSvSvFecFei) 
 
gSvcHpmChaFvi = 0._dp 
Call SvTocHpmChaFv(i_run,MHpm,MCha,MFv,MSe,MChi,MSv,cplSecHpmcSv,cplChaFvcSeL,        & 
& cplChaFvcSeR,cplChiChacHpmL,cplChiChacHpmR,cplChiFvcSvL,cplChiFvcSvR,deltaM,           & 
& epsI,check,gSvcHpmChaFvi)

gSvcHpmChaFv(i_run,:,:,:) = gSvcHpmChaFvi 
gT(i_run) = gT(i_run) + Sum(gSvcHpmChaFvi) 
 
gSvFvFdcSdi = 0._dp 
Call SvToFvFdcSd(i_run,MFv,MFd,MSd,MChi,MSv,cplChiFdcSdL,cplChiFdcSdR,cplChiFvcSvL,   & 
& cplChiFvcSvR,deltaM,epsI,check,gSvFvFdcSdi)

gSvFvFdcSd(i_run,:,:,:) = gSvFvFdcSdi 
gT(i_run) = gT(i_run) + Sum(gSvFvFdcSdi) 
 
gSvFvFucSui = 0._dp 
Call SvToFvFucSu(i_run,MFv,MFu,MSu,MChi,MSv,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,   & 
& cplChiFvcSvR,deltaM,epsI,check,gSvFvFucSui)

gSvFvFucSu(i_run,:,:,:) = gSvFvFucSui 
gT(i_run) = gT(i_run) + Sum(gSvFvFucSui) 
 
gSvFvFvcSvi = 0._dp 
Call SvToFvFvcSv(i_run,MFv,MSv,MChi,cplChiFvcSvL,cplChiFvcSvR,deltaM,epsI,            & 
& check,gSvFvFvcSvi)

gSvFvFvcSv(i_run,:,:,:) = gSvFvFvcSvi 
gT(i_run) = gT(i_run) + Sum(gSvFvFvcSvi) 
 
gSvcChaFvHpmi = 0._dp 
Call SvTocChaFvHpm(i_run,MCha,MFv,MHpm,MFe,MChi,MSv,cplcChaChiHpmL,cplcChaChiHpmR,    & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFeFvHpmL,cplcFeFvHpmR,cplChiFvcSvL,cplChiFvcSvR,       & 
& deltaM,epsI,check,gSvcChaFvHpmi)

gSvcChaFvHpm(i_run,:,:,:) = gSvcChaFvHpmi 
gT(i_run) = gT(i_run) + Sum(gSvcChaFvHpmi) 
 
gSvFvSdcFdi = 0._dp 
Call SvToFvSdcFd(i_run,MFv,MSd,MFd,MChi,MSv,cplcFdChiSdL,cplcFdChiSdR,cplChiFvcSvL,   & 
& cplChiFvcSvR,deltaM,epsI,check,gSvFvSdcFdi)

gSvFvSdcFd(i_run,:,:,:) = gSvFvSdcFdi 
gT(i_run) = gT(i_run) + Sum(gSvFvSdcFdi) 
 
gSvSeFvcFei = 0._dp 
Call SvToSeFvcFe(i_run,MSe,MFv,MFe,MVWm,MHpm,MChi,MSv,cplSecHpmcSv,cplSecSvcVWm,      & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,         & 
& cplChiFvcSvL,cplChiFvcSvR,deltaM,epsI,check,gSvSeFvcFei)

gSvSeFvcFe(i_run,:,:,:) = gSvSeFvcFei 
gT(i_run) = gT(i_run) + Sum(gSvSeFvcFei) 
 
gSvFvSucFui = 0._dp 
Call SvToFvSucFu(i_run,MFv,MSu,MFu,MChi,MSv,cplcFuChiSuL,cplcFuChiSuR,cplChiFvcSvL,   & 
& cplChiFvcSvR,deltaM,epsI,check,gSvFvSucFui)

gSvFvSucFu(i_run,:,:,:) = gSvFvSucFui 
gT(i_run) = gT(i_run) + Sum(gSvFvSucFui) 
 
gSvSvFvcFvi = 0._dp 
Call SvToSvFvcFv(i_run,MSv,MFv,MVZ,MVZp,MAh,Mhh,MChi,cplAhSvcSv,cplhhSvcSv,           & 
& cplSvcSvVZ,cplSvcSvVZp,cplcFvChiSvL,cplcFvChiSvR,cplcFvFvAhL,cplcFvFvAhR,              & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,             & 
& cplChiFvcSvL,cplChiFvcSvR,deltaM,epsI,check,gSvSvFvcFvi)

gSvSvFvcFv(i_run,:,:,:) = gSvSvFvcFvi 
gT(i_run) = gT(i_run) + Sum(gSvSvFvcFvi) 
 
gSvSeFucFdi = 0._dp 
Call SvToSeFucFd(i_run,MSe,MFu,MFd,MVWm,MHpm,MSv,cplSecHpmcSv,cplSecSvcVWm,           & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,deltaM,epsI,check,gSvSeFucFdi)

gSvSeFucFd(i_run,:,:,:) = gSvSeFucFdi 
gT(i_run) = gT(i_run) + Sum(gSvSeFucFdi) 
 
gSvSvChacChai = 0._dp 
Call SvToSvChacCha(i_run,MSv,MCha,MVZ,MVZp,MAh,Mhh,MFe,cplAhSvcSv,cplhhSvcSv,         & 
& cplSvcSvVZ,cplSvcSvVZp,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaFecSvL,               & 
& cplcChaFecSvR,cplcFeChaSvL,cplcFeChaSvR,deltaM,epsI,check,gSvSvChacChai)

gSvSvChacCha(i_run,:,:,:) = gSvSvChacChai 
gT(i_run) = gT(i_run) + Sum(gSvSvChacChai) 
 
gSvSvFdcFdi = 0._dp 
Call SvToSvFdcFd(i_run,MSv,MFd,MVZ,MVZp,MAh,Mhh,cplAhSvcSv,cplhhSvcSv,cplSvcSvVZ,     & 
& cplSvcSvVZp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,deltaM,epsI,check,gSvSvFdcFdi)

gSvSvFdcFd(i_run,:,:,:) = gSvSvFdcFdi 
gT(i_run) = gT(i_run) + Sum(gSvSvFdcFdi) 
 
gSvSvFucFui = 0._dp 
Call SvToSvFucFu(i_run,MSv,MFu,MVZ,MVZp,MAh,Mhh,cplAhSvcSv,cplhhSvcSv,cplSvcSvVZ,     & 
& cplSvcSvVZp,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,deltaM,epsI,check,gSvSvFucFui)

gSvSvFucFu(i_run,:,:,:) = gSvSvFucFui 
gT(i_run) = gT(i_run) + Sum(gSvSvFucFui) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=3,6
  Do gt2=1,9
    Do gt3=1,3
gPartial(i1,n_length)= gSvAhChiFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=3,6
  Do gt2=1,3
    Do gt3=1,2
gPartial(i1,n_length)= gSvAhFecCha(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,9
    Do gt3=gt2,9
gPartial(i1,n_length)= gSvSvChiChi(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,2
  Do gt2=1,9
    Do gt3=1,3
gPartial(i1,n_length)= gSvcHpmChiFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,9
    Do gt3=1,3
gPartial(i1,n_length)= gSvhhChiFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,9
    Do gt3=1,2
gPartial(i1,n_length)= gSvSeChicCha(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,6
gPartial(i1,n_length)= gSvFeFucSd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,6
gPartial(i1,n_length)= gSvFeFvcSe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,2
gPartial(i1,n_length)= gSvhhFecCha(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,3
gPartial(i1,n_length)= gSvFeSucFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gSvSvFecFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=2,2
  Do gt2=1,2
    Do gt3=1,3
gPartial(i1,n_length)= gSvcHpmChaFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,6
gPartial(i1,n_length)= gSvFvFdcSd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,6
gPartial(i1,n_length)= gSvFvFucSu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=gt1,3
    Do gt3=1,6
gPartial(i1,n_length)= gSvFvFvcSv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=2,2
gPartial(i1,n_length)= gSvcChaFvHpm(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,3
gPartial(i1,n_length)= gSvFvSdcFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gSvSeFvcFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,6
    Do gt3=1,3
gPartial(i1,n_length)= gSvFvSucFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gSvSvFvcFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gSvSeFucFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,2
gPartial(i1,n_length)= gSvSvChacCha(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gSvSvFdcFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gSvSvFucFu(i1,gt1,gt2,gt3)
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
Iname = Iname - 1 
 
End Subroutine SvThreeBodyDecay
 
 
Subroutine SvToAhChiFv(iIN,MAh,MChi,MFv,MSv,cplAhSvcSv,cplcFvFvAhL,cplcFvFvAhR,       & 
& cplChiChiAhL,cplChiChiAhR,cplChiFvcSvL,cplChiFvcSvR,deltaM,epsI,check,g,               & 
& WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MAh(6),MChi(9),MFv(3),MSv(6)

Complex(dp),Intent(in) :: cplAhSvcSv(6,6,6),cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),cplChiChiAhL(9,9,6),          & 
& cplChiChiAhR(9,9,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 324 
Allocate( gSum(6,9,3, Isum) ) 
Allocate( Contribution(6,9,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=3,6
      Do gt2=1,9
        Do gt3=1,3
Isum = 0 
 
rk2 = (MChi(gt2)/MSv(iIN))**2 
rm2 = (MFv(gt3)/MSv(iIN))**2 
rj2 = (MAh(gt1)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MFv(gt3))+Abs(MChi(gt2))+Abs(MAh(gt1)))) Then 
!-------------- 
!  Sv 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSv(i1) 
mass(2) = MSv(i1) 
m_in = MSv(iIN) 
coup(1) = Conjg(cplAhSvcSv(gt1,i1,iIN)) 
coup(3) = Conjg(cplChiFvcSvL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFvcSvR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Ah Chi Fv Propagator: Sv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Sv'
      End Do 



!-------------- 
!  Fv 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplChiFvcSvL(gt2,i1,iIN)) 
coup(1) = Conjg(cplChiFvcSvR(gt2,i1,iIN)) 
coup(4) = Conjg(cplcFvFvAhL(i1,gt3,gt1)) 
coup(3) = Conjg(cplcFvFvAhR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Ah Chi Fv Propagator: Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplChiFvcSvL(i1,gt3,iIN)) 
coup(1) = Conjg(cplChiFvcSvR(i1,gt3,iIN)) 
coup(4) = Conjg(cplChiChiAhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplChiChiAhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Ah Chi Fv Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Sv, Sv 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSv(i1)  
mass(2) = MSv(i2)  
coup(1) = cplAhSvcSv(gt1,i1,iIN) 
coup(3) = Conjg(cplChiFvcSvL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFvcSvR(gt2,gt3,i1))  
coup(4) = cplAhSvcSv(gt1,i2,iIN) 
coup(6) = Conjg(cplChiFvcSvL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiFvcSvR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Ah Chi Fv Propagator: Sv,Sv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sv,Sv'
        End Do 
      End Do 



!-------------- 
!  Sv, Fv 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSv(i1)  
mass(1) = MFv(i2)  
coup(1) = cplChiFvcSvL(gt2,i2,iIN) 
coup(2) = cplChiFvcSvR(gt2,i2,iIN) 
coup(4) = Conjg(cplcFvFvAhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcFvFvAhR(i2,gt3,gt1))  
coup(5) = cplAhSvcSv(gt1,i1,iIN) 
coup(7) = Conjg(cplChiFvcSvL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFvcSvR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Ah Chi Fv Propagator: Sv,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sv,Fv'
        End Do 
      End Do 



!-------------- 
!  Sv, Chi 
!-------------- 
Do i1=1,6
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSv(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiFvcSvL(i2,gt3,iIN) 
coup(2) = cplChiFvcSvR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiChiAhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplChiChiAhR(i2,gt2,gt1))  
coup(5) = cplAhSvcSv(gt1,i1,iIN) 
coup(7) = Conjg(cplChiFvcSvL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFvcSvR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Ah Chi Fv Propagator: Sv,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sv,Chi'
        End Do 
      End Do 



!-------------- 
!  Fv, Fv 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplChiFvcSvL(gt2,i1,iIN) 
coup(2) = cplChiFvcSvR(gt2,i1,iIN) 
coup(3) = cplcFvFvAhL(i1,gt3,gt1) 
coup(4) = cplcFvFvAhR(i1,gt3,gt1) 
coup(5) = cplChiFvcSvL(gt2,i2,iIN) 
coup(6) = cplChiFvcSvR(gt2,i2,iIN)  
coup(7) = cplcFvFvAhL(i2,gt3,gt1) 
coup(8) = cplcFvFvAhR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Ah Chi Fv Propagator: Fv,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv,Fv'
        End Do 
      End Do 



!-------------- 
!  Fv, Chi 
!-------------- 
Do i1=1,3
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFvcSvL(gt2,i1,iIN) 
coup(2) = cplChiFvcSvR(gt2,i1,iIN) 
coup(3) = cplcFvFvAhL(i1,gt3,gt1) 
coup(4) = cplcFvFvAhR(i1,gt3,gt1) 
coup(5) = cplChiFvcSvL(i2,gt3,iIN) 
coup(6) = cplChiFvcSvR(i2,gt3,iIN)  
coup(7) = cplChiChiAhL(i2,gt2,gt1) 
coup(8) = cplChiChiAhR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Ah Chi Fv Propagator: Fv,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFvcSvL(i1,gt3,iIN) 
coup(2) = cplChiFvcSvR(i1,gt3,iIN) 
coup(3) = cplChiChiAhL(i1,gt2,gt1) 
coup(4) = cplChiChiAhR(i1,gt2,gt1) 
coup(5) = cplChiFvcSvL(i2,gt3,iIN) 
coup(6) = cplChiFvcSvR(i2,gt3,iIN)  
coup(7) = cplChiChiAhL(i2,gt2,gt1) 
coup(8) = cplChiChiAhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Ah Chi Fv Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
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
    Do gt1=3,6
      Do gt2=1,9
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:324))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvToAhChiFv 
 
 
Subroutine SvToAhFecCha(iIN,MAh,MFe,MCha,MSv,cplAhSvcSv,cplcChaChaAhL,cplcChaChaAhR,  & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFeFeAhL,cplcFeFeAhR,deltaM,epsI,check,g,               & 
& WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MAh(6),MFe(3),MCha(2),MSv(6)

Complex(dp),Intent(in) :: cplAhSvcSv(6,6,6),cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplcChaFecSvL(2,3,6),     & 
& cplcChaFecSvR(2,3,6),cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 121 
Allocate( gSum(6,3,2, Isum) ) 
Allocate( Contribution(6,3,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=3,6
      Do gt2=1,3
        Do gt3=1,2
Isum = 0 
 
rk2 = (MFe(gt2)/MSv(iIN))**2 
rm2 = (MCha(gt3)/MSv(iIN))**2 
rj2 = (MAh(gt1)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MCha(gt3))+Abs(MFe(gt2))+Abs(MAh(gt1)))) Then 
!-------------- 
!  Sv 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSv(i1) 
mass(2) = MSv(i1) 
m_in = MSv(iIN) 
coup(1) = Conjg(cplAhSvcSv(gt1,i1,iIN)) 
coup(3) = Conjg(cplcChaFecSvL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaFecSvR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Ah Fe cCha Propagator: Sv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Sv'
      End Do 



!-------------- 
!  bar[Cha] 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplcChaFecSvL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcChaFecSvR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcChaChaAhL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcChaChaAhR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Ah Fe cCha Propagator: bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha]'
      End Do 



!-------------- 
!  Fe 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplcChaFecSvL(gt3,i1,iIN)) 
coup(1) = Conjg(cplcChaFecSvR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcFeFeAhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFeFeAhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Ah Fe cCha Propagator: Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe'
      End Do 



!-------------- 
!  Sv, Sv 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSv(i1)  
mass(2) = MSv(i2)  
coup(1) = cplAhSvcSv(gt1,i1,iIN) 
coup(3) = Conjg(cplcChaFecSvL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaFecSvR(gt3,gt2,i1))  
coup(4) = cplAhSvcSv(gt1,i2,iIN) 
coup(6) = Conjg(cplcChaFecSvL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaFecSvR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Ah Fe cCha Propagator: Sv,Sv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sv,Sv'
        End Do 
      End Do 



!-------------- 
!  Sv, bar[Cha] 
!-------------- 
Do i1=1,6
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSv(i1)  
mass(1) = MCha(i2)  
coup(1) = cplcChaFecSvL(i2,gt2,iIN) 
coup(2) = cplcChaFecSvR(i2,gt2,iIN) 
coup(4) = Conjg(cplcChaChaAhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcChaChaAhR(gt3,i2,gt1))  
coup(5) = cplAhSvcSv(gt1,i1,iIN) 
coup(7) = Conjg(cplcChaFecSvL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcChaFecSvR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Ah Fe cCha Propagator: Sv,bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sv,bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  Sv, Fe 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSv(i1)  
mass(1) = MFe(i2)  
coup(1) = cplcChaFecSvL(gt3,i2,iIN) 
coup(2) = cplcChaFecSvR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeFeAhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeFeAhR(i2,gt2,gt1))  
coup(5) = cplAhSvcSv(gt1,i1,iIN) 
coup(7) = Conjg(cplcChaFecSvL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcChaFecSvR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Ah Fe cCha Propagator: Sv,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sv,Fe'
        End Do 
      End Do 



!-------------- 
!  bar[Cha], bar[Cha] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplcChaFecSvL(i1,gt2,iIN) 
coup(2) = cplcChaFecSvR(i1,gt2,iIN) 
coup(3) = cplcChaChaAhL(gt3,i1,gt1) 
coup(4) = cplcChaChaAhR(gt3,i1,gt1) 
coup(5) = cplcChaFecSvL(i2,gt2,iIN) 
coup(6) = cplcChaFecSvR(i2,gt2,iIN)  
coup(7) = cplcChaChaAhL(gt3,i2,gt1) 
coup(8) = cplcChaChaAhR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Ah Fe cCha Propagator: bar[Cha],bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  bar[Cha], Fe 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcChaFecSvL(i1,gt2,iIN) 
coup(2) = cplcChaFecSvR(i1,gt2,iIN) 
coup(3) = cplcChaChaAhL(gt3,i1,gt1) 
coup(4) = cplcChaChaAhR(gt3,i1,gt1) 
coup(5) = cplcChaFecSvL(gt3,i2,iIN) 
coup(6) = cplcChaFecSvR(gt3,i2,iIN)  
coup(7) = cplcFeFeAhL(i2,gt2,gt1) 
coup(8) = cplcFeFeAhR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Ah Fe cCha Propagator: bar[Cha],Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],Fe'
        End Do 
      End Do 



!-------------- 
!  Fe, Fe 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcChaFecSvL(gt3,i1,iIN) 
coup(2) = cplcChaFecSvR(gt3,i1,iIN) 
coup(3) = cplcFeFeAhL(i1,gt2,gt1) 
coup(4) = cplcFeFeAhR(i1,gt2,gt1) 
coup(5) = cplcChaFecSvL(gt3,i2,iIN) 
coup(6) = cplcChaFecSvR(gt3,i2,iIN)  
coup(7) = cplcFeFeAhL(i2,gt2,gt1) 
coup(8) = cplcFeFeAhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Ah Fe cCha Propagator: Fe,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe,Fe'
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
    Do gt1=3,6
      Do gt2=1,3
        Do gt3=1,2
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:121))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvToAhFecCha 
 
 
Subroutine SvToSvChiChi(iIN,MSv,MChi,MVZ,MVZp,MAh,Mhh,MFv,cplAhSvcSv,cplhhSvcSv,      & 
& cplSvcSvVZ,cplSvcSvVZp,cplcFvChiSvL,cplcFvChiSvR,cplChiChiAhL,cplChiChiAhR,            & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFvcSvL,cplChiFvcSvR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSv(6),MChi(9),MVZ,MVZp,MAh(6),Mhh(6),MFv(3)

Complex(dp),Intent(in) :: cplAhSvcSv(6,6,6),cplhhSvcSv(6,6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),cplcFvChiSvL(3,9,6),& 
& cplcFvChiSvR(3,9,6),cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),cplChiChihhL(9,9,6),       & 
& cplChiChihhR(9,9,6),cplChiChiVZL(9,9),cplChiChiVZR(9,9),cplChiChiVZpL(9,9),            & 
& cplChiChiVZpR(9,9),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 289 
Allocate( gSum(6,9,9, Isum) ) 
Allocate( Contribution(6,9,9, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,9
        Do gt3=gt2,9
Isum = 0 
 
rk2 = (MChi(gt2)/MSv(iIN))**2 
rm2 = (MChi(gt3)/MSv(iIN))**2 
rj2 = (MSv(gt1)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MChi(gt3))+Abs(MChi(gt2))+Abs(MSv(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MSv(iIN) 
coup(1) = Conjg(cplSvcSvVZ(gt1,iIN)) 
coup(3) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(2) = Conjg(cplChiChiVZR(gt2,gt3))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Chi Chi Propagator: VZ" 
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
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZp 
mass(2) = MVZp 
m_in = MSv(iIN) 
coup(1) = Conjg(cplSvcSvVZp(gt1,iIN)) 
coup(3) = Conjg(cplChiChiVZpL(gt2,gt3)) 
coup(2) = Conjg(cplChiChiVZpR(gt2,gt3))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Chi Chi Propagator: VZp" 
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
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MSv(iIN) 
coup(1) = Conjg(cplAhSvcSv(i1,gt1,iIN)) 
coup(3) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiChiAhR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MAh(i1)  
mass(2) = MAh(i1)  
coup(1) = cplAhSvcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplChiChiAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplChiChiAhR(gt3,gt2,i1))  
coup(4) = cplAhSvcSv(i1,gt1,iIN) 
coup(6) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(5) = Conjg(cplChiChiAhR(gt2,gt3,i1))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Chi Chi Propagator: Ah" 
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
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = MSv(iIN) 
coup(1) = Conjg(cplhhSvcSv(i1,gt1,iIN)) 
coup(3) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiChihhR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = Mhh(i1)  
mass(2) = Mhh(i1)  
coup(1) = cplhhSvcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplChiChihhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplChiChihhR(gt3,gt2,i1))  
coup(4) = cplhhSvcSv(i1,gt1,iIN) 
coup(6) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup(5) = Conjg(cplChiChihhR(gt2,gt3,i1))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Chi Chi Propagator: hh" 
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
!  Fv 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplChiFvcSvL(gt2,i1,iIN)) 
coup(1) = Conjg(cplChiFvcSvR(gt2,i1,iIN)) 
coup(4) = Conjg(cplcFvChiSvL(i1,gt3,gt1)) 
coup(3) = Conjg(cplcFvChiSvR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplChiFvcSvL(gt3,i1,iIN)) 
coup(1) = Conjg(cplChiFvcSvR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcFvChiSvL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFvChiSvR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MFv(i1)  
mass(2) = MFv(i1)  
coup(1) = cplChiFvcSvL(gt3,i1,iIN) 
coup(2) = cplChiFvcSvR(gt3,i1,iIN) 
coup(3) = cplcFvChiSvL(i1,gt2,gt1) 
coup(4) = cplcFvChiSvR(i1,gt2,gt1) 
coup(5) = cplChiFvcSvL(gt2,i1,iIN) 
coup(6) = cplChiFvcSvR(gt2,i1,iIN)  
coup(7) = cplcFvChiSvL(i1,gt3,gt1) 
coup(8) = cplcFvChiSvR(i1,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Chi Chi Propagator: Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MVZ  
mass(2) = MVZp  
coup(1) = cplSvcSvVZ(gt1,iIN) 
coup(3) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(2) = Conjg(cplChiChiVZR(gt2,gt3))  
coup(4) = cplSvcSvVZp(gt1,iIN) 
coup(5) = Conjg(cplChiChiVZpL(gt2,gt3)) 
coup(6) = Conjg(cplChiChiVZpR(gt2,gt3)) 
Call IntegrateVaVb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Chi Chi Propagator: VZ,VZp" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplSvcSvVZ(gt1,iIN) 
coup(2) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(3) = Conjg(cplChiChiVZR(gt2,gt3))  
coup(4) = cplAhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup(6) = Conjg(cplChiChiAhR(gt2,gt3,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Chi Chi Propagator: VZ,Ah" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = Mhh(i2)  
coup(1) = cplSvcSvVZ(gt1,iIN) 
coup(2) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(3) = Conjg(cplChiChiVZR(gt2,gt3))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup(6) = Conjg(cplChiChihhR(gt2,gt3,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Chi Chi Propagator: VZ,hh" 
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
!  VZ, Fv 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MFv2(i2)  
coup(1) = cplChiFvcSvL(gt2,i2,iIN) 
coup(2) = cplChiFvcSvR(gt2,i2,iIN) 
coup(4) = Conjg(cplcFvChiSvL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcFvChiSvR(i2,gt3,gt1))  
coup(5) = cplSvcSvVZ(gt1,iIN) 
coup(7) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(6) = Conjg(cplChiChiVZR(gt2,gt3))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MVZ2  
mass(1) = MFv2(i2)  
coup(1) = cplChiFvcSvL(gt3,i2,iIN) 
coup(2) = cplChiFvcSvR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFvChiSvL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFvChiSvR(i2,gt2,gt1))  
coup(5) = cplSvcSvVZ(gt1,iIN) 
coup(7) = Conjg(cplChiChiVZL(gt2,gt3)) 
coup(6) = Conjg(cplChiChiVZR(gt2,gt3))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Chi Chi Propagator: VZ,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Fv'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = MAh(i2)  
coup(1) = cplSvcSvVZp(gt1,iIN) 
coup(2) = Conjg(cplChiChiVZpL(gt2,gt3)) 
coup(3) = Conjg(cplChiChiVZpR(gt2,gt3))  
coup(4) = cplAhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup(6) = Conjg(cplChiChiAhR(gt2,gt3,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Chi Chi Propagator: VZp,Ah" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = Mhh(i2)  
coup(1) = cplSvcSvVZp(gt1,iIN) 
coup(2) = Conjg(cplChiChiVZpL(gt2,gt3)) 
coup(3) = Conjg(cplChiChiVZpR(gt2,gt3))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup(6) = Conjg(cplChiChihhR(gt2,gt3,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Chi Chi Propagator: VZp,hh" 
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
!  VZp, Fv 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp2  
mass(1) = MFv2(i2)  
coup(1) = cplChiFvcSvL(gt2,i2,iIN) 
coup(2) = cplChiFvcSvR(gt2,i2,iIN) 
coup(4) = Conjg(cplcFvChiSvL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcFvChiSvR(i2,gt3,gt1))  
coup(5) = cplSvcSvVZp(gt1,iIN) 
coup(7) = Conjg(cplChiChiVZpL(gt2,gt3)) 
coup(6) = Conjg(cplChiChiVZpR(gt2,gt3))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MVZp2  
mass(1) = MFv2(i2)  
coup(1) = cplChiFvcSvL(gt3,i2,iIN) 
coup(2) = cplChiFvcSvR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFvChiSvL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFvChiSvR(i2,gt2,gt1))  
coup(5) = cplSvcSvVZp(gt1,iIN) 
coup(7) = Conjg(cplChiChiVZpL(gt2,gt3)) 
coup(6) = Conjg(cplChiChiVZpR(gt2,gt3))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Chi Chi Propagator: VZp,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Fv'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhSvcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiChiAhR(gt2,gt3,i1))  
coup(4) = cplAhSvcSv(i2,gt1,iIN) 
coup(6) = Conjg(cplChiChiAhL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiChiAhR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Chi Chi Propagator: Ah,Ah" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplAhSvcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiChiAhR(gt2,gt3,i1))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(6) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiChihhR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Chi Chi Propagator: Ah,hh" 
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
!  Ah, Fv 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MFv(i2)  
coup(1) = cplChiFvcSvL(gt2,i2,iIN) 
coup(2) = cplChiFvcSvR(gt2,i2,iIN) 
coup(4) = Conjg(cplcFvChiSvL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcFvChiSvR(i2,gt3,gt1))  
coup(5) = cplAhSvcSv(i1,gt1,iIN) 
coup(7) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiChiAhR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MAh(i1)  
mass(1) = MFv(i2)  
coup(1) = cplChiFvcSvL(gt3,i2,iIN) 
coup(2) = cplChiFvcSvR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFvChiSvL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFvChiSvR(i2,gt2,gt1))  
coup(5) = cplAhSvcSv(i1,gt1,iIN) 
coup(7) = Conjg(cplChiChiAhL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiChiAhR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Chi Chi Propagator: Ah,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Fv'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhSvcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiChihhR(gt2,gt3,i1))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(6) = Conjg(cplChiChihhL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiChihhR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Chi Chi Propagator: hh,hh" 
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



!-------------- 
!  hh, Fv 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MFv(i2)  
coup(1) = cplChiFvcSvL(gt2,i2,iIN) 
coup(2) = cplChiFvcSvR(gt2,i2,iIN) 
coup(4) = Conjg(cplcFvChiSvL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcFvChiSvR(i2,gt3,gt1))  
coup(5) = cplhhSvcSv(i1,gt1,iIN) 
coup(7) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiChihhR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = Mhh(i1)  
mass(1) = MFv(i2)  
coup(1) = cplChiFvcSvL(gt3,i2,iIN) 
coup(2) = cplChiFvcSvR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFvChiSvL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFvChiSvR(i2,gt2,gt1))  
coup(5) = cplhhSvcSv(i1,gt1,iIN) 
coup(7) = Conjg(cplChiChihhL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiChihhR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Chi Chi Propagator: hh,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,Fv'
        End Do 
      End Do 



!-------------- 
!  Fv, Fv 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplChiFvcSvL(gt2,i1,iIN) 
coup(2) = cplChiFvcSvR(gt2,i1,iIN) 
coup(3) = cplcFvChiSvL(i1,gt3,gt1) 
coup(4) = cplcFvChiSvR(i1,gt3,gt1) 
coup(5) = cplChiFvcSvL(gt2,i2,iIN) 
coup(6) = cplChiFvcSvR(gt2,i2,iIN)  
coup(7) = cplcFvChiSvL(i2,gt3,gt1) 
coup(8) = cplcFvChiSvR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplChiFvcSvL(gt3,i1,iIN) 
coup(2) = cplChiFvcSvR(gt3,i1,iIN) 
coup(3) = cplcFvChiSvL(i1,gt2,gt1) 
coup(4) = cplcFvChiSvR(i1,gt2,gt1) 
coup(5) = cplChiFvcSvL(gt2,i2,iIN) 
coup(6) = cplChiFvcSvR(gt2,i2,iIN)  
coup(7) = cplcFvChiSvL(i2,gt3,gt1) 
coup(8) = cplcFvChiSvR(i2,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplChiFvcSvL(gt3,i1,iIN) 
coup(2) = cplChiFvcSvR(gt3,i1,iIN) 
coup(3) = cplcFvChiSvL(i1,gt2,gt1) 
coup(4) = cplcFvChiSvR(i1,gt2,gt1) 
coup(5) = cplChiFvcSvL(gt3,i2,iIN) 
coup(6) = cplChiFvcSvR(gt3,i2,iIN)  
coup(7) = cplcFvChiSvL(i2,gt2,gt1) 
coup(8) = cplcFvChiSvR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplChiFvcSvL(gt2,i1,iIN) 
coup(2) = cplChiFvcSvR(gt2,i1,iIN) 
coup(3) = cplcFvChiSvL(i1,gt3,gt1) 
coup(4) = cplcFvChiSvR(i1,gt3,gt1) 
coup(5) = cplChiFvcSvL(gt3,i2,iIN) 
coup(6) = cplChiFvcSvR(gt3,i2,iIN)  
coup(7) = cplcFvChiSvL(i2,gt2,gt1) 
coup(8) = cplcFvChiSvR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Chi Chi Propagator: Fv,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv,Fv'
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
End Subroutine SvToSvChiChi 
 
 
Subroutine SvTocHpmChiFe(iIN,MHpm,MChi,MFe,MSe,MFv,MCha,MSv,cplSecHpmcSv,             & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplChiChacHpmL,cplChiChacHpmR, & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,deltaM,epsI,check,g,               & 
& WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MHpm(2),MChi(9),MFe(3),MSe(6),MFv(3),MCha(2),MSv(6)

Complex(dp),Intent(in) :: cplSecHpmcSv(6,2,6),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFvFecHpmL(3,3,2),   & 
& cplcFvFecHpmR(3,3,2),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChiFecSeL(9,3,6),  & 
& cplChiFecSeR(9,3,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 121 
Allocate( gSum(2,9,3, Isum) ) 
Allocate( Contribution(2,9,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2,2
      Do gt2=1,9
        Do gt3=1,3
Isum = 0 
 
rk2 = (MChi(gt2)/MSv(iIN))**2 
rm2 = (MFe(gt3)/MSv(iIN))**2 
rj2 = (MHpm(gt1)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MFe(gt3))+Abs(MChi(gt2))+Abs(MHpm(gt1)))) Then 
!-------------- 
!  Se 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSe(i1) 
mass(2) = MSe(i1) 
m_in = MSv(iIN) 
coup(1) = Conjg(cplSecHpmcSv(i1,gt1,iIN)) 
coup(3) = Conjg(cplChiFecSeL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFecSeR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->cHpm Chi Fe Propagator: Se" 
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
!  Fv 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplChiFvcSvL(gt2,i1,iIN)) 
coup(1) = Conjg(cplChiFvcSvR(gt2,i1,iIN)) 
coup(4) = Conjg(cplcFvFecHpmL(i1,gt3,gt1)) 
coup(3) = Conjg(cplcFvFecHpmR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->cHpm Chi Fe Propagator: Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv'
      End Do 



!-------------- 
!  bar[Cha] 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplcChaFecSvL(i1,gt3,iIN)) 
coup(1) = Conjg(cplcChaFecSvR(i1,gt3,iIN)) 
coup(4) = Conjg(cplChiChacHpmL(gt2,i1,gt1)) 
coup(3) = Conjg(cplChiChacHpmR(gt2,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->cHpm Chi Fe Propagator: bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha]'
      End Do 



!-------------- 
!  Se, Se 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSe(i1)  
mass(2) = MSe(i2)  
coup(1) = cplSecHpmcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplChiFecSeL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFecSeR(gt2,gt3,i1))  
coup(4) = cplSecHpmcSv(i2,gt1,iIN) 
coup(6) = Conjg(cplChiFecSeL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiFecSeR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->cHpm Chi Fe Propagator: Se,Se" 
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
!  Se, Fv 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSe(i1)  
mass(1) = MFv(i2)  
coup(1) = cplChiFvcSvL(gt2,i2,iIN) 
coup(2) = cplChiFvcSvR(gt2,i2,iIN) 
coup(4) = Conjg(cplcFvFecHpmL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcFvFecHpmR(i2,gt3,gt1))  
coup(5) = cplSecHpmcSv(i1,gt1,iIN) 
coup(7) = Conjg(cplChiFecSeL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFecSeR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->cHpm Chi Fe Propagator: Se,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,Fv'
        End Do 
      End Do 



!-------------- 
!  Se, bar[Cha] 
!-------------- 
Do i1=1,6
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSe(i1)  
mass(1) = MCha(i2)  
coup(1) = cplcChaFecSvL(i2,gt3,iIN) 
coup(2) = cplcChaFecSvR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiChacHpmL(gt2,i2,gt1)) 
coup(3) = Conjg(cplChiChacHpmR(gt2,i2,gt1))  
coup(5) = cplSecHpmcSv(i1,gt1,iIN) 
coup(7) = Conjg(cplChiFecSeL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFecSeR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->cHpm Chi Fe Propagator: Se,bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  Fv, Fv 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplChiFvcSvL(gt2,i1,iIN) 
coup(2) = cplChiFvcSvR(gt2,i1,iIN) 
coup(3) = cplcFvFecHpmL(i1,gt3,gt1) 
coup(4) = cplcFvFecHpmR(i1,gt3,gt1) 
coup(5) = cplChiFvcSvL(gt2,i2,iIN) 
coup(6) = cplChiFvcSvR(gt2,i2,iIN)  
coup(7) = cplcFvFecHpmL(i2,gt3,gt1) 
coup(8) = cplcFvFecHpmR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->cHpm Chi Fe Propagator: Fv,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv,Fv'
        End Do 
      End Do 



!-------------- 
!  Fv, bar[Cha] 
!-------------- 
Do i1=1,3
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MCha(i2)  
coup(1) = cplChiFvcSvL(gt2,i1,iIN) 
coup(2) = cplChiFvcSvR(gt2,i1,iIN) 
coup(3) = cplcFvFecHpmL(i1,gt3,gt1) 
coup(4) = cplcFvFecHpmR(i1,gt3,gt1) 
coup(5) = cplcChaFecSvL(i2,gt3,iIN) 
coup(6) = cplcChaFecSvR(i2,gt3,iIN)  
coup(7) = cplChiChacHpmL(gt2,i2,gt1) 
coup(8) = cplChiChacHpmR(gt2,i2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->cHpm Chi Fe Propagator: Fv,bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv,bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  bar[Cha], bar[Cha] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplcChaFecSvL(i1,gt3,iIN) 
coup(2) = cplcChaFecSvR(i1,gt3,iIN) 
coup(3) = cplChiChacHpmL(gt2,i1,gt1) 
coup(4) = cplChiChacHpmR(gt2,i1,gt1) 
coup(5) = cplcChaFecSvL(i2,gt3,iIN) 
coup(6) = cplcChaFecSvR(i2,gt3,iIN)  
coup(7) = cplChiChacHpmL(gt2,i2,gt1) 
coup(8) = cplChiChacHpmR(gt2,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->cHpm Chi Fe Propagator: bar[Cha],bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],bar[Cha]'
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
    Do gt1=2,2
      Do gt2=1,9
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:121))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvTocHpmChiFe 
 
 
Subroutine SvTohhChiFv(iIN,Mhh,MChi,MFv,MSv,cplhhSvcSv,cplcFvFvhhL,cplcFvFvhhR,       & 
& cplChiChihhL,cplChiChihhR,cplChiFvcSvL,cplChiFvcSvR,deltaM,epsI,check,g,               & 
& WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: Mhh(6),MChi(9),MFv(3),MSv(6)

Complex(dp),Intent(in) :: cplhhSvcSv(6,6,6),cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),cplChiChihhL(9,9,6),          & 
& cplChiChihhR(9,9,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 324 
Allocate( gSum(6,9,3, Isum) ) 
Allocate( Contribution(6,9,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,9
        Do gt3=1,3
Isum = 0 
 
rk2 = (MChi(gt2)/MSv(iIN))**2 
rm2 = (MFv(gt3)/MSv(iIN))**2 
rj2 = (Mhh(gt1)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MFv(gt3))+Abs(MChi(gt2))+Abs(Mhh(gt1)))) Then 
!-------------- 
!  Sv 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSv(i1) 
mass(2) = MSv(i1) 
m_in = MSv(iIN) 
coup(1) = Conjg(cplhhSvcSv(gt1,i1,iIN)) 
coup(3) = Conjg(cplChiFvcSvL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFvcSvR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->hh Chi Fv Propagator: Sv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Sv'
      End Do 



!-------------- 
!  Fv 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplChiFvcSvL(gt2,i1,iIN)) 
coup(1) = Conjg(cplChiFvcSvR(gt2,i1,iIN)) 
coup(4) = Conjg(cplcFvFvhhL(i1,gt3,gt1)) 
coup(3) = Conjg(cplcFvFvhhR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->hh Chi Fv Propagator: Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplChiFvcSvL(i1,gt3,iIN)) 
coup(1) = Conjg(cplChiFvcSvR(i1,gt3,iIN)) 
coup(4) = Conjg(cplChiChihhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplChiChihhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->hh Chi Fv Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Sv, Sv 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSv(i1)  
mass(2) = MSv(i2)  
coup(1) = cplhhSvcSv(gt1,i1,iIN) 
coup(3) = Conjg(cplChiFvcSvL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChiFvcSvR(gt2,gt3,i1))  
coup(4) = cplhhSvcSv(gt1,i2,iIN) 
coup(6) = Conjg(cplChiFvcSvL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChiFvcSvR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->hh Chi Fv Propagator: Sv,Sv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sv,Sv'
        End Do 
      End Do 



!-------------- 
!  Sv, Fv 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSv(i1)  
mass(1) = MFv(i2)  
coup(1) = cplChiFvcSvL(gt2,i2,iIN) 
coup(2) = cplChiFvcSvR(gt2,i2,iIN) 
coup(4) = Conjg(cplcFvFvhhL(i2,gt3,gt1)) 
coup(3) = Conjg(cplcFvFvhhR(i2,gt3,gt1))  
coup(5) = cplhhSvcSv(gt1,i1,iIN) 
coup(7) = Conjg(cplChiFvcSvL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFvcSvR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->hh Chi Fv Propagator: Sv,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sv,Fv'
        End Do 
      End Do 



!-------------- 
!  Sv, Chi 
!-------------- 
Do i1=1,6
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSv(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiFvcSvL(i2,gt3,iIN) 
coup(2) = cplChiFvcSvR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiChihhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplChiChihhR(i2,gt2,gt1))  
coup(5) = cplhhSvcSv(gt1,i1,iIN) 
coup(7) = Conjg(cplChiFvcSvL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChiFvcSvR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->hh Chi Fv Propagator: Sv,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sv,Chi'
        End Do 
      End Do 



!-------------- 
!  Fv, Fv 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplChiFvcSvL(gt2,i1,iIN) 
coup(2) = cplChiFvcSvR(gt2,i1,iIN) 
coup(3) = cplcFvFvhhL(i1,gt3,gt1) 
coup(4) = cplcFvFvhhR(i1,gt3,gt1) 
coup(5) = cplChiFvcSvL(gt2,i2,iIN) 
coup(6) = cplChiFvcSvR(gt2,i2,iIN)  
coup(7) = cplcFvFvhhL(i2,gt3,gt1) 
coup(8) = cplcFvFvhhR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->hh Chi Fv Propagator: Fv,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv,Fv'
        End Do 
      End Do 



!-------------- 
!  Fv, Chi 
!-------------- 
Do i1=1,3
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFvcSvL(gt2,i1,iIN) 
coup(2) = cplChiFvcSvR(gt2,i1,iIN) 
coup(3) = cplcFvFvhhL(i1,gt3,gt1) 
coup(4) = cplcFvFvhhR(i1,gt3,gt1) 
coup(5) = cplChiFvcSvL(i2,gt3,iIN) 
coup(6) = cplChiFvcSvR(i2,gt3,iIN)  
coup(7) = cplChiChihhL(i2,gt2,gt1) 
coup(8) = cplChiChihhR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->hh Chi Fv Propagator: Fv,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFvcSvL(i1,gt3,iIN) 
coup(2) = cplChiFvcSvR(i1,gt3,iIN) 
coup(3) = cplChiChihhL(i1,gt2,gt1) 
coup(4) = cplChiChihhR(i1,gt2,gt1) 
coup(5) = cplChiFvcSvL(i2,gt3,iIN) 
coup(6) = cplChiFvcSvR(i2,gt3,iIN)  
coup(7) = cplChiChihhL(i2,gt2,gt1) 
coup(8) = cplChiChihhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->hh Chi Fv Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
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
    Do gt1=1,6
      Do gt2=1,9
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:324))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvTohhChiFv 
 
 
Subroutine SvToSeChicCha(iIN,MSe,MChi,MCha,MVWm,MHpm,MFv,MFe,MSv,cplSecHpmcSv,        & 
& cplSecSvcVWm,cplcChacFvSeL,cplcChacFvSeR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,cplcFeChiSeL,cplcFeChiSeR,cplChiFvcSvL,     & 
& cplChiFvcSvR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSe(6),MChi(9),MCha(2),MVWm,MHpm(2),MFv(3),MFe(3),MSv(6)

Complex(dp),Intent(in) :: cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),      & 
& cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9),   & 
& cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFeChiSeL(3,9,6),cplcFeChiSeR(3,9,6),     & 
& cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 81 
Allocate( gSum(6,9,2, Isum) ) 
Allocate( Contribution(6,9,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,9
        Do gt3=1,2
Isum = 0 
 
rk2 = (MChi(gt2)/MSv(iIN))**2 
rm2 = (MCha(gt3)/MSv(iIN))**2 
rj2 = (MSe(gt1)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MCha(gt3))+Abs(MChi(gt2))+Abs(MSe(gt1)))) Then 
!-------------- 
!  conj[VWm] 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVWm 
mass(2) = MVWm 
m_in = MSv(iIN) 
coup(1) = Conjg(cplSecSvcVWm(gt1,iIN)) 
coup(3) = Conjg(cplcChaChiVWmL(gt3,gt2)) 
coup(2) = Conjg(cplcChaChiVWmR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Chi cCha Propagator: conj[VWm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWm]'



!-------------- 
!  conj[Hpm] 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MHpm(i1) 
mass(2) = MHpm(i1) 
m_in = MSv(iIN) 
coup(1) = Conjg(cplSecHpmcSv(gt1,i1,iIN)) 
coup(3) = Conjg(cplcChaChiHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChiHpmR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Chi cCha Propagator: conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm]'
      End Do 



!-------------- 
!  Fv 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplChiFvcSvL(gt2,i1,iIN)) 
coup(1) = Conjg(cplChiFvcSvR(gt2,i1,iIN)) 
coup(4) = Conjg(cplcChacFvSeL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcChacFvSeR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Chi cCha Propagator: Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv'
      End Do 



!-------------- 
!  Fe 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplcChaFecSvL(gt3,i1,iIN)) 
coup(1) = Conjg(cplcChaFecSvR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcFeChiSeL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFeChiSeR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Chi cCha Propagator: Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe'
      End Do 



!-------------- 
!  conj[VWm], conj[Hpm] 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm  
mass(1) = MHpm(i2)  
coup(1) = cplSecSvcVWm(gt1,iIN) 
coup(2) = Conjg(cplcChaChiVWmL(gt3,gt2)) 
coup(3) = Conjg(cplcChaChiVWmR(gt3,gt2))  
coup(4) = cplSecHpmcSv(gt1,i2,iIN) 
coup(5) = Conjg(cplcChaChiHpmL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcChaChiHpmR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Chi cCha Propagator: conj[VWm],conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWm],conj[Hpm]'
      End Do 



!-------------- 
!  conj[VWm], Fv 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MFv2(i2)  
coup(1) = cplChiFvcSvL(gt2,i2,iIN) 
coup(2) = cplChiFvcSvR(gt2,i2,iIN) 
coup(4) = Conjg(cplcChacFvSeL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcChacFvSeR(gt3,i2,gt1))  
coup(5) = cplSecSvcVWm(gt1,iIN) 
coup(7) = Conjg(cplcChaChiVWmL(gt3,gt2)) 
coup(6) = Conjg(cplcChaChiVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Chi cCha Propagator: conj[VWm],Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWm],Fv'
      End Do 



!-------------- 
!  conj[VWm], Fe 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MFe2(i2)  
coup(1) = cplcChaFecSvL(gt3,i2,iIN) 
coup(2) = cplcChaFecSvR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeChiSeL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeChiSeR(i2,gt2,gt1))  
coup(5) = cplSecSvcVWm(gt1,iIN) 
coup(7) = Conjg(cplcChaChiVWmL(gt3,gt2)) 
coup(6) = Conjg(cplcChaChiVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Chi cCha Propagator: conj[VWm],Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWm],Fe'
      End Do 



!-------------- 
!  conj[Hpm], conj[Hpm] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MHpm(i1)  
mass(2) = MHpm(i2)  
coup(1) = cplSecHpmcSv(gt1,i1,iIN) 
coup(3) = Conjg(cplcChaChiHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChiHpmR(gt3,gt2,i1))  
coup(4) = cplSecHpmcSv(gt1,i2,iIN) 
coup(6) = Conjg(cplcChaChiHpmL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaChiHpmR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Chi cCha Propagator: conj[Hpm],conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm],conj[Hpm]'
        End Do 
      End Do 



!-------------- 
!  conj[Hpm], Fv 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MFv(i2)  
coup(1) = cplChiFvcSvL(gt2,i2,iIN) 
coup(2) = cplChiFvcSvR(gt2,i2,iIN) 
coup(4) = Conjg(cplcChacFvSeL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcChacFvSeR(gt3,i2,gt1))  
coup(5) = cplSecHpmcSv(gt1,i1,iIN) 
coup(7) = Conjg(cplcChaChiHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcChaChiHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Chi cCha Propagator: conj[Hpm],Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm],Fv'
        End Do 
      End Do 



!-------------- 
!  conj[Hpm], Fe 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MFe(i2)  
coup(1) = cplcChaFecSvL(gt3,i2,iIN) 
coup(2) = cplcChaFecSvR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeChiSeL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeChiSeR(i2,gt2,gt1))  
coup(5) = cplSecHpmcSv(gt1,i1,iIN) 
coup(7) = Conjg(cplcChaChiHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcChaChiHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Chi cCha Propagator: conj[Hpm],Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm],Fe'
        End Do 
      End Do 



!-------------- 
!  Fv, Fv 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplChiFvcSvL(gt2,i1,iIN) 
coup(2) = cplChiFvcSvR(gt2,i1,iIN) 
coup(3) = cplcChacFvSeL(gt3,i1,gt1) 
coup(4) = cplcChacFvSeR(gt3,i1,gt1) 
coup(5) = cplChiFvcSvL(gt2,i2,iIN) 
coup(6) = cplChiFvcSvR(gt2,i2,iIN)  
coup(7) = cplcChacFvSeL(gt3,i2,gt1) 
coup(8) = cplcChacFvSeR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Chi cCha Propagator: Fv,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv,Fv'
        End Do 
      End Do 



!-------------- 
!  Fv, Fe 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFe(i2)  
coup(1) = cplChiFvcSvL(gt2,i1,iIN) 
coup(2) = cplChiFvcSvR(gt2,i1,iIN) 
coup(3) = cplcChacFvSeL(gt3,i1,gt1) 
coup(4) = cplcChacFvSeR(gt3,i1,gt1) 
coup(5) = cplcChaFecSvL(gt3,i2,iIN) 
coup(6) = cplcChaFecSvR(gt3,i2,iIN)  
coup(7) = cplcFeChiSeL(i2,gt2,gt1) 
coup(8) = cplcFeChiSeR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Chi cCha Propagator: Fv,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv,Fe'
        End Do 
      End Do 



!-------------- 
!  Fe, Fe 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcChaFecSvL(gt3,i1,iIN) 
coup(2) = cplcChaFecSvR(gt3,i1,iIN) 
coup(3) = cplcFeChiSeL(i1,gt2,gt1) 
coup(4) = cplcFeChiSeR(i1,gt2,gt1) 
coup(5) = cplcChaFecSvL(gt3,i2,iIN) 
coup(6) = cplcChaFecSvR(gt3,i2,iIN)  
coup(7) = cplcFeChiSeL(i2,gt2,gt1) 
coup(8) = cplcFeChiSeR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Chi cCha Propagator: Fe,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe,Fe'
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
    Do gt1=1,6
      Do gt2=1,9
        Do gt3=1,2
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:81))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvToSeChicCha 
 
 
Subroutine SvToFeFucSd(iIN,MFe,MFu,MSd,MCha,MSv,cplcChaFecSvL,cplcChaFecSvR,          & 
& cplChaFucSdL,cplChaFucSdR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MFu(3),MSd(6),MCha(2),MSv(6)

Complex(dp),Intent(in) :: cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 4 
Allocate( gSum(3,3,6, Isum) ) 
Allocate( Contribution(3,3,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,6
Isum = 0 
 
rk2 = (MFe(gt1)/MSv(iIN))**2 
rm2 = (MFu(gt2)/MSv(iIN))**2 
rj2 = (MSd(gt3)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MSd(gt3))+Abs(MFu(gt2))+Abs(MFe(gt1)))) Then 
!-------------- 
!  bar[Cha] 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplcChaFecSvL(i1,gt1,iIN)) 
coup(1) = Conjg(cplcChaFecSvR(i1,gt1,iIN)) 
coup(4) = Conjg(cplChaFucSdL(i1,gt2,gt3)) 
coup(3) = Conjg(cplChaFucSdR(i1,gt2,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Fe Fu cSd Propagator: bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha]'
      End Do 



!-------------- 
!  bar[Cha], bar[Cha] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplcChaFecSvL(i1,gt1,iIN) 
coup(2) = cplcChaFecSvR(i1,gt1,iIN) 
coup(3) = cplChaFucSdL(i1,gt2,gt3) 
coup(4) = cplChaFucSdR(i1,gt2,gt3) 
coup(5) = cplcChaFecSvL(i2,gt1,iIN) 
coup(6) = cplcChaFecSvR(i2,gt1,iIN)  
coup(7) = cplChaFucSdL(i2,gt2,gt3) 
coup(8) = cplChaFucSdR(i2,gt2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Fe Fu cSd Propagator: bar[Cha],bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],bar[Cha]'
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
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvToFeFucSd 
 
 
Subroutine SvToFeFvcSe(iIN,MFe,MFv,MSe,MCha,MChi,MSv,cplcChaFecSvL,cplcChaFecSvR,     & 
& cplChaFvcSeL,cplChaFvcSeR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,         & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MFv(3),MSe(6),MCha(2),MChi(9),MSv(6)

Complex(dp),Intent(in) :: cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),    & 
& cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 121 
Allocate( gSum(3,3,6, Isum) ) 
Allocate( Contribution(3,3,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,6
Isum = 0 
 
rk2 = (MFe(gt1)/MSv(iIN))**2 
rm2 = (MFv(gt2)/MSv(iIN))**2 
rj2 = (MSe(gt3)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MSe(gt3))+Abs(MFv(gt2))+Abs(MFe(gt1)))) Then 
!-------------- 
!  bar[Cha] 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplcChaFecSvL(i1,gt1,iIN)) 
coup(1) = Conjg(cplcChaFecSvR(i1,gt1,iIN)) 
coup(4) = Conjg(cplChaFvcSeL(i1,gt2,gt3)) 
coup(3) = Conjg(cplChaFvcSeR(i1,gt2,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Fe Fv cSe Propagator: bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha]'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplChiFvcSvL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiFvcSvR(i1,gt2,iIN)) 
coup(4) = Conjg(cplChiFecSeL(i1,gt1,gt3)) 
coup(3) = Conjg(cplChiFecSeR(i1,gt1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Fe Fv cSe Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  bar[Cha], bar[Cha] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplcChaFecSvL(i1,gt1,iIN) 
coup(2) = cplcChaFecSvR(i1,gt1,iIN) 
coup(3) = cplChaFvcSeL(i1,gt2,gt3) 
coup(4) = cplChaFvcSeR(i1,gt2,gt3) 
coup(5) = cplcChaFecSvL(i2,gt1,iIN) 
coup(6) = cplcChaFecSvR(i2,gt1,iIN)  
coup(7) = cplChaFvcSeL(i2,gt2,gt3) 
coup(8) = cplChaFvcSeR(i2,gt2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Fe Fv cSe Propagator: bar[Cha],bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  bar[Cha], Chi 
!-------------- 
Do i1=1,2
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MChi(i2)  
coup(1) = cplcChaFecSvL(i1,gt1,iIN) 
coup(2) = cplcChaFecSvR(i1,gt1,iIN) 
coup(3) = cplChaFvcSeL(i1,gt2,gt3) 
coup(4) = cplChaFvcSeR(i1,gt2,gt3) 
coup(5) = cplChiFvcSvL(i2,gt2,iIN) 
coup(6) = cplChiFvcSvR(i2,gt2,iIN)  
coup(7) = cplChiFecSeL(i2,gt1,gt3) 
coup(8) = cplChiFecSeR(i2,gt1,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Fe Fv cSe Propagator: bar[Cha],Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFvcSvL(i1,gt2,iIN) 
coup(2) = cplChiFvcSvR(i1,gt2,iIN) 
coup(3) = cplChiFecSeL(i1,gt1,gt3) 
coup(4) = cplChiFecSeR(i1,gt1,gt3) 
coup(5) = cplChiFvcSvL(i2,gt2,iIN) 
coup(6) = cplChiFvcSvR(i2,gt2,iIN)  
coup(7) = cplChiFecSeL(i2,gt1,gt3) 
coup(8) = cplChiFecSeR(i2,gt1,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Fe Fv cSe Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
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
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:121))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvToFeFvcSe 
 
 
Subroutine SvTohhFecCha(iIN,Mhh,MFe,MCha,MSv,cplhhSvcSv,cplcChaChahhL,cplcChaChahhR,  & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFeFehhL,cplcFeFehhR,deltaM,epsI,check,g,               & 
& WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: Mhh(6),MFe(3),MCha(2),MSv(6)

Complex(dp),Intent(in) :: cplhhSvcSv(6,6,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),cplcChaFecSvL(2,3,6),     & 
& cplcChaFecSvR(2,3,6),cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 121 
Allocate( gSum(6,3,2, Isum) ) 
Allocate( Contribution(6,3,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,3
        Do gt3=1,2
Isum = 0 
 
rk2 = (MFe(gt2)/MSv(iIN))**2 
rm2 = (MCha(gt3)/MSv(iIN))**2 
rj2 = (Mhh(gt1)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MCha(gt3))+Abs(MFe(gt2))+Abs(Mhh(gt1)))) Then 
!-------------- 
!  Sv 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSv(i1) 
mass(2) = MSv(i1) 
m_in = MSv(iIN) 
coup(1) = Conjg(cplhhSvcSv(gt1,i1,iIN)) 
coup(3) = Conjg(cplcChaFecSvL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaFecSvR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->hh Fe cCha Propagator: Sv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Sv'
      End Do 



!-------------- 
!  bar[Cha] 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplcChaFecSvL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcChaFecSvR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcChaChahhL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcChaChahhR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->hh Fe cCha Propagator: bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha]'
      End Do 



!-------------- 
!  Fe 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplcChaFecSvL(gt3,i1,iIN)) 
coup(1) = Conjg(cplcChaFecSvR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcFeFehhL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFeFehhR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->hh Fe cCha Propagator: Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe'
      End Do 



!-------------- 
!  Sv, Sv 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSv(i1)  
mass(2) = MSv(i2)  
coup(1) = cplhhSvcSv(gt1,i1,iIN) 
coup(3) = Conjg(cplcChaFecSvL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaFecSvR(gt3,gt2,i1))  
coup(4) = cplhhSvcSv(gt1,i2,iIN) 
coup(6) = Conjg(cplcChaFecSvL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaFecSvR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->hh Fe cCha Propagator: Sv,Sv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sv,Sv'
        End Do 
      End Do 



!-------------- 
!  Sv, bar[Cha] 
!-------------- 
Do i1=1,6
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSv(i1)  
mass(1) = MCha(i2)  
coup(1) = cplcChaFecSvL(i2,gt2,iIN) 
coup(2) = cplcChaFecSvR(i2,gt2,iIN) 
coup(4) = Conjg(cplcChaChahhL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcChaChahhR(gt3,i2,gt1))  
coup(5) = cplhhSvcSv(gt1,i1,iIN) 
coup(7) = Conjg(cplcChaFecSvL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcChaFecSvR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->hh Fe cCha Propagator: Sv,bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sv,bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  Sv, Fe 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSv(i1)  
mass(1) = MFe(i2)  
coup(1) = cplcChaFecSvL(gt3,i2,iIN) 
coup(2) = cplcChaFecSvR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeFehhL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeFehhR(i2,gt2,gt1))  
coup(5) = cplhhSvcSv(gt1,i1,iIN) 
coup(7) = Conjg(cplcChaFecSvL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcChaFecSvR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->hh Fe cCha Propagator: Sv,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Sv,Fe'
        End Do 
      End Do 



!-------------- 
!  bar[Cha], bar[Cha] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplcChaFecSvL(i1,gt2,iIN) 
coup(2) = cplcChaFecSvR(i1,gt2,iIN) 
coup(3) = cplcChaChahhL(gt3,i1,gt1) 
coup(4) = cplcChaChahhR(gt3,i1,gt1) 
coup(5) = cplcChaFecSvL(i2,gt2,iIN) 
coup(6) = cplcChaFecSvR(i2,gt2,iIN)  
coup(7) = cplcChaChahhL(gt3,i2,gt1) 
coup(8) = cplcChaChahhR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->hh Fe cCha Propagator: bar[Cha],bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  bar[Cha], Fe 
!-------------- 
Do i1=1,2
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcChaFecSvL(i1,gt2,iIN) 
coup(2) = cplcChaFecSvR(i1,gt2,iIN) 
coup(3) = cplcChaChahhL(gt3,i1,gt1) 
coup(4) = cplcChaChahhR(gt3,i1,gt1) 
coup(5) = cplcChaFecSvL(gt3,i2,iIN) 
coup(6) = cplcChaFecSvR(gt3,i2,iIN)  
coup(7) = cplcFeFehhL(i2,gt2,gt1) 
coup(8) = cplcFeFehhR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->hh Fe cCha Propagator: bar[Cha],Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],Fe'
        End Do 
      End Do 



!-------------- 
!  Fe, Fe 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcChaFecSvL(gt3,i1,iIN) 
coup(2) = cplcChaFecSvR(gt3,i1,iIN) 
coup(3) = cplcFeFehhL(i1,gt2,gt1) 
coup(4) = cplcFeFehhR(i1,gt2,gt1) 
coup(5) = cplcChaFecSvL(gt3,i2,iIN) 
coup(6) = cplcChaFecSvR(gt3,i2,iIN)  
coup(7) = cplcFeFehhL(i2,gt2,gt1) 
coup(8) = cplcFeFehhR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->hh Fe cCha Propagator: Fe,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe,Fe'
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
    Do gt1=1,6
      Do gt2=1,3
        Do gt3=1,2
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:121))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvTohhFecCha 
 
 
Subroutine SvToFeSucFd(iIN,MFe,MSu,MFd,MCha,MSv,cplcChaFecSvL,cplcChaFecSvR,          & 
& cplcFdChaSuL,cplcFdChaSuR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MSu(6),MFd(3),MCha(2),MSv(6)

Complex(dp),Intent(in) :: cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 4 
Allocate( gSum(3,6,3, Isum) ) 
Allocate( Contribution(3,6,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,6
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFe(gt1)/MSv(iIN))**2 
rm2 = (MFd(gt3)/MSv(iIN))**2 
rj2 = (MSu(gt2)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MFd(gt3))+Abs(MSu(gt2))+Abs(MFe(gt1)))) Then 
!-------------- 
!  bar[Cha] 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplcChaFecSvL(i1,gt1,iIN)) 
coup(1) = Conjg(cplcChaFecSvR(i1,gt1,iIN)) 
coup(4) = Conjg(cplcFdChaSuL(gt3,i1,gt2)) 
coup(3) = Conjg(cplcFdChaSuR(gt3,i1,gt2))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Fe Su cFd Propagator: bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha]'
      End Do 



!-------------- 
!  bar[Cha], bar[Cha] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplcChaFecSvL(i1,gt1,iIN) 
coup(2) = cplcChaFecSvR(i1,gt1,iIN) 
coup(3) = cplcFdChaSuL(gt3,i1,gt2) 
coup(4) = cplcFdChaSuR(gt3,i1,gt2) 
coup(5) = cplcChaFecSvL(i2,gt1,iIN) 
coup(6) = cplcChaFecSvR(i2,gt1,iIN)  
coup(7) = cplcFdChaSuL(gt3,i2,gt2) 
coup(8) = cplcFdChaSuR(gt3,i2,gt2) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Fe Su cFd Propagator: bar[Cha],bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],bar[Cha]'
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
    Do gt1=1,3
      Do gt2=1,6
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvToFeSucFd 
 
 
Subroutine SvToSvFecFe(iIN,MSv,MFe,MVZ,MVZp,MAh,Mhh,MCha,cplAhSvcSv,cplhhSvcSv,       & 
& cplSvcSvVZ,cplSvcSvVZp,cplcChaFecSvL,cplcChaFecSvR,cplcFeChaSvL,cplcFeChaSvR,          & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSv(6),MFe(3),MVZ,MVZp,MAh(6),Mhh(6),MCha(2)

Complex(dp),Intent(in) :: cplAhSvcSv(6,6,6),cplhhSvcSv(6,6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),cplcChaFecSvL(2,3,6),& 
& cplcChaFecSvR(2,3,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),cplcFeFeAhL(3,3,6),       & 
& cplcFeFeAhR(3,3,6),cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),cplcFeFeVZL(3,3),             & 
& cplcFeFeVZR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 256 
Allocate( gSum(6,3,3, Isum) ) 
Allocate( Contribution(6,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFe(gt2)/MSv(iIN))**2 
rm2 = (MFe(gt3)/MSv(iIN))**2 
rj2 = (MSv(gt1)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(MSv(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MSv(iIN) 
coup(1) = Conjg(cplSvcSvVZ(gt1,iIN)) 
coup(3) = Conjg(cplcFeFeVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFeFeVZR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fe cFe Propagator: VZ" 
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
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZp 
mass(2) = MVZp 
m_in = MSv(iIN) 
coup(1) = Conjg(cplSvcSvVZp(gt1,iIN)) 
coup(3) = Conjg(cplcFeFeVZpL(gt3,gt2)) 
coup(2) = Conjg(cplcFeFeVZpR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fe cFe Propagator: VZp" 
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
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MSv(iIN) 
coup(1) = Conjg(cplAhSvcSv(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFeFeAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFeAhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fe cFe Propagator: Ah" 
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
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = MSv(iIN) 
coup(1) = Conjg(cplhhSvcSv(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFeFehhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFehhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fe cFe Propagator: hh" 
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
!  bar[Cha] 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MCha(i1) 
mass(2) = MCha(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplcChaFecSvL(i1,gt2,iIN)) 
coup(1) = Conjg(cplcChaFecSvR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFeChaSvL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFeChaSvR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fe cFe Propagator: bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha]'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MVZ  
mass(2) = MVZp  
coup(1) = cplSvcSvVZ(gt1,iIN) 
coup(3) = Conjg(cplcFeFeVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFeFeVZR(gt3,gt2))  
coup(4) = cplSvcSvVZp(gt1,iIN) 
coup(5) = Conjg(cplcFeFeVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcFeFeVZpR(gt3,gt2)) 
Call IntegrateVaVb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fe cFe Propagator: VZ,VZp" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplSvcSvVZ(gt1,iIN) 
coup(2) = Conjg(cplcFeFeVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFeFeVZR(gt3,gt2))  
coup(4) = cplAhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFeFeAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fe cFe Propagator: VZ,Ah" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = Mhh(i2)  
coup(1) = cplSvcSvVZ(gt1,iIN) 
coup(2) = Conjg(cplcFeFeVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFeFeVZR(gt3,gt2))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFeFehhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fe cFe Propagator: VZ,hh" 
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
!  VZ, bar[Cha] 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MCha2(i2)  
coup(1) = cplcChaFecSvL(i2,gt2,iIN) 
coup(2) = cplcChaFecSvR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeChaSvL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeChaSvR(gt3,i2,gt1))  
coup(5) = cplSvcSvVZ(gt1,iIN) 
coup(7) = Conjg(cplcFeFeVZL(gt3,gt2)) 
coup(6) = Conjg(cplcFeFeVZR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fe cFe Propagator: VZ,bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,bar[Cha]'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = MAh(i2)  
coup(1) = cplSvcSvVZp(gt1,iIN) 
coup(2) = Conjg(cplcFeFeVZpL(gt3,gt2)) 
coup(3) = Conjg(cplcFeFeVZpR(gt3,gt2))  
coup(4) = cplAhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFeFeAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fe cFe Propagator: VZp,Ah" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = Mhh(i2)  
coup(1) = cplSvcSvVZp(gt1,iIN) 
coup(2) = Conjg(cplcFeFeVZpL(gt3,gt2)) 
coup(3) = Conjg(cplcFeFeVZpR(gt3,gt2))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFeFehhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fe cFe Propagator: VZp,hh" 
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
!  VZp, bar[Cha] 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp2  
mass(1) = MCha2(i2)  
coup(1) = cplcChaFecSvL(i2,gt2,iIN) 
coup(2) = cplcChaFecSvR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeChaSvL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeChaSvR(gt3,i2,gt1))  
coup(5) = cplSvcSvVZp(gt1,iIN) 
coup(7) = Conjg(cplcFeFeVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcFeFeVZpR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fe cFe Propagator: VZp,bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,bar[Cha]'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhSvcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplcFeFeAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFeAhR(gt3,gt2,i1))  
coup(4) = cplAhSvcSv(i2,gt1,iIN) 
coup(6) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeFeAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fe cFe Propagator: Ah,Ah" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplAhSvcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplcFeFeAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFeAhR(gt3,gt2,i1))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(6) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeFehhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fe cFe Propagator: Ah,hh" 
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
!  Ah, bar[Cha] 
!-------------- 
Do i1=1,6
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MCha(i2)  
coup(1) = cplcChaFecSvL(i2,gt2,iIN) 
coup(2) = cplcChaFecSvR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeChaSvL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeChaSvR(gt3,i2,gt1))  
coup(5) = cplAhSvcSv(i1,gt1,iIN) 
coup(7) = Conjg(cplcFeFeAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFeFeAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fe cFe Propagator: Ah,bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhSvcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplcFeFehhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFehhR(gt3,gt2,i1))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(6) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeFehhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fe cFe Propagator: hh,hh" 
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



!-------------- 
!  hh, bar[Cha] 
!-------------- 
Do i1=1,6
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MCha(i2)  
coup(1) = cplcChaFecSvL(i2,gt2,iIN) 
coup(2) = cplcChaFecSvR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeChaSvL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeChaSvR(gt3,i2,gt1))  
coup(5) = cplhhSvcSv(i1,gt1,iIN) 
coup(7) = Conjg(cplcFeFehhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFeFehhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fe cFe Propagator: hh,bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,bar[Cha]'
        End Do 
      End Do 



!-------------- 
!  bar[Cha], bar[Cha] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MCha(i1)  
mass(2) = MCha(i2)  
coup(1) = cplcChaFecSvL(i1,gt2,iIN) 
coup(2) = cplcChaFecSvR(i1,gt2,iIN) 
coup(3) = cplcFeChaSvL(gt3,i1,gt1) 
coup(4) = cplcFeChaSvR(gt3,i1,gt1) 
coup(5) = cplcChaFecSvL(i2,gt2,iIN) 
coup(6) = cplcChaFecSvR(i2,gt2,iIN)  
coup(7) = cplcFeChaSvL(gt3,i2,gt1) 
coup(8) = cplcFeChaSvR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fe cFe Propagator: bar[Cha],bar[Cha]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Cha],bar[Cha]'
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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:256))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvToSvFecFe 
 
 
Subroutine SvTocHpmChaFv(iIN,MHpm,MCha,MFv,MSe,MChi,MSv,cplSecHpmcSv,cplChaFvcSeL,    & 
& cplChaFvcSeR,cplChiChacHpmL,cplChiChacHpmR,cplChiFvcSvL,cplChiFvcSvR,deltaM,           & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MHpm(2),MCha(2),MFv(3),MSe(6),MChi(9),MSv(6)

Complex(dp),Intent(in) :: cplSecHpmcSv(6,2,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplChiChacHpmL(9,2,2),    & 
& cplChiChacHpmR(9,2,2),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 225 
Allocate( gSum(2,2,3, Isum) ) 
Allocate( Contribution(2,2,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=2,2
      Do gt2=1,2
        Do gt3=1,3
Isum = 0 
 
rk2 = (MCha(gt2)/MSv(iIN))**2 
rm2 = (MFv(gt3)/MSv(iIN))**2 
rj2 = (MHpm(gt1)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MFv(gt3))+Abs(MCha(gt2))+Abs(MHpm(gt1)))) Then 
!-------------- 
!  Se 
!-------------- 
Do i1=1,6
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSe(i1) 
mass(2) = MSe(i1) 
m_in = MSv(iIN) 
coup(1) = Conjg(cplSecHpmcSv(i1,gt1,iIN)) 
coup(3) = Conjg(cplChaFvcSeL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChaFvcSeR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->cHpm Cha Fv Propagator: Se" 
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
!  Chi 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplChiFvcSvL(i1,gt3,iIN)) 
coup(1) = Conjg(cplChiFvcSvR(i1,gt3,iIN)) 
coup(4) = Conjg(cplChiChacHpmL(i1,gt2,gt1)) 
coup(3) = Conjg(cplChiChacHpmR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->cHpm Cha Fv Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Se, Se 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSe(i1)  
mass(2) = MSe(i2)  
coup(1) = cplSecHpmcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplChaFvcSeL(gt2,gt3,i1)) 
coup(2) = Conjg(cplChaFvcSeR(gt2,gt3,i1))  
coup(4) = cplSecHpmcSv(i2,gt1,iIN) 
coup(6) = Conjg(cplChaFvcSeL(gt2,gt3,i2)) 
coup(5) = Conjg(cplChaFvcSeR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->cHpm Cha Fv Propagator: Se,Se" 
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
!  Se, Chi 
!-------------- 
Do i1=1,6
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSe(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiFvcSvL(i2,gt3,iIN) 
coup(2) = cplChiFvcSvR(i2,gt3,iIN) 
coup(4) = Conjg(cplChiChacHpmL(i2,gt2,gt1)) 
coup(3) = Conjg(cplChiChacHpmR(i2,gt2,gt1))  
coup(5) = cplSecHpmcSv(i1,gt1,iIN) 
coup(7) = Conjg(cplChaFvcSeL(gt2,gt3,i1)) 
coup(6) = Conjg(cplChaFvcSeR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->cHpm Cha Fv Propagator: Se,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Se,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFvcSvL(i1,gt3,iIN) 
coup(2) = cplChiFvcSvR(i1,gt3,iIN) 
coup(3) = cplChiChacHpmL(i1,gt2,gt1) 
coup(4) = cplChiChacHpmR(i1,gt2,gt1) 
coup(5) = cplChiFvcSvL(i2,gt3,iIN) 
coup(6) = cplChiFvcSvR(i2,gt3,iIN)  
coup(7) = cplChiChacHpmL(i2,gt2,gt1) 
coup(8) = cplChiChacHpmR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->cHpm Cha Fv Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
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
    Do gt1=2,2
      Do gt2=1,2
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:225))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvTocHpmChaFv 
 
 
Subroutine SvToFvFdcSd(iIN,MFv,MFd,MSd,MChi,MSv,cplChiFdcSdL,cplChiFdcSdR,            & 
& cplChiFvcSvL,cplChiFvcSvR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFv(3),MFd(3),MSd(6),MChi(9),MSv(6)

Complex(dp),Intent(in) :: cplChiFdcSdL(9,3,6),cplChiFdcSdR(9,3,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 81 
Allocate( gSum(3,3,6, Isum) ) 
Allocate( Contribution(3,3,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,6
Isum = 0 
 
rk2 = (MFv(gt1)/MSv(iIN))**2 
rm2 = (MFd(gt2)/MSv(iIN))**2 
rj2 = (MSd(gt3)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MSd(gt3))+Abs(MFd(gt2))+Abs(MFv(gt1)))) Then 
!-------------- 
!  Chi 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplChiFvcSvL(i1,gt1,iIN)) 
coup(1) = Conjg(cplChiFvcSvR(i1,gt1,iIN)) 
coup(4) = Conjg(cplChiFdcSdL(i1,gt2,gt3)) 
coup(3) = Conjg(cplChiFdcSdR(i1,gt2,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Fv Fd cSd Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFvcSvL(i1,gt1,iIN) 
coup(2) = cplChiFvcSvR(i1,gt1,iIN) 
coup(3) = cplChiFdcSdL(i1,gt2,gt3) 
coup(4) = cplChiFdcSdR(i1,gt2,gt3) 
coup(5) = cplChiFvcSvL(i2,gt1,iIN) 
coup(6) = cplChiFvcSvR(i2,gt1,iIN)  
coup(7) = cplChiFdcSdL(i2,gt2,gt3) 
coup(8) = cplChiFdcSdR(i2,gt2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Fv Fd cSd Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
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
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:81))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvToFvFdcSd 
 
 
Subroutine SvToFvFucSu(iIN,MFv,MFu,MSu,MChi,MSv,cplChiFucSuL,cplChiFucSuR,            & 
& cplChiFvcSvL,cplChiFvcSvR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFv(3),MFu(3),MSu(6),MChi(9),MSv(6)

Complex(dp),Intent(in) :: cplChiFucSuL(9,3,6),cplChiFucSuR(9,3,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 81 
Allocate( gSum(3,3,6, Isum) ) 
Allocate( Contribution(3,3,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,6
Isum = 0 
 
rk2 = (MFv(gt1)/MSv(iIN))**2 
rm2 = (MFu(gt2)/MSv(iIN))**2 
rj2 = (MSu(gt3)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MSu(gt3))+Abs(MFu(gt2))+Abs(MFv(gt1)))) Then 
!-------------- 
!  Chi 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplChiFvcSvL(i1,gt1,iIN)) 
coup(1) = Conjg(cplChiFvcSvR(i1,gt1,iIN)) 
coup(4) = Conjg(cplChiFucSuL(i1,gt2,gt3)) 
coup(3) = Conjg(cplChiFucSuR(i1,gt2,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Fv Fu cSu Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFvcSvL(i1,gt1,iIN) 
coup(2) = cplChiFvcSvR(i1,gt1,iIN) 
coup(3) = cplChiFucSuL(i1,gt2,gt3) 
coup(4) = cplChiFucSuR(i1,gt2,gt3) 
coup(5) = cplChiFvcSvL(i2,gt1,iIN) 
coup(6) = cplChiFvcSvR(i2,gt1,iIN)  
coup(7) = cplChiFucSuL(i2,gt2,gt3) 
coup(8) = cplChiFucSuR(i2,gt2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Fv Fu cSu Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
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
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:81))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvToFvFucSu 
 
 
Subroutine SvToFvFvcSv(iIN,MFv,MSv,MChi,cplChiFvcSvL,cplChiFvcSvR,deltaM,             & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFv(3),MSv(6),MChi(9)

Complex(dp),Intent(in) :: cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 81 
Allocate( gSum(3,3,6, Isum) ) 
Allocate( Contribution(3,3,6, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=gt1,3
        Do gt3=1,6
Isum = 0 
 
rk2 = (MFv(gt1)/MSv(iIN))**2 
rm2 = (MFv(gt2)/MSv(iIN))**2 
rj2 = (MSv(gt3)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MSv(gt3))+Abs(MFv(gt2))+Abs(MFv(gt1)))) Then 
!-------------- 
!  Chi 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplChiFvcSvL(i1,gt1,iIN)) 
coup(1) = Conjg(cplChiFvcSvR(i1,gt1,iIN)) 
coup(4) = Conjg(cplChiFvcSvL(i1,gt2,gt3)) 
coup(3) = Conjg(cplChiFvcSvR(i1,gt2,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplChiFvcSvL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiFvcSvR(i1,gt2,iIN)) 
coup(4) = Conjg(cplChiFvcSvL(i1,gt1,gt3)) 
coup(3) = Conjg(cplChiFvcSvR(i1,gt1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MChi(i1)  
mass(2) = MChi(i1)  
coup(1) = cplChiFvcSvL(i1,gt2,iIN) 
coup(2) = cplChiFvcSvR(i1,gt2,iIN) 
coup(3) = cplChiFvcSvL(i1,gt1,gt3) 
coup(4) = cplChiFvcSvR(i1,gt1,gt3) 
coup(5) = cplChiFvcSvL(i1,gt1,iIN) 
coup(6) = cplChiFvcSvR(i1,gt1,iIN)  
coup(7) = cplChiFvcSvL(i1,gt2,gt3) 
coup(8) = cplChiFvcSvR(i1,gt2,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Fv Fv cSv Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFvcSvL(i1,gt1,iIN) 
coup(2) = cplChiFvcSvR(i1,gt1,iIN) 
coup(3) = cplChiFvcSvL(i1,gt2,gt3) 
coup(4) = cplChiFvcSvR(i1,gt2,gt3) 
coup(5) = cplChiFvcSvL(i2,gt1,iIN) 
coup(6) = cplChiFvcSvR(i2,gt1,iIN)  
coup(7) = cplChiFvcSvL(i2,gt2,gt3) 
coup(8) = cplChiFvcSvR(i2,gt2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFvcSvL(i1,gt2,iIN) 
coup(2) = cplChiFvcSvR(i1,gt2,iIN) 
coup(3) = cplChiFvcSvL(i1,gt1,gt3) 
coup(4) = cplChiFvcSvR(i1,gt1,gt3) 
coup(5) = cplChiFvcSvL(i2,gt1,iIN) 
coup(6) = cplChiFvcSvR(i2,gt1,iIN)  
coup(7) = cplChiFvcSvL(i2,gt2,gt3) 
coup(8) = cplChiFvcSvR(i2,gt2,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFvcSvL(i1,gt2,iIN) 
coup(2) = cplChiFvcSvR(i1,gt2,iIN) 
coup(3) = cplChiFvcSvL(i1,gt1,gt3) 
coup(4) = cplChiFvcSvR(i1,gt1,gt3) 
coup(5) = cplChiFvcSvL(i2,gt2,iIN) 
coup(6) = cplChiFvcSvR(i2,gt2,iIN)  
coup(7) = cplChiFvcSvL(i2,gt1,gt3) 
coup(8) = cplChiFvcSvR(i2,gt1,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFvcSvL(i1,gt1,iIN) 
coup(2) = cplChiFvcSvR(i1,gt1,iIN) 
coup(3) = cplChiFvcSvL(i1,gt2,gt3) 
coup(4) = cplChiFvcSvR(i1,gt2,gt3) 
coup(5) = cplChiFvcSvL(i2,gt2,iIN) 
coup(6) = cplChiFvcSvR(i2,gt2,iIN)  
coup(7) = cplChiFvcSvL(i2,gt1,gt3) 
coup(8) = cplChiFvcSvR(i2,gt1,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Fv Fv cSv Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
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
    Do gt1=1,3
      Do gt2=gt1,3
        Do gt3=1,6
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:81))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvToFvFvcSv 
 
 
Subroutine SvTocChaFvHpm(iIN,MCha,MFv,MHpm,MFe,MChi,MSv,cplcChaChiHpmL,               & 
& cplcChaChiHpmR,cplcChaFecSvL,cplcChaFecSvR,cplcFeFvHpmL,cplcFeFvHpmR,cplChiFvcSvL,     & 
& cplChiFvcSvR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MCha(2),MFv(3),MHpm(2),MFe(3),MChi(9),MSv(6)

Complex(dp),Intent(in) :: cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),& 
& cplcFeFvHpmL(3,3,2),cplcFeFvHpmR(3,3,2),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 144 
Allocate( gSum(2,3,2, Isum) ) 
Allocate( Contribution(2,3,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,2
      Do gt2=1,3
        Do gt3=2,2
Isum = 0 
 
rk2 = (MCha(gt1)/MSv(iIN))**2 
rm2 = (MFv(gt2)/MSv(iIN))**2 
rj2 = (MHpm(gt3)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MHpm(gt3))+Abs(MFv(gt2))+Abs(MCha(gt1)))) Then 
!-------------- 
!  Fe 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplcChaFecSvL(gt1,i1,iIN)) 
coup(1) = Conjg(cplcChaFecSvR(gt1,i1,iIN)) 
coup(4) = Conjg(cplcFeFvHpmL(i1,gt2,gt3)) 
coup(3) = Conjg(cplcFeFvHpmR(i1,gt2,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->cCha Fv Hpm Propagator: Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplChiFvcSvL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiFvcSvR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcChaChiHpmL(gt1,i1,gt3)) 
coup(3) = Conjg(cplcChaChiHpmR(gt1,i1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->cCha Fv Hpm Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Fe, Fe 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcChaFecSvL(gt1,i1,iIN) 
coup(2) = cplcChaFecSvR(gt1,i1,iIN) 
coup(3) = cplcFeFvHpmL(i1,gt2,gt3) 
coup(4) = cplcFeFvHpmR(i1,gt2,gt3) 
coup(5) = cplcChaFecSvL(gt1,i2,iIN) 
coup(6) = cplcChaFecSvR(gt1,i2,iIN)  
coup(7) = cplcFeFvHpmL(i2,gt2,gt3) 
coup(8) = cplcFeFvHpmR(i2,gt2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->cCha Fv Hpm Propagator: Fe,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe,Fe'
        End Do 
      End Do 



!-------------- 
!  Fe, Chi 
!-------------- 
Do i1=1,3
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MChi(i2)  
coup(1) = cplcChaFecSvL(gt1,i1,iIN) 
coup(2) = cplcChaFecSvR(gt1,i1,iIN) 
coup(3) = cplcFeFvHpmL(i1,gt2,gt3) 
coup(4) = cplcFeFvHpmR(i1,gt2,gt3) 
coup(5) = cplChiFvcSvL(i2,gt2,iIN) 
coup(6) = cplChiFvcSvR(i2,gt2,iIN)  
coup(7) = cplcChaChiHpmL(gt1,i2,gt3) 
coup(8) = cplcChaChiHpmR(gt1,i2,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->cCha Fv Hpm Propagator: Fe,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFvcSvL(i1,gt2,iIN) 
coup(2) = cplChiFvcSvR(i1,gt2,iIN) 
coup(3) = cplcChaChiHpmL(gt1,i1,gt3) 
coup(4) = cplcChaChiHpmR(gt1,i1,gt3) 
coup(5) = cplChiFvcSvL(i2,gt2,iIN) 
coup(6) = cplChiFvcSvR(i2,gt2,iIN)  
coup(7) = cplcChaChiHpmL(gt1,i2,gt3) 
coup(8) = cplcChaChiHpmR(gt1,i2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->cCha Fv Hpm Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
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
    Do gt1=1,2
      Do gt2=1,3
        Do gt3=2,2
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:144))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvTocChaFvHpm 
 
 
Subroutine SvToFvSdcFd(iIN,MFv,MSd,MFd,MChi,MSv,cplcFdChiSdL,cplcFdChiSdR,            & 
& cplChiFvcSvL,cplChiFvcSvR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFv(3),MSd(6),MFd(3),MChi(9),MSv(6)

Complex(dp),Intent(in) :: cplcFdChiSdL(3,9,6),cplcFdChiSdR(3,9,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 81 
Allocate( gSum(3,6,3, Isum) ) 
Allocate( Contribution(3,6,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,6
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFv(gt1)/MSv(iIN))**2 
rm2 = (MFd(gt3)/MSv(iIN))**2 
rj2 = (MSd(gt2)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MFd(gt3))+Abs(MSd(gt2))+Abs(MFv(gt1)))) Then 
!-------------- 
!  Chi 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplChiFvcSvL(i1,gt1,iIN)) 
coup(1) = Conjg(cplChiFvcSvR(i1,gt1,iIN)) 
coup(4) = Conjg(cplcFdChiSdL(gt3,i1,gt2)) 
coup(3) = Conjg(cplcFdChiSdR(gt3,i1,gt2))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Fv Sd cFd Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFvcSvL(i1,gt1,iIN) 
coup(2) = cplChiFvcSvR(i1,gt1,iIN) 
coup(3) = cplcFdChiSdL(gt3,i1,gt2) 
coup(4) = cplcFdChiSdR(gt3,i1,gt2) 
coup(5) = cplChiFvcSvL(i2,gt1,iIN) 
coup(6) = cplChiFvcSvR(i2,gt1,iIN)  
coup(7) = cplcFdChiSdL(gt3,i2,gt2) 
coup(8) = cplcFdChiSdR(gt3,i2,gt2) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Fv Sd cFd Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
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
    Do gt1=1,3
      Do gt2=1,6
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:81))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvToFvSdcFd 
 
 
Subroutine SvToSeFvcFe(iIN,MSe,MFv,MFe,MVWm,MHpm,MChi,MSv,cplSecHpmcSv,               & 
& cplSecSvcVWm,cplcFeChiSeL,cplcFeChiSeR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,         & 
& cplcFeFvVWmR,cplChiFvcSvL,cplChiFvcSvR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSe(6),MFv(3),MFe(3),MVWm,MHpm(2),MChi(9),MSv(6)

Complex(dp),Intent(in) :: cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),cplcFeChiSeL(3,9,6),cplcFeChiSeR(3,9,6),        & 
& cplcFeFvHpmL(3,3,2),cplcFeFvHpmR(3,3,2),cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),           & 
& cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 144 
Allocate( gSum(6,3,3, Isum) ) 
Allocate( Contribution(6,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFv(gt2)/MSv(iIN))**2 
rm2 = (MFe(gt3)/MSv(iIN))**2 
rj2 = (MSe(gt1)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MFe(gt3))+Abs(MFv(gt2))+Abs(MSe(gt1)))) Then 
!-------------- 
!  conj[VWm] 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVWm 
mass(2) = MVWm 
m_in = MSv(iIN) 
coup(1) = Conjg(cplSecSvcVWm(gt1,iIN)) 
coup(3) = Conjg(cplcFeFvVWmL(gt3,gt2)) 
coup(2) = Conjg(cplcFeFvVWmR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Fv cFe Propagator: conj[VWm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWm]'



!-------------- 
!  conj[Hpm] 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MHpm(i1) 
mass(2) = MHpm(i1) 
m_in = MSv(iIN) 
coup(1) = Conjg(cplSecHpmcSv(gt1,i1,iIN)) 
coup(3) = Conjg(cplcFeFvHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFvHpmR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Fv cFe Propagator: conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm]'
      End Do 



!-------------- 
!  Chi 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplChiFvcSvL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiFvcSvR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFeChiSeL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFeChiSeR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Fv cFe Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  conj[VWm], conj[Hpm] 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm  
mass(1) = MHpm(i2)  
coup(1) = cplSecSvcVWm(gt1,iIN) 
coup(2) = Conjg(cplcFeFvVWmL(gt3,gt2)) 
coup(3) = Conjg(cplcFeFvVWmR(gt3,gt2))  
coup(4) = cplSecHpmcSv(gt1,i2,iIN) 
coup(5) = Conjg(cplcFeFvHpmL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFeFvHpmR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Fv cFe Propagator: conj[VWm],conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWm],conj[Hpm]'
      End Do 



!-------------- 
!  conj[VWm], Chi 
!-------------- 
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm2  
mass(1) = MChi2(i2)  
coup(1) = cplChiFvcSvL(i2,gt2,iIN) 
coup(2) = cplChiFvcSvR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeChiSeL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeChiSeR(gt3,i2,gt1))  
coup(5) = cplSecSvcVWm(gt1,iIN) 
coup(7) = Conjg(cplcFeFvVWmL(gt3,gt2)) 
coup(6) = Conjg(cplcFeFvVWmR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Fv cFe Propagator: conj[VWm],Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWm],Chi'
      End Do 



!-------------- 
!  conj[Hpm], conj[Hpm] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MHpm(i1)  
mass(2) = MHpm(i2)  
coup(1) = cplSecHpmcSv(gt1,i1,iIN) 
coup(3) = Conjg(cplcFeFvHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFeFvHpmR(gt3,gt2,i1))  
coup(4) = cplSecHpmcSv(gt1,i2,iIN) 
coup(6) = Conjg(cplcFeFvHpmL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFeFvHpmR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Fv cFe Propagator: conj[Hpm],conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm],conj[Hpm]'
        End Do 
      End Do 



!-------------- 
!  conj[Hpm], Chi 
!-------------- 
Do i1=1,2
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MHpm(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiFvcSvL(i2,gt2,iIN) 
coup(2) = cplChiFvcSvR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFeChiSeL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFeChiSeR(gt3,i2,gt1))  
coup(5) = cplSecHpmcSv(gt1,i1,iIN) 
coup(7) = Conjg(cplcFeFvHpmL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFeFvHpmR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Fv cFe Propagator: conj[Hpm],Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm],Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFvcSvL(i1,gt2,iIN) 
coup(2) = cplChiFvcSvR(i1,gt2,iIN) 
coup(3) = cplcFeChiSeL(gt3,i1,gt1) 
coup(4) = cplcFeChiSeR(gt3,i1,gt1) 
coup(5) = cplChiFvcSvL(i2,gt2,iIN) 
coup(6) = cplChiFvcSvR(i2,gt2,iIN)  
coup(7) = cplcFeChiSeL(gt3,i2,gt1) 
coup(8) = cplcFeChiSeR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Fv cFe Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
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
    Do gt1=1,6
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:144))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvToSeFvcFe 
 
 
Subroutine SvToFvSucFu(iIN,MFv,MSu,MFu,MChi,MSv,cplcFuChiSuL,cplcFuChiSuR,            & 
& cplChiFvcSvL,cplChiFvcSvR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFv(3),MSu(6),MFu(3),MChi(9),MSv(6)

Complex(dp),Intent(in) :: cplcFuChiSuL(3,9,6),cplcFuChiSuR(3,9,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 81 
Allocate( gSum(3,6,3, Isum) ) 
Allocate( Contribution(3,6,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,6
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFv(gt1)/MSv(iIN))**2 
rm2 = (MFu(gt3)/MSv(iIN))**2 
rj2 = (MSu(gt2)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MFu(gt3))+Abs(MSu(gt2))+Abs(MFv(gt1)))) Then 
!-------------- 
!  Chi 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplChiFvcSvL(i1,gt1,iIN)) 
coup(1) = Conjg(cplChiFvcSvR(i1,gt1,iIN)) 
coup(4) = Conjg(cplcFuChiSuL(gt3,i1,gt2)) 
coup(3) = Conjg(cplcFuChiSuR(gt3,i1,gt2))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Fv Su cFu Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFvcSvL(i1,gt1,iIN) 
coup(2) = cplChiFvcSvR(i1,gt1,iIN) 
coup(3) = cplcFuChiSuL(gt3,i1,gt2) 
coup(4) = cplcFuChiSuR(gt3,i1,gt2) 
coup(5) = cplChiFvcSvL(i2,gt1,iIN) 
coup(6) = cplChiFvcSvR(i2,gt1,iIN)  
coup(7) = cplcFuChiSuL(gt3,i2,gt2) 
coup(8) = cplcFuChiSuR(gt3,i2,gt2) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Fv Su cFu Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
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
    Do gt1=1,3
      Do gt2=1,6
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:81))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvToFvSucFu 
 
 
Subroutine SvToSvFvcFv(iIN,MSv,MFv,MVZ,MVZp,MAh,Mhh,MChi,cplAhSvcSv,cplhhSvcSv,       & 
& cplSvcSvVZ,cplSvcSvVZp,cplcFvChiSvL,cplcFvChiSvR,cplcFvFvAhL,cplcFvFvAhR,              & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,             & 
& cplChiFvcSvL,cplChiFvcSvR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSv(6),MFv(3),MVZ,MVZp,MAh(6),Mhh(6),MChi(9)

Complex(dp),Intent(in) :: cplAhSvcSv(6,6,6),cplhhSvcSv(6,6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),cplcFvChiSvL(3,9,6),& 
& cplcFvChiSvR(3,9,6),cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),cplcFvFvhhL(3,3,6),          & 
& cplcFvFvhhR(3,3,6),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplcFvFvVZpL(3,3),cplcFvFvVZpR(3,3),& 
& cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 529 
Allocate( gSum(6,3,3, Isum) ) 
Allocate( Contribution(6,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFv(gt2)/MSv(iIN))**2 
rm2 = (MFv(gt3)/MSv(iIN))**2 
rj2 = (MSv(gt1)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MFv(gt3))+Abs(MFv(gt2))+Abs(MSv(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MSv(iIN) 
coup(1) = Conjg(cplSvcSvVZ(gt1,iIN)) 
coup(3) = Conjg(cplcFvFvVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFvFvVZR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fv cFv Propagator: VZ" 
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
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZp 
mass(2) = MVZp 
m_in = MSv(iIN) 
coup(1) = Conjg(cplSvcSvVZp(gt1,iIN)) 
coup(3) = Conjg(cplcFvFvVZpL(gt3,gt2)) 
coup(2) = Conjg(cplcFvFvVZpR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fv cFv Propagator: VZp" 
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
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MSv(iIN) 
coup(1) = Conjg(cplAhSvcSv(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFvFvAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFvFvAhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fv cFv Propagator: Ah" 
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
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = MSv(iIN) 
coup(1) = Conjg(cplhhSvcSv(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFvFvhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFvFvhhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fv cFv Propagator: hh" 
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
!  Chi 
!-------------- 
Do i1=1,9
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MChi(i1) 
mass(2) = MChi(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplChiFvcSvL(i1,gt2,iIN)) 
coup(1) = Conjg(cplChiFvcSvR(i1,gt2,iIN)) 
coup(4) = Conjg(cplcFvChiSvL(gt3,i1,gt1)) 
coup(3) = Conjg(cplcFvChiSvR(gt3,i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fv cFv Propagator: Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MVZ  
mass(2) = MVZp  
coup(1) = cplSvcSvVZ(gt1,iIN) 
coup(3) = Conjg(cplcFvFvVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFvFvVZR(gt3,gt2))  
coup(4) = cplSvcSvVZp(gt1,iIN) 
coup(5) = Conjg(cplcFvFvVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcFvFvVZpR(gt3,gt2)) 
Call IntegrateVaVb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fv cFv Propagator: VZ,VZp" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplSvcSvVZ(gt1,iIN) 
coup(2) = Conjg(cplcFvFvVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFvFvVZR(gt3,gt2))  
coup(4) = cplAhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplcFvFvAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFvFvAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fv cFv Propagator: VZ,Ah" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = Mhh(i2)  
coup(1) = cplSvcSvVZ(gt1,iIN) 
coup(2) = Conjg(cplcFvFvVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFvFvVZR(gt3,gt2))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplcFvFvhhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFvFvhhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fv cFv Propagator: VZ,hh" 
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
!  VZ, Chi 
!-------------- 
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MChi2(i2)  
coup(1) = cplChiFvcSvL(i2,gt2,iIN) 
coup(2) = cplChiFvcSvR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFvChiSvL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFvChiSvR(gt3,i2,gt1))  
coup(5) = cplSvcSvVZ(gt1,iIN) 
coup(7) = Conjg(cplcFvFvVZL(gt3,gt2)) 
coup(6) = Conjg(cplcFvFvVZR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fv cFv Propagator: VZ,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Chi'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = MAh(i2)  
coup(1) = cplSvcSvVZp(gt1,iIN) 
coup(2) = Conjg(cplcFvFvVZpL(gt3,gt2)) 
coup(3) = Conjg(cplcFvFvVZpR(gt3,gt2))  
coup(4) = cplAhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplcFvFvAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFvFvAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fv cFv Propagator: VZp,Ah" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = Mhh(i2)  
coup(1) = cplSvcSvVZp(gt1,iIN) 
coup(2) = Conjg(cplcFvFvVZpL(gt3,gt2)) 
coup(3) = Conjg(cplcFvFvVZpR(gt3,gt2))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplcFvFvhhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFvFvhhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fv cFv Propagator: VZp,hh" 
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
!  VZp, Chi 
!-------------- 
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp2  
mass(1) = MChi2(i2)  
coup(1) = cplChiFvcSvL(i2,gt2,iIN) 
coup(2) = cplChiFvcSvR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFvChiSvL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFvChiSvR(gt3,i2,gt1))  
coup(5) = cplSvcSvVZp(gt1,iIN) 
coup(7) = Conjg(cplcFvFvVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcFvFvVZpR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fv cFv Propagator: VZp,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Chi'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhSvcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplcFvFvAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFvFvAhR(gt3,gt2,i1))  
coup(4) = cplAhSvcSv(i2,gt1,iIN) 
coup(6) = Conjg(cplcFvFvAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFvFvAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fv cFv Propagator: Ah,Ah" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplAhSvcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplcFvFvAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFvFvAhR(gt3,gt2,i1))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(6) = Conjg(cplcFvFvhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFvFvhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fv cFv Propagator: Ah,hh" 
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
!  Ah, Chi 
!-------------- 
Do i1=1,6
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiFvcSvL(i2,gt2,iIN) 
coup(2) = cplChiFvcSvR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFvChiSvL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFvChiSvR(gt3,i2,gt1))  
coup(5) = cplAhSvcSv(i1,gt1,iIN) 
coup(7) = Conjg(cplcFvFvAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFvFvAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fv cFv Propagator: Ah,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Chi'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhSvcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplcFvFvhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFvFvhhR(gt3,gt2,i1))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(6) = Conjg(cplcFvFvhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFvFvhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fv cFv Propagator: hh,hh" 
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



!-------------- 
!  hh, Chi 
!-------------- 
Do i1=1,6
  Do i2=1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MChi(i2)  
coup(1) = cplChiFvcSvL(i2,gt2,iIN) 
coup(2) = cplChiFvcSvR(i2,gt2,iIN) 
coup(4) = Conjg(cplcFvChiSvL(gt3,i2,gt1)) 
coup(3) = Conjg(cplcFvChiSvR(gt3,i2,gt1))  
coup(5) = cplhhSvcSv(i1,gt1,iIN) 
coup(7) = Conjg(cplcFvFvhhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcFvFvhhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fv cFv Propagator: hh,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,Chi'
        End Do 
      End Do 



!-------------- 
!  Chi, Chi 
!-------------- 
Do i1=1,8
  Do i2=i1+1,9
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MChi(i1)  
mass(2) = MChi(i2)  
coup(1) = cplChiFvcSvL(i1,gt2,iIN) 
coup(2) = cplChiFvcSvR(i1,gt2,iIN) 
coup(3) = cplcFvChiSvL(gt3,i1,gt1) 
coup(4) = cplcFvChiSvR(gt3,i1,gt1) 
coup(5) = cplChiFvcSvL(i2,gt2,iIN) 
coup(6) = cplChiFvcSvR(i2,gt2,iIN)  
coup(7) = cplcFvChiSvL(gt3,i2,gt1) 
coup(8) = cplcFvChiSvR(gt3,i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fv cFv Propagator: Chi,Chi" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Chi,Chi'
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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:529))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvToSvFvcFv 
 
 
Subroutine SvToSeFucFd(iIN,MSe,MFu,MFd,MVWm,MHpm,MSv,cplSecHpmcSv,cplSecSvcVWm,       & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,deltaM,epsI,check,g,               & 
& WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSe(6),MFu(3),MFd(3),MVWm,MHpm(2),MSv(6)

Complex(dp),Intent(in) :: cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),        & 
& cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 9 
Allocate( gSum(6,3,3, Isum) ) 
Allocate( Contribution(6,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,6
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFu(gt2)/MSv(iIN))**2 
rm2 = (MFd(gt3)/MSv(iIN))**2 
rj2 = (MSe(gt1)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MFd(gt3))+Abs(MFu(gt2))+Abs(MSe(gt1)))) Then 
!-------------- 
!  conj[VWm] 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVWm 
mass(2) = MVWm 
m_in = MSv(iIN) 
coup(1) = Conjg(cplSecSvcVWm(gt1,iIN)) 
coup(3) = Conjg(cplcFdFuVWmL(gt3,gt2)) 
coup(2) = Conjg(cplcFdFuVWmR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Fu cFd Propagator: conj[VWm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWm]'



!-------------- 
!  conj[Hpm] 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MHpm(i1) 
mass(2) = MHpm(i1) 
m_in = MSv(iIN) 
coup(1) = Conjg(cplSecHpmcSv(gt1,i1,iIN)) 
coup(3) = Conjg(cplcFdFuHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFuHpmR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Fu cFd Propagator: conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm]'
      End Do 



!-------------- 
!  conj[VWm], conj[Hpm] 
!-------------- 
  Do i2=1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVWm  
mass(1) = MHpm(i2)  
coup(1) = cplSecSvcVWm(gt1,iIN) 
coup(2) = Conjg(cplcFdFuVWmL(gt3,gt2)) 
coup(3) = Conjg(cplcFdFuVWmR(gt3,gt2))  
coup(4) = cplSecHpmcSv(gt1,i2,iIN) 
coup(5) = Conjg(cplcFdFuHpmL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFdFuHpmR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Fu cFd Propagator: conj[VWm],conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWm],conj[Hpm]'
      End Do 



!-------------- 
!  conj[Hpm], conj[Hpm] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MHpm(i1)  
mass(2) = MHpm(i2)  
coup(1) = cplSecHpmcSv(gt1,i1,iIN) 
coup(3) = Conjg(cplcFdFuHpmL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFuHpmR(gt3,gt2,i1))  
coup(4) = cplSecHpmcSv(gt1,i2,iIN) 
coup(6) = Conjg(cplcFdFuHpmL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFdFuHpmR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Se Fu cFd Propagator: conj[Hpm],conj[Hpm]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[Hpm],conj[Hpm]'
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
    Do gt1=1,6
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:9))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvToSeFucFd 
 
 
Subroutine SvToSvChacCha(iIN,MSv,MCha,MVZ,MVZp,MAh,Mhh,MFe,cplAhSvcSv,cplhhSvcSv,     & 
& cplSvcSvVZ,cplSvcSvVZp,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaFecSvL,               & 
& cplcChaFecSvR,cplcFeChaSvL,cplcFeChaSvR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSv(6),MCha(2),MVZ,MVZp,MAh(6),Mhh(6),MFe(3)

Complex(dp),Intent(in) :: cplAhSvcSv(6,6,6),cplhhSvcSv(6,6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),cplcChaChaAhL(2,2,6),& 
& cplcChaChaAhR(2,2,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),cplcChaChaVZL(2,2),     & 
& cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcChaFecSvL(2,3,6),       & 
& cplcChaFecSvR(2,3,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 289 
Allocate( gSum(6,2,2, Isum) ) 
Allocate( Contribution(6,2,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,2
        Do gt3=1,2
Isum = 0 
 
rk2 = (MCha(gt2)/MSv(iIN))**2 
rm2 = (MCha(gt3)/MSv(iIN))**2 
rj2 = (MSv(gt1)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MCha(gt3))+Abs(MCha(gt2))+Abs(MSv(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MSv(iIN) 
coup(1) = Conjg(cplSvcSvVZ(gt1,iIN)) 
coup(3) = Conjg(cplcChaChaVZL(gt3,gt2)) 
coup(2) = Conjg(cplcChaChaVZR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Cha cCha Propagator: VZ" 
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
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZp 
mass(2) = MVZp 
m_in = MSv(iIN) 
coup(1) = Conjg(cplSvcSvVZp(gt1,iIN)) 
coup(3) = Conjg(cplcChaChaVZpL(gt3,gt2)) 
coup(2) = Conjg(cplcChaChaVZpR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Cha cCha Propagator: VZp" 
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
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MSv(iIN) 
coup(1) = Conjg(cplAhSvcSv(i1,gt1,iIN)) 
coup(3) = Conjg(cplcChaChaAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChaAhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Cha cCha Propagator: Ah" 
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
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = MSv(iIN) 
coup(1) = Conjg(cplhhSvcSv(i1,gt1,iIN)) 
coup(3) = Conjg(cplcChaChahhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChahhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Cha cCha Propagator: hh" 
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
!  Fe 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = MSv(iIN) 
coup(2) = Conjg(cplcChaFecSvL(gt3,i1,iIN)) 
coup(1) = Conjg(cplcChaFecSvR(gt3,i1,iIN)) 
coup(4) = Conjg(cplcFeChaSvL(i1,gt2,gt1)) 
coup(3) = Conjg(cplcFeChaSvR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Cha cCha Propagator: Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe'
      End Do 



!-------------- 
!  VZ, VZp 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MVZ  
mass(2) = MVZp  
coup(1) = cplSvcSvVZ(gt1,iIN) 
coup(3) = Conjg(cplcChaChaVZL(gt3,gt2)) 
coup(2) = Conjg(cplcChaChaVZR(gt3,gt2))  
coup(4) = cplSvcSvVZp(gt1,iIN) 
coup(5) = Conjg(cplcChaChaVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcChaChaVZpR(gt3,gt2)) 
Call IntegrateVaVb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Cha cCha Propagator: VZ,VZp" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplSvcSvVZ(gt1,iIN) 
coup(2) = Conjg(cplcChaChaVZL(gt3,gt2)) 
coup(3) = Conjg(cplcChaChaVZR(gt3,gt2))  
coup(4) = cplAhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcChaChaAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Cha cCha Propagator: VZ,Ah" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = Mhh(i2)  
coup(1) = cplSvcSvVZ(gt1,iIN) 
coup(2) = Conjg(cplcChaChaVZL(gt3,gt2)) 
coup(3) = Conjg(cplcChaChaVZR(gt3,gt2))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcChaChahhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Cha cCha Propagator: VZ,hh" 
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
!  VZ, Fe 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ2  
mass(1) = MFe2(i2)  
coup(1) = cplcChaFecSvL(gt3,i2,iIN) 
coup(2) = cplcChaFecSvR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeChaSvL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeChaSvR(i2,gt2,gt1))  
coup(5) = cplSvcSvVZ(gt1,iIN) 
coup(7) = Conjg(cplcChaChaVZL(gt3,gt2)) 
coup(6) = Conjg(cplcChaChaVZR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Cha cCha Propagator: VZ,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Fe'
      End Do 



!-------------- 
!  VZp, Ah 
!-------------- 
  Do i2=1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = MAh(i2)  
coup(1) = cplSvcSvVZp(gt1,iIN) 
coup(2) = Conjg(cplcChaChaVZpL(gt3,gt2)) 
coup(3) = Conjg(cplcChaChaVZpR(gt3,gt2))  
coup(4) = cplAhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcChaChaAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Cha cCha Propagator: VZp,Ah" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = Mhh(i2)  
coup(1) = cplSvcSvVZp(gt1,iIN) 
coup(2) = Conjg(cplcChaChaVZpL(gt3,gt2)) 
coup(3) = Conjg(cplcChaChaVZpR(gt3,gt2))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcChaChahhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Cha cCha Propagator: VZp,hh" 
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
!  VZp, Fe 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp2  
mass(1) = MFe2(i2)  
coup(1) = cplcChaFecSvL(gt3,i2,iIN) 
coup(2) = cplcChaFecSvR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeChaSvL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeChaSvR(i2,gt2,gt1))  
coup(5) = cplSvcSvVZp(gt1,iIN) 
coup(7) = Conjg(cplcChaChaVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcChaChaVZpR(gt3,gt2))  
Call IntegrateVF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
resC = 1*resC  ! Color factor 
If (resC.ne.resC) resC = 0._dp
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Cha cCha Propagator: VZp,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZp,Fe'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhSvcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplcChaChaAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChaAhR(gt3,gt2,i1))  
coup(4) = cplAhSvcSv(i2,gt1,iIN) 
coup(6) = Conjg(cplcChaChaAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaChaAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Cha cCha Propagator: Ah,Ah" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplAhSvcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplcChaChaAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChaAhR(gt3,gt2,i1))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(6) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaChahhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Cha cCha Propagator: Ah,hh" 
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
!  Ah, Fe 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MAh(i1)  
mass(1) = MFe(i2)  
coup(1) = cplcChaFecSvL(gt3,i2,iIN) 
coup(2) = cplcChaFecSvR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeChaSvL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeChaSvR(i2,gt2,gt1))  
coup(5) = cplAhSvcSv(i1,gt1,iIN) 
coup(7) = Conjg(cplcChaChaAhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcChaChaAhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Cha cCha Propagator: Ah,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Fe'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,5
  Do i2=i1+1,6
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhSvcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplcChaChahhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcChaChahhR(gt3,gt2,i1))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(6) = Conjg(cplcChaChahhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcChaChahhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Cha cCha Propagator: hh,hh" 
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



!-------------- 
!  hh, Fe 
!-------------- 
Do i1=1,6
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh(i1)  
mass(1) = MFe(i2)  
coup(1) = cplcChaFecSvL(gt3,i2,iIN) 
coup(2) = cplcChaFecSvR(gt3,i2,iIN) 
coup(4) = Conjg(cplcFeChaSvL(i2,gt2,gt1)) 
coup(3) = Conjg(cplcFeChaSvR(i2,gt2,gt1))  
coup(5) = cplhhSvcSv(i1,gt1,iIN) 
coup(7) = Conjg(cplcChaChahhL(gt3,gt2,i1)) 
coup(6) = Conjg(cplcChaChahhR(gt3,gt2,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Cha cCha Propagator: hh,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,Fe'
        End Do 
      End Do 



!-------------- 
!  Fe, Fe 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcChaFecSvL(gt3,i1,iIN) 
coup(2) = cplcChaFecSvR(gt3,i1,iIN) 
coup(3) = cplcFeChaSvL(i1,gt2,gt1) 
coup(4) = cplcFeChaSvR(i1,gt2,gt1) 
coup(5) = cplcChaFecSvL(gt3,i2,iIN) 
coup(6) = cplcChaFecSvR(gt3,i2,iIN)  
coup(7) = cplcFeChaSvL(i2,gt2,gt1) 
coup(8) = cplcFeChaSvR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Cha cCha Propagator: Fe,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fe,Fe'
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
        Do gt3=1,2
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:289))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvToSvChacCha 
 
 
Subroutine SvToSvFdcFd(iIN,MSv,MFd,MVZ,MVZp,MAh,Mhh,cplAhSvcSv,cplhhSvcSv,            & 
& cplSvcSvVZ,cplSvcSvVZp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,    & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSv(6),MFd(3),MVZ,MVZp,MAh(6),Mhh(6)

Complex(dp),Intent(in) :: cplAhSvcSv(6,6,6),cplhhSvcSv(6,6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),cplcFdFdAhL(3,3,6),& 
& cplcFdFdAhR(3,3,6),cplcFdFdhhL(3,3,6),cplcFdFdhhR(3,3,6),cplcFdFdVZL(3,3),             & 
& cplcFdFdVZR(3,3),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 196 
Allocate( gSum(6,3,3, Isum) ) 
Allocate( Contribution(6,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFd(gt2)/MSv(iIN))**2 
rm2 = (MFd(gt3)/MSv(iIN))**2 
rj2 = (MSv(gt1)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(MSv(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MSv(iIN) 
coup(1) = Conjg(cplSvcSvVZ(gt1,iIN)) 
coup(3) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFdFdVZR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fd cFd Propagator: VZ" 
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
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZp 
mass(2) = MVZp 
m_in = MSv(iIN) 
coup(1) = Conjg(cplSvcSvVZp(gt1,iIN)) 
coup(3) = Conjg(cplcFdFdVZpL(gt3,gt2)) 
coup(2) = Conjg(cplcFdFdVZpR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fd cFd Propagator: VZp" 
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
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MSv(iIN) 
coup(1) = Conjg(cplAhSvcSv(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdAhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fd cFd Propagator: Ah" 
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
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = MSv(iIN) 
coup(1) = Conjg(cplhhSvcSv(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFdFdhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdhhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fd cFd Propagator: hh" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MVZ  
mass(2) = MVZp  
coup(1) = cplSvcSvVZ(gt1,iIN) 
coup(3) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFdFdVZR(gt3,gt2))  
coup(4) = cplSvcSvVZp(gt1,iIN) 
coup(5) = Conjg(cplcFdFdVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcFdFdVZpR(gt3,gt2)) 
Call IntegrateVaVb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fd cFd Propagator: VZ,VZp" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplSvcSvVZ(gt1,iIN) 
coup(2) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFdFdVZR(gt3,gt2))  
coup(4) = cplAhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFdFdAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fd cFd Propagator: VZ,Ah" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = Mhh(i2)  
coup(1) = cplSvcSvVZ(gt1,iIN) 
coup(2) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFdFdVZR(gt3,gt2))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFdFdhhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fd cFd Propagator: VZ,hh" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = MAh(i2)  
coup(1) = cplSvcSvVZp(gt1,iIN) 
coup(2) = Conjg(cplcFdFdVZpL(gt3,gt2)) 
coup(3) = Conjg(cplcFdFdVZpR(gt3,gt2))  
coup(4) = cplAhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFdFdAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fd cFd Propagator: VZp,Ah" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = Mhh(i2)  
coup(1) = cplSvcSvVZp(gt1,iIN) 
coup(2) = Conjg(cplcFdFdVZpL(gt3,gt2)) 
coup(3) = Conjg(cplcFdFdVZpR(gt3,gt2))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFdFdhhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fd cFd Propagator: VZp,hh" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhSvcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdAhR(gt3,gt2,i1))  
coup(4) = cplAhSvcSv(i2,gt1,iIN) 
coup(6) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFdFdAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fd cFd Propagator: Ah,Ah" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplAhSvcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdAhR(gt3,gt2,i1))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(6) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFdFdhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fd cFd Propagator: Ah,hh" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhSvcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplcFdFdhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFdFdhhR(gt3,gt2,i1))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(6) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFdFdhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fd cFd Propagator: hh,hh" 
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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:196))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvToSvFdcFd 
 
 
Subroutine SvToSvFucFu(iIN,MSv,MFu,MVZ,MVZp,MAh,Mhh,cplAhSvcSv,cplhhSvcSv,            & 
& cplSvcSvVZ,cplSvcSvVZp,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,    & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSv(6),MFu(3),MVZ,MVZp,MAh(6),Mhh(6)

Complex(dp),Intent(in) :: cplAhSvcSv(6,6,6),cplhhSvcSv(6,6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),cplcFuFuAhL(3,3,6),& 
& cplcFuFuAhR(3,3,6),cplcFuFuhhL(3,3,6),cplcFuFuhhR(3,3,6),cplcFuFuVZL(3,3),             & 
& cplcFuFuVZR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3)

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
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSv(iIN) 
 
Isum = 196 
Allocate( gSum(6,3,3, Isum) ) 
Allocate( Contribution(6,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFu(gt2)/MSv(iIN))**2 
rm2 = (MFu(gt3)/MSv(iIN))**2 
rj2 = (MSv(gt1)/MSv(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSv(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSv(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(MSv(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZ 
mass(2) = MVZ 
m_in = MSv(iIN) 
coup(1) = Conjg(cplSvcSvVZ(gt1,iIN)) 
coup(3) = Conjg(cplcFuFuVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFuFuVZR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fu cFu Propagator: VZ" 
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
resS=0._dp 
resD=0._dp 
 
mass(1) = MVZp 
mass(2) = MVZp 
m_in = MSv(iIN) 
coup(1) = Conjg(cplSvcSvVZp(gt1,iIN)) 
coup(3) = Conjg(cplcFuFuVZpL(gt3,gt2)) 
coup(2) = Conjg(cplcFuFuVZpR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateVV(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fu cFu Propagator: VZp" 
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
resS=0._dp 
resD=0._dp 
 
mass(1) = MAh(i1) 
mass(2) = MAh(i1) 
m_in = MSv(iIN) 
coup(1) = Conjg(cplAhSvcSv(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFuFuAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuAhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fu cFu Propagator: Ah" 
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
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh(i1) 
mass(2) = Mhh(i1) 
m_in = MSv(iIN) 
coup(1) = Conjg(cplhhSvcSv(i1,gt1,iIN)) 
coup(3) = Conjg(cplcFuFuhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuhhR(gt3,gt2,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fu cFu Propagator: hh" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MVZ  
mass(2) = MVZp  
coup(1) = cplSvcSvVZ(gt1,iIN) 
coup(3) = Conjg(cplcFuFuVZL(gt3,gt2)) 
coup(2) = Conjg(cplcFuFuVZR(gt3,gt2))  
coup(4) = cplSvcSvVZp(gt1,iIN) 
coup(5) = Conjg(cplcFuFuVZpL(gt3,gt2)) 
coup(6) = Conjg(cplcFuFuVZpR(gt3,gt2)) 
Call IntegrateVaVb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fu cFu Propagator: VZ,VZp" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = MAh(i2)  
coup(1) = cplSvcSvVZ(gt1,iIN) 
coup(2) = Conjg(cplcFuFuVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFuFuVZR(gt3,gt2))  
coup(4) = cplAhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFuFuAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fu cFu Propagator: VZ,Ah" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZ  
mass(1) = Mhh(i2)  
coup(1) = cplSvcSvVZ(gt1,iIN) 
coup(2) = Conjg(cplcFuFuVZL(gt3,gt2)) 
coup(3) = Conjg(cplcFuFuVZR(gt3,gt2))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFuFuhhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fu cFu Propagator: VZ,hh" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = MAh(i2)  
coup(1) = cplSvcSvVZp(gt1,iIN) 
coup(2) = Conjg(cplcFuFuVZpL(gt3,gt2)) 
coup(3) = Conjg(cplcFuFuVZpR(gt3,gt2))  
coup(4) = cplAhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFuFuAhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fu cFu Propagator: VZp,Ah" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MVZp  
mass(1) = Mhh(i2)  
coup(1) = cplSvcSvVZp(gt1,iIN) 
coup(2) = Conjg(cplcFuFuVZpL(gt3,gt2)) 
coup(3) = Conjg(cplcFuFuVZpR(gt3,gt2))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(5) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup(6) = Conjg(cplcFuFuhhR(gt3,gt2,i2))  
If(Abs(mass(1)-mass(2)).lt.0.1) Then 
Call IntegrateVSGoldstone(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
Else 
Call IntegrateVS(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
End If 
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fu cFu Propagator: VZp,hh" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = MAh(i2)  
coup(1) = cplAhSvcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplcFuFuAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuAhR(gt3,gt2,i1))  
coup(4) = cplAhSvcSv(i2,gt1,iIN) 
coup(6) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuFuAhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fu cFu Propagator: Ah,Ah" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MAh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplAhSvcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplcFuFuAhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuAhR(gt3,gt2,i1))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(6) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuFuhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fu cFu Propagator: Ah,hh" 
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
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = Mhh(i1)  
mass(2) = Mhh(i2)  
coup(1) = cplhhSvcSv(i1,gt1,iIN) 
coup(3) = Conjg(cplcFuFuhhL(gt3,gt2,i1)) 
coup(2) = Conjg(cplcFuFuhhR(gt3,gt2,i1))  
coup(4) = cplhhSvcSv(i2,gt1,iIN) 
coup(6) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup(5) = Conjg(cplcFuFuhhR(gt3,gt2,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 3*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Sv->Sv Fu cFu Propagator: hh,hh" 
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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:196))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SvToSvFucFu 
 
 
End Module Sv3Decays_sec_UMSSM 
 
