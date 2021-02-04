! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 1:12 on 7.11.2019   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_hh_sec_UMSSM
Use Model_Data_sec_UMSSM 
Use Kinematics 
Use OneLoopDecay_hh_sec_UMSSM 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_hh(MSdOS,MSd2OS,MSvOS,MSv2OS,MSuOS,MSu2OS,MSeOS,              & 
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
& ZfVZVZp,ZfVZpVZ,cplAhAhAh,cplAhAhAhAh1,cplAhAhcVWmVWm1,cplAhAhhh,cplAhAhhhhh1,         & 
& cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvcSv1,             & 
& cplAhAhVZpVZp1,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhcHpmVPVWm1,cplAhcHpmVWm,cplAhcHpmVWmVZ1,& 
& cplAhcHpmVWmVZp1,cplAhhhhh,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplAhhhSecSe1,               & 
& cplAhhhSucSuaa,cplAhhhSvcSv1,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,           & 
& cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplAhSdcSd,cplAhSecSe,cplAhSucSu,     & 
& cplAhSvcSv,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,cplcChaChaAhL,      & 
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
& cplcFvFvVZpL,cplcFvFvVZpR,cplcFvFvVZR,cplcgAgWmcVWm,cplcgAgWpCVWm,cplcgWmgAHpm,        & 
& cplcgWmgAVWm,cplcgWmgWmAh,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgWmVZp,        & 
& cplcgWmgZHpm,cplcgWmgZpHpm,cplcgWmgZpVWm,cplcgWmgZVWm,cplcgWpCgAcVWm,cplcgWpCgWpCAh,   & 
& cplcgWpCgWpChh,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplcgWpCgZcHpm,           & 
& cplcgWpCgZcVWm,cplcgWpCgZpcHpm,cplcgWpCgZpcVWm,cplcgZgWmcHpm,cplcgZgWmcVWm,            & 
& cplcgZgWpCHpm,cplcgZgWpCVWm,cplcgZgZhh,cplcgZgZphh,cplcgZpgWmcHpm,cplcgZpgWmcVWm,      & 
& cplcgZpgWpCHpm,cplcgZpgWpCVWm,cplcgZpgZhh,cplcgZpgZphh,cplChaFucSdL,cplChaFucSdR,      & 
& cplChaFvcSeL,cplChaFvcSeR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR, & 
& cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,        & 
& cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcHpmVPVWm,cplcHpmVWmVZ,         & 
& cplcHpmVWmVZp,cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,             & 
& cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,cplcVWmVPVPVWm3Q,cplcVWmVPVWm,cplcVWmVPVWmVZ1Q,      & 
& cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZp1Q,cplcVWmVPVWmVZp2Q,cplcVWmVPVWmVZp3Q,& 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplcVWmVWmVZpVZp1Q,cplcVWmVWmVZpVZp2Q,cplcVWmVWmVZpVZp3Q,   & 
& cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZp1Q,cplcVWmVWmVZVZp2Q,& 
& cplcVWmVWmVZVZp3Q,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplhhcHpmVPVWm1, & 
& cplhhcHpmVWm,cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,cplhhcVWmVWm,cplhhhhcVWmVWm1,            & 
& cplhhhhhh,cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,    & 
& cplhhhhSvcSv1,cplhhhhVZpVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpmcHpm,cplhhHpmcVWm,     & 
& cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhHpmSucSdaa,cplhhHpmSvcSe1,       & 
& cplhhSdcHpmcSuaa,cplhhSdcSd,cplhhSecHpmcSv1,cplhhSecSe,cplhhSucSu,cplhhSvcSv,          & 
& cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmcVWmVWm1,cplHpmcHpmVP,cplHpmcHpmVPVP1,      & 
& cplHpmcHpmVPVZ1,cplHpmcHpmVPVZp1,cplHpmcHpmVZ,cplHpmcHpmVZp,cplHpmcHpmVZpVZp1,         & 
& cplHpmcHpmVZVZ1,cplHpmcHpmVZVZp1,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,              & 
& cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,               & 
& cplHpmSucSd,cplHpmSvcHpmcSv1,cplHpmSvcSe,cplSdcHpmcSu,cplSdcSdcVWmVWmaa,               & 
& cplSdcSdVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSdcSdVP,cplSdcSdVPVPaa,cplSdcSdVPVZaa,cplSdcSdVPVZpaa,cplSdcSdVZ,cplSdcSdVZp,       & 
& cplSdcSdVZpVZpaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,cplSdcSucVWm,cplSdSdcSdcSdabab,        & 
& cplSdSdcSdcSdabba,cplSdSecSdcSeaa,cplSdSucSdcSuabab,cplSdSucSdcSuabba,cplSdSvcSdcSvaa, & 
& cplSecHpmcSv,cplSecSecVWmVWm1,cplSecSeVP,cplSecSeVPVP1,cplSecSeVPVZ1,cplSecSeVPVZp1,   & 
& cplSecSeVZ,cplSecSeVZp,cplSecSeVZpVZp1,cplSecSeVZVZ1,cplSecSeVZVZp1,cplSecSvcVWm,      & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvcSecSv1,cplSucSdVWm,cplSucSucVWmVWmaa,           & 
& cplSucSuVG,cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVP,cplSucSuVPVPaa,cplSucSuVPVZaa,cplSucSuVPVZpaa,cplSucSuVZ,cplSucSuVZp,       & 
& cplSucSuVZpVZpaa,cplSucSuVZVZaa,cplSucSuVZVZpaa,cplSuSucSucSuabab,cplSuSucSucSuabba,   & 
& cplSuSvcSucSvaa,cplSvcSeVWm,cplSvcSvcVWmVWm1,cplSvcSvVZ,cplSvcSvVZp,cplSvcSvVZpVZp1,   & 
& cplSvcSvVZVZ1,cplSvcSvVZVZp1,cplSvSvcSvcSv1,ctcplAhAhhh,ctcplAhhhhh,ctcplAhhhVZ,       & 
& ctcplAhhhVZp,ctcplcChaChahhL,ctcplcChaChahhR,ctcplcFdFdhhL,ctcplcFdFdhhR,              & 
& ctcplcFeFehhL,ctcplcFeFehhR,ctcplcFuFuhhL,ctcplcFuFuhhR,ctcplcFvFvhhL,ctcplcFvFvhhR,   & 
& ctcplChiChihhL,ctcplChiChihhR,ctcplhhcVWmVWm,ctcplhhhhhh,ctcplhhHpmcHpm,               & 
& ctcplhhHpmcVWm,ctcplhhSdcSd,ctcplhhSecSe,ctcplhhSucSu,ctcplhhSvcSv,ctcplhhVZpVZp,      & 
& ctcplhhVZVZ,ctcplhhVZVZp,GcplcHpmVPVWm,GcplhhcHpmVWm,GcplhhHpmcHpm,GcplHpmcVWmVP,      & 
& GosZcplcHpmVPVWm,GosZcplhhcHpmVWm,GosZcplhhHpmcHpm,GosZcplHpmcVWmVP,GZcplcHpmVPVWm,    & 
& GZcplhhcHpmVWm,GZcplhhHpmcHpm,GZcplHpmcVWmVP,ZcplAhAhhh,ZcplAhhhhh,ZcplAhhhVZ,         & 
& ZcplAhhhVZp,ZcplcChaChahhL,ZcplcChaChahhR,ZcplcFdFdhhL,ZcplcFdFdhhR,ZcplcFeFehhL,      & 
& ZcplcFeFehhR,ZcplcFuFuhhL,ZcplcFuFuhhR,ZcplcFvFvhhL,ZcplcFvFvhhR,ZcplChiChihhL,        & 
& ZcplChiChihhR,ZcplhhcVWmVWm,Zcplhhhhhh,ZcplhhHpmcHpm,ZcplhhHpmcVWm,ZcplhhSdcSd,        & 
& ZcplhhSecSe,ZcplhhSucSu,ZcplhhSvcSv,ZcplhhVZpVZp,ZcplhhVZVZ,ZcplhhVZVZp,               & 
& ZRUZD,ZRUZV,ZRUZU,ZRUZE,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUZVL,ZRUZVR,ZRUUM,ZRUUP,             & 
& ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,kont,gP1Lhh)

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

Complex(dp),Intent(in) :: cplAhAhAh(6,6,6),cplAhAhAhAh1(6,6,6,6),cplAhAhcVWmVWm1(6,6),cplAhAhhh(6,6,6),         & 
& cplAhAhhhhh1(6,6,6,6),cplAhAhHpmcHpm1(6,6,2,2),cplAhAhSdcSdaa(6,6,6,6),cplAhAhSecSe1(6,6,6,6),& 
& cplAhAhSucSuaa(6,6,6,6),cplAhAhSvcSv1(6,6,6,6),cplAhAhVZpVZp1(6,6),cplAhAhVZVZ1(6,6),  & 
& cplAhAhVZVZp1(6,6),cplAhcHpmVPVWm1(6,2),cplAhcHpmVWm(6,2),cplAhcHpmVWmVZ1(6,2),        & 
& cplAhcHpmVWmVZp1(6,2),cplAhhhhh(6,6,6),cplAhhhHpmcHpm1(6,6,2,2),cplAhhhSdcSdaa(6,6,6,6),& 
& cplAhhhSecSe1(6,6,6,6),cplAhhhSucSuaa(6,6,6,6),cplAhhhSvcSv1(6,6,6,6),cplAhhhVZ(6,6),  & 
& cplAhhhVZp(6,6),cplAhHpmcHpm(6,2,2),cplAhHpmcVWm(6,2),cplAhHpmcVWmVP1(6,2),            & 
& cplAhHpmcVWmVZ1(6,2),cplAhHpmcVWmVZp1(6,2),cplAhSdcSd(6,6,6),cplAhSecSe(6,6,6),        & 
& cplAhSucSu(6,6,6),cplAhSvcSv(6,6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),         & 
& cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),   & 
& cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),       & 
& cplcChaChaVZL(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcChaChaVZR(2,2),         & 
& cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9),   & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),   & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFdChiSdL(3,9,6),cplcFdChiSdR(3,9,6),       & 
& cplcFdFdAhL(3,3,6),cplcFdFdAhR(3,3,6),cplcFdFdhhL(3,3,6),cplcFdFdhhR(3,3,6),           & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcFdFdVZR(3,3),cplcFdFuHpmL(3,3,2),              & 
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
& cplcFvFvVZpR(3,3),cplcFvFvVZR(3,3),cplcgAgWmcVWm,cplcgAgWpCVWm,cplcgWmgAHpm(2),        & 
& cplcgWmgAVWm,cplcgWmgWmAh(6),cplcgWmgWmhh(6),cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgWmVZp,  & 
& cplcgWmgZHpm(2),cplcgWmgZpHpm(2),cplcgWmgZpVWm,cplcgWmgZVWm,cplcgWpCgAcVWm,            & 
& cplcgWpCgWpCAh(6),cplcgWpCgWpChh(6),cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,     & 
& cplcgWpCgZcHpm(2),cplcgWpCgZcVWm,cplcgWpCgZpcHpm(2),cplcgWpCgZpcVWm,cplcgZgWmcHpm(2),  & 
& cplcgZgWmcVWm,cplcgZgWpCHpm(2),cplcgZgWpCVWm,cplcgZgZhh(6),cplcgZgZphh(6)

Complex(dp),Intent(in) :: cplcgZpgWmcHpm(2),cplcgZpgWmcVWm,cplcgZpgWpCHpm(2),cplcgZpgWpCVWm,cplcgZpgZhh(6),      & 
& cplcgZpgZphh(6),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),cplChaFvcSeL(2,3,6),           & 
& cplChaFvcSeR(2,3,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChiChacVWmL(9,2),   & 
& cplChiChacVWmR(9,2),cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),cplChiChihhL(9,9,6),       & 
& cplChiChihhR(9,9,6),cplChiChiVZL(9,9),cplChiChiVZpL(9,9),cplChiChiVZpR(9,9),           & 
& cplChiChiVZR(9,9),cplChiFdcSdL(9,3,6),cplChiFdcSdR(9,3,6),cplChiFecSeL(9,3,6),         & 
& cplChiFecSeR(9,3,6),cplChiFucSuL(9,3,6),cplChiFucSuR(9,3,6),cplChiFvcSvL(9,3,6),       & 
& cplChiFvcSvR(9,3,6),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcHpmVWmVZp(2),cplcVWmcVWmVWmVWm1Q,& 
& cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,             & 
& cplcVWmVPVPVWm3Q,cplcVWmVPVWm,cplcVWmVPVWmVZ1Q,cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ3Q,      & 
& cplcVWmVPVWmVZp1Q,cplcVWmVPVWmVZp2Q,cplcVWmVPVWmVZp3Q,cplcVWmVWmVZ,cplcVWmVWmVZp,      & 
& cplcVWmVWmVZpVZp1Q,cplcVWmVWmVZpVZp2Q,cplcVWmVWmVZpVZp3Q,cplcVWmVWmVZVZ1Q,             & 
& cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZp1Q,cplcVWmVWmVZVZp2Q,cplcVWmVWmVZVZp3Q,& 
& cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),               & 
& cplhhcHpmVPVWm1(6,2),cplhhcHpmVWm(6,2),cplhhcHpmVWmVZ1(6,2),cplhhcHpmVWmVZp1(6,2),     & 
& cplhhcVWmVWm(6),cplhhhhcVWmVWm1(6,6),cplhhhhhh(6,6,6),cplhhhhhhhh1(6,6,6,6),           & 
& cplhhhhHpmcHpm1(6,6,2,2),cplhhhhSdcSdaa(6,6,6,6),cplhhhhSecSe1(6,6,6,6),               & 
& cplhhhhSucSuaa(6,6,6,6),cplhhhhSvcSv1(6,6,6,6),cplhhhhVZpVZp1(6,6),cplhhhhVZVZ1(6,6),  & 
& cplhhhhVZVZp1(6,6),cplhhHpmcHpm(6,2,2),cplhhHpmcVWm(6,2),cplhhHpmcVWmVP1(6,2),         & 
& cplhhHpmcVWmVZ1(6,2),cplhhHpmcVWmVZp1(6,2),cplhhHpmSucSdaa(6,2,6,6),cplhhHpmSvcSe1(6,2,6,6),& 
& cplhhSdcHpmcSuaa(6,6,2,6),cplhhSdcSd(6,6,6),cplhhSecHpmcSv1(6,6,2,6),cplhhSecSe(6,6,6),& 
& cplhhSucSu(6,6,6),cplhhSvcSv(6,6,6),cplhhVZpVZp(6),cplhhVZVZ(6),cplhhVZVZp(6),         & 
& cplHpmcHpmcVWmVWm1(2,2),cplHpmcHpmVP(2,2),cplHpmcHpmVPVP1(2,2),cplHpmcHpmVPVZ1(2,2),   & 
& cplHpmcHpmVPVZp1(2,2),cplHpmcHpmVZ(2,2),cplHpmcHpmVZp(2,2),cplHpmcHpmVZpVZp1(2,2),     & 
& cplHpmcHpmVZVZ1(2,2),cplHpmcHpmVZVZp1(2,2),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),            & 
& cplHpmcVWmVZp(2),cplHpmHpmcHpmcHpm1(2,2,2,2),cplHpmSdcHpmcSdaa(2,6,2,6),               & 
& cplHpmSecHpmcSe1(2,6,2,6),cplHpmSucHpmcSuaa(2,6,2,6),cplHpmSucSd(2,6,6),               & 
& cplHpmSvcHpmcSv1(2,6,2,6),cplHpmSvcSe(2,6,6),cplSdcHpmcSu(6,2,6),cplSdcSdcVWmVWmaa(6,6),& 
& cplSdcSdVG(6,6),cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6),& 
& cplSdcSdVP(6,6),cplSdcSdVPVPaa(6,6),cplSdcSdVPVZaa(6,6),cplSdcSdVPVZpaa(6,6),          & 
& cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplSdcSdVZpVZpaa(6,6),cplSdcSdVZVZaa(6,6),            & 
& cplSdcSdVZVZpaa(6,6),cplSdcSucVWm(6,6),cplSdSdcSdcSdabab(6,6,6,6),cplSdSdcSdcSdabba(6,6,6,6),& 
& cplSdSecSdcSeaa(6,6,6,6),cplSdSucSdcSuabab(6,6,6,6),cplSdSucSdcSuabba(6,6,6,6),        & 
& cplSdSvcSdcSvaa(6,6,6,6),cplSecHpmcSv(6,2,6),cplSecSecVWmVWm1(6,6),cplSecSeVP(6,6),    & 
& cplSecSeVPVP1(6,6),cplSecSeVPVZ1(6,6),cplSecSeVPVZp1(6,6),cplSecSeVZ(6,6),             & 
& cplSecSeVZp(6,6),cplSecSeVZpVZp1(6,6),cplSecSeVZVZ1(6,6),cplSecSeVZVZp1(6,6),          & 
& cplSecSvcVWm(6,6),cplSeSecSecSe1(6,6,6,6),cplSeSucSecSuaa(6,6,6,6),cplSeSvcSecSv1(6,6,6,6)

Complex(dp),Intent(in) :: cplSucSdVWm(6,6),cplSucSucVWmVWmaa(6,6),cplSucSuVG(6,6),cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),& 
& cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6),cplSucSuVP(6,6),cplSucSuVPVPaa(6,6),    & 
& cplSucSuVPVZaa(6,6),cplSucSuVPVZpaa(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6),             & 
& cplSucSuVZpVZpaa(6,6),cplSucSuVZVZaa(6,6),cplSucSuVZVZpaa(6,6),cplSuSucSucSuabab(6,6,6,6),& 
& cplSuSucSucSuabba(6,6,6,6),cplSuSvcSucSvaa(6,6,6,6),cplSvcSeVWm(6,6),cplSvcSvcVWmVWm1(6,6),& 
& cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),cplSvcSvVZpVZp1(6,6),cplSvcSvVZVZ1(6,6),              & 
& cplSvcSvVZVZp1(6,6),cplSvSvcSvcSv1(6,6,6,6),ctcplAhAhhh(6,6,6),ctcplAhhhhh(6,6,6),     & 
& ctcplAhhhVZ(6,6),ctcplAhhhVZp(6,6),ctcplcChaChahhL(2,2,6),ctcplcChaChahhR(2,2,6),      & 
& ctcplcFdFdhhL(3,3,6),ctcplcFdFdhhR(3,3,6),ctcplcFeFehhL(3,3,6),ctcplcFeFehhR(3,3,6),   & 
& ctcplcFuFuhhL(3,3,6),ctcplcFuFuhhR(3,3,6),ctcplcFvFvhhL(3,3,6),ctcplcFvFvhhR(3,3,6),   & 
& ctcplChiChihhL(9,9,6),ctcplChiChihhR(9,9,6),ctcplhhcVWmVWm(6),ctcplhhhhhh(6,6,6),      & 
& ctcplhhHpmcHpm(6,2,2),ctcplhhHpmcVWm(6,2),ctcplhhSdcSd(6,6,6),ctcplhhSecSe(6,6,6),     & 
& ctcplhhSucSu(6,6,6),ctcplhhSvcSv(6,6,6),ctcplhhVZpVZp(6),ctcplhhVZVZ(6),               & 
& ctcplhhVZVZp(6),GcplcHpmVPVWm(2),GcplhhcHpmVWm(6,2),GcplhhHpmcHpm(6,2,2),              & 
& GcplHpmcVWmVP(2),GosZcplcHpmVPVWm(2),GosZcplhhcHpmVWm(6,2),GosZcplhhHpmcHpm(6,2,2),    & 
& GosZcplHpmcVWmVP(2),GZcplcHpmVPVWm(2),GZcplhhcHpmVWm(6,2),GZcplhhHpmcHpm(6,2,2),       & 
& GZcplHpmcVWmVP(2),ZcplAhAhhh(6,6,6),ZcplAhhhhh(6,6,6),ZcplAhhhVZ(6,6),ZcplAhhhVZp(6,6),& 
& ZcplcChaChahhL(2,2,6),ZcplcChaChahhR(2,2,6),ZcplcFdFdhhL(3,3,6),ZcplcFdFdhhR(3,3,6),   & 
& ZcplcFeFehhL(3,3,6),ZcplcFeFehhR(3,3,6),ZcplcFuFuhhL(3,3,6),ZcplcFuFuhhR(3,3,6),       & 
& ZcplcFvFvhhL(3,3,6),ZcplcFvFvhhR(3,3,6),ZcplChiChihhL(9,9,6),ZcplChiChihhR(9,9,6),     & 
& ZcplhhcVWmVWm(6),Zcplhhhhhh(6,6,6),ZcplhhHpmcHpm(6,2,2),ZcplhhHpmcVWm(6,2),            & 
& ZcplhhSdcSd(6,6,6),ZcplhhSecSe(6,6,6),ZcplhhSucSu(6,6,6),ZcplhhSvcSv(6,6,6),           & 
& ZcplhhVZpVZp(6),ZcplhhVZVZ(6),ZcplhhVZVZp(6)

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
Real(dp), Intent(out) :: gP1Lhh(6,329) 
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
Real(dp) :: MRPhhToAhAh(6,6,6),MRGhhToAhAh(6,6,6), MRPZhhToAhAh(6,6,6),MRGZhhToAhAh(6,6,6) 
Real(dp) :: MVPhhToAhAh(6,6,6) 
Real(dp) :: RMsqTreehhToAhAh(6,6,6),RMsqWavehhToAhAh(6,6,6),RMsqVertexhhToAhAh(6,6,6) 
Complex(dp) :: AmpTreehhToAhAh(6,6,6),AmpWavehhToAhAh(6,6,6)=(0._dp,0._dp),AmpVertexhhToAhAh(6,6,6)& 
 & ,AmpVertexIRoshhToAhAh(6,6,6),AmpVertexIRdrhhToAhAh(6,6,6), AmpSumhhToAhAh(6,6,6), AmpSum2hhToAhAh(6,6,6) 
Complex(dp) :: AmpTreeZhhToAhAh(6,6,6),AmpWaveZhhToAhAh(6,6,6),AmpVertexZhhToAhAh(6,6,6) 
Real(dp) :: AmpSqhhToAhAh(6,6,6),  AmpSqTreehhToAhAh(6,6,6) 
Real(dp) :: MRPhhTohhAh(6,6,6),MRGhhTohhAh(6,6,6), MRPZhhTohhAh(6,6,6),MRGZhhTohhAh(6,6,6) 
Real(dp) :: MVPhhTohhAh(6,6,6) 
Real(dp) :: RMsqTreehhTohhAh(6,6,6),RMsqWavehhTohhAh(6,6,6),RMsqVertexhhTohhAh(6,6,6) 
Complex(dp) :: AmpTreehhTohhAh(6,6,6),AmpWavehhTohhAh(6,6,6)=(0._dp,0._dp),AmpVertexhhTohhAh(6,6,6)& 
 & ,AmpVertexIRoshhTohhAh(6,6,6),AmpVertexIRdrhhTohhAh(6,6,6), AmpSumhhTohhAh(6,6,6), AmpSum2hhTohhAh(6,6,6) 
Complex(dp) :: AmpTreeZhhTohhAh(6,6,6),AmpWaveZhhTohhAh(6,6,6),AmpVertexZhhTohhAh(6,6,6) 
Real(dp) :: AmpSqhhTohhAh(6,6,6),  AmpSqTreehhTohhAh(6,6,6) 
Real(dp) :: MRPhhToAhVZ(6,6),MRGhhToAhVZ(6,6), MRPZhhToAhVZ(6,6),MRGZhhToAhVZ(6,6) 
Real(dp) :: MVPhhToAhVZ(6,6) 
Real(dp) :: RMsqTreehhToAhVZ(6,6),RMsqWavehhToAhVZ(6,6),RMsqVertexhhToAhVZ(6,6) 
Complex(dp) :: AmpTreehhToAhVZ(2,6,6),AmpWavehhToAhVZ(2,6,6)=(0._dp,0._dp),AmpVertexhhToAhVZ(2,6,6)& 
 & ,AmpVertexIRoshhToAhVZ(2,6,6),AmpVertexIRdrhhToAhVZ(2,6,6), AmpSumhhToAhVZ(2,6,6), AmpSum2hhToAhVZ(2,6,6) 
Complex(dp) :: AmpTreeZhhToAhVZ(2,6,6),AmpWaveZhhToAhVZ(2,6,6),AmpVertexZhhToAhVZ(2,6,6) 
Real(dp) :: AmpSqhhToAhVZ(6,6),  AmpSqTreehhToAhVZ(6,6) 
Real(dp) :: MRPhhToAhVZp(6,6),MRGhhToAhVZp(6,6), MRPZhhToAhVZp(6,6),MRGZhhToAhVZp(6,6) 
Real(dp) :: MVPhhToAhVZp(6,6) 
Real(dp) :: RMsqTreehhToAhVZp(6,6),RMsqWavehhToAhVZp(6,6),RMsqVertexhhToAhVZp(6,6) 
Complex(dp) :: AmpTreehhToAhVZp(2,6,6),AmpWavehhToAhVZp(2,6,6)=(0._dp,0._dp),AmpVertexhhToAhVZp(2,6,6)& 
 & ,AmpVertexIRoshhToAhVZp(2,6,6),AmpVertexIRdrhhToAhVZp(2,6,6), AmpSumhhToAhVZp(2,6,6), AmpSum2hhToAhVZp(2,6,6) 
Complex(dp) :: AmpTreeZhhToAhVZp(2,6,6),AmpWaveZhhToAhVZp(2,6,6),AmpVertexZhhToAhVZp(2,6,6) 
Real(dp) :: AmpSqhhToAhVZp(6,6),  AmpSqTreehhToAhVZp(6,6) 
Real(dp) :: MRPhhTocChaCha(6,2,2),MRGhhTocChaCha(6,2,2), MRPZhhTocChaCha(6,2,2),MRGZhhTocChaCha(6,2,2) 
Real(dp) :: MVPhhTocChaCha(6,2,2) 
Real(dp) :: RMsqTreehhTocChaCha(6,2,2),RMsqWavehhTocChaCha(6,2,2),RMsqVertexhhTocChaCha(6,2,2) 
Complex(dp) :: AmpTreehhTocChaCha(2,6,2,2),AmpWavehhTocChaCha(2,6,2,2)=(0._dp,0._dp),AmpVertexhhTocChaCha(2,6,2,2)& 
 & ,AmpVertexIRoshhTocChaCha(2,6,2,2),AmpVertexIRdrhhTocChaCha(2,6,2,2), AmpSumhhTocChaCha(2,6,2,2), AmpSum2hhTocChaCha(2,6,2,2) 
Complex(dp) :: AmpTreeZhhTocChaCha(2,6,2,2),AmpWaveZhhTocChaCha(2,6,2,2),AmpVertexZhhTocChaCha(2,6,2,2) 
Real(dp) :: AmpSqhhTocChaCha(6,2,2),  AmpSqTreehhTocChaCha(6,2,2) 
Real(dp) :: MRPhhToChiChi(6,9,9),MRGhhToChiChi(6,9,9), MRPZhhToChiChi(6,9,9),MRGZhhToChiChi(6,9,9) 
Real(dp) :: MVPhhToChiChi(6,9,9) 
Real(dp) :: RMsqTreehhToChiChi(6,9,9),RMsqWavehhToChiChi(6,9,9),RMsqVertexhhToChiChi(6,9,9) 
Complex(dp) :: AmpTreehhToChiChi(2,6,9,9),AmpWavehhToChiChi(2,6,9,9)=(0._dp,0._dp),AmpVertexhhToChiChi(2,6,9,9)& 
 & ,AmpVertexIRoshhToChiChi(2,6,9,9),AmpVertexIRdrhhToChiChi(2,6,9,9), AmpSumhhToChiChi(2,6,9,9), AmpSum2hhToChiChi(2,6,9,9) 
Complex(dp) :: AmpTreeZhhToChiChi(2,6,9,9),AmpWaveZhhToChiChi(2,6,9,9),AmpVertexZhhToChiChi(2,6,9,9) 
Real(dp) :: AmpSqhhToChiChi(6,9,9),  AmpSqTreehhToChiChi(6,9,9) 
Real(dp) :: MRPhhTocFdFd(6,3,3),MRGhhTocFdFd(6,3,3), MRPZhhTocFdFd(6,3,3),MRGZhhTocFdFd(6,3,3) 
Real(dp) :: MVPhhTocFdFd(6,3,3) 
Real(dp) :: RMsqTreehhTocFdFd(6,3,3),RMsqWavehhTocFdFd(6,3,3),RMsqVertexhhTocFdFd(6,3,3) 
Complex(dp) :: AmpTreehhTocFdFd(2,6,3,3),AmpWavehhTocFdFd(2,6,3,3)=(0._dp,0._dp),AmpVertexhhTocFdFd(2,6,3,3)& 
 & ,AmpVertexIRoshhTocFdFd(2,6,3,3),AmpVertexIRdrhhTocFdFd(2,6,3,3), AmpSumhhTocFdFd(2,6,3,3), AmpSum2hhTocFdFd(2,6,3,3) 
Complex(dp) :: AmpTreeZhhTocFdFd(2,6,3,3),AmpWaveZhhTocFdFd(2,6,3,3),AmpVertexZhhTocFdFd(2,6,3,3) 
Real(dp) :: AmpSqhhTocFdFd(6,3,3),  AmpSqTreehhTocFdFd(6,3,3) 
Real(dp) :: MRPhhTocFeFe(6,3,3),MRGhhTocFeFe(6,3,3), MRPZhhTocFeFe(6,3,3),MRGZhhTocFeFe(6,3,3) 
Real(dp) :: MVPhhTocFeFe(6,3,3) 
Real(dp) :: RMsqTreehhTocFeFe(6,3,3),RMsqWavehhTocFeFe(6,3,3),RMsqVertexhhTocFeFe(6,3,3) 
Complex(dp) :: AmpTreehhTocFeFe(2,6,3,3),AmpWavehhTocFeFe(2,6,3,3)=(0._dp,0._dp),AmpVertexhhTocFeFe(2,6,3,3)& 
 & ,AmpVertexIRoshhTocFeFe(2,6,3,3),AmpVertexIRdrhhTocFeFe(2,6,3,3), AmpSumhhTocFeFe(2,6,3,3), AmpSum2hhTocFeFe(2,6,3,3) 
Complex(dp) :: AmpTreeZhhTocFeFe(2,6,3,3),AmpWaveZhhTocFeFe(2,6,3,3),AmpVertexZhhTocFeFe(2,6,3,3) 
Real(dp) :: AmpSqhhTocFeFe(6,3,3),  AmpSqTreehhTocFeFe(6,3,3) 
Real(dp) :: MRPhhTocFuFu(6,3,3),MRGhhTocFuFu(6,3,3), MRPZhhTocFuFu(6,3,3),MRGZhhTocFuFu(6,3,3) 
Real(dp) :: MVPhhTocFuFu(6,3,3) 
Real(dp) :: RMsqTreehhTocFuFu(6,3,3),RMsqWavehhTocFuFu(6,3,3),RMsqVertexhhTocFuFu(6,3,3) 
Complex(dp) :: AmpTreehhTocFuFu(2,6,3,3),AmpWavehhTocFuFu(2,6,3,3)=(0._dp,0._dp),AmpVertexhhTocFuFu(2,6,3,3)& 
 & ,AmpVertexIRoshhTocFuFu(2,6,3,3),AmpVertexIRdrhhTocFuFu(2,6,3,3), AmpSumhhTocFuFu(2,6,3,3), AmpSum2hhTocFuFu(2,6,3,3) 
Complex(dp) :: AmpTreeZhhTocFuFu(2,6,3,3),AmpWaveZhhTocFuFu(2,6,3,3),AmpVertexZhhTocFuFu(2,6,3,3) 
Real(dp) :: AmpSqhhTocFuFu(6,3,3),  AmpSqTreehhTocFuFu(6,3,3) 
Real(dp) :: MRPhhTocFvFv(6,3,3),MRGhhTocFvFv(6,3,3), MRPZhhTocFvFv(6,3,3),MRGZhhTocFvFv(6,3,3) 
Real(dp) :: MVPhhTocFvFv(6,3,3) 
Real(dp) :: RMsqTreehhTocFvFv(6,3,3),RMsqWavehhTocFvFv(6,3,3),RMsqVertexhhTocFvFv(6,3,3) 
Complex(dp) :: AmpTreehhTocFvFv(2,6,3,3),AmpWavehhTocFvFv(2,6,3,3)=(0._dp,0._dp),AmpVertexhhTocFvFv(2,6,3,3)& 
 & ,AmpVertexIRoshhTocFvFv(2,6,3,3),AmpVertexIRdrhhTocFvFv(2,6,3,3), AmpSumhhTocFvFv(2,6,3,3), AmpSum2hhTocFvFv(2,6,3,3) 
Complex(dp) :: AmpTreeZhhTocFvFv(2,6,3,3),AmpWaveZhhTocFvFv(2,6,3,3),AmpVertexZhhTocFvFv(2,6,3,3) 
Real(dp) :: AmpSqhhTocFvFv(6,3,3),  AmpSqTreehhTocFvFv(6,3,3) 
Real(dp) :: MRPhhTohhhh(6,6,6),MRGhhTohhhh(6,6,6), MRPZhhTohhhh(6,6,6),MRGZhhTohhhh(6,6,6) 
Real(dp) :: MVPhhTohhhh(6,6,6) 
Real(dp) :: RMsqTreehhTohhhh(6,6,6),RMsqWavehhTohhhh(6,6,6),RMsqVertexhhTohhhh(6,6,6) 
Complex(dp) :: AmpTreehhTohhhh(6,6,6),AmpWavehhTohhhh(6,6,6)=(0._dp,0._dp),AmpVertexhhTohhhh(6,6,6)& 
 & ,AmpVertexIRoshhTohhhh(6,6,6),AmpVertexIRdrhhTohhhh(6,6,6), AmpSumhhTohhhh(6,6,6), AmpSum2hhTohhhh(6,6,6) 
