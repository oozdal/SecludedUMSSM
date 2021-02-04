! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 1:12 on 7.11.2019   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Ah_sec_UMSSM
Use Model_Data_sec_UMSSM 
Use Kinematics 
Use OneLoopDecay_Ah_sec_UMSSM 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Ah(MSdOS,MSd2OS,MSvOS,MSv2OS,MSuOS,MSu2OS,MSeOS,              & 
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
& cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplAhHpmSucSdaa,cplAhHpmSvcSe1,       & 
& cplAhSdcHpmcSuaa,cplAhSdcSd,cplAhSecHpmcSv1,cplAhSecSe,cplAhSucSu,cplAhSvcSv,          & 
& cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,cplcChaChaAhL,cplcChaChaAhR,   & 
& cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplcChaChaVZR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,             & 
& cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFecSvL,cplcChaFecSvR,cplcFdChaSuL,   & 
& cplcFdChaSuR,cplcFdChiSdL,cplcFdChiSdR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,            & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFdFdVZR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,          & 
& cplcFdFuVWmR,cplcFdGluSdL,cplcFdGluSdR,cplcFeChaSvL,cplcFeChaSvR,cplcFeChiSeL,         & 
& cplcFeChiSeR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,              & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,cplcFeFvHpmL,            & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,        & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,         & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFuFuVZR,cplcFuGluSuL,cplcFuGluSuR,cplcFvChiSvL,          & 
& cplcFvChiSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvAhL,      & 
& cplcFvFvAhR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZpL,cplcFvFvVZpR,             & 
& cplcFvFvVZR,cplcgAgWmcVWm,cplcgAgWpCVWm,cplcgWmgAHpm,cplcgWmgAVWm,cplcgWmgWmAh,        & 
& cplcgWmgWmhh,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWmgZHpm,cplcgWmgZpHpm,       & 
& cplcgWmgZpVWm,cplcgWmgZVWm,cplcgWpCgAcVWm,cplcgWpCgWpCAh,cplcgWpCgWpChh,               & 
& cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplcgWpCgZcHpm,cplcgWpCgZcVWm,           & 
& cplcgWpCgZpcHpm,cplcgWpCgZpcVWm,cplcgZgWmcHpm,cplcgZgWmcVWm,cplcgZgWpCHpm,             & 
& cplcgZgWpCVWm,cplcgZpgWmcHpm,cplcgZpgWmcVWm,cplcgZpgWpCHpm,cplcgZpgWpCVWm,             & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplChiChacHpmL,cplChiChacHpmR,     & 
& cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,cplChiChiVZR,cplChiFdcSdL,cplChiFdcSdR,       & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,         & 
& cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,       & 
& cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,cplhhcHpmVPVWm1,cplhhcHpmVWm,      & 
& cplhhcHpmVWmVZ1,cplhhcHpmVWmVZp1,cplhhcVWmVWm,cplhhhhcVWmVWm1,cplhhhhhh,               & 
& cplhhhhhhhh1,cplhhhhHpmcHpm1,cplhhhhSdcSdaa,cplhhhhSecSe1,cplhhhhSucSuaa,              & 
& cplhhhhSvcSv1,cplhhhhVZpVZp1,cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpmcHpm,cplhhHpmcVWm,     & 
& cplhhHpmcVWmVP1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplhhSdcSd,cplhhSecSe,cplhhSucSu,     & 
& cplhhSvcSv,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmcVWmVWm1,cplHpmcHpmVP,           & 
& cplHpmcHpmVPVP1,cplHpmcHpmVPVZ1,cplHpmcHpmVPVZp1,cplHpmcHpmVZ,cplHpmcHpmVZp,           & 
& cplHpmcHpmVZpVZp1,cplHpmcHpmVZVZ1,cplHpmcHpmVZVZp1,cplHpmcVWmVP,cplHpmcVWmVZ,          & 
& cplHpmcVWmVZp,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa,cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa, & 
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
& cplSvcSvVZVZ1,cplSvcSvVZVZp1,cplSvSvcSvcSv1,ctcplAhAhAh,ctcplAhAhhh,ctcplAhhhhh,       & 
& ctcplAhhhVZ,ctcplAhhhVZp,ctcplAhHpmcHpm,ctcplAhHpmcVWm,ctcplAhSdcSd,ctcplAhSecSe,      & 
& ctcplAhSucSu,ctcplAhSvcSv,ctcplcChaChaAhL,ctcplcChaChaAhR,ctcplcFdFdAhL,               & 
& ctcplcFdFdAhR,ctcplcFeFeAhL,ctcplcFeFeAhR,ctcplcFuFuAhL,ctcplcFuFuAhR,ctcplcFvFvAhL,   & 
& ctcplcFvFvAhR,ctcplChiChiAhL,ctcplChiChiAhR,GcplAhHpmcHpm,GcplcHpmVPVWm,               & 
& GcplHpmcVWmVP,GosZcplAhHpmcHpm,GosZcplcHpmVPVWm,GosZcplHpmcVWmVP,GZcplAhHpmcHpm,       & 
& GZcplcHpmVPVWm,GZcplHpmcVWmVP,ZcplAhAhAh,ZcplAhAhhh,ZcplAhhhhh,ZcplAhhhVZ,             & 
& ZcplAhhhVZp,ZcplAhHpmcHpm,ZcplAhHpmcVWm,ZcplAhSdcSd,ZcplAhSecSe,ZcplAhSucSu,           & 
& ZcplAhSvcSv,ZcplcChaChaAhL,ZcplcChaChaAhR,ZcplcFdFdAhL,ZcplcFdFdAhR,ZcplcFeFeAhL,      & 
& ZcplcFeFeAhR,ZcplcFuFuAhL,ZcplcFuFuAhR,ZcplcFvFvAhL,ZcplcFvFvAhR,ZcplChiChiAhL,        & 
& ZcplChiChiAhR,ZRUZD,ZRUZV,ZRUZU,ZRUZE,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUZVL,ZRUZVR,           & 
& ZRUUM,ZRUUP,ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,            & 
& kont,gP1LAh)

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
& cplAhHpmcVWmVZ1(6,2),cplAhHpmcVWmVZp1(6,2),cplAhHpmSucSdaa(6,2,6,6),cplAhHpmSvcSe1(6,2,6,6),& 
& cplAhSdcHpmcSuaa(6,6,2,6),cplAhSdcSd(6,6,6),cplAhSecHpmcSv1(6,6,2,6),cplAhSecSe(6,6,6),& 
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
& cplcgWpCgZcHpm(2),cplcgWpCgZcVWm,cplcgWpCgZpcHpm(2),cplcgWpCgZpcVWm,cplcgZgWmcHpm(2)

Complex(dp),Intent(in) :: cplcgZgWmcVWm,cplcgZgWpCHpm(2),cplcgZgWpCVWm,cplcgZpgWmcHpm(2),cplcgZpgWmcVWm,         & 
& cplcgZpgWpCHpm(2),cplcgZpgWpCVWm,cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),              & 
& cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),   & 
& cplChiChacVWmL(9,2),cplChiChacVWmR(9,2),cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),       & 
& cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),cplChiChiVZL(9,9),cplChiChiVZpL(9,9),          & 
& cplChiChiVZpR(9,9),cplChiChiVZR(9,9),cplChiFdcSdL(9,3,6),cplChiFdcSdR(9,3,6),          & 
& cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFucSuL(9,3,6),cplChiFucSuR(9,3,6),       & 
& cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),               & 
& cplcHpmVWmVZp(2),cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplGluFdcSdL(3,6),            & 
& cplGluFdcSdR(3,6),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplhhcHpmVPVWm1(6,2),            & 
& cplhhcHpmVWm(6,2),cplhhcHpmVWmVZ1(6,2),cplhhcHpmVWmVZp1(6,2),cplhhcVWmVWm(6),          & 
& cplhhhhcVWmVWm1(6,6),cplhhhhhh(6,6,6),cplhhhhhhhh1(6,6,6,6),cplhhhhHpmcHpm1(6,6,2,2),  & 
& cplhhhhSdcSdaa(6,6,6,6),cplhhhhSecSe1(6,6,6,6),cplhhhhSucSuaa(6,6,6,6),cplhhhhSvcSv1(6,6,6,6),& 
& cplhhhhVZpVZp1(6,6),cplhhhhVZVZ1(6,6),cplhhhhVZVZp1(6,6),cplhhHpmcHpm(6,2,2),          & 
& cplhhHpmcVWm(6,2),cplhhHpmcVWmVP1(6,2),cplhhHpmcVWmVZ1(6,2),cplhhHpmcVWmVZp1(6,2),     & 
& cplhhSdcSd(6,6,6),cplhhSecSe(6,6,6),cplhhSucSu(6,6,6),cplhhSvcSv(6,6,6),               & 
& cplhhVZpVZp(6),cplhhVZVZ(6),cplhhVZVZp(6),cplHpmcHpmcVWmVWm1(2,2),cplHpmcHpmVP(2,2),   & 
& cplHpmcHpmVPVP1(2,2),cplHpmcHpmVPVZ1(2,2),cplHpmcHpmVPVZp1(2,2),cplHpmcHpmVZ(2,2),     & 
& cplHpmcHpmVZp(2,2),cplHpmcHpmVZpVZp1(2,2),cplHpmcHpmVZVZ1(2,2),cplHpmcHpmVZVZp1(2,2),  & 
& cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),cplHpmHpmcHpmcHpm1(2,2,2,2),          & 
& cplHpmSdcHpmcSdaa(2,6,2,6),cplHpmSecHpmcSe1(2,6,2,6),cplHpmSucHpmcSuaa(2,6,2,6),       & 
& cplHpmSucSd(2,6,6),cplHpmSvcHpmcSv1(2,6,2,6),cplHpmSvcSe(2,6,6),cplSdcHpmcSu(6,2,6),   & 
& cplSdcSdcVWmVWmaa(6,6),cplSdcSdVG(6,6),cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6), & 
& cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6),cplSdcSdVP(6,6),cplSdcSdVPVPaa(6,6),    & 
& cplSdcSdVPVZaa(6,6),cplSdcSdVPVZpaa(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),             & 
& cplSdcSdVZpVZpaa(6,6),cplSdcSdVZVZaa(6,6),cplSdcSdVZVZpaa(6,6),cplSdcSucVWm(6,6),      & 
& cplSdSdcSdcSdabab(6,6,6,6),cplSdSdcSdcSdabba(6,6,6,6),cplSdSecSdcSeaa(6,6,6,6),        & 
& cplSdSucSdcSuabab(6,6,6,6),cplSdSucSdcSuabba(6,6,6,6),cplSdSvcSdcSvaa(6,6,6,6),        & 
& cplSecHpmcSv(6,2,6),cplSecSecVWmVWm1(6,6),cplSecSeVP(6,6),cplSecSeVPVP1(6,6),          & 
& cplSecSeVPVZ1(6,6),cplSecSeVPVZp1(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),               & 
& cplSecSeVZpVZp1(6,6),cplSecSeVZVZ1(6,6),cplSecSeVZVZp1(6,6),cplSecSvcVWm(6,6),         & 
& cplSeSecSecSe1(6,6,6,6),cplSeSucSecSuaa(6,6,6,6),cplSeSvcSecSv1(6,6,6,6),              & 
& cplSucSdVWm(6,6),cplSucSucVWmVWmaa(6,6),cplSucSuVG(6,6),cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1(6,6),& 
& cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1(6,6),cplSucSuVP(6,6),cplSucSuVPVPaa(6,6),    & 
& cplSucSuVPVZaa(6,6),cplSucSuVPVZpaa(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6),             & 
& cplSucSuVZpVZpaa(6,6),cplSucSuVZVZaa(6,6),cplSucSuVZVZpaa(6,6),cplSuSucSucSuabab(6,6,6,6),& 
& cplSuSucSucSuabba(6,6,6,6),cplSuSvcSucSvaa(6,6,6,6),cplSvcSeVWm(6,6),cplSvcSvcVWmVWm1(6,6)

Complex(dp),Intent(in) :: cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),cplSvcSvVZpVZp1(6,6),cplSvcSvVZVZ1(6,6),              & 
& cplSvcSvVZVZp1(6,6),cplSvSvcSvcSv1(6,6,6,6),ctcplAhAhAh(6,6,6),ctcplAhAhhh(6,6,6),     & 
& ctcplAhhhhh(6,6,6),ctcplAhhhVZ(6,6),ctcplAhhhVZp(6,6),ctcplAhHpmcHpm(6,2,2),           & 
& ctcplAhHpmcVWm(6,2),ctcplAhSdcSd(6,6,6),ctcplAhSecSe(6,6,6),ctcplAhSucSu(6,6,6),       & 
& ctcplAhSvcSv(6,6,6),ctcplcChaChaAhL(2,2,6),ctcplcChaChaAhR(2,2,6),ctcplcFdFdAhL(3,3,6),& 
& ctcplcFdFdAhR(3,3,6),ctcplcFeFeAhL(3,3,6),ctcplcFeFeAhR(3,3,6),ctcplcFuFuAhL(3,3,6),   & 
& ctcplcFuFuAhR(3,3,6),ctcplcFvFvAhL(3,3,6),ctcplcFvFvAhR(3,3,6),ctcplChiChiAhL(9,9,6),  & 
& ctcplChiChiAhR(9,9,6),GcplAhHpmcHpm(6,2,2),GcplcHpmVPVWm(2),GcplHpmcVWmVP(2),          & 
& GosZcplAhHpmcHpm(6,2,2),GosZcplcHpmVPVWm(2),GosZcplHpmcVWmVP(2),GZcplAhHpmcHpm(6,2,2), & 
& GZcplcHpmVPVWm(2),GZcplHpmcVWmVP(2),ZcplAhAhAh(6,6,6),ZcplAhAhhh(6,6,6),               & 
& ZcplAhhhhh(6,6,6),ZcplAhhhVZ(6,6),ZcplAhhhVZp(6,6),ZcplAhHpmcHpm(6,2,2),               & 
& ZcplAhHpmcVWm(6,2),ZcplAhSdcSd(6,6,6),ZcplAhSecSe(6,6,6),ZcplAhSucSu(6,6,6),           & 
& ZcplAhSvcSv(6,6,6),ZcplcChaChaAhL(2,2,6),ZcplcChaChaAhR(2,2,6),ZcplcFdFdAhL(3,3,6),    & 
& ZcplcFdFdAhR(3,3,6),ZcplcFeFeAhL(3,3,6),ZcplcFeFeAhR(3,3,6),ZcplcFuFuAhL(3,3,6),       & 
& ZcplcFuFuAhR(3,3,6),ZcplcFvFvAhL(3,3,6),ZcplcFvFvAhR(3,3,6),ZcplChiChiAhL(9,9,6),      & 
& ZcplChiChiAhR(9,9,6)

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
Real(dp), Intent(out) :: gP1LAh(6,327) 
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
Real(dp) :: MRPAhToAhAh(6,6,6),MRGAhToAhAh(6,6,6), MRPZAhToAhAh(6,6,6),MRGZAhToAhAh(6,6,6) 
Real(dp) :: MVPAhToAhAh(6,6,6) 
Real(dp) :: RMsqTreeAhToAhAh(6,6,6),RMsqWaveAhToAhAh(6,6,6),RMsqVertexAhToAhAh(6,6,6) 
Complex(dp) :: AmpTreeAhToAhAh(6,6,6),AmpWaveAhToAhAh(6,6,6)=(0._dp,0._dp),AmpVertexAhToAhAh(6,6,6)& 
 & ,AmpVertexIRosAhToAhAh(6,6,6),AmpVertexIRdrAhToAhAh(6,6,6), AmpSumAhToAhAh(6,6,6), AmpSum2AhToAhAh(6,6,6) 
Complex(dp) :: AmpTreeZAhToAhAh(6,6,6),AmpWaveZAhToAhAh(6,6,6),AmpVertexZAhToAhAh(6,6,6) 
Real(dp) :: AmpSqAhToAhAh(6,6,6),  AmpSqTreeAhToAhAh(6,6,6) 
Real(dp) :: MRPAhTohhAh(6,6,6),MRGAhTohhAh(6,6,6), MRPZAhTohhAh(6,6,6),MRGZAhTohhAh(6,6,6) 
Real(dp) :: MVPAhTohhAh(6,6,6) 
Real(dp) :: RMsqTreeAhTohhAh(6,6,6),RMsqWaveAhTohhAh(6,6,6),RMsqVertexAhTohhAh(6,6,6) 
Complex(dp) :: AmpTreeAhTohhAh(6,6,6),AmpWaveAhTohhAh(6,6,6)=(0._dp,0._dp),AmpVertexAhTohhAh(6,6,6)& 
 & ,AmpVertexIRosAhTohhAh(6,6,6),AmpVertexIRdrAhTohhAh(6,6,6), AmpSumAhTohhAh(6,6,6), AmpSum2AhTohhAh(6,6,6) 
Complex(dp) :: AmpTreeZAhTohhAh(6,6,6),AmpWaveZAhTohhAh(6,6,6),AmpVertexZAhTohhAh(6,6,6) 
Real(dp) :: AmpSqAhTohhAh(6,6,6),  AmpSqTreeAhTohhAh(6,6,6) 
Real(dp) :: MRPAhTocChaCha(6,2,2),MRGAhTocChaCha(6,2,2), MRPZAhTocChaCha(6,2,2),MRGZAhTocChaCha(6,2,2) 
Real(dp) :: MVPAhTocChaCha(6,2,2) 
Real(dp) :: RMsqTreeAhTocChaCha(6,2,2),RMsqWaveAhTocChaCha(6,2,2),RMsqVertexAhTocChaCha(6,2,2) 
Complex(dp) :: AmpTreeAhTocChaCha(2,6,2,2),AmpWaveAhTocChaCha(2,6,2,2)=(0._dp,0._dp),AmpVertexAhTocChaCha(2,6,2,2)& 
 & ,AmpVertexIRosAhTocChaCha(2,6,2,2),AmpVertexIRdrAhTocChaCha(2,6,2,2), AmpSumAhTocChaCha(2,6,2,2), AmpSum2AhTocChaCha(2,6,2,2) 
Complex(dp) :: AmpTreeZAhTocChaCha(2,6,2,2),AmpWaveZAhTocChaCha(2,6,2,2),AmpVertexZAhTocChaCha(2,6,2,2) 
Real(dp) :: AmpSqAhTocChaCha(6,2,2),  AmpSqTreeAhTocChaCha(6,2,2) 
Real(dp) :: MRPAhToChiChi(6,9,9),MRGAhToChiChi(6,9,9), MRPZAhToChiChi(6,9,9),MRGZAhToChiChi(6,9,9) 
Real(dp) :: MVPAhToChiChi(6,9,9) 
Real(dp) :: RMsqTreeAhToChiChi(6,9,9),RMsqWaveAhToChiChi(6,9,9),RMsqVertexAhToChiChi(6,9,9) 
Complex(dp) :: AmpTreeAhToChiChi(2,6,9,9),AmpWaveAhToChiChi(2,6,9,9)=(0._dp,0._dp),AmpVertexAhToChiChi(2,6,9,9)& 
 & ,AmpVertexIRosAhToChiChi(2,6,9,9),AmpVertexIRdrAhToChiChi(2,6,9,9), AmpSumAhToChiChi(2,6,9,9), AmpSum2AhToChiChi(2,6,9,9) 
Complex(dp) :: AmpTreeZAhToChiChi(2,6,9,9),AmpWaveZAhToChiChi(2,6,9,9),AmpVertexZAhToChiChi(2,6,9,9) 
Real(dp) :: AmpSqAhToChiChi(6,9,9),  AmpSqTreeAhToChiChi(6,9,9) 
Real(dp) :: MRPAhTocFdFd(6,3,3),MRGAhTocFdFd(6,3,3), MRPZAhTocFdFd(6,3,3),MRGZAhTocFdFd(6,3,3) 
Real(dp) :: MVPAhTocFdFd(6,3,3) 
Real(dp) :: RMsqTreeAhTocFdFd(6,3,3),RMsqWaveAhTocFdFd(6,3,3),RMsqVertexAhTocFdFd(6,3,3) 
Complex(dp) :: AmpTreeAhTocFdFd(2,6,3,3),AmpWaveAhTocFdFd(2,6,3,3)=(0._dp,0._dp),AmpVertexAhTocFdFd(2,6,3,3)& 
 & ,AmpVertexIRosAhTocFdFd(2,6,3,3),AmpVertexIRdrAhTocFdFd(2,6,3,3), AmpSumAhTocFdFd(2,6,3,3), AmpSum2AhTocFdFd(2,6,3,3) 
Complex(dp) :: AmpTreeZAhTocFdFd(2,6,3,3),AmpWaveZAhTocFdFd(2,6,3,3),AmpVertexZAhTocFdFd(2,6,3,3) 
Real(dp) :: AmpSqAhTocFdFd(6,3,3),  AmpSqTreeAhTocFdFd(6,3,3) 
Real(dp) :: MRPAhTocFeFe(6,3,3),MRGAhTocFeFe(6,3,3), MRPZAhTocFeFe(6,3,3),MRGZAhTocFeFe(6,3,3) 
Real(dp) :: MVPAhTocFeFe(6,3,3) 
Real(dp) :: RMsqTreeAhTocFeFe(6,3,3),RMsqWaveAhTocFeFe(6,3,3),RMsqVertexAhTocFeFe(6,3,3) 
Complex(dp) :: AmpTreeAhTocFeFe(2,6,3,3),AmpWaveAhTocFeFe(2,6,3,3)=(0._dp,0._dp),AmpVertexAhTocFeFe(2,6,3,3)& 
 & ,AmpVertexIRosAhTocFeFe(2,6,3,3),AmpVertexIRdrAhTocFeFe(2,6,3,3), AmpSumAhTocFeFe(2,6,3,3), AmpSum2AhTocFeFe(2,6,3,3) 
Complex(dp) :: AmpTreeZAhTocFeFe(2,6,3,3),AmpWaveZAhTocFeFe(2,6,3,3),AmpVertexZAhTocFeFe(2,6,3,3) 
Real(dp) :: AmpSqAhTocFeFe(6,3,3),  AmpSqTreeAhTocFeFe(6,3,3) 
Real(dp) :: MRPAhTocFuFu(6,3,3),MRGAhTocFuFu(6,3,3), MRPZAhTocFuFu(6,3,3),MRGZAhTocFuFu(6,3,3) 
Real(dp) :: MVPAhTocFuFu(6,3,3) 
Real(dp) :: RMsqTreeAhTocFuFu(6,3,3),RMsqWaveAhTocFuFu(6,3,3),RMsqVertexAhTocFuFu(6,3,3) 
Complex(dp) :: AmpTreeAhTocFuFu(2,6,3,3),AmpWaveAhTocFuFu(2,6,3,3)=(0._dp,0._dp),AmpVertexAhTocFuFu(2,6,3,3)& 
 & ,AmpVertexIRosAhTocFuFu(2,6,3,3),AmpVertexIRdrAhTocFuFu(2,6,3,3), AmpSumAhTocFuFu(2,6,3,3), AmpSum2AhTocFuFu(2,6,3,3) 
Complex(dp) :: AmpTreeZAhTocFuFu(2,6,3,3),AmpWaveZAhTocFuFu(2,6,3,3),AmpVertexZAhTocFuFu(2,6,3,3) 
Real(dp) :: AmpSqAhTocFuFu(6,3,3),  AmpSqTreeAhTocFuFu(6,3,3) 
Real(dp) :: MRPAhTocFvFv(6,3,3),MRGAhTocFvFv(6,3,3), MRPZAhTocFvFv(6,3,3),MRGZAhTocFvFv(6,3,3) 
Real(dp) :: MVPAhTocFvFv(6,3,3) 
Real(dp) :: RMsqTreeAhTocFvFv(6,3,3),RMsqWaveAhTocFvFv(6,3,3),RMsqVertexAhTocFvFv(6,3,3) 
Complex(dp) :: AmpTreeAhTocFvFv(2,6,3,3),AmpWaveAhTocFvFv(2,6,3,3)=(0._dp,0._dp),AmpVertexAhTocFvFv(2,6,3,3)& 
 & ,AmpVertexIRosAhTocFvFv(2,6,3,3),AmpVertexIRdrAhTocFvFv(2,6,3,3), AmpSumAhTocFvFv(2,6,3,3), AmpSum2AhTocFvFv(2,6,3,3) 
Complex(dp) :: AmpTreeZAhTocFvFv(2,6,3,3),AmpWaveZAhTocFvFv(2,6,3,3),AmpVertexZAhTocFvFv(2,6,3,3) 
Real(dp) :: AmpSqAhTocFvFv(6,3,3),  AmpSqTreeAhTocFvFv(6,3,3) 
Real(dp) :: MRPAhTohhhh(6,6,6),MRGAhTohhhh(6,6,6), MRPZAhTohhhh(6,6,6),MRGZAhTohhhh(6,6,6) 
Real(dp) :: MVPAhTohhhh(6,6,6) 
Real(dp) :: RMsqTreeAhTohhhh(6,6,6),RMsqWaveAhTohhhh(6,6,6),RMsqVertexAhTohhhh(6,6,6) 
Complex(dp) :: AmpTreeAhTohhhh(6,6,6),AmpWaveAhTohhhh(6,6,6)=(0._dp,0._dp),AmpVertexAhTohhhh(6,6,6)& 
 & ,AmpVertexIRosAhTohhhh(6,6,6),AmpVertexIRdrAhTohhhh(6,6,6), AmpSumAhTohhhh(6,6,6), AmpSum2AhTohhhh(6,6,6) 
Complex(dp) :: AmpTreeZAhTohhhh(6,6,6),AmpWaveZAhTohhhh(6,6,6),AmpVertexZAhTohhhh(6,6,6) 
Real(dp) :: AmpSqAhTohhhh(6,6,6),  AmpSqTreeAhTohhhh(6,6,6) 
Real(dp) :: MRPAhTohhVZ(6,6),MRGAhTohhVZ(6,6), MRPZAhTohhVZ(6,6),MRGZAhTohhVZ(6,6) 
Real(dp) :: MVPAhTohhVZ(6,6) 
Real(dp) :: RMsqTreeAhTohhVZ(6,6),RMsqWaveAhTohhVZ(6,6),RMsqVertexAhTohhVZ(6,6) 
Complex(dp) :: AmpTreeAhTohhVZ(2,6,6),AmpWaveAhTohhVZ(2,6,6)=(0._dp,0._dp),AmpVertexAhTohhVZ(2,6,6)& 
 & ,AmpVertexIRosAhTohhVZ(2,6,6),AmpVertexIRdrAhTohhVZ(2,6,6), AmpSumAhTohhVZ(2,6,6), AmpSum2AhTohhVZ(2,6,6) 
Complex(dp) :: AmpTreeZAhTohhVZ(2,6,6),AmpWaveZAhTohhVZ(2,6,6),AmpVertexZAhTohhVZ(2,6,6) 
Real(dp) :: AmpSqAhTohhVZ(6,6),  AmpSqTreeAhTohhVZ(6,6) 
Real(dp) :: MRPAhTohhVZp(6,6),MRGAhTohhVZp(6,6), MRPZAhTohhVZp(6,6),MRGZAhTohhVZp(6,6) 
Real(dp) :: MVPAhTohhVZp(6,6) 
Real(dp) :: RMsqTreeAhTohhVZp(6,6),RMsqWaveAhTohhVZp(6,6),RMsqVertexAhTohhVZp(6,6) 
Complex(dp) :: AmpTreeAhTohhVZp(2,6,6),AmpWaveAhTohhVZp(2,6,6)=(0._dp,0._dp),AmpVertexAhTohhVZp(2,6,6)& 
 & ,AmpVertexIRosAhTohhVZp(2,6,6),AmpVertexIRdrAhTohhVZp(2,6,6), AmpSumAhTohhVZp(2,6,6), AmpSum2AhTohhVZp(2,6,6) 
Complex(dp) :: AmpTreeZAhTohhVZp(2,6,6),AmpWaveZAhTohhVZp(2,6,6),AmpVertexZAhTohhVZp(2,6,6) 
Real(dp) :: AmpSqAhTohhVZp(6,6),  AmpSqTreeAhTohhVZp(6,6) 
Real(dp) :: MRPAhTocHpmHpm(6,2,2),MRGAhTocHpmHpm(6,2,2), MRPZAhTocHpmHpm(6,2,2),MRGZAhTocHpmHpm(6,2,2) 
Real(dp) :: MVPAhTocHpmHpm(6,2,2) 
Real(dp) :: RMsqTreeAhTocHpmHpm(6,2,2),RMsqWaveAhTocHpmHpm(6,2,2),RMsqVertexAhTocHpmHpm(6,2,2) 
Complex(dp) :: AmpTreeAhTocHpmHpm(6,2,2),AmpWaveAhTocHpmHpm(6,2,2)=(0._dp,0._dp),AmpVertexAhTocHpmHpm(6,2,2)& 
 & ,AmpVertexIRosAhTocHpmHpm(6,2,2),AmpVertexIRdrAhTocHpmHpm(6,2,2), AmpSumAhTocHpmHpm(6,2,2), AmpSum2AhTocHpmHpm(6,2,2) 
Complex(dp) :: AmpTreeZAhTocHpmHpm(6,2,2),AmpWaveZAhTocHpmHpm(6,2,2),AmpVertexZAhTocHpmHpm(6,2,2) 
Real(dp) :: AmpSqAhTocHpmHpm(6,2,2),  AmpSqTreeAhTocHpmHpm(6,2,2) 
Real(dp) :: MRPAhToHpmcVWm(6,2),MRGAhToHpmcVWm(6,2), MRPZAhToHpmcVWm(6,2),MRGZAhToHpmcVWm(6,2) 
Real(dp) :: MVPAhToHpmcVWm(6,2) 
Real(dp) :: RMsqTreeAhToHpmcVWm(6,2),RMsqWaveAhToHpmcVWm(6,2),RMsqVertexAhToHpmcVWm(6,2) 
Complex(dp) :: AmpTreeAhToHpmcVWm(2,6,2),AmpWaveAhToHpmcVWm(2,6,2)=(0._dp,0._dp),AmpVertexAhToHpmcVWm(2,6,2)& 
 & ,AmpVertexIRosAhToHpmcVWm(2,6,2),AmpVertexIRdrAhToHpmcVWm(2,6,2), AmpSumAhToHpmcVWm(2,6,2), AmpSum2AhToHpmcVWm(2,6,2) 
Complex(dp) :: AmpTreeZAhToHpmcVWm(2,6,2),AmpWaveZAhToHpmcVWm(2,6,2),AmpVertexZAhToHpmcVWm(2,6,2) 
Real(dp) :: AmpSqAhToHpmcVWm(6,2),  AmpSqTreeAhToHpmcVWm(6,2) 
Real(dp) :: MRPAhTocSdSd(6,6,6),MRGAhTocSdSd(6,6,6), MRPZAhTocSdSd(6,6,6),MRGZAhTocSdSd(6,6,6) 
Real(dp) :: MVPAhTocSdSd(6,6,6) 
Real(dp) :: RMsqTreeAhTocSdSd(6,6,6),RMsqWaveAhTocSdSd(6,6,6),RMsqVertexAhTocSdSd(6,6,6) 
Complex(dp) :: AmpTreeAhTocSdSd(6,6,6),AmpWaveAhTocSdSd(6,6,6)=(0._dp,0._dp),AmpVertexAhTocSdSd(6,6,6)& 
 & ,AmpVertexIRosAhTocSdSd(6,6,6),AmpVertexIRdrAhTocSdSd(6,6,6), AmpSumAhTocSdSd(6,6,6), AmpSum2AhTocSdSd(6,6,6) 
