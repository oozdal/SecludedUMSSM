! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 1:12 on 7.11.2019   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Cha_sec_UMSSM
Use Model_Data_sec_UMSSM 
Use Kinematics 
Use OneLoopDecay_Cha_sec_UMSSM 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Cha(MSdOS,MSd2OS,MSvOS,MSv2OS,MSuOS,MSu2OS,MSeOS,             & 
& MSe2OS,MhhOS,Mhh2OS,MAhOS,MAh2OS,MHpmOS,MHpm2OS,MChiOS,MChi2OS,MFvOS,MFv2OS,           & 
& MChaOS,MCha2OS,MFeOS,MFe2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MGluOS,MGlu2OS,MVZOS,            & 
& MVZpOS,MVZ2OS,MVZp2OS,MVWmOS,MVWm2OS,ZDOS,ZVOS,ZUOS,ZEOS,ZHOS,ZAOS,ZPOS,               & 
& ZNOS,ZVLOS,ZVROS,UMOS,UPOS,ZELOS,ZEROS,ZDLOS,ZDROS,ZULOS,ZUROS,MAh,MAh2,               & 
& MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,              & 
& Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,               & 
& MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,             & 
& ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,dg1,dg2,dg3,dgp,dSinQq,dCosQq,dTanQq,dSinQl,dCosQl,dTanQl,              & 
& dSinQHd,dCosQHd,dTanQHd,dSinQHu,dCosQHu,dTanQHu,dSinQd,dCosQd,dTanQd,dSinQu,           & 
& dCosQu,dTanQu,dSinQe,dCosQe,dTanQe,dSinQs,dCosQs,dTanQs,dSinQs1,dCosQs1,               & 
& dTanQs1,dSinQs2,dCosQs2,dTanQs2,dSinQs3,dCosQs3,dTanQs3,dSinQv,dCosQv,dTanQv,          & 
& dYd,dTd,dYe,dTe,dlam,dTlam,dYv,dTv,dkap,dTk,dYu,dTu,dmq2,dml2,dmHd2,dmHu2,             & 
& dmd2,dmu2,dme2,dms2,dms12,dms22,dms32,dmv2,dM1,dM2,dM3,dM4,dvd,dvu,dvS,dvS1,           & 
& dvS2,dvS3,dpG,dZD,dZV,dZU,dZE,dZH,dZA,dZP,dZN,dZVL,dZVR,dUM,dUP,dZEL,dZER,             & 
& dZDL,dZDR,dZUL,dZUR,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ZfVG,ZffG,            & 
& ZfVP,ZfVZ,ZfVZp,ZfVWm,ZfSd,ZfSv,ZfSu,ZfSe,Zfhh,ZfAh,ZfHpm,ZfL0,ZfFVL,ZfFVR,            & 
& ZfLm,ZfLp,ZfFEL,ZfFER,ZfFDL,ZfFDR,ZfFUL,ZfFUR,ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,           & 
& ZfVZVZp,ZfVZpVZ,cplAhAhAh,cplAhAhhh,cplAhcHpmVWm,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,       & 
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplcChacFuSdL,   & 
& cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,   & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFecSvL,cplcChaFecSvR,cplcFdChaSuL,cplcFdChaSuR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,          & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFeChaSvL,cplcFeChaSvR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,           & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,       & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplcFvChiSvL,cplcFvChiSvR,          & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvAhL,cplcFvFvAhR,       & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZpL,cplcFvFvVZpR,cplcFvFvVZR,             & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplChiChacHpmL,cplChiChacHpmR,     & 
& cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,         & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,       & 
& cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplhhcHpmVWm,cplhhcVWmVWm,         & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,       & 
& cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,              & 
& cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplHpmSucSd,cplHpmSvcSe,cplSdcHpmcSu,          & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSdcSucVWm,cplSecHpmcSv,cplSecSeVP,     & 
& cplSecSeVZ,cplSecSeVZp,cplSecSvcVWm,cplSucSdVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,      & 
& cplSucSuVZp,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,ctcplcChacFuSdL,ctcplcChacFuSdR,        & 
& ctcplcChacFvSeL,ctcplcChacFvSeR,ctcplcChaChaAhL,ctcplcChaChaAhR,ctcplcChaChahhL,       & 
& ctcplcChaChahhR,ctcplcChaChaVPL,ctcplcChaChaVPR,ctcplcChaChaVZL,ctcplcChaChaVZpL,      & 
& ctcplcChaChaVZpR,ctcplcChaChaVZR,ctcplcChaChiHpmL,ctcplcChaChiHpmR,ctcplcChaChiVWmL,   & 
& ctcplcChaChiVWmR,ctcplcChaFdcSuL,ctcplcChaFdcSuR,ctcplcChaFecSvL,ctcplcChaFecSvR,      & 
& GcplcChaChiHpmL,GcplcChaChiHpmR,GcplcHpmVPVWm,GcplHpmcVWmVP,GosZcplcChaChiHpmL,        & 
& GosZcplcChaChiHpmR,GosZcplcHpmVPVWm,GosZcplHpmcVWmVP,GZcplcChaChiHpmL,GZcplcChaChiHpmR,& 
& GZcplcHpmVPVWm,GZcplHpmcVWmVP,ZcplcChacFuSdL,ZcplcChacFuSdR,ZcplcChacFvSeL,            & 
& ZcplcChacFvSeR,ZcplcChaChaAhL,ZcplcChaChaAhR,ZcplcChaChahhL,ZcplcChaChahhR,            & 
& ZcplcChaChaVPL,ZcplcChaChaVPR,ZcplcChaChaVZL,ZcplcChaChaVZpL,ZcplcChaChaVZpR,          & 
& ZcplcChaChaVZR,ZcplcChaChiHpmL,ZcplcChaChiHpmR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,        & 
& ZcplcChaFdcSuL,ZcplcChaFdcSuR,ZcplcChaFecSvL,ZcplcChaFecSvR,ZcplcFdChaSuL,             & 
& ZcplcFdChaSuR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFeChaSvL,ZcplcFeChaSvR,ZcplcFeFeVPL,      & 
& ZcplcFeFeVPR,ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplChaFucSdL,ZcplChaFucSdR,ZcplChaFvcSeL,      & 
& ZcplChaFvcSeR,ZcplChiChacHpmL,ZcplChiChacHpmR,ZcplChiChacVWmL,ZcplChiChacVWmR,         & 
& ZcplcHpmVPVWm,ZcplcVWmVPVWm,ZcplHpmcHpmVP,ZcplHpmcVWmVP,ZcplSdcSdVP,ZcplSecSeVP,       & 
& ZcplSucSuVP,ZRUZD,ZRUZV,ZRUZU,ZRUZE,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUZVL,ZRUZVR,             & 
& ZRUUM,ZRUUP,ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,            & 
& kont,gP1LCha)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp),Intent(in) :: vd,vu,vS,vS1,vS2,vS3

Real(dp),Intent(in) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(in) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp),Intent(in) :: dg1,dg2,dg3,dgp,dSinQq,dCosQq,dTanQq,dSinQl,dCosQl,dTanQl,dSinQHd,dCosQHd,            & 
& dTanQHd,dSinQHu,dCosQHu,dTanQHu,dSinQd,dCosQd,dTanQd,dSinQu,dCosQu,dTanQu,             & 
& dSinQe,dCosQe,dTanQe,dSinQs,dCosQs,dTanQs,dSinQs1,dCosQs1,dTanQs1,dSinQs2,             & 
& dCosQs2,dTanQs2,dSinQs3,dCosQs3,dTanQs3,dSinQv,dCosQv,dTanQv,dmHd2,dmHu2,              & 
& dms2,dms12,dms22,dms32,dvd,dvu,dvS,dvS1,dvS2,dvS3,dZP(2,2),dSinTW,dCosTW,              & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp),Intent(in) :: dYd(3,3),dTd(3,3),dYe(3,3),dTe(3,3),dlam,dTlam,dYv(3,3),dTv(3,3),dkap,dTk,            & 
& dYu(3,3),dTu(3,3),dmq2(3,3),dml2(3,3),dmd2(3,3),dmu2(3,3),dme2(3,3),dmv2(3,3),         & 
& dM1,dM2,dM3,dM4,dpG,dZD(6,6),dZV(6,6),dZU(6,6),dZE(6,6),dZH(6,6),dZA(6,6),             & 
& dZN(9,9),dZVL(3,3),dZVR(3,3),dUM(2,2),dUP(2,2),dZEL(3,3),dZER(3,3),dZDL(3,3),          & 
& dZDR(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp),Intent(in) :: cplAhAhAh(6,6,6),cplAhAhhh(6,6,6),cplAhcHpmVWm(6,2),cplAhhhhh(6,6,6),cplAhhhVZ(6,6),  & 
& cplAhhhVZp(6,6),cplAhHpmcHpm(6,2,2),cplAhHpmcVWm(6,2),cplAhSdcSd(6,6,6),               & 
& cplAhSecSe(6,6,6),cplAhSucSu(6,6,6),cplAhSvcSv(6,6,6),cplcChacFuSdL(2,3,6),            & 
& cplcChacFuSdR(2,3,6),cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),cplcChaChaAhL(2,2,6),   & 
& cplcChaChaAhR(2,2,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),cplcChaChaVPL(2,2),     & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),         & 
& cplcChaChaVZR(2,2),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),    & 
& cplcChaChiVWmR(2,9),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFecSvL(2,3,6),    & 
& cplcChaFecSvR(2,3,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFdChiSdL(3,9,6),      & 
& cplcFdChiSdR(3,9,6),cplcFdFdAhL(3,3,6),cplcFdFdAhR(3,3,6),cplcFdFdhhL(3,3,6),          & 
& cplcFdFdhhR(3,3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),& 
& cplcFdFdVZL(3,3),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,2),& 
& cplcFdFuHpmR(3,3,2),cplcFdFuVWmL(3,3),cplcFdFuVWmR(3,3),cplcFdGluSdL(3,6),             & 
& cplcFdGluSdR(3,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),cplcFeChiSeL(3,9,6),         & 
& cplcFeChiSeR(3,9,6),cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6),cplcFeFehhL(3,3,6),          & 
& cplcFeFehhR(3,3,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZpL(3,3),& 
& cplcFeFeVZpR(3,3),cplcFeFeVZR(3,3),cplcFeFvHpmL(3,3,2),cplcFeFvHpmR(3,3,2),            & 
& cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcFuChiSuL(3,9,6),cplcFuChiSuR(3,9,6),           & 
& cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),       & 
& cplcFuFuAhL(3,3,6),cplcFuFuAhR(3,3,6),cplcFuFuhhL(3,3,6),cplcFuFuhhR(3,3,6),           & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcFuFuVZR(3,3),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),& 
& cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),cplcFvFecHpmL(3,3,2),cplcFvFecHpmR(3,3,2),     & 
& cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),           & 
& cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),cplcFvFvVZL(3,3),cplcFvFvVZpL(3,3),              & 
& cplcFvFvVZpR(3,3),cplcFvFvVZR(3,3),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),            & 
& cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),   & 
& cplChiChacVWmL(9,2),cplChiChacVWmR(9,2),cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),       & 
& cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),cplChiChiVZL(9,9),cplChiChiVZpL(9,9),          & 
& cplChiChiVZpR(9,9),cplChiChiVZR(9,9),cplChiFdcSdL(9,3,6),cplChiFdcSdR(9,3,6),          & 
& cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFucSuL(9,3,6),cplChiFucSuR(9,3,6),       & 
& cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),               & 
& cplcHpmVWmVZp(2),cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplGluFdcSdL(3,6),            & 
& cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplhhcHpmVWm(6,2),               & 
& cplhhcVWmVWm(6),cplhhhhhh(6,6,6),cplhhHpmcHpm(6,2,2),cplhhHpmcVWm(6,2),cplhhSdcSd(6,6,6),& 
& cplhhSecSe(6,6,6),cplhhSucSu(6,6,6),cplhhSvcSv(6,6,6),cplhhVZpVZp(6),cplhhVZVZ(6),     & 
& cplhhVZVZp(6),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),cplHpmcHpmVZp(2,2),cplHpmcVWmVP(2)

Complex(dp),Intent(in) :: cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),cplHpmSucSd(2,6,6),cplHpmSvcSe(2,6,6),cplSdcHpmcSu(6,2,6),& 
& cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplSdcSucVWm(6,6),    & 
& cplSecHpmcSv(6,2,6),cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSecSvcVWm(6,6),& 
& cplSucSdVWm(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6),     & 
& cplSvcSeVWm(6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),ctcplcChacFuSdL(2,3,6),              & 
& ctcplcChacFuSdR(2,3,6),ctcplcChacFvSeL(2,3,6),ctcplcChacFvSeR(2,3,6),ctcplcChaChaAhL(2,2,6),& 
& ctcplcChaChaAhR(2,2,6),ctcplcChaChahhL(2,2,6),ctcplcChaChahhR(2,2,6),ctcplcChaChaVPL(2,2),& 
& ctcplcChaChaVPR(2,2),ctcplcChaChaVZL(2,2),ctcplcChaChaVZpL(2,2),ctcplcChaChaVZpR(2,2), & 
& ctcplcChaChaVZR(2,2),ctcplcChaChiHpmL(2,9,2),ctcplcChaChiHpmR(2,9,2),ctcplcChaChiVWmL(2,9),& 
& ctcplcChaChiVWmR(2,9),ctcplcChaFdcSuL(2,3,6),ctcplcChaFdcSuR(2,3,6),ctcplcChaFecSvL(2,3,6),& 
& ctcplcChaFecSvR(2,3,6),GcplcChaChiHpmL(2,9,2),GcplcChaChiHpmR(2,9,2),GcplcHpmVPVWm(2), & 
& GcplHpmcVWmVP(2),GosZcplcChaChiHpmL(2,9,2),GosZcplcChaChiHpmR(2,9,2),GosZcplcHpmVPVWm(2),& 
& GosZcplHpmcVWmVP(2),GZcplcChaChiHpmL(2,9,2),GZcplcChaChiHpmR(2,9,2),GZcplcHpmVPVWm(2), & 
& GZcplHpmcVWmVP(2),ZcplcChacFuSdL(2,3,6),ZcplcChacFuSdR(2,3,6),ZcplcChacFvSeL(2,3,6),   & 
& ZcplcChacFvSeR(2,3,6),ZcplcChaChaAhL(2,2,6),ZcplcChaChaAhR(2,2,6),ZcplcChaChahhL(2,2,6),& 
& ZcplcChaChahhR(2,2,6),ZcplcChaChaVPL(2,2),ZcplcChaChaVPR(2,2),ZcplcChaChaVZL(2,2),     & 
& ZcplcChaChaVZpL(2,2),ZcplcChaChaVZpR(2,2),ZcplcChaChaVZR(2,2),ZcplcChaChiHpmL(2,9,2),  & 
& ZcplcChaChiHpmR(2,9,2),ZcplcChaChiVWmL(2,9),ZcplcChaChiVWmR(2,9),ZcplcChaFdcSuL(2,3,6),& 
& ZcplcChaFdcSuR(2,3,6),ZcplcChaFecSvL(2,3,6),ZcplcChaFecSvR(2,3,6),ZcplcFdChaSuL(3,2,6),& 
& ZcplcFdChaSuR(3,2,6),ZcplcFdFdVPL(3,3),ZcplcFdFdVPR(3,3),ZcplcFeChaSvL(3,2,6),         & 
& ZcplcFeChaSvR(3,2,6),ZcplcFeFeVPL(3,3),ZcplcFeFeVPR(3,3),ZcplcFuFuVPL(3,3),            & 
& ZcplcFuFuVPR(3,3),ZcplChaFucSdL(2,3,6),ZcplChaFucSdR(2,3,6),ZcplChaFvcSeL(2,3,6),      & 
& ZcplChaFvcSeR(2,3,6),ZcplChiChacHpmL(9,2,2),ZcplChiChacHpmR(9,2,2),ZcplChiChacVWmL(9,2),& 
& ZcplChiChacVWmR(9,2),ZcplcHpmVPVWm(2),ZcplcVWmVPVWm,ZcplHpmcHpmVP(2,2),ZcplHpmcVWmVP(2),& 
& ZcplSdcSdVP(6,6),ZcplSecSeVP(6,6),ZcplSucSuVP(6,6)

Real(dp), Intent(in) :: em, gs 
Complex(dp),Intent(in) :: ZfVG,ZffG,ZfVP,ZfVZ,ZfVZp,ZfVWm,ZfSd(6,6),ZfSv(6,6),ZfSu(6,6),ZfSe(6,6),              & 
& Zfhh(6,6),ZfAh(6,6),ZfHpm(2,2),ZfL0(9,9),ZfFVL(3,3),ZfFVR(3,3),ZfLm(2,2),              & 
& ZfLp(2,2),ZfFEL(3,3),ZfFER(3,3),ZfFDL(3,3),ZfFDR(3,3),ZfFUL(3,3),ZfFUR(3,3),           & 
& ZfVPVZ,ZfVZVP,ZfVPVZp,ZfVZpVP,ZfVZVZp,ZfVZpVZ