Complex(dp) :: AmpTreeZhhTohhhh(6,6,6),AmpWaveZhhTohhhh(6,6,6),AmpVertexZhhTohhhh(6,6,6) 
Real(dp) :: AmpSqhhTohhhh(6,6,6),  AmpSqTreehhTohhhh(6,6,6) 
Real(dp) :: MRPhhTocHpmHpm(6,2,2),MRGhhTocHpmHpm(6,2,2), MRPZhhTocHpmHpm(6,2,2),MRGZhhTocHpmHpm(6,2,2) 
Real(dp) :: MVPhhTocHpmHpm(6,2,2) 
Real(dp) :: RMsqTreehhTocHpmHpm(6,2,2),RMsqWavehhTocHpmHpm(6,2,2),RMsqVertexhhTocHpmHpm(6,2,2) 
Complex(dp) :: AmpTreehhTocHpmHpm(6,2,2),AmpWavehhTocHpmHpm(6,2,2)=(0._dp,0._dp),AmpVertexhhTocHpmHpm(6,2,2)& 
 & ,AmpVertexIRoshhTocHpmHpm(6,2,2),AmpVertexIRdrhhTocHpmHpm(6,2,2), AmpSumhhTocHpmHpm(6,2,2), AmpSum2hhTocHpmHpm(6,2,2) 
Complex(dp) :: AmpTreeZhhTocHpmHpm(6,2,2),AmpWaveZhhTocHpmHpm(6,2,2),AmpVertexZhhTocHpmHpm(6,2,2) 
Real(dp) :: AmpSqhhTocHpmHpm(6,2,2),  AmpSqTreehhTocHpmHpm(6,2,2) 
Real(dp) :: MRPhhToHpmcVWm(6,2),MRGhhToHpmcVWm(6,2), MRPZhhToHpmcVWm(6,2),MRGZhhToHpmcVWm(6,2) 
Real(dp) :: MVPhhToHpmcVWm(6,2) 
Real(dp) :: RMsqTreehhToHpmcVWm(6,2),RMsqWavehhToHpmcVWm(6,2),RMsqVertexhhToHpmcVWm(6,2) 
Complex(dp) :: AmpTreehhToHpmcVWm(2,6,2),AmpWavehhToHpmcVWm(2,6,2)=(0._dp,0._dp),AmpVertexhhToHpmcVWm(2,6,2)& 
 & ,AmpVertexIRoshhToHpmcVWm(2,6,2),AmpVertexIRdrhhToHpmcVWm(2,6,2), AmpSumhhToHpmcVWm(2,6,2), AmpSum2hhToHpmcVWm(2,6,2) 
Complex(dp) :: AmpTreeZhhToHpmcVWm(2,6,2),AmpWaveZhhToHpmcVWm(2,6,2),AmpVertexZhhToHpmcVWm(2,6,2) 
Real(dp) :: AmpSqhhToHpmcVWm(6,2),  AmpSqTreehhToHpmcVWm(6,2) 
Real(dp) :: MRPhhTocSdSd(6,6,6),MRGhhTocSdSd(6,6,6), MRPZhhTocSdSd(6,6,6),MRGZhhTocSdSd(6,6,6) 
Real(dp) :: MVPhhTocSdSd(6,6,6) 
Real(dp) :: RMsqTreehhTocSdSd(6,6,6),RMsqWavehhTocSdSd(6,6,6),RMsqVertexhhTocSdSd(6,6,6) 
Complex(dp) :: AmpTreehhTocSdSd(6,6,6),AmpWavehhTocSdSd(6,6,6)=(0._dp,0._dp),AmpVertexhhTocSdSd(6,6,6)& 
 & ,AmpVertexIRoshhTocSdSd(6,6,6),AmpVertexIRdrhhTocSdSd(6,6,6), AmpSumhhTocSdSd(6,6,6), AmpSum2hhTocSdSd(6,6,6) 
Complex(dp) :: AmpTreeZhhTocSdSd(6,6,6),AmpWaveZhhTocSdSd(6,6,6),AmpVertexZhhTocSdSd(6,6,6) 
Real(dp) :: AmpSqhhTocSdSd(6,6,6),  AmpSqTreehhTocSdSd(6,6,6) 
Real(dp) :: MRPhhTocSeSe(6,6,6),MRGhhTocSeSe(6,6,6), MRPZhhTocSeSe(6,6,6),MRGZhhTocSeSe(6,6,6) 
Real(dp) :: MVPhhTocSeSe(6,6,6) 
Real(dp) :: RMsqTreehhTocSeSe(6,6,6),RMsqWavehhTocSeSe(6,6,6),RMsqVertexhhTocSeSe(6,6,6) 
Complex(dp) :: AmpTreehhTocSeSe(6,6,6),AmpWavehhTocSeSe(6,6,6)=(0._dp,0._dp),AmpVertexhhTocSeSe(6,6,6)& 
 & ,AmpVertexIRoshhTocSeSe(6,6,6),AmpVertexIRdrhhTocSeSe(6,6,6), AmpSumhhTocSeSe(6,6,6), AmpSum2hhTocSeSe(6,6,6) 
Complex(dp) :: AmpTreeZhhTocSeSe(6,6,6),AmpWaveZhhTocSeSe(6,6,6),AmpVertexZhhTocSeSe(6,6,6) 
Real(dp) :: AmpSqhhTocSeSe(6,6,6),  AmpSqTreehhTocSeSe(6,6,6) 
Real(dp) :: MRPhhTocSuSu(6,6,6),MRGhhTocSuSu(6,6,6), MRPZhhTocSuSu(6,6,6),MRGZhhTocSuSu(6,6,6) 
Real(dp) :: MVPhhTocSuSu(6,6,6) 
Real(dp) :: RMsqTreehhTocSuSu(6,6,6),RMsqWavehhTocSuSu(6,6,6),RMsqVertexhhTocSuSu(6,6,6) 
Complex(dp) :: AmpTreehhTocSuSu(6,6,6),AmpWavehhTocSuSu(6,6,6)=(0._dp,0._dp),AmpVertexhhTocSuSu(6,6,6)& 
 & ,AmpVertexIRoshhTocSuSu(6,6,6),AmpVertexIRdrhhTocSuSu(6,6,6), AmpSumhhTocSuSu(6,6,6), AmpSum2hhTocSuSu(6,6,6) 
Complex(dp) :: AmpTreeZhhTocSuSu(6,6,6),AmpWaveZhhTocSuSu(6,6,6),AmpVertexZhhTocSuSu(6,6,6) 
Real(dp) :: AmpSqhhTocSuSu(6,6,6),  AmpSqTreehhTocSuSu(6,6,6) 
Real(dp) :: MRPhhTocSvSv(6,6,6),MRGhhTocSvSv(6,6,6), MRPZhhTocSvSv(6,6,6),MRGZhhTocSvSv(6,6,6) 
Real(dp) :: MVPhhTocSvSv(6,6,6) 
Real(dp) :: RMsqTreehhTocSvSv(6,6,6),RMsqWavehhTocSvSv(6,6,6),RMsqVertexhhTocSvSv(6,6,6) 
Complex(dp) :: AmpTreehhTocSvSv(6,6,6),AmpWavehhTocSvSv(6,6,6)=(0._dp,0._dp),AmpVertexhhTocSvSv(6,6,6)& 
 & ,AmpVertexIRoshhTocSvSv(6,6,6),AmpVertexIRdrhhTocSvSv(6,6,6), AmpSumhhTocSvSv(6,6,6), AmpSum2hhTocSvSv(6,6,6) 
Complex(dp) :: AmpTreeZhhTocSvSv(6,6,6),AmpWaveZhhTocSvSv(6,6,6),AmpVertexZhhTocSvSv(6,6,6) 
Real(dp) :: AmpSqhhTocSvSv(6,6,6),  AmpSqTreehhTocSvSv(6,6,6) 
Real(dp) :: MRPhhTocVWmVWm(6),MRGhhTocVWmVWm(6), MRPZhhTocVWmVWm(6),MRGZhhTocVWmVWm(6) 
Real(dp) :: MVPhhTocVWmVWm(6) 
Real(dp) :: RMsqTreehhTocVWmVWm(6),RMsqWavehhTocVWmVWm(6),RMsqVertexhhTocVWmVWm(6) 
Complex(dp) :: AmpTreehhTocVWmVWm(2,6),AmpWavehhTocVWmVWm(2,6)=(0._dp,0._dp),AmpVertexhhTocVWmVWm(2,6)& 
 & ,AmpVertexIRoshhTocVWmVWm(2,6),AmpVertexIRdrhhTocVWmVWm(2,6), AmpSumhhTocVWmVWm(2,6), AmpSum2hhTocVWmVWm(2,6) 
Complex(dp) :: AmpTreeZhhTocVWmVWm(2,6),AmpWaveZhhTocVWmVWm(2,6),AmpVertexZhhTocVWmVWm(2,6) 
Real(dp) :: AmpSqhhTocVWmVWm(6),  AmpSqTreehhTocVWmVWm(6) 
Real(dp) :: MRPhhToVZVZ(6),MRGhhToVZVZ(6), MRPZhhToVZVZ(6),MRGZhhToVZVZ(6) 
Real(dp) :: MVPhhToVZVZ(6) 
Real(dp) :: RMsqTreehhToVZVZ(6),RMsqWavehhToVZVZ(6),RMsqVertexhhToVZVZ(6) 
Complex(dp) :: AmpTreehhToVZVZ(2,6),AmpWavehhToVZVZ(2,6)=(0._dp,0._dp),AmpVertexhhToVZVZ(2,6)& 
 & ,AmpVertexIRoshhToVZVZ(2,6),AmpVertexIRdrhhToVZVZ(2,6), AmpSumhhToVZVZ(2,6), AmpSum2hhToVZVZ(2,6) 
Complex(dp) :: AmpTreeZhhToVZVZ(2,6),AmpWaveZhhToVZVZ(2,6),AmpVertexZhhToVZVZ(2,6) 
Real(dp) :: AmpSqhhToVZVZ(6),  AmpSqTreehhToVZVZ(6) 
Real(dp) :: MRPhhToVZpVZ(6),MRGhhToVZpVZ(6), MRPZhhToVZpVZ(6),MRGZhhToVZpVZ(6) 
Real(dp) :: MVPhhToVZpVZ(6) 
Real(dp) :: RMsqTreehhToVZpVZ(6),RMsqWavehhToVZpVZ(6),RMsqVertexhhToVZpVZ(6) 
Complex(dp) :: AmpTreehhToVZpVZ(2,6),AmpWavehhToVZpVZ(2,6)=(0._dp,0._dp),AmpVertexhhToVZpVZ(2,6)& 
 & ,AmpVertexIRoshhToVZpVZ(2,6),AmpVertexIRdrhhToVZpVZ(2,6), AmpSumhhToVZpVZ(2,6), AmpSum2hhToVZpVZ(2,6) 
Complex(dp) :: AmpTreeZhhToVZpVZ(2,6),AmpWaveZhhToVZpVZ(2,6),AmpVertexZhhToVZpVZ(2,6) 
Real(dp) :: AmpSqhhToVZpVZ(6),  AmpSqTreehhToVZpVZ(6) 
Real(dp) :: MRPhhToVZpVZp(6),MRGhhToVZpVZp(6), MRPZhhToVZpVZp(6),MRGZhhToVZpVZp(6) 
Real(dp) :: MVPhhToVZpVZp(6) 
Real(dp) :: RMsqTreehhToVZpVZp(6),RMsqWavehhToVZpVZp(6),RMsqVertexhhToVZpVZp(6) 
Complex(dp) :: AmpTreehhToVZpVZp(2,6),AmpWavehhToVZpVZp(2,6)=(0._dp,0._dp),AmpVertexhhToVZpVZp(2,6)& 
 & ,AmpVertexIRoshhToVZpVZp(2,6),AmpVertexIRdrhhToVZpVZp(2,6), AmpSumhhToVZpVZp(2,6), AmpSum2hhToVZpVZp(2,6) 
Complex(dp) :: AmpTreeZhhToVZpVZp(2,6),AmpWaveZhhToVZpVZp(2,6),AmpVertexZhhToVZpVZp(2,6) 
Real(dp) :: AmpSqhhToVZpVZp(6),  AmpSqTreehhToVZpVZp(6) 
Real(dp) :: MRPhhToAhVP(6,6),MRGhhToAhVP(6,6), MRPZhhToAhVP(6,6),MRGZhhToAhVP(6,6) 
Real(dp) :: MVPhhToAhVP(6,6) 
Real(dp) :: RMsqTreehhToAhVP(6,6),RMsqWavehhToAhVP(6,6),RMsqVertexhhToAhVP(6,6) 
Complex(dp) :: AmpTreehhToAhVP(2,6,6),AmpWavehhToAhVP(2,6,6)=(0._dp,0._dp),AmpVertexhhToAhVP(2,6,6)& 
 & ,AmpVertexIRoshhToAhVP(2,6,6),AmpVertexIRdrhhToAhVP(2,6,6), AmpSumhhToAhVP(2,6,6), AmpSum2hhToAhVP(2,6,6) 
Complex(dp) :: AmpTreeZhhToAhVP(2,6,6),AmpWaveZhhToAhVP(2,6,6),AmpVertexZhhToAhVP(2,6,6) 
Real(dp) :: AmpSqhhToAhVP(6,6),  AmpSqTreehhToAhVP(6,6) 
Real(dp) :: MRPhhToGluGlu(6),MRGhhToGluGlu(6), MRPZhhToGluGlu(6),MRGZhhToGluGlu(6) 
Real(dp) :: MVPhhToGluGlu(6) 
Real(dp) :: RMsqTreehhToGluGlu(6),RMsqWavehhToGluGlu(6),RMsqVertexhhToGluGlu(6) 
Complex(dp) :: AmpTreehhToGluGlu(2,6),AmpWavehhToGluGlu(2,6)=(0._dp,0._dp),AmpVertexhhToGluGlu(2,6)& 
 & ,AmpVertexIRoshhToGluGlu(2,6),AmpVertexIRdrhhToGluGlu(2,6), AmpSumhhToGluGlu(2,6), AmpSum2hhToGluGlu(2,6) 
Complex(dp) :: AmpTreeZhhToGluGlu(2,6),AmpWaveZhhToGluGlu(2,6),AmpVertexZhhToGluGlu(2,6) 
Real(dp) :: AmpSqhhToGluGlu(6),  AmpSqTreehhToGluGlu(6) 
Real(dp) :: MRPhhTohhVP(6,6),MRGhhTohhVP(6,6), MRPZhhTohhVP(6,6),MRGZhhTohhVP(6,6) 
Real(dp) :: MVPhhTohhVP(6,6) 
Real(dp) :: RMsqTreehhTohhVP(6,6),RMsqWavehhTohhVP(6,6),RMsqVertexhhTohhVP(6,6) 
Complex(dp) :: AmpTreehhTohhVP(2,6,6),AmpWavehhTohhVP(2,6,6)=(0._dp,0._dp),AmpVertexhhTohhVP(2,6,6)& 
 & ,AmpVertexIRoshhTohhVP(2,6,6),AmpVertexIRdrhhTohhVP(2,6,6), AmpSumhhTohhVP(2,6,6), AmpSum2hhTohhVP(2,6,6) 
Complex(dp) :: AmpTreeZhhTohhVP(2,6,6),AmpWaveZhhTohhVP(2,6,6),AmpVertexZhhTohhVP(2,6,6) 
Real(dp) :: AmpSqhhTohhVP(6,6),  AmpSqTreehhTohhVP(6,6) 
Real(dp) :: MRPhhTohhVZ(6,6),MRGhhTohhVZ(6,6), MRPZhhTohhVZ(6,6),MRGZhhTohhVZ(6,6) 
Real(dp) :: MVPhhTohhVZ(6,6) 
Real(dp) :: RMsqTreehhTohhVZ(6,6),RMsqWavehhTohhVZ(6,6),RMsqVertexhhTohhVZ(6,6) 
Complex(dp) :: AmpTreehhTohhVZ(2,6,6),AmpWavehhTohhVZ(2,6,6)=(0._dp,0._dp),AmpVertexhhTohhVZ(2,6,6)& 
 & ,AmpVertexIRoshhTohhVZ(2,6,6),AmpVertexIRdrhhTohhVZ(2,6,6), AmpSumhhTohhVZ(2,6,6), AmpSum2hhTohhVZ(2,6,6) 
Complex(dp) :: AmpTreeZhhTohhVZ(2,6,6),AmpWaveZhhTohhVZ(2,6,6),AmpVertexZhhTohhVZ(2,6,6) 
Real(dp) :: AmpSqhhTohhVZ(6,6),  AmpSqTreehhTohhVZ(6,6) 
Real(dp) :: MRPhhTohhVZp(6,6),MRGhhTohhVZp(6,6), MRPZhhTohhVZp(6,6),MRGZhhTohhVZp(6,6) 
Real(dp) :: MVPhhTohhVZp(6,6) 
Real(dp) :: RMsqTreehhTohhVZp(6,6),RMsqWavehhTohhVZp(6,6),RMsqVertexhhTohhVZp(6,6) 
Complex(dp) :: AmpTreehhTohhVZp(2,6,6),AmpWavehhTohhVZp(2,6,6)=(0._dp,0._dp),AmpVertexhhTohhVZp(2,6,6)& 
 & ,AmpVertexIRoshhTohhVZp(2,6,6),AmpVertexIRdrhhTohhVZp(2,6,6), AmpSumhhTohhVZp(2,6,6), AmpSum2hhTohhVZp(2,6,6) 
Complex(dp) :: AmpTreeZhhTohhVZp(2,6,6),AmpWaveZhhTohhVZp(2,6,6),AmpVertexZhhTohhVZp(2,6,6) 
Real(dp) :: AmpSqhhTohhVZp(6,6),  AmpSqTreehhTohhVZp(6,6) 
Real(dp) :: MRPhhToVGVG(6),MRGhhToVGVG(6), MRPZhhToVGVG(6),MRGZhhToVGVG(6) 
Real(dp) :: MVPhhToVGVG(6) 
Real(dp) :: RMsqTreehhToVGVG(6),RMsqWavehhToVGVG(6),RMsqVertexhhToVGVG(6) 
Complex(dp) :: AmpTreehhToVGVG(2,6),AmpWavehhToVGVG(2,6)=(0._dp,0._dp),AmpVertexhhToVGVG(2,6)& 
 & ,AmpVertexIRoshhToVGVG(2,6),AmpVertexIRdrhhToVGVG(2,6), AmpSumhhToVGVG(2,6), AmpSum2hhToVGVG(2,6) 
Complex(dp) :: AmpTreeZhhToVGVG(2,6),AmpWaveZhhToVGVG(2,6),AmpVertexZhhToVGVG(2,6) 
Real(dp) :: AmpSqhhToVGVG(6),  AmpSqTreehhToVGVG(6) 
Real(dp) :: MRPhhToVPVP(6),MRGhhToVPVP(6), MRPZhhToVPVP(6),MRGZhhToVPVP(6) 
Real(dp) :: MVPhhToVPVP(6) 
Real(dp) :: RMsqTreehhToVPVP(6),RMsqWavehhToVPVP(6),RMsqVertexhhToVPVP(6) 
Complex(dp) :: AmpTreehhToVPVP(2,6),AmpWavehhToVPVP(2,6)=(0._dp,0._dp),AmpVertexhhToVPVP(2,6)& 
 & ,AmpVertexIRoshhToVPVP(2,6),AmpVertexIRdrhhToVPVP(2,6), AmpSumhhToVPVP(2,6), AmpSum2hhToVPVP(2,6) 
Complex(dp) :: AmpTreeZhhToVPVP(2,6),AmpWaveZhhToVPVP(2,6),AmpVertexZhhToVPVP(2,6) 
Real(dp) :: AmpSqhhToVPVP(6),  AmpSqTreehhToVPVP(6) 
Real(dp) :: MRPhhToVPVZ(6),MRGhhToVPVZ(6), MRPZhhToVPVZ(6),MRGZhhToVPVZ(6) 
Real(dp) :: MVPhhToVPVZ(6) 
Real(dp) :: RMsqTreehhToVPVZ(6),RMsqWavehhToVPVZ(6),RMsqVertexhhToVPVZ(6) 
Complex(dp) :: AmpTreehhToVPVZ(2,6),AmpWavehhToVPVZ(2,6)=(0._dp,0._dp),AmpVertexhhToVPVZ(2,6)& 
 & ,AmpVertexIRoshhToVPVZ(2,6),AmpVertexIRdrhhToVPVZ(2,6), AmpSumhhToVPVZ(2,6), AmpSum2hhToVPVZ(2,6) 
Complex(dp) :: AmpTreeZhhToVPVZ(2,6),AmpWaveZhhToVPVZ(2,6),AmpVertexZhhToVPVZ(2,6) 
Real(dp) :: AmpSqhhToVPVZ(6),  AmpSqTreehhToVPVZ(6) 
Real(dp) :: MRPhhToVPVZp(6),MRGhhToVPVZp(6), MRPZhhToVPVZp(6),MRGZhhToVPVZp(6) 
Real(dp) :: MVPhhToVPVZp(6) 
Real(dp) :: RMsqTreehhToVPVZp(6),RMsqWavehhToVPVZp(6),RMsqVertexhhToVPVZp(6) 
Complex(dp) :: AmpTreehhToVPVZp(2,6),AmpWavehhToVPVZp(2,6)=(0._dp,0._dp),AmpVertexhhToVPVZp(2,6)& 
 & ,AmpVertexIRoshhToVPVZp(2,6),AmpVertexIRdrhhToVPVZp(2,6), AmpSumhhToVPVZp(2,6), AmpSum2hhToVPVZp(2,6) 
Complex(dp) :: AmpTreeZhhToVPVZp(2,6),AmpWaveZhhToVPVZp(2,6),AmpVertexZhhToVPVZp(2,6) 
Real(dp) :: AmpSqhhToVPVZp(6),  AmpSqTreehhToVPVZp(6) 
Write(*,*) "Calculating one-loop decays of hh " 
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
isave = 5

If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Ah Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_hhToAhAh(cplAhAhhh,MAh,Mhh,MAh2,Mhh2,AmpTreehhToAhAh)

  Else 
