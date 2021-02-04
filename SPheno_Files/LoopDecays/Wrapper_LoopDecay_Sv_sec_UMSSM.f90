! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 1:12 on 7.11.2019   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Sv_sec_UMSSM
Use Model_Data_sec_UMSSM 
Use Kinematics 
Use OneLoopDecay_Sv_sec_UMSSM 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Sv(MSdOS,MSd2OS,MSvOS,MSv2OS,MSuOS,MSu2OS,MSeOS,              & 
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
& ZfVZVZp,ZfVZpVZ,cplAhAhAh,cplAhAhhh,cplAhAhSvcSv1,cplAhcHpmVWm,cplAhhhhh,              & 
& cplAhhhSvcSv1,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhHpmSvcSe1,           & 
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
& cplhhhhSvcSv1,cplhhHpmcHpm,cplhhHpmcVWm,cplhhHpmSvcSe1,cplhhSdcSd,cplhhSecHpmcSv1,     & 
& cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhVZpVZp,cplhhVZVZ,cplhhVZVZp,cplHpmcHpmVP,        & 
& cplHpmcHpmVZ,cplHpmcHpmVZp,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplHpmSecHpmcSe1,   & 
& cplHpmSvcHpmcSv1,cplHpmSvcSe,cplSdcHpmcSu,cplSdSvcSdcSvaa,cplSecHpmcSv,cplSecSecVWmVWm1,& 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSecSvcVWm,cplSecSvcVWmVP1,cplSecSvcVWmVZ1,        & 
& cplSecSvcVWmVZp1,cplSeSucSdcSvaa,cplSeSvcSecSv1,cplSuSvcSucSvaa,cplSvcSeVPVWm1,        & 
& cplSvcSeVWm,cplSvcSeVWmVZ1,cplSvcSeVWmVZp1,cplSvcSvcVWmVWm1,cplSvcSvVZ,cplSvcSvVZp,    & 
& cplSvcSvVZpVZp1,cplSvcSvVZVZ1,cplSvcSvVZVZp1,cplSvSvcSvcSv1,ctcplAhSvcSv,              & 
& ctcplcChaFecSvL,ctcplcChaFecSvR,ctcplChiFvcSvL,ctcplChiFvcSvR,ctcplhhSvcSv,            & 
& ctcplSecHpmcSv,ctcplSecSvcVWm,ctcplSvcSvVZ,ctcplSvcSvVZp,GcplcHpmVPVWm,GcplHpmcVWmVP,  & 
& GcplSecHpmcSv,GosZcplcHpmVPVWm,GosZcplHpmcVWmVP,GosZcplSecHpmcSv,GZcplcHpmVPVWm,       & 
& GZcplHpmcVWmVP,GZcplSecHpmcSv,ZcplAhSvcSv,ZcplcChaFecSvL,ZcplcChaFecSvR,               & 
& ZcplChiFvcSvL,ZcplChiFvcSvR,ZcplhhSvcSv,ZcplSecHpmcSv,ZcplSecSvcVWm,ZcplSvcSvVZ,       & 
& ZcplSvcSvVZp,ZRUZD,ZRUZV,ZRUZU,ZRUZE,ZRUZH,ZRUZA,ZRUZP,ZRUZN,ZRUZVL,ZRUZVR,            & 
& ZRUUM,ZRUUP,ZRUZEL,ZRUZER,ZRUZDL,ZRUZDR,ZRUZUL,ZRUZUR,MLambda,em,gs,deltaM,            & 
& kont,gP1LSv)

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

Complex(dp),Intent(in) :: cplAhAhAh(6,6,6),cplAhAhhh(6,6,6),cplAhAhSvcSv1(6,6,6,6),cplAhcHpmVWm(6,2),           & 
& cplAhhhhh(6,6,6),cplAhhhSvcSv1(6,6,6,6),cplAhhhVZ(6,6),cplAhhhVZp(6,6),cplAhHpmcHpm(6,2,2),& 
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
& cplhhhhSvcSv1(6,6,6,6),cplhhHpmcHpm(6,2,2),cplhhHpmcVWm(6,2),cplhhHpmSvcSe1(6,2,6,6),  & 
& cplhhSdcSd(6,6,6),cplhhSecHpmcSv1(6,6,2,6),cplhhSecSe(6,6,6),cplhhSucSu(6,6,6),        & 
& cplhhSvcSv(6,6,6),cplhhVZpVZp(6),cplhhVZVZ(6),cplhhVZVZp(6),cplHpmcHpmVP(2,2),         & 
& cplHpmcHpmVZ(2,2),cplHpmcHpmVZp(2,2),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmcVWmVZp(2), & 
& cplHpmSecHpmcSe1(2,6,2,6),cplHpmSvcHpmcSv1(2,6,2,6),cplHpmSvcSe(2,6,6),cplSdcHpmcSu(6,2,6),& 
& cplSdSvcSdcSvaa(6,6,6,6),cplSecHpmcSv(6,2,6),cplSecSecVWmVWm1(6,6),cplSecSeVP(6,6),    & 
& cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSecSvcVWm(6,6),cplSecSvcVWmVP1(6,6),               & 
& cplSecSvcVWmVZ1(6,6),cplSecSvcVWmVZp1(6,6),cplSeSucSdcSvaa(6,6,6,6),cplSeSvcSecSv1(6,6,6,6),& 
& cplSuSvcSucSvaa(6,6,6,6),cplSvcSeVPVWm1(6,6),cplSvcSeVWm(6,6),cplSvcSeVWmVZ1(6,6),     & 
& cplSvcSeVWmVZp1(6,6),cplSvcSvcVWmVWm1(6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),           & 
& cplSvcSvVZpVZp1(6,6),cplSvcSvVZVZ1(6,6),cplSvcSvVZVZp1(6,6),cplSvSvcSvcSv1(6,6,6,6),   & 
& ctcplAhSvcSv(6,6,6),ctcplcChaFecSvL(2,3,6),ctcplcChaFecSvR(2,3,6),ctcplChiFvcSvL(9,3,6),& 
& ctcplChiFvcSvR(9,3,6),ctcplhhSvcSv(6,6,6),ctcplSecHpmcSv(6,2,6),ctcplSecSvcVWm(6,6),   & 
& ctcplSvcSvVZ(6,6),ctcplSvcSvVZp(6,6),GcplcHpmVPVWm(2),GcplHpmcVWmVP(2),GcplSecHpmcSv(6,2,6),& 
& GosZcplcHpmVPVWm(2),GosZcplHpmcVWmVP(2),GosZcplSecHpmcSv(6,2,6),GZcplcHpmVPVWm(2)

Complex(dp),Intent(in) :: GZcplHpmcVWmVP(2),GZcplSecHpmcSv(6,2,6),ZcplAhSvcSv(6,6,6),ZcplcChaFecSvL(2,3,6),      & 
& ZcplcChaFecSvR(2,3,6),ZcplChiFvcSvL(9,3,6),ZcplChiFvcSvR(9,3,6),ZcplhhSvcSv(6,6,6),    & 
& ZcplSecHpmcSv(6,2,6),ZcplSecSvcVWm(6,6),ZcplSvcSvVZ(6,6),ZcplSvcSvVZp(6,6)

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
Real(dp), Intent(out) :: gP1LSv(6,123) 
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
Real(dp) :: MRPSvToSvAh(6,6,6),MRGSvToSvAh(6,6,6), MRPZSvToSvAh(6,6,6),MRGZSvToSvAh(6,6,6) 
Real(dp) :: MVPSvToSvAh(6,6,6) 
Real(dp) :: RMsqTreeSvToSvAh(6,6,6),RMsqWaveSvToSvAh(6,6,6),RMsqVertexSvToSvAh(6,6,6) 
Complex(dp) :: AmpTreeSvToSvAh(6,6,6),AmpWaveSvToSvAh(6,6,6)=(0._dp,0._dp),AmpVertexSvToSvAh(6,6,6)& 
 & ,AmpVertexIRosSvToSvAh(6,6,6),AmpVertexIRdrSvToSvAh(6,6,6), AmpSumSvToSvAh(6,6,6), AmpSum2SvToSvAh(6,6,6) 
Complex(dp) :: AmpTreeZSvToSvAh(6,6,6),AmpWaveZSvToSvAh(6,6,6),AmpVertexZSvToSvAh(6,6,6) 
Real(dp) :: AmpSqSvToSvAh(6,6,6),  AmpSqTreeSvToSvAh(6,6,6) 
Real(dp) :: MRPSvToFvChi(6,3,9),MRGSvToFvChi(6,3,9), MRPZSvToFvChi(6,3,9),MRGZSvToFvChi(6,3,9) 
Real(dp) :: MVPSvToFvChi(6,3,9) 
Real(dp) :: RMsqTreeSvToFvChi(6,3,9),RMsqWaveSvToFvChi(6,3,9),RMsqVertexSvToFvChi(6,3,9) 
Complex(dp) :: AmpTreeSvToFvChi(2,6,3,9),AmpWaveSvToFvChi(2,6,3,9)=(0._dp,0._dp),AmpVertexSvToFvChi(2,6,3,9)& 
 & ,AmpVertexIRosSvToFvChi(2,6,3,9),AmpVertexIRdrSvToFvChi(2,6,3,9), AmpSumSvToFvChi(2,6,3,9), AmpSum2SvToFvChi(2,6,3,9) 
Complex(dp) :: AmpTreeZSvToFvChi(2,6,3,9),AmpWaveZSvToFvChi(2,6,3,9),AmpVertexZSvToFvChi(2,6,3,9) 
Real(dp) :: AmpSqSvToFvChi(6,3,9),  AmpSqTreeSvToFvChi(6,3,9) 
Real(dp) :: MRPSvTocChaFe(6,2,3),MRGSvTocChaFe(6,2,3), MRPZSvTocChaFe(6,2,3),MRGZSvTocChaFe(6,2,3) 
Real(dp) :: MVPSvTocChaFe(6,2,3) 
Real(dp) :: RMsqTreeSvTocChaFe(6,2,3),RMsqWaveSvTocChaFe(6,2,3),RMsqVertexSvTocChaFe(6,2,3) 
Complex(dp) :: AmpTreeSvTocChaFe(2,6,2,3),AmpWaveSvTocChaFe(2,6,2,3)=(0._dp,0._dp),AmpVertexSvTocChaFe(2,6,2,3)& 
 & ,AmpVertexIRosSvTocChaFe(2,6,2,3),AmpVertexIRdrSvTocChaFe(2,6,2,3), AmpSumSvTocChaFe(2,6,2,3), AmpSum2SvTocChaFe(2,6,2,3) 
Complex(dp) :: AmpTreeZSvTocChaFe(2,6,2,3),AmpWaveZSvTocChaFe(2,6,2,3),AmpVertexZSvTocChaFe(2,6,2,3) 
Real(dp) :: AmpSqSvTocChaFe(6,2,3),  AmpSqTreeSvTocChaFe(6,2,3) 
Real(dp) :: MRPSvToSvhh(6,6,6),MRGSvToSvhh(6,6,6), MRPZSvToSvhh(6,6,6),MRGZSvToSvhh(6,6,6) 
Real(dp) :: MVPSvToSvhh(6,6,6) 
Real(dp) :: RMsqTreeSvToSvhh(6,6,6),RMsqWaveSvToSvhh(6,6,6),RMsqVertexSvToSvhh(6,6,6) 
Complex(dp) :: AmpTreeSvToSvhh(6,6,6),AmpWaveSvToSvhh(6,6,6)=(0._dp,0._dp),AmpVertexSvToSvhh(6,6,6)& 
 & ,AmpVertexIRosSvToSvhh(6,6,6),AmpVertexIRdrSvToSvhh(6,6,6), AmpSumSvToSvhh(6,6,6), AmpSum2SvToSvhh(6,6,6) 
Complex(dp) :: AmpTreeZSvToSvhh(6,6,6),AmpWaveZSvToSvhh(6,6,6),AmpVertexZSvToSvhh(6,6,6) 
Real(dp) :: AmpSqSvToSvhh(6,6,6),  AmpSqTreeSvToSvhh(6,6,6) 
Real(dp) :: MRPSvTocHpmSe(6,2,6),MRGSvTocHpmSe(6,2,6), MRPZSvTocHpmSe(6,2,6),MRGZSvTocHpmSe(6,2,6) 
Real(dp) :: MVPSvTocHpmSe(6,2,6) 
Real(dp) :: RMsqTreeSvTocHpmSe(6,2,6),RMsqWaveSvTocHpmSe(6,2,6),RMsqVertexSvTocHpmSe(6,2,6) 
Complex(dp) :: AmpTreeSvTocHpmSe(6,2,6),AmpWaveSvTocHpmSe(6,2,6)=(0._dp,0._dp),AmpVertexSvTocHpmSe(6,2,6)& 
 & ,AmpVertexIRosSvTocHpmSe(6,2,6),AmpVertexIRdrSvTocHpmSe(6,2,6), AmpSumSvTocHpmSe(6,2,6), AmpSum2SvTocHpmSe(6,2,6) 
Complex(dp) :: AmpTreeZSvTocHpmSe(6,2,6),AmpWaveZSvTocHpmSe(6,2,6),AmpVertexZSvTocHpmSe(6,2,6) 
Real(dp) :: AmpSqSvTocHpmSe(6,2,6),  AmpSqTreeSvTocHpmSe(6,2,6) 
Real(dp) :: MRPSvToSecVWm(6,6),MRGSvToSecVWm(6,6), MRPZSvToSecVWm(6,6),MRGZSvToSecVWm(6,6) 
Real(dp) :: MVPSvToSecVWm(6,6) 
Real(dp) :: RMsqTreeSvToSecVWm(6,6),RMsqWaveSvToSecVWm(6,6),RMsqVertexSvToSecVWm(6,6) 
Complex(dp) :: AmpTreeSvToSecVWm(2,6,6),AmpWaveSvToSecVWm(2,6,6)=(0._dp,0._dp),AmpVertexSvToSecVWm(2,6,6)& 
 & ,AmpVertexIRosSvToSecVWm(2,6,6),AmpVertexIRdrSvToSecVWm(2,6,6), AmpSumSvToSecVWm(2,6,6), AmpSum2SvToSecVWm(2,6,6) 
Complex(dp) :: AmpTreeZSvToSecVWm(2,6,6),AmpWaveZSvToSecVWm(2,6,6),AmpVertexZSvToSecVWm(2,6,6) 
Real(dp) :: AmpSqSvToSecVWm(6,6),  AmpSqTreeSvToSecVWm(6,6) 
Real(dp) :: MRPSvToSvVZ(6,6),MRGSvToSvVZ(6,6), MRPZSvToSvVZ(6,6),MRGZSvToSvVZ(6,6) 
Real(dp) :: MVPSvToSvVZ(6,6) 
Real(dp) :: RMsqTreeSvToSvVZ(6,6),RMsqWaveSvToSvVZ(6,6),RMsqVertexSvToSvVZ(6,6) 
Complex(dp) :: AmpTreeSvToSvVZ(2,6,6),AmpWaveSvToSvVZ(2,6,6)=(0._dp,0._dp),AmpVertexSvToSvVZ(2,6,6)& 
 & ,AmpVertexIRosSvToSvVZ(2,6,6),AmpVertexIRdrSvToSvVZ(2,6,6), AmpSumSvToSvVZ(2,6,6), AmpSum2SvToSvVZ(2,6,6) 
Complex(dp) :: AmpTreeZSvToSvVZ(2,6,6),AmpWaveZSvToSvVZ(2,6,6),AmpVertexZSvToSvVZ(2,6,6) 
Real(dp) :: AmpSqSvToSvVZ(6,6),  AmpSqTreeSvToSvVZ(6,6) 
Real(dp) :: MRPSvToSvVZp(6,6),MRGSvToSvVZp(6,6), MRPZSvToSvVZp(6,6),MRGZSvToSvVZp(6,6) 
Real(dp) :: MVPSvToSvVZp(6,6) 
Real(dp) :: RMsqTreeSvToSvVZp(6,6),RMsqWaveSvToSvVZp(6,6),RMsqVertexSvToSvVZp(6,6) 
Complex(dp) :: AmpTreeSvToSvVZp(2,6,6),AmpWaveSvToSvVZp(2,6,6)=(0._dp,0._dp),AmpVertexSvToSvVZp(2,6,6)& 
 & ,AmpVertexIRosSvToSvVZp(2,6,6),AmpVertexIRdrSvToSvVZp(2,6,6), AmpSumSvToSvVZp(2,6,6), AmpSum2SvToSvVZp(2,6,6) 
