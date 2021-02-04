! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 1:12 on 7.11.2019   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Chi_sec_UMSSM
Use Model_Data_sec_UMSSM 
Use Kinematics 
Use OneLoopDecay_Chi_sec_UMSSM 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Chi(MSdOS,MSd2OS,MSvOS,MSv2OS,MSuOS,MSu2OS,MSeOS,             & 
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
& cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplcChaChaAhL,   & 
& cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,   & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,             & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFecSvL,               & 
& cplcChaFecSvR,cplcFdChaSuL,cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,               & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFdFuHpmL,            & 
& cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplcFeChaSvL,         & 
& cplcFeChaSvR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,            & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuChiSuL,          & 
& cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,      & 
& cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcFuGluSuL,            & 
& cplcFuGluSuR,cplcFvChiSvL,cplcFvChiSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,      & 
& cplcFvFecVWmR,cplcFvFvAhL,cplcFvFvAhR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,             & 
& cplcFvFvVZpL,cplcFvFvVZpR,cplcFvFvVZR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,          & 
& cplChaFvcSeR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,        & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcHpmVPVWm,cplcHpmVWmVZ,         & 
& cplcHpmVWmVZp,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplGluFdcSdL,cplGluFdcSdR,       & 
& cplGluFucSuL,cplGluFucSuR,cplhhcHpmVWm,cplhhcVWmVWm,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhVZpVZp,cplhhVZVZ,        & 
& cplhhVZVZp,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,cplHpmcVWmVP,cplHpmcVWmVZ,          & 
& cplHpmcVWmVZp,cplHpmSucSd,cplHpmSvcSe,cplSdcHpmcSu,cplSdcSdVG,cplSdcSdVP,              & 
& cplSdcSdVZ,cplSdcSdVZp,cplSdcSucVWm,cplSecHpmcSv,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,    & 
& cplSecSvcVWm,cplSucSdVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,cplSvcSeVWm,     & 
& cplSvcSvVZ,cplSvcSvVZp,ctcplChiChacHpmL,ctcplChiChacHpmR,ctcplChiChacVWmL,             & 
& ctcplChiChacVWmR,ctcplChiChiAhL,ctcplChiChiAhR,ctcplChiChihhL,ctcplChiChihhR,          & 
& ctcplChiChiVZL,ctcplChiChiVZpL,ctcplChiChiVZpR,ctcplChiChiVZR,ctcplChiFdcSdL,          & 
& ctcplChiFdcSdR,ctcplChiFecSeL,ctcplChiFecSeR,ctcplChiFucSuL,ctcplChiFucSuR,            & 
& ctcplChiFvcSvL,ctcplChiFvcSvR,GcplChiChacHpmL,GcplChiChacHpmR,GcplcHpmVPVWm,           & 
& GcplHpmcVWmVP,GosZcplChiChacHpmL,GosZcplChiChacHpmR,GosZcplcHpmVPVWm,GosZcplHpmcVWmVP, & 
& GZcplChiChacHpmL,GZcplChiChacHpmR,GZcplcHpmVPVWm,GZcplHpmcVWmVP,ZcplcChaChaVPL,        & 
& ZcplcChaChaVPR,ZcplcChaChiHpmL,ZcplcChaChiHpmR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,        & 
& ZcplcFdChiSdL,ZcplcFdChiSdR,ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplcFdFdVPL,ZcplcFdFdVPR,       & 
& ZcplcFdGluSdL,ZcplcFdGluSdR,ZcplcFeChiSeL,ZcplcFeChiSeR,ZcplcFeFeVPL,ZcplcFeFeVPR,     & 
& ZcplcFuChiSuL,ZcplcFuChiSuR,ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,       & 
& ZcplcFuGluSuL,ZcplcFuGluSuR,ZcplChiChacHpmL,ZcplChiChacHpmR,ZcplChiChacVWmL,           & 
& ZcplChiChacVWmR,ZcplChiChiAhL,ZcplChiChiAhR,ZcplChiChihhL,ZcplChiChihhR,               & 
& ZcplChiChiVZL,ZcplChiChiVZpL,ZcplChiChiVZpR,ZcplChiChiVZR,ZcplChiFdcSdL,               & 
& ZcplChiFdcSdR,ZcplChiFecSeL,ZcplChiFecSeR,ZcplChiFucSuL,ZcplChiFucSuR,ZcplChiFvcSvL,   & 
& ZcplChiFvcSvR,ZcplcHpmVPVWm,ZcplcVWmVPVWm,ZcplGluFdcSdL,ZcplGluFdcSdR,ZcplGluFucSuL,   & 
& ZcplGluFucSuR,ZcplHpmcHpmVP,ZcplHpmcVWmVP,ZcplSdcSdVG,ZcplSdcSdVP,ZcplSecSeVP,         & 
& ZcplSucSuVG,ZcplSucSuVP,ZRUZD,ZRUZV,ZRUZU,ZRUZE,ZRUZH,ZRUZA,ZRUZP,ZRUZN,               & 
& ZRUZVL,ZRUZVR,ZRUUM,ZRUUP,ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,           & 
& em,gs,deltaM,kont,gP1LChi)

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
& cplAhSecSe(6,6,6),cplAhSucSu(6,6,6),cplAhSvcSv(6,6,6),cplcChaChaAhL(2,2,6),            & 
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
& cplhhVZVZp(6),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),cplHpmcHpmVZp(2,2),cplHpmcVWmVP(2),  & 
& cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),cplHpmSucSd(2,6,6),cplHpmSvcSe(2,6,6),cplSdcHpmcSu(6,2,6)

Complex(dp),Intent(in) :: cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplSdcSucVWm(6,6),    & 
& cplSecHpmcSv(6,2,6),cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSecSvcVWm(6,6),& 
& cplSucSdVWm(6,6),cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6),     & 
& cplSvcSeVWm(6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),ctcplChiChacHpmL(9,2,2),             & 
& ctcplChiChacHpmR(9,2,2),ctcplChiChacVWmL(9,2),ctcplChiChacVWmR(9,2),ctcplChiChiAhL(9,9,6),& 
& ctcplChiChiAhR(9,9,6),ctcplChiChihhL(9,9,6),ctcplChiChihhR(9,9,6),ctcplChiChiVZL(9,9), & 
& ctcplChiChiVZpL(9,9),ctcplChiChiVZpR(9,9),ctcplChiChiVZR(9,9),ctcplChiFdcSdL(9,3,6),   & 
& ctcplChiFdcSdR(9,3,6),ctcplChiFecSeL(9,3,6),ctcplChiFecSeR(9,3,6),ctcplChiFucSuL(9,3,6),& 
& ctcplChiFucSuR(9,3,6),ctcplChiFvcSvL(9,3,6),ctcplChiFvcSvR(9,3,6),GcplChiChacHpmL(9,2,2),& 
& GcplChiChacHpmR(9,2,2),GcplcHpmVPVWm(2),GcplHpmcVWmVP(2),GosZcplChiChacHpmL(9,2,2),    & 
& GosZcplChiChacHpmR(9,2,2),GosZcplcHpmVPVWm(2),GosZcplHpmcVWmVP(2),GZcplChiChacHpmL(9,2,2),& 
& GZcplChiChacHpmR(9,2,2),GZcplcHpmVPVWm(2),GZcplHpmcVWmVP(2),ZcplcChaChaVPL(2,2),       & 
& ZcplcChaChaVPR(2,2),ZcplcChaChiHpmL(2,9,2),ZcplcChaChiHpmR(2,9,2),ZcplcChaChiVWmL(2,9),& 
& ZcplcChaChiVWmR(2,9),ZcplcFdChiSdL(3,9,6),ZcplcFdChiSdR(3,9,6),ZcplcFdFdVGL(3,3),      & 
& ZcplcFdFdVGR(3,3),ZcplcFdFdVPL(3,3),ZcplcFdFdVPR(3,3),ZcplcFdGluSdL(3,6),              & 
& ZcplcFdGluSdR(3,6),ZcplcFeChiSeL(3,9,6),ZcplcFeChiSeR(3,9,6),ZcplcFeFeVPL(3,3),        & 
& ZcplcFeFeVPR(3,3),ZcplcFuChiSuL(3,9,6),ZcplcFuChiSuR(3,9,6),ZcplcFuFuVGL(3,3),         & 
& ZcplcFuFuVGR(3,3),ZcplcFuFuVPL(3,3),ZcplcFuFuVPR(3,3),ZcplcFuGluSuL(3,6),              & 
& ZcplcFuGluSuR(3,6),ZcplChiChacHpmL(9,2,2),ZcplChiChacHpmR(9,2,2),ZcplChiChacVWmL(9,2), & 
& ZcplChiChacVWmR(9,2),ZcplChiChiAhL(9,9,6),ZcplChiChiAhR(9,9,6),ZcplChiChihhL(9,9,6),   & 
& ZcplChiChihhR(9,9,6),ZcplChiChiVZL(9,9),ZcplChiChiVZpL(9,9),ZcplChiChiVZpR(9,9),       & 
& ZcplChiChiVZR(9,9),ZcplChiFdcSdL(9,3,6),ZcplChiFdcSdR(9,3,6),ZcplChiFecSeL(9,3,6),     & 
& ZcplChiFecSeR(9,3,6),ZcplChiFucSuL(9,3,6),ZcplChiFucSuR(9,3,6),ZcplChiFvcSvL(9,3,6),   & 
& ZcplChiFvcSvR(9,3,6),ZcplcHpmVPVWm(2),ZcplcVWmVPVWm,ZcplGluFdcSdL(3,6),ZcplGluFdcSdR(3,6),& 
& ZcplGluFucSuL(3,6),ZcplGluFucSuR(3,6),ZcplHpmcHpmVP(2,2),ZcplHpmcVWmVP(2),             & 
& ZcplSdcSdVG(6,6),ZcplSdcSdVP(6,6),ZcplSecSeVP(6,6),ZcplSucSuVG(6,6),ZcplSucSuVP(6,6)

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
Real(dp), Intent(out) :: gP1LChi(9,194) 
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
Real(dp) :: MRPChiToChiAh(9,9,6),MRGChiToChiAh(9,9,6), MRPZChiToChiAh(9,9,6),MRGZChiToChiAh(9,9,6) 
Real(dp) :: MVPChiToChiAh(9,9,6) 
Real(dp) :: RMsqTreeChiToChiAh(9,9,6),RMsqWaveChiToChiAh(9,9,6),RMsqVertexChiToChiAh(9,9,6) 
Complex(dp) :: AmpTreeChiToChiAh(2,9,9,6),AmpWaveChiToChiAh(2,9,9,6)=(0._dp,0._dp),AmpVertexChiToChiAh(2,9,9,6)& 
 & ,AmpVertexIRosChiToChiAh(2,9,9,6),AmpVertexIRdrChiToChiAh(2,9,9,6), AmpSumChiToChiAh(2,9,9,6), AmpSum2ChiToChiAh(2,9,9,6) 
Complex(dp) :: AmpTreeZChiToChiAh(2,9,9,6),AmpWaveZChiToChiAh(2,9,9,6),AmpVertexZChiToChiAh(2,9,9,6) 
Real(dp) :: AmpSqChiToChiAh(9,9,6),  AmpSqTreeChiToChiAh(9,9,6) 
Real(dp) :: MRPChiToChacHpm(9,2,2),MRGChiToChacHpm(9,2,2), MRPZChiToChacHpm(9,2,2),MRGZChiToChacHpm(9,2,2) 
Real(dp) :: MVPChiToChacHpm(9,2,2) 
Real(dp) :: RMsqTreeChiToChacHpm(9,2,2),RMsqWaveChiToChacHpm(9,2,2),RMsqVertexChiToChacHpm(9,2,2) 
Complex(dp) :: AmpTreeChiToChacHpm(2,9,2,2),AmpWaveChiToChacHpm(2,9,2,2)=(0._dp,0._dp),AmpVertexChiToChacHpm(2,9,2,2)& 
 & ,AmpVertexIRosChiToChacHpm(2,9,2,2),AmpVertexIRdrChiToChacHpm(2,9,2,2), AmpSumChiToChacHpm(2,9,2,2), AmpSum2ChiToChacHpm(2,9,2,2) 
Complex(dp) :: AmpTreeZChiToChacHpm(2,9,2,2),AmpWaveZChiToChacHpm(2,9,2,2),AmpVertexZChiToChacHpm(2,9,2,2) 
Real(dp) :: AmpSqChiToChacHpm(9,2,2),  AmpSqTreeChiToChacHpm(9,2,2) 
Real(dp) :: MRPChiToChacVWm(9,2),MRGChiToChacVWm(9,2), MRPZChiToChacVWm(9,2),MRGZChiToChacVWm(9,2) 
Real(dp) :: MVPChiToChacVWm(9,2) 
Real(dp) :: RMsqTreeChiToChacVWm(9,2),RMsqWaveChiToChacVWm(9,2),RMsqVertexChiToChacVWm(9,2) 
Complex(dp) :: AmpTreeChiToChacVWm(4,9,2),AmpWaveChiToChacVWm(4,9,2)=(0._dp,0._dp),AmpVertexChiToChacVWm(4,9,2)& 
 & ,AmpVertexIRosChiToChacVWm(4,9,2),AmpVertexIRdrChiToChacVWm(4,9,2), AmpSumChiToChacVWm(4,9,2), AmpSum2ChiToChacVWm(4,9,2) 
Complex(dp) :: AmpTreeZChiToChacVWm(4,9,2),AmpWaveZChiToChacVWm(4,9,2),AmpVertexZChiToChacVWm(4,9,2) 
Real(dp) :: AmpSqChiToChacVWm(9,2),  AmpSqTreeChiToChacVWm(9,2) 
Real(dp) :: MRPChiToChihh(9,9,6),MRGChiToChihh(9,9,6), MRPZChiToChihh(9,9,6),MRGZChiToChihh(9,9,6) 
Real(dp) :: MVPChiToChihh(9,9,6) 
Real(dp) :: RMsqTreeChiToChihh(9,9,6),RMsqWaveChiToChihh(9,9,6),RMsqVertexChiToChihh(9,9,6) 
Complex(dp) :: AmpTreeChiToChihh(2,9,9,6),AmpWaveChiToChihh(2,9,9,6)=(0._dp,0._dp),AmpVertexChiToChihh(2,9,9,6)& 
 & ,AmpVertexIRosChiToChihh(2,9,9,6),AmpVertexIRdrChiToChihh(2,9,9,6), AmpSumChiToChihh(2,9,9,6), AmpSum2ChiToChihh(2,9,9,6) 
Complex(dp) :: AmpTreeZChiToChihh(2,9,9,6),AmpWaveZChiToChihh(2,9,9,6),AmpVertexZChiToChihh(2,9,9,6) 
Real(dp) :: AmpSqChiToChihh(9,9,6),  AmpSqTreeChiToChihh(9,9,6) 
Real(dp) :: MRPChiToChiVZ(9,9),MRGChiToChiVZ(9,9), MRPZChiToChiVZ(9,9),MRGZChiToChiVZ(9,9) 
Real(dp) :: MVPChiToChiVZ(9,9) 
Real(dp) :: RMsqTreeChiToChiVZ(9,9),RMsqWaveChiToChiVZ(9,9),RMsqVertexChiToChiVZ(9,9) 
Complex(dp) :: AmpTreeChiToChiVZ(4,9,9),AmpWaveChiToChiVZ(4,9,9)=(0._dp,0._dp),AmpVertexChiToChiVZ(4,9,9)& 
 & ,AmpVertexIRosChiToChiVZ(4,9,9),AmpVertexIRdrChiToChiVZ(4,9,9), AmpSumChiToChiVZ(4,9,9), AmpSum2ChiToChiVZ(4,9,9) 
Complex(dp) :: AmpTreeZChiToChiVZ(4,9,9),AmpWaveZChiToChiVZ(4,9,9),AmpVertexZChiToChiVZ(4,9,9) 
Real(dp) :: AmpSqChiToChiVZ(9,9),  AmpSqTreeChiToChiVZ(9,9) 
Real(dp) :: MRPChiToChiVZp(9,9),MRGChiToChiVZp(9,9), MRPZChiToChiVZp(9,9),MRGZChiToChiVZp(9,9) 
Real(dp) :: MVPChiToChiVZp(9,9) 
Real(dp) :: RMsqTreeChiToChiVZp(9,9),RMsqWaveChiToChiVZp(9,9),RMsqVertexChiToChiVZp(9,9) 
Complex(dp) :: AmpTreeChiToChiVZp(4,9,9),AmpWaveChiToChiVZp(4,9,9)=(0._dp,0._dp),AmpVertexChiToChiVZp(4,9,9)& 
 & ,AmpVertexIRosChiToChiVZp(4,9,9),AmpVertexIRdrChiToChiVZp(4,9,9), AmpSumChiToChiVZp(4,9,9), AmpSum2ChiToChiVZp(4,9,9) 