Complex(dp) :: AmpTreeZAhTocSdSd(6,6,6),AmpWaveZAhTocSdSd(6,6,6),AmpVertexZAhTocSdSd(6,6,6) 
Real(dp) :: AmpSqAhTocSdSd(6,6,6),  AmpSqTreeAhTocSdSd(6,6,6) 
Real(dp) :: MRPAhTocSeSe(6,6,6),MRGAhTocSeSe(6,6,6), MRPZAhTocSeSe(6,6,6),MRGZAhTocSeSe(6,6,6) 
Real(dp) :: MVPAhTocSeSe(6,6,6) 
Real(dp) :: RMsqTreeAhTocSeSe(6,6,6),RMsqWaveAhTocSeSe(6,6,6),RMsqVertexAhTocSeSe(6,6,6) 
Complex(dp) :: AmpTreeAhTocSeSe(6,6,6),AmpWaveAhTocSeSe(6,6,6)=(0._dp,0._dp),AmpVertexAhTocSeSe(6,6,6)& 
 & ,AmpVertexIRosAhTocSeSe(6,6,6),AmpVertexIRdrAhTocSeSe(6,6,6), AmpSumAhTocSeSe(6,6,6), AmpSum2AhTocSeSe(6,6,6) 
Complex(dp) :: AmpTreeZAhTocSeSe(6,6,6),AmpWaveZAhTocSeSe(6,6,6),AmpVertexZAhTocSeSe(6,6,6) 
Real(dp) :: AmpSqAhTocSeSe(6,6,6),  AmpSqTreeAhTocSeSe(6,6,6) 
Real(dp) :: MRPAhTocSuSu(6,6,6),MRGAhTocSuSu(6,6,6), MRPZAhTocSuSu(6,6,6),MRGZAhTocSuSu(6,6,6) 
Real(dp) :: MVPAhTocSuSu(6,6,6) 
Real(dp) :: RMsqTreeAhTocSuSu(6,6,6),RMsqWaveAhTocSuSu(6,6,6),RMsqVertexAhTocSuSu(6,6,6) 
Complex(dp) :: AmpTreeAhTocSuSu(6,6,6),AmpWaveAhTocSuSu(6,6,6)=(0._dp,0._dp),AmpVertexAhTocSuSu(6,6,6)& 
 & ,AmpVertexIRosAhTocSuSu(6,6,6),AmpVertexIRdrAhTocSuSu(6,6,6), AmpSumAhTocSuSu(6,6,6), AmpSum2AhTocSuSu(6,6,6) 
Complex(dp) :: AmpTreeZAhTocSuSu(6,6,6),AmpWaveZAhTocSuSu(6,6,6),AmpVertexZAhTocSuSu(6,6,6) 
Real(dp) :: AmpSqAhTocSuSu(6,6,6),  AmpSqTreeAhTocSuSu(6,6,6) 
Real(dp) :: MRPAhTocSvSv(6,6,6),MRGAhTocSvSv(6,6,6), MRPZAhTocSvSv(6,6,6),MRGZAhTocSvSv(6,6,6) 
Real(dp) :: MVPAhTocSvSv(6,6,6) 
Real(dp) :: RMsqTreeAhTocSvSv(6,6,6),RMsqWaveAhTocSvSv(6,6,6),RMsqVertexAhTocSvSv(6,6,6) 
Complex(dp) :: AmpTreeAhTocSvSv(6,6,6),AmpWaveAhTocSvSv(6,6,6)=(0._dp,0._dp),AmpVertexAhTocSvSv(6,6,6)& 
 & ,AmpVertexIRosAhTocSvSv(6,6,6),AmpVertexIRdrAhTocSvSv(6,6,6), AmpSumAhTocSvSv(6,6,6), AmpSum2AhTocSvSv(6,6,6) 
Complex(dp) :: AmpTreeZAhTocSvSv(6,6,6),AmpWaveZAhTocSvSv(6,6,6),AmpVertexZAhTocSvSv(6,6,6) 
Real(dp) :: AmpSqAhTocSvSv(6,6,6),  AmpSqTreeAhTocSvSv(6,6,6) 
Real(dp) :: MRPAhToAhVP(6,6),MRGAhToAhVP(6,6), MRPZAhToAhVP(6,6),MRGZAhToAhVP(6,6) 
Real(dp) :: MVPAhToAhVP(6,6) 
Real(dp) :: RMsqTreeAhToAhVP(6,6),RMsqWaveAhToAhVP(6,6),RMsqVertexAhToAhVP(6,6) 
Complex(dp) :: AmpTreeAhToAhVP(2,6,6),AmpWaveAhToAhVP(2,6,6)=(0._dp,0._dp),AmpVertexAhToAhVP(2,6,6)& 
 & ,AmpVertexIRosAhToAhVP(2,6,6),AmpVertexIRdrAhToAhVP(2,6,6), AmpSumAhToAhVP(2,6,6), AmpSum2AhToAhVP(2,6,6) 
Complex(dp) :: AmpTreeZAhToAhVP(2,6,6),AmpWaveZAhToAhVP(2,6,6),AmpVertexZAhToAhVP(2,6,6) 
Real(dp) :: AmpSqAhToAhVP(6,6),  AmpSqTreeAhToAhVP(6,6) 
Real(dp) :: MRPAhToAhVZ(6,6),MRGAhToAhVZ(6,6), MRPZAhToAhVZ(6,6),MRGZAhToAhVZ(6,6) 
Real(dp) :: MVPAhToAhVZ(6,6) 
Real(dp) :: RMsqTreeAhToAhVZ(6,6),RMsqWaveAhToAhVZ(6,6),RMsqVertexAhToAhVZ(6,6) 
Complex(dp) :: AmpTreeAhToAhVZ(2,6,6),AmpWaveAhToAhVZ(2,6,6)=(0._dp,0._dp),AmpVertexAhToAhVZ(2,6,6)& 
 & ,AmpVertexIRosAhToAhVZ(2,6,6),AmpVertexIRdrAhToAhVZ(2,6,6), AmpSumAhToAhVZ(2,6,6), AmpSum2AhToAhVZ(2,6,6) 
Complex(dp) :: AmpTreeZAhToAhVZ(2,6,6),AmpWaveZAhToAhVZ(2,6,6),AmpVertexZAhToAhVZ(2,6,6) 
Real(dp) :: AmpSqAhToAhVZ(6,6),  AmpSqTreeAhToAhVZ(6,6) 
Real(dp) :: MRPAhToAhVZp(6,6),MRGAhToAhVZp(6,6), MRPZAhToAhVZp(6,6),MRGZAhToAhVZp(6,6) 
Real(dp) :: MVPAhToAhVZp(6,6) 
Real(dp) :: RMsqTreeAhToAhVZp(6,6),RMsqWaveAhToAhVZp(6,6),RMsqVertexAhToAhVZp(6,6) 
Complex(dp) :: AmpTreeAhToAhVZp(2,6,6),AmpWaveAhToAhVZp(2,6,6)=(0._dp,0._dp),AmpVertexAhToAhVZp(2,6,6)& 
 & ,AmpVertexIRosAhToAhVZp(2,6,6),AmpVertexIRdrAhToAhVZp(2,6,6), AmpSumAhToAhVZp(2,6,6), AmpSum2AhToAhVZp(2,6,6) 
Complex(dp) :: AmpTreeZAhToAhVZp(2,6,6),AmpWaveZAhToAhVZp(2,6,6),AmpVertexZAhToAhVZp(2,6,6) 
Real(dp) :: AmpSqAhToAhVZp(6,6),  AmpSqTreeAhToAhVZp(6,6) 
Real(dp) :: MRPAhToGluGlu(6),MRGAhToGluGlu(6), MRPZAhToGluGlu(6),MRGZAhToGluGlu(6) 
Real(dp) :: MVPAhToGluGlu(6) 
Real(dp) :: RMsqTreeAhToGluGlu(6),RMsqWaveAhToGluGlu(6),RMsqVertexAhToGluGlu(6) 
Complex(dp) :: AmpTreeAhToGluGlu(2,6),AmpWaveAhToGluGlu(2,6)=(0._dp,0._dp),AmpVertexAhToGluGlu(2,6)& 
 & ,AmpVertexIRosAhToGluGlu(2,6),AmpVertexIRdrAhToGluGlu(2,6), AmpSumAhToGluGlu(2,6), AmpSum2AhToGluGlu(2,6) 
Complex(dp) :: AmpTreeZAhToGluGlu(2,6),AmpWaveZAhToGluGlu(2,6),AmpVertexZAhToGluGlu(2,6) 
Real(dp) :: AmpSqAhToGluGlu(6),  AmpSqTreeAhToGluGlu(6) 
Real(dp) :: MRPAhTohhVP(6,6),MRGAhTohhVP(6,6), MRPZAhTohhVP(6,6),MRGZAhTohhVP(6,6) 
Real(dp) :: MVPAhTohhVP(6,6) 
Real(dp) :: RMsqTreeAhTohhVP(6,6),RMsqWaveAhTohhVP(6,6),RMsqVertexAhTohhVP(6,6) 
Complex(dp) :: AmpTreeAhTohhVP(2,6,6),AmpWaveAhTohhVP(2,6,6)=(0._dp,0._dp),AmpVertexAhTohhVP(2,6,6)& 
 & ,AmpVertexIRosAhTohhVP(2,6,6),AmpVertexIRdrAhTohhVP(2,6,6), AmpSumAhTohhVP(2,6,6), AmpSum2AhTohhVP(2,6,6) 
Complex(dp) :: AmpTreeZAhTohhVP(2,6,6),AmpWaveZAhTohhVP(2,6,6),AmpVertexZAhTohhVP(2,6,6) 
Real(dp) :: AmpSqAhTohhVP(6,6),  AmpSqTreeAhTohhVP(6,6) 
Real(dp) :: MRPAhToVGVG(6),MRGAhToVGVG(6), MRPZAhToVGVG(6),MRGZAhToVGVG(6) 
Real(dp) :: MVPAhToVGVG(6) 
Real(dp) :: RMsqTreeAhToVGVG(6),RMsqWaveAhToVGVG(6),RMsqVertexAhToVGVG(6) 
Complex(dp) :: AmpTreeAhToVGVG(2,6),AmpWaveAhToVGVG(2,6)=(0._dp,0._dp),AmpVertexAhToVGVG(2,6)& 
 & ,AmpVertexIRosAhToVGVG(2,6),AmpVertexIRdrAhToVGVG(2,6), AmpSumAhToVGVG(2,6), AmpSum2AhToVGVG(2,6) 
Complex(dp) :: AmpTreeZAhToVGVG(2,6),AmpWaveZAhToVGVG(2,6),AmpVertexZAhToVGVG(2,6) 
Real(dp) :: AmpSqAhToVGVG(6),  AmpSqTreeAhToVGVG(6) 
Real(dp) :: MRPAhToVPVP(6),MRGAhToVPVP(6), MRPZAhToVPVP(6),MRGZAhToVPVP(6) 
Real(dp) :: MVPAhToVPVP(6) 
Real(dp) :: RMsqTreeAhToVPVP(6),RMsqWaveAhToVPVP(6),RMsqVertexAhToVPVP(6) 
Complex(dp) :: AmpTreeAhToVPVP(2,6),AmpWaveAhToVPVP(2,6)=(0._dp,0._dp),AmpVertexAhToVPVP(2,6)& 
 & ,AmpVertexIRosAhToVPVP(2,6),AmpVertexIRdrAhToVPVP(2,6), AmpSumAhToVPVP(2,6), AmpSum2AhToVPVP(2,6) 
Complex(dp) :: AmpTreeZAhToVPVP(2,6),AmpWaveZAhToVPVP(2,6),AmpVertexZAhToVPVP(2,6) 
Real(dp) :: AmpSqAhToVPVP(6),  AmpSqTreeAhToVPVP(6) 
Real(dp) :: MRPAhToVPVZ(6),MRGAhToVPVZ(6), MRPZAhToVPVZ(6),MRGZAhToVPVZ(6) 
Real(dp) :: MVPAhToVPVZ(6) 
Real(dp) :: RMsqTreeAhToVPVZ(6),RMsqWaveAhToVPVZ(6),RMsqVertexAhToVPVZ(6) 
Complex(dp) :: AmpTreeAhToVPVZ(2,6),AmpWaveAhToVPVZ(2,6)=(0._dp,0._dp),AmpVertexAhToVPVZ(2,6)& 
 & ,AmpVertexIRosAhToVPVZ(2,6),AmpVertexIRdrAhToVPVZ(2,6), AmpSumAhToVPVZ(2,6), AmpSum2AhToVPVZ(2,6) 
Complex(dp) :: AmpTreeZAhToVPVZ(2,6),AmpWaveZAhToVPVZ(2,6),AmpVertexZAhToVPVZ(2,6) 
Real(dp) :: AmpSqAhToVPVZ(6),  AmpSqTreeAhToVPVZ(6) 
Real(dp) :: MRPAhToVPVZp(6),MRGAhToVPVZp(6), MRPZAhToVPVZp(6),MRGZAhToVPVZp(6) 
Real(dp) :: MVPAhToVPVZp(6) 
Real(dp) :: RMsqTreeAhToVPVZp(6),RMsqWaveAhToVPVZp(6),RMsqVertexAhToVPVZp(6) 
Complex(dp) :: AmpTreeAhToVPVZp(2,6),AmpWaveAhToVPVZp(2,6)=(0._dp,0._dp),AmpVertexAhToVPVZp(2,6)& 
 & ,AmpVertexIRosAhToVPVZp(2,6),AmpVertexIRdrAhToVPVZp(2,6), AmpSumAhToVPVZp(2,6), AmpSum2AhToVPVZp(2,6) 
Complex(dp) :: AmpTreeZAhToVPVZp(2,6),AmpWaveZAhToVPVZp(2,6),AmpVertexZAhToVPVZp(2,6) 
Real(dp) :: AmpSqAhToVPVZp(6),  AmpSqTreeAhToVPVZp(6) 
Real(dp) :: MRPAhToVWmcVWm(6),MRGAhToVWmcVWm(6), MRPZAhToVWmcVWm(6),MRGZAhToVWmcVWm(6) 
Real(dp) :: MVPAhToVWmcVWm(6) 
Real(dp) :: RMsqTreeAhToVWmcVWm(6),RMsqWaveAhToVWmcVWm(6),RMsqVertexAhToVWmcVWm(6) 
Complex(dp) :: AmpTreeAhToVWmcVWm(2,6),AmpWaveAhToVWmcVWm(2,6)=(0._dp,0._dp),AmpVertexAhToVWmcVWm(2,6)& 
 & ,AmpVertexIRosAhToVWmcVWm(2,6),AmpVertexIRdrAhToVWmcVWm(2,6), AmpSumAhToVWmcVWm(2,6), AmpSum2AhToVWmcVWm(2,6) 
Complex(dp) :: AmpTreeZAhToVWmcVWm(2,6),AmpWaveZAhToVWmcVWm(2,6),AmpVertexZAhToVWmcVWm(2,6) 
Real(dp) :: AmpSqAhToVWmcVWm(6),  AmpSqTreeAhToVWmcVWm(6) 
Real(dp) :: MRPAhToVZVZ(6),MRGAhToVZVZ(6), MRPZAhToVZVZ(6),MRGZAhToVZVZ(6) 
Real(dp) :: MVPAhToVZVZ(6) 
Real(dp) :: RMsqTreeAhToVZVZ(6),RMsqWaveAhToVZVZ(6),RMsqVertexAhToVZVZ(6) 
Complex(dp) :: AmpTreeAhToVZVZ(2,6),AmpWaveAhToVZVZ(2,6)=(0._dp,0._dp),AmpVertexAhToVZVZ(2,6)& 
 & ,AmpVertexIRosAhToVZVZ(2,6),AmpVertexIRdrAhToVZVZ(2,6), AmpSumAhToVZVZ(2,6), AmpSum2AhToVZVZ(2,6) 
Complex(dp) :: AmpTreeZAhToVZVZ(2,6),AmpWaveZAhToVZVZ(2,6),AmpVertexZAhToVZVZ(2,6) 
Real(dp) :: AmpSqAhToVZVZ(6),  AmpSqTreeAhToVZVZ(6) 
Real(dp) :: MRPAhToVZVZp(6),MRGAhToVZVZp(6), MRPZAhToVZVZp(6),MRGZAhToVZVZp(6) 
Real(dp) :: MVPAhToVZVZp(6) 
Real(dp) :: RMsqTreeAhToVZVZp(6),RMsqWaveAhToVZVZp(6),RMsqVertexAhToVZVZp(6) 
Complex(dp) :: AmpTreeAhToVZVZp(2,6),AmpWaveAhToVZVZp(2,6)=(0._dp,0._dp),AmpVertexAhToVZVZp(2,6)& 
 & ,AmpVertexIRosAhToVZVZp(2,6),AmpVertexIRdrAhToVZVZp(2,6), AmpSumAhToVZVZp(2,6), AmpSum2AhToVZVZp(2,6) 
Complex(dp) :: AmpTreeZAhToVZVZp(2,6),AmpWaveZAhToVZVZp(2,6),AmpVertexZAhToVZVZp(2,6) 
Real(dp) :: AmpSqAhToVZVZp(6),  AmpSqTreeAhToVZVZp(6) 
Real(dp) :: MRPAhToVZpVZp(6),MRGAhToVZpVZp(6), MRPZAhToVZpVZp(6),MRGZAhToVZpVZp(6) 
Real(dp) :: MVPAhToVZpVZp(6) 
Real(dp) :: RMsqTreeAhToVZpVZp(6),RMsqWaveAhToVZpVZp(6),RMsqVertexAhToVZpVZp(6) 
Complex(dp) :: AmpTreeAhToVZpVZp(2,6),AmpWaveAhToVZpVZp(2,6)=(0._dp,0._dp),AmpVertexAhToVZpVZp(2,6)& 
 & ,AmpVertexIRosAhToVZpVZp(2,6),AmpVertexIRdrAhToVZpVZp(2,6), AmpSumAhToVZpVZp(2,6), AmpSum2AhToVZpVZp(2,6) 
Complex(dp) :: AmpTreeZAhToVZpVZp(2,6),AmpWaveZAhToVZpVZp(2,6),AmpVertexZAhToVZpVZp(2,6) 
Real(dp) :: AmpSqAhToVZpVZp(6),  AmpSqTreeAhToVZpVZp(6) 
Write(*,*) "Calculating one-loop decays of Ah " 
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
isave = 3

If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Ah Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_AhToAhAh(cplAhAhAh,MAh,MAh2,AmpTreeAhToAhAh)

  Else 
