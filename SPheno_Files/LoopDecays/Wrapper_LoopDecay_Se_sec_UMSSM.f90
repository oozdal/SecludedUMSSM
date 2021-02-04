! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 1:11 on 7.11.2019   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Se_sec_UMSSM
Use Model_Data_sec_UMSSM 
Use Kinematics 
Use OneLoopDecay_Se_sec_UMSSM 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Se(MSdOS,MSd2OS,MSvOS,MSv2OS,MSuOS,MSu2OS,MSeOS,              & 
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
& ZfVZVZp,ZfVZpVZ,cplAhAhAh,cplAhAhhh,cplAhAhSecSe1,cplAhcHpmVWm,cplAhhhhh,              & 
& cplAhhhSecSe1,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhHpmSvcSe1,           & 
& cplAhSdcSd,cplAhSecHpmcSv1,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplcChacFvSeL,             & 
& cplcChacFvSeR,cplcChaChaAhL,cplcChaChaAhR,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,   & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChaVZR,               & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFecSvL,             & 
& cplcChaFecSvR,cplcFeChaSvL,cplcFeChaSvR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeAhL,         & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcFeFeVZR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,          & 
& cplcFeFvVWmR,cplcFvChiSvL,cplcFvChiSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,      & 
& cplcFvFecVWmR,cplcFvFvAhL,cplcFvFvAhR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,             & 
& cplcFvFvVZpL,cplcFvFvVZpR,cplcFvFvVZR,cplChaFvcSeL,cplChaFvcSeR,cplChiChacHpmL,        & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChiChiAhL,cplChiChiAhR,cplChiChihhL,   & 
& cplChiChihhR,cplChiChiVZL,cplChiChiVZpL,cplChiChiVZpR,cplChiChiVZR,cplChiFecSeL,       & 
& cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,        & 
& cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplhhcHpmVWm,cplhhcVWmVWm,cplhhhhhh,           & 
& cplhhhhSecSe1,cplhhHpmcHpm,cplhhHpmcVWm,cplhhHpmSvcSe1,cplhhSdcSd,cplhhSecHpmcSv1,     & 
& cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVP,        & 
& cplHpmcHpmVZ,cplHpmcHpmVZp,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplHpmSecHpmcSe1,   & 
& cplHpmSucSd,cplHpmSvcHpmcSv1,cplHpmSvcSe,cplSdSecSdcSeaa,cplSdSvcSecSuaa,              & 
& cplSecHpmcSv,cplSecSecVWmVWm1,cplSecSeVP,cplSecSeVPVP1,cplSecSeVPVZ1,cplSecSeVPVZp1,   & 
& cplSecSeVZ,cplSecSeVZp,cplSecSeVZpVZp1,cplSecSeVZVZ1,cplSecSeVZVZp1,cplSecSvcVWm,      & 
& cplSecSvcVWmVP1,cplSecSvcVWmVZ1,cplSecSvcVWmVZp1,cplSeSecSecSe1,cplSeSucSecSuaa,       & 
& cplSeSvcSecSv1,cplSvcSeVPVWm1,cplSvcSeVWm,cplSvcSeVWmVZ1,cplSvcSeVWmVZp1,              & 
& cplSvcSvcVWmVWm1,cplSvcSvVZ,cplSvcSvVZp,ctcplAhSecSe,ctcplChaFvcSeL,ctcplChaFvcSeR,    & 
& ctcplChiFecSeL,ctcplChiFecSeR,ctcplhhSecSe,ctcplHpmSvcSe,ctcplSecSeVP,ctcplSecSeVZ,    & 
& ctcplSecSeVZp,ctcplSvcSeVWm,GcplcHpmVPVWm,GcplHpmcVWmVP,GcplHpmSvcSe,GosZcplcHpmVPVWm, & 
& GosZcplHpmcVWmVP,GosZcplHpmSvcSe,GZcplcHpmVPVWm,GZcplHpmcVWmVP,GZcplHpmSvcSe,          & 
& ZcplAhSecSe,ZcplChaFvcSeL,ZcplChaFvcSeR,ZcplChiFecSeL,ZcplChiFecSeR,ZcplhhSecSe,       & 
& ZcplHpmSvcSe,ZcplSecSeVZ,ZcplSecSeVZp,ZcplSvcSeVWm,ZRUZD,ZRUZV,ZRUZU,ZRUZE,            & 
& ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUZVL,ZRUZVR,ZRUUM,ZRUUP,ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,         & 
& ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,kont,gP1LSe)

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

Complex(dp),Intent(in) :: cplAhAhAh(6,6,6),cplAhAhhh(6,6,6),cplAhAhSecSe1(6,6,6,6),cplAhcHpmVWm(6,2),           & 
& cplAhhhhh(6,6,6),cplAhhhSecSe1(6,6,6,6),cplAhhhVZ(6,6),cplAhhhVZp(6,6),cplAhHpmcHpm(6,2,2),& 
& cplAhHpmcVWm(6,2),cplAhHpmSvcSe1(6,2,6,6),cplAhSdcSd(6,6,6),cplAhSecHpmcSv1(6,6,2,6),  & 
& cplAhSecSe(6,6,6),cplAhSucSu(6,6,6),cplAhSvcSv(6,6,6),cplcChacFvSeL(2,3,6),            & 
& cplcChacFvSeR(2,3,6),cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplcChaChahhL(2,2,6),   & 
& cplcChaChahhR(2,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),         & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcChaChaVZR(2,2),cplcChaChiHpmL(2,9,2),      & 
& cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9),cplcChaFecSvL(2,3,6),    & 
& cplcChaFecSvR(2,3,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),cplcFeChiSeL(3,9,6),      & 
& cplcFeChiSeR(3,9,6),cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6),cplcFeFehhL(3,3,6),          & 
& cplcFeFehhR(3,3,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZpL(3,3),& 
& cplcFeFeVZpR(3,3),cplcFeFeVZR(3,3),cplcFeFvHpmL(3,3,2),cplcFeFvHpmR(3,3,2),            & 
& cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),           & 
& cplcFvFecHpmL(3,3,2),cplcFvFecHpmR(3,3,2),cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),       & 
& cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),           & 
& cplcFvFvVZL(3,3),cplcFvFvVZpL(3,3),cplcFvFvVZpR(3,3),cplcFvFvVZR(3,3),cplChaFvcSeL(2,3,6),& 
& cplChaFvcSeR(2,3,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChiChacVWmL(9,2),   & 
& cplChiChacVWmR(9,2),cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),cplChiChihhL(9,9,6),       & 
& cplChiChihhR(9,9,6),cplChiChiVZL(9,9),cplChiChiVZpL(9,9),cplChiChiVZpR(9,9),           & 
& cplChiChiVZR(9,9),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFvcSvL(9,3,6),         & 
& cplChiFvcSvR(9,3,6),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcHpmVWmVZp(2),cplcVWmVPVWm,     & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplhhcHpmVWm(6,2),cplhhcVWmVWm(6),cplhhhhhh(6,6,6),         & 
& cplhhhhSecSe1(6,6,6,6),cplhhHpmcHpm(6,2,2),cplhhHpmcVWm(6,2),cplhhHpmSvcSe1(6,2,6,6),  & 
& cplhhSdcSd(6,6,6),cplhhSecHpmcSv1(6,6,2,6),cplhhSecSe(6,6,6),cplhhSucSu(6,6,6),        & 
& cplhhSvcSv(6,6,6),cplhhVZpVZp(6),cplhhVZVZ(6),cplhhVZVZp(6),cplHpmcHpmVP(2,2),         & 
& cplHpmcHpmVZ(2,2),cplHpmcHpmVZp(2,2),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmcVWmVZp(2), & 
& cplHpmSecHpmcSe1(2,6,2,6),cplHpmSucSd(2,6,6),cplHpmSvcHpmcSv1(2,6,2,6),cplHpmSvcSe(2,6,6),& 
& cplSdSecSdcSeaa(6,6,6,6),cplSdSvcSecSuaa(6,6,6,6),cplSecHpmcSv(6,2,6),cplSecSecVWmVWm1(6,6),& 
& cplSecSeVP(6,6),cplSecSeVPVP1(6,6),cplSecSeVPVZ1(6,6),cplSecSeVPVZp1(6,6),             & 
& cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSecSeVZpVZp1(6,6),cplSecSeVZVZ1(6,6),              & 
& cplSecSeVZVZp1(6,6),cplSecSvcVWm(6,6),cplSecSvcVWmVP1(6,6),cplSecSvcVWmVZ1(6,6),       & 
& cplSecSvcVWmVZp1(6,6),cplSeSecSecSe1(6,6,6,6),cplSeSucSecSuaa(6,6,6,6),cplSeSvcSecSv1(6,6,6,6),& 
& cplSvcSeVPVWm1(6,6),cplSvcSeVWm(6,6),cplSvcSeVWmVZ1(6,6),cplSvcSeVWmVZp1(6,6),         & 
& cplSvcSvcVWmVWm1(6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),ctcplAhSecSe(6,6,6),            & 
& ctcplChaFvcSeL(2,3,6),ctcplChaFvcSeR(2,3,6),ctcplChiFecSeL(9,3,6),ctcplChiFecSeR(9,3,6),& 
& ctcplhhSecSe(6,6,6),ctcplHpmSvcSe(2,6,6),ctcplSecSeVP(6,6),ctcplSecSeVZ(6,6),          & 
& ctcplSecSeVZp(6,6),ctcplSvcSeVWm(6,6),GcplcHpmVPVWm(2),GcplHpmcVWmVP(2)

Complex(dp),Intent(in) :: GcplHpmSvcSe(2,6,6),GosZcplcHpmVPVWm(2),GosZcplHpmcVWmVP(2),GosZcplHpmSvcSe(2,6,6),    & 
& GZcplcHpmVPVWm(2),GZcplHpmcVWmVP(2),GZcplHpmSvcSe(2,6,6),ZcplAhSecSe(6,6,6),           & 
& ZcplChaFvcSeL(2,3,6),ZcplChaFvcSeR(2,3,6),ZcplChiFecSeL(9,3,6),ZcplChiFecSeR(9,3,6),   & 
& ZcplhhSecSe(6,6,6),ZcplHpmSvcSe(2,6,6),ZcplSecSeVZ(6,6),ZcplSecSeVZp(6,6),             & 
& ZcplSvcSeVWm(6,6)

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
Real(dp), Intent(out) :: gP1LSe(6,123) 
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
Real(dp) :: MRPSeToSeAh(6,6,6),MRGSeToSeAh(6,6,6), MRPZSeToSeAh(6,6,6),MRGZSeToSeAh(6,6,6) 
Real(dp) :: MVPSeToSeAh(6,6,6) 
Real(dp) :: RMsqTreeSeToSeAh(6,6,6),RMsqWaveSeToSeAh(6,6,6),RMsqVertexSeToSeAh(6,6,6) 
Complex(dp) :: AmpTreeSeToSeAh(6,6,6),AmpWaveSeToSeAh(6,6,6)=(0._dp,0._dp),AmpVertexSeToSeAh(6,6,6)& 
 & ,AmpVertexIRosSeToSeAh(6,6,6),AmpVertexIRdrSeToSeAh(6,6,6), AmpSumSeToSeAh(6,6,6), AmpSum2SeToSeAh(6,6,6) 
Complex(dp) :: AmpTreeZSeToSeAh(6,6,6),AmpWaveZSeToSeAh(6,6,6),AmpVertexZSeToSeAh(6,6,6) 
Real(dp) :: AmpSqSeToSeAh(6,6,6),  AmpSqTreeSeToSeAh(6,6,6) 
Real(dp) :: MRPSeToFvCha(6,3,2),MRGSeToFvCha(6,3,2), MRPZSeToFvCha(6,3,2),MRGZSeToFvCha(6,3,2) 
Real(dp) :: MVPSeToFvCha(6,3,2) 
Real(dp) :: RMsqTreeSeToFvCha(6,3,2),RMsqWaveSeToFvCha(6,3,2),RMsqVertexSeToFvCha(6,3,2) 
Complex(dp) :: AmpTreeSeToFvCha(2,6,3,2),AmpWaveSeToFvCha(2,6,3,2)=(0._dp,0._dp),AmpVertexSeToFvCha(2,6,3,2)& 
 & ,AmpVertexIRosSeToFvCha(2,6,3,2),AmpVertexIRdrSeToFvCha(2,6,3,2), AmpSumSeToFvCha(2,6,3,2), AmpSum2SeToFvCha(2,6,3,2) 
Complex(dp) :: AmpTreeZSeToFvCha(2,6,3,2),AmpWaveZSeToFvCha(2,6,3,2),AmpVertexZSeToFvCha(2,6,3,2) 
Real(dp) :: AmpSqSeToFvCha(6,3,2),  AmpSqTreeSeToFvCha(6,3,2) 
Real(dp) :: MRPSeToFeChi(6,3,9),MRGSeToFeChi(6,3,9), MRPZSeToFeChi(6,3,9),MRGZSeToFeChi(6,3,9) 
Real(dp) :: MVPSeToFeChi(6,3,9) 
Real(dp) :: RMsqTreeSeToFeChi(6,3,9),RMsqWaveSeToFeChi(6,3,9),RMsqVertexSeToFeChi(6,3,9) 
Complex(dp) :: AmpTreeSeToFeChi(2,6,3,9),AmpWaveSeToFeChi(2,6,3,9)=(0._dp,0._dp),AmpVertexSeToFeChi(2,6,3,9)& 
 & ,AmpVertexIRosSeToFeChi(2,6,3,9),AmpVertexIRdrSeToFeChi(2,6,3,9), AmpSumSeToFeChi(2,6,3,9), AmpSum2SeToFeChi(2,6,3,9) 