Call Amplitude_Tree_sec_UMSSM_hhToAhAh(ZcplAhAhhh,MAh,Mhh,MAh2,Mhh2,AmpTreehhToAhAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_hhToAhAh(MLambda,em,gs,cplAhAhhh,MAhOS,MhhOS,               & 
& MRPhhToAhAh,MRGhhToAhAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_hhToAhAh(MLambda,em,gs,ZcplAhAhhh,MAhOS,MhhOS,              & 
& MRPhhToAhAh,MRGhhToAhAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_hhToAhAh(MLambda,em,gs,cplAhAhhh,MAh,Mhh,MRPhhToAhAh,       & 
& MRGhhToAhAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_hhToAhAh(MLambda,em,gs,ZcplAhAhhh,MAh,Mhh,MRPhhToAhAh,      & 
& MRGhhToAhAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhToAhAh(cplAhAhhh,ctcplAhAhhh,MAh,MAh2,Mhh,            & 
& Mhh2,ZfAh,Zfhh,AmpWavehhToAhAh)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhToAhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,cplcFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplAhAhAhAh1,               & 
& cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,              & 
& cplAhAhSvcSv1,cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhAhVZpVZp1,               & 
& cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplAhhhSecSe1,cplAhhhSucSuaa,cplAhhhSvcSv1,             & 
& AmpVertexhhToAhAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToAhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,cplcFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplAhAhAhAh1,               & 
& cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,              & 
& cplAhAhSvcSv1,cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhAhVZpVZp1,               & 
& cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplAhhhSecSe1,cplAhhhSucSuaa,cplAhhhSvcSv1,             & 
& AmpVertexIRdrhhToAhAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToAhAh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,ZcplAhAhhh,cplcChaChaAhL,               & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,cplcFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplAhAhAhAh1,               & 
& cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,              & 
& cplAhAhSvcSv1,cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhAhVZpVZp1,               & 
& cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplAhhhSecSe1,cplAhhhSucSuaa,cplAhhhSvcSv1,             & 
& AmpVertexIRoshhToAhAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToAhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,ZcplAhAhhh,cplcChaChaAhL,    & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,cplcFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplAhAhAhAh1,               & 
& cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,              & 
& cplAhAhSvcSv1,cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhAhVZpVZp1,               & 
& cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplAhhhSecSe1,cplAhhhSucSuaa,cplAhhhSvcSv1,             & 
& AmpVertexIRoshhToAhAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToAhAh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,  & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,           & 
& cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,              & 
& cplcFuFuhhR,cplcFvFvhhL,cplcFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplhhhhhh,             & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplAhAhAhAh1,cplAhAhhhhh1,               & 
& cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvcSv1,             & 
& cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhAhVZpVZp1,cplAhhhHpmcHpm1,             & 
& cplAhhhSdcSdaa,cplAhhhSecSe1,cplAhhhSucSuaa,cplAhhhSvcSv1,AmpVertexIRoshhToAhAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToAhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,cplcFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplAhAhAhAh1,               & 
& cplAhAhhhhh1,cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,              & 
& cplAhAhSvcSv1,cplAhAhcVWmVWm1,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhAhVZpVZp1,               & 
& cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplAhhhSecSe1,cplAhhhSucSuaa,cplAhhhSvcSv1,             & 
& AmpVertexIRoshhToAhAh)

 End if 
 End if 
AmpVertexhhToAhAh = AmpVertexhhToAhAh -  AmpVertexIRdrhhToAhAh! +  AmpVertexIRoshhToAhAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToAhAh=0._dp 
AmpVertexZhhToAhAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhToAhAh(gt2,:,:) = AmpWaveZhhToAhAh(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhToAhAh(gt1,:,:) 
AmpVertexZhhToAhAh(gt2,:,:)= AmpVertexZhhToAhAh(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhToAhAh(gt1,:,:) 
 End Do 
End Do 
AmpWavehhToAhAh=AmpWaveZhhToAhAh 
AmpVertexhhToAhAh= AmpVertexZhhToAhAh
! Final State 1 
AmpWaveZhhToAhAh=0._dp 
AmpVertexZhhToAhAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhToAhAh(:,gt2,:) = AmpWaveZhhToAhAh(:,gt2,:)+ZRUZA(gt2,gt1)*AmpWavehhToAhAh(:,gt1,:) 
AmpVertexZhhToAhAh(:,gt2,:)= AmpVertexZhhToAhAh(:,gt2,:)+ZRUZA(gt2,gt1)*AmpVertexhhToAhAh(:,gt1,:) 
 End Do 
End Do 
AmpWavehhToAhAh=AmpWaveZhhToAhAh 
AmpVertexhhToAhAh= AmpVertexZhhToAhAh
! Final State 2 
AmpWaveZhhToAhAh=0._dp 
AmpVertexZhhToAhAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhToAhAh(:,:,gt2) = AmpWaveZhhToAhAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWavehhToAhAh(:,:,gt1) 
AmpVertexZhhToAhAh(:,:,gt2)= AmpVertexZhhToAhAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexhhToAhAh(:,:,gt1) 
 End Do 
End Do 
AmpWavehhToAhAh=AmpWaveZhhToAhAh 
AmpVertexhhToAhAh= AmpVertexZhhToAhAh
End if
If (ShiftIRdiv) Then 
AmpVertexhhToAhAh = AmpVertexhhToAhAh  +  AmpVertexIRoshhToAhAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Ah Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToAhAh = AmpTreehhToAhAh 
 AmpSum2hhToAhAh = AmpTreehhToAhAh + 2._dp*AmpWavehhToAhAh + 2._dp*AmpVertexhhToAhAh  
Else 
 AmpSumhhToAhAh = AmpTreehhToAhAh + AmpWavehhToAhAh + AmpVertexhhToAhAh
 AmpSum2hhToAhAh = AmpTreehhToAhAh + AmpWavehhToAhAh + AmpVertexhhToAhAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToAhAh = AmpTreehhToAhAh
 AmpSum2hhToAhAh = AmpTreehhToAhAh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=3,6
    Do gt3=gt2,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MAhOS(gt2))+Abs(MAhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MAh(gt2))+Abs(MAh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhToAhAh = AmpTreehhToAhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MAh(gt2),MAh(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToAhAh(gt1, gt2, gt3) 
  AmpSum2hhToAhAh = 2._dp*AmpWavehhToAhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MAh(gt2),MAh(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToAhAh(gt1, gt2, gt3) 
  AmpSum2hhToAhAh = 2._dp*AmpVertexhhToAhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MAh(gt2),MAh(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToAhAh(gt1, gt2, gt3) 
  AmpSum2hhToAhAh = AmpTreehhToAhAh + 2._dp*AmpWavehhToAhAh + 2._dp*AmpVertexhhToAhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MAh(gt2),MAh(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToAhAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToAhAh = AmpTreehhToAhAh
  Call SquareAmp_StoSS(MhhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
  AmpSqTreehhToAhAh(gt1, gt2, gt3) = AmpSqhhToAhAh(gt1, gt2, gt3)  
  AmpSum2hhToAhAh = + 2._dp*AmpWavehhToAhAh + 2._dp*AmpVertexhhToAhAh
  Call SquareAmp_StoSS(MhhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
  AmpSqhhToAhAh(gt1, gt2, gt3) = AmpSqhhToAhAh(gt1, gt2, gt3) + AmpSqTreehhToAhAh(gt1, gt2, gt3)  
Else  
  AmpSum2hhToAhAh = AmpTreehhToAhAh
  Call SquareAmp_StoSS(Mhh(gt1),MAh(gt2),MAh(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
  AmpSqTreehhToAhAh(gt1, gt2, gt3) = AmpSqhhToAhAh(gt1, gt2, gt3)  
  AmpSum2hhToAhAh = + 2._dp*AmpWavehhToAhAh + 2._dp*AmpVertexhhToAhAh
  Call SquareAmp_StoSS(Mhh(gt1),MAh(gt2),MAh(gt3),AmpSumhhToAhAh(gt1, gt2, gt3),AmpSum2hhToAhAh(gt1, gt2, gt3),AmpSqhhToAhAh(gt1, gt2, gt3)) 
  AmpSqhhToAhAh(gt1, gt2, gt3) = AmpSqhhToAhAh(gt1, gt2, gt3) + AmpSqTreehhToAhAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhToAhAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqhhToAhAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS(gt1),MAhOS(gt2),MAhOS(gt3),helfactor*AmpSqhhToAhAh(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh(gt1),MAh(gt2),MAh(gt3),helfactor*AmpSqhhToAhAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhToAhAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToAhAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToAhAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToAhAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToAhAh(gt1, gt2, gt3) + MRGhhToAhAh(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToAhAh(gt1, gt2, gt3) + MRGhhToAhAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! hh Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_hhTohhAh(cplAhhhhh,MAh,Mhh,MAh2,Mhh2,AmpTreehhTohhAh)

  Else 
Call Amplitude_Tree_sec_UMSSM_hhTohhAh(ZcplAhhhhh,MAh,Mhh,MAh2,Mhh2,AmpTreehhTohhAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_hhTohhAh(MLambda,em,gs,cplAhhhhh,MAhOS,MhhOS,               & 
& MRPhhTohhAh,MRGhhTohhAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTohhAh(MLambda,em,gs,ZcplAhhhhh,MAhOS,MhhOS,              & 
& MRPhhTohhAh,MRGhhTohhAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_hhTohhAh(MLambda,em,gs,cplAhhhhh,MAh,Mhh,MRPhhTohhAh,       & 
& MRGhhTohhAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTohhAh(MLambda,em,gs,ZcplAhhhhh,MAh,Mhh,MRPhhTohhAh,      & 
& MRGhhTohhAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhTohhAh(cplAhhhhh,ctcplAhhhhh,MAh,MAh2,Mhh,            & 
& Mhh2,ZfAh,Zfhh,AmpWavehhTohhAh)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhTohhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,cplcFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplAhAhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplAhhhSecSe1,   & 
& cplAhhhSucSuaa,cplAhhhSvcSv1,cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,              & 
& cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvcSv1,AmpVertexhhTohhAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTohhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,cplcFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplAhAhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplAhhhSecSe1,   & 
& cplAhhhSucSuaa,cplAhhhSvcSv1,cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,              & 
& cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvcSv1,AmpVertexIRdrhhTohhAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTohhAh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,  & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& ZcplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,       & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,           & 
& cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,              & 
& cplcFuFuhhR,cplcFvFvhhL,cplcFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplhhhhhh,             & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplAhAhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplAhhhSecSe1,cplAhhhSucSuaa, & 
& cplAhhhSvcSv1,cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,               & 
& cplhhhhSucSuaa,cplhhhhSvcSv1,AmpVertexIRoshhTohhAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTohhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,ZcplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,              & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,cplcFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplAhAhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplAhhhSecSe1,   & 
& cplAhhhSucSuaa,cplAhhhSvcSv1,cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,              & 
& cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvcSv1,AmpVertexIRoshhTohhAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTohhAh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,  & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,           & 
& cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,              & 
& cplcFuFuhhR,cplcFvFvhhL,cplcFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplhhhhhh,             & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplAhAhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplAhhhSecSe1,cplAhhhSucSuaa, & 
& cplAhhhSvcSv1,cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,               & 
& cplhhhhSucSuaa,cplhhhhSvcSv1,AmpVertexIRoshhTohhAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTohhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,cplcFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplAhAhhhhh1,cplAhhhHpmcHpm1,cplAhhhSdcSdaa,cplAhhhSecSe1,   & 
& cplAhhhSucSuaa,cplAhhhSvcSv1,cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,              & 
& cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvcSv1,AmpVertexIRoshhTohhAh)

 End if 
 End if 
AmpVertexhhTohhAh = AmpVertexhhTohhAh -  AmpVertexIRdrhhTohhAh! +  AmpVertexIRoshhTohhAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTohhAh=0._dp 
AmpVertexZhhTohhAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTohhAh(gt2,:,:) = AmpWaveZhhTohhAh(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTohhAh(gt1,:,:) 
AmpVertexZhhTohhAh(gt2,:,:)= AmpVertexZhhTohhAh(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTohhAh(gt1,:,:) 
 End Do 
End Do 
AmpWavehhTohhAh=AmpWaveZhhTohhAh 
AmpVertexhhTohhAh= AmpVertexZhhTohhAh
! Final State 1 
AmpWaveZhhTohhAh=0._dp 
AmpVertexZhhTohhAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTohhAh(:,gt2,:) = AmpWaveZhhTohhAh(:,gt2,:)+ZRUZH(gt2,gt1)*AmpWavehhTohhAh(:,gt1,:) 
AmpVertexZhhTohhAh(:,gt2,:)= AmpVertexZhhTohhAh(:,gt2,:)+ZRUZH(gt2,gt1)*AmpVertexhhTohhAh(:,gt1,:) 
 End Do 
End Do 
AmpWavehhTohhAh=AmpWaveZhhTohhAh 
AmpVertexhhTohhAh= AmpVertexZhhTohhAh
! Final State 2 
AmpWaveZhhTohhAh=0._dp 
AmpVertexZhhTohhAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTohhAh(:,:,gt2) = AmpWaveZhhTohhAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWavehhTohhAh(:,:,gt1) 
AmpVertexZhhTohhAh(:,:,gt2)= AmpVertexZhhTohhAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexhhTohhAh(:,:,gt1) 
 End Do 
End Do 
AmpWavehhTohhAh=AmpWaveZhhTohhAh 
AmpVertexhhTohhAh= AmpVertexZhhTohhAh
End if
If (ShiftIRdiv) Then 
AmpVertexhhTohhAh = AmpVertexhhTohhAh  +  AmpVertexIRoshhTohhAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTohhAh = AmpTreehhTohhAh 
 AmpSum2hhTohhAh = AmpTreehhTohhAh + 2._dp*AmpWavehhTohhAh + 2._dp*AmpVertexhhTohhAh  
Else 
 AmpSumhhTohhAh = AmpTreehhTohhAh + AmpWavehhTohhAh + AmpVertexhhTohhAh
 AmpSum2hhTohhAh = AmpTreehhTohhAh + AmpWavehhTohhAh + AmpVertexhhTohhAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhAh = AmpTreehhTohhAh
 AmpSum2hhTohhAh = AmpTreehhTohhAh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=3,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(MAhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(Mhh(gt2))+Abs(MAh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTohhAh = AmpTreehhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),MAh(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTohhAh(gt1, gt2, gt3) 
  AmpSum2hhTohhAh = 2._dp*AmpWavehhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),MAh(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTohhAh(gt1, gt2, gt3) 
  AmpSum2hhTohhAh = 2._dp*AmpVertexhhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),MAh(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTohhAh(gt1, gt2, gt3) 
  AmpSum2hhTohhAh = AmpTreehhTohhAh + 2._dp*AmpWavehhTohhAh + 2._dp*AmpVertexhhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),MAh(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTohhAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTohhAh = AmpTreehhTohhAh
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
  AmpSqTreehhTohhAh(gt1, gt2, gt3) = AmpSqhhTohhAh(gt1, gt2, gt3)  
  AmpSum2hhTohhAh = + 2._dp*AmpWavehhTohhAh + 2._dp*AmpVertexhhTohhAh
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
  AmpSqhhTohhAh(gt1, gt2, gt3) = AmpSqhhTohhAh(gt1, gt2, gt3) + AmpSqTreehhTohhAh(gt1, gt2, gt3)  
Else  
  AmpSum2hhTohhAh = AmpTreehhTohhAh
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),MAh(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
  AmpSqTreehhTohhAh(gt1, gt2, gt3) = AmpSqhhTohhAh(gt1, gt2, gt3)  
  AmpSum2hhTohhAh = + 2._dp*AmpWavehhTohhAh + 2._dp*AmpVertexhhTohhAh
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),MAh(gt3),AmpSumhhTohhAh(gt1, gt2, gt3),AmpSum2hhTohhAh(gt1, gt2, gt3),AmpSqhhTohhAh(gt1, gt2, gt3)) 
  AmpSqhhTohhAh(gt1, gt2, gt3) = AmpSqhhTohhAh(gt1, gt2, gt3) + AmpSqTreehhTohhAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTohhAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTohhAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MhhOS(gt2),MAhOS(gt3),helfactor*AmpSqhhTohhAh(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),Mhh(gt2),MAh(gt3),helfactor*AmpSqhhTohhAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTohhAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTohhAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTohhAh(gt1, gt2, gt3) + MRGhhTohhAh(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTohhAh(gt1, gt2, gt3) + MRGhhTohhAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Ah VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_hhToAhVZ(cplAhhhVZ,MAh,Mhh,MVZ,MAh2,Mhh2,               & 
& MVZ2,AmpTreehhToAhVZ)

  Else 
Call Amplitude_Tree_sec_UMSSM_hhToAhVZ(ZcplAhhhVZ,MAh,Mhh,MVZ,MAh2,Mhh2,              & 
& MVZ2,AmpTreehhToAhVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_hhToAhVZ(MLambda,em,gs,cplAhhhVZ,MAhOS,MhhOS,               & 
& MVZOS,MRPhhToAhVZ,MRGhhToAhVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_hhToAhVZ(MLambda,em,gs,ZcplAhhhVZ,MAhOS,MhhOS,              & 
& MVZOS,MRPhhToAhVZ,MRGhhToAhVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_hhToAhVZ(MLambda,em,gs,cplAhhhVZ,MAh,Mhh,MVZ,               & 
& MRPhhToAhVZ,MRGhhToAhVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_hhToAhVZ(MLambda,em,gs,ZcplAhhhVZ,MAh,Mhh,MVZ,              & 
& MRPhhToAhVZ,MRGhhToAhVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhToAhVZ(cplAhhhVZ,cplAhhhVZp,ctcplAhhhVZ,              & 
& ctcplAhhhVZp,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,ZfAh,Zfhh,ZfVZ,ZfVZpVZ,AmpWavehhToAhVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhToAhVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,  & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,       & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,             & 
& cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,       & 
& cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,     & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,  & 
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexhhToAhVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToAhVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,  & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,       & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,             & 
& cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,       & 
& cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,     & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,  & 
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexIRdrhhToAhVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToAhVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,  & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,ZcplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,       & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,          & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,         & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvhhL,               & 
& cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,              & 
& cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,      & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,    & 
& cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,               & 
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexIRoshhToAhVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToAhVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,ZcplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,              & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,  & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,       & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,             & 
& cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,       & 
& cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,     & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,  & 
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexIRoshhToAhVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToAhVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,  & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,          & 
& cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,         & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvhhL,               & 
& cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,              & 
& cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,      & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,    & 
& cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,               & 
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexIRoshhToAhVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToAhVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,  & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,       & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,             & 
& cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,       & 
& cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,     & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhAhVZVZp1,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,  & 
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexIRoshhToAhVZ)

 End if 
 End if 
AmpVertexhhToAhVZ = AmpVertexhhToAhVZ -  AmpVertexIRdrhhToAhVZ! +  AmpVertexIRoshhToAhVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToAhVZ=0._dp 
AmpVertexZhhToAhVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhToAhVZ(:,gt2,:) = AmpWaveZhhToAhVZ(:,gt2,:)+ZRUZH(gt2,gt1)*AmpWavehhToAhVZ(:,gt1,:) 
AmpVertexZhhToAhVZ(:,gt2,:)= AmpVertexZhhToAhVZ(:,gt2,:) + ZRUZH(gt2,gt1)*AmpVertexhhToAhVZ(:,gt1,:) 
 End Do 
End Do 
AmpWavehhToAhVZ=AmpWaveZhhToAhVZ 
AmpVertexhhToAhVZ= AmpVertexZhhToAhVZ
! Final State 1 
AmpWaveZhhToAhVZ=0._dp 
AmpVertexZhhToAhVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhToAhVZ(:,:,gt2) = AmpWaveZhhToAhVZ(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWavehhToAhVZ(:,:,gt1) 
AmpVertexZhhToAhVZ(:,:,gt2)= AmpVertexZhhToAhVZ(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexhhToAhVZ(:,:,gt1) 
 End Do 
End Do 
AmpWavehhToAhVZ=AmpWaveZhhToAhVZ 
AmpVertexhhToAhVZ= AmpVertexZhhToAhVZ
End if
If (ShiftIRdiv) Then 
AmpVertexhhToAhVZ = AmpVertexhhToAhVZ  +  AmpVertexIRoshhToAhVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Ah VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToAhVZ = AmpTreehhToAhVZ 
 AmpSum2hhToAhVZ = AmpTreehhToAhVZ + 2._dp*AmpWavehhToAhVZ + 2._dp*AmpVertexhhToAhVZ  
Else 
 AmpSumhhToAhVZ = AmpTreehhToAhVZ + AmpWavehhToAhVZ + AmpVertexhhToAhVZ
 AmpSum2hhToAhVZ = AmpTreehhToAhVZ + AmpWavehhToAhVZ + AmpVertexhhToAhVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToAhVZ = AmpTreehhToAhVZ
 AmpSum2hhToAhVZ = AmpTreehhToAhVZ 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=3,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MAhOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MAh(gt2))+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2hhToAhVZ = AmpTreehhToAhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZOS,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZ,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToAhVZ(gt1, gt2) 
  AmpSum2hhToAhVZ = 2._dp*AmpWavehhToAhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZOS,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZ,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToAhVZ(gt1, gt2) 
  AmpSum2hhToAhVZ = 2._dp*AmpVertexhhToAhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZOS,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZ,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToAhVZ(gt1, gt2) 
  AmpSum2hhToAhVZ = AmpTreehhToAhVZ + 2._dp*AmpWavehhToAhVZ + 2._dp*AmpVertexhhToAhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZOS,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZ,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToAhVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToAhVZ = AmpTreehhToAhVZ
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZOS,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
  AmpSqTreehhToAhVZ(gt1, gt2) = AmpSqhhToAhVZ(gt1, gt2)  
  AmpSum2hhToAhVZ = + 2._dp*AmpWavehhToAhVZ + 2._dp*AmpVertexhhToAhVZ
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZOS,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
  AmpSqhhToAhVZ(gt1, gt2) = AmpSqhhToAhVZ(gt1, gt2) + AmpSqTreehhToAhVZ(gt1, gt2)  
Else  
  AmpSum2hhToAhVZ = AmpTreehhToAhVZ
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZ,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
  AmpSqTreehhToAhVZ(gt1, gt2) = AmpSqhhToAhVZ(gt1, gt2)  
  AmpSum2hhToAhVZ = + 2._dp*AmpWavehhToAhVZ + 2._dp*AmpVertexhhToAhVZ
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZ,AmpSumhhToAhVZ(:,gt1, gt2),AmpSum2hhToAhVZ(:,gt1, gt2),AmpSqhhToAhVZ(gt1, gt2)) 
  AmpSqhhToAhVZ(gt1, gt2) = AmpSqhhToAhVZ(gt1, gt2) + AmpSqTreehhToAhVZ(gt1, gt2)  
End if  
Else  
  AmpSqhhToAhVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToAhVZ(gt1, gt2).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MAhOS(gt2),MVZOS,helfactor*AmpSqhhToAhVZ(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MAh(gt2),MVZ,helfactor*AmpSqhhToAhVZ(gt1, gt2))
End if 
If ((Abs(MRPhhToAhVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhToAhVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToAhVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhToAhVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPhhToAhVZ(gt1, gt2) + MRGhhToAhVZ(gt1, gt2)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPhhToAhVZ(gt1, gt2) + MRGhhToAhVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Ah VZp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_hhToAhVZp(cplAhhhVZp,MAh,Mhh,MVZp,MAh2,Mhh2,            & 
& MVZp2,AmpTreehhToAhVZp)

  Else 
Call Amplitude_Tree_sec_UMSSM_hhToAhVZp(ZcplAhhhVZp,MAh,Mhh,MVZp,MAh2,Mhh2,           & 
& MVZp2,AmpTreehhToAhVZp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_hhToAhVZp(MLambda,em,gs,cplAhhhVZp,MAhOS,MhhOS,             & 
& MVZpOS,MRPhhToAhVZp,MRGhhToAhVZp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_hhToAhVZp(MLambda,em,gs,ZcplAhhhVZp,MAhOS,MhhOS,            & 
& MVZpOS,MRPhhToAhVZp,MRGhhToAhVZp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_hhToAhVZp(MLambda,em,gs,cplAhhhVZp,MAh,Mhh,MVZp,            & 
& MRPhhToAhVZp,MRGhhToAhVZp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_hhToAhVZp(MLambda,em,gs,ZcplAhhhVZp,MAh,Mhh,MVZp,           & 
& MRPhhToAhVZp,MRGhhToAhVZp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhToAhVZp(cplAhhhVZ,cplAhhhVZp,ctcplAhhhVZ,             & 
& ctcplAhhhVZp,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,ZfAh,Zfhh,ZfVZp,ZfVZVZp,            & 
& AmpWavehhToAhVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhToAhVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,  & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZpL,cplcFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,          & 
& cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,         & 
& cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,       & 
& cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,           & 
& cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZVZp1,cplAhAhVZpVZp1,cplAhHpmcVWmVZp1, & 
& cplAhcHpmVWmVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,       & 
& AmpVertexhhToAhVZp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToAhVZp(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,              & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,   & 
& cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,   & 
& cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,           & 
& cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,            & 
& cplcFuFuVZpR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZpL,cplcFvFvVZpR,cplcgWmgWmhh,           & 
& cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,      & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,            & 
& cplSucSuVZp,cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZVZp1,cplAhAhVZpVZp1,      & 
& cplAhHpmcVWmVZp1,cplAhcHpmVWmVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,       & 
& cplhhcHpmVWmVZp1,AmpVertexIRdrhhToAhVZp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToAhVZp(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,            & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,         & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,ZcplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,              & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,  & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZpL,cplcFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,          & 
& cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,         & 
& cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,       & 
& cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,           & 
& cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZVZp1,cplAhAhVZpVZp1,cplAhHpmcVWmVZp1, & 
& cplAhcHpmVWmVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,       & 
& AmpVertexIRoshhToAhVZp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToAhVZp(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,              & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,ZcplAhhhVZp,cplAhHpmcHpm,              & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,   & 
& cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,   & 
& cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,           & 
& cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,            & 
& cplcFuFuVZpR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZpL,cplcFvFvVZpR,cplcgWmgWmhh,           & 
& cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,      & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,            & 
& cplSucSuVZp,cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZVZp1,cplAhAhVZpVZp1,      & 
& cplAhHpmcVWmVZp1,cplAhcHpmVWmVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,       & 
& cplhhcHpmVWmVZp1,AmpVertexIRoshhToAhVZp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToAhVZp(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,            & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,         & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,  & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZpL,cplcFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,          & 
& cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,         & 
& cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,       & 
& cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,           & 
& cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZVZp1,cplAhAhVZpVZp1,cplAhHpmcVWmVZp1, & 
& cplAhcHpmVWmVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,       & 
& AmpVertexIRoshhToAhVZp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToAhVZp(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,              & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChahhL,   & 
& cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZpL,   & 
& cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,           & 
& cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZpL,            & 
& cplcFuFuVZpR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZpL,cplcFvFvVZpR,cplcgWmgWmhh,           & 
& cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,      & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,            & 
& cplSucSuVZp,cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZVZp1,cplAhAhVZpVZp1,      & 
& cplAhHpmcVWmVZp1,cplAhcHpmVWmVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,       & 
& cplhhcHpmVWmVZp1,AmpVertexIRoshhToAhVZp)

 End if 
 End if 
AmpVertexhhToAhVZp = AmpVertexhhToAhVZp -  AmpVertexIRdrhhToAhVZp! +  AmpVertexIRoshhToAhVZp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToAhVZp=0._dp 
AmpVertexZhhToAhVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhToAhVZp(:,gt2,:) = AmpWaveZhhToAhVZp(:,gt2,:)+ZRUZH(gt2,gt1)*AmpWavehhToAhVZp(:,gt1,:) 
AmpVertexZhhToAhVZp(:,gt2,:)= AmpVertexZhhToAhVZp(:,gt2,:) + ZRUZH(gt2,gt1)*AmpVertexhhToAhVZp(:,gt1,:) 
 End Do 
End Do 
AmpWavehhToAhVZp=AmpWaveZhhToAhVZp 
AmpVertexhhToAhVZp= AmpVertexZhhToAhVZp
! Final State 1 
AmpWaveZhhToAhVZp=0._dp 
AmpVertexZhhToAhVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhToAhVZp(:,:,gt2) = AmpWaveZhhToAhVZp(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWavehhToAhVZp(:,:,gt1) 
AmpVertexZhhToAhVZp(:,:,gt2)= AmpVertexZhhToAhVZp(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexhhToAhVZp(:,:,gt1) 
 End Do 
End Do 
AmpWavehhToAhVZp=AmpWaveZhhToAhVZp 
AmpVertexhhToAhVZp= AmpVertexZhhToAhVZp
End if
If (ShiftIRdiv) Then 
AmpVertexhhToAhVZp = AmpVertexhhToAhVZp  +  AmpVertexIRoshhToAhVZp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Ah VZp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToAhVZp = AmpTreehhToAhVZp 
 AmpSum2hhToAhVZp = AmpTreehhToAhVZp + 2._dp*AmpWavehhToAhVZp + 2._dp*AmpVertexhhToAhVZp  
Else 
 AmpSumhhToAhVZp = AmpTreehhToAhVZp + AmpWavehhToAhVZp + AmpVertexhhToAhVZp
 AmpSum2hhToAhVZp = AmpTreehhToAhVZp + AmpWavehhToAhVZp + AmpVertexhhToAhVZp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToAhVZp = AmpTreehhToAhVZp
 AmpSum2hhToAhVZp = AmpTreehhToAhVZp 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=3,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MAhOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MAh(gt2))+Abs(MVZp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2hhToAhVZp = AmpTreehhToAhVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZpOS,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZp,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToAhVZp(gt1, gt2) 
  AmpSum2hhToAhVZp = 2._dp*AmpWavehhToAhVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZpOS,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZp,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToAhVZp(gt1, gt2) 
  AmpSum2hhToAhVZp = 2._dp*AmpVertexhhToAhVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZpOS,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZp,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToAhVZp(gt1, gt2) 
  AmpSum2hhToAhVZp = AmpTreehhToAhVZp + 2._dp*AmpWavehhToAhVZp + 2._dp*AmpVertexhhToAhVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZpOS,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZp,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToAhVZp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToAhVZp = AmpTreehhToAhVZp
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZpOS,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
  AmpSqTreehhToAhVZp(gt1, gt2) = AmpSqhhToAhVZp(gt1, gt2)  
  AmpSum2hhToAhVZp = + 2._dp*AmpWavehhToAhVZp + 2._dp*AmpVertexhhToAhVZp
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),MVZpOS,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
  AmpSqhhToAhVZp(gt1, gt2) = AmpSqhhToAhVZp(gt1, gt2) + AmpSqTreehhToAhVZp(gt1, gt2)  
Else  
  AmpSum2hhToAhVZp = AmpTreehhToAhVZp
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZp,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
  AmpSqTreehhToAhVZp(gt1, gt2) = AmpSqhhToAhVZp(gt1, gt2)  
  AmpSum2hhToAhVZp = + 2._dp*AmpWavehhToAhVZp + 2._dp*AmpVertexhhToAhVZp
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVZp,AmpSumhhToAhVZp(:,gt1, gt2),AmpSum2hhToAhVZp(:,gt1, gt2),AmpSqhhToAhVZp(gt1, gt2)) 
  AmpSqhhToAhVZp(gt1, gt2) = AmpSqhhToAhVZp(gt1, gt2) + AmpSqTreehhToAhVZp(gt1, gt2)  
End if  
Else  
  AmpSqhhToAhVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToAhVZp(gt1, gt2).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MAhOS(gt2),MVZpOS,helfactor*AmpSqhhToAhVZp(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MAh(gt2),MVZp,helfactor*AmpSqhhToAhVZp(gt1, gt2))
End if 
If ((Abs(MRPhhToAhVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhToAhVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToAhVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhToAhVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPhhToAhVZp(gt1, gt2) + MRGhhToAhVZp(gt1, gt2)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPhhToAhVZp(gt1, gt2) + MRGhhToAhVZp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Cha) Cha
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_hhTocChaCha(cplcChaChahhL,cplcChaChahhR,MCha,           & 
& Mhh,MCha2,Mhh2,AmpTreehhTocChaCha)

  Else 
Call Amplitude_Tree_sec_UMSSM_hhTocChaCha(ZcplcChaChahhL,ZcplcChaChahhR,              & 
& MCha,Mhh,MCha2,Mhh2,AmpTreehhTocChaCha)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocChaCha(MLambda,em,gs,cplcChaChahhL,cplcChaChahhR,      & 
& MChaOS,MhhOS,MRPhhTocChaCha,MRGhhTocChaCha)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocChaCha(MLambda,em,gs,ZcplcChaChahhL,ZcplcChaChahhR,    & 
& MChaOS,MhhOS,MRPhhTocChaCha,MRGhhTocChaCha)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_hhTocChaCha(MLambda,em,gs,cplcChaChahhL,cplcChaChahhR,      & 
& MCha,Mhh,MRPhhTocChaCha,MRGhhTocChaCha)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocChaCha(MLambda,em,gs,ZcplcChaChahhL,ZcplcChaChahhR,    & 
& MCha,Mhh,MRPhhTocChaCha,MRGhhTocChaCha)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhTocChaCha(cplcChaChahhL,cplcChaChahhR,ctcplcChaChahhL,& 
& ctcplcChaChahhR,MCha,MCha2,Mhh,Mhh2,Zfhh,ZfLm,ZfLp,AmpWavehhTocChaCha)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhTocChaCha(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
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
& cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,AmpVertexhhTocChaCha)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocChaCha(MAh,MCha,MChi,MFd,MFe,MFu,             & 
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
& cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,AmpVertexIRdrhhTocChaCha)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocChaCha(MAhOS,MChaOS,MChiOS,MFdOS,             & 
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
& cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,AmpVertexIRoshhTocChaCha)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocChaCha(MAh,MCha,MChi,MFd,MFe,MFu,             & 
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
& cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,AmpVertexIRoshhTocChaCha)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocChaCha(MAhOS,MChaOS,MChiOS,MFdOS,             & 
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
& cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,AmpVertexIRoshhTocChaCha)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocChaCha(MAh,MCha,MChi,MFd,MFe,MFu,             & 
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
& cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,AmpVertexIRoshhTocChaCha)

 End if 
 End if 
AmpVertexhhTocChaCha = AmpVertexhhTocChaCha -  AmpVertexIRdrhhTocChaCha! +  AmpVertexIRoshhTocChaCha ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocChaCha=0._dp 
AmpVertexZhhTocChaCha=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocChaCha(:,gt2,:,:) = AmpWaveZhhTocChaCha(:,gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocChaCha(:,gt1,:,:) 
AmpVertexZhhTocChaCha(:,gt2,:,:)= AmpVertexZhhTocChaCha(:,gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocChaCha(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocChaCha=AmpWaveZhhTocChaCha 
AmpVertexhhTocChaCha= AmpVertexZhhTocChaCha
! Final State 1 
AmpWaveZhhTocChaCha=0._dp 
AmpVertexZhhTocChaCha=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTocChaCha(1,:,gt2,:) = AmpWaveZhhTocChaCha(1,:,gt2,:)+ZRUUP(gt2,gt1)*AmpWavehhTocChaCha(1,:,gt1,:) 
AmpVertexZhhTocChaCha(1,:,gt2,:)= AmpVertexZhhTocChaCha(1,:,gt2,:)+ZRUUP(gt2,gt1)*AmpVertexhhTocChaCha(1,:,gt1,:) 
AmpWaveZhhTocChaCha(2,:,gt2,:) = AmpWaveZhhTocChaCha(2,:,gt2,:)+ZRUUMc(gt2,gt1)*AmpWavehhTocChaCha(2,:,gt1,:) 
AmpVertexZhhTocChaCha(2,:,gt2,:)= AmpVertexZhhTocChaCha(2,:,gt2,:)+ZRUUMc(gt2,gt1)*AmpVertexhhTocChaCha(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocChaCha=AmpWaveZhhTocChaCha 
AmpVertexhhTocChaCha= AmpVertexZhhTocChaCha
! Final State 2 
AmpWaveZhhTocChaCha=0._dp 
AmpVertexZhhTocChaCha=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTocChaCha(1,:,:,gt2) = AmpWaveZhhTocChaCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpWavehhTocChaCha(1,:,:,gt1) 
AmpVertexZhhTocChaCha(1,:,:,gt2)= AmpVertexZhhTocChaCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexhhTocChaCha(1,:,:,gt1) 
AmpWaveZhhTocChaCha(2,:,:,gt2) = AmpWaveZhhTocChaCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpWavehhTocChaCha(2,:,:,gt1) 
AmpVertexZhhTocChaCha(2,:,:,gt2)= AmpVertexZhhTocChaCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpVertexhhTocChaCha(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocChaCha=AmpWaveZhhTocChaCha 
AmpVertexhhTocChaCha= AmpVertexZhhTocChaCha
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocChaCha = AmpVertexhhTocChaCha  +  AmpVertexIRoshhTocChaCha
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Cha] Cha -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocChaCha = AmpTreehhTocChaCha 
 AmpSum2hhTocChaCha = AmpTreehhTocChaCha + 2._dp*AmpWavehhTocChaCha + 2._dp*AmpVertexhhTocChaCha  
Else 
 AmpSumhhTocChaCha = AmpTreehhTocChaCha + AmpWavehhTocChaCha + AmpVertexhhTocChaCha
 AmpSum2hhTocChaCha = AmpTreehhTocChaCha + AmpWavehhTocChaCha + AmpVertexhhTocChaCha 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocChaCha = AmpTreehhTocChaCha
 AmpSum2hhTocChaCha = AmpTreehhTocChaCha 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,2
    Do gt3=1,2
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MChaOS(gt2))+Abs(MChaOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MCha(gt2))+Abs(MCha(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocChaCha = AmpTreehhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MCha(gt2),MCha(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocChaCha(gt1, gt2, gt3) 
  AmpSum2hhTocChaCha = 2._dp*AmpWavehhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MCha(gt2),MCha(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocChaCha(gt1, gt2, gt3) 
  AmpSum2hhTocChaCha = 2._dp*AmpVertexhhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MCha(gt2),MCha(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocChaCha(gt1, gt2, gt3) 
  AmpSum2hhTocChaCha = AmpTreehhTocChaCha + 2._dp*AmpWavehhTocChaCha + 2._dp*AmpVertexhhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MCha(gt2),MCha(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocChaCha(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocChaCha = AmpTreehhTocChaCha
  Call SquareAmp_StoFF(MhhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
  AmpSqTreehhTocChaCha(gt1, gt2, gt3) = AmpSqhhTocChaCha(gt1, gt2, gt3)  
  AmpSum2hhTocChaCha = + 2._dp*AmpWavehhTocChaCha + 2._dp*AmpVertexhhTocChaCha
  Call SquareAmp_StoFF(MhhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
  AmpSqhhTocChaCha(gt1, gt2, gt3) = AmpSqhhTocChaCha(gt1, gt2, gt3) + AmpSqTreehhTocChaCha(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocChaCha = AmpTreehhTocChaCha
  Call SquareAmp_StoFF(Mhh(gt1),MCha(gt2),MCha(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
  AmpSqTreehhTocChaCha(gt1, gt2, gt3) = AmpSqhhTocChaCha(gt1, gt2, gt3)  
  AmpSum2hhTocChaCha = + 2._dp*AmpWavehhTocChaCha + 2._dp*AmpVertexhhTocChaCha
  Call SquareAmp_StoFF(Mhh(gt1),MCha(gt2),MCha(gt3),AmpSumhhTocChaCha(:,gt1, gt2, gt3),AmpSum2hhTocChaCha(:,gt1, gt2, gt3),AmpSqhhTocChaCha(gt1, gt2, gt3)) 
  AmpSqhhTocChaCha(gt1, gt2, gt3) = AmpSqhhTocChaCha(gt1, gt2, gt3) + AmpSqTreehhTocChaCha(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocChaCha(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocChaCha(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MChaOS(gt2),MChaOS(gt3),helfactor*AmpSqhhTocChaCha(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MCha(gt2),MCha(gt3),helfactor*AmpSqhhTocChaCha(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocChaCha(gt1, gt2, gt3) + MRGhhTocChaCha(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocChaCha(gt1, gt2, gt3) + MRGhhTocChaCha(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Chi Chi
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_hhToChiChi(cplChiChihhL,cplChiChihhR,MChi,              & 
& Mhh,MChi2,Mhh2,AmpTreehhToChiChi)

  Else 
Call Amplitude_Tree_sec_UMSSM_hhToChiChi(ZcplChiChihhL,ZcplChiChihhR,MChi,            & 
& Mhh,MChi2,Mhh2,AmpTreehhToChiChi)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_hhToChiChi(MLambda,em,gs,cplChiChihhL,cplChiChihhR,         & 
& MChiOS,MhhOS,MRPhhToChiChi,MRGhhToChiChi)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_hhToChiChi(MLambda,em,gs,ZcplChiChihhL,ZcplChiChihhR,       & 
& MChiOS,MhhOS,MRPhhToChiChi,MRGhhToChiChi)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_hhToChiChi(MLambda,em,gs,cplChiChihhL,cplChiChihhR,         & 
& MChi,Mhh,MRPhhToChiChi,MRGhhToChiChi)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_hhToChiChi(MLambda,em,gs,ZcplChiChihhL,ZcplChiChihhR,       & 
& MChi,Mhh,MRPhhToChiChi,MRGhhToChiChi)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhToChiChi(cplChiChihhL,cplChiChihhR,ctcplChiChihhL,    & 
& ctcplChiChihhR,MChi,MChi2,Mhh,Mhh2,Zfhh,ZfL0,AmpWavehhToChiChi)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhToChiChi(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
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
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexhhToChiChi)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToChiChi(MAh,MCha,MChi,MFd,MFe,MFu,              & 
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
& AmpVertexIRdrhhToChiChi)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToChiChi(MAhOS,MChaOS,MChiOS,MFdOS,              & 
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
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhToChiChi)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToChiChi(MAh,MCha,MChi,MFd,MFe,MFu,              & 
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
& cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhToChiChi)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToChiChi(MAhOS,MChaOS,MChiOS,MFdOS,              & 
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
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhToChiChi)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToChiChi(MAh,MCha,MChi,MFd,MFe,MFu,              & 
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
& AmpVertexIRoshhToChiChi)

 End if 
 End if 
AmpVertexhhToChiChi = AmpVertexhhToChiChi -  AmpVertexIRdrhhToChiChi! +  AmpVertexIRoshhToChiChi ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToChiChi=0._dp 
AmpVertexZhhToChiChi=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhToChiChi(:,gt2,:,:) = AmpWaveZhhToChiChi(:,gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhToChiChi(:,gt1,:,:) 
AmpVertexZhhToChiChi(:,gt2,:,:)= AmpVertexZhhToChiChi(:,gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhToChiChi(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhToChiChi=AmpWaveZhhToChiChi 
AmpVertexhhToChiChi= AmpVertexZhhToChiChi
! Final State 1 
AmpWaveZhhToChiChi=0._dp 
AmpVertexZhhToChiChi=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZhhToChiChi(1,:,gt2,:) = AmpWaveZhhToChiChi(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpWavehhToChiChi(1,:,gt1,:) 
AmpVertexZhhToChiChi(1,:,gt2,:)= AmpVertexZhhToChiChi(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpVertexhhToChiChi(1,:,gt1,:) 
AmpWaveZhhToChiChi(2,:,gt2,:) = AmpWaveZhhToChiChi(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpWavehhToChiChi(2,:,gt1,:) 
AmpVertexZhhToChiChi(2,:,gt2,:)= AmpVertexZhhToChiChi(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpVertexhhToChiChi(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhToChiChi=AmpWaveZhhToChiChi 
AmpVertexhhToChiChi= AmpVertexZhhToChiChi
! Final State 2 
AmpWaveZhhToChiChi=0._dp 
AmpVertexZhhToChiChi=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZhhToChiChi(1,:,:,gt2) = AmpWaveZhhToChiChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWavehhToChiChi(1,:,:,gt1) 
AmpVertexZhhToChiChi(1,:,:,gt2)= AmpVertexZhhToChiChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexhhToChiChi(1,:,:,gt1) 
AmpWaveZhhToChiChi(2,:,:,gt2) = AmpWaveZhhToChiChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWavehhToChiChi(2,:,:,gt1) 
AmpVertexZhhToChiChi(2,:,:,gt2)= AmpVertexZhhToChiChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexhhToChiChi(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhToChiChi=AmpWaveZhhToChiChi 
AmpVertexhhToChiChi= AmpVertexZhhToChiChi
End if
If (ShiftIRdiv) Then 
AmpVertexhhToChiChi = AmpVertexhhToChiChi  +  AmpVertexIRoshhToChiChi
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Chi Chi -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToChiChi = AmpTreehhToChiChi 
 AmpSum2hhToChiChi = AmpTreehhToChiChi + 2._dp*AmpWavehhToChiChi + 2._dp*AmpVertexhhToChiChi  
Else 
 AmpSumhhToChiChi = AmpTreehhToChiChi + AmpWavehhToChiChi + AmpVertexhhToChiChi
 AmpSum2hhToChiChi = AmpTreehhToChiChi + AmpWavehhToChiChi + AmpVertexhhToChiChi 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToChiChi = AmpTreehhToChiChi
 AmpSum2hhToChiChi = AmpTreehhToChiChi 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,9
    Do gt3=gt2,9
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MChiOS(gt2))+Abs(MChiOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MChi(gt2))+Abs(MChi(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhToChiChi = AmpTreehhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MChi(gt2),MChi(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToChiChi(gt1, gt2, gt3) 
  AmpSum2hhToChiChi = 2._dp*AmpWavehhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MChi(gt2),MChi(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToChiChi(gt1, gt2, gt3) 
  AmpSum2hhToChiChi = 2._dp*AmpVertexhhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MChi(gt2),MChi(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToChiChi(gt1, gt2, gt3) 
  AmpSum2hhToChiChi = AmpTreehhToChiChi + 2._dp*AmpWavehhToChiChi + 2._dp*AmpVertexhhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MChi(gt2),MChi(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToChiChi(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToChiChi = AmpTreehhToChiChi
  Call SquareAmp_StoFF(MhhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
  AmpSqTreehhToChiChi(gt1, gt2, gt3) = AmpSqhhToChiChi(gt1, gt2, gt3)  
  AmpSum2hhToChiChi = + 2._dp*AmpWavehhToChiChi + 2._dp*AmpVertexhhToChiChi
  Call SquareAmp_StoFF(MhhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
  AmpSqhhToChiChi(gt1, gt2, gt3) = AmpSqhhToChiChi(gt1, gt2, gt3) + AmpSqTreehhToChiChi(gt1, gt2, gt3)  
Else  
  AmpSum2hhToChiChi = AmpTreehhToChiChi
  Call SquareAmp_StoFF(Mhh(gt1),MChi(gt2),MChi(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
  AmpSqTreehhToChiChi(gt1, gt2, gt3) = AmpSqhhToChiChi(gt1, gt2, gt3)  
  AmpSum2hhToChiChi = + 2._dp*AmpWavehhToChiChi + 2._dp*AmpVertexhhToChiChi
  Call SquareAmp_StoFF(Mhh(gt1),MChi(gt2),MChi(gt3),AmpSumhhToChiChi(:,gt1, gt2, gt3),AmpSum2hhToChiChi(:,gt1, gt2, gt3),AmpSqhhToChiChi(gt1, gt2, gt3)) 
  AmpSqhhToChiChi(gt1, gt2, gt3) = AmpSqhhToChiChi(gt1, gt2, gt3) + AmpSqTreehhToChiChi(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhToChiChi(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqhhToChiChi(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS(gt1),MChiOS(gt2),MChiOS(gt3),helfactor*AmpSqhhToChiChi(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh(gt1),MChi(gt2),MChi(gt3),helfactor*AmpSqhhToChiChi(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToChiChi(gt1, gt2, gt3) + MRGhhToChiChi(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToChiChi(gt1, gt2, gt3) + MRGhhToChiChi(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fd) Fd
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,MFd,Mhh,              & 
& MFd2,Mhh2,AmpTreehhTocFdFd)

  Else 
Call Amplitude_Tree_sec_UMSSM_hhTocFdFd(ZcplcFdFdhhL,ZcplcFdFdhhR,MFd,Mhh,            & 
& MFd2,Mhh2,AmpTreehhTocFdFd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocFdFd(MLambda,em,gs,cplcFdFdhhL,cplcFdFdhhR,            & 
& MFdOS,MhhOS,MRPhhTocFdFd,MRGhhTocFdFd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocFdFd(MLambda,em,gs,ZcplcFdFdhhL,ZcplcFdFdhhR,          & 
& MFdOS,MhhOS,MRPhhTocFdFd,MRGhhTocFdFd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_hhTocFdFd(MLambda,em,gs,cplcFdFdhhL,cplcFdFdhhR,            & 
& MFd,Mhh,MRPhhTocFdFd,MRGhhTocFdFd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocFdFd(MLambda,em,gs,ZcplcFdFdhhL,ZcplcFdFdhhR,          & 
& MFd,Mhh,MRPhhTocFdFd,MRGhhTocFdFd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,ctcplcFdFdhhL,        & 
& ctcplcFdFdhhR,MFd,MFd2,Mhh,Mhh2,ZfFDL,ZfFDR,Zfhh,AmpWavehhTocFdFd)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,          & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,               & 
& cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,            & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,    & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,          & 
& cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,      & 
& AmpVertexhhTocFdFd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,     & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,               & 
& cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,            & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,    & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,          & 
& cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,      & 
& AmpVertexIRdrhhTocFdFd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocFdFd(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,               & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,               & 
& cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,            & 
& cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,         & 
& cplGluFdcSdL,cplGluFdcSdR,ZcplcFdFdhhL,ZcplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,           & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,   & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,           & 
& cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,              & 
& cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhTocFdFd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,     & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,               & 
& cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,ZcplcFdFdhhL,ZcplcFdFdhhR,cplcFdFdVGL,          & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,    & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,          & 
& cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,      & 
& AmpVertexIRoshhTocFdFd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocFdFd(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,               & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,               & 
& cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,            & 
& cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,         & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,   & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,           & 
& cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,              & 
& cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhTocFdFd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,     & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,               & 
& cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,            & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,    & 
& cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,          & 
& cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,            & 
& cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,      & 
& AmpVertexIRoshhTocFdFd)

 End if 
 End if 
AmpVertexhhTocFdFd = AmpVertexhhTocFdFd -  AmpVertexIRdrhhTocFdFd! +  AmpVertexIRoshhTocFdFd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocFdFd=0._dp 
AmpVertexZhhTocFdFd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocFdFd(:,gt2,:,:) = AmpWaveZhhTocFdFd(:,gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocFdFd(:,gt1,:,:) 
AmpVertexZhhTocFdFd(:,gt2,:,:)= AmpVertexZhhTocFdFd(:,gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocFdFd(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocFdFd=AmpWaveZhhTocFdFd 
AmpVertexhhTocFdFd= AmpVertexZhhTocFdFd
! Final State 1 
AmpWaveZhhTocFdFd=0._dp 
AmpVertexZhhTocFdFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFdFd(1,:,gt2,:) = AmpWaveZhhTocFdFd(1,:,gt2,:)+ZRUZDR(gt2,gt1)*AmpWavehhTocFdFd(1,:,gt1,:) 
AmpVertexZhhTocFdFd(1,:,gt2,:)= AmpVertexZhhTocFdFd(1,:,gt2,:)+ZRUZDR(gt2,gt1)*AmpVertexhhTocFdFd(1,:,gt1,:) 
AmpWaveZhhTocFdFd(2,:,gt2,:) = AmpWaveZhhTocFdFd(2,:,gt2,:)+ZRUZDLc(gt2,gt1)*AmpWavehhTocFdFd(2,:,gt1,:) 
AmpVertexZhhTocFdFd(2,:,gt2,:)= AmpVertexZhhTocFdFd(2,:,gt2,:)+ZRUZDLc(gt2,gt1)*AmpVertexhhTocFdFd(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocFdFd=AmpWaveZhhTocFdFd 
AmpVertexhhTocFdFd= AmpVertexZhhTocFdFd
! Final State 2 
AmpWaveZhhTocFdFd=0._dp 
AmpVertexZhhTocFdFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFdFd(1,:,:,gt2) = AmpWaveZhhTocFdFd(1,:,:,gt2)+ZRUZDL(gt2,gt1)*AmpWavehhTocFdFd(1,:,:,gt1) 
AmpVertexZhhTocFdFd(1,:,:,gt2)= AmpVertexZhhTocFdFd(1,:,:,gt2)+ZRUZDL(gt2,gt1)*AmpVertexhhTocFdFd(1,:,:,gt1) 
AmpWaveZhhTocFdFd(2,:,:,gt2) = AmpWaveZhhTocFdFd(2,:,:,gt2)+ZRUZDR(gt2,gt1)*AmpWavehhTocFdFd(2,:,:,gt1) 
AmpVertexZhhTocFdFd(2,:,:,gt2)= AmpVertexZhhTocFdFd(2,:,:,gt2)+ZRUZDR(gt2,gt1)*AmpVertexhhTocFdFd(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocFdFd=AmpWaveZhhTocFdFd 
AmpVertexhhTocFdFd= AmpVertexZhhTocFdFd
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocFdFd = AmpVertexhhTocFdFd  +  AmpVertexIRoshhTocFdFd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Fd] Fd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocFdFd = AmpTreehhTocFdFd 
 AmpSum2hhTocFdFd = AmpTreehhTocFdFd + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd  
Else 
 AmpSumhhTocFdFd = AmpTreehhTocFdFd + AmpWavehhTocFdFd + AmpVertexhhTocFdFd
 AmpSum2hhTocFdFd = AmpTreehhTocFdFd + AmpWavehhTocFdFd + AmpVertexhhTocFdFd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocFdFd = AmpTreehhTocFdFd
 AmpSum2hhTocFdFd = AmpTreehhTocFdFd 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MFdOS(gt2))+Abs(MFdOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MFd(gt2))+Abs(MFd(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocFdFd(gt1, gt2, gt3) 
  AmpSum2hhTocFdFd = 2._dp*AmpWavehhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocFdFd(gt1, gt2, gt3) 
  AmpSum2hhTocFdFd = 2._dp*AmpVertexhhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocFdFd(gt1, gt2, gt3) 
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocFdFd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
  AmpSqTreehhTocFdFd(gt1, gt2, gt3) = AmpSqhhTocFdFd(gt1, gt2, gt3)  
  AmpSum2hhTocFdFd = + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
  AmpSqhhTocFdFd(gt1, gt2, gt3) = AmpSqhhTocFdFd(gt1, gt2, gt3) + AmpSqTreehhTocFdFd(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
  AmpSqTreehhTocFdFd(gt1, gt2, gt3) = AmpSqhhTocFdFd(gt1, gt2, gt3)  
  AmpSum2hhTocFdFd = + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
  AmpSqhhTocFdFd(gt1, gt2, gt3) = AmpSqhhTocFdFd(gt1, gt2, gt3) + AmpSqTreehhTocFdFd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocFdFd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocFdFd(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),helfactor*AmpSqhhTocFdFd(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(Mhh(gt1),MFd(gt2),MFd(gt3),helfactor*AmpSqhhTocFdFd(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocFdFd(gt1, gt2, gt3) + MRGhhTocFdFd(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocFdFd(gt1, gt2, gt3) + MRGhhTocFdFd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fe) Fe
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,MFe,Mhh,              & 
& MFe2,Mhh2,AmpTreehhTocFeFe)

  Else 
Call Amplitude_Tree_sec_UMSSM_hhTocFeFe(ZcplcFeFehhL,ZcplcFeFehhR,MFe,Mhh,            & 
& MFe2,Mhh2,AmpTreehhTocFeFe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocFeFe(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,            & 
& MFeOS,MhhOS,MRPhhTocFeFe,MRGhhTocFeFe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocFeFe(MLambda,em,gs,ZcplcFeFehhL,ZcplcFeFehhR,          & 
& MFeOS,MhhOS,MRPhhTocFeFe,MRGhhTocFeFe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_hhTocFeFe(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,            & 
& MFe,Mhh,MRPhhTocFeFe,MRGhhTocFeFe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocFeFe(MLambda,em,gs,ZcplcFeFehhL,ZcplcFeFehhR,          & 
& MFe,Mhh,MRPhhTocFeFe,MRGhhTocFeFe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,ctcplcFeFehhL,        & 
& ctcplcFeFehhR,MFe,MFe2,Mhh,Mhh2,ZfFEL,ZfFER,Zfhh,AmpWavehhTocFeFe)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhTocFeFe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,             & 
& MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhVZ,           & 
& cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,         & 
& cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,              & 
& cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,    & 
& cplcFvFecVWmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,cplhhcHpmVWm,   & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexhhTocFeFe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocFeFe(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhVZ,      & 
& cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,         & 
& cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,              & 
& cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,    & 
& cplcFvFecVWmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,cplhhcHpmVWm,   & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRdrhhTocFeFe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocFeFe(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,      & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,    & 
& cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,         & 
& cplcFeChiSeL,cplcFeChiSeR,ZcplcFeFehhL,ZcplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,           & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,         & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvhhL,cplcFvFvhhR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,AmpVertexIRoshhTocFeFe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocFeFe(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhVZ,      & 
& cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,         & 
& cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,ZcplcFeFehhL,         & 
& ZcplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,             & 
& cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,    & 
& cplcFvFecVWmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,cplhhcHpmVWm,   & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhTocFeFe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocFeFe(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,      & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,    & 
& cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,         & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,         & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvhhL,cplcFvFvhhR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,            & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,     & 
& cplhhVZpVZp,AmpVertexIRoshhTocFeFe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocFeFe(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhVZ,      & 
& cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,         & 
& cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,              & 
& cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,    & 
& cplcFvFecVWmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,cplhhcHpmVWm,   & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,AmpVertexIRoshhTocFeFe)

 End if 
 End if 
AmpVertexhhTocFeFe = AmpVertexhhTocFeFe -  AmpVertexIRdrhhTocFeFe! +  AmpVertexIRoshhTocFeFe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocFeFe=0._dp 
AmpVertexZhhTocFeFe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocFeFe(:,gt2,:,:) = AmpWaveZhhTocFeFe(:,gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocFeFe(:,gt1,:,:) 
AmpVertexZhhTocFeFe(:,gt2,:,:)= AmpVertexZhhTocFeFe(:,gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocFeFe(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocFeFe=AmpWaveZhhTocFeFe 
AmpVertexhhTocFeFe= AmpVertexZhhTocFeFe
! Final State 1 
AmpWaveZhhTocFeFe=0._dp 
AmpVertexZhhTocFeFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFeFe(1,:,gt2,:) = AmpWaveZhhTocFeFe(1,:,gt2,:)+ZRUZER(gt2,gt1)*AmpWavehhTocFeFe(1,:,gt1,:) 
AmpVertexZhhTocFeFe(1,:,gt2,:)= AmpVertexZhhTocFeFe(1,:,gt2,:)+ZRUZER(gt2,gt1)*AmpVertexhhTocFeFe(1,:,gt1,:) 
AmpWaveZhhTocFeFe(2,:,gt2,:) = AmpWaveZhhTocFeFe(2,:,gt2,:)+ZRUZELc(gt2,gt1)*AmpWavehhTocFeFe(2,:,gt1,:) 
AmpVertexZhhTocFeFe(2,:,gt2,:)= AmpVertexZhhTocFeFe(2,:,gt2,:)+ZRUZELc(gt2,gt1)*AmpVertexhhTocFeFe(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocFeFe=AmpWaveZhhTocFeFe 
AmpVertexhhTocFeFe= AmpVertexZhhTocFeFe
! Final State 2 
AmpWaveZhhTocFeFe=0._dp 
AmpVertexZhhTocFeFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFeFe(1,:,:,gt2) = AmpWaveZhhTocFeFe(1,:,:,gt2)+ZRUZEL(gt2,gt1)*AmpWavehhTocFeFe(1,:,:,gt1) 
AmpVertexZhhTocFeFe(1,:,:,gt2)= AmpVertexZhhTocFeFe(1,:,:,gt2)+ZRUZEL(gt2,gt1)*AmpVertexhhTocFeFe(1,:,:,gt1) 
AmpWaveZhhTocFeFe(2,:,:,gt2) = AmpWaveZhhTocFeFe(2,:,:,gt2)+ZRUZER(gt2,gt1)*AmpWavehhTocFeFe(2,:,:,gt1) 
AmpVertexZhhTocFeFe(2,:,:,gt2)= AmpVertexZhhTocFeFe(2,:,:,gt2)+ZRUZER(gt2,gt1)*AmpVertexhhTocFeFe(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocFeFe=AmpWaveZhhTocFeFe 
AmpVertexhhTocFeFe= AmpVertexZhhTocFeFe
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocFeFe = AmpVertexhhTocFeFe  +  AmpVertexIRoshhTocFeFe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Fe] Fe -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocFeFe = AmpTreehhTocFeFe 
 AmpSum2hhTocFeFe = AmpTreehhTocFeFe + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe  
Else 
 AmpSumhhTocFeFe = AmpTreehhTocFeFe + AmpWavehhTocFeFe + AmpVertexhhTocFeFe
 AmpSum2hhTocFeFe = AmpTreehhTocFeFe + AmpWavehhTocFeFe + AmpVertexhhTocFeFe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocFeFe = AmpTreehhTocFeFe
 AmpSum2hhTocFeFe = AmpTreehhTocFeFe 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(MFeOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MFe(gt2))+Abs(MFe(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocFeFe(gt1, gt2, gt3) 
  AmpSum2hhTocFeFe = 2._dp*AmpWavehhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocFeFe(gt1, gt2, gt3) 
  AmpSum2hhTocFeFe = 2._dp*AmpVertexhhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocFeFe(gt1, gt2, gt3) 
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocFeFe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
  AmpSqTreehhTocFeFe(gt1, gt2, gt3) = AmpSqhhTocFeFe(gt1, gt2, gt3)  
  AmpSum2hhTocFeFe = + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
  AmpSqhhTocFeFe(gt1, gt2, gt3) = AmpSqhhTocFeFe(gt1, gt2, gt3) + AmpSqTreehhTocFeFe(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
  AmpSqTreehhTocFeFe(gt1, gt2, gt3) = AmpSqhhTocFeFe(gt1, gt2, gt3)  
  AmpSum2hhTocFeFe = + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
  AmpSqhhTocFeFe(gt1, gt2, gt3) = AmpSqhhTocFeFe(gt1, gt2, gt3) + AmpSqTreehhTocFeFe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocFeFe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocFeFe(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),helfactor*AmpSqhhTocFeFe(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MFe(gt2),MFe(gt3),helfactor*AmpSqhhTocFeFe(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocFeFe(gt1, gt2, gt3) + MRGhhTocFeFe(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocFeFe(gt1, gt2, gt3) + MRGhhTocFeFe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fu) Fu
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,MFu,Mhh,              & 
& MFu2,Mhh2,AmpTreehhTocFuFu)

  Else 
Call Amplitude_Tree_sec_UMSSM_hhTocFuFu(ZcplcFuFuhhL,ZcplcFuFuhhR,MFu,Mhh,            & 
& MFu2,Mhh2,AmpTreehhTocFuFu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocFuFu(MLambda,em,gs,cplcFuFuhhL,cplcFuFuhhR,            & 
& MFuOS,MhhOS,MRPhhTocFuFu,MRGhhTocFuFu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocFuFu(MLambda,em,gs,ZcplcFuFuhhL,ZcplcFuFuhhR,          & 
& MFuOS,MhhOS,MRPhhTocFuFu,MRGhhTocFuFu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_hhTocFuFu(MLambda,em,gs,cplcFuFuhhL,cplcFuFuhhR,            & 
& MFu,Mhh,MRPhhTocFuFu,MRGhhTocFuFu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocFuFu(MLambda,em,gs,ZcplcFuFuhhL,ZcplcFuFuhhR,          & 
& MFu,Mhh,MRPhhTocFuFu,MRGhhTocFuFu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,ctcplcFuFuhhL,        & 
& ctcplcFuFuhhR,MFu,MFu2,Mhh,Mhh2,ZfFUL,ZfFUR,Zfhh,AmpWavehhTocFuFu)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,          & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,   & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFuSdL,cplcChacFuSdR,AmpVertexhhTocFuFu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,   & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRdrhhTocFuFu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocFuFu(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,               & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,               & 
& cplAhhhVZ,cplAhhhVZp,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,            & 
& cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplGluFucSuL,cplGluFucSuR,ZcplcFuFuhhL,ZcplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,         & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,   & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRoshhTocFuFu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplGluFucSuL,cplGluFucSuR,ZcplcFuFuhhL,ZcplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,         & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,   & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRoshhTocFuFu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocFuFu(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,               & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,               & 
& cplAhhhVZ,cplAhhhVZp,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,            & 
& cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,   & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRoshhTocFuFu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFuFuAhL,cplcFuFuAhR,     & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,  & 
& cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,       & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,   & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRoshhTocFuFu)

 End if 
 End if 
AmpVertexhhTocFuFu = AmpVertexhhTocFuFu -  AmpVertexIRdrhhTocFuFu! +  AmpVertexIRoshhTocFuFu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocFuFu=0._dp 
AmpVertexZhhTocFuFu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocFuFu(:,gt2,:,:) = AmpWaveZhhTocFuFu(:,gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocFuFu(:,gt1,:,:) 
AmpVertexZhhTocFuFu(:,gt2,:,:)= AmpVertexZhhTocFuFu(:,gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocFuFu(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocFuFu=AmpWaveZhhTocFuFu 
AmpVertexhhTocFuFu= AmpVertexZhhTocFuFu
! Final State 1 
AmpWaveZhhTocFuFu=0._dp 
AmpVertexZhhTocFuFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFuFu(1,:,gt2,:) = AmpWaveZhhTocFuFu(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpWavehhTocFuFu(1,:,gt1,:) 
AmpVertexZhhTocFuFu(1,:,gt2,:)= AmpVertexZhhTocFuFu(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpVertexhhTocFuFu(1,:,gt1,:) 
AmpWaveZhhTocFuFu(2,:,gt2,:) = AmpWaveZhhTocFuFu(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpWavehhTocFuFu(2,:,gt1,:) 
AmpVertexZhhTocFuFu(2,:,gt2,:)= AmpVertexZhhTocFuFu(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpVertexhhTocFuFu(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocFuFu=AmpWaveZhhTocFuFu 
AmpVertexhhTocFuFu= AmpVertexZhhTocFuFu
! Final State 2 
AmpWaveZhhTocFuFu=0._dp 
AmpVertexZhhTocFuFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFuFu(1,:,:,gt2) = AmpWaveZhhTocFuFu(1,:,:,gt2)+ZRUZUL(gt2,gt1)*AmpWavehhTocFuFu(1,:,:,gt1) 
AmpVertexZhhTocFuFu(1,:,:,gt2)= AmpVertexZhhTocFuFu(1,:,:,gt2)+ZRUZUL(gt2,gt1)*AmpVertexhhTocFuFu(1,:,:,gt1) 
AmpWaveZhhTocFuFu(2,:,:,gt2) = AmpWaveZhhTocFuFu(2,:,:,gt2)+ZRUZUR(gt2,gt1)*AmpWavehhTocFuFu(2,:,:,gt1) 
AmpVertexZhhTocFuFu(2,:,:,gt2)= AmpVertexZhhTocFuFu(2,:,:,gt2)+ZRUZUR(gt2,gt1)*AmpVertexhhTocFuFu(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocFuFu=AmpWaveZhhTocFuFu 
AmpVertexhhTocFuFu= AmpVertexZhhTocFuFu
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocFuFu = AmpVertexhhTocFuFu  +  AmpVertexIRoshhTocFuFu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Fu] Fu -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocFuFu = AmpTreehhTocFuFu 
 AmpSum2hhTocFuFu = AmpTreehhTocFuFu + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu  
Else 
 AmpSumhhTocFuFu = AmpTreehhTocFuFu + AmpWavehhTocFuFu + AmpVertexhhTocFuFu
 AmpSum2hhTocFuFu = AmpTreehhTocFuFu + AmpWavehhTocFuFu + AmpVertexhhTocFuFu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocFuFu = AmpTreehhTocFuFu
 AmpSum2hhTocFuFu = AmpTreehhTocFuFu 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MFuOS(gt2))+Abs(MFuOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MFu(gt2))+Abs(MFu(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocFuFu(gt1, gt2, gt3) 
  AmpSum2hhTocFuFu = 2._dp*AmpWavehhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocFuFu(gt1, gt2, gt3) 
  AmpSum2hhTocFuFu = 2._dp*AmpVertexhhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocFuFu(gt1, gt2, gt3) 
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocFuFu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
  AmpSqTreehhTocFuFu(gt1, gt2, gt3) = AmpSqhhTocFuFu(gt1, gt2, gt3)  
  AmpSum2hhTocFuFu = + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
  AmpSqhhTocFuFu(gt1, gt2, gt3) = AmpSqhhTocFuFu(gt1, gt2, gt3) + AmpSqTreehhTocFuFu(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
  AmpSqTreehhTocFuFu(gt1, gt2, gt3) = AmpSqhhTocFuFu(gt1, gt2, gt3)  
  AmpSum2hhTocFuFu = + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
  AmpSqhhTocFuFu(gt1, gt2, gt3) = AmpSqhhTocFuFu(gt1, gt2, gt3) + AmpSqTreehhTocFuFu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocFuFu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocFuFu(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),helfactor*AmpSqhhTocFuFu(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(Mhh(gt1),MFu(gt2),MFu(gt3),helfactor*AmpSqhhTocFuFu(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocFuFu(gt1, gt2, gt3) + MRGhhTocFuFu(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocFuFu(gt1, gt2, gt3) + MRGhhTocFuFu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fv) Fv
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_hhTocFvFv(cplcFvFvhhL,cplcFvFvhhR,MFv,Mhh,              & 
& MFv2,Mhh2,AmpTreehhTocFvFv)

  Else 
Call Amplitude_Tree_sec_UMSSM_hhTocFvFv(ZcplcFvFvhhL,ZcplcFvFvhhR,MFv,Mhh,            & 
& MFv2,Mhh2,AmpTreehhTocFvFv)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocFvFv(MLambda,em,gs,cplcFvFvhhL,cplcFvFvhhR,            & 
& MFvOS,MhhOS,MRPhhTocFvFv,MRGhhTocFvFv)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocFvFv(MLambda,em,gs,ZcplcFvFvhhL,ZcplcFvFvhhR,          & 
& MFvOS,MhhOS,MRPhhTocFvFv,MRGhhTocFvFv)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_hhTocFvFv(MLambda,em,gs,cplcFvFvhhL,cplcFvFvhhR,            & 
& MFv,Mhh,MRPhhTocFvFv,MRGhhTocFvFv)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocFvFv(MLambda,em,gs,ZcplcFvFvhhL,ZcplcFvFvhhR,          & 
& MFv,Mhh,MRPhhTocFvFv,MRGhhTocFvFv)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhTocFvFv(cplcFvFvhhL,cplcFvFvhhR,ctcplcFvFvhhL,        & 
& ctcplcFvFvhhR,MFv,MFv2,Mhh,Mhh2,ZfFVL,ZfFVR,Zfhh,AmpWavehhTocFvFv)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhTocFvFv(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,MVWm2,           & 
& MVZ2,MVZp2,cplAhAhhh,cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,           & 
& cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,       & 
& cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvhhL,cplcFvFvhhR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,           & 
& cplcFvFvVZpL,cplcFvFvVZpR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,              & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFvSeL,   & 
& cplcChacFvSeR,AmpVertexhhTocFvFv)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocFvFv(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,            & 
& MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,     & 
& cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,       & 
& cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvhhL,cplcFvFvhhR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,           & 
& cplcFvFvVZpL,cplcFvFvVZpR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,              & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFvSeL,   & 
& cplcChacFvSeR,AmpVertexIRdrhhTocFvFv)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocFvFv(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,             & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,           & 
& cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplChaFvcSeL,cplChaFvcSeR,      & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFvcSvL,cplChiFvcSvR,       & 
& cplcFvChiSvL,cplcFvChiSvR,cplcFeFehhL,cplcFeFehhR,cplcFvFecHpmL,cplcFvFecHpmR,         & 
& cplcFvFecVWmL,cplcFvFecVWmR,ZcplcFvFvhhL,ZcplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,       & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,   & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFvSeL,cplcChacFvSeR,AmpVertexIRoshhTocFvFv)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocFvFv(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,            & 
& MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,     & 
& cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,       & 
& cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,ZcplcFvFvhhL,ZcplcFvFvhhR,     & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,           & 
& cplcFvFvVZpL,cplcFvFvVZpR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,              & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFvSeL,   & 
& cplcChacFvSeR,AmpVertexIRoshhTocFvFv)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocFvFv(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,             & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,           & 
& cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplChaFvcSeL,cplChaFvcSeR,      & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFvcSvL,cplChiFvcSvR,       & 
& cplcFvChiSvL,cplcFvChiSvR,cplcFeFehhL,cplcFeFehhR,cplcFvFecHpmL,cplcFvFecHpmR,         & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,         & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,   & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFvSeL,cplcChacFvSeR,AmpVertexIRoshhTocFvFv)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocFvFv(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,            & 
& MVWm2,MVZ2,MVZp2,cplAhAhhh,cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,     & 
& cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,       & 
& cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvhhL,cplcFvFvhhR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,           & 
& cplcFvFvVZpL,cplcFvFvVZpR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,              & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFvSeL,   & 
& cplcChacFvSeR,AmpVertexIRoshhTocFvFv)

 End if 
 End if 
AmpVertexhhTocFvFv = AmpVertexhhTocFvFv -  AmpVertexIRdrhhTocFvFv! +  AmpVertexIRoshhTocFvFv ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocFvFv=0._dp 
AmpVertexZhhTocFvFv=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocFvFv(:,gt2,:,:) = AmpWaveZhhTocFvFv(:,gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocFvFv(:,gt1,:,:) 
AmpVertexZhhTocFvFv(:,gt2,:,:)= AmpVertexZhhTocFvFv(:,gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocFvFv(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocFvFv=AmpWaveZhhTocFvFv 
AmpVertexhhTocFvFv= AmpVertexZhhTocFvFv
! Final State 1 
AmpWaveZhhTocFvFv=0._dp 
AmpVertexZhhTocFvFv=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFvFv(1,:,gt2,:) = AmpWaveZhhTocFvFv(1,:,gt2,:)+ZRUZVR(gt2,gt1)*AmpWavehhTocFvFv(1,:,gt1,:) 
AmpVertexZhhTocFvFv(1,:,gt2,:)= AmpVertexZhhTocFvFv(1,:,gt2,:)+ZRUZVR(gt2,gt1)*AmpVertexhhTocFvFv(1,:,gt1,:) 
AmpWaveZhhTocFvFv(2,:,gt2,:) = AmpWaveZhhTocFvFv(2,:,gt2,:)+ZRUZVLc(gt2,gt1)*AmpWavehhTocFvFv(2,:,gt1,:) 
AmpVertexZhhTocFvFv(2,:,gt2,:)= AmpVertexZhhTocFvFv(2,:,gt2,:)+ZRUZVLc(gt2,gt1)*AmpVertexhhTocFvFv(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocFvFv=AmpWaveZhhTocFvFv 
AmpVertexhhTocFvFv= AmpVertexZhhTocFvFv
! Final State 2 
AmpWaveZhhTocFvFv=0._dp 
AmpVertexZhhTocFvFv=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFvFv(1,:,:,gt2) = AmpWaveZhhTocFvFv(1,:,:,gt2)+ZRUZVL(gt2,gt1)*AmpWavehhTocFvFv(1,:,:,gt1) 
AmpVertexZhhTocFvFv(1,:,:,gt2)= AmpVertexZhhTocFvFv(1,:,:,gt2)+ZRUZVL(gt2,gt1)*AmpVertexhhTocFvFv(1,:,:,gt1) 
AmpWaveZhhTocFvFv(2,:,:,gt2) = AmpWaveZhhTocFvFv(2,:,:,gt2)+ZRUZVR(gt2,gt1)*AmpWavehhTocFvFv(2,:,:,gt1) 
AmpVertexZhhTocFvFv(2,:,:,gt2)= AmpVertexZhhTocFvFv(2,:,:,gt2)+ZRUZVR(gt2,gt1)*AmpVertexhhTocFvFv(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocFvFv=AmpWaveZhhTocFvFv 
AmpVertexhhTocFvFv= AmpVertexZhhTocFvFv
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocFvFv = AmpVertexhhTocFvFv  +  AmpVertexIRoshhTocFvFv
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Fv] Fv -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocFvFv = AmpTreehhTocFvFv 
 AmpSum2hhTocFvFv = AmpTreehhTocFvFv + 2._dp*AmpWavehhTocFvFv + 2._dp*AmpVertexhhTocFvFv  
Else 
 AmpSumhhTocFvFv = AmpTreehhTocFvFv + AmpWavehhTocFvFv + AmpVertexhhTocFvFv
 AmpSum2hhTocFvFv = AmpTreehhTocFvFv + AmpWavehhTocFvFv + AmpVertexhhTocFvFv 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocFvFv = AmpTreehhTocFvFv
 AmpSum2hhTocFvFv = AmpTreehhTocFvFv 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MFvOS(gt2))+Abs(MFvOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MFv(gt2))+Abs(MFv(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocFvFv = AmpTreehhTocFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhTocFvFv(:,gt1, gt2, gt3),AmpSum2hhTocFvFv(:,gt1, gt2, gt3),AmpSqhhTocFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhTocFvFv(:,gt1, gt2, gt3),AmpSum2hhTocFvFv(:,gt1, gt2, gt3),AmpSqhhTocFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocFvFv(gt1, gt2, gt3) 
  AmpSum2hhTocFvFv = 2._dp*AmpWavehhTocFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhTocFvFv(:,gt1, gt2, gt3),AmpSum2hhTocFvFv(:,gt1, gt2, gt3),AmpSqhhTocFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhTocFvFv(:,gt1, gt2, gt3),AmpSum2hhTocFvFv(:,gt1, gt2, gt3),AmpSqhhTocFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocFvFv(gt1, gt2, gt3) 
  AmpSum2hhTocFvFv = 2._dp*AmpVertexhhTocFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhTocFvFv(:,gt1, gt2, gt3),AmpSum2hhTocFvFv(:,gt1, gt2, gt3),AmpSqhhTocFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhTocFvFv(:,gt1, gt2, gt3),AmpSum2hhTocFvFv(:,gt1, gt2, gt3),AmpSqhhTocFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocFvFv(gt1, gt2, gt3) 
  AmpSum2hhTocFvFv = AmpTreehhTocFvFv + 2._dp*AmpWavehhTocFvFv + 2._dp*AmpVertexhhTocFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhTocFvFv(:,gt1, gt2, gt3),AmpSum2hhTocFvFv(:,gt1, gt2, gt3),AmpSqhhTocFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhTocFvFv(:,gt1, gt2, gt3),AmpSum2hhTocFvFv(:,gt1, gt2, gt3),AmpSqhhTocFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocFvFv(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocFvFv = AmpTreehhTocFvFv
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhTocFvFv(:,gt1, gt2, gt3),AmpSum2hhTocFvFv(:,gt1, gt2, gt3),AmpSqhhTocFvFv(gt1, gt2, gt3)) 
  AmpSqTreehhTocFvFv(gt1, gt2, gt3) = AmpSqhhTocFvFv(gt1, gt2, gt3)  
  AmpSum2hhTocFvFv = + 2._dp*AmpWavehhTocFvFv + 2._dp*AmpVertexhhTocFvFv
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhTocFvFv(:,gt1, gt2, gt3),AmpSum2hhTocFvFv(:,gt1, gt2, gt3),AmpSqhhTocFvFv(gt1, gt2, gt3)) 
  AmpSqhhTocFvFv(gt1, gt2, gt3) = AmpSqhhTocFvFv(gt1, gt2, gt3) + AmpSqTreehhTocFvFv(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocFvFv = AmpTreehhTocFvFv
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhTocFvFv(:,gt1, gt2, gt3),AmpSum2hhTocFvFv(:,gt1, gt2, gt3),AmpSqhhTocFvFv(gt1, gt2, gt3)) 
  AmpSqTreehhTocFvFv(gt1, gt2, gt3) = AmpSqhhTocFvFv(gt1, gt2, gt3)  
  AmpSum2hhTocFvFv = + 2._dp*AmpWavehhTocFvFv + 2._dp*AmpVertexhhTocFvFv
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhTocFvFv(:,gt1, gt2, gt3),AmpSum2hhTocFvFv(:,gt1, gt2, gt3),AmpSqhhTocFvFv(gt1, gt2, gt3)) 
  AmpSqhhTocFvFv(gt1, gt2, gt3) = AmpSqhhTocFvFv(gt1, gt2, gt3) + AmpSqTreehhTocFvFv(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocFvFv(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocFvFv(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),helfactor*AmpSqhhTocFvFv(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MFv(gt2),MFv(gt3),helfactor*AmpSqhhTocFvFv(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocFvFv(gt1, gt2, gt3) + MRGhhTocFvFv(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocFvFv(gt1, gt2, gt3) + MRGhhTocFvFv(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! hh hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_hhTohhhh(cplhhhhhh,Mhh,Mhh2,AmpTreehhTohhhh)

  Else 
Call Amplitude_Tree_sec_UMSSM_hhTohhhh(Zcplhhhhhh,Mhh,Mhh2,AmpTreehhTohhhh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_hhTohhhh(MLambda,em,gs,cplhhhhhh,MhhOS,MRPhhTohhhh,         & 
& MRGhhTohhhh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTohhhh(MLambda,em,gs,Zcplhhhhhh,MhhOS,MRPhhTohhhh,        & 
& MRGhhTohhhh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_hhTohhhh(MLambda,em,gs,cplhhhhhh,Mhh,MRPhhTohhhh,           & 
& MRGhhTohhhh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTohhhh(MLambda,em,gs,Zcplhhhhhh,Mhh,MRPhhTohhhh,          & 
& MRGhhTohhhh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhTohhhh(cplhhhhhh,ctcplhhhhhh,Mhh,Mhh2,Zfhh,           & 
& AmpWavehhTohhhh)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhTohhhh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,         & 
& cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,               & 
& cplcFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,            & 
& cplcgZpgZphh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,     & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplAhAhhhhh1,    & 
& cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,              & 
& cplhhhhSvcSv1,cplhhhhcVWmVWm1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,               & 
& AmpVertexhhTohhhh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTohhhh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,         & 
& cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,               & 
& cplcFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,            & 
& cplcgZpgZphh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,     & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplAhAhhhhh1,    & 
& cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,              & 
& cplhhhhSvcSv1,cplhhhhcVWmVWm1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,               & 
& AmpVertexIRdrhhTohhhh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTohhhh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,         & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,cplcFvFvhhR,               & 
& cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,cplcgZpgZphh,           & 
& Zcplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,      & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplAhAhhhhh1,               & 
& cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,              & 
& cplhhhhSvcSv1,cplhhhhcVWmVWm1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,               & 
& AmpVertexIRoshhTohhhh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTohhhh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,         & 
& cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,               & 
& cplcFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,            & 
& cplcgZpgZphh,Zcplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,               & 
& cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,      & 
& cplAhAhhhhh1,cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa, & 
& cplhhhhSvcSv1,cplhhhhcVWmVWm1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,               & 
& AmpVertexIRoshhTohhhh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTohhhh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,         & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,cplcFvFvhhR,               & 
& cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,cplcgZpgZphh,           & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplAhAhhhhh1,               & 
& cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,              & 
& cplhhhhSvcSv1,cplhhhhcVWmVWm1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,               & 
& AmpVertexIRoshhTohhhh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTohhhh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,         & 
& cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,               & 
& cplcFvFvhhR,cplcgWmgWmhh,cplcgWpCgWpChh,cplcgZgZhh,cplcgZpgZhh,cplcgZgZphh,            & 
& cplcgZpgZphh,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,     & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplAhAhhhhh1,    & 
& cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,              & 
& cplhhhhSvcSv1,cplhhhhcVWmVWm1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,               & 
& AmpVertexIRoshhTohhhh)

 End if 
 End if 
AmpVertexhhTohhhh = AmpVertexhhTohhhh -  AmpVertexIRdrhhTohhhh! +  AmpVertexIRoshhTohhhh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTohhhh=0._dp 
AmpVertexZhhTohhhh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTohhhh(gt2,:,:) = AmpWaveZhhTohhhh(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTohhhh(gt1,:,:) 
AmpVertexZhhTohhhh(gt2,:,:)= AmpVertexZhhTohhhh(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTohhhh(gt1,:,:) 
 End Do 
End Do 
AmpWavehhTohhhh=AmpWaveZhhTohhhh 
AmpVertexhhTohhhh= AmpVertexZhhTohhhh
! Final State 1 
AmpWaveZhhTohhhh=0._dp 
AmpVertexZhhTohhhh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTohhhh(:,gt2,:) = AmpWaveZhhTohhhh(:,gt2,:)+ZRUZH(gt2,gt1)*AmpWavehhTohhhh(:,gt1,:) 
AmpVertexZhhTohhhh(:,gt2,:)= AmpVertexZhhTohhhh(:,gt2,:)+ZRUZH(gt2,gt1)*AmpVertexhhTohhhh(:,gt1,:) 
 End Do 
End Do 
AmpWavehhTohhhh=AmpWaveZhhTohhhh 
AmpVertexhhTohhhh= AmpVertexZhhTohhhh
! Final State 2 
AmpWaveZhhTohhhh=0._dp 
AmpVertexZhhTohhhh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTohhhh(:,:,gt2) = AmpWaveZhhTohhhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWavehhTohhhh(:,:,gt1) 
AmpVertexZhhTohhhh(:,:,gt2)= AmpVertexZhhTohhhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexhhTohhhh(:,:,gt1) 
 End Do 
End Do 
AmpWavehhTohhhh=AmpWaveZhhTohhhh 
AmpVertexhhTohhhh= AmpVertexZhhTohhhh
End if
If (ShiftIRdiv) Then 
AmpVertexhhTohhhh = AmpVertexhhTohhhh  +  AmpVertexIRoshhTohhhh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTohhhh = AmpTreehhTohhhh 
 AmpSum2hhTohhhh = AmpTreehhTohhhh + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh  
Else 
 AmpSumhhTohhhh = AmpTreehhTohhhh + AmpWavehhTohhhh + AmpVertexhhTohhhh
 AmpSum2hhTohhhh = AmpTreehhTohhhh + AmpWavehhTohhhh + AmpVertexhhTohhhh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhhh = AmpTreehhTohhhh
 AmpSum2hhTohhhh = AmpTreehhTohhhh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=gt2,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(MhhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(Mhh(gt2))+Abs(Mhh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTohhhh = AmpTreehhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTohhhh(gt1, gt2, gt3) 
  AmpSum2hhTohhhh = 2._dp*AmpWavehhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTohhhh(gt1, gt2, gt3) 
  AmpSum2hhTohhhh = 2._dp*AmpVertexhhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTohhhh(gt1, gt2, gt3) 
  AmpSum2hhTohhhh = AmpTreehhTohhhh + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTohhhh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTohhhh = AmpTreehhTohhhh
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
  AmpSqTreehhTohhhh(gt1, gt2, gt3) = AmpSqhhTohhhh(gt1, gt2, gt3)  
  AmpSum2hhTohhhh = + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
  AmpSqhhTohhhh(gt1, gt2, gt3) = AmpSqhhTohhhh(gt1, gt2, gt3) + AmpSqTreehhTohhhh(gt1, gt2, gt3)  
Else  
  AmpSum2hhTohhhh = AmpTreehhTohhhh
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
  AmpSqTreehhTohhhh(gt1, gt2, gt3) = AmpSqhhTohhhh(gt1, gt2, gt3)  
  AmpSum2hhTohhhh = + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
  AmpSqhhTohhhh(gt1, gt2, gt3) = AmpSqhhTohhhh(gt1, gt2, gt3) + AmpSqTreehhTohhhh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTohhhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqhhTohhhh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),helfactor*AmpSqhhTohhhh(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh(gt1),Mhh(gt2),Mhh(gt3),helfactor*AmpSqhhTohhhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPhhTohhhh(gt1, gt2, gt3) + MRGhhTohhhh(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPhhTohhhh(gt1, gt2, gt3) + MRGhhTohhhh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(Hpm) Hpm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_hhTocHpmHpm(cplhhHpmcHpm,Mhh,MHpm,Mhh2,MHpm2,           & 
& AmpTreehhTocHpmHpm)

  Else 
Call Amplitude_Tree_sec_UMSSM_hhTocHpmHpm(ZcplhhHpmcHpm,Mhh,MHpm,Mhh2,MHpm2,          & 
& AmpTreehhTocHpmHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocHpmHpm(MLambda,em,gs,cplhhHpmcHpm,MhhOS,               & 
& MHpmOS,MRPhhTocHpmHpm,MRGhhTocHpmHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocHpmHpm(MLambda,em,gs,ZcplhhHpmcHpm,MhhOS,              & 
& MHpmOS,MRPhhTocHpmHpm,MRGhhTocHpmHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_hhTocHpmHpm(MLambda,em,gs,cplhhHpmcHpm,Mhh,MHpm,            & 
& MRPhhTocHpmHpm,MRGhhTocHpmHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocHpmHpm(MLambda,em,gs,ZcplhhHpmcHpm,Mhh,MHpm,           & 
& MRPhhTocHpmHpm,MRGhhTocHpmHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhTocHpmHpm(cplhhHpmcHpm,ctcplhhHpmcHpm,Mhh,            & 
& Mhh2,MHpm,MHpm2,Zfhh,ZfHpm,AmpWavehhTocHpmHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhTocHpmHpm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,         & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,            & 
& cplChiChacHpmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,          & 
& cplcFdFuHpmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmhh,           & 
& cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZpgWpCHpm,              & 
& cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,cplcgZgZphh,cplcgZpgZphh,           & 
& cplcgWmgZpHpm,cplcgWpCgZpcHpm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,       & 
& cplhhVZpVZp,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,            & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcHpmcSu,cplSecHpmcSv,cplcHpmVPVWm,       & 
& cplcHpmVWmVZ,cplcHpmVWmVZp,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplhhhhHpmcHpm1,            & 
& cplhhHpmSucSdaa,cplhhHpmSvcSe1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,       & 
& cplhhSdcHpmcSuaa,cplhhSecHpmcSv1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,     & 
& cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,               & 
& cplHpmSvcHpmcSv1,cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,cplHpmcHpmVZVZp1,cplHpmcHpmVZpVZp1,& 
& AmpVertexhhTocHpmHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocHpmHpm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,              & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,  & 
& cplChiChacHpmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,          & 
& cplcFdFuHpmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmhh,           & 
& cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZpgWpCHpm,              & 
& cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,cplcgZgZphh,cplcgZpgZphh,           & 
& cplcgWmgZpHpm,cplcgWpCgZpcHpm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,       & 
& cplhhVZpVZp,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,            & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcHpmcSu,cplSecHpmcSv,cplcHpmVPVWm,       & 
& cplcHpmVWmVZ,cplcHpmVWmVZp,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplhhhhHpmcHpm1,            & 
& cplhhHpmSucSdaa,cplhhHpmSvcSe1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,       & 
& cplhhSdcHpmcSuaa,cplhhSecHpmcSv1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,     & 
& cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,               & 
& cplHpmSvcHpmcSv1,cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,cplHpmcHpmVZVZp1,cplHpmcHpmVZpVZp1,& 
& AmpVertexIRdrhhTocHpmHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocHpmHpm(MAhOS,MChaOS,MChiOS,MFdOS,             & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,           & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,            & 
& cplChiChacHpmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,          & 
& cplcFdFuHpmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmhh,           & 
& cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZpgWpCHpm,              & 
& cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,cplcgZgZphh,cplcgZpgZphh,           & 
& cplcgWmgZpHpm,cplcgWpCgZpcHpm,cplhhhhhh,ZcplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,         & 
& cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,       & 
& cplhhVZpVZp,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,            & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcHpmcSu,cplSecHpmcSv,cplcHpmVPVWm,       & 
& cplcHpmVWmVZ,cplcHpmVWmVZp,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplhhhhHpmcHpm1,            & 
& cplhhHpmSucSdaa,cplhhHpmSvcSe1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,       & 
& cplhhSdcHpmcSuaa,cplhhSecHpmcSv1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,     & 
& cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,               & 
& cplHpmSvcHpmcSv1,cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,cplHpmcHpmVZVZp1,cplHpmcHpmVZpVZp1,& 
& AmpVertexIRoshhTocHpmHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocHpmHpm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,              & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,  & 
& cplChiChacHpmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,          & 
& cplcFdFuHpmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmhh,           & 
& cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZpgWpCHpm,              & 
& cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,cplcgZgZphh,cplcgZpgZphh,           & 
& cplcgWmgZpHpm,cplcgWpCgZpcHpm,cplhhhhhh,ZcplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,         & 
& cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,       & 
& cplhhVZpVZp,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,            & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcHpmcSu,cplSecHpmcSv,cplcHpmVPVWm,       & 
& cplcHpmVWmVZ,cplcHpmVWmVZp,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplhhhhHpmcHpm1,            & 
& cplhhHpmSucSdaa,cplhhHpmSvcSe1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,       & 
& cplhhSdcHpmcSuaa,cplhhSecHpmcSv1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,     & 
& cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,               & 
& cplHpmSvcHpmcSv1,cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,cplHpmcHpmVZVZp1,cplHpmcHpmVZpVZp1,& 
& AmpVertexIRoshhTocHpmHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocHpmHpm(MAhOS,MChaOS,MChiOS,MFdOS,             & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,           & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,            & 
& cplChiChacHpmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,          & 
& cplcFdFuHpmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmhh,           & 
& cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZpgWpCHpm,              & 
& cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,cplcgZgZphh,cplcgZpgZphh,           & 
& cplcgWmgZpHpm,cplcgWpCgZpcHpm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,       & 
& cplhhVZpVZp,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,            & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcHpmcSu,cplSecHpmcSv,cplcHpmVPVWm,       & 
& cplcHpmVWmVZ,cplcHpmVWmVZp,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplhhhhHpmcHpm1,            & 
& cplhhHpmSucSdaa,cplhhHpmSvcSe1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,       & 
& cplhhSdcHpmcSuaa,cplhhSecHpmcSv1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,     & 
& cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,               & 
& cplHpmSvcHpmcSv1,cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,cplHpmcHpmVZVZp1,cplHpmcHpmVZpVZp1,& 
& AmpVertexIRoshhTocHpmHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocHpmHpm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,              & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacHpmL,  & 
& cplChiChacHpmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,          & 
& cplcFdFuHpmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgWmhh,           & 
& cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgWpCgWpChh,cplcgZgWpCHpm,cplcgZpgWpCHpm,              & 
& cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcHpm,cplcgZgZphh,cplcgZpgZphh,           & 
& cplcgWmgZpHpm,cplcgWpCgZpcHpm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,          & 
& cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,       & 
& cplhhVZpVZp,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,            & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcHpmcSu,cplSecHpmcSv,cplcHpmVPVWm,       & 
& cplcHpmVWmVZ,cplcHpmVWmVZp,cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplhhhhHpmcHpm1,            & 
& cplhhHpmSucSdaa,cplhhHpmSvcSe1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,       & 
& cplhhSdcHpmcSuaa,cplhhSecHpmcSv1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,     & 
& cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,               & 
& cplHpmSvcHpmcSv1,cplHpmcHpmcVWmVWm1,cplHpmcHpmVZVZ1,cplHpmcHpmVZVZp1,cplHpmcHpmVZpVZp1,& 
& AmpVertexIRoshhTocHpmHpm)

 End if 
 End if 
AmpVertexhhTocHpmHpm = AmpVertexhhTocHpmHpm -  AmpVertexIRdrhhTocHpmHpm! +  AmpVertexIRoshhTocHpmHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocHpmHpm=0._dp 
AmpVertexZhhTocHpmHpm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocHpmHpm(gt2,:,:) = AmpWaveZhhTocHpmHpm(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocHpmHpm(gt1,:,:) 
AmpVertexZhhTocHpmHpm(gt2,:,:)= AmpVertexZhhTocHpmHpm(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocHpmHpm(gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocHpmHpm=AmpWaveZhhTocHpmHpm 
AmpVertexhhTocHpmHpm= AmpVertexZhhTocHpmHpm
! Final State 1 
AmpWaveZhhTocHpmHpm=0._dp 
AmpVertexZhhTocHpmHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTocHpmHpm(:,gt2,:) = AmpWaveZhhTocHpmHpm(:,gt2,:)+ZRUZP(gt2,gt1)*AmpWavehhTocHpmHpm(:,gt1,:) 
AmpVertexZhhTocHpmHpm(:,gt2,:)= AmpVertexZhhTocHpmHpm(:,gt2,:)+ZRUZP(gt2,gt1)*AmpVertexhhTocHpmHpm(:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocHpmHpm=AmpWaveZhhTocHpmHpm 
AmpVertexhhTocHpmHpm= AmpVertexZhhTocHpmHpm
! Final State 2 
AmpWaveZhhTocHpmHpm=0._dp 
AmpVertexZhhTocHpmHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTocHpmHpm(:,:,gt2) = AmpWaveZhhTocHpmHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWavehhTocHpmHpm(:,:,gt1) 
AmpVertexZhhTocHpmHpm(:,:,gt2)= AmpVertexZhhTocHpmHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexhhTocHpmHpm(:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocHpmHpm=AmpWaveZhhTocHpmHpm 
AmpVertexhhTocHpmHpm= AmpVertexZhhTocHpmHpm
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocHpmHpm = AmpVertexhhTocHpmHpm  +  AmpVertexIRoshhTocHpmHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->conj[Hpm] Hpm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocHpmHpm = AmpTreehhTocHpmHpm 
 AmpSum2hhTocHpmHpm = AmpTreehhTocHpmHpm + 2._dp*AmpWavehhTocHpmHpm + 2._dp*AmpVertexhhTocHpmHpm  
Else 
 AmpSumhhTocHpmHpm = AmpTreehhTocHpmHpm + AmpWavehhTocHpmHpm + AmpVertexhhTocHpmHpm
 AmpSum2hhTocHpmHpm = AmpTreehhTocHpmHpm + AmpWavehhTocHpmHpm + AmpVertexhhTocHpmHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocHpmHpm = AmpTreehhTocHpmHpm
 AmpSum2hhTocHpmHpm = AmpTreehhTocHpmHpm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=2,2
    Do gt3=2,2
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MHpmOS(gt2))+Abs(MHpmOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MHpm(gt2))+Abs(MHpm(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocHpmHpm = AmpTreehhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MHpm(gt2),MHpm(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocHpmHpm(gt1, gt2, gt3) 
  AmpSum2hhTocHpmHpm = 2._dp*AmpWavehhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MHpm(gt2),MHpm(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocHpmHpm(gt1, gt2, gt3) 
  AmpSum2hhTocHpmHpm = 2._dp*AmpVertexhhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MHpm(gt2),MHpm(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocHpmHpm(gt1, gt2, gt3) 
  AmpSum2hhTocHpmHpm = AmpTreehhTocHpmHpm + 2._dp*AmpWavehhTocHpmHpm + 2._dp*AmpVertexhhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MHpm(gt2),MHpm(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocHpmHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocHpmHpm = AmpTreehhTocHpmHpm
  Call SquareAmp_StoSS(MhhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqTreehhTocHpmHpm(gt1, gt2, gt3) = AmpSqhhTocHpmHpm(gt1, gt2, gt3)  
  AmpSum2hhTocHpmHpm = + 2._dp*AmpWavehhTocHpmHpm + 2._dp*AmpVertexhhTocHpmHpm
  Call SquareAmp_StoSS(MhhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqhhTocHpmHpm(gt1, gt2, gt3) = AmpSqhhTocHpmHpm(gt1, gt2, gt3) + AmpSqTreehhTocHpmHpm(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocHpmHpm = AmpTreehhTocHpmHpm
  Call SquareAmp_StoSS(Mhh(gt1),MHpm(gt2),MHpm(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqTreehhTocHpmHpm(gt1, gt2, gt3) = AmpSqhhTocHpmHpm(gt1, gt2, gt3)  
  AmpSum2hhTocHpmHpm = + 2._dp*AmpWavehhTocHpmHpm + 2._dp*AmpVertexhhTocHpmHpm
  Call SquareAmp_StoSS(Mhh(gt1),MHpm(gt2),MHpm(gt3),AmpSumhhTocHpmHpm(gt1, gt2, gt3),AmpSum2hhTocHpmHpm(gt1, gt2, gt3),AmpSqhhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqhhTocHpmHpm(gt1, gt2, gt3) = AmpSqhhTocHpmHpm(gt1, gt2, gt3) + AmpSqTreehhTocHpmHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocHpmHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTocHpmHpm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),helfactor*AmpSqhhTocHpmHpm(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MHpm(gt2),MHpm(gt3),helfactor*AmpSqhhTocHpmHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocHpmHpm(gt1, gt2, gt3) + MRGhhTocHpmHpm(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocHpmHpm(gt1, gt2, gt3) + MRGhhTocHpmHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Hpm Conjg(VWm)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_hhToHpmcVWm(cplhhHpmcVWm,Mhh,MHpm,MVWm,Mhh2,            & 
& MHpm2,MVWm2,AmpTreehhToHpmcVWm)

  Else 
Call Amplitude_Tree_sec_UMSSM_hhToHpmcVWm(ZcplhhHpmcVWm,Mhh,MHpm,MVWm,Mhh2,           & 
& MHpm2,MVWm2,AmpTreehhToHpmcVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_hhToHpmcVWm(MLambda,em,gs,cplhhHpmcVWm,MhhOS,               & 
& MHpmOS,MVWmOS,MRPhhToHpmcVWm,MRGhhToHpmcVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_hhToHpmcVWm(MLambda,em,gs,ZcplhhHpmcVWm,MhhOS,              & 
& MHpmOS,MVWmOS,MRPhhToHpmcVWm,MRGhhToHpmcVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_hhToHpmcVWm(MLambda,em,gs,cplhhHpmcVWm,Mhh,MHpm,            & 
& MVWm,MRPhhToHpmcVWm,MRGhhToHpmcVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_hhToHpmcVWm(MLambda,em,gs,ZcplhhHpmcVWm,Mhh,MHpm,           & 
& MVWm,MRPhhToHpmcVWm,MRGhhToHpmcVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhToHpmcVWm(cplhhHpmcVWm,ctcplhhHpmcVWm,Mhh,            & 
& Mhh2,MHpm,MHpm2,MVWm,MVWm2,Zfhh,ZfHpm,ZfVWm,AmpWavehhToHpmcVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhToHpmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,         & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,          & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,         & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgAHpm,cplcgWmgWmhh,           & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpChh,cplcgZgWpCHpm,               & 
& cplcgZpgWpCHpm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcVWm,cplcgZgZphh,         & 
& cplcgZpgZphh,cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,        & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,              & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSucVWm,cplSecSvcVWm,       & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,              & 
& cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,   & 
& AmpVertexhhToHpmcVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToHpmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,              & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,          & 
& cplcFdFuHpmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgAHpm,           & 
& cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpChh,cplcgZgWpCHpm,  & 
& cplcgZpgWpCHpm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcVWm,cplcgZgZphh,         & 
& cplcgZpgZphh,cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,        & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,              & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSucVWm,cplSecSvcVWm,       & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,              & 
& cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,   & 
& AmpVertexIRdrhhToHpmcVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToHpmcVWm(MAhOS,MChaOS,MChiOS,MFdOS,             & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,           & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,          & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,         & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgAHpm,cplcgWmgWmhh,           & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpChh,cplcgZgWpCHpm,               & 
& cplcgZpgWpCHpm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcVWm,cplcgZgZphh,         & 
& cplcgZpgZphh,cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhhhhh,GosZcplhhHpmcHpm,ZcplhhHpmcVWm,   & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,GosZcplHpmcVWmVP,          & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSucVWm,cplSecSvcVWm,       & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,              & 
& cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,   & 
& AmpVertexIRoshhToHpmcVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToHpmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,              & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,          & 
& cplcFdFuHpmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgAHpm,           & 
& cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpChh,cplcgZgWpCHpm,  & 
& cplcgZpgWpCHpm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcVWm,cplcgZgZphh,         & 
& cplcgZpgZphh,cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhhhhh,GZcplhhHpmcHpm,ZcplhhHpmcVWm,     & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,GZcplHpmcVWmVP,            & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSucVWm,cplSecSvcVWm,       & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,              & 
& cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,   & 
& AmpVertexIRoshhToHpmcVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToHpmcVWm(MAhOS,MChaOS,MChiOS,MFdOS,             & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,           & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,          & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,         & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgAHpm,cplcgWmgWmhh,           & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpChh,cplcgZgWpCHpm,               & 
& cplcgZpgWpCHpm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcVWm,cplcgZgZphh,         & 
& cplcgZpgZphh,cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhhhhh,GcplhhHpmcHpm,cplhhHpmcVWm,       & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,GcplHpmcVWmVP,             & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSucVWm,cplSecSvcVWm,       & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,              & 
& cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,   & 
& AmpVertexIRoshhToHpmcVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToHpmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,              & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,   & 
& cplcChaChiHpmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,          & 
& cplcFdFuHpmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcgWmgAHpm,           & 
& cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpChh,cplcgZgWpCHpm,  & 
& cplcgZpgWpCHpm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZHpm,cplcgWpCgZcVWm,cplcgZgZphh,         & 
& cplcgZpgZphh,cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,        & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,              & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSucVWm,cplSecSvcVWm,       & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,              & 
& cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,   & 
& AmpVertexIRoshhToHpmcVWm)

 End if 
 End if 
AmpVertexhhToHpmcVWm = AmpVertexhhToHpmcVWm -  AmpVertexIRdrhhToHpmcVWm! +  AmpVertexIRoshhToHpmcVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToHpmcVWm=0._dp 
AmpVertexZhhToHpmcVWm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhToHpmcVWm(:,gt2,:) = AmpWaveZhhToHpmcVWm(:,gt2,:)+ZRUZH(gt2,gt1)*AmpWavehhToHpmcVWm(:,gt1,:) 
AmpVertexZhhToHpmcVWm(:,gt2,:)= AmpVertexZhhToHpmcVWm(:,gt2,:) + ZRUZH(gt2,gt1)*AmpVertexhhToHpmcVWm(:,gt1,:) 
 End Do 
End Do 
AmpWavehhToHpmcVWm=AmpWaveZhhToHpmcVWm 
AmpVertexhhToHpmcVWm= AmpVertexZhhToHpmcVWm
! Final State 1 
AmpWaveZhhToHpmcVWm=0._dp 
AmpVertexZhhToHpmcVWm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhToHpmcVWm(:,:,gt2) = AmpWaveZhhToHpmcVWm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWavehhToHpmcVWm(:,:,gt1) 
AmpVertexZhhToHpmcVWm(:,:,gt2)= AmpVertexZhhToHpmcVWm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexhhToHpmcVWm(:,:,gt1) 
 End Do 
End Do 
AmpWavehhToHpmcVWm=AmpWaveZhhToHpmcVWm 
AmpVertexhhToHpmcVWm= AmpVertexZhhToHpmcVWm
End if
If (ShiftIRdiv) Then 
AmpVertexhhToHpmcVWm = AmpVertexhhToHpmcVWm  +  AmpVertexIRoshhToHpmcVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Hpm conj[VWm] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToHpmcVWm = AmpTreehhToHpmcVWm 
 AmpSum2hhToHpmcVWm = AmpTreehhToHpmcVWm + 2._dp*AmpWavehhToHpmcVWm + 2._dp*AmpVertexhhToHpmcVWm  
Else 
 AmpSumhhToHpmcVWm = AmpTreehhToHpmcVWm + AmpWavehhToHpmcVWm + AmpVertexhhToHpmcVWm
 AmpSum2hhToHpmcVWm = AmpTreehhToHpmcVWm + AmpWavehhToHpmcVWm + AmpVertexhhToHpmcVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToHpmcVWm = AmpTreehhToHpmcVWm
 AmpSum2hhToHpmcVWm = AmpTreehhToHpmcVWm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=2,2
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MHpmOS(gt2))+Abs(MVWmOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MHpm(gt2))+Abs(MVWm))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2hhToHpmcVWm = AmpTreehhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MHpm(gt2),MVWm,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToHpmcVWm(gt1, gt2) 
  AmpSum2hhToHpmcVWm = 2._dp*AmpWavehhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MHpm(gt2),MVWm,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToHpmcVWm(gt1, gt2) 
  AmpSum2hhToHpmcVWm = 2._dp*AmpVertexhhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MHpm(gt2),MVWm,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToHpmcVWm(gt1, gt2) 
  AmpSum2hhToHpmcVWm = AmpTreehhToHpmcVWm + 2._dp*AmpWavehhToHpmcVWm + 2._dp*AmpVertexhhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MHpm(gt2),MVWm,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToHpmcVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToHpmcVWm = AmpTreehhToHpmcVWm
  Call SquareAmp_StoSV(MhhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
  AmpSqTreehhToHpmcVWm(gt1, gt2) = AmpSqhhToHpmcVWm(gt1, gt2)  
  AmpSum2hhToHpmcVWm = + 2._dp*AmpWavehhToHpmcVWm + 2._dp*AmpVertexhhToHpmcVWm
  Call SquareAmp_StoSV(MhhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
  AmpSqhhToHpmcVWm(gt1, gt2) = AmpSqhhToHpmcVWm(gt1, gt2) + AmpSqTreehhToHpmcVWm(gt1, gt2)  
Else  
  AmpSum2hhToHpmcVWm = AmpTreehhToHpmcVWm
  Call SquareAmp_StoSV(Mhh(gt1),MHpm(gt2),MVWm,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
  AmpSqTreehhToHpmcVWm(gt1, gt2) = AmpSqhhToHpmcVWm(gt1, gt2)  
  AmpSum2hhToHpmcVWm = + 2._dp*AmpWavehhToHpmcVWm + 2._dp*AmpVertexhhToHpmcVWm
  Call SquareAmp_StoSV(Mhh(gt1),MHpm(gt2),MVWm,AmpSumhhToHpmcVWm(:,gt1, gt2),AmpSum2hhToHpmcVWm(:,gt1, gt2),AmpSqhhToHpmcVWm(gt1, gt2)) 
  AmpSqhhToHpmcVWm(gt1, gt2) = AmpSqhhToHpmcVWm(gt1, gt2) + AmpSqTreehhToHpmcVWm(gt1, gt2)  
End if  
Else  
  AmpSqhhToHpmcVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToHpmcVWm(gt1, gt2).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS(gt1),MHpmOS(gt2),MVWmOS,helfactor*AmpSqhhToHpmcVWm(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh(gt1),MHpm(gt2),MVWm,helfactor*AmpSqhhToHpmcVWm(gt1, gt2))
End if 
If ((Abs(MRPhhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPhhToHpmcVWm(gt1, gt2) + MRGhhToHpmcVWm(gt1, gt2)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPhhToHpmcVWm(gt1, gt2) + MRGhhToHpmcVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(Sd) Sd
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_hhTocSdSd(cplhhSdcSd,Mhh,MSd,Mhh2,MSd2,AmpTreehhTocSdSd)

  Else 
Call Amplitude_Tree_sec_UMSSM_hhTocSdSd(ZcplhhSdcSd,Mhh,MSd,Mhh2,MSd2,AmpTreehhTocSdSd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocSdSd(MLambda,em,gs,cplhhSdcSd,MhhOS,MSdOS,             & 
& MRPhhTocSdSd,MRGhhTocSdSd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocSdSd(MLambda,em,gs,ZcplhhSdcSd,MhhOS,MSdOS,            & 
& MRPhhTocSdSd,MRGhhTocSdSd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_hhTocSdSd(MLambda,em,gs,cplhhSdcSd,Mhh,MSd,MRPhhTocSdSd,    & 
& MRGhhTocSdSd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocSdSd(MLambda,em,gs,ZcplhhSdcSd,Mhh,MSd,MRPhhTocSdSd,   & 
& MRGhhTocSdSd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhTocSdSd(cplhhSdcSd,ctcplhhSdcSd,Mhh,Mhh2,             & 
& MSd,MSd2,Zfhh,ZfSd,AmpWavehhTocSdSd)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSe,MSu,MSv,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,         & 
& cplAhhhVZ,cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,               & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,        & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,             & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,       & 
& cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,      & 
& cplAhhhSdcSdaa,cplhhhhSdcSdaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,      & 
& cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSdSvcSdcSvaa,cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,cplSdcSdVZpVZpaa,     & 
& AmpVertexhhTocSdSd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,             & 
& MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,     & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,        & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,             & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,       & 
& cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,      & 
& cplAhhhSdcSdaa,cplhhhhSdcSdaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,      & 
& cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSdSvcSdcSvaa,cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,cplSdcSdVZpVZpaa,     & 
& AmpVertexIRdrhhTocSdSd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocSdSd(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,         & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,             & 
& MSu2OS,MSv2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,          & 
& cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,           & 
& cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,         & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,ZcplhhSdcSd,             & 
& cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,       & 
& cplhhVZpVZp,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,    & 
& cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhhhSdcSdaa,     & 
& cplhhhhSdcSdaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,   & 
& cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvcSdcSvaa, & 
& cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,cplSdcSdVZpVZpaa,AmpVertexIRoshhTocSdSd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,             & 
& MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,     & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,        & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,             & 
& ZcplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,      & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,       & 
& cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,      & 
& cplAhhhSdcSdaa,cplhhhhSdcSdaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,      & 
& cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSdSvcSdcSvaa,cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,cplSdcSdVZpVZpaa,     & 
& AmpVertexIRoshhTocSdSd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocSdSd(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,         & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,             & 
& MSu2OS,MSv2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,          & 
& cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,cplcChaChahhR,           & 
& cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,         & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,              & 
& cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,       & 
& cplhhVZpVZp,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,    & 
& cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhhhSdcSdaa,     & 
& cplhhhhSdcSdaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,   & 
& cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvcSdcSvaa, & 
& cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,cplSdcSdVZpVZpaa,AmpVertexIRoshhTocSdSd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,             & 
& MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhSdcSd,cplChaFucSdL,cplChaFucSdR,cplcChaChahhL,     & 
& cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,        & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFdGluSdL,cplcFdGluSdR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,             & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,       & 
& cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,      & 
& cplAhhhSdcSdaa,cplhhhhSdcSdaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSdcHpmcSdaa,      & 
& cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,& 
& cplSdSvcSdcSvaa,cplSdcSdcVWmVWmaa,cplSdcSdVZVZaa,cplSdcSdVZVZpaa,cplSdcSdVZpVZpaa,     & 
& AmpVertexIRoshhTocSdSd)

 End if 
 End if 
AmpVertexhhTocSdSd = AmpVertexhhTocSdSd -  AmpVertexIRdrhhTocSdSd! +  AmpVertexIRoshhTocSdSd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocSdSd=0._dp 
AmpVertexZhhTocSdSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSdSd(gt2,:,:) = AmpWaveZhhTocSdSd(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocSdSd(gt1,:,:) 
AmpVertexZhhTocSdSd(gt2,:,:)= AmpVertexZhhTocSdSd(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocSdSd(gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocSdSd=AmpWaveZhhTocSdSd 
AmpVertexhhTocSdSd= AmpVertexZhhTocSdSd
! Final State 1 
AmpWaveZhhTocSdSd=0._dp 
AmpVertexZhhTocSdSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSdSd(:,gt2,:) = AmpWaveZhhTocSdSd(:,gt2,:)+ZRUZDc(gt2,gt1)*AmpWavehhTocSdSd(:,gt1,:) 
AmpVertexZhhTocSdSd(:,gt2,:)= AmpVertexZhhTocSdSd(:,gt2,:)+ZRUZDc(gt2,gt1)*AmpVertexhhTocSdSd(:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocSdSd=AmpWaveZhhTocSdSd 
AmpVertexhhTocSdSd= AmpVertexZhhTocSdSd
! Final State 2 
AmpWaveZhhTocSdSd=0._dp 
AmpVertexZhhTocSdSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSdSd(:,:,gt2) = AmpWaveZhhTocSdSd(:,:,gt2)+ZRUZD(gt2,gt1)*AmpWavehhTocSdSd(:,:,gt1) 
AmpVertexZhhTocSdSd(:,:,gt2)= AmpVertexZhhTocSdSd(:,:,gt2)+ZRUZD(gt2,gt1)*AmpVertexhhTocSdSd(:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocSdSd=AmpWaveZhhTocSdSd 
AmpVertexhhTocSdSd= AmpVertexZhhTocSdSd
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocSdSd = AmpVertexhhTocSdSd  +  AmpVertexIRoshhTocSdSd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->conj[Sd] Sd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocSdSd = AmpTreehhTocSdSd 
 AmpSum2hhTocSdSd = AmpTreehhTocSdSd + 2._dp*AmpWavehhTocSdSd + 2._dp*AmpVertexhhTocSdSd  
Else 
 AmpSumhhTocSdSd = AmpTreehhTocSdSd + AmpWavehhTocSdSd + AmpVertexhhTocSdSd
 AmpSum2hhTocSdSd = AmpTreehhTocSdSd + AmpWavehhTocSdSd + AmpVertexhhTocSdSd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocSdSd = AmpTreehhTocSdSd
 AmpSum2hhTocSdSd = AmpTreehhTocSdSd 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MSdOS(gt2))+Abs(MSdOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MSd(gt2))+Abs(MSd(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocSdSd = AmpTreehhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSd(gt2),MSd(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocSdSd(gt1, gt2, gt3) 
  AmpSum2hhTocSdSd = 2._dp*AmpWavehhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSd(gt2),MSd(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocSdSd(gt1, gt2, gt3) 
  AmpSum2hhTocSdSd = 2._dp*AmpVertexhhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSd(gt2),MSd(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocSdSd(gt1, gt2, gt3) 
  AmpSum2hhTocSdSd = AmpTreehhTocSdSd + 2._dp*AmpWavehhTocSdSd + 2._dp*AmpVertexhhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSd(gt2),MSd(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocSdSd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocSdSd = AmpTreehhTocSdSd
  Call SquareAmp_StoSS(MhhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
  AmpSqTreehhTocSdSd(gt1, gt2, gt3) = AmpSqhhTocSdSd(gt1, gt2, gt3)  
  AmpSum2hhTocSdSd = + 2._dp*AmpWavehhTocSdSd + 2._dp*AmpVertexhhTocSdSd
  Call SquareAmp_StoSS(MhhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
  AmpSqhhTocSdSd(gt1, gt2, gt3) = AmpSqhhTocSdSd(gt1, gt2, gt3) + AmpSqTreehhTocSdSd(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocSdSd = AmpTreehhTocSdSd
  Call SquareAmp_StoSS(Mhh(gt1),MSd(gt2),MSd(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
  AmpSqTreehhTocSdSd(gt1, gt2, gt3) = AmpSqhhTocSdSd(gt1, gt2, gt3)  
  AmpSum2hhTocSdSd = + 2._dp*AmpWavehhTocSdSd + 2._dp*AmpVertexhhTocSdSd
  Call SquareAmp_StoSS(Mhh(gt1),MSd(gt2),MSd(gt3),AmpSumhhTocSdSd(gt1, gt2, gt3),AmpSum2hhTocSdSd(gt1, gt2, gt3),AmpSqhhTocSdSd(gt1, gt2, gt3)) 
  AmpSqhhTocSdSd(gt1, gt2, gt3) = AmpSqhhTocSdSd(gt1, gt2, gt3) + AmpSqTreehhTocSdSd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocSdSd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTocSdSd(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(MhhOS(gt1),MSdOS(gt2),MSdOS(gt3),helfactor*AmpSqhhTocSdSd(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(Mhh(gt1),MSd(gt2),MSd(gt3),helfactor*AmpSqhhTocSdSd(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocSdSd(gt1, gt2, gt3) + MRGhhTocSdSd(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocSdSd(gt1, gt2, gt3) + MRGhhTocSdSd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(Se) Se
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_hhTocSeSe(cplhhSecSe,Mhh,MSe,Mhh2,MSe2,AmpTreehhTocSeSe)

  Else 
Call Amplitude_Tree_sec_UMSSM_hhTocSeSe(ZcplhhSecSe,Mhh,MSe,Mhh2,MSe2,AmpTreehhTocSeSe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocSeSe(MLambda,em,gs,cplhhSecSe,MhhOS,MSeOS,             & 
& MRPhhTocSeSe,MRGhhTocSeSe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocSeSe(MLambda,em,gs,ZcplhhSecSe,MhhOS,MSeOS,            & 
& MRPhhTocSeSe,MRGhhTocSeSe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_hhTocSeSe(MLambda,em,gs,cplhhSecSe,Mhh,MSe,MRPhhTocSeSe,    & 
& MRGhhTocSeSe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocSeSe(MLambda,em,gs,ZcplhhSecSe,Mhh,MSe,MRPhhTocSeSe,   & 
& MRGhhTocSeSe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhTocSeSe(cplhhSecSe,ctcplhhSecSe,Mhh,Mhh2,             & 
& MSe,MSe2,Zfhh,ZfSe,AmpWavehhTocSeSe)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhTocSeSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,               & 
& cplAhhhVZp,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,           & 
& cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFvFvhhL,cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,   & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,    & 
& cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,       & 
& cplhhhhSecSe1,cplhhHpmSvcSe1,cplhhSecHpmcSv1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,         & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvcSecSv1,cplSecSecVWmVWm1,cplSecSeVZVZ1,          & 
& cplSecSeVZVZp1,cplSecSeVZpVZp1,AmpVertexhhTocSeSe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocSeSe(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,               & 
& cplAhhhVZp,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,           & 
& cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFvFvhhL,cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,   & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,    & 
& cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,       & 
& cplhhhhSecSe1,cplhhHpmSvcSe1,cplhhSecHpmcSv1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,         & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvcSecSv1,cplSecSecVWmVWm1,cplSecSeVZVZ1,          & 
& cplSecSeVZVZp1,cplSecSeVZpVZp1,AmpVertexIRdrhhTocSeSe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocSeSe(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,             & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,              & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhSecSe,       & 
& cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,       & 
& cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFvFvhhL,cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,ZcplhhSecSe,    & 
& cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,      & 
& cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,             & 
& cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplhhhhSecSe1,       & 
& cplhhHpmSvcSe1,cplhhSecHpmcSv1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,        & 
& cplSeSucSecSuaa,cplSeSvcSecSv1,cplSecSecVWmVWm1,cplSecSeVZVZ1,cplSecSeVZVZp1,          & 
& cplSecSeVZpVZp1,AmpVertexIRoshhTocSeSe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocSeSe(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,               & 
& cplAhhhVZp,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,           & 
& cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFvFvhhL,cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,   & 
& cplhhSdcSd,ZcplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,      & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,    & 
& cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,       & 
& cplhhhhSecSe1,cplhhHpmSvcSe1,cplhhSecHpmcSv1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,         & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvcSecSv1,cplSecSecVWmVWm1,cplSecSeVZVZ1,          & 
& cplSecSeVZVZp1,cplSecSeVZpVZp1,AmpVertexIRoshhTocSeSe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocSeSe(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,             & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,              & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhSecSe,       & 
& cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,       & 
& cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFvFvhhL,cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,     & 
& cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,      & 
& cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,             & 
& cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplhhhhSecSe1,       & 
& cplhhHpmSvcSe1,cplhhSecHpmcSv1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,        & 
& cplSeSucSecSuaa,cplSeSvcSecSv1,cplSecSecVWmVWm1,cplSecSeVZVZ1,cplSecSeVZVZp1,          & 
& cplSecSeVZpVZp1,AmpVertexIRoshhTocSeSe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocSeSe(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,               & 
& cplAhhhVZp,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,           & 
& cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFvFvhhL,cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,   & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,    & 
& cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,       & 
& cplhhhhSecSe1,cplhhHpmSvcSe1,cplhhSecHpmcSv1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,         & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvcSecSv1,cplSecSecVWmVWm1,cplSecSeVZVZ1,          & 
& cplSecSeVZVZp1,cplSecSeVZpVZp1,AmpVertexIRoshhTocSeSe)

 End if 
 End if 
AmpVertexhhTocSeSe = AmpVertexhhTocSeSe -  AmpVertexIRdrhhTocSeSe! +  AmpVertexIRoshhTocSeSe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocSeSe=0._dp 
AmpVertexZhhTocSeSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSeSe(gt2,:,:) = AmpWaveZhhTocSeSe(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocSeSe(gt1,:,:) 
AmpVertexZhhTocSeSe(gt2,:,:)= AmpVertexZhhTocSeSe(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocSeSe(gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocSeSe=AmpWaveZhhTocSeSe 
AmpVertexhhTocSeSe= AmpVertexZhhTocSeSe
! Final State 1 
AmpWaveZhhTocSeSe=0._dp 
AmpVertexZhhTocSeSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSeSe(:,gt2,:) = AmpWaveZhhTocSeSe(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpWavehhTocSeSe(:,gt1,:) 
AmpVertexZhhTocSeSe(:,gt2,:)= AmpVertexZhhTocSeSe(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpVertexhhTocSeSe(:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocSeSe=AmpWaveZhhTocSeSe 
AmpVertexhhTocSeSe= AmpVertexZhhTocSeSe
! Final State 2 
AmpWaveZhhTocSeSe=0._dp 
AmpVertexZhhTocSeSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSeSe(:,:,gt2) = AmpWaveZhhTocSeSe(:,:,gt2)+ZRUZE(gt2,gt1)*AmpWavehhTocSeSe(:,:,gt1) 
AmpVertexZhhTocSeSe(:,:,gt2)= AmpVertexZhhTocSeSe(:,:,gt2)+ZRUZE(gt2,gt1)*AmpVertexhhTocSeSe(:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocSeSe=AmpWaveZhhTocSeSe 
AmpVertexhhTocSeSe= AmpVertexZhhTocSeSe
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocSeSe = AmpVertexhhTocSeSe  +  AmpVertexIRoshhTocSeSe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->conj[Se] Se -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocSeSe = AmpTreehhTocSeSe 
 AmpSum2hhTocSeSe = AmpTreehhTocSeSe + 2._dp*AmpWavehhTocSeSe + 2._dp*AmpVertexhhTocSeSe  
Else 
 AmpSumhhTocSeSe = AmpTreehhTocSeSe + AmpWavehhTocSeSe + AmpVertexhhTocSeSe
 AmpSum2hhTocSeSe = AmpTreehhTocSeSe + AmpWavehhTocSeSe + AmpVertexhhTocSeSe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocSeSe = AmpTreehhTocSeSe
 AmpSum2hhTocSeSe = AmpTreehhTocSeSe 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MSeOS(gt2))+Abs(MSeOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MSe(gt2))+Abs(MSe(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocSeSe = AmpTreehhTocSeSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSe(gt2),MSe(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocSeSe(gt1, gt2, gt3) 
  AmpSum2hhTocSeSe = 2._dp*AmpWavehhTocSeSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSe(gt2),MSe(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocSeSe(gt1, gt2, gt3) 
  AmpSum2hhTocSeSe = 2._dp*AmpVertexhhTocSeSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSe(gt2),MSe(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocSeSe(gt1, gt2, gt3) 
  AmpSum2hhTocSeSe = AmpTreehhTocSeSe + 2._dp*AmpWavehhTocSeSe + 2._dp*AmpVertexhhTocSeSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSe(gt2),MSe(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocSeSe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocSeSe = AmpTreehhTocSeSe
  Call SquareAmp_StoSS(MhhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
  AmpSqTreehhTocSeSe(gt1, gt2, gt3) = AmpSqhhTocSeSe(gt1, gt2, gt3)  
  AmpSum2hhTocSeSe = + 2._dp*AmpWavehhTocSeSe + 2._dp*AmpVertexhhTocSeSe
  Call SquareAmp_StoSS(MhhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
  AmpSqhhTocSeSe(gt1, gt2, gt3) = AmpSqhhTocSeSe(gt1, gt2, gt3) + AmpSqTreehhTocSeSe(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocSeSe = AmpTreehhTocSeSe
  Call SquareAmp_StoSS(Mhh(gt1),MSe(gt2),MSe(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
  AmpSqTreehhTocSeSe(gt1, gt2, gt3) = AmpSqhhTocSeSe(gt1, gt2, gt3)  
  AmpSum2hhTocSeSe = + 2._dp*AmpWavehhTocSeSe + 2._dp*AmpVertexhhTocSeSe
  Call SquareAmp_StoSS(Mhh(gt1),MSe(gt2),MSe(gt3),AmpSumhhTocSeSe(gt1, gt2, gt3),AmpSum2hhTocSeSe(gt1, gt2, gt3),AmpSqhhTocSeSe(gt1, gt2, gt3)) 
  AmpSqhhTocSeSe(gt1, gt2, gt3) = AmpSqhhTocSeSe(gt1, gt2, gt3) + AmpSqTreehhTocSeSe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocSeSe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTocSeSe(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MSeOS(gt2),MSeOS(gt3),helfactor*AmpSqhhTocSeSe(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MSe(gt2),MSe(gt3),helfactor*AmpSqhhTocSeSe(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocSeSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocSeSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocSeSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocSeSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocSeSe(gt1, gt2, gt3) + MRGhhTocSeSe(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocSeSe(gt1, gt2, gt3) + MRGhhTocSeSe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(Su) Su
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_hhTocSuSu(cplhhSucSu,Mhh,MSu,Mhh2,MSu2,AmpTreehhTocSuSu)

  Else 
Call Amplitude_Tree_sec_UMSSM_hhTocSuSu(ZcplhhSucSu,Mhh,MSu,Mhh2,MSu2,AmpTreehhTocSuSu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocSuSu(MLambda,em,gs,cplhhSucSu,MhhOS,MSuOS,             & 
& MRPhhTocSuSu,MRGhhTocSuSu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocSuSu(MLambda,em,gs,ZcplhhSucSu,MhhOS,MSuOS,            & 
& MRPhhTocSuSu,MRGhhTocSuSu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_hhTocSuSu(MLambda,em,gs,cplhhSucSu,Mhh,MSu,MRPhhTocSuSu,    & 
& MRGhhTocSuSu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocSuSu(MLambda,em,gs,ZcplhhSucSu,Mhh,MSu,MRPhhTocSuSu,   & 
& MRGhhTocSuSu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhTocSuSu(cplhhSucSu,ctcplhhSucSu,Mhh,Mhh2,             & 
& MSu,MSu2,Zfhh,ZfSu,AmpWavehhTocSuSu)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSe,MSu,MSv,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,         & 
& cplAhhhVZ,cplAhhhVZp,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,              & 
& cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,         & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,              & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,   & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,               & 
& cplAhhhSucSuaa,cplhhhhSucSuaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,      & 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,& 
& cplSuSvcSucSvaa,cplSucSucVWmVWmaa,cplSucSuVZVZaa,cplSucSuVZVZpaa,cplSucSuVZpVZpaa,     & 
& AmpVertexhhTocSuSu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,             & 
& MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,    & 
& cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,         & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,              & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,   & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,               & 
& cplAhhhSucSuaa,cplhhhhSucSuaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,      & 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,& 
& cplSuSvcSucSvaa,cplSucSucVWmVWmaa,cplSucSuVZVZaa,cplSucSuVZVZpaa,cplSucSuVZpVZpaa,     & 
& AmpVertexIRdrhhTocSuSu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocSuSu(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,         & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,             & 
& MSu2OS,MSv2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,          & 
& cplAhhhVZp,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,           & 
& cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,cplhhHpmcHpm,              & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,ZcplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,   & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,     & 
& cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,cplAhhhSucSuaa,           & 
& cplhhhhSucSuaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,   & 
& cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvcSucSvaa, & 
& cplSucSucVWmVWmaa,cplSucSuVZVZaa,cplSucSuVZVZpaa,cplSucSuVZpVZpaa,AmpVertexIRoshhTocSuSu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,             & 
& MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,    & 
& cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,         & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,              & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,ZcplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,   & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,   & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,               & 
& cplAhhhSucSuaa,cplhhhhSucSuaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,      & 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,& 
& cplSuSvcSucSvaa,cplSucSucVWmVWmaa,cplSucSuVZVZaa,cplSucSuVZVZpaa,cplSucSuVZpVZpaa,     & 
& AmpVertexIRoshhTocSuSu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocSuSu(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,         & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,             & 
& MSu2OS,MSv2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,          & 
& cplAhhhVZp,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,           & 
& cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,cplhhHpmcHpm,              & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,    & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,     & 
& cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,cplAhhhSucSuaa,           & 
& cplhhhhSucSuaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,   & 
& cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvcSucSvaa, & 
& cplSucSucVWmVWmaa,cplSucSuVZVZaa,cplSucSuVZVZpaa,cplSucSuVZpVZpaa,AmpVertexIRoshhTocSuSu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,             & 
& MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,    & 
& cplcFdChaSuR,cplChiChihhL,cplChiChihhR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplGluFucSuL,         & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFuGluSuL,cplcFuGluSuR,cplhhhhhh,              & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,   & 
& cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,               & 
& cplAhhhSucSuaa,cplhhhhSucSuaa,cplhhHpmSucSdaa,cplhhSdcHpmcSuaa,cplHpmSucHpmcSuaa,      & 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,cplSuSucSucSuabab,& 
& cplSuSvcSucSvaa,cplSucSucVWmVWmaa,cplSucSuVZVZaa,cplSucSuVZVZpaa,cplSucSuVZpVZpaa,     & 
& AmpVertexIRoshhTocSuSu)

 End if 
 End if 
AmpVertexhhTocSuSu = AmpVertexhhTocSuSu -  AmpVertexIRdrhhTocSuSu! +  AmpVertexIRoshhTocSuSu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocSuSu=0._dp 
AmpVertexZhhTocSuSu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSuSu(gt2,:,:) = AmpWaveZhhTocSuSu(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocSuSu(gt1,:,:) 
AmpVertexZhhTocSuSu(gt2,:,:)= AmpVertexZhhTocSuSu(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocSuSu(gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocSuSu=AmpWaveZhhTocSuSu 
AmpVertexhhTocSuSu= AmpVertexZhhTocSuSu
! Final State 1 
AmpWaveZhhTocSuSu=0._dp 
AmpVertexZhhTocSuSu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSuSu(:,gt2,:) = AmpWaveZhhTocSuSu(:,gt2,:)+ZRUZUc(gt2,gt1)*AmpWavehhTocSuSu(:,gt1,:) 
AmpVertexZhhTocSuSu(:,gt2,:)= AmpVertexZhhTocSuSu(:,gt2,:)+ZRUZUc(gt2,gt1)*AmpVertexhhTocSuSu(:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocSuSu=AmpWaveZhhTocSuSu 
AmpVertexhhTocSuSu= AmpVertexZhhTocSuSu
! Final State 2 
AmpWaveZhhTocSuSu=0._dp 
AmpVertexZhhTocSuSu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSuSu(:,:,gt2) = AmpWaveZhhTocSuSu(:,:,gt2)+ZRUZU(gt2,gt1)*AmpWavehhTocSuSu(:,:,gt1) 
AmpVertexZhhTocSuSu(:,:,gt2)= AmpVertexZhhTocSuSu(:,:,gt2)+ZRUZU(gt2,gt1)*AmpVertexhhTocSuSu(:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocSuSu=AmpWaveZhhTocSuSu 
AmpVertexhhTocSuSu= AmpVertexZhhTocSuSu
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocSuSu = AmpVertexhhTocSuSu  +  AmpVertexIRoshhTocSuSu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->conj[Su] Su -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocSuSu = AmpTreehhTocSuSu 
 AmpSum2hhTocSuSu = AmpTreehhTocSuSu + 2._dp*AmpWavehhTocSuSu + 2._dp*AmpVertexhhTocSuSu  
Else 
 AmpSumhhTocSuSu = AmpTreehhTocSuSu + AmpWavehhTocSuSu + AmpVertexhhTocSuSu
 AmpSum2hhTocSuSu = AmpTreehhTocSuSu + AmpWavehhTocSuSu + AmpVertexhhTocSuSu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocSuSu = AmpTreehhTocSuSu
 AmpSum2hhTocSuSu = AmpTreehhTocSuSu 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MSuOS(gt2))+Abs(MSuOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MSu(gt2))+Abs(MSu(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocSuSu = AmpTreehhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSu(gt2),MSu(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocSuSu(gt1, gt2, gt3) 
  AmpSum2hhTocSuSu = 2._dp*AmpWavehhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSu(gt2),MSu(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocSuSu(gt1, gt2, gt3) 
  AmpSum2hhTocSuSu = 2._dp*AmpVertexhhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSu(gt2),MSu(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocSuSu(gt1, gt2, gt3) 
  AmpSum2hhTocSuSu = AmpTreehhTocSuSu + 2._dp*AmpWavehhTocSuSu + 2._dp*AmpVertexhhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSu(gt2),MSu(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocSuSu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocSuSu = AmpTreehhTocSuSu
  Call SquareAmp_StoSS(MhhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
  AmpSqTreehhTocSuSu(gt1, gt2, gt3) = AmpSqhhTocSuSu(gt1, gt2, gt3)  
  AmpSum2hhTocSuSu = + 2._dp*AmpWavehhTocSuSu + 2._dp*AmpVertexhhTocSuSu
  Call SquareAmp_StoSS(MhhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
  AmpSqhhTocSuSu(gt1, gt2, gt3) = AmpSqhhTocSuSu(gt1, gt2, gt3) + AmpSqTreehhTocSuSu(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocSuSu = AmpTreehhTocSuSu
  Call SquareAmp_StoSS(Mhh(gt1),MSu(gt2),MSu(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
  AmpSqTreehhTocSuSu(gt1, gt2, gt3) = AmpSqhhTocSuSu(gt1, gt2, gt3)  
  AmpSum2hhTocSuSu = + 2._dp*AmpWavehhTocSuSu + 2._dp*AmpVertexhhTocSuSu
  Call SquareAmp_StoSS(Mhh(gt1),MSu(gt2),MSu(gt3),AmpSumhhTocSuSu(gt1, gt2, gt3),AmpSum2hhTocSuSu(gt1, gt2, gt3),AmpSqhhTocSuSu(gt1, gt2, gt3)) 
  AmpSqhhTocSuSu(gt1, gt2, gt3) = AmpSqhhTocSuSu(gt1, gt2, gt3) + AmpSqTreehhTocSuSu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocSuSu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTocSuSu(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(MhhOS(gt1),MSuOS(gt2),MSuOS(gt3),helfactor*AmpSqhhTocSuSu(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(Mhh(gt1),MSu(gt2),MSu(gt3),helfactor*AmpSqhhTocSuSu(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocSuSu(gt1, gt2, gt3) + MRGhhTocSuSu(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocSuSu(gt1, gt2, gt3) + MRGhhTocSuSu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(Sv) Sv
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_hhTocSvSv(cplhhSvcSv,Mhh,MSv,Mhh2,MSv2,AmpTreehhTocSvSv)

  Else 
Call Amplitude_Tree_sec_UMSSM_hhTocSvSv(ZcplhhSvcSv,Mhh,MSv,Mhh2,MSv2,AmpTreehhTocSvSv)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocSvSv(MLambda,em,gs,cplhhSvcSv,MhhOS,MSvOS,             & 
& MRPhhTocSvSv,MRGhhTocSvSv)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocSvSv(MLambda,em,gs,ZcplhhSvcSv,MhhOS,MSvOS,            & 
& MRPhhTocSvSv,MRGhhTocSvSv)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_hhTocSvSv(MLambda,em,gs,cplhhSvcSv,Mhh,MSv,MRPhhTocSvSv,    & 
& MRGhhTocSvSv)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocSvSv(MLambda,em,gs,ZcplhhSvcSv,Mhh,MSv,MRPhhTocSvSv,   & 
& MRGhhTocSvSv)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhTocSvSv(cplhhSvcSv,ctcplhhSvcSv,Mhh,Mhh2,             & 
& MSv,MSv2,Zfhh,ZfSv,AmpWavehhTocSvSv)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhTocSvSv(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSd2,              & 
& MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,              & 
& cplAhSvcSv,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,         & 
& cplChiChihhR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvhhL,cplcFvFvhhR,cplhhhhhh,             & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplSecHpmcSv,cplSecSvcVWm,   & 
& cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,cplAhAhSvcSv1,cplAhhhSvcSv1,cplhhhhSvcSv1,          & 
& cplhhHpmSvcSe1,cplhhSecHpmcSv1,cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,cplSeSvcSecSv1,        & 
& cplSuSvcSucSvaa,cplSvSvcSvcSv1,cplSvcSvcVWmVWm1,cplSvcSvVZVZ1,cplSvcSvVZVZp1,          & 
& cplSvcSvVZpVZp1,AmpVertexhhTocSvSv)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocSvSv(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,              & 
& MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,         & 
& cplAhSvcSv,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,         & 
& cplChiChihhR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvhhL,cplcFvFvhhR,cplhhhhhh,             & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplSecHpmcSv,cplSecSvcVWm,   & 
& cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,cplAhAhSvcSv1,cplAhhhSvcSv1,cplhhhhSvcSv1,          & 
& cplhhHpmSvcSe1,cplhhSecHpmcSv1,cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,cplSeSvcSecSv1,        & 
& cplSuSvcSucSvaa,cplSvSvcSvcSv1,cplSvcSvcVWmVWm1,cplSvcSvVZVZ1,cplSvcSvVZVZp1,          & 
& cplSvcSvVZpVZp1,AmpVertexIRdrhhTocSvSv)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocSvSv(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,         & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVWm2OS,              & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhSvcSv,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,cplChiChihhR,cplChiFvcSvL,        & 
& cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFehhL,cplcFeFehhR,cplcChaFecSvL,          & 
& cplcChaFecSvR,cplcFvFvhhL,cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,             & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,ZcplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,      & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,              & 
& cplSvcSvVZ,cplSvcSvVZp,cplAhAhSvcSv1,cplAhhhSvcSv1,cplhhhhSvcSv1,cplhhHpmSvcSe1,       & 
& cplhhSecHpmcSv1,cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,cplSeSvcSecSv1,cplSuSvcSucSvaa,       & 
& cplSvSvcSvcSv1,cplSvcSvcVWmVWm1,cplSvcSvVZVZ1,cplSvcSvVZVZp1,cplSvcSvVZpVZp1,          & 
& AmpVertexIRoshhTocSvSv)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocSvSv(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,              & 
& MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,         & 
& cplAhSvcSv,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,         & 
& cplChiChihhR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvhhL,cplcFvFvhhR,cplhhhhhh,             & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,ZcplhhSvcSv,cplhhcHpmVWm,   & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplSecHpmcSv,cplSecSvcVWm,   & 
& cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,cplAhAhSvcSv1,cplAhhhSvcSv1,cplhhhhSvcSv1,          & 
& cplhhHpmSvcSe1,cplhhSecHpmcSv1,cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,cplSeSvcSecSv1,        & 
& cplSuSvcSucSvaa,cplSvSvcSvcSv1,cplSvcSvcVWmVWm1,cplSvcSvVZVZ1,cplSvcSvVZVZp1,          & 
& cplSvcSvVZpVZp1,AmpVertexIRoshhTocSvSv)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocSvSv(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,         & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVWm2OS,              & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhSvcSv,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,cplChiChihhR,cplChiFvcSvL,        & 
& cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFehhL,cplcFeFehhR,cplcChaFecSvL,          & 
& cplcChaFecSvR,cplcFvFvhhL,cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,             & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,              & 
& cplSvcSvVZ,cplSvcSvVZp,cplAhAhSvcSv1,cplAhhhSvcSv1,cplhhhhSvcSv1,cplhhHpmSvcSe1,       & 
& cplhhSecHpmcSv1,cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,cplSeSvcSecSv1,cplSuSvcSucSvaa,       & 
& cplSvSvcSvcSv1,cplSvcSvcVWmVWm1,cplSvcSvVZVZ1,cplSvcSvVZVZp1,cplSvcSvVZpVZp1,          & 
& AmpVertexIRoshhTocSvSv)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocSvSv(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,              & 
& MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,         & 
& cplAhSvcSv,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,         & 
& cplChiChihhR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvhhL,cplcFvFvhhR,cplhhhhhh,             & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplSecHpmcSv,cplSecSvcVWm,   & 
& cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,cplAhAhSvcSv1,cplAhhhSvcSv1,cplhhhhSvcSv1,          & 
& cplhhHpmSvcSe1,cplhhSecHpmcSv1,cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,cplSeSvcSecSv1,        & 
& cplSuSvcSucSvaa,cplSvSvcSvcSv1,cplSvcSvcVWmVWm1,cplSvcSvVZVZ1,cplSvcSvVZVZp1,          & 
& cplSvcSvVZpVZp1,AmpVertexIRoshhTocSvSv)

 End if 
 End if 
AmpVertexhhTocSvSv = AmpVertexhhTocSvSv -  AmpVertexIRdrhhTocSvSv! +  AmpVertexIRoshhTocSvSv ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocSvSv=0._dp 
AmpVertexZhhTocSvSv=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSvSv(gt2,:,:) = AmpWaveZhhTocSvSv(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocSvSv(gt1,:,:) 
AmpVertexZhhTocSvSv(gt2,:,:)= AmpVertexZhhTocSvSv(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocSvSv(gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocSvSv=AmpWaveZhhTocSvSv 
AmpVertexhhTocSvSv= AmpVertexZhhTocSvSv
! Final State 1 
AmpWaveZhhTocSvSv=0._dp 
AmpVertexZhhTocSvSv=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSvSv(:,gt2,:) = AmpWaveZhhTocSvSv(:,gt2,:)+ZRUZVc(gt2,gt1)*AmpWavehhTocSvSv(:,gt1,:) 
AmpVertexZhhTocSvSv(:,gt2,:)= AmpVertexZhhTocSvSv(:,gt2,:)+ZRUZVc(gt2,gt1)*AmpVertexhhTocSvSv(:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocSvSv=AmpWaveZhhTocSvSv 
AmpVertexhhTocSvSv= AmpVertexZhhTocSvSv
! Final State 2 
AmpWaveZhhTocSvSv=0._dp 
AmpVertexZhhTocSvSv=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocSvSv(:,:,gt2) = AmpWaveZhhTocSvSv(:,:,gt2)+ZRUZV(gt2,gt1)*AmpWavehhTocSvSv(:,:,gt1) 
AmpVertexZhhTocSvSv(:,:,gt2)= AmpVertexZhhTocSvSv(:,:,gt2)+ZRUZV(gt2,gt1)*AmpVertexhhTocSvSv(:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocSvSv=AmpWaveZhhTocSvSv 
AmpVertexhhTocSvSv= AmpVertexZhhTocSvSv
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocSvSv = AmpVertexhhTocSvSv  +  AmpVertexIRoshhTocSvSv
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->conj[Sv] Sv -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocSvSv = AmpTreehhTocSvSv 
 AmpSum2hhTocSvSv = AmpTreehhTocSvSv + 2._dp*AmpWavehhTocSvSv + 2._dp*AmpVertexhhTocSvSv  
Else 
 AmpSumhhTocSvSv = AmpTreehhTocSvSv + AmpWavehhTocSvSv + AmpVertexhhTocSvSv
 AmpSum2hhTocSvSv = AmpTreehhTocSvSv + AmpWavehhTocSvSv + AmpVertexhhTocSvSv 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocSvSv = AmpTreehhTocSvSv
 AmpSum2hhTocSvSv = AmpTreehhTocSvSv 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MSvOS(gt2))+Abs(MSvOS(gt3))))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MSv(gt2))+Abs(MSv(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocSvSv = AmpTreehhTocSvSv
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvOS(gt2),MSvOS(gt3),AmpSumhhTocSvSv(gt1, gt2, gt3),AmpSum2hhTocSvSv(gt1, gt2, gt3),AmpSqhhTocSvSv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSv(gt2),MSv(gt3),AmpSumhhTocSvSv(gt1, gt2, gt3),AmpSum2hhTocSvSv(gt1, gt2, gt3),AmpSqhhTocSvSv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocSvSv(gt1, gt2, gt3) 
  AmpSum2hhTocSvSv = 2._dp*AmpWavehhTocSvSv
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvOS(gt2),MSvOS(gt3),AmpSumhhTocSvSv(gt1, gt2, gt3),AmpSum2hhTocSvSv(gt1, gt2, gt3),AmpSqhhTocSvSv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSv(gt2),MSv(gt3),AmpSumhhTocSvSv(gt1, gt2, gt3),AmpSum2hhTocSvSv(gt1, gt2, gt3),AmpSqhhTocSvSv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocSvSv(gt1, gt2, gt3) 
  AmpSum2hhTocSvSv = 2._dp*AmpVertexhhTocSvSv
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvOS(gt2),MSvOS(gt3),AmpSumhhTocSvSv(gt1, gt2, gt3),AmpSum2hhTocSvSv(gt1, gt2, gt3),AmpSqhhTocSvSv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSv(gt2),MSv(gt3),AmpSumhhTocSvSv(gt1, gt2, gt3),AmpSum2hhTocSvSv(gt1, gt2, gt3),AmpSqhhTocSvSv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocSvSv(gt1, gt2, gt3) 
  AmpSum2hhTocSvSv = AmpTreehhTocSvSv + 2._dp*AmpWavehhTocSvSv + 2._dp*AmpVertexhhTocSvSv
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MSvOS(gt2),MSvOS(gt3),AmpSumhhTocSvSv(gt1, gt2, gt3),AmpSum2hhTocSvSv(gt1, gt2, gt3),AmpSqhhTocSvSv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MSv(gt2),MSv(gt3),AmpSumhhTocSvSv(gt1, gt2, gt3),AmpSum2hhTocSvSv(gt1, gt2, gt3),AmpSqhhTocSvSv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocSvSv(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocSvSv = AmpTreehhTocSvSv
  Call SquareAmp_StoSS(MhhOS(gt1),MSvOS(gt2),MSvOS(gt3),AmpSumhhTocSvSv(gt1, gt2, gt3),AmpSum2hhTocSvSv(gt1, gt2, gt3),AmpSqhhTocSvSv(gt1, gt2, gt3)) 
  AmpSqTreehhTocSvSv(gt1, gt2, gt3) = AmpSqhhTocSvSv(gt1, gt2, gt3)  
  AmpSum2hhTocSvSv = + 2._dp*AmpWavehhTocSvSv + 2._dp*AmpVertexhhTocSvSv
  Call SquareAmp_StoSS(MhhOS(gt1),MSvOS(gt2),MSvOS(gt3),AmpSumhhTocSvSv(gt1, gt2, gt3),AmpSum2hhTocSvSv(gt1, gt2, gt3),AmpSqhhTocSvSv(gt1, gt2, gt3)) 
  AmpSqhhTocSvSv(gt1, gt2, gt3) = AmpSqhhTocSvSv(gt1, gt2, gt3) + AmpSqTreehhTocSvSv(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocSvSv = AmpTreehhTocSvSv
  Call SquareAmp_StoSS(Mhh(gt1),MSv(gt2),MSv(gt3),AmpSumhhTocSvSv(gt1, gt2, gt3),AmpSum2hhTocSvSv(gt1, gt2, gt3),AmpSqhhTocSvSv(gt1, gt2, gt3)) 
  AmpSqTreehhTocSvSv(gt1, gt2, gt3) = AmpSqhhTocSvSv(gt1, gt2, gt3)  
  AmpSum2hhTocSvSv = + 2._dp*AmpWavehhTocSvSv + 2._dp*AmpVertexhhTocSvSv
  Call SquareAmp_StoSS(Mhh(gt1),MSv(gt2),MSv(gt3),AmpSumhhTocSvSv(gt1, gt2, gt3),AmpSum2hhTocSvSv(gt1, gt2, gt3),AmpSqhhTocSvSv(gt1, gt2, gt3)) 
  AmpSqhhTocSvSv(gt1, gt2, gt3) = AmpSqhhTocSvSv(gt1, gt2, gt3) + AmpSqTreehhTocSvSv(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocSvSv(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTocSvSv(gt1, gt2, gt3).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MSvOS(gt2),MSvOS(gt3),helfactor*AmpSqhhTocSvSv(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MSv(gt2),MSv(gt3),helfactor*AmpSqhhTocSvSv(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocSvSv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocSvSv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocSvSv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocSvSv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocSvSv(gt1, gt2, gt3) + MRGhhTocSvSv(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocSvSv(gt1, gt2, gt3) + MRGhhTocSvSv(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(VWm) VWm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_hhTocVWmVWm(cplhhcVWmVWm,Mhh,MVWm,Mhh2,MVWm2,           & 
& AmpTreehhTocVWmVWm)

  Else 
Call Amplitude_Tree_sec_UMSSM_hhTocVWmVWm(ZcplhhcVWmVWm,Mhh,MVWm,Mhh2,MVWm2,          & 
& AmpTreehhTocVWmVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocVWmVWm(MLambda,em,gs,cplhhcVWmVWm,MhhOS,               & 
& MVWmOS,MRPhhTocVWmVWm,MRGhhTocVWmVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocVWmVWm(MLambda,em,gs,ZcplhhcVWmVWm,MhhOS,              & 
& MVWmOS,MRPhhTocVWmVWm,MRGhhTocVWmVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_hhTocVWmVWm(MLambda,em,gs,cplhhcVWmVWm,Mhh,MVWm,            & 
& MRPhhTocVWmVWm,MRGhhTocVWmVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_hhTocVWmVWm(MLambda,em,gs,ZcplhhcVWmVWm,Mhh,MVWm,           & 
& MRPhhTocVWmVWm,MRGhhTocVWmVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhTocVWmVWm(cplhhcVWmVWm,ctcplhhcVWmVWm,Mhh,            & 
& Mhh2,MVWm,MVWm2,Zfhh,ZfVWm,AmpWavehhTocVWmVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhTocVWmVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,         & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,          & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,cplcChaChiVWmR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,cplcFdFuVWmR,         & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgWmgAVWm,cplcgWpCgAcVWm,         & 
& cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpChh,cplcgAgWpCVWm,  & 
& cplcgZgWpCVWm,cplcgZpgWpCVWm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZVWm,cplcgWpCgZcVWm,       & 
& cplcgZgZphh,cplcgZpgZphh,cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplhhhhhh,cplhhHpmcHpm,         & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,    & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,              & 
& cplSdcSucVWm,cplSecSvcVWm,cplSucSdVWm,cplSvcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,           & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhcVWmVWm1,cplhhhhcVWmVWm1, & 
& cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,      & 
& cplhhcHpmVWmVZp1,cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa,cplSecSecVWmVWm1,cplSucSucVWmVWmaa,& 
& cplSvcSvcVWmVWm1,cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,          & 
& cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZp3Q,cplcVWmVWmVZVZp2Q,& 
& cplcVWmVWmVZVZp1Q,cplcVWmVWmVZpVZp2Q,cplcVWmVWmVZpVZp3Q,cplcVWmVWmVZpVZp1Q,            & 
& AmpVertexhhTocVWmVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocVWmVWm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,              & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,   & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,          & 
& cplcFdFuVWmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgWmgAVWm,           & 
& cplcgWpCgAcVWm,cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpChh, & 
& cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZpgWpCVWm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZVWm,        & 
& cplcgWpCgZcVWm,cplcgZgZphh,cplcgZpgZphh,cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplhhhhhh,       & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcVWmVP,cplHpmcVWmVZ,               & 
& cplHpmcVWmVZp,cplSdcSucVWm,cplSecSvcVWm,cplSucSdVWm,cplSvcSeVWm,cplcHpmVPVWm,          & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhcVWmVWm1,    & 
& cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVPVWm1,      & 
& cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa,cplSecSecVWmVWm1,& 
& cplSucSucVWmVWmaa,cplSvcSvcVWmVWm1,cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,            & 
& cplcVWmcVWmVWmVWm3Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZp3Q,& 
& cplcVWmVWmVZVZp2Q,cplcVWmVWmVZVZp1Q,cplcVWmVWmVZpVZp2Q,cplcVWmVWmVZpVZp3Q,             & 
& cplcVWmVWmVZpVZp1Q,AmpVertexIRdrhhTocVWmVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocVWmVWm(MAhOS,MChaOS,MChiOS,MFdOS,             & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,           & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,          & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,cplcChaChiVWmR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,cplcFdFuVWmR,         & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgWmgAVWm,cplcgWpCgAcVWm,         & 
& cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpChh,cplcgAgWpCVWm,  & 
& cplcgZgWpCVWm,cplcgZpgWpCVWm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZVWm,cplcgWpCgZcVWm,       & 
& cplcgZgZphh,cplcgZpgZphh,cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplhhhhhh,GosZcplhhHpmcHpm,     & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,GosZcplhhcHpmVWm,             & 
& ZcplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,GosZcplHpmcVWmVP,cplHpmcVWmVZ,          & 
& cplHpmcVWmVZp,cplSdcSucVWm,cplSecSvcVWm,cplSucSdVWm,cplSvcSeVWm,GosZcplcHpmVPVWm,      & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhcVWmVWm1,    & 
& cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVPVWm1,      & 
& cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa,cplSecSecVWmVWm1,& 
& cplSucSucVWmVWmaa,cplSvcSvcVWmVWm1,cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,            & 
& cplcVWmcVWmVWmVWm3Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZp3Q,& 
& cplcVWmVWmVZVZp2Q,cplcVWmVWmVZVZp1Q,cplcVWmVWmVZpVZp2Q,cplcVWmVWmVZpVZp3Q,             & 
& cplcVWmVWmVZpVZp1Q,AmpVertexIRoshhTocVWmVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocVWmVWm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,              & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,   & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,          & 
& cplcFdFuVWmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgWmgAVWm,           & 
& cplcgWpCgAcVWm,cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpChh, & 
& cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZpgWpCVWm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZVWm,        & 
& cplcgWpCgZcVWm,cplcgZgZphh,cplcgZpgZphh,cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplhhhhhh,       & 
& GZcplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,               & 
& GZcplhhcHpmVWm,ZcplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,GZcplHpmcVWmVP,          & 
& cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,cplSecSvcVWm,cplSucSdVWm,cplSvcSeVWm,          & 
& GZcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,     & 
& cplAhAhcVWmVWm1,cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,      & 
& cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa, & 
& cplSecSecVWmVWm1,cplSucSucVWmVWmaa,cplSvcSvcVWmVWm1,cplcVWmcVWmVWmVWm1Q,               & 
& cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,             & 
& cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZp3Q,cplcVWmVWmVZVZp2Q,cplcVWmVWmVZVZp1Q,cplcVWmVWmVZpVZp2Q,& 
& cplcVWmVWmVZpVZp3Q,cplcVWmVWmVZpVZp1Q,AmpVertexIRoshhTocVWmVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocVWmVWm(MAhOS,MChaOS,MChiOS,MFdOS,             & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,           & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacVWmL,cplChiChacVWmR,          & 
& cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,cplcChaChiVWmR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,cplcFdFuVWmR,         & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgWmgAVWm,cplcgWpCgAcVWm,         & 
& cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpChh,cplcgAgWpCVWm,  & 
& cplcgZgWpCVWm,cplcgZpgWpCVWm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZVWm,cplcgWpCgZcVWm,       & 
& cplcgZgZphh,cplcgZpgZphh,cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplhhhhhh,cplhhHpmcHpm,         & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,GcplhhcHpmVWm,cplhhcVWmVWm,   & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,              & 
& cplSdcSucVWm,cplSecSvcVWm,cplSucSdVWm,cplSvcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,           & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhcVWmVWm1,cplhhhhcVWmVWm1, & 
& cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,      & 
& cplhhcHpmVWmVZp1,cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa,cplSecSecVWmVWm1,cplSucSucVWmVWmaa,& 
& cplSvcSvcVWmVWm1,cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,cplcVWmcVWmVWmVWm3Q,          & 
& cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZp3Q,cplcVWmVWmVZVZp2Q,& 
& cplcVWmVWmVZVZp1Q,cplcVWmVWmVZpVZp2Q,cplcVWmVWmVZpVZp3Q,cplcVWmVWmVZpVZp1Q,            & 
& AmpVertexIRoshhTocVWmVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhTocVWmVWm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,              & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcVWm,cplAhcHpmVWm,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplcChaChiVWmL,   & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWmL,          & 
& cplcFdFuVWmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvVWmL,cplcFeFvVWmR,cplcgWmgAVWm,           & 
& cplcgWpCgAcVWm,cplcgWmgWmhh,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgWpChh, & 
& cplcgAgWpCVWm,cplcgZgWpCVWm,cplcgZpgWpCVWm,cplcgZgZhh,cplcgZpgZhh,cplcgWmgZVWm,        & 
& cplcgWpCgZcVWm,cplcgZgZphh,cplcgZpgZphh,cplcgWmgZpVWm,cplcgWpCgZpcVWm,cplhhhhhh,       & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcVWmVP,cplHpmcVWmVZ,               & 
& cplHpmcVWmVZp,cplSdcSucVWm,cplSecSvcVWm,cplSucSdVWm,cplSvcSeVWm,cplcHpmVPVWm,          & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhcVWmVWm1,    & 
& cplhhhhcVWmVWm1,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVPVWm1,      & 
& cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa,cplSecSecVWmVWm1,& 
& cplSucSucVWmVWmaa,cplSvcSvcVWmVWm1,cplcVWmcVWmVWmVWm1Q,cplcVWmcVWmVWmVWm2Q,            & 
& cplcVWmcVWmVWmVWm3Q,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,cplcVWmVWmVZVZp3Q,& 
& cplcVWmVWmVZVZp2Q,cplcVWmVWmVZVZp1Q,cplcVWmVWmVZpVZp2Q,cplcVWmVWmVZpVZp3Q,             & 
& cplcVWmVWmVZpVZp1Q,AmpVertexIRoshhTocVWmVWm)

 End if 
 End if 
AmpVertexhhTocVWmVWm = AmpVertexhhTocVWmVWm -  AmpVertexIRdrhhTocVWmVWm! +  AmpVertexIRoshhTocVWmVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocVWmVWm=0._dp 
AmpVertexZhhTocVWmVWm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhTocVWmVWm(:,gt2) = AmpWaveZhhTocVWmVWm(:,gt2)+ZRUZH(gt2,gt1)*AmpWavehhTocVWmVWm(:,gt1) 
AmpVertexZhhTocVWmVWm(:,gt2)= AmpVertexZhhTocVWmVWm(:,gt2) + ZRUZH(gt2,gt1)*AmpVertexhhTocVWmVWm(:,gt1) 
 End Do 
End Do 
AmpWavehhTocVWmVWm=AmpWaveZhhTocVWmVWm 
AmpVertexhhTocVWmVWm= AmpVertexZhhTocVWmVWm
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocVWmVWm = AmpVertexhhTocVWmVWm  +  AmpVertexIRoshhTocVWmVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->conj[VWm] VWm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocVWmVWm = AmpTreehhTocVWmVWm 
 AmpSum2hhTocVWmVWm = AmpTreehhTocVWmVWm + 2._dp*AmpWavehhTocVWmVWm + 2._dp*AmpVertexhhTocVWmVWm  
Else 
 AmpSumhhTocVWmVWm = AmpTreehhTocVWmVWm + AmpWavehhTocVWmVWm + AmpVertexhhTocVWmVWm
 AmpSum2hhTocVWmVWm = AmpTreehhTocVWmVWm + AmpWavehhTocVWmVWm + AmpVertexhhTocVWmVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocVWmVWm = AmpTreehhTocVWmVWm
 AmpSum2hhTocVWmVWm = AmpTreehhTocVWmVWm 
End if 
Do gt1=1,6
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MVWmOS)+Abs(MVWmOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVWm)+Abs(MVWm))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1 
  AmpSum2hhTocVWmVWm = AmpTreehhTocVWmVWm
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVWmOS,MVWmOS,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVWm,MVWm,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocVWmVWm(gt1) 
  AmpSum2hhTocVWmVWm = 2._dp*AmpWavehhTocVWmVWm
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVWmOS,MVWmOS,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVWm,MVWm,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocVWmVWm(gt1) 
  AmpSum2hhTocVWmVWm = 2._dp*AmpVertexhhTocVWmVWm
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVWmOS,MVWmOS,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVWm,MVWm,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocVWmVWm(gt1) 
  AmpSum2hhTocVWmVWm = AmpTreehhTocVWmVWm + 2._dp*AmpWavehhTocVWmVWm + 2._dp*AmpVertexhhTocVWmVWm
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVWmOS,MVWmOS,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVWm,MVWm,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocVWmVWm(gt1) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocVWmVWm = AmpTreehhTocVWmVWm
  Call SquareAmp_StoVV(MhhOS(gt1),MVWmOS,MVWmOS,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
  AmpSqTreehhTocVWmVWm(gt1) = AmpSqhhTocVWmVWm(gt1)  
  AmpSum2hhTocVWmVWm = + 2._dp*AmpWavehhTocVWmVWm + 2._dp*AmpVertexhhTocVWmVWm
  Call SquareAmp_StoVV(MhhOS(gt1),MVWmOS,MVWmOS,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
  AmpSqhhTocVWmVWm(gt1) = AmpSqhhTocVWmVWm(gt1) + AmpSqTreehhTocVWmVWm(gt1)  
Else  
  AmpSum2hhTocVWmVWm = AmpTreehhTocVWmVWm
  Call SquareAmp_StoVV(Mhh(gt1),MVWm,MVWm,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
  AmpSqTreehhTocVWmVWm(gt1) = AmpSqhhTocVWmVWm(gt1)  
  AmpSum2hhTocVWmVWm = + 2._dp*AmpWavehhTocVWmVWm + 2._dp*AmpVertexhhTocVWmVWm
  Call SquareAmp_StoVV(Mhh(gt1),MVWm,MVWm,AmpSumhhTocVWmVWm(:,gt1),AmpSum2hhTocVWmVWm(:,gt1),AmpSqhhTocVWmVWm(gt1)) 
  AmpSqhhTocVWmVWm(gt1) = AmpSqhhTocVWmVWm(gt1) + AmpSqTreehhTocVWmVWm(gt1)  
End if  
Else  
  AmpSqhhTocVWmVWm(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTocVWmVWm(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS(gt1),MVWmOS,MVWmOS,helfactor*AmpSqhhTocVWmVWm(gt1))
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh(gt1),MVWm,MVWm,helfactor*AmpSqhhTocVWmVWm(gt1))
End if 
If ((Abs(MRPhhTocVWmVWm(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhTocVWmVWm(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocVWmVWm(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhTocVWmVWm(gt1)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPhhTocVWmVWm(gt1) + MRGhhTocVWmVWm(gt1)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPhhTocVWmVWm(gt1) + MRGhhTocVWmVWm(gt1))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! VZ VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_hhToVZVZ(cplhhVZVZ,Mhh,MVZ,Mhh2,MVZ2,AmpTreehhToVZVZ)

  Else 
Call Amplitude_Tree_sec_UMSSM_hhToVZVZ(ZcplhhVZVZ,Mhh,MVZ,Mhh2,MVZ2,AmpTreehhToVZVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_hhToVZVZ(MLambda,em,gs,cplhhVZVZ,MhhOS,MVZOS,               & 
& MRPhhToVZVZ,MRGhhToVZVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_hhToVZVZ(MLambda,em,gs,ZcplhhVZVZ,MhhOS,MVZOS,              & 
& MRPhhToVZVZ,MRGhhToVZVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_hhToVZVZ(MLambda,em,gs,cplhhVZVZ,Mhh,MVZ,MRPhhToVZVZ,       & 
& MRGhhToVZVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_hhToVZVZ(MLambda,em,gs,ZcplhhVZVZ,Mhh,MVZ,MRPhhToVZVZ,      & 
& MRGhhToVZVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhToVZVZ(cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,              & 
& ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,Mhh,Mhh2,MVZ,MVZ2,Zfhh,ZfVZ,ZfVZpVZ,            & 
& ZfVZVZp,AmpWavehhToVZVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhToVZVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVZ,cplAhhhVZp,        & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,               & 
& cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,    & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,      & 
& cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplhhhhVZVZ1,             & 
& cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,          & 
& cplSecSeVZVZ1,cplSucSuVZVZaa,cplSvcSvVZVZ1,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,          & 
& cplcVWmVWmVZVZ1Q,AmpVertexhhToVZVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToVZVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVZ,cplAhhhVZp,        & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,               & 
& cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,    & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,      & 
& cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplhhhhVZVZ1,             & 
& cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,          & 
& cplSecSeVZVZ1,cplSucSuVZVZaa,cplSvcSvVZVZ1,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,          & 
& cplcVWmVWmVZVZ1Q,AmpVertexIRdrhhToVZVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToVZVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,     & 
& cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,              & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmhh,              & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,        & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,ZcplhhVZVZ,      & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,     & 
& cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplhhhhVZVZ1,cplhhhhVZVZp1,          & 
& cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,cplSecSeVZVZ1,          & 
& cplSucSuVZVZaa,cplSvcSvVZVZ1,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,       & 
& AmpVertexIRoshhToVZVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToVZVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVZ,cplAhhhVZp,        & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,               & 
& cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,    & 
& ZcplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,     & 
& cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplhhhhVZVZ1,             & 
& cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,          & 
& cplSecSeVZVZ1,cplSucSuVZVZaa,cplSvcSvVZVZ1,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,          & 
& cplcVWmVWmVZVZ1Q,AmpVertexIRoshhToVZVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToVZVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVZ,cplAhhhVZp,cplcChaChahhL,     & 
& cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,      & 
& cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,              & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmhh,              & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,        & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,     & 
& cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplhhhhVZVZ1,cplhhhhVZVZp1,          & 
& cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,cplSecSeVZVZ1,          & 
& cplSucSuVZVZaa,cplSvcSvVZVZ1,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,cplcVWmVWmVZVZ1Q,       & 
& AmpVertexIRoshhToVZVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToVZVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVZ,cplAhhhVZp,        & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,               & 
& cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,    & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,      & 
& cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplhhhhVZVZ1,             & 
& cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,          & 
& cplSecSeVZVZ1,cplSucSuVZVZaa,cplSvcSvVZVZ1,cplcVWmVWmVZVZ2Q,cplcVWmVWmVZVZ3Q,          & 
& cplcVWmVWmVZVZ1Q,AmpVertexIRoshhToVZVZ)

 End if 
 End if 
AmpVertexhhToVZVZ = AmpVertexhhToVZVZ -  AmpVertexIRdrhhToVZVZ! +  AmpVertexIRoshhToVZVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToVZVZ=0._dp 
AmpVertexZhhToVZVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhToVZVZ(:,gt2) = AmpWaveZhhToVZVZ(:,gt2)+ZRUZH(gt2,gt1)*AmpWavehhToVZVZ(:,gt1) 
AmpVertexZhhToVZVZ(:,gt2)= AmpVertexZhhToVZVZ(:,gt2) + ZRUZH(gt2,gt1)*AmpVertexhhToVZVZ(:,gt1) 
 End Do 
End Do 
AmpWavehhToVZVZ=AmpWaveZhhToVZVZ 
AmpVertexhhToVZVZ= AmpVertexZhhToVZVZ
End if
If (ShiftIRdiv) Then 
AmpVertexhhToVZVZ = AmpVertexhhToVZVZ  +  AmpVertexIRoshhToVZVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VZ VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToVZVZ = AmpTreehhToVZVZ 
 AmpSum2hhToVZVZ = AmpTreehhToVZVZ + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ  
Else 
 AmpSumhhToVZVZ = AmpTreehhToVZVZ + AmpWavehhToVZVZ + AmpVertexhhToVZVZ
 AmpSum2hhToVZVZ = AmpTreehhToVZVZ + AmpWavehhToVZVZ + AmpVertexhhToVZVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVZVZ = AmpTreehhToVZVZ
 AmpSum2hhToVZVZ = AmpTreehhToVZVZ 
End if 
Do gt1=1,6
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MVZOS)+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVZ)+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1 
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToVZVZ(gt1) 
  AmpSum2hhToVZVZ = 2._dp*AmpWavehhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToVZVZ(gt1) 
  AmpSum2hhToVZVZ = 2._dp*AmpVertexhhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToVZVZ(gt1) 
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToVZVZ(gt1) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
  AmpSqTreehhToVZVZ(gt1) = AmpSqhhToVZVZ(gt1)  
  AmpSum2hhToVZVZ = + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
  AmpSqhhToVZVZ(gt1) = AmpSqhhToVZVZ(gt1) + AmpSqTreehhToVZVZ(gt1)  
Else  
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
  AmpSqTreehhToVZVZ(gt1) = AmpSqhhToVZVZ(gt1)  
  AmpSum2hhToVZVZ = + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
  AmpSqhhToVZVZ(gt1) = AmpSqhhToVZVZ(gt1) + AmpSqTreehhToVZVZ(gt1)  
End if  
Else  
  AmpSqhhToVZVZ(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVZVZ(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MVZOS,MVZOS,helfactor*AmpSqhhToVZVZ(gt1))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MVZ,MVZ,helfactor*AmpSqhhToVZVZ(gt1))
End if 
If ((Abs(MRPhhToVZVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZVZ(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToVZVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZVZ(gt1)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPhhToVZVZ(gt1) + MRGhhToVZVZ(gt1)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPhhToVZVZ(gt1) + MRGhhToVZVZ(gt1))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! VZp VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_hhToVZpVZ(cplhhVZVZp,Mhh,MVZ,MVZp,Mhh2,MVZ2,            & 
& MVZp2,AmpTreehhToVZpVZ)

  Else 
Call Amplitude_Tree_sec_UMSSM_hhToVZpVZ(ZcplhhVZVZp,Mhh,MVZ,MVZp,Mhh2,MVZ2,           & 
& MVZp2,AmpTreehhToVZpVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_hhToVZpVZ(MLambda,em,gs,cplhhVZVZp,MhhOS,MVZOS,             & 
& MVZpOS,MRPhhToVZpVZ,MRGhhToVZpVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_hhToVZpVZ(MLambda,em,gs,ZcplhhVZVZp,MhhOS,MVZOS,            & 
& MVZpOS,MRPhhToVZpVZ,MRGhhToVZpVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_hhToVZpVZ(MLambda,em,gs,cplhhVZVZp,Mhh,MVZ,MVZp,            & 
& MRPhhToVZpVZ,MRGhhToVZpVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_hhToVZpVZ(MLambda,em,gs,ZcplhhVZVZp,Mhh,MVZ,MVZp,           & 
& MRPhhToVZpVZ,MRGhhToVZpVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhToVZpVZ(cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,             & 
& ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,Zfhh,              & 
& ZfVZ,ZfVZp,ZfVZpVZ,AmpWavehhToVZpVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhToVZpVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVZ,cplAhhhVZp,        & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,             & 
& cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp, & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,               & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,cplSecSeVZ,            & 
& cplSecSeVZp,cplSucSuVZ,cplSucSuVZp,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVWmVZ,cplcVWmVWmVZ,   & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,   & 
& cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,cplHpmcHpmVZVZp1,    & 
& cplSdcSdVZVZpaa,cplSecSeVZVZp1,cplSucSuVZVZpaa,cplSvcSvVZVZp1,cplcVWmVWmVZVZp3Q,       & 
& cplcVWmVWmVZVZp2Q,cplcVWmVWmVZVZp1Q,AmpVertexhhToVZpVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToVZpVZ(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVZ,              & 
& cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,     & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,      & 
& cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,            & 
& cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,             & 
& cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,             & 
& cplcFuFuVZpR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,             & 
& cplcFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZ,    & 
& cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,             & 
& cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,      & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,          & 
& cplSecSeVZ,cplSecSeVZp,cplSucSuVZ,cplSucSuVZp,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVWmVZ,     & 
& cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,     & 
& cplhhhhVZpVZp1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,      & 
& cplHpmcHpmVZVZp1,cplSdcSdVZVZpaa,cplSecSeVZVZp1,cplSucSuVZVZpaa,cplSvcSvVZVZp1,        & 
& cplcVWmVWmVZVZp3Q,cplcVWmVWmVZVZp2Q,cplcVWmVWmVZVZp1Q,AmpVertexIRdrhhToVZpVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToVZpVZ(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,            & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVZ,cplAhhhVZp,            & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,             & 
& cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp, & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,ZcplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,              & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,cplSecSeVZ,            & 
& cplSecSeVZp,cplSucSuVZ,cplSucSuVZp,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVWmVZ,cplcVWmVWmVZ,   & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,   & 
& cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,cplHpmcHpmVZVZp1,    & 
& cplSdcSdVZVZpaa,cplSecSeVZVZp1,cplSucSuVZVZpaa,cplSvcSvVZVZp1,cplcVWmVWmVZVZp3Q,       & 
& cplcVWmVWmVZVZp2Q,cplcVWmVWmVZVZp1Q,AmpVertexIRoshhToVZpVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToVZpVZ(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVZ,              & 
& cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,     & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,      & 
& cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,            & 
& cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,             & 
& cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,             & 
& cplcFuFuVZpR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,             & 
& cplcFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZ,    & 
& cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,             & 
& cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,ZcplhhVZVZp,cplhhVZpVZp,     & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,          & 
& cplSecSeVZ,cplSecSeVZp,cplSucSuVZ,cplSucSuVZp,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVWmVZ,     & 
& cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,     & 
& cplhhhhVZpVZp1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,      & 
& cplHpmcHpmVZVZp1,cplSdcSdVZVZpaa,cplSecSeVZVZp1,cplSucSuVZVZpaa,cplSvcSvVZVZp1,        & 
& cplcVWmVWmVZVZp3Q,cplcVWmVWmVZVZp2Q,cplcVWmVWmVZVZp1Q,AmpVertexIRoshhToVZpVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToVZpVZ(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,            & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVZ,cplAhhhVZp,            & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,             & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,             & 
& cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp, & 
& cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,       & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,               & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,cplSecSeVZ,            & 
& cplSecSeVZp,cplSucSuVZ,cplSucSuVZp,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVWmVZ,cplcVWmVWmVZ,   & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhhhVZpVZp1,   & 
& cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,cplHpmcHpmVZVZp1,    & 
& cplSdcSdVZVZpaa,cplSecSeVZVZp1,cplSucSuVZVZpaa,cplSvcSvVZVZp1,cplcVWmVWmVZVZp3Q,       & 
& cplcVWmVWmVZVZp2Q,cplcVWmVWmVZVZp1Q,AmpVertexIRoshhToVZpVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToVZpVZ(MAh,MCha,MChi,MFd,MFe,MFu,               & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVZ,              & 
& cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,     & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,      & 
& cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,            & 
& cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,             & 
& cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,             & 
& cplcFuFuVZpR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,             & 
& cplcFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZ,    & 
& cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,             & 
& cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,      & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,          & 
& cplSecSeVZ,cplSecSeVZp,cplSucSuVZ,cplSucSuVZp,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVWmVZ,     & 
& cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,     & 
& cplhhhhVZpVZp1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,      & 
& cplHpmcHpmVZVZp1,cplSdcSdVZVZpaa,cplSecSeVZVZp1,cplSucSuVZVZpaa,cplSvcSvVZVZp1,        & 
& cplcVWmVWmVZVZp3Q,cplcVWmVWmVZVZp2Q,cplcVWmVWmVZVZp1Q,AmpVertexIRoshhToVZpVZ)

 End if 
 End if 
AmpVertexhhToVZpVZ = AmpVertexhhToVZpVZ -  AmpVertexIRdrhhToVZpVZ! +  AmpVertexIRoshhToVZpVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToVZpVZ=0._dp 
AmpVertexZhhToVZpVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhToVZpVZ(:,gt2) = AmpWaveZhhToVZpVZ(:,gt2)+ZRUZH(gt2,gt1)*AmpWavehhToVZpVZ(:,gt1) 
AmpVertexZhhToVZpVZ(:,gt2)= AmpVertexZhhToVZpVZ(:,gt2) + ZRUZH(gt2,gt1)*AmpVertexhhToVZpVZ(:,gt1) 
 End Do 
End Do 
AmpWavehhToVZpVZ=AmpWaveZhhToVZpVZ 
AmpVertexhhToVZpVZ= AmpVertexZhhToVZpVZ
End if
If (ShiftIRdiv) Then 
AmpVertexhhToVZpVZ = AmpVertexhhToVZpVZ  +  AmpVertexIRoshhToVZpVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VZp VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToVZpVZ = AmpTreehhToVZpVZ 
 AmpSum2hhToVZpVZ = AmpTreehhToVZpVZ + 2._dp*AmpWavehhToVZpVZ + 2._dp*AmpVertexhhToVZpVZ  
Else 
 AmpSumhhToVZpVZ = AmpTreehhToVZpVZ + AmpWavehhToVZpVZ + AmpVertexhhToVZpVZ
 AmpSum2hhToVZpVZ = AmpTreehhToVZpVZ + AmpWavehhToVZpVZ + AmpVertexhhToVZpVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVZpVZ = AmpTreehhToVZpVZ
 AmpSum2hhToVZpVZ = AmpTreehhToVZpVZ 
End if 
Do gt1=1,6
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MVZpOS)+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVZp)+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1 
  AmpSum2hhToVZpVZ = AmpTreehhToVZpVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZOS,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZ,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToVZpVZ(gt1) 
  AmpSum2hhToVZpVZ = 2._dp*AmpWavehhToVZpVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZOS,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZ,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToVZpVZ(gt1) 
  AmpSum2hhToVZpVZ = 2._dp*AmpVertexhhToVZpVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZOS,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZ,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToVZpVZ(gt1) 
  AmpSum2hhToVZpVZ = AmpTreehhToVZpVZ + 2._dp*AmpWavehhToVZpVZ + 2._dp*AmpVertexhhToVZpVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZOS,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZ,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToVZpVZ(gt1) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToVZpVZ = AmpTreehhToVZpVZ
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZOS,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
  AmpSqTreehhToVZpVZ(gt1) = AmpSqhhToVZpVZ(gt1)  
  AmpSum2hhToVZpVZ = + 2._dp*AmpWavehhToVZpVZ + 2._dp*AmpVertexhhToVZpVZ
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZOS,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
  AmpSqhhToVZpVZ(gt1) = AmpSqhhToVZpVZ(gt1) + AmpSqTreehhToVZpVZ(gt1)  
Else  
  AmpSum2hhToVZpVZ = AmpTreehhToVZpVZ
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZ,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
  AmpSqTreehhToVZpVZ(gt1) = AmpSqhhToVZpVZ(gt1)  
  AmpSum2hhToVZpVZ = + 2._dp*AmpWavehhToVZpVZ + 2._dp*AmpVertexhhToVZpVZ
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZ,AmpSumhhToVZpVZ(:,gt1),AmpSum2hhToVZpVZ(:,gt1),AmpSqhhToVZpVZ(gt1)) 
  AmpSqhhToVZpVZ(gt1) = AmpSqhhToVZpVZ(gt1) + AmpSqTreehhToVZpVZ(gt1)  
End if  
Else  
  AmpSqhhToVZpVZ(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVZpVZ(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS(gt1),MVZpOS,MVZOS,helfactor*AmpSqhhToVZpVZ(gt1))
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh(gt1),MVZp,MVZ,helfactor*AmpSqhhToVZpVZ(gt1))
End if 
If ((Abs(MRPhhToVZpVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZpVZ(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToVZpVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZpVZ(gt1)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPhhToVZpVZ(gt1) + MRGhhToVZpVZ(gt1)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPhhToVZpVZ(gt1) + MRGhhToVZpVZ(gt1))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

If (gt1.eq.6) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! VZp VZp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_hhToVZpVZp(cplhhVZpVZp,Mhh,MVZp,Mhh2,MVZp2,             & 
& AmpTreehhToVZpVZp)

  Else 
Call Amplitude_Tree_sec_UMSSM_hhToVZpVZp(ZcplhhVZpVZp,Mhh,MVZp,Mhh2,MVZp2,            & 
& AmpTreehhToVZpVZp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_hhToVZpVZp(MLambda,em,gs,cplhhVZpVZp,MhhOS,MVZpOS,          & 
& MRPhhToVZpVZp,MRGhhToVZpVZp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_hhToVZpVZp(MLambda,em,gs,ZcplhhVZpVZp,MhhOS,MVZpOS,         & 
& MRPhhToVZpVZp,MRGhhToVZpVZp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_hhToVZpVZp(MLambda,em,gs,cplhhVZpVZp,Mhh,MVZp,              & 
& MRPhhToVZpVZp,MRGhhToVZpVZp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_hhToVZpVZp(MLambda,em,gs,ZcplhhVZpVZp,Mhh,MVZp,             & 
& MRPhhToVZpVZp,MRGhhToVZpVZp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhToVZpVZp(cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,            & 
& ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,Zfhh,              & 
& ZfVZp,ZfVZpVZ,ZfVZVZp,AmpWavehhToVZpVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhToVZpVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVZ,cplAhhhVZp,        & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,   & 
& cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZpL,cplcFvFvVZpR,           & 
& cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,      & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,    & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,              & 
& cplSecSeVZp,cplSucSuVZp,cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZpVZp1,        & 
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,cplHpmcHpmVZpVZp1,      & 
& cplSdcSdVZpVZpaa,cplSecSeVZpVZp1,cplSucSuVZpVZpaa,cplSvcSvVZpVZp1,cplcVWmVWmVZpVZp2Q,  & 
& cplcVWmVWmVZpVZp3Q,cplcVWmVWmVZpVZp1Q,AmpVertexhhToVZpVZp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToVZpVZp(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVZ,              & 
& cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,     & 
& cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,         & 
& cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZpL,            & 
& cplcFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplhhhhhh,      & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,           & 
& cplAhAhVZpVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,         & 
& cplHpmcHpmVZpVZp1,cplSdcSdVZpVZpaa,cplSecSeVZpVZp1,cplSucSuVZpVZpaa,cplSvcSvVZpVZp1,   & 
& cplcVWmVWmVZpVZp2Q,cplcVWmVWmVZpVZp3Q,cplcVWmVWmVZpVZp1Q,AmpVertexIRdrhhToVZpVZp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToVZpVZp(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,            & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVZ,cplAhhhVZp,            & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,   & 
& cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZpL,cplcFvFvVZpR,           & 
& cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,      & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,    & 
& cplhhVZVZ,cplhhVZVZp,ZcplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,             & 
& cplSecSeVZp,cplSucSuVZp,cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZpVZp1,        & 
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,cplHpmcHpmVZpVZp1,      & 
& cplSdcSdVZpVZpaa,cplSecSeVZpVZp1,cplSucSuVZpVZpaa,cplSvcSvVZpVZp1,cplcVWmVWmVZpVZp2Q,  & 
& cplcVWmVWmVZpVZp3Q,cplcVWmVWmVZpVZp1Q,AmpVertexIRoshhToVZpVZp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToVZpVZp(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVZ,              & 
& cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,     & 
& cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,         & 
& cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZpL,            & 
& cplcFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplhhhhhh,      & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,ZcplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,            & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,           & 
& cplAhAhVZpVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,         & 
& cplHpmcHpmVZpVZp1,cplSdcSdVZpVZpaa,cplSecSeVZpVZp1,cplSucSuVZpVZpaa,cplSvcSvVZpVZp1,   & 
& cplcVWmVWmVZpVZp2Q,cplcVWmVWmVZpVZp3Q,cplcVWmVWmVZpVZp1Q,AmpVertexIRoshhToVZpVZp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToVZpVZp(MAhOS,MChaOS,MChiOS,MFdOS,              & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,            & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhVZ,cplAhhhVZp,            & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,   & 
& cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZpL,cplcFvFvVZpR,           & 
& cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,      & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,    & 
& cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,              & 
& cplSecSeVZp,cplSucSuVZp,cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZpVZp1,        & 
& cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,cplHpmcHpmVZpVZp1,      & 
& cplSdcSdVZpVZpaa,cplSecSeVZpVZp1,cplSucSuVZpVZpaa,cplSvcSvVZpVZp1,cplcVWmVWmVZpVZp2Q,  & 
& cplcVWmVWmVZpVZp3Q,cplcVWmVWmVZpVZp1Q,AmpVertexIRoshhToVZpVZp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_hhToVZpVZp(MAh,MCha,MChi,MFd,MFe,MFu,              & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhVZ,              & 
& cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,     & 
& cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,         & 
& cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZpL,            & 
& cplcFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplhhhhhh,      & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,           & 
& cplAhAhVZpVZp1,cplhhhhVZVZp1,cplhhhhVZpVZp1,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1,         & 
& cplHpmcHpmVZpVZp1,cplSdcSdVZpVZpaa,cplSecSeVZpVZp1,cplSucSuVZpVZpaa,cplSvcSvVZpVZp1,   & 
& cplcVWmVWmVZpVZp2Q,cplcVWmVWmVZpVZp3Q,cplcVWmVWmVZpVZp1Q,AmpVertexIRoshhToVZpVZp)

 End if 
 End if 
AmpVertexhhToVZpVZp = AmpVertexhhToVZpVZp -  AmpVertexIRdrhhToVZpVZp! +  AmpVertexIRoshhToVZpVZp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToVZpVZp=0._dp 
AmpVertexZhhToVZpVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZhhToVZpVZp(:,gt2) = AmpWaveZhhToVZpVZp(:,gt2)+ZRUZH(gt2,gt1)*AmpWavehhToVZpVZp(:,gt1) 
AmpVertexZhhToVZpVZp(:,gt2)= AmpVertexZhhToVZpVZp(:,gt2) + ZRUZH(gt2,gt1)*AmpVertexhhToVZpVZp(:,gt1) 
 End Do 
End Do 
AmpWavehhToVZpVZp=AmpWaveZhhToVZpVZp 
AmpVertexhhToVZpVZp= AmpVertexZhhToVZpVZp
End if
If (ShiftIRdiv) Then 
AmpVertexhhToVZpVZp = AmpVertexhhToVZpVZp  +  AmpVertexIRoshhToVZpVZp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VZp VZp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToVZpVZp = AmpTreehhToVZpVZp 
 AmpSum2hhToVZpVZp = AmpTreehhToVZpVZp + 2._dp*AmpWavehhToVZpVZp + 2._dp*AmpVertexhhToVZpVZp  
Else 
 AmpSumhhToVZpVZp = AmpTreehhToVZpVZp + AmpWavehhToVZpVZp + AmpVertexhhToVZpVZp
 AmpSum2hhToVZpVZp = AmpTreehhToVZpVZp + AmpWavehhToVZpVZp + AmpVertexhhToVZpVZp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVZpVZp = AmpTreehhToVZpVZp
 AmpSum2hhToVZpVZp = AmpTreehhToVZpVZp 
End if 
Do gt1=1,6
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MVZpOS)+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVZp)+Abs(MVZp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1 
  AmpSum2hhToVZpVZp = AmpTreehhToVZpVZp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZpOS,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZp,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToVZpVZp(gt1) 
  AmpSum2hhToVZpVZp = 2._dp*AmpWavehhToVZpVZp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZpOS,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZp,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToVZpVZp(gt1) 
  AmpSum2hhToVZpVZp = 2._dp*AmpVertexhhToVZpVZp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZpOS,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZp,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToVZpVZp(gt1) 
  AmpSum2hhToVZpVZp = AmpTreehhToVZpVZp + 2._dp*AmpWavehhToVZpVZp + 2._dp*AmpVertexhhToVZpVZp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZpOS,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZp,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToVZpVZp(gt1) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToVZpVZp = AmpTreehhToVZpVZp
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZpOS,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
  AmpSqTreehhToVZpVZp(gt1) = AmpSqhhToVZpVZp(gt1)  
  AmpSum2hhToVZpVZp = + 2._dp*AmpWavehhToVZpVZp + 2._dp*AmpVertexhhToVZpVZp
  Call SquareAmp_StoVV(MhhOS(gt1),MVZpOS,MVZpOS,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
  AmpSqhhToVZpVZp(gt1) = AmpSqhhToVZpVZp(gt1) + AmpSqTreehhToVZpVZp(gt1)  
Else  
  AmpSum2hhToVZpVZp = AmpTreehhToVZpVZp
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZp,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
  AmpSqTreehhToVZpVZp(gt1) = AmpSqhhToVZpVZp(gt1)  
  AmpSum2hhToVZpVZp = + 2._dp*AmpWavehhToVZpVZp + 2._dp*AmpVertexhhToVZpVZp
  Call SquareAmp_StoVV(Mhh(gt1),MVZp,MVZp,AmpSumhhToVZpVZp(:,gt1),AmpSum2hhToVZpVZp(:,gt1),AmpSqhhToVZpVZp(gt1)) 
  AmpSqhhToVZpVZp(gt1) = AmpSqhhToVZpVZp(gt1) + AmpSqTreehhToVZpVZp(gt1)  
End if  
Else  
  AmpSqhhToVZpVZp(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVZpVZp(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MVZpOS,MVZpOS,helfactor*AmpSqhhToVZpVZp(gt1))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MVZp,MVZp,helfactor*AmpSqhhToVZpVZp(gt1))
End if 
If ((Abs(MRPhhToVZpVZp(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZpVZp(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToVZpVZp(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZpVZp(gt1)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPhhToVZpVZp(gt1) + MRGhhToVZpVZp(gt1)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPhhToVZpVZp(gt1) + MRGhhToVZpVZp(gt1))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

If (gt1.eq.6) isave = i4 
End do
End If 
!---------------- 
! Ah VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_sec_UMSSM_hhToAhVP(cplAhhhVZ,cplAhhhVZp,ctcplAhhhVZ,              & 
& ctcplAhhhVZp,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfAh,Zfhh,ZfVP,           & 
& ZfVZpVP,ZfVZVP,AmpWavehhToAhVP)

 Else 
Call Amplitude_WAVE_sec_UMSSM_hhToAhVP(cplAhhhVZ,cplAhhhVZp,ctcplAhhhVZ,              & 
& ctcplAhhhVZp,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfAh,Zfhh,ZfVP,           & 
& ZfVZpVP,ZfVZVP,AmpWavehhToAhVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_hhToAhVP(MAhOS,MChaOS,MFdOS,MFeOS,MFuOS,              & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MAh2OS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,         & 
& Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,          & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,           & 
& cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,cplhhHpmcVWm,     & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,               & 
& cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,               & 
& cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,AmpVertexhhToAhVP)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_hhToAhVP(MAhOS,MChaOS,MFdOS,MFeOS,MFuOS,              & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MAh2OS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,         & 
& Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,          & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,           & 
& cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,cplhhHpmcVWm,     & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,               & 
& cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,               & 
& cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,AmpVertexhhToAhVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_hhToAhVP(cplAhhhVZ,cplAhhhVZp,ctcplAhhhVZ,              & 
& ctcplAhhhVZp,MAh,MAh2,Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,ZfAh,Zfhh,ZfVP,ZfVZpVP,               & 
& ZfVZVP,AmpWavehhToAhVP)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhToAhVP(MAh,MCha,MFd,MFe,MFu,Mhh,MHpm,               & 
& MSd,MSe,MSu,MVP,MVWm,MAh2,MCha2,MFd2,MFe2,MFu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,              & 
& MVP2,MVWm2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,          & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhcHpmVWm,cplcChaChahhL,              & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,         & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,          & 
& cplcgWpCgWpCVP,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,             & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,             & 
& cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,cplhhHpmcVWmVP1,  & 
& cplhhcHpmVPVWm1,AmpVertexhhToAhVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Ah VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToAhVP = 0._dp 
 AmpSum2hhToAhVP = 0._dp  
Else 
 AmpSumhhToAhVP = AmpVertexhhToAhVP + AmpWavehhToAhVP
 AmpSum2hhToAhVP = AmpVertexhhToAhVP + AmpWavehhToAhVP 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=3,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MAhOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MAh(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MAhOS(gt2),0._dp,AmpSumhhToAhVP(:,gt1, gt2),AmpSum2hhToAhVP(:,gt1, gt2),AmpSqhhToAhVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MAh(gt2),MVP,AmpSumhhToAhVP(:,gt1, gt2),AmpSum2hhToAhVP(:,gt1, gt2),AmpSqhhToAhVP(gt1, gt2)) 
End if  
Else  
  AmpSqhhToAhVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToAhVP(gt1, gt2).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MAhOS(gt2),0._dp,helfactor*AmpSqhhToAhVP(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MAh(gt2),MVP,helfactor*AmpSqhhToAhVP(gt1, gt2))
End if 
If ((Abs(MRPhhToAhVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhToAhVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
!---------------- 
! Glu Glu
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_hhToGluGlu(MFdOS,MFuOS,MGluOS,MhhOS,MSdOS,            & 
& MSuOS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MSd2OS,MSu2OS,cplGluFdcSdL,cplGluFdcSdR,            & 
& cplcFdFdhhL,cplcFdFdhhR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplhhSucSu,             & 
& AmpVertexhhToGluGlu)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_hhToGluGlu(MFdOS,MFuOS,MGluOS,MhhOS,MSdOS,            & 
& MSuOS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MSd2OS,MSu2OS,cplGluFdcSdL,cplGluFdcSdR,            & 
& cplcFdFdhhL,cplcFdFdhhR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplhhSucSu,             & 
& AmpVertexhhToGluGlu)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhToGluGlu(MFd,MFu,MGlu,Mhh,MSd,MSu,MFd2,             & 
& MFu2,MGlu2,Mhh2,MSd2,MSu2,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdGluSdL,cplcFdGluSdR,           & 
& cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,cplhhSucSu,AmpVertexhhToGluGlu)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Glu Glu -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToGluGlu = 0._dp 
 AmpSum2hhToGluGlu = 0._dp  
Else 
 AmpSumhhToGluGlu = AmpVertexhhToGluGlu + AmpWavehhToGluGlu
 AmpSum2hhToGluGlu = AmpVertexhhToGluGlu + AmpWavehhToGluGlu 
End If 
Do gt1=1,6
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MGluOS)+Abs(MGluOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MGlu)+Abs(MGlu))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MGluOS,MGluOS,AmpSumhhToGluGlu(:,gt1),AmpSum2hhToGluGlu(:,gt1),AmpSqhhToGluGlu(gt1)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MGlu,MGlu,AmpSumhhToGluGlu(:,gt1),AmpSum2hhToGluGlu(:,gt1),AmpSqhhToGluGlu(gt1)) 
End if  
Else  
  AmpSqhhToGluGlu(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhToGluGlu(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 4._dp*GammaTPS(MhhOS(gt1),MGluOS,MGluOS,helfactor*AmpSqhhToGluGlu(gt1))
Else 
  gP1Lhh(gt1,i4) = 4._dp*GammaTPS(Mhh(gt1),MGlu,MGlu,helfactor*AmpSqhhToGluGlu(gt1))
End if 
If ((Abs(MRPhhToGluGlu(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToGluGlu(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.6) isave = i4 
End do
!---------------- 
! hh VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_hhTohhVP(MChaOS,MFdOS,MFeOS,MFuOS,MhhOS,              & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,               & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,   & 
& cplcChaChaVPR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,      & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,               & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,               & 
& cplcVWmVPVWm,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,AmpVertexhhTohhVP)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_hhTohhVP(MChaOS,MFdOS,MFeOS,MFuOS,MhhOS,              & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,               & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,   & 
& cplcChaChaVPR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,      & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,               & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,               & 
& cplcVWmVPVWm,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,AmpVertexhhTohhVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhTohhVP(MCha,MFd,MFe,MFu,Mhh,MHpm,MSd,               & 
& MSe,MSu,MVP,MVWm,MCha2,MFd2,MFe2,MFu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MVP2,MVWm2,            & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,             & 
& cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,         & 
& cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,             & 
& cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,       & 
& AmpVertexhhTohhVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhVP = 0._dp 
 AmpSum2hhTohhVP = 0._dp  
Else 
 AmpSumhhTohhVP = AmpVertexhhTohhVP + AmpWavehhTohhVP
 AmpSum2hhTohhVP = AmpVertexhhTohhVP + AmpWavehhTohhVP 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(Mhh(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MhhOS(gt2),0._dp,AmpSumhhTohhVP(:,gt1, gt2),AmpSum2hhTohhVP(:,gt1, gt2),AmpSqhhTohhVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),Mhh(gt2),MVP,AmpSumhhTohhVP(:,gt1, gt2),AmpSum2hhTohhVP(:,gt1, gt2),AmpSqhhTohhVP(gt1, gt2)) 
End if  
Else  
  AmpSqhhTohhVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTohhVP(gt1, gt2).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MhhOS(gt2),0._dp,helfactor*AmpSqhhTohhVP(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),Mhh(gt2),MVP,helfactor*AmpSqhhTohhVP(gt1, gt2))
End if 
If ((Abs(MRPhhTohhVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
!---------------- 
! hh VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_hhTohhVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,             & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,         & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,               & 
& cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,    & 
& cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,       & 
& cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexhhTohhVZ)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_hhTohhVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,             & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,         & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,               & 
& cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,    & 
& cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,       & 
& cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexhhTohhVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhTohhVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,         & 
& cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZL,cplcChaChaVZR,cplChiChihhL,       & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,            & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,               & 
& cplcFvFvVZR,cplcgWmgWmhh,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVZ,cplhhhhhh,         & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,     & 
& cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,       & 
& AmpVertexhhTohhVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhVZ = 0._dp 
 AmpSum2hhTohhVZ = 0._dp  
Else 
 AmpSumhhTohhVZ = AmpVertexhhTohhVZ + AmpWavehhTohhVZ
 AmpSum2hhTohhVZ = AmpVertexhhTohhVZ + AmpWavehhTohhVZ 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(Mhh(gt2))+Abs(MVZ))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MhhOS(gt2),MVZOS,AmpSumhhTohhVZ(:,gt1, gt2),AmpSum2hhTohhVZ(:,gt1, gt2),AmpSqhhTohhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),Mhh(gt2),MVZ,AmpSumhhTohhVZ(:,gt1, gt2),AmpSum2hhTohhVZ(:,gt1, gt2),AmpSqhhTohhVZ(gt1, gt2)) 
End if  
Else  
  AmpSqhhTohhVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTohhVZ(gt1, gt2).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MhhOS(gt2),MVZOS,helfactor*AmpSqhhTohhVZ(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),Mhh(gt2),MVZ,helfactor*AmpSqhhTohhVZ(gt1, gt2))
End if 
If ((Abs(MRPhhTohhVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
!---------------- 
! hh VZp
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_hhTohhVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,         & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,   & 
& cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZpL,cplcFvFvVZpR,           & 
& cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,      & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,    & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,            & 
& cplSucSuVZp,cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1, & 
& AmpVertexhhTohhVZp)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_hhTohhVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,         & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,   & 
& cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,cplcFdFdVZpR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZpL,cplcFvFvVZpR,           & 
& cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplhhhhhh,cplhhHpmcHpm,      & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,    & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,            & 
& cplSucSuVZp,cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplhhHpmcVWmVZp1,cplhhcHpmVWmVZp1, & 
& AmpVertexhhTohhVZp)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhTohhVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,         & 
& cplAhhhVZp,cplcChaChahhL,cplcChaChahhR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChihhL,     & 
& cplChiChihhR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZpL,         & 
& cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZpL,            & 
& cplcFvFvVZpR,cplcgWmgWmhh,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVZp,cplhhhhhh,      & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,           & 
& cplSecSeVZp,cplSucSuVZp,cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplhhHpmcVWmVZp1,      & 
& cplhhcHpmVWmVZp1,AmpVertexhhTohhVZp)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh VZp -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhVZp = 0._dp 
 AmpSum2hhTohhVZp = 0._dp  
Else 
 AmpSumhhTohhVZp = AmpVertexhhTohhVZp + AmpWavehhTohhVZp
 AmpSum2hhTohhVZp = AmpVertexhhTohhVZp + AmpWavehhTohhVZp 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(Mhh(gt2))+Abs(MVZp))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MhhOS(gt2),MVZpOS,AmpSumhhTohhVZp(:,gt1, gt2),AmpSum2hhTohhVZp(:,gt1, gt2),AmpSqhhTohhVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),Mhh(gt2),MVZp,AmpSumhhTohhVZp(:,gt1, gt2),AmpSum2hhTohhVZp(:,gt1, gt2),AmpSqhhTohhVZp(gt1, gt2)) 
End if  
Else  
  AmpSqhhTohhVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTohhVZp(gt1, gt2).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MhhOS(gt2),MVZpOS,helfactor*AmpSqhhTohhVZp(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),Mhh(gt2),MVZp,helfactor*AmpSqhhTohhVZp(gt1, gt2))
End if 
If ((Abs(MRPhhTohhVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
!---------------- 
! VG VG
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_hhToVGVG(MFdOS,MFuOS,MhhOS,MSdOS,MSuOS,               & 
& MVG,MFd2OS,MFu2OS,Mhh2OS,MSd2OS,MSu2OS,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,       & 
& cplcFdFdVGR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplhhSdcSd,cplhhSucSu,     & 
& cplSdcSdVG,cplSucSuVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& AmpVertexhhToVGVG)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_hhToVGVG(MFdOS,MFuOS,MhhOS,MSdOS,MSuOS,               & 
& MVG,MFd2OS,MFu2OS,Mhh2OS,MSd2OS,MSu2OS,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,       & 
& cplcFdFdVGR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplhhSdcSd,cplhhSucSu,     & 
& cplSdcSdVG,cplSucSuVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& AmpVertexhhToVGVG)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhToVGVG(MFd,MFu,Mhh,MSd,MSu,MVG,MFd2,MFu2,           & 
& Mhh2,MSd2,MSu2,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuhhL,       & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplhhSdcSd,cplhhSucSu,cplSdcSdVG,cplSucSuVG,       & 
& cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& AmpVertexhhToVGVG)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VG VG -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVGVG = 0._dp 
 AmpSum2hhToVGVG = 0._dp  
Else 
 AmpSumhhToVGVG = AmpVertexhhToVGVG + AmpWavehhToVGVG
 AmpSum2hhToVGVG = AmpVertexhhToVGVG + AmpWavehhToVGVG 
End If 
Do gt1=1,6
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(0.)+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVG)+Abs(MVG))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),0._dp,0._dp,AmpSumhhToVGVG(:,gt1),AmpSum2hhToVGVG(:,gt1),AmpSqhhToVGVG(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVG,MVG,AmpSumhhToVGVG(:,gt1),AmpSum2hhToVGVG(:,gt1),AmpSqhhToVGVG(gt1)) 
End if  
Else  
  AmpSqhhToVGVG(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVGVG(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 8._dp*GammaTPS(MhhOS(gt1),0._dp,0._dp,helfactor*AmpSqhhToVGVG(gt1))
Else 
  gP1Lhh(gt1,i4) = 8._dp*GammaTPS(Mhh(gt1),MVG,MVG,helfactor*AmpSqhhToVGVG(gt1))
End if 
If ((Abs(MRPhhToVGVG(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVGVG(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.6) isave = i4 
End do
!---------------- 
! VP VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_hhToVPVP(MChaOS,MFdOS,MFeOS,MFuOS,MhhOS,              & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,               & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,   & 
& cplcChaChaVPR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,      & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,               & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,               & 
& cplcVWmVPVWm,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,cplHpmcHpmVPVP1,cplSdcSdVPVPaa,           & 
& cplSecSeVPVP1,cplSucSuVPVPaa,cplcVWmVPVPVWm3Q,cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,       & 
& AmpVertexhhToVPVP)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_hhToVPVP(MChaOS,MFdOS,MFeOS,MFuOS,MhhOS,              & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,               & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,   & 
& cplcChaChaVPR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,      & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,               & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,               & 
& cplcVWmVPVWm,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,cplHpmcHpmVPVP1,cplSdcSdVPVPaa,           & 
& cplSecSeVPVP1,cplSucSuVPVPaa,cplcVWmVPVPVWm3Q,cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,       & 
& AmpVertexhhToVPVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhToVPVP(MCha,MFd,MFe,MFu,Mhh,MHpm,MSd,               & 
& MSe,MSu,MVP,MVWm,MCha2,MFd2,MFe2,MFu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MVP2,MVWm2,            & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmhh,cplcgWmgWmVP,             & 
& cplcgWpCgWpChh,cplcgWpCgWpCVP,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,         & 
& cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,             & 
& cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,       & 
& cplHpmcHpmVPVP1,cplSdcSdVPVPaa,cplSecSeVPVP1,cplSucSuVPVPaa,cplcVWmVPVPVWm3Q,          & 
& cplcVWmVPVPVWm1Q,cplcVWmVPVPVWm2Q,AmpVertexhhToVPVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VP VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVPVP = 0._dp 
 AmpSum2hhToVPVP = 0._dp  
Else 
 AmpSumhhToVPVP = AmpVertexhhToVPVP + AmpWavehhToVPVP
 AmpSum2hhToVPVP = AmpVertexhhToVPVP + AmpWavehhToVPVP 
End If 
Do gt1=1,6
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(0.)+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVP)+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),0._dp,0._dp,AmpSumhhToVPVP(:,gt1),AmpSum2hhToVPVP(:,gt1),AmpSqhhToVPVP(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVP,MVP,AmpSumhhToVPVP(:,gt1),AmpSum2hhToVPVP(:,gt1),AmpSqhhToVPVP(gt1)) 
End if  
Else  
  AmpSqhhToVPVP(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVPVP(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),0._dp,0._dp,helfactor*AmpSqhhToVPVP(gt1))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MVP,MVP,helfactor*AmpSqhhToVPVP(gt1))
End if 
If ((Abs(MRPhhToVPVP(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVPVP(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.6) isave = i4 
End do
!---------------- 
! VP VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_hhToVPVZ(MChaOS,MFdOS,MFeOS,MFuOS,MhhOS,              & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MVZOS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,         & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChahhL,cplcChaChahhR,          & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVP,             & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplhhHpmcHpm,cplhhHpmcVWm,   & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,               & 
& cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVZ,cplSecSeVP,               & 
& cplSecSeVZ,cplSucSuVP,cplSucSuVZ,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,               & 
& cplcVWmVWmVZ,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,          & 
& cplHpmcHpmVPVZ1,cplSdcSdVPVZaa,cplSecSeVPVZ1,cplSucSuVPVZaa,cplcVWmVPVWmVZ3Q,          & 
& cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q,AmpVertexhhToVPVZ)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_hhToVPVZ(MChaOS,MFdOS,MFeOS,MFuOS,MhhOS,              & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MVZOS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,         & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChahhL,cplcChaChahhR,          & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVP,             & 
& cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplhhHpmcHpm,cplhhHpmcVWm,   & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,               & 
& cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVZ,cplSecSeVP,               & 
& cplSecSeVZ,cplSucSuVP,cplSucSuVZ,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,               & 
& cplcVWmVWmVZ,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhcHpmVPVWm1,cplhhcHpmVWmVZ1,          & 
& cplHpmcHpmVPVZ1,cplSdcSdVPVZaa,cplSecSeVPVZ1,cplSucSuVPVZaa,cplcVWmVPVWmVZ3Q,          & 
& cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q,AmpVertexhhToVPVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhToVPVZ(MCha,MFd,MFe,MFu,Mhh,MHpm,MSd,               & 
& MSe,MSu,MVP,MVWm,MVZ,MCha2,MFd2,MFe2,MFu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MVP2,              & 
& MVWm2,MVZ2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpChh,cplcgWpCgWpCVP,      & 
& cplcgWpCgWpCVZ,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,             & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,         & 
& cplSdcSdVP,cplSdcSdVZ,cplSecSeVP,cplSecSeVZ,cplSucSuVP,cplSucSuVZ,cplcHpmVPVWm,        & 
& cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhcHpmVPVWm1,& 
& cplhhcHpmVWmVZ1,cplHpmcHpmVPVZ1,cplSdcSdVPVZaa,cplSecSeVPVZ1,cplSucSuVPVZaa,           & 
& cplcVWmVPVWmVZ3Q,cplcVWmVPVWmVZ2Q,cplcVWmVPVWmVZ1Q,AmpVertexhhToVPVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VP VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVPVZ = 0._dp 
 AmpSum2hhToVPVZ = 0._dp  
Else 
 AmpSumhhToVPVZ = AmpVertexhhToVPVZ + AmpWavehhToVPVZ
 AmpSum2hhToVPVZ = AmpVertexhhToVPVZ + AmpWavehhToVPVZ 
End If 
Do gt1=1,6
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(0.)+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVP)+Abs(MVZ))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),0._dp,MVZOS,AmpSumhhToVPVZ(:,gt1),AmpSum2hhToVPVZ(:,gt1),AmpSqhhToVPVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVP,MVZ,AmpSumhhToVPVZ(:,gt1),AmpSum2hhToVPVZ(:,gt1),AmpSqhhToVPVZ(gt1)) 
End if  
Else  
  AmpSqhhToVPVZ(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVPVZ(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS(gt1),0._dp,MVZOS,helfactor*AmpSqhhToVPVZ(gt1))
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh(gt1),MVP,MVZ,helfactor*AmpSqhhToVPVZ(gt1))
End if 
If ((Abs(MRPhhToVPVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVPVZ(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.6) isave = i4 
End do
!---------------- 
! VP VZp
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_hhToVPVZp(MChaOS,MFdOS,MFeOS,MFuOS,MhhOS,             & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MVZpOS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,               & 
& Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,MVZp2OS,cplcChaChahhL,cplcChaChahhR,  & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdhhL,cplcFdFdhhR,     & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmhh,cplcgWmgWmVP,           & 
& cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplcgWpCgWpCVZp,cplhhHpmcHpm,              & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,               & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVP,cplSdcSdVZp,          & 
& cplSecSeVP,cplSecSeVZp,cplSucSuVP,cplSucSuVZp,cplcHpmVPVWm,cplcVWmVPVWm,               & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplhhHpmcVWmVP1,cplhhHpmcVWmVZp1,cplhhcHpmVPVWm1,          & 
& cplhhcHpmVWmVZp1,cplHpmcHpmVPVZp1,cplSdcSdVPVZpaa,cplSecSeVPVZp1,cplSucSuVPVZpaa,      & 
& cplcVWmVPVWmVZp3Q,cplcVWmVPVWmVZp2Q,cplcVWmVPVWmVZp1Q,AmpVertexhhToVPVZp)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_hhToVPVZp(MChaOS,MFdOS,MFeOS,MFuOS,MhhOS,             & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MVZpOS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,               & 
& Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,MVZp2OS,cplcChaChahhL,cplcChaChahhR,  & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdhhL,cplcFdFdhhR,     & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmhh,cplcgWmgWmVP,           & 
& cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVP,cplcgWpCgWpCVZp,cplhhHpmcHpm,              & 
& cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhcHpmVWm,cplhhcVWmVWm,               & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVP,cplSdcSdVZp,          & 
& cplSecSeVP,cplSecSeVZp,cplSucSuVP,cplSucSuVZp,cplcHpmVPVWm,cplcVWmVPVWm,               & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplhhHpmcVWmVP1,cplhhHpmcVWmVZp1,cplhhcHpmVPVWm1,          & 
& cplhhcHpmVWmVZp1,cplHpmcHpmVPVZp1,cplSdcSdVPVZpaa,cplSecSeVPVZp1,cplSucSuVPVZpaa,      & 
& cplcVWmVPVWmVZp3Q,cplcVWmVPVWmVZp2Q,cplcVWmVPVWmVZp1Q,AmpVertexhhToVPVZp)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_hhToVPVZp(MCha,MFd,MFe,MFu,Mhh,MHpm,MSd,              & 
& MSe,MSu,MVP,MVWm,MVZp,MCha2,MFd2,MFe2,MFu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MVP2,             & 
& MVWm2,MVZp2,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZpL,    & 
& cplcChaChaVZpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZpL,           & 
& cplcFdFdVZpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,             & 
& cplcFeFeVZpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,             & 
& cplcFuFuVZpR,cplcgWmgWmhh,cplcgWmgWmVP,cplcgWmgWmVZp,cplcgWpCgWpChh,cplcgWpCgWpCVP,    & 
& cplcgWpCgWpCVZp,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,            & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZp,cplHpmcVWmVZp,       & 
& cplSdcSdVP,cplSdcSdVZp,cplSecSeVP,cplSecSeVZp,cplSucSuVP,cplSucSuVZp,cplcHpmVPVWm,     & 
& cplcVWmVPVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,cplhhHpmcVWmVP1,cplhhHpmcVWmVZp1,             & 
& cplhhcHpmVPVWm1,cplhhcHpmVWmVZp1,cplHpmcHpmVPVZp1,cplSdcSdVPVZpaa,cplSecSeVPVZp1,      & 
& cplSucSuVPVZpaa,cplcVWmVPVWmVZp3Q,cplcVWmVPVWmVZp2Q,cplcVWmVPVWmVZp1Q,AmpVertexhhToVPVZp)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VP VZp -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVPVZp = 0._dp 
 AmpSum2hhToVPVZp = 0._dp  
Else 
 AmpSumhhToVPVZp = AmpVertexhhToVPVZp + AmpWavehhToVPVZp
 AmpSum2hhToVPVZp = AmpVertexhhToVPVZp + AmpWavehhToVPVZp 
End If 
Do gt1=1,6
i4 = isave 
If (((OSkinematics).and.(Abs(MhhOS(gt1)).gt.(Abs(0.)+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(Mhh(gt1)).gt.(Abs(MVP)+Abs(MVZp))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),0._dp,MVZpOS,AmpSumhhToVPVZp(:,gt1),AmpSum2hhToVPVZp(:,gt1),AmpSqhhToVPVZp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVP,MVZp,AmpSumhhToVPVZp(:,gt1),AmpSum2hhToVPVZp(:,gt1),AmpSqhhToVPVZp(gt1)) 
End if  
Else  
  AmpSqhhToVPVZp(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVPVZp(gt1).eq.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS(gt1),0._dp,MVZpOS,helfactor*AmpSqhhToVPVZp(gt1))
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh(gt1),MVP,MVZp,helfactor*AmpSqhhToVPVZp(gt1))
End if 
If ((Abs(MRPhhToVPVZp(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVPVZp(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.6) isave = i4 
End do
End Subroutine OneLoopDecay_hh

End Module Wrapper_OneLoopDecay_hh_sec_UMSSM