Call Amplitude_Tree_sec_UMSSM_AhToAhAh(ZcplAhAhAh,MAh,MAh2,AmpTreeAhToAhAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_AhToAhAh(MLambda,em,gs,cplAhAhAh,MAhOS,MRPAhToAhAh,         & 
& MRGAhToAhAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_AhToAhAh(MLambda,em,gs,ZcplAhAhAh,MAhOS,MRPAhToAhAh,        & 
& MRGAhToAhAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_AhToAhAh(MLambda,em,gs,cplAhAhAh,MAh,MRPAhToAhAh,           & 
& MRGAhToAhAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_AhToAhAh(MLambda,em,gs,ZcplAhAhAh,MAh,MRPAhToAhAh,          & 
& MRGAhToAhAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_AhToAhAh(cplAhAhAh,ctcplAhAhAh,MAh,MAh2,ZfAh,           & 
& AmpWaveAhToAhAh)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhToAhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplAhAhAhAh1,cplAhAhhhhh1,    & 
& cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvcSv1,             & 
& AmpVertexAhToAhAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhToAhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplAhAhAhAh1,cplAhAhhhhh1,    & 
& cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvcSv1,             & 
& AmpVertexIRdrAhToAhAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhToAhAh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,ZcplAhAhAh,cplAhAhhh,cplcChaChaAhL,               & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplAhAhAhAh1,cplAhAhhhhh1,    & 
& cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvcSv1,             & 
& AmpVertexIRosAhToAhAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhToAhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,ZcplAhAhAh,cplAhAhhh,cplcChaChaAhL,    & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplAhAhAhAh1,cplAhAhhhhh1,    & 
& cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvcSv1,             & 
& AmpVertexIRosAhToAhAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhToAhAh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,  & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplAhAhAhAh1,cplAhAhhhhh1,cplAhAhHpmcHpm1,          & 
& cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvcSv1,AmpVertexIRosAhToAhAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhToAhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplAhAhAhAh1,cplAhAhhhhh1,    & 
& cplAhAhHpmcHpm1,cplAhAhSdcSdaa,cplAhAhSecSe1,cplAhAhSucSuaa,cplAhAhSvcSv1,             & 
& AmpVertexIRosAhToAhAh)

 End if 
 End if 
AmpVertexAhToAhAh = AmpVertexAhToAhAh -  AmpVertexIRdrAhToAhAh! +  AmpVertexIRosAhToAhAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhToAhAh=0._dp 
AmpVertexZAhToAhAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhToAhAh(gt2,:,:) = AmpWaveZAhToAhAh(gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhToAhAh(gt1,:,:) 
AmpVertexZAhToAhAh(gt2,:,:)= AmpVertexZAhToAhAh(gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhToAhAh(gt1,:,:) 
 End Do 
End Do 
AmpWaveAhToAhAh=AmpWaveZAhToAhAh 
AmpVertexAhToAhAh= AmpVertexZAhToAhAh
! Final State 1 
AmpWaveZAhToAhAh=0._dp 
AmpVertexZAhToAhAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhToAhAh(:,gt2,:) = AmpWaveZAhToAhAh(:,gt2,:)+ZRUZA(gt2,gt1)*AmpWaveAhToAhAh(:,gt1,:) 
AmpVertexZAhToAhAh(:,gt2,:)= AmpVertexZAhToAhAh(:,gt2,:)+ZRUZA(gt2,gt1)*AmpVertexAhToAhAh(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhToAhAh=AmpWaveZAhToAhAh 
AmpVertexAhToAhAh= AmpVertexZAhToAhAh
! Final State 2 
AmpWaveZAhToAhAh=0._dp 
AmpVertexZAhToAhAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhToAhAh(:,:,gt2) = AmpWaveZAhToAhAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveAhToAhAh(:,:,gt1) 
AmpVertexZAhToAhAh(:,:,gt2)= AmpVertexZAhToAhAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexAhToAhAh(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhToAhAh=AmpWaveZAhToAhAh 
AmpVertexAhToAhAh= AmpVertexZAhToAhAh
End if
If (ShiftIRdiv) Then 
AmpVertexAhToAhAh = AmpVertexAhToAhAh  +  AmpVertexIRosAhToAhAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Ah Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhToAhAh = AmpTreeAhToAhAh 
 AmpSum2AhToAhAh = AmpTreeAhToAhAh + 2._dp*AmpWaveAhToAhAh + 2._dp*AmpVertexAhToAhAh  
Else 
 AmpSumAhToAhAh = AmpTreeAhToAhAh + AmpWaveAhToAhAh + AmpVertexAhToAhAh
 AmpSum2AhToAhAh = AmpTreeAhToAhAh + AmpWaveAhToAhAh + AmpVertexAhToAhAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToAhAh = AmpTreeAhToAhAh
 AmpSum2AhToAhAh = AmpTreeAhToAhAh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=3,6
    Do gt3=gt2,6
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MAhOS(gt2))+Abs(MAhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MAh(gt2))+Abs(MAh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhToAhAh = AmpTreeAhToAhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumAhToAhAh(gt1, gt2, gt3),AmpSum2AhToAhAh(gt1, gt2, gt3),AmpSqAhToAhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MAh(gt2),MAh(gt3),AmpSumAhToAhAh(gt1, gt2, gt3),AmpSum2AhToAhAh(gt1, gt2, gt3),AmpSqAhToAhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhToAhAh(gt1, gt2, gt3) 
  AmpSum2AhToAhAh = 2._dp*AmpWaveAhToAhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumAhToAhAh(gt1, gt2, gt3),AmpSum2AhToAhAh(gt1, gt2, gt3),AmpSqAhToAhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MAh(gt2),MAh(gt3),AmpSumAhToAhAh(gt1, gt2, gt3),AmpSum2AhToAhAh(gt1, gt2, gt3),AmpSqAhToAhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhToAhAh(gt1, gt2, gt3) 
  AmpSum2AhToAhAh = 2._dp*AmpVertexAhToAhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumAhToAhAh(gt1, gt2, gt3),AmpSum2AhToAhAh(gt1, gt2, gt3),AmpSqAhToAhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MAh(gt2),MAh(gt3),AmpSumAhToAhAh(gt1, gt2, gt3),AmpSum2AhToAhAh(gt1, gt2, gt3),AmpSqAhToAhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhToAhAh(gt1, gt2, gt3) 
  AmpSum2AhToAhAh = AmpTreeAhToAhAh + 2._dp*AmpWaveAhToAhAh + 2._dp*AmpVertexAhToAhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumAhToAhAh(gt1, gt2, gt3),AmpSum2AhToAhAh(gt1, gt2, gt3),AmpSqAhToAhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MAh(gt2),MAh(gt3),AmpSumAhToAhAh(gt1, gt2, gt3),AmpSum2AhToAhAh(gt1, gt2, gt3),AmpSqAhToAhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhToAhAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhToAhAh = AmpTreeAhToAhAh
  Call SquareAmp_StoSS(MAhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumAhToAhAh(gt1, gt2, gt3),AmpSum2AhToAhAh(gt1, gt2, gt3),AmpSqAhToAhAh(gt1, gt2, gt3)) 
  AmpSqTreeAhToAhAh(gt1, gt2, gt3) = AmpSqAhToAhAh(gt1, gt2, gt3)  
  AmpSum2AhToAhAh = + 2._dp*AmpWaveAhToAhAh + 2._dp*AmpVertexAhToAhAh
  Call SquareAmp_StoSS(MAhOS(gt1),MAhOS(gt2),MAhOS(gt3),AmpSumAhToAhAh(gt1, gt2, gt3),AmpSum2AhToAhAh(gt1, gt2, gt3),AmpSqAhToAhAh(gt1, gt2, gt3)) 
  AmpSqAhToAhAh(gt1, gt2, gt3) = AmpSqAhToAhAh(gt1, gt2, gt3) + AmpSqTreeAhToAhAh(gt1, gt2, gt3)  
Else  
  AmpSum2AhToAhAh = AmpTreeAhToAhAh
  Call SquareAmp_StoSS(MAh(gt1),MAh(gt2),MAh(gt3),AmpSumAhToAhAh(gt1, gt2, gt3),AmpSum2AhToAhAh(gt1, gt2, gt3),AmpSqAhToAhAh(gt1, gt2, gt3)) 
  AmpSqTreeAhToAhAh(gt1, gt2, gt3) = AmpSqAhToAhAh(gt1, gt2, gt3)  
  AmpSum2AhToAhAh = + 2._dp*AmpWaveAhToAhAh + 2._dp*AmpVertexAhToAhAh
  Call SquareAmp_StoSS(MAh(gt1),MAh(gt2),MAh(gt3),AmpSumAhToAhAh(gt1, gt2, gt3),AmpSum2AhToAhAh(gt1, gt2, gt3),AmpSqAhToAhAh(gt1, gt2, gt3)) 
  AmpSqAhToAhAh(gt1, gt2, gt3) = AmpSqAhToAhAh(gt1, gt2, gt3) + AmpSqTreeAhToAhAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhToAhAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqAhToAhAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAhOS(gt1),MAhOS(gt2),MAhOS(gt3),helfactor*AmpSqAhToAhAh(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAh(gt1),MAh(gt2),MAh(gt3),helfactor*AmpSqAhToAhAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhToAhAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhToAhAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhToAhAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhToAhAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPAhToAhAh(gt1, gt2, gt3) + MRGAhToAhAh(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPAhToAhAh(gt1, gt2, gt3) + MRGAhToAhAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
Call Amplitude_Tree_sec_UMSSM_AhTohhAh(cplAhAhhh,MAh,Mhh,MAh2,Mhh2,AmpTreeAhTohhAh)

  Else 
Call Amplitude_Tree_sec_UMSSM_AhTohhAh(ZcplAhAhhh,MAh,Mhh,MAh2,Mhh2,AmpTreeAhTohhAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_AhTohhAh(MLambda,em,gs,cplAhAhhh,MAhOS,MhhOS,               & 
& MRPAhTohhAh,MRGAhTohhAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTohhAh(MLambda,em,gs,ZcplAhAhhh,MAhOS,MhhOS,              & 
& MRPAhTohhAh,MRGAhTohhAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_AhTohhAh(MLambda,em,gs,cplAhAhhh,MAh,Mhh,MRPAhTohhAh,       & 
& MRGAhTohhAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTohhAh(MLambda,em,gs,ZcplAhAhhh,MAh,Mhh,MRPAhTohhAh,      & 
& MRGAhTohhAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_AhTohhAh(cplAhAhhh,ctcplAhAhhh,MAh,MAh2,Mhh,            & 
& Mhh2,ZfAh,Zfhh,AmpWaveAhTohhAh)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhTohhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,               & 
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
& AmpVertexAhTohhAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTohhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
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
& AmpVertexIRdrAhTohhAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTohhAh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
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
& AmpVertexIRosAhTohhAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTohhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
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
& AmpVertexIRosAhTohhAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTohhAh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
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
& cplAhhhSdcSdaa,cplAhhhSecSe1,cplAhhhSucSuaa,cplAhhhSvcSv1,AmpVertexIRosAhTohhAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTohhAh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
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
& AmpVertexIRosAhTohhAh)

 End if 
 End if 
AmpVertexAhTohhAh = AmpVertexAhTohhAh -  AmpVertexIRdrAhTohhAh! +  AmpVertexIRosAhTohhAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTohhAh=0._dp 
AmpVertexZAhTohhAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTohhAh(gt2,:,:) = AmpWaveZAhTohhAh(gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTohhAh(gt1,:,:) 
AmpVertexZAhTohhAh(gt2,:,:)= AmpVertexZAhTohhAh(gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTohhAh(gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTohhAh=AmpWaveZAhTohhAh 
AmpVertexAhTohhAh= AmpVertexZAhTohhAh
! Final State 1 
AmpWaveZAhTohhAh=0._dp 
AmpVertexZAhTohhAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTohhAh(:,gt2,:) = AmpWaveZAhTohhAh(:,gt2,:)+ZRUZH(gt2,gt1)*AmpWaveAhTohhAh(:,gt1,:) 
AmpVertexZAhTohhAh(:,gt2,:)= AmpVertexZAhTohhAh(:,gt2,:)+ZRUZH(gt2,gt1)*AmpVertexAhTohhAh(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTohhAh=AmpWaveZAhTohhAh 
AmpVertexAhTohhAh= AmpVertexZAhTohhAh
! Final State 2 
AmpWaveZAhTohhAh=0._dp 
AmpVertexZAhTohhAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTohhAh(:,:,gt2) = AmpWaveZAhTohhAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveAhTohhAh(:,:,gt1) 
AmpVertexZAhTohhAh(:,:,gt2)= AmpVertexZAhTohhAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexAhTohhAh(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTohhAh=AmpWaveZAhTohhAh 
AmpVertexAhTohhAh= AmpVertexZAhTohhAh
End if
If (ShiftIRdiv) Then 
AmpVertexAhTohhAh = AmpVertexAhTohhAh  +  AmpVertexIRosAhTohhAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->hh Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTohhAh = AmpTreeAhTohhAh 
 AmpSum2AhTohhAh = AmpTreeAhTohhAh + 2._dp*AmpWaveAhTohhAh + 2._dp*AmpVertexAhTohhAh  
Else 
 AmpSumAhTohhAh = AmpTreeAhTohhAh + AmpWaveAhTohhAh + AmpVertexAhTohhAh
 AmpSum2AhTohhAh = AmpTreeAhTohhAh + AmpWaveAhTohhAh + AmpVertexAhTohhAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTohhAh = AmpTreeAhTohhAh
 AmpSum2AhTohhAh = AmpTreeAhTohhAh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=3,6
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(MAhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(Mhh(gt2))+Abs(MAh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTohhAh = AmpTreeAhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),MAh(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTohhAh(gt1, gt2, gt3) 
  AmpSum2AhTohhAh = 2._dp*AmpWaveAhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),MAh(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTohhAh(gt1, gt2, gt3) 
  AmpSum2AhTohhAh = 2._dp*AmpVertexAhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),MAh(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTohhAh(gt1, gt2, gt3) 
  AmpSum2AhTohhAh = AmpTreeAhTohhAh + 2._dp*AmpWaveAhTohhAh + 2._dp*AmpVertexAhTohhAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),MAh(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTohhAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTohhAh = AmpTreeAhTohhAh
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
  AmpSqTreeAhTohhAh(gt1, gt2, gt3) = AmpSqAhTohhAh(gt1, gt2, gt3)  
  AmpSum2AhTohhAh = + 2._dp*AmpWaveAhTohhAh + 2._dp*AmpVertexAhTohhAh
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MAhOS(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
  AmpSqAhTohhAh(gt1, gt2, gt3) = AmpSqAhTohhAh(gt1, gt2, gt3) + AmpSqTreeAhTohhAh(gt1, gt2, gt3)  
Else  
  AmpSum2AhTohhAh = AmpTreeAhTohhAh
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),MAh(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
  AmpSqTreeAhTohhAh(gt1, gt2, gt3) = AmpSqAhTohhAh(gt1, gt2, gt3)  
  AmpSum2AhTohhAh = + 2._dp*AmpWaveAhTohhAh + 2._dp*AmpVertexAhTohhAh
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),MAh(gt3),AmpSumAhTohhAh(gt1, gt2, gt3),AmpSum2AhTohhAh(gt1, gt2, gt3),AmpSqAhTohhAh(gt1, gt2, gt3)) 
  AmpSqAhTohhAh(gt1, gt2, gt3) = AmpSqAhTohhAh(gt1, gt2, gt3) + AmpSqTreeAhTohhAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTohhAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTohhAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MhhOS(gt2),MAhOS(gt3),helfactor*AmpSqAhTohhAh(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),Mhh(gt2),MAh(gt3),helfactor*AmpSqAhTohhAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTohhAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTohhAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTohhAh(gt1, gt2, gt3) + MRGAhTohhAh(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTohhAh(gt1, gt2, gt3) + MRGAhTohhAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
! bar(Cha) Cha
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_AhTocChaCha(cplcChaChaAhL,cplcChaChaAhR,MAh,            & 
& MCha,MAh2,MCha2,AmpTreeAhTocChaCha)

  Else 
Call Amplitude_Tree_sec_UMSSM_AhTocChaCha(ZcplcChaChaAhL,ZcplcChaChaAhR,              & 
& MAh,MCha,MAh2,MCha2,AmpTreeAhTocChaCha)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocChaCha(MLambda,em,gs,cplcChaChaAhL,cplcChaChaAhR,      & 
& MAhOS,MChaOS,MRPAhTocChaCha,MRGAhTocChaCha)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocChaCha(MLambda,em,gs,ZcplcChaChaAhL,ZcplcChaChaAhR,    & 
& MAhOS,MChaOS,MRPAhTocChaCha,MRGAhTocChaCha)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_AhTocChaCha(MLambda,em,gs,cplcChaChaAhL,cplcChaChaAhR,      & 
& MAh,MCha,MRPAhTocChaCha,MRGAhTocChaCha)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocChaCha(MLambda,em,gs,ZcplcChaChaAhL,ZcplcChaChaAhR,    & 
& MAh,MCha,MRPAhTocChaCha,MRGAhTocChaCha)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_AhTocChaCha(cplcChaChaAhL,cplcChaChaAhR,ctcplcChaChaAhL,& 
& ctcplcChaChaAhR,MAh,MAh2,MCha,MCha2,ZfAh,ZfLm,ZfLp,AmpWaveAhTocChaCha)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhTocChaCha(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
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
& cplcChacFvSeR,AmpVertexAhTocChaCha)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocChaCha(MAh,MCha,MChi,MFd,MFe,MFu,             & 
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
& cplcChacFvSeR,AmpVertexIRdrAhTocChaCha)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocChaCha(MAhOS,MChaOS,MChiOS,MFdOS,             & 
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
& cplcChacFvSeR,AmpVertexIRosAhTocChaCha)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocChaCha(MAh,MCha,MChi,MFd,MFe,MFu,             & 
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
& cplcChacFvSeR,AmpVertexIRosAhTocChaCha)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocChaCha(MAhOS,MChaOS,MChiOS,MFdOS,             & 
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
& cplcChacFvSeR,AmpVertexIRosAhTocChaCha)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocChaCha(MAh,MCha,MChi,MFd,MFe,MFu,             & 
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
& cplcChacFvSeR,AmpVertexIRosAhTocChaCha)

 End if 
 End if 
AmpVertexAhTocChaCha = AmpVertexAhTocChaCha -  AmpVertexIRdrAhTocChaCha! +  AmpVertexIRosAhTocChaCha ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocChaCha=0._dp 
AmpVertexZAhTocChaCha=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocChaCha(:,gt2,:,:) = AmpWaveZAhTocChaCha(:,gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocChaCha(:,gt1,:,:) 
AmpVertexZAhTocChaCha(:,gt2,:,:)= AmpVertexZAhTocChaCha(:,gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocChaCha(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocChaCha=AmpWaveZAhTocChaCha 
AmpVertexAhTocChaCha= AmpVertexZAhTocChaCha
! Final State 1 
AmpWaveZAhTocChaCha=0._dp 
AmpVertexZAhTocChaCha=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZAhTocChaCha(1,:,gt2,:) = AmpWaveZAhTocChaCha(1,:,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveAhTocChaCha(1,:,gt1,:) 
AmpVertexZAhTocChaCha(1,:,gt2,:)= AmpVertexZAhTocChaCha(1,:,gt2,:)+ZRUUP(gt2,gt1)*AmpVertexAhTocChaCha(1,:,gt1,:) 
AmpWaveZAhTocChaCha(2,:,gt2,:) = AmpWaveZAhTocChaCha(2,:,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveAhTocChaCha(2,:,gt1,:) 
AmpVertexZAhTocChaCha(2,:,gt2,:)= AmpVertexZAhTocChaCha(2,:,gt2,:)+ZRUUMc(gt2,gt1)*AmpVertexAhTocChaCha(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocChaCha=AmpWaveZAhTocChaCha 
AmpVertexAhTocChaCha= AmpVertexZAhTocChaCha
! Final State 2 
AmpWaveZAhTocChaCha=0._dp 
AmpVertexZAhTocChaCha=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZAhTocChaCha(1,:,:,gt2) = AmpWaveZAhTocChaCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveAhTocChaCha(1,:,:,gt1) 
AmpVertexZAhTocChaCha(1,:,:,gt2)= AmpVertexZAhTocChaCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexAhTocChaCha(1,:,:,gt1) 
AmpWaveZAhTocChaCha(2,:,:,gt2) = AmpWaveZAhTocChaCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpWaveAhTocChaCha(2,:,:,gt1) 
AmpVertexZAhTocChaCha(2,:,:,gt2)= AmpVertexZAhTocChaCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpVertexAhTocChaCha(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocChaCha=AmpWaveZAhTocChaCha 
AmpVertexAhTocChaCha= AmpVertexZAhTocChaCha
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocChaCha = AmpVertexAhTocChaCha  +  AmpVertexIRosAhTocChaCha
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->bar[Cha] Cha -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocChaCha = AmpTreeAhTocChaCha 
 AmpSum2AhTocChaCha = AmpTreeAhTocChaCha + 2._dp*AmpWaveAhTocChaCha + 2._dp*AmpVertexAhTocChaCha  
Else 
 AmpSumAhTocChaCha = AmpTreeAhTocChaCha + AmpWaveAhTocChaCha + AmpVertexAhTocChaCha
 AmpSum2AhTocChaCha = AmpTreeAhTocChaCha + AmpWaveAhTocChaCha + AmpVertexAhTocChaCha 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocChaCha = AmpTreeAhTocChaCha
 AmpSum2AhTocChaCha = AmpTreeAhTocChaCha 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,2
    Do gt3=1,2
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MChaOS(gt2))+Abs(MChaOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MCha(gt2))+Abs(MCha(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocChaCha = AmpTreeAhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MCha(gt2),MCha(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocChaCha(gt1, gt2, gt3) 
  AmpSum2AhTocChaCha = 2._dp*AmpWaveAhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MCha(gt2),MCha(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocChaCha(gt1, gt2, gt3) 
  AmpSum2AhTocChaCha = 2._dp*AmpVertexAhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MCha(gt2),MCha(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocChaCha(gt1, gt2, gt3) 
  AmpSum2AhTocChaCha = AmpTreeAhTocChaCha + 2._dp*AmpWaveAhTocChaCha + 2._dp*AmpVertexAhTocChaCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MCha(gt2),MCha(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocChaCha(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocChaCha = AmpTreeAhTocChaCha
  Call SquareAmp_StoFF(MAhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
  AmpSqTreeAhTocChaCha(gt1, gt2, gt3) = AmpSqAhTocChaCha(gt1, gt2, gt3)  
  AmpSum2AhTocChaCha = + 2._dp*AmpWaveAhTocChaCha + 2._dp*AmpVertexAhTocChaCha
  Call SquareAmp_StoFF(MAhOS(gt1),MChaOS(gt2),MChaOS(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
  AmpSqAhTocChaCha(gt1, gt2, gt3) = AmpSqAhTocChaCha(gt1, gt2, gt3) + AmpSqTreeAhTocChaCha(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocChaCha = AmpTreeAhTocChaCha
  Call SquareAmp_StoFF(MAh(gt1),MCha(gt2),MCha(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
  AmpSqTreeAhTocChaCha(gt1, gt2, gt3) = AmpSqAhTocChaCha(gt1, gt2, gt3)  
  AmpSum2AhTocChaCha = + 2._dp*AmpWaveAhTocChaCha + 2._dp*AmpVertexAhTocChaCha
  Call SquareAmp_StoFF(MAh(gt1),MCha(gt2),MCha(gt3),AmpSumAhTocChaCha(:,gt1, gt2, gt3),AmpSum2AhTocChaCha(:,gt1, gt2, gt3),AmpSqAhTocChaCha(gt1, gt2, gt3)) 
  AmpSqAhTocChaCha(gt1, gt2, gt3) = AmpSqAhTocChaCha(gt1, gt2, gt3) + AmpSqTreeAhTocChaCha(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocChaCha(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqAhTocChaCha(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MChaOS(gt2),MChaOS(gt3),helfactor*AmpSqAhTocChaCha(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MCha(gt2),MCha(gt3),helfactor*AmpSqAhTocChaCha(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocChaCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocChaCha(gt1, gt2, gt3) + MRGAhTocChaCha(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocChaCha(gt1, gt2, gt3) + MRGAhTocChaCha(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
Call Amplitude_Tree_sec_UMSSM_AhToChiChi(cplChiChiAhL,cplChiChiAhR,MAh,               & 
& MChi,MAh2,MChi2,AmpTreeAhToChiChi)

  Else 
Call Amplitude_Tree_sec_UMSSM_AhToChiChi(ZcplChiChiAhL,ZcplChiChiAhR,MAh,             & 
& MChi,MAh2,MChi2,AmpTreeAhToChiChi)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_AhToChiChi(MLambda,em,gs,cplChiChiAhL,cplChiChiAhR,         & 
& MAhOS,MChiOS,MRPAhToChiChi,MRGAhToChiChi)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_AhToChiChi(MLambda,em,gs,ZcplChiChiAhL,ZcplChiChiAhR,       & 
& MAhOS,MChiOS,MRPAhToChiChi,MRGAhToChiChi)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_AhToChiChi(MLambda,em,gs,cplChiChiAhL,cplChiChiAhR,         & 
& MAh,MChi,MRPAhToChiChi,MRGAhToChiChi)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_AhToChiChi(MLambda,em,gs,ZcplChiChiAhL,ZcplChiChiAhR,       & 
& MAh,MChi,MRPAhToChiChi,MRGAhToChiChi)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_AhToChiChi(cplChiChiAhL,cplChiChiAhR,ctcplChiChiAhL,    & 
& ctcplChiChiAhR,MAh,MAh2,MChi,MChi2,ZfAh,ZfL0,AmpWaveAhToChiChi)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhToChiChi(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
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
& cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexAhToChiChi)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhToChiChi(MAh,MCha,MChi,MFd,MFe,MFu,              & 
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
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRdrAhToChiChi)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhToChiChi(MAhOS,MChaOS,MChiOS,MFdOS,              & 
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
& cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRosAhToChiChi)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhToChiChi(MAh,MCha,MChi,MFd,MFe,MFu,              & 
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
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRosAhToChiChi)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhToChiChi(MAhOS,MChaOS,MChiOS,MFdOS,              & 
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
& cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRosAhToChiChi)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhToChiChi(MAh,MCha,MChi,MFd,MFe,MFu,              & 
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
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,AmpVertexIRosAhToChiChi)

 End if 
 End if 
AmpVertexAhToChiChi = AmpVertexAhToChiChi -  AmpVertexIRdrAhToChiChi! +  AmpVertexIRosAhToChiChi ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhToChiChi=0._dp 
AmpVertexZAhToChiChi=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhToChiChi(:,gt2,:,:) = AmpWaveZAhToChiChi(:,gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhToChiChi(:,gt1,:,:) 
AmpVertexZAhToChiChi(:,gt2,:,:)= AmpVertexZAhToChiChi(:,gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhToChiChi(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveAhToChiChi=AmpWaveZAhToChiChi 
AmpVertexAhToChiChi= AmpVertexZAhToChiChi
! Final State 1 
AmpWaveZAhToChiChi=0._dp 
AmpVertexZAhToChiChi=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZAhToChiChi(1,:,gt2,:) = AmpWaveZAhToChiChi(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpWaveAhToChiChi(1,:,gt1,:) 
AmpVertexZAhToChiChi(1,:,gt2,:)= AmpVertexZAhToChiChi(1,:,gt2,:)+ZRUZN(gt2,gt1)*AmpVertexAhToChiChi(1,:,gt1,:) 
AmpWaveZAhToChiChi(2,:,gt2,:) = AmpWaveZAhToChiChi(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpWaveAhToChiChi(2,:,gt1,:) 
AmpVertexZAhToChiChi(2,:,gt2,:)= AmpVertexZAhToChiChi(2,:,gt2,:)+ZRUZNc(gt2,gt1)*AmpVertexAhToChiChi(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveAhToChiChi=AmpWaveZAhToChiChi 
AmpVertexAhToChiChi= AmpVertexZAhToChiChi
! Final State 2 
AmpWaveZAhToChiChi=0._dp 
AmpVertexZAhToChiChi=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZAhToChiChi(1,:,:,gt2) = AmpWaveZAhToChiChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveAhToChiChi(1,:,:,gt1) 
AmpVertexZAhToChiChi(1,:,:,gt2)= AmpVertexZAhToChiChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexAhToChiChi(1,:,:,gt1) 
AmpWaveZAhToChiChi(2,:,:,gt2) = AmpWaveZAhToChiChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveAhToChiChi(2,:,:,gt1) 
AmpVertexZAhToChiChi(2,:,:,gt2)= AmpVertexZAhToChiChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexAhToChiChi(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveAhToChiChi=AmpWaveZAhToChiChi 
AmpVertexAhToChiChi= AmpVertexZAhToChiChi
End if
If (ShiftIRdiv) Then 
AmpVertexAhToChiChi = AmpVertexAhToChiChi  +  AmpVertexIRosAhToChiChi
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Chi Chi -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhToChiChi = AmpTreeAhToChiChi 
 AmpSum2AhToChiChi = AmpTreeAhToChiChi + 2._dp*AmpWaveAhToChiChi + 2._dp*AmpVertexAhToChiChi  
Else 
 AmpSumAhToChiChi = AmpTreeAhToChiChi + AmpWaveAhToChiChi + AmpVertexAhToChiChi
 AmpSum2AhToChiChi = AmpTreeAhToChiChi + AmpWaveAhToChiChi + AmpVertexAhToChiChi 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToChiChi = AmpTreeAhToChiChi
 AmpSum2AhToChiChi = AmpTreeAhToChiChi 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,9
    Do gt3=gt2,9
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MChiOS(gt2))+Abs(MChiOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MChi(gt2))+Abs(MChi(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhToChiChi = AmpTreeAhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MChi(gt2),MChi(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhToChiChi(gt1, gt2, gt3) 
  AmpSum2AhToChiChi = 2._dp*AmpWaveAhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MChi(gt2),MChi(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhToChiChi(gt1, gt2, gt3) 
  AmpSum2AhToChiChi = 2._dp*AmpVertexAhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MChi(gt2),MChi(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhToChiChi(gt1, gt2, gt3) 
  AmpSum2AhToChiChi = AmpTreeAhToChiChi + 2._dp*AmpWaveAhToChiChi + 2._dp*AmpVertexAhToChiChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MChi(gt2),MChi(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhToChiChi(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhToChiChi = AmpTreeAhToChiChi
  Call SquareAmp_StoFF(MAhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
  AmpSqTreeAhToChiChi(gt1, gt2, gt3) = AmpSqAhToChiChi(gt1, gt2, gt3)  
  AmpSum2AhToChiChi = + 2._dp*AmpWaveAhToChiChi + 2._dp*AmpVertexAhToChiChi
  Call SquareAmp_StoFF(MAhOS(gt1),MChiOS(gt2),MChiOS(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
  AmpSqAhToChiChi(gt1, gt2, gt3) = AmpSqAhToChiChi(gt1, gt2, gt3) + AmpSqTreeAhToChiChi(gt1, gt2, gt3)  
Else  
  AmpSum2AhToChiChi = AmpTreeAhToChiChi
  Call SquareAmp_StoFF(MAh(gt1),MChi(gt2),MChi(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
  AmpSqTreeAhToChiChi(gt1, gt2, gt3) = AmpSqAhToChiChi(gt1, gt2, gt3)  
  AmpSum2AhToChiChi = + 2._dp*AmpWaveAhToChiChi + 2._dp*AmpVertexAhToChiChi
  Call SquareAmp_StoFF(MAh(gt1),MChi(gt2),MChi(gt3),AmpSumAhToChiChi(:,gt1, gt2, gt3),AmpSum2AhToChiChi(:,gt1, gt2, gt3),AmpSqAhToChiChi(gt1, gt2, gt3)) 
  AmpSqAhToChiChi(gt1, gt2, gt3) = AmpSqAhToChiChi(gt1, gt2, gt3) + AmpSqTreeAhToChiChi(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhToChiChi(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqAhToChiChi(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAhOS(gt1),MChiOS(gt2),MChiOS(gt3),helfactor*AmpSqAhToChiChi(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAh(gt1),MChi(gt2),MChi(gt3),helfactor*AmpSqAhToChiChi(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhToChiChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPAhToChiChi(gt1, gt2, gt3) + MRGAhToChiChi(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPAhToChiChi(gt1, gt2, gt3) + MRGAhToChiChi(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
Call Amplitude_Tree_sec_UMSSM_AhTocFdFd(cplcFdFdAhL,cplcFdFdAhR,MAh,MFd,              & 
& MAh2,MFd2,AmpTreeAhTocFdFd)

  Else 
Call Amplitude_Tree_sec_UMSSM_AhTocFdFd(ZcplcFdFdAhL,ZcplcFdFdAhR,MAh,MFd,            & 
& MAh2,MFd2,AmpTreeAhTocFdFd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocFdFd(MLambda,em,gs,cplcFdFdAhL,cplcFdFdAhR,            & 
& MAhOS,MFdOS,MRPAhTocFdFd,MRGAhTocFdFd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocFdFd(MLambda,em,gs,ZcplcFdFdAhL,ZcplcFdFdAhR,          & 
& MAhOS,MFdOS,MRPAhTocFdFd,MRGAhTocFdFd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_AhTocFdFd(MLambda,em,gs,cplcFdFdAhL,cplcFdFdAhR,            & 
& MAh,MFd,MRPAhTocFdFd,MRGAhTocFdFd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocFdFd(MLambda,em,gs,ZcplcFdFdAhL,ZcplcFdFdAhR,          & 
& MAh,MFd,MRPAhTocFdFd,MRGAhTocFdFd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_AhTocFdFd(cplcFdFdAhL,cplcFdFdAhR,ctcplcFdFdAhL,        & 
& ctcplcFdFdAhR,MAh,MAh2,MFd,MFd2,ZfAh,ZfFDL,ZfFDR,AmpWaveAhTocFdFd)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSucSu,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,           & 
& cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,       & 
& cplcFdGluSdL,cplcFdGluSdR,AmpVertexAhTocFdFd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSucSu,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,           & 
& cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,       & 
& cplcFdGluSdL,cplcFdGluSdR,AmpVertexIRdrAhTocFdFd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocFdFd(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,               & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplChiChiAhL,cplChiChiAhR,ZcplcFdFdAhL,ZcplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,           & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,        & 
& cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,            & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,    & 
& cplcFuFdcVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,        & 
& cplcFdGluSdR,AmpVertexIRosAhTocFdFd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,ZcplcFdFdAhL,ZcplcFdFdAhR,cplcFuFuAhL,         & 
& cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSucSu,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,           & 
& cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,       & 
& cplcFdGluSdL,cplcFdGluSdR,AmpVertexIRosAhTocFdFd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocFdFd(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,               & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,        & 
& cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,         & 
& cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,            & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,              & 
& cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,    & 
& cplcFuFdcVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFdGluSdL,        & 
& cplcFdGluSdR,AmpVertexIRosAhTocFdFd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocFdFd(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSucSu,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,cplChiFdcSdL,cplChiFdcSdR,           & 
& cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWmL,cplcFdFuVWmR,       & 
& cplcFdGluSdL,cplcFdGluSdR,AmpVertexIRosAhTocFdFd)

 End if 
 End if 
AmpVertexAhTocFdFd = AmpVertexAhTocFdFd -  AmpVertexIRdrAhTocFdFd! +  AmpVertexIRosAhTocFdFd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocFdFd=0._dp 
AmpVertexZAhTocFdFd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocFdFd(:,gt2,:,:) = AmpWaveZAhTocFdFd(:,gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocFdFd(:,gt1,:,:) 
AmpVertexZAhTocFdFd(:,gt2,:,:)= AmpVertexZAhTocFdFd(:,gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocFdFd(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocFdFd=AmpWaveZAhTocFdFd 
AmpVertexAhTocFdFd= AmpVertexZAhTocFdFd
! Final State 1 
AmpWaveZAhTocFdFd=0._dp 
AmpVertexZAhTocFdFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFdFd(1,:,gt2,:) = AmpWaveZAhTocFdFd(1,:,gt2,:)+ZRUZDR(gt2,gt1)*AmpWaveAhTocFdFd(1,:,gt1,:) 
AmpVertexZAhTocFdFd(1,:,gt2,:)= AmpVertexZAhTocFdFd(1,:,gt2,:)+ZRUZDR(gt2,gt1)*AmpVertexAhTocFdFd(1,:,gt1,:) 
AmpWaveZAhTocFdFd(2,:,gt2,:) = AmpWaveZAhTocFdFd(2,:,gt2,:)+ZRUZDLc(gt2,gt1)*AmpWaveAhTocFdFd(2,:,gt1,:) 
AmpVertexZAhTocFdFd(2,:,gt2,:)= AmpVertexZAhTocFdFd(2,:,gt2,:)+ZRUZDLc(gt2,gt1)*AmpVertexAhTocFdFd(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocFdFd=AmpWaveZAhTocFdFd 
AmpVertexAhTocFdFd= AmpVertexZAhTocFdFd
! Final State 2 
AmpWaveZAhTocFdFd=0._dp 
AmpVertexZAhTocFdFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFdFd(1,:,:,gt2) = AmpWaveZAhTocFdFd(1,:,:,gt2)+ZRUZDL(gt2,gt1)*AmpWaveAhTocFdFd(1,:,:,gt1) 
AmpVertexZAhTocFdFd(1,:,:,gt2)= AmpVertexZAhTocFdFd(1,:,:,gt2)+ZRUZDL(gt2,gt1)*AmpVertexAhTocFdFd(1,:,:,gt1) 
AmpWaveZAhTocFdFd(2,:,:,gt2) = AmpWaveZAhTocFdFd(2,:,:,gt2)+ZRUZDR(gt2,gt1)*AmpWaveAhTocFdFd(2,:,:,gt1) 
AmpVertexZAhTocFdFd(2,:,:,gt2)= AmpVertexZAhTocFdFd(2,:,:,gt2)+ZRUZDR(gt2,gt1)*AmpVertexAhTocFdFd(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocFdFd=AmpWaveZAhTocFdFd 
AmpVertexAhTocFdFd= AmpVertexZAhTocFdFd
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocFdFd = AmpVertexAhTocFdFd  +  AmpVertexIRosAhTocFdFd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->bar[Fd] Fd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocFdFd = AmpTreeAhTocFdFd 
 AmpSum2AhTocFdFd = AmpTreeAhTocFdFd + 2._dp*AmpWaveAhTocFdFd + 2._dp*AmpVertexAhTocFdFd  
Else 
 AmpSumAhTocFdFd = AmpTreeAhTocFdFd + AmpWaveAhTocFdFd + AmpVertexAhTocFdFd
 AmpSum2AhTocFdFd = AmpTreeAhTocFdFd + AmpWaveAhTocFdFd + AmpVertexAhTocFdFd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocFdFd = AmpTreeAhTocFdFd
 AmpSum2AhTocFdFd = AmpTreeAhTocFdFd 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MFdOS(gt2))+Abs(MFdOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MFd(gt2))+Abs(MFd(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocFdFd = AmpTreeAhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocFdFd(gt1, gt2, gt3) 
  AmpSum2AhTocFdFd = 2._dp*AmpWaveAhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocFdFd(gt1, gt2, gt3) 
  AmpSum2AhTocFdFd = 2._dp*AmpVertexAhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocFdFd(gt1, gt2, gt3) 
  AmpSum2AhTocFdFd = AmpTreeAhTocFdFd + 2._dp*AmpWaveAhTocFdFd + 2._dp*AmpVertexAhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocFdFd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocFdFd = AmpTreeAhTocFdFd
  Call SquareAmp_StoFF(MAhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
  AmpSqTreeAhTocFdFd(gt1, gt2, gt3) = AmpSqAhTocFdFd(gt1, gt2, gt3)  
  AmpSum2AhTocFdFd = + 2._dp*AmpWaveAhTocFdFd + 2._dp*AmpVertexAhTocFdFd
  Call SquareAmp_StoFF(MAhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
  AmpSqAhTocFdFd(gt1, gt2, gt3) = AmpSqAhTocFdFd(gt1, gt2, gt3) + AmpSqTreeAhTocFdFd(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocFdFd = AmpTreeAhTocFdFd
  Call SquareAmp_StoFF(MAh(gt1),MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
  AmpSqTreeAhTocFdFd(gt1, gt2, gt3) = AmpSqAhTocFdFd(gt1, gt2, gt3)  
  AmpSum2AhTocFdFd = + 2._dp*AmpWaveAhTocFdFd + 2._dp*AmpVertexAhTocFdFd
  Call SquareAmp_StoFF(MAh(gt1),MFd(gt2),MFd(gt3),AmpSumAhTocFdFd(:,gt1, gt2, gt3),AmpSum2AhTocFdFd(:,gt1, gt2, gt3),AmpSqAhTocFdFd(gt1, gt2, gt3)) 
  AmpSqAhTocFdFd(gt1, gt2, gt3) = AmpSqAhTocFdFd(gt1, gt2, gt3) + AmpSqTreeAhTocFdFd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocFdFd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqAhTocFdFd(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAhOS(gt1),MFdOS(gt2),MFdOS(gt3),helfactor*AmpSqAhTocFdFd(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAh(gt1),MFd(gt2),MFd(gt3),helfactor*AmpSqAhTocFdFd(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocFdFd(gt1, gt2, gt3) + MRGAhTocFdFd(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocFdFd(gt1, gt2, gt3) + MRGAhTocFdFd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
Call Amplitude_Tree_sec_UMSSM_AhTocFeFe(cplcFeFeAhL,cplcFeFeAhR,MAh,MFe,              & 
& MAh2,MFe2,AmpTreeAhTocFeFe)

  Else 
Call Amplitude_Tree_sec_UMSSM_AhTocFeFe(ZcplcFeFeAhL,ZcplcFeFeAhR,MAh,MFe,            & 
& MAh2,MFe2,AmpTreeAhTocFeFe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocFeFe(MLambda,em,gs,cplcFeFeAhL,cplcFeFeAhR,            & 
& MAhOS,MFeOS,MRPAhTocFeFe,MRGAhTocFeFe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocFeFe(MLambda,em,gs,ZcplcFeFeAhL,ZcplcFeFeAhR,          & 
& MAhOS,MFeOS,MRPAhTocFeFe,MRGAhTocFeFe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_AhTocFeFe(MLambda,em,gs,cplcFeFeAhL,cplcFeFeAhR,            & 
& MAh,MFe,MRPAhTocFeFe,MRGAhTocFeFe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocFeFe(MLambda,em,gs,ZcplcFeFeAhL,ZcplcFeFeAhR,          & 
& MAh,MFe,MRPAhTocFeFe,MRGAhTocFeFe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_AhTocFeFe(cplcFeFeAhL,cplcFeFeAhR,ctcplcFeFeAhL,        & 
& ctcplcFeFeAhR,MAh,MAh2,MFe,MFe2,ZfAh,ZfFEL,ZfFER,AmpWaveAhTocFeFe)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhTocFeFe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,             & 
& MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,    & 
& cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,      & 
& cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvcSv,cplAhcHpmVWm,               & 
& cplcFeChaSvL,cplcFeChaSvR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,     & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,       & 
& AmpVertexAhTocFeFe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocFeFe(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,            & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvcSv,        & 
& cplAhcHpmVWm,cplcFeChaSvL,cplcFeChaSvR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,         & 
& cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,       & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,      & 
& cplcFeFvVWmR,AmpVertexIRdrAhTocFeFe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocFeFe(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,      & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,ZcplcFeFeAhL,          & 
& ZcplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,      & 
& cplAhHpmcVWm,cplAhSecSe,cplAhSvcSv,cplAhcHpmVWm,cplcFeChaSvL,cplcFeChaSvR,             & 
& cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,   & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,AmpVertexIRosAhTocFeFe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocFeFe(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,            & 
& cplChiChiAhL,cplChiChiAhR,ZcplcFeFeAhL,ZcplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,           & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvcSv,        & 
& cplAhcHpmVWm,cplcFeChaSvL,cplcFeChaSvR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,         & 
& cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,       & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,      & 
& cplcFeFvVWmR,AmpVertexIRosAhTocFeFe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocFeFe(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,      & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,       & 
& cplAhHpmcVWm,cplAhSecSe,cplAhSvcSv,cplAhcHpmVWm,cplcFeChaSvL,cplcFeChaSvR,             & 
& cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,   & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,AmpVertexIRosAhTocFeFe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocFeFe(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,            & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvcSv,        & 
& cplAhcHpmVWm,cplcFeChaSvL,cplcFeChaSvR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,         & 
& cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,       & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,      & 
& cplcFeFvVWmR,AmpVertexIRosAhTocFeFe)

 End if 
 End if 
AmpVertexAhTocFeFe = AmpVertexAhTocFeFe -  AmpVertexIRdrAhTocFeFe! +  AmpVertexIRosAhTocFeFe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocFeFe=0._dp 
AmpVertexZAhTocFeFe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocFeFe(:,gt2,:,:) = AmpWaveZAhTocFeFe(:,gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocFeFe(:,gt1,:,:) 
AmpVertexZAhTocFeFe(:,gt2,:,:)= AmpVertexZAhTocFeFe(:,gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocFeFe(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocFeFe=AmpWaveZAhTocFeFe 
AmpVertexAhTocFeFe= AmpVertexZAhTocFeFe
! Final State 1 
AmpWaveZAhTocFeFe=0._dp 
AmpVertexZAhTocFeFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFeFe(1,:,gt2,:) = AmpWaveZAhTocFeFe(1,:,gt2,:)+ZRUZER(gt2,gt1)*AmpWaveAhTocFeFe(1,:,gt1,:) 
AmpVertexZAhTocFeFe(1,:,gt2,:)= AmpVertexZAhTocFeFe(1,:,gt2,:)+ZRUZER(gt2,gt1)*AmpVertexAhTocFeFe(1,:,gt1,:) 
AmpWaveZAhTocFeFe(2,:,gt2,:) = AmpWaveZAhTocFeFe(2,:,gt2,:)+ZRUZELc(gt2,gt1)*AmpWaveAhTocFeFe(2,:,gt1,:) 
AmpVertexZAhTocFeFe(2,:,gt2,:)= AmpVertexZAhTocFeFe(2,:,gt2,:)+ZRUZELc(gt2,gt1)*AmpVertexAhTocFeFe(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocFeFe=AmpWaveZAhTocFeFe 
AmpVertexAhTocFeFe= AmpVertexZAhTocFeFe
! Final State 2 
AmpWaveZAhTocFeFe=0._dp 
AmpVertexZAhTocFeFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFeFe(1,:,:,gt2) = AmpWaveZAhTocFeFe(1,:,:,gt2)+ZRUZEL(gt2,gt1)*AmpWaveAhTocFeFe(1,:,:,gt1) 
AmpVertexZAhTocFeFe(1,:,:,gt2)= AmpVertexZAhTocFeFe(1,:,:,gt2)+ZRUZEL(gt2,gt1)*AmpVertexAhTocFeFe(1,:,:,gt1) 
AmpWaveZAhTocFeFe(2,:,:,gt2) = AmpWaveZAhTocFeFe(2,:,:,gt2)+ZRUZER(gt2,gt1)*AmpWaveAhTocFeFe(2,:,:,gt1) 
AmpVertexZAhTocFeFe(2,:,:,gt2)= AmpVertexZAhTocFeFe(2,:,:,gt2)+ZRUZER(gt2,gt1)*AmpVertexAhTocFeFe(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocFeFe=AmpWaveZAhTocFeFe 
AmpVertexAhTocFeFe= AmpVertexZAhTocFeFe
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocFeFe = AmpVertexAhTocFeFe  +  AmpVertexIRosAhTocFeFe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->bar[Fe] Fe -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocFeFe = AmpTreeAhTocFeFe 
 AmpSum2AhTocFeFe = AmpTreeAhTocFeFe + 2._dp*AmpWaveAhTocFeFe + 2._dp*AmpVertexAhTocFeFe  
Else 
 AmpSumAhTocFeFe = AmpTreeAhTocFeFe + AmpWaveAhTocFeFe + AmpVertexAhTocFeFe
 AmpSum2AhTocFeFe = AmpTreeAhTocFeFe + AmpWaveAhTocFeFe + AmpVertexAhTocFeFe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocFeFe = AmpTreeAhTocFeFe
 AmpSum2AhTocFeFe = AmpTreeAhTocFeFe 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(MFeOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MFe(gt2))+Abs(MFe(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocFeFe = AmpTreeAhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFe(gt2),MFe(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocFeFe(gt1, gt2, gt3) 
  AmpSum2AhTocFeFe = 2._dp*AmpWaveAhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFe(gt2),MFe(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocFeFe(gt1, gt2, gt3) 
  AmpSum2AhTocFeFe = 2._dp*AmpVertexAhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFe(gt2),MFe(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocFeFe(gt1, gt2, gt3) 
  AmpSum2AhTocFeFe = AmpTreeAhTocFeFe + 2._dp*AmpWaveAhTocFeFe + 2._dp*AmpVertexAhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFe(gt2),MFe(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocFeFe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocFeFe = AmpTreeAhTocFeFe
  Call SquareAmp_StoFF(MAhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
  AmpSqTreeAhTocFeFe(gt1, gt2, gt3) = AmpSqAhTocFeFe(gt1, gt2, gt3)  
  AmpSum2AhTocFeFe = + 2._dp*AmpWaveAhTocFeFe + 2._dp*AmpVertexAhTocFeFe
  Call SquareAmp_StoFF(MAhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
  AmpSqAhTocFeFe(gt1, gt2, gt3) = AmpSqAhTocFeFe(gt1, gt2, gt3) + AmpSqTreeAhTocFeFe(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocFeFe = AmpTreeAhTocFeFe
  Call SquareAmp_StoFF(MAh(gt1),MFe(gt2),MFe(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
  AmpSqTreeAhTocFeFe(gt1, gt2, gt3) = AmpSqAhTocFeFe(gt1, gt2, gt3)  
  AmpSum2AhTocFeFe = + 2._dp*AmpWaveAhTocFeFe + 2._dp*AmpVertexAhTocFeFe
  Call SquareAmp_StoFF(MAh(gt1),MFe(gt2),MFe(gt3),AmpSumAhTocFeFe(:,gt1, gt2, gt3),AmpSum2AhTocFeFe(:,gt1, gt2, gt3),AmpSqAhTocFeFe(gt1, gt2, gt3)) 
  AmpSqAhTocFeFe(gt1, gt2, gt3) = AmpSqAhTocFeFe(gt1, gt2, gt3) + AmpSqTreeAhTocFeFe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocFeFe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqAhTocFeFe(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MFeOS(gt2),MFeOS(gt3),helfactor*AmpSqAhTocFeFe(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MFe(gt2),MFe(gt3),helfactor*AmpSqAhTocFeFe(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocFeFe(gt1, gt2, gt3) + MRGAhTocFeFe(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocFeFe(gt1, gt2, gt3) + MRGAhTocFeFe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
Call Amplitude_Tree_sec_UMSSM_AhTocFuFu(cplcFuFuAhL,cplcFuFuAhR,MAh,MFu,              & 
& MAh2,MFu2,AmpTreeAhTocFuFu)

  Else 
Call Amplitude_Tree_sec_UMSSM_AhTocFuFu(ZcplcFuFuAhL,ZcplcFuFuAhR,MAh,MFu,            & 
& MAh2,MFu2,AmpTreeAhTocFuFu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocFuFu(MLambda,em,gs,cplcFuFuAhL,cplcFuFuAhR,            & 
& MAhOS,MFuOS,MRPAhTocFuFu,MRGAhTocFuFu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocFuFu(MLambda,em,gs,ZcplcFuFuAhL,ZcplcFuFuAhR,          & 
& MAhOS,MFuOS,MRPAhTocFuFu,MRGAhTocFuFu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_AhTocFuFu(MLambda,em,gs,cplcFuFuAhL,cplcFuFuAhR,            & 
& MAh,MFu,MRPAhTocFuFu,MRGAhTocFuFu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocFuFu(MLambda,em,gs,ZcplcFuFuAhL,ZcplcFuFuAhR,          & 
& MAh,MFu,MRPAhTocFuFu,MRGAhTocFuFu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_AhTocFuFu(cplcFuFuAhL,cplcFuFuAhR,ctcplcFuFuAhL,        & 
& ctcplcFuFuAhR,MAh,MAh2,MFu,MFu2,ZfAh,ZfFUL,ZfFUR,AmpWaveAhTocFuFu)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,Mhh2,              & 
& MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,          & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSucSu,cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFucSuL,cplChiFucSuR,           & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,     & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexAhTocFuFu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSucSu,cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFucSuL,cplChiFucSuR,           & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,     & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRdrAhTocFuFu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocFuFu(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,               & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,ZcplcFuFuAhL,ZcplcFuFuAhR,           & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,        & 
& cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,     & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,         & 
& cplcChacFuSdR,AmpVertexIRosAhTocFuFu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,ZcplcFuFuAhL,          & 
& ZcplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,      & 
& cplAhSucSu,cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFucSuL,cplChiFucSuR,           & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,     & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosAhTocFuFu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocFuFu(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSuOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,              & 
& MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSu2OS,MVG2,               & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSucSu,        & 
& cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,         & 
& cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,     & 
& cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFuFuVGL,            & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,         & 
& cplcChacFuSdR,AmpVertexIRosAhTocFuFu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocFuFu(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,               & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSucSu,cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,cplChiFucSuL,cplChiFucSuR,           & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,     & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWmL,cplcFdFuVWmR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFuGluSuL,cplcFuGluSuR,           & 
& cplcChacFuSdL,cplcChacFuSdR,AmpVertexIRosAhTocFuFu)

 End if 
 End if 
AmpVertexAhTocFuFu = AmpVertexAhTocFuFu -  AmpVertexIRdrAhTocFuFu! +  AmpVertexIRosAhTocFuFu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocFuFu=0._dp 
AmpVertexZAhTocFuFu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocFuFu(:,gt2,:,:) = AmpWaveZAhTocFuFu(:,gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocFuFu(:,gt1,:,:) 
AmpVertexZAhTocFuFu(:,gt2,:,:)= AmpVertexZAhTocFuFu(:,gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocFuFu(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocFuFu=AmpWaveZAhTocFuFu 
AmpVertexAhTocFuFu= AmpVertexZAhTocFuFu
! Final State 1 
AmpWaveZAhTocFuFu=0._dp 
AmpVertexZAhTocFuFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFuFu(1,:,gt2,:) = AmpWaveZAhTocFuFu(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpWaveAhTocFuFu(1,:,gt1,:) 
AmpVertexZAhTocFuFu(1,:,gt2,:)= AmpVertexZAhTocFuFu(1,:,gt2,:)+ZRUZUR(gt2,gt1)*AmpVertexAhTocFuFu(1,:,gt1,:) 
AmpWaveZAhTocFuFu(2,:,gt2,:) = AmpWaveZAhTocFuFu(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpWaveAhTocFuFu(2,:,gt1,:) 
AmpVertexZAhTocFuFu(2,:,gt2,:)= AmpVertexZAhTocFuFu(2,:,gt2,:)+ZRUZULc(gt2,gt1)*AmpVertexAhTocFuFu(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocFuFu=AmpWaveZAhTocFuFu 
AmpVertexAhTocFuFu= AmpVertexZAhTocFuFu
! Final State 2 
AmpWaveZAhTocFuFu=0._dp 
AmpVertexZAhTocFuFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFuFu(1,:,:,gt2) = AmpWaveZAhTocFuFu(1,:,:,gt2)+ZRUZUL(gt2,gt1)*AmpWaveAhTocFuFu(1,:,:,gt1) 
AmpVertexZAhTocFuFu(1,:,:,gt2)= AmpVertexZAhTocFuFu(1,:,:,gt2)+ZRUZUL(gt2,gt1)*AmpVertexAhTocFuFu(1,:,:,gt1) 
AmpWaveZAhTocFuFu(2,:,:,gt2) = AmpWaveZAhTocFuFu(2,:,:,gt2)+ZRUZUR(gt2,gt1)*AmpWaveAhTocFuFu(2,:,:,gt1) 
AmpVertexZAhTocFuFu(2,:,:,gt2)= AmpVertexZAhTocFuFu(2,:,:,gt2)+ZRUZUR(gt2,gt1)*AmpVertexAhTocFuFu(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocFuFu=AmpWaveZAhTocFuFu 
AmpVertexAhTocFuFu= AmpVertexZAhTocFuFu
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocFuFu = AmpVertexAhTocFuFu  +  AmpVertexIRosAhTocFuFu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->bar[Fu] Fu -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocFuFu = AmpTreeAhTocFuFu 
 AmpSum2AhTocFuFu = AmpTreeAhTocFuFu + 2._dp*AmpWaveAhTocFuFu + 2._dp*AmpVertexAhTocFuFu  
Else 
 AmpSumAhTocFuFu = AmpTreeAhTocFuFu + AmpWaveAhTocFuFu + AmpVertexAhTocFuFu
 AmpSum2AhTocFuFu = AmpTreeAhTocFuFu + AmpWaveAhTocFuFu + AmpVertexAhTocFuFu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocFuFu = AmpTreeAhTocFuFu
 AmpSum2AhTocFuFu = AmpTreeAhTocFuFu 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MFuOS(gt2))+Abs(MFuOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MFu(gt2))+Abs(MFu(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocFuFu = AmpTreeAhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocFuFu(gt1, gt2, gt3) 
  AmpSum2AhTocFuFu = 2._dp*AmpWaveAhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocFuFu(gt1, gt2, gt3) 
  AmpSum2AhTocFuFu = 2._dp*AmpVertexAhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocFuFu(gt1, gt2, gt3) 
  AmpSum2AhTocFuFu = AmpTreeAhTocFuFu + 2._dp*AmpWaveAhTocFuFu + 2._dp*AmpVertexAhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocFuFu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocFuFu = AmpTreeAhTocFuFu
  Call SquareAmp_StoFF(MAhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
  AmpSqTreeAhTocFuFu(gt1, gt2, gt3) = AmpSqAhTocFuFu(gt1, gt2, gt3)  
  AmpSum2AhTocFuFu = + 2._dp*AmpWaveAhTocFuFu + 2._dp*AmpVertexAhTocFuFu
  Call SquareAmp_StoFF(MAhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
  AmpSqAhTocFuFu(gt1, gt2, gt3) = AmpSqAhTocFuFu(gt1, gt2, gt3) + AmpSqTreeAhTocFuFu(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocFuFu = AmpTreeAhTocFuFu
  Call SquareAmp_StoFF(MAh(gt1),MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
  AmpSqTreeAhTocFuFu(gt1, gt2, gt3) = AmpSqAhTocFuFu(gt1, gt2, gt3)  
  AmpSum2AhTocFuFu = + 2._dp*AmpWaveAhTocFuFu + 2._dp*AmpVertexAhTocFuFu
  Call SquareAmp_StoFF(MAh(gt1),MFu(gt2),MFu(gt3),AmpSumAhTocFuFu(:,gt1, gt2, gt3),AmpSum2AhTocFuFu(:,gt1, gt2, gt3),AmpSqAhTocFuFu(gt1, gt2, gt3)) 
  AmpSqAhTocFuFu(gt1, gt2, gt3) = AmpSqAhTocFuFu(gt1, gt2, gt3) + AmpSqTreeAhTocFuFu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocFuFu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqAhTocFuFu(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAhOS(gt1),MFuOS(gt2),MFuOS(gt3),helfactor*AmpSqAhTocFuFu(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAh(gt1),MFu(gt2),MFu(gt3),helfactor*AmpSqAhTocFuFu(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocFuFu(gt1, gt2, gt3) + MRGAhTocFuFu(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocFuFu(gt1, gt2, gt3) + MRGAhTocFuFu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
Call Amplitude_Tree_sec_UMSSM_AhTocFvFv(cplcFvFvAhL,cplcFvFvAhR,MAh,MFv,              & 
& MAh2,MFv2,AmpTreeAhTocFvFv)

  Else 
Call Amplitude_Tree_sec_UMSSM_AhTocFvFv(ZcplcFvFvAhL,ZcplcFvFvAhR,MAh,MFv,            & 
& MAh2,MFv2,AmpTreeAhTocFvFv)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocFvFv(MLambda,em,gs,cplcFvFvAhL,cplcFvFvAhR,            & 
& MAhOS,MFvOS,MRPAhTocFvFv,MRGAhTocFvFv)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocFvFv(MLambda,em,gs,ZcplcFvFvAhL,ZcplcFvFvAhR,          & 
& MAhOS,MFvOS,MRPAhTocFvFv,MRGAhTocFvFv)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_AhTocFvFv(MLambda,em,gs,cplcFvFvAhL,cplcFvFvAhR,            & 
& MAh,MFv,MRPAhTocFvFv,MRGAhTocFvFv)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocFvFv(MLambda,em,gs,ZcplcFvFvAhL,ZcplcFvFvAhR,          & 
& MAh,MFv,MRPAhTocFvFv,MRGAhTocFvFv)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_AhTocFvFv(cplcFvFvAhL,cplcFvFvAhR,ctcplcFvFvAhL,        & 
& ctcplcFvFvAhR,MAh,MAh2,MFv,MFv2,ZfAh,ZfFVL,ZfFVR,AmpWaveAhTocFvFv)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhTocFvFv(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,MVWm2,           & 
& MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,               & 
& cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,      & 
& cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvcSv,cplAhcHpmVWm,               & 
& cplChaFvcSeL,cplChaFvcSeR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvhhL,cplcFvFvhhR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,           & 
& cplcFvFvVZpL,cplcFvFvVZpR,cplcChacFvSeL,cplcChacFvSeR,AmpVertexAhTocFvFv)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocFvFv(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,            & 
& MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,         & 
& cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,      & 
& cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvcSv,cplAhcHpmVWm,               & 
& cplChaFvcSeL,cplChaFvcSeR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvhhL,cplcFvFvhhR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,           & 
& cplcFvFvVZpL,cplcFvFvVZpR,cplcChacFvSeL,cplcChacFvSeR,AmpVertexIRdrAhTocFvFv)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocFvFv(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,             & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,ZcplcFvFvAhL,ZcplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,     & 
& cplAhHpmcVWm,cplAhSecSe,cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,cplChaFvcSeR,             & 
& cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcFvFecHpmL,cplcFvFecHpmR,       & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,         & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,           & 
& cplcChacFvSeL,cplcChacFvSeR,AmpVertexIRosAhTocFvFv)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocFvFv(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,            & 
& MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,         & 
& cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,ZcplcFvFvAhL,ZcplcFvFvAhR,cplAhhhhh,              & 
& cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvcSv,cplAhcHpmVWm,     & 
& cplChaFvcSeL,cplChaFvcSeR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvhhL,cplcFvFvhhR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,           & 
& cplcFvFvVZpL,cplcFvFvVZpR,cplcChacFvSeL,cplcChacFvSeR,AmpVertexIRosAhTocFvFv)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocFvFv(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,             & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,           & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,       & 
& cplAhHpmcVWm,cplAhSecSe,cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,cplChaFvcSeR,             & 
& cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcFvFecHpmL,cplcFvFecHpmR,       & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,         & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,           & 
& cplcChacFvSeL,cplcChacFvSeR,AmpVertexIRosAhTocFvFv)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocFvFv(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,            & 
& MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,         & 
& cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,      & 
& cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvcSv,cplAhcHpmVWm,               & 
& cplChaFvcSeL,cplChaFvcSeR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcFvFvhhL,cplcFvFvhhR,       & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,           & 
& cplcFvFvVZpL,cplcFvFvVZpR,cplcChacFvSeL,cplcChacFvSeR,AmpVertexIRosAhTocFvFv)

 End if 
 End if 
AmpVertexAhTocFvFv = AmpVertexAhTocFvFv -  AmpVertexIRdrAhTocFvFv! +  AmpVertexIRosAhTocFvFv ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocFvFv=0._dp 
AmpVertexZAhTocFvFv=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocFvFv(:,gt2,:,:) = AmpWaveZAhTocFvFv(:,gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocFvFv(:,gt1,:,:) 
AmpVertexZAhTocFvFv(:,gt2,:,:)= AmpVertexZAhTocFvFv(:,gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocFvFv(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocFvFv=AmpWaveZAhTocFvFv 
AmpVertexAhTocFvFv= AmpVertexZAhTocFvFv
! Final State 1 
AmpWaveZAhTocFvFv=0._dp 
AmpVertexZAhTocFvFv=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFvFv(1,:,gt2,:) = AmpWaveZAhTocFvFv(1,:,gt2,:)+ZRUZVR(gt2,gt1)*AmpWaveAhTocFvFv(1,:,gt1,:) 
AmpVertexZAhTocFvFv(1,:,gt2,:)= AmpVertexZAhTocFvFv(1,:,gt2,:)+ZRUZVR(gt2,gt1)*AmpVertexAhTocFvFv(1,:,gt1,:) 
AmpWaveZAhTocFvFv(2,:,gt2,:) = AmpWaveZAhTocFvFv(2,:,gt2,:)+ZRUZVLc(gt2,gt1)*AmpWaveAhTocFvFv(2,:,gt1,:) 
AmpVertexZAhTocFvFv(2,:,gt2,:)= AmpVertexZAhTocFvFv(2,:,gt2,:)+ZRUZVLc(gt2,gt1)*AmpVertexAhTocFvFv(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocFvFv=AmpWaveZAhTocFvFv 
AmpVertexAhTocFvFv= AmpVertexZAhTocFvFv
! Final State 2 
AmpWaveZAhTocFvFv=0._dp 
AmpVertexZAhTocFvFv=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZAhTocFvFv(1,:,:,gt2) = AmpWaveZAhTocFvFv(1,:,:,gt2)+ZRUZVL(gt2,gt1)*AmpWaveAhTocFvFv(1,:,:,gt1) 
AmpVertexZAhTocFvFv(1,:,:,gt2)= AmpVertexZAhTocFvFv(1,:,:,gt2)+ZRUZVL(gt2,gt1)*AmpVertexAhTocFvFv(1,:,:,gt1) 
AmpWaveZAhTocFvFv(2,:,:,gt2) = AmpWaveZAhTocFvFv(2,:,:,gt2)+ZRUZVR(gt2,gt1)*AmpWaveAhTocFvFv(2,:,:,gt1) 
AmpVertexZAhTocFvFv(2,:,:,gt2)= AmpVertexZAhTocFvFv(2,:,:,gt2)+ZRUZVR(gt2,gt1)*AmpVertexAhTocFvFv(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocFvFv=AmpWaveZAhTocFvFv 
AmpVertexAhTocFvFv= AmpVertexZAhTocFvFv
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocFvFv = AmpVertexAhTocFvFv  +  AmpVertexIRosAhTocFvFv
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->bar[Fv] Fv -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocFvFv = AmpTreeAhTocFvFv 
 AmpSum2AhTocFvFv = AmpTreeAhTocFvFv + 2._dp*AmpWaveAhTocFvFv + 2._dp*AmpVertexAhTocFvFv  
Else 
 AmpSumAhTocFvFv = AmpTreeAhTocFvFv + AmpWaveAhTocFvFv + AmpVertexAhTocFvFv
 AmpSum2AhTocFvFv = AmpTreeAhTocFvFv + AmpWaveAhTocFvFv + AmpVertexAhTocFvFv 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocFvFv = AmpTreeAhTocFvFv
 AmpSum2AhTocFvFv = AmpTreeAhTocFvFv 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MFvOS(gt2))+Abs(MFvOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MFv(gt2))+Abs(MFv(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocFvFv = AmpTreeAhTocFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumAhTocFvFv(:,gt1, gt2, gt3),AmpSum2AhTocFvFv(:,gt1, gt2, gt3),AmpSqAhTocFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFv(gt2),MFv(gt3),AmpSumAhTocFvFv(:,gt1, gt2, gt3),AmpSum2AhTocFvFv(:,gt1, gt2, gt3),AmpSqAhTocFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocFvFv(gt1, gt2, gt3) 
  AmpSum2AhTocFvFv = 2._dp*AmpWaveAhTocFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumAhTocFvFv(:,gt1, gt2, gt3),AmpSum2AhTocFvFv(:,gt1, gt2, gt3),AmpSqAhTocFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFv(gt2),MFv(gt3),AmpSumAhTocFvFv(:,gt1, gt2, gt3),AmpSum2AhTocFvFv(:,gt1, gt2, gt3),AmpSqAhTocFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocFvFv(gt1, gt2, gt3) 
  AmpSum2AhTocFvFv = 2._dp*AmpVertexAhTocFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumAhTocFvFv(:,gt1, gt2, gt3),AmpSum2AhTocFvFv(:,gt1, gt2, gt3),AmpSqAhTocFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFv(gt2),MFv(gt3),AmpSumAhTocFvFv(:,gt1, gt2, gt3),AmpSum2AhTocFvFv(:,gt1, gt2, gt3),AmpSqAhTocFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocFvFv(gt1, gt2, gt3) 
  AmpSum2AhTocFvFv = AmpTreeAhTocFvFv + 2._dp*AmpWaveAhTocFvFv + 2._dp*AmpVertexAhTocFvFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumAhTocFvFv(:,gt1, gt2, gt3),AmpSum2AhTocFvFv(:,gt1, gt2, gt3),AmpSqAhTocFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MFv(gt2),MFv(gt3),AmpSumAhTocFvFv(:,gt1, gt2, gt3),AmpSum2AhTocFvFv(:,gt1, gt2, gt3),AmpSqAhTocFvFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocFvFv(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocFvFv = AmpTreeAhTocFvFv
  Call SquareAmp_StoFF(MAhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumAhTocFvFv(:,gt1, gt2, gt3),AmpSum2AhTocFvFv(:,gt1, gt2, gt3),AmpSqAhTocFvFv(gt1, gt2, gt3)) 
  AmpSqTreeAhTocFvFv(gt1, gt2, gt3) = AmpSqAhTocFvFv(gt1, gt2, gt3)  
  AmpSum2AhTocFvFv = + 2._dp*AmpWaveAhTocFvFv + 2._dp*AmpVertexAhTocFvFv
  Call SquareAmp_StoFF(MAhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumAhTocFvFv(:,gt1, gt2, gt3),AmpSum2AhTocFvFv(:,gt1, gt2, gt3),AmpSqAhTocFvFv(gt1, gt2, gt3)) 
  AmpSqAhTocFvFv(gt1, gt2, gt3) = AmpSqAhTocFvFv(gt1, gt2, gt3) + AmpSqTreeAhTocFvFv(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocFvFv = AmpTreeAhTocFvFv
  Call SquareAmp_StoFF(MAh(gt1),MFv(gt2),MFv(gt3),AmpSumAhTocFvFv(:,gt1, gt2, gt3),AmpSum2AhTocFvFv(:,gt1, gt2, gt3),AmpSqAhTocFvFv(gt1, gt2, gt3)) 
  AmpSqTreeAhTocFvFv(gt1, gt2, gt3) = AmpSqAhTocFvFv(gt1, gt2, gt3)  
  AmpSum2AhTocFvFv = + 2._dp*AmpWaveAhTocFvFv + 2._dp*AmpVertexAhTocFvFv
  Call SquareAmp_StoFF(MAh(gt1),MFv(gt2),MFv(gt3),AmpSumAhTocFvFv(:,gt1, gt2, gt3),AmpSum2AhTocFvFv(:,gt1, gt2, gt3),AmpSqAhTocFvFv(gt1, gt2, gt3)) 
  AmpSqAhTocFvFv(gt1, gt2, gt3) = AmpSqAhTocFvFv(gt1, gt2, gt3) + AmpSqTreeAhTocFvFv(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocFvFv(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqAhTocFvFv(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MFvOS(gt2),MFvOS(gt3),helfactor*AmpSqAhTocFvFv(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MFv(gt2),MFv(gt3),helfactor*AmpSqAhTocFvFv(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocFvFv(gt1, gt2, gt3) + MRGAhTocFvFv(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocFvFv(gt1, gt2, gt3) + MRGAhTocFvFv(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
Call Amplitude_Tree_sec_UMSSM_AhTohhhh(cplAhhhhh,MAh,Mhh,MAh2,Mhh2,AmpTreeAhTohhhh)

  Else 
Call Amplitude_Tree_sec_UMSSM_AhTohhhh(ZcplAhhhhh,MAh,Mhh,MAh2,Mhh2,AmpTreeAhTohhhh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_AhTohhhh(MLambda,em,gs,cplAhhhhh,MAhOS,MhhOS,               & 
& MRPAhTohhhh,MRGAhTohhhh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTohhhh(MLambda,em,gs,ZcplAhhhhh,MAhOS,MhhOS,              & 
& MRPAhTohhhh,MRGAhTohhhh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_AhTohhhh(MLambda,em,gs,cplAhhhhh,MAh,Mhh,MRPAhTohhhh,       & 
& MRGAhTohhhh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTohhhh(MLambda,em,gs,ZcplAhhhhh,MAh,Mhh,MRPAhTohhhh,      & 
& MRGAhTohhhh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_AhTohhhh(cplAhhhhh,ctcplAhhhhh,MAh,MAh2,Mhh,            & 
& Mhh2,ZfAh,Zfhh,AmpWaveAhTohhhh)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhTohhhh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,               & 
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
& cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvcSv1,AmpVertexAhTohhhh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTohhhh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
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
& cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvcSv1,AmpVertexIRdrAhTohhhh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTohhhh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
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
& cplhhhhSucSuaa,cplhhhhSvcSv1,AmpVertexIRosAhTohhhh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTohhhh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
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
& cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvcSv1,AmpVertexIRosAhTohhhh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTohhhh(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
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
& cplhhhhSucSuaa,cplhhhhSvcSv1,AmpVertexIRosAhTohhhh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTohhhh(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
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
& cplhhhhSecSe1,cplhhhhSucSuaa,cplhhhhSvcSv1,AmpVertexIRosAhTohhhh)

 End if 
 End if 
AmpVertexAhTohhhh = AmpVertexAhTohhhh -  AmpVertexIRdrAhTohhhh! +  AmpVertexIRosAhTohhhh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTohhhh=0._dp 
AmpVertexZAhTohhhh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTohhhh(gt2,:,:) = AmpWaveZAhTohhhh(gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTohhhh(gt1,:,:) 
AmpVertexZAhTohhhh(gt2,:,:)= AmpVertexZAhTohhhh(gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTohhhh(gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTohhhh=AmpWaveZAhTohhhh 
AmpVertexAhTohhhh= AmpVertexZAhTohhhh
! Final State 1 
AmpWaveZAhTohhhh=0._dp 
AmpVertexZAhTohhhh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTohhhh(:,gt2,:) = AmpWaveZAhTohhhh(:,gt2,:)+ZRUZH(gt2,gt1)*AmpWaveAhTohhhh(:,gt1,:) 
AmpVertexZAhTohhhh(:,gt2,:)= AmpVertexZAhTohhhh(:,gt2,:)+ZRUZH(gt2,gt1)*AmpVertexAhTohhhh(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTohhhh=AmpWaveZAhTohhhh 
AmpVertexAhTohhhh= AmpVertexZAhTohhhh
! Final State 2 
AmpWaveZAhTohhhh=0._dp 
AmpVertexZAhTohhhh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTohhhh(:,:,gt2) = AmpWaveZAhTohhhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveAhTohhhh(:,:,gt1) 
AmpVertexZAhTohhhh(:,:,gt2)= AmpVertexZAhTohhhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexAhTohhhh(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTohhhh=AmpWaveZAhTohhhh 
AmpVertexAhTohhhh= AmpVertexZAhTohhhh
End if
If (ShiftIRdiv) Then 
AmpVertexAhTohhhh = AmpVertexAhTohhhh  +  AmpVertexIRosAhTohhhh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->hh hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTohhhh = AmpTreeAhTohhhh 
 AmpSum2AhTohhhh = AmpTreeAhTohhhh + 2._dp*AmpWaveAhTohhhh + 2._dp*AmpVertexAhTohhhh  
Else 
 AmpSumAhTohhhh = AmpTreeAhTohhhh + AmpWaveAhTohhhh + AmpVertexAhTohhhh
 AmpSum2AhTohhhh = AmpTreeAhTohhhh + AmpWaveAhTohhhh + AmpVertexAhTohhhh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTohhhh = AmpTreeAhTohhhh
 AmpSum2AhTohhhh = AmpTreeAhTohhhh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=gt2,6
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(MhhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(Mhh(gt2))+Abs(Mhh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTohhhh = AmpTreeAhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumAhTohhhh(gt1, gt2, gt3),AmpSum2AhTohhhh(gt1, gt2, gt3),AmpSqAhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),Mhh(gt3),AmpSumAhTohhhh(gt1, gt2, gt3),AmpSum2AhTohhhh(gt1, gt2, gt3),AmpSqAhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTohhhh(gt1, gt2, gt3) 
  AmpSum2AhTohhhh = 2._dp*AmpWaveAhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumAhTohhhh(gt1, gt2, gt3),AmpSum2AhTohhhh(gt1, gt2, gt3),AmpSqAhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),Mhh(gt3),AmpSumAhTohhhh(gt1, gt2, gt3),AmpSum2AhTohhhh(gt1, gt2, gt3),AmpSqAhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTohhhh(gt1, gt2, gt3) 
  AmpSum2AhTohhhh = 2._dp*AmpVertexAhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumAhTohhhh(gt1, gt2, gt3),AmpSum2AhTohhhh(gt1, gt2, gt3),AmpSqAhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),Mhh(gt3),AmpSumAhTohhhh(gt1, gt2, gt3),AmpSum2AhTohhhh(gt1, gt2, gt3),AmpSqAhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTohhhh(gt1, gt2, gt3) 
  AmpSum2AhTohhhh = AmpTreeAhTohhhh + 2._dp*AmpWaveAhTohhhh + 2._dp*AmpVertexAhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumAhTohhhh(gt1, gt2, gt3),AmpSum2AhTohhhh(gt1, gt2, gt3),AmpSqAhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),Mhh(gt3),AmpSumAhTohhhh(gt1, gt2, gt3),AmpSum2AhTohhhh(gt1, gt2, gt3),AmpSqAhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTohhhh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTohhhh = AmpTreeAhTohhhh
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumAhTohhhh(gt1, gt2, gt3),AmpSum2AhTohhhh(gt1, gt2, gt3),AmpSqAhTohhhh(gt1, gt2, gt3)) 
  AmpSqTreeAhTohhhh(gt1, gt2, gt3) = AmpSqAhTohhhh(gt1, gt2, gt3)  
  AmpSum2AhTohhhh = + 2._dp*AmpWaveAhTohhhh + 2._dp*AmpVertexAhTohhhh
  Call SquareAmp_StoSS(MAhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumAhTohhhh(gt1, gt2, gt3),AmpSum2AhTohhhh(gt1, gt2, gt3),AmpSqAhTohhhh(gt1, gt2, gt3)) 
  AmpSqAhTohhhh(gt1, gt2, gt3) = AmpSqAhTohhhh(gt1, gt2, gt3) + AmpSqTreeAhTohhhh(gt1, gt2, gt3)  
Else  
  AmpSum2AhTohhhh = AmpTreeAhTohhhh
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),Mhh(gt3),AmpSumAhTohhhh(gt1, gt2, gt3),AmpSum2AhTohhhh(gt1, gt2, gt3),AmpSqAhTohhhh(gt1, gt2, gt3)) 
  AmpSqTreeAhTohhhh(gt1, gt2, gt3) = AmpSqAhTohhhh(gt1, gt2, gt3)  
  AmpSum2AhTohhhh = + 2._dp*AmpWaveAhTohhhh + 2._dp*AmpVertexAhTohhhh
  Call SquareAmp_StoSS(MAh(gt1),Mhh(gt2),Mhh(gt3),AmpSumAhTohhhh(gt1, gt2, gt3),AmpSum2AhTohhhh(gt1, gt2, gt3),AmpSqAhTohhhh(gt1, gt2, gt3)) 
  AmpSqAhTohhhh(gt1, gt2, gt3) = AmpSqAhTohhhh(gt1, gt2, gt3) + AmpSqTreeAhTohhhh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTohhhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqAhTohhhh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAhOS(gt1),MhhOS(gt2),MhhOS(gt3),helfactor*AmpSqAhTohhhh(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp/2._dp*GammaTPS(MAh(gt1),Mhh(gt2),Mhh(gt3),helfactor*AmpSqAhTohhhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPAhTohhhh(gt1, gt2, gt3) + MRGAhTohhhh(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPAhTohhhh(gt1, gt2, gt3) + MRGAhTohhhh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
! hh VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_AhTohhVZ(cplAhhhVZ,MAh,Mhh,MVZ,MAh2,Mhh2,               & 
& MVZ2,AmpTreeAhTohhVZ)

  Else 
Call Amplitude_Tree_sec_UMSSM_AhTohhVZ(ZcplAhhhVZ,MAh,Mhh,MVZ,MAh2,Mhh2,              & 
& MVZ2,AmpTreeAhTohhVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_AhTohhVZ(MLambda,em,gs,cplAhhhVZ,MAhOS,MhhOS,               & 
& MVZOS,MRPAhTohhVZ,MRGAhTohhVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTohhVZ(MLambda,em,gs,ZcplAhhhVZ,MAhOS,MhhOS,              & 
& MVZOS,MRPAhTohhVZ,MRGAhTohhVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_AhTohhVZ(MLambda,em,gs,cplAhhhVZ,MAh,Mhh,MVZ,               & 
& MRPAhTohhVZ,MRGAhTohhVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTohhVZ(MLambda,em,gs,ZcplAhhhVZ,MAh,Mhh,MVZ,              & 
& MRPAhTohhVZ,MRGAhTohhVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_AhTohhVZ(cplAhhhVZ,cplAhhhVZp,ctcplAhhhVZ,              & 
& ctcplAhhhVZp,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,ZfAh,Zfhh,ZfVZ,ZfVZpVZ,AmpWaveAhTohhVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhTohhVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,               & 
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
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexAhTohhVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTohhVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
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
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexIRdrAhTohhVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTohhVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
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
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexIRosAhTohhVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTohhVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
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
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexIRosAhTohhVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTohhVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
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
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexIRosAhTohhVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTohhVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
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
& cplhhhhVZVZ1,cplhhhhVZVZp1,cplhhHpmcVWmVZ1,cplhhcHpmVWmVZ1,AmpVertexIRosAhTohhVZ)

 End if 
 End if 
AmpVertexAhTohhVZ = AmpVertexAhTohhVZ -  AmpVertexIRdrAhTohhVZ! +  AmpVertexIRosAhTohhVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTohhVZ=0._dp 
AmpVertexZAhTohhVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTohhVZ(:,gt2,:) = AmpWaveZAhTohhVZ(:,gt2,:)+ZRUZA(gt2,gt1)*AmpWaveAhTohhVZ(:,gt1,:) 
AmpVertexZAhTohhVZ(:,gt2,:)= AmpVertexZAhTohhVZ(:,gt2,:) + ZRUZA(gt2,gt1)*AmpVertexAhTohhVZ(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTohhVZ=AmpWaveZAhTohhVZ 
AmpVertexAhTohhVZ= AmpVertexZAhTohhVZ
! Final State 1 
AmpWaveZAhTohhVZ=0._dp 
AmpVertexZAhTohhVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTohhVZ(:,:,gt2) = AmpWaveZAhTohhVZ(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveAhTohhVZ(:,:,gt1) 
AmpVertexZAhTohhVZ(:,:,gt2)= AmpVertexZAhTohhVZ(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexAhTohhVZ(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTohhVZ=AmpWaveZAhTohhVZ 
AmpVertexAhTohhVZ= AmpVertexZAhTohhVZ
End if
If (ShiftIRdiv) Then 
AmpVertexAhTohhVZ = AmpVertexAhTohhVZ  +  AmpVertexIRosAhTohhVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->hh VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTohhVZ = AmpTreeAhTohhVZ 
 AmpSum2AhTohhVZ = AmpTreeAhTohhVZ + 2._dp*AmpWaveAhTohhVZ + 2._dp*AmpVertexAhTohhVZ  
Else 
 AmpSumAhTohhVZ = AmpTreeAhTohhVZ + AmpWaveAhTohhVZ + AmpVertexAhTohhVZ
 AmpSum2AhTohhVZ = AmpTreeAhTohhVZ + AmpWaveAhTohhVZ + AmpVertexAhTohhVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTohhVZ = AmpTreeAhTohhVZ
 AmpSum2AhTohhVZ = AmpTreeAhTohhVZ 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(Mhh(gt2))+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2AhTohhVZ = AmpTreeAhTohhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTohhVZ(gt1, gt2) 
  AmpSum2AhTohhVZ = 2._dp*AmpWaveAhTohhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTohhVZ(gt1, gt2) 
  AmpSum2AhTohhVZ = 2._dp*AmpVertexAhTohhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTohhVZ(gt1, gt2) 
  AmpSum2AhTohhVZ = AmpTreeAhTohhVZ + 2._dp*AmpWaveAhTohhVZ + 2._dp*AmpVertexAhTohhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTohhVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTohhVZ = AmpTreeAhTohhVZ
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
  AmpSqTreeAhTohhVZ(gt1, gt2) = AmpSqAhTohhVZ(gt1, gt2)  
  AmpSum2AhTohhVZ = + 2._dp*AmpWaveAhTohhVZ + 2._dp*AmpVertexAhTohhVZ
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZOS,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
  AmpSqAhTohhVZ(gt1, gt2) = AmpSqAhTohhVZ(gt1, gt2) + AmpSqTreeAhTohhVZ(gt1, gt2)  
Else  
  AmpSum2AhTohhVZ = AmpTreeAhTohhVZ
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
  AmpSqTreeAhTohhVZ(gt1, gt2) = AmpSqAhTohhVZ(gt1, gt2)  
  AmpSum2AhTohhVZ = + 2._dp*AmpWaveAhTohhVZ + 2._dp*AmpVertexAhTohhVZ
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZ,AmpSumAhTohhVZ(:,gt1, gt2),AmpSum2AhTohhVZ(:,gt1, gt2),AmpSqAhTohhVZ(gt1, gt2)) 
  AmpSqAhTohhVZ(gt1, gt2) = AmpSqAhTohhVZ(gt1, gt2) + AmpSqTreeAhTohhVZ(gt1, gt2)  
End if  
Else  
  AmpSqAhTohhVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTohhVZ(gt1, gt2).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MhhOS(gt2),MVZOS,helfactor*AmpSqAhTohhVZ(gt1, gt2))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),Mhh(gt2),MVZ,helfactor*AmpSqAhTohhVZ(gt1, gt2))
End if 
If ((Abs(MRPAhTohhVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTohhVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPAhTohhVZ(gt1, gt2) + MRGAhTohhVZ(gt1, gt2)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPAhTohhVZ(gt1, gt2) + MRGAhTohhVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
! hh VZp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_AhTohhVZp(cplAhhhVZp,MAh,Mhh,MVZp,MAh2,Mhh2,            & 
& MVZp2,AmpTreeAhTohhVZp)

  Else 
Call Amplitude_Tree_sec_UMSSM_AhTohhVZp(ZcplAhhhVZp,MAh,Mhh,MVZp,MAh2,Mhh2,           & 
& MVZp2,AmpTreeAhTohhVZp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_AhTohhVZp(MLambda,em,gs,cplAhhhVZp,MAhOS,MhhOS,             & 
& MVZpOS,MRPAhTohhVZp,MRGAhTohhVZp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTohhVZp(MLambda,em,gs,ZcplAhhhVZp,MAhOS,MhhOS,            & 
& MVZpOS,MRPAhTohhVZp,MRGAhTohhVZp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_AhTohhVZp(MLambda,em,gs,cplAhhhVZp,MAh,Mhh,MVZp,            & 
& MRPAhTohhVZp,MRGAhTohhVZp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTohhVZp(MLambda,em,gs,ZcplAhhhVZp,MAh,Mhh,MVZp,           & 
& MRPAhTohhVZp,MRGAhTohhVZp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_AhTohhVZp(cplAhhhVZ,cplAhhhVZp,ctcplAhhhVZ,             & 
& ctcplAhhhVZp,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,ZfAh,Zfhh,ZfVZp,ZfVZVZp,            & 
& AmpWaveAhTohhVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhTohhVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
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
& AmpVertexAhTohhVZp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTohhVZp(MAh,MCha,MChi,MFd,MFe,MFu,               & 
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
& cplhhcHpmVWmVZp1,AmpVertexIRdrAhTohhVZp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTohhVZp(MAhOS,MChaOS,MChiOS,MFdOS,               & 
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
& AmpVertexIRosAhTohhVZp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTohhVZp(MAh,MCha,MChi,MFd,MFe,MFu,               & 
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
& cplhhcHpmVWmVZp1,AmpVertexIRosAhTohhVZp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTohhVZp(MAhOS,MChaOS,MChiOS,MFdOS,               & 
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
& AmpVertexIRosAhTohhVZp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTohhVZp(MAh,MCha,MChi,MFd,MFe,MFu,               & 
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
& cplhhcHpmVWmVZp1,AmpVertexIRosAhTohhVZp)

 End if 
 End if 
AmpVertexAhTohhVZp = AmpVertexAhTohhVZp -  AmpVertexIRdrAhTohhVZp! +  AmpVertexIRosAhTohhVZp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTohhVZp=0._dp 
AmpVertexZAhTohhVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTohhVZp(:,gt2,:) = AmpWaveZAhTohhVZp(:,gt2,:)+ZRUZA(gt2,gt1)*AmpWaveAhTohhVZp(:,gt1,:) 
AmpVertexZAhTohhVZp(:,gt2,:)= AmpVertexZAhTohhVZp(:,gt2,:) + ZRUZA(gt2,gt1)*AmpVertexAhTohhVZp(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTohhVZp=AmpWaveZAhTohhVZp 
AmpVertexAhTohhVZp= AmpVertexZAhTohhVZp
! Final State 1 
AmpWaveZAhTohhVZp=0._dp 
AmpVertexZAhTohhVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTohhVZp(:,:,gt2) = AmpWaveZAhTohhVZp(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveAhTohhVZp(:,:,gt1) 
AmpVertexZAhTohhVZp(:,:,gt2)= AmpVertexZAhTohhVZp(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexAhTohhVZp(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTohhVZp=AmpWaveZAhTohhVZp 
AmpVertexAhTohhVZp= AmpVertexZAhTohhVZp
End if
If (ShiftIRdiv) Then 
AmpVertexAhTohhVZp = AmpVertexAhTohhVZp  +  AmpVertexIRosAhTohhVZp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->hh VZp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTohhVZp = AmpTreeAhTohhVZp 
 AmpSum2AhTohhVZp = AmpTreeAhTohhVZp + 2._dp*AmpWaveAhTohhVZp + 2._dp*AmpVertexAhTohhVZp  
Else 
 AmpSumAhTohhVZp = AmpTreeAhTohhVZp + AmpWaveAhTohhVZp + AmpVertexAhTohhVZp
 AmpSum2AhTohhVZp = AmpTreeAhTohhVZp + AmpWaveAhTohhVZp + AmpVertexAhTohhVZp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTohhVZp = AmpTreeAhTohhVZp
 AmpSum2AhTohhVZp = AmpTreeAhTohhVZp 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(Mhh(gt2))+Abs(MVZp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2AhTohhVZp = AmpTreeAhTohhVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZpOS,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZp,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTohhVZp(gt1, gt2) 
  AmpSum2AhTohhVZp = 2._dp*AmpWaveAhTohhVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZpOS,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZp,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTohhVZp(gt1, gt2) 
  AmpSum2AhTohhVZp = 2._dp*AmpVertexAhTohhVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZpOS,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZp,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTohhVZp(gt1, gt2) 
  AmpSum2AhTohhVZp = AmpTreeAhTohhVZp + 2._dp*AmpWaveAhTohhVZp + 2._dp*AmpVertexAhTohhVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZpOS,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZp,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTohhVZp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTohhVZp = AmpTreeAhTohhVZp
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZpOS,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
  AmpSqTreeAhTohhVZp(gt1, gt2) = AmpSqAhTohhVZp(gt1, gt2)  
  AmpSum2AhTohhVZp = + 2._dp*AmpWaveAhTohhVZp + 2._dp*AmpVertexAhTohhVZp
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),MVZpOS,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
  AmpSqAhTohhVZp(gt1, gt2) = AmpSqAhTohhVZp(gt1, gt2) + AmpSqTreeAhTohhVZp(gt1, gt2)  
Else  
  AmpSum2AhTohhVZp = AmpTreeAhTohhVZp
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZp,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
  AmpSqTreeAhTohhVZp(gt1, gt2) = AmpSqAhTohhVZp(gt1, gt2)  
  AmpSum2AhTohhVZp = + 2._dp*AmpWaveAhTohhVZp + 2._dp*AmpVertexAhTohhVZp
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVZp,AmpSumAhTohhVZp(:,gt1, gt2),AmpSum2AhTohhVZp(:,gt1, gt2),AmpSqAhTohhVZp(gt1, gt2)) 
  AmpSqAhTohhVZp(gt1, gt2) = AmpSqAhTohhVZp(gt1, gt2) + AmpSqTreeAhTohhVZp(gt1, gt2)  
End if  
Else  
  AmpSqAhTohhVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTohhVZp(gt1, gt2).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MhhOS(gt2),MVZpOS,helfactor*AmpSqAhTohhVZp(gt1, gt2))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),Mhh(gt2),MVZp,helfactor*AmpSqAhTohhVZp(gt1, gt2))
End if 
If ((Abs(MRPAhTohhVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTohhVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPAhTohhVZp(gt1, gt2) + MRGAhTohhVZp(gt1, gt2)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPAhTohhVZp(gt1, gt2) + MRGAhTohhVZp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
! Conjg(Hpm) Hpm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_AhTocHpmHpm(cplAhHpmcHpm,MAh,MHpm,MAh2,MHpm2,           & 
& AmpTreeAhTocHpmHpm)

  Else 
Call Amplitude_Tree_sec_UMSSM_AhTocHpmHpm(ZcplAhHpmcHpm,MAh,MHpm,MAh2,MHpm2,          & 
& AmpTreeAhTocHpmHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocHpmHpm(MLambda,em,gs,cplAhHpmcHpm,MAhOS,               & 
& MHpmOS,MRPAhTocHpmHpm,MRGAhTocHpmHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocHpmHpm(MLambda,em,gs,ZcplAhHpmcHpm,MAhOS,              & 
& MHpmOS,MRPAhTocHpmHpm,MRGAhTocHpmHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_AhTocHpmHpm(MLambda,em,gs,cplAhHpmcHpm,MAh,MHpm,            & 
& MRPAhTocHpmHpm,MRGAhTocHpmHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocHpmHpm(MLambda,em,gs,ZcplAhHpmcHpm,MAh,MHpm,           & 
& MRPAhTocHpmHpm,MRGAhTocHpmHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_AhTocHpmHpm(cplAhHpmcHpm,ctcplAhHpmcHpm,MAh,            & 
& MAh2,MHpm,MHpm2,ZfAh,ZfHpm,AmpWaveAhTocHpmHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhTocHpmHpm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,         & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacHpmL,  & 
& cplChiChacHpmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,              & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,       & 
& cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcHpm, & 
& cplcgWmgZpHpm,cplcgWpCgZpcHpm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,      & 
& cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,         & 
& cplHpmcVWmVZp,cplSdcHpmcSu,cplSecHpmcSv,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,       & 
& cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplAhHpmSucSdaa,cplAhHpmSvcSe1,cplAhHpmcVWmVP1,        & 
& cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplAhSdcHpmcSuaa,cplAhSecHpmcSv1,cplAhcHpmVPVWm1,     & 
& cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplhhhhHpmcHpm1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa, & 
& cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,cplHpmSvcHpmcSv1,AmpVertexAhTocHpmHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocHpmHpm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,              & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,               & 
& cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,   & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacHpmL,  & 
& cplChiChacHpmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,              & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,       & 
& cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcHpm, & 
& cplcgWmgZpHpm,cplcgWpCgZpcHpm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,      & 
& cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,         & 
& cplHpmcVWmVZp,cplSdcHpmcSu,cplSecHpmcSv,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,       & 
& cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplAhHpmSucSdaa,cplAhHpmSvcSe1,cplAhHpmcVWmVP1,        & 
& cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplAhSdcHpmcSuaa,cplAhSecHpmcSv1,cplAhcHpmVPVWm1,     & 
& cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplhhhhHpmcHpm1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa, & 
& cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,cplHpmSvcHpmcSv1,AmpVertexIRdrAhTocHpmHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocHpmHpm(MAhOS,MChaOS,MChiOS,MFdOS,             & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,           & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,ZcplAhHpmcHpm,              & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacHpmL,  & 
& cplChiChacHpmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,              & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,       & 
& cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcHpm, & 
& cplcgWmgZpHpm,cplcgWpCgZpcHpm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,      & 
& cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,         & 
& cplHpmcVWmVZp,cplSdcHpmcSu,cplSecHpmcSv,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,       & 
& cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplAhHpmSucSdaa,cplAhHpmSvcSe1,cplAhHpmcVWmVP1,        & 
& cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplAhSdcHpmcSuaa,cplAhSecHpmcSv1,cplAhcHpmVPVWm1,     & 
& cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplhhhhHpmcHpm1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa, & 
& cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,cplHpmSvcHpmcSv1,AmpVertexIRosAhTocHpmHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocHpmHpm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,              & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,               & 
& cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,ZcplAhHpmcHpm,  & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacHpmL,  & 
& cplChiChacHpmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,              & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,       & 
& cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcHpm, & 
& cplcgWmgZpHpm,cplcgWpCgZpcHpm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,      & 
& cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,         & 
& cplHpmcVWmVZp,cplSdcHpmcSu,cplSecHpmcSv,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,       & 
& cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplAhHpmSucSdaa,cplAhHpmSvcSe1,cplAhHpmcVWmVP1,        & 
& cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplAhSdcHpmcSuaa,cplAhSecHpmcSv1,cplAhcHpmVPVWm1,     & 
& cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplhhhhHpmcHpm1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa, & 
& cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,cplHpmSvcHpmcSv1,AmpVertexIRosAhTocHpmHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocHpmHpm(MAhOS,MChaOS,MChiOS,MFdOS,             & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,           & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacHpmL,  & 
& cplChiChacHpmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,              & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,       & 
& cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcHpm, & 
& cplcgWmgZpHpm,cplcgWpCgZpcHpm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,      & 
& cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,         & 
& cplHpmcVWmVZp,cplSdcHpmcSu,cplSecHpmcSv,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,       & 
& cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplAhHpmSucSdaa,cplAhHpmSvcSe1,cplAhHpmcVWmVP1,        & 
& cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplAhSdcHpmcSuaa,cplAhSecHpmcSv1,cplAhcHpmVPVWm1,     & 
& cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplhhhhHpmcHpm1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa, & 
& cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,cplHpmSvcHpmcSv1,AmpVertexIRosAhTocHpmHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocHpmHpm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,              & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,               & 
& cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,   & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacHpmL,  & 
& cplChiChacHpmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcHpmL,cplcFuFdcHpmR,              & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,       & 
& cplcgZgWmcHpm,cplcgZpgWmcHpm,cplcgZgWpCHpm,cplcgZpgWpCHpm,cplcgWmgZHpm,cplcgWpCgZcHpm, & 
& cplcgWmgZpHpm,cplcgWpCgZpcHpm,cplhhHpmcHpm,cplhhHpmcVWm,cplhhcHpmVWm,cplHpmSucSd,      & 
& cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,         & 
& cplHpmcVWmVZp,cplSdcHpmcSu,cplSecHpmcSv,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,       & 
& cplAhAhHpmcHpm1,cplAhhhHpmcHpm1,cplAhHpmSucSdaa,cplAhHpmSvcSe1,cplAhHpmcVWmVP1,        & 
& cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplAhSdcHpmcSuaa,cplAhSecHpmcSv1,cplAhcHpmVPVWm1,     & 
& cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplhhhhHpmcHpm1,cplHpmHpmcHpmcHpm1,cplHpmSdcHpmcSdaa, & 
& cplHpmSecHpmcSe1,cplHpmSucHpmcSuaa,cplHpmSvcHpmcSv1,AmpVertexIRosAhTocHpmHpm)

 End if 
 End if 
AmpVertexAhTocHpmHpm = AmpVertexAhTocHpmHpm -  AmpVertexIRdrAhTocHpmHpm! +  AmpVertexIRosAhTocHpmHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocHpmHpm=0._dp 
AmpVertexZAhTocHpmHpm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocHpmHpm(gt2,:,:) = AmpWaveZAhTocHpmHpm(gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocHpmHpm(gt1,:,:) 
AmpVertexZAhTocHpmHpm(gt2,:,:)= AmpVertexZAhTocHpmHpm(gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocHpmHpm(gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocHpmHpm=AmpWaveZAhTocHpmHpm 
AmpVertexAhTocHpmHpm= AmpVertexZAhTocHpmHpm
! Final State 1 
AmpWaveZAhTocHpmHpm=0._dp 
AmpVertexZAhTocHpmHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZAhTocHpmHpm(:,gt2,:) = AmpWaveZAhTocHpmHpm(:,gt2,:)+ZRUZP(gt2,gt1)*AmpWaveAhTocHpmHpm(:,gt1,:) 
AmpVertexZAhTocHpmHpm(:,gt2,:)= AmpVertexZAhTocHpmHpm(:,gt2,:)+ZRUZP(gt2,gt1)*AmpVertexAhTocHpmHpm(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocHpmHpm=AmpWaveZAhTocHpmHpm 
AmpVertexAhTocHpmHpm= AmpVertexZAhTocHpmHpm
! Final State 2 
AmpWaveZAhTocHpmHpm=0._dp 
AmpVertexZAhTocHpmHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZAhTocHpmHpm(:,:,gt2) = AmpWaveZAhTocHpmHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveAhTocHpmHpm(:,:,gt1) 
AmpVertexZAhTocHpmHpm(:,:,gt2)= AmpVertexZAhTocHpmHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexAhTocHpmHpm(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocHpmHpm=AmpWaveZAhTocHpmHpm 
AmpVertexAhTocHpmHpm= AmpVertexZAhTocHpmHpm
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocHpmHpm = AmpVertexAhTocHpmHpm  +  AmpVertexIRosAhTocHpmHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->conj[Hpm] Hpm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocHpmHpm = AmpTreeAhTocHpmHpm 
 AmpSum2AhTocHpmHpm = AmpTreeAhTocHpmHpm + 2._dp*AmpWaveAhTocHpmHpm + 2._dp*AmpVertexAhTocHpmHpm  
Else 
 AmpSumAhTocHpmHpm = AmpTreeAhTocHpmHpm + AmpWaveAhTocHpmHpm + AmpVertexAhTocHpmHpm
 AmpSum2AhTocHpmHpm = AmpTreeAhTocHpmHpm + AmpWaveAhTocHpmHpm + AmpVertexAhTocHpmHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocHpmHpm = AmpTreeAhTocHpmHpm
 AmpSum2AhTocHpmHpm = AmpTreeAhTocHpmHpm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=2,2
    Do gt3=2,2
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MHpmOS(gt2))+Abs(MHpmOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MHpm(gt2))+Abs(MHpm(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocHpmHpm = AmpTreeAhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MHpm(gt2),MHpm(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocHpmHpm(gt1, gt2, gt3) 
  AmpSum2AhTocHpmHpm = 2._dp*AmpWaveAhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MHpm(gt2),MHpm(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocHpmHpm(gt1, gt2, gt3) 
  AmpSum2AhTocHpmHpm = 2._dp*AmpVertexAhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MHpm(gt2),MHpm(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocHpmHpm(gt1, gt2, gt3) 
  AmpSum2AhTocHpmHpm = AmpTreeAhTocHpmHpm + 2._dp*AmpWaveAhTocHpmHpm + 2._dp*AmpVertexAhTocHpmHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MHpm(gt2),MHpm(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocHpmHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocHpmHpm = AmpTreeAhTocHpmHpm
  Call SquareAmp_StoSS(MAhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqTreeAhTocHpmHpm(gt1, gt2, gt3) = AmpSqAhTocHpmHpm(gt1, gt2, gt3)  
  AmpSum2AhTocHpmHpm = + 2._dp*AmpWaveAhTocHpmHpm + 2._dp*AmpVertexAhTocHpmHpm
  Call SquareAmp_StoSS(MAhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqAhTocHpmHpm(gt1, gt2, gt3) = AmpSqAhTocHpmHpm(gt1, gt2, gt3) + AmpSqTreeAhTocHpmHpm(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocHpmHpm = AmpTreeAhTocHpmHpm
  Call SquareAmp_StoSS(MAh(gt1),MHpm(gt2),MHpm(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqTreeAhTocHpmHpm(gt1, gt2, gt3) = AmpSqAhTocHpmHpm(gt1, gt2, gt3)  
  AmpSum2AhTocHpmHpm = + 2._dp*AmpWaveAhTocHpmHpm + 2._dp*AmpVertexAhTocHpmHpm
  Call SquareAmp_StoSS(MAh(gt1),MHpm(gt2),MHpm(gt3),AmpSumAhTocHpmHpm(gt1, gt2, gt3),AmpSum2AhTocHpmHpm(gt1, gt2, gt3),AmpSqAhTocHpmHpm(gt1, gt2, gt3)) 
  AmpSqAhTocHpmHpm(gt1, gt2, gt3) = AmpSqAhTocHpmHpm(gt1, gt2, gt3) + AmpSqTreeAhTocHpmHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocHpmHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTocHpmHpm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MHpmOS(gt2),MHpmOS(gt3),helfactor*AmpSqAhTocHpmHpm(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MHpm(gt2),MHpm(gt3),helfactor*AmpSqAhTocHpmHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocHpmHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocHpmHpm(gt1, gt2, gt3) + MRGAhTocHpmHpm(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocHpmHpm(gt1, gt2, gt3) + MRGAhTocHpmHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
Call Amplitude_Tree_sec_UMSSM_AhToHpmcVWm(cplAhHpmcVWm,MAh,MHpm,MVWm,MAh2,            & 
& MHpm2,MVWm2,AmpTreeAhToHpmcVWm)

  Else 
Call Amplitude_Tree_sec_UMSSM_AhToHpmcVWm(ZcplAhHpmcVWm,MAh,MHpm,MVWm,MAh2,           & 
& MHpm2,MVWm2,AmpTreeAhToHpmcVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_AhToHpmcVWm(MLambda,em,gs,cplAhHpmcVWm,MAhOS,               & 
& MHpmOS,MVWmOS,MRPAhToHpmcVWm,MRGAhToHpmcVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_AhToHpmcVWm(MLambda,em,gs,ZcplAhHpmcVWm,MAhOS,              & 
& MHpmOS,MVWmOS,MRPAhToHpmcVWm,MRGAhToHpmcVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_AhToHpmcVWm(MLambda,em,gs,cplAhHpmcVWm,MAh,MHpm,            & 
& MVWm,MRPAhToHpmcVWm,MRGAhToHpmcVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_AhToHpmcVWm(MLambda,em,gs,ZcplAhHpmcVWm,MAh,MHpm,           & 
& MVWm,MRPAhToHpmcVWm,MRGAhToHpmcVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_AhToHpmcVWm(cplAhHpmcVWm,ctcplAhHpmcVWm,MAh,            & 
& MAh2,MHpm,MHpm2,MVWm,MVWm2,ZfAh,ZfHpm,ZfVWm,AmpWaveAhToHpmcVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhToHpmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,         & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacVWmL,  & 
& cplChiChacVWmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,              & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,       & 
& cplcgWmgAHpm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgZgWpCHpm,cplcgZpgWpCHpm,  & 
& cplcgWmgZHpm,cplcgWpCgZcVWm,cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhHpmcHpm,cplhhHpmcVWm,   & 
& cplhhcVWmVWm,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,           & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSucVWm,cplSecSvcVWm,cplcVWmVPVWm,       & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,            & 
& cplAhHpmcVWmVZp1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,AmpVertexAhToHpmcVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhToHpmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,              & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,               & 
& cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,   & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacVWmL,  & 
& cplChiChacVWmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,              & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,       & 
& cplcgWmgAHpm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgZgWpCHpm,cplcgZpgWpCHpm,  & 
& cplcgWmgZHpm,cplcgWpCgZcVWm,cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhHpmcHpm,cplhhHpmcVWm,   & 
& cplhhcVWmVWm,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,           & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSucVWm,cplSecSvcVWm,cplcVWmVPVWm,       & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,            & 
& cplAhHpmcVWmVZp1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,AmpVertexIRdrAhToHpmcVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhToHpmcVWm(MAhOS,MChaOS,MChiOS,MFdOS,             & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,           & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,GosZcplAhHpmcHpm,           & 
& ZcplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacVWmL, & 
& cplChiChacVWmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,              & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,       & 
& cplcgWmgAHpm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgZgWpCHpm,cplcgZpgWpCHpm,  & 
& cplcgWmgZHpm,cplcgWpCgZcVWm,cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhHpmcHpm,cplhhHpmcVWm,   & 
& cplhhcVWmVWm,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,GosZcplHpmcVWmVP,cplHpmcHpmVZ,       & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSucVWm,cplSecSvcVWm,cplcVWmVPVWm,       & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,            & 
& cplAhHpmcVWmVZp1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,AmpVertexIRosAhToHpmcVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhToHpmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,              & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,               & 
& cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,GZcplAhHpmcHpm, & 
& ZcplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacVWmL, & 
& cplChiChacVWmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,              & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,       & 
& cplcgWmgAHpm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgZgWpCHpm,cplcgZpgWpCHpm,  & 
& cplcgWmgZHpm,cplcgWpCgZcVWm,cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhHpmcHpm,cplhhHpmcVWm,   & 
& cplhhcVWmVWm,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,GZcplHpmcVWmVP,cplHpmcHpmVZ,         & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSucVWm,cplSecSvcVWm,cplcVWmVPVWm,       & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,            & 
& cplAhHpmcVWmVZp1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,AmpVertexIRosAhToHpmcVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhToHpmcVWm(MAhOS,MChaOS,MChiOS,MFdOS,             & 
& MFeOS,MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,               & 
& MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,              & 
& MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,           & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,GcplAhHpmcHpm,              & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacVWmL,  & 
& cplChiChacVWmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,              & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,       & 
& cplcgWmgAHpm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgZgWpCHpm,cplcgZpgWpCHpm,  & 
& cplcgWmgZHpm,cplcgWpCgZcVWm,cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhHpmcHpm,cplhhHpmcVWm,   & 
& cplhhcVWmVWm,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,GcplHpmcVWmVP,cplHpmcHpmVZ,          & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSucVWm,cplSecSvcVWm,cplcVWmVPVWm,       & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,            & 
& cplAhHpmcVWmVZp1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,AmpVertexIRosAhToHpmcVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhToHpmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,             & 
& MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,             & 
& MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,              & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,               & 
& cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,   & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacVWmL,  & 
& cplChiChacVWmR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,              & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,       & 
& cplcgWmgAHpm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgZgWpCHpm,cplcgZpgWpCHpm,  & 
& cplcgWmgZHpm,cplcgWpCgZcVWm,cplcgWmgZpHpm,cplcgWpCgZpcVWm,cplhhHpmcHpm,cplhhHpmcVWm,   & 
& cplhhcVWmVWm,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,           & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSucVWm,cplSecSvcVWm,cplcVWmVPVWm,       & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm1,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,            & 
& cplAhHpmcVWmVZp1,cplhhHpmcVWmVZ1,cplhhHpmcVWmVZp1,cplHpmcHpmcVWmVWm1,AmpVertexIRosAhToHpmcVWm)

 End if 
 End if 
AmpVertexAhToHpmcVWm = AmpVertexAhToHpmcVWm -  AmpVertexIRdrAhToHpmcVWm! +  AmpVertexIRosAhToHpmcVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhToHpmcVWm=0._dp 
AmpVertexZAhToHpmcVWm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhToHpmcVWm(:,gt2,:) = AmpWaveZAhToHpmcVWm(:,gt2,:)+ZRUZA(gt2,gt1)*AmpWaveAhToHpmcVWm(:,gt1,:) 
AmpVertexZAhToHpmcVWm(:,gt2,:)= AmpVertexZAhToHpmcVWm(:,gt2,:) + ZRUZA(gt2,gt1)*AmpVertexAhToHpmcVWm(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhToHpmcVWm=AmpWaveZAhToHpmcVWm 
AmpVertexAhToHpmcVWm= AmpVertexZAhToHpmcVWm
! Final State 1 
AmpWaveZAhToHpmcVWm=0._dp 
AmpVertexZAhToHpmcVWm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZAhToHpmcVWm(:,:,gt2) = AmpWaveZAhToHpmcVWm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveAhToHpmcVWm(:,:,gt1) 
AmpVertexZAhToHpmcVWm(:,:,gt2)= AmpVertexZAhToHpmcVWm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexAhToHpmcVWm(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhToHpmcVWm=AmpWaveZAhToHpmcVWm 
AmpVertexAhToHpmcVWm= AmpVertexZAhToHpmcVWm
End if
If (ShiftIRdiv) Then 
AmpVertexAhToHpmcVWm = AmpVertexAhToHpmcVWm  +  AmpVertexIRosAhToHpmcVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Hpm conj[VWm] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhToHpmcVWm = AmpTreeAhToHpmcVWm 
 AmpSum2AhToHpmcVWm = AmpTreeAhToHpmcVWm + 2._dp*AmpWaveAhToHpmcVWm + 2._dp*AmpVertexAhToHpmcVWm  
Else 
 AmpSumAhToHpmcVWm = AmpTreeAhToHpmcVWm + AmpWaveAhToHpmcVWm + AmpVertexAhToHpmcVWm
 AmpSum2AhToHpmcVWm = AmpTreeAhToHpmcVWm + AmpWaveAhToHpmcVWm + AmpVertexAhToHpmcVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToHpmcVWm = AmpTreeAhToHpmcVWm
 AmpSum2AhToHpmcVWm = AmpTreeAhToHpmcVWm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=2,2
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MHpmOS(gt2))+Abs(MVWmOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MHpm(gt2))+Abs(MVWm))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2AhToHpmcVWm = AmpTreeAhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),MHpm(gt2),MVWm,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhToHpmcVWm(gt1, gt2) 
  AmpSum2AhToHpmcVWm = 2._dp*AmpWaveAhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),MHpm(gt2),MVWm,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhToHpmcVWm(gt1, gt2) 
  AmpSum2AhToHpmcVWm = 2._dp*AmpVertexAhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),MHpm(gt2),MVWm,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhToHpmcVWm(gt1, gt2) 
  AmpSum2AhToHpmcVWm = AmpTreeAhToHpmcVWm + 2._dp*AmpWaveAhToHpmcVWm + 2._dp*AmpVertexAhToHpmcVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),MHpm(gt2),MVWm,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhToHpmcVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhToHpmcVWm = AmpTreeAhToHpmcVWm
  Call SquareAmp_StoSV(MAhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
  AmpSqTreeAhToHpmcVWm(gt1, gt2) = AmpSqAhToHpmcVWm(gt1, gt2)  
  AmpSum2AhToHpmcVWm = + 2._dp*AmpWaveAhToHpmcVWm + 2._dp*AmpVertexAhToHpmcVWm
  Call SquareAmp_StoSV(MAhOS(gt1),MHpmOS(gt2),MVWmOS,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
  AmpSqAhToHpmcVWm(gt1, gt2) = AmpSqAhToHpmcVWm(gt1, gt2) + AmpSqTreeAhToHpmcVWm(gt1, gt2)  
Else  
  AmpSum2AhToHpmcVWm = AmpTreeAhToHpmcVWm
  Call SquareAmp_StoSV(MAh(gt1),MHpm(gt2),MVWm,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
  AmpSqTreeAhToHpmcVWm(gt1, gt2) = AmpSqAhToHpmcVWm(gt1, gt2)  
  AmpSum2AhToHpmcVWm = + 2._dp*AmpWaveAhToHpmcVWm + 2._dp*AmpVertexAhToHpmcVWm
  Call SquareAmp_StoSV(MAh(gt1),MHpm(gt2),MVWm,AmpSumAhToHpmcVWm(:,gt1, gt2),AmpSum2AhToHpmcVWm(:,gt1, gt2),AmpSqAhToHpmcVWm(gt1, gt2)) 
  AmpSqAhToHpmcVWm(gt1, gt2) = AmpSqAhToHpmcVWm(gt1, gt2) + AmpSqTreeAhToHpmcVWm(gt1, gt2)  
End if  
Else  
  AmpSqAhToHpmcVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToHpmcVWm(gt1, gt2).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAhOS(gt1),MHpmOS(gt2),MVWmOS,helfactor*AmpSqAhToHpmcVWm(gt1, gt2))
Else 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAh(gt1),MHpm(gt2),MVWm,helfactor*AmpSqAhToHpmcVWm(gt1, gt2))
End if 
If ((Abs(MRPAhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhToHpmcVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPAhToHpmcVWm(gt1, gt2) + MRGAhToHpmcVWm(gt1, gt2)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPAhToHpmcVWm(gt1, gt2) + MRGAhToHpmcVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
Call Amplitude_Tree_sec_UMSSM_AhTocSdSd(cplAhSdcSd,MAh,MSd,MAh2,MSd2,AmpTreeAhTocSdSd)

  Else 
Call Amplitude_Tree_sec_UMSSM_AhTocSdSd(ZcplAhSdcSd,MAh,MSd,MAh2,MSd2,AmpTreeAhTocSdSd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocSdSd(MLambda,em,gs,cplAhSdcSd,MAhOS,MSdOS,             & 
& MRPAhTocSdSd,MRGAhTocSdSd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocSdSd(MLambda,em,gs,ZcplAhSdcSd,MAhOS,MSdOS,            & 
& MRPAhTocSdSd,MRGAhTocSdSd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_AhTocSdSd(MLambda,em,gs,cplAhSdcSd,MAh,MSd,MRPAhTocSdSd,    & 
& MRGAhTocSdSd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocSdSd(MLambda,em,gs,ZcplAhSdcSd,MAh,MSd,MRPAhTocSdSd,   & 
& MRGAhTocSdSd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_AhTocSdSd(cplAhSdcSd,ctcplAhSdcSd,MAh,MAh2,             & 
& MSd,MSd2,ZfAh,ZfSd,AmpWaveAhTocSdSd)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSe,MSu,MSv,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,         & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,      & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,    & 
& cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,     & 
& cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,         & 
& cplAhAhSdcSdaa,cplAhhhSdcSdaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplhhhhSdcSdaa,         & 
& cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,& 
& cplSdSucSdcSuabab,cplSdSvcSdcSvaa,AmpVertexAhTocSdSd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,             & 
& MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,             & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,       & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChaFucSdL,    & 
& cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,         & 
& cplGluFdcSdR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,              & 
& cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,            & 
& cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhhhSdcSdaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,& 
& cplhhhhSdcSdaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,  & 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvcSdcSvaa,AmpVertexIRdrAhTocSdSd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocSdSd(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,         & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,             & 
& MSu2OS,MSv2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,ZcplAhSdcSd,      & 
& cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,               & 
& cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,     & 
& cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,         & 
& cplAhAhSdcSdaa,cplAhhhSdcSdaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplhhhhSdcSdaa,         & 
& cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,& 
& cplSdSucSdcSuabab,cplSdSvcSdcSvaa,AmpVertexIRosAhTocSdSd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,             & 
& MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,             & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,       & 
& cplAhHpmcVWm,ZcplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChaFucSdL,   & 
& cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,         & 
& cplGluFdcSdR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,              & 
& cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,            & 
& cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhhhSdcSdaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,& 
& cplhhhhSdcSdaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,  & 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvcSdcSvaa,AmpVertexIRosAhTocSdSd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocSdSd(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,         & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,             & 
& MSu2OS,MSv2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChaFucSdL,cplChaFucSdR,               & 
& cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,     & 
& cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSdVWm,         & 
& cplAhAhSdcSdaa,cplAhhhSdcSdaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplhhhhSdcSdaa,         & 
& cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,cplSdSucSdcSuabba,& 
& cplSdSucSdcSuabab,cplSdSvcSdcSvaa,AmpVertexIRosAhTocSdSd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocSdSd(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,             & 
& MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,             & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,       & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChaFucSdL,    & 
& cplChaFucSdR,cplChiFdcSdL,cplChiFdcSdR,cplcFdChiSdL,cplcFdChiSdR,cplGluFdcSdL,         & 
& cplGluFdcSdR,cplcFdGluSdL,cplcFdGluSdR,cplhhSdcSd,cplHpmSucSd,cplSdcSdVG,              & 
& cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,cplSdcHpmcSu,            & 
& cplSdcSucVWm,cplSucSdVWm,cplAhAhSdcSdaa,cplAhhhSdcSdaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,& 
& cplhhhhSdcSdaa,cplHpmSdcHpmcSdaa,cplSdSdcSdcSdabba,cplSdSdcSdcSdabab,cplSdSecSdcSeaa,  & 
& cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSdSvcSdcSvaa,AmpVertexIRosAhTocSdSd)

 End if 
 End if 
AmpVertexAhTocSdSd = AmpVertexAhTocSdSd -  AmpVertexIRdrAhTocSdSd! +  AmpVertexIRosAhTocSdSd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocSdSd=0._dp 
AmpVertexZAhTocSdSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSdSd(gt2,:,:) = AmpWaveZAhTocSdSd(gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocSdSd(gt1,:,:) 
AmpVertexZAhTocSdSd(gt2,:,:)= AmpVertexZAhTocSdSd(gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocSdSd(gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocSdSd=AmpWaveZAhTocSdSd 
AmpVertexAhTocSdSd= AmpVertexZAhTocSdSd
! Final State 1 
AmpWaveZAhTocSdSd=0._dp 
AmpVertexZAhTocSdSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSdSd(:,gt2,:) = AmpWaveZAhTocSdSd(:,gt2,:)+ZRUZDc(gt2,gt1)*AmpWaveAhTocSdSd(:,gt1,:) 
AmpVertexZAhTocSdSd(:,gt2,:)= AmpVertexZAhTocSdSd(:,gt2,:)+ZRUZDc(gt2,gt1)*AmpVertexAhTocSdSd(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocSdSd=AmpWaveZAhTocSdSd 
AmpVertexAhTocSdSd= AmpVertexZAhTocSdSd
! Final State 2 
AmpWaveZAhTocSdSd=0._dp 
AmpVertexZAhTocSdSd=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSdSd(:,:,gt2) = AmpWaveZAhTocSdSd(:,:,gt2)+ZRUZD(gt2,gt1)*AmpWaveAhTocSdSd(:,:,gt1) 
AmpVertexZAhTocSdSd(:,:,gt2)= AmpVertexZAhTocSdSd(:,:,gt2)+ZRUZD(gt2,gt1)*AmpVertexAhTocSdSd(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocSdSd=AmpWaveZAhTocSdSd 
AmpVertexAhTocSdSd= AmpVertexZAhTocSdSd
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocSdSd = AmpVertexAhTocSdSd  +  AmpVertexIRosAhTocSdSd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->conj[Sd] Sd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocSdSd = AmpTreeAhTocSdSd 
 AmpSum2AhTocSdSd = AmpTreeAhTocSdSd + 2._dp*AmpWaveAhTocSdSd + 2._dp*AmpVertexAhTocSdSd  
Else 
 AmpSumAhTocSdSd = AmpTreeAhTocSdSd + AmpWaveAhTocSdSd + AmpVertexAhTocSdSd
 AmpSum2AhTocSdSd = AmpTreeAhTocSdSd + AmpWaveAhTocSdSd + AmpVertexAhTocSdSd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocSdSd = AmpTreeAhTocSdSd
 AmpSum2AhTocSdSd = AmpTreeAhTocSdSd 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MSdOS(gt2))+Abs(MSdOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MSd(gt2))+Abs(MSd(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocSdSd = AmpTreeAhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSd(gt2),MSd(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocSdSd(gt1, gt2, gt3) 
  AmpSum2AhTocSdSd = 2._dp*AmpWaveAhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSd(gt2),MSd(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocSdSd(gt1, gt2, gt3) 
  AmpSum2AhTocSdSd = 2._dp*AmpVertexAhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSd(gt2),MSd(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocSdSd(gt1, gt2, gt3) 
  AmpSum2AhTocSdSd = AmpTreeAhTocSdSd + 2._dp*AmpWaveAhTocSdSd + 2._dp*AmpVertexAhTocSdSd
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSd(gt2),MSd(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocSdSd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocSdSd = AmpTreeAhTocSdSd
  Call SquareAmp_StoSS(MAhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
  AmpSqTreeAhTocSdSd(gt1, gt2, gt3) = AmpSqAhTocSdSd(gt1, gt2, gt3)  
  AmpSum2AhTocSdSd = + 2._dp*AmpWaveAhTocSdSd + 2._dp*AmpVertexAhTocSdSd
  Call SquareAmp_StoSS(MAhOS(gt1),MSdOS(gt2),MSdOS(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
  AmpSqAhTocSdSd(gt1, gt2, gt3) = AmpSqAhTocSdSd(gt1, gt2, gt3) + AmpSqTreeAhTocSdSd(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocSdSd = AmpTreeAhTocSdSd
  Call SquareAmp_StoSS(MAh(gt1),MSd(gt2),MSd(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
  AmpSqTreeAhTocSdSd(gt1, gt2, gt3) = AmpSqAhTocSdSd(gt1, gt2, gt3)  
  AmpSum2AhTocSdSd = + 2._dp*AmpWaveAhTocSdSd + 2._dp*AmpVertexAhTocSdSd
  Call SquareAmp_StoSS(MAh(gt1),MSd(gt2),MSd(gt3),AmpSumAhTocSdSd(gt1, gt2, gt3),AmpSum2AhTocSdSd(gt1, gt2, gt3),AmpSqAhTocSdSd(gt1, gt2, gt3)) 
  AmpSqAhTocSdSd(gt1, gt2, gt3) = AmpSqAhTocSdSd(gt1, gt2, gt3) + AmpSqTreeAhTocSdSd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocSdSd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTocSdSd(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAhOS(gt1),MSdOS(gt2),MSdOS(gt3),helfactor*AmpSqAhTocSdSd(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAh(gt1),MSd(gt2),MSd(gt3),helfactor*AmpSqAhTocSdSd(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocSdSd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocSdSd(gt1, gt2, gt3) + MRGAhTocSdSd(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocSdSd(gt1, gt2, gt3) + MRGAhTocSdSd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
Call Amplitude_Tree_sec_UMSSM_AhTocSeSe(cplAhSecSe,MAh,MSe,MAh2,MSe2,AmpTreeAhTocSeSe)

  Else 
Call Amplitude_Tree_sec_UMSSM_AhTocSeSe(ZcplAhSecSe,MAh,MSe,MAh2,MSe2,AmpTreeAhTocSeSe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocSeSe(MLambda,em,gs,cplAhSecSe,MAhOS,MSeOS,             & 
& MRPAhTocSeSe,MRGAhTocSeSe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocSeSe(MLambda,em,gs,ZcplAhSecSe,MAhOS,MSeOS,            & 
& MRPAhTocSeSe,MRGAhTocSeSe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_AhTocSeSe(MLambda,em,gs,cplAhSecSe,MAh,MSe,MRPAhTocSeSe,    & 
& MRGAhTocSeSe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocSeSe(MLambda,em,gs,ZcplAhSecSe,MAh,MSe,MRPAhTocSeSe,   & 
& MRGAhTocSeSe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_AhTocSeSe(cplAhSecSe,ctcplAhSecSe,MAh,MAh2,             & 
& MSe,MSe2,ZfAh,ZfSe,AmpWaveAhTocSeSe)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhTocSeSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,           & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,           & 
& cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,cplChaFvcSeR,               & 
& cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplhhSecSe,cplHpmSvcSe,            & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,            & 
& cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,   & 
& cplhhhhSecSe1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,         & 
& cplSeSvcSecSv1,AmpVertexAhTocSeSe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocSeSe(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,           & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,           & 
& cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,cplChaFvcSeR,               & 
& cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplhhSecSe,cplHpmSvcSe,            & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,            & 
& cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,   & 
& cplhhhhSecSe1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,         & 
& cplSeSvcSecSv1,AmpVertexIRdrAhTocSeSe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocSeSe(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,             & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,              & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,ZcplAhSecSe,       & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,cplChaFvcSeR,cplChiFecSeL,             & 
& cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,              & 
& cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,          & 
& cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,cplhhhhSecSe1,  & 
& cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvcSecSv1,        & 
& AmpVertexIRosAhTocSeSe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocSeSe(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,           & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,           & 
& cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& ZcplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,cplChaFvcSeR,              & 
& cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplhhSecSe,cplHpmSvcSe,            & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,            & 
& cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,   & 
& cplhhhhSecSe1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,         & 
& cplSeSvcSecSv1,AmpVertexIRosAhTocSeSe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocSeSe(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,             & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,              & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,cplChaFvcSeR,cplChiFecSeL,             & 
& cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,              & 
& cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,          & 
& cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,cplhhhhSecSe1,  & 
& cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvcSecSv1,        & 
& AmpVertexIRosAhTocSeSe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocSeSe(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,           & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,           & 
& cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,cplChaFvcSeR,               & 
& cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplhhSecSe,cplHpmSvcSe,            & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,            & 
& cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,   & 
& cplhhhhSecSe1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,         & 
& cplSeSvcSecSv1,AmpVertexIRosAhTocSeSe)

 End if 
 End if 
AmpVertexAhTocSeSe = AmpVertexAhTocSeSe -  AmpVertexIRdrAhTocSeSe! +  AmpVertexIRosAhTocSeSe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocSeSe=0._dp 
AmpVertexZAhTocSeSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSeSe(gt2,:,:) = AmpWaveZAhTocSeSe(gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocSeSe(gt1,:,:) 
AmpVertexZAhTocSeSe(gt2,:,:)= AmpVertexZAhTocSeSe(gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocSeSe(gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocSeSe=AmpWaveZAhTocSeSe 
AmpVertexAhTocSeSe= AmpVertexZAhTocSeSe
! Final State 1 
AmpWaveZAhTocSeSe=0._dp 
AmpVertexZAhTocSeSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSeSe(:,gt2,:) = AmpWaveZAhTocSeSe(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpWaveAhTocSeSe(:,gt1,:) 
AmpVertexZAhTocSeSe(:,gt2,:)= AmpVertexZAhTocSeSe(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpVertexAhTocSeSe(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocSeSe=AmpWaveZAhTocSeSe 
AmpVertexAhTocSeSe= AmpVertexZAhTocSeSe
! Final State 2 
AmpWaveZAhTocSeSe=0._dp 
AmpVertexZAhTocSeSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSeSe(:,:,gt2) = AmpWaveZAhTocSeSe(:,:,gt2)+ZRUZE(gt2,gt1)*AmpWaveAhTocSeSe(:,:,gt1) 
AmpVertexZAhTocSeSe(:,:,gt2)= AmpVertexZAhTocSeSe(:,:,gt2)+ZRUZE(gt2,gt1)*AmpVertexAhTocSeSe(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocSeSe=AmpWaveZAhTocSeSe 
AmpVertexAhTocSeSe= AmpVertexZAhTocSeSe
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocSeSe = AmpVertexAhTocSeSe  +  AmpVertexIRosAhTocSeSe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->conj[Se] Se -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocSeSe = AmpTreeAhTocSeSe 
 AmpSum2AhTocSeSe = AmpTreeAhTocSeSe + 2._dp*AmpWaveAhTocSeSe + 2._dp*AmpVertexAhTocSeSe  
Else 
 AmpSumAhTocSeSe = AmpTreeAhTocSeSe + AmpWaveAhTocSeSe + AmpVertexAhTocSeSe
 AmpSum2AhTocSeSe = AmpTreeAhTocSeSe + AmpWaveAhTocSeSe + AmpVertexAhTocSeSe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocSeSe = AmpTreeAhTocSeSe
 AmpSum2AhTocSeSe = AmpTreeAhTocSeSe 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MSeOS(gt2))+Abs(MSeOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MSe(gt2))+Abs(MSe(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocSeSe = AmpTreeAhTocSeSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSe(gt2),MSe(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocSeSe(gt1, gt2, gt3) 
  AmpSum2AhTocSeSe = 2._dp*AmpWaveAhTocSeSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSe(gt2),MSe(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocSeSe(gt1, gt2, gt3) 
  AmpSum2AhTocSeSe = 2._dp*AmpVertexAhTocSeSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSe(gt2),MSe(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocSeSe(gt1, gt2, gt3) 
  AmpSum2AhTocSeSe = AmpTreeAhTocSeSe + 2._dp*AmpWaveAhTocSeSe + 2._dp*AmpVertexAhTocSeSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSe(gt2),MSe(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocSeSe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocSeSe = AmpTreeAhTocSeSe
  Call SquareAmp_StoSS(MAhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
  AmpSqTreeAhTocSeSe(gt1, gt2, gt3) = AmpSqAhTocSeSe(gt1, gt2, gt3)  
  AmpSum2AhTocSeSe = + 2._dp*AmpWaveAhTocSeSe + 2._dp*AmpVertexAhTocSeSe
  Call SquareAmp_StoSS(MAhOS(gt1),MSeOS(gt2),MSeOS(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
  AmpSqAhTocSeSe(gt1, gt2, gt3) = AmpSqAhTocSeSe(gt1, gt2, gt3) + AmpSqTreeAhTocSeSe(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocSeSe = AmpTreeAhTocSeSe
  Call SquareAmp_StoSS(MAh(gt1),MSe(gt2),MSe(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
  AmpSqTreeAhTocSeSe(gt1, gt2, gt3) = AmpSqAhTocSeSe(gt1, gt2, gt3)  
  AmpSum2AhTocSeSe = + 2._dp*AmpWaveAhTocSeSe + 2._dp*AmpVertexAhTocSeSe
  Call SquareAmp_StoSS(MAh(gt1),MSe(gt2),MSe(gt3),AmpSumAhTocSeSe(gt1, gt2, gt3),AmpSum2AhTocSeSe(gt1, gt2, gt3),AmpSqAhTocSeSe(gt1, gt2, gt3)) 
  AmpSqAhTocSeSe(gt1, gt2, gt3) = AmpSqAhTocSeSe(gt1, gt2, gt3) + AmpSqTreeAhTocSeSe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocSeSe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTocSeSe(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MSeOS(gt2),MSeOS(gt3),helfactor*AmpSqAhTocSeSe(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MSe(gt2),MSe(gt3),helfactor*AmpSqAhTocSeSe(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocSeSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocSeSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocSeSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocSeSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocSeSe(gt1, gt2, gt3) + MRGAhTocSeSe(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocSeSe(gt1, gt2, gt3) + MRGAhTocSeSe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
Call Amplitude_Tree_sec_UMSSM_AhTocSuSu(cplAhSucSu,MAh,MSu,MAh2,MSu2,AmpTreeAhTocSuSu)

  Else 
Call Amplitude_Tree_sec_UMSSM_AhTocSuSu(ZcplAhSucSu,MAh,MSu,MAh2,MSu2,AmpTreeAhTocSuSu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocSuSu(MLambda,em,gs,cplAhSucSu,MAhOS,MSuOS,             & 
& MRPAhTocSuSu,MRGAhTocSuSu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocSuSu(MLambda,em,gs,ZcplAhSucSu,MAhOS,MSuOS,            & 
& MRPAhTocSuSu,MRGAhTocSuSu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_AhTocSuSu(MLambda,em,gs,cplAhSucSu,MAh,MSu,MRPAhTocSuSu,    & 
& MRGAhTocSuSu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocSuSu(MLambda,em,gs,ZcplAhSucSu,MAh,MSu,MRPAhTocSuSu,   & 
& MRGAhTocSuSu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_AhTocSuSu(cplAhSucSu,ctcplAhSucSu,MAh,MAh2,             & 
& MSu,MSu2,ZfAh,ZfSu,AmpWaveAhTocSuSu)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,Mhh,             & 
& MHpm,MSd,MSe,MSu,MSv,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,         & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,      & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,    & 
& cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcChaFdcSuL,cplcChaFdcSuR,       & 
& cplGluFucSuL,cplGluFucSuR,cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,cplHpmSucSd,            & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,    & 
& cplAhAhSucSuaa,cplAhhhSucSuaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplhhhhSucSuaa,         & 
& cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,& 
& cplSuSucSucSuabab,cplSuSvcSucSvaa,AmpVertexAhTocSuSu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,             & 
& MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,             & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,       & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcFdChaSuL,    & 
& cplcFdChaSuR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcChaFdcSuL,        & 
& cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,          & 
& cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,               & 
& cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,cplAhhhSucSuaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa, & 
& cplhhhhSucSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSeSucSecSuaa,  & 
& cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvcSucSvaa,AmpVertexIRdrAhTocSuSu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocSuSu(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,         & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,             & 
& MSu2OS,MSv2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSecSe,ZcplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,              & 
& cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcChaFdcSuL,cplcChaFdcSuR,       & 
& cplGluFucSuL,cplGluFucSuR,cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,cplHpmSucSd,            & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,    & 
& cplAhAhSucSuaa,cplAhhhSucSuaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplhhhhSucSuaa,         & 
& cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,& 
& cplSuSucSucSuabab,cplSuSvcSucSvaa,AmpVertexIRosAhTocSuSu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,             & 
& MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,             & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,       & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,ZcplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcFdChaSuL,   & 
& cplcFdChaSuR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcChaFdcSuL,        & 
& cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,          & 
& cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,               & 
& cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,cplAhhhSucSuaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa, & 
& cplhhhhSucSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSeSucSecSuaa,  & 
& cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvcSucSvaa,AmpVertexIRosAhTocSuSu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocSuSu(MAhOS,MChaOS,MChiOS,MFdOS,               & 
& MFuOS,MGluOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVG,MVP,MVWmOS,MVZOS,MVZpOS,         & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFu2OS,MGlu2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,             & 
& MSu2OS,MSv2OS,MVG2,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,      & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcFdChaSuL,cplcFdChaSuR,               & 
& cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcChaFdcSuL,cplcChaFdcSuR,       & 
& cplGluFucSuL,cplGluFucSuR,cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,cplHpmSucSd,            & 
& cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,cplSucSuVZ,cplSucSuVZp,    & 
& cplAhAhSucSuaa,cplAhhhSucSuaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa,cplhhhhSucSuaa,         & 
& cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSeSucSecSuaa,cplSuSucSucSuabba,& 
& cplSuSucSucSuabab,cplSuSvcSucSvaa,AmpVertexIRosAhTocSuSu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocSuSu(MAh,MCha,MChi,MFd,MFu,MGlu,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,             & 
& MGlu2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,             & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,       & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcFdChaSuL,    & 
& cplcFdChaSuR,cplChiFucSuL,cplChiFucSuR,cplcFuChiSuL,cplcFuChiSuR,cplcChaFdcSuL,        & 
& cplcChaFdcSuR,cplGluFucSuL,cplGluFucSuR,cplcFuGluSuL,cplcFuGluSuR,cplhhSucSu,          & 
& cplHpmSucSd,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSdVWm,               & 
& cplSucSuVZ,cplSucSuVZp,cplAhAhSucSuaa,cplAhhhSucSuaa,cplAhHpmSucSdaa,cplAhSdcHpmcSuaa, & 
& cplhhhhSucSuaa,cplHpmSucHpmcSuaa,cplSdSucSdcSuabba,cplSdSucSdcSuabab,cplSeSucSecSuaa,  & 
& cplSuSucSucSuabba,cplSuSucSucSuabab,cplSuSvcSucSvaa,AmpVertexIRosAhTocSuSu)

 End if 
 End if 
AmpVertexAhTocSuSu = AmpVertexAhTocSuSu -  AmpVertexIRdrAhTocSuSu! +  AmpVertexIRosAhTocSuSu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocSuSu=0._dp 
AmpVertexZAhTocSuSu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSuSu(gt2,:,:) = AmpWaveZAhTocSuSu(gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocSuSu(gt1,:,:) 
AmpVertexZAhTocSuSu(gt2,:,:)= AmpVertexZAhTocSuSu(gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocSuSu(gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocSuSu=AmpWaveZAhTocSuSu 
AmpVertexAhTocSuSu= AmpVertexZAhTocSuSu
! Final State 1 
AmpWaveZAhTocSuSu=0._dp 
AmpVertexZAhTocSuSu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSuSu(:,gt2,:) = AmpWaveZAhTocSuSu(:,gt2,:)+ZRUZUc(gt2,gt1)*AmpWaveAhTocSuSu(:,gt1,:) 
AmpVertexZAhTocSuSu(:,gt2,:)= AmpVertexZAhTocSuSu(:,gt2,:)+ZRUZUc(gt2,gt1)*AmpVertexAhTocSuSu(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocSuSu=AmpWaveZAhTocSuSu 
AmpVertexAhTocSuSu= AmpVertexZAhTocSuSu
! Final State 2 
AmpWaveZAhTocSuSu=0._dp 
AmpVertexZAhTocSuSu=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSuSu(:,:,gt2) = AmpWaveZAhTocSuSu(:,:,gt2)+ZRUZU(gt2,gt1)*AmpWaveAhTocSuSu(:,:,gt1) 
AmpVertexZAhTocSuSu(:,:,gt2)= AmpVertexZAhTocSuSu(:,:,gt2)+ZRUZU(gt2,gt1)*AmpVertexAhTocSuSu(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocSuSu=AmpWaveZAhTocSuSu 
AmpVertexAhTocSuSu= AmpVertexZAhTocSuSu
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocSuSu = AmpVertexAhTocSuSu  +  AmpVertexIRosAhTocSuSu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->conj[Su] Su -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocSuSu = AmpTreeAhTocSuSu 
 AmpSum2AhTocSuSu = AmpTreeAhTocSuSu + 2._dp*AmpWaveAhTocSuSu + 2._dp*AmpVertexAhTocSuSu  
Else 
 AmpSumAhTocSuSu = AmpTreeAhTocSuSu + AmpWaveAhTocSuSu + AmpVertexAhTocSuSu
 AmpSum2AhTocSuSu = AmpTreeAhTocSuSu + AmpWaveAhTocSuSu + AmpVertexAhTocSuSu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocSuSu = AmpTreeAhTocSuSu
 AmpSum2AhTocSuSu = AmpTreeAhTocSuSu 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MSuOS(gt2))+Abs(MSuOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MSu(gt2))+Abs(MSu(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocSuSu = AmpTreeAhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSu(gt2),MSu(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocSuSu(gt1, gt2, gt3) 
  AmpSum2AhTocSuSu = 2._dp*AmpWaveAhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSu(gt2),MSu(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocSuSu(gt1, gt2, gt3) 
  AmpSum2AhTocSuSu = 2._dp*AmpVertexAhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSu(gt2),MSu(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocSuSu(gt1, gt2, gt3) 
  AmpSum2AhTocSuSu = AmpTreeAhTocSuSu + 2._dp*AmpWaveAhTocSuSu + 2._dp*AmpVertexAhTocSuSu
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSu(gt2),MSu(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocSuSu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocSuSu = AmpTreeAhTocSuSu
  Call SquareAmp_StoSS(MAhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
  AmpSqTreeAhTocSuSu(gt1, gt2, gt3) = AmpSqAhTocSuSu(gt1, gt2, gt3)  
  AmpSum2AhTocSuSu = + 2._dp*AmpWaveAhTocSuSu + 2._dp*AmpVertexAhTocSuSu
  Call SquareAmp_StoSS(MAhOS(gt1),MSuOS(gt2),MSuOS(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
  AmpSqAhTocSuSu(gt1, gt2, gt3) = AmpSqAhTocSuSu(gt1, gt2, gt3) + AmpSqTreeAhTocSuSu(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocSuSu = AmpTreeAhTocSuSu
  Call SquareAmp_StoSS(MAh(gt1),MSu(gt2),MSu(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
  AmpSqTreeAhTocSuSu(gt1, gt2, gt3) = AmpSqAhTocSuSu(gt1, gt2, gt3)  
  AmpSum2AhTocSuSu = + 2._dp*AmpWaveAhTocSuSu + 2._dp*AmpVertexAhTocSuSu
  Call SquareAmp_StoSS(MAh(gt1),MSu(gt2),MSu(gt3),AmpSumAhTocSuSu(gt1, gt2, gt3),AmpSum2AhTocSuSu(gt1, gt2, gt3),AmpSqAhTocSuSu(gt1, gt2, gt3)) 
  AmpSqAhTocSuSu(gt1, gt2, gt3) = AmpSqAhTocSuSu(gt1, gt2, gt3) + AmpSqTreeAhTocSuSu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocSuSu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTocSuSu(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAhOS(gt1),MSuOS(gt2),MSuOS(gt3),helfactor*AmpSqAhTocSuSu(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 3._dp*GammaTPS(MAh(gt1),MSu(gt2),MSu(gt3),helfactor*AmpSqAhTocSuSu(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocSuSu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocSuSu(gt1, gt2, gt3) + MRGAhTocSuSu(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocSuSu(gt1, gt2, gt3) + MRGAhTocSuSu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
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
Call Amplitude_Tree_sec_UMSSM_AhTocSvSv(cplAhSvcSv,MAh,MSv,MAh2,MSv2,AmpTreeAhTocSvSv)

  Else 
Call Amplitude_Tree_sec_UMSSM_AhTocSvSv(ZcplAhSvcSv,MAh,MSv,MAh2,MSv2,AmpTreeAhTocSvSv)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocSvSv(MLambda,em,gs,cplAhSvcSv,MAhOS,MSvOS,             & 
& MRPAhTocSvSv,MRGAhTocSvSv)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocSvSv(MLambda,em,gs,ZcplAhSvcSv,MAhOS,MSvOS,            & 
& MRPAhTocSvSv,MRGAhTocSvSv)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_AhTocSvSv(MLambda,em,gs,cplAhSvcSv,MAh,MSv,MRPAhTocSvSv,    & 
& MRGAhTocSvSv)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_AhTocSvSv(MLambda,em,gs,ZcplAhSvcSv,MAh,MSv,MRPAhTocSvSv,   & 
& MRGAhTocSvSv)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_AhTocSvSv(cplAhSvcSv,ctcplAhSvcSv,MAh,MAh2,             & 
& MSv,MSv2,ZfAh,ZfSv,AmpWaveAhTocSvSv)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhTocSvSv(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSd2,              & 
& MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,       & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcFeChaSvL,cplcFeChaSvR,cplChiFvcSvL,             & 
& cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcChaFecSvL,cplcChaFecSvR,cplhhSvcSv,         & 
& cplHpmSvcSe,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,              & 
& cplAhAhSvcSv1,cplAhhhSvcSv1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,cplhhhhSvcSv1,              & 
& cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,cplSeSvcSecSv1,cplSuSvcSucSvaa,cplSvSvcSvcSv1,        & 
& AmpVertexAhTocSvSv)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocSvSv(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,              & 
& MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,  & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcFeChaSvL,cplcFeChaSvR,cplChiFvcSvL,             & 
& cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcChaFecSvL,cplcChaFecSvR,cplhhSvcSv,         & 
& cplHpmSvcSe,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,              & 
& cplAhAhSvcSv1,cplAhhhSvcSv1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,cplhhhhSvcSv1,              & 
& cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,cplSeSvcSecSv1,cplSuSvcSucSvaa,cplSvSvcSvcSv1,        & 
& AmpVertexIRdrAhTocSvSv)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocSvSv(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,         & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVWm2OS,              & 
& MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,           & 
& cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,      & 
& cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,ZcplAhSvcSv,     & 
& cplAhcHpmVWm,cplcFeChaSvL,cplcFeChaSvR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaFecSvL,cplcChaFecSvR,cplhhSvcSv,cplHpmSvcSe,cplSecHpmcSv,          & 
& cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,cplAhAhSvcSv1,cplAhhhSvcSv1,           & 
& cplAhHpmSvcSe1,cplAhSecHpmcSv1,cplhhhhSvcSv1,cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,         & 
& cplSeSvcSecSv1,cplSuSvcSucSvaa,cplSvSvcSvcSv1,AmpVertexIRosAhTocSvSv)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocSvSv(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,              & 
& MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,  & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,ZcplAhSvcSv,cplAhcHpmVWm,cplcFeChaSvL,cplcFeChaSvR,cplChiFvcSvL,            & 
& cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcChaFecSvL,cplcChaFecSvR,cplhhSvcSv,         & 
& cplHpmSvcSe,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,              & 
& cplAhAhSvcSv1,cplAhhhSvcSv1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,cplhhhhSvcSv1,              & 
& cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,cplSeSvcSecSv1,cplSuSvcSucSvaa,cplSvSvcSvcSv1,        & 
& AmpVertexIRosAhTocSvSv)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocSvSv(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,         & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVWm2OS,              & 
& MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,           & 
& cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,      & 
& cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,      & 
& cplAhcHpmVWm,cplcFeChaSvL,cplcFeChaSvR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaFecSvL,cplcChaFecSvR,cplhhSvcSv,cplHpmSvcSe,cplSecHpmcSv,          & 
& cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,cplAhAhSvcSv1,cplAhhhSvcSv1,           & 
& cplAhHpmSvcSe1,cplAhSecHpmcSv1,cplhhhhSvcSv1,cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,         & 
& cplSeSvcSecSv1,cplSuSvcSucSvaa,cplSvSvcSvcSv1,AmpVertexIRosAhTocSvSv)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_AhTocSvSv(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,              & 
& MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,  & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcFeChaSvL,cplcFeChaSvR,cplChiFvcSvL,             & 
& cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcChaFecSvL,cplcChaFecSvR,cplhhSvcSv,         & 
& cplHpmSvcSe,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,              & 
& cplAhAhSvcSv1,cplAhhhSvcSv1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,cplhhhhSvcSv1,              & 
& cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,cplSeSvcSecSv1,cplSuSvcSucSvaa,cplSvSvcSvcSv1,        & 
& AmpVertexIRosAhTocSvSv)

 End if 
 End if 
AmpVertexAhTocSvSv = AmpVertexAhTocSvSv -  AmpVertexIRdrAhTocSvSv! +  AmpVertexIRosAhTocSvSv ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZAhTocSvSv=0._dp 
AmpVertexZAhTocSvSv=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSvSv(gt2,:,:) = AmpWaveZAhTocSvSv(gt2,:,:)+ZRUZA(gt2,gt1)*AmpWaveAhTocSvSv(gt1,:,:) 
AmpVertexZAhTocSvSv(gt2,:,:)= AmpVertexZAhTocSvSv(gt2,:,:) + ZRUZA(gt2,gt1)*AmpVertexAhTocSvSv(gt1,:,:) 
 End Do 
End Do 
AmpWaveAhTocSvSv=AmpWaveZAhTocSvSv 
AmpVertexAhTocSvSv= AmpVertexZAhTocSvSv
! Final State 1 
AmpWaveZAhTocSvSv=0._dp 
AmpVertexZAhTocSvSv=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSvSv(:,gt2,:) = AmpWaveZAhTocSvSv(:,gt2,:)+ZRUZVc(gt2,gt1)*AmpWaveAhTocSvSv(:,gt1,:) 
AmpVertexZAhTocSvSv(:,gt2,:)= AmpVertexZAhTocSvSv(:,gt2,:)+ZRUZVc(gt2,gt1)*AmpVertexAhTocSvSv(:,gt1,:) 
 End Do 
End Do 
AmpWaveAhTocSvSv=AmpWaveZAhTocSvSv 
AmpVertexAhTocSvSv= AmpVertexZAhTocSvSv
! Final State 2 
AmpWaveZAhTocSvSv=0._dp 
AmpVertexZAhTocSvSv=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZAhTocSvSv(:,:,gt2) = AmpWaveZAhTocSvSv(:,:,gt2)+ZRUZV(gt2,gt1)*AmpWaveAhTocSvSv(:,:,gt1) 
AmpVertexZAhTocSvSv(:,:,gt2)= AmpVertexZAhTocSvSv(:,:,gt2)+ZRUZV(gt2,gt1)*AmpVertexAhTocSvSv(:,:,gt1) 
 End Do 
End Do 
AmpWaveAhTocSvSv=AmpWaveZAhTocSvSv 
AmpVertexAhTocSvSv= AmpVertexZAhTocSvSv
End if
If (ShiftIRdiv) Then 
AmpVertexAhTocSvSv = AmpVertexAhTocSvSv  +  AmpVertexIRosAhTocSvSv
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->conj[Sv] Sv -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumAhTocSvSv = AmpTreeAhTocSvSv 
 AmpSum2AhTocSvSv = AmpTreeAhTocSvSv + 2._dp*AmpWaveAhTocSvSv + 2._dp*AmpVertexAhTocSvSv  
Else 
 AmpSumAhTocSvSv = AmpTreeAhTocSvSv + AmpWaveAhTocSvSv + AmpVertexAhTocSvSv
 AmpSum2AhTocSvSv = AmpTreeAhTocSvSv + AmpWaveAhTocSvSv + AmpVertexAhTocSvSv 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTocSvSv = AmpTreeAhTocSvSv
 AmpSum2AhTocSvSv = AmpTreeAhTocSvSv 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MSvOS(gt2))+Abs(MSvOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MSv(gt2))+Abs(MSv(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2AhTocSvSv = AmpTreeAhTocSvSv
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSvOS(gt2),MSvOS(gt3),AmpSumAhTocSvSv(gt1, gt2, gt3),AmpSum2AhTocSvSv(gt1, gt2, gt3),AmpSqAhTocSvSv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSv(gt2),MSv(gt3),AmpSumAhTocSvSv(gt1, gt2, gt3),AmpSum2AhTocSvSv(gt1, gt2, gt3),AmpSqAhTocSvSv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqAhTocSvSv(gt1, gt2, gt3) 
  AmpSum2AhTocSvSv = 2._dp*AmpWaveAhTocSvSv
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSvOS(gt2),MSvOS(gt3),AmpSumAhTocSvSv(gt1, gt2, gt3),AmpSum2AhTocSvSv(gt1, gt2, gt3),AmpSqAhTocSvSv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSv(gt2),MSv(gt3),AmpSumAhTocSvSv(gt1, gt2, gt3),AmpSum2AhTocSvSv(gt1, gt2, gt3),AmpSqAhTocSvSv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqAhTocSvSv(gt1, gt2, gt3) 
  AmpSum2AhTocSvSv = 2._dp*AmpVertexAhTocSvSv
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSvOS(gt2),MSvOS(gt3),AmpSumAhTocSvSv(gt1, gt2, gt3),AmpSum2AhTocSvSv(gt1, gt2, gt3),AmpSqAhTocSvSv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSv(gt2),MSv(gt3),AmpSumAhTocSvSv(gt1, gt2, gt3),AmpSum2AhTocSvSv(gt1, gt2, gt3),AmpSqAhTocSvSv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqAhTocSvSv(gt1, gt2, gt3) 
  AmpSum2AhTocSvSv = AmpTreeAhTocSvSv + 2._dp*AmpWaveAhTocSvSv + 2._dp*AmpVertexAhTocSvSv
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MAhOS(gt1),MSvOS(gt2),MSvOS(gt3),AmpSumAhTocSvSv(gt1, gt2, gt3),AmpSum2AhTocSvSv(gt1, gt2, gt3),AmpSqAhTocSvSv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MAh(gt1),MSv(gt2),MSv(gt3),AmpSumAhTocSvSv(gt1, gt2, gt3),AmpSum2AhTocSvSv(gt1, gt2, gt3),AmpSqAhTocSvSv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqAhTocSvSv(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2AhTocSvSv = AmpTreeAhTocSvSv
  Call SquareAmp_StoSS(MAhOS(gt1),MSvOS(gt2),MSvOS(gt3),AmpSumAhTocSvSv(gt1, gt2, gt3),AmpSum2AhTocSvSv(gt1, gt2, gt3),AmpSqAhTocSvSv(gt1, gt2, gt3)) 
  AmpSqTreeAhTocSvSv(gt1, gt2, gt3) = AmpSqAhTocSvSv(gt1, gt2, gt3)  
  AmpSum2AhTocSvSv = + 2._dp*AmpWaveAhTocSvSv + 2._dp*AmpVertexAhTocSvSv
  Call SquareAmp_StoSS(MAhOS(gt1),MSvOS(gt2),MSvOS(gt3),AmpSumAhTocSvSv(gt1, gt2, gt3),AmpSum2AhTocSvSv(gt1, gt2, gt3),AmpSqAhTocSvSv(gt1, gt2, gt3)) 
  AmpSqAhTocSvSv(gt1, gt2, gt3) = AmpSqAhTocSvSv(gt1, gt2, gt3) + AmpSqTreeAhTocSvSv(gt1, gt2, gt3)  
Else  
  AmpSum2AhTocSvSv = AmpTreeAhTocSvSv
  Call SquareAmp_StoSS(MAh(gt1),MSv(gt2),MSv(gt3),AmpSumAhTocSvSv(gt1, gt2, gt3),AmpSum2AhTocSvSv(gt1, gt2, gt3),AmpSqAhTocSvSv(gt1, gt2, gt3)) 
  AmpSqTreeAhTocSvSv(gt1, gt2, gt3) = AmpSqAhTocSvSv(gt1, gt2, gt3)  
  AmpSum2AhTocSvSv = + 2._dp*AmpWaveAhTocSvSv + 2._dp*AmpVertexAhTocSvSv
  Call SquareAmp_StoSS(MAh(gt1),MSv(gt2),MSv(gt3),AmpSumAhTocSvSv(gt1, gt2, gt3),AmpSum2AhTocSvSv(gt1, gt2, gt3),AmpSqAhTocSvSv(gt1, gt2, gt3)) 
  AmpSqAhTocSvSv(gt1, gt2, gt3) = AmpSqAhTocSvSv(gt1, gt2, gt3) + AmpSqTreeAhTocSvSv(gt1, gt2, gt3)  
End if  
Else  
  AmpSqAhTocSvSv(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTocSvSv(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MSvOS(gt2),MSvOS(gt3),helfactor*AmpSqAhTocSvSv(gt1, gt2, gt3))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MSv(gt2),MSv(gt3),helfactor*AmpSqAhTocSvSv(gt1, gt2, gt3))
End if 
If ((Abs(MRPAhTocSvSv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocSvSv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPAhTocSvSv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGAhTocSvSv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPAhTocSvSv(gt1, gt2, gt3) + MRGAhTocSvSv(gt1, gt2, gt3)) 
  gP1LAh(gt1,i4) = gP1LAh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPAhTocSvSv(gt1, gt2, gt3) + MRGAhTocSvSv(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LAh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.6) isave = i4 
End do
End If 
!---------------- 
! Ah VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_AhToAhVP(MAhOS,MChaOS,MFdOS,MFeOS,MFuOS,              & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MAh2OS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,               & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,             & 
& cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,          & 
& cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,          & 
& cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,               & 
& cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,AmpVertexAhToAhVP)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_AhToAhVP(MAhOS,MChaOS,MFdOS,MFeOS,MFuOS,              & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MAh2OS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,               & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,             & 
& cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,          & 
& cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,          & 
& cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,               & 
& cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,AmpVertexAhToAhVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhToAhVP(MAh,MCha,MFd,MFe,MFu,MHpm,MSd,               & 
& MSe,MSu,MVP,MVWm,MAh2,MCha2,MFd2,MFe2,MFu2,MHpm2,MSd2,MSe2,MSu2,MVP2,MVWm2,            & 
& cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,           & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,         & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,           & 
& cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,AmpVertexAhToAhVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Ah VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToAhVP = 0._dp 
 AmpSum2AhToAhVP = 0._dp  
Else 
 AmpSumAhToAhVP = AmpVertexAhToAhVP + AmpWaveAhToAhVP
 AmpSum2AhToAhVP = AmpVertexAhToAhVP + AmpWaveAhToAhVP 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=3,6
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MAhOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MAh(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MAhOS(gt2),0._dp,AmpSumAhToAhVP(:,gt1, gt2),AmpSum2AhToAhVP(:,gt1, gt2),AmpSqAhToAhVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),MAh(gt2),MVP,AmpSumAhToAhVP(:,gt1, gt2),AmpSum2AhToAhVP(:,gt1, gt2),AmpSqAhToAhVP(gt1, gt2)) 
End if  
Else  
  AmpSqAhToAhVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToAhVP(gt1, gt2).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MAhOS(gt2),0._dp,helfactor*AmpSqAhToAhVP(gt1, gt2))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MAh(gt2),MVP,helfactor*AmpSqAhToAhVP(gt1, gt2))
End if 
If ((Abs(MRPAhToAhVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhToAhVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
!---------------- 
! Ah VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_AhToAhVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,             & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,  & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,           & 
& cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,              & 
& cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,             & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,      & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,AmpVertexAhToAhVZ)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_AhToAhVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,             & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,  & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,           & 
& cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,              & 
& cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,             & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,      & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,AmpVertexAhToAhVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhToAhVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChaVZL,cplcChaChaVZR,  & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,           & 
& cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,       & 
& cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,AmpVertexAhToAhVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Ah VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToAhVZ = 0._dp 
 AmpSum2AhToAhVZ = 0._dp  
Else 
 AmpSumAhToAhVZ = AmpVertexAhToAhVZ + AmpWaveAhToAhVZ
 AmpSum2AhToAhVZ = AmpVertexAhToAhVZ + AmpWaveAhToAhVZ 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=3,6
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MAhOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MAh(gt2))+Abs(MVZ))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MAhOS(gt2),MVZOS,AmpSumAhToAhVZ(:,gt1, gt2),AmpSum2AhToAhVZ(:,gt1, gt2),AmpSqAhToAhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),MAh(gt2),MVZ,AmpSumAhToAhVZ(:,gt1, gt2),AmpSum2AhToAhVZ(:,gt1, gt2),AmpSqAhToAhVZ(gt1, gt2)) 
End if  
Else  
  AmpSqAhToAhVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToAhVZ(gt1, gt2).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MAhOS(gt2),MVZOS,helfactor*AmpSqAhToAhVZ(gt1, gt2))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MAh(gt2),MVZ,helfactor*AmpSqAhToAhVZ(gt1, gt2))
End if 
If ((Abs(MRPAhToAhVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhToAhVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
!---------------- 
! Ah VZp
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_AhToAhVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,  & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,        & 
& cplcFuFuVZpR,cplcFvFvVZpL,cplcFvFvVZpR,cplcgWmgWmVZp,cplcgWpCgWpCVZp,cplhhVZVZp,       & 
& cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,           & 
& cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhHpmcVWmVZp1,cplAhcHpmVWmVZp1,             & 
& AmpVertexAhToAhVZp)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_AhToAhVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,  & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,        & 
& cplcFuFuVZpR,cplcFvFvVZpL,cplcFvFvVZpR,cplcgWmgWmVZp,cplcgWpCgWpCVZp,cplhhVZVZp,       & 
& cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,           & 
& cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhHpmcVWmVZp1,cplAhcHpmVWmVZp1,             & 
& AmpVertexAhToAhVZp)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhToAhVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChaVZpL,               & 
& cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,     & 
& cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvVZpL,cplcFvFvVZpR,cplcgWmgWmVZp,        & 
& cplcgWpCgWpCVZp,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,        & 
& cplSecSeVZp,cplSucSuVZp,cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhHpmcVWmVZp1,      & 
& cplAhcHpmVWmVZp1,AmpVertexAhToAhVZp)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Ah VZp -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToAhVZp = 0._dp 
 AmpSum2AhToAhVZp = 0._dp  
Else 
 AmpSumAhToAhVZp = AmpVertexAhToAhVZp + AmpWaveAhToAhVZp
 AmpSum2AhToAhVZp = AmpVertexAhToAhVZp + AmpWaveAhToAhVZp 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=3,6
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MAhOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MAh(gt2))+Abs(MVZp))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MAhOS(gt2),MVZpOS,AmpSumAhToAhVZp(:,gt1, gt2),AmpSum2AhToAhVZp(:,gt1, gt2),AmpSqAhToAhVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),MAh(gt2),MVZp,AmpSumAhToAhVZp(:,gt1, gt2),AmpSum2AhToAhVZp(:,gt1, gt2),AmpSqAhToAhVZp(gt1, gt2)) 
End if  
Else  
  AmpSqAhToAhVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToAhVZp(gt1, gt2).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MAhOS(gt2),MVZpOS,helfactor*AmpSqAhToAhVZp(gt1, gt2))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MAh(gt2),MVZp,helfactor*AmpSqAhToAhVZp(gt1, gt2))
End if 
If ((Abs(MRPAhToAhVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhToAhVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
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
Call Amplitude_VERTEX_sec_UMSSM_AhToGluGlu(MAhOS,MFdOS,MFuOS,MGluOS,MSdOS,            & 
& MSuOS,MAh2OS,MFd2OS,MFu2OS,MGlu2OS,MSd2OS,MSu2OS,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,cplAhSucSu,cplGluFdcSdL,cplGluFdcSdR,               & 
& cplGluFucSuL,cplGluFucSuR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,         & 
& AmpVertexAhToGluGlu)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_AhToGluGlu(MAhOS,MFdOS,MFuOS,MGluOS,MSdOS,            & 
& MSuOS,MAh2OS,MFd2OS,MFu2OS,MGlu2OS,MSd2OS,MSu2OS,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,cplAhSucSu,cplGluFdcSdL,cplGluFdcSdR,               & 
& cplGluFucSuL,cplGluFucSuR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,         & 
& AmpVertexAhToGluGlu)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhToGluGlu(MAh,MFd,MFu,MGlu,MSd,MSu,MAh2,             & 
& MFd2,MFu2,MGlu2,MSd2,MSu2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,             & 
& cplAhSdcSd,cplAhSucSu,cplGluFdcSdL,cplGluFdcSdR,cplGluFucSuL,cplGluFucSuR,             & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,AmpVertexAhToGluGlu)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->Glu Glu -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToGluGlu = 0._dp 
 AmpSum2AhToGluGlu = 0._dp  
Else 
 AmpSumAhToGluGlu = AmpVertexAhToGluGlu + AmpWaveAhToGluGlu
 AmpSum2AhToGluGlu = AmpVertexAhToGluGlu + AmpWaveAhToGluGlu 
End If 
Do gt1=1,6
i4 = isave 
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MGluOS)+Abs(MGluOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MGlu)+Abs(MGlu))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MAhOS(gt1),MGluOS,MGluOS,AmpSumAhToGluGlu(:,gt1),AmpSum2AhToGluGlu(:,gt1),AmpSqAhToGluGlu(gt1)) 
Else  
  Call SquareAmp_StoFF(MAh(gt1),MGlu,MGlu,AmpSumAhToGluGlu(:,gt1),AmpSum2AhToGluGlu(:,gt1),AmpSqAhToGluGlu(gt1)) 
End if  
Else  
  AmpSqAhToGluGlu(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqAhToGluGlu(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 4._dp*GammaTPS(MAhOS(gt1),MGluOS,MGluOS,helfactor*AmpSqAhToGluGlu(gt1))
Else 
  gP1LAh(gt1,i4) = 4._dp*GammaTPS(MAh(gt1),MGlu,MGlu,helfactor*AmpSqAhToGluGlu(gt1))
End if 
If ((Abs(MRPAhToGluGlu(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToGluGlu(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.6) isave = i4 
End do
!---------------- 
! hh VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_sec_UMSSM_AhTohhVP(cplAhhhVZ,cplAhhhVZp,ctcplAhhhVZ,              & 
& ctcplAhhhVZp,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfAh,Zfhh,ZfVP,           & 
& ZfVZpVP,ZfVZVP,AmpWaveAhTohhVP)

 Else 
Call Amplitude_WAVE_sec_UMSSM_AhTohhVP(cplAhhhVZ,cplAhhhVZp,ctcplAhhhVZ,              & 
& ctcplAhhhVZp,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfAh,Zfhh,ZfVP,           & 
& ZfVZpVP,ZfVZVP,AmpWaveAhTohhVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_AhTohhVP(MAhOS,MChaOS,MFdOS,MFeOS,MFuOS,              & 
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
& cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,AmpVertexAhTohhVP)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_AhTohhVP(MAhOS,MChaOS,MFdOS,MFeOS,MFuOS,              & 
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
& cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,cplhhHpmcVWmVP1,cplhhcHpmVPVWm1,AmpVertexAhTohhVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_AhTohhVP(cplAhhhVZ,cplAhhhVZp,ctcplAhhhVZ,              & 
& ctcplAhhhVZp,MAh,MAh2,Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,ZfAh,Zfhh,ZfVP,ZfVZpVP,               & 
& ZfVZVP,AmpWaveAhTohhVP)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhTohhVP(MAh,MCha,MFd,MFe,MFu,Mhh,MHpm,               & 
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
& cplhhcHpmVPVWm1,AmpVertexAhTohhVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->hh VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhTohhVP = 0._dp 
 AmpSum2AhTohhVP = 0._dp  
Else 
 AmpSumAhTohhVP = AmpVertexAhTohhVP + AmpWaveAhTohhVP
 AmpSum2AhTohhVP = AmpVertexAhTohhVP + AmpWaveAhTohhVP 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MhhOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(Mhh(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MAhOS(gt1),MhhOS(gt2),0._dp,AmpSumAhTohhVP(:,gt1, gt2),AmpSum2AhTohhVP(:,gt1, gt2),AmpSqAhTohhVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MAh(gt1),Mhh(gt2),MVP,AmpSumAhTohhVP(:,gt1, gt2),AmpSum2AhTohhVP(:,gt1, gt2),AmpSqAhTohhVP(gt1, gt2)) 
End if  
Else  
  AmpSqAhTohhVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhTohhVP(gt1, gt2).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MhhOS(gt2),0._dp,helfactor*AmpSqAhTohhVP(gt1, gt2))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),Mhh(gt2),MVP,helfactor*AmpSqAhTohhVP(gt1, gt2))
End if 
If ((Abs(MRPAhTohhVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGAhTohhVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
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
Call Amplitude_VERTEX_sec_UMSSM_AhToVGVG(MAhOS,MFdOS,MFuOS,MSdOS,MSuOS,               & 
& MVG,MAh2OS,MFd2OS,MFu2OS,MSd2OS,MSu2OS,MVG2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,       & 
& cplcFuFuAhR,cplAhSdcSd,cplAhSucSu,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,     & 
& cplSdcSdVG,cplSucSuVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& AmpVertexAhToVGVG)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_AhToVGVG(MAhOS,MFdOS,MFuOS,MSdOS,MSuOS,               & 
& MVG,MAh2OS,MFd2OS,MFu2OS,MSd2OS,MSu2OS,MVG2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,       & 
& cplcFuFuAhR,cplAhSdcSd,cplAhSucSu,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,     & 
& cplSdcSdVG,cplSucSuVG,cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,& 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& AmpVertexAhToVGVG)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhToVGVG(MAh,MFd,MFu,MSd,MSu,MVG,MAh2,MFd2,           & 
& MFu2,MSd2,MSu2,MVG2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,        & 
& cplAhSucSu,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplSdcSdVG,cplSucSuVG,      & 
& cplSdcSdVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSdcSdVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& cplSucSuVGVGsumj113Lamct3ct2j1Lamct4j1ct1,cplSucSuVGVGsumj113Lamct3j1ct1Lamct4ct2j1,   & 
& AmpVertexAhToVGVG)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VG VG -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVGVG = 0._dp 
 AmpSum2AhToVGVG = 0._dp  
Else 
 AmpSumAhToVGVG = AmpVertexAhToVGVG + AmpWaveAhToVGVG
 AmpSum2AhToVGVG = AmpVertexAhToVGVG + AmpWaveAhToVGVG 
End If 
Do gt1=1,6
i4 = isave 
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(0.)+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MVG)+Abs(MVG))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS(gt1),0._dp,0._dp,AmpSumAhToVGVG(:,gt1),AmpSum2AhToVGVG(:,gt1),AmpSqAhToVGVG(gt1)) 
Else  
  Call SquareAmp_StoVV(MAh(gt1),MVG,MVG,AmpSumAhToVGVG(:,gt1),AmpSum2AhToVGVG(:,gt1),AmpSqAhToVGVG(gt1)) 
End if  
Else  
  AmpSqAhToVGVG(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVGVG(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 8._dp*GammaTPS(MAhOS(gt1),0._dp,0._dp,helfactor*AmpSqAhToVGVG(gt1))
Else 
  gP1LAh(gt1,i4) = 8._dp*GammaTPS(MAh(gt1),MVG,MVG,helfactor*AmpSqAhToVGVG(gt1))
End if 
If ((Abs(MRPAhToVGVG(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToVGVG(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
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
Call Amplitude_VERTEX_sec_UMSSM_AhToVPVP(MAhOS,MChaOS,MFdOS,MFeOS,MFuOS,              & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MAh2OS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,               & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,             & 
& cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,          & 
& cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,          & 
& cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,               & 
& cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,cplHpmcHpmVPVP1,cplSdcSdVPVPaa,cplSecSeVPVP1,          & 
& cplSucSuVPVPaa,AmpVertexAhToVPVP)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_AhToVPVP(MAhOS,MChaOS,MFdOS,MFeOS,MFuOS,              & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MAh2OS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,               & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,             & 
& cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,          & 
& cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,          & 
& cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,               & 
& cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,cplHpmcHpmVPVP1,cplSdcSdVPVPaa,cplSecSeVPVP1,          & 
& cplSucSuVPVPaa,AmpVertexAhToVPVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhToVPVP(MAh,MCha,MFd,MFe,MFu,MHpm,MSd,               & 
& MSe,MSu,MVP,MVWm,MAh2,MCha2,MFd2,MFe2,MFu2,MHpm2,MSd2,MSe2,MSu2,MVP2,MVWm2,            & 
& cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,           & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,         & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcgWmgWmVP,cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,           & 
& cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,cplAhHpmcVWmVP1,cplAhcHpmVPVWm1,cplHpmcHpmVPVP1,  & 
& cplSdcSdVPVPaa,cplSecSeVPVP1,cplSucSuVPVPaa,AmpVertexAhToVPVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VP VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVPVP = 0._dp 
 AmpSum2AhToVPVP = 0._dp  
Else 
 AmpSumAhToVPVP = AmpVertexAhToVPVP + AmpWaveAhToVPVP
 AmpSum2AhToVPVP = AmpVertexAhToVPVP + AmpWaveAhToVPVP 
End If 
Do gt1=1,6
i4 = isave 
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(0.)+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MVP)+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS(gt1),0._dp,0._dp,AmpSumAhToVPVP(:,gt1),AmpSum2AhToVPVP(:,gt1),AmpSqAhToVPVP(gt1)) 
Else  
  Call SquareAmp_StoVV(MAh(gt1),MVP,MVP,AmpSumAhToVPVP(:,gt1),AmpSum2AhToVPVP(:,gt1),AmpSqAhToVPVP(gt1)) 
End if  
Else  
  AmpSqAhToVPVP(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVPVP(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),0._dp,0._dp,helfactor*AmpSqAhToVPVP(gt1))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MVP,MVP,helfactor*AmpSqAhToVPVP(gt1))
End if 
If ((Abs(MRPAhToVPVP(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToVPVP(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
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
Call Amplitude_VERTEX_sec_UMSSM_AhToVPVZ(MAhOS,MChaOS,MFdOS,MFeOS,MFuOS,              & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,         & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,          & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,           & 
& cplAhSucSu,cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,       & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplHpmcHpmVP,cplHpmcVWmVP,     & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVZ,cplSecSeVP,cplSecSeVZ,cplSucSuVP,      & 
& cplSucSuVZ,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVP1,        & 
& cplAhHpmcVWmVZ1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplHpmcHpmVPVZ1,cplSdcSdVPVZaa,        & 
& cplSecSeVPVZ1,cplSucSuVPVZaa,AmpVertexAhToVPVZ)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_AhToVPVZ(MAhOS,MChaOS,MFdOS,MFeOS,MFuOS,              & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MVZOS,MAh2OS,MCha2OS,MFd2OS,MFe2OS,MFu2OS,         & 
& MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,MVZ2OS,cplcChaChaAhL,cplcChaChaAhR,          & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,           & 
& cplAhSucSu,cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,       & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,cplcgWpCgWpCVZ,cplHpmcHpmVP,cplHpmcVWmVP,     & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVP,cplSdcSdVZ,cplSecSeVP,cplSecSeVZ,cplSucSuVP,      & 
& cplSucSuVZ,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVP1,        & 
& cplAhHpmcVWmVZ1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplHpmcHpmVPVZ1,cplSdcSdVPVZaa,        & 
& cplSecSeVPVZ1,cplSucSuVPVZaa,AmpVertexAhToVPVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhToVPVZ(MAh,MCha,MFd,MFe,MFu,MHpm,MSd,               & 
& MSe,MSu,MVP,MVWm,MVZ,MAh2,MCha2,MFd2,MFe2,MFu2,MHpm2,MSd2,MSe2,MSu2,MVP2,              & 
& MVWm2,MVZ2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,          & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhcHpmVWm,cplcChaChaVPL,              & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,         & 
& cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWmgWmVP,cplcgWmgWmVZ,cplcgWpCgWpCVP,          & 
& cplcgWpCgWpCVZ,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVP,         & 
& cplSdcSdVZ,cplSecSeVP,cplSecSeVZ,cplSucSuVP,cplSucSuVZ,cplcHpmVPVWm,cplcVWmVPVWm,      & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhHpmcVWmVP1,cplAhHpmcVWmVZ1,cplAhcHpmVPVWm1,             & 
& cplAhcHpmVWmVZ1,cplHpmcHpmVPVZ1,cplSdcSdVPVZaa,cplSecSeVPVZ1,cplSucSuVPVZaa,           & 
& AmpVertexAhToVPVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VP VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVPVZ = 0._dp 
 AmpSum2AhToVPVZ = 0._dp  
Else 
 AmpSumAhToVPVZ = AmpVertexAhToVPVZ + AmpWaveAhToVPVZ
 AmpSum2AhToVPVZ = AmpVertexAhToVPVZ + AmpWaveAhToVPVZ 
End If 
Do gt1=1,6
i4 = isave 
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(0.)+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MVP)+Abs(MVZ))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS(gt1),0._dp,MVZOS,AmpSumAhToVPVZ(:,gt1),AmpSum2AhToVPVZ(:,gt1),AmpSqAhToVPVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(MAh(gt1),MVP,MVZ,AmpSumAhToVPVZ(:,gt1),AmpSum2AhToVPVZ(:,gt1),AmpSqAhToVPVZ(gt1)) 
End if  
Else  
  AmpSqAhToVPVZ(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVPVZ(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAhOS(gt1),0._dp,MVZOS,helfactor*AmpSqAhToVPVZ(gt1))
Else 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAh(gt1),MVP,MVZ,helfactor*AmpSqAhToVPVZ(gt1))
End if 
If ((Abs(MRPAhToVPVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToVPVZ(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
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
Call Amplitude_VERTEX_sec_UMSSM_AhToVPVZp(MAhOS,MChaOS,MFdOS,MFeOS,MFuOS,             & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MVZpOS,MAh2OS,MCha2OS,MFd2OS,MFe2OS,               & 
& MFu2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,  & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,           & 
& cplAhSucSu,cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZpL,cplcChaChaVZpR,     & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWmgWmVP,cplcgWmgWmVZp,cplcgWpCgWpCVP,cplcgWpCgWpCVZp,cplHpmcHpmVP,cplHpmcVWmVP,   & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVP,cplSdcSdVZp,cplSecSeVP,cplSecSeVZp,             & 
& cplSucSuVP,cplSucSuVZp,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,          & 
& cplAhHpmcVWmVP1,cplAhHpmcVWmVZp1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZp1,cplHpmcHpmVPVZp1,    & 
& cplSdcSdVPVZpaa,cplSecSeVPVZp1,cplSucSuVPVZpaa,AmpVertexAhToVPVZp)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_AhToVPVZp(MAhOS,MChaOS,MFdOS,MFeOS,MFuOS,             & 
& MHpmOS,MSdOS,MSeOS,MSuOS,MVP,MVWmOS,MVZpOS,MAh2OS,MCha2OS,MFd2OS,MFe2OS,               & 
& MFu2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MVP2,MVWm2OS,MVZp2OS,cplcChaChaAhL,cplcChaChaAhR,  & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,           & 
& cplAhSucSu,cplAhcHpmVWm,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZpL,cplcChaChaVZpR,     & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcgWmgWmVP,cplcgWmgWmVZp,cplcgWpCgWpCVP,cplcgWpCgWpCVZp,cplHpmcHpmVP,cplHpmcVWmVP,   & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVP,cplSdcSdVZp,cplSecSeVP,cplSecSeVZp,             & 
& cplSucSuVP,cplSucSuVZp,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZp,cplcVWmVWmVZp,          & 
& cplAhHpmcVWmVP1,cplAhHpmcVWmVZp1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZp1,cplHpmcHpmVPVZp1,    & 
& cplSdcSdVPVZpaa,cplSecSeVPVZp1,cplSucSuVPVZpaa,AmpVertexAhToVPVZp)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhToVPVZp(MAh,MCha,MFd,MFe,MFu,MHpm,MSd,              & 
& MSe,MSu,MVP,MVWm,MVZp,MAh2,MCha2,MFd2,MFe2,MFu2,MHpm2,MSd2,MSe2,MSu2,MVP2,             & 
& MVWm2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhHpmcHpm,          & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhcHpmVWm,cplcChaChaVPL,              & 
& cplcChaChaVPR,cplcChaChaVZpL,cplcChaChaVZpR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZpL,      & 
& cplcFdFdVZpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVPL,            & 
& cplcFuFuVPR,cplcFuFuVZpL,cplcFuFuVZpR,cplcgWmgWmVP,cplcgWmgWmVZp,cplcgWpCgWpCVP,       & 
& cplcgWpCgWpCVZp,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVP,      & 
& cplSdcSdVZp,cplSecSeVP,cplSecSeVZp,cplSucSuVP,cplSucSuVZp,cplcHpmVPVWm,cplcVWmVPVWm,   & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhHpmcVWmVP1,cplAhHpmcVWmVZp1,cplAhcHpmVPVWm1,          & 
& cplAhcHpmVWmVZp1,cplHpmcHpmVPVZp1,cplSdcSdVPVZpaa,cplSecSeVPVZp1,cplSucSuVPVZpaa,      & 
& AmpVertexAhToVPVZp)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VP VZp -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVPVZp = 0._dp 
 AmpSum2AhToVPVZp = 0._dp  
Else 
 AmpSumAhToVPVZp = AmpVertexAhToVPVZp + AmpWaveAhToVPVZp
 AmpSum2AhToVPVZp = AmpVertexAhToVPVZp + AmpWaveAhToVPVZp 
End If 
Do gt1=1,6
i4 = isave 
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(0.)+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MVP)+Abs(MVZp))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS(gt1),0._dp,MVZpOS,AmpSumAhToVPVZp(:,gt1),AmpSum2AhToVPVZp(:,gt1),AmpSqAhToVPVZp(gt1)) 
Else  
  Call SquareAmp_StoVV(MAh(gt1),MVP,MVZp,AmpSumAhToVPVZp(:,gt1),AmpSum2AhToVPVZp(:,gt1),AmpSqAhToVPVZp(gt1)) 
End if  
Else  
  AmpSqAhToVPVZp(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVPVZp(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAhOS(gt1),0._dp,MVZpOS,helfactor*AmpSqAhToVPVZp(gt1))
Else 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAh(gt1),MVP,MVZp,helfactor*AmpSqAhToVPVZp(gt1))
End if 
If ((Abs(MRPAhToVPVZp(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToVPVZp(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.6) isave = i4 
End do
!---------------- 
! VWm Conjg(VWm)
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_AhToVWmcVWm(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,              & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,    & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,              & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,       & 
& cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgAgWpCVWm,  & 
& cplcgZgWpCVWm,cplcgZpgWpCVWm,cplcgWmgZVWm,cplcgWpCgZcVWm,cplcgWmgZpVWm,cplcgWpCgZpcVWm,& 
& cplhhHpmcVWm,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,        & 
& cplSdcSucVWm,cplSecSvcVWm,cplSucSdVWm,cplSvcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,           & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhcVWmVWm1,cplAhHpmcVWmVP1, & 
& cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,     & 
& cplhhhhcVWmVWm1,cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa,cplSecSecVWmVWm1,cplSucSucVWmVWmaa,& 
& cplSvcSvcVWmVWm1,AmpVertexAhToVWmcVWm)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_AhToVWmcVWm(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,          & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,              & 
& MAh2OS,MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,              & 
& MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,    & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,              & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,       & 
& cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgAgWpCVWm,  & 
& cplcgZgWpCVWm,cplcgZpgWpCVWm,cplcgWmgZVWm,cplcgWpCgZcVWm,cplcgWmgZpVWm,cplcgWpCgZpcVWm,& 
& cplhhHpmcVWm,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,        & 
& cplSdcSucVWm,cplSecSvcVWm,cplSucSdVWm,cplSvcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,           & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhcVWmVWm1,cplAhHpmcVWmVP1, & 
& cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,     & 
& cplhhhhcVWmVWm1,cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa,cplSecSecVWmVWm1,cplSucSucVWmVWmaa,& 
& cplSvcSvcVWmVWm1,AmpVertexAhToVWmcVWm)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhToVWmcVWm(MAh,MCha,MChi,MFd,MFe,MFu,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,            & 
& MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,         & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,               & 
& cplcgWmgWmAh,cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,               & 
& cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacVWmL,  & 
& cplChiChacVWmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,              & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,       & 
& cplcgWmgAVWm,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgAgWpCVWm,  & 
& cplcgZgWpCVWm,cplcgZpgWpCVWm,cplcgWmgZVWm,cplcgWpCgZcVWm,cplcgWmgZpVWm,cplcgWpCgZpcVWm,& 
& cplhhHpmcVWm,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,        & 
& cplSdcSucVWm,cplSecSvcVWm,cplSucSdVWm,cplSvcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,           & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhcVWmVWm1,cplAhHpmcVWmVP1, & 
& cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,cplAhcHpmVPVWm1,cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,     & 
& cplhhhhcVWmVWm1,cplHpmcHpmcVWmVWm1,cplSdcSdcVWmVWmaa,cplSecSecVWmVWm1,cplSucSucVWmVWmaa,& 
& cplSvcSvcVWmVWm1,AmpVertexAhToVWmcVWm)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VWm conj[VWm] -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVWmcVWm = 0._dp 
 AmpSum2AhToVWmcVWm = 0._dp  
Else 
 AmpSumAhToVWmcVWm = AmpVertexAhToVWmcVWm + AmpWaveAhToVWmcVWm
 AmpSum2AhToVWmcVWm = AmpVertexAhToVWmcVWm + AmpWaveAhToVWmcVWm 
End If 
Do gt1=1,6
i4 = isave 
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MVWmOS)+Abs(MVWmOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MVWm)+Abs(MVWm))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS(gt1),MVWmOS,MVWmOS,AmpSumAhToVWmcVWm(:,gt1),AmpSum2AhToVWmcVWm(:,gt1),AmpSqAhToVWmcVWm(gt1)) 
Else  
  Call SquareAmp_StoVV(MAh(gt1),MVWm,MVWm,AmpSumAhToVWmcVWm(:,gt1),AmpSum2AhToVWmcVWm(:,gt1),AmpSqAhToVWmcVWm(gt1)) 
End if  
Else  
  AmpSqAhToVWmcVWm(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVWmcVWm(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAhOS(gt1),MVWmOS,MVWmOS,helfactor*AmpSqAhToVWmcVWm(gt1))
Else 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAh(gt1),MVWm,MVWm,helfactor*AmpSqAhToVWmcVWm(gt1))
End if 
If ((Abs(MRPAhToVWmcVWm(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToVWmcVWm(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.6) isave = i4 
End do
!---------------- 
! VZ VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_AhToVZVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,             & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplcChaChaAhL,cplcChaChaAhR,            & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,        & 
& cplAhSvcSv,cplAhcHpmVWm,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,         & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,cplhhVZVZp,              & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,    & 
& cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhhhVZVZ1,cplHpmcHpmVZVZ1,& 
& cplSdcSdVZVZaa,cplSecSeVZVZ1,cplSucSuVZVZaa,cplSvcSvVZVZ1,AmpVertexAhToVZVZ)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_AhToVZVZ(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,             & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplcChaChaAhL,cplcChaChaAhR,            & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,        & 
& cplAhSvcSv,cplAhcHpmVWm,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,         & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,cplhhVZVZp,              & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,    & 
& cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,cplhhhhVZVZ1,cplHpmcHpmVZVZ1,& 
& cplSdcSdVZVZaa,cplSecSeVZVZ1,cplSucSuVZVZaa,cplSvcSvVZVZ1,AmpVertexAhToVZVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhToVZVZ(MAh,MCha,MChi,MFd,MFe,MFu,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplcChaChaAhL,               & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,               & 
& cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChaVZL,cplcChaChaVZR,             & 
& cplChiChiVZL,cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,           & 
& cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,       & 
& cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplAhAhVZVZ1,cplAhHpmcVWmVZ1,cplAhcHpmVWmVZ1,     & 
& cplhhhhVZVZ1,cplHpmcHpmVZVZ1,cplSdcSdVZVZaa,cplSecSeVZVZ1,cplSucSuVZVZaa,              & 
& cplSvcSvVZVZ1,AmpVertexAhToVZVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VZ VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVZVZ = 0._dp 
 AmpSum2AhToVZVZ = 0._dp  
Else 
 AmpSumAhToVZVZ = AmpVertexAhToVZVZ + AmpWaveAhToVZVZ
 AmpSum2AhToVZVZ = AmpVertexAhToVZVZ + AmpWaveAhToVZVZ 
End If 
Do gt1=1,6
i4 = isave 
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MVZOS)+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MVZ)+Abs(MVZ))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS(gt1),MVZOS,MVZOS,AmpSumAhToVZVZ(:,gt1),AmpSum2AhToVZVZ(:,gt1),AmpSqAhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(MAh(gt1),MVZ,MVZ,AmpSumAhToVZVZ(:,gt1),AmpSum2AhToVZVZ(:,gt1),AmpSqAhToVZVZ(gt1)) 
End if  
Else  
  AmpSqAhToVZVZ(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVZVZ(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MVZOS,MVZOS,helfactor*AmpSqAhToVZVZ(gt1))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MVZ,MVZ,helfactor*AmpSqAhToVZVZ(gt1))
End if 
If ((Abs(MRPAhToVZVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToVZVZ(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.6) isave = i4 
End do
!---------------- 
! VZ VZp
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_AhToVZVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplcChaChaAhL,cplcChaChaAhR,            & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,         & 
& cplcChaChaVZpR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVZL,      & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvVZL,            & 
& cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWpCgWpCVZ,       & 
& cplcgWpCgWpCVZp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,            & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,cplSecSeVZ,cplSecSeVZp,             & 
& cplSucSuVZ,cplSucSuVZp,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVWmVZ,cplcVWmVWmVZ,               & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZVZp1,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,            & 
& cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplhhhhVZVZp1,cplHpmcHpmVZVZp1,cplSdcSdVZVZpaa,       & 
& cplSecSeVZVZp1,cplSucSuVZVZpaa,cplSvcSvVZVZp1,AmpVertexAhToVZVZp)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_AhToVZVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplcChaChaAhL,cplcChaChaAhR,            & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,         & 
& cplcChaChaVZpR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVZL,      & 
& cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,            & 
& cplcFeFeVZpR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvVZL,            & 
& cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,cplcgWmgWmVZ,cplcgWmgWmVZp,cplcgWpCgWpCVZ,       & 
& cplcgWpCgWpCVZp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,            & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,cplSecSeVZ,cplSecSeVZp,             & 
& cplSucSuVZ,cplSucSuVZp,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVWmVZ,cplcVWmVWmVZ,               & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZVZp1,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,            & 
& cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplhhhhVZVZp1,cplHpmcHpmVZVZp1,cplSdcSdVZVZpaa,       & 
& cplSecSeVZVZp1,cplSucSuVZVZpaa,cplSvcSvVZVZp1,AmpVertexAhToVZVZp)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhToVZVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplcChaChaAhL,               & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,               & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChaVZL,cplcChaChaVZR,  & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,   & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,cplcFuFuVZpR,           & 
& cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,cplcgWmgWmVZ,cplcgWmgWmVZp,          & 
& cplcgWpCgWpCVZ,cplcgWpCgWpCVZp,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZ,          & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZ,cplSdcSdVZp,cplSecSeVZ,            & 
& cplSecSeVZp,cplSucSuVZ,cplSucSuVZp,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVWmVZ,cplcVWmVWmVZ,   & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZVZp1,cplAhHpmcVWmVZ1,cplAhHpmcVWmVZp1,            & 
& cplAhcHpmVWmVZ1,cplAhcHpmVWmVZp1,cplhhhhVZVZp1,cplHpmcHpmVZVZp1,cplSdcSdVZVZpaa,       & 
& cplSecSeVZVZp1,cplSucSuVZVZpaa,cplSvcSvVZVZp1,AmpVertexAhToVZVZp)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VZ VZp -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVZVZp = 0._dp 
 AmpSum2AhToVZVZp = 0._dp  
Else 
 AmpSumAhToVZVZp = AmpVertexAhToVZVZp + AmpWaveAhToVZVZp
 AmpSum2AhToVZVZp = AmpVertexAhToVZVZp + AmpWaveAhToVZVZp 
End If 
Do gt1=1,6
i4 = isave 
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MVZOS)+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MVZ)+Abs(MVZp))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS(gt1),MVZOS,MVZpOS,AmpSumAhToVZVZp(:,gt1),AmpSum2AhToVZVZp(:,gt1),AmpSqAhToVZVZp(gt1)) 
Else  
  Call SquareAmp_StoVV(MAh(gt1),MVZ,MVZp,AmpSumAhToVZVZp(:,gt1),AmpSum2AhToVZVZp(:,gt1),AmpSqAhToVZVZp(gt1)) 
End if  
Else  
  AmpSqAhToVZVZp(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVZVZp(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAhOS(gt1),MVZOS,MVZpOS,helfactor*AmpSqAhToVZVZp(gt1))
Else 
  gP1LAh(gt1,i4) = 2._dp*GammaTPS(MAh(gt1),MVZ,MVZp,helfactor*AmpSqAhToVZVZp(gt1))
End if 
If ((Abs(MRPAhToVZVZp(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToVZVZp(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.6) isave = i4 
End do
!---------------- 
! VZp VZp
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_AhToVZpVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplcChaChaAhL,cplcChaChaAhR,            & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,       & 
& cplAhSvcSv,cplAhcHpmVWm,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,     & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,         & 
& cplcFvFvVZpL,cplcFvFvVZpR,cplcgWmgWmVZp,cplcgWpCgWpCVZp,cplhhVZVZp,cplhhVZpVZp,        & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvcSvVZp,           & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZpVZp1,cplAhHpmcVWmVZp1,cplAhcHpmVWmVZp1,          & 
& cplhhhhVZpVZp1,cplHpmcHpmVZpVZp1,cplSdcSdVZpVZpaa,cplSecSeVZpVZp1,cplSucSuVZpVZpaa,    & 
& cplSvcSvVZpVZp1,AmpVertexAhToVZpVZp)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_AhToVZpVZp(MAhOS,MChaOS,MChiOS,MFdOS,MFeOS,           & 
& MFuOS,MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,           & 
& MCha2OS,MChi2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,              & 
& MSu2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhAhAh,cplcChaChaAhL,cplcChaChaAhR,            & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,cplcgWpCgWpCAh,           & 
& cplAhhhhh,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,       & 
& cplAhSvcSv,cplAhcHpmVWm,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,     & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFuFuVZpL,cplcFuFuVZpR,         & 
& cplcFvFvVZpL,cplcFvFvVZpR,cplcgWmgWmVZp,cplcgWpCgWpCVZp,cplhhVZVZp,cplhhVZpVZp,        & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,cplSucSuVZp,cplSvcSvVZp,           & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZpVZp1,cplAhHpmcVWmVZp1,cplAhcHpmVWmVZp1,          & 
& cplhhhhVZpVZp1,cplHpmcHpmVZpVZp1,cplSdcSdVZpVZpaa,cplSecSeVZpVZp1,cplSucSuVZpVZpaa,    & 
& cplSvcSvVZpVZp1,AmpVertexAhToVZpVZp)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_AhToVZpVZp(MAh,MCha,MChi,MFd,MFe,MFu,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFe2,MFu2,MFv2,           & 
& Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplcChaChaAhL,               & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplcgWmgWmAh,              & 
& cplcgWpCgWpCAh,cplAhhhhh,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,              & 
& cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcChaChaVZpL,cplcChaChaVZpR,           & 
& cplChiChiVZpL,cplChiChiVZpR,cplcFdFdVZpL,cplcFdFdVZpR,cplcFeFeVZpL,cplcFeFeVZpR,       & 
& cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvVZpL,cplcFvFvVZpR,cplcgWmgWmVZp,cplcgWpCgWpCVZp,     & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplSecSeVZp,            & 
& cplSucSuVZp,cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplAhAhVZpVZp1,cplAhHpmcVWmVZp1,   & 
& cplAhcHpmVWmVZp1,cplhhhhVZpVZp1,cplHpmcHpmVZpVZp1,cplSdcSdVZpVZpaa,cplSecSeVZpVZp1,    & 
& cplSucSuVZpVZpaa,cplSvcSvVZpVZp1,AmpVertexAhToVZpVZp)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Ah->VZp VZp -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumAhToVZpVZp = 0._dp 
 AmpSum2AhToVZpVZp = 0._dp  
Else 
 AmpSumAhToVZpVZp = AmpVertexAhToVZpVZp + AmpWaveAhToVZpVZp
 AmpSum2AhToVZpVZp = AmpVertexAhToVZpVZp + AmpWaveAhToVZpVZp 
End If 
Do gt1=1,6
i4 = isave 
If (((OSkinematics).and.(Abs(MAhOS(gt1)).gt.(Abs(MVZpOS)+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MAh(gt1)).gt.(Abs(MVZp)+Abs(MVZp))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MAhOS(gt1),MVZpOS,MVZpOS,AmpSumAhToVZpVZp(:,gt1),AmpSum2AhToVZpVZp(:,gt1),AmpSqAhToVZpVZp(gt1)) 
Else  
  Call SquareAmp_StoVV(MAh(gt1),MVZp,MVZp,AmpSumAhToVZpVZp(:,gt1),AmpSum2AhToVZpVZp(:,gt1),AmpSqAhToVZpVZp(gt1)) 
End if  
Else  
  AmpSqAhToVZpVZp(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqAhToVZpVZp(gt1).eq.0._dp) Then 
  gP1LAh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAhOS(gt1),MVZpOS,MVZpOS,helfactor*AmpSqAhToVZpVZp(gt1))
Else 
  gP1LAh(gt1,i4) = 1._dp*GammaTPS(MAh(gt1),MVZp,MVZp,helfactor*AmpSqAhToVZpVZp(gt1))
End if 
If ((Abs(MRPAhToVZpVZp(gt1)).gt.1.0E-20_dp).or.(Abs(MRGAhToVZpVZp(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LAh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.6) isave = i4 
End do
End Subroutine OneLoopDecay_Ah

End Module Wrapper_OneLoopDecay_Ah_sec_UMSSM