Complex(dp) :: AmpTreeZChiToChiVZp(4,9,9),AmpWaveZChiToChiVZp(4,9,9),AmpVertexZChiToChiVZp(4,9,9) 
Real(dp) :: AmpSqChiToChiVZp(9,9),  AmpSqTreeChiToChiVZp(9,9) 
Real(dp) :: MRPChiToFdcSd(9,3,6),MRGChiToFdcSd(9,3,6), MRPZChiToFdcSd(9,3,6),MRGZChiToFdcSd(9,3,6) 
Real(dp) :: MVPChiToFdcSd(9,3,6) 
Real(dp) :: RMsqTreeChiToFdcSd(9,3,6),RMsqWaveChiToFdcSd(9,3,6),RMsqVertexChiToFdcSd(9,3,6) 
Complex(dp) :: AmpTreeChiToFdcSd(2,9,3,6),AmpWaveChiToFdcSd(2,9,3,6)=(0._dp,0._dp),AmpVertexChiToFdcSd(2,9,3,6)& 
 & ,AmpVertexIRosChiToFdcSd(2,9,3,6),AmpVertexIRdrChiToFdcSd(2,9,3,6), AmpSumChiToFdcSd(2,9,3,6), AmpSum2ChiToFdcSd(2,9,3,6) 
Complex(dp) :: AmpTreeZChiToFdcSd(2,9,3,6),AmpWaveZChiToFdcSd(2,9,3,6),AmpVertexZChiToFdcSd(2,9,3,6) 
Real(dp) :: AmpSqChiToFdcSd(9,3,6),  AmpSqTreeChiToFdcSd(9,3,6) 
Real(dp) :: MRPChiToFecSe(9,3,6),MRGChiToFecSe(9,3,6), MRPZChiToFecSe(9,3,6),MRGZChiToFecSe(9,3,6) 
Real(dp) :: MVPChiToFecSe(9,3,6) 
Real(dp) :: RMsqTreeChiToFecSe(9,3,6),RMsqWaveChiToFecSe(9,3,6),RMsqVertexChiToFecSe(9,3,6) 
Complex(dp) :: AmpTreeChiToFecSe(2,9,3,6),AmpWaveChiToFecSe(2,9,3,6)=(0._dp,0._dp),AmpVertexChiToFecSe(2,9,3,6)& 
 & ,AmpVertexIRosChiToFecSe(2,9,3,6),AmpVertexIRdrChiToFecSe(2,9,3,6), AmpSumChiToFecSe(2,9,3,6), AmpSum2ChiToFecSe(2,9,3,6) 
Complex(dp) :: AmpTreeZChiToFecSe(2,9,3,6),AmpWaveZChiToFecSe(2,9,3,6),AmpVertexZChiToFecSe(2,9,3,6) 
Real(dp) :: AmpSqChiToFecSe(9,3,6),  AmpSqTreeChiToFecSe(9,3,6) 
Real(dp) :: MRPChiToFucSu(9,3,6),MRGChiToFucSu(9,3,6), MRPZChiToFucSu(9,3,6),MRGZChiToFucSu(9,3,6) 
Real(dp) :: MVPChiToFucSu(9,3,6) 
Real(dp) :: RMsqTreeChiToFucSu(9,3,6),RMsqWaveChiToFucSu(9,3,6),RMsqVertexChiToFucSu(9,3,6) 
Complex(dp) :: AmpTreeChiToFucSu(2,9,3,6),AmpWaveChiToFucSu(2,9,3,6)=(0._dp,0._dp),AmpVertexChiToFucSu(2,9,3,6)& 
 & ,AmpVertexIRosChiToFucSu(2,9,3,6),AmpVertexIRdrChiToFucSu(2,9,3,6), AmpSumChiToFucSu(2,9,3,6), AmpSum2ChiToFucSu(2,9,3,6) 
Complex(dp) :: AmpTreeZChiToFucSu(2,9,3,6),AmpWaveZChiToFucSu(2,9,3,6),AmpVertexZChiToFucSu(2,9,3,6) 
Real(dp) :: AmpSqChiToFucSu(9,3,6),  AmpSqTreeChiToFucSu(9,3,6) 
Real(dp) :: MRPChiToFvcSv(9,3,6),MRGChiToFvcSv(9,3,6), MRPZChiToFvcSv(9,3,6),MRGZChiToFvcSv(9,3,6) 
Real(dp) :: MVPChiToFvcSv(9,3,6) 
Real(dp) :: RMsqTreeChiToFvcSv(9,3,6),RMsqWaveChiToFvcSv(9,3,6),RMsqVertexChiToFvcSv(9,3,6) 
Complex(dp) :: AmpTreeChiToFvcSv(2,9,3,6),AmpWaveChiToFvcSv(2,9,3,6)=(0._dp,0._dp),AmpVertexChiToFvcSv(2,9,3,6)& 
 & ,AmpVertexIRosChiToFvcSv(2,9,3,6),AmpVertexIRdrChiToFvcSv(2,9,3,6), AmpSumChiToFvcSv(2,9,3,6), AmpSum2ChiToFvcSv(2,9,3,6) 
Complex(dp) :: AmpTreeZChiToFvcSv(2,9,3,6),AmpWaveZChiToFvcSv(2,9,3,6),AmpVertexZChiToFvcSv(2,9,3,6) 
Real(dp) :: AmpSqChiToFvcSv(9,3,6),  AmpSqTreeChiToFvcSv(9,3,6) 
Real(dp) :: MRPChiToChiVP(9,9),MRGChiToChiVP(9,9), MRPZChiToChiVP(9,9),MRGZChiToChiVP(9,9) 
Real(dp) :: MVPChiToChiVP(9,9) 
Real(dp) :: RMsqTreeChiToChiVP(9,9),RMsqWaveChiToChiVP(9,9),RMsqVertexChiToChiVP(9,9) 
Complex(dp) :: AmpTreeChiToChiVP(4,9,9),AmpWaveChiToChiVP(4,9,9)=(0._dp,0._dp),AmpVertexChiToChiVP(4,9,9)& 
 & ,AmpVertexIRosChiToChiVP(4,9,9),AmpVertexIRdrChiToChiVP(4,9,9), AmpSumChiToChiVP(4,9,9), AmpSum2ChiToChiVP(4,9,9) 
Complex(dp) :: AmpTreeZChiToChiVP(4,9,9),AmpWaveZChiToChiVP(4,9,9),AmpVertexZChiToChiVP(4,9,9) 
Real(dp) :: AmpSqChiToChiVP(9,9),  AmpSqTreeChiToChiVP(9,9) 
Real(dp) :: MRPChiToGluVG(9),MRGChiToGluVG(9), MRPZChiToGluVG(9),MRGZChiToGluVG(9) 
Real(dp) :: MVPChiToGluVG(9) 
Real(dp) :: RMsqTreeChiToGluVG(9),RMsqWaveChiToGluVG(9),RMsqVertexChiToGluVG(9) 
Complex(dp) :: AmpTreeChiToGluVG(4,9),AmpWaveChiToGluVG(4,9)=(0._dp,0._dp),AmpVertexChiToGluVG(4,9)& 
 & ,AmpVertexIRosChiToGluVG(4,9),AmpVertexIRdrChiToGluVG(4,9), AmpSumChiToGluVG(4,9), AmpSum2ChiToGluVG(4,9) 
Complex(dp) :: AmpTreeZChiToGluVG(4,9),AmpWaveZChiToGluVG(4,9),AmpVertexZChiToGluVG(4,9) 
Real(dp) :: AmpSqChiToGluVG(9),  AmpSqTreeChiToGluVG(9) 
Write(*,*) "Calculating one-loop decays of Chi " 
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
! Chi Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_ChiToChiAh(cplChiChiAhL,cplChiChiAhR,MAh,               & 
& MChi,MAh2,MChi2,AmpTreeChiToChiAh)

  Else 