Complex(dp) :: AmpTreeZSeToFeChi(2,6,3,9),AmpWaveZSeToFeChi(2,6,3,9),AmpVertexZSeToFeChi(2,6,3,9) 
Real(dp) :: AmpSqSeToFeChi(6,3,9),  AmpSqTreeSeToFeChi(6,3,9) 
Real(dp) :: MRPSeToSehh(6,6,6),MRGSeToSehh(6,6,6), MRPZSeToSehh(6,6,6),MRGZSeToSehh(6,6,6) 
Real(dp) :: MVPSeToSehh(6,6,6) 
Real(dp) :: RMsqTreeSeToSehh(6,6,6),RMsqWaveSeToSehh(6,6,6),RMsqVertexSeToSehh(6,6,6) 
Complex(dp) :: AmpTreeSeToSehh(6,6,6),AmpWaveSeToSehh(6,6,6)=(0._dp,0._dp),AmpVertexSeToSehh(6,6,6)& 
 & ,AmpVertexIRosSeToSehh(6,6,6),AmpVertexIRdrSeToSehh(6,6,6), AmpSumSeToSehh(6,6,6), AmpSum2SeToSehh(6,6,6) 
Complex(dp) :: AmpTreeZSeToSehh(6,6,6),AmpWaveZSeToSehh(6,6,6),AmpVertexZSeToSehh(6,6,6) 
Real(dp) :: AmpSqSeToSehh(6,6,6),  AmpSqTreeSeToSehh(6,6,6) 
Real(dp) :: MRPSeToSvHpm(6,6,2),MRGSeToSvHpm(6,6,2), MRPZSeToSvHpm(6,6,2),MRGZSeToSvHpm(6,6,2) 
Real(dp) :: MVPSeToSvHpm(6,6,2) 
Real(dp) :: RMsqTreeSeToSvHpm(6,6,2),RMsqWaveSeToSvHpm(6,6,2),RMsqVertexSeToSvHpm(6,6,2) 
Complex(dp) :: AmpTreeSeToSvHpm(6,6,2),AmpWaveSeToSvHpm(6,6,2)=(0._dp,0._dp),AmpVertexSeToSvHpm(6,6,2)& 
 & ,AmpVertexIRosSeToSvHpm(6,6,2),AmpVertexIRdrSeToSvHpm(6,6,2), AmpSumSeToSvHpm(6,6,2), AmpSum2SeToSvHpm(6,6,2) 
Complex(dp) :: AmpTreeZSeToSvHpm(6,6,2),AmpWaveZSeToSvHpm(6,6,2),AmpVertexZSeToSvHpm(6,6,2) 
Real(dp) :: AmpSqSeToSvHpm(6,6,2),  AmpSqTreeSeToSvHpm(6,6,2) 
Real(dp) :: MRPSeToSeVZ(6,6),MRGSeToSeVZ(6,6), MRPZSeToSeVZ(6,6),MRGZSeToSeVZ(6,6) 
Real(dp) :: MVPSeToSeVZ(6,6) 
Real(dp) :: RMsqTreeSeToSeVZ(6,6),RMsqWaveSeToSeVZ(6,6),RMsqVertexSeToSeVZ(6,6) 
Complex(dp) :: AmpTreeSeToSeVZ(2,6,6),AmpWaveSeToSeVZ(2,6,6)=(0._dp,0._dp),AmpVertexSeToSeVZ(2,6,6)& 
 & ,AmpVertexIRosSeToSeVZ(2,6,6),AmpVertexIRdrSeToSeVZ(2,6,6), AmpSumSeToSeVZ(2,6,6), AmpSum2SeToSeVZ(2,6,6) 
Complex(dp) :: AmpTreeZSeToSeVZ(2,6,6),AmpWaveZSeToSeVZ(2,6,6),AmpVertexZSeToSeVZ(2,6,6) 
Real(dp) :: AmpSqSeToSeVZ(6,6),  AmpSqTreeSeToSeVZ(6,6) 
Real(dp) :: MRPSeToSeVZp(6,6),MRGSeToSeVZp(6,6), MRPZSeToSeVZp(6,6),MRGZSeToSeVZp(6,6) 
Real(dp) :: MVPSeToSeVZp(6,6) 
Real(dp) :: RMsqTreeSeToSeVZp(6,6),RMsqWaveSeToSeVZp(6,6),RMsqVertexSeToSeVZp(6,6) 
Complex(dp) :: AmpTreeSeToSeVZp(2,6,6),AmpWaveSeToSeVZp(2,6,6)=(0._dp,0._dp),AmpVertexSeToSeVZp(2,6,6)& 
 & ,AmpVertexIRosSeToSeVZp(2,6,6),AmpVertexIRdrSeToSeVZp(2,6,6), AmpSumSeToSeVZp(2,6,6), AmpSum2SeToSeVZp(2,6,6) 
Complex(dp) :: AmpTreeZSeToSeVZp(2,6,6),AmpWaveZSeToSeVZp(2,6,6),AmpVertexZSeToSeVZp(2,6,6) 
Real(dp) :: AmpSqSeToSeVZp(6,6),  AmpSqTreeSeToSeVZp(6,6) 
Real(dp) :: MRPSeToSvVWm(6,6),MRGSeToSvVWm(6,6), MRPZSeToSvVWm(6,6),MRGZSeToSvVWm(6,6) 
Real(dp) :: MVPSeToSvVWm(6,6) 
Real(dp) :: RMsqTreeSeToSvVWm(6,6),RMsqWaveSeToSvVWm(6,6),RMsqVertexSeToSvVWm(6,6) 
Complex(dp) :: AmpTreeSeToSvVWm(2,6,6),AmpWaveSeToSvVWm(2,6,6)=(0._dp,0._dp),AmpVertexSeToSvVWm(2,6,6)& 
 & ,AmpVertexIRosSeToSvVWm(2,6,6),AmpVertexIRdrSeToSvVWm(2,6,6), AmpSumSeToSvVWm(2,6,6), AmpSum2SeToSvVWm(2,6,6) 
Complex(dp) :: AmpTreeZSeToSvVWm(2,6,6),AmpWaveZSeToSvVWm(2,6,6),AmpVertexZSeToSvVWm(2,6,6) 
Real(dp) :: AmpSqSeToSvVWm(6,6),  AmpSqTreeSeToSvVWm(6,6) 
Real(dp) :: MRPSeToSeVP(6,6),MRGSeToSeVP(6,6), MRPZSeToSeVP(6,6),MRGZSeToSeVP(6,6) 
Real(dp) :: MVPSeToSeVP(6,6) 
Real(dp) :: RMsqTreeSeToSeVP(6,6),RMsqWaveSeToSeVP(6,6),RMsqVertexSeToSeVP(6,6) 
Complex(dp) :: AmpTreeSeToSeVP(2,6,6),AmpWaveSeToSeVP(2,6,6)=(0._dp,0._dp),AmpVertexSeToSeVP(2,6,6)& 
 & ,AmpVertexIRosSeToSeVP(2,6,6),AmpVertexIRdrSeToSeVP(2,6,6), AmpSumSeToSeVP(2,6,6), AmpSum2SeToSeVP(2,6,6) 
Complex(dp) :: AmpTreeZSeToSeVP(2,6,6),AmpWaveZSeToSeVP(2,6,6),AmpVertexZSeToSeVP(2,6,6) 
Real(dp) :: AmpSqSeToSeVP(6,6),  AmpSqTreeSeToSeVP(6,6) 
Write(*,*) "Calculating one-loop decays of Se " 
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
! Se Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_SeToSeAh(cplAhSecSe,MAh,MSe,MAh2,MSe2,AmpTreeSeToSeAh)

  Else 