Real(dp),Intent(in) :: MSdOS(6),MSd2OS(6),MSvOS(6),MSv2OS(6),MSuOS(6),MSu2OS(6),MSeOS(6),MSe2OS(6),          & 
& MhhOS(6),Mhh2OS(6),MAhOS(6),MAh2OS(6),MHpmOS(2),MHpm2OS(2),MChiOS(9),MChi2OS(9),       & 
& MFvOS(3),MFv2OS(3),MChaOS(2),MCha2OS(2),MFeOS(3),MFe2OS(3),MFdOS(3),MFd2OS(3),         & 
& MFuOS(3),MFu2OS(3),MGluOS,MGlu2OS,MVZOS,MVZpOS,MVZ2OS,MVZp2OS,MVWmOS,MVWm2OS,ZPOS(2,2)

Complex(dp),Intent(in) :: ZDOS(6,6),ZVOS(6,6),ZUOS(6,6),ZEOS(6,6),ZHOS(6,6),ZAOS(6,6),ZNOS(9,9),ZVLOS(3,3),     & 
& ZVROS(3,3),UMOS(2,2),UPOS(2,2),ZELOS(3,3),ZEROS(3,3),ZDLOS(3,3),ZDROS(3,3),            & 
& ZULOS(3,3),ZUROS(3,3)

Complex(dp),Intent(in) :: ZRUZD(6,6),ZRUZV(6,6),ZRUZU(6,6),ZRUZE(6,6),ZRUZH(6,6),ZRUZA(6,6),ZRUZP(2,2),         & 
& ZRUZN(9,9),ZRUZVL(3,3),ZRUZVR(3,3),ZRUUM(2,2),ZRUUP(2,2),ZRUZEL(3,3),ZRUZER(3,3),      & 
& ZRUZDL(3,3),ZRUZDR(3,3),ZRUZUL(3,3),ZRUZUR(3,3)

Real(dp), Intent(in) :: MLambda, deltaM 
Real(dp), Intent(out) :: gP1LCha(2,116) 
Integer, Intent(out) :: kont 
Real(dp) :: MVG,MVP,MVG2,MVP2, helfactor, phasespacefactor 
Integer :: i1,i2,i3,i4, isave, gt1, gt2, gt3 

Complex(dp) :: ZRUZDc(6, 6) 
Complex(dp) :: ZRUZVc(6, 6) 
Complex(dp) :: ZRUZUc(6, 6) 
Complex(dp) :: ZRUZEc(6, 6) 
Complex(dp) :: ZRUZHc(6, 6) 
Complex(dp) :: ZRUZAc(6, 6) 
Complex(dp) :: ZRUZPc(2, 2) 
Complex(dp) :: ZRUZNc(9, 9) 
Complex(dp) :: ZRUZVLc(3, 3) 
Complex(dp) :: ZRUZVRc(3, 3) 
Complex(dp) :: ZRUUMc(2, 2) 
Complex(dp) :: ZRUUPc(2, 2) 
Complex(dp) :: ZRUZELc(3, 3) 
Complex(dp) :: ZRUZERc(3, 3) 
Complex(dp) :: ZRUZDLc(3, 3) 
Complex(dp) :: ZRUZDRc(3, 3) 
Complex(dp) :: ZRUZULc(3, 3) 
Complex(dp) :: ZRUZURc(3, 3) 
Real(dp) :: MRPChaToChaAh(2,2,6),MRGChaToChaAh(2,2,6), MRPZChaToChaAh(2,2,6),MRGZChaToChaAh(2,2,6) 
Real(dp) :: MVPChaToChaAh(2,2,6) 
Real(dp) :: RMsqTreeChaToChaAh(2,2,6),RMsqWaveChaToChaAh(2,2,6),RMsqVertexChaToChaAh(2,2,6) 
Complex(dp) :: AmpTreeChaToChaAh(2,2,2,6),AmpWaveChaToChaAh(2,2,2,6)=(0._dp,0._dp),AmpVertexChaToChaAh(2,2,2,6)& 
 & ,AmpVertexIRosChaToChaAh(2,2,2,6),AmpVertexIRdrChaToChaAh(2,2,2,6), AmpSumChaToChaAh(2,2,2,6), AmpSum2ChaToChaAh(2,2,2,6) 
Complex(dp) :: AmpTreeZChaToChaAh(2,2,2,6),AmpWaveZChaToChaAh(2,2,2,6),AmpVertexZChaToChaAh(2,2,2,6) 
Real(dp) :: AmpSqChaToChaAh(2,2,6),  AmpSqTreeChaToChaAh(2,2,6) 
Real(dp) :: MRPChaToChahh(2,2,6),MRGChaToChahh(2,2,6), MRPZChaToChahh(2,2,6),MRGZChaToChahh(2,2,6) 
Real(dp) :: MVPChaToChahh(2,2,6) 
Real(dp) :: RMsqTreeChaToChahh(2,2,6),RMsqWaveChaToChahh(2,2,6),RMsqVertexChaToChahh(2,2,6) 
Complex(dp) :: AmpTreeChaToChahh(2,2,2,6),AmpWaveChaToChahh(2,2,2,6)=(0._dp,0._dp),AmpVertexChaToChahh(2,2,2,6)& 
 & ,AmpVertexIRosChaToChahh(2,2,2,6),AmpVertexIRdrChaToChahh(2,2,2,6), AmpSumChaToChahh(2,2,2,6), AmpSum2ChaToChahh(2,2,2,6) 
Complex(dp) :: AmpTreeZChaToChahh(2,2,2,6),AmpWaveZChaToChahh(2,2,2,6),AmpVertexZChaToChahh(2,2,2,6) 
Real(dp) :: AmpSqChaToChahh(2,2,6),  AmpSqTreeChaToChahh(2,2,6) 
Real(dp) :: MRPChaToChaVZ(2,2),MRGChaToChaVZ(2,2), MRPZChaToChaVZ(2,2),MRGZChaToChaVZ(2,2) 
Real(dp) :: MVPChaToChaVZ(2,2) 
Real(dp) :: RMsqTreeChaToChaVZ(2,2),RMsqWaveChaToChaVZ(2,2),RMsqVertexChaToChaVZ(2,2) 
Complex(dp) :: AmpTreeChaToChaVZ(4,2,2),AmpWaveChaToChaVZ(4,2,2)=(0._dp,0._dp),AmpVertexChaToChaVZ(4,2,2)& 
 & ,AmpVertexIRosChaToChaVZ(4,2,2),AmpVertexIRdrChaToChaVZ(4,2,2), AmpSumChaToChaVZ(4,2,2), AmpSum2ChaToChaVZ(4,2,2) 
Complex(dp) :: AmpTreeZChaToChaVZ(4,2,2),AmpWaveZChaToChaVZ(4,2,2),AmpVertexZChaToChaVZ(4,2,2) 
Real(dp) :: AmpSqChaToChaVZ(2,2),  AmpSqTreeChaToChaVZ(2,2) 
Real(dp) :: MRPChaToChaVZp(2,2),MRGChaToChaVZp(2,2), MRPZChaToChaVZp(2,2),MRGZChaToChaVZp(2,2) 
Real(dp) :: MVPChaToChaVZp(2,2) 
Real(dp) :: RMsqTreeChaToChaVZp(2,2),RMsqWaveChaToChaVZp(2,2),RMsqVertexChaToChaVZp(2,2) 
Complex(dp) :: AmpTreeChaToChaVZp(4,2,2),AmpWaveChaToChaVZp(4,2,2)=(0._dp,0._dp),AmpVertexChaToChaVZp(4,2,2)& 
 & ,AmpVertexIRosChaToChaVZp(4,2,2),AmpVertexIRdrChaToChaVZp(4,2,2), AmpSumChaToChaVZp(4,2,2), AmpSum2ChaToChaVZp(4,2,2) 
Complex(dp) :: AmpTreeZChaToChaVZp(4,2,2),AmpWaveZChaToChaVZp(4,2,2),AmpVertexZChaToChaVZp(4,2,2) 
Real(dp) :: AmpSqChaToChaVZp(2,2),  AmpSqTreeChaToChaVZp(2,2) 
Real(dp) :: MRPChaToChiHpm(2,9,2),MRGChaToChiHpm(2,9,2), MRPZChaToChiHpm(2,9,2),MRGZChaToChiHpm(2,9,2) 
Real(dp) :: MVPChaToChiHpm(2,9,2) 
Real(dp) :: RMsqTreeChaToChiHpm(2,9,2),RMsqWaveChaToChiHpm(2,9,2),RMsqVertexChaToChiHpm(2,9,2) 
Complex(dp) :: AmpTreeChaToChiHpm(2,2,9,2),AmpWaveChaToChiHpm(2,2,9,2)=(0._dp,0._dp),AmpVertexChaToChiHpm(2,2,9,2)& 
 & ,AmpVertexIRosChaToChiHpm(2,2,9,2),AmpVertexIRdrChaToChiHpm(2,2,9,2), AmpSumChaToChiHpm(2,2,9,2), AmpSum2ChaToChiHpm(2,2,9,2) 
Complex(dp) :: AmpTreeZChaToChiHpm(2,2,9,2),AmpWaveZChaToChiHpm(2,2,9,2),AmpVertexZChaToChiHpm(2,2,9,2) 
Real(dp) :: AmpSqChaToChiHpm(2,9,2),  AmpSqTreeChaToChiHpm(2,9,2) 
Real(dp) :: MRPChaToChiVWm(2,9),MRGChaToChiVWm(2,9), MRPZChaToChiVWm(2,9),MRGZChaToChiVWm(2,9) 
Real(dp) :: MVPChaToChiVWm(2,9) 
Real(dp) :: RMsqTreeChaToChiVWm(2,9),RMsqWaveChaToChiVWm(2,9),RMsqVertexChaToChiVWm(2,9) 
Complex(dp) :: AmpTreeChaToChiVWm(4,2,9),AmpWaveChaToChiVWm(4,2,9)=(0._dp,0._dp),AmpVertexChaToChiVWm(4,2,9)& 
 & ,AmpVertexIRosChaToChiVWm(4,2,9),AmpVertexIRdrChaToChiVWm(4,2,9), AmpSumChaToChiVWm(4,2,9), AmpSum2ChaToChiVWm(4,2,9) 
Complex(dp) :: AmpTreeZChaToChiVWm(4,2,9),AmpWaveZChaToChiVWm(4,2,9),AmpVertexZChaToChiVWm(4,2,9) 
Real(dp) :: AmpSqChaToChiVWm(2,9),  AmpSqTreeChaToChiVWm(2,9) 
Real(dp) :: MRPChaToFdcSu(2,3,6),MRGChaToFdcSu(2,3,6), MRPZChaToFdcSu(2,3,6),MRGZChaToFdcSu(2,3,6) 
Real(dp) :: MVPChaToFdcSu(2,3,6) 
Real(dp) :: RMsqTreeChaToFdcSu(2,3,6),RMsqWaveChaToFdcSu(2,3,6),RMsqVertexChaToFdcSu(2,3,6) 
Complex(dp) :: AmpTreeChaToFdcSu(2,2,3,6),AmpWaveChaToFdcSu(2,2,3,6)=(0._dp,0._dp),AmpVertexChaToFdcSu(2,2,3,6)& 
 & ,AmpVertexIRosChaToFdcSu(2,2,3,6),AmpVertexIRdrChaToFdcSu(2,2,3,6), AmpSumChaToFdcSu(2,2,3,6), AmpSum2ChaToFdcSu(2,2,3,6) 
Complex(dp) :: AmpTreeZChaToFdcSu(2,2,3,6),AmpWaveZChaToFdcSu(2,2,3,6),AmpVertexZChaToFdcSu(2,2,3,6) 
Real(dp) :: AmpSqChaToFdcSu(2,3,6),  AmpSqTreeChaToFdcSu(2,3,6) 
Real(dp) :: MRPChaToFecSv(2,3,6),MRGChaToFecSv(2,3,6), MRPZChaToFecSv(2,3,6),MRGZChaToFecSv(2,3,6) 
Real(dp) :: MVPChaToFecSv(2,3,6) 
Real(dp) :: RMsqTreeChaToFecSv(2,3,6),RMsqWaveChaToFecSv(2,3,6),RMsqVertexChaToFecSv(2,3,6) 
Complex(dp) :: AmpTreeChaToFecSv(2,2,3,6),AmpWaveChaToFecSv(2,2,3,6)=(0._dp,0._dp),AmpVertexChaToFecSv(2,2,3,6)& 
 & ,AmpVertexIRosChaToFecSv(2,2,3,6),AmpVertexIRdrChaToFecSv(2,2,3,6), AmpSumChaToFecSv(2,2,3,6), AmpSum2ChaToFecSv(2,2,3,6) 
Complex(dp) :: AmpTreeZChaToFecSv(2,2,3,6),AmpWaveZChaToFecSv(2,2,3,6),AmpVertexZChaToFecSv(2,2,3,6) 
Real(dp) :: AmpSqChaToFecSv(2,3,6),  AmpSqTreeChaToFecSv(2,3,6) 
Real(dp) :: MRPChaTocFuSd(2,3,6),MRGChaTocFuSd(2,3,6), MRPZChaTocFuSd(2,3,6),MRGZChaTocFuSd(2,3,6) 
Real(dp) :: MVPChaTocFuSd(2,3,6) 
Real(dp) :: RMsqTreeChaTocFuSd(2,3,6),RMsqWaveChaTocFuSd(2,3,6),RMsqVertexChaTocFuSd(2,3,6) 
Complex(dp) :: AmpTreeChaTocFuSd(2,2,3,6),AmpWaveChaTocFuSd(2,2,3,6)=(0._dp,0._dp),AmpVertexChaTocFuSd(2,2,3,6)& 
 & ,AmpVertexIRosChaTocFuSd(2,2,3,6),AmpVertexIRdrChaTocFuSd(2,2,3,6), AmpSumChaTocFuSd(2,2,3,6), AmpSum2ChaTocFuSd(2,2,3,6) 
Complex(dp) :: AmpTreeZChaTocFuSd(2,2,3,6),AmpWaveZChaTocFuSd(2,2,3,6),AmpVertexZChaTocFuSd(2,2,3,6) 
Real(dp) :: AmpSqChaTocFuSd(2,3,6),  AmpSqTreeChaTocFuSd(2,3,6) 
Real(dp) :: MRPChaTocFvSe(2,3,6),MRGChaTocFvSe(2,3,6), MRPZChaTocFvSe(2,3,6),MRGZChaTocFvSe(2,3,6) 
Real(dp) :: MVPChaTocFvSe(2,3,6) 
Real(dp) :: RMsqTreeChaTocFvSe(2,3,6),RMsqWaveChaTocFvSe(2,3,6),RMsqVertexChaTocFvSe(2,3,6) 
Complex(dp) :: AmpTreeChaTocFvSe(2,2,3,6),AmpWaveChaTocFvSe(2,2,3,6)=(0._dp,0._dp),AmpVertexChaTocFvSe(2,2,3,6)& 
 & ,AmpVertexIRosChaTocFvSe(2,2,3,6),AmpVertexIRdrChaTocFvSe(2,2,3,6), AmpSumChaTocFvSe(2,2,3,6), AmpSum2ChaTocFvSe(2,2,3,6) 
Complex(dp) :: AmpTreeZChaTocFvSe(2,2,3,6),AmpWaveZChaTocFvSe(2,2,3,6),AmpVertexZChaTocFvSe(2,2,3,6) 
Real(dp) :: AmpSqChaTocFvSe(2,3,6),  AmpSqTreeChaTocFvSe(2,3,6) 
Real(dp) :: MRPChaToChaVP(2,2),MRGChaToChaVP(2,2), MRPZChaToChaVP(2,2),MRGZChaToChaVP(2,2) 
Real(dp) :: MVPChaToChaVP(2,2) 
Real(dp) :: RMsqTreeChaToChaVP(2,2),RMsqWaveChaToChaVP(2,2),RMsqVertexChaToChaVP(2,2) 
Complex(dp) :: AmpTreeChaToChaVP(4,2,2),AmpWaveChaToChaVP(4,2,2)=(0._dp,0._dp),AmpVertexChaToChaVP(4,2,2)& 
 & ,AmpVertexIRosChaToChaVP(4,2,2),AmpVertexIRdrChaToChaVP(4,2,2), AmpSumChaToChaVP(4,2,2), AmpSum2ChaToChaVP(4,2,2) 
Complex(dp) :: AmpTreeZChaToChaVP(4,2,2),AmpWaveZChaToChaVP(4,2,2),AmpVertexZChaToChaVP(4,2,2) 
Real(dp) :: AmpSqChaToChaVP(2,2),  AmpSqTreeChaToChaVP(2,2) 
Write(*,*) "Calculating one-loop decays of Cha " 
kont = 0 
MVG = MLambda 
MVP = MLambda 
MVG2 = MLambda**2 
MVP2 = MLambda**2 

ZRUZDc = Conjg(ZRUZD)
ZRUZVc = Conjg(ZRUZV)
ZRUZUc = Conjg(ZRUZU)
ZRUZEc = Conjg(ZRUZE)
ZRUZHc = Conjg(ZRUZH)
ZRUZAc = Conjg(ZRUZA)
ZRUZPc = Conjg(ZRUZP)
ZRUZNc = Conjg(ZRUZN)
ZRUZVLc = Conjg(ZRUZVL)
ZRUZVRc = Conjg(ZRUZVR)
ZRUUMc = Conjg(ZRUUM)
ZRUUPc = Conjg(ZRUUP)
ZRUZELc = Conjg(ZRUZEL)
ZRUZERc = Conjg(ZRUZER)
ZRUZDLc = Conjg(ZRUZDL)
ZRUZDRc = Conjg(ZRUZDR)
ZRUZULc = Conjg(ZRUZUL)
ZRUZURc = Conjg(ZRUZUR)

 ! Counter 