Complex(dp) :: AmpTreeZSvToSvVZp(2,6,6),AmpWaveZSvToSvVZp(2,6,6),AmpVertexZSvToSvVZp(2,6,6) 
Real(dp) :: AmpSqSvToSvVZp(6,6),  AmpSqTreeSvToSvVZp(6,6) 
Real(dp) :: MRPSvToSvVP(6,6),MRGSvToSvVP(6,6), MRPZSvToSvVP(6,6),MRGZSvToSvVP(6,6) 
Real(dp) :: MVPSvToSvVP(6,6) 
Real(dp) :: RMsqTreeSvToSvVP(6,6),RMsqWaveSvToSvVP(6,6),RMsqVertexSvToSvVP(6,6) 
Complex(dp) :: AmpTreeSvToSvVP(2,6,6),AmpWaveSvToSvVP(2,6,6)=(0._dp,0._dp),AmpVertexSvToSvVP(2,6,6)& 
 & ,AmpVertexIRosSvToSvVP(2,6,6),AmpVertexIRdrSvToSvVP(2,6,6), AmpSumSvToSvVP(2,6,6), AmpSum2SvToSvVP(2,6,6) 
Complex(dp) :: AmpTreeZSvToSvVP(2,6,6),AmpWaveZSvToSvVP(2,6,6),AmpVertexZSvToSvVP(2,6,6) 
Real(dp) :: AmpSqSvToSvVP(6,6),  AmpSqTreeSvToSvVP(6,6) 
Write(*,*) "Calculating one-loop decays of Sv " 
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
! Sv Ah
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_SvToSvAh(cplAhSvcSv,MAh,MSv,MAh2,MSv2,AmpTreeSvToSvAh)

  Else 