Call Amplitude_Tree_sec_UMSSM_SeToSeAh(ZcplAhSecSe,MAh,MSe,MAh2,MSe2,AmpTreeSeToSeAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_SeToSeAh(MLambda,em,gs,cplAhSecSe,MAhOS,MSeOS,              & 
& MRPSeToSeAh,MRGSeToSeAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_SeToSeAh(MLambda,em,gs,ZcplAhSecSe,MAhOS,MSeOS,             & 
& MRPSeToSeAh,MRGSeToSeAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_SeToSeAh(MLambda,em,gs,cplAhSecSe,MAh,MSe,MRPSeToSeAh,      & 
& MRGSeToSeAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_SeToSeAh(MLambda,em,gs,ZcplAhSecSe,MAh,MSe,MRPSeToSeAh,     & 
& MRGSeToSeAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_SeToSeAh(cplAhSecSe,ctcplAhSecSe,MAh,MAh2,              & 
& MSe,MSe2,ZfAh,ZfSe,AmpWaveSeToSeAh)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_SeToSeAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,           & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,           & 
& cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,cplChaFvcSeR,               & 
& cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplhhSecSe,cplHpmSvcSe,            & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,            & 
& cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,   & 
& cplhhhhSecSe1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,         & 
& cplSeSvcSecSv1,AmpVertexSeToSeAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSeAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,           & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,           & 
& cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,cplChaFvcSeR,               & 
& cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplhhSecSe,cplHpmSvcSe,            & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,            & 
& cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,   & 
& cplhhhhSecSe1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,         & 
& cplSeSvcSecSv1,AmpVertexIRdrSeToSeAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSeAh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,           & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,         & 
& MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,           & 
& cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,      & 
& cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,ZcplAhSecSe,cplAhSucSu,cplAhSvcSv,     & 
& cplAhcHpmVWm,cplChaFvcSeL,cplChaFvcSeR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,         & 
& cplcFeChiSeR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,   & 
& cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,       & 
& cplAhHpmSvcSe1,cplAhSecHpmcSv1,cplhhhhSecSe1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,         & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvcSecSv1,AmpVertexIRosSeToSeAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSeAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,           & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,           & 
& cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& ZcplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,cplChaFvcSeR,              & 
& cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplhhSecSe,cplHpmSvcSe,            & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,            & 
& cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,   & 
& cplhhhhSecSe1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,         & 
& cplSeSvcSecSv1,AmpVertexIRosSeToSeAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSeAh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,           & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,         & 
& MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,           & 
& cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,      & 
& cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,      & 
& cplAhcHpmVWm,cplChaFvcSeL,cplChaFvcSeR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,         & 
& cplcFeChiSeR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,   & 
& cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,       & 
& cplAhHpmSvcSe1,cplAhSecHpmcSv1,cplhhhhSecSe1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,         & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvcSecSv1,AmpVertexIRosSeToSeAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSeAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,           & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,           & 
& cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,cplChaFvcSeR,               & 
& cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplhhSecSe,cplHpmSvcSe,            & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,            & 
& cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,   & 
& cplhhhhSecSe1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,         & 
& cplSeSvcSecSv1,AmpVertexIRosSeToSeAh)

 End if 
 End if 
AmpVertexSeToSeAh = AmpVertexSeToSeAh -  AmpVertexIRdrSeToSeAh! +  AmpVertexIRosSeToSeAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToSeAh=0._dp 
AmpVertexZSeToSeAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSeAh(gt2,:,:) = AmpWaveZSeToSeAh(gt2,:,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToSeAh(gt1,:,:) 
AmpVertexZSeToSeAh(gt2,:,:)= AmpVertexZSeToSeAh(gt2,:,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToSeAh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSeToSeAh=AmpWaveZSeToSeAh 
AmpVertexSeToSeAh= AmpVertexZSeToSeAh
! Final State 1 
AmpWaveZSeToSeAh=0._dp 
AmpVertexZSeToSeAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSeAh(:,gt2,:) = AmpWaveZSeToSeAh(:,gt2,:)+ZRUZE(gt2,gt1)*AmpWaveSeToSeAh(:,gt1,:) 
AmpVertexZSeToSeAh(:,gt2,:)= AmpVertexZSeToSeAh(:,gt2,:)+ZRUZE(gt2,gt1)*AmpVertexSeToSeAh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToSeAh=AmpWaveZSeToSeAh 
AmpVertexSeToSeAh= AmpVertexZSeToSeAh
! Final State 2 
AmpWaveZSeToSeAh=0._dp 
AmpVertexZSeToSeAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSeAh(:,:,gt2) = AmpWaveZSeToSeAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveSeToSeAh(:,:,gt1) 
AmpVertexZSeToSeAh(:,:,gt2)= AmpVertexZSeToSeAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexSeToSeAh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToSeAh=AmpWaveZSeToSeAh 
AmpVertexSeToSeAh= AmpVertexZSeToSeAh
End if
If (ShiftIRdiv) Then 
AmpVertexSeToSeAh = AmpVertexSeToSeAh  +  AmpVertexIRosSeToSeAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Se Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToSeAh = AmpTreeSeToSeAh 
 AmpSum2SeToSeAh = AmpTreeSeToSeAh + 2._dp*AmpWaveSeToSeAh + 2._dp*AmpVertexSeToSeAh  
Else 
 AmpSumSeToSeAh = AmpTreeSeToSeAh + AmpWaveSeToSeAh + AmpVertexSeToSeAh
 AmpSum2SeToSeAh = AmpTreeSeToSeAh + AmpWaveSeToSeAh + AmpVertexSeToSeAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSeAh = AmpTreeSeToSeAh
 AmpSum2SeToSeAh = AmpTreeSeToSeAh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=3,6
If (((OSkinematics).and.(Abs(MSeOS(gt1)).gt.(Abs(MSeOS(gt2))+Abs(MAhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSe(gt1)).gt.(Abs(MSe(gt2))+Abs(MAh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SeToSeAh = AmpTreeSeToSeAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MAhOS(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),MAh(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToSeAh(gt1, gt2, gt3) 
  AmpSum2SeToSeAh = 2._dp*AmpWaveSeToSeAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MAhOS(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),MAh(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToSeAh(gt1, gt2, gt3) 
  AmpSum2SeToSeAh = 2._dp*AmpVertexSeToSeAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MAhOS(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),MAh(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToSeAh(gt1, gt2, gt3) 
  AmpSum2SeToSeAh = AmpTreeSeToSeAh + 2._dp*AmpWaveSeToSeAh + 2._dp*AmpVertexSeToSeAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MAhOS(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),MAh(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToSeAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToSeAh = AmpTreeSeToSeAh
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MAhOS(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
  AmpSqTreeSeToSeAh(gt1, gt2, gt3) = AmpSqSeToSeAh(gt1, gt2, gt3)  
  AmpSum2SeToSeAh = + 2._dp*AmpWaveSeToSeAh + 2._dp*AmpVertexSeToSeAh
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MAhOS(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
  AmpSqSeToSeAh(gt1, gt2, gt3) = AmpSqSeToSeAh(gt1, gt2, gt3) + AmpSqTreeSeToSeAh(gt1, gt2, gt3)  
Else  
  AmpSum2SeToSeAh = AmpTreeSeToSeAh
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),MAh(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
  AmpSqTreeSeToSeAh(gt1, gt2, gt3) = AmpSqSeToSeAh(gt1, gt2, gt3)  
  AmpSum2SeToSeAh = + 2._dp*AmpWaveSeToSeAh + 2._dp*AmpVertexSeToSeAh
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),MAh(gt3),AmpSumSeToSeAh(gt1, gt2, gt3),AmpSum2SeToSeAh(gt1, gt2, gt3),AmpSqSeToSeAh(gt1, gt2, gt3)) 
  AmpSqSeToSeAh(gt1, gt2, gt3) = AmpSqSeToSeAh(gt1, gt2, gt3) + AmpSqTreeSeToSeAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSeToSeAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSeAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSeOS(gt2),MAhOS(gt3),helfactor*AmpSqSeToSeAh(gt1, gt2, gt3))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSe(gt2),MAh(gt3),helfactor*AmpSqSeToSeAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSeToSeAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSeAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToSeAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSeAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSeToSeAh(gt1, gt2, gt3) + MRGSeToSeAh(gt1, gt2, gt3)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSeToSeAh(gt1, gt2, gt3) + MRGSeToSeAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
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
! Fv Cha
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_SeToFvCha(cplChaFvcSeL,cplChaFvcSeR,MCha,               & 
& MFv,MSe,MCha2,MFv2,MSe2,AmpTreeSeToFvCha)

  Else 
Call Amplitude_Tree_sec_UMSSM_SeToFvCha(ZcplChaFvcSeL,ZcplChaFvcSeR,MCha,             & 
& MFv,MSe,MCha2,MFv2,MSe2,AmpTreeSeToFvCha)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_SeToFvCha(MLambda,em,gs,cplChaFvcSeL,cplChaFvcSeR,          & 
& MChaOS,MFvOS,MSeOS,MRPSeToFvCha,MRGSeToFvCha)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_SeToFvCha(MLambda,em,gs,ZcplChaFvcSeL,ZcplChaFvcSeR,        & 
& MChaOS,MFvOS,MSeOS,MRPSeToFvCha,MRGSeToFvCha)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_SeToFvCha(MLambda,em,gs,cplChaFvcSeL,cplChaFvcSeR,          & 
& MCha,MFv,MSe,MRPSeToFvCha,MRGSeToFvCha)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_SeToFvCha(MLambda,em,gs,ZcplChaFvcSeL,ZcplChaFvcSeR,        & 
& MCha,MFv,MSe,MRPSeToFvCha,MRGSeToFvCha)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_SeToFvCha(cplChaFvcSeL,cplChaFvcSeR,ctcplChaFvcSeL,     & 
& ctcplChaFvcSeR,MCha,MCha2,MFv,MFv2,MSe,MSe2,ZfFVL,ZfFVR,ZfLm,ZfLp,ZfSe,AmpWaveSeToFvCha)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_SeToFvCha(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,             & 
& MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFvFvAhL,cplcFvFvAhR,             & 
& cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,      & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcFvFvhhL,cplcFvFvhhR,           & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,           & 
& cplcFvFvVZpL,cplcFvFvVZpR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,    & 
& cplSvcSeVWm,AmpVertexSeToFvCha)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToFvCha(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFvFvAhL,cplcFvFvAhR,        & 
& cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,      & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcFvFvhhL,cplcFvFvhhR,           & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,           & 
& cplcFvFvVZpL,cplcFvFvVZpR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,    & 
& cplSvcSeVWm,AmpVertexIRdrSeToFvCha)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToFvCha(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,        & 
& cplChiChacVWmL,cplChiChacVWmR,ZcplChaFvcSeL,ZcplChaFvcSeR,cplcChaChahhL,               & 
& cplcChaChahhR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,     & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,    & 
& cplChiFvcSvR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,           & 
& cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,cplhhSecSe,             & 
& cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,AmpVertexIRosSeToFvCha)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToFvCha(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFvFvAhL,cplcFvFvAhR,        & 
& cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,ZcplChaFvcSeL,  & 
& ZcplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,     & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcFvFvhhL,cplcFvFvhhR,           & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,           & 
& cplcFvFvVZpL,cplcFvFvVZpR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,    & 
& cplSvcSeVWm,AmpVertexIRosSeToFvCha)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToFvCha(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,        & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,   & 
& cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,     & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,     & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,           & 
& cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,cplhhSecSe,cplHpmSvcSe,              & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,AmpVertexIRosSeToFvCha)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToFvCha(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFvFvAhL,cplcFvFvAhR,        & 
& cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,      & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcFvFvhhL,cplcFvFvhhR,           & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,           & 
& cplcFvFvVZpL,cplcFvFvVZpR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,    & 
& cplSvcSeVWm,AmpVertexIRosSeToFvCha)

 End if 
 End if 
AmpVertexSeToFvCha = AmpVertexSeToFvCha -  AmpVertexIRdrSeToFvCha! +  AmpVertexIRosSeToFvCha ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToFvCha=0._dp 
AmpVertexZSeToFvCha=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToFvCha(:,gt2,:,:) = AmpWaveZSeToFvCha(:,gt2,:,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToFvCha(:,gt1,:,:) 
AmpVertexZSeToFvCha(:,gt2,:,:)= AmpVertexZSeToFvCha(:,gt2,:,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToFvCha(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveSeToFvCha=AmpWaveZSeToFvCha 
AmpVertexSeToFvCha= AmpVertexZSeToFvCha
! Final State 1 
AmpWaveZSeToFvCha=0._dp 
AmpVertexZSeToFvCha=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZSeToFvCha(1,:,gt2,:) = AmpWaveZSeToFvCha(1,:,gt2,:)+ZRUZVL(gt2,gt1)*AmpWaveSeToFvCha(1,:,gt1,:) 
AmpVertexZSeToFvCha(1,:,gt2,:)= AmpVertexZSeToFvCha(1,:,gt2,:)+ZRUZVL(gt2,gt1)*AmpVertexSeToFvCha(1,:,gt1,:) 
AmpWaveZSeToFvCha(2,:,gt2,:) = AmpWaveZSeToFvCha(2,:,gt2,:)+ZRUZVRc(gt2,gt1)*AmpWaveSeToFvCha(2,:,gt1,:) 
AmpVertexZSeToFvCha(2,:,gt2,:)= AmpVertexZSeToFvCha(2,:,gt2,:)+ZRUZVRc(gt2,gt1)*AmpVertexSeToFvCha(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToFvCha=AmpWaveZSeToFvCha 
AmpVertexSeToFvCha= AmpVertexZSeToFvCha
! Final State 2 
AmpWaveZSeToFvCha=0._dp 
AmpVertexZSeToFvCha=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZSeToFvCha(1,:,:,gt2) = AmpWaveZSeToFvCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpWaveSeToFvCha(1,:,:,gt1) 
AmpVertexZSeToFvCha(1,:,:,gt2)= AmpVertexZSeToFvCha(1,:,:,gt2)+ZRUUM(gt2,gt1)*AmpVertexSeToFvCha(1,:,:,gt1) 
AmpWaveZSeToFvCha(2,:,:,gt2) = AmpWaveZSeToFvCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpWaveSeToFvCha(2,:,:,gt1) 
AmpVertexZSeToFvCha(2,:,:,gt2)= AmpVertexZSeToFvCha(2,:,:,gt2)+ZRUUP(gt2,gt1)*AmpVertexSeToFvCha(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToFvCha=AmpWaveZSeToFvCha 
AmpVertexSeToFvCha= AmpVertexZSeToFvCha
End if
If (ShiftIRdiv) Then 
AmpVertexSeToFvCha = AmpVertexSeToFvCha  +  AmpVertexIRosSeToFvCha
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Fv Cha -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToFvCha = AmpTreeSeToFvCha 
 AmpSum2SeToFvCha = AmpTreeSeToFvCha + 2._dp*AmpWaveSeToFvCha + 2._dp*AmpVertexSeToFvCha  
Else 
 AmpSumSeToFvCha = AmpTreeSeToFvCha + AmpWaveSeToFvCha + AmpVertexSeToFvCha
 AmpSum2SeToFvCha = AmpTreeSeToFvCha + AmpWaveSeToFvCha + AmpVertexSeToFvCha 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToFvCha = AmpTreeSeToFvCha
 AmpSum2SeToFvCha = AmpTreeSeToFvCha 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,3
    Do gt3=1,2
If (((OSkinematics).and.(Abs(MSeOS(gt1)).gt.(Abs(MFvOS(gt2))+Abs(MChaOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSe(gt1)).gt.(Abs(MFv(gt2))+Abs(MCha(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SeToFvCha = AmpTreeSeToFvCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFvOS(gt2),MChaOS(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFv(gt2),MCha(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToFvCha(gt1, gt2, gt3) 
  AmpSum2SeToFvCha = 2._dp*AmpWaveSeToFvCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFvOS(gt2),MChaOS(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFv(gt2),MCha(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToFvCha(gt1, gt2, gt3) 
  AmpSum2SeToFvCha = 2._dp*AmpVertexSeToFvCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFvOS(gt2),MChaOS(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFv(gt2),MCha(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToFvCha(gt1, gt2, gt3) 
  AmpSum2SeToFvCha = AmpTreeSeToFvCha + 2._dp*AmpWaveSeToFvCha + 2._dp*AmpVertexSeToFvCha
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFvOS(gt2),MChaOS(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFv(gt2),MCha(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToFvCha(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToFvCha = AmpTreeSeToFvCha
  Call SquareAmp_StoFF(MSeOS(gt1),MFvOS(gt2),MChaOS(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
  AmpSqTreeSeToFvCha(gt1, gt2, gt3) = AmpSqSeToFvCha(gt1, gt2, gt3)  
  AmpSum2SeToFvCha = + 2._dp*AmpWaveSeToFvCha + 2._dp*AmpVertexSeToFvCha
  Call SquareAmp_StoFF(MSeOS(gt1),MFvOS(gt2),MChaOS(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
  AmpSqSeToFvCha(gt1, gt2, gt3) = AmpSqSeToFvCha(gt1, gt2, gt3) + AmpSqTreeSeToFvCha(gt1, gt2, gt3)  
Else  
  AmpSum2SeToFvCha = AmpTreeSeToFvCha
  Call SquareAmp_StoFF(MSe(gt1),MFv(gt2),MCha(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
  AmpSqTreeSeToFvCha(gt1, gt2, gt3) = AmpSqSeToFvCha(gt1, gt2, gt3)  
  AmpSum2SeToFvCha = + 2._dp*AmpWaveSeToFvCha + 2._dp*AmpVertexSeToFvCha
  Call SquareAmp_StoFF(MSe(gt1),MFv(gt2),MCha(gt3),AmpSumSeToFvCha(:,gt1, gt2, gt3),AmpSum2SeToFvCha(:,gt1, gt2, gt3),AmpSqSeToFvCha(gt1, gt2, gt3)) 
  AmpSqSeToFvCha(gt1, gt2, gt3) = AmpSqSeToFvCha(gt1, gt2, gt3) + AmpSqTreeSeToFvCha(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSeToFvCha(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqSeToFvCha(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MFvOS(gt2),MChaOS(gt3),helfactor*AmpSqSeToFvCha(gt1, gt2, gt3))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MFv(gt2),MCha(gt3),helfactor*AmpSqSeToFvCha(gt1, gt2, gt3))
End if 
If ((Abs(MRPSeToFvCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToFvCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToFvCha(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToFvCha(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSeToFvCha(gt1, gt2, gt3) + MRGSeToFvCha(gt1, gt2, gt3)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSeToFvCha(gt1, gt2, gt3) + MRGSeToFvCha(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
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
! Fe Chi
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_SeToFeChi(cplChiFecSeL,cplChiFecSeR,MChi,               & 
& MFe,MSe,MChi2,MFe2,MSe2,AmpTreeSeToFeChi)

  Else 
Call Amplitude_Tree_sec_UMSSM_SeToFeChi(ZcplChiFecSeL,ZcplChiFecSeR,MChi,             & 
& MFe,MSe,MChi2,MFe2,MSe2,AmpTreeSeToFeChi)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_SeToFeChi(MLambda,em,gs,cplChiFecSeL,cplChiFecSeR,          & 
& MChiOS,MFeOS,MSeOS,MRPSeToFeChi,MRGSeToFeChi)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_SeToFeChi(MLambda,em,gs,ZcplChiFecSeL,ZcplChiFecSeR,        & 
& MChiOS,MFeOS,MSeOS,MRPSeToFeChi,MRGSeToFeChi)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_SeToFeChi(MLambda,em,gs,cplChiFecSeL,cplChiFecSeR,          & 
& MChi,MFe,MSe,MRPSeToFeChi,MRGSeToFeChi)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_SeToFeChi(MLambda,em,gs,ZcplChiFecSeL,ZcplChiFecSeR,        & 
& MChi,MFe,MSe,MRPSeToFeChi,MRGSeToFeChi)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_SeToFeChi(cplChiFecSeL,cplChiFecSeR,ctcplChiFecSeL,     & 
& ctcplChiFecSeR,MChi,MChi2,MFe,MFe2,MSe,MSe2,ZfFEL,ZfFER,ZfL0,ZfSe,AmpWaveSeToFeChi)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_SeToFeChi(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,             & 
& MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,            & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,       & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,AmpVertexSeToFeChi)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToFeChi(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,          & 
& cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,            & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,       & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,AmpVertexIRdrSeToFeChi)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToFeChi(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplChiChiAhL,   & 
& cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,         & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,cplChaFvcSeR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,ZcplChiFecSeL,ZcplChiFecSeR,     & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,   & 
& cplhhSecSe,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,AmpVertexIRosSeToFeChi)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToFeChi(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,          & 
& cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,ZcplChiFecSeL,ZcplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,    & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,            & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,       & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,AmpVertexIRosSeToFeChi)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToFeChi(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplChiChiAhL,   & 
& cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,         & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,cplChaFvcSeR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,             & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,   & 
& cplhhSecSe,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,AmpVertexIRosSeToFeChi)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToFeChi(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,          & 
& cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,            & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,       & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,AmpVertexIRosSeToFeChi)

 End if 
 End if 
AmpVertexSeToFeChi = AmpVertexSeToFeChi -  AmpVertexIRdrSeToFeChi! +  AmpVertexIRosSeToFeChi ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToFeChi=0._dp 
AmpVertexZSeToFeChi=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToFeChi(:,gt2,:,:) = AmpWaveZSeToFeChi(:,gt2,:,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToFeChi(:,gt1,:,:) 
AmpVertexZSeToFeChi(:,gt2,:,:)= AmpVertexZSeToFeChi(:,gt2,:,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToFeChi(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveSeToFeChi=AmpWaveZSeToFeChi 
AmpVertexSeToFeChi= AmpVertexZSeToFeChi
! Final State 1 
AmpWaveZSeToFeChi=0._dp 
AmpVertexZSeToFeChi=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZSeToFeChi(1,:,gt2,:) = AmpWaveZSeToFeChi(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpWaveSeToFeChi(1,:,gt1,:) 
AmpVertexZSeToFeChi(1,:,gt2,:)= AmpVertexZSeToFeChi(1,:,gt2,:)+ZRUZEL(gt2,gt1)*AmpVertexSeToFeChi(1,:,gt1,:) 
AmpWaveZSeToFeChi(2,:,gt2,:) = AmpWaveZSeToFeChi(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpWaveSeToFeChi(2,:,gt1,:) 
AmpVertexZSeToFeChi(2,:,gt2,:)= AmpVertexZSeToFeChi(2,:,gt2,:)+ZRUZERc(gt2,gt1)*AmpVertexSeToFeChi(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToFeChi=AmpWaveZSeToFeChi 
AmpVertexSeToFeChi= AmpVertexZSeToFeChi
! Final State 2 
AmpWaveZSeToFeChi=0._dp 
AmpVertexZSeToFeChi=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSeToFeChi(1,:,:,gt2) = AmpWaveZSeToFeChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveSeToFeChi(1,:,:,gt1) 
AmpVertexZSeToFeChi(1,:,:,gt2)= AmpVertexZSeToFeChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexSeToFeChi(1,:,:,gt1) 
AmpWaveZSeToFeChi(2,:,:,gt2) = AmpWaveZSeToFeChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveSeToFeChi(2,:,:,gt1) 
AmpVertexZSeToFeChi(2,:,:,gt2)= AmpVertexZSeToFeChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexSeToFeChi(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToFeChi=AmpWaveZSeToFeChi 
AmpVertexSeToFeChi= AmpVertexZSeToFeChi
End if
If (ShiftIRdiv) Then 
AmpVertexSeToFeChi = AmpVertexSeToFeChi  +  AmpVertexIRosSeToFeChi
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Fe Chi -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToFeChi = AmpTreeSeToFeChi 
 AmpSum2SeToFeChi = AmpTreeSeToFeChi + 2._dp*AmpWaveSeToFeChi + 2._dp*AmpVertexSeToFeChi  
Else 
 AmpSumSeToFeChi = AmpTreeSeToFeChi + AmpWaveSeToFeChi + AmpVertexSeToFeChi
 AmpSum2SeToFeChi = AmpTreeSeToFeChi + AmpWaveSeToFeChi + AmpVertexSeToFeChi 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToFeChi = AmpTreeSeToFeChi
 AmpSum2SeToFeChi = AmpTreeSeToFeChi 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,3
    Do gt3=1,9
If (((OSkinematics).and.(Abs(MSeOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(MChiOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSe(gt1)).gt.(Abs(MFe(gt2))+Abs(MChi(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SeToFeChi = AmpTreeSeToFeChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFeOS(gt2),MChiOS(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFe(gt2),MChi(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToFeChi(gt1, gt2, gt3) 
  AmpSum2SeToFeChi = 2._dp*AmpWaveSeToFeChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFeOS(gt2),MChiOS(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFe(gt2),MChi(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToFeChi(gt1, gt2, gt3) 
  AmpSum2SeToFeChi = 2._dp*AmpVertexSeToFeChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFeOS(gt2),MChiOS(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFe(gt2),MChi(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToFeChi(gt1, gt2, gt3) 
  AmpSum2SeToFeChi = AmpTreeSeToFeChi + 2._dp*AmpWaveSeToFeChi + 2._dp*AmpVertexSeToFeChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSeOS(gt1),MFeOS(gt2),MChiOS(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSe(gt1),MFe(gt2),MChi(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToFeChi(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToFeChi = AmpTreeSeToFeChi
  Call SquareAmp_StoFF(MSeOS(gt1),MFeOS(gt2),MChiOS(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
  AmpSqTreeSeToFeChi(gt1, gt2, gt3) = AmpSqSeToFeChi(gt1, gt2, gt3)  
  AmpSum2SeToFeChi = + 2._dp*AmpWaveSeToFeChi + 2._dp*AmpVertexSeToFeChi
  Call SquareAmp_StoFF(MSeOS(gt1),MFeOS(gt2),MChiOS(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
  AmpSqSeToFeChi(gt1, gt2, gt3) = AmpSqSeToFeChi(gt1, gt2, gt3) + AmpSqTreeSeToFeChi(gt1, gt2, gt3)  
Else  
  AmpSum2SeToFeChi = AmpTreeSeToFeChi
  Call SquareAmp_StoFF(MSe(gt1),MFe(gt2),MChi(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
  AmpSqTreeSeToFeChi(gt1, gt2, gt3) = AmpSqSeToFeChi(gt1, gt2, gt3)  
  AmpSum2SeToFeChi = + 2._dp*AmpWaveSeToFeChi + 2._dp*AmpVertexSeToFeChi
  Call SquareAmp_StoFF(MSe(gt1),MFe(gt2),MChi(gt3),AmpSumSeToFeChi(:,gt1, gt2, gt3),AmpSum2SeToFeChi(:,gt1, gt2, gt3),AmpSqSeToFeChi(gt1, gt2, gt3)) 
  AmpSqSeToFeChi(gt1, gt2, gt3) = AmpSqSeToFeChi(gt1, gt2, gt3) + AmpSqTreeSeToFeChi(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSeToFeChi(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqSeToFeChi(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MFeOS(gt2),MChiOS(gt3),helfactor*AmpSqSeToFeChi(gt1, gt2, gt3))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MFe(gt2),MChi(gt3),helfactor*AmpSqSeToFeChi(gt1, gt2, gt3))
End if 
If ((Abs(MRPSeToFeChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToFeChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToFeChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToFeChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSeToFeChi(gt1, gt2, gt3) + MRGSeToFeChi(gt1, gt2, gt3)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSeToFeChi(gt1, gt2, gt3) + MRGSeToFeChi(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
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
! Se hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_SeToSehh(cplhhSecSe,Mhh,MSe,Mhh2,MSe2,AmpTreeSeToSehh)

  Else 
Call Amplitude_Tree_sec_UMSSM_SeToSehh(ZcplhhSecSe,Mhh,MSe,Mhh2,MSe2,AmpTreeSeToSehh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_SeToSehh(MLambda,em,gs,cplhhSecSe,MhhOS,MSeOS,              & 
& MRPSeToSehh,MRGSeToSehh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_SeToSehh(MLambda,em,gs,ZcplhhSecSe,MhhOS,MSeOS,             & 
& MRPSeToSehh,MRGSeToSehh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_SeToSehh(MLambda,em,gs,cplhhSecSe,Mhh,MSe,MRPSeToSehh,      & 
& MRGSeToSehh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_SeToSehh(MLambda,em,gs,ZcplhhSecSe,Mhh,MSe,MRPSeToSehh,     & 
& MRGSeToSehh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_SeToSehh(cplhhSecSe,ctcplhhSecSe,Mhh,Mhh2,              & 
& MSe,MSe2,Zfhh,ZfSe,AmpWaveSeToSehh)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_SeToSehh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
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
& cplSecSeVZVZp1,cplSecSeVZpVZp1,AmpVertexSeToSehh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSehh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSecSeVZVZp1,cplSecSeVZpVZp1,AmpVertexIRdrSeToSehh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSehh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,           & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,         & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhSecSe,cplChaFvcSeL,       & 
& cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFecSeL,       & 
& cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcFvFvhhL,            & 
& cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,ZcplhhSecSe,cplhhSucSu,     & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,     & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,            & 
& cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplhhhhSecSe1,cplhhHpmSvcSe1,     & 
& cplhhSecHpmcSv1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,       & 
& cplSeSvcSecSv1,cplSecSecVWmVWm1,cplSecSeVZVZ1,cplSecSeVZVZp1,cplSecSeVZpVZp1,          & 
& AmpVertexIRosSeToSehh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSehh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,               & 
& cplAhhhVZp,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,           & 
& cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFvFvhhL,cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,   & 
& cplhhSdcSd,ZcplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,      & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,    & 
& cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,       & 
& cplhhhhSecSe1,cplhhHpmSvcSe1,cplhhSecHpmcSv1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,         & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvcSecSv1,cplSecSecVWmVWm1,cplSecSeVZVZ1,          & 
& cplSecSeVZVZp1,cplSecSeVZpVZp1,AmpVertexIRosSeToSehh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSehh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,           & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVP2,MVWm2OS,         & 
& MVZ2OS,MVZp2OS,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhSecSe,cplChaFvcSeL,       & 
& cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplChiChihhL,cplChiChihhR,cplChiFecSeL,       & 
& cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFehhL,cplcFeFehhR,cplcFvFvhhL,            & 
& cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,      & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,     & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,            & 
& cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplhhhhSecSe1,cplhhHpmSvcSe1,     & 
& cplhhSecHpmcSv1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,       & 
& cplSeSvcSecSv1,cplSecSecVWmVWm1,cplSecSeVZVZ1,cplSecSeVZVZp1,cplSecSeVZpVZp1,          & 
& AmpVertexIRosSeToSehh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSehh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSecSeVZVZp1,cplSecSeVZpVZp1,AmpVertexIRosSeToSehh)

 End if 
 End if 
AmpVertexSeToSehh = AmpVertexSeToSehh -  AmpVertexIRdrSeToSehh! +  AmpVertexIRosSeToSehh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToSehh=0._dp 
AmpVertexZSeToSehh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSehh(gt2,:,:) = AmpWaveZSeToSehh(gt2,:,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToSehh(gt1,:,:) 
AmpVertexZSeToSehh(gt2,:,:)= AmpVertexZSeToSehh(gt2,:,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToSehh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSeToSehh=AmpWaveZSeToSehh 
AmpVertexSeToSehh= AmpVertexZSeToSehh
! Final State 1 
AmpWaveZSeToSehh=0._dp 
AmpVertexZSeToSehh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSehh(:,gt2,:) = AmpWaveZSeToSehh(:,gt2,:)+ZRUZE(gt2,gt1)*AmpWaveSeToSehh(:,gt1,:) 
AmpVertexZSeToSehh(:,gt2,:)= AmpVertexZSeToSehh(:,gt2,:)+ZRUZE(gt2,gt1)*AmpVertexSeToSehh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToSehh=AmpWaveZSeToSehh 
AmpVertexSeToSehh= AmpVertexZSeToSehh
! Final State 2 
AmpWaveZSeToSehh=0._dp 
AmpVertexZSeToSehh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSehh(:,:,gt2) = AmpWaveZSeToSehh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveSeToSehh(:,:,gt1) 
AmpVertexZSeToSehh(:,:,gt2)= AmpVertexZSeToSehh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexSeToSehh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToSehh=AmpWaveZSeToSehh 
AmpVertexSeToSehh= AmpVertexZSeToSehh
End if
If (ShiftIRdiv) Then 
AmpVertexSeToSehh = AmpVertexSeToSehh  +  AmpVertexIRosSeToSehh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Se hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToSehh = AmpTreeSeToSehh 
 AmpSum2SeToSehh = AmpTreeSeToSehh + 2._dp*AmpWaveSeToSehh + 2._dp*AmpVertexSeToSehh  
Else 
 AmpSumSeToSehh = AmpTreeSeToSehh + AmpWaveSeToSehh + AmpVertexSeToSehh
 AmpSum2SeToSehh = AmpTreeSeToSehh + AmpWaveSeToSehh + AmpVertexSeToSehh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSehh = AmpTreeSeToSehh
 AmpSum2SeToSehh = AmpTreeSeToSehh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MSeOS(gt1)).gt.(Abs(MSeOS(gt2))+Abs(MhhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSe(gt1)).gt.(Abs(MSe(gt2))+Abs(Mhh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SeToSehh = AmpTreeSeToSehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MhhOS(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),Mhh(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToSehh(gt1, gt2, gt3) 
  AmpSum2SeToSehh = 2._dp*AmpWaveSeToSehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MhhOS(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),Mhh(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToSehh(gt1, gt2, gt3) 
  AmpSum2SeToSehh = 2._dp*AmpVertexSeToSehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MhhOS(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),Mhh(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToSehh(gt1, gt2, gt3) 
  AmpSum2SeToSehh = AmpTreeSeToSehh + 2._dp*AmpWaveSeToSehh + 2._dp*AmpVertexSeToSehh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MhhOS(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),Mhh(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToSehh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToSehh = AmpTreeSeToSehh
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MhhOS(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
  AmpSqTreeSeToSehh(gt1, gt2, gt3) = AmpSqSeToSehh(gt1, gt2, gt3)  
  AmpSum2SeToSehh = + 2._dp*AmpWaveSeToSehh + 2._dp*AmpVertexSeToSehh
  Call SquareAmp_StoSS(MSeOS(gt1),MSeOS(gt2),MhhOS(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
  AmpSqSeToSehh(gt1, gt2, gt3) = AmpSqSeToSehh(gt1, gt2, gt3) + AmpSqTreeSeToSehh(gt1, gt2, gt3)  
Else  
  AmpSum2SeToSehh = AmpTreeSeToSehh
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),Mhh(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
  AmpSqTreeSeToSehh(gt1, gt2, gt3) = AmpSqSeToSehh(gt1, gt2, gt3)  
  AmpSum2SeToSehh = + 2._dp*AmpWaveSeToSehh + 2._dp*AmpVertexSeToSehh
  Call SquareAmp_StoSS(MSe(gt1),MSe(gt2),Mhh(gt3),AmpSumSeToSehh(gt1, gt2, gt3),AmpSum2SeToSehh(gt1, gt2, gt3),AmpSqSeToSehh(gt1, gt2, gt3)) 
  AmpSqSeToSehh(gt1, gt2, gt3) = AmpSqSeToSehh(gt1, gt2, gt3) + AmpSqTreeSeToSehh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSeToSehh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSehh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSeOS(gt2),MhhOS(gt3),helfactor*AmpSqSeToSehh(gt1, gt2, gt3))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSe(gt2),Mhh(gt3),helfactor*AmpSqSeToSehh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSeToSehh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSehh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToSehh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSehh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSeToSehh(gt1, gt2, gt3) + MRGSeToSehh(gt1, gt2, gt3)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSeToSehh(gt1, gt2, gt3) + MRGSeToSehh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
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
! Sv Hpm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_SeToSvHpm(cplHpmSvcSe,MHpm,MSe,MSv,MHpm2,               & 
& MSe2,MSv2,AmpTreeSeToSvHpm)

  Else 
Call Amplitude_Tree_sec_UMSSM_SeToSvHpm(ZcplHpmSvcSe,MHpm,MSe,MSv,MHpm2,              & 
& MSe2,MSv2,AmpTreeSeToSvHpm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_SeToSvHpm(MLambda,em,gs,cplHpmSvcSe,MHpmOS,MSeOS,           & 
& MSvOS,MRPSeToSvHpm,MRGSeToSvHpm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_SeToSvHpm(MLambda,em,gs,ZcplHpmSvcSe,MHpmOS,MSeOS,          & 
& MSvOS,MRPSeToSvHpm,MRGSeToSvHpm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_SeToSvHpm(MLambda,em,gs,cplHpmSvcSe,MHpm,MSe,               & 
& MSv,MRPSeToSvHpm,MRGSeToSvHpm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_SeToSvHpm(MLambda,em,gs,ZcplHpmSvcSe,MHpm,MSe,              & 
& MSv,MRPSeToSvHpm,MRGSeToSvHpm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_SeToSvHpm(cplHpmSvcSe,ctcplHpmSvcSe,MHpm,               & 
& MHpm2,MSe,MSe2,MSv,MSv2,ZfHpm,ZfSe,ZfSv,AmpWaveSeToSvHpm)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_SeToSvHpm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,        & 
& cplAhSvcSv,cplChaFvcSeL,cplChaFvcSeR,cplcFeChaSvL,cplcFeChaSvR,cplChiFecSeL,           & 
& cplChiFecSeR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFvHpmL,     & 
& cplcFeFvHpmR,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,cplHpmSucSd,              & 
& cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,         & 
& cplHpmcVWmVZp,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,    & 
& cplAhHpmSvcSe1,cplhhHpmSvcSe1,cplHpmSecHpmcSe1,cplHpmSvcHpmcSv1,cplSdSvcSecSuaa,       & 
& cplSeSvcSecSv1,cplSvcSeVPVWm1,cplSvcSeVWmVZ1,cplSvcSeVWmVZp1,AmpVertexSeToSvHpm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSvHpm(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,        & 
& cplAhSvcSv,cplChaFvcSeL,cplChaFvcSeR,cplcFeChaSvL,cplcFeChaSvR,cplChiFecSeL,           & 
& cplChiFecSeR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFvHpmL,     & 
& cplcFeFvHpmR,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,cplHpmSucSd,              & 
& cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,         & 
& cplHpmcVWmVZp,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,    & 
& cplAhHpmSvcSe1,cplhhHpmSvcSe1,cplHpmSecHpmcSe1,cplHpmSvcHpmcSv1,cplSdSvcSecSuaa,       & 
& cplSeSvcSecSv1,cplSvcSeVPVWm1,cplSvcSeVWmVZ1,cplSvcSeVWmVZp1,AmpVertexIRdrSeToSvHpm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSvHpm(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,             & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,              & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvcSv,           & 
& cplChaFvcSeL,cplChaFvcSeR,cplcFeChaSvL,cplcFeChaSvR,cplChiFecSeL,cplChiFecSeR,         & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFvHpmL,cplcFeFvHpmR,     & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,cplHpmSucSd,ZcplHpmSvcSe,              & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,       & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,cplAhHpmSvcSe1,   & 
& cplhhHpmSvcSe1,cplHpmSecHpmcSe1,cplHpmSvcHpmcSv1,cplSdSvcSecSuaa,cplSeSvcSecSv1,       & 
& cplSvcSeVPVWm1,cplSvcSeVWmVZ1,cplSvcSeVWmVZp1,AmpVertexIRosSeToSvHpm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSvHpm(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,        & 
& cplAhSvcSv,cplChaFvcSeL,cplChaFvcSeR,cplcFeChaSvL,cplcFeChaSvR,cplChiFecSeL,           & 
& cplChiFecSeR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFvHpmL,     & 
& cplcFeFvHpmR,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,cplHpmSucSd,              & 
& ZcplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,        & 
& cplHpmcVWmVZp,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,    & 
& cplAhHpmSvcSe1,cplhhHpmSvcSe1,cplHpmSecHpmcSe1,cplHpmSvcHpmcSv1,cplSdSvcSecSuaa,       & 
& cplSeSvcSecSv1,cplSvcSeVPVWm1,cplSvcSeVWmVZ1,cplSvcSeVWmVZp1,AmpVertexIRosSeToSvHpm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSvHpm(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,             & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,              & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,cplAhSvcSv,           & 
& cplChaFvcSeL,cplChaFvcSeR,cplcFeChaSvL,cplcFeChaSvR,cplChiFecSeL,cplChiFecSeR,         & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFvHpmL,cplcFeFvHpmR,     & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,cplHpmSucSd,cplHpmSvcSe,               & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,       & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,cplAhHpmSvcSe1,   & 
& cplhhHpmSvcSe1,cplHpmSecHpmcSe1,cplHpmSvcHpmcSv1,cplSdSvcSecSuaa,cplSeSvcSecSv1,       & 
& cplSvcSeVPVWm1,cplSvcSeVWmVZ1,cplSvcSeVWmVZp1,AmpVertexIRosSeToSvHpm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSvHpm(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,        & 
& cplAhSvcSv,cplChaFvcSeL,cplChaFvcSeR,cplcFeChaSvL,cplcFeChaSvR,cplChiFecSeL,           & 
& cplChiFecSeR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFvHpmL,     & 
& cplcFeFvHpmR,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,cplHpmSucSd,              & 
& cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,         & 
& cplHpmcVWmVZp,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,    & 
& cplAhHpmSvcSe1,cplhhHpmSvcSe1,cplHpmSecHpmcSe1,cplHpmSvcHpmcSv1,cplSdSvcSecSuaa,       & 
& cplSeSvcSecSv1,cplSvcSeVPVWm1,cplSvcSeVWmVZ1,cplSvcSeVWmVZp1,AmpVertexIRosSeToSvHpm)

 End if 
 End if 
AmpVertexSeToSvHpm = AmpVertexSeToSvHpm -  AmpVertexIRdrSeToSvHpm! +  AmpVertexIRosSeToSvHpm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToSvHpm=0._dp 
AmpVertexZSeToSvHpm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSvHpm(gt2,:,:) = AmpWaveZSeToSvHpm(gt2,:,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToSvHpm(gt1,:,:) 
AmpVertexZSeToSvHpm(gt2,:,:)= AmpVertexZSeToSvHpm(gt2,:,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToSvHpm(gt1,:,:) 
 End Do 
End Do 
AmpWaveSeToSvHpm=AmpWaveZSeToSvHpm 
AmpVertexSeToSvHpm= AmpVertexZSeToSvHpm
! Final State 1 
AmpWaveZSeToSvHpm=0._dp 
AmpVertexZSeToSvHpm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSvHpm(:,gt2,:) = AmpWaveZSeToSvHpm(:,gt2,:)+ZRUZV(gt2,gt1)*AmpWaveSeToSvHpm(:,gt1,:) 
AmpVertexZSeToSvHpm(:,gt2,:)= AmpVertexZSeToSvHpm(:,gt2,:)+ZRUZV(gt2,gt1)*AmpVertexSeToSvHpm(:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToSvHpm=AmpWaveZSeToSvHpm 
AmpVertexSeToSvHpm= AmpVertexZSeToSvHpm
! Final State 2 
AmpWaveZSeToSvHpm=0._dp 
AmpVertexZSeToSvHpm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZSeToSvHpm(:,:,gt2) = AmpWaveZSeToSvHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveSeToSvHpm(:,:,gt1) 
AmpVertexZSeToSvHpm(:,:,gt2)= AmpVertexZSeToSvHpm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexSeToSvHpm(:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToSvHpm=AmpWaveZSeToSvHpm 
AmpVertexSeToSvHpm= AmpVertexZSeToSvHpm
End if
If (ShiftIRdiv) Then 
AmpVertexSeToSvHpm = AmpVertexSeToSvHpm  +  AmpVertexIRosSeToSvHpm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Sv Hpm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToSvHpm = AmpTreeSeToSvHpm 
 AmpSum2SeToSvHpm = AmpTreeSeToSvHpm + 2._dp*AmpWaveSeToSvHpm + 2._dp*AmpVertexSeToSvHpm  
Else 
 AmpSumSeToSvHpm = AmpTreeSeToSvHpm + AmpWaveSeToSvHpm + AmpVertexSeToSvHpm
 AmpSum2SeToSvHpm = AmpTreeSeToSvHpm + AmpWaveSeToSvHpm + AmpVertexSeToSvHpm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSvHpm = AmpTreeSeToSvHpm
 AmpSum2SeToSvHpm = AmpTreeSeToSvHpm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=2,2
If (((OSkinematics).and.(Abs(MSeOS(gt1)).gt.(Abs(MSvOS(gt2))+Abs(MHpmOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSe(gt1)).gt.(Abs(MSv(gt2))+Abs(MHpm(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SeToSvHpm = AmpTreeSeToSvHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSvOS(gt2),MHpmOS(gt3),AmpSumSeToSvHpm(gt1, gt2, gt3),AmpSum2SeToSvHpm(gt1, gt2, gt3),AmpSqSeToSvHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSv(gt2),MHpm(gt3),AmpSumSeToSvHpm(gt1, gt2, gt3),AmpSum2SeToSvHpm(gt1, gt2, gt3),AmpSqSeToSvHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToSvHpm(gt1, gt2, gt3) 
  AmpSum2SeToSvHpm = 2._dp*AmpWaveSeToSvHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSvOS(gt2),MHpmOS(gt3),AmpSumSeToSvHpm(gt1, gt2, gt3),AmpSum2SeToSvHpm(gt1, gt2, gt3),AmpSqSeToSvHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSv(gt2),MHpm(gt3),AmpSumSeToSvHpm(gt1, gt2, gt3),AmpSum2SeToSvHpm(gt1, gt2, gt3),AmpSqSeToSvHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToSvHpm(gt1, gt2, gt3) 
  AmpSum2SeToSvHpm = 2._dp*AmpVertexSeToSvHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSvOS(gt2),MHpmOS(gt3),AmpSumSeToSvHpm(gt1, gt2, gt3),AmpSum2SeToSvHpm(gt1, gt2, gt3),AmpSqSeToSvHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSv(gt2),MHpm(gt3),AmpSumSeToSvHpm(gt1, gt2, gt3),AmpSum2SeToSvHpm(gt1, gt2, gt3),AmpSqSeToSvHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToSvHpm(gt1, gt2, gt3) 
  AmpSum2SeToSvHpm = AmpTreeSeToSvHpm + 2._dp*AmpWaveSeToSvHpm + 2._dp*AmpVertexSeToSvHpm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSeOS(gt1),MSvOS(gt2),MHpmOS(gt3),AmpSumSeToSvHpm(gt1, gt2, gt3),AmpSum2SeToSvHpm(gt1, gt2, gt3),AmpSqSeToSvHpm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSe(gt1),MSv(gt2),MHpm(gt3),AmpSumSeToSvHpm(gt1, gt2, gt3),AmpSum2SeToSvHpm(gt1, gt2, gt3),AmpSqSeToSvHpm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToSvHpm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToSvHpm = AmpTreeSeToSvHpm
  Call SquareAmp_StoSS(MSeOS(gt1),MSvOS(gt2),MHpmOS(gt3),AmpSumSeToSvHpm(gt1, gt2, gt3),AmpSum2SeToSvHpm(gt1, gt2, gt3),AmpSqSeToSvHpm(gt1, gt2, gt3)) 
  AmpSqTreeSeToSvHpm(gt1, gt2, gt3) = AmpSqSeToSvHpm(gt1, gt2, gt3)  
  AmpSum2SeToSvHpm = + 2._dp*AmpWaveSeToSvHpm + 2._dp*AmpVertexSeToSvHpm
  Call SquareAmp_StoSS(MSeOS(gt1),MSvOS(gt2),MHpmOS(gt3),AmpSumSeToSvHpm(gt1, gt2, gt3),AmpSum2SeToSvHpm(gt1, gt2, gt3),AmpSqSeToSvHpm(gt1, gt2, gt3)) 
  AmpSqSeToSvHpm(gt1, gt2, gt3) = AmpSqSeToSvHpm(gt1, gt2, gt3) + AmpSqTreeSeToSvHpm(gt1, gt2, gt3)  
Else  
  AmpSum2SeToSvHpm = AmpTreeSeToSvHpm
  Call SquareAmp_StoSS(MSe(gt1),MSv(gt2),MHpm(gt3),AmpSumSeToSvHpm(gt1, gt2, gt3),AmpSum2SeToSvHpm(gt1, gt2, gt3),AmpSqSeToSvHpm(gt1, gt2, gt3)) 
  AmpSqTreeSeToSvHpm(gt1, gt2, gt3) = AmpSqSeToSvHpm(gt1, gt2, gt3)  
  AmpSum2SeToSvHpm = + 2._dp*AmpWaveSeToSvHpm + 2._dp*AmpVertexSeToSvHpm
  Call SquareAmp_StoSS(MSe(gt1),MSv(gt2),MHpm(gt3),AmpSumSeToSvHpm(gt1, gt2, gt3),AmpSum2SeToSvHpm(gt1, gt2, gt3),AmpSqSeToSvHpm(gt1, gt2, gt3)) 
  AmpSqSeToSvHpm(gt1, gt2, gt3) = AmpSqSeToSvHpm(gt1, gt2, gt3) + AmpSqTreeSeToSvHpm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSeToSvHpm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSvHpm(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSvOS(gt2),MHpmOS(gt3),helfactor*AmpSqSeToSvHpm(gt1, gt2, gt3))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSv(gt2),MHpm(gt3),helfactor*AmpSqSeToSvHpm(gt1, gt2, gt3))
End if 
If ((Abs(MRPSeToSvHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSvHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToSvHpm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSeToSvHpm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSeToSvHpm(gt1, gt2, gt3) + MRGSeToSvHpm(gt1, gt2, gt3)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSeToSvHpm(gt1, gt2, gt3) + MRGSeToSvHpm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
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
! Se VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_SeToSeVZ(cplSecSeVZ,MSe,MVZ,MSe2,MVZ2,AmpTreeSeToSeVZ)

  Else 
Call Amplitude_Tree_sec_UMSSM_SeToSeVZ(ZcplSecSeVZ,MSe,MVZ,MSe2,MVZ2,AmpTreeSeToSeVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_SeToSeVZ(MLambda,em,gs,cplSecSeVZ,MSeOS,MVZOS,              & 
& MRPSeToSeVZ,MRGSeToSeVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_SeToSeVZ(MLambda,em,gs,ZcplSecSeVZ,MSeOS,MVZOS,             & 
& MRPSeToSeVZ,MRGSeToSeVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_SeToSeVZ(MLambda,em,gs,cplSecSeVZ,MSe,MVZ,MRPSeToSeVZ,      & 
& MRGSeToSeVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_SeToSeVZ(MLambda,em,gs,ZcplSecSeVZ,MSe,MVZ,MRPSeToSeVZ,     & 
& MRGSeToSeVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_SeToSeVZ(cplSecSeVP,cplSecSeVZ,cplSecSeVZp,             & 
& ctcplSecSeVP,ctcplSecSeVZ,ctcplSecSeVZp,MSe,MSe2,MVP,MVP2,MVZ,MVZ2,ZfSe,               & 
& ZfVPVZ,ZfVZ,ZfVZpVZ,AmpWaveSeToSeVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_SeToSeVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,             & 
& MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,cplcChaChaVZL,    & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,        & 
& cplcFeChiSeR,cplcFeFeVZL,cplcFeFeVZR,cplcFvFvVZL,cplcFvFvVZR,cplhhSecSe,               & 
& cplhhVZVZ,cplhhVZVZp,cplHpmSvcSe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSecSeVP,cplSecSeVZ,      & 
& cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,         & 
& cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSeVPVZ1,cplSecSeVZVZ1,cplSecSeVZVZp1,       & 
& cplSecSvcVWmVZ1,cplSvcSeVWmVZ1,AmpVertexSeToSeVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSeVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,             & 
& MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,cplcChaChaVZL,    & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,        & 
& cplcFeChiSeR,cplcFeFeVZL,cplcFeFeVZR,cplcFvFvVZL,cplcFvFvVZR,cplhhSecSe,               & 
& cplhhVZVZ,cplhhVZVZp,cplHpmSvcSe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSecSeVP,cplSecSeVZ,      & 
& cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,         & 
& cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSeVPVZ1,cplSecSeVZVZ1,cplSecSeVZVZp1,       & 
& cplSecSvcVWmVZ1,cplSvcSeVWmVZ1,AmpVertexIRdrSeToSeVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSeVZ(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,               & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhhhVZ,      & 
& cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,         & 
& cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZL,          & 
& cplcFeFeVZR,cplcFvFvVZL,cplcFvFvVZR,cplhhSecSe,cplhhVZVZ,cplhhVZVZp,cplHpmSvcSe,       & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSecSeVP,ZcplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,            & 
& cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplcHpmVWmVZ,           & 
& cplcVWmVWmVZ,cplSecSeVPVZ1,cplSecSeVZVZ1,cplSecSeVZVZp1,cplSecSvcVWmVZ1,               & 
& cplSvcSeVWmVZ1,AmpVertexIRosSeToSeVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSeVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,             & 
& MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,cplcChaChaVZL,    & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,        & 
& cplcFeChiSeR,cplcFeFeVZL,cplcFeFeVZR,cplcFvFvVZL,cplcFvFvVZR,cplhhSecSe,               & 
& cplhhVZVZ,cplhhVZVZp,cplHpmSvcSe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSecSeVP,ZcplSecSeVZ,     & 
& cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,         & 
& cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSeVPVZ1,cplSecSeVZVZ1,cplSecSeVZVZp1,       & 
& cplSecSvcVWmVZ1,cplSvcSeVWmVZ1,AmpVertexIRosSeToSeVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSeVZ(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,               & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhhhVZ,      & 
& cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,         & 
& cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZL,          & 
& cplcFeFeVZR,cplcFvFvVZL,cplcFvFvVZR,cplhhSecSe,cplhhVZVZ,cplhhVZVZp,cplHpmSvcSe,       & 
& cplHpmcHpmVZ,cplHpmcVWmVZ,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,             & 
& cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplcHpmVWmVZ,           & 
& cplcVWmVWmVZ,cplSecSeVPVZ1,cplSecSeVZVZ1,cplSecSeVZVZp1,cplSecSvcVWmVZ1,               & 
& cplSvcSeVWmVZ1,AmpVertexIRosSeToSeVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSeVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,             & 
& MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,cplcChaChaVZL,    & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,        & 
& cplcFeChiSeR,cplcFeFeVZL,cplcFeFeVZR,cplcFvFvVZL,cplcFvFvVZR,cplhhSecSe,               & 
& cplhhVZVZ,cplhhVZVZp,cplHpmSvcSe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSecSeVP,cplSecSeVZ,      & 
& cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,         & 
& cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSeVPVZ1,cplSecSeVZVZ1,cplSecSeVZVZp1,       & 
& cplSecSvcVWmVZ1,cplSvcSeVWmVZ1,AmpVertexIRosSeToSeVZ)

 End if 
 End if 
AmpVertexSeToSeVZ = AmpVertexSeToSeVZ -  AmpVertexIRdrSeToSeVZ! +  AmpVertexIRosSeToSeVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToSeVZ=0._dp 
AmpVertexZSeToSeVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSeVZ(:,gt2,:) = AmpWaveZSeToSeVZ(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToSeVZ(:,gt1,:) 
AmpVertexZSeToSeVZ(:,gt2,:)= AmpVertexZSeToSeVZ(:,gt2,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToSeVZ(:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToSeVZ=AmpWaveZSeToSeVZ 
AmpVertexSeToSeVZ= AmpVertexZSeToSeVZ
! Final State 1 
AmpWaveZSeToSeVZ=0._dp 
AmpVertexZSeToSeVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSeVZ(:,:,gt2) = AmpWaveZSeToSeVZ(:,:,gt2)+ZRUZE(gt2,gt1)*AmpWaveSeToSeVZ(:,:,gt1) 
AmpVertexZSeToSeVZ(:,:,gt2)= AmpVertexZSeToSeVZ(:,:,gt2)+ZRUZE(gt2,gt1)*AmpVertexSeToSeVZ(:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToSeVZ=AmpWaveZSeToSeVZ 
AmpVertexSeToSeVZ= AmpVertexZSeToSeVZ
End if
If (ShiftIRdiv) Then 
AmpVertexSeToSeVZ = AmpVertexSeToSeVZ  +  AmpVertexIRosSeToSeVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Se VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToSeVZ = AmpTreeSeToSeVZ 
 AmpSum2SeToSeVZ = AmpTreeSeToSeVZ + 2._dp*AmpWaveSeToSeVZ + 2._dp*AmpVertexSeToSeVZ  
Else 
 AmpSumSeToSeVZ = AmpTreeSeToSeVZ + AmpWaveSeToSeVZ + AmpVertexSeToSeVZ
 AmpSum2SeToSeVZ = AmpTreeSeToSeVZ + AmpWaveSeToSeVZ + AmpVertexSeToSeVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSeVZ = AmpTreeSeToSeVZ
 AmpSum2SeToSeVZ = AmpTreeSeToSeVZ 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSeOS(gt1)).gt.(Abs(MSeOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MSe(gt1)).gt.(Abs(MSe(gt2))+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SeToSeVZ = AmpTreeSeToSeVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZOS,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZ,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToSeVZ(gt1, gt2) 
  AmpSum2SeToSeVZ = 2._dp*AmpWaveSeToSeVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZOS,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZ,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToSeVZ(gt1, gt2) 
  AmpSum2SeToSeVZ = 2._dp*AmpVertexSeToSeVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZOS,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZ,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToSeVZ(gt1, gt2) 
  AmpSum2SeToSeVZ = AmpTreeSeToSeVZ + 2._dp*AmpWaveSeToSeVZ + 2._dp*AmpVertexSeToSeVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZOS,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZ,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToSeVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToSeVZ = AmpTreeSeToSeVZ
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZOS,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
  AmpSqTreeSeToSeVZ(gt1, gt2) = AmpSqSeToSeVZ(gt1, gt2)  
  AmpSum2SeToSeVZ = + 2._dp*AmpWaveSeToSeVZ + 2._dp*AmpVertexSeToSeVZ
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZOS,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
  AmpSqSeToSeVZ(gt1, gt2) = AmpSqSeToSeVZ(gt1, gt2) + AmpSqTreeSeToSeVZ(gt1, gt2)  
Else  
  AmpSum2SeToSeVZ = AmpTreeSeToSeVZ
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZ,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
  AmpSqTreeSeToSeVZ(gt1, gt2) = AmpSqSeToSeVZ(gt1, gt2)  
  AmpSum2SeToSeVZ = + 2._dp*AmpWaveSeToSeVZ + 2._dp*AmpVertexSeToSeVZ
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZ,AmpSumSeToSeVZ(:,gt1, gt2),AmpSum2SeToSeVZ(:,gt1, gt2),AmpSqSeToSeVZ(gt1, gt2)) 
  AmpSqSeToSeVZ(gt1, gt2) = AmpSqSeToSeVZ(gt1, gt2) + AmpSqTreeSeToSeVZ(gt1, gt2)  
End if  
Else  
  AmpSqSeToSeVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSeVZ(gt1, gt2).eq.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSeOS(gt2),MVZOS,helfactor*AmpSqSeToSeVZ(gt1, gt2))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSe(gt2),MVZ,helfactor*AmpSqSeToSeVZ(gt1, gt2))
End if 
If ((Abs(MRPSeToSeVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSeVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToSeVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSeVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSeToSeVZ(gt1, gt2) + MRGSeToSeVZ(gt1, gt2)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSeToSeVZ(gt1, gt2) + MRGSeToSeVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
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
! Se VZp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_SeToSeVZp(cplSecSeVZp,MSe,MVZp,MSe2,MVZp2,              & 
& AmpTreeSeToSeVZp)

  Else 
Call Amplitude_Tree_sec_UMSSM_SeToSeVZp(ZcplSecSeVZp,MSe,MVZp,MSe2,MVZp2,             & 
& AmpTreeSeToSeVZp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_SeToSeVZp(MLambda,em,gs,cplSecSeVZp,MSeOS,MVZpOS,           & 
& MRPSeToSeVZp,MRGSeToSeVZp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_SeToSeVZp(MLambda,em,gs,ZcplSecSeVZp,MSeOS,MVZpOS,          & 
& MRPSeToSeVZp,MRGSeToSeVZp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_SeToSeVZp(MLambda,em,gs,cplSecSeVZp,MSe,MVZp,               & 
& MRPSeToSeVZp,MRGSeToSeVZp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_SeToSeVZp(MLambda,em,gs,ZcplSecSeVZp,MSe,MVZp,              & 
& MRPSeToSeVZp,MRGSeToSeVZp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_SeToSeVZp(cplSecSeVP,cplSecSeVZ,cplSecSeVZp,            & 
& ctcplSecSeVP,ctcplSecSeVZ,ctcplSecSeVZp,MSe,MSe2,MVP,MVP2,MVZp,MVZp2,ZfSe,             & 
& ZfVPVZp,ZfVZp,ZfVZVZp,AmpWaveSeToSeVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_SeToSeVZp(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,             & 
& MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,     & 
& cplcFeChiSeR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFvFvVZpL,cplcFvFvVZpR,cplhhSecSe,           & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSecSeVP,             & 
& cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,          & 
& cplSvcSeVWm,cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSeVPVZp1,cplSecSeVZVZp1,     & 
& cplSecSeVZpVZp1,cplSecSvcVWmVZp1,cplSvcSeVWmVZp1,AmpVertexSeToSeVZp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSeVZp(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,            & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,   & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFvFvVZpL,cplcFvFvVZpR,         & 
& cplhhSecSe,cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,            & 
& cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSeVPVZp1,       & 
& cplSecSeVZVZp1,cplSecSeVZpVZp1,cplSecSvcVWmVZp1,cplSvcSeVWmVZp1,AmpVertexIRdrSeToSeVZp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSeVZp(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhhhVZp,     & 
& cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,      & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZpL,        & 
& cplcFeFeVZpR,cplcFvFvVZpL,cplcFvFvVZpR,cplhhSecSe,cplhhVZVZp,cplhhVZpVZp,              & 
& cplHpmSvcSe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSecSeVP,cplSecSeVZ,ZcplSecSeVZp,            & 
& cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZp,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSeVPVZp1,cplSecSeVZVZp1,cplSecSeVZpVZp1,             & 
& cplSecSvcVWmVZp1,cplSvcSeVWmVZp1,AmpVertexIRosSeToSeVZp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSeVZp(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,            & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,   & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFvFvVZpL,cplcFvFvVZpR,         & 
& cplhhSecSe,cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSecSeVP,cplSecSeVZ,ZcplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,           & 
& cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSeVPVZp1,       & 
& cplSecSeVZVZp1,cplSecSeVZpVZp1,cplSecSvcVWmVZp1,cplSvcSeVWmVZp1,AmpVertexIRosSeToSeVZp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSeVZp(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhhhVZp,     & 
& cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,      & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZpL,        & 
& cplcFeFeVZpR,cplcFvFvVZpL,cplcFvFvVZpR,cplhhSecSe,cplhhVZVZp,cplhhVZpVZp,              & 
& cplHpmSvcSe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,             & 
& cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZp,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSeVPVZp1,cplSecSeVZVZp1,cplSecSeVZpVZp1,             & 
& cplSecSvcVWmVZp1,cplSvcSeVWmVZp1,AmpVertexIRosSeToSeVZp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSeVZp(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,            & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,   & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFvFvVZpL,cplcFvFvVZpR,         & 
& cplhhSecSe,cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,            & 
& cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSeVPVZp1,       & 
& cplSecSeVZVZp1,cplSecSeVZpVZp1,cplSecSvcVWmVZp1,cplSvcSeVWmVZp1,AmpVertexIRosSeToSeVZp)

 End if 
 End if 
AmpVertexSeToSeVZp = AmpVertexSeToSeVZp -  AmpVertexIRdrSeToSeVZp! +  AmpVertexIRosSeToSeVZp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToSeVZp=0._dp 
AmpVertexZSeToSeVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSeVZp(:,gt2,:) = AmpWaveZSeToSeVZp(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToSeVZp(:,gt1,:) 
AmpVertexZSeToSeVZp(:,gt2,:)= AmpVertexZSeToSeVZp(:,gt2,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToSeVZp(:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToSeVZp=AmpWaveZSeToSeVZp 
AmpVertexSeToSeVZp= AmpVertexZSeToSeVZp
! Final State 1 
AmpWaveZSeToSeVZp=0._dp 
AmpVertexZSeToSeVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSeVZp(:,:,gt2) = AmpWaveZSeToSeVZp(:,:,gt2)+ZRUZE(gt2,gt1)*AmpWaveSeToSeVZp(:,:,gt1) 
AmpVertexZSeToSeVZp(:,:,gt2)= AmpVertexZSeToSeVZp(:,:,gt2)+ZRUZE(gt2,gt1)*AmpVertexSeToSeVZp(:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToSeVZp=AmpWaveZSeToSeVZp 
AmpVertexSeToSeVZp= AmpVertexZSeToSeVZp
End if
If (ShiftIRdiv) Then 
AmpVertexSeToSeVZp = AmpVertexSeToSeVZp  +  AmpVertexIRosSeToSeVZp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Se VZp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToSeVZp = AmpTreeSeToSeVZp 
 AmpSum2SeToSeVZp = AmpTreeSeToSeVZp + 2._dp*AmpWaveSeToSeVZp + 2._dp*AmpVertexSeToSeVZp  
Else 
 AmpSumSeToSeVZp = AmpTreeSeToSeVZp + AmpWaveSeToSeVZp + AmpVertexSeToSeVZp
 AmpSum2SeToSeVZp = AmpTreeSeToSeVZp + AmpWaveSeToSeVZp + AmpVertexSeToSeVZp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSeVZp = AmpTreeSeToSeVZp
 AmpSum2SeToSeVZp = AmpTreeSeToSeVZp 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSeOS(gt1)).gt.(Abs(MSeOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MSe(gt1)).gt.(Abs(MSe(gt2))+Abs(MVZp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SeToSeVZp = AmpTreeSeToSeVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZpOS,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZp,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToSeVZp(gt1, gt2) 
  AmpSum2SeToSeVZp = 2._dp*AmpWaveSeToSeVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZpOS,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZp,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToSeVZp(gt1, gt2) 
  AmpSum2SeToSeVZp = 2._dp*AmpVertexSeToSeVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZpOS,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZp,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToSeVZp(gt1, gt2) 
  AmpSum2SeToSeVZp = AmpTreeSeToSeVZp + 2._dp*AmpWaveSeToSeVZp + 2._dp*AmpVertexSeToSeVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZpOS,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZp,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToSeVZp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToSeVZp = AmpTreeSeToSeVZp
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZpOS,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
  AmpSqTreeSeToSeVZp(gt1, gt2) = AmpSqSeToSeVZp(gt1, gt2)  
  AmpSum2SeToSeVZp = + 2._dp*AmpWaveSeToSeVZp + 2._dp*AmpVertexSeToSeVZp
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),MVZpOS,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
  AmpSqSeToSeVZp(gt1, gt2) = AmpSqSeToSeVZp(gt1, gt2) + AmpSqTreeSeToSeVZp(gt1, gt2)  
Else  
  AmpSum2SeToSeVZp = AmpTreeSeToSeVZp
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZp,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
  AmpSqTreeSeToSeVZp(gt1, gt2) = AmpSqSeToSeVZp(gt1, gt2)  
  AmpSum2SeToSeVZp = + 2._dp*AmpWaveSeToSeVZp + 2._dp*AmpVertexSeToSeVZp
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVZp,AmpSumSeToSeVZp(:,gt1, gt2),AmpSum2SeToSeVZp(:,gt1, gt2),AmpSqSeToSeVZp(gt1, gt2)) 
  AmpSqSeToSeVZp(gt1, gt2) = AmpSqSeToSeVZp(gt1, gt2) + AmpSqTreeSeToSeVZp(gt1, gt2)  
End if  
Else  
  AmpSqSeToSeVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSeVZp(gt1, gt2).eq.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSeOS(gt2),MVZpOS,helfactor*AmpSqSeToSeVZp(gt1, gt2))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSe(gt2),MVZp,helfactor*AmpSqSeToSeVZp(gt1, gt2))
End if 
If ((Abs(MRPSeToSeVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSeVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToSeVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSeVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSeToSeVZp(gt1, gt2) + MRGSeToSeVZp(gt1, gt2)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSeToSeVZp(gt1, gt2) + MRGSeToSeVZp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
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
! Sv VWm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_SeToSvVWm(cplSvcSeVWm,MSe,MSv,MVWm,MSe2,MSv2,           & 
& MVWm2,AmpTreeSeToSvVWm)

  Else 
Call Amplitude_Tree_sec_UMSSM_SeToSvVWm(ZcplSvcSeVWm,MSe,MSv,MVWm,MSe2,               & 
& MSv2,MVWm2,AmpTreeSeToSvVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_SeToSvVWm(MLambda,em,gs,cplSvcSeVWm,MSeOS,MSvOS,            & 
& MVWmOS,MRPSeToSvVWm,MRGSeToSvVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_SeToSvVWm(MLambda,em,gs,ZcplSvcSeVWm,MSeOS,MSvOS,           & 
& MVWmOS,MRPSeToSvVWm,MRGSeToSvVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_SeToSvVWm(MLambda,em,gs,cplSvcSeVWm,MSe,MSv,MVWm,           & 
& MRPSeToSvVWm,MRGSeToSvVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_SeToSvVWm(MLambda,em,gs,ZcplSvcSeVWm,MSe,MSv,               & 
& MVWm,MRPSeToSvVWm,MRGSeToSvVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_SeToSvVWm(cplSvcSeVWm,ctcplSvcSeVWm,MSe,MSe2,           & 
& MSv,MSv2,MVWm,MVWm2,ZfSe,ZfSv,ZfVWm,AmpWaveSeToSvVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_SeToSvVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,             & 
& MVP2,MVWm2,MVZ2,MVZp2,cplAhSecSe,cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,cplChaFvcSeR,    & 
& cplcFeChaSvL,cplcFeChaSvR,cplChiFecSeL,cplChiFecSeR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvcSv,         & 
& cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,               & 
& cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,             & 
& cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSecVWmVWm1,cplSvcSeVPVWm1,              & 
& cplSvcSeVWmVZ1,cplSvcSeVWmVZp1,cplSvcSvcVWmVWm1,AmpVertexSeToSvVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSvVWm(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSecSe,cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,            & 
& cplChaFvcSeR,cplcFeChaSvL,cplcFeChaSvR,cplChiFecSeL,cplChiFecSeR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,       & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,    & 
& cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,             & 
& cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSecVWmVWm1,cplSvcSeVPVWm1,              & 
& cplSvcSeVWmVZ1,cplSvcSeVWmVZp1,cplSvcSvcVWmVWm1,AmpVertexIRdrSeToSvVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSvVWm(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhSecSe,     & 
& cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,cplChaFvcSeR,cplcFeChaSvL,cplcFeChaSvR,           & 
& cplChiFecSeL,cplChiFecSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,             & 
& GosZcplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,ZcplSvcSeVWm,cplSvcSvVZ,             & 
& cplSvcSvVZp,GosZcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,     & 
& cplcVWmVWmVZp,cplSecSecVWmVWm1,cplSvcSeVPVWm1,cplSvcSeVWmVZ1,cplSvcSeVWmVZp1,          & 
& cplSvcSvcVWmVWm1,AmpVertexIRosSeToSvVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSvVWm(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSecSe,cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,            & 
& cplChaFvcSeR,cplcFeChaSvL,cplcFeChaSvR,cplChiFecSeL,cplChiFecSeR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,       & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,GZcplHpmSvcSe,cplSecSeVP,cplSecSeVZ,              & 
& cplSecSeVZp,ZcplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,GZcplcHpmVPVWm,cplcVWmVPVWm,           & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSecVWmVWm1,cplSvcSeVPVWm1, & 
& cplSvcSeVWmVZ1,cplSvcSeVWmVZp1,cplSvcSvcVWmVWm1,AmpVertexIRosSeToSvVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSvVWm(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhSecSe,     & 
& cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,cplChaFvcSeR,cplcFeChaSvL,cplcFeChaSvR,           & 
& cplChiFecSeL,cplChiFecSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,     & 
& cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,             & 
& GcplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,     & 
& GcplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,      & 
& cplSecSecVWmVWm1,cplSvcSeVPVWm1,cplSvcSeVWmVZ1,cplSvcSeVWmVZp1,cplSvcSvcVWmVWm1,       & 
& AmpVertexIRosSeToSvVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SeToSvVWm(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSecSe,cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,            & 
& cplChaFvcSeR,cplcFeChaSvL,cplcFeChaSvR,cplChiFecSeL,cplChiFecSeR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,       & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,    & 
& cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,             & 
& cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSecVWmVWm1,cplSvcSeVPVWm1,              & 
& cplSvcSeVWmVZ1,cplSvcSeVWmVZp1,cplSvcSvcVWmVWm1,AmpVertexIRosSeToSvVWm)

 End if 
 End if 
AmpVertexSeToSvVWm = AmpVertexSeToSvVWm -  AmpVertexIRdrSeToSvVWm! +  AmpVertexIRosSeToSvVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSeToSvVWm=0._dp 
AmpVertexZSeToSvVWm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSvVWm(:,gt2,:) = AmpWaveZSeToSvVWm(:,gt2,:)+ZRUZEc(gt2,gt1)*AmpWaveSeToSvVWm(:,gt1,:) 
AmpVertexZSeToSvVWm(:,gt2,:)= AmpVertexZSeToSvVWm(:,gt2,:) + ZRUZEc(gt2,gt1)*AmpVertexSeToSvVWm(:,gt1,:) 
 End Do 
End Do 
AmpWaveSeToSvVWm=AmpWaveZSeToSvVWm 
AmpVertexSeToSvVWm= AmpVertexZSeToSvVWm
! Final State 1 
AmpWaveZSeToSvVWm=0._dp 
AmpVertexZSeToSvVWm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSeToSvVWm(:,:,gt2) = AmpWaveZSeToSvVWm(:,:,gt2)+ZRUZV(gt2,gt1)*AmpWaveSeToSvVWm(:,:,gt1) 
AmpVertexZSeToSvVWm(:,:,gt2)= AmpVertexZSeToSvVWm(:,:,gt2)+ZRUZV(gt2,gt1)*AmpVertexSeToSvVWm(:,:,gt1) 
 End Do 
End Do 
AmpWaveSeToSvVWm=AmpWaveZSeToSvVWm 
AmpVertexSeToSvVWm= AmpVertexZSeToSvVWm
End if
If (ShiftIRdiv) Then 
AmpVertexSeToSvVWm = AmpVertexSeToSvVWm  +  AmpVertexIRosSeToSvVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Sv VWm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSeToSvVWm = AmpTreeSeToSvVWm 
 AmpSum2SeToSvVWm = AmpTreeSeToSvVWm + 2._dp*AmpWaveSeToSvVWm + 2._dp*AmpVertexSeToSvVWm  
Else 
 AmpSumSeToSvVWm = AmpTreeSeToSvVWm + AmpWaveSeToSvVWm + AmpVertexSeToSvVWm
 AmpSum2SeToSvVWm = AmpTreeSeToSvVWm + AmpWaveSeToSvVWm + AmpVertexSeToSvVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSvVWm = AmpTreeSeToSvVWm
 AmpSum2SeToSvVWm = AmpTreeSeToSvVWm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSeOS(gt1)).gt.(Abs(MSvOS(gt2))+Abs(MVWmOS)))).or.((.not.OSkinematics).and.(Abs(MSe(gt1)).gt.(Abs(MSv(gt2))+Abs(MVWm))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SeToSvVWm = AmpTreeSeToSvVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSvOS(gt2),MVWmOS,AmpSumSeToSvVWm(:,gt1, gt2),AmpSum2SeToSvVWm(:,gt1, gt2),AmpSqSeToSvVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSv(gt2),MVWm,AmpSumSeToSvVWm(:,gt1, gt2),AmpSum2SeToSvVWm(:,gt1, gt2),AmpSqSeToSvVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSeToSvVWm(gt1, gt2) 
  AmpSum2SeToSvVWm = 2._dp*AmpWaveSeToSvVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSvOS(gt2),MVWmOS,AmpSumSeToSvVWm(:,gt1, gt2),AmpSum2SeToSvVWm(:,gt1, gt2),AmpSqSeToSvVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSv(gt2),MVWm,AmpSumSeToSvVWm(:,gt1, gt2),AmpSum2SeToSvVWm(:,gt1, gt2),AmpSqSeToSvVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSeToSvVWm(gt1, gt2) 
  AmpSum2SeToSvVWm = 2._dp*AmpVertexSeToSvVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSvOS(gt2),MVWmOS,AmpSumSeToSvVWm(:,gt1, gt2),AmpSum2SeToSvVWm(:,gt1, gt2),AmpSqSeToSvVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSv(gt2),MVWm,AmpSumSeToSvVWm(:,gt1, gt2),AmpSum2SeToSvVWm(:,gt1, gt2),AmpSqSeToSvVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSeToSvVWm(gt1, gt2) 
  AmpSum2SeToSvVWm = AmpTreeSeToSvVWm + 2._dp*AmpWaveSeToSvVWm + 2._dp*AmpVertexSeToSvVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSvOS(gt2),MVWmOS,AmpSumSeToSvVWm(:,gt1, gt2),AmpSum2SeToSvVWm(:,gt1, gt2),AmpSqSeToSvVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSv(gt2),MVWm,AmpSumSeToSvVWm(:,gt1, gt2),AmpSum2SeToSvVWm(:,gt1, gt2),AmpSqSeToSvVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSeToSvVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SeToSvVWm = AmpTreeSeToSvVWm
  Call SquareAmp_StoSV(MSeOS(gt1),MSvOS(gt2),MVWmOS,AmpSumSeToSvVWm(:,gt1, gt2),AmpSum2SeToSvVWm(:,gt1, gt2),AmpSqSeToSvVWm(gt1, gt2)) 
  AmpSqTreeSeToSvVWm(gt1, gt2) = AmpSqSeToSvVWm(gt1, gt2)  
  AmpSum2SeToSvVWm = + 2._dp*AmpWaveSeToSvVWm + 2._dp*AmpVertexSeToSvVWm
  Call SquareAmp_StoSV(MSeOS(gt1),MSvOS(gt2),MVWmOS,AmpSumSeToSvVWm(:,gt1, gt2),AmpSum2SeToSvVWm(:,gt1, gt2),AmpSqSeToSvVWm(gt1, gt2)) 
  AmpSqSeToSvVWm(gt1, gt2) = AmpSqSeToSvVWm(gt1, gt2) + AmpSqTreeSeToSvVWm(gt1, gt2)  
Else  
  AmpSum2SeToSvVWm = AmpTreeSeToSvVWm
  Call SquareAmp_StoSV(MSe(gt1),MSv(gt2),MVWm,AmpSumSeToSvVWm(:,gt1, gt2),AmpSum2SeToSvVWm(:,gt1, gt2),AmpSqSeToSvVWm(gt1, gt2)) 
  AmpSqTreeSeToSvVWm(gt1, gt2) = AmpSqSeToSvVWm(gt1, gt2)  
  AmpSum2SeToSvVWm = + 2._dp*AmpWaveSeToSvVWm + 2._dp*AmpVertexSeToSvVWm
  Call SquareAmp_StoSV(MSe(gt1),MSv(gt2),MVWm,AmpSumSeToSvVWm(:,gt1, gt2),AmpSum2SeToSvVWm(:,gt1, gt2),AmpSqSeToSvVWm(gt1, gt2)) 
  AmpSqSeToSvVWm(gt1, gt2) = AmpSqSeToSvVWm(gt1, gt2) + AmpSqTreeSeToSvVWm(gt1, gt2)  
End if  
Else  
  AmpSqSeToSvVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSvVWm(gt1, gt2).eq.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSvOS(gt2),MVWmOS,helfactor*AmpSqSeToSvVWm(gt1, gt2))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSv(gt2),MVWm,helfactor*AmpSqSeToSvVWm(gt1, gt2))
End if 
If ((Abs(MRPSeToSvVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSvVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSeToSvVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSvVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSeToSvVWm(gt1, gt2) + MRGSeToSvVWm(gt1, gt2)) 
  gP1LSe(gt1,i4) = gP1LSe(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSeToSvVWm(gt1, gt2) + MRGSeToSvVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End If 
!---------------- 
! Se VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_sec_UMSSM_SeToSeVP(cplSecSeVP,cplSecSeVZ,cplSecSeVZp,             & 
& ctcplSecSeVP,ctcplSecSeVZ,ctcplSecSeVZp,MSeOS,MSe2OS,MVP,MVP2,ZfSe,ZfVP,               & 
& ZfVZpVP,ZfVZVP,AmpWaveSeToSeVP)

 Else 
Call Amplitude_WAVE_sec_UMSSM_SeToSeVP(cplSecSeVP,cplSecSeVZ,cplSecSeVZp,             & 
& ctcplSecSeVP,ctcplSecSeVZ,ctcplSecSeVZp,MSeOS,MSe2OS,MVP,MVP2,ZfSe,ZfVP,               & 
& ZfVZpVP,ZfVZVP,AmpWaveSeToSeVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_SeToSeVP(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,               & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhSecSe,     & 
& cplChaFvcSeL,cplChaFvcSeR,cplcChaChaVPL,cplcChaChaVPR,cplChiFecSeL,cplChiFecSeR,       & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVPL,cplcFeFeVPR,cplhhSecSe,cplHpmSvcSe,              & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,             & 
& cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,         & 
& cplSecSeVPVP1,cplSecSeVPVZ1,cplSecSeVPVZp1,cplSecSvcVWmVP1,cplSvcSeVPVWm1,             & 
& AmpVertexSeToSeVP)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_SeToSeVP(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,             & 
& MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,               & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhSecSe,     & 
& cplChaFvcSeL,cplChaFvcSeR,cplcChaChaVPL,cplcChaChaVPR,cplChiFecSeL,cplChiFecSeR,       & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVPL,cplcFeFeVPR,cplhhSecSe,cplHpmSvcSe,              & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,             & 
& cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,         & 
& cplSecSeVPVP1,cplSecSeVPVZ1,cplSecSeVPVZp1,cplSecSvcVWmVP1,cplSvcSeVPVWm1,             & 
& AmpVertexSeToSeVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_SeToSeVP(cplSecSeVP,cplSecSeVZ,cplSecSeVZp,             & 
& ctcplSecSeVP,ctcplSecSeVZ,ctcplSecSeVZp,MSe,MSe2,MVP,MVP2,ZfSe,ZfVP,ZfVZpVP,           & 
& ZfVZVP,AmpWaveSeToSeVP)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_SeToSeVP(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,             & 
& MVP2,MVWm2,MVZ2,MVZp2,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,cplcChaChaVPL,              & 
& cplcChaChaVPR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVPL,         & 
& cplcFeFeVPR,cplhhSecSe,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplSecSeVP,               & 
& cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,          & 
& cplSvcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSecSeVPVP1,cplSecSeVPVZ1,cplSecSeVPVZp1,      & 
& cplSecSvcVWmVP1,cplSvcSeVPVWm1,AmpVertexSeToSeVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Se->Se VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumSeToSeVP = 0._dp 
 AmpSum2SeToSeVP = 0._dp  
Else 
 AmpSumSeToSeVP = AmpVertexSeToSeVP + AmpWaveSeToSeVP
 AmpSum2SeToSeVP = AmpVertexSeToSeVP + AmpWaveSeToSeVP 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSeOS(gt1)).gt.(Abs(MSeOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MSe(gt1)).gt.(Abs(MSe(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSeOS(gt1),MSeOS(gt2),0._dp,AmpSumSeToSeVP(:,gt1, gt2),AmpSum2SeToSeVP(:,gt1, gt2),AmpSqSeToSeVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSe(gt1),MSe(gt2),MVP,AmpSumSeToSeVP(:,gt1, gt2),AmpSum2SeToSeVP(:,gt1, gt2),AmpSqSeToSeVP(gt1, gt2)) 
End if  
Else  
  AmpSqSeToSeVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSeToSeVP(gt1, gt2).eq.0._dp) Then 
  gP1LSe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSeOS(gt1),MSeOS(gt2),0._dp,helfactor*AmpSqSeToSeVP(gt1, gt2))
Else 
  gP1LSe(gt1,i4) = 1._dp*GammaTPS(MSe(gt1),MSe(gt2),MVP,helfactor*AmpSqSeToSeVP(gt1, gt2))
End if 
If ((Abs(MRPSeToSeVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSeToSeVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSe(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End Subroutine OneLoopDecay_Se

End Module Wrapper_OneLoopDecay_Se_sec_UMSSM