isave = 1 

If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Cha Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_ChaToChaAh(cplcChaChaAhL,cplcChaChaAhR,MAh,             & 
& MCha,MAh2,MCha2,AmpTreeChaToChaAh)

  Else 
Call Amplitude_Tree_sec_UMSSM_ChaToChaAh(ZcplcChaChaAhL,ZcplcChaChaAhR,               & 
& MAh,MCha,MAh2,MCha2,AmpTreeChaToChaAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToChaAh(MLambda,em,gs,cplcChaChaAhL,cplcChaChaAhR,       & 
& MAhOS,MChaOS,MRPChaToChaAh,MRGChaToChaAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToChaAh(MLambda,em,gs,ZcplcChaChaAhL,ZcplcChaChaAhR,     & 
& MAhOS,MChaOS,MRPChaToChaAh,MRGChaToChaAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_ChaToChaAh(MLambda,em,gs,cplcChaChaAhL,cplcChaChaAhR,       & 
& MAh,MCha,MRPChaToChaAh,MRGChaToChaAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToChaAh(MLambda,em,gs,ZcplcChaChaAhL,ZcplcChaChaAhR,     & 
& MAh,MCha,MRPChaToChaAh,MRGChaToChaAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChaToChaAh(cplcChaChaAhL,cplcChaChaAhR,ctcplcChaChaAhL, & 
& ctcplcChaChaAhR,MAh,MAh2,MCha,MCha2,ZfAh,ZfLm,ZfLp,AmpWaveChaToChaAh)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChaToChaAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,         & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,               & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,       & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,             & 
& cplcChaFdcSuR,cplcChaFecSvL,cplcChaFecSvR,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,   & 
& cplcChacFvSeR,AmpVertexChaToChaAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaAh(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,              & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,               & 
& cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,           & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,       & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,             & 
& cplcChaFdcSuR,cplcChaFecSvL,cplcChaFecSvR,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,   & 
& cplcChacFvSeR,AmpVertexIRdrChaToChaAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaAh(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,           & 
& ZcplcChaChaAhL,ZcplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,       & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,               & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,       & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,             & 
& cplcChaFdcSuR,cplcChaFecSvL,cplcChaFecSvR,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,   & 
& cplcChacFvSeR,AmpVertexIRosChaToChaAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaAh(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,              & 
& cplAhAhhh,ZcplcChaChaAhL,ZcplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,               & 
& cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,           & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,       & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,             & 
& cplcChaFdcSuR,cplcChaFecSvL,cplcChaFecSvR,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,   & 
& cplcChacFvSeR,AmpVertexIRosChaToChaAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaAh(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,           & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,               & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,       & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,             & 
& cplcChaFdcSuR,cplcChaFecSvL,cplcChaFecSvR,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,   & 
& cplcChacFvSeR,AmpVertexIRosChaToChaAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaAh(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,              & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,               & 
& cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,           & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,       & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,             & 
& cplcChaFdcSuR,cplcChaFecSvL,cplcChaFecSvR,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,   & 
& cplcChacFvSeR,AmpVertexIRosChaToChaAh)

 End if 
 End if 
AmpVertexChaToChaAh = AmpVertexChaToChaAh -  AmpVertexIRdrChaToChaAh! +  AmpVertexIRosChaToChaAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChaAh=0._dp 
AmpVertexZChaToChaAh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChaAh(1,gt2,:,:) = AmpWaveZChaToChaAh(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChaAh(1,gt1,:,:) 
AmpVertexZChaToChaAh(1,gt2,:,:)= AmpVertexZChaToChaAh(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChaAh(1,gt1,:,:) 
AmpWaveZChaToChaAh(2,gt2,:,:) = AmpWaveZChaToChaAh(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChaAh(2,gt1,:,:) 
AmpVertexZChaToChaAh(2,gt2,:,:)= AmpVertexZChaToChaAh(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChaAh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToChaAh=AmpWaveZChaToChaAh 
AmpVertexChaToChaAh= AmpVertexZChaToChaAh
! Final State 1 
AmpWaveZChaToChaAh=0._dp 
AmpVertexZChaToChaAh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChaAh(1,:,gt2,:) = AmpWaveZChaToChaAh(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpWaveChaToChaAh(1,:,gt1,:) 
AmpVertexZChaToChaAh(1,:,gt2,:)= AmpVertexZChaToChaAh(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpVertexChaToChaAh(1,:,gt1,:) 
AmpWaveZChaToChaAh(2,:,gt2,:) = AmpWaveZChaToChaAh(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpWaveChaToChaAh(2,:,gt1,:) 
AmpVertexZChaToChaAh(2,:,gt2,:)= AmpVertexZChaToChaAh(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpVertexChaToChaAh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChaAh=AmpWaveZChaToChaAh 
AmpVertexChaToChaAh= AmpVertexZChaToChaAh
! Final State 2 
AmpWaveZChaToChaAh=0._dp 
AmpVertexZChaToChaAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChaToChaAh(:,:,:,gt2) = AmpWaveZChaToChaAh(:,:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveChaToChaAh(:,:,:,gt1) 
AmpVertexZChaToChaAh(:,:,:,gt2)= AmpVertexZChaToChaAh(:,:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexChaToChaAh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChaAh=AmpWaveZChaToChaAh 
AmpVertexChaToChaAh= AmpVertexZChaToChaAh
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChaAh = AmpVertexChaToChaAh  +  AmpVertexIRosChaToChaAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Cha Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChaAh = AmpTreeChaToChaAh 
 AmpSum2ChaToChaAh = AmpTreeChaToChaAh + 2._dp*AmpWaveChaToChaAh + 2._dp*AmpVertexChaToChaAh  
Else 
 AmpSumChaToChaAh = AmpTreeChaToChaAh + AmpWaveChaToChaAh + AmpVertexChaToChaAh
 AmpSum2ChaToChaAh = AmpTreeChaToChaAh + AmpWaveChaToChaAh + AmpVertexChaToChaAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChaAh = AmpTreeChaToChaAh
 AmpSum2ChaToChaAh = AmpTreeChaToChaAh 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
    Do gt3=3,6
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MChaOS(gt2))+Abs(MAhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MCha(gt2))+Abs(MAh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToChaAh = AmpTreeChaToChaAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChaAh(gt1, gt2, gt3) 
  AmpSum2ChaToChaAh = 2._dp*AmpWaveChaToChaAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChaAh(gt1, gt2, gt3) 
  AmpSum2ChaToChaAh = 2._dp*AmpVertexChaToChaAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChaAh(gt1, gt2, gt3) 
  AmpSum2ChaToChaAh = AmpTreeChaToChaAh + 2._dp*AmpWaveChaToChaAh + 2._dp*AmpVertexChaToChaAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChaAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChaAh = AmpTreeChaToChaAh
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
  AmpSqTreeChaToChaAh(gt1, gt2, gt3) = AmpSqChaToChaAh(gt1, gt2, gt3)  
  AmpSum2ChaToChaAh = + 2._dp*AmpWaveChaToChaAh + 2._dp*AmpVertexChaToChaAh
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
  AmpSqChaToChaAh(gt1, gt2, gt3) = AmpSqChaToChaAh(gt1, gt2, gt3) + AmpSqTreeChaToChaAh(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToChaAh = AmpTreeChaToChaAh
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
  AmpSqTreeChaToChaAh(gt1, gt2, gt3) = AmpSqChaToChaAh(gt1, gt2, gt3)  
  AmpSum2ChaToChaAh = + 2._dp*AmpWaveChaToChaAh + 2._dp*AmpVertexChaToChaAh
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),MAh(gt3),AmpSumChaToChaAh(:,gt1, gt2, gt3),AmpSum2ChaToChaAh(:,gt1, gt2, gt3),AmpSqChaToChaAh(gt1, gt2, gt3)) 
  AmpSqChaToChaAh(gt1, gt2, gt3) = AmpSqChaToChaAh(gt1, gt2, gt3) + AmpSqTreeChaToChaAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToChaAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChaAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChaOS(gt2),MAhOS(gt3),helfactor*AmpSqChaToChaAh(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MCha(gt2),MAh(gt3),helfactor*AmpSqChaToChaAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToChaAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChaAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChaAh(gt1, gt2, gt3) + MRGChaToChaAh(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChaAh(gt1, gt2, gt3) + MRGChaToChaAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Cha hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_ChaToChahh(cplcChaChahhL,cplcChaChahhR,MCha,            & 
& Mhh,MCha2,Mhh2,AmpTreeChaToChahh)

  Else 
Call Amplitude_Tree_sec_UMSSM_ChaToChahh(ZcplcChaChahhL,ZcplcChaChahhR,               & 
& MCha,Mhh,MCha2,Mhh2,AmpTreeChaToChahh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToChahh(MLambda,em,gs,cplcChaChahhL,cplcChaChahhR,       & 
& MChaOS,MhhOS,MRPChaToChahh,MRGChaToChahh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToChahh(MLambda,em,gs,ZcplcChaChahhL,ZcplcChaChahhR,     & 
& MChaOS,MhhOS,MRPChaToChahh,MRGChaToChahh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_ChaToChahh(MLambda,em,gs,cplcChaChahhL,cplcChaChahhR,       & 
& MCha,Mhh,MRPChaToChahh,MRGChaToChahh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToChahh(MLambda,em,gs,ZcplcChaChahhL,ZcplcChaChahhR,     & 
& MCha,Mhh,MRPChaToChahh,MRGChaToChahh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChaToChahh(cplcChaChahhL,cplcChaChahhR,ctcplcChaChahhL, & 
& ctcplcChaChahhR,MCha,MCha2,Mhh,Mhh2,Zfhh,ZfLm,ZfLp,AmpWaveChaToChahh)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChaToChahh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,            & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,       & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,cplcFvFvhhR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFuSdL,              & 
& cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,AmpVertexChaToChahh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChahh(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,              & 
& cplcChaChaAhL,cplcChaChaAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,             & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,       & 
& cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,   & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcChaFecSvL,cplcChaFecSvR,cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,           & 
& cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,      & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFuSdL,   & 
& cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,AmpVertexIRdrChaToChahh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChahh(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,       & 
& cplcChaChaAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,            & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,     & 
& ZcplcChaChahhL,ZcplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,     & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,cplcFvFvhhR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFuSdL,              & 
& cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,AmpVertexIRosChaToChahh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChahh(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,              & 
& cplcChaChaAhL,cplcChaChaAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,             & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,   & 
& cplChaFvcSeR,ZcplcChaChahhL,ZcplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,     & 
& cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,   & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcChaFecSvL,cplcChaFecSvR,cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,           & 
& cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,      & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFuSdL,   & 
& cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,AmpVertexIRosChaToChahh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChahh(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplcChaChaAhL,       & 
& cplcChaChaAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,            & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,       & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,cplcFvFvhhR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFuSdL,              & 
& cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,AmpVertexIRosChaToChahh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChahh(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,              & 
& cplcChaChaAhL,cplcChaChaAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,             & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,       & 
& cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,   & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcChaFecSvL,cplcChaFecSvR,cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,           & 
& cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,      & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFuSdL,   & 
& cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,AmpVertexIRosChaToChahh)

 End if 
 End if 
AmpVertexChaToChahh = AmpVertexChaToChahh -  AmpVertexIRdrChaToChahh! +  AmpVertexIRosChaToChahh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChahh=0._dp 
AmpVertexZChaToChahh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChahh(1,gt2,:,:) = AmpWaveZChaToChahh(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChahh(1,gt1,:,:) 
AmpVertexZChaToChahh(1,gt2,:,:)= AmpVertexZChaToChahh(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChahh(1,gt1,:,:) 
AmpWaveZChaToChahh(2,gt2,:,:) = AmpWaveZChaToChahh(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChahh(2,gt1,:,:) 
AmpVertexZChaToChahh(2,gt2,:,:)= AmpVertexZChaToChahh(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChahh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToChahh=AmpWaveZChaToChahh 
AmpVertexChaToChahh= AmpVertexZChaToChahh
! Final State 1 
AmpWaveZChaToChahh=0._dp 
AmpVertexZChaToChahh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChahh(1,:,gt2,:) = AmpWaveZChaToChahh(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpWaveChaToChahh(1,:,gt1,:) 
AmpVertexZChaToChahh(1,:,gt2,:)= AmpVertexZChaToChahh(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpVertexChaToChahh(1,:,gt1,:) 
AmpWaveZChaToChahh(2,:,gt2,:) = AmpWaveZChaToChahh(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpWaveChaToChahh(2,:,gt1,:) 
AmpVertexZChaToChahh(2,:,gt2,:)= AmpVertexZChaToChahh(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpVertexChaToChahh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChahh=AmpWaveZChaToChahh 
AmpVertexChaToChahh= AmpVertexZChaToChahh
! Final State 2 
AmpWaveZChaToChahh=0._dp 
AmpVertexZChaToChahh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChaToChahh(:,:,:,gt2) = AmpWaveZChaToChahh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveChaToChahh(:,:,:,gt1) 
AmpVertexZChaToChahh(:,:,:,gt2)= AmpVertexZChaToChahh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexChaToChahh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChahh=AmpWaveZChaToChahh 
AmpVertexChaToChahh= AmpVertexZChaToChahh
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChahh = AmpVertexChaToChahh  +  AmpVertexIRosChaToChahh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Cha hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChahh = AmpTreeChaToChahh 
 AmpSum2ChaToChahh = AmpTreeChaToChahh + 2._dp*AmpWaveChaToChahh + 2._dp*AmpVertexChaToChahh  
Else 
 AmpSumChaToChahh = AmpTreeChaToChahh + AmpWaveChaToChahh + AmpVertexChaToChahh
 AmpSum2ChaToChahh = AmpTreeChaToChahh + AmpWaveChaToChahh + AmpVertexChaToChahh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChahh = AmpTreeChaToChahh
 AmpSum2ChaToChahh = AmpTreeChaToChahh 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MChaOS(gt2))+Abs(MhhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MCha(gt2))+Abs(Mhh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToChahh = AmpTreeChaToChahh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChahh(gt1, gt2, gt3) 
  AmpSum2ChaToChahh = 2._dp*AmpWaveChaToChahh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChahh(gt1, gt2, gt3) 
  AmpSum2ChaToChahh = 2._dp*AmpVertexChaToChahh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChahh(gt1, gt2, gt3) 
  AmpSum2ChaToChahh = AmpTreeChaToChahh + 2._dp*AmpWaveChaToChahh + 2._dp*AmpVertexChaToChahh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChahh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChahh = AmpTreeChaToChahh
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
  AmpSqTreeChaToChahh(gt1, gt2, gt3) = AmpSqChaToChahh(gt1, gt2, gt3)  
  AmpSum2ChaToChahh = + 2._dp*AmpWaveChaToChahh + 2._dp*AmpVertexChaToChahh
  Call SquareAmp_FtoFS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
  AmpSqChaToChahh(gt1, gt2, gt3) = AmpSqChaToChahh(gt1, gt2, gt3) + AmpSqTreeChaToChahh(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToChahh = AmpTreeChaToChahh
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
  AmpSqTreeChaToChahh(gt1, gt2, gt3) = AmpSqChaToChahh(gt1, gt2, gt3)  
  AmpSum2ChaToChahh = + 2._dp*AmpWaveChaToChahh + 2._dp*AmpVertexChaToChahh
  Call SquareAmp_FtoFS(MCha(gt1),MCha(gt2),Mhh(gt3),AmpSumChaToChahh(:,gt1, gt2, gt3),AmpSum2ChaToChahh(:,gt1, gt2, gt3),AmpSqChaToChahh(gt1, gt2, gt3)) 
  AmpSqChaToChahh(gt1, gt2, gt3) = AmpSqChaToChahh(gt1, gt2, gt3) + AmpSqTreeChaToChahh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToChahh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChahh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChaOS(gt2),MhhOS(gt3),helfactor*AmpSqChaToChahh(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MCha(gt2),Mhh(gt3),helfactor*AmpSqChaToChahh(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToChahh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChahh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChahh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChahh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChahh(gt1, gt2, gt3) + MRGChaToChahh(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChahh(gt1, gt2, gt3) + MRGChaToChahh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Cha VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_ChaToChaVZ(cplcChaChaVZL,cplcChaChaVZR,MCha,            & 
& MVZ,MCha2,MVZ2,AmpTreeChaToChaVZ)

  Else 
Call Amplitude_Tree_sec_UMSSM_ChaToChaVZ(ZcplcChaChaVZL,ZcplcChaChaVZR,               & 
& MCha,MVZ,MCha2,MVZ2,AmpTreeChaToChaVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToChaVZ(MLambda,em,gs,cplcChaChaVZL,cplcChaChaVZR,       & 
& MChaOS,MVZOS,MRPChaToChaVZ,MRGChaToChaVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToChaVZ(MLambda,em,gs,ZcplcChaChaVZL,ZcplcChaChaVZR,     & 
& MChaOS,MVZOS,MRPChaToChaVZ,MRGChaToChaVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_ChaToChaVZ(MLambda,em,gs,cplcChaChaVZL,cplcChaChaVZR,       & 
& MCha,MVZ,MRPChaToChaVZ,MRGChaToChaVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToChaVZ(MLambda,em,gs,ZcplcChaChaVZL,ZcplcChaChaVZR,     & 
& MCha,MVZ,MRPChaToChaVZ,MRGChaToChaVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChaToChaVZ(cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,   & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,ctcplcChaChaVPL,ctcplcChaChaVPR,           & 
& ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChaVZpL,ctcplcChaChaVZpR,MCha,MCha2,          & 
& MVP,MVP2,MVZ,MVZ2,ZfLm,ZfLp,ZfVPVZ,ZfVZ,ZfVZpVZ,AmpWaveChaToChaVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChaToChaVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,               & 
& cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,   & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZL,cplChiChiVZR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFecSvL,         & 
& cplcChaFecSvR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplhhVZVZ,               & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,           & 
& cplSecSeVZ,cplcChacFvSeL,cplcChacFvSeR,cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,             & 
& cplcVWmVWmVZ,AmpVertexChaToChaVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaVZ(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,   & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZL,cplChiChiVZR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFecSvL,         & 
& cplcChaFecSvR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplhhVZVZ,               & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,           & 
& cplSecSeVZ,cplcChacFvSeL,cplcChacFvSeR,cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,             & 
& cplcVWmVWmVZ,AmpVertexIRdrChaToChaVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaVZ(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,    & 
& cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,       & 
& cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,ZcplcChaChaVZL,     & 
& ZcplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL, & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFecSvL,cplcChaFecSvR,cplcFuFuVZL,         & 
& cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,    & 
& cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,cplSecSeVZ,cplcChacFvSeL,cplcChacFvSeR,         & 
& cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosChaToChaVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaVZ(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,   & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,       & 
& ZcplcChaChaVZL,ZcplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZL,              & 
& cplChiChiVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,              & 
& cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFeVZL,cplcFeFeVZR,           & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,           & 
& cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplcChacFuSdL,               & 
& cplcChacFuSdR,cplSecSeVZ,cplcChacFvSeL,cplcChacFvSeR,cplSucSuVZ,cplSvcSvVZ,            & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosChaToChaVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaVZ(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,    & 
& cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,       & 
& cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZL,cplChiChiVZR,cplcChaChiHpmL,  & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFecSvL,cplcChaFecSvR,cplcFuFuVZL,         & 
& cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,    & 
& cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,cplSecSeVZ,cplcChacFvSeL,cplcChacFvSeR,         & 
& cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,AmpVertexIRosChaToChaVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaVZ(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,   & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZL,cplChiChiVZR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFecSvL,         & 
& cplcChaFecSvR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplhhVZVZ,               & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,           & 
& cplSecSeVZ,cplcChacFvSeL,cplcChacFvSeR,cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,             & 
& cplcVWmVWmVZ,AmpVertexIRosChaToChaVZ)

 End if 
 End if 
AmpVertexChaToChaVZ = AmpVertexChaToChaVZ -  AmpVertexIRdrChaToChaVZ! +  AmpVertexIRosChaToChaVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChaVZ=0._dp 
AmpVertexZChaToChaVZ=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChaVZ(1,gt2,:) = AmpWaveZChaToChaVZ(1,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChaVZ(1,gt1,:) 
AmpVertexZChaToChaVZ(1,gt2,:)= AmpVertexZChaToChaVZ(1,gt2,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChaVZ(1,gt1,:) 
AmpWaveZChaToChaVZ(2,gt2,:) = AmpWaveZChaToChaVZ(2,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChaVZ(2,gt1,:) 
AmpVertexZChaToChaVZ(2,gt2,:)= AmpVertexZChaToChaVZ(2,gt2,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChaVZ(2,gt1,:) 
AmpWaveZChaToChaVZ(3,gt2,:) = AmpWaveZChaToChaVZ(3,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChaVZ(3,gt1,:) 
AmpVertexZChaToChaVZ(3,gt2,:)= AmpVertexZChaToChaVZ(3,gt2,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChaVZ(3,gt1,:) 
AmpWaveZChaToChaVZ(4,gt2,:) = AmpWaveZChaToChaVZ(4,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChaVZ(4,gt1,:) 
AmpVertexZChaToChaVZ(4,gt2,:)= AmpVertexZChaToChaVZ(4,gt2,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChaVZ(4,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChaVZ=AmpWaveZChaToChaVZ 
AmpVertexChaToChaVZ= AmpVertexZChaToChaVZ
! Final State 1 
AmpWaveZChaToChaVZ=0._dp 
AmpVertexZChaToChaVZ=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChaVZ(1,:,gt2) = AmpWaveZChaToChaVZ(1,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveChaToChaVZ(1,:,gt1) 
AmpVertexZChaToChaVZ(1,:,gt2)= AmpVertexZChaToChaVZ(1,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexChaToChaVZ(1,:,gt1) 
AmpWaveZChaToChaVZ(2,:,gt2) = AmpWaveZChaToChaVZ(2,:,gt2)+ZRUUPc(gt2,gt1)*AmpWaveChaToChaVZ(2,:,gt1) 
AmpVertexZChaToChaVZ(2,:,gt2)= AmpVertexZChaToChaVZ(2,:,gt2)+ZRUUPc(gt2,gt1)*AmpVertexChaToChaVZ(2,:,gt1) 
AmpWaveZChaToChaVZ(3,:,gt2) = AmpWaveZChaToChaVZ(3,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveChaToChaVZ(3,:,gt1) 
AmpVertexZChaToChaVZ(3,:,gt2)= AmpVertexZChaToChaVZ(3,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexChaToChaVZ(3,:,gt1) 
AmpWaveZChaToChaVZ(4,:,gt2) = AmpWaveZChaToChaVZ(4,:,gt2)+ZRUUPc(gt2,gt1)*AmpWaveChaToChaVZ(4,:,gt1) 
AmpVertexZChaToChaVZ(4,:,gt2)= AmpVertexZChaToChaVZ(4,:,gt2)+ZRUUPc(gt2,gt1)*AmpVertexChaToChaVZ(4,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChaVZ=AmpWaveZChaToChaVZ 
AmpVertexChaToChaVZ= AmpVertexZChaToChaVZ
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChaVZ = AmpVertexChaToChaVZ  +  AmpVertexIRosChaToChaVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Cha VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChaVZ = AmpTreeChaToChaVZ 
 AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ + 2._dp*AmpWaveChaToChaVZ + 2._dp*AmpVertexChaToChaVZ  
Else 
 AmpSumChaToChaVZ = AmpTreeChaToChaVZ + AmpWaveChaToChaVZ + AmpVertexChaToChaVZ
 AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ + AmpWaveChaToChaVZ + AmpVertexChaToChaVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChaVZ = AmpTreeChaToChaVZ
 AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MChaOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MCha(gt2))+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChaVZ(gt1, gt2) 
  AmpSum2ChaToChaVZ = 2._dp*AmpWaveChaToChaVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChaVZ(gt1, gt2) 
  AmpSum2ChaToChaVZ = 2._dp*AmpVertexChaToChaVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChaVZ(gt1, gt2) 
  AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ + 2._dp*AmpWaveChaToChaVZ + 2._dp*AmpVertexChaToChaVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChaVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
  AmpSqTreeChaToChaVZ(gt1, gt2) = AmpSqChaToChaVZ(gt1, gt2)  
  AmpSum2ChaToChaVZ = + 2._dp*AmpWaveChaToChaVZ + 2._dp*AmpVertexChaToChaVZ
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZOS,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
  AmpSqChaToChaVZ(gt1, gt2) = AmpSqChaToChaVZ(gt1, gt2) + AmpSqTreeChaToChaVZ(gt1, gt2)  
Else  
  AmpSum2ChaToChaVZ = AmpTreeChaToChaVZ
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
  AmpSqTreeChaToChaVZ(gt1, gt2) = AmpSqChaToChaVZ(gt1, gt2)  
  AmpSum2ChaToChaVZ = + 2._dp*AmpWaveChaToChaVZ + 2._dp*AmpVertexChaToChaVZ
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZ,AmpSumChaToChaVZ(:,gt1, gt2),AmpSum2ChaToChaVZ(:,gt1, gt2),AmpSqChaToChaVZ(gt1, gt2)) 
  AmpSqChaToChaVZ(gt1, gt2) = AmpSqChaToChaVZ(gt1, gt2) + AmpSqTreeChaToChaVZ(gt1, gt2)  
End if  
Else  
  AmpSqChaToChaVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChaVZ(gt1, gt2).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChaOS(gt2),MVZOS,helfactor*AmpSqChaToChaVZ(gt1, gt2))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MCha(gt2),MVZ,helfactor*AmpSqChaToChaVZ(gt1, gt2))
End if 
If ((Abs(MRPChaToChaVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChaVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChaVZ(gt1, gt2) + MRGChaToChaVZ(gt1, gt2)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChaVZ(gt1, gt2) + MRGChaToChaVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Cha VZp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_ChaToChaVZp(cplcChaChaVZpL,cplcChaChaVZpR,              & 
& MCha,MVZp,MCha2,MVZp2,AmpTreeChaToChaVZp)

  Else 
Call Amplitude_Tree_sec_UMSSM_ChaToChaVZp(ZcplcChaChaVZpL,ZcplcChaChaVZpR,            & 
& MCha,MVZp,MCha2,MVZp2,AmpTreeChaToChaVZp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToChaVZp(MLambda,em,gs,cplcChaChaVZpL,cplcChaChaVZpR,    & 
& MChaOS,MVZpOS,MRPChaToChaVZp,MRGChaToChaVZp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToChaVZp(MLambda,em,gs,ZcplcChaChaVZpL,ZcplcChaChaVZpR,  & 
& MChaOS,MVZpOS,MRPChaToChaVZp,MRGChaToChaVZp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_ChaToChaVZp(MLambda,em,gs,cplcChaChaVZpL,cplcChaChaVZpR,    & 
& MCha,MVZp,MRPChaToChaVZp,MRGChaToChaVZp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToChaVZp(MLambda,em,gs,ZcplcChaChaVZpL,ZcplcChaChaVZpR,  & 
& MCha,MVZp,MRPChaToChaVZp,MRGChaToChaVZp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChaToChaVZp(cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,  & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,ctcplcChaChaVPL,ctcplcChaChaVPR,           & 
& ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChaVZpL,ctcplcChaChaVZpR,MCha,MCha2,          & 
& MVP,MVP2,MVZp,MVZp2,ZfLm,ZfLp,ZfVPVZp,ZfVZp,ZfVZVZp,AmpWaveChaToChaVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChaToChaVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,               & 
& cplcChaChaAhR,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,  & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,               & 
& cplChiChiVZpR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFeVZpL,cplcFeFeVZpR,       & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvVZpL,cplcFvFvVZpR,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplcChacFuSdL,          & 
& cplcChacFuSdR,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSucSuVZp,cplSvcSvVZp,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexChaToChaVZp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaVZp(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,  & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,               & 
& cplChiChiVZpR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFeVZpL,cplcFeFeVZpR,       & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvVZpL,cplcFvFvVZpR,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplcChacFuSdL,          & 
& cplcChacFuSdR,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSucSuVZp,cplSvcSvVZp,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexIRdrChaToChaVZp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaVZp(MAhOS,MChaOS,MChiOS,MFdOS,             & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,   & 
& cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,       & 
& cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,ZcplcChaChaVZpL,ZcplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,             & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,      & 
& cplcChaFecSvR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvVZpL,cplcFvFvVZpR,cplhhVZVZp,          & 
& cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSucSuVZp,cplSvcSvVZp,cplcHpmVWmVZp,         & 
& cplcVWmVWmVZp,AmpVertexIRosChaToChaVZp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaVZp(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,  & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcChaChaVZL,cplcChaChaVZR,ZcplcChaChaVZpL,ZcplcChaChaVZpR,cplChiChiVZpL,             & 
& cplChiChiVZpR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFeVZpL,cplcFeFeVZpR,       & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvVZpL,cplcFvFvVZpR,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplcChacFuSdL,          & 
& cplcChacFuSdR,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSucSuVZp,cplSvcSvVZp,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexIRosChaToChaVZp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaVZp(MAhOS,MChaOS,MChiOS,MFdOS,             & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,   & 
& cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,       & 
& cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,               & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,      & 
& cplcChaFecSvR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvVZpL,cplcFvFvVZpR,cplhhVZVZp,          & 
& cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSucSuVZp,cplSvcSvVZp,cplcHpmVWmVZp,         & 
& cplcVWmVWmVZp,AmpVertexIRosChaToChaVZp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaVZp(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,  & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,               & 
& cplChiChiVZpR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFeVZpL,cplcFeFeVZpR,       & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvVZpL,cplcFvFvVZpR,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplcChacFuSdL,          & 
& cplcChacFuSdR,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSucSuVZp,cplSvcSvVZp,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexIRosChaToChaVZp)

 End if 
 End if 
AmpVertexChaToChaVZp = AmpVertexChaToChaVZp -  AmpVertexIRdrChaToChaVZp! +  AmpVertexIRosChaToChaVZp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChaVZp=0._dp 
AmpVertexZChaToChaVZp=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChaVZp(1,gt2,:) = AmpWaveZChaToChaVZp(1,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChaVZp(1,gt1,:) 
AmpVertexZChaToChaVZp(1,gt2,:)= AmpVertexZChaToChaVZp(1,gt2,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChaVZp(1,gt1,:) 
AmpWaveZChaToChaVZp(2,gt2,:) = AmpWaveZChaToChaVZp(2,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChaVZp(2,gt1,:) 
AmpVertexZChaToChaVZp(2,gt2,:)= AmpVertexZChaToChaVZp(2,gt2,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChaVZp(2,gt1,:) 
AmpWaveZChaToChaVZp(3,gt2,:) = AmpWaveZChaToChaVZp(3,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChaVZp(3,gt1,:) 
AmpVertexZChaToChaVZp(3,gt2,:)= AmpVertexZChaToChaVZp(3,gt2,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChaVZp(3,gt1,:) 
AmpWaveZChaToChaVZp(4,gt2,:) = AmpWaveZChaToChaVZp(4,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChaVZp(4,gt1,:) 
AmpVertexZChaToChaVZp(4,gt2,:)= AmpVertexZChaToChaVZp(4,gt2,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChaVZp(4,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChaVZp=AmpWaveZChaToChaVZp 
AmpVertexChaToChaVZp= AmpVertexZChaToChaVZp
! Final State 1 
AmpWaveZChaToChaVZp=0._dp 
AmpVertexZChaToChaVZp=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChaVZp(1,:,gt2) = AmpWaveZChaToChaVZp(1,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveChaToChaVZp(1,:,gt1) 
AmpVertexZChaToChaVZp(1,:,gt2)= AmpVertexZChaToChaVZp(1,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexChaToChaVZp(1,:,gt1) 
AmpWaveZChaToChaVZp(2,:,gt2) = AmpWaveZChaToChaVZp(2,:,gt2)+ZRUUPc(gt2,gt1)*AmpWaveChaToChaVZp(2,:,gt1) 
AmpVertexZChaToChaVZp(2,:,gt2)= AmpVertexZChaToChaVZp(2,:,gt2)+ZRUUPc(gt2,gt1)*AmpVertexChaToChaVZp(2,:,gt1) 
AmpWaveZChaToChaVZp(3,:,gt2) = AmpWaveZChaToChaVZp(3,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveChaToChaVZp(3,:,gt1) 
AmpVertexZChaToChaVZp(3,:,gt2)= AmpVertexZChaToChaVZp(3,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexChaToChaVZp(3,:,gt1) 
AmpWaveZChaToChaVZp(4,:,gt2) = AmpWaveZChaToChaVZp(4,:,gt2)+ZRUUPc(gt2,gt1)*AmpWaveChaToChaVZp(4,:,gt1) 
AmpVertexZChaToChaVZp(4,:,gt2)= AmpVertexZChaToChaVZp(4,:,gt2)+ZRUUPc(gt2,gt1)*AmpVertexChaToChaVZp(4,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChaVZp=AmpWaveZChaToChaVZp 
AmpVertexChaToChaVZp= AmpVertexZChaToChaVZp
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChaVZp = AmpVertexChaToChaVZp  +  AmpVertexIRosChaToChaVZp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Cha VZp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChaVZp = AmpTreeChaToChaVZp 
 AmpSum2ChaToChaVZp = AmpTreeChaToChaVZp + 2._dp*AmpWaveChaToChaVZp + 2._dp*AmpVertexChaToChaVZp  
Else 
 AmpSumChaToChaVZp = AmpTreeChaToChaVZp + AmpWaveChaToChaVZp + AmpVertexChaToChaVZp
 AmpSum2ChaToChaVZp = AmpTreeChaToChaVZp + AmpWaveChaToChaVZp + AmpVertexChaToChaVZp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChaVZp = AmpTreeChaToChaVZp
 AmpSum2ChaToChaVZp = AmpTreeChaToChaVZp 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MChaOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MCha(gt2))+Abs(MVZp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2ChaToChaVZp = AmpTreeChaToChaVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZpOS,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZp,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChaVZp(gt1, gt2) 
  AmpSum2ChaToChaVZp = 2._dp*AmpWaveChaToChaVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZpOS,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZp,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChaVZp(gt1, gt2) 
  AmpSum2ChaToChaVZp = 2._dp*AmpVertexChaToChaVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZpOS,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZp,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChaVZp(gt1, gt2) 
  AmpSum2ChaToChaVZp = AmpTreeChaToChaVZp + 2._dp*AmpWaveChaToChaVZp + 2._dp*AmpVertexChaToChaVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZpOS,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZp,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChaVZp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChaVZp = AmpTreeChaToChaVZp
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZpOS,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
  AmpSqTreeChaToChaVZp(gt1, gt2) = AmpSqChaToChaVZp(gt1, gt2)  
  AmpSum2ChaToChaVZp = + 2._dp*AmpWaveChaToChaVZp + 2._dp*AmpVertexChaToChaVZp
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),MVZpOS,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
  AmpSqChaToChaVZp(gt1, gt2) = AmpSqChaToChaVZp(gt1, gt2) + AmpSqTreeChaToChaVZp(gt1, gt2)  
Else  
  AmpSum2ChaToChaVZp = AmpTreeChaToChaVZp
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZp,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
  AmpSqTreeChaToChaVZp(gt1, gt2) = AmpSqChaToChaVZp(gt1, gt2)  
  AmpSum2ChaToChaVZp = + 2._dp*AmpWaveChaToChaVZp + 2._dp*AmpVertexChaToChaVZp
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVZp,AmpSumChaToChaVZp(:,gt1, gt2),AmpSum2ChaToChaVZp(:,gt1, gt2),AmpSqChaToChaVZp(gt1, gt2)) 
  AmpSqChaToChaVZp(gt1, gt2) = AmpSqChaToChaVZp(gt1, gt2) + AmpSqTreeChaToChaVZp(gt1, gt2)  
End if  
Else  
  AmpSqChaToChaVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChaVZp(gt1, gt2).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChaOS(gt2),MVZpOS,helfactor*AmpSqChaToChaVZp(gt1, gt2))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MCha(gt2),MVZp,helfactor*AmpSqChaToChaVZp(gt1, gt2))
End if 
If ((Abs(MRPChaToChaVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChaVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChaVZp(gt1, gt2) + MRGChaToChaVZp(gt1, gt2)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChaVZp(gt1, gt2) + MRGChaToChaVZp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Chi Hpm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_ChaToChiHpm(cplcChaChiHpmL,cplcChaChiHpmR,              & 
& MCha,MChi,MHpm,MCha2,MChi2,MHpm2,AmpTreeChaToChiHpm)

  Else 
Call Amplitude_Tree_sec_UMSSM_ChaToChiHpm(ZcplcChaChiHpmL,ZcplcChaChiHpmR,            & 
& MCha,MChi,MHpm,MCha2,MChi2,MHpm2,AmpTreeChaToChiHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToChiHpm(MLambda,em,gs,cplcChaChiHpmL,cplcChaChiHpmR,    & 
& MChaOS,MChiOS,MHpmOS,MRPChaToChiHpm,MRGChaToChiHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToChiHpm(MLambda,em,gs,ZcplcChaChiHpmL,ZcplcChaChiHpmR,  & 
& MChaOS,MChiOS,MHpmOS,MRPChaToChiHpm,MRGChaToChiHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_ChaToChiHpm(MLambda,em,gs,cplcChaChiHpmL,cplcChaChiHpmR,    & 
& MCha,MChi,MHpm,MRPChaToChiHpm,MRGChaToChiHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToChiHpm(MLambda,em,gs,ZcplcChaChiHpmL,ZcplcChaChiHpmR,  & 
& MCha,MChi,MHpm,MRPChaToChiHpm,MRGChaToChiHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChaToChiHpm(cplcChaChiHpmL,cplcChaChiHpmR,              & 
& ctcplcChaChiHpmL,ctcplcChaChiHpmR,MCha,MCha2,MChi,MChi2,MHpm,MHpm2,ZfHpm,              & 
& ZfL0,ZfLm,ZfLp,AmpWaveChaToChiHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChaToChiHpm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,               & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFecSvL,               & 
& cplcChaFecSvR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,           & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,    & 
& cplcChacFvSeR,AmpVertexChaToChiHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChiHpm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFecSvL,               & 
& cplcChaFecSvR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,           & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,    & 
& cplcChacFvSeR,AmpVertexIRdrChaToChiHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChiHpm(MAhOS,MChaOS,MChiOS,MFdOS,             & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacHpmL,cplChiChacHpmR,     & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,               & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,ZcplcChaChiHpmL,ZcplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,   & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFecSvL,               & 
& cplcChaFecSvR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,           & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,    & 
& cplcChacFvSeR,AmpVertexIRosChaToChiHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChiHpm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,ZcplcChaChiHpmL,ZcplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,   & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFecSvL,               & 
& cplcChaFecSvR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,           & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,    & 
& cplcChacFvSeR,AmpVertexIRosChaToChiHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChiHpm(MAhOS,MChaOS,MChiOS,MFdOS,             & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacHpmL,cplChiChacHpmR,     & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,               & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFecSvL,               & 
& cplcChaFecSvR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,           & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,    & 
& cplcChacFvSeR,AmpVertexIRosChaToChiHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChiHpm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFecSvL,               & 
& cplcChaFecSvR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,           & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,    & 
& cplcChacFvSeR,AmpVertexIRosChaToChiHpm)

 End if 
 End if 
AmpVertexChaToChiHpm = AmpVertexChaToChiHpm -  AmpVertexIRdrChaToChiHpm! +  AmpVertexIRosChaToChiHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChiHpm=0._dp 
AmpVertexZChaToChiHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChiHpm(1,gt2,:,:) = AmpWaveZChaToChiHpm(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChiHpm(1,gt1,:,:) 
AmpVertexZChaToChiHpm(1,gt2,:,:)= AmpVertexZChaToChiHpm(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChiHpm(1,gt1,:,:) 
AmpWaveZChaToChiHpm(2,gt2,:,:) = AmpWaveZChaToChiHpm(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChiHpm(2,gt1,:,:) 
AmpVertexZChaToChiHpm(2,gt2,:,:)= AmpVertexZChaToChiHpm(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChiHpm(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToChiHpm=AmpWaveZChaToChiHpm 
AmpVertexChaToChiHpm= AmpVertexZChaToChiHpm
! Final State 1 
AmpWaveZChaToChiHpm=0._dp 
AmpVertexZChaToChiHpm=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZChaToChiHpm(1,:,gt2,:) = AmpWaveZChaToChiHpm(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChaToChiHpm(1,:,gt1,:) 
AmpVertexZChaToChiHpm(1,:,gt2,:)= AmpVertexZChaToChiHpm(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpVertexChaToChiHpm(1,:,gt1,:) 
AmpWaveZChaToChiHpm(2,:,gt2,:) = AmpWaveZChaToChiHpm(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChaToChiHpm(2,:,gt1,:) 
AmpVertexZChaToChiHpm(2,:,gt2,:)= AmpVertexZChaToChiHpm(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpVertexChaToChiHpm(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChiHpm=AmpWaveZChaToChiHpm 
AmpVertexChaToChiHpm= AmpVertexZChaToChiHpm
! Final State 2 
AmpWaveZChaToChiHpm=0._dp 
AmpVertexZChaToChiHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChiHpm(:,:,:,gt2) = AmpWaveZChaToChiHpm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveChaToChiHpm(:,:,:,gt1) 
AmpVertexZChaToChiHpm(:,:,:,gt2)= AmpVertexZChaToChiHpm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexChaToChiHpm(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChiHpm=AmpWaveZChaToChiHpm 
AmpVertexChaToChiHpm= AmpVertexZChaToChiHpm
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChiHpm = AmpVertexChaToChiHpm  +  AmpVertexIRosChaToChiHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Chi Hpm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChiHpm = AmpTreeChaToChiHpm 
 AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm + 2._dp*AmpWaveChaToChiHpm + 2._dp*AmpVertexChaToChiHpm  
Else 
 AmpSumChaToChiHpm = AmpTreeChaToChiHpm + AmpWaveChaToChiHpm + AmpVertexChaToChiHpm
 AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm + AmpWaveChaToChiHpm + AmpVertexChaToChiHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChiHpm = AmpTreeChaToChiHpm
 AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,9
    Do gt3=2,2
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MChiOS(gt2))+Abs(MHpmOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MChi(gt2))+Abs(MHpm(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChiHpm(gt1, gt2, gt3) 
  AmpSum2ChaToChiHpm = 2._dp*AmpWaveChaToChiHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChiHpm(gt1, gt2, gt3) 
  AmpSum2ChaToChiHpm = 2._dp*AmpVertexChaToChiHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChiHpm(gt1, gt2, gt3) 
  AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm + 2._dp*AmpWaveChaToChiHpm + 2._dp*AmpVertexChaToChiHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChiHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
  AmpSqTreeChaToChiHpm(gt1, gt2, gt3) = AmpSqChaToChiHpm(gt1, gt2, gt3)  
  AmpSum2ChaToChiHpm = + 2._dp*AmpWaveChaToChiHpm + 2._dp*AmpVertexChaToChiHpm
  Call SquareAmp_FtoFS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
  AmpSqChaToChiHpm(gt1, gt2, gt3) = AmpSqChaToChiHpm(gt1, gt2, gt3) + AmpSqTreeChaToChiHpm(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToChiHpm = AmpTreeChaToChiHpm
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
  AmpSqTreeChaToChiHpm(gt1, gt2, gt3) = AmpSqChaToChiHpm(gt1, gt2, gt3)  
  AmpSum2ChaToChiHpm = + 2._dp*AmpWaveChaToChiHpm + 2._dp*AmpVertexChaToChiHpm
  Call SquareAmp_FtoFS(MCha(gt1),MChi(gt2),MHpm(gt3),AmpSumChaToChiHpm(:,gt1, gt2, gt3),AmpSum2ChaToChiHpm(:,gt1, gt2, gt3),AmpSqChaToChiHpm(gt1, gt2, gt3)) 
  AmpSqChaToChiHpm(gt1, gt2, gt3) = AmpSqChaToChiHpm(gt1, gt2, gt3) + AmpSqTreeChaToChiHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToChiHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChiHpm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChiOS(gt2),MHpmOS(gt3),helfactor*AmpSqChaToChiHpm(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MChi(gt2),MHpm(gt3),helfactor*AmpSqChaToChiHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToChiHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChiHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChiHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToChiHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChiHpm(gt1, gt2, gt3) + MRGChaToChiHpm(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChiHpm(gt1, gt2, gt3) + MRGChaToChiHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Chi VWm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_ChaToChiVWm(cplcChaChiVWmL,cplcChaChiVWmR,              & 
& MCha,MChi,MVWm,MCha2,MChi2,MVWm2,AmpTreeChaToChiVWm)

  Else 
Call Amplitude_Tree_sec_UMSSM_ChaToChiVWm(ZcplcChaChiVWmL,ZcplcChaChiVWmR,            & 
& MCha,MChi,MVWm,MCha2,MChi2,MVWm2,AmpTreeChaToChiVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToChiVWm(MLambda,em,gs,cplcChaChiVWmL,cplcChaChiVWmR,    & 
& MChaOS,MChiOS,MVWmOS,MRPChaToChiVWm,MRGChaToChiVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToChiVWm(MLambda,em,gs,ZcplcChaChiVWmL,ZcplcChaChiVWmR,  & 
& MChaOS,MChiOS,MVWmOS,MRPChaToChiVWm,MRGChaToChiVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_ChaToChiVWm(MLambda,em,gs,cplcChaChiVWmL,cplcChaChiVWmR,    & 
& MCha,MChi,MVWm,MRPChaToChiVWm,MRGChaToChiVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToChiVWm(MLambda,em,gs,ZcplcChaChiVWmL,ZcplcChaChiVWmR,  & 
& MCha,MChi,MVWm,MRPChaToChiVWm,MRGChaToChiVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChaToChiVWm(cplcChaChiVWmL,cplcChaChiVWmR,              & 
& ctcplcChaChiVWmL,ctcplcChaChiVWmR,MCha,MCha2,MChi,MChi2,MVWm,MVWm2,ZfL0,               & 
& ZfLm,ZfLp,ZfVWm,AmpWaveChaToChiVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChaToChiVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,               & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,               & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFecSvL,               & 
& cplcChaFecSvR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhcHpmVWm,        & 
& cplhhcVWmVWm,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,cplSucSdVWm,      & 
& cplSvcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,         & 
& cplcVWmVWmVZp,AmpVertexChaToChiVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChiVWm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,               & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFecSvL,               & 
& cplcChaFecSvR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhcHpmVWm,        & 
& cplhhcVWmVWm,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,cplSucSdVWm,      & 
& cplSvcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,         & 
& cplcVWmVWmVZp,AmpVertexIRdrChaToChiVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChiVWm(MAhOS,MChaOS,MChiOS,MFdOS,             & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,  & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,    & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,GosZcplcChaChiHpmL,   & 
& GosZcplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,   & 
& cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,cplcChaFdcSuL,  & 
& cplcChaFdcSuR,cplcChaFecSvL,cplcChaFecSvR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,      & 
& cplcFeFvVWmR,cplhhcHpmVWm,cplhhcVWmVWm,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,      & 
& cplcChacFvSeR,cplSucSdVWm,cplSvcSeVWm,GosZcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,      & 
& cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexIRosChaToChiVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChiVWm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,               & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,GZcplcChaChiHpmL,GZcplcChaChiHpmR,cplcFdChiSdL,              & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,              & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,     & 
& cplSucSdVWm,cplSvcSeVWm,GZcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexIRosChaToChiVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChiVWm(MAhOS,MChaOS,MChiOS,MFdOS,             & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,  & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,    & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,GcplcChaChiHpmL,      & 
& GcplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,      & 
& cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplcChaFecSvL,cplcChaFecSvR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,      & 
& cplcFeFvVWmR,cplhhcHpmVWm,cplhhcVWmVWm,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,      & 
& cplcChacFvSeR,cplSucSdVWm,cplSvcSeVWm,GcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,         & 
& cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexIRosChaToChiVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToChiVWm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,               & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFecSvL,               & 
& cplcChaFecSvR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhcHpmVWm,        & 
& cplhhcVWmVWm,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,cplSucSdVWm,      & 
& cplSvcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,         & 
& cplcVWmVWmVZp,AmpVertexIRosChaToChiVWm)

 End if 
 End if 
AmpVertexChaToChiVWm = AmpVertexChaToChiVWm -  AmpVertexIRdrChaToChiVWm! +  AmpVertexIRosChaToChiVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToChiVWm=0._dp 
AmpVertexZChaToChiVWm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToChiVWm(1,gt2,:) = AmpWaveZChaToChiVWm(1,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChiVWm(1,gt1,:) 
AmpVertexZChaToChiVWm(1,gt2,:)= AmpVertexZChaToChiVWm(1,gt2,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChiVWm(1,gt1,:) 
AmpWaveZChaToChiVWm(2,gt2,:) = AmpWaveZChaToChiVWm(2,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChiVWm(2,gt1,:) 
AmpVertexZChaToChiVWm(2,gt2,:)= AmpVertexZChaToChiVWm(2,gt2,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChiVWm(2,gt1,:) 
AmpWaveZChaToChiVWm(3,gt2,:) = AmpWaveZChaToChiVWm(3,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToChiVWm(3,gt1,:) 
AmpVertexZChaToChiVWm(3,gt2,:)= AmpVertexZChaToChiVWm(3,gt2,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToChiVWm(3,gt1,:) 
AmpWaveZChaToChiVWm(4,gt2,:) = AmpWaveZChaToChiVWm(4,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveChaToChiVWm(4,gt1,:) 
AmpVertexZChaToChiVWm(4,gt2,:)= AmpVertexZChaToChiVWm(4,gt2,:) + ZRUUP(gt2,gt1)*AmpVertexChaToChiVWm(4,gt1,:) 
 End Do 
End Do 
AmpWaveChaToChiVWm=AmpWaveZChaToChiVWm 
AmpVertexChaToChiVWm= AmpVertexZChaToChiVWm
! Final State 1 
AmpWaveZChaToChiVWm=0._dp 
AmpVertexZChaToChiVWm=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZChaToChiVWm(1,:,gt2) = AmpWaveZChaToChiVWm(1,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveChaToChiVWm(1,:,gt1) 
AmpVertexZChaToChiVWm(1,:,gt2)= AmpVertexZChaToChiVWm(1,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexChaToChiVWm(1,:,gt1) 
AmpWaveZChaToChiVWm(2,:,gt2) = AmpWaveZChaToChiVWm(2,:,gt2)+ZRUZNc(gt2,gt1)*AmpWaveChaToChiVWm(2,:,gt1) 
AmpVertexZChaToChiVWm(2,:,gt2)= AmpVertexZChaToChiVWm(2,:,gt2)+ZRUZNc(gt2,gt1)*AmpVertexChaToChiVWm(2,:,gt1) 
AmpWaveZChaToChiVWm(3,:,gt2) = AmpWaveZChaToChiVWm(3,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveChaToChiVWm(3,:,gt1) 
AmpVertexZChaToChiVWm(3,:,gt2)= AmpVertexZChaToChiVWm(3,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexChaToChiVWm(3,:,gt1) 
AmpWaveZChaToChiVWm(4,:,gt2) = AmpWaveZChaToChiVWm(4,:,gt2)+ZRUZNc(gt2,gt1)*AmpWaveChaToChiVWm(4,:,gt1) 
AmpVertexZChaToChiVWm(4,:,gt2)= AmpVertexZChaToChiVWm(4,:,gt2)+ZRUZNc(gt2,gt1)*AmpVertexChaToChiVWm(4,:,gt1) 
 End Do 
End Do 
AmpWaveChaToChiVWm=AmpWaveZChaToChiVWm 
AmpVertexChaToChiVWm= AmpVertexZChaToChiVWm
End if
If (ShiftIRdiv) Then 
AmpVertexChaToChiVWm = AmpVertexChaToChiVWm  +  AmpVertexIRosChaToChiVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Chi VWm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToChiVWm = AmpTreeChaToChiVWm 
 AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm + 2._dp*AmpWaveChaToChiVWm + 2._dp*AmpVertexChaToChiVWm  
Else 
 AmpSumChaToChiVWm = AmpTreeChaToChiVWm + AmpWaveChaToChiVWm + AmpVertexChaToChiVWm
 AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm + AmpWaveChaToChiVWm + AmpVertexChaToChiVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChiVWm = AmpTreeChaToChiVWm
 AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,9
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MChiOS(gt2))+Abs(MVWmOS)))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MChi(gt2))+Abs(MVWm))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToChiVWm(gt1, gt2) 
  AmpSum2ChaToChiVWm = 2._dp*AmpWaveChaToChiVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToChiVWm(gt1, gt2) 
  AmpSum2ChaToChiVWm = 2._dp*AmpVertexChaToChiVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToChiVWm(gt1, gt2) 
  AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm + 2._dp*AmpWaveChaToChiVWm + 2._dp*AmpVertexChaToChiVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToChiVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
  AmpSqTreeChaToChiVWm(gt1, gt2) = AmpSqChaToChiVWm(gt1, gt2)  
  AmpSum2ChaToChiVWm = + 2._dp*AmpWaveChaToChiVWm + 2._dp*AmpVertexChaToChiVWm
  Call SquareAmp_FtoFV(MChaOS(gt1),MChiOS(gt2),MVWmOS,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
  AmpSqChaToChiVWm(gt1, gt2) = AmpSqChaToChiVWm(gt1, gt2) + AmpSqTreeChaToChiVWm(gt1, gt2)  
Else  
  AmpSum2ChaToChiVWm = AmpTreeChaToChiVWm
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
  AmpSqTreeChaToChiVWm(gt1, gt2) = AmpSqChaToChiVWm(gt1, gt2)  
  AmpSum2ChaToChiVWm = + 2._dp*AmpWaveChaToChiVWm + 2._dp*AmpVertexChaToChiVWm
  Call SquareAmp_FtoFV(MCha(gt1),MChi(gt2),MVWm,AmpSumChaToChiVWm(:,gt1, gt2),AmpSum2ChaToChiVWm(:,gt1, gt2),AmpSqChaToChiVWm(gt1, gt2)) 
  AmpSqChaToChiVWm(gt1, gt2) = AmpSqChaToChiVWm(gt1, gt2) + AmpSqTreeChaToChiVWm(gt1, gt2)  
End if  
Else  
  AmpSqChaToChiVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChiVWm(gt1, gt2).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChiOS(gt2),MVWmOS,helfactor*AmpSqChaToChiVWm(gt1, gt2))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MChi(gt2),MVWm,helfactor*AmpSqChaToChiVWm(gt1, gt2))
End if 
If ((Abs(MRPChaToChiVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChiVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToChiVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChiVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToChiVWm(gt1, gt2) + MRGChaToChiVWm(gt1, gt2)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToChiVWm(gt1, gt2) + MRGChaToChiVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fd Conjg(Su)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_ChaToFdcSu(cplcChaFdcSuL,cplcChaFdcSuR,MCha,            & 
& MFd,MSu,MCha2,MFd2,MSu2,AmpTreeChaToFdcSu)

  Else 
Call Amplitude_Tree_sec_UMSSM_ChaToFdcSu(ZcplcChaFdcSuL,ZcplcChaFdcSuR,               & 
& MCha,MFd,MSu,MCha2,MFd2,MSu2,AmpTreeChaToFdcSu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToFdcSu(MLambda,em,gs,cplcChaFdcSuL,cplcChaFdcSuR,       & 
& MChaOS,MFdOS,MSuOS,MRPChaToFdcSu,MRGChaToFdcSu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToFdcSu(MLambda,em,gs,ZcplcChaFdcSuL,ZcplcChaFdcSuR,     & 
& MChaOS,MFdOS,MSuOS,MRPChaToFdcSu,MRGChaToFdcSu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_ChaToFdcSu(MLambda,em,gs,cplcChaFdcSuL,cplcChaFdcSuR,       & 
& MCha,MFd,MSu,MRPChaToFdcSu,MRGChaToFdcSu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToFdcSu(MLambda,em,gs,ZcplcChaFdcSuL,ZcplcChaFdcSuR,     & 
& MCha,MFd,MSu,MRPChaToFdcSu,MRGChaToFdcSu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChaToFdcSu(cplcChaFdcSuL,cplcChaFdcSuR,ctcplcChaFdcSuL, & 
& ctcplcChaFdcSuR,MCha,MCha2,MFd,MFd2,MSu,MSu2,ZfFDL,ZfFDR,ZfLm,ZfLp,ZfSu,               & 
& AmpWaveChaToFdcSu)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChaToFdcSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,    & 
& cplcFdFdAhR,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFdcSdL,cplChiFdcSdR,   & 
& cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,   & 
& cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,         & 
& cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,AmpVertexChaToFdcSu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToFdcSu(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,          & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,        & 
& cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,              & 
& cplSucSuVZp,AmpVertexIRdrChaToFdcSu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToFdcSu(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,               & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,       & 
& cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,    & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,              & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& ZcplcChaFdcSuL,ZcplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,               & 
& cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,cplcChacFuSdR,        & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,AmpVertexIRosChaToFdcSu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToFdcSu(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,          & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,ZcplcChaFdcSuL,ZcplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,   & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,        & 
& cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,              & 
& cplSucSuVZp,AmpVertexIRosChaToFdcSu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToFdcSu(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,               & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,       & 
& cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,    & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,              & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,   & 
& cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,         & 
& cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,AmpVertexIRosChaToFdcSu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToFdcSu(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,          & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,        & 
& cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,              & 
& cplSucSuVZp,AmpVertexIRosChaToFdcSu)

 End if 
 End if 
AmpVertexChaToFdcSu = AmpVertexChaToFdcSu -  AmpVertexIRdrChaToFdcSu! +  AmpVertexIRosChaToFdcSu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToFdcSu=0._dp 
AmpVertexZChaToFdcSu=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToFdcSu(1,gt2,:,:) = AmpWaveZChaToFdcSu(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToFdcSu(1,gt1,:,:) 
AmpVertexZChaToFdcSu(1,gt2,:,:)= AmpVertexZChaToFdcSu(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToFdcSu(1,gt1,:,:) 
AmpWaveZChaToFdcSu(2,gt2,:,:) = AmpWaveZChaToFdcSu(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToFdcSu(2,gt1,:,:) 
AmpVertexZChaToFdcSu(2,gt2,:,:)= AmpVertexZChaToFdcSu(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToFdcSu(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToFdcSu=AmpWaveZChaToFdcSu 
AmpVertexChaToFdcSu= AmpVertexZChaToFdcSu
! Final State 1 
AmpWaveZChaToFdcSu=0._dp 
AmpVertexZChaToFdcSu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChaToFdcSu(1,:,gt2,:) = AmpWaveZChaToFdcSu(1,:,gt2,:)+ZRUZDL(gt2,gt1)*AmpWaveChaToFdcSu(1,:,gt1,:) 
AmpVertexZChaToFdcSu(1,:,gt2,:)= AmpVertexZChaToFdcSu(1,:,gt2,:)+ZRUZDL(gt2,gt1)*AmpVertexChaToFdcSu(1,:,gt1,:) 
AmpWaveZChaToFdcSu(2,:,gt2,:) = AmpWaveZChaToFdcSu(2,:,gt2,:)+ZRUZDRc(gt2,gt1)*AmpWaveChaToFdcSu(2,:,gt1,:) 
AmpVertexZChaToFdcSu(2,:,gt2,:)= AmpVertexZChaToFdcSu(2,:,gt2,:)+ZRUZDRc(gt2,gt1)*AmpVertexChaToFdcSu(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToFdcSu=AmpWaveZChaToFdcSu 
AmpVertexChaToFdcSu= AmpVertexZChaToFdcSu
! Final State 2 
AmpWaveZChaToFdcSu=0._dp 
AmpVertexZChaToFdcSu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChaToFdcSu(:,:,:,gt2) = AmpWaveZChaToFdcSu(:,:,:,gt2)+ZRUZUc(gt2,gt1)*AmpWaveChaToFdcSu(:,:,:,gt1) 
AmpVertexZChaToFdcSu(:,:,:,gt2)= AmpVertexZChaToFdcSu(:,:,:,gt2)+ZRUZUc(gt2,gt1)*AmpVertexChaToFdcSu(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToFdcSu=AmpWaveZChaToFdcSu 
AmpVertexChaToFdcSu= AmpVertexZChaToFdcSu
End if
If (ShiftIRdiv) Then 
AmpVertexChaToFdcSu = AmpVertexChaToFdcSu  +  AmpVertexIRosChaToFdcSu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Fd conj[Su] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToFdcSu = AmpTreeChaToFdcSu 
 AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu + 2._dp*AmpWaveChaToFdcSu + 2._dp*AmpVertexChaToFdcSu  
Else 
 AmpSumChaToFdcSu = AmpTreeChaToFdcSu + AmpWaveChaToFdcSu + AmpVertexChaToFdcSu
 AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu + AmpWaveChaToFdcSu + AmpVertexChaToFdcSu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToFdcSu = AmpTreeChaToFdcSu
 AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MFdOS(gt2))+Abs(MSuOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MFd(gt2))+Abs(MSu(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToFdcSu(gt1, gt2, gt3) 
  AmpSum2ChaToFdcSu = 2._dp*AmpWaveChaToFdcSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToFdcSu(gt1, gt2, gt3) 
  AmpSum2ChaToFdcSu = 2._dp*AmpVertexChaToFdcSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToFdcSu(gt1, gt2, gt3) 
  AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu + 2._dp*AmpWaveChaToFdcSu + 2._dp*AmpVertexChaToFdcSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToFdcSu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
  AmpSqTreeChaToFdcSu(gt1, gt2, gt3) = AmpSqChaToFdcSu(gt1, gt2, gt3)  
  AmpSum2ChaToFdcSu = + 2._dp*AmpWaveChaToFdcSu + 2._dp*AmpVertexChaToFdcSu
  Call SquareAmp_FtoFS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
  AmpSqChaToFdcSu(gt1, gt2, gt3) = AmpSqChaToFdcSu(gt1, gt2, gt3) + AmpSqTreeChaToFdcSu(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToFdcSu = AmpTreeChaToFdcSu
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
  AmpSqTreeChaToFdcSu(gt1, gt2, gt3) = AmpSqChaToFdcSu(gt1, gt2, gt3)  
  AmpSum2ChaToFdcSu = + 2._dp*AmpWaveChaToFdcSu + 2._dp*AmpVertexChaToFdcSu
  Call SquareAmp_FtoFS(MCha(gt1),MFd(gt2),MSu(gt3),AmpSumChaToFdcSu(:,gt1, gt2, gt3),AmpSum2ChaToFdcSu(:,gt1, gt2, gt3),AmpSqChaToFdcSu(gt1, gt2, gt3)) 
  AmpSqChaToFdcSu(gt1, gt2, gt3) = AmpSqChaToFdcSu(gt1, gt2, gt3) + AmpSqTreeChaToFdcSu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToFdcSu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToFdcSu(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 3._dp*GammaTPS(MChaOS(gt1),MFdOS(gt2),MSuOS(gt3),helfactor*AmpSqChaToFdcSu(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 3._dp*GammaTPS(MCha(gt1),MFd(gt2),MSu(gt3),helfactor*AmpSqChaToFdcSu(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToFdcSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFdcSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToFdcSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFdcSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToFdcSu(gt1, gt2, gt3) + MRGChaToFdcSu(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToFdcSu(gt1, gt2, gt3) + MRGChaToFdcSu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fe Conjg(Sv)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_ChaToFecSv(cplcChaFecSvL,cplcChaFecSvR,MCha,            & 
& MFe,MSv,MCha2,MFe2,MSv2,AmpTreeChaToFecSv)

  Else 
Call Amplitude_Tree_sec_UMSSM_ChaToFecSv(ZcplcChaFecSvL,ZcplcChaFecSvR,               & 
& MCha,MFe,MSv,MCha2,MFe2,MSv2,AmpTreeChaToFecSv)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToFecSv(MLambda,em,gs,cplcChaFecSvL,cplcChaFecSvR,       & 
& MChaOS,MFeOS,MSvOS,MRPChaToFecSv,MRGChaToFecSv)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToFecSv(MLambda,em,gs,ZcplcChaFecSvL,ZcplcChaFecSvR,     & 
& MChaOS,MFeOS,MSvOS,MRPChaToFecSv,MRGChaToFecSv)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_ChaToFecSv(MLambda,em,gs,cplcChaFecSvL,cplcChaFecSvR,       & 
& MCha,MFe,MSv,MRPChaToFecSv,MRGChaToFecSv)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_ChaToFecSv(MLambda,em,gs,ZcplcChaFecSvL,ZcplcChaFecSvR,     & 
& MCha,MFe,MSv,MRPChaToFecSv,MRGChaToFecSv)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChaToFecSv(cplcChaFecSvL,cplcChaFecSvR,ctcplcChaFecSvL, & 
& ctcplcChaFecSvR,MCha,MCha2,MFe,MFe2,MSv,MSv2,ZfFEL,ZfFER,ZfLm,ZfLp,ZfSv,               & 
& AmpWaveChaToFecSv)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChaToFecSv(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,             & 
& MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplAhSvcSv,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,    & 
& cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,              & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,     & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplhhSvcSv,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,       & 
& cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,AmpVertexChaToFecSv)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToFecSv(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,        & 
& cplAhSvcSv,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,    & 
& cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,              & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,     & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplhhSvcSv,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,       & 
& cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,AmpVertexIRdrChaToFecSv)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToFecSv(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSvcSv,cplcChaChahhL,cplcChaChahhR,          & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,ZcplcChaFecSvL,ZcplcChaFecSvR,       & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhSvcSv,cplcChacFvSeL,      & 
& cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,AmpVertexIRosChaToFecSv)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToFecSv(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,        & 
& cplAhSvcSv,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,    & 
& cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,              & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,ZcplcChaFecSvL,ZcplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,   & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplhhSvcSv,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,       & 
& cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,AmpVertexIRosChaToFecSv)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToFecSv(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSvcSv,cplcChaChahhL,cplcChaChahhR,          & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,         & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhSvcSv,cplcChacFvSeL,      & 
& cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,AmpVertexIRosChaToFecSv)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaToFecSv(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,        & 
& cplAhSvcSv,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,    & 
& cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,              & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,     & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplhhSvcSv,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,       & 
& cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,AmpVertexIRosChaToFecSv)

 End if 
 End if 
AmpVertexChaToFecSv = AmpVertexChaToFecSv -  AmpVertexIRdrChaToFecSv! +  AmpVertexIRosChaToFecSv ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaToFecSv=0._dp 
AmpVertexZChaToFecSv=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaToFecSv(1,gt2,:,:) = AmpWaveZChaToFecSv(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaToFecSv(1,gt1,:,:) 
AmpVertexZChaToFecSv(1,gt2,:,:)= AmpVertexZChaToFecSv(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaToFecSv(1,gt1,:,:) 
AmpWaveZChaToFecSv(2,gt2,:,:) = AmpWaveZChaToFecSv(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaToFecSv(2,gt1,:,:) 
AmpVertexZChaToFecSv(2,gt2,:,:)= AmpVertexZChaToFecSv(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaToFecSv(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaToFecSv=AmpWaveZChaToFecSv 
AmpVertexChaToFecSv= AmpVertexZChaToFecSv
! Final State 1 
AmpWaveZChaToFecSv=0._dp 
AmpVertexZChaToFecSv=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChaToFecSv(1,:,gt2,:) = AmpWaveZChaToFecSv(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpWaveChaToFecSv(1,:,gt1,:) 
AmpVertexZChaToFecSv(1,:,gt2,:)= AmpVertexZChaToFecSv(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpVertexChaToFecSv(1,:,gt1,:) 
AmpWaveZChaToFecSv(2,:,gt2,:) = AmpWaveZChaToFecSv(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpWaveChaToFecSv(2,:,gt1,:) 
AmpVertexZChaToFecSv(2,:,gt2,:)= AmpVertexZChaToFecSv(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpVertexChaToFecSv(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaToFecSv=AmpWaveZChaToFecSv 
AmpVertexChaToFecSv= AmpVertexZChaToFecSv
! Final State 2 
AmpWaveZChaToFecSv=0._dp 
AmpVertexZChaToFecSv=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChaToFecSv(:,:,:,gt2) = AmpWaveZChaToFecSv(:,:,:,gt2)+ZRUZVc(gt2,gt1)*AmpWaveChaToFecSv(:,:,:,gt1) 
AmpVertexZChaToFecSv(:,:,:,gt2)= AmpVertexZChaToFecSv(:,:,:,gt2)+ZRUZVc(gt2,gt1)*AmpVertexChaToFecSv(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaToFecSv=AmpWaveZChaToFecSv 
AmpVertexChaToFecSv= AmpVertexZChaToFecSv
End if
If (ShiftIRdiv) Then 
AmpVertexChaToFecSv = AmpVertexChaToFecSv  +  AmpVertexIRosChaToFecSv
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Fe conj[Sv] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaToFecSv = AmpTreeChaToFecSv 
 AmpSum2ChaToFecSv = AmpTreeChaToFecSv + 2._dp*AmpWaveChaToFecSv + 2._dp*AmpVertexChaToFecSv  
Else 
 AmpSumChaToFecSv = AmpTreeChaToFecSv + AmpWaveChaToFecSv + AmpVertexChaToFecSv
 AmpSum2ChaToFecSv = AmpTreeChaToFecSv + AmpWaveChaToFecSv + AmpVertexChaToFecSv 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToFecSv = AmpTreeChaToFecSv
 AmpSum2ChaToFecSv = AmpTreeChaToFecSv 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(MSvOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MFe(gt2))+Abs(MSv(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaToFecSv = AmpTreeChaToFecSv
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvOS(gt3),AmpSumChaToFecSv(:,gt1, gt2, gt3),AmpSum2ChaToFecSv(:,gt1, gt2, gt3),AmpSqChaToFecSv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSv(gt3),AmpSumChaToFecSv(:,gt1, gt2, gt3),AmpSum2ChaToFecSv(:,gt1, gt2, gt3),AmpSqChaToFecSv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaToFecSv(gt1, gt2, gt3) 
  AmpSum2ChaToFecSv = 2._dp*AmpWaveChaToFecSv
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvOS(gt3),AmpSumChaToFecSv(:,gt1, gt2, gt3),AmpSum2ChaToFecSv(:,gt1, gt2, gt3),AmpSqChaToFecSv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSv(gt3),AmpSumChaToFecSv(:,gt1, gt2, gt3),AmpSum2ChaToFecSv(:,gt1, gt2, gt3),AmpSqChaToFecSv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaToFecSv(gt1, gt2, gt3) 
  AmpSum2ChaToFecSv = 2._dp*AmpVertexChaToFecSv
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvOS(gt3),AmpSumChaToFecSv(:,gt1, gt2, gt3),AmpSum2ChaToFecSv(:,gt1, gt2, gt3),AmpSqChaToFecSv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSv(gt3),AmpSumChaToFecSv(:,gt1, gt2, gt3),AmpSum2ChaToFecSv(:,gt1, gt2, gt3),AmpSqChaToFecSv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaToFecSv(gt1, gt2, gt3) 
  AmpSum2ChaToFecSv = AmpTreeChaToFecSv + 2._dp*AmpWaveChaToFecSv + 2._dp*AmpVertexChaToFecSv
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvOS(gt3),AmpSumChaToFecSv(:,gt1, gt2, gt3),AmpSum2ChaToFecSv(:,gt1, gt2, gt3),AmpSqChaToFecSv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSv(gt3),AmpSumChaToFecSv(:,gt1, gt2, gt3),AmpSum2ChaToFecSv(:,gt1, gt2, gt3),AmpSqChaToFecSv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaToFecSv(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaToFecSv = AmpTreeChaToFecSv
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvOS(gt3),AmpSumChaToFecSv(:,gt1, gt2, gt3),AmpSum2ChaToFecSv(:,gt1, gt2, gt3),AmpSqChaToFecSv(gt1, gt2, gt3)) 
  AmpSqTreeChaToFecSv(gt1, gt2, gt3) = AmpSqChaToFecSv(gt1, gt2, gt3)  
  AmpSum2ChaToFecSv = + 2._dp*AmpWaveChaToFecSv + 2._dp*AmpVertexChaToFecSv
  Call SquareAmp_FtoFS(MChaOS(gt1),MFeOS(gt2),MSvOS(gt3),AmpSumChaToFecSv(:,gt1, gt2, gt3),AmpSum2ChaToFecSv(:,gt1, gt2, gt3),AmpSqChaToFecSv(gt1, gt2, gt3)) 
  AmpSqChaToFecSv(gt1, gt2, gt3) = AmpSqChaToFecSv(gt1, gt2, gt3) + AmpSqTreeChaToFecSv(gt1, gt2, gt3)  
Else  
  AmpSum2ChaToFecSv = AmpTreeChaToFecSv
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSv(gt3),AmpSumChaToFecSv(:,gt1, gt2, gt3),AmpSum2ChaToFecSv(:,gt1, gt2, gt3),AmpSqChaToFecSv(gt1, gt2, gt3)) 
  AmpSqTreeChaToFecSv(gt1, gt2, gt3) = AmpSqChaToFecSv(gt1, gt2, gt3)  
  AmpSum2ChaToFecSv = + 2._dp*AmpWaveChaToFecSv + 2._dp*AmpVertexChaToFecSv
  Call SquareAmp_FtoFS(MCha(gt1),MFe(gt2),MSv(gt3),AmpSumChaToFecSv(:,gt1, gt2, gt3),AmpSum2ChaToFecSv(:,gt1, gt2, gt3),AmpSqChaToFecSv(gt1, gt2, gt3)) 
  AmpSqChaToFecSv(gt1, gt2, gt3) = AmpSqChaToFecSv(gt1, gt2, gt3) + AmpSqTreeChaToFecSv(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaToFecSv(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToFecSv(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MFeOS(gt2),MSvOS(gt3),helfactor*AmpSqChaToFecSv(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MFe(gt2),MSv(gt3),helfactor*AmpSqChaToFecSv(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaToFecSv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFecSv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaToFecSv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaToFecSv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaToFecSv(gt1, gt2, gt3) + MRGChaToFecSv(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaToFecSv(gt1, gt2, gt3) + MRGChaToFecSv(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fu) Sd
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_ChaTocFuSd(cplcChacFuSdL,cplcChacFuSdR,MCha,            & 
& MFu,MSd,MCha2,MFu2,MSd2,AmpTreeChaTocFuSd)

  Else 
Call Amplitude_Tree_sec_UMSSM_ChaTocFuSd(ZcplcChacFuSdL,ZcplcChacFuSdR,               & 
& MCha,MFu,MSd,MCha2,MFu2,MSd2,AmpTreeChaTocFuSd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_ChaTocFuSd(MLambda,em,gs,cplcChacFuSdL,cplcChacFuSdR,       & 
& MChaOS,MFuOS,MSdOS,MRPChaTocFuSd,MRGChaTocFuSd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_ChaTocFuSd(MLambda,em,gs,ZcplcChacFuSdL,ZcplcChacFuSdR,     & 
& MChaOS,MFuOS,MSdOS,MRPChaTocFuSd,MRGChaTocFuSd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_ChaTocFuSd(MLambda,em,gs,cplcChacFuSdL,cplcChacFuSdR,       & 
& MCha,MFu,MSd,MRPChaTocFuSd,MRGChaTocFuSd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_ChaTocFuSd(MLambda,em,gs,ZcplcChacFuSdL,ZcplcChacFuSdR,     & 
& MCha,MFu,MSd,MRPChaTocFuSd,MRGChaTocFuSd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChaTocFuSd(cplcChacFuSdL,cplcChacFuSdR,ctcplcChacFuSdL, & 
& ctcplcChacFuSdR,MCha,MCha2,MFu,MFu2,MSd,MSd2,ZfFUL,ZfFUR,ZfLm,ZfLp,ZfSd,               & 
& AmpWaveChaTocFuSd)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChaTocFuSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,    & 
& cplcFuFuAhR,cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,              & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,  & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdGluSdL,            & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplSdcSdVG,cplSdcSdVP,               & 
& cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,          & 
& AmpVertexChaTocFuSd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaTocFuSd(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,          & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,               & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,         & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,           & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,              & 
& cplSdcHpmcSu,cplSdcSucVWm,AmpVertexIRdrChaTocFuSd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaTocFuSd(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,               & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,cplcFuFuAhR,       & 
& cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,cplcChaChiHpmR,             & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,   & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdGluSdL,cplcFdGluSdR,           & 
& cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,     & 
& ZcplcChacFuSdL,ZcplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,AmpVertexIRosChaTocFuSd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaTocFuSd(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,          & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,               & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,         & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,           & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,ZcplcChacFuSdL,ZcplcChacFuSdR,            & 
& cplSdcHpmcSu,cplSdcSucVWm,AmpVertexIRosChaTocFuSd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaTocFuSd(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,               & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFuFuAhL,cplcFuFuAhR,       & 
& cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,cplcChaChiHpmR,             & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,   & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFdGluSdL,cplcFdGluSdR,           & 
& cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,     & 
& cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,AmpVertexIRosChaTocFuSd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaTocFuSd(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,          & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,               & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,         & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,           & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,              & 
& cplSdcHpmcSu,cplSdcSucVWm,AmpVertexIRosChaTocFuSd)

 End if 
 End if 
AmpVertexChaTocFuSd = AmpVertexChaTocFuSd -  AmpVertexIRdrChaTocFuSd! +  AmpVertexIRosChaTocFuSd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaTocFuSd=0._dp 
AmpVertexZChaTocFuSd=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaTocFuSd(1,gt2,:,:) = AmpWaveZChaTocFuSd(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaTocFuSd(1,gt1,:,:) 
AmpVertexZChaTocFuSd(1,gt2,:,:)= AmpVertexZChaTocFuSd(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaTocFuSd(1,gt1,:,:) 
AmpWaveZChaTocFuSd(2,gt2,:,:) = AmpWaveZChaTocFuSd(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaTocFuSd(2,gt1,:,:) 
AmpVertexZChaTocFuSd(2,gt2,:,:)= AmpVertexZChaTocFuSd(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaTocFuSd(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaTocFuSd=AmpWaveZChaTocFuSd 
AmpVertexChaTocFuSd= AmpVertexZChaTocFuSd
! Final State 1 
AmpWaveZChaTocFuSd=0._dp 
AmpVertexZChaTocFuSd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChaTocFuSd(1,:,gt2,:) = AmpWaveZChaTocFuSd(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpWaveChaTocFuSd(1,:,gt1,:) 
AmpVertexZChaTocFuSd(1,:,gt2,:)= AmpVertexZChaTocFuSd(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpVertexChaTocFuSd(1,:,gt1,:) 
AmpWaveZChaTocFuSd(2,:,gt2,:) = AmpWaveZChaTocFuSd(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpWaveChaTocFuSd(2,:,gt1,:) 
AmpVertexZChaTocFuSd(2,:,gt2,:)= AmpVertexZChaTocFuSd(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpVertexChaTocFuSd(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaTocFuSd=AmpWaveZChaTocFuSd 
AmpVertexChaTocFuSd= AmpVertexZChaTocFuSd
! Final State 2 
AmpWaveZChaTocFuSd=0._dp 
AmpVertexZChaTocFuSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChaTocFuSd(:,:,:,gt2) = AmpWaveZChaTocFuSd(:,:,:,gt2)+ZRUZD(gt2,gt1)*AmpWaveChaTocFuSd(:,:,:,gt1) 
AmpVertexZChaTocFuSd(:,:,:,gt2)= AmpVertexZChaTocFuSd(:,:,:,gt2)+ZRUZD(gt2,gt1)*AmpVertexChaTocFuSd(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaTocFuSd=AmpWaveZChaTocFuSd 
AmpVertexChaTocFuSd= AmpVertexZChaTocFuSd
End if
If (ShiftIRdiv) Then 
AmpVertexChaTocFuSd = AmpVertexChaTocFuSd  +  AmpVertexIRosChaTocFuSd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->bar[Fu] Sd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaTocFuSd = AmpTreeChaTocFuSd 
 AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd + 2._dp*AmpWaveChaTocFuSd + 2._dp*AmpVertexChaTocFuSd  
Else 
 AmpSumChaTocFuSd = AmpTreeChaTocFuSd + AmpWaveChaTocFuSd + AmpVertexChaTocFuSd
 AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd + AmpWaveChaTocFuSd + AmpVertexChaTocFuSd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaTocFuSd = AmpTreeChaTocFuSd
 AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MFuOS(gt2))+Abs(MSdOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MFu(gt2))+Abs(MSd(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaTocFuSd(gt1, gt2, gt3) 
  AmpSum2ChaTocFuSd = 2._dp*AmpWaveChaTocFuSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaTocFuSd(gt1, gt2, gt3) 
  AmpSum2ChaTocFuSd = 2._dp*AmpVertexChaTocFuSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaTocFuSd(gt1, gt2, gt3) 
  AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd + 2._dp*AmpWaveChaTocFuSd + 2._dp*AmpVertexChaTocFuSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaTocFuSd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
  AmpSqTreeChaTocFuSd(gt1, gt2, gt3) = AmpSqChaTocFuSd(gt1, gt2, gt3)  
  AmpSum2ChaTocFuSd = + 2._dp*AmpWaveChaTocFuSd + 2._dp*AmpVertexChaTocFuSd
  Call SquareAmp_FtoFS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
  AmpSqChaTocFuSd(gt1, gt2, gt3) = AmpSqChaTocFuSd(gt1, gt2, gt3) + AmpSqTreeChaTocFuSd(gt1, gt2, gt3)  
Else  
  AmpSum2ChaTocFuSd = AmpTreeChaTocFuSd
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
  AmpSqTreeChaTocFuSd(gt1, gt2, gt3) = AmpSqChaTocFuSd(gt1, gt2, gt3)  
  AmpSum2ChaTocFuSd = + 2._dp*AmpWaveChaTocFuSd + 2._dp*AmpVertexChaTocFuSd
  Call SquareAmp_FtoFS(MCha(gt1),MFu(gt2),MSd(gt3),AmpSumChaTocFuSd(:,gt1, gt2, gt3),AmpSum2ChaTocFuSd(:,gt1, gt2, gt3),AmpSqChaTocFuSd(gt1, gt2, gt3)) 
  AmpSqChaTocFuSd(gt1, gt2, gt3) = AmpSqChaTocFuSd(gt1, gt2, gt3) + AmpSqTreeChaTocFuSd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaTocFuSd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaTocFuSd(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 3._dp*GammaTPS(MChaOS(gt1),MFuOS(gt2),MSdOS(gt3),helfactor*AmpSqChaTocFuSd(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 3._dp*GammaTPS(MCha(gt1),MFu(gt2),MSd(gt3),helfactor*AmpSqChaTocFuSd(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaTocFuSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaTocFuSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaTocFuSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaTocFuSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaTocFuSd(gt1, gt2, gt3) + MRGChaTocFuSd(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaTocFuSd(gt1, gt2, gt3) + MRGChaTocFuSd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fv) Se
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_ChaTocFvSe(cplcChacFvSeL,cplcChacFvSeR,MCha,            & 
& MFv,MSe,MCha2,MFv2,MSe2,AmpTreeChaTocFvSe)

  Else 
Call Amplitude_Tree_sec_UMSSM_ChaTocFvSe(ZcplcChacFvSeL,ZcplcChacFvSeR,               & 
& MCha,MFv,MSe,MCha2,MFv2,MSe2,AmpTreeChaTocFvSe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_ChaTocFvSe(MLambda,em,gs,cplcChacFvSeL,cplcChacFvSeR,       & 
& MChaOS,MFvOS,MSeOS,MRPChaTocFvSe,MRGChaTocFvSe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_ChaTocFvSe(MLambda,em,gs,ZcplcChacFvSeL,ZcplcChacFvSeR,     & 
& MChaOS,MFvOS,MSeOS,MRPChaTocFvSe,MRGChaTocFvSe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_ChaTocFvSe(MLambda,em,gs,cplcChacFvSeL,cplcChacFvSeR,       & 
& MCha,MFv,MSe,MRPChaTocFvSe,MRGChaTocFvSe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_ChaTocFvSe(MLambda,em,gs,ZcplcChacFvSeL,ZcplcChacFvSeR,     & 
& MCha,MFv,MSe,MRPChaTocFvSe,MRGChaTocFvSe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChaTocFvSe(cplcChacFvSeL,cplcChacFvSeR,ctcplcChacFvSeL, & 
& ctcplcChacFvSeR,MCha,MCha2,MFv,MFv2,MSe,MSe2,ZfFVL,ZfFVR,ZfLm,ZfLp,ZfSe,               & 
& AmpWaveChaTocFvSe)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChaTocFvSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,             & 
& MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFvFvAhL,cplcFvFvAhR,             & 
& cplAhSecSe,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,cplcChaChiHpmR,             & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,   & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,             & 
& cplhhSecSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,              & 
& cplSecHpmcSv,cplSecSvcVWm,AmpVertexChaTocFvSe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaTocFvSe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFvFvAhL,cplcFvFvAhR,        & 
& cplAhSecSe,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,cplcChaChiHpmR,             & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,   & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,             & 
& cplhhSecSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,              & 
& cplSecHpmcSv,cplSecSvcVWm,AmpVertexIRdrChaTocFvSe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaTocFvSe(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhSecSe,cplcChaChahhL,cplcChaChahhR,          & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,               & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,         & 
& cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,cplhhSecSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,    & 
& ZcplcChacFvSeL,ZcplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,AmpVertexIRosChaTocFvSe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaTocFvSe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFvFvAhL,cplcFvFvAhR,        & 
& cplAhSecSe,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,cplcChaChiHpmR,             & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,   & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,             & 
& cplhhSecSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,ZcplcChacFvSeL,ZcplcChacFvSeR,            & 
& cplSecHpmcSv,cplSecSvcVWm,AmpVertexIRosChaTocFvSe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaTocFvSe(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhSecSe,cplcChaChahhL,cplcChaChahhR,          & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,               & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,         & 
& cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,cplhhSecSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,    & 
& cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,AmpVertexIRosChaTocFvSe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChaTocFvSe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFvFvAhL,cplcFvFvAhR,        & 
& cplAhSecSe,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,cplcChaChiHpmR,             & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,   & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,             & 
& cplhhSecSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,              & 
& cplSecHpmcSv,cplSecSvcVWm,AmpVertexIRosChaTocFvSe)

 End if 
 End if 
AmpVertexChaTocFvSe = AmpVertexChaTocFvSe -  AmpVertexIRdrChaTocFvSe! +  AmpVertexIRosChaTocFvSe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChaTocFvSe=0._dp 
AmpVertexZChaTocFvSe=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChaTocFvSe(1,gt2,:,:) = AmpWaveZChaTocFvSe(1,gt2,:,:)+ZRUUP(gt2,gt1)*AmpWaveChaTocFvSe(1,gt1,:,:) 
AmpVertexZChaTocFvSe(1,gt2,:,:)= AmpVertexZChaTocFvSe(1,gt2,:,:) + ZRUUP(gt2,gt1)*AmpVertexChaTocFvSe(1,gt1,:,:) 
AmpWaveZChaTocFvSe(2,gt2,:,:) = AmpWaveZChaTocFvSe(2,gt2,:,:)+ZRUUMc(gt2,gt1)*AmpWaveChaTocFvSe(2,gt1,:,:) 
AmpVertexZChaTocFvSe(2,gt2,:,:)= AmpVertexZChaTocFvSe(2,gt2,:,:) + ZRUUMc(gt2,gt1)*AmpVertexChaTocFvSe(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChaTocFvSe=AmpWaveZChaTocFvSe 
AmpVertexChaTocFvSe= AmpVertexZChaTocFvSe
! Final State 1 
AmpWaveZChaTocFvSe=0._dp 
AmpVertexZChaTocFvSe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChaTocFvSe(1,:,gt2,:) = AmpWaveZChaTocFvSe(1,:,gt2,:)+ZRUZVR(gt2,gt1)*AmpWaveChaTocFvSe(1,:,gt1,:) 
AmpVertexZChaTocFvSe(1,:,gt2,:)= AmpVertexZChaTocFvSe(1,:,gt2,:)+ZRUZVR(gt2,gt1)*AmpVertexChaTocFvSe(1,:,gt1,:) 
AmpWaveZChaTocFvSe(2,:,gt2,:) = AmpWaveZChaTocFvSe(2,:,gt2,:)+ZRUZVLc(gt2,gt1)*AmpWaveChaTocFvSe(2,:,gt1,:) 
AmpVertexZChaTocFvSe(2,:,gt2,:)= AmpVertexZChaTocFvSe(2,:,gt2,:)+ZRUZVLc(gt2,gt1)*AmpVertexChaTocFvSe(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChaTocFvSe=AmpWaveZChaTocFvSe 
AmpVertexChaTocFvSe= AmpVertexZChaTocFvSe
! Final State 2 
AmpWaveZChaTocFvSe=0._dp 
AmpVertexZChaTocFvSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChaTocFvSe(:,:,:,gt2) = AmpWaveZChaTocFvSe(:,:,:,gt2)+ZRUZE(gt2,gt1)*AmpWaveChaTocFvSe(:,:,:,gt1) 
AmpVertexZChaTocFvSe(:,:,:,gt2)= AmpVertexZChaTocFvSe(:,:,:,gt2)+ZRUZE(gt2,gt1)*AmpVertexChaTocFvSe(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChaTocFvSe=AmpWaveZChaTocFvSe 
AmpVertexChaTocFvSe= AmpVertexZChaTocFvSe
End if
If (ShiftIRdiv) Then 
AmpVertexChaTocFvSe = AmpVertexChaTocFvSe  +  AmpVertexIRosChaTocFvSe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->bar[Fv] Se -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChaTocFvSe = AmpTreeChaTocFvSe 
 AmpSum2ChaTocFvSe = AmpTreeChaTocFvSe + 2._dp*AmpWaveChaTocFvSe + 2._dp*AmpVertexChaTocFvSe  
Else 
 AmpSumChaTocFvSe = AmpTreeChaTocFvSe + AmpWaveChaTocFvSe + AmpVertexChaTocFvSe
 AmpSum2ChaTocFvSe = AmpTreeChaTocFvSe + AmpWaveChaTocFvSe + AmpVertexChaTocFvSe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaTocFvSe = AmpTreeChaTocFvSe
 AmpSum2ChaTocFvSe = AmpTreeChaTocFvSe 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MFvOS(gt2))+Abs(MSeOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MFv(gt2))+Abs(MSe(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChaTocFvSe = AmpTreeChaTocFvSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFvOS(gt2),MSeOS(gt3),AmpSumChaTocFvSe(:,gt1, gt2, gt3),AmpSum2ChaTocFvSe(:,gt1, gt2, gt3),AmpSqChaTocFvSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFv(gt2),MSe(gt3),AmpSumChaTocFvSe(:,gt1, gt2, gt3),AmpSum2ChaTocFvSe(:,gt1, gt2, gt3),AmpSqChaTocFvSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChaTocFvSe(gt1, gt2, gt3) 
  AmpSum2ChaTocFvSe = 2._dp*AmpWaveChaTocFvSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFvOS(gt2),MSeOS(gt3),AmpSumChaTocFvSe(:,gt1, gt2, gt3),AmpSum2ChaTocFvSe(:,gt1, gt2, gt3),AmpSqChaTocFvSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFv(gt2),MSe(gt3),AmpSumChaTocFvSe(:,gt1, gt2, gt3),AmpSum2ChaTocFvSe(:,gt1, gt2, gt3),AmpSqChaTocFvSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChaTocFvSe(gt1, gt2, gt3) 
  AmpSum2ChaTocFvSe = 2._dp*AmpVertexChaTocFvSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFvOS(gt2),MSeOS(gt3),AmpSumChaTocFvSe(:,gt1, gt2, gt3),AmpSum2ChaTocFvSe(:,gt1, gt2, gt3),AmpSqChaTocFvSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFv(gt2),MSe(gt3),AmpSumChaTocFvSe(:,gt1, gt2, gt3),AmpSum2ChaTocFvSe(:,gt1, gt2, gt3),AmpSqChaTocFvSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChaTocFvSe(gt1, gt2, gt3) 
  AmpSum2ChaTocFvSe = AmpTreeChaTocFvSe + 2._dp*AmpWaveChaTocFvSe + 2._dp*AmpVertexChaTocFvSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChaOS(gt1),MFvOS(gt2),MSeOS(gt3),AmpSumChaTocFvSe(:,gt1, gt2, gt3),AmpSum2ChaTocFvSe(:,gt1, gt2, gt3),AmpSqChaTocFvSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MCha(gt1),MFv(gt2),MSe(gt3),AmpSumChaTocFvSe(:,gt1, gt2, gt3),AmpSum2ChaTocFvSe(:,gt1, gt2, gt3),AmpSqChaTocFvSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChaTocFvSe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChaTocFvSe = AmpTreeChaTocFvSe
  Call SquareAmp_FtoFS(MChaOS(gt1),MFvOS(gt2),MSeOS(gt3),AmpSumChaTocFvSe(:,gt1, gt2, gt3),AmpSum2ChaTocFvSe(:,gt1, gt2, gt3),AmpSqChaTocFvSe(gt1, gt2, gt3)) 
  AmpSqTreeChaTocFvSe(gt1, gt2, gt3) = AmpSqChaTocFvSe(gt1, gt2, gt3)  
  AmpSum2ChaTocFvSe = + 2._dp*AmpWaveChaTocFvSe + 2._dp*AmpVertexChaTocFvSe
  Call SquareAmp_FtoFS(MChaOS(gt1),MFvOS(gt2),MSeOS(gt3),AmpSumChaTocFvSe(:,gt1, gt2, gt3),AmpSum2ChaTocFvSe(:,gt1, gt2, gt3),AmpSqChaTocFvSe(gt1, gt2, gt3)) 
  AmpSqChaTocFvSe(gt1, gt2, gt3) = AmpSqChaTocFvSe(gt1, gt2, gt3) + AmpSqTreeChaTocFvSe(gt1, gt2, gt3)  
Else  
  AmpSum2ChaTocFvSe = AmpTreeChaTocFvSe
  Call SquareAmp_FtoFS(MCha(gt1),MFv(gt2),MSe(gt3),AmpSumChaTocFvSe(:,gt1, gt2, gt3),AmpSum2ChaTocFvSe(:,gt1, gt2, gt3),AmpSqChaTocFvSe(gt1, gt2, gt3)) 
  AmpSqTreeChaTocFvSe(gt1, gt2, gt3) = AmpSqChaTocFvSe(gt1, gt2, gt3)  
  AmpSum2ChaTocFvSe = + 2._dp*AmpWaveChaTocFvSe + 2._dp*AmpVertexChaTocFvSe
  Call SquareAmp_FtoFS(MCha(gt1),MFv(gt2),MSe(gt3),AmpSumChaTocFvSe(:,gt1, gt2, gt3),AmpSum2ChaTocFvSe(:,gt1, gt2, gt3),AmpSqChaTocFvSe(gt1, gt2, gt3)) 
  AmpSqChaTocFvSe(gt1, gt2, gt3) = AmpSqChaTocFvSe(gt1, gt2, gt3) + AmpSqTreeChaTocFvSe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChaTocFvSe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaTocFvSe(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MFvOS(gt2),MSeOS(gt3),helfactor*AmpSqChaTocFvSe(gt1, gt2, gt3))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MFv(gt2),MSe(gt3),helfactor*AmpSqChaTocFvSe(gt1, gt2, gt3))
End if 
If ((Abs(MRPChaTocFvSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaTocFvSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChaTocFvSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChaTocFvSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPChaTocFvSe(gt1, gt2, gt3) + MRGChaTocFvSe(gt1, gt2, gt3)) 
  gP1LCha(gt1,i4) = gP1LCha(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPChaTocFvSe(gt1, gt2, gt3) + MRGChaTocFvSe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LCha(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
!---------------- 
! Cha VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_sec_UMSSM_ChaToChaVP(ZcplcChaChaVPL,ZcplcChaChaVPR,               & 
& ZcplcChaChaVZL,ZcplcChaChaVZR,ZcplcChaChaVZpL,ZcplcChaChaVZpR,ctcplcChaChaVPL,         & 
& ctcplcChaChaVPR,ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChaVZpL,ctcplcChaChaVZpR,     & 
& MChaOS,MCha2OS,MVP,MVP2,ZfLm,ZfLp,ZfVP,ZfVZpVP,ZfVZVP,AmpWaveChaToChaVP)

 Else 
Call Amplitude_WAVE_sec_UMSSM_ChaToChaVP(cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,   & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,ctcplcChaChaVPL,ctcplcChaChaVPR,           & 
& ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChaVZpL,ctcplcChaChaVZpR,MChaOS,              & 
& MCha2OS,MVP,MVP2,ZfLm,ZfLp,ZfVP,ZfVZpVP,ZfVZVP,AmpWaveChaToChaVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_ChaToChaVP(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,              & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,ZcplcChaChaAhL,ZcplcChaChaAhR,        & 
& ZcplChiChacHpmL,ZcplChiChacHpmR,ZcplChiChacVWmL,ZcplChiChacVWmR,ZcplChaFucSdL,         & 
& ZcplChaFucSdR,ZcplChaFvcSeL,ZcplChaFvcSeR,ZcplcChaChahhL,ZcplcChaChahhR,               & 
& ZcplcFdChaSuL,ZcplcFdChaSuR,ZcplcFeChaSvL,ZcplcFeChaSvR,ZcplcChaChaVPL,ZcplcChaChaVPR, & 
& ZcplcChaChaVZL,ZcplcChaChaVZR,ZcplcChaChaVZpL,ZcplcChaChaVZpR,ZcplcChaChiHpmL,         & 
& ZcplcChaChiHpmR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,ZcplcFdFdVPL,ZcplcFdFdVPR,             & 
& ZcplcChaFdcSuL,ZcplcChaFdcSuR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcChaFecSvL,ZcplcChaFecSvR, & 
& ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplHpmcHpmVP,ZcplHpmcVWmVP,ZcplSdcSdVP,ZcplcChacFuSdL,      & 
& ZcplcChacFuSdR,ZcplSecSeVP,ZcplcChacFvSeL,ZcplcChacFvSeR,ZcplSucSuVP,ZcplcHpmVPVWm,    & 
& ZcplcVWmVPVWm,AmpVertexChaToChaVP)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_ChaToChaVP(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,              & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,          & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,              & 
& cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,       & 
& cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,cplcChaChiHpmR,             & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVPL,cplcFdFdVPR,cplcChaFdcSuL,cplcChaFdcSuR,     & 
& cplcFeFeVPL,cplcFeFeVPR,cplcChaFecSvL,cplcChaFecSvR,cplcFuFuVPL,cplcFuFuVPR,           & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplcChacFuSdL,cplcChacFuSdR,cplSecSeVP,           & 
& cplcChacFvSeL,cplcChacFvSeR,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,AmpVertexChaToChaVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChaToChaVP(cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,   & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,ctcplcChaChaVPL,ctcplcChaChaVPR,           & 
& ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChaVZpL,ctcplcChaChaVZpR,MCha,MCha2,          & 
& MVP,MVP2,ZfLm,ZfLp,ZfVP,ZfVZpVP,ZfVZVP,AmpWaveChaToChaVP)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChaToChaVP(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,               & 
& cplcChaChaAhR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,             & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,              & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVPL,cplcFdFdVPR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplcFeFeVPL,cplcFeFeVPR,cplcChaFecSvL,cplcChaFecSvR,cplcFuFuVPL,         & 
& cplcFuFuVPR,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplcChacFuSdL,cplcChacFuSdR,          & 
& cplSecSeVP,cplcChacFvSeL,cplcChacFvSeR,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,           & 
& AmpVertexChaToChaVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Cha->Cha VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumChaToChaVP = 0._dp 
 AmpSum2ChaToChaVP = 0._dp  
Else 
 AmpSumChaToChaVP = AmpVertexChaToChaVP + AmpWaveChaToChaVP
 AmpSum2ChaToChaVP = AmpVertexChaToChaVP + AmpWaveChaToChaVP 
End If 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(Abs(MChaOS(gt1)).gt.(Abs(MChaOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MCha(gt1)).gt.(Abs(MCha(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChaOS(gt1),MChaOS(gt2),0._dp,AmpSumChaToChaVP(:,gt1, gt2),AmpSum2ChaToChaVP(:,gt1, gt2),AmpSqChaToChaVP(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MCha(gt1),MCha(gt2),MVP,AmpSumChaToChaVP(:,gt1, gt2),AmpSum2ChaToChaVP(:,gt1, gt2),AmpSqChaToChaVP(gt1, gt2)) 
End if  
Else  
  AmpSqChaToChaVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChaToChaVP(gt1, gt2).eq.0._dp) Then 
  gP1LCha(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MChaOS(gt1),MChaOS(gt2),0._dp,helfactor*AmpSqChaToChaVP(gt1, gt2))
Else 
  gP1LCha(gt1,i4) = 1._dp*GammaTPS(MCha(gt1),MCha(gt2),MVP,helfactor*AmpSqChaToChaVP(gt1, gt2))
End if 
If ((Abs(MRPChaToChaVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChaToChaVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LCha(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.2) isave = i4 
End do
End Subroutine OneLoopDecay_Cha

End Module Wrapper_OneLoopDecay_Cha_sec_UMSSM