Call Amplitude_Tree_sec_UMSSM_SvToSvAh(ZcplAhSvcSv,MAh,MSv,MAh2,MSv2,AmpTreeSvToSvAh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_SvToSvAh(MLambda,em,gs,cplAhSvcSv,MAhOS,MSvOS,              & 
& MRPSvToSvAh,MRGSvToSvAh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_SvToSvAh(MLambda,em,gs,ZcplAhSvcSv,MAhOS,MSvOS,             & 
& MRPSvToSvAh,MRGSvToSvAh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_SvToSvAh(MLambda,em,gs,cplAhSvcSv,MAh,MSv,MRPSvToSvAh,      & 
& MRGSvToSvAh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_SvToSvAh(MLambda,em,gs,ZcplAhSvcSv,MAh,MSv,MRPSvToSvAh,     & 
& MRGSvToSvAh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_SvToSvAh(cplAhSvcSv,ctcplAhSvcSv,MAh,MAh2,              & 
& MSv,MSv2,ZfAh,ZfSv,AmpWaveSvToSvAh)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_SvToSvAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSd2,              & 
& MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,       & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcFeChaSvL,cplcFeChaSvR,cplChiFvcSvL,             & 
& cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcChaFecSvL,cplcChaFecSvR,cplhhSvcSv,         & 
& cplHpmSvcSe,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,              & 
& cplAhAhSvcSv1,cplAhhhSvcSv1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,cplhhhhSvcSv1,              & 
& cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,cplSeSvcSecSv1,cplSuSvcSucSvaa,cplSvSvcSvcSv1,        & 
& AmpVertexSvToSvAh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSvAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSd2,              & 
& MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,       & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcFeChaSvL,cplcFeChaSvR,cplChiFvcSvL,             & 
& cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcChaFecSvL,cplcChaFecSvR,cplhhSvcSv,         & 
& cplHpmSvcSe,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,              & 
& cplAhAhSvcSv1,cplAhhhSvcSv1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,cplhhhhSvcSv1,              & 
& cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,cplSeSvcSecSv1,cplSuSvcSucSvaa,cplSvSvcSvcSv1,        & 
& AmpVertexIRdrSvToSvAh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSvAh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,               & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVWm2OS,              & 
& MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,           & 
& cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,      & 
& cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,ZcplAhSvcSv,     & 
& cplAhcHpmVWm,cplcFeChaSvL,cplcFeChaSvR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaFecSvL,cplcChaFecSvR,cplhhSvcSv,cplHpmSvcSe,cplSecHpmcSv,          & 
& cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,cplAhAhSvcSv1,cplAhhhSvcSv1,           & 
& cplAhHpmSvcSe1,cplAhSecHpmcSv1,cplhhhhSvcSv1,cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,         & 
& cplSeSvcSecSv1,cplSuSvcSucSvaa,cplSvSvcSvcSv1,AmpVertexIRosSvToSvAh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSvAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSd2,              & 
& MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,       & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,ZcplAhSvcSv,cplAhcHpmVWm,cplcFeChaSvL,cplcFeChaSvR,cplChiFvcSvL,            & 
& cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcChaFecSvL,cplcChaFecSvR,cplhhSvcSv,         & 
& cplHpmSvcSe,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,              & 
& cplAhAhSvcSv1,cplAhhhSvcSv1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,cplhhhhSvcSv1,              & 
& cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,cplSeSvcSecSv1,cplSuSvcSucSvaa,cplSvSvcSvcSv1,        & 
& AmpVertexIRosSvToSvAh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSvAh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,               & 
& MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,MVWm2OS,              & 
& MVZ2OS,MVZp2OS,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,           & 
& cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,      & 
& cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,      & 
& cplAhcHpmVWm,cplcFeChaSvL,cplcFeChaSvR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaFecSvL,cplcChaFecSvR,cplhhSvcSv,cplHpmSvcSe,cplSecHpmcSv,          & 
& cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,cplAhAhSvcSv1,cplAhhhSvcSv1,           & 
& cplAhHpmSvcSe1,cplAhSecHpmcSv1,cplhhhhSvcSv1,cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,         & 
& cplSeSvcSecSv1,cplSuSvcSucSvaa,cplSvSvcSvcSv1,AmpVertexIRosSvToSvAh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSvAh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSd2,              & 
& MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,       & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcFeChaSvL,cplcFeChaSvR,cplChiFvcSvL,             & 
& cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcChaFecSvL,cplcChaFecSvR,cplhhSvcSv,         & 
& cplHpmSvcSe,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,              & 
& cplAhAhSvcSv1,cplAhhhSvcSv1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,cplhhhhSvcSv1,              & 
& cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,cplSeSvcSecSv1,cplSuSvcSucSvaa,cplSvSvcSvcSv1,        & 
& AmpVertexIRosSvToSvAh)

 End if 
 End if 
AmpVertexSvToSvAh = AmpVertexSvToSvAh -  AmpVertexIRdrSvToSvAh! +  AmpVertexIRosSvToSvAh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvToSvAh=0._dp 
AmpVertexZSvToSvAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvToSvAh(gt2,:,:) = AmpWaveZSvToSvAh(gt2,:,:)+ZRUZVc(gt2,gt1)*AmpWaveSvToSvAh(gt1,:,:) 
AmpVertexZSvToSvAh(gt2,:,:)= AmpVertexZSvToSvAh(gt2,:,:) + ZRUZVc(gt2,gt1)*AmpVertexSvToSvAh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSvToSvAh=AmpWaveZSvToSvAh 
AmpVertexSvToSvAh= AmpVertexZSvToSvAh
! Final State 1 
AmpWaveZSvToSvAh=0._dp 
AmpVertexZSvToSvAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvToSvAh(:,gt2,:) = AmpWaveZSvToSvAh(:,gt2,:)+ZRUZV(gt2,gt1)*AmpWaveSvToSvAh(:,gt1,:) 
AmpVertexZSvToSvAh(:,gt2,:)= AmpVertexZSvToSvAh(:,gt2,:)+ZRUZV(gt2,gt1)*AmpVertexSvToSvAh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvToSvAh=AmpWaveZSvToSvAh 
AmpVertexSvToSvAh= AmpVertexZSvToSvAh
! Final State 2 
AmpWaveZSvToSvAh=0._dp 
AmpVertexZSvToSvAh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvToSvAh(:,:,gt2) = AmpWaveZSvToSvAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpWaveSvToSvAh(:,:,gt1) 
AmpVertexZSvToSvAh(:,:,gt2)= AmpVertexZSvToSvAh(:,:,gt2)+ZRUZA(gt2,gt1)*AmpVertexSvToSvAh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvToSvAh=AmpWaveZSvToSvAh 
AmpVertexSvToSvAh= AmpVertexZSvToSvAh
End if
If (ShiftIRdiv) Then 
AmpVertexSvToSvAh = AmpVertexSvToSvAh  +  AmpVertexIRosSvToSvAh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Sv->Sv Ah -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvToSvAh = AmpTreeSvToSvAh 
 AmpSum2SvToSvAh = AmpTreeSvToSvAh + 2._dp*AmpWaveSvToSvAh + 2._dp*AmpVertexSvToSvAh  
Else 
 AmpSumSvToSvAh = AmpTreeSvToSvAh + AmpWaveSvToSvAh + AmpVertexSvToSvAh
 AmpSum2SvToSvAh = AmpTreeSvToSvAh + AmpWaveSvToSvAh + AmpVertexSvToSvAh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvToSvAh = AmpTreeSvToSvAh
 AmpSum2SvToSvAh = AmpTreeSvToSvAh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=3,6
If (((OSkinematics).and.(Abs(MSvOS(gt1)).gt.(Abs(MSvOS(gt2))+Abs(MAhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSv(gt1)).gt.(Abs(MSv(gt2))+Abs(MAh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvToSvAh = AmpTreeSvToSvAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvOS(gt1),MSvOS(gt2),MAhOS(gt3),AmpSumSvToSvAh(gt1, gt2, gt3),AmpSum2SvToSvAh(gt1, gt2, gt3),AmpSqSvToSvAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSv(gt1),MSv(gt2),MAh(gt3),AmpSumSvToSvAh(gt1, gt2, gt3),AmpSum2SvToSvAh(gt1, gt2, gt3),AmpSqSvToSvAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvToSvAh(gt1, gt2, gt3) 
  AmpSum2SvToSvAh = 2._dp*AmpWaveSvToSvAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvOS(gt1),MSvOS(gt2),MAhOS(gt3),AmpSumSvToSvAh(gt1, gt2, gt3),AmpSum2SvToSvAh(gt1, gt2, gt3),AmpSqSvToSvAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSv(gt1),MSv(gt2),MAh(gt3),AmpSumSvToSvAh(gt1, gt2, gt3),AmpSum2SvToSvAh(gt1, gt2, gt3),AmpSqSvToSvAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvToSvAh(gt1, gt2, gt3) 
  AmpSum2SvToSvAh = 2._dp*AmpVertexSvToSvAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvOS(gt1),MSvOS(gt2),MAhOS(gt3),AmpSumSvToSvAh(gt1, gt2, gt3),AmpSum2SvToSvAh(gt1, gt2, gt3),AmpSqSvToSvAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSv(gt1),MSv(gt2),MAh(gt3),AmpSumSvToSvAh(gt1, gt2, gt3),AmpSum2SvToSvAh(gt1, gt2, gt3),AmpSqSvToSvAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvToSvAh(gt1, gt2, gt3) 
  AmpSum2SvToSvAh = AmpTreeSvToSvAh + 2._dp*AmpWaveSvToSvAh + 2._dp*AmpVertexSvToSvAh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvOS(gt1),MSvOS(gt2),MAhOS(gt3),AmpSumSvToSvAh(gt1, gt2, gt3),AmpSum2SvToSvAh(gt1, gt2, gt3),AmpSqSvToSvAh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSv(gt1),MSv(gt2),MAh(gt3),AmpSumSvToSvAh(gt1, gt2, gt3),AmpSum2SvToSvAh(gt1, gt2, gt3),AmpSqSvToSvAh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvToSvAh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvToSvAh = AmpTreeSvToSvAh
  Call SquareAmp_StoSS(MSvOS(gt1),MSvOS(gt2),MAhOS(gt3),AmpSumSvToSvAh(gt1, gt2, gt3),AmpSum2SvToSvAh(gt1, gt2, gt3),AmpSqSvToSvAh(gt1, gt2, gt3)) 
  AmpSqTreeSvToSvAh(gt1, gt2, gt3) = AmpSqSvToSvAh(gt1, gt2, gt3)  
  AmpSum2SvToSvAh = + 2._dp*AmpWaveSvToSvAh + 2._dp*AmpVertexSvToSvAh
  Call SquareAmp_StoSS(MSvOS(gt1),MSvOS(gt2),MAhOS(gt3),AmpSumSvToSvAh(gt1, gt2, gt3),AmpSum2SvToSvAh(gt1, gt2, gt3),AmpSqSvToSvAh(gt1, gt2, gt3)) 
  AmpSqSvToSvAh(gt1, gt2, gt3) = AmpSqSvToSvAh(gt1, gt2, gt3) + AmpSqTreeSvToSvAh(gt1, gt2, gt3)  
Else  
  AmpSum2SvToSvAh = AmpTreeSvToSvAh
  Call SquareAmp_StoSS(MSv(gt1),MSv(gt2),MAh(gt3),AmpSumSvToSvAh(gt1, gt2, gt3),AmpSum2SvToSvAh(gt1, gt2, gt3),AmpSqSvToSvAh(gt1, gt2, gt3)) 
  AmpSqTreeSvToSvAh(gt1, gt2, gt3) = AmpSqSvToSvAh(gt1, gt2, gt3)  
  AmpSum2SvToSvAh = + 2._dp*AmpWaveSvToSvAh + 2._dp*AmpVertexSvToSvAh
  Call SquareAmp_StoSS(MSv(gt1),MSv(gt2),MAh(gt3),AmpSumSvToSvAh(gt1, gt2, gt3),AmpSum2SvToSvAh(gt1, gt2, gt3),AmpSqSvToSvAh(gt1, gt2, gt3)) 
  AmpSqSvToSvAh(gt1, gt2, gt3) = AmpSqSvToSvAh(gt1, gt2, gt3) + AmpSqTreeSvToSvAh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvToSvAh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvToSvAh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSv(gt1,i4) = 1._dp*GammaTPS(MSvOS(gt1),MSvOS(gt2),MAhOS(gt3),helfactor*AmpSqSvToSvAh(gt1, gt2, gt3))
Else 
  gP1LSv(gt1,i4) = 1._dp*GammaTPS(MSv(gt1),MSv(gt2),MAh(gt3),helfactor*AmpSqSvToSvAh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvToSvAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvToSvAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSv(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvToSvAh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvToSvAh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSvToSvAh(gt1, gt2, gt3) + MRGSvToSvAh(gt1, gt2, gt3)) 
  gP1LSv(gt1,i4) = gP1LSv(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSvToSvAh(gt1, gt2, gt3) + MRGSvToSvAh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSv(gt1,i4) 
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
! Fv Chi
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_SvToFvChi(cplChiFvcSvL,cplChiFvcSvR,MChi,               & 
& MFv,MSv,MChi2,MFv2,MSv2,AmpTreeSvToFvChi)

  Else 
Call Amplitude_Tree_sec_UMSSM_SvToFvChi(ZcplChiFvcSvL,ZcplChiFvcSvR,MChi,             & 
& MFv,MSv,MChi2,MFv2,MSv2,AmpTreeSvToFvChi)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_SvToFvChi(MLambda,em,gs,cplChiFvcSvL,cplChiFvcSvR,          & 
& MChiOS,MFvOS,MSvOS,MRPSvToFvChi,MRGSvToFvChi)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_SvToFvChi(MLambda,em,gs,ZcplChiFvcSvL,ZcplChiFvcSvR,        & 
& MChiOS,MFvOS,MSvOS,MRPSvToFvChi,MRGSvToFvChi)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_SvToFvChi(MLambda,em,gs,cplChiFvcSvL,cplChiFvcSvR,          & 
& MChi,MFv,MSv,MRPSvToFvChi,MRGSvToFvChi)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_SvToFvChi(MLambda,em,gs,ZcplChiFvcSvL,ZcplChiFvcSvR,        & 
& MChi,MFv,MSv,MRPSvToFvChi,MRGSvToFvChi)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_SvToFvChi(cplChiFvcSvL,cplChiFvcSvR,ctcplChiFvcSvL,     & 
& ctcplChiFvcSvR,MChi,MChi2,MFv,MFv2,MSv,MSv2,ZfFVL,ZfFVR,ZfL0,ZfSv,AmpWaveSvToFvChi)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_SvToFvChi(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,MVWm2,           & 
& MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhSvcSv,               & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,              & 
& cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,       & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,           & 
& cplcFvFvVZpR,cplhhSvcSv,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,              & 
& AmpVertexSvToFvChi)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToFvChi(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,            & 
& MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhSvcSv,         & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,              & 
& cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,       & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,           & 
& cplcFvFvVZpR,cplhhSvcSv,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,              & 
& AmpVertexIRdrSvToFvChi)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToFvChi(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,             & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplChiChiAhL,        & 
& cplChiChiAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhSvcSv,cplChiChacHpmL,cplChiChacHpmR,         & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,cplChaFvcSeR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,       & 
& ZcplChiFvcSvL,ZcplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,   & 
& cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,   & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,           & 
& cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,cplhhSvcSv,cplSecHpmcSv,             & 
& cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,AmpVertexIRosSvToFvChi)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToFvChi(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,            & 
& MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhSvcSv,         & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,              & 
& cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,ZcplChiFvcSvL,ZcplChiFvcSvR,cplcChaChiHpmL,    & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,       & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,           & 
& cplcFvFvVZpR,cplhhSvcSv,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,              & 
& AmpVertexIRosSvToFvChi)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToFvChi(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,             & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplChiChiAhL,        & 
& cplChiChiAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhSvcSv,cplChiChacHpmL,cplChiChacHpmR,         & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,cplChaFvcSeR,cplChiChihhL,cplChiChihhR,     & 
& cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,       & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,   & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,           & 
& cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,cplcFvFvVZpR,cplhhSvcSv,cplSecHpmcSv,             & 
& cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,AmpVertexIRosSvToFvChi)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToFvChi(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,            & 
& MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhSvcSv,         & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,              & 
& cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,       & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,           & 
& cplcFvFvVZpR,cplhhSvcSv,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,              & 
& AmpVertexIRosSvToFvChi)

 End if 
 End if 
AmpVertexSvToFvChi = AmpVertexSvToFvChi -  AmpVertexIRdrSvToFvChi! +  AmpVertexIRosSvToFvChi ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvToFvChi=0._dp 
AmpVertexZSvToFvChi=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvToFvChi(:,gt2,:,:) = AmpWaveZSvToFvChi(:,gt2,:,:)+ZRUZVc(gt2,gt1)*AmpWaveSvToFvChi(:,gt1,:,:) 
AmpVertexZSvToFvChi(:,gt2,:,:)= AmpVertexZSvToFvChi(:,gt2,:,:) + ZRUZVc(gt2,gt1)*AmpVertexSvToFvChi(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveSvToFvChi=AmpWaveZSvToFvChi 
AmpVertexSvToFvChi= AmpVertexZSvToFvChi
! Final State 1 
AmpWaveZSvToFvChi=0._dp 
AmpVertexZSvToFvChi=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZSvToFvChi(1,:,gt2,:) = AmpWaveZSvToFvChi(1,:,gt2,:)+ZRUZVL(gt2,gt1)*AmpWaveSvToFvChi(1,:,gt1,:) 
AmpVertexZSvToFvChi(1,:,gt2,:)= AmpVertexZSvToFvChi(1,:,gt2,:)+ZRUZVL(gt2,gt1)*AmpVertexSvToFvChi(1,:,gt1,:) 
AmpWaveZSvToFvChi(2,:,gt2,:) = AmpWaveZSvToFvChi(2,:,gt2,:)+ZRUZVRc(gt2,gt1)*AmpWaveSvToFvChi(2,:,gt1,:) 
AmpVertexZSvToFvChi(2,:,gt2,:)= AmpVertexZSvToFvChi(2,:,gt2,:)+ZRUZVRc(gt2,gt1)*AmpVertexSvToFvChi(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveSvToFvChi=AmpWaveZSvToFvChi 
AmpVertexSvToFvChi= AmpVertexZSvToFvChi
! Final State 2 
AmpWaveZSvToFvChi=0._dp 
AmpVertexZSvToFvChi=0._dp 
Do gt1=1,9
  Do gt2=1,9
AmpWaveZSvToFvChi(1,:,:,gt2) = AmpWaveZSvToFvChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveSvToFvChi(1,:,:,gt1) 
AmpVertexZSvToFvChi(1,:,:,gt2)= AmpVertexZSvToFvChi(1,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexSvToFvChi(1,:,:,gt1) 
AmpWaveZSvToFvChi(2,:,:,gt2) = AmpWaveZSvToFvChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpWaveSvToFvChi(2,:,:,gt1) 
AmpVertexZSvToFvChi(2,:,:,gt2)= AmpVertexZSvToFvChi(2,:,:,gt2)+ZRUZN(gt2,gt1)*AmpVertexSvToFvChi(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveSvToFvChi=AmpWaveZSvToFvChi 
AmpVertexSvToFvChi= AmpVertexZSvToFvChi
End if
If (ShiftIRdiv) Then 
AmpVertexSvToFvChi = AmpVertexSvToFvChi  +  AmpVertexIRosSvToFvChi
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Sv->Fv Chi -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvToFvChi = AmpTreeSvToFvChi 
 AmpSum2SvToFvChi = AmpTreeSvToFvChi + 2._dp*AmpWaveSvToFvChi + 2._dp*AmpVertexSvToFvChi  
Else 
 AmpSumSvToFvChi = AmpTreeSvToFvChi + AmpWaveSvToFvChi + AmpVertexSvToFvChi
 AmpSum2SvToFvChi = AmpTreeSvToFvChi + AmpWaveSvToFvChi + AmpVertexSvToFvChi 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvToFvChi = AmpTreeSvToFvChi
 AmpSum2SvToFvChi = AmpTreeSvToFvChi 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,3
    Do gt3=1,9
If (((OSkinematics).and.(Abs(MSvOS(gt1)).gt.(Abs(MFvOS(gt2))+Abs(MChiOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSv(gt1)).gt.(Abs(MFv(gt2))+Abs(MChi(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvToFvChi = AmpTreeSvToFvChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvToFvChi(:,gt1, gt2, gt3),AmpSum2SvToFvChi(:,gt1, gt2, gt3),AmpSqSvToFvChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSv(gt1),MFv(gt2),MChi(gt3),AmpSumSvToFvChi(:,gt1, gt2, gt3),AmpSum2SvToFvChi(:,gt1, gt2, gt3),AmpSqSvToFvChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvToFvChi(gt1, gt2, gt3) 
  AmpSum2SvToFvChi = 2._dp*AmpWaveSvToFvChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvToFvChi(:,gt1, gt2, gt3),AmpSum2SvToFvChi(:,gt1, gt2, gt3),AmpSqSvToFvChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSv(gt1),MFv(gt2),MChi(gt3),AmpSumSvToFvChi(:,gt1, gt2, gt3),AmpSum2SvToFvChi(:,gt1, gt2, gt3),AmpSqSvToFvChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvToFvChi(gt1, gt2, gt3) 
  AmpSum2SvToFvChi = 2._dp*AmpVertexSvToFvChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvToFvChi(:,gt1, gt2, gt3),AmpSum2SvToFvChi(:,gt1, gt2, gt3),AmpSqSvToFvChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSv(gt1),MFv(gt2),MChi(gt3),AmpSumSvToFvChi(:,gt1, gt2, gt3),AmpSum2SvToFvChi(:,gt1, gt2, gt3),AmpSqSvToFvChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvToFvChi(gt1, gt2, gt3) 
  AmpSum2SvToFvChi = AmpTreeSvToFvChi + 2._dp*AmpWaveSvToFvChi + 2._dp*AmpVertexSvToFvChi
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvToFvChi(:,gt1, gt2, gt3),AmpSum2SvToFvChi(:,gt1, gt2, gt3),AmpSqSvToFvChi(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSv(gt1),MFv(gt2),MChi(gt3),AmpSumSvToFvChi(:,gt1, gt2, gt3),AmpSum2SvToFvChi(:,gt1, gt2, gt3),AmpSqSvToFvChi(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvToFvChi(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvToFvChi = AmpTreeSvToFvChi
  Call SquareAmp_StoFF(MSvOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvToFvChi(:,gt1, gt2, gt3),AmpSum2SvToFvChi(:,gt1, gt2, gt3),AmpSqSvToFvChi(gt1, gt2, gt3)) 
  AmpSqTreeSvToFvChi(gt1, gt2, gt3) = AmpSqSvToFvChi(gt1, gt2, gt3)  
  AmpSum2SvToFvChi = + 2._dp*AmpWaveSvToFvChi + 2._dp*AmpVertexSvToFvChi
  Call SquareAmp_StoFF(MSvOS(gt1),MFvOS(gt2),MChiOS(gt3),AmpSumSvToFvChi(:,gt1, gt2, gt3),AmpSum2SvToFvChi(:,gt1, gt2, gt3),AmpSqSvToFvChi(gt1, gt2, gt3)) 
  AmpSqSvToFvChi(gt1, gt2, gt3) = AmpSqSvToFvChi(gt1, gt2, gt3) + AmpSqTreeSvToFvChi(gt1, gt2, gt3)  
Else  
  AmpSum2SvToFvChi = AmpTreeSvToFvChi
  Call SquareAmp_StoFF(MSv(gt1),MFv(gt2),MChi(gt3),AmpSumSvToFvChi(:,gt1, gt2, gt3),AmpSum2SvToFvChi(:,gt1, gt2, gt3),AmpSqSvToFvChi(gt1, gt2, gt3)) 
  AmpSqTreeSvToFvChi(gt1, gt2, gt3) = AmpSqSvToFvChi(gt1, gt2, gt3)  
  AmpSum2SvToFvChi = + 2._dp*AmpWaveSvToFvChi + 2._dp*AmpVertexSvToFvChi
  Call SquareAmp_StoFF(MSv(gt1),MFv(gt2),MChi(gt3),AmpSumSvToFvChi(:,gt1, gt2, gt3),AmpSum2SvToFvChi(:,gt1, gt2, gt3),AmpSqSvToFvChi(gt1, gt2, gt3)) 
  AmpSqSvToFvChi(gt1, gt2, gt3) = AmpSqSvToFvChi(gt1, gt2, gt3) + AmpSqTreeSvToFvChi(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvToFvChi(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqSvToFvChi(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSv(gt1,i4) = 1._dp*GammaTPS(MSvOS(gt1),MFvOS(gt2),MChiOS(gt3),helfactor*AmpSqSvToFvChi(gt1, gt2, gt3))
Else 
  gP1LSv(gt1,i4) = 1._dp*GammaTPS(MSv(gt1),MFv(gt2),MChi(gt3),helfactor*AmpSqSvToFvChi(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvToFvChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvToFvChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSv(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvToFvChi(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvToFvChi(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSvToFvChi(gt1, gt2, gt3) + MRGSvToFvChi(gt1, gt2, gt3)) 
  gP1LSv(gt1,i4) = gP1LSv(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSvToFvChi(gt1, gt2, gt3) + MRGSvToFvChi(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSv(gt1,i4) 
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
! bar(Cha) Fe
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_SvTocChaFe(cplcChaFecSvL,cplcChaFecSvR,MCha,            & 
& MFe,MSv,MCha2,MFe2,MSv2,AmpTreeSvTocChaFe)

  Else 
Call Amplitude_Tree_sec_UMSSM_SvTocChaFe(ZcplcChaFecSvL,ZcplcChaFecSvR,               & 
& MCha,MFe,MSv,MCha2,MFe2,MSv2,AmpTreeSvTocChaFe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_SvTocChaFe(MLambda,em,gs,cplcChaFecSvL,cplcChaFecSvR,       & 
& MChaOS,MFeOS,MSvOS,MRPSvTocChaFe,MRGSvTocChaFe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_SvTocChaFe(MLambda,em,gs,ZcplcChaFecSvL,ZcplcChaFecSvR,     & 
& MChaOS,MFeOS,MSvOS,MRPSvTocChaFe,MRGSvTocChaFe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_SvTocChaFe(MLambda,em,gs,cplcChaFecSvL,cplcChaFecSvR,       & 
& MCha,MFe,MSv,MRPSvTocChaFe,MRGSvTocChaFe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_SvTocChaFe(MLambda,em,gs,ZcplcChaFecSvL,ZcplcChaFecSvR,     & 
& MCha,MFe,MSv,MRPSvTocChaFe,MRGSvTocChaFe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_SvTocChaFe(cplcChaFecSvL,cplcChaFecSvR,ctcplcChaFecSvL, & 
& ctcplcChaFecSvR,MCha,MCha2,MFe,MFe2,MSv,MSv2,ZfFEL,ZfFER,ZfLm,ZfLp,ZfSv,               & 
& AmpWaveSvTocChaFe)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_SvTocChaFe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,             & 
& MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplAhSvcSv,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,    & 
& cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,              & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,     & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplhhSvcSv,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,       & 
& cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,AmpVertexSvTocChaFe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvTocChaFe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,        & 
& cplAhSvcSv,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,    & 
& cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,              & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,     & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplhhSvcSv,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,       & 
& cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,AmpVertexIRdrSvTocChaFe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvTocChaFe(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSvcSv,cplcChaChahhL,cplcChaChahhR,          & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,ZcplcChaFecSvL,ZcplcChaFecSvR,       & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhSvcSv,cplcChacFvSeL,      & 
& cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,AmpVertexIRosSvTocChaFe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvTocChaFe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,        & 
& cplAhSvcSv,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,    & 
& cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,              & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,ZcplcChaFecSvL,ZcplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,   & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplhhSvcSv,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,       & 
& cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,AmpVertexIRosSvTocChaFe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvTocChaFe(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplcChaChaAhL,  & 
& cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,cplAhSvcSv,cplcChaChahhL,cplcChaChahhR,          & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,         & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhSvcSv,cplcChacFvSeL,      & 
& cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,AmpVertexIRosSvTocChaFe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvTocChaFe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,cplcFeFeAhR,        & 
& cplAhSvcSv,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,      & 
& cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,    & 
& cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,              & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,     & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplhhSvcSv,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,       & 
& cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,AmpVertexIRosSvTocChaFe)

 End if 
 End if 
AmpVertexSvTocChaFe = AmpVertexSvTocChaFe -  AmpVertexIRdrSvTocChaFe! +  AmpVertexIRosSvTocChaFe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvTocChaFe=0._dp 
AmpVertexZSvTocChaFe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvTocChaFe(:,gt2,:,:) = AmpWaveZSvTocChaFe(:,gt2,:,:)+ZRUZVc(gt2,gt1)*AmpWaveSvTocChaFe(:,gt1,:,:) 
AmpVertexZSvTocChaFe(:,gt2,:,:)= AmpVertexZSvTocChaFe(:,gt2,:,:) + ZRUZVc(gt2,gt1)*AmpVertexSvTocChaFe(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveSvTocChaFe=AmpWaveZSvTocChaFe 
AmpVertexSvTocChaFe= AmpVertexZSvTocChaFe
! Final State 1 
AmpWaveZSvTocChaFe=0._dp 
AmpVertexZSvTocChaFe=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZSvTocChaFe(1,:,gt2,:) = AmpWaveZSvTocChaFe(1,:,gt2,:)+ZRUUP(gt2,gt1)*AmpWaveSvTocChaFe(1,:,gt1,:) 
AmpVertexZSvTocChaFe(1,:,gt2,:)= AmpVertexZSvTocChaFe(1,:,gt2,:)+ZRUUP(gt2,gt1)*AmpVertexSvTocChaFe(1,:,gt1,:) 
AmpWaveZSvTocChaFe(2,:,gt2,:) = AmpWaveZSvTocChaFe(2,:,gt2,:)+ZRUUMc(gt2,gt1)*AmpWaveSvTocChaFe(2,:,gt1,:) 
AmpVertexZSvTocChaFe(2,:,gt2,:)= AmpVertexZSvTocChaFe(2,:,gt2,:)+ZRUUMc(gt2,gt1)*AmpVertexSvTocChaFe(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveSvTocChaFe=AmpWaveZSvTocChaFe 
AmpVertexSvTocChaFe= AmpVertexZSvTocChaFe
! Final State 2 
AmpWaveZSvTocChaFe=0._dp 
AmpVertexZSvTocChaFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZSvTocChaFe(1,:,:,gt2) = AmpWaveZSvTocChaFe(1,:,:,gt2)+ZRUZEL(gt2,gt1)*AmpWaveSvTocChaFe(1,:,:,gt1) 
AmpVertexZSvTocChaFe(1,:,:,gt2)= AmpVertexZSvTocChaFe(1,:,:,gt2)+ZRUZEL(gt2,gt1)*AmpVertexSvTocChaFe(1,:,:,gt1) 
AmpWaveZSvTocChaFe(2,:,:,gt2) = AmpWaveZSvTocChaFe(2,:,:,gt2)+ZRUZER(gt2,gt1)*AmpWaveSvTocChaFe(2,:,:,gt1) 
AmpVertexZSvTocChaFe(2,:,:,gt2)= AmpVertexZSvTocChaFe(2,:,:,gt2)+ZRUZER(gt2,gt1)*AmpVertexSvTocChaFe(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveSvTocChaFe=AmpWaveZSvTocChaFe 
AmpVertexSvTocChaFe= AmpVertexZSvTocChaFe
End if
If (ShiftIRdiv) Then 
AmpVertexSvTocChaFe = AmpVertexSvTocChaFe  +  AmpVertexIRosSvTocChaFe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Sv->bar[Cha] Fe -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvTocChaFe = AmpTreeSvTocChaFe 
 AmpSum2SvTocChaFe = AmpTreeSvTocChaFe + 2._dp*AmpWaveSvTocChaFe + 2._dp*AmpVertexSvTocChaFe  
Else 
 AmpSumSvTocChaFe = AmpTreeSvTocChaFe + AmpWaveSvTocChaFe + AmpVertexSvTocChaFe
 AmpSum2SvTocChaFe = AmpTreeSvTocChaFe + AmpWaveSvTocChaFe + AmpVertexSvTocChaFe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvTocChaFe = AmpTreeSvTocChaFe
 AmpSum2SvTocChaFe = AmpTreeSvTocChaFe 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,2
    Do gt3=1,3
If (((OSkinematics).and.(Abs(MSvOS(gt1)).gt.(Abs(MChaOS(gt2))+Abs(MFeOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSv(gt1)).gt.(Abs(MCha(gt2))+Abs(MFe(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvTocChaFe = AmpTreeSvTocChaFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvOS(gt1),MChaOS(gt2),MFeOS(gt3),AmpSumSvTocChaFe(:,gt1, gt2, gt3),AmpSum2SvTocChaFe(:,gt1, gt2, gt3),AmpSqSvTocChaFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSv(gt1),MCha(gt2),MFe(gt3),AmpSumSvTocChaFe(:,gt1, gt2, gt3),AmpSum2SvTocChaFe(:,gt1, gt2, gt3),AmpSqSvTocChaFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvTocChaFe(gt1, gt2, gt3) 
  AmpSum2SvTocChaFe = 2._dp*AmpWaveSvTocChaFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvOS(gt1),MChaOS(gt2),MFeOS(gt3),AmpSumSvTocChaFe(:,gt1, gt2, gt3),AmpSum2SvTocChaFe(:,gt1, gt2, gt3),AmpSqSvTocChaFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSv(gt1),MCha(gt2),MFe(gt3),AmpSumSvTocChaFe(:,gt1, gt2, gt3),AmpSum2SvTocChaFe(:,gt1, gt2, gt3),AmpSqSvTocChaFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvTocChaFe(gt1, gt2, gt3) 
  AmpSum2SvTocChaFe = 2._dp*AmpVertexSvTocChaFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvOS(gt1),MChaOS(gt2),MFeOS(gt3),AmpSumSvTocChaFe(:,gt1, gt2, gt3),AmpSum2SvTocChaFe(:,gt1, gt2, gt3),AmpSqSvTocChaFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSv(gt1),MCha(gt2),MFe(gt3),AmpSumSvTocChaFe(:,gt1, gt2, gt3),AmpSum2SvTocChaFe(:,gt1, gt2, gt3),AmpSqSvTocChaFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvTocChaFe(gt1, gt2, gt3) 
  AmpSum2SvTocChaFe = AmpTreeSvTocChaFe + 2._dp*AmpWaveSvTocChaFe + 2._dp*AmpVertexSvTocChaFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MSvOS(gt1),MChaOS(gt2),MFeOS(gt3),AmpSumSvTocChaFe(:,gt1, gt2, gt3),AmpSum2SvTocChaFe(:,gt1, gt2, gt3),AmpSqSvTocChaFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MSv(gt1),MCha(gt2),MFe(gt3),AmpSumSvTocChaFe(:,gt1, gt2, gt3),AmpSum2SvTocChaFe(:,gt1, gt2, gt3),AmpSqSvTocChaFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvTocChaFe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvTocChaFe = AmpTreeSvTocChaFe
  Call SquareAmp_StoFF(MSvOS(gt1),MChaOS(gt2),MFeOS(gt3),AmpSumSvTocChaFe(:,gt1, gt2, gt3),AmpSum2SvTocChaFe(:,gt1, gt2, gt3),AmpSqSvTocChaFe(gt1, gt2, gt3)) 
  AmpSqTreeSvTocChaFe(gt1, gt2, gt3) = AmpSqSvTocChaFe(gt1, gt2, gt3)  
  AmpSum2SvTocChaFe = + 2._dp*AmpWaveSvTocChaFe + 2._dp*AmpVertexSvTocChaFe
  Call SquareAmp_StoFF(MSvOS(gt1),MChaOS(gt2),MFeOS(gt3),AmpSumSvTocChaFe(:,gt1, gt2, gt3),AmpSum2SvTocChaFe(:,gt1, gt2, gt3),AmpSqSvTocChaFe(gt1, gt2, gt3)) 
  AmpSqSvTocChaFe(gt1, gt2, gt3) = AmpSqSvTocChaFe(gt1, gt2, gt3) + AmpSqTreeSvTocChaFe(gt1, gt2, gt3)  
Else  
  AmpSum2SvTocChaFe = AmpTreeSvTocChaFe
  Call SquareAmp_StoFF(MSv(gt1),MCha(gt2),MFe(gt3),AmpSumSvTocChaFe(:,gt1, gt2, gt3),AmpSum2SvTocChaFe(:,gt1, gt2, gt3),AmpSqSvTocChaFe(gt1, gt2, gt3)) 
  AmpSqTreeSvTocChaFe(gt1, gt2, gt3) = AmpSqSvTocChaFe(gt1, gt2, gt3)  
  AmpSum2SvTocChaFe = + 2._dp*AmpWaveSvTocChaFe + 2._dp*AmpVertexSvTocChaFe
  Call SquareAmp_StoFF(MSv(gt1),MCha(gt2),MFe(gt3),AmpSumSvTocChaFe(:,gt1, gt2, gt3),AmpSum2SvTocChaFe(:,gt1, gt2, gt3),AmpSqSvTocChaFe(gt1, gt2, gt3)) 
  AmpSqSvTocChaFe(gt1, gt2, gt3) = AmpSqSvTocChaFe(gt1, gt2, gt3) + AmpSqTreeSvTocChaFe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvTocChaFe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqSvTocChaFe(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSv(gt1,i4) = 1._dp*GammaTPS(MSvOS(gt1),MChaOS(gt2),MFeOS(gt3),helfactor*AmpSqSvTocChaFe(gt1, gt2, gt3))
Else 
  gP1LSv(gt1,i4) = 1._dp*GammaTPS(MSv(gt1),MCha(gt2),MFe(gt3),helfactor*AmpSqSvTocChaFe(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvTocChaFe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvTocChaFe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSv(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvTocChaFe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvTocChaFe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSvTocChaFe(gt1, gt2, gt3) + MRGSvTocChaFe(gt1, gt2, gt3)) 
  gP1LSv(gt1,i4) = gP1LSv(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSvTocChaFe(gt1, gt2, gt3) + MRGSvTocChaFe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSv(gt1,i4) 
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
! Sv hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_SvToSvhh(cplhhSvcSv,Mhh,MSv,Mhh2,MSv2,AmpTreeSvToSvhh)

  Else 
Call Amplitude_Tree_sec_UMSSM_SvToSvhh(ZcplhhSvcSv,Mhh,MSv,Mhh2,MSv2,AmpTreeSvToSvhh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_SvToSvhh(MLambda,em,gs,cplhhSvcSv,MhhOS,MSvOS,              & 
& MRPSvToSvhh,MRGSvToSvhh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_SvToSvhh(MLambda,em,gs,ZcplhhSvcSv,MhhOS,MSvOS,             & 
& MRPSvToSvhh,MRGSvToSvhh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_SvToSvhh(MLambda,em,gs,cplhhSvcSv,Mhh,MSv,MRPSvToSvhh,      & 
& MRGSvToSvhh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_SvToSvhh(MLambda,em,gs,ZcplhhSvcSv,Mhh,MSv,MRPSvToSvhh,     & 
& MRGSvToSvhh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_SvToSvhh(cplhhSvcSv,ctcplhhSvcSv,Mhh,Mhh2,              & 
& MSv,MSv2,Zfhh,ZfSv,AmpWaveSvToSvhh)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_SvToSvhh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
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
& cplSvcSvVZpVZp1,AmpVertexSvToSvhh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSvhh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvcSvVZpVZp1,AmpVertexIRdrSvToSvhh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSvhh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,               & 
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
& AmpVertexIRosSvToSvhh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSvhh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSd2,              & 
& MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,              & 
& cplAhSvcSv,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,         & 
& cplChiChihhR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvhhL,cplcFvFvhhR,cplhhhhhh,             & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,ZcplhhSvcSv,cplhhcHpmVWm,   & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplSecHpmcSv,cplSecSvcVWm,   & 
& cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,cplAhAhSvcSv1,cplAhhhSvcSv1,cplhhhhSvcSv1,          & 
& cplhhHpmSvcSe1,cplhhSecHpmcSv1,cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,cplSeSvcSecSv1,        & 
& cplSuSvcSucSvaa,cplSvSvcSvcSv1,cplSvcSvcVWmVWm1,cplSvcSvVZVZ1,cplSvcSvVZVZp1,          & 
& cplSvcSvVZpVZp1,AmpVertexIRosSvToSvhh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSvhh(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,               & 
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
& AmpVertexIRosSvToSvhh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSvhh(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
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
& cplSvcSvVZpVZp1,AmpVertexIRosSvToSvhh)

 End if 
 End if 
AmpVertexSvToSvhh = AmpVertexSvToSvhh -  AmpVertexIRdrSvToSvhh! +  AmpVertexIRosSvToSvhh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvToSvhh=0._dp 
AmpVertexZSvToSvhh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvToSvhh(gt2,:,:) = AmpWaveZSvToSvhh(gt2,:,:)+ZRUZVc(gt2,gt1)*AmpWaveSvToSvhh(gt1,:,:) 
AmpVertexZSvToSvhh(gt2,:,:)= AmpVertexZSvToSvhh(gt2,:,:) + ZRUZVc(gt2,gt1)*AmpVertexSvToSvhh(gt1,:,:) 
 End Do 
End Do 
AmpWaveSvToSvhh=AmpWaveZSvToSvhh 
AmpVertexSvToSvhh= AmpVertexZSvToSvhh
! Final State 1 
AmpWaveZSvToSvhh=0._dp 
AmpVertexZSvToSvhh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvToSvhh(:,gt2,:) = AmpWaveZSvToSvhh(:,gt2,:)+ZRUZV(gt2,gt1)*AmpWaveSvToSvhh(:,gt1,:) 
AmpVertexZSvToSvhh(:,gt2,:)= AmpVertexZSvToSvhh(:,gt2,:)+ZRUZV(gt2,gt1)*AmpVertexSvToSvhh(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvToSvhh=AmpWaveZSvToSvhh 
AmpVertexSvToSvhh= AmpVertexZSvToSvhh
! Final State 2 
AmpWaveZSvToSvhh=0._dp 
AmpVertexZSvToSvhh=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvToSvhh(:,:,gt2) = AmpWaveZSvToSvhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveSvToSvhh(:,:,gt1) 
AmpVertexZSvToSvhh(:,:,gt2)= AmpVertexZSvToSvhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexSvToSvhh(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvToSvhh=AmpWaveZSvToSvhh 
AmpVertexSvToSvhh= AmpVertexZSvToSvhh
End if
If (ShiftIRdiv) Then 
AmpVertexSvToSvhh = AmpVertexSvToSvhh  +  AmpVertexIRosSvToSvhh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Sv->Sv hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvToSvhh = AmpTreeSvToSvhh 
 AmpSum2SvToSvhh = AmpTreeSvToSvhh + 2._dp*AmpWaveSvToSvhh + 2._dp*AmpVertexSvToSvhh  
Else 
 AmpSumSvToSvhh = AmpTreeSvToSvhh + AmpWaveSvToSvhh + AmpVertexSvToSvhh
 AmpSum2SvToSvhh = AmpTreeSvToSvhh + AmpWaveSvToSvhh + AmpVertexSvToSvhh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvToSvhh = AmpTreeSvToSvhh
 AmpSum2SvToSvhh = AmpTreeSvToSvhh 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MSvOS(gt1)).gt.(Abs(MSvOS(gt2))+Abs(MhhOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSv(gt1)).gt.(Abs(MSv(gt2))+Abs(Mhh(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvToSvhh = AmpTreeSvToSvhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvOS(gt1),MSvOS(gt2),MhhOS(gt3),AmpSumSvToSvhh(gt1, gt2, gt3),AmpSum2SvToSvhh(gt1, gt2, gt3),AmpSqSvToSvhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSv(gt1),MSv(gt2),Mhh(gt3),AmpSumSvToSvhh(gt1, gt2, gt3),AmpSum2SvToSvhh(gt1, gt2, gt3),AmpSqSvToSvhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvToSvhh(gt1, gt2, gt3) 
  AmpSum2SvToSvhh = 2._dp*AmpWaveSvToSvhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvOS(gt1),MSvOS(gt2),MhhOS(gt3),AmpSumSvToSvhh(gt1, gt2, gt3),AmpSum2SvToSvhh(gt1, gt2, gt3),AmpSqSvToSvhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSv(gt1),MSv(gt2),Mhh(gt3),AmpSumSvToSvhh(gt1, gt2, gt3),AmpSum2SvToSvhh(gt1, gt2, gt3),AmpSqSvToSvhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvToSvhh(gt1, gt2, gt3) 
  AmpSum2SvToSvhh = 2._dp*AmpVertexSvToSvhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvOS(gt1),MSvOS(gt2),MhhOS(gt3),AmpSumSvToSvhh(gt1, gt2, gt3),AmpSum2SvToSvhh(gt1, gt2, gt3),AmpSqSvToSvhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSv(gt1),MSv(gt2),Mhh(gt3),AmpSumSvToSvhh(gt1, gt2, gt3),AmpSum2SvToSvhh(gt1, gt2, gt3),AmpSqSvToSvhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvToSvhh(gt1, gt2, gt3) 
  AmpSum2SvToSvhh = AmpTreeSvToSvhh + 2._dp*AmpWaveSvToSvhh + 2._dp*AmpVertexSvToSvhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvOS(gt1),MSvOS(gt2),MhhOS(gt3),AmpSumSvToSvhh(gt1, gt2, gt3),AmpSum2SvToSvhh(gt1, gt2, gt3),AmpSqSvToSvhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSv(gt1),MSv(gt2),Mhh(gt3),AmpSumSvToSvhh(gt1, gt2, gt3),AmpSum2SvToSvhh(gt1, gt2, gt3),AmpSqSvToSvhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvToSvhh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvToSvhh = AmpTreeSvToSvhh
  Call SquareAmp_StoSS(MSvOS(gt1),MSvOS(gt2),MhhOS(gt3),AmpSumSvToSvhh(gt1, gt2, gt3),AmpSum2SvToSvhh(gt1, gt2, gt3),AmpSqSvToSvhh(gt1, gt2, gt3)) 
  AmpSqTreeSvToSvhh(gt1, gt2, gt3) = AmpSqSvToSvhh(gt1, gt2, gt3)  
  AmpSum2SvToSvhh = + 2._dp*AmpWaveSvToSvhh + 2._dp*AmpVertexSvToSvhh
  Call SquareAmp_StoSS(MSvOS(gt1),MSvOS(gt2),MhhOS(gt3),AmpSumSvToSvhh(gt1, gt2, gt3),AmpSum2SvToSvhh(gt1, gt2, gt3),AmpSqSvToSvhh(gt1, gt2, gt3)) 
  AmpSqSvToSvhh(gt1, gt2, gt3) = AmpSqSvToSvhh(gt1, gt2, gt3) + AmpSqTreeSvToSvhh(gt1, gt2, gt3)  
Else  
  AmpSum2SvToSvhh = AmpTreeSvToSvhh
  Call SquareAmp_StoSS(MSv(gt1),MSv(gt2),Mhh(gt3),AmpSumSvToSvhh(gt1, gt2, gt3),AmpSum2SvToSvhh(gt1, gt2, gt3),AmpSqSvToSvhh(gt1, gt2, gt3)) 
  AmpSqTreeSvToSvhh(gt1, gt2, gt3) = AmpSqSvToSvhh(gt1, gt2, gt3)  
  AmpSum2SvToSvhh = + 2._dp*AmpWaveSvToSvhh + 2._dp*AmpVertexSvToSvhh
  Call SquareAmp_StoSS(MSv(gt1),MSv(gt2),Mhh(gt3),AmpSumSvToSvhh(gt1, gt2, gt3),AmpSum2SvToSvhh(gt1, gt2, gt3),AmpSqSvToSvhh(gt1, gt2, gt3)) 
  AmpSqSvToSvhh(gt1, gt2, gt3) = AmpSqSvToSvhh(gt1, gt2, gt3) + AmpSqTreeSvToSvhh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvToSvhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvToSvhh(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSv(gt1,i4) = 1._dp*GammaTPS(MSvOS(gt1),MSvOS(gt2),MhhOS(gt3),helfactor*AmpSqSvToSvhh(gt1, gt2, gt3))
Else 
  gP1LSv(gt1,i4) = 1._dp*GammaTPS(MSv(gt1),MSv(gt2),Mhh(gt3),helfactor*AmpSqSvToSvhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvToSvhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvToSvhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSv(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvToSvhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvToSvhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSvToSvhh(gt1, gt2, gt3) + MRGSvToSvhh(gt1, gt2, gt3)) 
  gP1LSv(gt1,i4) = gP1LSv(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSvToSvhh(gt1, gt2, gt3) + MRGSvToSvhh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSv(gt1,i4) 
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
! Conjg(Hpm) Se
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_SvTocHpmSe(cplSecHpmcSv,MHpm,MSe,MSv,MHpm2,             & 
& MSe2,MSv2,AmpTreeSvTocHpmSe)

  Else 
Call Amplitude_Tree_sec_UMSSM_SvTocHpmSe(ZcplSecHpmcSv,MHpm,MSe,MSv,MHpm2,            & 
& MSe2,MSv2,AmpTreeSvTocHpmSe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_SvTocHpmSe(MLambda,em,gs,cplSecHpmcSv,MHpmOS,               & 
& MSeOS,MSvOS,MRPSvTocHpmSe,MRGSvTocHpmSe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_SvTocHpmSe(MLambda,em,gs,ZcplSecHpmcSv,MHpmOS,              & 
& MSeOS,MSvOS,MRPSvTocHpmSe,MRGSvTocHpmSe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_SvTocHpmSe(MLambda,em,gs,cplSecHpmcSv,MHpm,MSe,             & 
& MSv,MRPSvTocHpmSe,MRGSvTocHpmSe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_SvTocHpmSe(MLambda,em,gs,ZcplSecHpmcSv,MHpm,MSe,            & 
& MSv,MRPSvTocHpmSe,MRGSvTocHpmSe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_SvTocHpmSe(cplSecHpmcSv,ctcplSecHpmcSv,MHpm,            & 
& MHpm2,MSe,MSe2,MSv,MSv2,ZfHpm,ZfSe,ZfSv,AmpWaveSvTocHpmSe)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_SvTocHpmSe(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,               & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcHpm,cplAhSecSe,cplAhSvcSv,          & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiFvcSvL,cplChiFvcSvR,cplcFeChiSeL,     & 
& cplcFeChiSeR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplhhHpmcHpm,     & 
& cplhhSecSe,cplhhSvcSv,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,            & 
& cplSdcHpmcSu,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,            & 
& cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVPVWm,cplcHpmVWmVZ,            & 
& cplcHpmVWmVZp,cplAhSecHpmcSv1,cplhhSecHpmcSv1,cplHpmSecHpmcSe1,cplHpmSvcHpmcSv1,       & 
& cplSeSucSdcSvaa,cplSeSvcSecSv1,cplSecSvcVWmVP1,cplSecSvcVWmVZ1,cplSecSvcVWmVZp1,       & 
& AmpVertexSvTocHpmSe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvTocHpmSe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcHpm,cplAhSecSe,cplAhSvcSv,          & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiFvcSvL,cplChiFvcSvR,cplcFeChiSeL,     & 
& cplcFeChiSeR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplhhHpmcHpm,     & 
& cplhhSecSe,cplhhSvcSv,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,            & 
& cplSdcHpmcSu,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,            & 
& cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVPVWm,cplcHpmVWmVZ,            & 
& cplcHpmVWmVZp,cplAhSecHpmcSv1,cplhhSecHpmcSv1,cplHpmSecHpmcSe1,cplHpmSvcHpmcSv1,       & 
& cplSeSucSdcSvaa,cplSeSvcSecSv1,cplSecSvcVWmVP1,cplSecSvcVWmVZ1,cplSecSvcVWmVZp1,       & 
& AmpVertexIRdrSvTocHpmSe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvTocHpmSe(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,             & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,              & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhHpmcHpm,cplAhSecSe,cplAhSvcSv,cplAhcHpmVWm,           & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiFvcSvL,cplChiFvcSvR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplhhHpmcHpm,cplhhSecSe,       & 
& cplhhSvcSv,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,cplSdcHpmcSu,          & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,ZcplSecHpmcSv,           & 
& cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,           & 
& cplAhSecHpmcSv1,cplhhSecHpmcSv1,cplHpmSecHpmcSe1,cplHpmSvcHpmcSv1,cplSeSucSdcSvaa,     & 
& cplSeSvcSecSv1,cplSecSvcVWmVP1,cplSecSvcVWmVZ1,cplSecSvcVWmVZp1,AmpVertexIRosSvTocHpmSe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvTocHpmSe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcHpm,cplAhSecSe,cplAhSvcSv,          & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiFvcSvL,cplChiFvcSvR,cplcFeChiSeL,     & 
& cplcFeChiSeR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplhhHpmcHpm,     & 
& cplhhSecSe,cplhhSvcSv,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,            & 
& cplSdcHpmcSu,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,            & 
& ZcplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVPVWm,cplcHpmVWmVZ,           & 
& cplcHpmVWmVZp,cplAhSecHpmcSv1,cplhhSecHpmcSv1,cplHpmSecHpmcSe1,cplHpmSvcHpmcSv1,       & 
& cplSeSucSdcSvaa,cplSeSvcSecSv1,cplSecSvcVWmVP1,cplSecSvcVWmVZ1,cplSecSvcVWmVZp1,       & 
& AmpVertexIRosSvTocHpmSe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvTocHpmSe(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSdOS,MSeOS,MSuOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,             & 
& MCha2OS,MChi2OS,MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSd2OS,MSe2OS,MSu2OS,MSv2OS,              & 
& MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhHpmcHpm,cplAhSecSe,cplAhSvcSv,cplAhcHpmVWm,           & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiFvcSvL,cplChiFvcSvR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplhhHpmcHpm,cplhhSecSe,       & 
& cplhhSvcSv,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,cplSdcHpmcSu,          & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,            & 
& cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVPVWm,cplcHpmVWmVZ,cplcHpmVWmVZp,           & 
& cplAhSecHpmcSv1,cplhhSecHpmcSv1,cplHpmSecHpmcSe1,cplHpmSvcHpmcSv1,cplSeSucSdcSvaa,     & 
& cplSeSvcSecSv1,cplSecSvcVWmVP1,cplSecSvcVWmVZ1,cplSecSvcVWmVZp1,AmpVertexIRosSvTocHpmSe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvTocHpmSe(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcHpm,cplAhSecSe,cplAhSvcSv,          & 
& cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiFvcSvL,cplChiFvcSvR,cplcFeChiSeL,     & 
& cplcFeChiSeR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplhhHpmcHpm,     & 
& cplhhSecSe,cplhhSvcSv,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,cplHpmcHpmVZp,            & 
& cplSdcHpmcSu,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,            & 
& cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVPVWm,cplcHpmVWmVZ,            & 
& cplcHpmVWmVZp,cplAhSecHpmcSv1,cplhhSecHpmcSv1,cplHpmSecHpmcSe1,cplHpmSvcHpmcSv1,       & 
& cplSeSucSdcSvaa,cplSeSvcSecSv1,cplSecSvcVWmVP1,cplSecSvcVWmVZ1,cplSecSvcVWmVZp1,       & 
& AmpVertexIRosSvTocHpmSe)

 End if 
 End if 
AmpVertexSvTocHpmSe = AmpVertexSvTocHpmSe -  AmpVertexIRdrSvTocHpmSe! +  AmpVertexIRosSvTocHpmSe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvTocHpmSe=0._dp 
AmpVertexZSvTocHpmSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvTocHpmSe(gt2,:,:) = AmpWaveZSvTocHpmSe(gt2,:,:)+ZRUZVc(gt2,gt1)*AmpWaveSvTocHpmSe(gt1,:,:) 
AmpVertexZSvTocHpmSe(gt2,:,:)= AmpVertexZSvTocHpmSe(gt2,:,:) + ZRUZVc(gt2,gt1)*AmpVertexSvTocHpmSe(gt1,:,:) 
 End Do 
End Do 
AmpWaveSvTocHpmSe=AmpWaveZSvTocHpmSe 
AmpVertexSvTocHpmSe= AmpVertexZSvTocHpmSe
! Final State 1 
AmpWaveZSvTocHpmSe=0._dp 
AmpVertexZSvTocHpmSe=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZSvTocHpmSe(:,gt2,:) = AmpWaveZSvTocHpmSe(:,gt2,:)+ZRUZP(gt2,gt1)*AmpWaveSvTocHpmSe(:,gt1,:) 
AmpVertexZSvTocHpmSe(:,gt2,:)= AmpVertexZSvTocHpmSe(:,gt2,:)+ZRUZP(gt2,gt1)*AmpVertexSvTocHpmSe(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvTocHpmSe=AmpWaveZSvTocHpmSe 
AmpVertexSvTocHpmSe= AmpVertexZSvTocHpmSe
! Final State 2 
AmpWaveZSvTocHpmSe=0._dp 
AmpVertexZSvTocHpmSe=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvTocHpmSe(:,:,gt2) = AmpWaveZSvTocHpmSe(:,:,gt2)+ZRUZE(gt2,gt1)*AmpWaveSvTocHpmSe(:,:,gt1) 
AmpVertexZSvTocHpmSe(:,:,gt2)= AmpVertexZSvTocHpmSe(:,:,gt2)+ZRUZE(gt2,gt1)*AmpVertexSvTocHpmSe(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvTocHpmSe=AmpWaveZSvTocHpmSe 
AmpVertexSvTocHpmSe= AmpVertexZSvTocHpmSe
End if
If (ShiftIRdiv) Then 
AmpVertexSvTocHpmSe = AmpVertexSvTocHpmSe  +  AmpVertexIRosSvTocHpmSe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Sv->conj[Hpm] Se -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvTocHpmSe = AmpTreeSvTocHpmSe 
 AmpSum2SvTocHpmSe = AmpTreeSvTocHpmSe + 2._dp*AmpWaveSvTocHpmSe + 2._dp*AmpVertexSvTocHpmSe  
Else 
 AmpSumSvTocHpmSe = AmpTreeSvTocHpmSe + AmpWaveSvTocHpmSe + AmpVertexSvTocHpmSe
 AmpSum2SvTocHpmSe = AmpTreeSvTocHpmSe + AmpWaveSvTocHpmSe + AmpVertexSvTocHpmSe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvTocHpmSe = AmpTreeSvTocHpmSe
 AmpSum2SvTocHpmSe = AmpTreeSvTocHpmSe 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=2,2
    Do gt3=1,6
If (((OSkinematics).and.(Abs(MSvOS(gt1)).gt.(Abs(MHpmOS(gt2))+Abs(MSeOS(gt3))))).or.((.not.OSkinematics).and.(Abs(MSv(gt1)).gt.(Abs(MHpm(gt2))+Abs(MSe(gt3)))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2SvTocHpmSe = AmpTreeSvTocHpmSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvOS(gt1),MHpmOS(gt2),MSeOS(gt3),AmpSumSvTocHpmSe(gt1, gt2, gt3),AmpSum2SvTocHpmSe(gt1, gt2, gt3),AmpSqSvTocHpmSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSv(gt1),MHpm(gt2),MSe(gt3),AmpSumSvTocHpmSe(gt1, gt2, gt3),AmpSum2SvTocHpmSe(gt1, gt2, gt3),AmpSqSvTocHpmSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvTocHpmSe(gt1, gt2, gt3) 
  AmpSum2SvTocHpmSe = 2._dp*AmpWaveSvTocHpmSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvOS(gt1),MHpmOS(gt2),MSeOS(gt3),AmpSumSvTocHpmSe(gt1, gt2, gt3),AmpSum2SvTocHpmSe(gt1, gt2, gt3),AmpSqSvTocHpmSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSv(gt1),MHpm(gt2),MSe(gt3),AmpSumSvTocHpmSe(gt1, gt2, gt3),AmpSum2SvTocHpmSe(gt1, gt2, gt3),AmpSqSvTocHpmSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvTocHpmSe(gt1, gt2, gt3) 
  AmpSum2SvTocHpmSe = 2._dp*AmpVertexSvTocHpmSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvOS(gt1),MHpmOS(gt2),MSeOS(gt3),AmpSumSvTocHpmSe(gt1, gt2, gt3),AmpSum2SvTocHpmSe(gt1, gt2, gt3),AmpSqSvTocHpmSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSv(gt1),MHpm(gt2),MSe(gt3),AmpSumSvTocHpmSe(gt1, gt2, gt3),AmpSum2SvTocHpmSe(gt1, gt2, gt3),AmpSqSvTocHpmSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvTocHpmSe(gt1, gt2, gt3) 
  AmpSum2SvTocHpmSe = AmpTreeSvTocHpmSe + 2._dp*AmpWaveSvTocHpmSe + 2._dp*AmpVertexSvTocHpmSe
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MSvOS(gt1),MHpmOS(gt2),MSeOS(gt3),AmpSumSvTocHpmSe(gt1, gt2, gt3),AmpSum2SvTocHpmSe(gt1, gt2, gt3),AmpSqSvTocHpmSe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MSv(gt1),MHpm(gt2),MSe(gt3),AmpSumSvTocHpmSe(gt1, gt2, gt3),AmpSum2SvTocHpmSe(gt1, gt2, gt3),AmpSqSvTocHpmSe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvTocHpmSe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvTocHpmSe = AmpTreeSvTocHpmSe
  Call SquareAmp_StoSS(MSvOS(gt1),MHpmOS(gt2),MSeOS(gt3),AmpSumSvTocHpmSe(gt1, gt2, gt3),AmpSum2SvTocHpmSe(gt1, gt2, gt3),AmpSqSvTocHpmSe(gt1, gt2, gt3)) 
  AmpSqTreeSvTocHpmSe(gt1, gt2, gt3) = AmpSqSvTocHpmSe(gt1, gt2, gt3)  
  AmpSum2SvTocHpmSe = + 2._dp*AmpWaveSvTocHpmSe + 2._dp*AmpVertexSvTocHpmSe
  Call SquareAmp_StoSS(MSvOS(gt1),MHpmOS(gt2),MSeOS(gt3),AmpSumSvTocHpmSe(gt1, gt2, gt3),AmpSum2SvTocHpmSe(gt1, gt2, gt3),AmpSqSvTocHpmSe(gt1, gt2, gt3)) 
  AmpSqSvTocHpmSe(gt1, gt2, gt3) = AmpSqSvTocHpmSe(gt1, gt2, gt3) + AmpSqTreeSvTocHpmSe(gt1, gt2, gt3)  
Else  
  AmpSum2SvTocHpmSe = AmpTreeSvTocHpmSe
  Call SquareAmp_StoSS(MSv(gt1),MHpm(gt2),MSe(gt3),AmpSumSvTocHpmSe(gt1, gt2, gt3),AmpSum2SvTocHpmSe(gt1, gt2, gt3),AmpSqSvTocHpmSe(gt1, gt2, gt3)) 
  AmpSqTreeSvTocHpmSe(gt1, gt2, gt3) = AmpSqSvTocHpmSe(gt1, gt2, gt3)  
  AmpSum2SvTocHpmSe = + 2._dp*AmpWaveSvTocHpmSe + 2._dp*AmpVertexSvTocHpmSe
  Call SquareAmp_StoSS(MSv(gt1),MHpm(gt2),MSe(gt3),AmpSumSvTocHpmSe(gt1, gt2, gt3),AmpSum2SvTocHpmSe(gt1, gt2, gt3),AmpSqSvTocHpmSe(gt1, gt2, gt3)) 
  AmpSqSvTocHpmSe(gt1, gt2, gt3) = AmpSqSvTocHpmSe(gt1, gt2, gt3) + AmpSqTreeSvTocHpmSe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqSvTocHpmSe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvTocHpmSe(gt1, gt2, gt3).eq.0._dp) Then 
  gP1LSv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSv(gt1,i4) = 1._dp*GammaTPS(MSvOS(gt1),MHpmOS(gt2),MSeOS(gt3),helfactor*AmpSqSvTocHpmSe(gt1, gt2, gt3))
Else 
  gP1LSv(gt1,i4) = 1._dp*GammaTPS(MSv(gt1),MHpm(gt2),MSe(gt3),helfactor*AmpSqSvTocHpmSe(gt1, gt2, gt3))
End if 
If ((Abs(MRPSvTocHpmSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvTocHpmSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSv(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvTocHpmSe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGSvTocHpmSe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPSvTocHpmSe(gt1, gt2, gt3) + MRGSvTocHpmSe(gt1, gt2, gt3)) 
  gP1LSv(gt1,i4) = gP1LSv(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPSvTocHpmSe(gt1, gt2, gt3) + MRGSvTocHpmSe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSv(gt1,i4) 
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
! Se Conjg(VWm)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_SvToSecVWm(cplSecSvcVWm,MSe,MSv,MVWm,MSe2,              & 
& MSv2,MVWm2,AmpTreeSvToSecVWm)

  Else 
Call Amplitude_Tree_sec_UMSSM_SvToSecVWm(ZcplSecSvcVWm,MSe,MSv,MVWm,MSe2,             & 
& MSv2,MVWm2,AmpTreeSvToSecVWm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_SvToSecVWm(MLambda,em,gs,cplSecSvcVWm,MSeOS,MSvOS,          & 
& MVWmOS,MRPSvToSecVWm,MRGSvToSecVWm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_SvToSecVWm(MLambda,em,gs,ZcplSecSvcVWm,MSeOS,               & 
& MSvOS,MVWmOS,MRPSvToSecVWm,MRGSvToSecVWm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_SvToSecVWm(MLambda,em,gs,cplSecSvcVWm,MSe,MSv,              & 
& MVWm,MRPSvToSecVWm,MRGSvToSecVWm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_SvToSecVWm(MLambda,em,gs,ZcplSecSvcVWm,MSe,MSv,             & 
& MVWm,MRPSvToSecVWm,MRGSvToSecVWm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_SvToSecVWm(cplSecSvcVWm,ctcplSecSvcVWm,MSe,             & 
& MSe2,MSv,MSv2,MVWm,MVWm2,ZfSe,ZfSv,ZfVWm,AmpWaveSvToSecVWm)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_SvToSecVWm(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,            & 
& MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,             & 
& MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcVWm,cplAhSecSe,cplAhSvcSv,cplChiChacVWmL,               & 
& cplChiChacVWmR,cplChiFvcSvL,cplChiFvcSvR,cplcFeChiSeL,cplcFeChiSeR,cplcChaFecSvL,      & 
& cplcChaFecSvR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,          & 
& cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSecSeVP,cplSecSeVZ,            & 
& cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,          & 
& cplSvcSvVZp,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplSecSvcVWmVP1,cplSecSecVWmVWm1,  & 
& cplSecSvcVWmVZ1,cplSecSvcVWmVZp1,cplSvcSvcVWmVWm1,AmpVertexSvToSecVWm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSecVWm(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcVWm,cplAhSecSe,cplAhSvcSv,cplChiChacVWmL,          & 
& cplChiChacVWmR,cplChiFvcSvL,cplChiFvcSvR,cplcFeChiSeL,cplcFeChiSeR,cplcChaFecSvL,      & 
& cplcChaFecSvR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,          & 
& cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSecSeVP,cplSecSeVZ,            & 
& cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,          & 
& cplSvcSvVZp,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplSecSvcVWmVP1,cplSecSecVWmVWm1,  & 
& cplSecSvcVWmVZ1,cplSecSvcVWmVZp1,cplSvcSvcVWmVWm1,AmpVertexIRdrSvToSecVWm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSecVWm(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhHpmcVWm,   & 
& cplAhSecSe,cplAhSvcSv,cplChiChacVWmL,cplChiChacVWmR,cplChiFvcSvL,cplChiFvcSvR,         & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecVWmL,cplcFvFecVWmR,     & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,cplhhcVWmVWm,GosZcplHpmcVWmVP,cplHpmcVWmVZ,         & 
& cplHpmcVWmVZp,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,           & 
& GosZcplSecHpmcSv,ZcplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,cplcVWmVPVWm,cplcVWmVWmVZ,       & 
& cplcVWmVWmVZp,cplSecSvcVWmVP1,cplSecSecVWmVWm1,cplSecSvcVWmVZ1,cplSecSvcVWmVZp1,       & 
& cplSvcSvcVWmVWm1,AmpVertexIRosSvToSecVWm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSecVWm(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcVWm,cplAhSecSe,cplAhSvcSv,cplChiChacVWmL,          & 
& cplChiChacVWmR,cplChiFvcSvL,cplChiFvcSvR,cplcFeChiSeL,cplcFeChiSeR,cplcChaFecSvL,      & 
& cplcChaFecSvR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,          & 
& cplhhcVWmVWm,GZcplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSecSeVP,cplSecSeVZ,          & 
& cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,GZcplSecHpmcSv,ZcplSecSvcVWm,cplSvcSvVZ,       & 
& cplSvcSvVZp,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplSecSvcVWmVP1,cplSecSecVWmVWm1,  & 
& cplSecSvcVWmVZ1,cplSecSvcVWmVZp1,cplSvcSvcVWmVWm1,AmpVertexIRosSvToSecVWm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSecVWm(MAhOS,MChaOS,MChiOS,MFeOS,              & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVP,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,         & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,MVZ2OS,MVZp2OS,cplAhHpmcVWm,   & 
& cplAhSecSe,cplAhSvcSv,cplChiChacVWmL,cplChiChacVWmR,cplChiFvcSvL,cplChiFvcSvR,         & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecVWmL,cplcFvFecVWmR,     & 
& cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,cplhhcVWmVWm,GcplHpmcVWmVP,cplHpmcVWmVZ,            & 
& cplHpmcVWmVZp,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,           & 
& GcplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,cplcVWmVPVWm,cplcVWmVWmVZ,           & 
& cplcVWmVWmVZp,cplSecSvcVWmVP1,cplSecSecVWmVWm1,cplSecSvcVWmVZ1,cplSecSvcVWmVZp1,       & 
& cplSvcSvcVWmVWm1,AmpVertexIRosSvToSecVWm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSecVWm(MAh,MCha,MChi,MFe,MFv,Mhh,              & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcVWm,cplAhSecSe,cplAhSvcSv,cplChiChacVWmL,          & 
& cplChiChacVWmR,cplChiFvcSvL,cplChiFvcSvR,cplcFeChiSeL,cplcFeChiSeR,cplcChaFecSvL,      & 
& cplcChaFecSvR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,          & 
& cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSecSeVP,cplSecSeVZ,            & 
& cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,          & 
& cplSvcSvVZp,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplSecSvcVWmVP1,cplSecSecVWmVWm1,  & 
& cplSecSvcVWmVZ1,cplSecSvcVWmVZp1,cplSvcSvcVWmVWm1,AmpVertexIRosSvToSecVWm)

 End if 
 End if 
AmpVertexSvToSecVWm = AmpVertexSvToSecVWm -  AmpVertexIRdrSvToSecVWm! +  AmpVertexIRosSvToSecVWm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvToSecVWm=0._dp 
AmpVertexZSvToSecVWm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvToSecVWm(:,gt2,:) = AmpWaveZSvToSecVWm(:,gt2,:)+ZRUZVc(gt2,gt1)*AmpWaveSvToSecVWm(:,gt1,:) 
AmpVertexZSvToSecVWm(:,gt2,:)= AmpVertexZSvToSecVWm(:,gt2,:) + ZRUZVc(gt2,gt1)*AmpVertexSvToSecVWm(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvToSecVWm=AmpWaveZSvToSecVWm 
AmpVertexSvToSecVWm= AmpVertexZSvToSecVWm
! Final State 1 
AmpWaveZSvToSecVWm=0._dp 
AmpVertexZSvToSecVWm=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvToSecVWm(:,:,gt2) = AmpWaveZSvToSecVWm(:,:,gt2)+ZRUZE(gt2,gt1)*AmpWaveSvToSecVWm(:,:,gt1) 
AmpVertexZSvToSecVWm(:,:,gt2)= AmpVertexZSvToSecVWm(:,:,gt2)+ZRUZE(gt2,gt1)*AmpVertexSvToSecVWm(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvToSecVWm=AmpWaveZSvToSecVWm 
AmpVertexSvToSecVWm= AmpVertexZSvToSecVWm
End if
If (ShiftIRdiv) Then 
AmpVertexSvToSecVWm = AmpVertexSvToSecVWm  +  AmpVertexIRosSvToSecVWm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Sv->Se conj[VWm] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvToSecVWm = AmpTreeSvToSecVWm 
 AmpSum2SvToSecVWm = AmpTreeSvToSecVWm + 2._dp*AmpWaveSvToSecVWm + 2._dp*AmpVertexSvToSecVWm  
Else 
 AmpSumSvToSecVWm = AmpTreeSvToSecVWm + AmpWaveSvToSecVWm + AmpVertexSvToSecVWm
 AmpSum2SvToSecVWm = AmpTreeSvToSecVWm + AmpWaveSvToSecVWm + AmpVertexSvToSecVWm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvToSecVWm = AmpTreeSvToSecVWm
 AmpSum2SvToSecVWm = AmpTreeSvToSecVWm 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSvOS(gt1)).gt.(Abs(MSeOS(gt2))+Abs(MVWmOS)))).or.((.not.OSkinematics).and.(Abs(MSv(gt1)).gt.(Abs(MSe(gt2))+Abs(MVWm))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SvToSecVWm = AmpTreeSvToSecVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvToSecVWm(:,gt1, gt2),AmpSum2SvToSecVWm(:,gt1, gt2),AmpSqSvToSecVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSv(gt1),MSe(gt2),MVWm,AmpSumSvToSecVWm(:,gt1, gt2),AmpSum2SvToSecVWm(:,gt1, gt2),AmpSqSvToSecVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvToSecVWm(gt1, gt2) 
  AmpSum2SvToSecVWm = 2._dp*AmpWaveSvToSecVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvToSecVWm(:,gt1, gt2),AmpSum2SvToSecVWm(:,gt1, gt2),AmpSqSvToSecVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSv(gt1),MSe(gt2),MVWm,AmpSumSvToSecVWm(:,gt1, gt2),AmpSum2SvToSecVWm(:,gt1, gt2),AmpSqSvToSecVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvToSecVWm(gt1, gt2) 
  AmpSum2SvToSecVWm = 2._dp*AmpVertexSvToSecVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvToSecVWm(:,gt1, gt2),AmpSum2SvToSecVWm(:,gt1, gt2),AmpSqSvToSecVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSv(gt1),MSe(gt2),MVWm,AmpSumSvToSecVWm(:,gt1, gt2),AmpSum2SvToSecVWm(:,gt1, gt2),AmpSqSvToSecVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvToSecVWm(gt1, gt2) 
  AmpSum2SvToSecVWm = AmpTreeSvToSecVWm + 2._dp*AmpWaveSvToSecVWm + 2._dp*AmpVertexSvToSecVWm
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvToSecVWm(:,gt1, gt2),AmpSum2SvToSecVWm(:,gt1, gt2),AmpSqSvToSecVWm(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSv(gt1),MSe(gt2),MVWm,AmpSumSvToSecVWm(:,gt1, gt2),AmpSum2SvToSecVWm(:,gt1, gt2),AmpSqSvToSecVWm(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvToSecVWm(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvToSecVWm = AmpTreeSvToSecVWm
  Call SquareAmp_StoSV(MSvOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvToSecVWm(:,gt1, gt2),AmpSum2SvToSecVWm(:,gt1, gt2),AmpSqSvToSecVWm(gt1, gt2)) 
  AmpSqTreeSvToSecVWm(gt1, gt2) = AmpSqSvToSecVWm(gt1, gt2)  
  AmpSum2SvToSecVWm = + 2._dp*AmpWaveSvToSecVWm + 2._dp*AmpVertexSvToSecVWm
  Call SquareAmp_StoSV(MSvOS(gt1),MSeOS(gt2),MVWmOS,AmpSumSvToSecVWm(:,gt1, gt2),AmpSum2SvToSecVWm(:,gt1, gt2),AmpSqSvToSecVWm(gt1, gt2)) 
  AmpSqSvToSecVWm(gt1, gt2) = AmpSqSvToSecVWm(gt1, gt2) + AmpSqTreeSvToSecVWm(gt1, gt2)  
Else  
  AmpSum2SvToSecVWm = AmpTreeSvToSecVWm
  Call SquareAmp_StoSV(MSv(gt1),MSe(gt2),MVWm,AmpSumSvToSecVWm(:,gt1, gt2),AmpSum2SvToSecVWm(:,gt1, gt2),AmpSqSvToSecVWm(gt1, gt2)) 
  AmpSqTreeSvToSecVWm(gt1, gt2) = AmpSqSvToSecVWm(gt1, gt2)  
  AmpSum2SvToSecVWm = + 2._dp*AmpWaveSvToSecVWm + 2._dp*AmpVertexSvToSecVWm
  Call SquareAmp_StoSV(MSv(gt1),MSe(gt2),MVWm,AmpSumSvToSecVWm(:,gt1, gt2),AmpSum2SvToSecVWm(:,gt1, gt2),AmpSqSvToSecVWm(gt1, gt2)) 
  AmpSqSvToSecVWm(gt1, gt2) = AmpSqSvToSecVWm(gt1, gt2) + AmpSqTreeSvToSecVWm(gt1, gt2)  
End if  
Else  
  AmpSqSvToSecVWm(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvToSecVWm(gt1, gt2).eq.0._dp) Then 
  gP1LSv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSv(gt1,i4) = 1._dp*GammaTPS(MSvOS(gt1),MSeOS(gt2),MVWmOS,helfactor*AmpSqSvToSecVWm(gt1, gt2))
Else 
  gP1LSv(gt1,i4) = 1._dp*GammaTPS(MSv(gt1),MSe(gt2),MVWm,helfactor*AmpSqSvToSecVWm(gt1, gt2))
End if 
If ((Abs(MRPSvToSecVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvToSecVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSv(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvToSecVWm(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvToSecVWm(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSvToSecVWm(gt1, gt2) + MRGSvToSecVWm(gt1, gt2)) 
  gP1LSv(gt1,i4) = gP1LSv(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSvToSecVWm(gt1, gt2) + MRGSvToSecVWm(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSv(gt1,i4) 
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
! Sv VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_SvToSvVZ(cplSvcSvVZ,MSv,MVZ,MSv2,MVZ2,AmpTreeSvToSvVZ)

  Else 
Call Amplitude_Tree_sec_UMSSM_SvToSvVZ(ZcplSvcSvVZ,MSv,MVZ,MSv2,MVZ2,AmpTreeSvToSvVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_SvToSvVZ(MLambda,em,gs,cplSvcSvVZ,MSvOS,MVZOS,              & 
& MRPSvToSvVZ,MRGSvToSvVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_SvToSvVZ(MLambda,em,gs,ZcplSvcSvVZ,MSvOS,MVZOS,             & 
& MRPSvToSvVZ,MRGSvToSvVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_SvToSvVZ(MLambda,em,gs,cplSvcSvVZ,MSv,MVZ,MRPSvToSvVZ,      & 
& MRGSvToSvVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_SvToSvVZ(MLambda,em,gs,ZcplSvcSvVZ,MSv,MVZ,MRPSvToSvVZ,     & 
& MRGSvToSvVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_SvToSvVZ(cplSvcSvVZ,cplSvcSvVZp,ctcplSvcSvVZ,           & 
& ctcplSvcSvVZp,MSv,MSv2,MVZ,MVZ2,ZfSv,ZfVZ,ZfVZpVZ,AmpWaveSvToSvVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_SvToSvVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,              & 
& MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,MVWm2,           & 
& MVZ2,MVZp2,cplAhhhVZ,cplAhSvcSv,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,        & 
& cplcFvChiSvR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvVZL,          & 
& cplcFvFvVZR,cplhhSvcSv,cplhhVZVZ,cplhhVZVZp,cplHpmSvcSe,cplHpmcHpmVZ,cplHpmcVWmVZ,     & 
& cplSecSeVZ,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,               & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSvcVWmVZ1,cplSvcSeVWmVZ1,cplSvcSvVZVZ1,cplSvcSvVZVZp1, & 
& AmpVertexSvToSvVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSvVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,MVWm2,           & 
& MVZ2,MVZp2,cplAhhhVZ,cplAhSvcSv,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,        & 
& cplcFvChiSvR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvVZL,          & 
& cplcFvFvVZR,cplhhSvcSv,cplhhVZVZ,cplhhVZVZp,cplHpmSvcSe,cplHpmcHpmVZ,cplHpmcVWmVZ,     & 
& cplSecSeVZ,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,               & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSvcVWmVZ1,cplSvcSeVWmVZ1,cplSvcSvVZVZ1,cplSvcSvVZVZp1, & 
& AmpVertexIRdrSvToSvVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSvVZ(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSeOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFe2OS,            & 
& MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhhhVZ,cplAhSvcSv,       & 
& cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFeVZL,cplcFeFeVZR,           & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFvFvVZL,cplcFvFvVZR,cplhhSvcSv,cplhhVZVZ,              & 
& cplhhVZVZp,cplHpmSvcSe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSecSeVZ,cplSecHpmcSv,              & 
& cplSecSvcVWm,cplSvcSeVWm,ZcplSvcSvVZ,cplSvcSvVZp,cplcHpmVWmVZ,cplcVWmVWmVZ,            & 
& cplSecSvcVWmVZ1,cplSvcSeVWmVZ1,cplSvcSvVZVZ1,cplSvcSvVZVZp1,AmpVertexIRosSvToSvVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSvVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,MVWm2,           & 
& MVZ2,MVZp2,cplAhhhVZ,cplAhSvcSv,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,        & 
& cplcFvChiSvR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvVZL,          & 
& cplcFvFvVZR,cplhhSvcSv,cplhhVZVZ,cplhhVZVZp,cplHpmSvcSe,cplHpmcHpmVZ,cplHpmcVWmVZ,     & 
& cplSecSeVZ,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,ZcplSvcSvVZ,cplSvcSvVZp,              & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSvcVWmVZ1,cplSvcSeVWmVZ1,cplSvcSvVZVZ1,cplSvcSvVZVZp1, & 
& AmpVertexIRosSvToSvVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSvVZ(MAhOS,MChaOS,MChiOS,MFeOS,MFvOS,          & 
& MhhOS,MHpmOS,MSeOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,MFe2OS,            & 
& MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhhhVZ,cplAhSvcSv,       & 
& cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,       & 
& cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFeVZL,cplcFeFeVZR,           & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFvFvVZL,cplcFvFvVZR,cplhhSvcSv,cplhhVZVZ,              & 
& cplhhVZVZp,cplHpmSvcSe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSecSeVZ,cplSecHpmcSv,              & 
& cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVWmVZ,cplcVWmVWmVZ,             & 
& cplSecSvcVWmVZ1,cplSvcSeVWmVZ1,cplSvcSvVZVZ1,cplSvcSvVZVZp1,AmpVertexIRosSvToSvVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSvVZ(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,           & 
& MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,MVWm2,           & 
& MVZ2,MVZp2,cplAhhhVZ,cplAhSvcSv,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVZL,               & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,        & 
& cplcFvChiSvR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvVZL,          & 
& cplcFvFvVZR,cplhhSvcSv,cplhhVZVZ,cplhhVZVZp,cplHpmSvcSe,cplHpmcHpmVZ,cplHpmcVWmVZ,     & 
& cplSecSeVZ,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,               & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSvcVWmVZ1,cplSvcSeVWmVZ1,cplSvcSvVZVZ1,cplSvcSvVZVZp1, & 
& AmpVertexIRosSvToSvVZ)

 End if 
 End if 
AmpVertexSvToSvVZ = AmpVertexSvToSvVZ -  AmpVertexIRdrSvToSvVZ! +  AmpVertexIRosSvToSvVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvToSvVZ=0._dp 
AmpVertexZSvToSvVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvToSvVZ(:,gt2,:) = AmpWaveZSvToSvVZ(:,gt2,:)+ZRUZVc(gt2,gt1)*AmpWaveSvToSvVZ(:,gt1,:) 
AmpVertexZSvToSvVZ(:,gt2,:)= AmpVertexZSvToSvVZ(:,gt2,:) + ZRUZVc(gt2,gt1)*AmpVertexSvToSvVZ(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvToSvVZ=AmpWaveZSvToSvVZ 
AmpVertexSvToSvVZ= AmpVertexZSvToSvVZ
! Final State 1 
AmpWaveZSvToSvVZ=0._dp 
AmpVertexZSvToSvVZ=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvToSvVZ(:,:,gt2) = AmpWaveZSvToSvVZ(:,:,gt2)+ZRUZV(gt2,gt1)*AmpWaveSvToSvVZ(:,:,gt1) 
AmpVertexZSvToSvVZ(:,:,gt2)= AmpVertexZSvToSvVZ(:,:,gt2)+ZRUZV(gt2,gt1)*AmpVertexSvToSvVZ(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvToSvVZ=AmpWaveZSvToSvVZ 
AmpVertexSvToSvVZ= AmpVertexZSvToSvVZ
End if
If (ShiftIRdiv) Then 
AmpVertexSvToSvVZ = AmpVertexSvToSvVZ  +  AmpVertexIRosSvToSvVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Sv->Sv VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvToSvVZ = AmpTreeSvToSvVZ 
 AmpSum2SvToSvVZ = AmpTreeSvToSvVZ + 2._dp*AmpWaveSvToSvVZ + 2._dp*AmpVertexSvToSvVZ  
Else 
 AmpSumSvToSvVZ = AmpTreeSvToSvVZ + AmpWaveSvToSvVZ + AmpVertexSvToSvVZ
 AmpSum2SvToSvVZ = AmpTreeSvToSvVZ + AmpWaveSvToSvVZ + AmpVertexSvToSvVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvToSvVZ = AmpTreeSvToSvVZ
 AmpSum2SvToSvVZ = AmpTreeSvToSvVZ 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSvOS(gt1)).gt.(Abs(MSvOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MSv(gt1)).gt.(Abs(MSv(gt2))+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SvToSvVZ = AmpTreeSvToSvVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvOS(gt1),MSvOS(gt2),MVZOS,AmpSumSvToSvVZ(:,gt1, gt2),AmpSum2SvToSvVZ(:,gt1, gt2),AmpSqSvToSvVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSv(gt1),MSv(gt2),MVZ,AmpSumSvToSvVZ(:,gt1, gt2),AmpSum2SvToSvVZ(:,gt1, gt2),AmpSqSvToSvVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvToSvVZ(gt1, gt2) 
  AmpSum2SvToSvVZ = 2._dp*AmpWaveSvToSvVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvOS(gt1),MSvOS(gt2),MVZOS,AmpSumSvToSvVZ(:,gt1, gt2),AmpSum2SvToSvVZ(:,gt1, gt2),AmpSqSvToSvVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSv(gt1),MSv(gt2),MVZ,AmpSumSvToSvVZ(:,gt1, gt2),AmpSum2SvToSvVZ(:,gt1, gt2),AmpSqSvToSvVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvToSvVZ(gt1, gt2) 
  AmpSum2SvToSvVZ = 2._dp*AmpVertexSvToSvVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvOS(gt1),MSvOS(gt2),MVZOS,AmpSumSvToSvVZ(:,gt1, gt2),AmpSum2SvToSvVZ(:,gt1, gt2),AmpSqSvToSvVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSv(gt1),MSv(gt2),MVZ,AmpSumSvToSvVZ(:,gt1, gt2),AmpSum2SvToSvVZ(:,gt1, gt2),AmpSqSvToSvVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvToSvVZ(gt1, gt2) 
  AmpSum2SvToSvVZ = AmpTreeSvToSvVZ + 2._dp*AmpWaveSvToSvVZ + 2._dp*AmpVertexSvToSvVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvOS(gt1),MSvOS(gt2),MVZOS,AmpSumSvToSvVZ(:,gt1, gt2),AmpSum2SvToSvVZ(:,gt1, gt2),AmpSqSvToSvVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSv(gt1),MSv(gt2),MVZ,AmpSumSvToSvVZ(:,gt1, gt2),AmpSum2SvToSvVZ(:,gt1, gt2),AmpSqSvToSvVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvToSvVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvToSvVZ = AmpTreeSvToSvVZ
  Call SquareAmp_StoSV(MSvOS(gt1),MSvOS(gt2),MVZOS,AmpSumSvToSvVZ(:,gt1, gt2),AmpSum2SvToSvVZ(:,gt1, gt2),AmpSqSvToSvVZ(gt1, gt2)) 
  AmpSqTreeSvToSvVZ(gt1, gt2) = AmpSqSvToSvVZ(gt1, gt2)  
  AmpSum2SvToSvVZ = + 2._dp*AmpWaveSvToSvVZ + 2._dp*AmpVertexSvToSvVZ
  Call SquareAmp_StoSV(MSvOS(gt1),MSvOS(gt2),MVZOS,AmpSumSvToSvVZ(:,gt1, gt2),AmpSum2SvToSvVZ(:,gt1, gt2),AmpSqSvToSvVZ(gt1, gt2)) 
  AmpSqSvToSvVZ(gt1, gt2) = AmpSqSvToSvVZ(gt1, gt2) + AmpSqTreeSvToSvVZ(gt1, gt2)  
Else  
  AmpSum2SvToSvVZ = AmpTreeSvToSvVZ
  Call SquareAmp_StoSV(MSv(gt1),MSv(gt2),MVZ,AmpSumSvToSvVZ(:,gt1, gt2),AmpSum2SvToSvVZ(:,gt1, gt2),AmpSqSvToSvVZ(gt1, gt2)) 
  AmpSqTreeSvToSvVZ(gt1, gt2) = AmpSqSvToSvVZ(gt1, gt2)  
  AmpSum2SvToSvVZ = + 2._dp*AmpWaveSvToSvVZ + 2._dp*AmpVertexSvToSvVZ
  Call SquareAmp_StoSV(MSv(gt1),MSv(gt2),MVZ,AmpSumSvToSvVZ(:,gt1, gt2),AmpSum2SvToSvVZ(:,gt1, gt2),AmpSqSvToSvVZ(gt1, gt2)) 
  AmpSqSvToSvVZ(gt1, gt2) = AmpSqSvToSvVZ(gt1, gt2) + AmpSqTreeSvToSvVZ(gt1, gt2)  
End if  
Else  
  AmpSqSvToSvVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvToSvVZ(gt1, gt2).eq.0._dp) Then 
  gP1LSv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSv(gt1,i4) = 1._dp*GammaTPS(MSvOS(gt1),MSvOS(gt2),MVZOS,helfactor*AmpSqSvToSvVZ(gt1, gt2))
Else 
  gP1LSv(gt1,i4) = 1._dp*GammaTPS(MSv(gt1),MSv(gt2),MVZ,helfactor*AmpSqSvToSvVZ(gt1, gt2))
End if 
If ((Abs(MRPSvToSvVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvToSvVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSv(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvToSvVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvToSvVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSvToSvVZ(gt1, gt2) + MRGSvToSvVZ(gt1, gt2)) 
  gP1LSv(gt1,i4) = gP1LSv(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSvToSvVZ(gt1, gt2) + MRGSvToSvVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSv(gt1,i4) 
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
! Sv VZp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_sec_UMSSM_SvToSvVZp(cplSvcSvVZp,MSv,MVZp,MSv2,MVZp2,              & 
& AmpTreeSvToSvVZp)

  Else 
Call Amplitude_Tree_sec_UMSSM_SvToSvVZp(ZcplSvcSvVZp,MSv,MVZp,MSv2,MVZp2,             & 
& AmpTreeSvToSvVZp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_sec_UMSSM_SvToSvVZp(MLambda,em,gs,cplSvcSvVZp,MSvOS,MVZpOS,           & 
& MRPSvToSvVZp,MRGSvToSvVZp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_sec_UMSSM_SvToSvVZp(MLambda,em,gs,ZcplSvcSvVZp,MSvOS,MVZpOS,          & 
& MRPSvToSvVZp,MRGSvToSvVZp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_sec_UMSSM_SvToSvVZp(MLambda,em,gs,cplSvcSvVZp,MSv,MVZp,               & 
& MRPSvToSvVZp,MRGSvToSvVZp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_sec_UMSSM_SvToSvVZp(MLambda,em,gs,ZcplSvcSvVZp,MSv,MVZp,              & 
& MRPSvToSvVZp,MRGSvToSvVZp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_SvToSvVZp(cplSvcSvVZ,cplSvcSvVZp,ctcplSvcSvVZ,          & 
& ctcplSvcSvVZp,MSv,MSv2,MVZ,MVZ2,MVZp,MVZp2,ZfSv,ZfVZp,ZfVZVZp,AmpWaveSvToSvVZp)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_SvToSvVZp(MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,             & 
& MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,MVWm2,           & 
& MVZ2,MVZp2,cplAhhhVZp,cplAhSvcSv,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVZpL,             & 
& cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,     & 
& cplcFvChiSvR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvVZpL,       & 
& cplcFvFvVZpR,cplhhSvcSv,cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplHpmcHpmVZp,              & 
& cplHpmcVWmVZp,cplSecSeVZp,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,            & 
& cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSvcVWmVZp1,cplSvcSeVWmVZp1,              & 
& cplSvcSvVZVZp1,cplSvcSvVZpVZp1,AmpVertexSvToSvVZp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSvVZp(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,            & 
& MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSvcSv,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVZpL,       & 
& cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,     & 
& cplcFvChiSvR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvVZpL,       & 
& cplcFvFvVZpR,cplhhSvcSv,cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplHpmcHpmVZp,              & 
& cplHpmcVWmVZp,cplSecSeVZp,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,            & 
& cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSvcVWmVZp1,cplSvcSeVWmVZp1,              & 
& cplSvcSvVZVZp1,cplSvcSvVZpVZp1,AmpVertexIRdrSvToSvVZp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSvVZp(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,             & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhhhVZp,          & 
& cplAhSvcSv,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,      & 
& cplChiChiVZpR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFeVZpL,        & 
& cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvVZpL,cplcFvFvVZpR,cplhhSvcSv,         & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSecSeVZp,            & 
& cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,ZcplSvcSvVZp,cplcHpmVWmVZp,           & 
& cplcVWmVWmVZp,cplSecSvcVWmVZp1,cplSvcSeVWmVZp1,cplSvcSvVZVZp1,cplSvcSvVZpVZp1,         & 
& AmpVertexIRosSvToSvVZp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSvVZp(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,            & 
& MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSvcSv,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVZpL,       & 
& cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,     & 
& cplcFvChiSvR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvVZpL,       & 
& cplcFvFvVZpR,cplhhSvcSv,cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplHpmcHpmVZp,              & 
& cplHpmcVWmVZp,cplSecSeVZp,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,            & 
& ZcplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSvcVWmVZp1,cplSvcSeVWmVZp1,             & 
& cplSvcSvVZVZp1,cplSvcSvVZpVZp1,AmpVertexIRosSvToSvVZp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSvVZp(MAhOS,MChaOS,MChiOS,MFeOS,               & 
& MFvOS,MhhOS,MHpmOS,MSeOS,MSvOS,MVWmOS,MVZOS,MVZpOS,MAh2OS,MCha2OS,MChi2OS,             & 
& MFe2OS,MFv2OS,Mhh2OS,MHpm2OS,MSe2OS,MSv2OS,MVWm2OS,MVZ2OS,MVZp2OS,cplAhhhVZp,          & 
& cplAhSvcSv,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,      & 
& cplChiChiVZpR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFeVZpL,        & 
& cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvVZpL,cplcFvFvVZpR,cplhhSvcSv,         & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSecSeVZp,            & 
& cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVWmVZp,            & 
& cplcVWmVWmVZp,cplSecSvcVWmVZp1,cplSvcSeVWmVZp1,cplSvcSvVZVZp1,cplSvcSvVZpVZp1,         & 
& AmpVertexIRosSvToSvVZp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_sec_UMSSM_SvToSvVZp(MAh,MCha,MChi,MFe,MFv,Mhh,               & 
& MHpm,MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,            & 
& MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSvcSv,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVZpL,       & 
& cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,     & 
& cplcFvChiSvR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvVZpL,       & 
& cplcFvFvVZpR,cplhhSvcSv,cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplHpmcHpmVZp,              & 
& cplHpmcVWmVZp,cplSecSeVZp,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,            & 
& cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSvcVWmVZp1,cplSvcSeVWmVZp1,              & 
& cplSvcSvVZVZp1,cplSvcSvVZpVZp1,AmpVertexIRosSvToSvVZp)

 End if 
 End if 
AmpVertexSvToSvVZp = AmpVertexSvToSvVZp -  AmpVertexIRdrSvToSvVZp! +  AmpVertexIRosSvToSvVZp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZSvToSvVZp=0._dp 
AmpVertexZSvToSvVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvToSvVZp(:,gt2,:) = AmpWaveZSvToSvVZp(:,gt2,:)+ZRUZVc(gt2,gt1)*AmpWaveSvToSvVZp(:,gt1,:) 
AmpVertexZSvToSvVZp(:,gt2,:)= AmpVertexZSvToSvVZp(:,gt2,:) + ZRUZVc(gt2,gt1)*AmpVertexSvToSvVZp(:,gt1,:) 
 End Do 
End Do 
AmpWaveSvToSvVZp=AmpWaveZSvToSvVZp 
AmpVertexSvToSvVZp= AmpVertexZSvToSvVZp
! Final State 1 
AmpWaveZSvToSvVZp=0._dp 
AmpVertexZSvToSvVZp=0._dp 
Do gt1=1,6
  Do gt2=1,6
AmpWaveZSvToSvVZp(:,:,gt2) = AmpWaveZSvToSvVZp(:,:,gt2)+ZRUZV(gt2,gt1)*AmpWaveSvToSvVZp(:,:,gt1) 
AmpVertexZSvToSvVZp(:,:,gt2)= AmpVertexZSvToSvVZp(:,:,gt2)+ZRUZV(gt2,gt1)*AmpVertexSvToSvVZp(:,:,gt1) 
 End Do 
End Do 
AmpWaveSvToSvVZp=AmpWaveZSvToSvVZp 
AmpVertexSvToSvVZp= AmpVertexZSvToSvVZp
End if
If (ShiftIRdiv) Then 
AmpVertexSvToSvVZp = AmpVertexSvToSvVZp  +  AmpVertexIRosSvToSvVZp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Sv->Sv VZp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumSvToSvVZp = AmpTreeSvToSvVZp 
 AmpSum2SvToSvVZp = AmpTreeSvToSvVZp + 2._dp*AmpWaveSvToSvVZp + 2._dp*AmpVertexSvToSvVZp  
Else 
 AmpSumSvToSvVZp = AmpTreeSvToSvVZp + AmpWaveSvToSvVZp + AmpVertexSvToSvVZp
 AmpSum2SvToSvVZp = AmpTreeSvToSvVZp + AmpWaveSvToSvVZp + AmpVertexSvToSvVZp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvToSvVZp = AmpTreeSvToSvVZp
 AmpSum2SvToSvVZp = AmpTreeSvToSvVZp 
End if 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSvOS(gt1)).gt.(Abs(MSvOS(gt2))+Abs(MVZpOS)))).or.((.not.OSkinematics).and.(Abs(MSv(gt1)).gt.(Abs(MSv(gt2))+Abs(MVZp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2SvToSvVZp = AmpTreeSvToSvVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvOS(gt1),MSvOS(gt2),MVZpOS,AmpSumSvToSvVZp(:,gt1, gt2),AmpSum2SvToSvVZp(:,gt1, gt2),AmpSqSvToSvVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSv(gt1),MSv(gt2),MVZp,AmpSumSvToSvVZp(:,gt1, gt2),AmpSum2SvToSvVZp(:,gt1, gt2),AmpSqSvToSvVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqSvToSvVZp(gt1, gt2) 
  AmpSum2SvToSvVZp = 2._dp*AmpWaveSvToSvVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvOS(gt1),MSvOS(gt2),MVZpOS,AmpSumSvToSvVZp(:,gt1, gt2),AmpSum2SvToSvVZp(:,gt1, gt2),AmpSqSvToSvVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSv(gt1),MSv(gt2),MVZp,AmpSumSvToSvVZp(:,gt1, gt2),AmpSum2SvToSvVZp(:,gt1, gt2),AmpSqSvToSvVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqSvToSvVZp(gt1, gt2) 
  AmpSum2SvToSvVZp = 2._dp*AmpVertexSvToSvVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvOS(gt1),MSvOS(gt2),MVZpOS,AmpSumSvToSvVZp(:,gt1, gt2),AmpSum2SvToSvVZp(:,gt1, gt2),AmpSqSvToSvVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSv(gt1),MSv(gt2),MVZp,AmpSumSvToSvVZp(:,gt1, gt2),AmpSum2SvToSvVZp(:,gt1, gt2),AmpSqSvToSvVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqSvToSvVZp(gt1, gt2) 
  AmpSum2SvToSvVZp = AmpTreeSvToSvVZp + 2._dp*AmpWaveSvToSvVZp + 2._dp*AmpVertexSvToSvVZp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvOS(gt1),MSvOS(gt2),MVZpOS,AmpSumSvToSvVZp(:,gt1, gt2),AmpSum2SvToSvVZp(:,gt1, gt2),AmpSqSvToSvVZp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSv(gt1),MSv(gt2),MVZp,AmpSumSvToSvVZp(:,gt1, gt2),AmpSum2SvToSvVZp(:,gt1, gt2),AmpSqSvToSvVZp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqSvToSvVZp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2SvToSvVZp = AmpTreeSvToSvVZp
  Call SquareAmp_StoSV(MSvOS(gt1),MSvOS(gt2),MVZpOS,AmpSumSvToSvVZp(:,gt1, gt2),AmpSum2SvToSvVZp(:,gt1, gt2),AmpSqSvToSvVZp(gt1, gt2)) 
  AmpSqTreeSvToSvVZp(gt1, gt2) = AmpSqSvToSvVZp(gt1, gt2)  
  AmpSum2SvToSvVZp = + 2._dp*AmpWaveSvToSvVZp + 2._dp*AmpVertexSvToSvVZp
  Call SquareAmp_StoSV(MSvOS(gt1),MSvOS(gt2),MVZpOS,AmpSumSvToSvVZp(:,gt1, gt2),AmpSum2SvToSvVZp(:,gt1, gt2),AmpSqSvToSvVZp(gt1, gt2)) 
  AmpSqSvToSvVZp(gt1, gt2) = AmpSqSvToSvVZp(gt1, gt2) + AmpSqTreeSvToSvVZp(gt1, gt2)  
Else  
  AmpSum2SvToSvVZp = AmpTreeSvToSvVZp
  Call SquareAmp_StoSV(MSv(gt1),MSv(gt2),MVZp,AmpSumSvToSvVZp(:,gt1, gt2),AmpSum2SvToSvVZp(:,gt1, gt2),AmpSqSvToSvVZp(gt1, gt2)) 
  AmpSqTreeSvToSvVZp(gt1, gt2) = AmpSqSvToSvVZp(gt1, gt2)  
  AmpSum2SvToSvVZp = + 2._dp*AmpWaveSvToSvVZp + 2._dp*AmpVertexSvToSvVZp
  Call SquareAmp_StoSV(MSv(gt1),MSv(gt2),MVZp,AmpSumSvToSvVZp(:,gt1, gt2),AmpSum2SvToSvVZp(:,gt1, gt2),AmpSqSvToSvVZp(gt1, gt2)) 
  AmpSqSvToSvVZp(gt1, gt2) = AmpSqSvToSvVZp(gt1, gt2) + AmpSqTreeSvToSvVZp(gt1, gt2)  
End if  
Else  
  AmpSqSvToSvVZp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvToSvVZp(gt1, gt2).eq.0._dp) Then 
  gP1LSv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSv(gt1,i4) = 1._dp*GammaTPS(MSvOS(gt1),MSvOS(gt2),MVZpOS,helfactor*AmpSqSvToSvVZp(gt1, gt2))
Else 
  gP1LSv(gt1,i4) = 1._dp*GammaTPS(MSv(gt1),MSv(gt2),MVZp,helfactor*AmpSqSvToSvVZp(gt1, gt2))
End if 
If ((Abs(MRPSvToSvVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvToSvVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSv(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPSvToSvVZp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvToSvVZp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPSvToSvVZp(gt1, gt2) + MRGSvToSvVZp(gt1, gt2)) 
  gP1LSv(gt1,i4) = gP1LSv(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPSvToSvVZp(gt1, gt2) + MRGSvToSvVZp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LSv(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End If 
!---------------- 
! Sv VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_sec_UMSSM_SvToSvVP(cplSvcSvVZ,cplSvcSvVZp,ctcplSvcSvVZ,           & 
& ctcplSvcSvVZp,MSvOS,MSv2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfSv,ZfVP,ZfVZpVP,ZfVZVP,             & 
& AmpWaveSvToSvVP)

 Else 
Call Amplitude_WAVE_sec_UMSSM_SvToSvVP(cplSvcSvVZ,cplSvcSvVZp,ctcplSvcSvVZ,           & 
& ctcplSvcSvVZp,MSvOS,MSv2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfSv,ZfVP,ZfVZpVP,ZfVZVP,             & 
& AmpWaveSvToSvVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_sec_UMSSM_SvToSvVP(MChaOS,MFeOS,MHpmOS,MSeOS,MSvOS,             & 
& MVP,MVWmOS,MCha2OS,MFe2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,cplcFeChaSvL,             & 
& cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,cplcFeFeVPL,cplcFeFeVPR,cplcChaFecSvL,        & 
& cplcChaFecSvR,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplSecSeVP,cplSecHpmcSv,           & 
& cplSecSvcVWm,cplSvcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSecSvcVWmVP1,cplSvcSeVPVWm1,     & 
& AmpVertexSvToSvVP)

 Else 
Call Amplitude_VERTEX_sec_UMSSM_SvToSvVP(MChaOS,MFeOS,MHpmOS,MSeOS,MSvOS,             & 
& MVP,MVWmOS,MCha2OS,MFe2OS,MHpm2OS,MSe2OS,MSv2OS,MVP2,MVWm2OS,cplcFeChaSvL,             & 
& cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,cplcFeFeVPL,cplcFeFeVPR,cplcChaFecSvL,        & 
& cplcChaFecSvR,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplSecSeVP,cplSecHpmcSv,           & 
& cplSecSvcVWm,cplSvcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSecSvcVWmVP1,cplSvcSeVPVWm1,     & 
& AmpVertexSvToSvVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_sec_UMSSM_SvToSvVP(cplSvcSvVZ,cplSvcSvVZp,ctcplSvcSvVZ,           & 
& ctcplSvcSvVZp,MSv,MSv2,MVP,MVP2,MVZ,MVZ2,ZfSv,ZfVP,ZfVZpVP,ZfVZVP,AmpWaveSvToSvVP)



!Vertex Corrections 
Call Amplitude_VERTEX_sec_UMSSM_SvToSvVP(MCha,MFe,MHpm,MSe,MSv,MVP,MVWm,              & 
& MCha2,MFe2,MHpm2,MSe2,MSv2,MVP2,MVWm2,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,         & 
& cplcChaChaVPR,cplcFeFeVPL,cplcFeFeVPR,cplcChaFecSvL,cplcChaFecSvR,cplHpmSvcSe,         & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplSecSeVP,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,            & 
& cplcHpmVPVWm,cplcVWmVPVWm,cplSecSvcVWmVP1,cplSvcSeVPVWm1,AmpVertexSvToSvVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Sv->Sv VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumSvToSvVP = 0._dp 
 AmpSum2SvToSvVP = 0._dp  
Else 
 AmpSumSvToSvVP = AmpVertexSvToSvVP + AmpWaveSvToSvVP
 AmpSum2SvToSvVP = AmpVertexSvToSvVP + AmpWaveSvToSvVP 
End If 
Do gt1=1,6
i4 = isave 
  Do gt2=1,6
If (((OSkinematics).and.(Abs(MSvOS(gt1)).gt.(Abs(MSvOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MSv(gt1)).gt.(Abs(MSv(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MSvOS(gt1),MSvOS(gt2),0._dp,AmpSumSvToSvVP(:,gt1, gt2),AmpSum2SvToSvVP(:,gt1, gt2),AmpSqSvToSvVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MSv(gt1),MSv(gt2),MVP,AmpSumSvToSvVP(:,gt1, gt2),AmpSum2SvToSvVP(:,gt1, gt2),AmpSqSvToSvVP(gt1, gt2)) 
End if  
Else  
  AmpSqSvToSvVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqSvToSvVP(gt1, gt2).eq.0._dp) Then 
  gP1LSv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LSv(gt1,i4) = 1._dp*GammaTPS(MSvOS(gt1),MSvOS(gt2),0._dp,helfactor*AmpSqSvToSvVP(gt1, gt2))
Else 
  gP1LSv(gt1,i4) = 1._dp*GammaTPS(MSv(gt1),MSv(gt2),MVP,helfactor*AmpSqSvToSvVP(gt1, gt2))
End if 
If ((Abs(MRPSvToSvVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGSvToSvVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LSv(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.6) isave = i4 
End do
End Subroutine OneLoopDecay_Sv

End Module Wrapper_OneLoopDecay_Sv_sec_UMSSM