Call Amplitude_Tree_sec_UMSSM_ChiToChiAh(ZcplChiChiAhL,ZcplChiChiAhR,MAh,             & 
& MChi,MAh2,MChi2,AmpTreeChiToChiAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToChiAh(MLambda,em,gs,cplChiChiAhL,cplChiChiAhR,         & 
& MAhOS,MChiOS,MRPChiToChiAh,MRGChiToChiAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToChiAh(MLambda,em,gs,ZcplChiChiAhL,ZcplChiChiAhR,       & 
& MAhOS,MChiOS,MRPChiToChiAh,MRGChiToChiAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_ChiToChiAh(MLambda,em,gs,cplChiChiAhL,cplChiChiAhR,         & 
& MAh,MChi,MRPChiToChiAh,MRGChiToChiAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToChiAh(MLambda,em,gs,ZcplChiChiAhL,ZcplChiChiAhR,       & 
& MAh,MChi,MRPChiToChiAh,MRGChiToChiAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChiToChiAh(cplChiChiAhL,cplChiChiAhR,ctcplChiChiAhL,    & 
& ctcplChiChiAhR,MAh,MAh2,MChi,MChi2,ZfAh,ZfL0,AmpWaveChiToChiAh)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChiToChiAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,       & 
& cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,      & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexChiToChiAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChiAh(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,              & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,               & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,      & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRdrChiToChiAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChiAh(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,            & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,         & 
& cplcChaChaAhR,ZcplChiChiAhL,ZcplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,         & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,       & 
& cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,      & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRosChiToChiAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChiAh(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,              & 
& cplcChaChaAhL,cplcChaChaAhR,ZcplChiChiAhL,ZcplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,       & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,               & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,      & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRosChiToChiAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChiAh(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,            & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,         & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,       & 
& cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,      & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,              & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRosChiToChiAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChiAh(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,              & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,               & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,      & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRosChiToChiAh)

 End if 
 End if 
AmpVertexChiToChiAh = AmpVertexChiToChiAh -  AmpVertexIRdrChiToChiAh! +  AmpVertexIRosChiToChiAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToChiAh=0._dp 
AmpVertexZChiToChiAh=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZChiToChiAh(1,gt2,:,:) = AmpWaveZChiToChiAh(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChiAh(1,gt1,:,:) 
AmpVertexZChiToChiAh(1,gt2,:,:)= AmpVertexZChiToChiAh(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChiAh(1,gt1,:,:) 
AmpWaveZChiToChiAh(2,gt2,:,:) = AmpWaveZChiToChiAh(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiAh(2,gt1,:,:) 
AmpVertexZChiToChiAh(2,gt2,:,:)= AmpVertexZChiToChiAh(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChiAh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToChiAh=AmpWaveZChiToChiAh 
AmpVertexChiToChiAh= AmpVertexZChiToChiAh
! Final State 1 
AmpWaveZChiToChiAh=0._dp 
AmpVertexZChiToChiAh=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZChiToChiAh(1,:,gt2,:) = AmpWaveZChiToChiAh(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChiAh(1,:,gt1,:) 
AmpVertexZChiToChiAh(1,:,gt2,:)= AmpVertexZChiToChiAh(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpVertexChiToChiAh(1,:,gt1,:) 
AmpWaveZChiToChiAh(2,:,gt2,:) = AmpWaveZChiToChiAh(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiAh(2,:,gt1,:) 
AmpVertexZChiToChiAh(2,:,gt2,:)= AmpVertexZChiToChiAh(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpVertexChiToChiAh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChiToChiAh=AmpWaveZChiToChiAh 
AmpVertexChiToChiAh= AmpVertexZChiToChiAh
! Final State 2 
AmpWaveZChiToChiAh=0._dp 
AmpVertexZChiToChiAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChiToChiAh(:,:,:,gt2) = AmpWaveZChiToChiAh(:,:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveChiToChiAh(:,:,:,gt1) 
AmpVertexZChiToChiAh(:,:,:,gt2)= AmpVertexZChiToChiAh(:,:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexChiToChiAh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToChiAh=AmpWaveZChiToChiAh 
AmpVertexChiToChiAh= AmpVertexZChiToChiAh
End if
If (ShiftIRdiv) Then 
AmpVertexChiToChiAh = AmpVertexChiToChiAh  +  AmpVertexIRosChiToChiAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Chi Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToChiAh = AmpTreeChiToChiAh 
 AmpSum2ChiToChiAh = AmpTreeChiToChiAh + 2._dp*AmpWaveChiToChiAh + 2._dp*AmpVertexChiToChiAh  
Else 
 AmpSumChiToChiAh = AmpTreeChiToChiAh + AmpWaveChiToChiAh + AmpVertexChiToChiAh
 AmpSum2ChiToChiAh = AmpTreeChiToChiAh + AmpWaveChiToChiAh + AmpVertexChiToChiAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToChiAh = AmpTreeChiToChiAh
 AmpSum2ChiToChiAh = AmpTreeChiToChiAh 
End if 
Do gt1=1,9
i4 = isave 
  Do gt2=1,9
    Do gt3=3,6
If (((OSkinematics).and.(Abs(MChiOS(gt1)).gt.(Abs(MChiOS(gt2))+Abs(MAhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MChi(gt1)).gt.(Abs(MChi(gt2))+Abs(MAh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToChiAh = AmpTreeChiToChiAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MAhOS(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),MAh(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToChiAh(gt1, gt2, gt3) 
  AmpSum2ChiToChiAh = 2._dp*AmpWaveChiToChiAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MAhOS(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),MAh(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToChiAh(gt1, gt2, gt3) 
  AmpSum2ChiToChiAh = 2._dp*AmpVertexChiToChiAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MAhOS(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),MAh(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToChiAh(gt1, gt2, gt3) 
  AmpSum2ChiToChiAh = AmpTreeChiToChiAh + 2._dp*AmpWaveChiToChiAh + 2._dp*AmpVertexChiToChiAh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MAhOS(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),MAh(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToChiAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToChiAh = AmpTreeChiToChiAh
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MAhOS(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
  AmpSqTreeChiToChiAh(gt1, gt2, gt3) = AmpSqChiToChiAh(gt1, gt2, gt3)  
  AmpSum2ChiToChiAh = + 2._dp*AmpWaveChiToChiAh + 2._dp*AmpVertexChiToChiAh
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MAhOS(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
  AmpSqChiToChiAh(gt1, gt2, gt3) = AmpSqChiToChiAh(gt1, gt2, gt3) + AmpSqTreeChiToChiAh(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToChiAh = AmpTreeChiToChiAh
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),MAh(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
  AmpSqTreeChiToChiAh(gt1, gt2, gt3) = AmpSqChiToChiAh(gt1, gt2, gt3)  
  AmpSum2ChiToChiAh = + 2._dp*AmpWaveChiToChiAh + 2._dp*AmpVertexChiToChiAh
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),MAh(gt3),AmpSumChiToChiAh(:,gt1, gt2, gt3),AmpSum2ChiToChiAh(:,gt1, gt2, gt3),AmpSqChiToChiAh(gt1, gt2, gt3)) 
  AmpSqChiToChiAh(gt1, gt2, gt3) = AmpSqChiToChiAh(gt1, gt2, gt3) + AmpSqTreeChiToChiAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToChiAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToChiAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChiOS(gt1),MChiOS(gt2),MAhOS(gt3),helfactor*AmpSqChiToChiAh(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChi(gt1),MChi(gt2),MAh(gt3),helfactor*AmpSqChiToChiAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToChiAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToChiAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToChiAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToChiAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPChiToChiAh(gt1, gt2, gt3) + MRGChiToChiAh(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPChiToChiAh(gt1, gt2, gt3) + MRGChiToChiAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.9) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Cha Conjg(Hpm)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_ChiToChacHpm(cplChiChacHpmL,cplChiChacHpmR,             & 
& MCha,MChi,MHpm,MCha2,MChi2,MHpm2,AmpTreeChiToChacHpm)

  Else 
Call Amplitude_Tree_sec_UMSSM_ChiToChacHpm(ZcplChiChacHpmL,ZcplChiChacHpmR,           & 
& MCha,MChi,MHpm,MCha2,MChi2,MHpm2,AmpTreeChiToChacHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToChacHpm(MLambda,em,gs,cplChiChacHpmL,cplChiChacHpmR,   & 
& MChaOS,MChiOS,MHpmOS,MRPChiToChacHpm,MRGChiToChacHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToChacHpm(MLambda,em,gs,ZcplChiChacHpmL,ZcplChiChacHpmR, & 
& MChaOS,MChiOS,MHpmOS,MRPChiToChacHpm,MRGChiToChacHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_ChiToChacHpm(MLambda,em,gs,cplChiChacHpmL,cplChiChacHpmR,   & 
& MCha,MChi,MHpm,MRPChiToChacHpm,MRGChiToChacHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToChacHpm(MLambda,em,gs,ZcplChiChacHpmL,ZcplChiChacHpmR, & 
& MCha,MChi,MHpm,MRPChiToChacHpm,MRGChiToChacHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChiToChacHpm(cplChiChacHpmL,cplChiChacHpmR,             & 
& ctcplChiChacHpmL,ctcplChiChacHpmR,MCha,MCha2,MChi,MChi2,MHpm,MHpm2,ZfHpm,              & 
& ZfL0,ZfLm,ZfLp,AmpWaveChiToChacHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChiToChacHpm(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,       & 
& cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,   & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,      & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFvFecHpmL,  & 
& cplcFvFecHpmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,       & 
& cplSdcHpmcSu,cplSecHpmcSv,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,AmpVertexChiToChacHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChacHpm(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,       & 
& cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,   & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,      & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFvFecHpmL,  & 
& cplcFvFecHpmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,       & 
& cplSdcHpmcSu,cplSecHpmcSv,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,AmpVertexIRdrChiToChacHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChacHpm(MAhOS,MChaOS,MChiOS,MFdOS,            & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhcHpmVWm,ZcplChiChacHpmL,ZcplChiChacHpmR,   & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,       & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFvFecHpmL,               & 
& cplcFvFecHpmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,       & 
& cplSdcHpmcSu,cplSecHpmcSv,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,AmpVertexIRosChiToChacHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChacHpm(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhcHpmVWm,ZcplChiChacHpmL,     & 
& ZcplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,               & 
& cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,       & 
& cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,     & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,     & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,cplcFuFdcHpmR,   & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,       & 
& cplHpmcHpmVZp,cplSdcHpmcSu,cplSecHpmcSv,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,       & 
& AmpVertexIRosChiToChacHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChacHpm(MAhOS,MChaOS,MChiOS,MFdOS,            & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,     & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,       & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFvFecHpmL,               & 
& cplcFvFecHpmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,       & 
& cplSdcHpmcSu,cplSecHpmcSv,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,AmpVertexIRosChiToChacHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChacHpm(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhcHpmVWm,cplChiChacHpmL,      & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,       & 
& cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,   & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,      & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFvFecHpmL,  & 
& cplcFvFecHpmR,cplhhHpmcHpm,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,       & 
& cplSdcHpmcSu,cplSecHpmcSv,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,AmpVertexIRosChiToChacHpm)

 End if 
 End if 
AmpVertexChiToChacHpm = AmpVertexChiToChacHpm -  AmpVertexIRdrChiToChacHpm! +  AmpVertexIRosChiToChacHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToChacHpm=0._dp 
AmpVertexZChiToChacHpm=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZChiToChacHpm(1,gt2,:,:) = AmpWaveZChiToChacHpm(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChacHpm(1,gt1,:,:) 
AmpVertexZChiToChacHpm(1,gt2,:,:)= AmpVertexZChiToChacHpm(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChacHpm(1,gt1,:,:) 
AmpWaveZChiToChacHpm(2,gt2,:,:) = AmpWaveZChiToChacHpm(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChacHpm(2,gt1,:,:) 
AmpVertexZChiToChacHpm(2,gt2,:,:)= AmpVertexZChiToChacHpm(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChacHpm(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToChacHpm=AmpWaveZChiToChacHpm 
AmpVertexChiToChacHpm= AmpVertexZChiToChacHpm
! Final State 1 
AmpWaveZChiToChacHpm=0._dp 
AmpVertexZChiToChacHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChiToChacHpm(1,:,gt2,:) = AmpWaveZChiToChacHpm(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpWaveChiToChacHpm(1,:,gt1,:) 
AmpVertexZChiToChacHpm(1,:,gt2,:)= AmpVertexZChiToChacHpm(1,:,gt2,:)+ZRUUM(gt2,gt1)*AmpVertexChiToChacHpm(1,:,gt1,:) 
AmpWaveZChiToChacHpm(2,:,gt2,:) = AmpWaveZChiToChacHpm(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpWaveChiToChacHpm(2,:,gt1,:) 
AmpVertexZChiToChacHpm(2,:,gt2,:)= AmpVertexZChiToChacHpm(2,:,gt2,:)+ZRUUPc(gt2,gt1)*AmpVertexChiToChacHpm(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChiToChacHpm=AmpWaveZChiToChacHpm 
AmpVertexChiToChacHpm= AmpVertexZChiToChacHpm
! Final State 2 
AmpWaveZChiToChacHpm=0._dp 
AmpVertexZChiToChacHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChiToChacHpm(:,:,:,gt2) = AmpWaveZChiToChacHpm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveChiToChacHpm(:,:,:,gt1) 
AmpVertexZChiToChacHpm(:,:,:,gt2)= AmpVertexZChiToChacHpm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexChiToChacHpm(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToChacHpm=AmpWaveZChiToChacHpm 
AmpVertexChiToChacHpm= AmpVertexZChiToChacHpm
End if
If (ShiftIRdiv) Then 
AmpVertexChiToChacHpm = AmpVertexChiToChacHpm  +  AmpVertexIRosChiToChacHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Cha conj[Hpm] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToChacHpm = AmpTreeChiToChacHpm 
 AmpSum2ChiToChacHpm = AmpTreeChiToChacHpm + 2._dp*AmpWaveChiToChacHpm + 2._dp*AmpVertexChiToChacHpm  
Else 
 AmpSumChiToChacHpm = AmpTreeChiToChacHpm + AmpWaveChiToChacHpm + AmpVertexChiToChacHpm
 AmpSum2ChiToChacHpm = AmpTreeChiToChacHpm + AmpWaveChiToChacHpm + AmpVertexChiToChacHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToChacHpm = AmpTreeChiToChacHpm
 AmpSum2ChiToChacHpm = AmpTreeChiToChacHpm 
End if 
Do gt1=1,9
i4 = isave 
  Do gt2=1,2
    Do gt3=2,2
If (((OSkinematics).and.(Abs(MChiOS(gt1)).gt.(Abs(MChaOS(gt2))+Abs(MHpmOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MChi(gt1)).gt.(Abs(MCha(gt2))+Abs(MHpm(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToChacHpm = AmpTreeChiToChacHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChaOS(gt2),MHpmOS(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MCha(gt2),MHpm(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToChacHpm(gt1, gt2, gt3) 
  AmpSum2ChiToChacHpm = 2._dp*AmpWaveChiToChacHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChaOS(gt2),MHpmOS(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MCha(gt2),MHpm(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToChacHpm(gt1, gt2, gt3) 
  AmpSum2ChiToChacHpm = 2._dp*AmpVertexChiToChacHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChaOS(gt2),MHpmOS(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MCha(gt2),MHpm(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToChacHpm(gt1, gt2, gt3) 
  AmpSum2ChiToChacHpm = AmpTreeChiToChacHpm + 2._dp*AmpWaveChiToChacHpm + 2._dp*AmpVertexChiToChacHpm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChaOS(gt2),MHpmOS(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MCha(gt2),MHpm(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToChacHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToChacHpm = AmpTreeChiToChacHpm
  Call SquareAmp_FtoFS(MChiOS(gt1),MChaOS(gt2),MHpmOS(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
  AmpSqTreeChiToChacHpm(gt1, gt2, gt3) = AmpSqChiToChacHpm(gt1, gt2, gt3)  
  AmpSum2ChiToChacHpm = + 2._dp*AmpWaveChiToChacHpm + 2._dp*AmpVertexChiToChacHpm
  Call SquareAmp_FtoFS(MChiOS(gt1),MChaOS(gt2),MHpmOS(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
  AmpSqChiToChacHpm(gt1, gt2, gt3) = AmpSqChiToChacHpm(gt1, gt2, gt3) + AmpSqTreeChiToChacHpm(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToChacHpm = AmpTreeChiToChacHpm
  Call SquareAmp_FtoFS(MChi(gt1),MCha(gt2),MHpm(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
  AmpSqTreeChiToChacHpm(gt1, gt2, gt3) = AmpSqChiToChacHpm(gt1, gt2, gt3)  
  AmpSum2ChiToChacHpm = + 2._dp*AmpWaveChiToChacHpm + 2._dp*AmpVertexChiToChacHpm
  Call SquareAmp_FtoFS(MChi(gt1),MCha(gt2),MHpm(gt3),AmpSumChiToChacHpm(:,gt1, gt2, gt3),AmpSum2ChiToChacHpm(:,gt1, gt2, gt3),AmpSqChiToChacHpm(gt1, gt2, gt3)) 
  AmpSqChiToChacHpm(gt1, gt2, gt3) = AmpSqChiToChacHpm(gt1, gt2, gt3) + AmpSqTreeChiToChacHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToChacHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToChacHpm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChiOS(gt1),MChaOS(gt2),MHpmOS(gt3),helfactor*AmpSqChiToChacHpm(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChi(gt1),MCha(gt2),MHpm(gt3),helfactor*AmpSqChiToChacHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToChacHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToChacHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToChacHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToChacHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPChiToChacHpm(gt1, gt2, gt3) + MRGChiToChacHpm(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPChiToChacHpm(gt1, gt2, gt3) + MRGChiToChacHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.9) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Cha Conjg(VWm)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_ChiToChacVWm(cplChiChacVWmL,cplChiChacVWmR,             & 
& MCha,MChi,MVWm,MCha2,MChi2,MVWm2,AmpTreeChiToChacVWm)

  Else 
Call Amplitude_Tree_sec_UMSSM_ChiToChacVWm(ZcplChiChacVWmL,ZcplChiChacVWmR,           & 
& MCha,MChi,MVWm,MCha2,MChi2,MVWm2,AmpTreeChiToChacVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToChacVWm(MLambda,em,gs,cplChiChacVWmL,cplChiChacVWmR,   & 
& MChaOS,MChiOS,MVWmOS,MRPChiToChacVWm,MRGChiToChacVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToChacVWm(MLambda,em,gs,ZcplChiChacVWmL,ZcplChiChacVWmR, & 
& MChaOS,MChiOS,MVWmOS,MRPChiToChacVWm,MRGChiToChacVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_ChiToChacVWm(MLambda,em,gs,cplChiChacVWmL,cplChiChacVWmR,   & 
& MCha,MChi,MVWm,MRPChiToChacVWm,MRGChiToChacVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToChacVWm(MLambda,em,gs,ZcplChiChacVWmL,ZcplChiChacVWmR, & 
& MCha,MChi,MVWm,MRPChiToChacVWm,MRGChiToChacVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChiToChacVWm(cplChiChacVWmL,cplChiChacVWmR,             & 
& ctcplChiChacVWmL,ctcplChiChacVWmR,MCha,MCha2,MChi,MChi2,MVWm,MVWm2,ZfL0,               & 
& ZfLm,ZfLp,ZfVWm,AmpWaveChiToChacVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChiToChacVWm(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcVWm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,       & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,               & 
& cplcFvFecVWmR,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,       & 
& cplSdcSucVWm,cplSecSvcVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,AmpVertexChiToChacVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChacVWm(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcVWm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,       & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,               & 
& cplcFvFecVWmR,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,       & 
& cplSdcSucVWm,cplSecSvcVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,AmpVertexIRdrChiToChacVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChacVWm(MAhOS,MChaOS,MChiOS,MFdOS,            & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplChiChiAhL,cplChiChiAhR,cplAhHpmcVWm,GosZcplChiChacHpmL,GosZcplChiChacHpmR,          & 
& ZcplChiChacVWmL,ZcplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,   & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,       & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,               & 
& cplcFvFecVWmR,cplhhHpmcVWm,cplhhcVWmVWm,GosZcplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,   & 
& cplSdcSucVWm,cplSecSvcVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,AmpVertexIRosChiToChacVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChacVWm(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcVWm,GZcplChiChacHpmL,GZcplChiChacHpmR,& 
& ZcplChiChacVWmL,ZcplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,   & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,       & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,               & 
& cplcFvFecVWmR,cplhhHpmcVWm,cplhhcVWmVWm,GZcplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,     & 
& cplSdcSucVWm,cplSecSvcVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,AmpVertexIRosChiToChacVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChacVWm(MAhOS,MChaOS,MChiOS,MFdOS,            & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplChiChiAhL,cplChiChiAhR,cplAhHpmcVWm,GcplChiChacHpmL,GcplChiChacHpmR,cplChiChacVWmL, & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,       & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,               & 
& cplcFvFecVWmR,cplhhHpmcVWm,cplhhcVWmVWm,GcplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,      & 
& cplSdcSucVWm,cplSecSvcVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,AmpVertexIRosChiToChacVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChacVWm(MAh,MCha,MChi,MFd,MFe,MFu,            & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcVWm,cplChiChacHpmL,cplChiChacHpmR,    & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,       & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,               & 
& cplcFvFecVWmR,cplhhHpmcVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,       & 
& cplSdcSucVWm,cplSecSvcVWm,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,AmpVertexIRosChiToChacVWm)

 End if 
 End if 
AmpVertexChiToChacVWm = AmpVertexChiToChacVWm -  AmpVertexIRdrChiToChacVWm! +  AmpVertexIRosChiToChacVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToChacVWm=0._dp 
AmpVertexZChiToChacVWm=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZChiToChacVWm(1,gt2,:) = AmpWaveZChiToChacVWm(1,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChacVWm(1,gt1,:) 
AmpVertexZChiToChacVWm(1,gt2,:)= AmpVertexZChiToChacVWm(1,gt2,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChacVWm(1,gt1,:) 
AmpWaveZChiToChacVWm(2,gt2,:) = AmpWaveZChiToChacVWm(2,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChacVWm(2,gt1,:) 
AmpVertexZChiToChacVWm(2,gt2,:)= AmpVertexZChiToChacVWm(2,gt2,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChacVWm(2,gt1,:) 
AmpWaveZChiToChacVWm(3,gt2,:) = AmpWaveZChiToChacVWm(3,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChacVWm(3,gt1,:) 
AmpVertexZChiToChacVWm(3,gt2,:)= AmpVertexZChiToChacVWm(3,gt2,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChacVWm(3,gt1,:) 
AmpWaveZChiToChacVWm(4,gt2,:) = AmpWaveZChiToChacVWm(4,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChacVWm(4,gt1,:) 
AmpVertexZChiToChacVWm(4,gt2,:)= AmpVertexZChiToChacVWm(4,gt2,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChacVWm(4,gt1,:) 
 End Do 
End Do 
AmpWaveChiToChacVWm=AmpWaveZChiToChacVWm 
AmpVertexChiToChacVWm= AmpVertexZChiToChacVWm
! Final State 1 
AmpWaveZChiToChacVWm=0._dp 
AmpVertexZChiToChacVWm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZChiToChacVWm(1,:,gt2) = AmpWaveZChiToChacVWm(1,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveChiToChacVWm(1,:,gt1) 
AmpVertexZChiToChacVWm(1,:,gt2)= AmpVertexZChiToChacVWm(1,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexChiToChacVWm(1,:,gt1) 
AmpWaveZChiToChacVWm(2,:,gt2) = AmpWaveZChiToChacVWm(2,:,gt2)+ZRUUPc(gt2,gt1)*AmpWaveChiToChacVWm(2,:,gt1) 
AmpVertexZChiToChacVWm(2,:,gt2)= AmpVertexZChiToChacVWm(2,:,gt2)+ZRUUPc(gt2,gt1)*AmpVertexChiToChacVWm(2,:,gt1) 
AmpWaveZChiToChacVWm(3,:,gt2) = AmpWaveZChiToChacVWm(3,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveChiToChacVWm(3,:,gt1) 
AmpVertexZChiToChacVWm(3,:,gt2)= AmpVertexZChiToChacVWm(3,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexChiToChacVWm(3,:,gt1) 
AmpWaveZChiToChacVWm(4,:,gt2) = AmpWaveZChiToChacVWm(4,:,gt2)+ZRUUPc(gt2,gt1)*AmpWaveChiToChacVWm(4,:,gt1) 
AmpVertexZChiToChacVWm(4,:,gt2)= AmpVertexZChiToChacVWm(4,:,gt2)+ZRUUPc(gt2,gt1)*AmpVertexChiToChacVWm(4,:,gt1) 
 End Do 
End Do 
AmpWaveChiToChacVWm=AmpWaveZChiToChacVWm 
AmpVertexChiToChacVWm= AmpVertexZChiToChacVWm
End if
If (ShiftIRdiv) Then 
AmpVertexChiToChacVWm = AmpVertexChiToChacVWm  +  AmpVertexIRosChiToChacVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Cha conj[VWm] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToChacVWm = AmpTreeChiToChacVWm 
 AmpSum2ChiToChacVWm = AmpTreeChiToChacVWm + 2._dp*AmpWaveChiToChacVWm + 2._dp*AmpVertexChiToChacVWm  
Else 
 AmpSumChiToChacVWm = AmpTreeChiToChacVWm + AmpWaveChiToChacVWm + AmpVertexChiToChacVWm
 AmpSum2ChiToChacVWm = AmpTreeChiToChacVWm + AmpWaveChiToChacVWm + AmpVertexChiToChacVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToChacVWm = AmpTreeChiToChacVWm
 AmpSum2ChiToChacVWm = AmpTreeChiToChacVWm 
End if 
Do gt1=1,9
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(Abs(MChiOS(gt1)).gt.(Abs(MChaOS(gt2))+Abs(MVWmOS)))).or.((.not.OSkinematics).and.(Abs(MChi(gt1)).gt.(Abs(MCha(gt2))+Abs(MVWm))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2ChiToChacVWm = AmpTreeChiToChacVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChaOS(gt2),MVWmOS,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MCha(gt2),MVWm,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToChacVWm(gt1, gt2) 
  AmpSum2ChiToChacVWm = 2._dp*AmpWaveChiToChacVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChaOS(gt2),MVWmOS,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MCha(gt2),MVWm,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToChacVWm(gt1, gt2) 
  AmpSum2ChiToChacVWm = 2._dp*AmpVertexChiToChacVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChaOS(gt2),MVWmOS,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MCha(gt2),MVWm,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToChacVWm(gt1, gt2) 
  AmpSum2ChiToChacVWm = AmpTreeChiToChacVWm + 2._dp*AmpWaveChiToChacVWm + 2._dp*AmpVertexChiToChacVWm
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChaOS(gt2),MVWmOS,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MCha(gt2),MVWm,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToChacVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToChacVWm = AmpTreeChiToChacVWm
  Call SquareAmp_FtoFV(MChiOS(gt1),MChaOS(gt2),MVWmOS,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
  AmpSqTreeChiToChacVWm(gt1, gt2) = AmpSqChiToChacVWm(gt1, gt2)  
  AmpSum2ChiToChacVWm = + 2._dp*AmpWaveChiToChacVWm + 2._dp*AmpVertexChiToChacVWm
  Call SquareAmp_FtoFV(MChiOS(gt1),MChaOS(gt2),MVWmOS,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
  AmpSqChiToChacVWm(gt1, gt2) = AmpSqChiToChacVWm(gt1, gt2) + AmpSqTreeChiToChacVWm(gt1, gt2)  
Else  
  AmpSum2ChiToChacVWm = AmpTreeChiToChacVWm
  Call SquareAmp_FtoFV(MChi(gt1),MCha(gt2),MVWm,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
  AmpSqTreeChiToChacVWm(gt1, gt2) = AmpSqChiToChacVWm(gt1, gt2)  
  AmpSum2ChiToChacVWm = + 2._dp*AmpWaveChiToChacVWm + 2._dp*AmpVertexChiToChacVWm
  Call SquareAmp_FtoFV(MChi(gt1),MCha(gt2),MVWm,AmpSumChiToChacVWm(:,gt1, gt2),AmpSum2ChiToChacVWm(:,gt1, gt2),AmpSqChiToChacVWm(gt1, gt2)) 
  AmpSqChiToChacVWm(gt1, gt2) = AmpSqChiToChacVWm(gt1, gt2) + AmpSqTreeChiToChacVWm(gt1, gt2)  
End if  
Else  
  AmpSqChiToChacVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToChacVWm(gt1, gt2).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChiOS(gt1),MChaOS(gt2),MVWmOS,helfactor*AmpSqChiToChacVWm(gt1, gt2))
Else 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChi(gt1),MCha(gt2),MVWm,helfactor*AmpSqChiToChacVWm(gt1, gt2))
End if 
If ((Abs(MRPChiToChacVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChiToChacVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToChacVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChiToChacVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPChiToChacVWm(gt1, gt2) + MRGChiToChacVWm(gt1, gt2)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPChiToChacVWm(gt1, gt2) + MRGChiToChacVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.9) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Chi hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_ChiToChihh(cplChiChihhL,cplChiChihhR,MChi,              & 
& Mhh,MChi2,Mhh2,AmpTreeChiToChihh)

  Else 
Call Amplitude_Tree_sec_UMSSM_ChiToChihh(ZcplChiChihhL,ZcplChiChihhR,MChi,            & 
& Mhh,MChi2,Mhh2,AmpTreeChiToChihh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToChihh(MLambda,em,gs,cplChiChihhL,cplChiChihhR,         & 
& MChiOS,MhhOS,MRPChiToChihh,MRGChiToChihh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToChihh(MLambda,em,gs,ZcplChiChihhL,ZcplChiChihhR,       & 
& MChiOS,MhhOS,MRPChiToChihh,MRGChiToChihh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_ChiToChihh(MLambda,em,gs,cplChiChihhL,cplChiChihhR,         & 
& MChi,Mhh,MRPChiToChihh,MRGChiToChihh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToChihh(MLambda,em,gs,ZcplChiChihhL,ZcplChiChihhR,       & 
& MChi,Mhh,MRPChiToChihh,MRGChiToChihh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChiToChihh(cplChiChihhL,cplChiChihhR,ctcplChiChihhL,    & 
& ctcplChiChihhR,MChi,MChi2,Mhh,Mhh2,Zfhh,ZfL0,AmpWaveChiToChihh)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChiToChihh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplChiChiAhL,cplChiChiAhR,   & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,           & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,     & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,       & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,               & 
& cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,      & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexChiToChihh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChihh(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplChiChiAhL,           & 
& cplChiChiAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,             & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,   & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,         & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFvFvhhL,cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,     & 
& cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,      & 
& AmpVertexIRdrChiToChihh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChihh(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,            & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplChiChiAhL,cplChiChiAhR,       & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,           & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,ZcplChiChihhL,ZcplChiChihhR,cplChiChiVZL,   & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,       & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,               & 
& cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,      & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRosChiToChihh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChihh(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplChiChiAhL,           & 
& cplChiChiAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,             & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,ZcplChiChihhL,               & 
& ZcplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,      & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,         & 
& cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,     & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,       & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFvFvhhL,cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,               & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,       & 
& cplhhVZVZp,cplhhVZpVZp,AmpVertexIRosChiToChihh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChihh(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,            & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplChiChiAhL,cplChiChiAhR,       & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,           & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,     & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,       & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,       & 
& cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,               & 
& cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,      & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRosChiToChihh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChihh(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplChiChiAhL,           & 
& cplChiChiAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,             & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,   & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,         & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFvFvhhL,cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,     & 
& cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,      & 
& AmpVertexIRosChiToChihh)

 End if 
 End if 
AmpVertexChiToChihh = AmpVertexChiToChihh -  AmpVertexIRdrChiToChihh! +  AmpVertexIRosChiToChihh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToChihh=0._dp 
AmpVertexZChiToChihh=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZChiToChihh(1,gt2,:,:) = AmpWaveZChiToChihh(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChihh(1,gt1,:,:) 
AmpVertexZChiToChihh(1,gt2,:,:)= AmpVertexZChiToChihh(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChihh(1,gt1,:,:) 
AmpWaveZChiToChihh(2,gt2,:,:) = AmpWaveZChiToChihh(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChihh(2,gt1,:,:) 
AmpVertexZChiToChihh(2,gt2,:,:)= AmpVertexZChiToChihh(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChihh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToChihh=AmpWaveZChiToChihh 
AmpVertexChiToChihh= AmpVertexZChiToChihh
! Final State 1 
AmpWaveZChiToChihh=0._dp 
AmpVertexZChiToChihh=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZChiToChihh(1,:,gt2,:) = AmpWaveZChiToChihh(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChihh(1,:,gt1,:) 
AmpVertexZChiToChihh(1,:,gt2,:)= AmpVertexZChiToChihh(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpVertexChiToChihh(1,:,gt1,:) 
AmpWaveZChiToChihh(2,:,gt2,:) = AmpWaveZChiToChihh(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChihh(2,:,gt1,:) 
AmpVertexZChiToChihh(2,:,gt2,:)= AmpVertexZChiToChihh(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpVertexChiToChihh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChiToChihh=AmpWaveZChiToChihh 
AmpVertexChiToChihh= AmpVertexZChiToChihh
! Final State 2 
AmpWaveZChiToChihh=0._dp 
AmpVertexZChiToChihh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChiToChihh(:,:,:,gt2) = AmpWaveZChiToChihh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveChiToChihh(:,:,:,gt1) 
AmpVertexZChiToChihh(:,:,:,gt2)= AmpVertexZChiToChihh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexChiToChihh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToChihh=AmpWaveZChiToChihh 
AmpVertexChiToChihh= AmpVertexZChiToChihh
End if
If (ShiftIRdiv) Then 
AmpVertexChiToChihh = AmpVertexChiToChihh  +  AmpVertexIRosChiToChihh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Chi hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToChihh = AmpTreeChiToChihh 
 AmpSum2ChiToChihh = AmpTreeChiToChihh + 2._dp*AmpWaveChiToChihh + 2._dp*AmpVertexChiToChihh  
Else 
 AmpSumChiToChihh = AmpTreeChiToChihh + AmpWaveChiToChihh + AmpVertexChiToChihh
 AmpSum2ChiToChihh = AmpTreeChiToChihh + AmpWaveChiToChihh + AmpVertexChiToChihh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToChihh = AmpTreeChiToChihh
 AmpSum2ChiToChihh = AmpTreeChiToChihh 
End if 
Do gt1=1,9
i4 = isave 
  Do gt2=1,9
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MChiOS(gt1)).gt.(Abs(MChiOS(gt2))+Abs(MhhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MChi(gt1)).gt.(Abs(MChi(gt2))+Abs(Mhh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToChihh = AmpTreeChiToChihh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MhhOS(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),Mhh(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToChihh(gt1, gt2, gt3) 
  AmpSum2ChiToChihh = 2._dp*AmpWaveChiToChihh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MhhOS(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),Mhh(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToChihh(gt1, gt2, gt3) 
  AmpSum2ChiToChihh = 2._dp*AmpVertexChiToChihh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MhhOS(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),Mhh(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToChihh(gt1, gt2, gt3) 
  AmpSum2ChiToChihh = AmpTreeChiToChihh + 2._dp*AmpWaveChiToChihh + 2._dp*AmpVertexChiToChihh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MhhOS(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),Mhh(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToChihh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToChihh = AmpTreeChiToChihh
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MhhOS(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
  AmpSqTreeChiToChihh(gt1, gt2, gt3) = AmpSqChiToChihh(gt1, gt2, gt3)  
  AmpSum2ChiToChihh = + 2._dp*AmpWaveChiToChihh + 2._dp*AmpVertexChiToChihh
  Call SquareAmp_FtoFS(MChiOS(gt1),MChiOS(gt2),MhhOS(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
  AmpSqChiToChihh(gt1, gt2, gt3) = AmpSqChiToChihh(gt1, gt2, gt3) + AmpSqTreeChiToChihh(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToChihh = AmpTreeChiToChihh
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),Mhh(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
  AmpSqTreeChiToChihh(gt1, gt2, gt3) = AmpSqChiToChihh(gt1, gt2, gt3)  
  AmpSum2ChiToChihh = + 2._dp*AmpWaveChiToChihh + 2._dp*AmpVertexChiToChihh
  Call SquareAmp_FtoFS(MChi(gt1),MChi(gt2),Mhh(gt3),AmpSumChiToChihh(:,gt1, gt2, gt3),AmpSum2ChiToChihh(:,gt1, gt2, gt3),AmpSqChiToChihh(gt1, gt2, gt3)) 
  AmpSqChiToChihh(gt1, gt2, gt3) = AmpSqChiToChihh(gt1, gt2, gt3) + AmpSqTreeChiToChihh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToChihh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToChihh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChiOS(gt1),MChiOS(gt2),MhhOS(gt3),helfactor*AmpSqChiToChihh(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChi(gt1),MChi(gt2),Mhh(gt3),helfactor*AmpSqChiToChihh(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToChihh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToChihh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToChihh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToChihh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPChiToChihh(gt1, gt2, gt3) + MRGChiToChihh(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPChiToChihh(gt1, gt2, gt3) + MRGChiToChihh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.9) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Chi VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_ChiToChiVZ(cplChiChiVZL,cplChiChiVZR,MChi,              & 
& MVZ,MChi2,MVZ2,AmpTreeChiToChiVZ)

  Else 
Call Amplitude_Tree_sec_UMSSM_ChiToChiVZ(ZcplChiChiVZL,ZcplChiChiVZR,MChi,            & 
& MVZ,MChi2,MVZ2,AmpTreeChiToChiVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToChiVZ(MLambda,em,gs,cplChiChiVZL,cplChiChiVZR,         & 
& MChiOS,MVZOS,MRPChiToChiVZ,MRGChiToChiVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToChiVZ(MLambda,em,gs,ZcplChiChiVZL,ZcplChiChiVZR,       & 
& MChiOS,MVZOS,MRPChiToChiVZ,MRGChiToChiVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_ChiToChiVZ(MLambda,em,gs,cplChiChiVZL,cplChiChiVZR,         & 
& MChi,MVZ,MRPChiToChiVZ,MRGChiToChiVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToChiVZ(MLambda,em,gs,ZcplChiChiVZL,ZcplChiChiVZR,       & 
& MChi,MVZ,MRPChiToChiVZ,MRGChiToChiVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChiToChiVZ(cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,     & 
& cplChiChiVZpR,ctcplChiChiVZL,ctcplChiChiVZR,ctcplChiChiVZpL,ctcplChiChiVZpR,           & 
& MChi,MChi2,MVZ,MVZ2,ZfL0,ZfVZ,ZfVZpVZ,AmpWaveChiToChiVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChiToChiVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,             & 
& cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZL,   & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,       & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,        & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplhhVZVZ,cplhhVZVZp,      & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,    & 
& cplcVWmVWmVZ,AmpVertexChiToChiVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChiVZ(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,        & 
& cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZL,   & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,       & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,        & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplhhVZVZ,cplhhVZVZp,      & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,    & 
& cplcVWmVWmVZ,AmpVertexIRdrChiToChiVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChiVZ(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,            & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplChiChiAhL,cplChiChiAhR,cplAhhhVZ,       & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZL,             & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,ZcplChiChiVZL,ZcplChiChiVZR,cplChiChiVZpL,     & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,        & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplhhVZVZ,cplhhVZVZp,      & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,    & 
& cplcVWmVWmVZ,AmpVertexIRosChiToChiVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChiVZ(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,        & 
& cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZL,   & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,ZcplChiChiVZL,ZcplChiChiVZR,cplChiChiVZpL,     & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,        & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplhhVZVZ,cplhhVZVZp,      & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,    & 
& cplcVWmVWmVZ,AmpVertexIRosChiToChiVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChiVZ(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,            & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplChiChiAhL,cplChiChiAhR,cplAhhhVZ,       & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZL,             & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,       & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,        & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplhhVZVZ,cplhhVZVZp,      & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,    & 
& cplcVWmVWmVZ,AmpVertexIRosChiToChiVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChiVZ(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,        & 
& cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZL,   & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,       & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,        & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplhhVZVZ,cplhhVZVZp,      & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,    & 
& cplcVWmVWmVZ,AmpVertexIRosChiToChiVZ)

 End if 
 End if 
AmpVertexChiToChiVZ = AmpVertexChiToChiVZ -  AmpVertexIRdrChiToChiVZ! +  AmpVertexIRosChiToChiVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToChiVZ=0._dp 
AmpVertexZChiToChiVZ=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZChiToChiVZ(1,gt2,:) = AmpWaveZChiToChiVZ(1,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiVZ(1,gt1,:) 
AmpVertexZChiToChiVZ(1,gt2,:)= AmpVertexZChiToChiVZ(1,gt2,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChiVZ(1,gt1,:) 
AmpWaveZChiToChiVZ(2,gt2,:) = AmpWaveZChiToChiVZ(2,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChiVZ(2,gt1,:) 
AmpVertexZChiToChiVZ(2,gt2,:)= AmpVertexZChiToChiVZ(2,gt2,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChiVZ(2,gt1,:) 
AmpWaveZChiToChiVZ(3,gt2,:) = AmpWaveZChiToChiVZ(3,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiVZ(3,gt1,:) 
AmpVertexZChiToChiVZ(3,gt2,:)= AmpVertexZChiToChiVZ(3,gt2,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChiVZ(3,gt1,:) 
AmpWaveZChiToChiVZ(4,gt2,:) = AmpWaveZChiToChiVZ(4,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChiVZ(4,gt1,:) 
AmpVertexZChiToChiVZ(4,gt2,:)= AmpVertexZChiToChiVZ(4,gt2,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChiVZ(4,gt1,:) 
 End Do 
End Do 
AmpWaveChiToChiVZ=AmpWaveZChiToChiVZ 
AmpVertexChiToChiVZ= AmpVertexZChiToChiVZ
! Final State 1 
AmpWaveZChiToChiVZ=0._dp 
AmpVertexZChiToChiVZ=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZChiToChiVZ(1,:,gt2) = AmpWaveZChiToChiVZ(1,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveChiToChiVZ(1,:,gt1) 
AmpVertexZChiToChiVZ(1,:,gt2)= AmpVertexZChiToChiVZ(1,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexChiToChiVZ(1,:,gt1) 
AmpWaveZChiToChiVZ(2,:,gt2) = AmpWaveZChiToChiVZ(2,:,gt2)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiVZ(2,:,gt1) 
AmpVertexZChiToChiVZ(2,:,gt2)= AmpVertexZChiToChiVZ(2,:,gt2)+ZRUZNc(gt2,gt1)*AmpVertexChiToChiVZ(2,:,gt1) 
AmpWaveZChiToChiVZ(3,:,gt2) = AmpWaveZChiToChiVZ(3,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveChiToChiVZ(3,:,gt1) 
AmpVertexZChiToChiVZ(3,:,gt2)= AmpVertexZChiToChiVZ(3,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexChiToChiVZ(3,:,gt1) 
AmpWaveZChiToChiVZ(4,:,gt2) = AmpWaveZChiToChiVZ(4,:,gt2)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiVZ(4,:,gt1) 
AmpVertexZChiToChiVZ(4,:,gt2)= AmpVertexZChiToChiVZ(4,:,gt2)+ZRUZNc(gt2,gt1)*AmpVertexChiToChiVZ(4,:,gt1) 
 End Do 
End Do 
AmpWaveChiToChiVZ=AmpWaveZChiToChiVZ 
AmpVertexChiToChiVZ= AmpVertexZChiToChiVZ
End if
If (ShiftIRdiv) Then 
AmpVertexChiToChiVZ = AmpVertexChiToChiVZ  +  AmpVertexIRosChiToChiVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Chi VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToChiVZ = AmpTreeChiToChiVZ 
 AmpSum2ChiToChiVZ = AmpTreeChiToChiVZ + 2._dp*AmpWaveChiToChiVZ + 2._dp*AmpVertexChiToChiVZ  
Else 
 AmpSumChiToChiVZ = AmpTreeChiToChiVZ + AmpWaveChiToChiVZ + AmpVertexChiToChiVZ
 AmpSum2ChiToChiVZ = AmpTreeChiToChiVZ + AmpWaveChiToChiVZ + AmpVertexChiToChiVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToChiVZ = AmpTreeChiToChiVZ
 AmpSum2ChiToChiVZ = AmpTreeChiToChiVZ 
End if 
Do gt1=1,9
i4 = isave 
  Do gt2=1,9
If (((OSkinematics).and.(Abs(MChiOS(gt1)).gt.(Abs(MChiOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MChi(gt1)).gt.(Abs(MChi(gt2))+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2ChiToChiVZ = AmpTreeChiToChiVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZOS,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZ,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToChiVZ(gt1, gt2) 
  AmpSum2ChiToChiVZ = 2._dp*AmpWaveChiToChiVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZOS,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZ,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToChiVZ(gt1, gt2) 
  AmpSum2ChiToChiVZ = 2._dp*AmpVertexChiToChiVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZOS,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZ,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToChiVZ(gt1, gt2) 
  AmpSum2ChiToChiVZ = AmpTreeChiToChiVZ + 2._dp*AmpWaveChiToChiVZ + 2._dp*AmpVertexChiToChiVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZOS,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZ,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToChiVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToChiVZ = AmpTreeChiToChiVZ
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZOS,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
  AmpSqTreeChiToChiVZ(gt1, gt2) = AmpSqChiToChiVZ(gt1, gt2)  
  AmpSum2ChiToChiVZ = + 2._dp*AmpWaveChiToChiVZ + 2._dp*AmpVertexChiToChiVZ
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZOS,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
  AmpSqChiToChiVZ(gt1, gt2) = AmpSqChiToChiVZ(gt1, gt2) + AmpSqTreeChiToChiVZ(gt1, gt2)  
Else  
  AmpSum2ChiToChiVZ = AmpTreeChiToChiVZ
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZ,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
  AmpSqTreeChiToChiVZ(gt1, gt2) = AmpSqChiToChiVZ(gt1, gt2)  
  AmpSum2ChiToChiVZ = + 2._dp*AmpWaveChiToChiVZ + 2._dp*AmpVertexChiToChiVZ
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZ,AmpSumChiToChiVZ(:,gt1, gt2),AmpSum2ChiToChiVZ(:,gt1, gt2),AmpSqChiToChiVZ(gt1, gt2)) 
  AmpSqChiToChiVZ(gt1, gt2) = AmpSqChiToChiVZ(gt1, gt2) + AmpSqTreeChiToChiVZ(gt1, gt2)  
End if  
Else  
  AmpSqChiToChiVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToChiVZ(gt1, gt2).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChiOS(gt1),MChiOS(gt2),MVZOS,helfactor*AmpSqChiToChiVZ(gt1, gt2))
Else 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChi(gt1),MChi(gt2),MVZ,helfactor*AmpSqChiToChiVZ(gt1, gt2))
End if 
If ((Abs(MRPChiToChiVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChiToChiVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToChiVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChiToChiVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPChiToChiVZ(gt1, gt2) + MRGChiToChiVZ(gt1, gt2)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPChiToChiVZ(gt1, gt2) + MRGChiToChiVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.9) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Chi VZp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_ChiToChiVZp(cplChiChiVZpL,cplChiChiVZpR,MChi,           & 
& MVZp,MChi2,MVZp2,AmpTreeChiToChiVZp)

  Else 
Call Amplitude_Tree_sec_UMSSM_ChiToChiVZp(ZcplChiChiVZpL,ZcplChiChiVZpR,              & 
& MChi,MVZp,MChi2,MVZp2,AmpTreeChiToChiVZp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToChiVZp(MLambda,em,gs,cplChiChiVZpL,cplChiChiVZpR,      & 
& MChiOS,MVZpOS,MRPChiToChiVZp,MRGChiToChiVZp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToChiVZp(MLambda,em,gs,ZcplChiChiVZpL,ZcplChiChiVZpR,    & 
& MChiOS,MVZpOS,MRPChiToChiVZp,MRGChiToChiVZp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_ChiToChiVZp(MLambda,em,gs,cplChiChiVZpL,cplChiChiVZpR,      & 
& MChi,MVZp,MRPChiToChiVZp,MRGChiToChiVZp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToChiVZp(MLambda,em,gs,ZcplChiChiVZpL,ZcplChiChiVZpR,    & 
& MChi,MVZp,MRPChiToChiVZp,MRGChiToChiVZp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChiToChiVZp(cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,    & 
& cplChiChiVZpR,ctcplChiChiVZL,ctcplChiChiVZR,ctcplChiChiVZpL,ctcplChiChiVZpR,           & 
& MChi,MChi2,MVZ,MVZ2,MVZp,MVZp2,ZfL0,ZfVZp,ZfVZVZp,AmpWaveChiToChiVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChiToChiVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,             & 
& cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,      & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,     & 
& cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvVZpL,cplcFvFvVZpR,cplhhVZVZp,           & 
& cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,           & 
& cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexChiToChiVZp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChiVZp(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,        & 
& cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,      & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,     & 
& cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvVZpL,cplcFvFvVZpR,cplhhVZVZp,           & 
& cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,           & 
& cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexIRdrChiToChiVZp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChiVZp(MAhOS,MChaOS,MChiOS,MFdOS,             & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,            & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplChiChiAhL,cplChiChiAhR,cplAhhhVZp,      & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZpL,            & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,ZcplChiChiVZpL,     & 
& ZcplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,       & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,     & 
& cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvVZpL,cplcFvFvVZpR,cplhhVZVZp,           & 
& cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,           & 
& cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexIRosChiToChiVZp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChiVZp(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,        & 
& cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,ZcplChiChiVZpL,     & 
& ZcplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,       & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,     & 
& cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvVZpL,cplcFvFvVZpR,cplhhVZVZp,           & 
& cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,           & 
& cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexIRosChiToChiVZp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChiVZp(MAhOS,MChaOS,MChiOS,MFdOS,             & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,            & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplChiChiAhL,cplChiChiAhR,cplAhhhVZp,      & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZpL,            & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,      & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,     & 
& cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvVZpL,cplcFvFvVZpR,cplhhVZVZp,           & 
& cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,           & 
& cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexIRosChiToChiVZp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToChiVZp(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,        & 
& cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVZpL, & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,      & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,     & 
& cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvVZpL,cplcFvFvVZpR,cplhhVZVZp,           & 
& cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,           & 
& cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,AmpVertexIRosChiToChiVZp)

 End if 
 End if 
AmpVertexChiToChiVZp = AmpVertexChiToChiVZp -  AmpVertexIRdrChiToChiVZp! +  AmpVertexIRosChiToChiVZp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToChiVZp=0._dp 
AmpVertexZChiToChiVZp=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZChiToChiVZp(1,gt2,:) = AmpWaveZChiToChiVZp(1,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiVZp(1,gt1,:) 
AmpVertexZChiToChiVZp(1,gt2,:)= AmpVertexZChiToChiVZp(1,gt2,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChiVZp(1,gt1,:) 
AmpWaveZChiToChiVZp(2,gt2,:) = AmpWaveZChiToChiVZp(2,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChiVZp(2,gt1,:) 
AmpVertexZChiToChiVZp(2,gt2,:)= AmpVertexZChiToChiVZp(2,gt2,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChiVZp(2,gt1,:) 
AmpWaveZChiToChiVZp(3,gt2,:) = AmpWaveZChiToChiVZp(3,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiVZp(3,gt1,:) 
AmpVertexZChiToChiVZp(3,gt2,:)= AmpVertexZChiToChiVZp(3,gt2,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToChiVZp(3,gt1,:) 
AmpWaveZChiToChiVZp(4,gt2,:) = AmpWaveZChiToChiVZp(4,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveChiToChiVZp(4,gt1,:) 
AmpVertexZChiToChiVZp(4,gt2,:)= AmpVertexZChiToChiVZp(4,gt2,:) + ZRUZN(gt2,gt1)*AmpVertexChiToChiVZp(4,gt1,:) 
 End Do 
End Do 
AmpWaveChiToChiVZp=AmpWaveZChiToChiVZp 
AmpVertexChiToChiVZp= AmpVertexZChiToChiVZp
! Final State 1 
AmpWaveZChiToChiVZp=0._dp 
AmpVertexZChiToChiVZp=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZChiToChiVZp(1,:,gt2) = AmpWaveZChiToChiVZp(1,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveChiToChiVZp(1,:,gt1) 
AmpVertexZChiToChiVZp(1,:,gt2)= AmpVertexZChiToChiVZp(1,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexChiToChiVZp(1,:,gt1) 
AmpWaveZChiToChiVZp(2,:,gt2) = AmpWaveZChiToChiVZp(2,:,gt2)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiVZp(2,:,gt1) 
AmpVertexZChiToChiVZp(2,:,gt2)= AmpVertexZChiToChiVZp(2,:,gt2)+ZRUZNc(gt2,gt1)*AmpVertexChiToChiVZp(2,:,gt1) 
AmpWaveZChiToChiVZp(3,:,gt2) = AmpWaveZChiToChiVZp(3,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveChiToChiVZp(3,:,gt1) 
AmpVertexZChiToChiVZp(3,:,gt2)= AmpVertexZChiToChiVZp(3,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexChiToChiVZp(3,:,gt1) 
AmpWaveZChiToChiVZp(4,:,gt2) = AmpWaveZChiToChiVZp(4,:,gt2)+ZRUZNc(gt2,gt1)*AmpWaveChiToChiVZp(4,:,gt1) 
AmpVertexZChiToChiVZp(4,:,gt2)= AmpVertexZChiToChiVZp(4,:,gt2)+ZRUZNc(gt2,gt1)*AmpVertexChiToChiVZp(4,:,gt1) 
 End Do 
End Do 
AmpWaveChiToChiVZp=AmpWaveZChiToChiVZp 
AmpVertexChiToChiVZp= AmpVertexZChiToChiVZp
End if
If (ShiftIRdiv) Then 
AmpVertexChiToChiVZp = AmpVertexChiToChiVZp  +  AmpVertexIRosChiToChiVZp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Chi VZp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToChiVZp = AmpTreeChiToChiVZp 
 AmpSum2ChiToChiVZp = AmpTreeChiToChiVZp + 2._dp*AmpWaveChiToChiVZp + 2._dp*AmpVertexChiToChiVZp  
Else 
 AmpSumChiToChiVZp = AmpTreeChiToChiVZp + AmpWaveChiToChiVZp + AmpVertexChiToChiVZp
 AmpSum2ChiToChiVZp = AmpTreeChiToChiVZp + AmpWaveChiToChiVZp + AmpVertexChiToChiVZp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToChiVZp = AmpTreeChiToChiVZp
 AmpSum2ChiToChiVZp = AmpTreeChiToChiVZp 
End if 
Do gt1=1,9
i4 = isave 
  Do gt2=1,9
If (((OSkinematics).and.(Abs(MChiOS(gt1)).gt.(Abs(MChiOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MChi(gt1)).gt.(Abs(MChi(gt2))+Abs(MVZp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2ChiToChiVZp = AmpTreeChiToChiVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZpOS,AmpSumChiToChiVZp(:,gt1, gt2),AmpSum2ChiToChiVZp(:,gt1, gt2),AmpSqChiToChiVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZp,AmpSumChiToChiVZp(:,gt1, gt2),AmpSum2ChiToChiVZp(:,gt1, gt2),AmpSqChiToChiVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToChiVZp(gt1, gt2) 
  AmpSum2ChiToChiVZp = 2._dp*AmpWaveChiToChiVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZpOS,AmpSumChiToChiVZp(:,gt1, gt2),AmpSum2ChiToChiVZp(:,gt1, gt2),AmpSqChiToChiVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZp,AmpSumChiToChiVZp(:,gt1, gt2),AmpSum2ChiToChiVZp(:,gt1, gt2),AmpSqChiToChiVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToChiVZp(gt1, gt2) 
  AmpSum2ChiToChiVZp = 2._dp*AmpVertexChiToChiVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZpOS,AmpSumChiToChiVZp(:,gt1, gt2),AmpSum2ChiToChiVZp(:,gt1, gt2),AmpSqChiToChiVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZp,AmpSumChiToChiVZp(:,gt1, gt2),AmpSum2ChiToChiVZp(:,gt1, gt2),AmpSqChiToChiVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToChiVZp(gt1, gt2) 
  AmpSum2ChiToChiVZp = AmpTreeChiToChiVZp + 2._dp*AmpWaveChiToChiVZp + 2._dp*AmpVertexChiToChiVZp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZpOS,AmpSumChiToChiVZp(:,gt1, gt2),AmpSum2ChiToChiVZp(:,gt1, gt2),AmpSqChiToChiVZp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZp,AmpSumChiToChiVZp(:,gt1, gt2),AmpSum2ChiToChiVZp(:,gt1, gt2),AmpSqChiToChiVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToChiVZp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToChiVZp = AmpTreeChiToChiVZp
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZpOS,AmpSumChiToChiVZp(:,gt1, gt2),AmpSum2ChiToChiVZp(:,gt1, gt2),AmpSqChiToChiVZp(gt1, gt2)) 
  AmpSqTreeChiToChiVZp(gt1, gt2) = AmpSqChiToChiVZp(gt1, gt2)  
  AmpSum2ChiToChiVZp = + 2._dp*AmpWaveChiToChiVZp + 2._dp*AmpVertexChiToChiVZp
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),MVZpOS,AmpSumChiToChiVZp(:,gt1, gt2),AmpSum2ChiToChiVZp(:,gt1, gt2),AmpSqChiToChiVZp(gt1, gt2)) 
  AmpSqChiToChiVZp(gt1, gt2) = AmpSqChiToChiVZp(gt1, gt2) + AmpSqTreeChiToChiVZp(gt1, gt2)  
Else  
  AmpSum2ChiToChiVZp = AmpTreeChiToChiVZp
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZp,AmpSumChiToChiVZp(:,gt1, gt2),AmpSum2ChiToChiVZp(:,gt1, gt2),AmpSqChiToChiVZp(gt1, gt2)) 
  AmpSqTreeChiToChiVZp(gt1, gt2) = AmpSqChiToChiVZp(gt1, gt2)  
  AmpSum2ChiToChiVZp = + 2._dp*AmpWaveChiToChiVZp + 2._dp*AmpVertexChiToChiVZp
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVZp,AmpSumChiToChiVZp(:,gt1, gt2),AmpSum2ChiToChiVZp(:,gt1, gt2),AmpSqChiToChiVZp(gt1, gt2)) 
  AmpSqChiToChiVZp(gt1, gt2) = AmpSqChiToChiVZp(gt1, gt2) + AmpSqTreeChiToChiVZp(gt1, gt2)  
End if  
Else  
  AmpSqChiToChiVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToChiVZp(gt1, gt2).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChiOS(gt1),MChiOS(gt2),MVZpOS,helfactor*AmpSqChiToChiVZp(gt1, gt2))
Else 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChi(gt1),MChi(gt2),MVZp,helfactor*AmpSqChiToChiVZp(gt1, gt2))
End if 
If ((Abs(MRPChiToChiVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChiToChiVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToChiVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChiToChiVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPChiToChiVZp(gt1, gt2) + MRGChiToChiVZp(gt1, gt2)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPChiToChiVZp(gt1, gt2) + MRGChiToChiVZp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.9) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fd Conjg(Sd)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_ChiToFdcSd(cplChiFdcSdL,cplChiFdcSdR,MChi,              & 
& MFd,MSd,MChi2,MFd2,MSd2,AmpTreeChiToFdcSd)

  Else 
Call Amplitude_Tree_sec_UMSSM_ChiToFdcSd(ZcplChiFdcSdL,ZcplChiFdcSdR,MChi,            & 
& MFd,MSd,MChi2,MFd2,MSd2,AmpTreeChiToFdcSd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToFdcSd(MLambda,em,gs,cplChiFdcSdL,cplChiFdcSdR,         & 
& MChiOS,MFdOS,MSdOS,MRPChiToFdcSd,MRGChiToFdcSd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToFdcSd(MLambda,em,gs,ZcplChiFdcSdL,ZcplChiFdcSdR,       & 
& MChiOS,MFdOS,MSdOS,MRPChiToFdcSd,MRGChiToFdcSd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_ChiToFdcSd(MLambda,em,gs,cplChiFdcSdL,cplChiFdcSdR,         & 
& MChi,MFd,MSd,MRPChiToFdcSd,MRGChiToFdcSd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToFdcSd(MLambda,em,gs,ZcplChiFdcSdL,ZcplChiFdcSdR,       & 
& MChi,MFd,MSd,MRPChiToFdcSd,MRGChiToFdcSd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChiToFdcSd(cplChiFdcSdL,cplChiFdcSdR,ctcplChiFdcSdL,    & 
& ctcplChiFdcSdR,MChi,MChi2,MFd,MFd2,MSd,MSd2,ZfFDL,ZfFDR,ZfL0,ZfSd,AmpWaveChiToFdcSd)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChiToFdcSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,       & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,              & 
& cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,AmpVertexChiToFdcSd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToFdcSd(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,             & 
& cplcFdFdAhL,cplcFdFdAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,       & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,       & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,     & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,       & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,           & 
& cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,AmpVertexIRdrChiToFdcSd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToFdcSd(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,               & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,   & 
& cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,ZcplChiFdcSdL,ZcplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,    & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,          & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,    & 
& cplcFuFdcVWmR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,     & 
& cplSucSdVWm,AmpVertexIRosChiToFdcSd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToFdcSd(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,             & 
& cplcFdFdAhL,cplcFdFdAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,       & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,ZcplChiFdcSdL,ZcplChiFdcSdR,cplChiFucSuL,     & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,     & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,       & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,           & 
& cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,AmpVertexIRosChiToFdcSd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToFdcSd(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,               & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,   & 
& cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,          & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,    & 
& cplcFuFdcVWmR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,     & 
& cplSucSdVWm,AmpVertexIRosChiToFdcSd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToFdcSd(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,             & 
& cplcFdFdAhL,cplcFdFdAhR,cplAhSdcSd,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,       & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,       & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,     & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,       & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,           & 
& cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplSucSdVWm,AmpVertexIRosChiToFdcSd)

 End if 
 End if 
AmpVertexChiToFdcSd = AmpVertexChiToFdcSd -  AmpVertexIRdrChiToFdcSd! +  AmpVertexIRosChiToFdcSd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToFdcSd=0._dp 
AmpVertexZChiToFdcSd=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZChiToFdcSd(1,gt2,:,:) = AmpWaveZChiToFdcSd(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToFdcSd(1,gt1,:,:) 
AmpVertexZChiToFdcSd(1,gt2,:,:)= AmpVertexZChiToFdcSd(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToFdcSd(1,gt1,:,:) 
AmpWaveZChiToFdcSd(2,gt2,:,:) = AmpWaveZChiToFdcSd(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToFdcSd(2,gt1,:,:) 
AmpVertexZChiToFdcSd(2,gt2,:,:)= AmpVertexZChiToFdcSd(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToFdcSd(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToFdcSd=AmpWaveZChiToFdcSd 
AmpVertexChiToFdcSd= AmpVertexZChiToFdcSd
! Final State 1 
AmpWaveZChiToFdcSd=0._dp 
AmpVertexZChiToFdcSd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChiToFdcSd(1,:,gt2,:) = AmpWaveZChiToFdcSd(1,:,gt2,:)+ZRUZDL(gt2,gt1)*AmpWaveChiToFdcSd(1,:,gt1,:) 
AmpVertexZChiToFdcSd(1,:,gt2,:)= AmpVertexZChiToFdcSd(1,:,gt2,:)+ZRUZDL(gt2,gt1)*AmpVertexChiToFdcSd(1,:,gt1,:) 
AmpWaveZChiToFdcSd(2,:,gt2,:) = AmpWaveZChiToFdcSd(2,:,gt2,:)+ZRUZDRc(gt2,gt1)*AmpWaveChiToFdcSd(2,:,gt1,:) 
AmpVertexZChiToFdcSd(2,:,gt2,:)= AmpVertexZChiToFdcSd(2,:,gt2,:)+ZRUZDRc(gt2,gt1)*AmpVertexChiToFdcSd(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChiToFdcSd=AmpWaveZChiToFdcSd 
AmpVertexChiToFdcSd= AmpVertexZChiToFdcSd
! Final State 2 
AmpWaveZChiToFdcSd=0._dp 
AmpVertexZChiToFdcSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChiToFdcSd(:,:,:,gt2) = AmpWaveZChiToFdcSd(:,:,:,gt2)+ZRUZDc(gt2,gt1)*AmpWaveChiToFdcSd(:,:,:,gt1) 
AmpVertexZChiToFdcSd(:,:,:,gt2)= AmpVertexZChiToFdcSd(:,:,:,gt2)+ZRUZDc(gt2,gt1)*AmpVertexChiToFdcSd(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToFdcSd=AmpWaveZChiToFdcSd 
AmpVertexChiToFdcSd= AmpVertexZChiToFdcSd
End if
If (ShiftIRdiv) Then 
AmpVertexChiToFdcSd = AmpVertexChiToFdcSd  +  AmpVertexIRosChiToFdcSd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Fd conj[Sd] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToFdcSd = AmpTreeChiToFdcSd 
 AmpSum2ChiToFdcSd = AmpTreeChiToFdcSd + 2._dp*AmpWaveChiToFdcSd + 2._dp*AmpVertexChiToFdcSd  
Else 
 AmpSumChiToFdcSd = AmpTreeChiToFdcSd + AmpWaveChiToFdcSd + AmpVertexChiToFdcSd
 AmpSum2ChiToFdcSd = AmpTreeChiToFdcSd + AmpWaveChiToFdcSd + AmpVertexChiToFdcSd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToFdcSd = AmpTreeChiToFdcSd
 AmpSum2ChiToFdcSd = AmpTreeChiToFdcSd 
End if 
Do gt1=1,9
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MChiOS(gt1)).gt.(Abs(MFdOS(gt2))+Abs(MSdOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MChi(gt1)).gt.(Abs(MFd(gt2))+Abs(MSd(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToFdcSd = AmpTreeChiToFdcSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFdOS(gt2),MSdOS(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFd(gt2),MSd(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToFdcSd(gt1, gt2, gt3) 
  AmpSum2ChiToFdcSd = 2._dp*AmpWaveChiToFdcSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFdOS(gt2),MSdOS(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFd(gt2),MSd(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToFdcSd(gt1, gt2, gt3) 
  AmpSum2ChiToFdcSd = 2._dp*AmpVertexChiToFdcSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFdOS(gt2),MSdOS(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFd(gt2),MSd(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToFdcSd(gt1, gt2, gt3) 
  AmpSum2ChiToFdcSd = AmpTreeChiToFdcSd + 2._dp*AmpWaveChiToFdcSd + 2._dp*AmpVertexChiToFdcSd
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFdOS(gt2),MSdOS(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFd(gt2),MSd(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToFdcSd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToFdcSd = AmpTreeChiToFdcSd
  Call SquareAmp_FtoFS(MChiOS(gt1),MFdOS(gt2),MSdOS(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
  AmpSqTreeChiToFdcSd(gt1, gt2, gt3) = AmpSqChiToFdcSd(gt1, gt2, gt3)  
  AmpSum2ChiToFdcSd = + 2._dp*AmpWaveChiToFdcSd + 2._dp*AmpVertexChiToFdcSd
  Call SquareAmp_FtoFS(MChiOS(gt1),MFdOS(gt2),MSdOS(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
  AmpSqChiToFdcSd(gt1, gt2, gt3) = AmpSqChiToFdcSd(gt1, gt2, gt3) + AmpSqTreeChiToFdcSd(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToFdcSd = AmpTreeChiToFdcSd
  Call SquareAmp_FtoFS(MChi(gt1),MFd(gt2),MSd(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
  AmpSqTreeChiToFdcSd(gt1, gt2, gt3) = AmpSqChiToFdcSd(gt1, gt2, gt3)  
  AmpSum2ChiToFdcSd = + 2._dp*AmpWaveChiToFdcSd + 2._dp*AmpVertexChiToFdcSd
  Call SquareAmp_FtoFS(MChi(gt1),MFd(gt2),MSd(gt3),AmpSumChiToFdcSd(:,gt1, gt2, gt3),AmpSum2ChiToFdcSd(:,gt1, gt2, gt3),AmpSqChiToFdcSd(gt1, gt2, gt3)) 
  AmpSqChiToFdcSd(gt1, gt2, gt3) = AmpSqChiToFdcSd(gt1, gt2, gt3) + AmpSqTreeChiToFdcSd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToFdcSd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToFdcSd(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 6._dp*GammaTPS(MChiOS(gt1),MFdOS(gt2),MSdOS(gt3),helfactor*AmpSqChiToFdcSd(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 6._dp*GammaTPS(MChi(gt1),MFd(gt2),MSd(gt3),helfactor*AmpSqChiToFdcSd(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToFdcSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFdcSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToFdcSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFdcSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPChiToFdcSd(gt1, gt2, gt3) + MRGChiToFdcSd(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPChiToFdcSd(gt1, gt2, gt3) + MRGChiToFdcSd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.9) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fe Conjg(Se)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_ChiToFecSe(cplChiFecSeL,cplChiFecSeR,MChi,              & 
& MFe,MSe,MChi2,MFe2,MSe2,AmpTreeChiToFecSe)

  Else 
Call Amplitude_Tree_sec_UMSSM_ChiToFecSe(ZcplChiFecSeL,ZcplChiFecSeR,MChi,            & 
& MFe,MSe,MChi2,MFe2,MSe2,AmpTreeChiToFecSe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToFecSe(MLambda,em,gs,cplChiFecSeL,cplChiFecSeR,         & 
& MChiOS,MFeOS,MSeOS,MRPChiToFecSe,MRGChiToFecSe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToFecSe(MLambda,em,gs,ZcplChiFecSeL,ZcplChiFecSeR,       & 
& MChiOS,MFeOS,MSeOS,MRPChiToFecSe,MRGChiToFecSe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_ChiToFecSe(MLambda,em,gs,cplChiFecSeL,cplChiFecSeR,         & 
& MChi,MFe,MSe,MRPChiToFecSe,MRGChiToFecSe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToFecSe(MLambda,em,gs,ZcplChiFecSeL,ZcplChiFecSeR,       & 
& MChi,MFe,MSe,MRPChiToFecSe,MRGChiToFecSe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChiToFecSe(cplChiFecSeL,cplChiFecSeR,ctcplChiFecSeL,    & 
& ctcplChiFecSeR,MChi,MChi2,MFe,MFe2,MSe,MSe2,ZfFEL,ZfFER,ZfL0,ZfSe,AmpWaveChiToFecSe)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChiToFecSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,             & 
& MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,            & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,       & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,AmpVertexChiToFecSe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToFecSe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,          & 
& cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,            & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,       & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,AmpVertexIRdrChiToFecSe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToFecSe(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplChiChiAhL,   & 
& cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,         & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,cplChaFvcSeR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,ZcplChiFecSeL,ZcplChiFecSeR,     & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,   & 
& cplhhSecSe,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,AmpVertexIRosChiToFecSe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToFecSe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,          & 
& cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,ZcplChiFecSeL,ZcplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,    & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,            & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,       & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,AmpVertexIRosChiToFecSe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToFecSe(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplChiChiAhL,   & 
& cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,         & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,cplChaFvcSeR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,   & 
& cplhhSecSe,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,AmpVertexIRosChiToFecSe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToFecSe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,          & 
& cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,            & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,       & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,AmpVertexIRosChiToFecSe)

 End if 
 End if 
AmpVertexChiToFecSe = AmpVertexChiToFecSe -  AmpVertexIRdrChiToFecSe! +  AmpVertexIRosChiToFecSe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToFecSe=0._dp 
AmpVertexZChiToFecSe=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZChiToFecSe(1,gt2,:,:) = AmpWaveZChiToFecSe(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToFecSe(1,gt1,:,:) 
AmpVertexZChiToFecSe(1,gt2,:,:)= AmpVertexZChiToFecSe(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToFecSe(1,gt1,:,:) 
AmpWaveZChiToFecSe(2,gt2,:,:) = AmpWaveZChiToFecSe(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToFecSe(2,gt1,:,:) 
AmpVertexZChiToFecSe(2,gt2,:,:)= AmpVertexZChiToFecSe(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToFecSe(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToFecSe=AmpWaveZChiToFecSe 
AmpVertexChiToFecSe= AmpVertexZChiToFecSe
! Final State 1 
AmpWaveZChiToFecSe=0._dp 
AmpVertexZChiToFecSe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChiToFecSe(1,:,gt2,:) = AmpWaveZChiToFecSe(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpWaveChiToFecSe(1,:,gt1,:) 
AmpVertexZChiToFecSe(1,:,gt2,:)= AmpVertexZChiToFecSe(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpVertexChiToFecSe(1,:,gt1,:) 
AmpWaveZChiToFecSe(2,:,gt2,:) = AmpWaveZChiToFecSe(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpWaveChiToFecSe(2,:,gt1,:) 
AmpVertexZChiToFecSe(2,:,gt2,:)= AmpVertexZChiToFecSe(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpVertexChiToFecSe(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChiToFecSe=AmpWaveZChiToFecSe 
AmpVertexChiToFecSe= AmpVertexZChiToFecSe
! Final State 2 
AmpWaveZChiToFecSe=0._dp 
AmpVertexZChiToFecSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChiToFecSe(:,:,:,gt2) = AmpWaveZChiToFecSe(:,:,:,gt2)+ZRUZEc(gt2,gt1)*AmpWaveChiToFecSe(:,:,:,gt1) 
AmpVertexZChiToFecSe(:,:,:,gt2)= AmpVertexZChiToFecSe(:,:,:,gt2)+ZRUZEc(gt2,gt1)*AmpVertexChiToFecSe(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToFecSe=AmpWaveZChiToFecSe 
AmpVertexChiToFecSe= AmpVertexZChiToFecSe
End if
If (ShiftIRdiv) Then 
AmpVertexChiToFecSe = AmpVertexChiToFecSe  +  AmpVertexIRosChiToFecSe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Fe conj[Se] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToFecSe = AmpTreeChiToFecSe 
 AmpSum2ChiToFecSe = AmpTreeChiToFecSe + 2._dp*AmpWaveChiToFecSe + 2._dp*AmpVertexChiToFecSe  
Else 
 AmpSumChiToFecSe = AmpTreeChiToFecSe + AmpWaveChiToFecSe + AmpVertexChiToFecSe
 AmpSum2ChiToFecSe = AmpTreeChiToFecSe + AmpWaveChiToFecSe + AmpVertexChiToFecSe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToFecSe = AmpTreeChiToFecSe
 AmpSum2ChiToFecSe = AmpTreeChiToFecSe 
End if 
Do gt1=1,9
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MChiOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(MSeOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MChi(gt1)).gt.(Abs(MFe(gt2))+Abs(MSe(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToFecSe = AmpTreeChiToFecSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFeOS(gt2),MSeOS(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFe(gt2),MSe(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToFecSe(gt1, gt2, gt3) 
  AmpSum2ChiToFecSe = 2._dp*AmpWaveChiToFecSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFeOS(gt2),MSeOS(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFe(gt2),MSe(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToFecSe(gt1, gt2, gt3) 
  AmpSum2ChiToFecSe = 2._dp*AmpVertexChiToFecSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFeOS(gt2),MSeOS(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFe(gt2),MSe(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToFecSe(gt1, gt2, gt3) 
  AmpSum2ChiToFecSe = AmpTreeChiToFecSe + 2._dp*AmpWaveChiToFecSe + 2._dp*AmpVertexChiToFecSe
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFeOS(gt2),MSeOS(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFe(gt2),MSe(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToFecSe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToFecSe = AmpTreeChiToFecSe
  Call SquareAmp_FtoFS(MChiOS(gt1),MFeOS(gt2),MSeOS(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
  AmpSqTreeChiToFecSe(gt1, gt2, gt3) = AmpSqChiToFecSe(gt1, gt2, gt3)  
  AmpSum2ChiToFecSe = + 2._dp*AmpWaveChiToFecSe + 2._dp*AmpVertexChiToFecSe
  Call SquareAmp_FtoFS(MChiOS(gt1),MFeOS(gt2),MSeOS(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
  AmpSqChiToFecSe(gt1, gt2, gt3) = AmpSqChiToFecSe(gt1, gt2, gt3) + AmpSqTreeChiToFecSe(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToFecSe = AmpTreeChiToFecSe
  Call SquareAmp_FtoFS(MChi(gt1),MFe(gt2),MSe(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
  AmpSqTreeChiToFecSe(gt1, gt2, gt3) = AmpSqChiToFecSe(gt1, gt2, gt3)  
  AmpSum2ChiToFecSe = + 2._dp*AmpWaveChiToFecSe + 2._dp*AmpVertexChiToFecSe
  Call SquareAmp_FtoFS(MChi(gt1),MFe(gt2),MSe(gt3),AmpSumChiToFecSe(:,gt1, gt2, gt3),AmpSum2ChiToFecSe(:,gt1, gt2, gt3),AmpSqChiToFecSe(gt1, gt2, gt3)) 
  AmpSqChiToFecSe(gt1, gt2, gt3) = AmpSqChiToFecSe(gt1, gt2, gt3) + AmpSqTreeChiToFecSe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToFecSe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToFecSe(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChiOS(gt1),MFeOS(gt2),MSeOS(gt3),helfactor*AmpSqChiToFecSe(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChi(gt1),MFe(gt2),MSe(gt3),helfactor*AmpSqChiToFecSe(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToFecSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFecSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToFecSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFecSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPChiToFecSe(gt1, gt2, gt3) + MRGChiToFecSe(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPChiToFecSe(gt1, gt2, gt3) + MRGChiToFecSe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.9) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fu Conjg(Su)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_ChiToFucSu(cplChiFucSuL,cplChiFucSuR,MChi,              & 
& MFu,MSu,MChi2,MFu2,MSu2,AmpTreeChiToFucSu)

  Else 
Call Amplitude_Tree_sec_UMSSM_ChiToFucSu(ZcplChiFucSuL,ZcplChiFucSuR,MChi,            & 
& MFu,MSu,MChi2,MFu2,MSu2,AmpTreeChiToFucSu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToFucSu(MLambda,em,gs,cplChiFucSuL,cplChiFucSuR,         & 
& MChiOS,MFuOS,MSuOS,MRPChiToFucSu,MRGChiToFucSu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToFucSu(MLambda,em,gs,ZcplChiFucSuL,ZcplChiFucSuR,       & 
& MChiOS,MFuOS,MSuOS,MRPChiToFucSu,MRGChiToFucSu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_ChiToFucSu(MLambda,em,gs,cplChiFucSuL,cplChiFucSuR,         & 
& MChi,MFu,MSu,MRPChiToFucSu,MRGChiToFucSu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToFucSu(MLambda,em,gs,ZcplChiFucSuL,ZcplChiFucSuR,       & 
& MChi,MFu,MSu,MRPChiToFucSu,MRGChiToFucSu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChiToFucSu(cplChiFucSuL,cplChiFucSuR,ctcplChiFucSuL,    & 
& ctcplChiFucSuR,MChi,MChi2,MFu,MFu2,MSu,MSu2,ZfFUL,ZfFUR,ZfL0,ZfSu,AmpWaveChiToFucSu)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChiToFucSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,            & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFuFuAhL,      & 
& cplcFuFuAhR,cplAhSucSu,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,         & 
& cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,       & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,   & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,             & 
& cplSucSuVP,cplSucSuVZ,cplSucSuVZp,AmpVertexChiToFucSu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToFucSu(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhSucSu,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,       & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,       & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,     & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,   & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,            & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,AmpVertexIRdrChiToFucSu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToFucSu(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,               & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplChiChiAhL,cplChiChiAhR,cplcFuFuAhL,cplcFuFuAhR,         & 
& cplAhSucSu,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,   & 
& cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,ZcplChiFucSuL,ZcplChiFucSuR,cplcChaChiHpmL,    & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,      & 
& cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,            & 
& cplcFuFuVZpR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,               & 
& cplSucSuVZ,cplSucSuVZp,AmpVertexIRosChiToFucSu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToFucSu(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhSucSu,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,       & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,ZcplChiFucSuL,      & 
& ZcplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,    & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,   & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,            & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,AmpVertexIRosChiToFucSu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToFucSu(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,               & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplChiChiAhL,cplChiChiAhR,cplcFuFuAhL,cplcFuFuAhR,         & 
& cplAhSucSu,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,   & 
& cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,      & 
& cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,            & 
& cplcFuFuVZpR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,               & 
& cplSucSuVZ,cplSucSuVZp,AmpVertexIRosChiToFucSu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToFucSu(MAh,MCha,MChi,MFd,MFu,MGlu,             & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhSucSu,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,       & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,       & 
& cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,       & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,     & 
& cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,   & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplhhSucSu,cplSdcHpmcSu,cplSdcSucVWm,            & 
& cplSucSuVG,cplSucSuVP,cplSucSuVZ,cplSucSuVZp,AmpVertexIRosChiToFucSu)

 End if 
 End if 
AmpVertexChiToFucSu = AmpVertexChiToFucSu -  AmpVertexIRdrChiToFucSu! +  AmpVertexIRosChiToFucSu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToFucSu=0._dp 
AmpVertexZChiToFucSu=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZChiToFucSu(1,gt2,:,:) = AmpWaveZChiToFucSu(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToFucSu(1,gt1,:,:) 
AmpVertexZChiToFucSu(1,gt2,:,:)= AmpVertexZChiToFucSu(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToFucSu(1,gt1,:,:) 
AmpWaveZChiToFucSu(2,gt2,:,:) = AmpWaveZChiToFucSu(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToFucSu(2,gt1,:,:) 
AmpVertexZChiToFucSu(2,gt2,:,:)= AmpVertexZChiToFucSu(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToFucSu(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToFucSu=AmpWaveZChiToFucSu 
AmpVertexChiToFucSu= AmpVertexZChiToFucSu
! Final State 1 
AmpWaveZChiToFucSu=0._dp 
AmpVertexZChiToFucSu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChiToFucSu(1,:,gt2,:) = AmpWaveZChiToFucSu(1,:,gt2,:)+ZRUZUL(gt2,gt1)*AmpWaveChiToFucSu(1,:,gt1,:) 
AmpVertexZChiToFucSu(1,:,gt2,:)= AmpVertexZChiToFucSu(1,:,gt2,:)+ZRUZUL(gt2,gt1)*AmpVertexChiToFucSu(1,:,gt1,:) 
AmpWaveZChiToFucSu(2,:,gt2,:) = AmpWaveZChiToFucSu(2,:,gt2,:)+ZRUZURc(gt2,gt1)*AmpWaveChiToFucSu(2,:,gt1,:) 
AmpVertexZChiToFucSu(2,:,gt2,:)= AmpVertexZChiToFucSu(2,:,gt2,:)+ZRUZURc(gt2,gt1)*AmpVertexChiToFucSu(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChiToFucSu=AmpWaveZChiToFucSu 
AmpVertexChiToFucSu= AmpVertexZChiToFucSu
! Final State 2 
AmpWaveZChiToFucSu=0._dp 
AmpVertexZChiToFucSu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChiToFucSu(:,:,:,gt2) = AmpWaveZChiToFucSu(:,:,:,gt2)+ZRUZUc(gt2,gt1)*AmpWaveChiToFucSu(:,:,:,gt1) 
AmpVertexZChiToFucSu(:,:,:,gt2)= AmpVertexZChiToFucSu(:,:,:,gt2)+ZRUZUc(gt2,gt1)*AmpVertexChiToFucSu(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToFucSu=AmpWaveZChiToFucSu 
AmpVertexChiToFucSu= AmpVertexZChiToFucSu
End if
If (ShiftIRdiv) Then 
AmpVertexChiToFucSu = AmpVertexChiToFucSu  +  AmpVertexIRosChiToFucSu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Fu conj[Su] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToFucSu = AmpTreeChiToFucSu 
 AmpSum2ChiToFucSu = AmpTreeChiToFucSu + 2._dp*AmpWaveChiToFucSu + 2._dp*AmpVertexChiToFucSu  
Else 
 AmpSumChiToFucSu = AmpTreeChiToFucSu + AmpWaveChiToFucSu + AmpVertexChiToFucSu
 AmpSum2ChiToFucSu = AmpTreeChiToFucSu + AmpWaveChiToFucSu + AmpVertexChiToFucSu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToFucSu = AmpTreeChiToFucSu
 AmpSum2ChiToFucSu = AmpTreeChiToFucSu 
End if 
Do gt1=1,9
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MChiOS(gt1)).gt.(Abs(MFuOS(gt2))+Abs(MSuOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MChi(gt1)).gt.(Abs(MFu(gt2))+Abs(MSu(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToFucSu = AmpTreeChiToFucSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFuOS(gt2),MSuOS(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFu(gt2),MSu(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToFucSu(gt1, gt2, gt3) 
  AmpSum2ChiToFucSu = 2._dp*AmpWaveChiToFucSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFuOS(gt2),MSuOS(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFu(gt2),MSu(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToFucSu(gt1, gt2, gt3) 
  AmpSum2ChiToFucSu = 2._dp*AmpVertexChiToFucSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFuOS(gt2),MSuOS(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFu(gt2),MSu(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToFucSu(gt1, gt2, gt3) 
  AmpSum2ChiToFucSu = AmpTreeChiToFucSu + 2._dp*AmpWaveChiToFucSu + 2._dp*AmpVertexChiToFucSu
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFuOS(gt2),MSuOS(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFu(gt2),MSu(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToFucSu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToFucSu = AmpTreeChiToFucSu
  Call SquareAmp_FtoFS(MChiOS(gt1),MFuOS(gt2),MSuOS(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
  AmpSqTreeChiToFucSu(gt1, gt2, gt3) = AmpSqChiToFucSu(gt1, gt2, gt3)  
  AmpSum2ChiToFucSu = + 2._dp*AmpWaveChiToFucSu + 2._dp*AmpVertexChiToFucSu
  Call SquareAmp_FtoFS(MChiOS(gt1),MFuOS(gt2),MSuOS(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
  AmpSqChiToFucSu(gt1, gt2, gt3) = AmpSqChiToFucSu(gt1, gt2, gt3) + AmpSqTreeChiToFucSu(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToFucSu = AmpTreeChiToFucSu
  Call SquareAmp_FtoFS(MChi(gt1),MFu(gt2),MSu(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
  AmpSqTreeChiToFucSu(gt1, gt2, gt3) = AmpSqChiToFucSu(gt1, gt2, gt3)  
  AmpSum2ChiToFucSu = + 2._dp*AmpWaveChiToFucSu + 2._dp*AmpVertexChiToFucSu
  Call SquareAmp_FtoFS(MChi(gt1),MFu(gt2),MSu(gt3),AmpSumChiToFucSu(:,gt1, gt2, gt3),AmpSum2ChiToFucSu(:,gt1, gt2, gt3),AmpSqChiToFucSu(gt1, gt2, gt3)) 
  AmpSqChiToFucSu(gt1, gt2, gt3) = AmpSqChiToFucSu(gt1, gt2, gt3) + AmpSqTreeChiToFucSu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToFucSu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToFucSu(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 6._dp*GammaTPS(MChiOS(gt1),MFuOS(gt2),MSuOS(gt3),helfactor*AmpSqChiToFucSu(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 6._dp*GammaTPS(MChi(gt1),MFu(gt2),MSu(gt3),helfactor*AmpSqChiToFucSu(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToFucSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFucSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToFucSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFucSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPChiToFucSu(gt1, gt2, gt3) + MRGChiToFucSu(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPChiToFucSu(gt1, gt2, gt3) + MRGChiToFucSu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.9) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fv Conjg(Sv)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_ChiToFvcSv(cplChiFvcSvL,cplChiFvcSvR,MChi,              & 
& MFv,MSv,MChi2,MFv2,MSv2,AmpTreeChiToFvcSv)

  Else 
Call Amplitude_Tree_sec_UMSSM_ChiToFvcSv(ZcplChiFvcSvL,ZcplChiFvcSvR,MChi,            & 
& MFv,MSv,MChi2,MFv2,MSv2,AmpTreeChiToFvcSv)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToFvcSv(MLambda,em,gs,cplChiFvcSvL,cplChiFvcSvR,         & 
& MChiOS,MFvOS,MSvOS,MRPChiToFvcSv,MRGChiToFvcSv)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToFvcSv(MLambda,em,gs,ZcplChiFvcSvL,ZcplChiFvcSvR,       & 
& MChiOS,MFvOS,MSvOS,MRPChiToFvcSv,MRGChiToFvcSv)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_ChiToFvcSv(MLambda,em,gs,cplChiFvcSvL,cplChiFvcSvR,         & 
& MChi,MFv,MSv,MRPChiToFvcSv,MRGChiToFvcSv)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_ChiToFvcSv(MLambda,em,gs,ZcplChiFvcSvL,ZcplChiFvcSvR,       & 
& MChi,MFv,MSv,MRPChiToFvcSv,MRGChiToFvcSv)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChiToFvcSv(cplChiFvcSvL,cplChiFvcSvR,ctcplChiFvcSvL,    & 
& ctcplChiFvcSvR,MChi,MChi2,MFv,MFv2,MSv,MSv2,ZfFVL,ZfFVR,ZfL0,ZfSv,AmpWaveChiToFvcSv)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChiToFvcSv(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,MVWm2,           & 
& MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhSvcSv,               & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,              & 
& cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,       & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,           & 
& cplcFvFvVZpR,cplhhSvcSv,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,              & 
& AmpVertexChiToFvcSv)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToFvcSv(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,            & 
& MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhSvcSv,         & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,              & 
& cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,       & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,           & 
& cplcFvFvVZpR,cplhhSvcSv,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,              & 
& AmpVertexIRdrChiToFvcSv)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToFvcSv(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,             & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplChiChiAhL,        & 
& cplChiChiAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhSvcSv,cplChiChacHpmL,cplChiChacHpmR,         & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,cplChaFvcSeR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,       & 
& ZcplChiFvcSvL,ZcplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,   & 
& cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,   & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,           & 
& cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,cplhhSvcSv,cplSecHpmcSv,             & 
& cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,AmpVertexIRosChiToFvcSv)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToFvcSv(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,            & 
& MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhSvcSv,         & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,              & 
& cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,ZcplChiFvcSvL,ZcplChiFvcSvR,cplcChaChiHpmL,    & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,       & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,           & 
& cplcFvFvVZpR,cplhhSvcSv,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,              & 
& AmpVertexIRosChiToFvcSv)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToFvcSv(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,             & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplChiChiAhL,        & 
& cplChiChiAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhSvcSv,cplChiChacHpmL,cplChiChacHpmR,         & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,cplChaFvcSeR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,   & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,           & 
& cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,cplhhSvcSv,cplSecHpmcSv,             & 
& cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,AmpVertexIRosChiToFvcSv)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_ChiToFvcSv(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,            & 
& MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhSvcSv,         & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,              & 
& cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,       & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,           & 
& cplcFvFvVZpR,cplhhSvcSv,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,              & 
& AmpVertexIRosChiToFvcSv)

 End if 
 End if 
AmpVertexChiToFvcSv = AmpVertexChiToFvcSv -  AmpVertexIRdrChiToFvcSv! +  AmpVertexIRosChiToFvcSv ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZChiToFvcSv=0._dp 
AmpVertexZChiToFvcSv=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZChiToFvcSv(1,gt2,:,:) = AmpWaveZChiToFvcSv(1,gt2,:,:)+ZRUZN(gt2,gt1)*AmpWaveChiToFvcSv(1,gt1,:,:) 
AmpVertexZChiToFvcSv(1,gt2,:,:)= AmpVertexZChiToFvcSv(1,gt2,:,:) + ZRUZN(gt2,gt1)*AmpVertexChiToFvcSv(1,gt1,:,:) 
AmpWaveZChiToFvcSv(2,gt2,:,:) = AmpWaveZChiToFvcSv(2,gt2,:,:)+ZRUZNc(gt2,gt1)*AmpWaveChiToFvcSv(2,gt1,:,:) 
AmpVertexZChiToFvcSv(2,gt2,:,:)= AmpVertexZChiToFvcSv(2,gt2,:,:) + ZRUZNc(gt2,gt1)*AmpVertexChiToFvcSv(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveChiToFvcSv=AmpWaveZChiToFvcSv 
AmpVertexChiToFvcSv= AmpVertexZChiToFvcSv
! Final State 1 
AmpWaveZChiToFvcSv=0._dp 
AmpVertexZChiToFvcSv=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZChiToFvcSv(1,:,gt2,:) = AmpWaveZChiToFvcSv(1,:,gt2,:)+ZRUZVL(gt2,gt1)*AmpWaveChiToFvcSv(1,:,gt1,:) 
AmpVertexZChiToFvcSv(1,:,gt2,:)= AmpVertexZChiToFvcSv(1,:,gt2,:)+ZRUZVL(gt2,gt1)*AmpVertexChiToFvcSv(1,:,gt1,:) 
AmpWaveZChiToFvcSv(2,:,gt2,:) = AmpWaveZChiToFvcSv(2,:,gt2,:)+ZRUZVRc(gt2,gt1)*AmpWaveChiToFvcSv(2,:,gt1,:) 
AmpVertexZChiToFvcSv(2,:,gt2,:)= AmpVertexZChiToFvcSv(2,:,gt2,:)+ZRUZVRc(gt2,gt1)*AmpVertexChiToFvcSv(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveChiToFvcSv=AmpWaveZChiToFvcSv 
AmpVertexChiToFvcSv= AmpVertexZChiToFvcSv
! Final State 2 
AmpWaveZChiToFvcSv=0._dp 
AmpVertexZChiToFvcSv=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZChiToFvcSv(:,:,:,gt2) = AmpWaveZChiToFvcSv(:,:,:,gt2)+ZRUZVc(gt2,gt1)*AmpWaveChiToFvcSv(:,:,:,gt1) 
AmpVertexZChiToFvcSv(:,:,:,gt2)= AmpVertexZChiToFvcSv(:,:,:,gt2)+ZRUZVc(gt2,gt1)*AmpVertexChiToFvcSv(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveChiToFvcSv=AmpWaveZChiToFvcSv 
AmpVertexChiToFvcSv= AmpVertexZChiToFvcSv
End if
If (ShiftIRdiv) Then 
AmpVertexChiToFvcSv = AmpVertexChiToFvcSv  +  AmpVertexIRosChiToFvcSv
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Fv conj[Sv] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumChiToFvcSv = AmpTreeChiToFvcSv 
 AmpSum2ChiToFvcSv = AmpTreeChiToFvcSv + 2._dp*AmpWaveChiToFvcSv + 2._dp*AmpVertexChiToFvcSv  
Else 
 AmpSumChiToFvcSv = AmpTreeChiToFvcSv + AmpWaveChiToFvcSv + AmpVertexChiToFvcSv
 AmpSum2ChiToFvcSv = AmpTreeChiToFvcSv + AmpWaveChiToFvcSv + AmpVertexChiToFvcSv 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToFvcSv = AmpTreeChiToFvcSv
 AmpSum2ChiToFvcSv = AmpTreeChiToFvcSv 
End if 
Do gt1=1,9
i4 = isave 
  Do gt2=1,3
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MChiOS(gt1)).gt.(Abs(MFvOS(gt2))+Abs(MSvOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MChi(gt1)).gt.(Abs(MFv(gt2))+Abs(MSv(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2ChiToFvcSv = AmpTreeChiToFvcSv
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFvOS(gt2),MSvOS(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFv(gt2),MSv(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqChiToFvcSv(gt1, gt2, gt3) 
  AmpSum2ChiToFvcSv = 2._dp*AmpWaveChiToFvcSv
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFvOS(gt2),MSvOS(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFv(gt2),MSv(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqChiToFvcSv(gt1, gt2, gt3) 
  AmpSum2ChiToFvcSv = 2._dp*AmpVertexChiToFvcSv
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFvOS(gt2),MSvOS(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFv(gt2),MSv(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqChiToFvcSv(gt1, gt2, gt3) 
  AmpSum2ChiToFvcSv = AmpTreeChiToFvcSv + 2._dp*AmpWaveChiToFvcSv + 2._dp*AmpVertexChiToFvcSv
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MChiOS(gt1),MFvOS(gt2),MSvOS(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MChi(gt1),MFv(gt2),MSv(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqChiToFvcSv(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2ChiToFvcSv = AmpTreeChiToFvcSv
  Call SquareAmp_FtoFS(MChiOS(gt1),MFvOS(gt2),MSvOS(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
  AmpSqTreeChiToFvcSv(gt1, gt2, gt3) = AmpSqChiToFvcSv(gt1, gt2, gt3)  
  AmpSum2ChiToFvcSv = + 2._dp*AmpWaveChiToFvcSv + 2._dp*AmpVertexChiToFvcSv
  Call SquareAmp_FtoFS(MChiOS(gt1),MFvOS(gt2),MSvOS(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
  AmpSqChiToFvcSv(gt1, gt2, gt3) = AmpSqChiToFvcSv(gt1, gt2, gt3) + AmpSqTreeChiToFvcSv(gt1, gt2, gt3)  
Else  
  AmpSum2ChiToFvcSv = AmpTreeChiToFvcSv
  Call SquareAmp_FtoFS(MChi(gt1),MFv(gt2),MSv(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
  AmpSqTreeChiToFvcSv(gt1, gt2, gt3) = AmpSqChiToFvcSv(gt1, gt2, gt3)  
  AmpSum2ChiToFvcSv = + 2._dp*AmpWaveChiToFvcSv + 2._dp*AmpVertexChiToFvcSv
  Call SquareAmp_FtoFS(MChi(gt1),MFv(gt2),MSv(gt3),AmpSumChiToFvcSv(:,gt1, gt2, gt3),AmpSum2ChiToFvcSv(:,gt1, gt2, gt3),AmpSqChiToFvcSv(gt1, gt2, gt3)) 
  AmpSqChiToFvcSv(gt1, gt2, gt3) = AmpSqChiToFvcSv(gt1, gt2, gt3) + AmpSqTreeChiToFvcSv(gt1, gt2, gt3)  
End if  
Else  
  AmpSqChiToFvcSv(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToFvcSv(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChiOS(gt1),MFvOS(gt2),MSvOS(gt3),helfactor*AmpSqChiToFvcSv(gt1, gt2, gt3))
Else 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChi(gt1),MFv(gt2),MSv(gt3),helfactor*AmpSqChiToFvcSv(gt1, gt2, gt3))
End if 
If ((Abs(MRPChiToFvcSv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFvcSv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPChiToFvcSv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGChiToFvcSv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPChiToFvcSv(gt1, gt2, gt3) + MRGChiToFvcSv(gt1, gt2, gt3)) 
  gP1LChi(gt1,i4) = gP1LChi(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPChiToFvcSv(gt1, gt2, gt3) + MRGChiToFvcSv(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LChi(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.9) isave = i4 
End do
End If 
!---------------- 
! Chi VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_sec_UMSSM_ChiToChiVP(ZcplChiChiVZL,ZcplChiChiVZR,ZcplChiChiVZpL,  & 
& ZcplChiChiVZpR,ctcplChiChiVZL,ctcplChiChiVZR,ctcplChiChiVZpL,ctcplChiChiVZpR,          & 
& MChiOS,MChi2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfL0,ZfVP,ZfVZpVP,ZfVZVP,AmpWaveChiToChiVP)

 Else 
Call Amplitude_WAVE_sec_UMSSM_ChiToChiVP(cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,     & 
& cplChiChiVZpR,ctcplChiChiVZL,ctcplChiChiVZR,ctcplChiChiVZpL,ctcplChiChiVZpR,           & 
& MChiOS,MChi2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfL0,ZfVP,ZfVZpVP,ZfVZVP,AmpWaveChiToChiVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_ChiToChiVP(MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,              & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,ZcplChiChacHpmL,ZcplChiChacHpmR,             & 
& ZcplChiChacVWmL,ZcplChiChacVWmR,ZcplcChaChaVPL,ZcplcChaChaVPR,ZcplChiFdcSdL,           & 
& ZcplChiFdcSdR,ZcplChiFecSeL,ZcplChiFecSeR,ZcplChiFucSuL,ZcplChiFucSuR,ZcplcChaChiHpmL, & 
& ZcplcChaChiHpmR,ZcplcFdChiSdL,ZcplcFdChiSdR,ZcplcFeChiSeL,ZcplcFeChiSeR,               & 
& ZcplcFuChiSuL,ZcplcFuChiSuR,ZcplcChaChiVWmL,ZcplcChaChiVWmR,ZcplcFdFdVPL,              & 
& ZcplcFdFdVPR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplHpmcHpmVP,        & 
& ZcplHpmcVWmVP,ZcplSdcSdVP,ZcplSecSeVP,ZcplSucSuVP,ZcplcHpmVPVWm,ZcplcVWmVPVWm,         & 
& AmpVertexChiToChiVP)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_ChiToChiVP(MChaOS,MChiOS,MFdOS,MFeOS,MFuOS,           & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,              & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,cplChiChacHpmL,cplChiChacHpmR,               & 
& cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVPL,cplcChaChaVPR,cplChiFdcSdL,cplChiFdcSdR,   & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFuFuVPL,cplcFuFuVPR,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,               & 
& cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,AmpVertexChiToChiVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_ChiToChiVP(cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,     & 
& cplChiChiVZpR,ctcplChiChiVZL,ctcplChiChiVZR,ctcplChiChiVZpL,ctcplChiChiVZpR,           & 
& MChi,MChi2,MVP,MVP2,MVZ,MVZ2,ZfL0,ZfVP,ZfVZpVP,ZfVZVP,AmpWaveChiToChiVP)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChiToChiVP(MCha,MChi,MFd,MFe,MFu,MHpm,MSd,            & 
& MSe,MSu,MVP,MVWm,MCha2,MChi2,MFd2,MFe2,MFu2,MHpm2,MSd2,MSe2,MSu2,MVP2,MVWm2,           & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChaVPL,             & 
& cplcChaChaVPR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,     & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplHpmcHpmVP,              & 
& cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,               & 
& AmpVertexChiToChiVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Chi VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToChiVP = 0._dp 
 AmpSum2ChiToChiVP = 0._dp  
Else 
 AmpSumChiToChiVP = AmpVertexChiToChiVP + AmpWaveChiToChiVP
 AmpSum2ChiToChiVP = AmpVertexChiToChiVP + AmpWaveChiToChiVP 
End If 
Do gt1=1,9
i4 = isave 
  Do gt2=1,9
If (((OSkinematics).and.(Abs(MChiOS(gt1)).gt.(Abs(MChiOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MChi(gt1)).gt.(Abs(MChi(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MChiOS(gt2),0._dp,AmpSumChiToChiVP(:,gt1, gt2),AmpSum2ChiToChiVP(:,gt1, gt2),AmpSqChiToChiVP(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MChi(gt2),MVP,AmpSumChiToChiVP(:,gt1, gt2),AmpSum2ChiToChiVP(:,gt1, gt2),AmpSqChiToChiVP(gt1, gt2)) 
End if  
Else  
  AmpSqChiToChiVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToChiVP(gt1, gt2).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChiOS(gt1),MChiOS(gt2),0._dp,helfactor*AmpSqChiToChiVP(gt1, gt2))
Else 
  gP1LChi(gt1,i4) = 2._dp*GammaTPS(MChi(gt1),MChi(gt2),MVP,helfactor*AmpSqChiToChiVP(gt1, gt2))
End if 
If ((Abs(MRPChiToChiVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGChiToChiVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.9) isave = i4 
End do
!---------------- 
! Glu VG
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_ChiToGluVG(MChiOS,MFdOS,MFuOS,MGluOS,MSdOS,           & 
& MSuOS,MVG,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,MSd2OS,MSu2OS,MVG2,ZcplChiFdcSdL,              & 
& ZcplChiFdcSdR,ZcplChiFucSuL,ZcplChiFucSuR,ZcplcFdChiSdL,ZcplcFdChiSdR,ZcplcFuChiSuL,   & 
& ZcplcFuChiSuR,ZcplGluFdcSdL,ZcplGluFdcSdR,ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplGluFucSuL,     & 
& ZcplGluFucSuR,ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFdGluSdL,ZcplcFdGluSdR,ZcplcFuGluSuL,     & 
& ZcplcFuGluSuR,ZcplSdcSdVG,ZcplSucSuVG,AmpVertexChiToGluVG)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_ChiToGluVG(MChiOS,MFdOS,MFuOS,MGluOS,MSdOS,           & 
& MSuOS,MVG,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,MSd2OS,MSu2OS,MVG2,cplChiFdcSdL,               & 
& cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdVGL,cplcFdFdVGR,cplGluFucSuL,           & 
& cplGluFucSuR,cplcFuFuVGL,cplcFuFuVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,           & 
& cplcFuGluSuR,cplSdcSdVG,cplSucSuVG,AmpVertexChiToGluVG)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_ChiToGluVG(MChi,MFd,MFu,MGlu,MSd,MSu,MVG,             & 
& MChi2,MFd2,MFu2,MGlu2,MSd2,MSu2,MVG2,cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,           & 
& cplChiFucSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,cplGluFdcSdL,         & 
& cplGluFdcSdR,cplcFdFdVGL,cplcFdFdVGR,cplGluFucSuL,cplGluFucSuR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplSdcSdVG,            & 
& cplSucSuVG,AmpVertexChiToGluVG)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Chi->Glu VG -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumChiToGluVG = 0._dp 
 AmpSum2ChiToGluVG = 0._dp  
Else 
 AmpSumChiToGluVG = AmpVertexChiToGluVG + AmpWaveChiToGluVG
 AmpSum2ChiToGluVG = AmpVertexChiToGluVG + AmpWaveChiToGluVG 
End If 
Do gt1=1,9
i4 = isave 
If (((OSkinematics).and.(Abs(MChiOS(gt1)).gt.(Abs(MGluOS)+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MChi(gt1)).gt.(Abs(MGlu)+Abs(MVG))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MChiOS(gt1),MGluOS,0._dp,AmpSumChiToGluVG(:,gt1),AmpSum2ChiToGluVG(:,gt1),AmpSqChiToGluVG(gt1)) 
Else  
  Call SquareAmp_FtoFV(MChi(gt1),MGlu,MVG,AmpSumChiToGluVG(:,gt1),AmpSum2ChiToGluVG(:,gt1),AmpSqChiToGluVG(gt1)) 
End if  
Else  
  AmpSqChiToGluVG(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqChiToGluVG(gt1).eq.0._dp) Then 
  gP1LChi(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LChi(gt1,i4) = 16._dp*GammaTPS(MChiOS(gt1),MGluOS,0._dp,helfactor*AmpSqChiToGluVG(gt1))
Else 
  gP1LChi(gt1,i4) = 16._dp*GammaTPS(MChi(gt1),MGlu,MVG,helfactor*AmpSqChiToGluVG(gt1))
End if 
If ((Abs(MRPChiToGluVG(gt1)).gt.1.0E-20_dp).or.(Abs(MRGChiToGluVG(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LChi(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.9) isave = i4 
End do
End Subroutine OneLoopDecay_Chi

End Module Wrapper_OneLoopDecay_Chi_sec_UMSSM
