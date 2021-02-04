! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 1:01 on 7.11.2019   
! ----------------------------------------------------------------------  
 
 
Module CouplingsCT_sec_UMSSM
 
Use Control 
Use Settings 
Use Model_Data_sec_UMSSM 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Contains 
 
 Subroutine CalculateCouplingCT(lam,Tlam,kap,Tk,ZA,g1,g2,gp,vd,vu,vS,vS1,              & 
& vS2,vS3,ZH,ZP,Yd,Td,ZD,Ye,Te,ZE,Yu,Tu,ZU,Yv,Tv,ZV,TW,TWp,g3,UM,UP,ZN,ZDL,              & 
& ZDR,ZEL,ZER,ZUL,ZUR,ZVL,ZVR,pG,dlam,dTlam,dkap,dTk,dZA,dg1,dg2,dgp,dvd,dvu,            & 
& dvS,dvS1,dvS2,dvS3,dZH,dZP,dYd,dTd,dZD,dYe,dTe,dZE,dYu,dTu,dZU,dYv,dTv,dZV,            & 
& dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,dg3,dUM,dUP,dZN,dZDL,dZDR,dZEL,           & 
& dZER,dZUL,dZUR,dZVL,dZVR,dpG,ctcplAhAhAh,ctcplAhAhhh,ctcplAhhhhh,ctcplAhHpmcHpm,       & 
& ctcplAhSdcSd,ctcplAhSecSe,ctcplAhSucSu,ctcplAhSvcSv,ctcplhhhhhh,ctcplhhHpmcHpm,        & 
& ctcplhhSdcSd,ctcplhhSecSe,ctcplhhSucSu,ctcplhhSvcSv,ctcplHpmSucSd,ctcplHpmSvcSe,       & 
& ctcplSdcHpmcSu,ctcplSecHpmcSv,ctcplAhhhVZ,ctcplAhhhVZp,ctcplAhHpmcVWm,ctcplAhcHpmVWm,  & 
& ctcplhhHpmcVWm,ctcplhhcHpmVWm,ctcplHpmcHpmVP,ctcplHpmcHpmVZ,ctcplHpmcHpmVZp,           & 
& ctcplSdcSdVG,ctcplSdcSdVP,ctcplSdcSdVZ,ctcplSdcSdVZp,ctcplSdcSucVWm,ctcplSecSeVP,      & 
& ctcplSecSeVZ,ctcplSecSeVZp,ctcplSecSvcVWm,ctcplSucSuVG,ctcplSucSuVP,ctcplSucSdVWm,     & 
& ctcplSucSuVZ,ctcplSucSuVZp,ctcplSvcSeVWm,ctcplSvcSvVZ,ctcplSvcSvVZp,ctcplhhcVWmVWm,    & 
& ctcplhhVZVZ,ctcplhhVZVZp,ctcplhhVZpVZp,ctcplHpmcVWmVP,ctcplHpmcVWmVZ,ctcplHpmcVWmVZp,  & 
& ctcplcHpmVPVWm,ctcplcHpmVWmVZ,ctcplcHpmVWmVZp,ctcplVGVGVG,ctcplcVWmVPVWm,              & 
& ctcplcVWmVWmVZ,ctcplcVWmVWmVZp,ctcplcChaChaAhL,ctcplcChaChaAhR,ctcplChiChiAhL,         & 
& ctcplChiChiAhR,ctcplcFdFdAhL,ctcplcFdFdAhR,ctcplcFeFeAhL,ctcplcFeFeAhR,ctcplcFuFuAhL,  & 
& ctcplcFuFuAhR,ctcplcFvFvAhL,ctcplcFvFvAhR,ctcplChiChacHpmL,ctcplChiChacHpmR,           & 
& ctcplChaFucSdL,ctcplChaFucSdR,ctcplChaFvcSeL,ctcplChaFvcSeR,ctcplcChaChahhL,           & 
& ctcplcChaChahhR,ctcplcFdChaSuL,ctcplcFdChaSuR,ctcplcFeChaSvL,ctcplcFeChaSvR,           & 
& ctcplChiChihhL,ctcplChiChihhR,ctcplChiFdcSdL,ctcplChiFdcSdR,ctcplChiFecSeL,            & 
& ctcplChiFecSeR,ctcplChiFucSuL,ctcplChiFucSuR,ctcplChiFvcSvL,ctcplChiFvcSvR,            & 
& ctcplcChaChiHpmL,ctcplcChaChiHpmR,ctcplcFdChiSdL,ctcplcFdChiSdR,ctcplcFeChiSeL,        & 
& ctcplcFeChiSeR,ctcplcFuChiSuL,ctcplcFuChiSuR,ctcplcFvChiSvL,ctcplcFvChiSvR,            & 
& ctcplGluFdcSdL,ctcplGluFdcSdR,ctcplcFdFdhhL,ctcplcFdFdhhR,ctcplcChaFdcSuL,             & 
& ctcplcChaFdcSuR,ctcplcFuFdcHpmL,ctcplcFuFdcHpmR,ctcplcFeFehhL,ctcplcFeFehhR,           & 
& ctcplcChaFecSvL,ctcplcChaFecSvR,ctcplcFvFecHpmL,ctcplcFvFecHpmR,ctcplGluFucSuL,        & 
& ctcplGluFucSuR,ctcplcFuFuhhL,ctcplcFuFuhhR,ctcplcFdFuHpmL,ctcplcFdFuHpmR,              & 
& ctcplcFvFvhhL,ctcplcFvFvhhR,ctcplcFeFvHpmL,ctcplcFeFvHpmR,ctcplcFdGluSdL,              & 
& ctcplcFdGluSdR,ctcplcFuGluSuL,ctcplcFuGluSuR,ctcplcChacFuSdL,ctcplcChacFuSdR,          & 
& ctcplcChacFvSeL,ctcplcChacFvSeR,ctcplChiChacVWmL,ctcplChiChacVWmR,ctcplcChaChaVPL,     & 
& ctcplcChaChaVPR,ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChaVZpL,ctcplcChaChaVZpR,     & 
& ctcplChiChiVZL,ctcplChiChiVZR,ctcplChiChiVZpL,ctcplChiChiVZpR,ctcplcChaChiVWmL,        & 
& ctcplcChaChiVWmR,ctcplcFdFdVGL,ctcplcFdFdVGR,ctcplcFdFdVPL,ctcplcFdFdVPR,              & 
& ctcplcFdFdVZL,ctcplcFdFdVZR,ctcplcFdFdVZpL,ctcplcFdFdVZpR,ctcplcFuFdcVWmL,             & 
& ctcplcFuFdcVWmR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,               & 
& ctcplcFeFeVZpL,ctcplcFeFeVZpR,ctcplcFvFecVWmL,ctcplcFvFecVWmR,ctcplcFuFuVGL,           & 
& ctcplcFuFuVGR,ctcplcFuFuVPL,ctcplcFuFuVPR,ctcplcFdFuVWmL,ctcplcFdFuVWmR,               & 
& ctcplcFuFuVZL,ctcplcFuFuVZR,ctcplcFuFuVZpL,ctcplcFuFuVZpR,ctcplcFeFvVWmL,              & 
& ctcplcFeFvVWmR,ctcplcFvFvVZL,ctcplcFvFvVZR,ctcplcFvFvVZpL,ctcplcFvFvVZpR,              & 
& ctcplGluGluVGL,ctcplGluGluVGR)

Implicit None 
Real(dp), Intent(in) :: g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,ZP(2,2),TW,TWp,g3,dg1,dg2,dgp,dvd,dvu,dvS,              & 
& dvS1,dvS2,dvS3,dZP(2,2),dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,dg3

Complex(dp), Intent(in) :: lam,Tlam,kap,Tk,ZA(6,6),ZH(6,6),Yd(3,3),Td(3,3),ZD(6,6),Ye(3,3),Te(3,3),              & 
& ZE(6,6),Yu(3,3),Tu(3,3),ZU(6,6),Yv(3,3),Tv(3,3),ZV(6,6),UM(2,2),UP(2,2),               & 
& ZN(9,9),ZDL(3,3),ZDR(3,3),ZEL(3,3),ZER(3,3),ZUL(3,3),ZUR(3,3),ZVL(3,3),ZVR(3,3),       & 
& pG,dlam,dTlam,dkap,dTk,dZA(6,6),dZH(6,6),dYd(3,3),dTd(3,3),dZD(6,6),dYe(3,3),          & 
& dTe(3,3),dZE(6,6),dYu(3,3),dTu(3,3),dZU(6,6),dYv(3,3),dTv(3,3),dZV(6,6),               & 
& dUM(2,2),dUP(2,2),dZN(9,9),dZDL(3,3),dZDR(3,3),dZEL(3,3),dZER(3,3),dZUL(3,3),          & 
& dZUR(3,3),dZVL(3,3),dZVR(3,3),dpG

Complex(dp), Intent(out) :: ctcplAhAhAh(6,6,6),ctcplAhAhhh(6,6,6),ctcplAhhhhh(6,6,6),ctcplAhHpmcHpm(6,2,2),       & 
& ctcplAhSdcSd(6,6,6),ctcplAhSecSe(6,6,6),ctcplAhSucSu(6,6,6),ctcplAhSvcSv(6,6,6),       & 
& ctcplhhhhhh(6,6,6),ctcplhhHpmcHpm(6,2,2),ctcplhhSdcSd(6,6,6),ctcplhhSecSe(6,6,6),      & 
& ctcplhhSucSu(6,6,6),ctcplhhSvcSv(6,6,6),ctcplHpmSucSd(2,6,6),ctcplHpmSvcSe(2,6,6),     & 
& ctcplSdcHpmcSu(6,2,6),ctcplSecHpmcSv(6,2,6),ctcplAhhhVZ(6,6),ctcplAhhhVZp(6,6),        & 
& ctcplAhHpmcVWm(6,2),ctcplAhcHpmVWm(6,2),ctcplhhHpmcVWm(6,2),ctcplhhcHpmVWm(6,2),       & 
& ctcplHpmcHpmVP(2,2),ctcplHpmcHpmVZ(2,2),ctcplHpmcHpmVZp(2,2),ctcplSdcSdVG(6,6),        & 
& ctcplSdcSdVP(6,6),ctcplSdcSdVZ(6,6),ctcplSdcSdVZp(6,6),ctcplSdcSucVWm(6,6),            & 
& ctcplSecSeVP(6,6),ctcplSecSeVZ(6,6),ctcplSecSeVZp(6,6),ctcplSecSvcVWm(6,6),            & 
& ctcplSucSuVG(6,6),ctcplSucSuVP(6,6),ctcplSucSdVWm(6,6),ctcplSucSuVZ(6,6),              & 
& ctcplSucSuVZp(6,6),ctcplSvcSeVWm(6,6),ctcplSvcSvVZ(6,6),ctcplSvcSvVZp(6,6),            & 
& ctcplhhcVWmVWm(6),ctcplhhVZVZ(6),ctcplhhVZVZp(6),ctcplhhVZpVZp(6),ctcplHpmcVWmVP(2),   & 
& ctcplHpmcVWmVZ(2),ctcplHpmcVWmVZp(2),ctcplcHpmVPVWm(2),ctcplcHpmVWmVZ(2),              & 
& ctcplcHpmVWmVZp(2),ctcplVGVGVG,ctcplcVWmVPVWm,ctcplcVWmVWmVZ,ctcplcVWmVWmVZp,          & 
& ctcplcChaChaAhL(2,2,6),ctcplcChaChaAhR(2,2,6),ctcplChiChiAhL(9,9,6),ctcplChiChiAhR(9,9,6),& 
& ctcplcFdFdAhL(3,3,6),ctcplcFdFdAhR(3,3,6),ctcplcFeFeAhL(3,3,6),ctcplcFeFeAhR(3,3,6),   & 
& ctcplcFuFuAhL(3,3,6),ctcplcFuFuAhR(3,3,6),ctcplcFvFvAhL(3,3,6),ctcplcFvFvAhR(3,3,6),   & 
& ctcplChiChacHpmL(9,2,2),ctcplChiChacHpmR(9,2,2),ctcplChaFucSdL(2,3,6),ctcplChaFucSdR(2,3,6),& 
& ctcplChaFvcSeL(2,3,6),ctcplChaFvcSeR(2,3,6),ctcplcChaChahhL(2,2,6),ctcplcChaChahhR(2,2,6),& 
& ctcplcFdChaSuL(3,2,6),ctcplcFdChaSuR(3,2,6),ctcplcFeChaSvL(3,2,6),ctcplcFeChaSvR(3,2,6),& 
& ctcplChiChihhL(9,9,6),ctcplChiChihhR(9,9,6),ctcplChiFdcSdL(9,3,6),ctcplChiFdcSdR(9,3,6),& 
& ctcplChiFecSeL(9,3,6),ctcplChiFecSeR(9,3,6),ctcplChiFucSuL(9,3,6),ctcplChiFucSuR(9,3,6),& 
& ctcplChiFvcSvL(9,3,6),ctcplChiFvcSvR(9,3,6),ctcplcChaChiHpmL(2,9,2),ctcplcChaChiHpmR(2,9,2),& 
& ctcplcFdChiSdL(3,9,6),ctcplcFdChiSdR(3,9,6),ctcplcFeChiSeL(3,9,6),ctcplcFeChiSeR(3,9,6),& 
& ctcplcFuChiSuL(3,9,6),ctcplcFuChiSuR(3,9,6),ctcplcFvChiSvL(3,9,6),ctcplcFvChiSvR(3,9,6),& 
& ctcplGluFdcSdL(3,6),ctcplGluFdcSdR(3,6),ctcplcFdFdhhL(3,3,6),ctcplcFdFdhhR(3,3,6),     & 
& ctcplcChaFdcSuL(2,3,6),ctcplcChaFdcSuR(2,3,6),ctcplcFuFdcHpmL(3,3,2),ctcplcFuFdcHpmR(3,3,2),& 
& ctcplcFeFehhL(3,3,6),ctcplcFeFehhR(3,3,6),ctcplcChaFecSvL(2,3,6),ctcplcChaFecSvR(2,3,6),& 
& ctcplcFvFecHpmL(3,3,2),ctcplcFvFecHpmR(3,3,2),ctcplGluFucSuL(3,6),ctcplGluFucSuR(3,6), & 
& ctcplcFuFuhhL(3,3,6),ctcplcFuFuhhR(3,3,6),ctcplcFdFuHpmL(3,3,2),ctcplcFdFuHpmR(3,3,2), & 
& ctcplcFvFvhhL(3,3,6),ctcplcFvFvhhR(3,3,6),ctcplcFeFvHpmL(3,3,2),ctcplcFeFvHpmR(3,3,2), & 
& ctcplcFdGluSdL(3,6),ctcplcFdGluSdR(3,6),ctcplcFuGluSuL(3,6),ctcplcFuGluSuR(3,6),       & 
& ctcplcChacFuSdL(2,3,6),ctcplcChacFuSdR(2,3,6),ctcplcChacFvSeL(2,3,6),ctcplcChacFvSeR(2,3,6),& 
& ctcplChiChacVWmL(9,2),ctcplChiChacVWmR(9,2),ctcplcChaChaVPL(2,2),ctcplcChaChaVPR(2,2), & 
& ctcplcChaChaVZL(2,2),ctcplcChaChaVZR(2,2),ctcplcChaChaVZpL(2,2),ctcplcChaChaVZpR(2,2), & 
& ctcplChiChiVZL(9,9),ctcplChiChiVZR(9,9),ctcplChiChiVZpL(9,9),ctcplChiChiVZpR(9,9),     & 
& ctcplcChaChiVWmL(2,9),ctcplcChaChiVWmR(2,9),ctcplcFdFdVGL(3,3),ctcplcFdFdVGR(3,3)

Complex(dp), Intent(out) :: ctcplcFdFdVPL(3,3),ctcplcFdFdVPR(3,3),ctcplcFdFdVZL(3,3),ctcplcFdFdVZR(3,3),           & 
& ctcplcFdFdVZpL(3,3),ctcplcFdFdVZpR(3,3),ctcplcFuFdcVWmL(3,3),ctcplcFuFdcVWmR(3,3),     & 
& ctcplcFeFeVPL(3,3),ctcplcFeFeVPR(3,3),ctcplcFeFeVZL(3,3),ctcplcFeFeVZR(3,3),           & 
& ctcplcFeFeVZpL(3,3),ctcplcFeFeVZpR(3,3),ctcplcFvFecVWmL(3,3),ctcplcFvFecVWmR(3,3),     & 
& ctcplcFuFuVGL(3,3),ctcplcFuFuVGR(3,3),ctcplcFuFuVPL(3,3),ctcplcFuFuVPR(3,3),           & 
& ctcplcFdFuVWmL(3,3),ctcplcFdFuVWmR(3,3),ctcplcFuFuVZL(3,3),ctcplcFuFuVZR(3,3),         & 
& ctcplcFuFuVZpL(3,3),ctcplcFuFuVZpR(3,3),ctcplcFeFvVWmL(3,3),ctcplcFeFvVWmR(3,3),       & 
& ctcplcFvFvVZL(3,3),ctcplcFvFvVZR(3,3),ctcplcFvFvVZpL(3,3),ctcplcFvFvVZpR(3,3),         & 
& ctcplGluGluVGL,ctcplGluGluVGR

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateCouplingCT'
 
ctcplAhAhAh = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingAhAhAh(gt1,gt2,gt3,lam,Tlam,kap,Tk,ZA,dlam,dTlam,dkap,dTk,            & 
& dZA,ctcplAhAhAh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhAhhh = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingAhAhhh(gt1,gt2,gt3,g1,g2,gp,lam,Tlam,kap,Tk,vd,vu,vS,vS1,             & 
& vS2,vS3,ZH,ZA,dg1,dg2,dgp,dlam,dTlam,dkap,dTk,dvd,dvu,dvS,dvS1,dvS2,dvS3,              & 
& dZH,dZA,ctcplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhhhhh = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingAhhhhh(gt1,gt2,gt3,lam,Tlam,kap,Tk,ZH,ZA,dlam,dTlam,dkap,             & 
& dTk,dZH,dZA,ctcplAhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhHpmcHpm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CT_CouplingAhHpmcHpm(gt1,gt2,gt3,g2,lam,Tlam,vd,vu,ZA,ZP,dg2,dlam,               & 
& dTlam,dvd,dvu,dZA,dZP,ctcplAhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhSdcSd = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingAhSdcSd(gt1,gt2,gt3,Yd,Td,lam,vu,vS,ZD,ZA,dYd,dTd,dlam,               & 
& dvu,dvS,dZD,dZA,ctcplAhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhSecSe = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingAhSecSe(gt1,gt2,gt3,Ye,Te,lam,vu,vS,ZE,ZA,dYe,dTe,dlam,               & 
& dvu,dvS,dZE,dZA,ctcplAhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhSucSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingAhSucSu(gt1,gt2,gt3,lam,Yu,Tu,vd,vS,ZU,ZA,dlam,dYu,dTu,               & 
& dvd,dvS,dZU,dZA,ctcplAhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhSvcSv = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingAhSvcSv(gt1,gt2,gt3,lam,Yv,Tv,vd,vS,ZV,ZA,dlam,dYv,dTv,               & 
& dvd,dvS,dZV,dZA,ctcplAhSvcSv(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhhhhh = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_Couplinghhhhhh(gt1,gt2,gt3,g1,g2,gp,lam,Tlam,kap,Tk,vd,vu,vS,vS1,             & 
& vS2,vS3,ZH,dg1,dg2,dgp,dlam,dTlam,dkap,dTk,dvd,dvu,dvS,dvS1,dvS2,dvS3,dZH,             & 
& ctcplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhHpmcHpm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CT_CouplinghhHpmcHpm(gt1,gt2,gt3,g1,g2,gp,lam,Tlam,vd,vu,vS,vS1,vS2,             & 
& vS3,ZH,ZP,dg1,dg2,dgp,dlam,dTlam,dvd,dvu,dvS,dvS1,dvS2,dvS3,dZH,dZP,ctcplhhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhSdcSd = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplinghhSdcSd(gt1,gt2,gt3,g1,g2,gp,Yd,Td,lam,vd,vu,vS,vS1,vS2,              & 
& vS3,ZD,ZH,dg1,dg2,dgp,dYd,dTd,dlam,dvd,dvu,dvS,dvS1,dvS2,dvS3,dZD,dZH,ctcplhhSdcSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhSecSe = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplinghhSecSe(gt1,gt2,gt3,g1,g2,gp,Ye,Te,lam,vd,vu,vS,vS1,vS2,              & 
& vS3,ZE,ZH,dg1,dg2,dgp,dYe,dTe,dlam,dvd,dvu,dvS,dvS1,dvS2,dvS3,dZE,dZH,ctcplhhSecSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhSucSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplinghhSucSu(gt1,gt2,gt3,g1,g2,gp,lam,Yu,Tu,vd,vu,vS,vS1,vS2,              & 
& vS3,ZU,ZH,dg1,dg2,dgp,dlam,dYu,dTu,dvd,dvu,dvS,dvS1,dvS2,dvS3,dZU,dZH,ctcplhhSucSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhSvcSv = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplinghhSvcSv(gt1,gt2,gt3,g1,g2,gp,lam,Yv,Tv,vd,vu,vS,vS1,vS2,              & 
& vS3,ZV,ZH,dg1,dg2,dgp,dlam,dYv,dTv,dvd,dvu,dvS,dvS1,dvS2,dvS3,dZV,dZH,ctcplhhSvcSv(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplHpmSucSd = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingHpmSucSd(gt1,gt2,gt3,g2,Yd,Td,lam,Yu,Tu,vd,vu,vS,ZD,ZU,               & 
& ZP,dg2,dYd,dTd,dlam,dYu,dTu,dvd,dvu,dvS,dZD,dZU,dZP,ctcplHpmSucSd(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplHpmSvcSe = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 6
  Do gt3 = 1, 6
Call CT_CouplingHpmSvcSe(gt1,gt2,gt3,g2,Ye,Te,lam,Yv,Tv,vd,vu,vS,ZV,ZE,               & 
& ZP,dg2,dYe,dTe,dlam,dYv,dTv,dvd,dvu,dvS,dZV,dZE,dZP,ctcplHpmSvcSe(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplSdcHpmcSu = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CT_CouplingSdcHpmcSu(gt1,gt2,gt3,g2,Yd,Td,lam,Yu,Tu,vd,vu,vS,ZD,ZU,              & 
& ZP,dg2,dYd,dTd,dlam,dYu,dTu,dvd,dvu,dvS,dZD,dZU,dZP,ctcplSdcHpmcSu(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplSecHpmcSv = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CT_CouplingSecHpmcSv(gt1,gt2,gt3,g2,Ye,Te,lam,Yv,Tv,vd,vu,vS,ZV,ZE,              & 
& ZP,dg2,dYe,dTe,dlam,dYv,dTv,dvd,dvu,dvS,dZV,dZE,dZP,ctcplSecHpmcSv(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhhhVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingAhhhVZ(gt1,gt2,g1,g2,gp,ZH,ZA,TW,TWp,dg1,dg2,dgp,dZH,dZA,             & 
& dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplAhhhVZ(gt1,gt2))

 End Do 
End Do 


ctcplAhhhVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingAhhhVZp(gt1,gt2,g1,g2,gp,ZH,ZA,TW,TWp,dg1,dg2,dgp,dZH,dZA,            & 
& dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplAhhhVZp(gt1,gt2))

 End Do 
End Do 


ctcplAhHpmcVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
Call CT_CouplingAhHpmcVWm(gt1,gt2,g2,ZA,ZP,dg2,dZA,dZP,ctcplAhHpmcVWm(gt1,gt2))

 End Do 
End Do 


ctcplAhcHpmVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
Call CT_CouplingAhcHpmVWm(gt1,gt2,g2,ZA,ZP,dg2,dZA,dZP,ctcplAhcHpmVWm(gt1,gt2))

 End Do 
End Do 


ctcplhhHpmcVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
Call CT_CouplinghhHpmcVWm(gt1,gt2,g2,ZH,ZP,dg2,dZH,dZP,ctcplhhHpmcVWm(gt1,gt2))

 End Do 
End Do 


ctcplhhcHpmVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 2
Call CT_CouplinghhcHpmVWm(gt1,gt2,g2,ZH,ZP,dg2,dZH,dZP,ctcplhhcHpmVWm(gt1,gt2))

 End Do 
End Do 


ctcplHpmcHpmVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CT_CouplingHpmcHpmVP(gt1,gt2,g1,g2,ZP,TW,dg1,dg2,dZP,dSinTW,dCosTW,              & 
& dTanTW,ctcplHpmcHpmVP(gt1,gt2))

 End Do 
End Do 


ctcplHpmcHpmVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CT_CouplingHpmcHpmVZ(gt1,gt2,g1,g2,gp,ZP,TW,TWp,dg1,dg2,dgp,dZP,dSinTW,          & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplHpmcHpmVZ(gt1,gt2))

 End Do 
End Do 


ctcplHpmcHpmVZp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CT_CouplingHpmcHpmVZp(gt1,gt2,g1,g2,gp,ZP,TW,TWp,dg1,dg2,dgp,dZP,dSinTW,         & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplHpmcHpmVZp(gt1,gt2))

 End Do 
End Do 


ctcplSdcSdVG = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSdcSdVG(gt1,gt2,g3,dg3,ctcplSdcSdVG(gt1,gt2))

 End Do 
End Do 


ctcplSdcSdVP = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSdcSdVP(gt1,gt2,g1,g2,ZD,TW,dg1,dg2,dZD,dSinTW,dCosTW,dTanTW,         & 
& ctcplSdcSdVP(gt1,gt2))

 End Do 
End Do 


ctcplSdcSdVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSdcSdVZ(gt1,gt2,g1,g2,gp,ZD,TW,TWp,dg1,dg2,dgp,dZD,dSinTW,            & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplSdcSdVZ(gt1,gt2))

 End Do 
End Do 


ctcplSdcSdVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSdcSdVZp(gt1,gt2,g1,g2,gp,ZD,TW,TWp,dg1,dg2,dgp,dZD,dSinTW,           & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplSdcSdVZp(gt1,gt2))

 End Do 
End Do 


ctcplSdcSucVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSdcSucVWm(gt1,gt2,g2,ZD,ZU,dg2,dZD,dZU,ctcplSdcSucVWm(gt1,gt2))

 End Do 
End Do 


ctcplSecSeVP = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSecSeVP(gt1,gt2,g1,g2,ZE,TW,dg1,dg2,dZE,dSinTW,dCosTW,dTanTW,         & 
& ctcplSecSeVP(gt1,gt2))

 End Do 
End Do 


ctcplSecSeVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSecSeVZ(gt1,gt2,g1,g2,gp,ZE,TW,TWp,dg1,dg2,dgp,dZE,dSinTW,            & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplSecSeVZ(gt1,gt2))

 End Do 
End Do 


ctcplSecSeVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSecSeVZp(gt1,gt2,g1,g2,gp,ZE,TW,TWp,dg1,dg2,dgp,dZE,dSinTW,           & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplSecSeVZp(gt1,gt2))

 End Do 
End Do 


ctcplSecSvcVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSecSvcVWm(gt1,gt2,g2,ZV,ZE,dg2,dZV,dZE,ctcplSecSvcVWm(gt1,gt2))

 End Do 
End Do 


ctcplSucSuVG = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSucSuVG(gt1,gt2,g3,dg3,ctcplSucSuVG(gt1,gt2))

 End Do 
End Do 


ctcplSucSuVP = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSucSuVP(gt1,gt2,g1,g2,ZU,TW,dg1,dg2,dZU,dSinTW,dCosTW,dTanTW,         & 
& ctcplSucSuVP(gt1,gt2))

 End Do 
End Do 


ctcplSucSdVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSucSdVWm(gt1,gt2,g2,ZD,ZU,dg2,dZD,dZU,ctcplSucSdVWm(gt1,gt2))

 End Do 
End Do 


ctcplSucSuVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSucSuVZ(gt1,gt2,g1,g2,gp,ZU,TW,TWp,dg1,dg2,dgp,dZU,dSinTW,            & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplSucSuVZ(gt1,gt2))

 End Do 
End Do 


ctcplSucSuVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSucSuVZp(gt1,gt2,g1,g2,gp,ZU,TW,TWp,dg1,dg2,dgp,dZU,dSinTW,           & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplSucSuVZp(gt1,gt2))

 End Do 
End Do 


ctcplSvcSeVWm = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSvcSeVWm(gt1,gt2,g2,ZV,ZE,dg2,dZV,dZE,ctcplSvcSeVWm(gt1,gt2))

 End Do 
End Do 


ctcplSvcSvVZ = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSvcSvVZ(gt1,gt2,g1,g2,gp,ZV,TW,TWp,dg1,dg2,dgp,dZV,dSinTW,            & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplSvcSvVZ(gt1,gt2))

 End Do 
End Do 


ctcplSvcSvVZp = 0._dp 
Do gt1 = 1, 6
 Do gt2 = 1, 6
Call CT_CouplingSvcSvVZp(gt1,gt2,g1,g2,gp,ZV,TW,TWp,dg1,dg2,dgp,dZV,dSinTW,           & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplSvcSvVZp(gt1,gt2))

 End Do 
End Do 


ctcplhhcVWmVWm = 0._dp 
Do gt1 = 1, 6
Call CT_CouplinghhcVWmVWm(gt1,g2,vd,vu,ZH,dg2,dvd,dvu,dZH,ctcplhhcVWmVWm(gt1))

End Do 


ctcplhhVZVZ = 0._dp 
Do gt1 = 1, 6
Call CT_CouplinghhVZVZ(gt1,g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,ZH,TW,TWp,dg1,               & 
& dg2,dgp,dvd,dvu,dvS,dvS1,dvS2,dvS3,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,           & 
& dTanTWp,ctcplhhVZVZ(gt1))

End Do 


ctcplhhVZVZp = 0._dp 
Do gt1 = 1, 6
Call CT_CouplinghhVZVZp(gt1,g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,ZH,TW,TWp,dg1,              & 
& dg2,dgp,dvd,dvu,dvS,dvS1,dvS2,dvS3,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,           & 
& dTanTWp,ctcplhhVZVZp(gt1))

End Do 


ctcplhhVZpVZp = 0._dp 
Do gt1 = 1, 6
Call CT_CouplinghhVZpVZp(gt1,g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,ZH,TW,TWp,dg1,             & 
& dg2,dgp,dvd,dvu,dvS,dvS1,dvS2,dvS3,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,           & 
& dTanTWp,ctcplhhVZpVZp(gt1))

End Do 


ctcplHpmcVWmVP = 0._dp 
Do gt1 = 1, 2
Call CT_CouplingHpmcVWmVP(gt1,g1,g2,vd,vu,ZP,TW,dg1,dg2,dvd,dvu,dZP,dSinTW,           & 
& dCosTW,dTanTW,ctcplHpmcVWmVP(gt1))

End Do 


ctcplHpmcVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CT_CouplingHpmcVWmVZ(gt1,g1,g2,gp,vd,vu,ZP,TW,TWp,dg1,dg2,dgp,dvd,               & 
& dvu,dZP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplHpmcVWmVZ(gt1))

End Do 


ctcplHpmcVWmVZp = 0._dp 
Do gt1 = 1, 2
Call CT_CouplingHpmcVWmVZp(gt1,g1,g2,gp,vd,vu,ZP,TW,TWp,dg1,dg2,dgp,dvd,              & 
& dvu,dZP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplHpmcVWmVZp(gt1))

End Do 


ctcplcHpmVPVWm = 0._dp 
Do gt1 = 1, 2
Call CT_CouplingcHpmVPVWm(gt1,g1,g2,vd,vu,ZP,TW,dg1,dg2,dvd,dvu,dZP,dSinTW,           & 
& dCosTW,dTanTW,ctcplcHpmVPVWm(gt1))

End Do 


ctcplcHpmVWmVZ = 0._dp 
Do gt1 = 1, 2
Call CT_CouplingcHpmVWmVZ(gt1,g1,g2,gp,vd,vu,ZP,TW,TWp,dg1,dg2,dgp,dvd,               & 
& dvu,dZP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcHpmVWmVZ(gt1))

End Do 


ctcplcHpmVWmVZp = 0._dp 
Do gt1 = 1, 2
Call CT_CouplingcHpmVWmVZp(gt1,g1,g2,gp,vd,vu,ZP,TW,TWp,dg1,dg2,dgp,dvd,              & 
& dvu,dZP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcHpmVWmVZp(gt1))

End Do 


ctcplVGVGVG = 0._dp 
Call CT_CouplingVGVGVG(g3,dg3,ctcplVGVGVG)



ctcplcVWmVPVWm = 0._dp 
Call CT_CouplingcVWmVPVWm(g2,TW,dg2,dSinTW,dCosTW,dTanTW,ctcplcVWmVPVWm)



ctcplcVWmVWmVZ = 0._dp 
Call CT_CouplingcVWmVWmVZ(g2,TW,TWp,dg2,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,         & 
& dTanTWp,ctcplcVWmVWmVZ)



ctcplcVWmVWmVZp = 0._dp 
Call CT_CouplingcVWmVWmVZp(g2,TW,TWp,dg2,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,        & 
& dTanTWp,ctcplcVWmVWmVZp)



ctcplcChaChaAhL = 0._dp 
ctcplcChaChaAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CT_CouplingcChaChaAh(gt1,gt2,gt3,g2,lam,ZA,UM,UP,dg2,dlam,dZA,dUM,               & 
& dUP,ctcplcChaChaAhL(gt1,gt2,gt3),ctcplcChaChaAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiChiAhL = 0._dp 
ctcplChiChiAhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CT_CouplingChiChiAh(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZA,ZN,dg1,dg2,dgp,              & 
& dlam,dkap,dZA,dZN,ctcplChiChiAhL(gt1,gt2,gt3),ctcplChiChiAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFdFdAhL = 0._dp 
ctcplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingcFdFdAh(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,dYd,dZA,dZDL,dZDR,ctcplcFdFdAhL(gt1,gt2,gt3)& 
& ,ctcplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFeFeAhL = 0._dp 
ctcplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingcFeFeAh(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,dYe,dZA,dZEL,dZER,ctcplcFeFeAhL(gt1,gt2,gt3)& 
& ,ctcplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFuFuAhL = 0._dp 
ctcplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingcFuFuAh(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,dYu,dZA,dZUL,dZUR,ctcplcFuFuAhL(gt1,gt2,gt3)& 
& ,ctcplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFvFvAhL = 0._dp 
ctcplcFvFvAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingcFvFvAh(gt1,gt2,gt3,Yv,ZA,ZVL,ZVR,dYv,dZA,dZVL,dZVR,ctcplcFvFvAhL(gt1,gt2,gt3)& 
& ,ctcplcFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiChacHpmL = 0._dp 
ctcplChiChacHpmR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CT_CouplingChiChacHpm(gt1,gt2,gt3,g1,g2,gp,lam,ZP,ZN,UM,UP,dg1,dg2,              & 
& dgp,dlam,dZP,dZN,dUM,dUP,ctcplChiChacHpmL(gt1,gt2,gt3),ctcplChiChacHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChaFucSdL = 0._dp 
ctcplChaFucSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingChaFucSd(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,dg2,dYd,               & 
& dYu,dZD,dUM,dUP,dZUL,dZUR,ctcplChaFucSdL(gt1,gt2,gt3),ctcplChaFucSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChaFvcSeL = 0._dp 
ctcplChaFvcSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingChaFvcSe(gt1,gt2,gt3,g2,Ye,Yv,ZE,ZVL,ZVR,UM,UP,dg2,dYe,               & 
& dYv,dZE,dZVL,dZVR,dUM,dUP,ctcplChaFvcSeL(gt1,gt2,gt3),ctcplChaFvcSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcChaChahhL = 0._dp 
ctcplcChaChahhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CT_CouplingcChaChahh(gt1,gt2,gt3,g2,lam,ZH,UM,UP,dg2,dlam,dZH,dUM,               & 
& dUP,ctcplcChaChahhL(gt1,gt2,gt3),ctcplcChaChahhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFdChaSuL = 0._dp 
ctcplcFdChaSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CT_CouplingcFdChaSu(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,dg2,dYd,               & 
& dYu,dZU,dUM,dUP,dZDL,dZDR,ctcplcFdChaSuL(gt1,gt2,gt3),ctcplcFdChaSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFeChaSvL = 0._dp 
ctcplcFeChaSvR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 6
Call CT_CouplingcFeChaSv(gt1,gt2,gt3,g2,Ye,Yv,ZV,UM,UP,ZEL,ZER,dg2,dYe,               & 
& dYv,dZV,dUM,dUP,dZEL,dZER,ctcplcFeChaSvL(gt1,gt2,gt3),ctcplcFeChaSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiChihhL = 0._dp 
ctcplChiChihhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CT_CouplingChiChihh(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZH,ZN,dg1,dg2,dgp,              & 
& dlam,dkap,dZH,dZN,ctcplChiChihhL(gt1,gt2,gt3),ctcplChiChihhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiFdcSdL = 0._dp 
ctcplChiFdcSdR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingChiFdcSd(gt1,gt2,gt3,g1,g2,gp,Yd,ZD,ZN,ZDL,ZDR,dg1,dg2,               & 
& dgp,dYd,dZD,dZN,dZDL,dZDR,ctcplChiFdcSdL(gt1,gt2,gt3),ctcplChiFdcSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiFecSeL = 0._dp 
ctcplChiFecSeR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingChiFecSe(gt1,gt2,gt3,g1,g2,gp,Ye,ZE,ZN,ZEL,ZER,dg1,dg2,               & 
& dgp,dYe,dZE,dZN,dZEL,dZER,ctcplChiFecSeL(gt1,gt2,gt3),ctcplChiFecSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiFucSuL = 0._dp 
ctcplChiFucSuR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingChiFucSu(gt1,gt2,gt3,g1,g2,gp,Yu,ZU,ZN,ZUL,ZUR,dg1,dg2,               & 
& dgp,dYu,dZU,dZN,dZUL,dZUR,ctcplChiFucSuL(gt1,gt2,gt3),ctcplChiFucSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiFvcSvL = 0._dp 
ctcplChiFvcSvR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingChiFvcSv(gt1,gt2,gt3,g1,g2,gp,Yv,ZV,ZN,ZVL,ZVR,dg1,dg2,               & 
& dgp,dYv,dZV,dZN,dZVL,dZVR,ctcplChiFvcSvL(gt1,gt2,gt3),ctcplChiFvcSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcChaChiHpmL = 0._dp 
ctcplcChaChiHpmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 9
  Do gt3 = 1, 2
Call CT_CouplingcChaChiHpm(gt1,gt2,gt3,g1,g2,gp,lam,ZP,ZN,UM,UP,dg1,dg2,              & 
& dgp,dlam,dZP,dZN,dUM,dUP,ctcplcChaChiHpmL(gt1,gt2,gt3),ctcplcChaChiHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFdChiSdL = 0._dp 
ctcplcFdChiSdR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CT_CouplingcFdChiSd(gt1,gt2,gt3,g1,g2,gp,Yd,ZD,ZN,ZDL,ZDR,dg1,dg2,               & 
& dgp,dYd,dZD,dZN,dZDL,dZDR,ctcplcFdChiSdL(gt1,gt2,gt3),ctcplcFdChiSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFeChiSeL = 0._dp 
ctcplcFeChiSeR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CT_CouplingcFeChiSe(gt1,gt2,gt3,g1,g2,gp,Ye,ZE,ZN,ZEL,ZER,dg1,dg2,               & 
& dgp,dYe,dZE,dZN,dZEL,dZER,ctcplcFeChiSeL(gt1,gt2,gt3),ctcplcFeChiSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFuChiSuL = 0._dp 
ctcplcFuChiSuR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CT_CouplingcFuChiSu(gt1,gt2,gt3,g1,g2,gp,Yu,ZU,ZN,ZUL,ZUR,dg1,dg2,               & 
& dgp,dYu,dZU,dZN,dZUL,dZUR,ctcplcFuChiSuL(gt1,gt2,gt3),ctcplcFuChiSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFvChiSvL = 0._dp 
ctcplcFvChiSvR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 6
Call CT_CouplingcFvChiSv(gt1,gt2,gt3,g1,g2,gp,Yv,ZV,ZN,ZVL,ZVR,dg1,dg2,               & 
& dgp,dYv,dZV,dZN,dZVL,dZVR,ctcplcFvChiSvL(gt1,gt2,gt3),ctcplcFvChiSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplGluFdcSdL = 0._dp 
ctcplGluFdcSdR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CT_CouplingGluFdcSd(gt2,gt3,g3,pG,ZD,ZDL,ZDR,dg3,dpG,dZD,dZDL,dZDR,              & 
& ctcplGluFdcSdL(gt2,gt3),ctcplGluFdcSdR(gt2,gt3))

 End Do 
End Do 


ctcplcFdFdhhL = 0._dp 
ctcplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingcFdFdhh(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,dYd,dZH,dZDL,dZDR,ctcplcFdFdhhL(gt1,gt2,gt3)& 
& ,ctcplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcChaFdcSuL = 0._dp 
ctcplcChaFdcSuR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingcChaFdcSu(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,dg2,dYd,              & 
& dYu,dZU,dUM,dUP,dZDL,dZDR,ctcplcChaFdcSuL(gt1,gt2,gt3),ctcplcChaFdcSuR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFuFdcHpmL = 0._dp 
ctcplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CT_CouplingcFuFdcHpm(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,dYd,dYu,               & 
& dZP,dZDL,dZDR,dZUL,dZUR,ctcplcFuFdcHpmL(gt1,gt2,gt3),ctcplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFeFehhL = 0._dp 
ctcplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingcFeFehh(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,dYe,dZH,dZEL,dZER,ctcplcFeFehhL(gt1,gt2,gt3)& 
& ,ctcplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcChaFecSvL = 0._dp 
ctcplcChaFecSvR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingcChaFecSv(gt1,gt2,gt3,g2,Ye,Yv,ZV,UM,UP,ZEL,ZER,dg2,dYe,              & 
& dYv,dZV,dUM,dUP,dZEL,dZER,ctcplcChaFecSvL(gt1,gt2,gt3),ctcplcChaFecSvR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFvFecHpmL = 0._dp 
ctcplcFvFecHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CT_CouplingcFvFecHpm(gt1,gt2,gt3,Ye,Yv,ZP,ZVL,ZVR,ZEL,ZER,dYe,dYv,               & 
& dZP,dZVL,dZVR,dZEL,dZER,ctcplcFvFecHpmL(gt1,gt2,gt3),ctcplcFvFecHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplGluFucSuL = 0._dp 
ctcplGluFucSuR = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 6
Call CT_CouplingGluFucSu(gt2,gt3,g3,pG,ZU,ZUL,ZUR,dg3,dpG,dZU,dZUL,dZUR,              & 
& ctcplGluFucSuL(gt2,gt3),ctcplGluFucSuR(gt2,gt3))

 End Do 
End Do 


ctcplcFuFuhhL = 0._dp 
ctcplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingcFuFuhh(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,dYu,dZH,dZUL,dZUR,ctcplcFuFuhhL(gt1,gt2,gt3)& 
& ,ctcplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFdFuHpmL = 0._dp 
ctcplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CT_CouplingcFdFuHpm(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,dYd,dYu,dZP,            & 
& dZDL,dZDR,dZUL,dZUR,ctcplcFdFuHpmL(gt1,gt2,gt3),ctcplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFvFvhhL = 0._dp 
ctcplcFvFvhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingcFvFvhh(gt1,gt2,gt3,Yv,ZH,ZVL,ZVR,dYv,dZH,dZVL,dZVR,ctcplcFvFvhhL(gt1,gt2,gt3)& 
& ,ctcplcFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFeFvHpmL = 0._dp 
ctcplcFeFvHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CT_CouplingcFeFvHpm(gt1,gt2,gt3,Ye,Yv,ZP,ZVL,ZVR,ZEL,ZER,dYe,dYv,dZP,            & 
& dZVL,dZVR,dZEL,dZER,ctcplcFeFvHpmL(gt1,gt2,gt3),ctcplcFeFvHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFdGluSdL = 0._dp 
ctcplcFdGluSdR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CT_CouplingcFdGluSd(gt1,gt3,g3,pG,ZD,ZDL,ZDR,dg3,dpG,dZD,dZDL,dZDR,              & 
& ctcplcFdGluSdL(gt1,gt3),ctcplcFdGluSdR(gt1,gt3))

 End Do 
End Do 


ctcplcFuGluSuL = 0._dp 
ctcplcFuGluSuR = 0._dp 
Do gt1 = 1, 3
 Do gt3 = 1, 6
Call CT_CouplingcFuGluSu(gt1,gt3,g3,pG,ZU,ZUL,ZUR,dg3,dpG,dZU,dZUL,dZUR,              & 
& ctcplcFuGluSuL(gt1,gt3),ctcplcFuGluSuR(gt1,gt3))

 End Do 
End Do 


ctcplcChacFuSdL = 0._dp 
ctcplcChacFuSdR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingcChacFuSd(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,dg2,dYd,              & 
& dYu,dZD,dUM,dUP,dZUL,dZUR,ctcplcChacFuSdL(gt1,gt2,gt3),ctcplcChacFuSdR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcChacFvSeL = 0._dp 
ctcplcChacFvSeR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 6
Call CT_CouplingcChacFvSe(gt1,gt2,gt3,g2,Ye,Yv,ZE,ZVL,ZVR,UM,UP,dg2,dYe,              & 
& dYv,dZE,dZVL,dZVR,dUM,dUP,ctcplcChacFvSeL(gt1,gt2,gt3),ctcplcChacFvSeR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplChiChacVWmL = 0._dp 
ctcplChiChacVWmR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 2
Call CT_CouplingChiChacVWm(gt1,gt2,g2,ZN,UM,UP,dg2,dZN,dUM,dUP,ctcplChiChacVWmL(gt1,gt2)& 
& ,ctcplChiChacVWmR(gt1,gt2))

 End Do 
End Do 


ctcplcChaChaVPL = 0._dp 
ctcplcChaChaVPR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CT_CouplingcChaChaVP(gt1,gt2,g1,g2,UM,UP,TW,dg1,dg2,dUM,dUP,dSinTW,              & 
& dCosTW,dTanTW,ctcplcChaChaVPL(gt1,gt2),ctcplcChaChaVPR(gt1,gt2))

 End Do 
End Do 


ctcplcChaChaVZL = 0._dp 
ctcplcChaChaVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CT_CouplingcChaChaVZ(gt1,gt2,g1,g2,gp,UM,UP,TW,TWp,dg1,dg2,dgp,dUM,              & 
& dUP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcChaChaVZL(gt1,gt2)              & 
& ,ctcplcChaChaVZR(gt1,gt2))

 End Do 
End Do 


ctcplcChaChaVZpL = 0._dp 
ctcplcChaChaVZpR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CT_CouplingcChaChaVZp(gt1,gt2,g1,g2,gp,UM,UP,TW,TWp,dg1,dg2,dgp,dUM,             & 
& dUP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcChaChaVZpL(gt1,gt2)             & 
& ,ctcplcChaChaVZpR(gt1,gt2))

 End Do 
End Do 


ctcplChiChiVZL = 0._dp 
ctcplChiChiVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CT_CouplingChiChiVZ(gt1,gt2,g1,g2,gp,ZN,TW,TWp,dg1,dg2,dgp,dZN,dSinTW,           & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplChiChiVZL(gt1,gt2),ctcplChiChiVZR(gt1,gt2))

 End Do 
End Do 


ctcplChiChiVZpL = 0._dp 
ctcplChiChiVZpR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CT_CouplingChiChiVZp(gt1,gt2,g1,g2,gp,ZN,TW,TWp,dg1,dg2,dgp,dZN,dSinTW,          & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplChiChiVZpL(gt1,gt2),ctcplChiChiVZpR(gt1,gt2))

 End Do 
End Do 


ctcplcChaChiVWmL = 0._dp 
ctcplcChaChiVWmR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 9
Call CT_CouplingcChaChiVWm(gt1,gt2,g2,ZN,UM,UP,dg2,dZN,dUM,dUP,ctcplcChaChiVWmL(gt1,gt2)& 
& ,ctcplcChaChiVWmR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFdVGL = 0._dp 
ctcplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFdFdVG(gt1,gt2,g3,dg3,ctcplcFdFdVGL(gt1,gt2),ctcplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFdVPL = 0._dp 
ctcplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFdFdVP(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,ctcplcFdFdVPL(gt1,gt2)& 
& ,ctcplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFdVZL = 0._dp 
ctcplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFdFdVZ(gt1,gt2,g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,            & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcFdFdVZL(gt1,gt2),ctcplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFdVZpL = 0._dp 
ctcplcFdFdVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFdFdVZp(gt1,gt2,g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,           & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcFdFdVZpL(gt1,gt2),ctcplcFdFdVZpR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFdcVWmL = 0._dp 
ctcplcFuFdcVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFuFdcVWm(gt1,gt2,g2,ZDL,ZUL,dg2,dZDL,dZUL,ctcplcFuFdcVWmL(gt1,gt2)   & 
& ,ctcplcFuFdcVWmR(gt1,gt2))

 End Do 
End Do 


ctcplcFeFeVPL = 0._dp 
ctcplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFeFeVP(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,ctcplcFeFeVPL(gt1,gt2)& 
& ,ctcplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


ctcplcFeFeVZL = 0._dp 
ctcplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFeFeVZ(gt1,gt2,g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,            & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcFeFeVZL(gt1,gt2),ctcplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


ctcplcFeFeVZpL = 0._dp 
ctcplcFeFeVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFeFeVZp(gt1,gt2,g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,           & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcFeFeVZpL(gt1,gt2),ctcplcFeFeVZpR(gt1,gt2))

 End Do 
End Do 


ctcplcFvFecVWmL = 0._dp 
ctcplcFvFecVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFvFecVWm(gt1,gt2,g2,ZVL,ZEL,dg2,dZVL,dZEL,ctcplcFvFecVWmL(gt1,gt2)   & 
& ,ctcplcFvFecVWmR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFuVGL = 0._dp 
ctcplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFuFuVG(gt1,gt2,g3,dg3,ctcplcFuFuVGL(gt1,gt2),ctcplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFuVPL = 0._dp 
ctcplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFuFuVP(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,ctcplcFuFuVPL(gt1,gt2)& 
& ,ctcplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFuVWmL = 0._dp 
ctcplcFdFuVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFdFuVWm(gt1,gt2,g2,ZDL,ZUL,dg2,dZDL,dZUL,ctcplcFdFuVWmL(gt1,gt2)     & 
& ,ctcplcFdFuVWmR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFuVZL = 0._dp 
ctcplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFuFuVZ(gt1,gt2,g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,            & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcFuFuVZL(gt1,gt2),ctcplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFuVZpL = 0._dp 
ctcplcFuFuVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFuFuVZp(gt1,gt2,g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,           & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcFuFuVZpL(gt1,gt2),ctcplcFuFuVZpR(gt1,gt2))

 End Do 
End Do 


ctcplcFeFvVWmL = 0._dp 
ctcplcFeFvVWmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFeFvVWm(gt1,gt2,g2,ZVL,ZEL,dg2,dZVL,dZEL,ctcplcFeFvVWmL(gt1,gt2)     & 
& ,ctcplcFeFvVWmR(gt1,gt2))

 End Do 
End Do 


ctcplcFvFvVZL = 0._dp 
ctcplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFvFvVZ(gt1,gt2,g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,            & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcFvFvVZL(gt1,gt2),ctcplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


ctcplcFvFvVZpL = 0._dp 
ctcplcFvFvVZpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFvFvVZp(gt1,gt2,g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,           & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp,ctcplcFvFvVZpL(gt1,gt2),ctcplcFvFvVZpR(gt1,gt2))

 End Do 
End Do 


ctcplGluGluVGL = 0._dp 
ctcplGluGluVGR = 0._dp 
Call CT_CouplingGluGluVG(g3,pG,dg3,dpG,ctcplGluGluVGL,ctcplGluGluVGR)



Iname = Iname - 1 
End Subroutine CalculateCouplingCT

Subroutine CT_CouplingAhAhAh(gt1,gt2,gt3,lam,Tlam,kap,Tk,ZA,dlam,dTlam,               & 
& dkap,dTk,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: lam,Tlam,kap,Tk,ZA(6,6),dlam,dTlam,dkap,dTk,dZA(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhAhAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(Conjg(dZA(gt3,3))*Conjg(Tlam)*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,1)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt3,2))*Conjg(Tlam)*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,1)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt3,3))*Conjg(Tlam)*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,2)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt3,1))*Conjg(Tlam)*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,2)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt3,2))*Conjg(Tlam)*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,3)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt3,1))*Conjg(Tlam)*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,3)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt3,6))*Conjg(Tk)*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,4)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt3,5))*Conjg(Tk)*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,4)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt3,6))*Conjg(Tk)*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,5)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt3,4))*Conjg(Tk)*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,5)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt3,5))*Conjg(Tk)*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,6)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt3,4))*Conjg(Tk)*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,6)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt2,3))*Conjg(Tlam)*Conjg(ZA(gt1,2))*Conjg(ZA(gt3,1)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt2,2))*Conjg(Tlam)*Conjg(ZA(gt1,3))*Conjg(ZA(gt3,1)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,3))*Conjg(Tlam)*Conjg(ZA(gt2,2))*Conjg(ZA(gt3,1)))/(2._dp*sqrt(2._dp))
res = res+(dTlam*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,2))*Conjg(ZA(gt3,1)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dTlam)*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,2))*Conjg(ZA(gt3,1)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,2))*Conjg(Tlam)*Conjg(ZA(gt2,3))*Conjg(ZA(gt3,1)))/(2._dp*sqrt(2._dp))
res = res+(dTlam*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,3))*Conjg(ZA(gt3,1)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dTlam)*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,3))*Conjg(ZA(gt3,1)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt2,3))*Conjg(Tlam)*Conjg(ZA(gt1,1))*Conjg(ZA(gt3,2)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt2,1))*Conjg(Tlam)*Conjg(ZA(gt1,3))*Conjg(ZA(gt3,2)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,3))*Conjg(Tlam)*Conjg(ZA(gt2,1))*Conjg(ZA(gt3,2)))/(2._dp*sqrt(2._dp))
res = res+(dTlam*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,1))*Conjg(ZA(gt3,2)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dTlam)*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,1))*Conjg(ZA(gt3,2)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,1))*Conjg(Tlam)*Conjg(ZA(gt2,3))*Conjg(ZA(gt3,2)))/(2._dp*sqrt(2._dp))
res = res+(dTlam*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,3))*Conjg(ZA(gt3,2)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dTlam)*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,3))*Conjg(ZA(gt3,2)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt2,2))*Conjg(Tlam)*Conjg(ZA(gt1,1))*Conjg(ZA(gt3,3)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt2,1))*Conjg(Tlam)*Conjg(ZA(gt1,2))*Conjg(ZA(gt3,3)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,2))*Conjg(Tlam)*Conjg(ZA(gt2,1))*Conjg(ZA(gt3,3)))/(2._dp*sqrt(2._dp))
res = res+(dTlam*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,1))*Conjg(ZA(gt3,3)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dTlam)*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,1))*Conjg(ZA(gt3,3)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,1))*Conjg(Tlam)*Conjg(ZA(gt2,2))*Conjg(ZA(gt3,3)))/(2._dp*sqrt(2._dp))
res = res+(dTlam*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,2))*Conjg(ZA(gt3,3)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dTlam)*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,2))*Conjg(ZA(gt3,3)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt2,6))*Conjg(Tk)*Conjg(ZA(gt1,5))*Conjg(ZA(gt3,4)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt2,5))*Conjg(Tk)*Conjg(ZA(gt1,6))*Conjg(ZA(gt3,4)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,6))*Conjg(Tk)*Conjg(ZA(gt2,5))*Conjg(ZA(gt3,4)))/(6._dp*sqrt(2._dp))
res = res-(dTk*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,5))*Conjg(ZA(gt3,4)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dTk)*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,5))*Conjg(ZA(gt3,4)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,5))*Conjg(Tk)*Conjg(ZA(gt2,6))*Conjg(ZA(gt3,4)))/(6._dp*sqrt(2._dp))
res = res-(dTk*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,6))*Conjg(ZA(gt3,4)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dTk)*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,6))*Conjg(ZA(gt3,4)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt2,6))*Conjg(Tk)*Conjg(ZA(gt1,4))*Conjg(ZA(gt3,5)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt2,4))*Conjg(Tk)*Conjg(ZA(gt1,6))*Conjg(ZA(gt3,5)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,6))*Conjg(Tk)*Conjg(ZA(gt2,4))*Conjg(ZA(gt3,5)))/(6._dp*sqrt(2._dp))
res = res-(dTk*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,4))*Conjg(ZA(gt3,5)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dTk)*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,4))*Conjg(ZA(gt3,5)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,4))*Conjg(Tk)*Conjg(ZA(gt2,6))*Conjg(ZA(gt3,5)))/(6._dp*sqrt(2._dp))
res = res-(dTk*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,6))*Conjg(ZA(gt3,5)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dTk)*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,6))*Conjg(ZA(gt3,5)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt2,5))*Conjg(Tk)*Conjg(ZA(gt1,4))*Conjg(ZA(gt3,6)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt2,4))*Conjg(Tk)*Conjg(ZA(gt1,5))*Conjg(ZA(gt3,6)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,5))*Conjg(Tk)*Conjg(ZA(gt2,4))*Conjg(ZA(gt3,6)))/(6._dp*sqrt(2._dp))
res = res-(dTk*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,4))*Conjg(ZA(gt3,6)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dTk)*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,4))*Conjg(ZA(gt3,6)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,4))*Conjg(Tk)*Conjg(ZA(gt2,5))*Conjg(ZA(gt3,6)))/(6._dp*sqrt(2._dp))
res = res-(dTk*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,5))*Conjg(ZA(gt3,6)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dTk)*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,5))*Conjg(ZA(gt3,6)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt3,6))*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,4))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt3,5))*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,4))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt3,6))*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,5))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt3,4))*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,5))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt3,5))*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,6))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt3,4))*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,6))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt2,6))*Conjg(ZA(gt1,5))*Conjg(ZA(gt3,4))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt2,5))*Conjg(ZA(gt1,6))*Conjg(ZA(gt3,4))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,6))*Conjg(ZA(gt2,5))*Conjg(ZA(gt3,4))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,5))*Conjg(ZA(gt2,6))*Conjg(ZA(gt3,4))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt2,6))*Conjg(ZA(gt1,4))*Conjg(ZA(gt3,5))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt2,4))*Conjg(ZA(gt1,6))*Conjg(ZA(gt3,5))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,6))*Conjg(ZA(gt2,4))*Conjg(ZA(gt3,5))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,4))*Conjg(ZA(gt2,6))*Conjg(ZA(gt3,5))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt2,5))*Conjg(ZA(gt1,4))*Conjg(ZA(gt3,6))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt2,4))*Conjg(ZA(gt1,5))*Conjg(ZA(gt3,6))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,5))*Conjg(ZA(gt2,4))*Conjg(ZA(gt3,6))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,4))*Conjg(ZA(gt2,5))*Conjg(ZA(gt3,6))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt3,3))*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt3,2))*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt3,3))*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt3,1))*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt3,2))*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,3))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt3,1))*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,3))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt2,3))*Conjg(ZA(gt1,2))*Conjg(ZA(gt3,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt2,2))*Conjg(ZA(gt1,3))*Conjg(ZA(gt3,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,3))*Conjg(ZA(gt2,2))*Conjg(ZA(gt3,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,2))*Conjg(ZA(gt2,3))*Conjg(ZA(gt3,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt2,3))*Conjg(ZA(gt1,1))*Conjg(ZA(gt3,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt2,1))*Conjg(ZA(gt1,3))*Conjg(ZA(gt3,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,3))*Conjg(ZA(gt2,1))*Conjg(ZA(gt3,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,1))*Conjg(ZA(gt2,3))*Conjg(ZA(gt3,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt2,2))*Conjg(ZA(gt1,1))*Conjg(ZA(gt3,3))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt2,1))*Conjg(ZA(gt1,2))*Conjg(ZA(gt3,3))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,2))*Conjg(ZA(gt2,1))*Conjg(ZA(gt3,3))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,1))*Conjg(ZA(gt2,2))*Conjg(ZA(gt3,3))*Tlam)/(2._dp*sqrt(2._dp))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhAhAh  
 
 
Subroutine CT_CouplingAhAhhh(gt1,gt2,gt3,g1,g2,gp,lam,Tlam,kap,Tk,vd,vu,              & 
& vS,vS1,vS2,vS3,ZH,ZA,dg1,dg2,dgp,dlam,dTlam,dkap,dTk,dvd,dvu,dvS,dvS1,dvS2,            & 
& dvS3,dZH,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,dg1,dg2,dgp,dvd,dvu,dvS,dvS1,dvS2,dvS3

Complex(dp), Intent(in) :: lam,Tlam,kap,Tk,ZH(6,6),ZA(6,6),dlam,dTlam,dkap,dTk,dZH(6,6),dZA(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhAhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1**2*vd*Conjg(dZH(gt3,1))*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1)))/4._dp
res = res-(g2**2*vd*Conjg(dZH(gt3,1))*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1)))/4._dp
res = res-(gp**2*QHd**2*vd*Conjg(dZH(gt3,1))*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1)))
res = res+(g1**2*vu*Conjg(dZH(gt3,2))*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1)))/4._dp
res = res+(g2**2*vu*Conjg(dZH(gt3,2))*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1)))/4._dp
res = res-(gp**2*QHd*QHu*vu*Conjg(dZH(gt3,2))*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZH(gt3,2))*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1)))
res = res-(gp**2*QHd*Qs*vS*Conjg(dZH(gt3,3))*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt3,3))*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1)))
res = res-(gp**2*QHd*Qs1*vS1*Conjg(dZH(gt3,4))*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1)))
res = res-(gp**2*QHd*Qs2*vS2*Conjg(dZH(gt3,5))*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1)))
res = res-(gp**2*QHd*Qs3*vS3*Conjg(dZH(gt3,6))*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1)))
res = res-(Conjg(dZH(gt3,3))*Conjg(Tlam)*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,1)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,2))*Conjg(Tlam)*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,1)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,3))*Conjg(Tlam)*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,2)))/(2._dp*sqrt(2._dp))
res = res+(g1**2*vd*Conjg(dZH(gt3,1))*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2)))/4._dp
res = res+(g2**2*vd*Conjg(dZH(gt3,1))*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2)))/4._dp
res = res-(gp**2*QHd*QHu*vd*Conjg(dZH(gt3,1))*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZH(gt3,1))*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2)))
res = res-(g1**2*vu*Conjg(dZH(gt3,2))*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2)))/4._dp
res = res-(g2**2*vu*Conjg(dZH(gt3,2))*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2)))/4._dp
res = res-(gp**2*QHu**2*vu*Conjg(dZH(gt3,2))*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2)))
res = res-(gp**2*QHu*Qs*vS*Conjg(dZH(gt3,3))*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt3,3))*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2)))
res = res-(gp**2*QHu*Qs1*vS1*Conjg(dZH(gt3,4))*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2)))
res = res-(gp**2*QHu*Qs2*vS2*Conjg(dZH(gt3,5))*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2)))
res = res-(gp**2*QHu*Qs3*vS3*Conjg(dZH(gt3,6))*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2)))
res = res-(Conjg(dZH(gt3,1))*Conjg(Tlam)*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,2)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,2))*Conjg(Tlam)*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,3)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,1))*Conjg(Tlam)*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,3)))/(2._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs*vd*Conjg(dZH(gt3,1))*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZH(gt3,1))*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3)))
res = res-(gp**2*QHu*Qs*vu*Conjg(dZH(gt3,2))*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZH(gt3,2))*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3)))
res = res-(gp**2*Qs**2*vS*Conjg(dZH(gt3,3))*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3)))
res = res-(gp**2*Qs*Qs1*vS1*Conjg(dZH(gt3,4))*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3)))
res = res-(gp**2*Qs*Qs2*vS2*Conjg(dZH(gt3,5))*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3)))
res = res-(gp**2*Qs*Qs3*vS3*Conjg(dZH(gt3,6))*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3)))
res = res-(gp**2*QHd*Qs1*vd*Conjg(dZH(gt3,1))*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4)))
res = res-(gp**2*QHu*Qs1*vu*Conjg(dZH(gt3,2))*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4)))
res = res-(gp**2*Qs*Qs1*vS*Conjg(dZH(gt3,3))*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4)))
res = res-(gp**2*Qs1**2*vS1*Conjg(dZH(gt3,4))*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4)))
res = res-(gp**2*Qs1*Qs2*vS2*Conjg(dZH(gt3,5))*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZH(gt3,5))*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4)))/9._dp
res = res-(gp**2*Qs1*Qs3*vS3*Conjg(dZH(gt3,6))*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZH(gt3,6))*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4)))/9._dp
res = res+(Conjg(dZH(gt3,6))*Conjg(Tk)*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,4)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,5))*Conjg(Tk)*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,4)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,6))*Conjg(Tk)*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,5)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs2*vd*Conjg(dZH(gt3,1))*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5)))
res = res-(gp**2*QHu*Qs2*vu*Conjg(dZH(gt3,2))*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5)))
res = res-(gp**2*Qs*Qs2*vS*Conjg(dZH(gt3,3))*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5)))
res = res-(gp**2*Qs1*Qs2*vS1*Conjg(dZH(gt3,4))*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZH(gt3,4))*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5)))/9._dp
res = res-(gp**2*Qs2**2*vS2*Conjg(dZH(gt3,5))*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5)))
res = res-(gp**2*Qs2*Qs3*vS3*Conjg(dZH(gt3,6))*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZH(gt3,6))*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5)))/9._dp
res = res+(Conjg(dZH(gt3,4))*Conjg(Tk)*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,5)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,5))*Conjg(Tk)*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,6)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,4))*Conjg(Tk)*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,6)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs3*vd*Conjg(dZH(gt3,1))*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6)))
res = res-(gp**2*QHu*Qs3*vu*Conjg(dZH(gt3,2))*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6)))
res = res-(gp**2*Qs*Qs3*vS*Conjg(dZH(gt3,3))*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6)))
res = res-(gp**2*Qs1*Qs3*vS1*Conjg(dZH(gt3,4))*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZH(gt3,4))*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6)))/9._dp
res = res-(gp**2*Qs2*Qs3*vS2*Conjg(dZH(gt3,5))*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZH(gt3,5))*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6)))/9._dp
res = res-(gp**2*Qs3**2*vS3*Conjg(dZH(gt3,6))*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6)))
res = res-(g1**2*vd*Conjg(dZA(gt2,1))*Conjg(ZA(gt1,1))*Conjg(ZH(gt3,1)))/4._dp
res = res-(g2**2*vd*Conjg(dZA(gt2,1))*Conjg(ZA(gt1,1))*Conjg(ZH(gt3,1)))/4._dp
res = res-(gp**2*QHd**2*vd*Conjg(dZA(gt2,1))*Conjg(ZA(gt1,1))*Conjg(ZH(gt3,1)))
res = res+(g1**2*vd*Conjg(dZA(gt2,2))*Conjg(ZA(gt1,2))*Conjg(ZH(gt3,1)))/4._dp
res = res+(g2**2*vd*Conjg(dZA(gt2,2))*Conjg(ZA(gt1,2))*Conjg(ZH(gt3,1)))/4._dp
res = res-(gp**2*QHd*QHu*vd*Conjg(dZA(gt2,2))*Conjg(ZA(gt1,2))*Conjg(ZH(gt3,1)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZA(gt2,2))*Conjg(ZA(gt1,2))*Conjg(ZH(gt3,1)))
res = res-(Conjg(dZA(gt2,3))*Conjg(Tlam)*Conjg(ZA(gt1,2))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs*vd*Conjg(dZA(gt2,3))*Conjg(ZA(gt1,3))*Conjg(ZH(gt3,1)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZA(gt2,3))*Conjg(ZA(gt1,3))*Conjg(ZH(gt3,1)))
res = res-(Conjg(dZA(gt2,2))*Conjg(Tlam)*Conjg(ZA(gt1,3))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs1*vd*Conjg(dZA(gt2,4))*Conjg(ZA(gt1,4))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs2*vd*Conjg(dZA(gt2,5))*Conjg(ZA(gt1,5))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs3*vd*Conjg(dZA(gt2,6))*Conjg(ZA(gt1,6))*Conjg(ZH(gt3,1)))
res = res-(g1**2*vd*Conjg(dZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,1)))/4._dp
res = res-(g2**2*vd*Conjg(dZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,1)))/4._dp
res = res-(gp**2*QHd**2*vd*Conjg(dZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,1)))
res = res-(dvd*g1**2*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,1)))/4._dp
res = res-(dvd*g2**2*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,1)))/4._dp
res = res-(dvd*gp**2*QHd**2*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,1)))
res = res-(dg1*g1*vd*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,1)))/2._dp
res = res-(dg2*g2*vd*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,1)))/2._dp
res = res-2*dgp*gp*QHd**2*vd*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,1))
res = res+(g1**2*vd*Conjg(dZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,1)))/4._dp
res = res+(g2**2*vd*Conjg(dZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,1)))/4._dp
res = res-(gp**2*QHd*QHu*vd*Conjg(dZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,1)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,1)))
res = res-(Conjg(dZA(gt1,3))*Conjg(Tlam)*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res+(dvd*g1**2*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,1)))/4._dp
res = res+(dvd*g2**2*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,1)))/4._dp
res = res-(dvd*gp**2*QHd*QHu*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,1)))
res = res+(dg1*g1*vd*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,1)))/2._dp
res = res+(dg2*g2*vd*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,1)))/2._dp
res = res-2*dgp*gp*QHd*QHu*vd*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,1))
res = res-(vd*lam*Conjg(dlam)*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,1)))
res = res-(dlam*vd*Conjg(lam)*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,1)))
res = res-(dvd*lam*Conjg(lam)*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,1)))
res = res-(dTlam*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dTlam)*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs*vd*Conjg(dZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,1)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,1)))
res = res-(Conjg(dZA(gt1,2))*Conjg(Tlam)*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res-(dTlam*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dTlam)*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res-(dvd*gp**2*QHd*Qs*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,1)))
res = res-2*dgp*gp*QHd*Qs*vd*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,1))
res = res-(vd*lam*Conjg(dlam)*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,1)))
res = res-(dlam*vd*Conjg(lam)*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,1)))
res = res-(dvd*lam*Conjg(lam)*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs1*vd*Conjg(dZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,1)))
res = res-(dvd*gp**2*QHd*Qs1*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,1)))
res = res-2*dgp*gp*QHd*Qs1*vd*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,1))
res = res-(gp**2*QHd*Qs2*vd*Conjg(dZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,1)))
res = res-(dvd*gp**2*QHd*Qs2*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,1)))
res = res-2*dgp*gp*QHd*Qs2*vd*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,1))
res = res-(gp**2*QHd*Qs3*vd*Conjg(dZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,1)))
res = res-(dvd*gp**2*QHd*Qs3*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,1)))
res = res-2*dgp*gp*QHd*Qs3*vd*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,1))
res = res+(g1**2*vu*Conjg(dZA(gt2,1))*Conjg(ZA(gt1,1))*Conjg(ZH(gt3,2)))/4._dp
res = res+(g2**2*vu*Conjg(dZA(gt2,1))*Conjg(ZA(gt1,1))*Conjg(ZH(gt3,2)))/4._dp
res = res-(gp**2*QHd*QHu*vu*Conjg(dZA(gt2,1))*Conjg(ZA(gt1,1))*Conjg(ZH(gt3,2)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZA(gt2,1))*Conjg(ZA(gt1,1))*Conjg(ZH(gt3,2)))
res = res-(Conjg(dZA(gt2,3))*Conjg(Tlam)*Conjg(ZA(gt1,1))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res-(g1**2*vu*Conjg(dZA(gt2,2))*Conjg(ZA(gt1,2))*Conjg(ZH(gt3,2)))/4._dp
res = res-(g2**2*vu*Conjg(dZA(gt2,2))*Conjg(ZA(gt1,2))*Conjg(ZH(gt3,2)))/4._dp
res = res-(gp**2*QHu**2*vu*Conjg(dZA(gt2,2))*Conjg(ZA(gt1,2))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs*vu*Conjg(dZA(gt2,3))*Conjg(ZA(gt1,3))*Conjg(ZH(gt3,2)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZA(gt2,3))*Conjg(ZA(gt1,3))*Conjg(ZH(gt3,2)))
res = res-(Conjg(dZA(gt2,1))*Conjg(Tlam)*Conjg(ZA(gt1,3))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res-(gp**2*QHu*Qs1*vu*Conjg(dZA(gt2,4))*Conjg(ZA(gt1,4))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs2*vu*Conjg(dZA(gt2,5))*Conjg(ZA(gt1,5))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs3*vu*Conjg(dZA(gt2,6))*Conjg(ZA(gt1,6))*Conjg(ZH(gt3,2)))
res = res+(g1**2*vu*Conjg(dZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,2)))/4._dp
res = res+(g2**2*vu*Conjg(dZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,2)))/4._dp
res = res-(gp**2*QHd*QHu*vu*Conjg(dZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,2)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,2)))
res = res-(Conjg(dZA(gt1,3))*Conjg(Tlam)*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res+(dvu*g1**2*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,2)))/4._dp
res = res+(dvu*g2**2*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,2)))/4._dp
res = res-(dvu*gp**2*QHd*QHu*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,2)))
res = res+(dg1*g1*vu*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,2)))/2._dp
res = res+(dg2*g2*vu*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,2)))/2._dp
res = res-2*dgp*gp*QHd*QHu*vu*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,2))
res = res-(vu*lam*Conjg(dlam)*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,2)))
res = res-(dlam*vu*Conjg(lam)*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,2)))
res = res-(dvu*lam*Conjg(lam)*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,2)))
res = res-(dTlam*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dTlam)*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res-(g1**2*vu*Conjg(dZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,2)))/4._dp
res = res-(g2**2*vu*Conjg(dZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,2)))/4._dp
res = res-(gp**2*QHu**2*vu*Conjg(dZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,2)))
res = res-(dvu*g1**2*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,2)))/4._dp
res = res-(dvu*g2**2*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,2)))/4._dp
res = res-(dvu*gp**2*QHu**2*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,2)))
res = res-(dg1*g1*vu*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,2)))/2._dp
res = res-(dg2*g2*vu*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,2)))/2._dp
res = res-2*dgp*gp*QHu**2*vu*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,2))
res = res-(gp**2*QHu*Qs*vu*Conjg(dZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,2)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,2)))
res = res-(Conjg(dZA(gt1,1))*Conjg(Tlam)*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res-(dTlam*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dTlam)*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res-(dvu*gp**2*QHu*Qs*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,2)))
res = res-2*dgp*gp*QHu*Qs*vu*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,2))
res = res-(vu*lam*Conjg(dlam)*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,2)))
res = res-(dlam*vu*Conjg(lam)*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,2)))
res = res-(dvu*lam*Conjg(lam)*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs1*vu*Conjg(dZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,2)))
res = res-(dvu*gp**2*QHu*Qs1*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,2)))
res = res-2*dgp*gp*QHu*Qs1*vu*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,2))
res = res-(gp**2*QHu*Qs2*vu*Conjg(dZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,2)))
res = res-(dvu*gp**2*QHu*Qs2*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,2)))
res = res-2*dgp*gp*QHu*Qs2*vu*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,2))
res = res-(gp**2*QHu*Qs3*vu*Conjg(dZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,2)))
res = res-(dvu*gp**2*QHu*Qs3*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,2)))
res = res-2*dgp*gp*QHu*Qs3*vu*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,2))
res = res-(gp**2*QHd*Qs*vS*Conjg(dZA(gt2,1))*Conjg(ZA(gt1,1))*Conjg(ZH(gt3,3)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZA(gt2,1))*Conjg(ZA(gt1,1))*Conjg(ZH(gt3,3)))
res = res-(Conjg(dZA(gt2,2))*Conjg(Tlam)*Conjg(ZA(gt1,1))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res-(gp**2*QHu*Qs*vS*Conjg(dZA(gt2,2))*Conjg(ZA(gt1,2))*Conjg(ZH(gt3,3)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZA(gt2,2))*Conjg(ZA(gt1,2))*Conjg(ZH(gt3,3)))
res = res-(Conjg(dZA(gt2,1))*Conjg(Tlam)*Conjg(ZA(gt1,2))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res-(gp**2*Qs**2*vS*Conjg(dZA(gt2,3))*Conjg(ZA(gt1,3))*Conjg(ZH(gt3,3)))
res = res-(gp**2*Qs*Qs1*vS*Conjg(dZA(gt2,4))*Conjg(ZA(gt1,4))*Conjg(ZH(gt3,3)))
res = res-(gp**2*Qs*Qs2*vS*Conjg(dZA(gt2,5))*Conjg(ZA(gt1,5))*Conjg(ZH(gt3,3)))
res = res-(gp**2*Qs*Qs3*vS*Conjg(dZA(gt2,6))*Conjg(ZA(gt1,6))*Conjg(ZH(gt3,3)))
res = res-(gp**2*QHd*Qs*vS*Conjg(dZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,3)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,3)))
res = res-(Conjg(dZA(gt1,2))*Conjg(Tlam)*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res-(dvS*gp**2*QHd*Qs*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,3)))
res = res-2*dgp*gp*QHd*Qs*vS*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,3))
res = res-(vS*lam*Conjg(dlam)*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,3)))
res = res-(dlam*vS*Conjg(lam)*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,3)))
res = res-(dvS*lam*Conjg(lam)*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,3)))
res = res-(dTlam*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dTlam)*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res-(gp**2*QHu*Qs*vS*Conjg(dZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,3)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,3)))
res = res-(Conjg(dZA(gt1,1))*Conjg(Tlam)*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res-(dTlam*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dTlam)*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res-(dvS*gp**2*QHu*Qs*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,3)))
res = res-2*dgp*gp*QHu*Qs*vS*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,3))
res = res-(vS*lam*Conjg(dlam)*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,3)))
res = res-(dlam*vS*Conjg(lam)*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,3)))
res = res-(dvS*lam*Conjg(lam)*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,3)))
res = res-(gp**2*Qs**2*vS*Conjg(dZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,3)))
res = res-(dvS*gp**2*Qs**2*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,3)))
res = res-2*dgp*gp*Qs**2*vS*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,3))
res = res-(gp**2*Qs*Qs1*vS*Conjg(dZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,3)))
res = res-(dvS*gp**2*Qs*Qs1*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,3)))
res = res-2*dgp*gp*Qs*Qs1*vS*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,3))
res = res-(gp**2*Qs*Qs2*vS*Conjg(dZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,3)))
res = res-(dvS*gp**2*Qs*Qs2*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,3)))
res = res-2*dgp*gp*Qs*Qs2*vS*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,3))
res = res-(gp**2*Qs*Qs3*vS*Conjg(dZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,3)))
res = res-(dvS*gp**2*Qs*Qs3*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,3)))
res = res-2*dgp*gp*Qs*Qs3*vS*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,3))
res = res-(gp**2*QHd*Qs1*vS1*Conjg(dZA(gt2,1))*Conjg(ZA(gt1,1))*Conjg(ZH(gt3,4)))
res = res-(gp**2*QHu*Qs1*vS1*Conjg(dZA(gt2,2))*Conjg(ZA(gt1,2))*Conjg(ZH(gt3,4)))
res = res-(gp**2*Qs*Qs1*vS1*Conjg(dZA(gt2,3))*Conjg(ZA(gt1,3))*Conjg(ZH(gt3,4)))
res = res-(gp**2*Qs1**2*vS1*Conjg(dZA(gt2,4))*Conjg(ZA(gt1,4))*Conjg(ZH(gt3,4)))
res = res-(gp**2*Qs1*Qs2*vS1*Conjg(dZA(gt2,5))*Conjg(ZA(gt1,5))*Conjg(ZH(gt3,4)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZA(gt2,5))*Conjg(ZA(gt1,5))*Conjg(ZH(gt3,4)))/9._dp
res = res+(Conjg(dZA(gt2,6))*Conjg(Tk)*Conjg(ZA(gt1,5))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*Qs1*Qs3*vS1*Conjg(dZA(gt2,6))*Conjg(ZA(gt1,6))*Conjg(ZH(gt3,4)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZA(gt2,6))*Conjg(ZA(gt1,6))*Conjg(ZH(gt3,4)))/9._dp
res = res+(Conjg(dZA(gt2,5))*Conjg(Tk)*Conjg(ZA(gt1,6))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs1*vS1*Conjg(dZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,4)))
res = res-(dvS1*gp**2*QHd*Qs1*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,4)))
res = res-2*dgp*gp*QHd*Qs1*vS1*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,4))
res = res-(gp**2*QHu*Qs1*vS1*Conjg(dZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,4)))
res = res-(dvS1*gp**2*QHu*Qs1*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,4)))
res = res-2*dgp*gp*QHu*Qs1*vS1*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,4))
res = res-(gp**2*Qs*Qs1*vS1*Conjg(dZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,4)))
res = res-(dvS1*gp**2*Qs*Qs1*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,4)))
res = res-2*dgp*gp*Qs*Qs1*vS1*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,4))
res = res-(gp**2*Qs1**2*vS1*Conjg(dZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,4)))
res = res-(dvS1*gp**2*Qs1**2*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,4)))
res = res-2*dgp*gp*Qs1**2*vS1*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,4))
res = res-(gp**2*Qs1*Qs2*vS1*Conjg(dZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,4)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,4)))/9._dp
res = res+(Conjg(dZA(gt1,6))*Conjg(Tk)*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res-(dvS1*gp**2*Qs1*Qs2*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,4)))
res = res-2*dgp*gp*Qs1*Qs2*vS1*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,4))
res = res-(vS1*kap*Conjg(dkap)*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,4)))/9._dp
res = res-(dkap*vS1*Conjg(kap)*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,4)))/9._dp
res = res-(dvS1*kap*Conjg(kap)*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,4)))/9._dp
res = res+(dTk*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dTk)*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*Qs1*Qs3*vS1*Conjg(dZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,4)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,4)))/9._dp
res = res+(Conjg(dZA(gt1,5))*Conjg(Tk)*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res+(dTk*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dTk)*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res-(dvS1*gp**2*Qs1*Qs3*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,4)))
res = res-2*dgp*gp*Qs1*Qs3*vS1*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,4))
res = res-(vS1*kap*Conjg(dkap)*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,4)))/9._dp
res = res-(dkap*vS1*Conjg(kap)*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,4)))/9._dp
res = res-(dvS1*kap*Conjg(kap)*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,4)))/9._dp
res = res-(gp**2*QHd*Qs2*vS2*Conjg(dZA(gt2,1))*Conjg(ZA(gt1,1))*Conjg(ZH(gt3,5)))
res = res-(gp**2*QHu*Qs2*vS2*Conjg(dZA(gt2,2))*Conjg(ZA(gt1,2))*Conjg(ZH(gt3,5)))
res = res-(gp**2*Qs*Qs2*vS2*Conjg(dZA(gt2,3))*Conjg(ZA(gt1,3))*Conjg(ZH(gt3,5)))
res = res-(gp**2*Qs1*Qs2*vS2*Conjg(dZA(gt2,4))*Conjg(ZA(gt1,4))*Conjg(ZH(gt3,5)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZA(gt2,4))*Conjg(ZA(gt1,4))*Conjg(ZH(gt3,5)))/9._dp
res = res+(Conjg(dZA(gt2,6))*Conjg(Tk)*Conjg(ZA(gt1,4))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*Qs2**2*vS2*Conjg(dZA(gt2,5))*Conjg(ZA(gt1,5))*Conjg(ZH(gt3,5)))
res = res-(gp**2*Qs2*Qs3*vS2*Conjg(dZA(gt2,6))*Conjg(ZA(gt1,6))*Conjg(ZH(gt3,5)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZA(gt2,6))*Conjg(ZA(gt1,6))*Conjg(ZH(gt3,5)))/9._dp
res = res+(Conjg(dZA(gt2,4))*Conjg(Tk)*Conjg(ZA(gt1,6))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs2*vS2*Conjg(dZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,5)))
res = res-(dvS2*gp**2*QHd*Qs2*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,5)))
res = res-2*dgp*gp*QHd*Qs2*vS2*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,5))
res = res-(gp**2*QHu*Qs2*vS2*Conjg(dZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,5)))
res = res-(dvS2*gp**2*QHu*Qs2*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,5)))
res = res-2*dgp*gp*QHu*Qs2*vS2*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,5))
res = res-(gp**2*Qs*Qs2*vS2*Conjg(dZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,5)))
res = res-(dvS2*gp**2*Qs*Qs2*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,5)))
res = res-2*dgp*gp*Qs*Qs2*vS2*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,5))
res = res-(gp**2*Qs1*Qs2*vS2*Conjg(dZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,5)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,5)))/9._dp
res = res+(Conjg(dZA(gt1,6))*Conjg(Tk)*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res-(dvS2*gp**2*Qs1*Qs2*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,5)))
res = res-2*dgp*gp*Qs1*Qs2*vS2*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,5))
res = res-(vS2*kap*Conjg(dkap)*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,5)))/9._dp
res = res-(dkap*vS2*Conjg(kap)*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,5)))/9._dp
res = res-(dvS2*kap*Conjg(kap)*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,5)))/9._dp
res = res+(dTk*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dTk)*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*Qs2**2*vS2*Conjg(dZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,5)))
res = res-(dvS2*gp**2*Qs2**2*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,5)))
res = res-2*dgp*gp*Qs2**2*vS2*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,5))
res = res-(gp**2*Qs2*Qs3*vS2*Conjg(dZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,5)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,5)))/9._dp
res = res+(Conjg(dZA(gt1,4))*Conjg(Tk)*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res+(dTk*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dTk)*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res-(dvS2*gp**2*Qs2*Qs3*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,5)))
res = res-2*dgp*gp*Qs2*Qs3*vS2*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,5))
res = res-(vS2*kap*Conjg(dkap)*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,5)))/9._dp
res = res-(dkap*vS2*Conjg(kap)*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,5)))/9._dp
res = res-(dvS2*kap*Conjg(kap)*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,5)))/9._dp
res = res-(gp**2*QHd*Qs3*vS3*Conjg(dZA(gt2,1))*Conjg(ZA(gt1,1))*Conjg(ZH(gt3,6)))
res = res-(gp**2*QHu*Qs3*vS3*Conjg(dZA(gt2,2))*Conjg(ZA(gt1,2))*Conjg(ZH(gt3,6)))
res = res-(gp**2*Qs*Qs3*vS3*Conjg(dZA(gt2,3))*Conjg(ZA(gt1,3))*Conjg(ZH(gt3,6)))
res = res-(gp**2*Qs1*Qs3*vS3*Conjg(dZA(gt2,4))*Conjg(ZA(gt1,4))*Conjg(ZH(gt3,6)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZA(gt2,4))*Conjg(ZA(gt1,4))*Conjg(ZH(gt3,6)))/9._dp
res = res+(Conjg(dZA(gt2,5))*Conjg(Tk)*Conjg(ZA(gt1,4))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*Qs2*Qs3*vS3*Conjg(dZA(gt2,5))*Conjg(ZA(gt1,5))*Conjg(ZH(gt3,6)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZA(gt2,5))*Conjg(ZA(gt1,5))*Conjg(ZH(gt3,6)))/9._dp
res = res+(Conjg(dZA(gt2,4))*Conjg(Tk)*Conjg(ZA(gt1,5))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*Qs3**2*vS3*Conjg(dZA(gt2,6))*Conjg(ZA(gt1,6))*Conjg(ZH(gt3,6)))
res = res-(gp**2*QHd*Qs3*vS3*Conjg(dZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,6)))
res = res-(dvS3*gp**2*QHd*Qs3*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,6)))
res = res-2*dgp*gp*QHd*Qs3*vS3*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,6))
res = res-(gp**2*QHu*Qs3*vS3*Conjg(dZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,6)))
res = res-(dvS3*gp**2*QHu*Qs3*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,6)))
res = res-2*dgp*gp*QHu*Qs3*vS3*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,6))
res = res-(gp**2*Qs*Qs3*vS3*Conjg(dZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,6)))
res = res-(dvS3*gp**2*Qs*Qs3*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,6)))
res = res-2*dgp*gp*Qs*Qs3*vS3*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,6))
res = res-(gp**2*Qs1*Qs3*vS3*Conjg(dZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,6)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,6)))/9._dp
res = res+(Conjg(dZA(gt1,5))*Conjg(Tk)*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res-(dvS3*gp**2*Qs1*Qs3*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,6)))
res = res-2*dgp*gp*Qs1*Qs3*vS3*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,6))
res = res-(vS3*kap*Conjg(dkap)*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,6)))/9._dp
res = res-(dkap*vS3*Conjg(kap)*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,6)))/9._dp
res = res-(dvS3*kap*Conjg(kap)*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,6)))/9._dp
res = res+(dTk*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dTk)*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*Qs2*Qs3*vS3*Conjg(dZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,6)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,6)))/9._dp
res = res+(Conjg(dZA(gt1,4))*Conjg(Tk)*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res+(dTk*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dTk)*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res-(dvS3*gp**2*Qs2*Qs3*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,6)))
res = res-2*dgp*gp*Qs2*Qs3*vS3*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,6))
res = res-(vS3*kap*Conjg(dkap)*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,6)))/9._dp
res = res-(dkap*vS3*Conjg(kap)*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,6)))/9._dp
res = res-(dvS3*kap*Conjg(kap)*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,6)))/9._dp
res = res-(gp**2*Qs3**2*vS3*Conjg(dZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,6)))
res = res-(dvS3*gp**2*Qs3**2*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,6)))
res = res-2*dgp*gp*Qs3**2*vS3*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,6))
res = res+(Conjg(dZH(gt3,6))*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,4))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,5))*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,4))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,6))*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,5))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,4))*Conjg(ZA(gt1,6))*Conjg(ZA(gt2,5))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,5))*Conjg(ZA(gt1,4))*Conjg(ZA(gt2,6))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,4))*Conjg(ZA(gt1,5))*Conjg(ZA(gt2,6))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt2,6))*Conjg(ZA(gt1,5))*Conjg(ZH(gt3,4))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt2,5))*Conjg(ZA(gt1,6))*Conjg(ZH(gt3,4))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,6))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,4))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,5))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,4))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt2,6))*Conjg(ZA(gt1,4))*Conjg(ZH(gt3,5))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt2,4))*Conjg(ZA(gt1,6))*Conjg(ZH(gt3,5))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,6))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,5))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,4))*Conjg(ZA(gt2,6))*Conjg(ZH(gt3,5))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt2,5))*Conjg(ZA(gt1,4))*Conjg(ZH(gt3,6))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt2,4))*Conjg(ZA(gt1,5))*Conjg(ZH(gt3,6))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,5))*Conjg(ZA(gt2,4))*Conjg(ZH(gt3,6))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,4))*Conjg(ZA(gt2,5))*Conjg(ZH(gt3,6))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,3))*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,2))*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,3))*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,1))*Conjg(ZA(gt1,3))*Conjg(ZA(gt2,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,2))*Conjg(ZA(gt1,1))*Conjg(ZA(gt2,3))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,1))*Conjg(ZA(gt1,2))*Conjg(ZA(gt2,3))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt2,3))*Conjg(ZA(gt1,2))*Conjg(ZH(gt3,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt2,2))*Conjg(ZA(gt1,3))*Conjg(ZH(gt3,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,3))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,2))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt2,3))*Conjg(ZA(gt1,1))*Conjg(ZH(gt3,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt2,1))*Conjg(ZA(gt1,3))*Conjg(ZH(gt3,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,3))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,1))*Conjg(ZA(gt2,3))*Conjg(ZH(gt3,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt2,2))*Conjg(ZA(gt1,1))*Conjg(ZH(gt3,3))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt2,1))*Conjg(ZA(gt1,2))*Conjg(ZH(gt3,3))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,2))*Conjg(ZA(gt2,1))*Conjg(ZH(gt3,3))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,1))*Conjg(ZA(gt2,2))*Conjg(ZH(gt3,3))*Tlam)/(2._dp*sqrt(2._dp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhAhhh  
 
 
Subroutine CT_CouplingAhhhhh(gt1,gt2,gt3,lam,Tlam,kap,Tk,ZH,ZA,dlam,dTlam,            & 
& dkap,dTk,dZH,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: lam,Tlam,kap,Tk,ZH(6,6),ZA(6,6),dlam,dTlam,dkap,dTk,dZH(6,6),dZA(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(Conjg(dZH(gt3,3))*Conjg(Tlam)*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,1)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,2))*Conjg(Tlam)*Conjg(ZA(gt1,3))*Conjg(ZH(gt2,1)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,3))*Conjg(Tlam)*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,2)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,1))*Conjg(Tlam)*Conjg(ZA(gt1,3))*Conjg(ZH(gt2,2)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,2))*Conjg(Tlam)*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,3)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,1))*Conjg(Tlam)*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,3)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,6))*Conjg(Tk)*Conjg(ZA(gt1,5))*Conjg(ZH(gt2,4)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,5))*Conjg(Tk)*Conjg(ZA(gt1,6))*Conjg(ZH(gt2,4)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,6))*Conjg(Tk)*Conjg(ZA(gt1,4))*Conjg(ZH(gt2,5)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,4))*Conjg(Tk)*Conjg(ZA(gt1,6))*Conjg(ZH(gt2,5)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,5))*Conjg(Tk)*Conjg(ZA(gt1,4))*Conjg(ZH(gt2,6)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,4))*Conjg(Tk)*Conjg(ZA(gt1,5))*Conjg(ZH(gt2,6)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt2,3))*Conjg(Tlam)*Conjg(ZA(gt1,2))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt2,2))*Conjg(Tlam)*Conjg(ZA(gt1,3))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,3))*Conjg(Tlam)*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res-(dTlam*Conjg(ZA(gt1,3))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dTlam)*Conjg(ZA(gt1,3))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,2))*Conjg(Tlam)*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res-(dTlam*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dTlam)*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt2,3))*Conjg(Tlam)*Conjg(ZA(gt1,1))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt2,1))*Conjg(Tlam)*Conjg(ZA(gt1,3))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,3))*Conjg(Tlam)*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res-(dTlam*Conjg(ZA(gt1,3))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dTlam)*Conjg(ZA(gt1,3))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,1))*Conjg(Tlam)*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res-(dTlam*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dTlam)*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt2,2))*Conjg(Tlam)*Conjg(ZA(gt1,1))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt2,1))*Conjg(Tlam)*Conjg(ZA(gt1,2))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,2))*Conjg(Tlam)*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res-(dTlam*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dTlam)*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,1))*Conjg(Tlam)*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res-(dTlam*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dTlam)*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt2,6))*Conjg(Tk)*Conjg(ZA(gt1,5))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt2,5))*Conjg(Tk)*Conjg(ZA(gt1,6))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,6))*Conjg(Tk)*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res+(dTk*Conjg(ZA(gt1,6))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dTk)*Conjg(ZA(gt1,6))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,5))*Conjg(Tk)*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res+(dTk*Conjg(ZA(gt1,5))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dTk)*Conjg(ZA(gt1,5))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt2,6))*Conjg(Tk)*Conjg(ZA(gt1,4))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt2,4))*Conjg(Tk)*Conjg(ZA(gt1,6))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,6))*Conjg(Tk)*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res+(dTk*Conjg(ZA(gt1,6))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dTk)*Conjg(ZA(gt1,6))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,4))*Conjg(Tk)*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res+(dTk*Conjg(ZA(gt1,4))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dTk)*Conjg(ZA(gt1,4))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt2,5))*Conjg(Tk)*Conjg(ZA(gt1,4))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt2,4))*Conjg(Tk)*Conjg(ZA(gt1,5))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,5))*Conjg(Tk)*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res+(dTk*Conjg(ZA(gt1,5))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dTk)*Conjg(ZA(gt1,5))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,4))*Conjg(Tk)*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res+(dTk*Conjg(ZA(gt1,4))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dTk)*Conjg(ZA(gt1,4))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,6))*Conjg(ZA(gt1,5))*Conjg(ZH(gt2,4))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,5))*Conjg(ZA(gt1,6))*Conjg(ZH(gt2,4))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,6))*Conjg(ZA(gt1,4))*Conjg(ZH(gt2,5))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,4))*Conjg(ZA(gt1,6))*Conjg(ZH(gt2,5))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,5))*Conjg(ZA(gt1,4))*Conjg(ZH(gt2,6))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,4))*Conjg(ZA(gt1,5))*Conjg(ZH(gt2,6))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt2,6))*Conjg(ZA(gt1,5))*Conjg(ZH(gt3,4))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt2,5))*Conjg(ZA(gt1,6))*Conjg(ZH(gt3,4))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,6))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,5))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt2,6))*Conjg(ZA(gt1,4))*Conjg(ZH(gt3,5))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt2,4))*Conjg(ZA(gt1,6))*Conjg(ZH(gt3,5))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,6))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,4))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt2,5))*Conjg(ZA(gt1,4))*Conjg(ZH(gt3,6))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt2,4))*Conjg(ZA(gt1,5))*Conjg(ZH(gt3,6))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,5))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZA(gt1,4))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,3))*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,2))*Conjg(ZA(gt1,3))*Conjg(ZH(gt2,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,3))*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,1))*Conjg(ZA(gt1,3))*Conjg(ZH(gt2,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,2))*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,3))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,1))*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,3))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt2,3))*Conjg(ZA(gt1,2))*Conjg(ZH(gt3,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt2,2))*Conjg(ZA(gt1,3))*Conjg(ZH(gt3,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,3))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,2))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt2,3))*Conjg(ZA(gt1,1))*Conjg(ZH(gt3,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt2,1))*Conjg(ZA(gt1,3))*Conjg(ZH(gt3,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,3))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,1))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt2,2))*Conjg(ZA(gt1,1))*Conjg(ZH(gt3,3))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt2,1))*Conjg(ZA(gt1,2))*Conjg(ZH(gt3,3))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3))*Tlam)/(2._dp*sqrt(2._dp))
res = res-(Conjg(dZA(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3))*Tlam)/(2._dp*sqrt(2._dp))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhhhhh  
 
 
Subroutine CT_CouplingAhHpmcHpm(gt1,gt2,gt3,g2,lam,Tlam,vd,vu,ZA,ZP,dg2,              & 
& dlam,dTlam,dvd,dvu,dZA,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,vd,vu,ZP(2,2),dg2,dvd,dvu,dZP(2,2)

Complex(dp), Intent(in) :: lam,Tlam,ZA(6,6),dlam,dTlam,dZA(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhHpmcHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*vu*Conjg(ZA(gt1,1))*dZP(gt3,2)*ZP(gt2,1))/4._dp
res = res+(vu*lam*Conjg(lam)*Conjg(ZA(gt1,1))*dZP(gt3,2)*ZP(gt2,1))/2._dp
res = res-(g2**2*vd*Conjg(ZA(gt1,2))*dZP(gt3,2)*ZP(gt2,1))/4._dp
res = res+(vd*lam*Conjg(lam)*Conjg(ZA(gt1,2))*dZP(gt3,2)*ZP(gt2,1))/2._dp
res = res+(Conjg(ZA(gt1,3))*dZP(gt3,2)*Tlam*ZP(gt2,1))/sqrt(2._dp)
res = res+(g2**2*vu*Conjg(ZA(gt1,1))*dZP(gt3,1)*ZP(gt2,2))/4._dp
res = res-(vu*lam*Conjg(lam)*Conjg(ZA(gt1,1))*dZP(gt3,1)*ZP(gt2,2))/2._dp
res = res+(g2**2*vd*Conjg(ZA(gt1,2))*dZP(gt3,1)*ZP(gt2,2))/4._dp
res = res-(vd*lam*Conjg(lam)*Conjg(ZA(gt1,2))*dZP(gt3,1)*ZP(gt2,2))/2._dp
res = res-((Conjg(Tlam)*Conjg(ZA(gt1,3))*dZP(gt3,1)*ZP(gt2,2))/sqrt(2._dp))
res = res+(g2**2*vu*Conjg(ZA(gt1,1))*dZP(gt2,2)*ZP(gt3,1))/4._dp
res = res-(vu*lam*Conjg(lam)*Conjg(ZA(gt1,1))*dZP(gt2,2)*ZP(gt3,1))/2._dp
res = res+(g2**2*vd*Conjg(ZA(gt1,2))*dZP(gt2,2)*ZP(gt3,1))/4._dp
res = res-(vd*lam*Conjg(lam)*Conjg(ZA(gt1,2))*dZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-((Conjg(Tlam)*Conjg(ZA(gt1,3))*dZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp))
res = res+(g2**2*vu*Conjg(dZA(gt1,1))*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res-(vu*lam*Conjg(lam)*Conjg(dZA(gt1,1))*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res+(g2**2*vd*Conjg(dZA(gt1,2))*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res-(vd*lam*Conjg(lam)*Conjg(dZA(gt1,2))*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-((Conjg(dZA(gt1,3))*Conjg(Tlam)*ZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp))
res = res+(dvu*g2**2*Conjg(ZA(gt1,1))*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res+(dg2*g2*vu*Conjg(ZA(gt1,1))*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(vu*lam*Conjg(dlam)*Conjg(ZA(gt1,1))*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(dlam*vu*Conjg(lam)*Conjg(ZA(gt1,1))*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(dvu*lam*Conjg(lam)*Conjg(ZA(gt1,1))*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res+(dvd*g2**2*Conjg(ZA(gt1,2))*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res+(dg2*g2*vd*Conjg(ZA(gt1,2))*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(vd*lam*Conjg(dlam)*Conjg(ZA(gt1,2))*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(dlam*vd*Conjg(lam)*Conjg(ZA(gt1,2))*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(dvd*lam*Conjg(lam)*Conjg(ZA(gt1,2))*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-((Conjg(dTlam)*Conjg(ZA(gt1,3))*ZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp))
res = res-(g2**2*vu*Conjg(ZA(gt1,1))*dZP(gt2,1)*ZP(gt3,2))/4._dp
res = res+(vu*lam*Conjg(lam)*Conjg(ZA(gt1,1))*dZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(g2**2*vd*Conjg(ZA(gt1,2))*dZP(gt2,1)*ZP(gt3,2))/4._dp
res = res+(vd*lam*Conjg(lam)*Conjg(ZA(gt1,2))*dZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(Conjg(ZA(gt1,3))*dZP(gt2,1)*Tlam*ZP(gt3,2))/sqrt(2._dp)
res = res-(g2**2*vu*Conjg(dZA(gt1,1))*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res+(vu*lam*Conjg(lam)*Conjg(dZA(gt1,1))*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(g2**2*vd*Conjg(dZA(gt1,2))*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res+(vd*lam*Conjg(lam)*Conjg(dZA(gt1,2))*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(dvu*g2**2*Conjg(ZA(gt1,1))*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res-(dg2*g2*vu*Conjg(ZA(gt1,1))*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(vu*lam*Conjg(dlam)*Conjg(ZA(gt1,1))*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(dlam*vu*Conjg(lam)*Conjg(ZA(gt1,1))*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(dvu*lam*Conjg(lam)*Conjg(ZA(gt1,1))*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(dvd*g2**2*Conjg(ZA(gt1,2))*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res-(dg2*g2*vd*Conjg(ZA(gt1,2))*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(vd*lam*Conjg(dlam)*Conjg(ZA(gt1,2))*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(dlam*vd*Conjg(lam)*Conjg(ZA(gt1,2))*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(dvd*lam*Conjg(lam)*Conjg(ZA(gt1,2))*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(dTlam*Conjg(ZA(gt1,3))*ZP(gt2,1)*ZP(gt3,2))/sqrt(2._dp)
res = res+(Conjg(dZA(gt1,3))*Tlam*ZP(gt2,1)*ZP(gt3,2))/sqrt(2._dp)
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhHpmcHpm  
 
 
Subroutine CT_CouplingAhSdcSd(gt1,gt2,gt3,Yd,Td,lam,vu,vS,ZD,ZA,dYd,dTd,              & 
& dlam,dvu,dvS,dZD,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: vu,vS,dvu,dvS

Complex(dp), Intent(in) :: Yd(3,3),Td(3,3),lam,ZD(6,6),ZA(6,6),dYd(3,3),dTd(3,3),dlam,dZD(6,6),dZA(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhSdcSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(Yd(j1,j2))*Conjg(ZA(gt1,2))*Conjg(ZD(gt2,3 + j1))*dZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(Yd(j1,j2))*Conjg(ZA(gt1,3))*Conjg(ZD(gt2,3 + j1))*dZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZA(gt1,1))*Conjg(ZD(gt2,3 + j1))*Conjg(Td(j1,j2))*dZD(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZA(gt1,2))*Conjg(ZD(gt2,j2))*dZD(gt3,3 + j1)*Yd(j1,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZA(gt1,3))*Conjg(ZD(gt2,j2))*dZD(gt3,3 + j1)*Yd(j1,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZA(gt1,1))*Conjg(ZD(gt2,j2))*dTd(j1,j2)*ZD(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZA(gt1,2))*Conjg(ZD(gt2,j2))*dYd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZA(gt1,3))*Conjg(ZD(gt2,j2))*dYd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZD(gt2,j2))*Conjg(ZA(gt1,2))*Yd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZD(gt2,j2))*Conjg(ZA(gt1,3))*Yd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZA(gt1,2))*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZA(gt1,3))*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZA(gt1,2))*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZA(gt1,2))*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dlam)*Conjg(ZA(gt1,3))*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(lam)*Conjg(ZA(gt1,3))*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZD(gt2,3 + j1))*Conjg(Yd(j1,j2))*Conjg(ZA(gt1,2))*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dZD(gt2,3 + j1))*Conjg(Yd(j1,j2))*Conjg(ZA(gt1,3))*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZA(gt1,2))*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dZA(gt1,3))*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTd(j1,j2))*Conjg(ZA(gt1,1))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dYd(j1,j2))*Conjg(ZA(gt1,2))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vS*Conjg(Yd(j1,j2))*Conjg(ZA(gt1,2))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*lam*Conjg(Yd(j1,j2))*Conjg(ZA(gt1,2))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dYd(j1,j2))*Conjg(ZA(gt1,3))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vu*Conjg(Yd(j1,j2))*Conjg(ZA(gt1,3))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*lam*Conjg(Yd(j1,j2))*Conjg(ZA(gt1,3))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZD(gt2,3 + j1))*Conjg(ZA(gt1,1))*Conjg(Td(j1,j2))*ZD(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZA(gt1,1))*Conjg(ZD(gt2,3 + j1))*Conjg(Td(j1,j2))*ZD(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZA(gt1,1))*Conjg(ZD(gt2,j2))*dZD(gt3,3 + j1)*Td(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZD(gt2,j2))*Conjg(ZA(gt1,1))*ZD(gt3,3 + j1)*Td(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZA(gt1,1))*Conjg(ZD(gt2,j2))*ZD(gt3,3 + j1)*Td(j1,j2))/sqrt(2._dp)
End Do 
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhSdcSd  
 
 
Subroutine CT_CouplingAhSecSe(gt1,gt2,gt3,Ye,Te,lam,vu,vS,ZE,ZA,dYe,dTe,              & 
& dlam,dvu,dvS,dZE,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: vu,vS,dvu,dvS

Complex(dp), Intent(in) :: Ye(3,3),Te(3,3),lam,ZE(6,6),ZA(6,6),dYe(3,3),dTe(3,3),dlam,dZE(6,6),dZA(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhSecSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(Ye(j1,j2))*Conjg(ZA(gt1,2))*Conjg(ZE(gt2,3 + j1))*dZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(Ye(j1,j2))*Conjg(ZA(gt1,3))*Conjg(ZE(gt2,3 + j1))*dZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZA(gt1,1))*Conjg(ZE(gt2,3 + j1))*Conjg(Te(j1,j2))*dZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZA(gt1,2))*Conjg(ZE(gt2,j2))*dZE(gt3,3 + j1)*Ye(j1,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZA(gt1,3))*Conjg(ZE(gt2,j2))*dZE(gt3,3 + j1)*Ye(j1,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZA(gt1,1))*Conjg(ZE(gt2,j2))*dTe(j1,j2)*ZE(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZA(gt1,2))*Conjg(ZE(gt2,j2))*dYe(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZA(gt1,3))*Conjg(ZE(gt2,j2))*dYe(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZE(gt2,j2))*Conjg(ZA(gt1,2))*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZE(gt2,j2))*Conjg(ZA(gt1,3))*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZA(gt1,2))*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZA(gt1,3))*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZA(gt1,2))*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZA(gt1,2))*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dlam)*Conjg(ZA(gt1,3))*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(lam)*Conjg(ZA(gt1,3))*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZE(gt2,3 + j1))*Conjg(Ye(j1,j2))*Conjg(ZA(gt1,2))*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dZE(gt2,3 + j1))*Conjg(Ye(j1,j2))*Conjg(ZA(gt1,3))*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZA(gt1,2))*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dZA(gt1,3))*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTe(j1,j2))*Conjg(ZA(gt1,1))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dYe(j1,j2))*Conjg(ZA(gt1,2))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vS*Conjg(Ye(j1,j2))*Conjg(ZA(gt1,2))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*lam*Conjg(Ye(j1,j2))*Conjg(ZA(gt1,2))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*lam*Conjg(dYe(j1,j2))*Conjg(ZA(gt1,3))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vu*Conjg(Ye(j1,j2))*Conjg(ZA(gt1,3))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*lam*Conjg(Ye(j1,j2))*Conjg(ZA(gt1,3))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZE(gt2,3 + j1))*Conjg(ZA(gt1,1))*Conjg(Te(j1,j2))*ZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZA(gt1,1))*Conjg(ZE(gt2,3 + j1))*Conjg(Te(j1,j2))*ZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZA(gt1,1))*Conjg(ZE(gt2,j2))*dZE(gt3,3 + j1)*Te(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZE(gt2,j2))*Conjg(ZA(gt1,1))*ZE(gt3,3 + j1)*Te(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZA(gt1,1))*Conjg(ZE(gt2,j2))*ZE(gt3,3 + j1)*Te(j1,j2))/sqrt(2._dp)
End Do 
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhSecSe  
 
 
Subroutine CT_CouplingAhSucSu(gt1,gt2,gt3,lam,Yu,Tu,vd,vS,ZU,ZA,dlam,dYu,             & 
& dTu,dvd,dvS,dZU,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: vd,vS,dvd,dvS

Complex(dp), Intent(in) :: lam,Yu(3,3),Tu(3,3),ZU(6,6),ZA(6,6),dlam,dYu(3,3),dTu(3,3),dZU(6,6),dZA(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhSucSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(Yu(j1,j2))*Conjg(ZA(gt1,1))*Conjg(ZU(gt2,3 + j1))*dZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(Yu(j1,j2))*Conjg(ZA(gt1,3))*Conjg(ZU(gt2,3 + j1))*dZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZA(gt1,2))*Conjg(ZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*dZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZA(gt1,1))*Conjg(ZU(gt2,j2))*dZU(gt3,3 + j1)*Yu(j1,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZA(gt1,3))*Conjg(ZU(gt2,j2))*dZU(gt3,3 + j1)*Yu(j1,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZA(gt1,2))*Conjg(ZU(gt2,j2))*dTu(j1,j2)*ZU(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZA(gt1,1))*Conjg(ZU(gt2,j2))*dYu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZA(gt1,3))*Conjg(ZU(gt2,j2))*dYu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZU(gt2,j2))*Conjg(ZA(gt1,1))*Yu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZU(gt2,j2))*Conjg(ZA(gt1,3))*Yu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZA(gt1,1))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZA(gt1,3))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZA(gt1,1))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZA(gt1,1))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZA(gt1,3))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZA(gt1,3))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZU(gt2,3 + j1))*Conjg(Yu(j1,j2))*Conjg(ZA(gt1,1))*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZU(gt2,3 + j1))*Conjg(Yu(j1,j2))*Conjg(ZA(gt1,3))*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZA(gt1,1))*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZA(gt1,3))*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dYu(j1,j2))*Conjg(ZA(gt1,1))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vS*Conjg(Yu(j1,j2))*Conjg(ZA(gt1,1))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*lam*Conjg(Yu(j1,j2))*Conjg(ZA(gt1,1))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTu(j1,j2))*Conjg(ZA(gt1,2))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dYu(j1,j2))*Conjg(ZA(gt1,3))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vd*Conjg(Yu(j1,j2))*Conjg(ZA(gt1,3))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*lam*Conjg(Yu(j1,j2))*Conjg(ZA(gt1,3))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZU(gt2,3 + j1))*Conjg(ZA(gt1,2))*Conjg(Tu(j1,j2))*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZA(gt1,2))*Conjg(ZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZA(gt1,2))*Conjg(ZU(gt2,j2))*dZU(gt3,3 + j1)*Tu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZU(gt2,j2))*Conjg(ZA(gt1,2))*ZU(gt3,3 + j1)*Tu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZA(gt1,2))*Conjg(ZU(gt2,j2))*ZU(gt3,3 + j1)*Tu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhSucSu  
 
 
Subroutine CT_CouplingAhSvcSv(gt1,gt2,gt3,lam,Yv,Tv,vd,vS,ZV,ZA,dlam,dYv,             & 
& dTv,dvd,dvS,dZV,dZA,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: vd,vS,dvd,dvS

Complex(dp), Intent(in) :: lam,Yv(3,3),Tv(3,3),ZV(6,6),ZA(6,6),dlam,dYv(3,3),dTv(3,3),dZV(6,6),dZA(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhSvcSv' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(Yv(j1,j2))*Conjg(ZA(gt1,1))*Conjg(ZV(gt2,3 + j2))*dZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(Yv(j1,j2))*Conjg(ZA(gt1,3))*Conjg(ZV(gt2,3 + j2))*dZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZA(gt1,2))*Conjg(ZV(gt2,3 + j2))*Conjg(Tv(j1,j2))*dZV(gt3,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZA(gt1,1))*Conjg(ZV(gt2,j1))*dZV(gt3,3 + j2)*Yv(j1,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZA(gt1,3))*Conjg(ZV(gt2,j1))*dZV(gt3,3 + j2)*Yv(j1,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZV(gt2,3 + j2))*Conjg(Yv(j1,j2))*Conjg(ZA(gt1,1))*ZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZV(gt2,3 + j2))*Conjg(Yv(j1,j2))*Conjg(ZA(gt1,3))*ZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dZA(gt1,1))*Conjg(Yv(j1,j2))*Conjg(ZV(gt2,3 + j2))*ZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dZA(gt1,3))*Conjg(Yv(j1,j2))*Conjg(ZV(gt2,3 + j2))*ZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vS*lam*Conjg(dYv(j1,j2))*Conjg(ZA(gt1,1))*Conjg(ZV(gt2,3 + j2))*ZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vS*Conjg(Yv(j1,j2))*Conjg(ZA(gt1,1))*Conjg(ZV(gt2,3 + j2))*ZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvS*lam*Conjg(Yv(j1,j2))*Conjg(ZA(gt1,1))*Conjg(ZV(gt2,3 + j2))*ZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTv(j1,j2))*Conjg(ZA(gt1,2))*Conjg(ZV(gt2,3 + j2))*ZV(gt3,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*lam*Conjg(dYv(j1,j2))*Conjg(ZA(gt1,3))*Conjg(ZV(gt2,3 + j2))*ZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dlam*vd*Conjg(Yv(j1,j2))*Conjg(ZA(gt1,3))*Conjg(ZV(gt2,3 + j2))*ZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*lam*Conjg(Yv(j1,j2))*Conjg(ZA(gt1,3))*Conjg(ZV(gt2,3 + j2))*ZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZV(gt2,3 + j2))*Conjg(ZA(gt1,2))*Conjg(Tv(j1,j2))*ZV(gt3,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZA(gt1,2))*Conjg(ZV(gt2,3 + j2))*Conjg(Tv(j1,j2))*ZV(gt3,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZA(gt1,2))*Conjg(ZV(gt2,j1))*dTv(j1,j2)*ZV(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZA(gt1,1))*Conjg(ZV(gt2,j1))*dYv(j1,j2)*ZV(gt3,3 + j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZA(gt1,3))*Conjg(ZV(gt2,j1))*dYv(j1,j2)*ZV(gt3,3 + j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZV(gt2,j1))*Conjg(ZA(gt1,1))*Yv(j1,j2)*ZV(gt3,3 + j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZV(gt2,j1))*Conjg(ZA(gt1,3))*Yv(j1,j2)*ZV(gt3,3 + j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZA(gt1,1))*Conjg(ZV(gt2,j1))*Yv(j1,j2)*ZV(gt3,3 + j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZA(gt1,3))*Conjg(ZV(gt2,j1))*Yv(j1,j2)*ZV(gt3,3 + j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZA(gt1,1))*Conjg(ZV(gt2,j1))*Yv(j1,j2)*ZV(gt3,3 + j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZA(gt1,1))*Conjg(ZV(gt2,j1))*Yv(j1,j2)*ZV(gt3,3 + j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZA(gt1,3))*Conjg(ZV(gt2,j1))*Yv(j1,j2)*ZV(gt3,3 + j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZA(gt1,3))*Conjg(ZV(gt2,j1))*Yv(j1,j2)*ZV(gt3,3 + j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(ZA(gt1,2))*Conjg(ZV(gt2,j1))*dZV(gt3,3 + j2)*Tv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZV(gt2,j1))*Conjg(ZA(gt1,2))*ZV(gt3,3 + j2)*Tv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(Conjg(dZA(gt1,2))*Conjg(ZV(gt2,j1))*ZV(gt3,3 + j2)*Tv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhSvcSv  
 
 
Subroutine CT_Couplinghhhhhh(gt1,gt2,gt3,g1,g2,gp,lam,Tlam,kap,Tk,vd,vu,              & 
& vS,vS1,vS2,vS3,ZH,dg1,dg2,dgp,dlam,dTlam,dkap,dTk,dvd,dvu,dvS,dvS1,dvS2,               & 
& dvS3,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,dg1,dg2,dgp,dvd,dvu,dvS,dvS1,dvS2,dvS3

Complex(dp), Intent(in) :: lam,Tlam,kap,Tk,ZH(6,6),dlam,dTlam,dkap,dTk,dZH(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_Couplinghhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(-3*g1**2*vd*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1)))/4._dp
res = res+(-3*g2**2*vd*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1)))/4._dp
res = res-3*gp**2*QHd**2*vd*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))
res = res+(g1**2*vu*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1)))/4._dp
res = res+(g2**2*vu*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1)))/4._dp
res = res-(gp**2*QHd*QHu*vu*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1)))
res = res-(gp**2*QHd*Qs*vS*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1)))
res = res-(gp**2*QHd*Qs1*vS1*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1)))
res = res-(gp**2*QHd*Qs2*vS2*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1)))
res = res-(gp**2*QHd*Qs3*vS3*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1)))
res = res+(g1**2*vu*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1)))/4._dp
res = res+(g2**2*vu*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1)))/4._dp
res = res-(gp**2*QHd*QHu*vu*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1)))
res = res+(g1**2*vd*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1)))/4._dp
res = res+(g2**2*vd*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1)))/4._dp
res = res-(gp**2*QHd*QHu*vd*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1)))
res = res+(Conjg(dZH(gt3,3))*Conjg(Tlam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1)))/(2._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs*vS*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,1)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,1)))
res = res-(gp**2*QHd*Qs*vd*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,1)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,1)))
res = res+(Conjg(dZH(gt3,2))*Conjg(Tlam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,1)))/(2._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs1*vS1*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,1)))
res = res-(gp**2*QHd*Qs1*vd*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,1)))
res = res-(gp**2*QHd*Qs2*vS2*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,1)))
res = res-(gp**2*QHd*Qs2*vd*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,1)))
res = res-(gp**2*QHd*Qs3*vS3*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,1)))
res = res-(gp**2*QHd*Qs3*vd*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,1)))
res = res+(g1**2*vu*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2)))/4._dp
res = res+(g2**2*vu*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2)))/4._dp
res = res-(gp**2*QHd*QHu*vu*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2)))
res = res+(g1**2*vd*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2)))/4._dp
res = res+(g2**2*vd*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2)))/4._dp
res = res-(gp**2*QHd*QHu*vd*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2)))
res = res+(Conjg(dZH(gt3,3))*Conjg(Tlam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2)))/(2._dp*sqrt(2._dp))
res = res+(g1**2*vd*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2)))/4._dp
res = res+(g2**2*vd*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2)))/4._dp
res = res-(gp**2*QHd*QHu*vd*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2)))
res = res+(-3*g1**2*vu*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2)))/4._dp
res = res+(-3*g2**2*vu*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2)))/4._dp
res = res-3*gp**2*QHu**2*vu*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))
res = res-(gp**2*QHu*Qs*vS*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2)))
res = res-(gp**2*QHu*Qs1*vS1*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2)))
res = res-(gp**2*QHu*Qs2*vS2*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2)))
res = res-(gp**2*QHu*Qs3*vS3*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2)))
res = res-(gp**2*QHu*Qs*vS*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,2)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,2)))
res = res-(gp**2*QHu*Qs*vu*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,2)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,2)))
res = res+(Conjg(dZH(gt3,1))*Conjg(Tlam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,2)))/(2._dp*sqrt(2._dp))
res = res-(gp**2*QHu*Qs1*vS1*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,2)))
res = res-(gp**2*QHu*Qs1*vu*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,2)))
res = res-(gp**2*QHu*Qs2*vS2*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,2)))
res = res-(gp**2*QHu*Qs2*vu*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,2)))
res = res-(gp**2*QHu*Qs3*vS3*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,2)))
res = res-(gp**2*QHu*Qs3*vu*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,2)))
res = res-(gp**2*QHd*Qs*vS*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,3)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,3)))
res = res-(gp**2*QHd*Qs*vd*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,3)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,3)))
res = res+(Conjg(dZH(gt3,2))*Conjg(Tlam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,3)))/(2._dp*sqrt(2._dp))
res = res-(gp**2*QHu*Qs*vS*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,3)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,3)))
res = res-(gp**2*QHu*Qs*vu*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,3)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,3)))
res = res+(Conjg(dZH(gt3,1))*Conjg(Tlam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,3)))/(2._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs*vd*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3)))
res = res-(gp**2*QHu*Qs*vu*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3)))
res = res-3*gp**2*Qs**2*vS*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3))
res = res-(gp**2*Qs*Qs1*vS1*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3)))
res = res-(gp**2*Qs*Qs2*vS2*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3)))
res = res-(gp**2*Qs*Qs3*vS3*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3)))
res = res-(gp**2*Qs*Qs1*vS1*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,3)))
res = res-(gp**2*Qs*Qs1*vS*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,3)))
res = res-(gp**2*Qs*Qs2*vS2*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,3)))
res = res-(gp**2*Qs*Qs2*vS*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,3)))
res = res-(gp**2*Qs*Qs3*vS3*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,3)))
res = res-(gp**2*Qs*Qs3*vS*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,3)))
res = res-(gp**2*QHd*Qs1*vS1*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,4)))
res = res-(gp**2*QHd*Qs1*vd*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,4)))
res = res-(gp**2*QHu*Qs1*vS1*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,4)))
res = res-(gp**2*QHu*Qs1*vu*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,4)))
res = res-(gp**2*Qs*Qs1*vS1*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,4)))
res = res-(gp**2*Qs*Qs1*vS*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,4)))
res = res-(gp**2*QHd*Qs1*vd*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4)))
res = res-(gp**2*QHu*Qs1*vu*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4)))
res = res-(gp**2*Qs*Qs1*vS*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4)))
res = res-3*gp**2*Qs1**2*vS1*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4))
res = res-(gp**2*Qs1*Qs2*vS2*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4)))/9._dp
res = res-(gp**2*Qs1*Qs3*vS3*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4)))/9._dp
res = res-(gp**2*Qs1*Qs2*vS2*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,4)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,4)))/9._dp
res = res-(gp**2*Qs1*Qs2*vS1*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,4)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,4)))/9._dp
res = res-(Conjg(dZH(gt3,6))*Conjg(Tk)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,4)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*Qs1*Qs3*vS3*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,4)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,4)))/9._dp
res = res-(gp**2*Qs1*Qs3*vS1*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,4)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,4)))/9._dp
res = res-(Conjg(dZH(gt3,5))*Conjg(Tk)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,4)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs2*vS2*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,5)))
res = res-(gp**2*QHd*Qs2*vd*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,5)))
res = res-(gp**2*QHu*Qs2*vS2*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,5)))
res = res-(gp**2*QHu*Qs2*vu*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,5)))
res = res-(gp**2*Qs*Qs2*vS2*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,5)))
res = res-(gp**2*Qs*Qs2*vS*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,5)))
res = res-(gp**2*Qs1*Qs2*vS2*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,5)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,5)))/9._dp
res = res-(gp**2*Qs1*Qs2*vS1*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,5)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,5)))/9._dp
res = res-(Conjg(dZH(gt3,6))*Conjg(Tk)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,5)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs2*vd*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5)))
res = res-(gp**2*QHu*Qs2*vu*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5)))
res = res-(gp**2*Qs*Qs2*vS*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5)))
res = res-(gp**2*Qs1*Qs2*vS1*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5)))/9._dp
res = res-3*gp**2*Qs2**2*vS2*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5))
res = res-(gp**2*Qs2*Qs3*vS3*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5)))/9._dp
res = res-(gp**2*Qs2*Qs3*vS3*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,5)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,5)))/9._dp
res = res-(gp**2*Qs2*Qs3*vS2*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,5)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,5)))/9._dp
res = res-(Conjg(dZH(gt3,4))*Conjg(Tk)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,5)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs3*vS3*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,6)))
res = res-(gp**2*QHd*Qs3*vd*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,6)))
res = res-(gp**2*QHu*Qs3*vS3*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,6)))
res = res-(gp**2*QHu*Qs3*vu*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,6)))
res = res-(gp**2*Qs*Qs3*vS3*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,6)))
res = res-(gp**2*Qs*Qs3*vS*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,6)))
res = res-(gp**2*Qs1*Qs3*vS3*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,6)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,6)))/9._dp
res = res-(gp**2*Qs1*Qs3*vS1*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,6)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,6)))/9._dp
res = res-(Conjg(dZH(gt3,5))*Conjg(Tk)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,6)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*Qs2*Qs3*vS3*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,6)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,6)))/9._dp
res = res-(gp**2*Qs2*Qs3*vS2*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,6)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,6)))/9._dp
res = res-(Conjg(dZH(gt3,4))*Conjg(Tk)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,6)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs3*vd*Conjg(dZH(gt3,1))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6)))
res = res-(gp**2*QHu*Qs3*vu*Conjg(dZH(gt3,2))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6)))
res = res-(gp**2*Qs*Qs3*vS*Conjg(dZH(gt3,3))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6)))
res = res-(gp**2*Qs1*Qs3*vS1*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZH(gt3,4))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6)))/9._dp
res = res-(gp**2*Qs2*Qs3*vS2*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZH(gt3,5))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6)))/9._dp
res = res-3*gp**2*Qs3**2*vS3*Conjg(dZH(gt3,6))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6))
res = res+(-3*g1**2*vd*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,1)))/4._dp
res = res+(-3*g2**2*vd*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,1)))/4._dp
res = res-3*gp**2*QHd**2*vd*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,1))
res = res+(g1**2*vu*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,1)))/4._dp
res = res+(g2**2*vu*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,1)))/4._dp
res = res-(gp**2*QHd*QHu*vu*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,1)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs*vS*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,1)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs1*vS1*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs2*vS2*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs3*vS3*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,1)))
res = res+(g1**2*vu*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,1)))/4._dp
res = res+(g2**2*vu*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,1)))/4._dp
res = res-(gp**2*QHd*QHu*vu*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,1)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,1)))
res = res+(g1**2*vd*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,1)))/4._dp
res = res+(g2**2*vd*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,1)))/4._dp
res = res-(gp**2*QHd*QHu*vd*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,1)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,1)))
res = res+(Conjg(dZH(gt2,3))*Conjg(Tlam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs*vS*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,1)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs*vd*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,1)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,1)))
res = res+(Conjg(dZH(gt2,2))*Conjg(Tlam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs1*vS1*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs1*vd*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs2*vS2*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs2*vd*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs3*vS3*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs3*vd*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,1)))
res = res+(-3*g1**2*vd*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))/4._dp
res = res+(-3*g2**2*vd*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))/4._dp
res = res-3*gp**2*QHd**2*vd*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1))
res = res+(g1**2*vu*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))/4._dp
res = res+(g2**2*vu*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))/4._dp
res = res-(gp**2*QHd*QHu*vu*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs*vS*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs1*vS1*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs2*vS2*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs3*vS3*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))
res = res+(-3*dvd*g1**2*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))/4._dp
res = res+(-3*dvd*g2**2*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))/4._dp
res = res-3*dvd*gp**2*QHd**2*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1))
res = res+(-3*dg1*g1*vd*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))/2._dp
res = res+(-3*dg2*g2*vd*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))/2._dp
res = res-6*dgp*gp*QHd**2*vd*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1))
res = res+(dvu*g1**2*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))/4._dp
res = res+(dvu*g2**2*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))/4._dp
res = res-(dvu*gp**2*QHd*QHu*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))
res = res+(dg1*g1*vu*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))/2._dp
res = res+(dg2*g2*vu*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))/2._dp
res = res-2*dgp*gp*QHd*QHu*vu*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1))
res = res-(vu*lam*Conjg(dlam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))
res = res-(dlam*vu*Conjg(lam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))
res = res-(dvu*lam*Conjg(lam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))
res = res-(dvS*gp**2*QHd*Qs*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))
res = res-2*dgp*gp*QHd*Qs*vS*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1))
res = res-(vS*lam*Conjg(dlam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))
res = res-(dlam*vS*Conjg(lam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))
res = res-(dvS*lam*Conjg(lam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))
res = res-(dvS1*gp**2*QHd*Qs1*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))
res = res-2*dgp*gp*QHd*Qs1*vS1*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1))
res = res-(dvS2*gp**2*QHd*Qs2*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))
res = res-2*dgp*gp*QHd*Qs2*vS2*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1))
res = res-(dvS3*gp**2*QHd*Qs3*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1)))
res = res-2*dgp*gp*QHd*Qs3*vS3*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,1))
res = res+(g1**2*vu*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))/4._dp
res = res+(g2**2*vu*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))/4._dp
res = res-(gp**2*QHd*QHu*vu*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))
res = res+(g1**2*vd*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))/4._dp
res = res+(g2**2*vd*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))/4._dp
res = res-(gp**2*QHd*QHu*vd*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))
res = res+(Conjg(dZH(gt1,3))*Conjg(Tlam)*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res+(dvu*g1**2*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))/4._dp
res = res+(dvu*g2**2*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))/4._dp
res = res-(dvu*gp**2*QHd*QHu*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))
res = res+(dg1*g1*vu*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))/2._dp
res = res+(dg2*g2*vu*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))/2._dp
res = res-2*dgp*gp*QHd*QHu*vu*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1))
res = res-(vu*lam*Conjg(dlam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))
res = res-(dlam*vu*Conjg(lam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))
res = res-(dvu*lam*Conjg(lam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))
res = res+(dvd*g1**2*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))/4._dp
res = res+(dvd*g2**2*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))/4._dp
res = res-(dvd*gp**2*QHd*QHu*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))
res = res+(dg1*g1*vd*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))/2._dp
res = res+(dg2*g2*vd*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))/2._dp
res = res-2*dgp*gp*QHd*QHu*vd*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1))
res = res-(vd*lam*Conjg(dlam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))
res = res-(dlam*vd*Conjg(lam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))
res = res-(dvd*lam*Conjg(lam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))
res = res+(dTlam*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dTlam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs*vS*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs*vd*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1)))
res = res+(Conjg(dZH(gt1,2))*Conjg(Tlam)*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res-(dvS*gp**2*QHd*Qs*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1)))
res = res-2*dgp*gp*QHd*Qs*vS*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1))
res = res-(vS*lam*Conjg(dlam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1)))
res = res-(dlam*vS*Conjg(lam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1)))
res = res-(dvS*lam*Conjg(lam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1)))
res = res+(dTlam*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dTlam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1)))/(2._dp*sqrt(2._dp))
res = res-(dvd*gp**2*QHd*Qs*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1)))
res = res-2*dgp*gp*QHd*Qs*vd*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1))
res = res-(vd*lam*Conjg(dlam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1)))
res = res-(dlam*vd*Conjg(lam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1)))
res = res-(dvd*lam*Conjg(lam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs1*vS1*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs1*vd*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,1)))
res = res-(dvS1*gp**2*QHd*Qs1*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,1)))
res = res-2*dgp*gp*QHd*Qs1*vS1*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,1))
res = res-(dvd*gp**2*QHd*Qs1*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,1)))
res = res-2*dgp*gp*QHd*Qs1*vd*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,1))
res = res-(gp**2*QHd*Qs2*vS2*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs2*vd*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,1)))
res = res-(dvS2*gp**2*QHd*Qs2*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,1)))
res = res-2*dgp*gp*QHd*Qs2*vS2*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,1))
res = res-(dvd*gp**2*QHd*Qs2*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,1)))
res = res-2*dgp*gp*QHd*Qs2*vd*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,1))
res = res-(gp**2*QHd*Qs3*vS3*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,1)))
res = res-(gp**2*QHd*Qs3*vd*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,1)))
res = res-(dvS3*gp**2*QHd*Qs3*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,1)))
res = res-2*dgp*gp*QHd*Qs3*vS3*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,1))
res = res-(dvd*gp**2*QHd*Qs3*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,1)))
res = res-2*dgp*gp*QHd*Qs3*vd*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,1))
res = res+(g1**2*vu*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,2)))/4._dp
res = res+(g2**2*vu*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,2)))/4._dp
res = res-(gp**2*QHd*QHu*vu*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,2)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,2)))
res = res+(g1**2*vd*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,2)))/4._dp
res = res+(g2**2*vd*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,2)))/4._dp
res = res-(gp**2*QHd*QHu*vd*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,2)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,2)))
res = res+(Conjg(dZH(gt2,3))*Conjg(Tlam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res+(g1**2*vd*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,2)))/4._dp
res = res+(g2**2*vd*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,2)))/4._dp
res = res-(gp**2*QHd*QHu*vd*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,2)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,2)))
res = res+(-3*g1**2*vu*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,2)))/4._dp
res = res+(-3*g2**2*vu*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,2)))/4._dp
res = res-3*gp**2*QHu**2*vu*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,2))
res = res-(gp**2*QHu*Qs*vS*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,2)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs1*vS1*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs2*vS2*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs3*vS3*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs*vS*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,2)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs*vu*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,2)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,2)))
res = res+(Conjg(dZH(gt2,1))*Conjg(Tlam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res-(gp**2*QHu*Qs1*vS1*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs1*vu*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs2*vS2*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs2*vu*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs3*vS3*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs3*vu*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,2)))
res = res+(g1**2*vu*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))/4._dp
res = res+(g2**2*vu*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))/4._dp
res = res-(gp**2*QHd*QHu*vu*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))
res = res+(g1**2*vd*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))/4._dp
res = res+(g2**2*vd*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))/4._dp
res = res-(gp**2*QHd*QHu*vd*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))
res = res+(Conjg(dZH(gt1,3))*Conjg(Tlam)*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res+(dvu*g1**2*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))/4._dp
res = res+(dvu*g2**2*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))/4._dp
res = res-(dvu*gp**2*QHd*QHu*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))
res = res+(dg1*g1*vu*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))/2._dp
res = res+(dg2*g2*vu*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))/2._dp
res = res-2*dgp*gp*QHd*QHu*vu*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2))
res = res-(vu*lam*Conjg(dlam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))
res = res-(dlam*vu*Conjg(lam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))
res = res-(dvu*lam*Conjg(lam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))
res = res+(dvd*g1**2*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))/4._dp
res = res+(dvd*g2**2*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))/4._dp
res = res-(dvd*gp**2*QHd*QHu*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))
res = res+(dg1*g1*vd*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))/2._dp
res = res+(dg2*g2*vd*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))/2._dp
res = res-2*dgp*gp*QHd*QHu*vd*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2))
res = res-(vd*lam*Conjg(dlam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))
res = res-(dlam*vd*Conjg(lam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))
res = res-(dvd*lam*Conjg(lam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))
res = res+(dTlam*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dTlam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res+(g1**2*vd*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))/4._dp
res = res+(g2**2*vd*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))/4._dp
res = res-(gp**2*QHd*QHu*vd*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))
res = res+(-3*g1**2*vu*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))/4._dp
res = res+(-3*g2**2*vu*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))/4._dp
res = res-3*gp**2*QHu**2*vu*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2))
res = res-(gp**2*QHu*Qs*vS*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs1*vS1*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs2*vS2*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs3*vS3*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))
res = res+(dvd*g1**2*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))/4._dp
res = res+(dvd*g2**2*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))/4._dp
res = res-(dvd*gp**2*QHd*QHu*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))
res = res+(dg1*g1*vd*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))/2._dp
res = res+(dg2*g2*vd*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))/2._dp
res = res-2*dgp*gp*QHd*QHu*vd*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2))
res = res-(vd*lam*Conjg(dlam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))
res = res-(dlam*vd*Conjg(lam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))
res = res-(dvd*lam*Conjg(lam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))
res = res+(-3*dvu*g1**2*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))/4._dp
res = res+(-3*dvu*g2**2*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))/4._dp
res = res-3*dvu*gp**2*QHu**2*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2))
res = res+(-3*dg1*g1*vu*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))/2._dp
res = res+(-3*dg2*g2*vu*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))/2._dp
res = res-6*dgp*gp*QHu**2*vu*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2))
res = res-(dvS*gp**2*QHu*Qs*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))
res = res-2*dgp*gp*QHu*Qs*vS*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2))
res = res-(vS*lam*Conjg(dlam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))
res = res-(dlam*vS*Conjg(lam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))
res = res-(dvS*lam*Conjg(lam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))
res = res-(dvS1*gp**2*QHu*Qs1*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))
res = res-2*dgp*gp*QHu*Qs1*vS1*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2))
res = res-(dvS2*gp**2*QHu*Qs2*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))
res = res-2*dgp*gp*QHu*Qs2*vS2*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2))
res = res-(dvS3*gp**2*QHu*Qs3*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2)))
res = res-2*dgp*gp*QHu*Qs3*vS3*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,2))
res = res-(gp**2*QHu*Qs*vS*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs*vu*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2)))
res = res+(Conjg(dZH(gt1,1))*Conjg(Tlam)*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res+(dTlam*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dTlam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2)))/(2._dp*sqrt(2._dp))
res = res-(dvS*gp**2*QHu*Qs*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2)))
res = res-2*dgp*gp*QHu*Qs*vS*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2))
res = res-(vS*lam*Conjg(dlam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2)))
res = res-(dlam*vS*Conjg(lam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2)))
res = res-(dvS*lam*Conjg(lam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2)))
res = res-(dvu*gp**2*QHu*Qs*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2)))
res = res-2*dgp*gp*QHu*Qs*vu*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2))
res = res-(vu*lam*Conjg(dlam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2)))
res = res-(dlam*vu*Conjg(lam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2)))
res = res-(dvu*lam*Conjg(lam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs1*vS1*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs1*vu*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,2)))
res = res-(dvS1*gp**2*QHu*Qs1*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,2)))
res = res-2*dgp*gp*QHu*Qs1*vS1*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,2))
res = res-(dvu*gp**2*QHu*Qs1*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,2)))
res = res-2*dgp*gp*QHu*Qs1*vu*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,2))
res = res-(gp**2*QHu*Qs2*vS2*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs2*vu*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,2)))
res = res-(dvS2*gp**2*QHu*Qs2*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,2)))
res = res-2*dgp*gp*QHu*Qs2*vS2*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,2))
res = res-(dvu*gp**2*QHu*Qs2*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,2)))
res = res-2*dgp*gp*QHu*Qs2*vu*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,2))
res = res-(gp**2*QHu*Qs3*vS3*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,2)))
res = res-(gp**2*QHu*Qs3*vu*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,2)))
res = res-(dvS3*gp**2*QHu*Qs3*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,2)))
res = res-2*dgp*gp*QHu*Qs3*vS3*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,2))
res = res-(dvu*gp**2*QHu*Qs3*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,2)))
res = res-2*dgp*gp*QHu*Qs3*vu*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,2))
res = res-(gp**2*QHd*Qs*vS*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,3)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,3)))
res = res-(gp**2*QHd*Qs*vd*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,3)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,3)))
res = res+(Conjg(dZH(gt2,2))*Conjg(Tlam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res-(gp**2*QHu*Qs*vS*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,3)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,3)))
res = res-(gp**2*QHu*Qs*vu*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,3)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,3)))
res = res+(Conjg(dZH(gt2,1))*Conjg(Tlam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs*vd*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,3)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,3)))
res = res-(gp**2*QHu*Qs*vu*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,3)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,3)))
res = res-3*gp**2*Qs**2*vS*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,3))
res = res-(gp**2*Qs*Qs1*vS1*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,3)))
res = res-(gp**2*Qs*Qs2*vS2*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,3)))
res = res-(gp**2*Qs*Qs3*vS3*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,3)))
res = res-(gp**2*Qs*Qs1*vS1*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,3)))
res = res-(gp**2*Qs*Qs1*vS*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,3)))
res = res-(gp**2*Qs*Qs2*vS2*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,3)))
res = res-(gp**2*Qs*Qs2*vS*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,3)))
res = res-(gp**2*Qs*Qs3*vS3*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,3)))
res = res-(gp**2*Qs*Qs3*vS*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,3)))
res = res-(gp**2*QHd*Qs*vS*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3)))
res = res-(gp**2*QHd*Qs*vd*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3)))
res = res+(Conjg(dZH(gt1,2))*Conjg(Tlam)*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res-(dvS*gp**2*QHd*Qs*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3)))
res = res-2*dgp*gp*QHd*Qs*vS*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3))
res = res-(vS*lam*Conjg(dlam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3)))
res = res-(dlam*vS*Conjg(lam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3)))
res = res-(dvS*lam*Conjg(lam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3)))
res = res+(dTlam*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dTlam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res-(dvd*gp**2*QHd*Qs*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3)))
res = res-2*dgp*gp*QHd*Qs*vd*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3))
res = res-(vd*lam*Conjg(dlam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3)))
res = res-(dlam*vd*Conjg(lam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3)))
res = res-(dvd*lam*Conjg(lam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3)))
res = res-(gp**2*QHu*Qs*vS*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3)))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3)))
res = res-(gp**2*QHu*Qs*vu*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3)))
res = res+(Conjg(dZH(gt1,1))*Conjg(Tlam)*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res+(dTlam*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res+(Conjg(dTlam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3)))/(2._dp*sqrt(2._dp))
res = res-(dvS*gp**2*QHu*Qs*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3)))
res = res-2*dgp*gp*QHu*Qs*vS*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3))
res = res-(vS*lam*Conjg(dlam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3)))
res = res-(dlam*vS*Conjg(lam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3)))
res = res-(dvS*lam*Conjg(lam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3)))
res = res-(dvu*gp**2*QHu*Qs*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3)))
res = res-2*dgp*gp*QHu*Qs*vu*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3))
res = res-(vu*lam*Conjg(dlam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3)))
res = res-(dlam*vu*Conjg(lam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3)))
res = res-(dvu*lam*Conjg(lam)*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3)))
res = res-(gp**2*QHd*Qs*vd*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3)))
res = res-(vd*lam*Conjg(lam)*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3)))
res = res-(gp**2*QHu*Qs*vu*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3)))
res = res-(vu*lam*Conjg(lam)*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3)))
res = res-3*gp**2*Qs**2*vS*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3))
res = res-(gp**2*Qs*Qs1*vS1*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3)))
res = res-(gp**2*Qs*Qs2*vS2*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3)))
res = res-(gp**2*Qs*Qs3*vS3*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3)))
res = res-(dvd*gp**2*QHd*Qs*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3)))
res = res-2*dgp*gp*QHd*Qs*vd*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3))
res = res-(vd*lam*Conjg(dlam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3)))
res = res-(dlam*vd*Conjg(lam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3)))
res = res-(dvd*lam*Conjg(lam)*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3)))
res = res-(dvu*gp**2*QHu*Qs*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3)))
res = res-2*dgp*gp*QHu*Qs*vu*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3))
res = res-(vu*lam*Conjg(dlam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3)))
res = res-(dlam*vu*Conjg(lam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3)))
res = res-(dvu*lam*Conjg(lam)*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3)))
res = res-3*dvS*gp**2*Qs**2*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3))
res = res-6*dgp*gp*Qs**2*vS*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3))
res = res-(dvS1*gp**2*Qs*Qs1*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3)))
res = res-2*dgp*gp*Qs*Qs1*vS1*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3))
res = res-(dvS2*gp**2*Qs*Qs2*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3)))
res = res-2*dgp*gp*Qs*Qs2*vS2*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3))
res = res-(dvS3*gp**2*Qs*Qs3*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3)))
res = res-2*dgp*gp*Qs*Qs3*vS3*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,3))
res = res-(gp**2*Qs*Qs1*vS1*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,3)))
res = res-(gp**2*Qs*Qs1*vS*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,3)))
res = res-(dvS1*gp**2*Qs*Qs1*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,3)))
res = res-2*dgp*gp*Qs*Qs1*vS1*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,3))
res = res-(dvS*gp**2*Qs*Qs1*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,3)))
res = res-2*dgp*gp*Qs*Qs1*vS*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,3))
res = res-(gp**2*Qs*Qs2*vS2*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,3)))
res = res-(gp**2*Qs*Qs2*vS*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,3)))
res = res-(dvS2*gp**2*Qs*Qs2*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,3)))
res = res-2*dgp*gp*Qs*Qs2*vS2*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,3))
res = res-(dvS*gp**2*Qs*Qs2*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,3)))
res = res-2*dgp*gp*Qs*Qs2*vS*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,3))
res = res-(gp**2*Qs*Qs3*vS3*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,3)))
res = res-(gp**2*Qs*Qs3*vS*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,3)))
res = res-(dvS3*gp**2*Qs*Qs3*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,3)))
res = res-2*dgp*gp*Qs*Qs3*vS3*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,3))
res = res-(dvS*gp**2*Qs*Qs3*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,3)))
res = res-2*dgp*gp*Qs*Qs3*vS*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,3))
res = res-(gp**2*QHd*Qs1*vS1*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,4)))
res = res-(gp**2*QHd*Qs1*vd*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,4)))
res = res-(gp**2*QHu*Qs1*vS1*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,4)))
res = res-(gp**2*QHu*Qs1*vu*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,4)))
res = res-(gp**2*Qs*Qs1*vS1*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,4)))
res = res-(gp**2*Qs*Qs1*vS*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,4)))
res = res-(gp**2*QHd*Qs1*vd*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,4)))
res = res-(gp**2*QHu*Qs1*vu*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,4)))
res = res-(gp**2*Qs*Qs1*vS*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,4)))
res = res-3*gp**2*Qs1**2*vS1*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,4))
res = res-(gp**2*Qs1*Qs2*vS2*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,4)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,4)))/9._dp
res = res-(gp**2*Qs1*Qs3*vS3*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,4)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,4)))/9._dp
res = res-(gp**2*Qs1*Qs2*vS2*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,4)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,4)))/9._dp
res = res-(gp**2*Qs1*Qs2*vS1*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,4)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,4)))/9._dp
res = res-(Conjg(dZH(gt2,6))*Conjg(Tk)*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*Qs1*Qs3*vS3*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,4)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,4)))/9._dp
res = res-(gp**2*Qs1*Qs3*vS1*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,4)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,4)))/9._dp
res = res-(Conjg(dZH(gt2,5))*Conjg(Tk)*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs1*vS1*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,4)))
res = res-(gp**2*QHd*Qs1*vd*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,4)))
res = res-(dvS1*gp**2*QHd*Qs1*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,4)))
res = res-2*dgp*gp*QHd*Qs1*vS1*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,4))
res = res-(dvd*gp**2*QHd*Qs1*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,4)))
res = res-2*dgp*gp*QHd*Qs1*vd*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,4))
res = res-(gp**2*QHu*Qs1*vS1*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,4)))
res = res-(gp**2*QHu*Qs1*vu*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,4)))
res = res-(dvS1*gp**2*QHu*Qs1*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,4)))
res = res-2*dgp*gp*QHu*Qs1*vS1*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,4))
res = res-(dvu*gp**2*QHu*Qs1*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,4)))
res = res-2*dgp*gp*QHu*Qs1*vu*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,4))
res = res-(gp**2*Qs*Qs1*vS1*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,4)))
res = res-(gp**2*Qs*Qs1*vS*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,4)))
res = res-(dvS1*gp**2*Qs*Qs1*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,4)))
res = res-2*dgp*gp*Qs*Qs1*vS1*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,4))
res = res-(dvS*gp**2*Qs*Qs1*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,4)))
res = res-2*dgp*gp*Qs*Qs1*vS*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,4))
res = res-(gp**2*QHd*Qs1*vd*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4)))
res = res-(gp**2*QHu*Qs1*vu*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4)))
res = res-(gp**2*Qs*Qs1*vS*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4)))
res = res-3*gp**2*Qs1**2*vS1*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4))
res = res-(gp**2*Qs1*Qs2*vS2*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4)))/9._dp
res = res-(gp**2*Qs1*Qs3*vS3*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4)))/9._dp
res = res-(dvd*gp**2*QHd*Qs1*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4)))
res = res-2*dgp*gp*QHd*Qs1*vd*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4))
res = res-(dvu*gp**2*QHu*Qs1*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4)))
res = res-2*dgp*gp*QHu*Qs1*vu*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4))
res = res-(dvS*gp**2*Qs*Qs1*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4)))
res = res-2*dgp*gp*Qs*Qs1*vS*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4))
res = res-3*dvS1*gp**2*Qs1**2*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4))
res = res-6*dgp*gp*Qs1**2*vS1*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4))
res = res-(dvS2*gp**2*Qs1*Qs2*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4)))
res = res-2*dgp*gp*Qs1*Qs2*vS2*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4))
res = res-(vS2*kap*Conjg(dkap)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4)))/9._dp
res = res-(dkap*vS2*Conjg(kap)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4)))/9._dp
res = res-(dvS2*kap*Conjg(kap)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4)))/9._dp
res = res-(dvS3*gp**2*Qs1*Qs3*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4)))
res = res-2*dgp*gp*Qs1*Qs3*vS3*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4))
res = res-(vS3*kap*Conjg(dkap)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4)))/9._dp
res = res-(dkap*vS3*Conjg(kap)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4)))/9._dp
res = res-(dvS3*kap*Conjg(kap)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,4)))/9._dp
res = res-(gp**2*Qs1*Qs2*vS2*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4)))/9._dp
res = res-(gp**2*Qs1*Qs2*vS1*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4)))/9._dp
res = res-(Conjg(dZH(gt1,6))*Conjg(Tk)*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res-(dvS2*gp**2*Qs1*Qs2*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4)))
res = res-2*dgp*gp*Qs1*Qs2*vS2*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4))
res = res-(vS2*kap*Conjg(dkap)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4)))/9._dp
res = res-(dkap*vS2*Conjg(kap)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4)))/9._dp
res = res-(dvS2*kap*Conjg(kap)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4)))/9._dp
res = res-(dvS1*gp**2*Qs1*Qs2*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4)))
res = res-2*dgp*gp*Qs1*Qs2*vS1*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4))
res = res-(vS1*kap*Conjg(dkap)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4)))/9._dp
res = res-(dkap*vS1*Conjg(kap)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4)))/9._dp
res = res-(dvS1*kap*Conjg(kap)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4)))/9._dp
res = res-(dTk*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dTk)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*Qs1*Qs3*vS3*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4)))/9._dp
res = res-(gp**2*Qs1*Qs3*vS1*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4)))/9._dp
res = res-(Conjg(dZH(gt1,5))*Conjg(Tk)*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res-(dvS3*gp**2*Qs1*Qs3*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4)))
res = res-2*dgp*gp*Qs1*Qs3*vS3*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4))
res = res-(vS3*kap*Conjg(dkap)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4)))/9._dp
res = res-(dkap*vS3*Conjg(kap)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4)))/9._dp
res = res-(dvS3*kap*Conjg(kap)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4)))/9._dp
res = res-(dTk*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dTk)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4)))/(6._dp*sqrt(2._dp))
res = res-(dvS1*gp**2*Qs1*Qs3*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4)))
res = res-2*dgp*gp*Qs1*Qs3*vS1*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4))
res = res-(vS1*kap*Conjg(dkap)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4)))/9._dp
res = res-(dkap*vS1*Conjg(kap)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4)))/9._dp
res = res-(dvS1*kap*Conjg(kap)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4)))/9._dp
res = res-(gp**2*QHd*Qs2*vS2*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,5)))
res = res-(gp**2*QHd*Qs2*vd*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,5)))
res = res-(gp**2*QHu*Qs2*vS2*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,5)))
res = res-(gp**2*QHu*Qs2*vu*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,5)))
res = res-(gp**2*Qs*Qs2*vS2*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,5)))
res = res-(gp**2*Qs*Qs2*vS*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,5)))
res = res-(gp**2*Qs1*Qs2*vS2*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,5)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,5)))/9._dp
res = res-(gp**2*Qs1*Qs2*vS1*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,5)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,5)))/9._dp
res = res-(Conjg(dZH(gt2,6))*Conjg(Tk)*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs2*vd*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,5)))
res = res-(gp**2*QHu*Qs2*vu*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,5)))
res = res-(gp**2*Qs*Qs2*vS*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,5)))
res = res-(gp**2*Qs1*Qs2*vS1*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,5)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,5)))/9._dp
res = res-3*gp**2*Qs2**2*vS2*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,5))
res = res-(gp**2*Qs2*Qs3*vS3*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,5)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,5)))/9._dp
res = res-(gp**2*Qs2*Qs3*vS3*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,5)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,5)))/9._dp
res = res-(gp**2*Qs2*Qs3*vS2*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,5)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,5)))/9._dp
res = res-(Conjg(dZH(gt2,4))*Conjg(Tk)*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs2*vS2*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,5)))
res = res-(gp**2*QHd*Qs2*vd*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,5)))
res = res-(dvS2*gp**2*QHd*Qs2*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,5)))
res = res-2*dgp*gp*QHd*Qs2*vS2*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,5))
res = res-(dvd*gp**2*QHd*Qs2*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,5)))
res = res-2*dgp*gp*QHd*Qs2*vd*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,5))
res = res-(gp**2*QHu*Qs2*vS2*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,5)))
res = res-(gp**2*QHu*Qs2*vu*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,5)))
res = res-(dvS2*gp**2*QHu*Qs2*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,5)))
res = res-2*dgp*gp*QHu*Qs2*vS2*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,5))
res = res-(dvu*gp**2*QHu*Qs2*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,5)))
res = res-2*dgp*gp*QHu*Qs2*vu*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,5))
res = res-(gp**2*Qs*Qs2*vS2*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,5)))
res = res-(gp**2*Qs*Qs2*vS*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,5)))
res = res-(dvS2*gp**2*Qs*Qs2*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,5)))
res = res-2*dgp*gp*Qs*Qs2*vS2*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,5))
res = res-(dvS*gp**2*Qs*Qs2*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,5)))
res = res-2*dgp*gp*Qs*Qs2*vS*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,5))
res = res-(gp**2*Qs1*Qs2*vS2*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5)))/9._dp
res = res-(gp**2*Qs1*Qs2*vS1*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5)))/9._dp
res = res-(Conjg(dZH(gt1,6))*Conjg(Tk)*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res-(dvS2*gp**2*Qs1*Qs2*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5)))
res = res-2*dgp*gp*Qs1*Qs2*vS2*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5))
res = res-(vS2*kap*Conjg(dkap)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5)))/9._dp
res = res-(dkap*vS2*Conjg(kap)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5)))/9._dp
res = res-(dvS2*kap*Conjg(kap)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5)))/9._dp
res = res-(dvS1*gp**2*Qs1*Qs2*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5)))
res = res-2*dgp*gp*Qs1*Qs2*vS1*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5))
res = res-(vS1*kap*Conjg(dkap)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5)))/9._dp
res = res-(dkap*vS1*Conjg(kap)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5)))/9._dp
res = res-(dvS1*kap*Conjg(kap)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5)))/9._dp
res = res-(dTk*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dTk)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs2*vd*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5)))
res = res-(gp**2*QHu*Qs2*vu*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5)))
res = res-(gp**2*Qs*Qs2*vS*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5)))
res = res-(gp**2*Qs1*Qs2*vS1*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5)))/9._dp
res = res-3*gp**2*Qs2**2*vS2*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5))
res = res-(gp**2*Qs2*Qs3*vS3*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5)))/9._dp
res = res-(dvd*gp**2*QHd*Qs2*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5)))
res = res-2*dgp*gp*QHd*Qs2*vd*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5))
res = res-(dvu*gp**2*QHu*Qs2*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5)))
res = res-2*dgp*gp*QHu*Qs2*vu*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5))
res = res-(dvS*gp**2*Qs*Qs2*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5)))
res = res-2*dgp*gp*Qs*Qs2*vS*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5))
res = res-(dvS1*gp**2*Qs1*Qs2*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5)))
res = res-2*dgp*gp*Qs1*Qs2*vS1*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5))
res = res-(vS1*kap*Conjg(dkap)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5)))/9._dp
res = res-(dkap*vS1*Conjg(kap)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5)))/9._dp
res = res-(dvS1*kap*Conjg(kap)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5)))/9._dp
res = res-3*dvS2*gp**2*Qs2**2*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5))
res = res-6*dgp*gp*Qs2**2*vS2*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5))
res = res-(dvS3*gp**2*Qs2*Qs3*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5)))
res = res-2*dgp*gp*Qs2*Qs3*vS3*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5))
res = res-(vS3*kap*Conjg(dkap)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5)))/9._dp
res = res-(dkap*vS3*Conjg(kap)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5)))/9._dp
res = res-(dvS3*kap*Conjg(kap)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,5)))/9._dp
res = res-(gp**2*Qs2*Qs3*vS3*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5)))/9._dp
res = res-(gp**2*Qs2*Qs3*vS2*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5)))/9._dp
res = res-(Conjg(dZH(gt1,4))*Conjg(Tk)*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res-(dTk*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dTk)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5)))/(6._dp*sqrt(2._dp))
res = res-(dvS3*gp**2*Qs2*Qs3*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5)))
res = res-2*dgp*gp*Qs2*Qs3*vS3*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5))
res = res-(vS3*kap*Conjg(dkap)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5)))/9._dp
res = res-(dkap*vS3*Conjg(kap)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5)))/9._dp
res = res-(dvS3*kap*Conjg(kap)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5)))/9._dp
res = res-(dvS2*gp**2*Qs2*Qs3*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5)))
res = res-2*dgp*gp*Qs2*Qs3*vS2*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5))
res = res-(vS2*kap*Conjg(dkap)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5)))/9._dp
res = res-(dkap*vS2*Conjg(kap)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5)))/9._dp
res = res-(dvS2*kap*Conjg(kap)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5)))/9._dp
res = res-(gp**2*QHd*Qs3*vS3*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,6)))
res = res-(gp**2*QHd*Qs3*vd*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,6)))
res = res-(gp**2*QHu*Qs3*vS3*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,6)))
res = res-(gp**2*QHu*Qs3*vu*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,6)))
res = res-(gp**2*Qs*Qs3*vS3*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,6)))
res = res-(gp**2*Qs*Qs3*vS*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,6)))
res = res-(gp**2*Qs1*Qs3*vS3*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,6)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,6)))/9._dp
res = res-(gp**2*Qs1*Qs3*vS1*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,6)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,6)))/9._dp
res = res-(Conjg(dZH(gt2,5))*Conjg(Tk)*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*Qs2*Qs3*vS3*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,6)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,6)))/9._dp
res = res-(gp**2*Qs2*Qs3*vS2*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,6)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,6)))/9._dp
res = res-(Conjg(dZH(gt2,4))*Conjg(Tk)*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res-(gp**2*QHd*Qs3*vd*Conjg(dZH(gt2,1))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,6)))
res = res-(gp**2*QHu*Qs3*vu*Conjg(dZH(gt2,2))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,6)))
res = res-(gp**2*Qs*Qs3*vS*Conjg(dZH(gt2,3))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,6)))
res = res-(gp**2*Qs1*Qs3*vS1*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,6)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZH(gt2,4))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,6)))/9._dp
res = res-(gp**2*Qs2*Qs3*vS2*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,6)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZH(gt2,5))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,6)))/9._dp
res = res-3*gp**2*Qs3**2*vS3*Conjg(dZH(gt2,6))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,6))
res = res-(gp**2*QHd*Qs3*vS3*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,6)))
res = res-(gp**2*QHd*Qs3*vd*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,6)))
res = res-(dvS3*gp**2*QHd*Qs3*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,6)))
res = res-2*dgp*gp*QHd*Qs3*vS3*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,6))
res = res-(dvd*gp**2*QHd*Qs3*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,6)))
res = res-2*dgp*gp*QHd*Qs3*vd*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,6))
res = res-(gp**2*QHu*Qs3*vS3*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,6)))
res = res-(gp**2*QHu*Qs3*vu*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,6)))
res = res-(dvS3*gp**2*QHu*Qs3*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,6)))
res = res-2*dgp*gp*QHu*Qs3*vS3*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,6))
res = res-(dvu*gp**2*QHu*Qs3*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,6)))
res = res-2*dgp*gp*QHu*Qs3*vu*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,6))
res = res-(gp**2*Qs*Qs3*vS3*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,6)))
res = res-(gp**2*Qs*Qs3*vS*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,6)))
res = res-(dvS3*gp**2*Qs*Qs3*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,6)))
res = res-2*dgp*gp*Qs*Qs3*vS3*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,6))
res = res-(dvS*gp**2*Qs*Qs3*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,6)))
res = res-2*dgp*gp*Qs*Qs3*vS*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,6))
res = res-(gp**2*Qs1*Qs3*vS3*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6)))/9._dp
res = res-(gp**2*Qs1*Qs3*vS1*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6)))/9._dp
res = res-(Conjg(dZH(gt1,5))*Conjg(Tk)*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res-(dvS3*gp**2*Qs1*Qs3*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6)))
res = res-2*dgp*gp*Qs1*Qs3*vS3*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6))
res = res-(vS3*kap*Conjg(dkap)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6)))/9._dp
res = res-(dkap*vS3*Conjg(kap)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6)))/9._dp
res = res-(dvS3*kap*Conjg(kap)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6)))/9._dp
res = res-(dTk*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dTk)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res-(dvS1*gp**2*Qs1*Qs3*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6)))
res = res-2*dgp*gp*Qs1*Qs3*vS1*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6))
res = res-(vS1*kap*Conjg(dkap)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6)))/9._dp
res = res-(dkap*vS1*Conjg(kap)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6)))/9._dp
res = res-(dvS1*kap*Conjg(kap)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6)))/9._dp
res = res-(gp**2*Qs2*Qs3*vS3*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6)))
res = res-(vS3*kap*Conjg(kap)*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6)))/9._dp
res = res-(gp**2*Qs2*Qs3*vS2*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6)))/9._dp
res = res-(Conjg(dZH(gt1,4))*Conjg(Tk)*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res-(dTk*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res-(Conjg(dTk)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6)))/(6._dp*sqrt(2._dp))
res = res-(dvS3*gp**2*Qs2*Qs3*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6)))
res = res-2*dgp*gp*Qs2*Qs3*vS3*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6))
res = res-(vS3*kap*Conjg(dkap)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6)))/9._dp
res = res-(dkap*vS3*Conjg(kap)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6)))/9._dp
res = res-(dvS3*kap*Conjg(kap)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6)))/9._dp
res = res-(dvS2*gp**2*Qs2*Qs3*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6)))
res = res-2*dgp*gp*Qs2*Qs3*vS2*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6))
res = res-(vS2*kap*Conjg(dkap)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6)))/9._dp
res = res-(dkap*vS2*Conjg(kap)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6)))/9._dp
res = res-(dvS2*kap*Conjg(kap)*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6)))/9._dp
res = res-(gp**2*QHd*Qs3*vd*Conjg(dZH(gt1,1))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6)))
res = res-(gp**2*QHu*Qs3*vu*Conjg(dZH(gt1,2))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6)))
res = res-(gp**2*Qs*Qs3*vS*Conjg(dZH(gt1,3))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6)))
res = res-(gp**2*Qs1*Qs3*vS1*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6)))
res = res-(vS1*kap*Conjg(kap)*Conjg(dZH(gt1,4))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6)))/9._dp
res = res-(gp**2*Qs2*Qs3*vS2*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6)))
res = res-(vS2*kap*Conjg(kap)*Conjg(dZH(gt1,5))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6)))/9._dp
res = res-3*gp**2*Qs3**2*vS3*Conjg(dZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6))
res = res-(dvd*gp**2*QHd*Qs3*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6)))
res = res-2*dgp*gp*QHd*Qs3*vd*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6))
res = res-(dvu*gp**2*QHu*Qs3*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6)))
res = res-2*dgp*gp*QHu*Qs3*vu*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6))
res = res-(dvS*gp**2*Qs*Qs3*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6)))
res = res-2*dgp*gp*Qs*Qs3*vS*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6))
res = res-(dvS1*gp**2*Qs1*Qs3*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6)))
res = res-2*dgp*gp*Qs1*Qs3*vS1*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6))
res = res-(vS1*kap*Conjg(dkap)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6)))/9._dp
res = res-(dkap*vS1*Conjg(kap)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6)))/9._dp
res = res-(dvS1*kap*Conjg(kap)*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6)))/9._dp
res = res-(dvS2*gp**2*Qs2*Qs3*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6)))
res = res-2*dgp*gp*Qs2*Qs3*vS2*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6))
res = res-(vS2*kap*Conjg(dkap)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6)))/9._dp
res = res-(dkap*vS2*Conjg(kap)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6)))/9._dp
res = res-(dvS2*kap*Conjg(kap)*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6)))/9._dp
res = res-3*dvS3*gp**2*Qs3**2*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6))
res = res-6*dgp*gp*Qs3**2*vS3*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,6))
res = res-(Conjg(dZH(gt3,6))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,4))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,5))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,4))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,6))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,5))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,4))*Conjg(ZH(gt1,6))*Conjg(ZH(gt2,5))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,5))*Conjg(ZH(gt1,4))*Conjg(ZH(gt2,6))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt3,4))*Conjg(ZH(gt1,5))*Conjg(ZH(gt2,6))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt2,6))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,4))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt2,5))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,4))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt1,6))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,4))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt1,5))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,4))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt2,6))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,5))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt2,4))*Conjg(ZH(gt1,6))*Conjg(ZH(gt3,5))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt1,6))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,5))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt1,4))*Conjg(ZH(gt2,6))*Conjg(ZH(gt3,5))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt2,5))*Conjg(ZH(gt1,4))*Conjg(ZH(gt3,6))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt2,4))*Conjg(ZH(gt1,5))*Conjg(ZH(gt3,6))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt1,5))*Conjg(ZH(gt2,4))*Conjg(ZH(gt3,6))*Tk)/(6._dp*sqrt(2._dp))
res = res-(Conjg(dZH(gt1,4))*Conjg(ZH(gt2,5))*Conjg(ZH(gt3,6))*Tk)/(6._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,3))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,2))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,3))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,1))*Conjg(ZH(gt1,3))*Conjg(ZH(gt2,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,2))*Conjg(ZH(gt1,1))*Conjg(ZH(gt2,3))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt3,1))*Conjg(ZH(gt1,2))*Conjg(ZH(gt2,3))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt2,3))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt2,2))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt1,3))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt1,2))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,1))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt2,3))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt2,1))*Conjg(ZH(gt1,3))*Conjg(ZH(gt3,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt1,3))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt1,1))*Conjg(ZH(gt2,3))*Conjg(ZH(gt3,2))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt2,2))*Conjg(ZH(gt1,1))*Conjg(ZH(gt3,3))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt2,1))*Conjg(ZH(gt1,2))*Conjg(ZH(gt3,3))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt1,2))*Conjg(ZH(gt2,1))*Conjg(ZH(gt3,3))*Tlam)/(2._dp*sqrt(2._dp))
res = res+(Conjg(dZH(gt1,1))*Conjg(ZH(gt2,2))*Conjg(ZH(gt3,3))*Tlam)/(2._dp*sqrt(2._dp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_Couplinghhhhhh  
 
 
Subroutine CT_CouplinghhHpmcHpm(gt1,gt2,gt3,g1,g2,gp,lam,Tlam,vd,vu,vS,               & 
& vS1,vS2,vS3,ZH,ZP,dg1,dg2,dgp,dlam,dTlam,dvd,dvu,dvS,dvS1,dvS2,dvS3,dZH,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,ZP(2,2),dg1,dg2,dgp,dvd,dvu,dvS,dvS1,dvS2,              & 
& dvS3,dZP(2,2)

Complex(dp), Intent(in) :: lam,Tlam,ZH(6,6),dlam,dTlam,dZH(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhHpmcHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1**2*vd*Conjg(ZH(gt1,1))*dZP(gt3,1)*ZP(gt2,1))/4._dp
res = res-(g2**2*vd*Conjg(ZH(gt1,1))*dZP(gt3,1)*ZP(gt2,1))/4._dp
res = res-(gp**2*QHd**2*vd*Conjg(ZH(gt1,1))*dZP(gt3,1)*ZP(gt2,1))
res = res+(g1**2*vu*Conjg(ZH(gt1,2))*dZP(gt3,1)*ZP(gt2,1))/4._dp
res = res-(g2**2*vu*Conjg(ZH(gt1,2))*dZP(gt3,1)*ZP(gt2,1))/4._dp
res = res-(gp**2*QHd*QHu*vu*Conjg(ZH(gt1,2))*dZP(gt3,1)*ZP(gt2,1))
res = res-(gp**2*QHd*Qs*vS*Conjg(ZH(gt1,3))*dZP(gt3,1)*ZP(gt2,1))
res = res-(vS*lam*Conjg(lam)*Conjg(ZH(gt1,3))*dZP(gt3,1)*ZP(gt2,1))
res = res-(gp**2*QHd*Qs1*vS1*Conjg(ZH(gt1,4))*dZP(gt3,1)*ZP(gt2,1))
res = res-(gp**2*QHd*Qs2*vS2*Conjg(ZH(gt1,5))*dZP(gt3,1)*ZP(gt2,1))
res = res-(gp**2*QHd*Qs3*vS3*Conjg(ZH(gt1,6))*dZP(gt3,1)*ZP(gt2,1))
res = res-(g2**2*vu*Conjg(ZH(gt1,1))*dZP(gt3,2)*ZP(gt2,1))/4._dp
res = res+(vu*lam*Conjg(lam)*Conjg(ZH(gt1,1))*dZP(gt3,2)*ZP(gt2,1))/2._dp
res = res-(g2**2*vd*Conjg(ZH(gt1,2))*dZP(gt3,2)*ZP(gt2,1))/4._dp
res = res+(vd*lam*Conjg(lam)*Conjg(ZH(gt1,2))*dZP(gt3,2)*ZP(gt2,1))/2._dp
res = res-((Conjg(ZH(gt1,3))*dZP(gt3,2)*Tlam*ZP(gt2,1))/sqrt(2._dp))
res = res-(g2**2*vu*Conjg(ZH(gt1,1))*dZP(gt3,1)*ZP(gt2,2))/4._dp
res = res+(vu*lam*Conjg(lam)*Conjg(ZH(gt1,1))*dZP(gt3,1)*ZP(gt2,2))/2._dp
res = res-(g2**2*vd*Conjg(ZH(gt1,2))*dZP(gt3,1)*ZP(gt2,2))/4._dp
res = res+(vd*lam*Conjg(lam)*Conjg(ZH(gt1,2))*dZP(gt3,1)*ZP(gt2,2))/2._dp
res = res-((Conjg(Tlam)*Conjg(ZH(gt1,3))*dZP(gt3,1)*ZP(gt2,2))/sqrt(2._dp))
res = res+(g1**2*vd*Conjg(ZH(gt1,1))*dZP(gt3,2)*ZP(gt2,2))/4._dp
res = res-(g2**2*vd*Conjg(ZH(gt1,1))*dZP(gt3,2)*ZP(gt2,2))/4._dp
res = res-(gp**2*QHd*QHu*vd*Conjg(ZH(gt1,1))*dZP(gt3,2)*ZP(gt2,2))
res = res-(g1**2*vu*Conjg(ZH(gt1,2))*dZP(gt3,2)*ZP(gt2,2))/4._dp
res = res-(g2**2*vu*Conjg(ZH(gt1,2))*dZP(gt3,2)*ZP(gt2,2))/4._dp
res = res-(gp**2*QHu**2*vu*Conjg(ZH(gt1,2))*dZP(gt3,2)*ZP(gt2,2))
res = res-(gp**2*QHu*Qs*vS*Conjg(ZH(gt1,3))*dZP(gt3,2)*ZP(gt2,2))
res = res-(vS*lam*Conjg(lam)*Conjg(ZH(gt1,3))*dZP(gt3,2)*ZP(gt2,2))
res = res-(gp**2*QHu*Qs1*vS1*Conjg(ZH(gt1,4))*dZP(gt3,2)*ZP(gt2,2))
res = res-(gp**2*QHu*Qs2*vS2*Conjg(ZH(gt1,5))*dZP(gt3,2)*ZP(gt2,2))
res = res-(gp**2*QHu*Qs3*vS3*Conjg(ZH(gt1,6))*dZP(gt3,2)*ZP(gt2,2))
res = res-(g1**2*vd*Conjg(ZH(gt1,1))*dZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(g2**2*vd*Conjg(ZH(gt1,1))*dZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(gp**2*QHd**2*vd*Conjg(ZH(gt1,1))*dZP(gt2,1)*ZP(gt3,1))
res = res+(g1**2*vu*Conjg(ZH(gt1,2))*dZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(g2**2*vu*Conjg(ZH(gt1,2))*dZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(gp**2*QHd*QHu*vu*Conjg(ZH(gt1,2))*dZP(gt2,1)*ZP(gt3,1))
res = res-(gp**2*QHd*Qs*vS*Conjg(ZH(gt1,3))*dZP(gt2,1)*ZP(gt3,1))
res = res-(vS*lam*Conjg(lam)*Conjg(ZH(gt1,3))*dZP(gt2,1)*ZP(gt3,1))
res = res-(gp**2*QHd*Qs1*vS1*Conjg(ZH(gt1,4))*dZP(gt2,1)*ZP(gt3,1))
res = res-(gp**2*QHd*Qs2*vS2*Conjg(ZH(gt1,5))*dZP(gt2,1)*ZP(gt3,1))
res = res-(gp**2*QHd*Qs3*vS3*Conjg(ZH(gt1,6))*dZP(gt2,1)*ZP(gt3,1))
res = res-(g2**2*vu*Conjg(ZH(gt1,1))*dZP(gt2,2)*ZP(gt3,1))/4._dp
res = res+(vu*lam*Conjg(lam)*Conjg(ZH(gt1,1))*dZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(g2**2*vd*Conjg(ZH(gt1,2))*dZP(gt2,2)*ZP(gt3,1))/4._dp
res = res+(vd*lam*Conjg(lam)*Conjg(ZH(gt1,2))*dZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-((Conjg(Tlam)*Conjg(ZH(gt1,3))*dZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp))
res = res-(g1**2*vd*Conjg(dZH(gt1,1))*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(g2**2*vd*Conjg(dZH(gt1,1))*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(gp**2*QHd**2*vd*Conjg(dZH(gt1,1))*ZP(gt2,1)*ZP(gt3,1))
res = res+(g1**2*vu*Conjg(dZH(gt1,2))*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(g2**2*vu*Conjg(dZH(gt1,2))*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(gp**2*QHd*QHu*vu*Conjg(dZH(gt1,2))*ZP(gt2,1)*ZP(gt3,1))
res = res-(gp**2*QHd*Qs*vS*Conjg(dZH(gt1,3))*ZP(gt2,1)*ZP(gt3,1))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt1,3))*ZP(gt2,1)*ZP(gt3,1))
res = res-(gp**2*QHd*Qs1*vS1*Conjg(dZH(gt1,4))*ZP(gt2,1)*ZP(gt3,1))
res = res-(gp**2*QHd*Qs2*vS2*Conjg(dZH(gt1,5))*ZP(gt2,1)*ZP(gt3,1))
res = res-(gp**2*QHd*Qs3*vS3*Conjg(dZH(gt1,6))*ZP(gt2,1)*ZP(gt3,1))
res = res-(dvd*g1**2*Conjg(ZH(gt1,1))*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(dvd*g2**2*Conjg(ZH(gt1,1))*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(dvd*gp**2*QHd**2*Conjg(ZH(gt1,1))*ZP(gt2,1)*ZP(gt3,1))
res = res-(dg1*g1*vd*Conjg(ZH(gt1,1))*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dg2*g2*vd*Conjg(ZH(gt1,1))*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-2*dgp*gp*QHd**2*vd*Conjg(ZH(gt1,1))*ZP(gt2,1)*ZP(gt3,1)
res = res+(dvu*g1**2*Conjg(ZH(gt1,2))*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(dvu*g2**2*Conjg(ZH(gt1,2))*ZP(gt2,1)*ZP(gt3,1))/4._dp
res = res-(dvu*gp**2*QHd*QHu*Conjg(ZH(gt1,2))*ZP(gt2,1)*ZP(gt3,1))
res = res+(dg1*g1*vu*Conjg(ZH(gt1,2))*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dg2*g2*vu*Conjg(ZH(gt1,2))*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-2*dgp*gp*QHd*QHu*vu*Conjg(ZH(gt1,2))*ZP(gt2,1)*ZP(gt3,1)
res = res-(dvS*gp**2*QHd*Qs*Conjg(ZH(gt1,3))*ZP(gt2,1)*ZP(gt3,1))
res = res-2*dgp*gp*QHd*Qs*vS*Conjg(ZH(gt1,3))*ZP(gt2,1)*ZP(gt3,1)
res = res-(vS*lam*Conjg(dlam)*Conjg(ZH(gt1,3))*ZP(gt2,1)*ZP(gt3,1))
res = res-(dlam*vS*Conjg(lam)*Conjg(ZH(gt1,3))*ZP(gt2,1)*ZP(gt3,1))
res = res-(dvS*lam*Conjg(lam)*Conjg(ZH(gt1,3))*ZP(gt2,1)*ZP(gt3,1))
res = res-(dvS1*gp**2*QHd*Qs1*Conjg(ZH(gt1,4))*ZP(gt2,1)*ZP(gt3,1))
res = res-2*dgp*gp*QHd*Qs1*vS1*Conjg(ZH(gt1,4))*ZP(gt2,1)*ZP(gt3,1)
res = res-(dvS2*gp**2*QHd*Qs2*Conjg(ZH(gt1,5))*ZP(gt2,1)*ZP(gt3,1))
res = res-2*dgp*gp*QHd*Qs2*vS2*Conjg(ZH(gt1,5))*ZP(gt2,1)*ZP(gt3,1)
res = res-(dvS3*gp**2*QHd*Qs3*Conjg(ZH(gt1,6))*ZP(gt2,1)*ZP(gt3,1))
res = res-2*dgp*gp*QHd*Qs3*vS3*Conjg(ZH(gt1,6))*ZP(gt2,1)*ZP(gt3,1)
res = res-(g2**2*vu*Conjg(dZH(gt1,1))*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res+(vu*lam*Conjg(lam)*Conjg(dZH(gt1,1))*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(g2**2*vd*Conjg(dZH(gt1,2))*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res+(vd*lam*Conjg(lam)*Conjg(dZH(gt1,2))*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-((Conjg(dZH(gt1,3))*Conjg(Tlam)*ZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp))
res = res-(dvu*g2**2*Conjg(ZH(gt1,1))*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res-(dg2*g2*vu*Conjg(ZH(gt1,1))*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res+(vu*lam*Conjg(dlam)*Conjg(ZH(gt1,1))*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res+(dlam*vu*Conjg(lam)*Conjg(ZH(gt1,1))*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res+(dvu*lam*Conjg(lam)*Conjg(ZH(gt1,1))*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-(dvd*g2**2*Conjg(ZH(gt1,2))*ZP(gt2,2)*ZP(gt3,1))/4._dp
res = res-(dg2*g2*vd*Conjg(ZH(gt1,2))*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res+(vd*lam*Conjg(dlam)*Conjg(ZH(gt1,2))*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res+(dlam*vd*Conjg(lam)*Conjg(ZH(gt1,2))*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res+(dvd*lam*Conjg(lam)*Conjg(ZH(gt1,2))*ZP(gt2,2)*ZP(gt3,1))/2._dp
res = res-((Conjg(dTlam)*Conjg(ZH(gt1,3))*ZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp))
res = res-(g2**2*vu*Conjg(ZH(gt1,1))*dZP(gt2,1)*ZP(gt3,2))/4._dp
res = res+(vu*lam*Conjg(lam)*Conjg(ZH(gt1,1))*dZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(g2**2*vd*Conjg(ZH(gt1,2))*dZP(gt2,1)*ZP(gt3,2))/4._dp
res = res+(vd*lam*Conjg(lam)*Conjg(ZH(gt1,2))*dZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(g1**2*vd*Conjg(ZH(gt1,1))*dZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(g2**2*vd*Conjg(ZH(gt1,1))*dZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(gp**2*QHd*QHu*vd*Conjg(ZH(gt1,1))*dZP(gt2,2)*ZP(gt3,2))
res = res-(g1**2*vu*Conjg(ZH(gt1,2))*dZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(g2**2*vu*Conjg(ZH(gt1,2))*dZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(gp**2*QHu**2*vu*Conjg(ZH(gt1,2))*dZP(gt2,2)*ZP(gt3,2))
res = res-(gp**2*QHu*Qs*vS*Conjg(ZH(gt1,3))*dZP(gt2,2)*ZP(gt3,2))
res = res-(vS*lam*Conjg(lam)*Conjg(ZH(gt1,3))*dZP(gt2,2)*ZP(gt3,2))
res = res-(gp**2*QHu*Qs1*vS1*Conjg(ZH(gt1,4))*dZP(gt2,2)*ZP(gt3,2))
res = res-(gp**2*QHu*Qs2*vS2*Conjg(ZH(gt1,5))*dZP(gt2,2)*ZP(gt3,2))
res = res-(gp**2*QHu*Qs3*vS3*Conjg(ZH(gt1,6))*dZP(gt2,2)*ZP(gt3,2))
res = res-((Conjg(ZH(gt1,3))*dZP(gt2,1)*Tlam*ZP(gt3,2))/sqrt(2._dp))
res = res-(g2**2*vu*Conjg(dZH(gt1,1))*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res+(vu*lam*Conjg(lam)*Conjg(dZH(gt1,1))*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(g2**2*vd*Conjg(dZH(gt1,2))*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res+(vd*lam*Conjg(lam)*Conjg(dZH(gt1,2))*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(dvu*g2**2*Conjg(ZH(gt1,1))*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res-(dg2*g2*vu*Conjg(ZH(gt1,1))*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(vu*lam*Conjg(dlam)*Conjg(ZH(gt1,1))*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(dlam*vu*Conjg(lam)*Conjg(ZH(gt1,1))*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(dvu*lam*Conjg(lam)*Conjg(ZH(gt1,1))*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-(dvd*g2**2*Conjg(ZH(gt1,2))*ZP(gt2,1)*ZP(gt3,2))/4._dp
res = res-(dg2*g2*vd*Conjg(ZH(gt1,2))*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(vd*lam*Conjg(dlam)*Conjg(ZH(gt1,2))*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(dlam*vd*Conjg(lam)*Conjg(ZH(gt1,2))*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res+(dvd*lam*Conjg(lam)*Conjg(ZH(gt1,2))*ZP(gt2,1)*ZP(gt3,2))/2._dp
res = res-((dTlam*Conjg(ZH(gt1,3))*ZP(gt2,1)*ZP(gt3,2))/sqrt(2._dp))
res = res-((Conjg(dZH(gt1,3))*Tlam*ZP(gt2,1)*ZP(gt3,2))/sqrt(2._dp))
res = res+(g1**2*vd*Conjg(dZH(gt1,1))*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(g2**2*vd*Conjg(dZH(gt1,1))*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(gp**2*QHd*QHu*vd*Conjg(dZH(gt1,1))*ZP(gt2,2)*ZP(gt3,2))
res = res-(g1**2*vu*Conjg(dZH(gt1,2))*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(g2**2*vu*Conjg(dZH(gt1,2))*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(gp**2*QHu**2*vu*Conjg(dZH(gt1,2))*ZP(gt2,2)*ZP(gt3,2))
res = res-(gp**2*QHu*Qs*vS*Conjg(dZH(gt1,3))*ZP(gt2,2)*ZP(gt3,2))
res = res-(vS*lam*Conjg(lam)*Conjg(dZH(gt1,3))*ZP(gt2,2)*ZP(gt3,2))
res = res-(gp**2*QHu*Qs1*vS1*Conjg(dZH(gt1,4))*ZP(gt2,2)*ZP(gt3,2))
res = res-(gp**2*QHu*Qs2*vS2*Conjg(dZH(gt1,5))*ZP(gt2,2)*ZP(gt3,2))
res = res-(gp**2*QHu*Qs3*vS3*Conjg(dZH(gt1,6))*ZP(gt2,2)*ZP(gt3,2))
res = res+(dvd*g1**2*Conjg(ZH(gt1,1))*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(dvd*g2**2*Conjg(ZH(gt1,1))*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(dvd*gp**2*QHd*QHu*Conjg(ZH(gt1,1))*ZP(gt2,2)*ZP(gt3,2))
res = res+(dg1*g1*vd*Conjg(ZH(gt1,1))*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dg2*g2*vd*Conjg(ZH(gt1,1))*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-2*dgp*gp*QHd*QHu*vd*Conjg(ZH(gt1,1))*ZP(gt2,2)*ZP(gt3,2)
res = res-(dvu*g1**2*Conjg(ZH(gt1,2))*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(dvu*g2**2*Conjg(ZH(gt1,2))*ZP(gt2,2)*ZP(gt3,2))/4._dp
res = res-(dvu*gp**2*QHu**2*Conjg(ZH(gt1,2))*ZP(gt2,2)*ZP(gt3,2))
res = res-(dg1*g1*vu*Conjg(ZH(gt1,2))*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dg2*g2*vu*Conjg(ZH(gt1,2))*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-2*dgp*gp*QHu**2*vu*Conjg(ZH(gt1,2))*ZP(gt2,2)*ZP(gt3,2)
res = res-(dvS*gp**2*QHu*Qs*Conjg(ZH(gt1,3))*ZP(gt2,2)*ZP(gt3,2))
res = res-2*dgp*gp*QHu*Qs*vS*Conjg(ZH(gt1,3))*ZP(gt2,2)*ZP(gt3,2)
res = res-(vS*lam*Conjg(dlam)*Conjg(ZH(gt1,3))*ZP(gt2,2)*ZP(gt3,2))
res = res-(dlam*vS*Conjg(lam)*Conjg(ZH(gt1,3))*ZP(gt2,2)*ZP(gt3,2))
res = res-(dvS*lam*Conjg(lam)*Conjg(ZH(gt1,3))*ZP(gt2,2)*ZP(gt3,2))
res = res-(dvS1*gp**2*QHu*Qs1*Conjg(ZH(gt1,4))*ZP(gt2,2)*ZP(gt3,2))
res = res-2*dgp*gp*QHu*Qs1*vS1*Conjg(ZH(gt1,4))*ZP(gt2,2)*ZP(gt3,2)
res = res-(dvS2*gp**2*QHu*Qs2*Conjg(ZH(gt1,5))*ZP(gt2,2)*ZP(gt3,2))
res = res-2*dgp*gp*QHu*Qs2*vS2*Conjg(ZH(gt1,5))*ZP(gt2,2)*ZP(gt3,2)
res = res-(dvS3*gp**2*QHu*Qs3*Conjg(ZH(gt1,6))*ZP(gt2,2)*ZP(gt3,2))
res = res-2*dgp*gp*QHu*Qs3*vS3*Conjg(ZH(gt1,6))*ZP(gt2,2)*ZP(gt3,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhHpmcHpm  
 
 
Subroutine CT_CouplinghhSdcSd(gt1,gt2,gt3,g1,g2,gp,Yd,Td,lam,vd,vu,vS,vS1,            & 
& vS2,vS3,ZD,ZH,dg1,dg2,dgp,dYd,dTd,dlam,dvd,dvu,dvS,dvS1,dvS2,dvS3,dZD,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,dg1,dg2,dgp,dvd,dvu,dvS,dvS1,dvS2,dvS3

Complex(dp), Intent(in) :: Yd(3,3),Td(3,3),lam,ZD(6,6),ZH(6,6),dYd(3,3),dTd(3,3),dlam,dZD(6,6),dZH(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhSdcSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,1))*dZD(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,1))*dZD(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHd*Qq*vd*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,1))*dZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,2))*dZD(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,2))*dZD(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHu*Qq*vu*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,2))*dZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs*vS*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,3))*dZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs1*vS1*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,4))*dZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs2*vS2*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,5))*dZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs3*vS3*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,6))*dZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,1))*dZD(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*Qd*QHd*vd*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,1))*dZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,2))*dZD(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*Qd*QHu*vu*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,2))*dZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qd*Qs*vS*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,3))*dZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qd*Qs1*vS1*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,4))*dZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qd*Qs2*vS2*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,5))*dZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qd*Qs3*vS3*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,6))*dZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(dZH(gt1,1))*Conjg(ZD(gt2,j1))*ZD(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(dZH(gt1,1))*Conjg(ZD(gt2,j1))*ZD(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHd*Qq*vd*Conjg(dZH(gt1,1))*Conjg(ZD(gt2,j1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(dZH(gt1,2))*Conjg(ZD(gt2,j1))*ZD(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZH(gt1,2))*Conjg(ZD(gt2,j1))*ZD(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHu*Qq*vu*Conjg(dZH(gt1,2))*Conjg(ZD(gt2,j1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs*vS*Conjg(dZH(gt1,3))*Conjg(ZD(gt2,j1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs1*vS1*Conjg(dZH(gt1,4))*Conjg(ZD(gt2,j1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs2*vS2*Conjg(dZH(gt1,5))*Conjg(ZD(gt2,j1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs3*vS3*Conjg(dZH(gt1,6))*Conjg(ZD(gt2,j1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(dZD(gt2,j1))*Conjg(ZH(gt1,1))*ZD(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(dZD(gt2,j1))*Conjg(ZH(gt1,1))*ZD(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHd*Qq*vd*Conjg(dZD(gt2,j1))*Conjg(ZH(gt1,1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res+(dvd*g1**2*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,1))*ZD(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dvd*g2**2*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,1))*ZD(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*gp**2*QHd*Qq*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res+(dg1*g1*vd*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,1))*ZD(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dg2*g2*vd*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,1))*ZD(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*QHd*Qq*vd*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,1))*ZD(gt3,j1)
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(dZD(gt2,j1))*Conjg(ZH(gt1,2))*ZD(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZD(gt2,j1))*Conjg(ZH(gt1,2))*ZD(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHu*Qq*vu*Conjg(dZD(gt2,j1))*Conjg(ZH(gt1,2))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(dvu*g1**2*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,2))*ZD(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g2**2*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,2))*ZD(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*gp**2*QHu*Qq*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,2))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(dg1*g1*vu*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,2))*ZD(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vu*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,2))*ZD(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*QHu*Qq*vu*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,2))*ZD(gt3,j1)
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs*vS*Conjg(dZD(gt2,j1))*Conjg(ZH(gt1,3))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(dvS*gp**2*Qq*Qs*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,3))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qq*Qs*vS*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,3))*ZD(gt3,j1)
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs1*vS1*Conjg(dZD(gt2,j1))*Conjg(ZH(gt1,4))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(dvS1*gp**2*Qq*Qs1*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,4))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qq*Qs1*vS1*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,4))*ZD(gt3,j1)
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs2*vS2*Conjg(dZD(gt2,j1))*Conjg(ZH(gt1,5))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(dvS2*gp**2*Qq*Qs2*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,5))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qq*Qs2*vS2*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,5))*ZD(gt3,j1)
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs3*vS3*Conjg(dZD(gt2,j1))*Conjg(ZH(gt1,6))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(dvS3*gp**2*Qq*Qs3*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,6))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qq*Qs3*vS3*Conjg(ZD(gt2,j1))*Conjg(ZH(gt1,6))*ZD(gt3,j1)
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(dZH(gt1,1))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*Qd*QHd*vd*Conjg(dZH(gt1,1))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(dZH(gt1,2))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*Qd*QHu*vu*Conjg(dZH(gt1,2))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qd*Qs*vS*Conjg(dZH(gt1,3))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qd*Qs1*vS1*Conjg(dZH(gt1,4))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qd*Qs2*vS2*Conjg(dZH(gt1,5))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qd*Qs3*vS3*Conjg(dZH(gt1,6))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(dZD(gt2,3 + j1))*Conjg(ZH(gt1,1))*ZD(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*Qd*QHd*vd*Conjg(dZD(gt2,3 + j1))*Conjg(ZH(gt1,1))*ZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res+(dvd*g1**2*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,1))*ZD(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dvd*gp**2*Qd*QHd*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,1))*ZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res+(dg1*g1*vd*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,1))*ZD(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qd*QHd*vd*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,1))*ZD(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(dZD(gt2,3 + j1))*Conjg(ZH(gt1,2))*ZD(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*Qd*QHu*vu*Conjg(dZD(gt2,3 + j1))*Conjg(ZH(gt1,2))*ZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dvu*g1**2*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,2))*ZD(gt3,3 + j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dvu*gp**2*Qd*QHu*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,2))*ZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dg1*g1*vu*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,2))*ZD(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qd*QHu*vu*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,2))*ZD(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res-(gp**2*Qd*Qs*vS*Conjg(dZD(gt2,3 + j1))*Conjg(ZH(gt1,3))*ZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dvS*gp**2*Qd*Qs*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,3))*ZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qd*Qs*vS*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,3))*ZD(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res-(gp**2*Qd*Qs1*vS1*Conjg(dZD(gt2,3 + j1))*Conjg(ZH(gt1,4))*ZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dvS1*gp**2*Qd*Qs1*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,4))*ZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qd*Qs1*vS1*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,4))*ZD(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res-(gp**2*Qd*Qs2*vS2*Conjg(dZD(gt2,3 + j1))*Conjg(ZH(gt1,5))*ZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dvS2*gp**2*Qd*Qs2*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,5))*ZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qd*Qs2*vS2*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,5))*ZD(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res-(gp**2*Qd*Qs3*vS3*Conjg(dZD(gt2,3 + j1))*Conjg(ZH(gt1,6))*ZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dvS3*gp**2*Qd*Qs3*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,6))*ZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qd*Qs3*vS3*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,6))*ZD(gt3,3 + j1)
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,2))*dZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,3))*dZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,1))*Conjg(Td(j1,j2))*dZD(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZD(gt2,j2))*Conjg(ZH(gt1,2))*dZD(gt3,3 + j1)*Yd(j1,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZD(gt2,j2))*Conjg(ZH(gt1,3))*dZD(gt3,3 + j1)*Yd(j1,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZD(gt2,j2))*Conjg(ZH(gt1,1))*dTd(j1,j2)*ZD(gt3,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZD(gt2,j2))*Conjg(ZH(gt1,2))*dYd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZD(gt2,j2))*Conjg(ZH(gt1,3))*dYd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZH(gt1,2))*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZH(gt1,3))*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZD(gt2,j2))*Conjg(ZH(gt1,2))*Yd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZD(gt2,j2))*Conjg(ZH(gt1,2))*Yd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZD(gt2,j2))*Conjg(ZH(gt1,2))*Yd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZD(gt2,j2))*Conjg(ZH(gt1,3))*Yd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dlam)*Conjg(ZD(gt2,j2))*Conjg(ZH(gt1,3))*Yd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(lam)*Conjg(ZD(gt2,j2))*Conjg(ZH(gt1,3))*Yd(j1,j2)*ZD(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZH(gt1,2))*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dZH(gt1,3))*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTd(j1,j2))*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,1))*ZD(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZD(gt2,3 + j1))*Conjg(Yd(j1,j2))*Conjg(ZH(gt1,2))*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYd(j1,j2))*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,2))*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,2))*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,2))*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dZD(gt2,3 + j1))*Conjg(Yd(j1,j2))*Conjg(ZH(gt1,3))*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dYd(j1,j2))*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,3))*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vu*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,3))*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt2,3 + j1))*Conjg(ZH(gt1,3))*ZD(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZH(gt1,1))*Conjg(ZD(gt2,3 + j1))*Conjg(Td(j1,j2))*ZD(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZD(gt2,3 + j1))*Conjg(ZH(gt1,1))*Conjg(Td(j1,j2))*ZD(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZD(gt2,j2))*Conjg(ZH(gt1,1))*dZD(gt3,3 + j1)*Td(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZH(gt1,1))*Conjg(ZD(gt2,j2))*ZD(gt3,3 + j1)*Td(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZD(gt2,j2))*Conjg(ZH(gt1,1))*ZD(gt3,3 + j1)*Td(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yd(j1,j3))*Conjg(ZD(gt2,j2))*Conjg(ZH(gt1,1))*dZD(gt3,j3)*Yd(j1,j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yd(j3,j1))*Conjg(ZD(gt2,3 + j3))*Conjg(ZH(gt1,1))*dZD(gt3,3 + j2)*Yd(j2,j1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yd(j3,j1))*Conjg(ZD(gt2,3 + j3))*Conjg(ZH(gt1,1))*dYd(j2,j1)*ZD(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dZH(gt1,1))*Conjg(Yd(j3,j1))*Conjg(ZD(gt2,3 + j3))*Yd(j2,j1)*ZD(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dZD(gt2,3 + j3))*Conjg(Yd(j3,j1))*Conjg(ZH(gt1,1))*Yd(j2,j1)*ZD(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dYd(j3,j1))*Conjg(ZD(gt2,3 + j3))*Conjg(ZH(gt1,1))*Yd(j2,j1)*ZD(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*Conjg(Yd(j3,j1))*Conjg(ZD(gt2,3 + j3))*Conjg(ZH(gt1,1))*Yd(j2,j1)*ZD(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Yd(j1,j3))*Conjg(ZD(gt2,j2))*Conjg(ZH(gt1,1))*dYd(j1,j2)*ZD(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dZH(gt1,1))*Conjg(Yd(j1,j3))*Conjg(ZD(gt2,j2))*Yd(j1,j2)*ZD(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dZD(gt2,j2))*Conjg(Yd(j1,j3))*Conjg(ZH(gt1,1))*Yd(j1,j2)*ZD(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dYd(j1,j3))*Conjg(ZD(gt2,j2))*Conjg(ZH(gt1,1))*Yd(j1,j2)*ZD(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*Conjg(Yd(j1,j3))*Conjg(ZD(gt2,j2))*Conjg(ZH(gt1,1))*Yd(j1,j2)*ZD(gt3,j3))
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhSdcSd  
 
 
Subroutine CT_CouplinghhSecSe(gt1,gt2,gt3,g1,g2,gp,Ye,Te,lam,vd,vu,vS,vS1,            & 
& vS2,vS3,ZE,ZH,dg1,dg2,dgp,dYe,dTe,dlam,dvd,dvu,dvS,dvS1,dvS2,dvS3,dZE,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,dg1,dg2,dgp,dvd,dvu,dvS,dvS1,dvS2,dvS3

Complex(dp), Intent(in) :: Ye(3,3),Te(3,3),lam,ZE(6,6),ZH(6,6),dYe(3,3),dTe(3,3),dlam,dZE(6,6),dZH(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhSecSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,1))*dZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,1))*dZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHd*Ql*vd*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,1))*dZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,2))*dZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,2))*dZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHu*Ql*vu*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,2))*dZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs*vS*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,3))*dZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs1*vS1*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,4))*dZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs2*vS2*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,5))*dZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs3*vS3*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,6))*dZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,1))*dZE(gt3,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*Qe*QHd*vd*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,1))*dZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,2))*dZE(gt3,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*Qe*QHu*vu*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,2))*dZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qe*Qs*vS*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,3))*dZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qe*Qs1*vS1*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,4))*dZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qe*Qs2*vS2*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,5))*dZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qe*Qs3*vS3*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,6))*dZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(dZH(gt1,1))*Conjg(ZE(gt2,j1))*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(dZH(gt1,1))*Conjg(ZE(gt2,j1))*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHd*Ql*vd*Conjg(dZH(gt1,1))*Conjg(ZE(gt2,j1))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(dZH(gt1,2))*Conjg(ZE(gt2,j1))*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZH(gt1,2))*Conjg(ZE(gt2,j1))*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHu*Ql*vu*Conjg(dZH(gt1,2))*Conjg(ZE(gt2,j1))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs*vS*Conjg(dZH(gt1,3))*Conjg(ZE(gt2,j1))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs1*vS1*Conjg(dZH(gt1,4))*Conjg(ZE(gt2,j1))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs2*vS2*Conjg(dZH(gt1,5))*Conjg(ZE(gt2,j1))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs3*vS3*Conjg(dZH(gt1,6))*Conjg(ZE(gt2,j1))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(dZE(gt2,j1))*Conjg(ZH(gt1,1))*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vd*Conjg(dZE(gt2,j1))*Conjg(ZH(gt1,1))*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHd*Ql*vd*Conjg(dZE(gt2,j1))*Conjg(ZH(gt1,1))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(dvd*g1**2*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,1))*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvd*g2**2*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,1))*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*gp**2*QHd*Ql*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,1))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(dg1*g1*vd*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,1))*ZE(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*g2*vd*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,1))*ZE(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*QHd*Ql*vd*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,1))*ZE(gt3,j1)
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(dZE(gt2,j1))*Conjg(ZH(gt1,2))*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZE(gt2,j1))*Conjg(ZH(gt1,2))*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHu*Ql*vu*Conjg(dZE(gt2,j1))*Conjg(ZH(gt1,2))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res+(dvu*g1**2*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,2))*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*g2**2*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,2))*ZE(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*gp**2*QHu*Ql*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,2))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res+(dg1*g1*vu*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,2))*ZE(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vu*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,2))*ZE(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*QHu*Ql*vu*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,2))*ZE(gt3,j1)
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs*vS*Conjg(dZE(gt2,j1))*Conjg(ZH(gt1,3))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(dvS*gp**2*Ql*Qs*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,3))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Ql*Qs*vS*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,3))*ZE(gt3,j1)
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs1*vS1*Conjg(dZE(gt2,j1))*Conjg(ZH(gt1,4))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(dvS1*gp**2*Ql*Qs1*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,4))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Ql*Qs1*vS1*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,4))*ZE(gt3,j1)
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs2*vS2*Conjg(dZE(gt2,j1))*Conjg(ZH(gt1,5))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(dvS2*gp**2*Ql*Qs2*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,5))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Ql*Qs2*vS2*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,5))*ZE(gt3,j1)
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs3*vS3*Conjg(dZE(gt2,j1))*Conjg(ZH(gt1,6))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(dvS3*gp**2*Ql*Qs3*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,6))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Ql*Qs3*vS3*Conjg(ZE(gt2,j1))*Conjg(ZH(gt1,6))*ZE(gt3,j1)
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(dZH(gt1,1))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*Qe*QHd*vd*Conjg(dZH(gt1,1))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(dZH(gt1,2))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*Qe*QHu*vu*Conjg(dZH(gt1,2))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qe*Qs*vS*Conjg(dZH(gt1,3))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qe*Qs1*vS1*Conjg(dZH(gt1,4))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qe*Qs2*vS2*Conjg(dZH(gt1,5))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qe*Qs3*vS3*Conjg(dZH(gt1,6))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(dZE(gt2,3 + j1))*Conjg(ZH(gt1,1))*ZE(gt3,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*Qe*QHd*vd*Conjg(dZE(gt2,3 + j1))*Conjg(ZH(gt1,1))*ZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res+(dvd*g1**2*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,1))*ZE(gt3,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dvd*gp**2*Qe*QHd*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,1))*ZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res+dg1*g1*vd*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,1))*ZE(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qe*QHd*vd*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,1))*ZE(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(dZE(gt2,3 + j1))*Conjg(ZH(gt1,2))*ZE(gt3,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*Qe*QHu*vu*Conjg(dZE(gt2,3 + j1))*Conjg(ZH(gt1,2))*ZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dvu*g1**2*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,2))*ZE(gt3,3 + j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dvu*gp**2*Qe*QHu*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,2))*ZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dg1*g1*vu*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,2))*ZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qe*QHu*vu*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,2))*ZE(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res-(gp**2*Qe*Qs*vS*Conjg(dZE(gt2,3 + j1))*Conjg(ZH(gt1,3))*ZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dvS*gp**2*Qe*Qs*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,3))*ZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qe*Qs*vS*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,3))*ZE(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res-(gp**2*Qe*Qs1*vS1*Conjg(dZE(gt2,3 + j1))*Conjg(ZH(gt1,4))*ZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dvS1*gp**2*Qe*Qs1*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,4))*ZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qe*Qs1*vS1*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,4))*ZE(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res-(gp**2*Qe*Qs2*vS2*Conjg(dZE(gt2,3 + j1))*Conjg(ZH(gt1,5))*ZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dvS2*gp**2*Qe*Qs2*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,5))*ZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qe*Qs2*vS2*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,5))*ZE(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res-(gp**2*Qe*Qs3*vS3*Conjg(dZE(gt2,3 + j1))*Conjg(ZH(gt1,6))*ZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dvS3*gp**2*Qe*Qs3*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,6))*ZE(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qe*Qs3*vS3*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,6))*ZE(gt3,3 + j1)
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,2))*dZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,3))*dZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,1))*Conjg(Te(j1,j2))*dZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZE(gt2,j2))*Conjg(ZH(gt1,2))*dZE(gt3,3 + j1)*Ye(j1,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZE(gt2,j2))*Conjg(ZH(gt1,3))*dZE(gt3,3 + j1)*Ye(j1,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZE(gt2,j2))*Conjg(ZH(gt1,1))*dTe(j1,j2)*ZE(gt3,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZE(gt2,j2))*Conjg(ZH(gt1,2))*dYe(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(ZE(gt2,j2))*Conjg(ZH(gt1,3))*dYe(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZH(gt1,2))*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZH(gt1,3))*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZE(gt2,j2))*Conjg(ZH(gt1,2))*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZE(gt2,j2))*Conjg(ZH(gt1,2))*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZE(gt2,j2))*Conjg(ZH(gt1,2))*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(lam)*Conjg(dZE(gt2,j2))*Conjg(ZH(gt1,3))*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dlam)*Conjg(ZE(gt2,j2))*Conjg(ZH(gt1,3))*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(lam)*Conjg(ZE(gt2,j2))*Conjg(ZH(gt1,3))*Ye(j1,j2)*ZE(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZH(gt1,2))*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dZH(gt1,3))*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTe(j1,j2))*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,1))*ZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZE(gt2,3 + j1))*Conjg(Ye(j1,j2))*Conjg(ZH(gt1,2))*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYe(j1,j2))*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,2))*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,2))*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,2))*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dZE(gt2,3 + j1))*Conjg(Ye(j1,j2))*Conjg(ZH(gt1,3))*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*lam*Conjg(dYe(j1,j2))*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,3))*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vu*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,3))*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt2,3 + j1))*Conjg(ZH(gt1,3))*ZE(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZH(gt1,1))*Conjg(ZE(gt2,3 + j1))*Conjg(Te(j1,j2))*ZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZE(gt2,3 + j1))*Conjg(ZH(gt1,1))*Conjg(Te(j1,j2))*ZE(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZE(gt2,j2))*Conjg(ZH(gt1,1))*dZE(gt3,3 + j1)*Te(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZH(gt1,1))*Conjg(ZE(gt2,j2))*ZE(gt3,3 + j1)*Te(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZE(gt2,j2))*Conjg(ZH(gt1,1))*ZE(gt3,3 + j1)*Te(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j1,j3))*Conjg(ZE(gt2,j2))*Conjg(ZH(gt1,1))*dZE(gt3,j3)*Ye(j1,j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j3,j1))*Conjg(ZE(gt2,3 + j3))*Conjg(ZH(gt1,1))*dZE(gt3,3 + j2)*Ye(j2,j1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j3,j1))*Conjg(ZE(gt2,3 + j3))*Conjg(ZH(gt1,1))*dYe(j2,j1)*ZE(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dZH(gt1,1))*Conjg(Ye(j3,j1))*Conjg(ZE(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dZE(gt2,3 + j3))*Conjg(Ye(j3,j1))*Conjg(ZH(gt1,1))*Ye(j2,j1)*ZE(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dYe(j3,j1))*Conjg(ZE(gt2,3 + j3))*Conjg(ZH(gt1,1))*Ye(j2,j1)*ZE(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*Conjg(Ye(j3,j1))*Conjg(ZE(gt2,3 + j3))*Conjg(ZH(gt1,1))*Ye(j2,j1)*ZE(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(Ye(j1,j3))*Conjg(ZE(gt2,j2))*Conjg(ZH(gt1,1))*dYe(j1,j2)*ZE(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dZH(gt1,1))*Conjg(Ye(j1,j3))*Conjg(ZE(gt2,j2))*Ye(j1,j2)*ZE(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dZE(gt2,j2))*Conjg(Ye(j1,j3))*Conjg(ZH(gt1,1))*Ye(j1,j2)*ZE(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vd*Conjg(dYe(j1,j3))*Conjg(ZE(gt2,j2))*Conjg(ZH(gt1,1))*Ye(j1,j2)*ZE(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvd*Conjg(Ye(j1,j3))*Conjg(ZE(gt2,j2))*Conjg(ZH(gt1,1))*Ye(j1,j2)*ZE(gt3,j3))
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhSecSe  
 
 
Subroutine CT_CouplinghhSucSu(gt1,gt2,gt3,g1,g2,gp,lam,Yu,Tu,vd,vu,vS,vS1,            & 
& vS2,vS3,ZU,ZH,dg1,dg2,dgp,dlam,dYu,dTu,dvd,dvu,dvS,dvS1,dvS2,dvS3,dZU,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,dg1,dg2,dgp,dvd,dvu,dvS,dvS1,dvS2,dvS3

Complex(dp), Intent(in) :: lam,Yu(3,3),Tu(3,3),ZU(6,6),ZH(6,6),dlam,dYu(3,3),dTu(3,3),dZU(6,6),dZH(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhSucSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,j1))*dZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,j1))*dZU(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHd*Qq*vd*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,j1))*dZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,j1))*dZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,j1))*dZU(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHu*Qq*vu*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,j1))*dZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs*vS*Conjg(ZH(gt1,3))*Conjg(ZU(gt2,j1))*dZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs1*vS1*Conjg(ZH(gt1,4))*Conjg(ZU(gt2,j1))*dZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs2*vS2*Conjg(ZH(gt1,5))*Conjg(ZU(gt2,j1))*dZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs3*vS3*Conjg(ZH(gt1,6))*Conjg(ZU(gt2,j1))*dZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHd*Qu*vd*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHu*Qu*vu*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs*Qu*vS*Conjg(ZH(gt1,3))*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs1*Qu*vS1*Conjg(ZH(gt1,4))*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs2*Qu*vS2*Conjg(ZH(gt1,5))*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs3*Qu*vS3*Conjg(ZH(gt1,6))*Conjg(ZU(gt2,3 + j1))*dZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(dZU(gt2,j1))*Conjg(ZH(gt1,1))*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZU(gt2,j1))*Conjg(ZH(gt1,1))*ZU(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHd*Qq*vd*Conjg(dZU(gt2,j1))*Conjg(ZH(gt1,1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(dZU(gt2,j1))*Conjg(ZH(gt1,2))*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(dZU(gt2,j1))*Conjg(ZH(gt1,2))*ZU(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHu*Qq*vu*Conjg(dZU(gt2,j1))*Conjg(ZH(gt1,2))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs*vS*Conjg(dZU(gt2,j1))*Conjg(ZH(gt1,3))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs1*vS1*Conjg(dZU(gt2,j1))*Conjg(ZH(gt1,4))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs2*vS2*Conjg(dZU(gt2,j1))*Conjg(ZH(gt1,5))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs3*vS3*Conjg(dZU(gt2,j1))*Conjg(ZH(gt1,6))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res+(g1**2*vd*Conjg(dZH(gt1,1))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZH(gt1,1))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHd*Qq*vd*Conjg(dZH(gt1,1))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(g1**2*vu*Conjg(dZH(gt1,2))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(dZH(gt1,2))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHu*Qq*vu*Conjg(dZH(gt1,2))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs*vS*Conjg(dZH(gt1,3))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs1*vS1*Conjg(dZH(gt1,4))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs2*vS2*Conjg(dZH(gt1,5))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qq*Qs3*vS3*Conjg(dZH(gt1,6))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res+(dvd*g1**2*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*gp**2*QHd*Qq*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res+(dg1*g1*vd*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vd*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*QHd*Qq*vd*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,j1))*ZU(gt3,j1)
End Do 
Do j1 = 1,3
res = res-(dvu*g1**2*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))/12._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g2**2*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*gp**2*QHu*Qq*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(dg1*g1*vu*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dg2*g2*vu*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*QHu*Qq*vu*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,j1))*ZU(gt3,j1)
End Do 
Do j1 = 1,3
res = res-(dvS*gp**2*Qq*Qs*Conjg(ZH(gt1,3))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qq*Qs*vS*Conjg(ZH(gt1,3))*Conjg(ZU(gt2,j1))*ZU(gt3,j1)
End Do 
Do j1 = 1,3
res = res-(dvS1*gp**2*Qq*Qs1*Conjg(ZH(gt1,4))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qq*Qs1*vS1*Conjg(ZH(gt1,4))*Conjg(ZU(gt2,j1))*ZU(gt3,j1)
End Do 
Do j1 = 1,3
res = res-(dvS2*gp**2*Qq*Qs2*Conjg(ZH(gt1,5))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qq*Qs2*vS2*Conjg(ZH(gt1,5))*Conjg(ZU(gt2,j1))*ZU(gt3,j1)
End Do 
Do j1 = 1,3
res = res-(dvS3*gp**2*Qq*Qs3*Conjg(ZH(gt1,6))*Conjg(ZU(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qq*Qs3*vS3*Conjg(ZH(gt1,6))*Conjg(ZU(gt2,j1))*ZU(gt3,j1)
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(dZU(gt2,3 + j1))*Conjg(ZH(gt1,1))*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHd*Qu*vd*Conjg(dZU(gt2,3 + j1))*Conjg(ZH(gt1,1))*ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(dZU(gt2,3 + j1))*Conjg(ZH(gt1,2))*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHu*Qu*vu*Conjg(dZU(gt2,3 + j1))*Conjg(ZH(gt1,2))*ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs*Qu*vS*Conjg(dZU(gt2,3 + j1))*Conjg(ZH(gt1,3))*ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs1*Qu*vS1*Conjg(dZU(gt2,3 + j1))*Conjg(ZH(gt1,4))*ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs2*Qu*vS2*Conjg(dZU(gt2,3 + j1))*Conjg(ZH(gt1,5))*ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs3*Qu*vS3*Conjg(dZU(gt2,3 + j1))*Conjg(ZH(gt1,6))*ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(dZH(gt1,1))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHd*Qu*vd*Conjg(dZH(gt1,1))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(dZH(gt1,2))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHu*Qu*vu*Conjg(dZH(gt1,2))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs*Qu*vS*Conjg(dZH(gt1,3))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs1*Qu*vS1*Conjg(dZH(gt1,4))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs2*Qu*vS2*Conjg(dZH(gt1,5))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs3*Qu*vS3*Conjg(dZH(gt1,6))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dvd*g1**2*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dvd*gp**2*QHd*Qu*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res+(-2*dg1*g1*vd*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*QHd*Qu*vd*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res+(dvu*g1**2*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dvu*gp**2*QHu*Qu*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res+(2*dg1*g1*vu*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*QHu*Qu*vu*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res-(dvS*gp**2*Qs*Qu*Conjg(ZH(gt1,3))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qs*Qu*vS*Conjg(ZH(gt1,3))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res-(dvS1*gp**2*Qs1*Qu*Conjg(ZH(gt1,4))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qs1*Qu*vS1*Conjg(ZH(gt1,4))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res-(dvS2*gp**2*Qs2*Qu*Conjg(ZH(gt1,5))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qs2*Qu*vS2*Conjg(ZH(gt1,5))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res-(dvS3*gp**2*Qs3*Qu*Conjg(ZH(gt1,6))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qs3*Qu*vS3*Conjg(ZH(gt1,6))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,3 + j1)
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yu(j1,j2))*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,3 + j1))*dZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(Yu(j1,j2))*Conjg(ZH(gt1,3))*Conjg(ZU(gt2,3 + j1))*dZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZH(gt1,2))*Conjg(ZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*dZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,j2))*dZU(gt3,3 + j1)*Yu(j1,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZH(gt1,3))*Conjg(ZU(gt2,j2))*dZU(gt3,3 + j1)*Yu(j1,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZH(gt1,2))*Conjg(ZU(gt2,j2))*dTu(j1,j2)*ZU(gt3,3 + j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,j2))*dYu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZH(gt1,3))*Conjg(ZU(gt2,j2))*dYu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZU(gt2,j2))*Conjg(ZH(gt1,1))*Yu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZU(gt2,j2))*Conjg(ZH(gt1,3))*Yu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZH(gt1,1))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZH(gt1,3))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZH(gt1,3))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZH(gt1,3))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZU(gt3,3 + j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZU(gt2,3 + j1))*Conjg(Yu(j1,j2))*Conjg(ZH(gt1,1))*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZU(gt2,3 + j1))*Conjg(Yu(j1,j2))*Conjg(ZH(gt1,3))*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZH(gt1,1))*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZH(gt1,3))*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYu(j1,j2))*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Yu(j1,j2))*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Yu(j1,j2))*Conjg(ZH(gt1,1))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTu(j1,j2))*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dYu(j1,j2))*Conjg(ZH(gt1,3))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vd*Conjg(Yu(j1,j2))*Conjg(ZH(gt1,3))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*lam*Conjg(Yu(j1,j2))*Conjg(ZH(gt1,3))*Conjg(ZU(gt2,3 + j1))*ZU(gt3,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZU(gt2,3 + j1))*Conjg(ZH(gt1,2))*Conjg(Tu(j1,j2))*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZH(gt1,2))*Conjg(ZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*ZU(gt3,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZH(gt1,2))*Conjg(ZU(gt2,j2))*dZU(gt3,3 + j1)*Tu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZU(gt2,j2))*Conjg(ZH(gt1,2))*ZU(gt3,3 + j1)*Tu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZH(gt1,2))*Conjg(ZU(gt2,j2))*ZU(gt3,3 + j1)*Tu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yu(j1,j3))*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,j2))*dZU(gt3,j3)*Yu(j1,j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yu(j3,j1))*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,3 + j3))*dZU(gt3,3 + j2)*Yu(j2,j1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yu(j3,j1))*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,3 + j3))*dYu(j2,j1)*ZU(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZU(gt2,3 + j3))*Conjg(Yu(j3,j1))*Conjg(ZH(gt1,2))*Yu(j2,j1)*ZU(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZH(gt1,2))*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*Yu(j2,j1)*ZU(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYu(j3,j1))*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,3 + j3))*Yu(j2,j1)*ZU(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yu(j3,j1))*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,3 + j3))*Yu(j2,j1)*ZU(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yu(j1,j3))*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,j2))*dYu(j1,j2)*ZU(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZU(gt2,j2))*Conjg(Yu(j1,j3))*Conjg(ZH(gt1,2))*Yu(j1,j2)*ZU(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZH(gt1,2))*Conjg(Yu(j1,j3))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZU(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYu(j1,j3))*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZU(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yu(j1,j3))*Conjg(ZH(gt1,2))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZU(gt3,j3))
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhSucSu  
 
 
Subroutine CT_CouplinghhSvcSv(gt1,gt2,gt3,g1,g2,gp,lam,Yv,Tv,vd,vu,vS,vS1,            & 
& vS2,vS3,ZV,ZH,dg1,dg2,dgp,dlam,dYv,dTv,dvd,dvu,dvS,dvS1,dvS2,dvS3,dZV,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,dg1,dg2,dgp,dvd,dvu,dvS,dvS1,dvS2,dvS3

Complex(dp), Intent(in) :: lam,Yv(3,3),Tv(3,3),ZV(6,6),ZH(6,6),dlam,dYv(3,3),dTv(3,3),dZV(6,6),dZH(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhSvcSv' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(ZH(gt1,1))*Conjg(ZV(gt2,j1))*dZV(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZH(gt1,1))*Conjg(ZV(gt2,j1))*dZV(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHd*Ql*vd*Conjg(ZH(gt1,1))*Conjg(ZV(gt2,j1))*dZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(ZH(gt1,2))*Conjg(ZV(gt2,j1))*dZV(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(ZH(gt1,2))*Conjg(ZV(gt2,j1))*dZV(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHu*Ql*vu*Conjg(ZH(gt1,2))*Conjg(ZV(gt2,j1))*dZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs*vS*Conjg(ZH(gt1,3))*Conjg(ZV(gt2,j1))*dZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs1*vS1*Conjg(ZH(gt1,4))*Conjg(ZV(gt2,j1))*dZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs2*vS2*Conjg(ZH(gt1,5))*Conjg(ZV(gt2,j1))*dZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs3*vS3*Conjg(ZH(gt1,6))*Conjg(ZV(gt2,j1))*dZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*QHd*Qv*vd*Conjg(ZH(gt1,1))*Conjg(ZV(gt2,3 + j1))*dZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*QHu*Qv*vu*Conjg(ZH(gt1,2))*Conjg(ZV(gt2,3 + j1))*dZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs*Qv*vS*Conjg(ZH(gt1,3))*Conjg(ZV(gt2,3 + j1))*dZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs1*Qv*vS1*Conjg(ZH(gt1,4))*Conjg(ZV(gt2,3 + j1))*dZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs2*Qv*vS2*Conjg(ZH(gt1,5))*Conjg(ZV(gt2,3 + j1))*dZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs3*Qv*vS3*Conjg(ZH(gt1,6))*Conjg(ZV(gt2,3 + j1))*dZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(dZV(gt2,j1))*Conjg(ZH(gt1,1))*ZV(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZV(gt2,j1))*Conjg(ZH(gt1,1))*ZV(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHd*Ql*vd*Conjg(dZV(gt2,j1))*Conjg(ZH(gt1,1))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(dZV(gt2,j1))*Conjg(ZH(gt1,2))*ZV(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(dZV(gt2,j1))*Conjg(ZH(gt1,2))*ZV(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHu*Ql*vu*Conjg(dZV(gt2,j1))*Conjg(ZH(gt1,2))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs*vS*Conjg(dZV(gt2,j1))*Conjg(ZH(gt1,3))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs1*vS1*Conjg(dZV(gt2,j1))*Conjg(ZH(gt1,4))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs2*vS2*Conjg(dZV(gt2,j1))*Conjg(ZH(gt1,5))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs3*vS3*Conjg(dZV(gt2,j1))*Conjg(ZH(gt1,6))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(g1**2*vd*Conjg(dZH(gt1,1))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZH(gt1,1))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHd*Ql*vd*Conjg(dZH(gt1,1))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res+(g1**2*vu*Conjg(dZH(gt1,2))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(g2**2*vu*Conjg(dZH(gt1,2))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(gp**2*QHu*Ql*vu*Conjg(dZH(gt1,2))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs*vS*Conjg(dZH(gt1,3))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs1*vS1*Conjg(dZH(gt1,4))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs2*vS2*Conjg(dZH(gt1,5))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Ql*Qs3*vS3*Conjg(dZH(gt1,6))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(dvd*g1**2*Conjg(ZH(gt1,1))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZH(gt1,1))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvd*gp**2*QHd*Ql*Conjg(ZH(gt1,1))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res-(dg1*g1*vd*Conjg(ZH(gt1,1))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*g2*vd*Conjg(ZH(gt1,1))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*QHd*Ql*vd*Conjg(ZH(gt1,1))*Conjg(ZV(gt2,j1))*ZV(gt3,j1)
End Do 
Do j1 = 1,3
res = res+(dvu*g1**2*Conjg(ZH(gt1,2))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res+(dvu*g2**2*Conjg(ZH(gt1,2))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))/4._dp
End Do 
Do j1 = 1,3
res = res-(dvu*gp**2*QHu*Ql*Conjg(ZH(gt1,2))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res+(dg1*g1*vu*Conjg(ZH(gt1,2))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*g2*vu*Conjg(ZH(gt1,2))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*QHu*Ql*vu*Conjg(ZH(gt1,2))*Conjg(ZV(gt2,j1))*ZV(gt3,j1)
End Do 
Do j1 = 1,3
res = res-(dvS*gp**2*Ql*Qs*Conjg(ZH(gt1,3))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Ql*Qs*vS*Conjg(ZH(gt1,3))*Conjg(ZV(gt2,j1))*ZV(gt3,j1)
End Do 
Do j1 = 1,3
res = res-(dvS1*gp**2*Ql*Qs1*Conjg(ZH(gt1,4))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Ql*Qs1*vS1*Conjg(ZH(gt1,4))*Conjg(ZV(gt2,j1))*ZV(gt3,j1)
End Do 
Do j1 = 1,3
res = res-(dvS2*gp**2*Ql*Qs2*Conjg(ZH(gt1,5))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Ql*Qs2*vS2*Conjg(ZH(gt1,5))*Conjg(ZV(gt2,j1))*ZV(gt3,j1)
End Do 
Do j1 = 1,3
res = res-(dvS3*gp**2*Ql*Qs3*Conjg(ZH(gt1,6))*Conjg(ZV(gt2,j1))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Ql*Qs3*vS3*Conjg(ZH(gt1,6))*Conjg(ZV(gt2,j1))*ZV(gt3,j1)
End Do 
Do j1 = 1,3
res = res-(gp**2*QHd*Qv*vd*Conjg(dZV(gt2,3 + j1))*Conjg(ZH(gt1,1))*ZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*QHu*Qv*vu*Conjg(dZV(gt2,3 + j1))*Conjg(ZH(gt1,2))*ZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs*Qv*vS*Conjg(dZV(gt2,3 + j1))*Conjg(ZH(gt1,3))*ZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs1*Qv*vS1*Conjg(dZV(gt2,3 + j1))*Conjg(ZH(gt1,4))*ZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs2*Qv*vS2*Conjg(dZV(gt2,3 + j1))*Conjg(ZH(gt1,5))*ZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs3*Qv*vS3*Conjg(dZV(gt2,3 + j1))*Conjg(ZH(gt1,6))*ZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*QHd*Qv*vd*Conjg(dZH(gt1,1))*Conjg(ZV(gt2,3 + j1))*ZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*QHu*Qv*vu*Conjg(dZH(gt1,2))*Conjg(ZV(gt2,3 + j1))*ZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs*Qv*vS*Conjg(dZH(gt1,3))*Conjg(ZV(gt2,3 + j1))*ZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs1*Qv*vS1*Conjg(dZH(gt1,4))*Conjg(ZV(gt2,3 + j1))*ZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs2*Qv*vS2*Conjg(dZH(gt1,5))*Conjg(ZV(gt2,3 + j1))*ZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp**2*Qs3*Qv*vS3*Conjg(dZH(gt1,6))*Conjg(ZV(gt2,3 + j1))*ZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dvd*gp**2*QHd*Qv*Conjg(ZH(gt1,1))*Conjg(ZV(gt2,3 + j1))*ZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*QHd*Qv*vd*Conjg(ZH(gt1,1))*Conjg(ZV(gt2,3 + j1))*ZV(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res-(dvu*gp**2*QHu*Qv*Conjg(ZH(gt1,2))*Conjg(ZV(gt2,3 + j1))*ZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*QHu*Qv*vu*Conjg(ZH(gt1,2))*Conjg(ZV(gt2,3 + j1))*ZV(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res-(dvS*gp**2*Qs*Qv*Conjg(ZH(gt1,3))*Conjg(ZV(gt2,3 + j1))*ZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qs*Qv*vS*Conjg(ZH(gt1,3))*Conjg(ZV(gt2,3 + j1))*ZV(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res-(dvS1*gp**2*Qs1*Qv*Conjg(ZH(gt1,4))*Conjg(ZV(gt2,3 + j1))*ZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qs1*Qv*vS1*Conjg(ZH(gt1,4))*Conjg(ZV(gt2,3 + j1))*ZV(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res-(dvS2*gp**2*Qs2*Qv*Conjg(ZH(gt1,5))*Conjg(ZV(gt2,3 + j1))*ZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qs2*Qv*vS2*Conjg(ZH(gt1,5))*Conjg(ZV(gt2,3 + j1))*ZV(gt3,3 + j1)
End Do 
Do j1 = 1,3
res = res-(dvS3*gp**2*Qs3*Qv*Conjg(ZH(gt1,6))*Conjg(ZV(gt2,3 + j1))*ZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
res = res-2*dgp*gp*Qs3*Qv*vS3*Conjg(ZH(gt1,6))*Conjg(ZV(gt2,3 + j1))*ZV(gt3,3 + j1)
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yv(j1,j2))*Conjg(ZH(gt1,1))*Conjg(ZV(gt2,3 + j2))*dZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(Yv(j1,j2))*Conjg(ZH(gt1,3))*Conjg(ZV(gt2,3 + j2))*dZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZH(gt1,2))*Conjg(ZV(gt2,3 + j2))*Conjg(Tv(j1,j2))*dZV(gt3,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZH(gt1,1))*Conjg(ZV(gt2,j1))*dZV(gt3,3 + j2)*Yv(j1,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZH(gt1,3))*Conjg(ZV(gt2,j1))*dZV(gt3,3 + j2)*Yv(j1,j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZV(gt2,3 + j2))*Conjg(Yv(j1,j2))*Conjg(ZH(gt1,1))*ZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZV(gt2,3 + j2))*Conjg(Yv(j1,j2))*Conjg(ZH(gt1,3))*ZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZH(gt1,1))*Conjg(Yv(j1,j2))*Conjg(ZV(gt2,3 + j2))*ZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dZH(gt1,3))*Conjg(Yv(j1,j2))*Conjg(ZV(gt2,3 + j2))*ZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYv(j1,j2))*Conjg(ZH(gt1,1))*Conjg(ZV(gt2,3 + j2))*ZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Yv(j1,j2))*Conjg(ZH(gt1,1))*Conjg(ZV(gt2,3 + j2))*ZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Yv(j1,j2))*Conjg(ZH(gt1,1))*Conjg(ZV(gt2,3 + j2))*ZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dTv(j1,j2))*Conjg(ZH(gt1,2))*Conjg(ZV(gt2,3 + j2))*ZV(gt3,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*lam*Conjg(dYv(j1,j2))*Conjg(ZH(gt1,3))*Conjg(ZV(gt2,3 + j2))*ZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vd*Conjg(Yv(j1,j2))*Conjg(ZH(gt1,3))*Conjg(ZV(gt2,3 + j2))*ZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*lam*Conjg(Yv(j1,j2))*Conjg(ZH(gt1,3))*Conjg(ZV(gt2,3 + j2))*ZV(gt3,j1))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZV(gt2,3 + j2))*Conjg(ZH(gt1,2))*Conjg(Tv(j1,j2))*ZV(gt3,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZH(gt1,2))*Conjg(ZV(gt2,3 + j2))*Conjg(Tv(j1,j2))*ZV(gt3,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZH(gt1,2))*Conjg(ZV(gt2,j1))*dTv(j1,j2)*ZV(gt3,3 + j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZH(gt1,1))*Conjg(ZV(gt2,j1))*dYv(j1,j2)*ZV(gt3,3 + j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(ZH(gt1,3))*Conjg(ZV(gt2,j1))*dYv(j1,j2)*ZV(gt3,3 + j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZV(gt2,j1))*Conjg(ZH(gt1,1))*Yv(j1,j2)*ZV(gt3,3 + j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZV(gt2,j1))*Conjg(ZH(gt1,3))*Yv(j1,j2)*ZV(gt3,3 + j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZH(gt1,1))*Conjg(ZV(gt2,j1))*Yv(j1,j2)*ZV(gt3,3 + j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(lam)*Conjg(dZH(gt1,3))*Conjg(ZV(gt2,j1))*Yv(j1,j2)*ZV(gt3,3 + j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZH(gt1,1))*Conjg(ZV(gt2,j1))*Yv(j1,j2)*ZV(gt3,3 + j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZH(gt1,1))*Conjg(ZV(gt2,j1))*Yv(j1,j2)*ZV(gt3,3 + j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dlam)*Conjg(ZH(gt1,3))*Conjg(ZV(gt2,j1))*Yv(j1,j2)*ZV(gt3,3 + j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(lam)*Conjg(ZH(gt1,3))*Conjg(ZV(gt2,j1))*Yv(j1,j2)*ZV(gt3,3 + j2))/2._dp
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(ZH(gt1,2))*Conjg(ZV(gt2,j1))*dZV(gt3,3 + j2)*Tv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZV(gt2,j1))*Conjg(ZH(gt1,2))*ZV(gt3,3 + j2)*Tv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res-((Conjg(dZH(gt1,2))*Conjg(ZV(gt2,j1))*ZV(gt3,3 + j2)*Tv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZH(gt1,2))*Conjg(ZV(gt2,3 + j3))*dZV(gt3,3 + j2)*Yv(j1,j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZH(gt1,2))*Conjg(ZV(gt2,j2))*dZV(gt3,j3)*Yv(j2,j1))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j1,j3))*Conjg(ZH(gt1,2))*Conjg(ZV(gt2,3 + j3))*dYv(j1,j2)*ZV(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZV(gt2,3 + j3))*Conjg(Yv(j1,j3))*Conjg(ZH(gt1,2))*Yv(j1,j2)*ZV(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZH(gt1,2))*Conjg(Yv(j1,j3))*Conjg(ZV(gt2,3 + j3))*Yv(j1,j2)*ZV(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j1,j3))*Conjg(ZH(gt1,2))*Conjg(ZV(gt2,3 + j3))*Yv(j1,j2)*ZV(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j1,j3))*Conjg(ZH(gt1,2))*Conjg(ZV(gt2,3 + j3))*Yv(j1,j2)*ZV(gt3,3 + j2))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(Yv(j3,j1))*Conjg(ZH(gt1,2))*Conjg(ZV(gt2,j2))*dYv(j2,j1)*ZV(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZV(gt2,j2))*Conjg(Yv(j3,j1))*Conjg(ZH(gt1,2))*Yv(j2,j1)*ZV(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dZH(gt1,2))*Conjg(Yv(j3,j1))*Conjg(ZV(gt2,j2))*Yv(j2,j1)*ZV(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(vu*Conjg(dYv(j3,j1))*Conjg(ZH(gt1,2))*Conjg(ZV(gt2,j2))*Yv(j2,j1)*ZV(gt3,j3))
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res-(dvu*Conjg(Yv(j3,j1))*Conjg(ZH(gt1,2))*Conjg(ZV(gt2,j2))*Yv(j2,j1)*ZV(gt3,j3))
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhSvcSv  
 
 
Subroutine CT_CouplingHpmSucSd(gt1,gt2,gt3,g2,Yd,Td,lam,Yu,Tu,vd,vu,vS,               & 
& ZD,ZU,ZP,dg2,dYd,dTd,dlam,dYu,dTu,dvd,dvu,dvS,dZD,dZU,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,vd,vu,vS,ZP(2,2),dg2,dvd,dvu,dvS,dZP(2,2)

Complex(dp), Intent(in) :: Yd(3,3),Td(3,3),lam,Yu(3,3),Tu(3,3),ZD(6,6),ZU(6,6),dYd(3,3),dTd(3,3),dlam,           & 
& dYu(3,3),dTu(3,3),dZD(6,6),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmSucSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZU(gt2,j1))*dZP(gt1,1)*ZD(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZU(gt2,j1))*dZP(gt1,2)*ZD(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZU(gt2,j1))*dZD(gt3,j1)*ZP(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZU(gt2,j1))*ZD(gt3,j1)*ZP(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZU(gt2,j1))*ZD(gt3,j1)*ZP(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-((dg2*g2*vd*Conjg(ZU(gt2,j1))*ZD(gt3,j1)*ZP(gt1,1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZU(gt2,j1))*dZD(gt3,j1)*ZP(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZU(gt2,j1))*ZD(gt3,j1)*ZP(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(dvu*g2**2*Conjg(ZU(gt2,j1))*ZD(gt3,j1)*ZP(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-((dg2*g2*vu*Conjg(ZU(gt2,j1))*ZD(gt3,j1)*ZP(gt1,2))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZU(gt2,j2))*dZP(gt1,2)*Yd(j1,j2)*ZD(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*dZP(gt1,1)*ZD(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*dZP(gt1,2)*ZD(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*dZD(gt3,j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZU(gt2,j2))*dTd(j1,j2)*ZD(gt3,3 + j1)*ZP(gt1,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZU(gt2,3 + j1))*Conjg(Yu(j1,j2))*ZD(gt3,j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZD(gt3,j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZD(gt3,j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Yu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZD(gt3,j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*dZD(gt3,j2)*ZP(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZU(gt2,j2))*dZD(gt3,3 + j1)*Yd(j1,j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZU(gt2,j2))*dYd(j1,j2)*ZD(gt3,3 + j1)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZU(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZU(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZU(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dTu(j1,j2))*Conjg(ZU(gt2,3 + j1))*ZD(gt3,j2)*ZP(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dZU(gt2,3 + j1))*Conjg(Tu(j1,j2))*ZD(gt3,j2)*ZP(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZU(gt2,j2))*dZP(gt1,1)*ZD(gt3,3 + j1)*Td(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZU(gt2,j2))*dZD(gt3,3 + j1)*ZP(gt1,1)*Td(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dZU(gt2,j2))*ZD(gt3,3 + j1)*ZP(gt1,1)*Td(j1,j2)
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dZP(gt1,1)*Yd(j2,j1)*ZD(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dZP(gt1,2)*Yd(j2,j1)*ZD(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j1,j3))*Conjg(ZU(gt2,j2))*dZP(gt1,1)*Yd(j1,j2)*ZD(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j1,j3))*Conjg(ZU(gt2,j2))*dZP(gt1,2)*Yu(j1,j2)*ZD(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j1,j3))*Conjg(ZU(gt2,j2))*dZD(gt3,j3)*Yd(j1,j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dZD(gt3,3 + j2)*Yd(j2,j1)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dYd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZU(gt2,3 + j3))*Conjg(Yu(j3,j1))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYu(j3,j1))*Conjg(ZU(gt2,3 + j3))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j1,j3))*Conjg(ZU(gt2,j2))*dYd(j1,j2)*ZD(gt3,j3)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZU(gt2,j2))*Conjg(Yd(j1,j3))*Yd(j1,j2)*ZD(gt3,j3)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYd(j1,j3))*Conjg(ZU(gt2,j2))*Yd(j1,j2)*ZD(gt3,j3)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Yd(j1,j3))*Conjg(ZU(gt2,j2))*Yd(j1,j2)*ZD(gt3,j3)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dZD(gt3,3 + j2)*Yd(j2,j1)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j1,j3))*Conjg(ZU(gt2,j2))*dZD(gt3,j3)*Yu(j1,j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*dYd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZU(gt2,3 + j3))*Conjg(Yu(j3,j1))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYu(j3,j1))*Conjg(ZU(gt2,3 + j3))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Yu(j3,j1))*Conjg(ZU(gt2,3 + j3))*Yd(j2,j1)*ZD(gt3,3 + j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j1,j3))*Conjg(ZU(gt2,j2))*dYu(j1,j2)*ZD(gt3,j3)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZU(gt2,j2))*Conjg(Yu(j1,j3))*Yu(j1,j2)*ZD(gt3,j3)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYu(j1,j3))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZD(gt3,j3)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yu(j1,j3))*Conjg(ZU(gt2,j2))*Yu(j1,j2)*ZD(gt3,j3)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmSucSd  
 
 
Subroutine CT_CouplingHpmSvcSe(gt1,gt2,gt3,g2,Ye,Te,lam,Yv,Tv,vd,vu,vS,               & 
& ZV,ZE,ZP,dg2,dYe,dTe,dlam,dYv,dTv,dvd,dvu,dvS,dZV,dZE,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,vd,vu,vS,ZP(2,2),dg2,dvd,dvu,dvS,dZP(2,2)

Complex(dp), Intent(in) :: Ye(3,3),Te(3,3),lam,Yv(3,3),Tv(3,3),ZV(6,6),ZE(6,6),dYe(3,3),dTe(3,3),dlam,           & 
& dYv(3,3),dTv(3,3),dZV(6,6),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmSvcSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZV(gt2,j1))*dZP(gt1,1)*ZE(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZV(gt2,j1))*dZP(gt1,2)*ZE(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZV(gt2,j1))*dZE(gt3,j1)*ZP(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZV(gt2,j1))*ZE(gt3,j1)*ZP(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZV(gt2,j1))*ZE(gt3,j1)*ZP(gt1,1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-((dg2*g2*vd*Conjg(ZV(gt2,j1))*ZE(gt3,j1)*ZP(gt1,1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZV(gt2,j1))*dZE(gt3,j1)*ZP(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZV(gt2,j1))*ZE(gt3,j1)*ZP(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(dvu*g2**2*Conjg(ZV(gt2,j1))*ZE(gt3,j1)*ZP(gt1,2))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-((dg2*g2*vu*Conjg(ZV(gt2,j1))*ZE(gt3,j1)*ZP(gt1,2))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yv(j1,j2))*Conjg(ZV(gt2,3 + j2))*dZP(gt1,1)*ZE(gt3,j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZV(gt2,3 + j2))*Conjg(Tv(j1,j2))*dZP(gt1,2)*ZE(gt3,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZV(gt2,j2))*dZP(gt1,2)*Ye(j1,j2)*ZE(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yv(j1,j2))*Conjg(ZV(gt2,3 + j2))*dZE(gt3,j1)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZV(gt2,3 + j2))*Conjg(Yv(j1,j2))*ZE(gt3,j1)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYv(j1,j2))*Conjg(ZV(gt2,3 + j2))*ZE(gt3,j1)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Yv(j1,j2))*Conjg(ZV(gt2,3 + j2))*ZE(gt3,j1)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Yv(j1,j2))*Conjg(ZV(gt2,3 + j2))*ZE(gt3,j1)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZV(gt2,j2))*dTe(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZV(gt2,3 + j2))*Conjg(Tv(j1,j2))*dZE(gt3,j1)*ZP(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZV(gt2,j2))*dZE(gt3,3 + j1)*Ye(j1,j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dTv(j1,j2))*Conjg(ZV(gt2,3 + j2))*ZE(gt3,j1)*ZP(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dZV(gt2,3 + j2))*Conjg(Tv(j1,j2))*ZE(gt3,j1)*ZP(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZV(gt2,j2))*dYe(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZV(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZV(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZV(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZV(gt2,j2))*dZP(gt1,1)*ZE(gt3,3 + j1)*Te(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZV(gt2,j2))*dZE(gt3,3 + j1)*ZP(gt1,1)*Te(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dZV(gt2,j2))*ZE(gt3,3 + j1)*ZP(gt1,1)*Te(j1,j2)
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZV(gt2,3 + j3))*dZP(gt1,1)*Ye(j2,j1)*ZE(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yv(j1,j3))*Conjg(ZV(gt2,3 + j3))*dZP(gt1,2)*Ye(j2,j1)*ZE(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j1,j3))*Conjg(ZV(gt2,j2))*dZP(gt1,1)*Ye(j1,j2)*ZE(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j3,j1))*Conjg(ZV(gt2,j2))*dZP(gt1,2)*Yv(j2,j1)*ZE(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j1,j3))*Conjg(ZV(gt2,j2))*dZE(gt3,j3)*Ye(j1,j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZV(gt2,3 + j3))*dZE(gt3,3 + j2)*Ye(j2,j1)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j1,j3))*Conjg(ZV(gt2,3 + j3))*dYe(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZV(gt2,3 + j3))*Conjg(Yv(j1,j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j1,j3))*Conjg(ZV(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j1,j3))*Conjg(ZV(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j1,j3))*Conjg(ZV(gt2,j2))*dYe(j1,j2)*ZE(gt3,j3)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZV(gt2,j2))*Conjg(Ye(j1,j3))*Ye(j1,j2)*ZE(gt3,j3)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYe(j1,j3))*Conjg(ZV(gt2,j2))*Ye(j1,j2)*ZE(gt3,j3)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Ye(j1,j3))*Conjg(ZV(gt2,j2))*Ye(j1,j2)*ZE(gt3,j3)*ZP(gt1,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yv(j1,j3))*Conjg(ZV(gt2,3 + j3))*dZE(gt3,3 + j2)*Ye(j2,j1)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j3,j1))*Conjg(ZV(gt2,j2))*dZE(gt3,j3)*Yv(j2,j1)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yv(j1,j3))*Conjg(ZV(gt2,3 + j3))*dYe(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZV(gt2,3 + j3))*Conjg(Yv(j1,j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYv(j1,j3))*Conjg(ZV(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Yv(j1,j3))*Conjg(ZV(gt2,3 + j3))*Ye(j2,j1)*ZE(gt3,3 + j2)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j3,j1))*Conjg(ZV(gt2,j2))*dYv(j2,j1)*ZE(gt3,j3)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZV(gt2,j2))*Conjg(Yv(j3,j1))*Yv(j2,j1)*ZE(gt3,j3)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j3,j1))*Conjg(ZV(gt2,j2))*Yv(j2,j1)*ZE(gt3,j3)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j3,j1))*Conjg(ZV(gt2,j2))*Yv(j2,j1)*ZE(gt3,j3)*ZP(gt1,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmSvcSe  
 
 
Subroutine CT_CouplingSdcHpmcSu(gt1,gt2,gt3,g2,Yd,Td,lam,Yu,Tu,vd,vu,vS,              & 
& ZD,ZU,ZP,dg2,dYd,dTd,dlam,dYu,dTu,dvd,dvu,dvS,dZD,dZU,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,vd,vu,vS,ZP(2,2),dg2,dvd,dvu,dvS,dZP(2,2)

Complex(dp), Intent(in) :: Yd(3,3),Td(3,3),lam,Yu(3,3),Tu(3,3),ZD(6,6),ZU(6,6),dYd(3,3),dTd(3,3),dlam,           & 
& dYu(3,3),dTu(3,3),dZD(6,6),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSdcHpmcSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZD(gt1,j1))*dZU(gt3,j1)*ZP(gt2,1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZD(gt1,j1))*dZU(gt3,j1)*ZP(gt2,2))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZD(gt1,j1))*dZP(gt2,1)*ZU(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZD(gt1,j1))*dZP(gt2,2)*ZU(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZD(gt1,j1))*ZP(gt2,1)*ZU(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZD(gt1,j1))*ZP(gt2,1)*ZU(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-((dg2*g2*vd*Conjg(ZD(gt1,j1))*ZP(gt2,1)*ZU(gt3,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZD(gt1,j1))*ZP(gt2,2)*ZU(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(dvu*g2**2*Conjg(ZD(gt1,j1))*ZP(gt2,2)*ZU(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-((dg2*g2*vu*Conjg(ZD(gt1,j1))*ZP(gt2,2)*ZU(gt3,j1))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZD(gt1,3 + j1))*Conjg(Td(j1,j2))*dZU(gt3,j2)*ZP(gt2,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZD(gt1,j2))*dZU(gt3,3 + j1)*Yu(j1,j2)*ZP(gt2,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt1,3 + j1))*dZU(gt3,j2)*ZP(gt2,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZD(gt1,j2))*dZP(gt2,1)*Yu(j1,j2)*ZU(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZD(gt1,j2))*dYu(j1,j2)*ZP(gt2,1)*ZU(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZD(gt1,j2))*Yu(j1,j2)*ZP(gt2,1)*ZU(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZD(gt1,j2))*Yu(j1,j2)*ZP(gt2,1)*ZU(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZD(gt1,j2))*Yu(j1,j2)*ZP(gt2,1)*ZU(gt3,3 + j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZD(gt1,j2))*dTu(j1,j2)*ZP(gt2,2)*ZU(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZD(gt1,3 + j1))*Conjg(Td(j1,j2))*dZP(gt2,1)*ZU(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt1,3 + j1))*dZP(gt2,2)*ZU(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dTd(j1,j2))*Conjg(ZD(gt1,3 + j1))*ZP(gt2,1)*ZU(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dZD(gt1,3 + j1))*Conjg(Td(j1,j2))*ZP(gt2,1)*ZU(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZD(gt1,3 + j1))*Conjg(Yd(j1,j2))*ZP(gt2,2)*ZU(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYd(j1,j2))*Conjg(ZD(gt1,3 + j1))*ZP(gt2,2)*ZU(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Yd(j1,j2))*Conjg(ZD(gt1,3 + j1))*ZP(gt2,2)*ZU(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Yd(j1,j2))*Conjg(ZD(gt1,3 + j1))*ZP(gt2,2)*ZU(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZD(gt1,j2))*dZU(gt3,3 + j1)*ZP(gt2,2)*Tu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZD(gt1,j2))*dZP(gt2,2)*ZU(gt3,3 + j1)*Tu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dZD(gt1,j2))*ZP(gt2,2)*ZU(gt3,3 + j1)*Tu(j1,j2)
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j1,j3))*Conjg(ZD(gt1,j2))*dZU(gt3,j3)*Yd(j1,j2)*ZP(gt2,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*dZU(gt3,3 + j2)*Yu(j2,j1)*ZP(gt2,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j1,j3))*Conjg(ZD(gt1,j2))*dZU(gt3,j3)*Yu(j1,j2)*ZP(gt2,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*dZU(gt3,3 + j2)*Yu(j2,j1)*ZP(gt2,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*dZP(gt2,1)*Yu(j2,j1)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*dZP(gt2,2)*Yu(j2,j1)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*dYu(j2,j1)*ZP(gt2,1)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZD(gt1,3 + j3))*Conjg(Yd(j3,j1))*Yu(j2,j1)*ZP(gt2,1)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYd(j3,j1))*Conjg(ZD(gt1,3 + j3))*Yu(j2,j1)*ZP(gt2,1)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*Yu(j2,j1)*ZP(gt2,1)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*dYu(j2,j1)*ZP(gt2,2)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZD(gt1,3 + j3))*Conjg(Yd(j3,j1))*Yu(j2,j1)*ZP(gt2,2)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYd(j3,j1))*Conjg(ZD(gt1,3 + j3))*Yu(j2,j1)*ZP(gt2,2)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Yd(j3,j1))*Conjg(ZD(gt1,3 + j3))*Yu(j2,j1)*ZP(gt2,2)*ZU(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j1,j3))*Conjg(ZD(gt1,j2))*dZP(gt2,1)*Yd(j1,j2)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j1,j3))*Conjg(ZD(gt1,j2))*dZP(gt2,2)*Yu(j1,j2)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Yd(j1,j3))*Conjg(ZD(gt1,j2))*dYd(j1,j2)*ZP(gt2,1)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZD(gt1,j2))*Conjg(Yd(j1,j3))*Yd(j1,j2)*ZP(gt2,1)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYd(j1,j3))*Conjg(ZD(gt1,j2))*Yd(j1,j2)*ZP(gt2,1)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Yd(j1,j3))*Conjg(ZD(gt1,j2))*Yd(j1,j2)*ZP(gt2,1)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yu(j1,j3))*Conjg(ZD(gt1,j2))*dYu(j1,j2)*ZP(gt2,2)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZD(gt1,j2))*Conjg(Yu(j1,j3))*Yu(j1,j2)*ZP(gt2,2)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYu(j1,j3))*Conjg(ZD(gt1,j2))*Yu(j1,j2)*ZP(gt2,2)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yu(j1,j3))*Conjg(ZD(gt1,j2))*Yu(j1,j2)*ZP(gt2,2)*ZU(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSdcHpmcSu  
 
 
Subroutine CT_CouplingSecHpmcSv(gt1,gt2,gt3,g2,Ye,Te,lam,Yv,Tv,vd,vu,vS,              & 
& ZV,ZE,ZP,dg2,dYe,dTe,dlam,dYv,dTv,dvd,dvu,dvS,dZV,dZE,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,vd,vu,vS,ZP(2,2),dg2,dvd,dvu,dvS,dZP(2,2)

Complex(dp), Intent(in) :: Ye(3,3),Te(3,3),lam,Yv(3,3),Tv(3,3),ZV(6,6),ZE(6,6),dYe(3,3),dTe(3,3),dlam,           & 
& dYv(3,3),dTv(3,3),dZV(6,6),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSecHpmcSv' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZE(gt1,j1))*dZV(gt3,j1)*ZP(gt2,1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZE(gt1,j1))*dZV(gt3,j1)*ZP(gt2,2))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(ZE(gt1,j1))*dZP(gt2,1)*ZV(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(ZE(gt1,j1))*dZP(gt2,2)*ZV(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vd*Conjg(dZE(gt1,j1))*ZP(gt2,1)*ZV(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(dvd*g2**2*Conjg(ZE(gt1,j1))*ZP(gt2,1)*ZV(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-((dg2*g2*vd*Conjg(ZE(gt1,j1))*ZP(gt2,1)*ZV(gt3,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(g2**2*vu*Conjg(dZE(gt1,j1))*ZP(gt2,2)*ZV(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-(dvu*g2**2*Conjg(ZE(gt1,j1))*ZP(gt2,2)*ZV(gt3,j1))/(2._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
res = res-((dg2*g2*vu*Conjg(ZE(gt1,j1))*ZP(gt2,2)*ZV(gt3,j1))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZE(gt1,3 + j1))*Conjg(Te(j1,j2))*dZV(gt3,j2)*ZP(gt2,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZE(gt1,j1))*dZV(gt3,3 + j2)*Yv(j1,j2)*ZP(gt2,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt1,3 + j1))*dZV(gt3,j2)*ZP(gt2,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZE(gt1,3 + j1))*Conjg(Te(j1,j2))*dZP(gt2,1)*ZV(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt1,3 + j1))*dZP(gt2,2)*ZV(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dTe(j1,j2))*Conjg(ZE(gt1,3 + j1))*ZP(gt2,1)*ZV(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dZE(gt1,3 + j1))*Conjg(Te(j1,j2))*ZP(gt2,1)*ZV(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dZE(gt1,3 + j1))*Conjg(Ye(j1,j2))*ZP(gt2,2)*ZV(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*lam*Conjg(dYe(j1,j2))*Conjg(ZE(gt1,3 + j1))*ZP(gt2,2)*ZV(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dlam*vS*Conjg(Ye(j1,j2))*Conjg(ZE(gt1,3 + j1))*ZP(gt2,2)*ZV(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*lam*Conjg(Ye(j1,j2))*Conjg(ZE(gt1,3 + j1))*ZP(gt2,2)*ZV(gt3,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZE(gt1,j1))*dZP(gt2,1)*Yv(j1,j2)*ZV(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(ZE(gt1,j1))*dYv(j1,j2)*ZP(gt2,1)*ZV(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(lam)*Conjg(dZE(gt1,j1))*Yv(j1,j2)*ZP(gt2,1)*ZV(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(vS*Conjg(dlam)*Conjg(ZE(gt1,j1))*Yv(j1,j2)*ZP(gt2,1)*ZV(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvS*Conjg(lam)*Conjg(ZE(gt1,j1))*Yv(j1,j2)*ZP(gt2,1)*ZV(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZE(gt1,j1))*dTv(j1,j2)*ZP(gt2,2)*ZV(gt3,3 + j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZE(gt1,j1))*dZV(gt3,3 + j2)*ZP(gt2,2)*Tv(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(ZE(gt1,j1))*dZP(gt2,2)*ZV(gt3,3 + j2)*Tv(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
res = res+Conjg(dZE(gt1,j1))*ZP(gt2,2)*ZV(gt3,3 + j2)*Tv(j1,j2)
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j1,j3))*Conjg(ZE(gt1,j2))*dZV(gt3,j3)*Ye(j1,j2)*ZP(gt2,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*dZV(gt3,3 + j2)*Yv(j1,j2)*ZP(gt2,1))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*dZV(gt3,3 + j2)*Yv(j1,j2)*ZP(gt2,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j3,j1))*Conjg(ZE(gt1,j2))*dZV(gt3,j3)*Yv(j2,j1)*ZP(gt2,2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*dZP(gt2,1)*Yv(j1,j2)*ZV(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*dZP(gt2,2)*Yv(j1,j2)*ZV(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*dYv(j1,j2)*ZP(gt2,1)*ZV(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZE(gt1,3 + j3))*Conjg(Ye(j3,j1))*Yv(j1,j2)*ZP(gt2,1)*ZV(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYe(j3,j1))*Conjg(ZE(gt1,3 + j3))*Yv(j1,j2)*ZP(gt2,1)*ZV(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Yv(j1,j2)*ZP(gt2,1)*ZV(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*dYv(j1,j2)*ZP(gt2,2)*ZV(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZE(gt1,3 + j3))*Conjg(Ye(j3,j1))*Yv(j1,j2)*ZP(gt2,2)*ZV(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYe(j3,j1))*Conjg(ZE(gt1,3 + j3))*Yv(j1,j2)*ZP(gt2,2)*ZV(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Ye(j3,j1))*Conjg(ZE(gt1,3 + j3))*Yv(j1,j2)*ZP(gt2,2)*ZV(gt3,3 + j2))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j1,j3))*Conjg(ZE(gt1,j2))*dZP(gt2,1)*Ye(j1,j2)*ZV(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j3,j1))*Conjg(ZE(gt1,j2))*dZP(gt2,2)*Yv(j2,j1)*ZV(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(Ye(j1,j3))*Conjg(ZE(gt1,j2))*dYe(j1,j2)*ZP(gt2,1)*ZV(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dZE(gt1,j2))*Conjg(Ye(j1,j3))*Ye(j1,j2)*ZP(gt2,1)*ZV(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vd*Conjg(dYe(j1,j3))*Conjg(ZE(gt1,j2))*Ye(j1,j2)*ZP(gt2,1)*ZV(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvd*Conjg(Ye(j1,j3))*Conjg(ZE(gt1,j2))*Ye(j1,j2)*ZP(gt2,1)*ZV(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(Yv(j3,j1))*Conjg(ZE(gt1,j2))*dYv(j2,j1)*ZP(gt2,2)*ZV(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dZE(gt1,j2))*Conjg(Yv(j3,j1))*Yv(j2,j1)*ZP(gt2,2)*ZV(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(vu*Conjg(dYv(j3,j1))*Conjg(ZE(gt1,j2))*Yv(j2,j1)*ZP(gt2,2)*ZV(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
Do j3 = 1,3
Do j2 = 1,3
Do j1 = 1,3
res = res+(dvu*Conjg(Yv(j3,j1))*Conjg(ZE(gt1,j2))*Yv(j2,j1)*ZP(gt2,2)*ZV(gt3,j3))/sqrt(2._dp)
End Do 
End Do 
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSecHpmcSv  
 
 
Subroutine CT_CouplingAhhhVZ(gt1,gt2,g1,g2,gp,ZH,ZA,TW,TWp,dg1,dg2,dgp,               & 
& dZH,dZA,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZH(6,6),ZA(6,6),dZH(6,6),dZA(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhhhVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(dSinTWp*gp*QHd*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,1)))
res = res-(dSinTWp*gp*QHu*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,2)))
res = res-(dSinTWp*gp*Qs*Conjg(ZA(gt1,3))*Conjg(ZH(gt2,3)))
res = res-(dSinTWp*gp*Qs1*Conjg(ZA(gt1,4))*Conjg(ZH(gt2,4)))
res = res-(dSinTWp*gp*Qs2*Conjg(ZA(gt1,5))*Conjg(ZH(gt2,5)))
res = res-(dSinTWp*gp*Qs3*Conjg(ZA(gt1,6))*Conjg(ZH(gt2,6)))
res = res-(dCosTWp*g2*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,1))*Cos(TW))/2._dp
res = res+(dCosTWp*g2*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,2))*Cos(TW))/2._dp
res = res-(dSinTW*g1*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,1))*Cos(TWp))/2._dp
res = res-(dCosTW*g2*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,1))*Cos(TWp))/2._dp
res = res+(dSinTW*g1*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,2))*Cos(TWp))/2._dp
res = res+(dCosTW*g2*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,2))*Cos(TWp))/2._dp
res = res-(g2*Conjg(dZH(gt2,1))*Conjg(ZA(gt1,1))*Cos(TW)*Cos(TWp))/2._dp
res = res+(g2*Conjg(dZH(gt2,2))*Conjg(ZA(gt1,2))*Cos(TW)*Cos(TWp))/2._dp
res = res-(g2*Conjg(dZA(gt1,1))*Conjg(ZH(gt2,1))*Cos(TW)*Cos(TWp))/2._dp
res = res-(dg2*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,1))*Cos(TW)*Cos(TWp))/2._dp
res = res+(g2*Conjg(dZA(gt1,2))*Conjg(ZH(gt2,2))*Cos(TW)*Cos(TWp))/2._dp
res = res+(dg2*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,2))*Cos(TW)*Cos(TWp))/2._dp
res = res-(dCosTWp*g1*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,1))*Sin(TW))/2._dp
res = res+(dCosTWp*g1*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,2))*Sin(TW))/2._dp
res = res-(g1*Conjg(dZH(gt2,1))*Conjg(ZA(gt1,1))*Cos(TWp)*Sin(TW))/2._dp
res = res+(g1*Conjg(dZH(gt2,2))*Conjg(ZA(gt1,2))*Cos(TWp)*Sin(TW))/2._dp
res = res-(g1*Conjg(dZA(gt1,1))*Conjg(ZH(gt2,1))*Cos(TWp)*Sin(TW))/2._dp
res = res-(dg1*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,1))*Cos(TWp)*Sin(TW))/2._dp
res = res+(g1*Conjg(dZA(gt1,2))*Conjg(ZH(gt2,2))*Cos(TWp)*Sin(TW))/2._dp
res = res+(dg1*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,2))*Cos(TWp)*Sin(TW))/2._dp
res = res-(gp*QHd*Conjg(dZH(gt2,1))*Conjg(ZA(gt1,1))*Sin(TWp))
res = res-(gp*QHu*Conjg(dZH(gt2,2))*Conjg(ZA(gt1,2))*Sin(TWp))
res = res-(gp*Qs*Conjg(dZH(gt2,3))*Conjg(ZA(gt1,3))*Sin(TWp))
res = res-(gp*Qs1*Conjg(dZH(gt2,4))*Conjg(ZA(gt1,4))*Sin(TWp))
res = res-(gp*Qs2*Conjg(dZH(gt2,5))*Conjg(ZA(gt1,5))*Sin(TWp))
res = res-(gp*Qs3*Conjg(dZH(gt2,6))*Conjg(ZA(gt1,6))*Sin(TWp))
res = res-(gp*QHd*Conjg(dZA(gt1,1))*Conjg(ZH(gt2,1))*Sin(TWp))
res = res-(dgp*QHd*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,1))*Sin(TWp))
res = res-(gp*QHu*Conjg(dZA(gt1,2))*Conjg(ZH(gt2,2))*Sin(TWp))
res = res-(dgp*QHu*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,2))*Sin(TWp))
res = res-(gp*Qs*Conjg(dZA(gt1,3))*Conjg(ZH(gt2,3))*Sin(TWp))
res = res-(dgp*Qs*Conjg(ZA(gt1,3))*Conjg(ZH(gt2,3))*Sin(TWp))
res = res-(gp*Qs1*Conjg(dZA(gt1,4))*Conjg(ZH(gt2,4))*Sin(TWp))
res = res-(dgp*Qs1*Conjg(ZA(gt1,4))*Conjg(ZH(gt2,4))*Sin(TWp))
res = res-(gp*Qs2*Conjg(dZA(gt1,5))*Conjg(ZH(gt2,5))*Sin(TWp))
res = res-(dgp*Qs2*Conjg(ZA(gt1,5))*Conjg(ZH(gt2,5))*Sin(TWp))
res = res-(gp*Qs3*Conjg(dZA(gt1,6))*Conjg(ZH(gt2,6))*Sin(TWp))
res = res-(dgp*Qs3*Conjg(ZA(gt1,6))*Conjg(ZH(gt2,6))*Sin(TWp))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhhhVZ  
 
 
Subroutine CT_CouplingAhhhVZp(gt1,gt2,g1,g2,gp,ZH,ZA,TW,TWp,dg1,dg2,dgp,              & 
& dZH,dZA,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZH(6,6),ZA(6,6),dZH(6,6),dZA(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhhhVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(dCosTWp*gp*QHd*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,1)))
res = res-(dCosTWp*gp*QHu*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,2)))
res = res-(dCosTWp*gp*Qs*Conjg(ZA(gt1,3))*Conjg(ZH(gt2,3)))
res = res-(dCosTWp*gp*Qs1*Conjg(ZA(gt1,4))*Conjg(ZH(gt2,4)))
res = res-(dCosTWp*gp*Qs2*Conjg(ZA(gt1,5))*Conjg(ZH(gt2,5)))
res = res-(dCosTWp*gp*Qs3*Conjg(ZA(gt1,6))*Conjg(ZH(gt2,6)))
res = res+(dSinTWp*g2*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,1))*Cos(TW))/2._dp
res = res-(dSinTWp*g2*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,2))*Cos(TW))/2._dp
res = res-(gp*QHd*Conjg(dZH(gt2,1))*Conjg(ZA(gt1,1))*Cos(TWp))
res = res-(gp*QHu*Conjg(dZH(gt2,2))*Conjg(ZA(gt1,2))*Cos(TWp))
res = res-(gp*Qs*Conjg(dZH(gt2,3))*Conjg(ZA(gt1,3))*Cos(TWp))
res = res-(gp*Qs1*Conjg(dZH(gt2,4))*Conjg(ZA(gt1,4))*Cos(TWp))
res = res-(gp*Qs2*Conjg(dZH(gt2,5))*Conjg(ZA(gt1,5))*Cos(TWp))
res = res-(gp*Qs3*Conjg(dZH(gt2,6))*Conjg(ZA(gt1,6))*Cos(TWp))
res = res-(gp*QHd*Conjg(dZA(gt1,1))*Conjg(ZH(gt2,1))*Cos(TWp))
res = res-(dgp*QHd*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,1))*Cos(TWp))
res = res-(gp*QHu*Conjg(dZA(gt1,2))*Conjg(ZH(gt2,2))*Cos(TWp))
res = res-(dgp*QHu*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,2))*Cos(TWp))
res = res-(gp*Qs*Conjg(dZA(gt1,3))*Conjg(ZH(gt2,3))*Cos(TWp))
res = res-(dgp*Qs*Conjg(ZA(gt1,3))*Conjg(ZH(gt2,3))*Cos(TWp))
res = res-(gp*Qs1*Conjg(dZA(gt1,4))*Conjg(ZH(gt2,4))*Cos(TWp))
res = res-(dgp*Qs1*Conjg(ZA(gt1,4))*Conjg(ZH(gt2,4))*Cos(TWp))
res = res-(gp*Qs2*Conjg(dZA(gt1,5))*Conjg(ZH(gt2,5))*Cos(TWp))
res = res-(dgp*Qs2*Conjg(ZA(gt1,5))*Conjg(ZH(gt2,5))*Cos(TWp))
res = res-(gp*Qs3*Conjg(dZA(gt1,6))*Conjg(ZH(gt2,6))*Cos(TWp))
res = res-(dgp*Qs3*Conjg(ZA(gt1,6))*Conjg(ZH(gt2,6))*Cos(TWp))
res = res+(dSinTWp*g1*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,1))*Sin(TW))/2._dp
res = res-(dSinTWp*g1*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,2))*Sin(TW))/2._dp
res = res+(dSinTW*g1*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,1))*Sin(TWp))/2._dp
res = res+(dCosTW*g2*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,1))*Sin(TWp))/2._dp
res = res-(dSinTW*g1*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,2))*Sin(TWp))/2._dp
res = res-(dCosTW*g2*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,2))*Sin(TWp))/2._dp
res = res+(g2*Conjg(dZH(gt2,1))*Conjg(ZA(gt1,1))*Cos(TW)*Sin(TWp))/2._dp
res = res-(g2*Conjg(dZH(gt2,2))*Conjg(ZA(gt1,2))*Cos(TW)*Sin(TWp))/2._dp
res = res+(g2*Conjg(dZA(gt1,1))*Conjg(ZH(gt2,1))*Cos(TW)*Sin(TWp))/2._dp
res = res+(dg2*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,1))*Cos(TW)*Sin(TWp))/2._dp
res = res-(g2*Conjg(dZA(gt1,2))*Conjg(ZH(gt2,2))*Cos(TW)*Sin(TWp))/2._dp
res = res-(dg2*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,2))*Cos(TW)*Sin(TWp))/2._dp
res = res+(g1*Conjg(dZH(gt2,1))*Conjg(ZA(gt1,1))*Sin(TW)*Sin(TWp))/2._dp
res = res-(g1*Conjg(dZH(gt2,2))*Conjg(ZA(gt1,2))*Sin(TW)*Sin(TWp))/2._dp
res = res+(g1*Conjg(dZA(gt1,1))*Conjg(ZH(gt2,1))*Sin(TW)*Sin(TWp))/2._dp
res = res+(dg1*Conjg(ZA(gt1,1))*Conjg(ZH(gt2,1))*Sin(TW)*Sin(TWp))/2._dp
res = res-(g1*Conjg(dZA(gt1,2))*Conjg(ZH(gt2,2))*Sin(TW)*Sin(TWp))/2._dp
res = res-(dg1*Conjg(ZA(gt1,2))*Conjg(ZH(gt2,2))*Sin(TW)*Sin(TWp))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhhhVZp  
 
 
Subroutine CT_CouplingAhHpmcVWm(gt1,gt2,g2,ZA,ZP,dg2,dZA,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZP(2,2),dg2,dZP(2,2)

Complex(dp), Intent(in) :: ZA(6,6),dZA(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhHpmcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*Conjg(ZA(gt1,1))*dZP(gt2,1))/2._dp
res = res-(g2*Conjg(ZA(gt1,2))*dZP(gt2,2))/2._dp
res = res-(g2*Conjg(dZA(gt1,1))*ZP(gt2,1))/2._dp
res = res-(dg2*Conjg(ZA(gt1,1))*ZP(gt2,1))/2._dp
res = res-(g2*Conjg(dZA(gt1,2))*ZP(gt2,2))/2._dp
res = res-(dg2*Conjg(ZA(gt1,2))*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhHpmcVWm  
 
 
Subroutine CT_CouplingAhcHpmVWm(gt1,gt2,g2,ZA,ZP,dg2,dZA,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZP(2,2),dg2,dZP(2,2)

Complex(dp), Intent(in) :: ZA(6,6),dZA(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhcHpmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*Conjg(ZA(gt1,1))*dZP(gt2,1))/2._dp
res = res-(g2*Conjg(ZA(gt1,2))*dZP(gt2,2))/2._dp
res = res-(g2*Conjg(dZA(gt1,1))*ZP(gt2,1))/2._dp
res = res-(dg2*Conjg(ZA(gt1,1))*ZP(gt2,1))/2._dp
res = res-(g2*Conjg(dZA(gt1,2))*ZP(gt2,2))/2._dp
res = res-(dg2*Conjg(ZA(gt1,2))*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhcHpmVWm  
 
 
Subroutine CT_CouplinghhHpmcVWm(gt1,gt2,g2,ZH,ZP,dg2,dZH,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZP(2,2),dg2,dZP(2,2)

Complex(dp), Intent(in) :: ZH(6,6),dZH(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhHpmcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*Conjg(ZH(gt1,1))*dZP(gt2,1))/2._dp
res = res+(g2*Conjg(ZH(gt1,2))*dZP(gt2,2))/2._dp
res = res-(g2*Conjg(dZH(gt1,1))*ZP(gt2,1))/2._dp
res = res-(dg2*Conjg(ZH(gt1,1))*ZP(gt2,1))/2._dp
res = res+(g2*Conjg(dZH(gt1,2))*ZP(gt2,2))/2._dp
res = res+(dg2*Conjg(ZH(gt1,2))*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhHpmcVWm  
 
 
Subroutine CT_CouplinghhcHpmVWm(gt1,gt2,g2,ZH,ZP,dg2,dZH,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZP(2,2),dg2,dZP(2,2)

Complex(dp), Intent(in) :: ZH(6,6),dZH(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhcHpmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Conjg(ZH(gt1,1))*dZP(gt2,1))/2._dp
res = res-(g2*Conjg(ZH(gt1,2))*dZP(gt2,2))/2._dp
res = res+(g2*Conjg(dZH(gt1,1))*ZP(gt2,1))/2._dp
res = res+(dg2*Conjg(ZH(gt1,1))*ZP(gt2,1))/2._dp
res = res-(g2*Conjg(dZH(gt1,2))*ZP(gt2,2))/2._dp
res = res-(dg2*Conjg(ZH(gt1,2))*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhcHpmVWm  
 
 
Subroutine CT_CouplingHpmcHpmVP(gt1,gt2,g1,g2,ZP,TW,dg1,dg2,dZP,dSinTW,               & 
& dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(2,2),TW,dg1,dg2,dZP(2,2),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmcHpmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*Cos(TW)*dZP(gt2,1)*ZP(gt1,1))/2._dp
res = res-(g2*dZP(gt2,1)*Sin(TW)*ZP(gt1,1))/2._dp
res = res-(g1*Cos(TW)*dZP(gt2,2)*ZP(gt1,2))/2._dp
res = res-(g2*dZP(gt2,2)*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(g1*Cos(TW)*dZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g2*dZP(gt1,1)*Sin(TW)*ZP(gt2,1))/2._dp
res = res-(dCosTW*g1*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dSinTW*g2*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dg1*Cos(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dg2*Sin(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(g1*Cos(TW)*dZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(g2*dZP(gt1,2)*Sin(TW)*ZP(gt2,2))/2._dp
res = res-(dCosTW*g1*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dSinTW*g2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dg1*Cos(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dg2*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmcHpmVP  
 
 
Subroutine CT_CouplingHpmcHpmVZ(gt1,gt2,g1,g2,gp,ZP,TW,TWp,dg1,dg2,dgp,               & 
& dZP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,ZP(2,2),TW,TWp,dg1,dg2,dgp,dZP(2,2),dSinTW,dCosTW,dTanTW,dSinTWp,            & 
& dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmcHpmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*Cos(TW)*Cos(TWp)*dZP(gt2,1)*ZP(gt1,1))/2._dp
res = res+(g1*Cos(TWp)*dZP(gt2,1)*Sin(TW)*ZP(gt1,1))/2._dp
res = res+gp*QHd*dZP(gt2,1)*Sin(TWp)*ZP(gt1,1)
res = res-(g2*Cos(TW)*Cos(TWp)*dZP(gt2,2)*ZP(gt1,2))/2._dp
res = res+(g1*Cos(TWp)*dZP(gt2,2)*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(gp*QHu*dZP(gt2,2)*Sin(TWp)*ZP(gt1,2))
res = res-(g2*Cos(TW)*Cos(TWp)*dZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(g1*Cos(TWp)*dZP(gt1,1)*Sin(TW)*ZP(gt2,1))/2._dp
res = res+gp*QHd*dZP(gt1,1)*Sin(TWp)*ZP(gt2,1)
res = res+dSinTWp*gp*QHd*ZP(gt1,1)*ZP(gt2,1)
res = res-(dCosTWp*g2*Cos(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(dSinTW*g1*Cos(TWp)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dCosTW*g2*Cos(TWp)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dg2*Cos(TW)*Cos(TWp)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(dCosTWp*g1*Sin(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(dg1*Cos(TWp)*Sin(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+dgp*QHd*Sin(TWp)*ZP(gt1,1)*ZP(gt2,1)
res = res-(g2*Cos(TW)*Cos(TWp)*dZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(g1*Cos(TWp)*dZP(gt1,2)*Sin(TW)*ZP(gt2,2))/2._dp
res = res-(gp*QHu*dZP(gt1,2)*Sin(TWp)*ZP(gt2,2))
res = res-(dSinTWp*gp*QHu*ZP(gt1,2)*ZP(gt2,2))
res = res-(dCosTWp*g2*Cos(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(dSinTW*g1*Cos(TWp)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dCosTW*g2*Cos(TWp)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dg2*Cos(TW)*Cos(TWp)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(dCosTWp*g1*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(dg1*Cos(TWp)*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dgp*QHu*Sin(TWp)*ZP(gt1,2)*ZP(gt2,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmcHpmVZ  
 
 
Subroutine CT_CouplingHpmcHpmVZp(gt1,gt2,g1,g2,gp,ZP,TW,TWp,dg1,dg2,dgp,              & 
& dZP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,ZP(2,2),TW,TWp,dg1,dg2,dgp,dZP(2,2),dSinTW,dCosTW,dTanTW,dSinTWp,            & 
& dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmcHpmVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+gp*QHd*Cos(TWp)*dZP(gt2,1)*ZP(gt1,1)
res = res+(g2*Cos(TW)*dZP(gt2,1)*Sin(TWp)*ZP(gt1,1))/2._dp
res = res-(g1*dZP(gt2,1)*Sin(TW)*Sin(TWp)*ZP(gt1,1))/2._dp
res = res-(gp*QHu*Cos(TWp)*dZP(gt2,2)*ZP(gt1,2))
res = res+(g2*Cos(TW)*dZP(gt2,2)*Sin(TWp)*ZP(gt1,2))/2._dp
res = res-(g1*dZP(gt2,2)*Sin(TW)*Sin(TWp)*ZP(gt1,2))/2._dp
res = res+gp*QHd*Cos(TWp)*dZP(gt1,1)*ZP(gt2,1)
res = res+(g2*Cos(TW)*dZP(gt1,1)*Sin(TWp)*ZP(gt2,1))/2._dp
res = res-(g1*dZP(gt1,1)*Sin(TW)*Sin(TWp)*ZP(gt2,1))/2._dp
res = res+dCosTWp*gp*QHd*ZP(gt1,1)*ZP(gt2,1)
res = res+(dSinTWp*g2*Cos(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+dgp*QHd*Cos(TWp)*ZP(gt1,1)*ZP(gt2,1)
res = res-(dSinTWp*g1*Sin(TW)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dSinTW*g1*Sin(TWp)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(dCosTW*g2*Sin(TWp)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res+(dg2*Cos(TW)*Sin(TWp)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(dg1*Sin(TW)*Sin(TWp)*ZP(gt1,1)*ZP(gt2,1))/2._dp
res = res-(gp*QHu*Cos(TWp)*dZP(gt1,2)*ZP(gt2,2))
res = res+(g2*Cos(TW)*dZP(gt1,2)*Sin(TWp)*ZP(gt2,2))/2._dp
res = res-(g1*dZP(gt1,2)*Sin(TW)*Sin(TWp)*ZP(gt2,2))/2._dp
res = res-(dCosTWp*gp*QHu*ZP(gt1,2)*ZP(gt2,2))
res = res+(dSinTWp*g2*Cos(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dgp*QHu*Cos(TWp)*ZP(gt1,2)*ZP(gt2,2))
res = res-(dSinTWp*g1*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dSinTW*g1*Sin(TWp)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(dCosTW*g2*Sin(TWp)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(dg2*Cos(TW)*Sin(TWp)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dg1*Sin(TW)*Sin(TWp)*ZP(gt1,2)*ZP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmcHpmVZp  
 
 
Subroutine CT_CouplingSdcSdVG(gt1,gt2,g3,dg3,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSdcSdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2)) Then 
res = res+dg3
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSdcSdVG  
 
 
Subroutine CT_CouplingSdcSdVP(gt1,gt2,g1,g2,ZD,TW,dg1,dg2,dZD,dSinTW,dCosTW,          & 
& dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: ZD(6,6),dZD(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSdcSdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g1*Conjg(ZD(gt1,j1))*Cos(TW)*dZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(ZD(gt1,3 + j1))*Cos(TW)*dZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(ZD(gt1,j1))*dZD(gt2,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+(dCosTW*g1*Conjg(ZD(gt1,j1))*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*g2*Conjg(ZD(gt1,j1))*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(dZD(gt1,j1))*Cos(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dg1*Conjg(ZD(gt1,j1))*Cos(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZD(gt1,j1))*Sin(TW)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*Conjg(ZD(gt1,j1))*Sin(TW)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTW*g1*Conjg(ZD(gt1,3 + j1))*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZD(gt1,3 + j1))*Cos(TW)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZD(gt1,3 + j1))*Cos(TW)*ZD(gt2,3 + j1))/3._dp
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSdcSdVP  
 
 
Subroutine CT_CouplingSdcSdVZ(gt1,gt2,g1,g2,gp,ZD,TW,TWp,dg1,dg2,dgp,dZD,             & 
& dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZD(6,6),dZD(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSdcSdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2*Conjg(ZD(gt1,j1))*Cos(TW)*Cos(TWp)*dZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(ZD(gt1,j1))*Cos(TWp)*dZD(gt2,j1)*Sin(TW))/6._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(ZD(gt1,3 + j1))*Cos(TWp)*dZD(gt2,3 + j1)*Sin(TW))/3._dp
End Do 
Do j1 = 1,3
res = res+gp*Qq*Conjg(ZD(gt1,j1))*dZD(gt2,j1)*Sin(TWp)
End Do 
Do j1 = 1,3
res = res-(gp*Qd*Conjg(ZD(gt1,3 + j1))*dZD(gt2,3 + j1)*Sin(TWp))
End Do 
Do j1 = 1,3
res = res+dSinTWp*gp*Qq*Conjg(ZD(gt1,j1))*ZD(gt2,j1)
End Do 
Do j1 = 1,3
res = res-(dCosTWp*g2*Conjg(ZD(gt1,j1))*Cos(TW)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*g1*Conjg(ZD(gt1,j1))*Cos(TWp)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dCosTW*g2*Conjg(ZD(gt1,j1))*Cos(TWp)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZD(gt1,j1))*Cos(TW)*Cos(TWp)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*Conjg(ZD(gt1,j1))*Cos(TW)*Cos(TWp)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*g1*Conjg(ZD(gt1,j1))*Sin(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZD(gt1,j1))*Cos(TWp)*Sin(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZD(gt1,j1))*Cos(TWp)*Sin(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+gp*Qq*Conjg(dZD(gt1,j1))*Sin(TWp)*ZD(gt2,j1)
End Do 
Do j1 = 1,3
res = res+dgp*Qq*Conjg(ZD(gt1,j1))*Sin(TWp)*ZD(gt2,j1)
End Do 
Do j1 = 1,3
res = res-(dSinTWp*gp*Qd*Conjg(ZD(gt1,3 + j1))*ZD(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res+(dSinTW*g1*Conjg(ZD(gt1,3 + j1))*Cos(TWp)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dCosTWp*g1*Conjg(ZD(gt1,3 + j1))*Sin(TW)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(dZD(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(dg1*Conjg(ZD(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gp*Qd*Conjg(dZD(gt1,3 + j1))*Sin(TWp)*ZD(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dgp*Qd*Conjg(ZD(gt1,3 + j1))*Sin(TWp)*ZD(gt2,3 + j1))
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSdcSdVZ  
 
 
Subroutine CT_CouplingSdcSdVZp(gt1,gt2,g1,g2,gp,ZD,TW,TWp,dg1,dg2,dgp,dZD,            & 
& dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZD(6,6),dZD(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSdcSdVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+gp*Qq*Conjg(ZD(gt1,j1))*Cos(TWp)*dZD(gt2,j1)
End Do 
Do j1 = 1,3
res = res-(gp*Qd*Conjg(ZD(gt1,3 + j1))*Cos(TWp)*dZD(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(ZD(gt1,j1))*Cos(TW)*dZD(gt2,j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(ZD(gt1,j1))*dZD(gt2,j1)*Sin(TW)*Sin(TWp))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(ZD(gt1,3 + j1))*dZD(gt2,3 + j1)*Sin(TW)*Sin(TWp))/3._dp
End Do 
Do j1 = 1,3
res = res+dCosTWp*gp*Qq*Conjg(ZD(gt1,j1))*ZD(gt2,j1)
End Do 
Do j1 = 1,3
res = res+(dSinTWp*g2*Conjg(ZD(gt1,j1))*Cos(TW)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+gp*Qq*Conjg(dZD(gt1,j1))*Cos(TWp)*ZD(gt2,j1)
End Do 
Do j1 = 1,3
res = res+dgp*Qq*Conjg(ZD(gt1,j1))*Cos(TWp)*ZD(gt2,j1)
End Do 
Do j1 = 1,3
res = res+(dSinTWp*g1*Conjg(ZD(gt1,j1))*Sin(TW)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dSinTW*g1*Conjg(ZD(gt1,j1))*Sin(TWp)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dCosTW*g2*Conjg(ZD(gt1,j1))*Sin(TWp)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZD(gt1,j1))*Cos(TW)*Sin(TWp)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZD(gt1,j1))*Cos(TW)*Sin(TWp)*ZD(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(dZD(gt1,j1))*Sin(TW)*Sin(TWp)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dg1*Conjg(ZD(gt1,j1))*Sin(TW)*Sin(TWp)*ZD(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*gp*Qd*Conjg(ZD(gt1,3 + j1))*ZD(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp*Qd*Conjg(dZD(gt1,3 + j1))*Cos(TWp)*ZD(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dgp*Qd*Conjg(ZD(gt1,3 + j1))*Cos(TWp)*ZD(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dSinTWp*g1*Conjg(ZD(gt1,3 + j1))*Sin(TW)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*g1*Conjg(ZD(gt1,3 + j1))*Sin(TWp)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZD(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZD(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZD(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZD(gt2,3 + j1))/3._dp
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSdcSdVZp  
 
 
Subroutine CT_CouplingSdcSucVWm(gt1,gt2,g2,ZD,ZU,dg2,dZD,dZU,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZD(6,6),ZU(6,6),dZD(6,6),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSdcSucVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g2*Conjg(ZD(gt1,j1))*dZU(gt2,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZD(gt1,j1))*ZU(gt2,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZD(gt1,j1))*ZU(gt2,j1))/sqrt(2._dp)
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSdcSucVWm  
 
 
Subroutine CT_CouplingSecSeVP(gt1,gt2,g1,g2,ZE,TW,dg1,dg2,dZE,dSinTW,dCosTW,          & 
& dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: ZE(6,6),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSecSeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g1*Conjg(ZE(gt1,j1))*Cos(TW)*dZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(ZE(gt1,3 + j1))*Cos(TW)*dZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(ZE(gt1,j1))*dZE(gt2,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTW*g1*Conjg(ZE(gt1,j1))*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*g2*Conjg(ZE(gt1,j1))*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZE(gt1,j1))*Cos(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZE(gt1,j1))*Cos(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZE(gt1,j1))*Sin(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*Conjg(ZE(gt1,j1))*Sin(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTW*g1*Conjg(ZE(gt1,3 + j1))*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZE(gt1,3 + j1))*Cos(TW)*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZE(gt1,3 + j1))*Cos(TW)*ZE(gt2,3 + j1))
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSecSeVP  
 
 
Subroutine CT_CouplingSecSeVZ(gt1,gt2,g1,g2,gp,ZE,TW,TWp,dg1,dg2,dgp,dZE,             & 
& dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZE(6,6),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSecSeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res-(g2*Conjg(ZE(gt1,j1))*Cos(TW)*Cos(TWp)*dZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(ZE(gt1,j1))*Cos(TWp)*dZE(gt2,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+g1*Conjg(ZE(gt1,3 + j1))*Cos(TWp)*dZE(gt2,3 + j1)*Sin(TW)
End Do 
Do j1 = 1,3
res = res+gp*Ql*Conjg(ZE(gt1,j1))*dZE(gt2,j1)*Sin(TWp)
End Do 
Do j1 = 1,3
res = res-(gp*Qe*Conjg(ZE(gt1,3 + j1))*dZE(gt2,3 + j1)*Sin(TWp))
End Do 
Do j1 = 1,3
res = res+dSinTWp*gp*Ql*Conjg(ZE(gt1,j1))*ZE(gt2,j1)
End Do 
Do j1 = 1,3
res = res-(dCosTWp*g2*Conjg(ZE(gt1,j1))*Cos(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dSinTW*g1*Conjg(ZE(gt1,j1))*Cos(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTW*g2*Conjg(ZE(gt1,j1))*Cos(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZE(gt1,j1))*Cos(TW)*Cos(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*Conjg(ZE(gt1,j1))*Cos(TW)*Cos(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dCosTWp*g1*Conjg(ZE(gt1,j1))*Sin(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(dZE(gt1,j1))*Cos(TWp)*Sin(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg1*Conjg(ZE(gt1,j1))*Cos(TWp)*Sin(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+gp*Ql*Conjg(dZE(gt1,j1))*Sin(TWp)*ZE(gt2,j1)
End Do 
Do j1 = 1,3
res = res+dgp*Ql*Conjg(ZE(gt1,j1))*Sin(TWp)*ZE(gt2,j1)
End Do 
Do j1 = 1,3
res = res-(dSinTWp*gp*Qe*Conjg(ZE(gt1,3 + j1))*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res+dSinTW*g1*Conjg(ZE(gt1,3 + j1))*Cos(TWp)*ZE(gt2,3 + j1)
End Do 
Do j1 = 1,3
res = res+dCosTWp*g1*Conjg(ZE(gt1,3 + j1))*Sin(TW)*ZE(gt2,3 + j1)
End Do 
Do j1 = 1,3
res = res+g1*Conjg(dZE(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZE(gt2,3 + j1)
End Do 
Do j1 = 1,3
res = res+dg1*Conjg(ZE(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZE(gt2,3 + j1)
End Do 
Do j1 = 1,3
res = res-(gp*Qe*Conjg(dZE(gt1,3 + j1))*Sin(TWp)*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dgp*Qe*Conjg(ZE(gt1,3 + j1))*Sin(TWp)*ZE(gt2,3 + j1))
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSecSeVZ  
 
 
Subroutine CT_CouplingSecSeVZp(gt1,gt2,g1,g2,gp,ZE,TW,TWp,dg1,dg2,dgp,dZE,            & 
& dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZE(6,6),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSecSeVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+gp*Ql*Conjg(ZE(gt1,j1))*Cos(TWp)*dZE(gt2,j1)
End Do 
Do j1 = 1,3
res = res-(gp*Qe*Conjg(ZE(gt1,3 + j1))*Cos(TWp)*dZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(ZE(gt1,j1))*Cos(TW)*dZE(gt2,j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(ZE(gt1,j1))*dZE(gt2,j1)*Sin(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(ZE(gt1,3 + j1))*dZE(gt2,3 + j1)*Sin(TW)*Sin(TWp))
End Do 
Do j1 = 1,3
res = res+dCosTWp*gp*Ql*Conjg(ZE(gt1,j1))*ZE(gt2,j1)
End Do 
Do j1 = 1,3
res = res+(dSinTWp*g2*Conjg(ZE(gt1,j1))*Cos(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+gp*Ql*Conjg(dZE(gt1,j1))*Cos(TWp)*ZE(gt2,j1)
End Do 
Do j1 = 1,3
res = res+dgp*Ql*Conjg(ZE(gt1,j1))*Cos(TWp)*ZE(gt2,j1)
End Do 
Do j1 = 1,3
res = res-(dSinTWp*g1*Conjg(ZE(gt1,j1))*Sin(TW)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*g1*Conjg(ZE(gt1,j1))*Sin(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dCosTW*g2*Conjg(ZE(gt1,j1))*Sin(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZE(gt1,j1))*Cos(TW)*Sin(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZE(gt1,j1))*Cos(TW)*Sin(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZE(gt1,j1))*Sin(TW)*Sin(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZE(gt1,j1))*Sin(TW)*Sin(TWp)*ZE(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*gp*Qe*Conjg(ZE(gt1,3 + j1))*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp*Qe*Conjg(dZE(gt1,3 + j1))*Cos(TWp)*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dgp*Qe*Conjg(ZE(gt1,3 + j1))*Cos(TWp)*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dSinTWp*g1*Conjg(ZE(gt1,3 + j1))*Sin(TW)*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dSinTW*g1*Conjg(ZE(gt1,3 + j1))*Sin(TWp)*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZE(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZE(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZE(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZE(gt2,3 + j1))
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSecSeVZp  
 
 
Subroutine CT_CouplingSecSvcVWm(gt1,gt2,g2,ZV,ZE,dg2,dZV,dZE,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZV(6,6),ZE(6,6),dZV(6,6),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSecSvcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g2*Conjg(ZE(gt1,j1))*dZV(gt2,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZE(gt1,j1))*ZV(gt2,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZE(gt1,j1))*ZV(gt2,j1))/sqrt(2._dp)
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSecSvcVWm  
 
 
Subroutine CT_CouplingSucSuVG(gt1,gt2,g3,dg3,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSucSuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2)) Then 
res = res+dg3
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSucSuVG  
 
 
Subroutine CT_CouplingSucSuVP(gt1,gt2,g1,g2,ZU,TW,dg1,dg2,dZU,dSinTW,dCosTW,          & 
& dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: ZU(6,6),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSucSuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g1*Conjg(ZU(gt1,j1))*Cos(TW)*dZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*g1*Conjg(ZU(gt1,3 + j1))*Cos(TW)*dZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(ZU(gt1,j1))*dZU(gt2,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+(dCosTW*g1*Conjg(ZU(gt1,j1))*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dSinTW*g2*Conjg(ZU(gt1,j1))*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(dZU(gt1,j1))*Cos(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dg1*Conjg(ZU(gt1,j1))*Cos(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZU(gt1,j1))*Sin(TW)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZU(gt1,j1))*Sin(TW)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(2*dCosTW*g1*Conjg(ZU(gt1,3 + j1))*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(2*g1*Conjg(dZU(gt1,3 + j1))*Cos(TW)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(2*dg1*Conjg(ZU(gt1,3 + j1))*Cos(TW)*ZU(gt2,3 + j1))/3._dp
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSucSuVP  
 
 
Subroutine CT_CouplingSucSdVWm(gt1,gt2,g2,ZD,ZU,dg2,dZD,dZU,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZD(6,6),ZU(6,6),dZD(6,6),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSucSdVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g2*Conjg(ZU(gt1,j1))*dZD(gt2,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZU(gt1,j1))*ZD(gt2,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZU(gt1,j1))*ZD(gt2,j1))/sqrt(2._dp)
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSucSdVWm  
 
 
Subroutine CT_CouplingSucSuVZ(gt1,gt2,g1,g2,gp,ZU,TW,TWp,dg1,dg2,dgp,dZU,             & 
& dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZU(6,6),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSucSuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g2*Conjg(ZU(gt1,j1))*Cos(TW)*Cos(TWp)*dZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(ZU(gt1,j1))*Cos(TWp)*dZU(gt2,j1)*Sin(TW))/6._dp
End Do 
Do j1 = 1,3
res = res+(-2*g1*Conjg(ZU(gt1,3 + j1))*Cos(TWp)*dZU(gt2,3 + j1)*Sin(TW))/3._dp
End Do 
Do j1 = 1,3
res = res+gp*Qq*Conjg(ZU(gt1,j1))*dZU(gt2,j1)*Sin(TWp)
End Do 
Do j1 = 1,3
res = res-(gp*Qu*Conjg(ZU(gt1,3 + j1))*dZU(gt2,3 + j1)*Sin(TWp))
End Do 
Do j1 = 1,3
res = res+dSinTWp*gp*Qq*Conjg(ZU(gt1,j1))*ZU(gt2,j1)
End Do 
Do j1 = 1,3
res = res+(dCosTWp*g2*Conjg(ZU(gt1,j1))*Cos(TW)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*g1*Conjg(ZU(gt1,j1))*Cos(TWp)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dCosTW*g2*Conjg(ZU(gt1,j1))*Cos(TWp)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZU(gt1,j1))*Cos(TW)*Cos(TWp)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZU(gt1,j1))*Cos(TW)*Cos(TWp)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*g1*Conjg(ZU(gt1,j1))*Sin(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZU(gt1,j1))*Cos(TWp)*Sin(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZU(gt1,j1))*Cos(TWp)*Sin(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+gp*Qq*Conjg(dZU(gt1,j1))*Sin(TWp)*ZU(gt2,j1)
End Do 
Do j1 = 1,3
res = res+dgp*Qq*Conjg(ZU(gt1,j1))*Sin(TWp)*ZU(gt2,j1)
End Do 
Do j1 = 1,3
res = res-(dSinTWp*gp*Qu*Conjg(ZU(gt1,3 + j1))*ZU(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res+(-2*dSinTW*g1*Conjg(ZU(gt1,3 + j1))*Cos(TWp)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(-2*dCosTWp*g1*Conjg(ZU(gt1,3 + j1))*Sin(TW)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(-2*g1*Conjg(dZU(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(-2*dg1*Conjg(ZU(gt1,3 + j1))*Cos(TWp)*Sin(TW)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res-(gp*Qu*Conjg(dZU(gt1,3 + j1))*Sin(TWp)*ZU(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dgp*Qu*Conjg(ZU(gt1,3 + j1))*Sin(TWp)*ZU(gt2,3 + j1))
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSucSuVZ  
 
 
Subroutine CT_CouplingSucSuVZp(gt1,gt2,g1,g2,gp,ZU,TW,TWp,dg1,dg2,dgp,dZU,            & 
& dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZU(6,6),dZU(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSucSuVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+gp*Qq*Conjg(ZU(gt1,j1))*Cos(TWp)*dZU(gt2,j1)
End Do 
Do j1 = 1,3
res = res-(gp*Qu*Conjg(ZU(gt1,3 + j1))*Cos(TWp)*dZU(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(ZU(gt1,j1))*Cos(TW)*dZU(gt2,j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(ZU(gt1,j1))*dZU(gt2,j1)*Sin(TW)*Sin(TWp))/6._dp
End Do 
Do j1 = 1,3
res = res+(2*g1*Conjg(ZU(gt1,3 + j1))*dZU(gt2,3 + j1)*Sin(TW)*Sin(TWp))/3._dp
End Do 
Do j1 = 1,3
res = res+dCosTWp*gp*Qq*Conjg(ZU(gt1,j1))*ZU(gt2,j1)
End Do 
Do j1 = 1,3
res = res-(dSinTWp*g2*Conjg(ZU(gt1,j1))*Cos(TW)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+gp*Qq*Conjg(dZU(gt1,j1))*Cos(TWp)*ZU(gt2,j1)
End Do 
Do j1 = 1,3
res = res+dgp*Qq*Conjg(ZU(gt1,j1))*Cos(TWp)*ZU(gt2,j1)
End Do 
Do j1 = 1,3
res = res+(dSinTWp*g1*Conjg(ZU(gt1,j1))*Sin(TW)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dSinTW*g1*Conjg(ZU(gt1,j1))*Sin(TWp)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dCosTW*g2*Conjg(ZU(gt1,j1))*Sin(TWp)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZU(gt1,j1))*Cos(TW)*Sin(TWp)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*Conjg(ZU(gt1,j1))*Cos(TW)*Sin(TWp)*ZU(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(dZU(gt1,j1))*Sin(TW)*Sin(TWp)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res+(dg1*Conjg(ZU(gt1,j1))*Sin(TW)*Sin(TWp)*ZU(gt2,j1))/6._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*gp*Qu*Conjg(ZU(gt1,3 + j1))*ZU(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp*Qu*Conjg(dZU(gt1,3 + j1))*Cos(TWp)*ZU(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dgp*Qu*Conjg(ZU(gt1,3 + j1))*Cos(TWp)*ZU(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res+(2*dSinTWp*g1*Conjg(ZU(gt1,3 + j1))*Sin(TW)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(2*dSinTW*g1*Conjg(ZU(gt1,3 + j1))*Sin(TWp)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(2*g1*Conjg(dZU(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZU(gt2,3 + j1))/3._dp
End Do 
Do j1 = 1,3
res = res+(2*dg1*Conjg(ZU(gt1,3 + j1))*Sin(TW)*Sin(TWp)*ZU(gt2,3 + j1))/3._dp
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSucSuVZp  
 
 
Subroutine CT_CouplingSvcSeVWm(gt1,gt2,g2,ZV,ZE,dg2,dZV,dZE,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZV(6,6),ZE(6,6),dZV(6,6),dZE(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSvcSeVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g2*Conjg(ZV(gt1,j1))*dZE(gt2,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZV(gt1,j1))*ZE(gt2,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZV(gt1,j1))*ZE(gt2,j1))/sqrt(2._dp)
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSvcSeVWm  
 
 
Subroutine CT_CouplingSvcSvVZ(gt1,gt2,g1,g2,gp,ZV,TW,TWp,dg1,dg2,dgp,dZV,             & 
& dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZV(6,6),dZV(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSvcSvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+(g2*Conjg(ZV(gt1,j1))*Cos(TW)*Cos(TWp)*dZV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(ZV(gt1,j1))*Cos(TWp)*dZV(gt2,j1)*Sin(TW))/2._dp
End Do 
Do j1 = 1,3
res = res+gp*Ql*Conjg(ZV(gt1,j1))*dZV(gt2,j1)*Sin(TWp)
End Do 
Do j1 = 1,3
res = res-(gp*Qv*Conjg(ZV(gt1,3 + j1))*dZV(gt2,3 + j1)*Sin(TWp))
End Do 
Do j1 = 1,3
res = res+dSinTWp*gp*Ql*Conjg(ZV(gt1,j1))*ZV(gt2,j1)
End Do 
Do j1 = 1,3
res = res+(dCosTWp*g2*Conjg(ZV(gt1,j1))*Cos(TW)*ZV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dSinTW*g1*Conjg(ZV(gt1,j1))*Cos(TWp)*ZV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dCosTW*g2*Conjg(ZV(gt1,j1))*Cos(TWp)*ZV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g2*Conjg(dZV(gt1,j1))*Cos(TW)*Cos(TWp)*ZV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg2*Conjg(ZV(gt1,j1))*Cos(TW)*Cos(TWp)*ZV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dCosTWp*g1*Conjg(ZV(gt1,j1))*Sin(TW)*ZV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(g1*Conjg(dZV(gt1,j1))*Cos(TWp)*Sin(TW)*ZV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+(dg1*Conjg(ZV(gt1,j1))*Cos(TWp)*Sin(TW)*ZV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+gp*Ql*Conjg(dZV(gt1,j1))*Sin(TWp)*ZV(gt2,j1)
End Do 
Do j1 = 1,3
res = res+dgp*Ql*Conjg(ZV(gt1,j1))*Sin(TWp)*ZV(gt2,j1)
End Do 
Do j1 = 1,3
res = res-(dSinTWp*gp*Qv*Conjg(ZV(gt1,3 + j1))*ZV(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp*Qv*Conjg(dZV(gt1,3 + j1))*Sin(TWp)*ZV(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dgp*Qv*Conjg(ZV(gt1,3 + j1))*Sin(TWp)*ZV(gt2,3 + j1))
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSvcSvVZ  
 
 
Subroutine CT_CouplingSvcSvVZp(gt1,gt2,g1,g2,gp,ZV,TW,TWp,dg1,dg2,dgp,dZV,            & 
& dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZV(6,6),dZV(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingSvcSvVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
Do j1 = 1,3
res = res+gp*Ql*Conjg(ZV(gt1,j1))*Cos(TWp)*dZV(gt2,j1)
End Do 
Do j1 = 1,3
res = res-(gp*Qv*Conjg(ZV(gt1,3 + j1))*Cos(TWp)*dZV(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(ZV(gt1,j1))*Cos(TW)*dZV(gt2,j1)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(ZV(gt1,j1))*dZV(gt2,j1)*Sin(TW)*Sin(TWp))/2._dp
End Do 
Do j1 = 1,3
res = res+dCosTWp*gp*Ql*Conjg(ZV(gt1,j1))*ZV(gt2,j1)
End Do 
Do j1 = 1,3
res = res-(dSinTWp*g2*Conjg(ZV(gt1,j1))*Cos(TW)*ZV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res+gp*Ql*Conjg(dZV(gt1,j1))*Cos(TWp)*ZV(gt2,j1)
End Do 
Do j1 = 1,3
res = res+dgp*Ql*Conjg(ZV(gt1,j1))*Cos(TWp)*ZV(gt2,j1)
End Do 
Do j1 = 1,3
res = res-(dSinTWp*g1*Conjg(ZV(gt1,j1))*Sin(TW)*ZV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dSinTW*g1*Conjg(ZV(gt1,j1))*Sin(TWp)*ZV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTW*g2*Conjg(ZV(gt1,j1))*Sin(TWp)*ZV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g2*Conjg(dZV(gt1,j1))*Cos(TW)*Sin(TWp)*ZV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg2*Conjg(ZV(gt1,j1))*Cos(TW)*Sin(TWp)*ZV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(g1*Conjg(dZV(gt1,j1))*Sin(TW)*Sin(TWp)*ZV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dg1*Conjg(ZV(gt1,j1))*Sin(TW)*Sin(TWp)*ZV(gt2,j1))/2._dp
End Do 
Do j1 = 1,3
res = res-(dCosTWp*gp*Qv*Conjg(ZV(gt1,3 + j1))*ZV(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(gp*Qv*Conjg(dZV(gt1,3 + j1))*Cos(TWp)*ZV(gt2,3 + j1))
End Do 
Do j1 = 1,3
res = res-(dgp*Qv*Conjg(ZV(gt1,3 + j1))*Cos(TWp)*ZV(gt2,3 + j1))
End Do 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingSvcSvVZp  
 
 
Subroutine CT_CouplinghhcVWmVWm(gt1,g2,vd,vu,ZH,dg2,dvd,dvu,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,vd,vu,dg2,dvd,dvu

Complex(dp), Intent(in) :: ZH(6,6),dZH(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhcVWmVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*vd*Conjg(dZH(gt1,1)))/2._dp
res = res+(g2**2*vu*Conjg(dZH(gt1,2)))/2._dp
res = res+(dvd*g2**2*Conjg(ZH(gt1,1)))/2._dp
res = res+dg2*g2*vd*Conjg(ZH(gt1,1))
res = res+(dvu*g2**2*Conjg(ZH(gt1,2)))/2._dp
res = res+dg2*g2*vu*Conjg(ZH(gt1,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhcVWmVWm  
 
 
Subroutine CT_CouplinghhVZVZ(gt1,g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,ZH,TW,TWp,             & 
& dg1,dg2,dgp,dvd,dvu,dvS,dvS1,dvS2,dvS3,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,               & 
& dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,TW,TWp,dg1,dg2,dgp,dvd,dvu,dvS,dvS1,dvS2,               & 
& dvS3,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZH(6,6),dZH(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1**2*vd*Conjg(dZH(gt1,1)))/8._dp
res = res+(g2**2*vd*Conjg(dZH(gt1,1)))/8._dp
res = res+gp**2*QHd**2*vd*Conjg(dZH(gt1,1))
res = res+(g1**2*vu*Conjg(dZH(gt1,2)))/8._dp
res = res+(g2**2*vu*Conjg(dZH(gt1,2)))/8._dp
res = res+gp**2*QHu**2*vu*Conjg(dZH(gt1,2))
res = res+gp**2*Qs**2*vS*Conjg(dZH(gt1,3))
res = res+gp**2*Qs1**2*vS1*Conjg(dZH(gt1,4))
res = res+gp**2*Qs2**2*vS2*Conjg(dZH(gt1,5))
res = res+gp**2*Qs3**2*vS3*Conjg(dZH(gt1,6))
res = res+(dvd*g1**2*Conjg(ZH(gt1,1)))/8._dp
res = res+(dvd*g2**2*Conjg(ZH(gt1,1)))/8._dp
res = res+dvd*gp**2*QHd**2*Conjg(ZH(gt1,1))
res = res+(dg1*g1*vd*Conjg(ZH(gt1,1)))/4._dp
res = res+(dg2*g2*vd*Conjg(ZH(gt1,1)))/4._dp
res = res+2*dgp*gp*QHd**2*vd*Conjg(ZH(gt1,1))
res = res+(dvu*g1**2*Conjg(ZH(gt1,2)))/8._dp
res = res+(dvu*g2**2*Conjg(ZH(gt1,2)))/8._dp
res = res+dvu*gp**2*QHu**2*Conjg(ZH(gt1,2))
res = res+(dg1*g1*vu*Conjg(ZH(gt1,2)))/4._dp
res = res+(dg2*g2*vu*Conjg(ZH(gt1,2)))/4._dp
res = res+2*dgp*gp*QHu**2*vu*Conjg(ZH(gt1,2))
res = res+dvS*gp**2*Qs**2*Conjg(ZH(gt1,3))
res = res+2*dgp*gp*Qs**2*vS*Conjg(ZH(gt1,3))
res = res+dvS1*gp**2*Qs1**2*Conjg(ZH(gt1,4))
res = res+2*dgp*gp*Qs1**2*vS1*Conjg(ZH(gt1,4))
res = res+dvS2*gp**2*Qs2**2*Conjg(ZH(gt1,5))
res = res+2*dgp*gp*Qs2**2*vS2*Conjg(ZH(gt1,5))
res = res+dvS3*gp**2*Qs3**2*Conjg(ZH(gt1,6))
res = res+2*dgp*gp*Qs3**2*vS3*Conjg(ZH(gt1,6))
res = res-(dCosTW*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TW))/4._dp
res = res+(dSinTW*g1*g2*vd*Conjg(ZH(gt1,1))*Cos(TW))/2._dp
res = res+(dCosTW*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TW))/4._dp
res = res-(dCosTW*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TW))/4._dp
res = res+(dSinTW*g1*g2*vu*Conjg(ZH(gt1,2))*Cos(TW))/2._dp
res = res+(dCosTW*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TW))/4._dp
res = res-(g1**2*vd*Conjg(dZH(gt1,1))*Cos(TW)**2)/8._dp
res = res+(g2**2*vd*Conjg(dZH(gt1,1))*Cos(TW)**2)/8._dp
res = res-(g1**2*vu*Conjg(dZH(gt1,2))*Cos(TW)**2)/8._dp
res = res+(g2**2*vu*Conjg(dZH(gt1,2))*Cos(TW)**2)/8._dp
res = res-(dvd*g1**2*Conjg(ZH(gt1,1))*Cos(TW)**2)/8._dp
res = res+(dvd*g2**2*Conjg(ZH(gt1,1))*Cos(TW)**2)/8._dp
res = res-(dg1*g1*vd*Conjg(ZH(gt1,1))*Cos(TW)**2)/4._dp
res = res+(dg2*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)**2)/4._dp
res = res-(dvu*g1**2*Conjg(ZH(gt1,2))*Cos(TW)**2)/8._dp
res = res+(dvu*g2**2*Conjg(ZH(gt1,2))*Cos(TW)**2)/8._dp
res = res-(dg1*g1*vu*Conjg(ZH(gt1,2))*Cos(TW)**2)/4._dp
res = res+(dg2*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)**2)/4._dp
res = res+(dCosTWp*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TWp))/4._dp
res = res+(dCosTWp*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TWp))/4._dp
res = res-2*dCosTWp*gp**2*QHd**2*vd*Conjg(ZH(gt1,1))*Cos(TWp)
res = res+(dCosTWp*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TWp))/4._dp
res = res+(dCosTWp*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TWp))/4._dp
res = res-2*dCosTWp*gp**2*QHu**2*vu*Conjg(ZH(gt1,2))*Cos(TWp)
res = res-2*dCosTWp*gp**2*Qs**2*vS*Conjg(ZH(gt1,3))*Cos(TWp)
res = res-2*dCosTWp*gp**2*Qs1**2*vS1*Conjg(ZH(gt1,4))*Cos(TWp)
res = res-2*dCosTWp*gp**2*Qs2**2*vS2*Conjg(ZH(gt1,5))*Cos(TWp)
res = res-2*dCosTWp*gp**2*Qs3**2*vS3*Conjg(ZH(gt1,6))*Cos(TWp)
res = res+2*dSinTWp*g2*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)
res = res-2*dSinTWp*g2*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)
res = res-(dCosTWp*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Cos(TWp))/4._dp
res = res+(dCosTWp*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Cos(TWp))/4._dp
res = res-(dCosTWp*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Cos(TWp))/4._dp
res = res+(dCosTWp*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Cos(TWp))/4._dp
res = res+(g1**2*vd*Conjg(dZH(gt1,1))*Cos(TWp)**2)/8._dp
res = res+(g2**2*vd*Conjg(dZH(gt1,1))*Cos(TWp)**2)/8._dp
res = res-(gp**2*QHd**2*vd*Conjg(dZH(gt1,1))*Cos(TWp)**2)
res = res+(g1**2*vu*Conjg(dZH(gt1,2))*Cos(TWp)**2)/8._dp
res = res+(g2**2*vu*Conjg(dZH(gt1,2))*Cos(TWp)**2)/8._dp
res = res-(gp**2*QHu**2*vu*Conjg(dZH(gt1,2))*Cos(TWp)**2)
res = res-(gp**2*Qs**2*vS*Conjg(dZH(gt1,3))*Cos(TWp)**2)
res = res-(gp**2*Qs1**2*vS1*Conjg(dZH(gt1,4))*Cos(TWp)**2)
res = res-(gp**2*Qs2**2*vS2*Conjg(dZH(gt1,5))*Cos(TWp)**2)
res = res-(gp**2*Qs3**2*vS3*Conjg(dZH(gt1,6))*Cos(TWp)**2)
res = res+(dvd*g1**2*Conjg(ZH(gt1,1))*Cos(TWp)**2)/8._dp
res = res+(dvd*g2**2*Conjg(ZH(gt1,1))*Cos(TWp)**2)/8._dp
res = res-(dvd*gp**2*QHd**2*Conjg(ZH(gt1,1))*Cos(TWp)**2)
res = res+(dg1*g1*vd*Conjg(ZH(gt1,1))*Cos(TWp)**2)/4._dp
res = res+(dg2*g2*vd*Conjg(ZH(gt1,1))*Cos(TWp)**2)/4._dp
res = res-2*dgp*gp*QHd**2*vd*Conjg(ZH(gt1,1))*Cos(TWp)**2
res = res+(dvu*g1**2*Conjg(ZH(gt1,2))*Cos(TWp)**2)/8._dp
res = res+(dvu*g2**2*Conjg(ZH(gt1,2))*Cos(TWp)**2)/8._dp
res = res-(dvu*gp**2*QHu**2*Conjg(ZH(gt1,2))*Cos(TWp)**2)
res = res+(dg1*g1*vu*Conjg(ZH(gt1,2))*Cos(TWp)**2)/4._dp
res = res+(dg2*g2*vu*Conjg(ZH(gt1,2))*Cos(TWp)**2)/4._dp
res = res-2*dgp*gp*QHu**2*vu*Conjg(ZH(gt1,2))*Cos(TWp)**2
res = res-(dvS*gp**2*Qs**2*Conjg(ZH(gt1,3))*Cos(TWp)**2)
res = res-2*dgp*gp*Qs**2*vS*Conjg(ZH(gt1,3))*Cos(TWp)**2
res = res-(dvS1*gp**2*Qs1**2*Conjg(ZH(gt1,4))*Cos(TWp)**2)
res = res-2*dgp*gp*Qs1**2*vS1*Conjg(ZH(gt1,4))*Cos(TWp)**2
res = res-(dvS2*gp**2*Qs2**2*Conjg(ZH(gt1,5))*Cos(TWp)**2)
res = res-2*dgp*gp*Qs2**2*vS2*Conjg(ZH(gt1,5))*Cos(TWp)**2
res = res-(dvS3*gp**2*Qs3**2*Conjg(ZH(gt1,6))*Cos(TWp)**2)
res = res-2*dgp*gp*Qs3**2*vS3*Conjg(ZH(gt1,6))*Cos(TWp)**2
res = res-(dCosTW*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)**2)/4._dp
res = res+(dSinTW*g1*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)**2)/2._dp
res = res+(dCosTW*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)**2)/4._dp
res = res-(dCosTW*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)**2)/4._dp
res = res+(dSinTW*g1*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)**2)/2._dp
res = res+(dCosTW*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)**2)/4._dp
res = res-(g1**2*vd*Conjg(dZH(gt1,1))*Cos(TW)**2*Cos(TWp)**2)/8._dp
res = res+(g2**2*vd*Conjg(dZH(gt1,1))*Cos(TW)**2*Cos(TWp)**2)/8._dp
res = res-(g1**2*vu*Conjg(dZH(gt1,2))*Cos(TW)**2*Cos(TWp)**2)/8._dp
res = res+(g2**2*vu*Conjg(dZH(gt1,2))*Cos(TW)**2*Cos(TWp)**2)/8._dp
res = res-(dvd*g1**2*Conjg(ZH(gt1,1))*Cos(TW)**2*Cos(TWp)**2)/8._dp
res = res+(dvd*g2**2*Conjg(ZH(gt1,1))*Cos(TW)**2*Cos(TWp)**2)/8._dp
res = res-(dg1*g1*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Cos(TWp)**2)/4._dp
res = res+(dg2*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Cos(TWp)**2)/4._dp
res = res-(dvu*g1**2*Conjg(ZH(gt1,2))*Cos(TW)**2*Cos(TWp)**2)/8._dp
res = res+(dvu*g2**2*Conjg(ZH(gt1,2))*Cos(TW)**2*Cos(TWp)**2)/8._dp
res = res-(dg1*g1*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Cos(TWp)**2)/4._dp
res = res+(dg2*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Cos(TWp)**2)/4._dp
res = res+(dSinTW*g1**2*vd*Conjg(ZH(gt1,1))*Sin(TW))/4._dp
res = res+(dCosTW*g1*g2*vd*Conjg(ZH(gt1,1))*Sin(TW))/2._dp
res = res-(dSinTW*g2**2*vd*Conjg(ZH(gt1,1))*Sin(TW))/4._dp
res = res+(dSinTW*g1**2*vu*Conjg(ZH(gt1,2))*Sin(TW))/4._dp
res = res+(dCosTW*g1*g2*vu*Conjg(ZH(gt1,2))*Sin(TW))/2._dp
res = res-(dSinTW*g2**2*vu*Conjg(ZH(gt1,2))*Sin(TW))/4._dp
res = res+(g1*g2*vd*Conjg(dZH(gt1,1))*Cos(TW)*Sin(TW))/2._dp
res = res+(g1*g2*vu*Conjg(dZH(gt1,2))*Cos(TW)*Sin(TW))/2._dp
res = res+(dvd*g1*g2*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TW))/2._dp
res = res+(dg2*g1*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TW))/2._dp
res = res+(dg1*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TW))/2._dp
res = res+(dvu*g1*g2*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TW))/2._dp
res = res+(dg2*g1*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TW))/2._dp
res = res+(dg1*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TW))/2._dp
res = res+2*dSinTWp*g1*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)
res = res-2*dSinTWp*g1*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)
res = res+dCosTWp*g1*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)*Sin(TW)
res = res+dCosTWp*g1*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)*Sin(TW)
res = res+(dSinTW*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TWp)**2*Sin(TW))/4._dp
res = res+(dCosTW*g1*g2*vd*Conjg(ZH(gt1,1))*Cos(TWp)**2*Sin(TW))/2._dp
res = res-(dSinTW*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TWp)**2*Sin(TW))/4._dp
res = res+(dSinTW*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TWp)**2*Sin(TW))/4._dp
res = res+(dCosTW*g1*g2*vu*Conjg(ZH(gt1,2))*Cos(TWp)**2*Sin(TW))/2._dp
res = res-(dSinTW*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TWp)**2*Sin(TW))/4._dp
res = res+(g1*g2*vd*Conjg(dZH(gt1,1))*Cos(TW)*Cos(TWp)**2*Sin(TW))/2._dp
res = res+(g1*g2*vu*Conjg(dZH(gt1,2))*Cos(TW)*Cos(TWp)**2*Sin(TW))/2._dp
res = res+(dvd*g1*g2*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)**2*Sin(TW))/2._dp
res = res+(dg2*g1*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)**2*Sin(TW))/2._dp
res = res+(dg1*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)**2*Sin(TW))/2._dp
res = res+(dvu*g1*g2*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)**2*Sin(TW))/2._dp
res = res+(dg2*g1*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)**2*Sin(TW))/2._dp
res = res+(dg1*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)**2*Sin(TW))/2._dp
res = res+(g1**2*vd*Conjg(dZH(gt1,1))*Sin(TW)**2)/8._dp
res = res-(g2**2*vd*Conjg(dZH(gt1,1))*Sin(TW)**2)/8._dp
res = res+(g1**2*vu*Conjg(dZH(gt1,2))*Sin(TW)**2)/8._dp
res = res-(g2**2*vu*Conjg(dZH(gt1,2))*Sin(TW)**2)/8._dp
res = res+(dvd*g1**2*Conjg(ZH(gt1,1))*Sin(TW)**2)/8._dp
res = res-(dvd*g2**2*Conjg(ZH(gt1,1))*Sin(TW)**2)/8._dp
res = res+(dg1*g1*vd*Conjg(ZH(gt1,1))*Sin(TW)**2)/4._dp
res = res-(dg2*g2*vd*Conjg(ZH(gt1,1))*Sin(TW)**2)/4._dp
res = res+(dvu*g1**2*Conjg(ZH(gt1,2))*Sin(TW)**2)/8._dp
res = res-(dvu*g2**2*Conjg(ZH(gt1,2))*Sin(TW)**2)/8._dp
res = res+(dg1*g1*vu*Conjg(ZH(gt1,2))*Sin(TW)**2)/4._dp
res = res-(dg2*g2*vu*Conjg(ZH(gt1,2))*Sin(TW)**2)/4._dp
res = res+(dCosTWp*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)**2)/4._dp
res = res-(dCosTWp*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)**2)/4._dp
res = res+(dCosTWp*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)**2)/4._dp
res = res-(dCosTWp*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)**2)/4._dp
res = res+(g1**2*vd*Conjg(dZH(gt1,1))*Cos(TWp)**2*Sin(TW)**2)/8._dp
res = res-(g2**2*vd*Conjg(dZH(gt1,1))*Cos(TWp)**2*Sin(TW)**2)/8._dp
res = res+(g1**2*vu*Conjg(dZH(gt1,2))*Cos(TWp)**2*Sin(TW)**2)/8._dp
res = res-(g2**2*vu*Conjg(dZH(gt1,2))*Cos(TWp)**2*Sin(TW)**2)/8._dp
res = res+(dvd*g1**2*Conjg(ZH(gt1,1))*Cos(TWp)**2*Sin(TW)**2)/8._dp
res = res-(dvd*g2**2*Conjg(ZH(gt1,1))*Cos(TWp)**2*Sin(TW)**2)/8._dp
res = res+(dg1*g1*vd*Conjg(ZH(gt1,1))*Cos(TWp)**2*Sin(TW)**2)/4._dp
res = res-(dg2*g2*vd*Conjg(ZH(gt1,1))*Cos(TWp)**2*Sin(TW)**2)/4._dp
res = res+(dvu*g1**2*Conjg(ZH(gt1,2))*Cos(TWp)**2*Sin(TW)**2)/8._dp
res = res-(dvu*g2**2*Conjg(ZH(gt1,2))*Cos(TWp)**2*Sin(TW)**2)/8._dp
res = res+(dg1*g1*vu*Conjg(ZH(gt1,2))*Cos(TWp)**2*Sin(TW)**2)/4._dp
res = res-(dg2*g2*vu*Conjg(ZH(gt1,2))*Cos(TWp)**2*Sin(TW)**2)/4._dp
res = res-(dSinTWp*g1**2*vd*Conjg(ZH(gt1,1))*Sin(TWp))/4._dp
res = res-(dSinTWp*g2**2*vd*Conjg(ZH(gt1,1))*Sin(TWp))/4._dp
res = res+2*dSinTWp*gp**2*QHd**2*vd*Conjg(ZH(gt1,1))*Sin(TWp)
res = res-(dSinTWp*g1**2*vu*Conjg(ZH(gt1,2))*Sin(TWp))/4._dp
res = res-(dSinTWp*g2**2*vu*Conjg(ZH(gt1,2))*Sin(TWp))/4._dp
res = res+2*dSinTWp*gp**2*QHu**2*vu*Conjg(ZH(gt1,2))*Sin(TWp)
res = res+2*dSinTWp*gp**2*Qs**2*vS*Conjg(ZH(gt1,3))*Sin(TWp)
res = res+2*dSinTWp*gp**2*Qs1**2*vS1*Conjg(ZH(gt1,4))*Sin(TWp)
res = res+2*dSinTWp*gp**2*Qs2**2*vS2*Conjg(ZH(gt1,5))*Sin(TWp)
res = res+2*dSinTWp*gp**2*Qs3**2*vS3*Conjg(ZH(gt1,6))*Sin(TWp)
res = res+2*dCosTWp*g2*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TWp)
res = res-2*dCosTWp*g2*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TWp)
res = res+(dSinTWp*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Sin(TWp))/4._dp
res = res-(dSinTWp*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Sin(TWp))/4._dp
res = res+(dSinTWp*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Sin(TWp))/4._dp
res = res-(dSinTWp*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Sin(TWp))/4._dp
res = res+2*dSinTW*g1*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TWp)
res = res+2*dCosTW*g2*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TWp)
res = res-2*dSinTW*g1*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TWp)
res = res-2*dCosTW*g2*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TWp)
res = res+2*g2*gp*QHd*vd*Conjg(dZH(gt1,1))*Cos(TW)*Cos(TWp)*Sin(TWp)
res = res-2*g2*gp*QHu*vu*Conjg(dZH(gt1,2))*Cos(TW)*Cos(TWp)*Sin(TWp)
res = res+2*dvd*g2*gp*QHd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)*Sin(TWp)
res = res+2*dgp*g2*QHd*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)*Sin(TWp)
res = res+2*dg2*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)*Sin(TWp)
res = res-2*dvu*g2*gp*QHu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)*Sin(TWp)
res = res-2*dgp*g2*QHu*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)*Sin(TWp)
res = res-2*dg2*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)*Sin(TWp)
res = res+2*dCosTWp*g1*gp*QHd*vd*Conjg(ZH(gt1,1))*Sin(TW)*Sin(TWp)
res = res-2*dCosTWp*g1*gp*QHu*vu*Conjg(ZH(gt1,2))*Sin(TW)*Sin(TWp)
res = res-(dSinTWp*g1*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TW)*Sin(TWp))
res = res-(dSinTWp*g1*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TW)*Sin(TWp))
res = res+2*g1*gp*QHd*vd*Conjg(dZH(gt1,1))*Cos(TWp)*Sin(TW)*Sin(TWp)
res = res-2*g1*gp*QHu*vu*Conjg(dZH(gt1,2))*Cos(TWp)*Sin(TW)*Sin(TWp)
res = res+2*dvd*g1*gp*QHd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)*Sin(TWp)
res = res+2*dgp*g1*QHd*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)*Sin(TWp)
res = res+2*dg1*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)*Sin(TWp)
res = res-2*dvu*g1*gp*QHu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)*Sin(TWp)
res = res-2*dgp*g1*QHu*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)*Sin(TWp)
res = res-2*dg1*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)*Sin(TWp)
res = res-(dSinTWp*g1**2*vd*Conjg(ZH(gt1,1))*Sin(TW)**2*Sin(TWp))/4._dp
res = res+(dSinTWp*g2**2*vd*Conjg(ZH(gt1,1))*Sin(TW)**2*Sin(TWp))/4._dp
res = res-(dSinTWp*g1**2*vu*Conjg(ZH(gt1,2))*Sin(TW)**2*Sin(TWp))/4._dp
res = res+(dSinTWp*g2**2*vu*Conjg(ZH(gt1,2))*Sin(TW)**2*Sin(TWp))/4._dp
res = res-(g1**2*vd*Conjg(dZH(gt1,1))*Sin(TWp)**2)/8._dp
res = res-(g2**2*vd*Conjg(dZH(gt1,1))*Sin(TWp)**2)/8._dp
res = res+gp**2*QHd**2*vd*Conjg(dZH(gt1,1))*Sin(TWp)**2
res = res-(g1**2*vu*Conjg(dZH(gt1,2))*Sin(TWp)**2)/8._dp
res = res-(g2**2*vu*Conjg(dZH(gt1,2))*Sin(TWp)**2)/8._dp
res = res+gp**2*QHu**2*vu*Conjg(dZH(gt1,2))*Sin(TWp)**2
res = res+gp**2*Qs**2*vS*Conjg(dZH(gt1,3))*Sin(TWp)**2
res = res+gp**2*Qs1**2*vS1*Conjg(dZH(gt1,4))*Sin(TWp)**2
res = res+gp**2*Qs2**2*vS2*Conjg(dZH(gt1,5))*Sin(TWp)**2
res = res+gp**2*Qs3**2*vS3*Conjg(dZH(gt1,6))*Sin(TWp)**2
res = res-(dvd*g1**2*Conjg(ZH(gt1,1))*Sin(TWp)**2)/8._dp
res = res-(dvd*g2**2*Conjg(ZH(gt1,1))*Sin(TWp)**2)/8._dp
res = res+dvd*gp**2*QHd**2*Conjg(ZH(gt1,1))*Sin(TWp)**2
res = res-(dg1*g1*vd*Conjg(ZH(gt1,1))*Sin(TWp)**2)/4._dp
res = res-(dg2*g2*vd*Conjg(ZH(gt1,1))*Sin(TWp)**2)/4._dp
res = res+2*dgp*gp*QHd**2*vd*Conjg(ZH(gt1,1))*Sin(TWp)**2
res = res-(dvu*g1**2*Conjg(ZH(gt1,2))*Sin(TWp)**2)/8._dp
res = res-(dvu*g2**2*Conjg(ZH(gt1,2))*Sin(TWp)**2)/8._dp
res = res+dvu*gp**2*QHu**2*Conjg(ZH(gt1,2))*Sin(TWp)**2
res = res-(dg1*g1*vu*Conjg(ZH(gt1,2))*Sin(TWp)**2)/4._dp
res = res-(dg2*g2*vu*Conjg(ZH(gt1,2))*Sin(TWp)**2)/4._dp
res = res+2*dgp*gp*QHu**2*vu*Conjg(ZH(gt1,2))*Sin(TWp)**2
res = res+dvS*gp**2*Qs**2*Conjg(ZH(gt1,3))*Sin(TWp)**2
res = res+2*dgp*gp*Qs**2*vS*Conjg(ZH(gt1,3))*Sin(TWp)**2
res = res+dvS1*gp**2*Qs1**2*Conjg(ZH(gt1,4))*Sin(TWp)**2
res = res+2*dgp*gp*Qs1**2*vS1*Conjg(ZH(gt1,4))*Sin(TWp)**2
res = res+dvS2*gp**2*Qs2**2*Conjg(ZH(gt1,5))*Sin(TWp)**2
res = res+2*dgp*gp*Qs2**2*vS2*Conjg(ZH(gt1,5))*Sin(TWp)**2
res = res+dvS3*gp**2*Qs3**2*Conjg(ZH(gt1,6))*Sin(TWp)**2
res = res+2*dgp*gp*Qs3**2*vS3*Conjg(ZH(gt1,6))*Sin(TWp)**2
res = res+(dCosTW*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TWp)**2)/4._dp
res = res-(dSinTW*g1*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TWp)**2)/2._dp
res = res-(dCosTW*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TWp)**2)/4._dp
res = res+(dCosTW*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TWp)**2)/4._dp
res = res-(dSinTW*g1*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TWp)**2)/2._dp
res = res-(dCosTW*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TWp)**2)/4._dp
res = res+(g1**2*vd*Conjg(dZH(gt1,1))*Cos(TW)**2*Sin(TWp)**2)/8._dp
res = res-(g2**2*vd*Conjg(dZH(gt1,1))*Cos(TW)**2*Sin(TWp)**2)/8._dp
res = res+(g1**2*vu*Conjg(dZH(gt1,2))*Cos(TW)**2*Sin(TWp)**2)/8._dp
res = res-(g2**2*vu*Conjg(dZH(gt1,2))*Cos(TW)**2*Sin(TWp)**2)/8._dp
res = res+(dvd*g1**2*Conjg(ZH(gt1,1))*Cos(TW)**2*Sin(TWp)**2)/8._dp
res = res-(dvd*g2**2*Conjg(ZH(gt1,1))*Cos(TW)**2*Sin(TWp)**2)/8._dp
res = res+(dg1*g1*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Sin(TWp)**2)/4._dp
res = res-(dg2*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Sin(TWp)**2)/4._dp
res = res+(dvu*g1**2*Conjg(ZH(gt1,2))*Cos(TW)**2*Sin(TWp)**2)/8._dp
res = res-(dvu*g2**2*Conjg(ZH(gt1,2))*Cos(TW)**2*Sin(TWp)**2)/8._dp
res = res+(dg1*g1*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Sin(TWp)**2)/4._dp
res = res-(dg2*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Sin(TWp)**2)/4._dp
res = res-(dSinTW*g1**2*vd*Conjg(ZH(gt1,1))*Sin(TW)*Sin(TWp)**2)/4._dp
res = res-(dCosTW*g1*g2*vd*Conjg(ZH(gt1,1))*Sin(TW)*Sin(TWp)**2)/2._dp
res = res+(dSinTW*g2**2*vd*Conjg(ZH(gt1,1))*Sin(TW)*Sin(TWp)**2)/4._dp
res = res-(dSinTW*g1**2*vu*Conjg(ZH(gt1,2))*Sin(TW)*Sin(TWp)**2)/4._dp
res = res-(dCosTW*g1*g2*vu*Conjg(ZH(gt1,2))*Sin(TW)*Sin(TWp)**2)/2._dp
res = res+(dSinTW*g2**2*vu*Conjg(ZH(gt1,2))*Sin(TW)*Sin(TWp)**2)/4._dp
res = res-(g1*g2*vd*Conjg(dZH(gt1,1))*Cos(TW)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res-(g1*g2*vu*Conjg(dZH(gt1,2))*Cos(TW)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res-(dvd*g1*g2*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res-(dg2*g1*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res-(dg1*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res-(dvu*g1*g2*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res-(dg2*g1*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res-(dg1*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res-(g1**2*vd*Conjg(dZH(gt1,1))*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res+(g2**2*vd*Conjg(dZH(gt1,1))*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res-(g1**2*vu*Conjg(dZH(gt1,2))*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res+(g2**2*vu*Conjg(dZH(gt1,2))*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res-(dvd*g1**2*Conjg(ZH(gt1,1))*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res+(dvd*g2**2*Conjg(ZH(gt1,1))*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res-(dg1*g1*vd*Conjg(ZH(gt1,1))*Sin(TW)**2*Sin(TWp)**2)/4._dp
res = res+(dg2*g2*vd*Conjg(ZH(gt1,1))*Sin(TW)**2*Sin(TWp)**2)/4._dp
res = res-(dvu*g1**2*Conjg(ZH(gt1,2))*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res+(dvu*g2**2*Conjg(ZH(gt1,2))*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res-(dg1*g1*vu*Conjg(ZH(gt1,2))*Sin(TW)**2*Sin(TWp)**2)/4._dp
res = res+(dg2*g2*vu*Conjg(ZH(gt1,2))*Sin(TW)**2*Sin(TWp)**2)/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhVZVZ  
 
 
Subroutine CT_CouplinghhVZVZp(gt1,g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,ZH,TW,TWp,            & 
& dg1,dg2,dgp,dvd,dvu,dvS,dvS1,dvS2,dvS3,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,               & 
& dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,TW,TWp,dg1,dg2,dgp,dvd,dvu,dvS,dvS1,dvS2,               & 
& dvS3,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZH(6,6),dZH(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhVZVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(dSinTWp*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TWp))/4._dp
res = res-(dSinTWp*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TWp))/4._dp
res = res+2*dSinTWp*gp**2*QHd**2*vd*Conjg(ZH(gt1,1))*Cos(TWp)
res = res-(dSinTWp*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TWp))/4._dp
res = res-(dSinTWp*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TWp))/4._dp
res = res+2*dSinTWp*gp**2*QHu**2*vu*Conjg(ZH(gt1,2))*Cos(TWp)
res = res+2*dSinTWp*gp**2*Qs**2*vS*Conjg(ZH(gt1,3))*Cos(TWp)
res = res+2*dSinTWp*gp**2*Qs1**2*vS1*Conjg(ZH(gt1,4))*Cos(TWp)
res = res+2*dSinTWp*gp**2*Qs2**2*vS2*Conjg(ZH(gt1,5))*Cos(TWp)
res = res+2*dSinTWp*gp**2*Qs3**2*vS3*Conjg(ZH(gt1,6))*Cos(TWp)
res = res+2*dCosTWp*g2*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)
res = res-2*dCosTWp*g2*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)
res = res+(dSinTWp*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Cos(TWp))/4._dp
res = res-(dSinTWp*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Cos(TWp))/4._dp
res = res+(dSinTWp*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Cos(TWp))/4._dp
res = res-(dSinTWp*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Cos(TWp))/4._dp
res = res+dSinTW*g1*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TWp)**2
res = res+dCosTW*g2*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TWp)**2
res = res-(dSinTW*g1*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TWp)**2)
res = res-(dCosTW*g2*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TWp)**2)
res = res+g2*gp*QHd*vd*Conjg(dZH(gt1,1))*Cos(TW)*Cos(TWp)**2
res = res-(g2*gp*QHu*vu*Conjg(dZH(gt1,2))*Cos(TW)*Cos(TWp)**2)
res = res+dvd*g2*gp*QHd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)**2
res = res+dgp*g2*QHd*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)**2
res = res+dg2*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)**2
res = res-(dvu*g2*gp*QHu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)**2)
res = res-(dgp*g2*QHu*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)**2)
res = res-(dg2*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)**2)
res = res+2*dCosTWp*g1*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)
res = res-2*dCosTWp*g1*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)
res = res-(dSinTWp*g1*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)*Sin(TW))
res = res-(dSinTWp*g1*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)*Sin(TW))
res = res+g1*gp*QHd*vd*Conjg(dZH(gt1,1))*Cos(TWp)**2*Sin(TW)
res = res-(g1*gp*QHu*vu*Conjg(dZH(gt1,2))*Cos(TWp)**2*Sin(TW))
res = res+dvd*g1*gp*QHd*Conjg(ZH(gt1,1))*Cos(TWp)**2*Sin(TW)
res = res+dgp*g1*QHd*vd*Conjg(ZH(gt1,1))*Cos(TWp)**2*Sin(TW)
res = res+dg1*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TWp)**2*Sin(TW)
res = res-(dvu*g1*gp*QHu*Conjg(ZH(gt1,2))*Cos(TWp)**2*Sin(TW))
res = res-(dgp*g1*QHu*vu*Conjg(ZH(gt1,2))*Cos(TWp)**2*Sin(TW))
res = res-(dg1*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TWp)**2*Sin(TW))
res = res-(dSinTWp*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)**2)/4._dp
res = res+(dSinTWp*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)**2)/4._dp
res = res-(dSinTWp*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)**2)/4._dp
res = res+(dSinTWp*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)**2)/4._dp
res = res-(dCosTWp*g1**2*vd*Conjg(ZH(gt1,1))*Sin(TWp))/4._dp
res = res-(dCosTWp*g2**2*vd*Conjg(ZH(gt1,1))*Sin(TWp))/4._dp
res = res+2*dCosTWp*gp**2*QHd**2*vd*Conjg(ZH(gt1,1))*Sin(TWp)
res = res-(dCosTWp*g1**2*vu*Conjg(ZH(gt1,2))*Sin(TWp))/4._dp
res = res-(dCosTWp*g2**2*vu*Conjg(ZH(gt1,2))*Sin(TWp))/4._dp
res = res+2*dCosTWp*gp**2*QHu**2*vu*Conjg(ZH(gt1,2))*Sin(TWp)
res = res+2*dCosTWp*gp**2*Qs**2*vS*Conjg(ZH(gt1,3))*Sin(TWp)
res = res+2*dCosTWp*gp**2*Qs1**2*vS1*Conjg(ZH(gt1,4))*Sin(TWp)
res = res+2*dCosTWp*gp**2*Qs2**2*vS2*Conjg(ZH(gt1,5))*Sin(TWp)
res = res+2*dCosTWp*gp**2*Qs3**2*vS3*Conjg(ZH(gt1,6))*Sin(TWp)
res = res-2*dSinTWp*g2*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TWp)
res = res+2*dSinTWp*g2*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TWp)
res = res+(dCosTWp*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Sin(TWp))/4._dp
res = res-(dCosTWp*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Sin(TWp))/4._dp
res = res+(dCosTWp*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Sin(TWp))/4._dp
res = res-(dCosTWp*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Sin(TWp))/4._dp
res = res-(g1**2*vd*Conjg(dZH(gt1,1))*Cos(TWp)*Sin(TWp))/4._dp
res = res-(g2**2*vd*Conjg(dZH(gt1,1))*Cos(TWp)*Sin(TWp))/4._dp
res = res+2*gp**2*QHd**2*vd*Conjg(dZH(gt1,1))*Cos(TWp)*Sin(TWp)
res = res-(g1**2*vu*Conjg(dZH(gt1,2))*Cos(TWp)*Sin(TWp))/4._dp
res = res-(g2**2*vu*Conjg(dZH(gt1,2))*Cos(TWp)*Sin(TWp))/4._dp
res = res+2*gp**2*QHu**2*vu*Conjg(dZH(gt1,2))*Cos(TWp)*Sin(TWp)
res = res+2*gp**2*Qs**2*vS*Conjg(dZH(gt1,3))*Cos(TWp)*Sin(TWp)
res = res+2*gp**2*Qs1**2*vS1*Conjg(dZH(gt1,4))*Cos(TWp)*Sin(TWp)
res = res+2*gp**2*Qs2**2*vS2*Conjg(dZH(gt1,5))*Cos(TWp)*Sin(TWp)
res = res+2*gp**2*Qs3**2*vS3*Conjg(dZH(gt1,6))*Cos(TWp)*Sin(TWp)
res = res-(dvd*g1**2*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TWp))/4._dp
res = res-(dvd*g2**2*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TWp))/4._dp
res = res+2*dvd*gp**2*QHd**2*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TWp)
res = res-(dg1*g1*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TWp))/2._dp
res = res-(dg2*g2*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TWp))/2._dp
res = res+4*dgp*gp*QHd**2*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TWp)
res = res-(dvu*g1**2*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TWp))/4._dp
res = res-(dvu*g2**2*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TWp))/4._dp
res = res+2*dvu*gp**2*QHu**2*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TWp)
res = res-(dg1*g1*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TWp))/2._dp
res = res-(dg2*g2*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TWp))/2._dp
res = res+4*dgp*gp*QHu**2*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TWp)
res = res+2*dvS*gp**2*Qs**2*Conjg(ZH(gt1,3))*Cos(TWp)*Sin(TWp)
res = res+4*dgp*gp*Qs**2*vS*Conjg(ZH(gt1,3))*Cos(TWp)*Sin(TWp)
res = res+2*dvS1*gp**2*Qs1**2*Conjg(ZH(gt1,4))*Cos(TWp)*Sin(TWp)
res = res+4*dgp*gp*Qs1**2*vS1*Conjg(ZH(gt1,4))*Cos(TWp)*Sin(TWp)
res = res+2*dvS2*gp**2*Qs2**2*Conjg(ZH(gt1,5))*Cos(TWp)*Sin(TWp)
res = res+4*dgp*gp*Qs2**2*vS2*Conjg(ZH(gt1,5))*Cos(TWp)*Sin(TWp)
res = res+2*dvS3*gp**2*Qs3**2*Conjg(ZH(gt1,6))*Cos(TWp)*Sin(TWp)
res = res+4*dgp*gp*Qs3**2*vS3*Conjg(ZH(gt1,6))*Cos(TWp)*Sin(TWp)
res = res+(dCosTW*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)*Sin(TWp))/2._dp
res = res-(dSinTW*g1*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)*Sin(TWp))
res = res-(dCosTW*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)*Sin(TWp))/2._dp
res = res+(dCosTW*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)*Sin(TWp))/2._dp
res = res-(dSinTW*g1*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)*Sin(TWp))
res = res-(dCosTW*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)*Sin(TWp))/2._dp
res = res+(g1**2*vd*Conjg(dZH(gt1,1))*Cos(TW)**2*Cos(TWp)*Sin(TWp))/4._dp
res = res-(g2**2*vd*Conjg(dZH(gt1,1))*Cos(TW)**2*Cos(TWp)*Sin(TWp))/4._dp
res = res+(g1**2*vu*Conjg(dZH(gt1,2))*Cos(TW)**2*Cos(TWp)*Sin(TWp))/4._dp
res = res-(g2**2*vu*Conjg(dZH(gt1,2))*Cos(TW)**2*Cos(TWp)*Sin(TWp))/4._dp
res = res+(dvd*g1**2*Conjg(ZH(gt1,1))*Cos(TW)**2*Cos(TWp)*Sin(TWp))/4._dp
res = res-(dvd*g2**2*Conjg(ZH(gt1,1))*Cos(TW)**2*Cos(TWp)*Sin(TWp))/4._dp
res = res+(dg1*g1*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Cos(TWp)*Sin(TWp))/2._dp
res = res-(dg2*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Cos(TWp)*Sin(TWp))/2._dp
res = res+(dvu*g1**2*Conjg(ZH(gt1,2))*Cos(TW)**2*Cos(TWp)*Sin(TWp))/4._dp
res = res-(dvu*g2**2*Conjg(ZH(gt1,2))*Cos(TW)**2*Cos(TWp)*Sin(TWp))/4._dp
res = res+(dg1*g1*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Cos(TWp)*Sin(TWp))/2._dp
res = res-(dg2*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Cos(TWp)*Sin(TWp))/2._dp
res = res-2*dSinTWp*g1*gp*QHd*vd*Conjg(ZH(gt1,1))*Sin(TW)*Sin(TWp)
res = res+2*dSinTWp*g1*gp*QHu*vu*Conjg(ZH(gt1,2))*Sin(TW)*Sin(TWp)
res = res-(dCosTWp*g1*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TW)*Sin(TWp))
res = res-(dCosTWp*g1*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TW)*Sin(TWp))
res = res-(dSinTW*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)*Sin(TWp))/2._dp
res = res-(dCosTW*g1*g2*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)*Sin(TWp))
res = res+(dSinTW*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)*Sin(TWp))/2._dp
res = res-(dSinTW*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)*Sin(TWp))/2._dp
res = res-(dCosTW*g1*g2*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)*Sin(TWp))
res = res+(dSinTW*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)*Sin(TWp))/2._dp
res = res-(g1*g2*vd*Conjg(dZH(gt1,1))*Cos(TW)*Cos(TWp)*Sin(TW)*Sin(TWp))
res = res-(g1*g2*vu*Conjg(dZH(gt1,2))*Cos(TW)*Cos(TWp)*Sin(TW)*Sin(TWp))
res = res-(dvd*g1*g2*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)*Sin(TW)*Sin(TWp))
res = res-(dg2*g1*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)*Sin(TW)*Sin(TWp))
res = res-(dg1*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)*Sin(TW)*Sin(TWp))
res = res-(dvu*g1*g2*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)*Sin(TW)*Sin(TWp))
res = res-(dg2*g1*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)*Sin(TW)*Sin(TWp))
res = res-(dg1*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)*Sin(TW)*Sin(TWp))
res = res-(dCosTWp*g1**2*vd*Conjg(ZH(gt1,1))*Sin(TW)**2*Sin(TWp))/4._dp
res = res+(dCosTWp*g2**2*vd*Conjg(ZH(gt1,1))*Sin(TW)**2*Sin(TWp))/4._dp
res = res-(dCosTWp*g1**2*vu*Conjg(ZH(gt1,2))*Sin(TW)**2*Sin(TWp))/4._dp
res = res+(dCosTWp*g2**2*vu*Conjg(ZH(gt1,2))*Sin(TW)**2*Sin(TWp))/4._dp
res = res-(g1**2*vd*Conjg(dZH(gt1,1))*Cos(TWp)*Sin(TW)**2*Sin(TWp))/4._dp
res = res+(g2**2*vd*Conjg(dZH(gt1,1))*Cos(TWp)*Sin(TW)**2*Sin(TWp))/4._dp
res = res-(g1**2*vu*Conjg(dZH(gt1,2))*Cos(TWp)*Sin(TW)**2*Sin(TWp))/4._dp
res = res+(g2**2*vu*Conjg(dZH(gt1,2))*Cos(TWp)*Sin(TW)**2*Sin(TWp))/4._dp
res = res-(dvd*g1**2*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)**2*Sin(TWp))/4._dp
res = res+(dvd*g2**2*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)**2*Sin(TWp))/4._dp
res = res-(dg1*g1*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)**2*Sin(TWp))/2._dp
res = res+(dg2*g2*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)**2*Sin(TWp))/2._dp
res = res-(dvu*g1**2*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)**2*Sin(TWp))/4._dp
res = res+(dvu*g2**2*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)**2*Sin(TWp))/4._dp
res = res-(dg1*g1*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)**2*Sin(TWp))/2._dp
res = res+(dg2*g2*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)**2*Sin(TWp))/2._dp
res = res-(dSinTW*g1*gp*QHd*vd*Conjg(ZH(gt1,1))*Sin(TWp)**2)
res = res-(dCosTW*g2*gp*QHd*vd*Conjg(ZH(gt1,1))*Sin(TWp)**2)
res = res+dSinTW*g1*gp*QHu*vu*Conjg(ZH(gt1,2))*Sin(TWp)**2
res = res+dCosTW*g2*gp*QHu*vu*Conjg(ZH(gt1,2))*Sin(TWp)**2
res = res-(g2*gp*QHd*vd*Conjg(dZH(gt1,1))*Cos(TW)*Sin(TWp)**2)
res = res+g2*gp*QHu*vu*Conjg(dZH(gt1,2))*Cos(TW)*Sin(TWp)**2
res = res-(dvd*g2*gp*QHd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TWp)**2)
res = res-(dgp*g2*QHd*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TWp)**2)
res = res-(dg2*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TWp)**2)
res = res+dvu*g2*gp*QHu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TWp)**2
res = res+dgp*g2*QHu*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TWp)**2
res = res+dg2*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TWp)**2
res = res-(g1*gp*QHd*vd*Conjg(dZH(gt1,1))*Sin(TW)*Sin(TWp)**2)
res = res+g1*gp*QHu*vu*Conjg(dZH(gt1,2))*Sin(TW)*Sin(TWp)**2
res = res-(dvd*g1*gp*QHd*Conjg(ZH(gt1,1))*Sin(TW)*Sin(TWp)**2)
res = res-(dgp*g1*QHd*vd*Conjg(ZH(gt1,1))*Sin(TW)*Sin(TWp)**2)
res = res-(dg1*gp*QHd*vd*Conjg(ZH(gt1,1))*Sin(TW)*Sin(TWp)**2)
res = res+dvu*g1*gp*QHu*Conjg(ZH(gt1,2))*Sin(TW)*Sin(TWp)**2
res = res+dgp*g1*QHu*vu*Conjg(ZH(gt1,2))*Sin(TW)*Sin(TWp)**2
res = res+dg1*gp*QHu*vu*Conjg(ZH(gt1,2))*Sin(TW)*Sin(TWp)**2
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhVZVZp  
 
 
Subroutine CT_CouplinghhVZpVZp(gt1,g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,ZH,TW,               & 
& TWp,dg1,dg2,dgp,dvd,dvu,dvS,dvS1,dvS2,dvS3,dZH,dSinTW,dCosTW,dTanTW,dSinTWp,           & 
& dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gp,vd,vu,vS,vS1,vS2,vS3,TW,TWp,dg1,dg2,dgp,dvd,dvu,dvS,dvS1,dvS2,               & 
& dvS3,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZH(6,6),dZH(6,6)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhVZpVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1**2*vd*Conjg(dZH(gt1,1)))/8._dp
res = res+(g2**2*vd*Conjg(dZH(gt1,1)))/8._dp
res = res+gp**2*QHd**2*vd*Conjg(dZH(gt1,1))
res = res+(g1**2*vu*Conjg(dZH(gt1,2)))/8._dp
res = res+(g2**2*vu*Conjg(dZH(gt1,2)))/8._dp
res = res+gp**2*QHu**2*vu*Conjg(dZH(gt1,2))
res = res+gp**2*Qs**2*vS*Conjg(dZH(gt1,3))
res = res+gp**2*Qs1**2*vS1*Conjg(dZH(gt1,4))
res = res+gp**2*Qs2**2*vS2*Conjg(dZH(gt1,5))
res = res+gp**2*Qs3**2*vS3*Conjg(dZH(gt1,6))
res = res+(dvd*g1**2*Conjg(ZH(gt1,1)))/8._dp
res = res+(dvd*g2**2*Conjg(ZH(gt1,1)))/8._dp
res = res+dvd*gp**2*QHd**2*Conjg(ZH(gt1,1))
res = res+(dg1*g1*vd*Conjg(ZH(gt1,1)))/4._dp
res = res+(dg2*g2*vd*Conjg(ZH(gt1,1)))/4._dp
res = res+2*dgp*gp*QHd**2*vd*Conjg(ZH(gt1,1))
res = res+(dvu*g1**2*Conjg(ZH(gt1,2)))/8._dp
res = res+(dvu*g2**2*Conjg(ZH(gt1,2)))/8._dp
res = res+dvu*gp**2*QHu**2*Conjg(ZH(gt1,2))
res = res+(dg1*g1*vu*Conjg(ZH(gt1,2)))/4._dp
res = res+(dg2*g2*vu*Conjg(ZH(gt1,2)))/4._dp
res = res+2*dgp*gp*QHu**2*vu*Conjg(ZH(gt1,2))
res = res+dvS*gp**2*Qs**2*Conjg(ZH(gt1,3))
res = res+2*dgp*gp*Qs**2*vS*Conjg(ZH(gt1,3))
res = res+dvS1*gp**2*Qs1**2*Conjg(ZH(gt1,4))
res = res+2*dgp*gp*Qs1**2*vS1*Conjg(ZH(gt1,4))
res = res+dvS2*gp**2*Qs2**2*Conjg(ZH(gt1,5))
res = res+2*dgp*gp*Qs2**2*vS2*Conjg(ZH(gt1,5))
res = res+dvS3*gp**2*Qs3**2*Conjg(ZH(gt1,6))
res = res+2*dgp*gp*Qs3**2*vS3*Conjg(ZH(gt1,6))
res = res-(dCosTW*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TW))/4._dp
res = res+(dSinTW*g1*g2*vd*Conjg(ZH(gt1,1))*Cos(TW))/2._dp
res = res+(dCosTW*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TW))/4._dp
res = res-(dCosTW*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TW))/4._dp
res = res+(dSinTW*g1*g2*vu*Conjg(ZH(gt1,2))*Cos(TW))/2._dp
res = res+(dCosTW*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TW))/4._dp
res = res-(g1**2*vd*Conjg(dZH(gt1,1))*Cos(TW)**2)/8._dp
res = res+(g2**2*vd*Conjg(dZH(gt1,1))*Cos(TW)**2)/8._dp
res = res-(g1**2*vu*Conjg(dZH(gt1,2))*Cos(TW)**2)/8._dp
res = res+(g2**2*vu*Conjg(dZH(gt1,2))*Cos(TW)**2)/8._dp
res = res-(dvd*g1**2*Conjg(ZH(gt1,1))*Cos(TW)**2)/8._dp
res = res+(dvd*g2**2*Conjg(ZH(gt1,1))*Cos(TW)**2)/8._dp
res = res-(dg1*g1*vd*Conjg(ZH(gt1,1))*Cos(TW)**2)/4._dp
res = res+(dg2*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)**2)/4._dp
res = res-(dvu*g1**2*Conjg(ZH(gt1,2))*Cos(TW)**2)/8._dp
res = res+(dvu*g2**2*Conjg(ZH(gt1,2))*Cos(TW)**2)/8._dp
res = res-(dg1*g1*vu*Conjg(ZH(gt1,2))*Cos(TW)**2)/4._dp
res = res+(dg2*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)**2)/4._dp
res = res-(dCosTWp*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TWp))/4._dp
res = res-(dCosTWp*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TWp))/4._dp
res = res+2*dCosTWp*gp**2*QHd**2*vd*Conjg(ZH(gt1,1))*Cos(TWp)
res = res-(dCosTWp*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TWp))/4._dp
res = res-(dCosTWp*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TWp))/4._dp
res = res+2*dCosTWp*gp**2*QHu**2*vu*Conjg(ZH(gt1,2))*Cos(TWp)
res = res+2*dCosTWp*gp**2*Qs**2*vS*Conjg(ZH(gt1,3))*Cos(TWp)
res = res+2*dCosTWp*gp**2*Qs1**2*vS1*Conjg(ZH(gt1,4))*Cos(TWp)
res = res+2*dCosTWp*gp**2*Qs2**2*vS2*Conjg(ZH(gt1,5))*Cos(TWp)
res = res+2*dCosTWp*gp**2*Qs3**2*vS3*Conjg(ZH(gt1,6))*Cos(TWp)
res = res-2*dSinTWp*g2*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)
res = res+2*dSinTWp*g2*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)
res = res+(dCosTWp*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Cos(TWp))/4._dp
res = res-(dCosTWp*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Cos(TWp))/4._dp
res = res+(dCosTWp*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Cos(TWp))/4._dp
res = res-(dCosTWp*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Cos(TWp))/4._dp
res = res-(g1**2*vd*Conjg(dZH(gt1,1))*Cos(TWp)**2)/8._dp
res = res-(g2**2*vd*Conjg(dZH(gt1,1))*Cos(TWp)**2)/8._dp
res = res+gp**2*QHd**2*vd*Conjg(dZH(gt1,1))*Cos(TWp)**2
res = res-(g1**2*vu*Conjg(dZH(gt1,2))*Cos(TWp)**2)/8._dp
res = res-(g2**2*vu*Conjg(dZH(gt1,2))*Cos(TWp)**2)/8._dp
res = res+gp**2*QHu**2*vu*Conjg(dZH(gt1,2))*Cos(TWp)**2
res = res+gp**2*Qs**2*vS*Conjg(dZH(gt1,3))*Cos(TWp)**2
res = res+gp**2*Qs1**2*vS1*Conjg(dZH(gt1,4))*Cos(TWp)**2
res = res+gp**2*Qs2**2*vS2*Conjg(dZH(gt1,5))*Cos(TWp)**2
res = res+gp**2*Qs3**2*vS3*Conjg(dZH(gt1,6))*Cos(TWp)**2
res = res-(dvd*g1**2*Conjg(ZH(gt1,1))*Cos(TWp)**2)/8._dp
res = res-(dvd*g2**2*Conjg(ZH(gt1,1))*Cos(TWp)**2)/8._dp
res = res+dvd*gp**2*QHd**2*Conjg(ZH(gt1,1))*Cos(TWp)**2
res = res-(dg1*g1*vd*Conjg(ZH(gt1,1))*Cos(TWp)**2)/4._dp
res = res-(dg2*g2*vd*Conjg(ZH(gt1,1))*Cos(TWp)**2)/4._dp
res = res+2*dgp*gp*QHd**2*vd*Conjg(ZH(gt1,1))*Cos(TWp)**2
res = res-(dvu*g1**2*Conjg(ZH(gt1,2))*Cos(TWp)**2)/8._dp
res = res-(dvu*g2**2*Conjg(ZH(gt1,2))*Cos(TWp)**2)/8._dp
res = res+dvu*gp**2*QHu**2*Conjg(ZH(gt1,2))*Cos(TWp)**2
res = res-(dg1*g1*vu*Conjg(ZH(gt1,2))*Cos(TWp)**2)/4._dp
res = res-(dg2*g2*vu*Conjg(ZH(gt1,2))*Cos(TWp)**2)/4._dp
res = res+2*dgp*gp*QHu**2*vu*Conjg(ZH(gt1,2))*Cos(TWp)**2
res = res+dvS*gp**2*Qs**2*Conjg(ZH(gt1,3))*Cos(TWp)**2
res = res+2*dgp*gp*Qs**2*vS*Conjg(ZH(gt1,3))*Cos(TWp)**2
res = res+dvS1*gp**2*Qs1**2*Conjg(ZH(gt1,4))*Cos(TWp)**2
res = res+2*dgp*gp*Qs1**2*vS1*Conjg(ZH(gt1,4))*Cos(TWp)**2
res = res+dvS2*gp**2*Qs2**2*Conjg(ZH(gt1,5))*Cos(TWp)**2
res = res+2*dgp*gp*Qs2**2*vS2*Conjg(ZH(gt1,5))*Cos(TWp)**2
res = res+dvS3*gp**2*Qs3**2*Conjg(ZH(gt1,6))*Cos(TWp)**2
res = res+2*dgp*gp*Qs3**2*vS3*Conjg(ZH(gt1,6))*Cos(TWp)**2
res = res+(dCosTW*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)**2)/4._dp
res = res-(dSinTW*g1*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)**2)/2._dp
res = res-(dCosTW*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)**2)/4._dp
res = res+(dCosTW*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)**2)/4._dp
res = res-(dSinTW*g1*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)**2)/2._dp
res = res-(dCosTW*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)**2)/4._dp
res = res+(g1**2*vd*Conjg(dZH(gt1,1))*Cos(TW)**2*Cos(TWp)**2)/8._dp
res = res-(g2**2*vd*Conjg(dZH(gt1,1))*Cos(TW)**2*Cos(TWp)**2)/8._dp
res = res+(g1**2*vu*Conjg(dZH(gt1,2))*Cos(TW)**2*Cos(TWp)**2)/8._dp
res = res-(g2**2*vu*Conjg(dZH(gt1,2))*Cos(TW)**2*Cos(TWp)**2)/8._dp
res = res+(dvd*g1**2*Conjg(ZH(gt1,1))*Cos(TW)**2*Cos(TWp)**2)/8._dp
res = res-(dvd*g2**2*Conjg(ZH(gt1,1))*Cos(TW)**2*Cos(TWp)**2)/8._dp
res = res+(dg1*g1*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Cos(TWp)**2)/4._dp
res = res-(dg2*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Cos(TWp)**2)/4._dp
res = res+(dvu*g1**2*Conjg(ZH(gt1,2))*Cos(TW)**2*Cos(TWp)**2)/8._dp
res = res-(dvu*g2**2*Conjg(ZH(gt1,2))*Cos(TW)**2*Cos(TWp)**2)/8._dp
res = res+(dg1*g1*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Cos(TWp)**2)/4._dp
res = res-(dg2*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Cos(TWp)**2)/4._dp
res = res+(dSinTW*g1**2*vd*Conjg(ZH(gt1,1))*Sin(TW))/4._dp
res = res+(dCosTW*g1*g2*vd*Conjg(ZH(gt1,1))*Sin(TW))/2._dp
res = res-(dSinTW*g2**2*vd*Conjg(ZH(gt1,1))*Sin(TW))/4._dp
res = res+(dSinTW*g1**2*vu*Conjg(ZH(gt1,2))*Sin(TW))/4._dp
res = res+(dCosTW*g1*g2*vu*Conjg(ZH(gt1,2))*Sin(TW))/2._dp
res = res-(dSinTW*g2**2*vu*Conjg(ZH(gt1,2))*Sin(TW))/4._dp
res = res+(g1*g2*vd*Conjg(dZH(gt1,1))*Cos(TW)*Sin(TW))/2._dp
res = res+(g1*g2*vu*Conjg(dZH(gt1,2))*Cos(TW)*Sin(TW))/2._dp
res = res+(dvd*g1*g2*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TW))/2._dp
res = res+(dg2*g1*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TW))/2._dp
res = res+(dg1*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TW))/2._dp
res = res+(dvu*g1*g2*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TW))/2._dp
res = res+(dg2*g1*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TW))/2._dp
res = res+(dg1*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TW))/2._dp
res = res-2*dSinTWp*g1*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)
res = res+2*dSinTWp*g1*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)
res = res-(dCosTWp*g1*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)*Sin(TW))
res = res-(dCosTWp*g1*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)*Sin(TW))
res = res-(dSinTW*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TWp)**2*Sin(TW))/4._dp
res = res-(dCosTW*g1*g2*vd*Conjg(ZH(gt1,1))*Cos(TWp)**2*Sin(TW))/2._dp
res = res+(dSinTW*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TWp)**2*Sin(TW))/4._dp
res = res-(dSinTW*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TWp)**2*Sin(TW))/4._dp
res = res-(dCosTW*g1*g2*vu*Conjg(ZH(gt1,2))*Cos(TWp)**2*Sin(TW))/2._dp
res = res+(dSinTW*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TWp)**2*Sin(TW))/4._dp
res = res-(g1*g2*vd*Conjg(dZH(gt1,1))*Cos(TW)*Cos(TWp)**2*Sin(TW))/2._dp
res = res-(g1*g2*vu*Conjg(dZH(gt1,2))*Cos(TW)*Cos(TWp)**2*Sin(TW))/2._dp
res = res-(dvd*g1*g2*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)**2*Sin(TW))/2._dp
res = res-(dg2*g1*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)**2*Sin(TW))/2._dp
res = res-(dg1*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)**2*Sin(TW))/2._dp
res = res-(dvu*g1*g2*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)**2*Sin(TW))/2._dp
res = res-(dg2*g1*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)**2*Sin(TW))/2._dp
res = res-(dg1*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)**2*Sin(TW))/2._dp
res = res+(g1**2*vd*Conjg(dZH(gt1,1))*Sin(TW)**2)/8._dp
res = res-(g2**2*vd*Conjg(dZH(gt1,1))*Sin(TW)**2)/8._dp
res = res+(g1**2*vu*Conjg(dZH(gt1,2))*Sin(TW)**2)/8._dp
res = res-(g2**2*vu*Conjg(dZH(gt1,2))*Sin(TW)**2)/8._dp
res = res+(dvd*g1**2*Conjg(ZH(gt1,1))*Sin(TW)**2)/8._dp
res = res-(dvd*g2**2*Conjg(ZH(gt1,1))*Sin(TW)**2)/8._dp
res = res+(dg1*g1*vd*Conjg(ZH(gt1,1))*Sin(TW)**2)/4._dp
res = res-(dg2*g2*vd*Conjg(ZH(gt1,1))*Sin(TW)**2)/4._dp
res = res+(dvu*g1**2*Conjg(ZH(gt1,2))*Sin(TW)**2)/8._dp
res = res-(dvu*g2**2*Conjg(ZH(gt1,2))*Sin(TW)**2)/8._dp
res = res+(dg1*g1*vu*Conjg(ZH(gt1,2))*Sin(TW)**2)/4._dp
res = res-(dg2*g2*vu*Conjg(ZH(gt1,2))*Sin(TW)**2)/4._dp
res = res-(dCosTWp*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)**2)/4._dp
res = res+(dCosTWp*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)**2)/4._dp
res = res-(dCosTWp*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)**2)/4._dp
res = res+(dCosTWp*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)**2)/4._dp
res = res-(g1**2*vd*Conjg(dZH(gt1,1))*Cos(TWp)**2*Sin(TW)**2)/8._dp
res = res+(g2**2*vd*Conjg(dZH(gt1,1))*Cos(TWp)**2*Sin(TW)**2)/8._dp
res = res-(g1**2*vu*Conjg(dZH(gt1,2))*Cos(TWp)**2*Sin(TW)**2)/8._dp
res = res+(g2**2*vu*Conjg(dZH(gt1,2))*Cos(TWp)**2*Sin(TW)**2)/8._dp
res = res-(dvd*g1**2*Conjg(ZH(gt1,1))*Cos(TWp)**2*Sin(TW)**2)/8._dp
res = res+(dvd*g2**2*Conjg(ZH(gt1,1))*Cos(TWp)**2*Sin(TW)**2)/8._dp
res = res-(dg1*g1*vd*Conjg(ZH(gt1,1))*Cos(TWp)**2*Sin(TW)**2)/4._dp
res = res+(dg2*g2*vd*Conjg(ZH(gt1,1))*Cos(TWp)**2*Sin(TW)**2)/4._dp
res = res-(dvu*g1**2*Conjg(ZH(gt1,2))*Cos(TWp)**2*Sin(TW)**2)/8._dp
res = res+(dvu*g2**2*Conjg(ZH(gt1,2))*Cos(TWp)**2*Sin(TW)**2)/8._dp
res = res-(dg1*g1*vu*Conjg(ZH(gt1,2))*Cos(TWp)**2*Sin(TW)**2)/4._dp
res = res+(dg2*g2*vu*Conjg(ZH(gt1,2))*Cos(TWp)**2*Sin(TW)**2)/4._dp
res = res+(dSinTWp*g1**2*vd*Conjg(ZH(gt1,1))*Sin(TWp))/4._dp
res = res+(dSinTWp*g2**2*vd*Conjg(ZH(gt1,1))*Sin(TWp))/4._dp
res = res-2*dSinTWp*gp**2*QHd**2*vd*Conjg(ZH(gt1,1))*Sin(TWp)
res = res+(dSinTWp*g1**2*vu*Conjg(ZH(gt1,2))*Sin(TWp))/4._dp
res = res+(dSinTWp*g2**2*vu*Conjg(ZH(gt1,2))*Sin(TWp))/4._dp
res = res-2*dSinTWp*gp**2*QHu**2*vu*Conjg(ZH(gt1,2))*Sin(TWp)
res = res-2*dSinTWp*gp**2*Qs**2*vS*Conjg(ZH(gt1,3))*Sin(TWp)
res = res-2*dSinTWp*gp**2*Qs1**2*vS1*Conjg(ZH(gt1,4))*Sin(TWp)
res = res-2*dSinTWp*gp**2*Qs2**2*vS2*Conjg(ZH(gt1,5))*Sin(TWp)
res = res-2*dSinTWp*gp**2*Qs3**2*vS3*Conjg(ZH(gt1,6))*Sin(TWp)
res = res-2*dCosTWp*g2*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TWp)
res = res+2*dCosTWp*g2*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TWp)
res = res-(dSinTWp*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Sin(TWp))/4._dp
res = res+(dSinTWp*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Sin(TWp))/4._dp
res = res-(dSinTWp*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Sin(TWp))/4._dp
res = res+(dSinTWp*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Sin(TWp))/4._dp
res = res-2*dSinTW*g1*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TWp)
res = res-2*dCosTW*g2*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TWp)
res = res+2*dSinTW*g1*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TWp)
res = res+2*dCosTW*g2*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TWp)
res = res-2*g2*gp*QHd*vd*Conjg(dZH(gt1,1))*Cos(TW)*Cos(TWp)*Sin(TWp)
res = res+2*g2*gp*QHu*vu*Conjg(dZH(gt1,2))*Cos(TW)*Cos(TWp)*Sin(TWp)
res = res-2*dvd*g2*gp*QHd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)*Sin(TWp)
res = res-2*dgp*g2*QHd*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)*Sin(TWp)
res = res-2*dg2*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TW)*Cos(TWp)*Sin(TWp)
res = res+2*dvu*g2*gp*QHu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)*Sin(TWp)
res = res+2*dgp*g2*QHu*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)*Sin(TWp)
res = res+2*dg2*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TW)*Cos(TWp)*Sin(TWp)
res = res-2*dCosTWp*g1*gp*QHd*vd*Conjg(ZH(gt1,1))*Sin(TW)*Sin(TWp)
res = res+2*dCosTWp*g1*gp*QHu*vu*Conjg(ZH(gt1,2))*Sin(TW)*Sin(TWp)
res = res+dSinTWp*g1*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TW)*Sin(TWp)
res = res+dSinTWp*g1*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TW)*Sin(TWp)
res = res-2*g1*gp*QHd*vd*Conjg(dZH(gt1,1))*Cos(TWp)*Sin(TW)*Sin(TWp)
res = res+2*g1*gp*QHu*vu*Conjg(dZH(gt1,2))*Cos(TWp)*Sin(TW)*Sin(TWp)
res = res-2*dvd*g1*gp*QHd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)*Sin(TWp)
res = res-2*dgp*g1*QHd*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)*Sin(TWp)
res = res-2*dg1*gp*QHd*vd*Conjg(ZH(gt1,1))*Cos(TWp)*Sin(TW)*Sin(TWp)
res = res+2*dvu*g1*gp*QHu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)*Sin(TWp)
res = res+2*dgp*g1*QHu*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)*Sin(TWp)
res = res+2*dg1*gp*QHu*vu*Conjg(ZH(gt1,2))*Cos(TWp)*Sin(TW)*Sin(TWp)
res = res+(dSinTWp*g1**2*vd*Conjg(ZH(gt1,1))*Sin(TW)**2*Sin(TWp))/4._dp
res = res-(dSinTWp*g2**2*vd*Conjg(ZH(gt1,1))*Sin(TW)**2*Sin(TWp))/4._dp
res = res+(dSinTWp*g1**2*vu*Conjg(ZH(gt1,2))*Sin(TW)**2*Sin(TWp))/4._dp
res = res-(dSinTWp*g2**2*vu*Conjg(ZH(gt1,2))*Sin(TW)**2*Sin(TWp))/4._dp
res = res+(g1**2*vd*Conjg(dZH(gt1,1))*Sin(TWp)**2)/8._dp
res = res+(g2**2*vd*Conjg(dZH(gt1,1))*Sin(TWp)**2)/8._dp
res = res-(gp**2*QHd**2*vd*Conjg(dZH(gt1,1))*Sin(TWp)**2)
res = res+(g1**2*vu*Conjg(dZH(gt1,2))*Sin(TWp)**2)/8._dp
res = res+(g2**2*vu*Conjg(dZH(gt1,2))*Sin(TWp)**2)/8._dp
res = res-(gp**2*QHu**2*vu*Conjg(dZH(gt1,2))*Sin(TWp)**2)
res = res-(gp**2*Qs**2*vS*Conjg(dZH(gt1,3))*Sin(TWp)**2)
res = res-(gp**2*Qs1**2*vS1*Conjg(dZH(gt1,4))*Sin(TWp)**2)
res = res-(gp**2*Qs2**2*vS2*Conjg(dZH(gt1,5))*Sin(TWp)**2)
res = res-(gp**2*Qs3**2*vS3*Conjg(dZH(gt1,6))*Sin(TWp)**2)
res = res+(dvd*g1**2*Conjg(ZH(gt1,1))*Sin(TWp)**2)/8._dp
res = res+(dvd*g2**2*Conjg(ZH(gt1,1))*Sin(TWp)**2)/8._dp
res = res-(dvd*gp**2*QHd**2*Conjg(ZH(gt1,1))*Sin(TWp)**2)
res = res+(dg1*g1*vd*Conjg(ZH(gt1,1))*Sin(TWp)**2)/4._dp
res = res+(dg2*g2*vd*Conjg(ZH(gt1,1))*Sin(TWp)**2)/4._dp
res = res-2*dgp*gp*QHd**2*vd*Conjg(ZH(gt1,1))*Sin(TWp)**2
res = res+(dvu*g1**2*Conjg(ZH(gt1,2))*Sin(TWp)**2)/8._dp
res = res+(dvu*g2**2*Conjg(ZH(gt1,2))*Sin(TWp)**2)/8._dp
res = res-(dvu*gp**2*QHu**2*Conjg(ZH(gt1,2))*Sin(TWp)**2)
res = res+(dg1*g1*vu*Conjg(ZH(gt1,2))*Sin(TWp)**2)/4._dp
res = res+(dg2*g2*vu*Conjg(ZH(gt1,2))*Sin(TWp)**2)/4._dp
res = res-2*dgp*gp*QHu**2*vu*Conjg(ZH(gt1,2))*Sin(TWp)**2
res = res-(dvS*gp**2*Qs**2*Conjg(ZH(gt1,3))*Sin(TWp)**2)
res = res-2*dgp*gp*Qs**2*vS*Conjg(ZH(gt1,3))*Sin(TWp)**2
res = res-(dvS1*gp**2*Qs1**2*Conjg(ZH(gt1,4))*Sin(TWp)**2)
res = res-2*dgp*gp*Qs1**2*vS1*Conjg(ZH(gt1,4))*Sin(TWp)**2
res = res-(dvS2*gp**2*Qs2**2*Conjg(ZH(gt1,5))*Sin(TWp)**2)
res = res-2*dgp*gp*Qs2**2*vS2*Conjg(ZH(gt1,5))*Sin(TWp)**2
res = res-(dvS3*gp**2*Qs3**2*Conjg(ZH(gt1,6))*Sin(TWp)**2)
res = res-2*dgp*gp*Qs3**2*vS3*Conjg(ZH(gt1,6))*Sin(TWp)**2
res = res-(dCosTW*g1**2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TWp)**2)/4._dp
res = res+(dSinTW*g1*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TWp)**2)/2._dp
res = res+(dCosTW*g2**2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TWp)**2)/4._dp
res = res-(dCosTW*g1**2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TWp)**2)/4._dp
res = res+(dSinTW*g1*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TWp)**2)/2._dp
res = res+(dCosTW*g2**2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TWp)**2)/4._dp
res = res-(g1**2*vd*Conjg(dZH(gt1,1))*Cos(TW)**2*Sin(TWp)**2)/8._dp
res = res+(g2**2*vd*Conjg(dZH(gt1,1))*Cos(TW)**2*Sin(TWp)**2)/8._dp
res = res-(g1**2*vu*Conjg(dZH(gt1,2))*Cos(TW)**2*Sin(TWp)**2)/8._dp
res = res+(g2**2*vu*Conjg(dZH(gt1,2))*Cos(TW)**2*Sin(TWp)**2)/8._dp
res = res-(dvd*g1**2*Conjg(ZH(gt1,1))*Cos(TW)**2*Sin(TWp)**2)/8._dp
res = res+(dvd*g2**2*Conjg(ZH(gt1,1))*Cos(TW)**2*Sin(TWp)**2)/8._dp
res = res-(dg1*g1*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Sin(TWp)**2)/4._dp
res = res+(dg2*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)**2*Sin(TWp)**2)/4._dp
res = res-(dvu*g1**2*Conjg(ZH(gt1,2))*Cos(TW)**2*Sin(TWp)**2)/8._dp
res = res+(dvu*g2**2*Conjg(ZH(gt1,2))*Cos(TW)**2*Sin(TWp)**2)/8._dp
res = res-(dg1*g1*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Sin(TWp)**2)/4._dp
res = res+(dg2*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)**2*Sin(TWp)**2)/4._dp
res = res+(dSinTW*g1**2*vd*Conjg(ZH(gt1,1))*Sin(TW)*Sin(TWp)**2)/4._dp
res = res+(dCosTW*g1*g2*vd*Conjg(ZH(gt1,1))*Sin(TW)*Sin(TWp)**2)/2._dp
res = res-(dSinTW*g2**2*vd*Conjg(ZH(gt1,1))*Sin(TW)*Sin(TWp)**2)/4._dp
res = res+(dSinTW*g1**2*vu*Conjg(ZH(gt1,2))*Sin(TW)*Sin(TWp)**2)/4._dp
res = res+(dCosTW*g1*g2*vu*Conjg(ZH(gt1,2))*Sin(TW)*Sin(TWp)**2)/2._dp
res = res-(dSinTW*g2**2*vu*Conjg(ZH(gt1,2))*Sin(TW)*Sin(TWp)**2)/4._dp
res = res+(g1*g2*vd*Conjg(dZH(gt1,1))*Cos(TW)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res+(g1*g2*vu*Conjg(dZH(gt1,2))*Cos(TW)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res+(dvd*g1*g2*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res+(dg2*g1*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res+(dg1*g2*vd*Conjg(ZH(gt1,1))*Cos(TW)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res+(dvu*g1*g2*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res+(dg2*g1*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res+(dg1*g2*vu*Conjg(ZH(gt1,2))*Cos(TW)*Sin(TW)*Sin(TWp)**2)/2._dp
res = res+(g1**2*vd*Conjg(dZH(gt1,1))*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res-(g2**2*vd*Conjg(dZH(gt1,1))*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res+(g1**2*vu*Conjg(dZH(gt1,2))*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res-(g2**2*vu*Conjg(dZH(gt1,2))*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res+(dvd*g1**2*Conjg(ZH(gt1,1))*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res-(dvd*g2**2*Conjg(ZH(gt1,1))*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res+(dg1*g1*vd*Conjg(ZH(gt1,1))*Sin(TW)**2*Sin(TWp)**2)/4._dp
res = res-(dg2*g2*vd*Conjg(ZH(gt1,1))*Sin(TW)**2*Sin(TWp)**2)/4._dp
res = res+(dvu*g1**2*Conjg(ZH(gt1,2))*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res-(dvu*g2**2*Conjg(ZH(gt1,2))*Sin(TW)**2*Sin(TWp)**2)/8._dp
res = res+(dg1*g1*vu*Conjg(ZH(gt1,2))*Sin(TW)**2*Sin(TWp)**2)/4._dp
res = res-(dg2*g2*vu*Conjg(ZH(gt1,2))*Sin(TW)**2*Sin(TWp)**2)/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhVZpVZp  
 
 
Subroutine CT_CouplingHpmcVWmVP(gt1,g1,g2,vd,vu,ZP,TW,dg1,dg2,dvd,dvu,dZP,            & 
& dSinTW,dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,vd,vu,ZP(2,2),TW,dg1,dg2,dvd,dvu,dZP(2,2),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmcVWmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*vd*Cos(TW)*dZP(gt1,1))/2._dp
res = res+(g1*g2*vu*Cos(TW)*dZP(gt1,2))/2._dp
res = res-(dCosTW*g1*g2*vd*ZP(gt1,1))/2._dp
res = res-(dvd*g1*g2*Cos(TW)*ZP(gt1,1))/2._dp
res = res-(dg2*g1*vd*Cos(TW)*ZP(gt1,1))/2._dp
res = res-(dg1*g2*vd*Cos(TW)*ZP(gt1,1))/2._dp
res = res+(dCosTW*g1*g2*vu*ZP(gt1,2))/2._dp
res = res+(dvu*g1*g2*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(dg2*g1*vu*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(dg1*g2*vu*Cos(TW)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmcVWmVP  
 
 
Subroutine CT_CouplingHpmcVWmVZ(gt1,g1,g2,gp,vd,vu,ZP,TW,TWp,dg1,dg2,dgp,             & 
& dvd,dvu,dZP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gp,vd,vu,ZP(2,2),TW,TWp,dg1,dg2,dgp,dvd,dvu,dZP(2,2),dSinTW,dCosTW,             & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmcVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*vd*Cos(TWp)*dZP(gt1,1)*Sin(TW))/2._dp
res = res-(g1*g2*vu*Cos(TWp)*dZP(gt1,2)*Sin(TW))/2._dp
res = res+g2*gp*QHd*vd*dZP(gt1,1)*Sin(TWp)
res = res+g2*gp*QHu*vu*dZP(gt1,2)*Sin(TWp)
res = res+dSinTWp*g2*gp*QHd*vd*ZP(gt1,1)
res = res+(dSinTW*g1*g2*vd*Cos(TWp)*ZP(gt1,1))/2._dp
res = res+(dCosTWp*g1*g2*vd*Sin(TW)*ZP(gt1,1))/2._dp
res = res+(dvd*g1*g2*Cos(TWp)*Sin(TW)*ZP(gt1,1))/2._dp
res = res+(dg2*g1*vd*Cos(TWp)*Sin(TW)*ZP(gt1,1))/2._dp
res = res+(dg1*g2*vd*Cos(TWp)*Sin(TW)*ZP(gt1,1))/2._dp
res = res+dvd*g2*gp*QHd*Sin(TWp)*ZP(gt1,1)
res = res+dgp*g2*QHd*vd*Sin(TWp)*ZP(gt1,1)
res = res+dg2*gp*QHd*vd*Sin(TWp)*ZP(gt1,1)
res = res+dSinTWp*g2*gp*QHu*vu*ZP(gt1,2)
res = res-(dSinTW*g1*g2*vu*Cos(TWp)*ZP(gt1,2))/2._dp
res = res-(dCosTWp*g1*g2*vu*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dvu*g1*g2*Cos(TWp)*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dg2*g1*vu*Cos(TWp)*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dg1*g2*vu*Cos(TWp)*Sin(TW)*ZP(gt1,2))/2._dp
res = res+dvu*g2*gp*QHu*Sin(TWp)*ZP(gt1,2)
res = res+dgp*g2*QHu*vu*Sin(TWp)*ZP(gt1,2)
res = res+dg2*gp*QHu*vu*Sin(TWp)*ZP(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmcVWmVZ  
 
 
Subroutine CT_CouplingHpmcVWmVZp(gt1,g1,g2,gp,vd,vu,ZP,TW,TWp,dg1,dg2,dgp,            & 
& dvd,dvu,dZP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gp,vd,vu,ZP(2,2),TW,TWp,dg1,dg2,dgp,dvd,dvu,dZP(2,2),dSinTW,dCosTW,             & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHpmcVWmVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+g2*gp*QHd*vd*Cos(TWp)*dZP(gt1,1)
res = res+g2*gp*QHu*vu*Cos(TWp)*dZP(gt1,2)
res = res-(g1*g2*vd*dZP(gt1,1)*Sin(TW)*Sin(TWp))/2._dp
res = res+(g1*g2*vu*dZP(gt1,2)*Sin(TW)*Sin(TWp))/2._dp
res = res+dCosTWp*g2*gp*QHd*vd*ZP(gt1,1)
res = res+dvd*g2*gp*QHd*Cos(TWp)*ZP(gt1,1)
res = res+dgp*g2*QHd*vd*Cos(TWp)*ZP(gt1,1)
res = res+dg2*gp*QHd*vd*Cos(TWp)*ZP(gt1,1)
res = res-(dSinTWp*g1*g2*vd*Sin(TW)*ZP(gt1,1))/2._dp
res = res-(dSinTW*g1*g2*vd*Sin(TWp)*ZP(gt1,1))/2._dp
res = res-(dvd*g1*g2*Sin(TW)*Sin(TWp)*ZP(gt1,1))/2._dp
res = res-(dg2*g1*vd*Sin(TW)*Sin(TWp)*ZP(gt1,1))/2._dp
res = res-(dg1*g2*vd*Sin(TW)*Sin(TWp)*ZP(gt1,1))/2._dp
res = res+dCosTWp*g2*gp*QHu*vu*ZP(gt1,2)
res = res+dvu*g2*gp*QHu*Cos(TWp)*ZP(gt1,2)
res = res+dgp*g2*QHu*vu*Cos(TWp)*ZP(gt1,2)
res = res+dg2*gp*QHu*vu*Cos(TWp)*ZP(gt1,2)
res = res+(dSinTWp*g1*g2*vu*Sin(TW)*ZP(gt1,2))/2._dp
res = res+(dSinTW*g1*g2*vu*Sin(TWp)*ZP(gt1,2))/2._dp
res = res+(dvu*g1*g2*Sin(TW)*Sin(TWp)*ZP(gt1,2))/2._dp
res = res+(dg2*g1*vu*Sin(TW)*Sin(TWp)*ZP(gt1,2))/2._dp
res = res+(dg1*g2*vu*Sin(TW)*Sin(TWp)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHpmcVWmVZp  
 
 
Subroutine CT_CouplingcHpmVPVWm(gt1,g1,g2,vd,vu,ZP,TW,dg1,dg2,dvd,dvu,dZP,            & 
& dSinTW,dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,vd,vu,ZP(2,2),TW,dg1,dg2,dvd,dvu,dZP(2,2),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcHpmVPVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*vd*Cos(TW)*dZP(gt1,1))/2._dp
res = res+(g1*g2*vu*Cos(TW)*dZP(gt1,2))/2._dp
res = res-(dCosTW*g1*g2*vd*ZP(gt1,1))/2._dp
res = res-(dvd*g1*g2*Cos(TW)*ZP(gt1,1))/2._dp
res = res-(dg2*g1*vd*Cos(TW)*ZP(gt1,1))/2._dp
res = res-(dg1*g2*vd*Cos(TW)*ZP(gt1,1))/2._dp
res = res+(dCosTW*g1*g2*vu*ZP(gt1,2))/2._dp
res = res+(dvu*g1*g2*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(dg2*g1*vu*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(dg1*g2*vu*Cos(TW)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcHpmVPVWm  
 
 
Subroutine CT_CouplingcHpmVWmVZ(gt1,g1,g2,gp,vd,vu,ZP,TW,TWp,dg1,dg2,dgp,             & 
& dvd,dvu,dZP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gp,vd,vu,ZP(2,2),TW,TWp,dg1,dg2,dgp,dvd,dvu,dZP(2,2),dSinTW,dCosTW,             & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcHpmVWmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*vd*Cos(TWp)*dZP(gt1,1)*Sin(TW))/2._dp
res = res-(g1*g2*vu*Cos(TWp)*dZP(gt1,2)*Sin(TW))/2._dp
res = res+g2*gp*QHd*vd*dZP(gt1,1)*Sin(TWp)
res = res+g2*gp*QHu*vu*dZP(gt1,2)*Sin(TWp)
res = res+dSinTWp*g2*gp*QHd*vd*ZP(gt1,1)
res = res+(dSinTW*g1*g2*vd*Cos(TWp)*ZP(gt1,1))/2._dp
res = res+(dCosTWp*g1*g2*vd*Sin(TW)*ZP(gt1,1))/2._dp
res = res+(dvd*g1*g2*Cos(TWp)*Sin(TW)*ZP(gt1,1))/2._dp
res = res+(dg2*g1*vd*Cos(TWp)*Sin(TW)*ZP(gt1,1))/2._dp
res = res+(dg1*g2*vd*Cos(TWp)*Sin(TW)*ZP(gt1,1))/2._dp
res = res+dvd*g2*gp*QHd*Sin(TWp)*ZP(gt1,1)
res = res+dgp*g2*QHd*vd*Sin(TWp)*ZP(gt1,1)
res = res+dg2*gp*QHd*vd*Sin(TWp)*ZP(gt1,1)
res = res+dSinTWp*g2*gp*QHu*vu*ZP(gt1,2)
res = res-(dSinTW*g1*g2*vu*Cos(TWp)*ZP(gt1,2))/2._dp
res = res-(dCosTWp*g1*g2*vu*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dvu*g1*g2*Cos(TWp)*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dg2*g1*vu*Cos(TWp)*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dg1*g2*vu*Cos(TWp)*Sin(TW)*ZP(gt1,2))/2._dp
res = res+dvu*g2*gp*QHu*Sin(TWp)*ZP(gt1,2)
res = res+dgp*g2*QHu*vu*Sin(TWp)*ZP(gt1,2)
res = res+dg2*gp*QHu*vu*Sin(TWp)*ZP(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcHpmVWmVZ  
 
 
Subroutine CT_CouplingcHpmVWmVZp(gt1,g1,g2,gp,vd,vu,ZP,TW,TWp,dg1,dg2,dgp,            & 
& dvd,dvu,dZP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,gp,vd,vu,ZP(2,2),TW,TWp,dg1,dg2,dgp,dvd,dvu,dZP(2,2),dSinTW,dCosTW,             & 
& dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcHpmVWmVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+g2*gp*QHd*vd*Cos(TWp)*dZP(gt1,1)
res = res+g2*gp*QHu*vu*Cos(TWp)*dZP(gt1,2)
res = res-(g1*g2*vd*dZP(gt1,1)*Sin(TW)*Sin(TWp))/2._dp
res = res+(g1*g2*vu*dZP(gt1,2)*Sin(TW)*Sin(TWp))/2._dp
res = res+dCosTWp*g2*gp*QHd*vd*ZP(gt1,1)
res = res+dvd*g2*gp*QHd*Cos(TWp)*ZP(gt1,1)
res = res+dgp*g2*QHd*vd*Cos(TWp)*ZP(gt1,1)
res = res+dg2*gp*QHd*vd*Cos(TWp)*ZP(gt1,1)
res = res-(dSinTWp*g1*g2*vd*Sin(TW)*ZP(gt1,1))/2._dp
res = res-(dSinTW*g1*g2*vd*Sin(TWp)*ZP(gt1,1))/2._dp
res = res-(dvd*g1*g2*Sin(TW)*Sin(TWp)*ZP(gt1,1))/2._dp
res = res-(dg2*g1*vd*Sin(TW)*Sin(TWp)*ZP(gt1,1))/2._dp
res = res-(dg1*g2*vd*Sin(TW)*Sin(TWp)*ZP(gt1,1))/2._dp
res = res+dCosTWp*g2*gp*QHu*vu*ZP(gt1,2)
res = res+dvu*g2*gp*QHu*Cos(TWp)*ZP(gt1,2)
res = res+dgp*g2*QHu*vu*Cos(TWp)*ZP(gt1,2)
res = res+dg2*gp*QHu*vu*Cos(TWp)*ZP(gt1,2)
res = res+(dSinTWp*g1*g2*vu*Sin(TW)*ZP(gt1,2))/2._dp
res = res+(dSinTW*g1*g2*vu*Sin(TWp)*ZP(gt1,2))/2._dp
res = res+(dvu*g1*g2*Sin(TW)*Sin(TWp)*ZP(gt1,2))/2._dp
res = res+(dg2*g1*vu*Sin(TW)*Sin(TWp)*ZP(gt1,2))/2._dp
res = res+(dg1*g2*vu*Sin(TW)*Sin(TWp)*ZP(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcHpmVWmVZp  
 
 
Subroutine CT_CouplingVGVGVG(g3,dg3,res)

Implicit None 

Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingVGVGVG' 
 
res = 0._dp 
res = res+dg3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingVGVGVG  
 
 
Subroutine CT_CouplingcVWmVPVWm(g2,TW,dg2,dSinTW,dCosTW,dTanTW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcVWmVPVWm' 
 
res = 0._dp 
res = res+dSinTW*g2
res = res+dg2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcVWmVPVWm  
 
 
Subroutine CT_CouplingcVWmVWmVZ(g2,TW,TWp,dg2,dSinTW,dCosTW,dTanTW,dSinTWp,           & 
& dCosTWp,dTanTWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp,dg2,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcVWmVWmVZ' 
 
res = 0._dp 
res = res-(dCosTWp*g2*Cos(TW))
res = res-(dCosTW*g2*Cos(TWp))
res = res-(dg2*Cos(TW)*Cos(TWp))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcVWmVWmVZ  
 
 
Subroutine CT_CouplingcVWmVWmVZp(g2,TW,TWp,dg2,dSinTW,dCosTW,dTanTW,dSinTWp,          & 
& dCosTWp,dTanTWp,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,TWp,dg2,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcVWmVWmVZp' 
 
res = 0._dp 
res = res+dSinTWp*g2*Cos(TW)
res = res+dCosTW*g2*Sin(TWp)
res = res+dg2*Cos(TW)*Sin(TWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcVWmVWmVZp  
 
 
Subroutine CT_CouplingcChaChaAh(gt1,gt2,gt3,g2,lam,ZA,UM,UP,dg2,dlam,dZA,             & 
& dUM,dUP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: lam,ZA(6,6),UM(2,2),UP(2,2),dlam,dZA(6,6),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaChaAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-((g2*Conjg(dZA(gt3,1))*Conjg(UM(gt2,2))*Conjg(UP(gt1,1)))/sqrt(2._dp))
resL = resL-((g2*Conjg(dZA(gt3,2))*Conjg(UM(gt2,1))*Conjg(UP(gt1,2)))/sqrt(2._dp))
resL = resL+(lam*Conjg(dZA(gt3,3))*Conjg(UM(gt2,2))*Conjg(UP(gt1,2)))/sqrt(2._dp)
resL = resL-((g2*Conjg(dUP(gt1,1))*Conjg(UM(gt2,2))*Conjg(ZA(gt3,1)))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUM(gt2,2))*Conjg(UP(gt1,1))*Conjg(ZA(gt3,1)))/sqrt(2._dp))
resL = resL-((dg2*Conjg(UM(gt2,2))*Conjg(UP(gt1,1))*Conjg(ZA(gt3,1)))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUP(gt1,2))*Conjg(UM(gt2,1))*Conjg(ZA(gt3,2)))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUM(gt2,1))*Conjg(UP(gt1,2))*Conjg(ZA(gt3,2)))/sqrt(2._dp))
resL = resL-((dg2*Conjg(UM(gt2,1))*Conjg(UP(gt1,2))*Conjg(ZA(gt3,2)))/sqrt(2._dp))
resL = resL+(lam*Conjg(dUP(gt1,2))*Conjg(UM(gt2,2))*Conjg(ZA(gt3,3)))/sqrt(2._dp)
resL = resL+(lam*Conjg(dUM(gt2,2))*Conjg(UP(gt1,2))*Conjg(ZA(gt3,3)))/sqrt(2._dp)
resL = resL+(dlam*Conjg(UM(gt2,2))*Conjg(UP(gt1,2))*Conjg(ZA(gt3,3)))/sqrt(2._dp)
resR = 0._dp 
resR = resR+(g2*Conjg(ZA(gt3,2))*dUP(gt2,2)*UM(gt1,1))/sqrt(2._dp)
resR = resR+(g2*Conjg(ZA(gt3,1))*dUP(gt2,1)*UM(gt1,2))/sqrt(2._dp)
resR = resR-((Conjg(lam)*Conjg(ZA(gt3,3))*dUP(gt2,2)*UM(gt1,2))/sqrt(2._dp))
resR = resR+(g2*Conjg(ZA(gt3,1))*dUM(gt1,2)*UP(gt2,1))/sqrt(2._dp)
resR = resR+(g2*Conjg(dZA(gt3,1))*UM(gt1,2)*UP(gt2,1))/sqrt(2._dp)
resR = resR+(dg2*Conjg(ZA(gt3,1))*UM(gt1,2)*UP(gt2,1))/sqrt(2._dp)
resR = resR+(g2*Conjg(ZA(gt3,2))*dUM(gt1,1)*UP(gt2,2))/sqrt(2._dp)
resR = resR-((Conjg(lam)*Conjg(ZA(gt3,3))*dUM(gt1,2)*UP(gt2,2))/sqrt(2._dp))
resR = resR+(g2*Conjg(dZA(gt3,2))*UM(gt1,1)*UP(gt2,2))/sqrt(2._dp)
resR = resR+(dg2*Conjg(ZA(gt3,2))*UM(gt1,1)*UP(gt2,2))/sqrt(2._dp)
resR = resR-((Conjg(lam)*Conjg(dZA(gt3,3))*UM(gt1,2)*UP(gt2,2))/sqrt(2._dp))
resR = resR-((Conjg(dlam)*Conjg(ZA(gt3,3))*UM(gt1,2)*UP(gt2,2))/sqrt(2._dp))
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaChaAh  
 
 
Subroutine CT_CouplingChiChiAh(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZA,ZN,dg1,dg2,            & 
& dgp,dlam,dkap,dZA,dZN,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gp,dg1,dg2,dgp

Complex(dp), Intent(in) :: lam,kap,ZA(6,6),ZN(9,9),dlam,dkap,dZA(6,6),dZN(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiChiAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(gp*QHd*Conjg(dZN(gt2,4))*Conjg(ZA(gt3,1))*Conjg(ZN(gt1,1)))
resL = resL-(gp*QHu*Conjg(dZN(gt2,5))*Conjg(ZA(gt3,2))*Conjg(ZN(gt1,1)))
resL = resL-(gp*Qs*Conjg(dZN(gt2,6))*Conjg(ZA(gt3,3))*Conjg(ZN(gt1,1)))
resL = resL-(gp*Qs1*Conjg(dZN(gt2,7))*Conjg(ZA(gt3,4))*Conjg(ZN(gt1,1)))
resL = resL-(gp*Qs2*Conjg(dZN(gt2,8))*Conjg(ZA(gt3,5))*Conjg(ZN(gt1,1)))
resL = resL-(gp*Qs3*Conjg(dZN(gt2,9))*Conjg(ZA(gt3,6))*Conjg(ZN(gt1,1)))
resL = resL+(g1*Conjg(dZN(gt2,4))*Conjg(ZA(gt3,1))*Conjg(ZN(gt1,2)))/2._dp
resL = resL-(g1*Conjg(dZN(gt2,5))*Conjg(ZA(gt3,2))*Conjg(ZN(gt1,2)))/2._dp
resL = resL-(g2*Conjg(dZN(gt2,4))*Conjg(ZA(gt3,1))*Conjg(ZN(gt1,3)))/2._dp
resL = resL+(g2*Conjg(dZN(gt2,5))*Conjg(ZA(gt3,2))*Conjg(ZN(gt1,3)))/2._dp
resL = resL-(gp*QHd*Conjg(dZN(gt2,1))*Conjg(ZA(gt3,1))*Conjg(ZN(gt1,4)))
resL = resL+(g1*Conjg(dZN(gt2,2))*Conjg(ZA(gt3,1))*Conjg(ZN(gt1,4)))/2._dp
resL = resL-(g2*Conjg(dZN(gt2,3))*Conjg(ZA(gt3,1))*Conjg(ZN(gt1,4)))/2._dp
resL = resL-((lam*Conjg(dZN(gt2,6))*Conjg(ZA(gt3,2))*Conjg(ZN(gt1,4)))/sqrt(2._dp))
resL = resL-((lam*Conjg(dZN(gt2,5))*Conjg(ZA(gt3,3))*Conjg(ZN(gt1,4)))/sqrt(2._dp))
resL = resL-((lam*Conjg(dZN(gt2,6))*Conjg(ZA(gt3,1))*Conjg(ZN(gt1,5)))/sqrt(2._dp))
resL = resL-(gp*QHu*Conjg(dZN(gt2,1))*Conjg(ZA(gt3,2))*Conjg(ZN(gt1,5)))
resL = resL-(g1*Conjg(dZN(gt2,2))*Conjg(ZA(gt3,2))*Conjg(ZN(gt1,5)))/2._dp
resL = resL+(g2*Conjg(dZN(gt2,3))*Conjg(ZA(gt3,2))*Conjg(ZN(gt1,5)))/2._dp
resL = resL-((lam*Conjg(dZN(gt2,4))*Conjg(ZA(gt3,3))*Conjg(ZN(gt1,5)))/sqrt(2._dp))
resL = resL-((lam*Conjg(dZN(gt2,5))*Conjg(ZA(gt3,1))*Conjg(ZN(gt1,6)))/sqrt(2._dp))
resL = resL-((lam*Conjg(dZN(gt2,4))*Conjg(ZA(gt3,2))*Conjg(ZN(gt1,6)))/sqrt(2._dp))
resL = resL-(gp*Qs*Conjg(dZN(gt2,1))*Conjg(ZA(gt3,3))*Conjg(ZN(gt1,6)))
resL = resL-(gp*Qs1*Conjg(dZN(gt2,1))*Conjg(ZA(gt3,4))*Conjg(ZN(gt1,7)))
resL = resL+(kap*Conjg(dZN(gt2,9))*Conjg(ZA(gt3,5))*Conjg(ZN(gt1,7)))/(3._dp*sqrt(2._dp))
resL = resL+(kap*Conjg(dZN(gt2,8))*Conjg(ZA(gt3,6))*Conjg(ZN(gt1,7)))/(3._dp*sqrt(2._dp))
resL = resL+(kap*Conjg(dZN(gt2,9))*Conjg(ZA(gt3,4))*Conjg(ZN(gt1,8)))/(3._dp*sqrt(2._dp))
resL = resL-(gp*Qs2*Conjg(dZN(gt2,1))*Conjg(ZA(gt3,5))*Conjg(ZN(gt1,8)))
resL = resL+(kap*Conjg(dZN(gt2,7))*Conjg(ZA(gt3,6))*Conjg(ZN(gt1,8)))/(3._dp*sqrt(2._dp))
resL = resL+(kap*Conjg(dZN(gt2,8))*Conjg(ZA(gt3,4))*Conjg(ZN(gt1,9)))/(3._dp*sqrt(2._dp))
resL = resL+(kap*Conjg(dZN(gt2,7))*Conjg(ZA(gt3,5))*Conjg(ZN(gt1,9)))/(3._dp*sqrt(2._dp))
resL = resL-(gp*Qs3*Conjg(dZN(gt2,1))*Conjg(ZA(gt3,6))*Conjg(ZN(gt1,9)))
resL = resL-(gp*QHd*Conjg(dZN(gt1,4))*Conjg(ZA(gt3,1))*Conjg(ZN(gt2,1)))
resL = resL-(gp*QHu*Conjg(dZN(gt1,5))*Conjg(ZA(gt3,2))*Conjg(ZN(gt2,1)))
resL = resL-(gp*Qs*Conjg(dZN(gt1,6))*Conjg(ZA(gt3,3))*Conjg(ZN(gt2,1)))
resL = resL-(gp*Qs1*Conjg(dZN(gt1,7))*Conjg(ZA(gt3,4))*Conjg(ZN(gt2,1)))
resL = resL-(gp*Qs2*Conjg(dZN(gt1,8))*Conjg(ZA(gt3,5))*Conjg(ZN(gt2,1)))
resL = resL-(gp*Qs3*Conjg(dZN(gt1,9))*Conjg(ZA(gt3,6))*Conjg(ZN(gt2,1)))
resL = resL-(gp*QHd*Conjg(dZA(gt3,1))*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,1)))
resL = resL-(dgp*QHd*Conjg(ZA(gt3,1))*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,1)))
resL = resL-(gp*QHu*Conjg(dZA(gt3,2))*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,1)))
resL = resL-(dgp*QHu*Conjg(ZA(gt3,2))*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,1)))
resL = resL-(gp*Qs*Conjg(dZA(gt3,3))*Conjg(ZN(gt1,6))*Conjg(ZN(gt2,1)))
resL = resL-(dgp*Qs*Conjg(ZA(gt3,3))*Conjg(ZN(gt1,6))*Conjg(ZN(gt2,1)))
resL = resL-(gp*Qs1*Conjg(dZA(gt3,4))*Conjg(ZN(gt1,7))*Conjg(ZN(gt2,1)))
resL = resL-(dgp*Qs1*Conjg(ZA(gt3,4))*Conjg(ZN(gt1,7))*Conjg(ZN(gt2,1)))
resL = resL-(gp*Qs2*Conjg(dZA(gt3,5))*Conjg(ZN(gt1,8))*Conjg(ZN(gt2,1)))
resL = resL-(dgp*Qs2*Conjg(ZA(gt3,5))*Conjg(ZN(gt1,8))*Conjg(ZN(gt2,1)))
resL = resL-(gp*Qs3*Conjg(dZA(gt3,6))*Conjg(ZN(gt1,9))*Conjg(ZN(gt2,1)))
resL = resL-(dgp*Qs3*Conjg(ZA(gt3,6))*Conjg(ZN(gt1,9))*Conjg(ZN(gt2,1)))
resL = resL+(g1*Conjg(dZN(gt1,4))*Conjg(ZA(gt3,1))*Conjg(ZN(gt2,2)))/2._dp
resL = resL-(g1*Conjg(dZN(gt1,5))*Conjg(ZA(gt3,2))*Conjg(ZN(gt2,2)))/2._dp
resL = resL+(g1*Conjg(dZA(gt3,1))*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,2)))/2._dp
resL = resL+(dg1*Conjg(ZA(gt3,1))*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,2)))/2._dp
resL = resL-(g1*Conjg(dZA(gt3,2))*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,2)))/2._dp
resL = resL-(dg1*Conjg(ZA(gt3,2))*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,2)))/2._dp
resL = resL-(g2*Conjg(dZN(gt1,4))*Conjg(ZA(gt3,1))*Conjg(ZN(gt2,3)))/2._dp
resL = resL+(g2*Conjg(dZN(gt1,5))*Conjg(ZA(gt3,2))*Conjg(ZN(gt2,3)))/2._dp
resL = resL-(g2*Conjg(dZA(gt3,1))*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,3)))/2._dp
resL = resL-(dg2*Conjg(ZA(gt3,1))*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,3)))/2._dp
resL = resL+(g2*Conjg(dZA(gt3,2))*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,3)))/2._dp
resL = resL+(dg2*Conjg(ZA(gt3,2))*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,3)))/2._dp
resL = resL-(gp*QHd*Conjg(dZN(gt1,1))*Conjg(ZA(gt3,1))*Conjg(ZN(gt2,4)))
resL = resL+(g1*Conjg(dZN(gt1,2))*Conjg(ZA(gt3,1))*Conjg(ZN(gt2,4)))/2._dp
resL = resL-(g2*Conjg(dZN(gt1,3))*Conjg(ZA(gt3,1))*Conjg(ZN(gt2,4)))/2._dp
resL = resL-((lam*Conjg(dZN(gt1,6))*Conjg(ZA(gt3,2))*Conjg(ZN(gt2,4)))/sqrt(2._dp))
resL = resL-((lam*Conjg(dZN(gt1,5))*Conjg(ZA(gt3,3))*Conjg(ZN(gt2,4)))/sqrt(2._dp))
resL = resL-(gp*QHd*Conjg(dZA(gt3,1))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,4)))
resL = resL-(dgp*QHd*Conjg(ZA(gt3,1))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,4)))
resL = resL+(g1*Conjg(dZA(gt3,1))*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,4)))/2._dp
resL = resL+(dg1*Conjg(ZA(gt3,1))*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,4)))/2._dp
resL = resL-(g2*Conjg(dZA(gt3,1))*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,4)))/2._dp
resL = resL-(dg2*Conjg(ZA(gt3,1))*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,4)))/2._dp
resL = resL-((lam*Conjg(dZA(gt3,3))*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,4)))/sqrt(2._dp))
resL = resL-((dlam*Conjg(ZA(gt3,3))*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,4)))/sqrt(2._dp))
resL = resL-((lam*Conjg(dZA(gt3,2))*Conjg(ZN(gt1,6))*Conjg(ZN(gt2,4)))/sqrt(2._dp))
resL = resL-((dlam*Conjg(ZA(gt3,2))*Conjg(ZN(gt1,6))*Conjg(ZN(gt2,4)))/sqrt(2._dp))
resL = resL-((lam*Conjg(dZN(gt1,6))*Conjg(ZA(gt3,1))*Conjg(ZN(gt2,5)))/sqrt(2._dp))
resL = resL-(gp*QHu*Conjg(dZN(gt1,1))*Conjg(ZA(gt3,2))*Conjg(ZN(gt2,5)))
resL = resL-(g1*Conjg(dZN(gt1,2))*Conjg(ZA(gt3,2))*Conjg(ZN(gt2,5)))/2._dp
resL = resL+(g2*Conjg(dZN(gt1,3))*Conjg(ZA(gt3,2))*Conjg(ZN(gt2,5)))/2._dp
resL = resL-((lam*Conjg(dZN(gt1,4))*Conjg(ZA(gt3,3))*Conjg(ZN(gt2,5)))/sqrt(2._dp))
resL = resL-(gp*QHu*Conjg(dZA(gt3,2))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,5)))
resL = resL-(dgp*QHu*Conjg(ZA(gt3,2))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,5)))
resL = resL-(g1*Conjg(dZA(gt3,2))*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,5)))/2._dp
resL = resL-(dg1*Conjg(ZA(gt3,2))*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,5)))/2._dp
resL = resL+(g2*Conjg(dZA(gt3,2))*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,5)))/2._dp
resL = resL+(dg2*Conjg(ZA(gt3,2))*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,5)))/2._dp
resL = resL-((lam*Conjg(dZA(gt3,3))*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,5)))/sqrt(2._dp))
resL = resL-((dlam*Conjg(ZA(gt3,3))*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,5)))/sqrt(2._dp))
resL = resL-((lam*Conjg(dZA(gt3,1))*Conjg(ZN(gt1,6))*Conjg(ZN(gt2,5)))/sqrt(2._dp))
resL = resL-((dlam*Conjg(ZA(gt3,1))*Conjg(ZN(gt1,6))*Conjg(ZN(gt2,5)))/sqrt(2._dp))
resL = resL-((lam*Conjg(dZN(gt1,5))*Conjg(ZA(gt3,1))*Conjg(ZN(gt2,6)))/sqrt(2._dp))
resL = resL-((lam*Conjg(dZN(gt1,4))*Conjg(ZA(gt3,2))*Conjg(ZN(gt2,6)))/sqrt(2._dp))
resL = resL-(gp*Qs*Conjg(dZN(gt1,1))*Conjg(ZA(gt3,3))*Conjg(ZN(gt2,6)))
resL = resL-(gp*Qs*Conjg(dZA(gt3,3))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,6)))
resL = resL-(dgp*Qs*Conjg(ZA(gt3,3))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,6)))
resL = resL-((lam*Conjg(dZA(gt3,2))*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,6)))/sqrt(2._dp))
resL = resL-((dlam*Conjg(ZA(gt3,2))*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,6)))/sqrt(2._dp))
resL = resL-((lam*Conjg(dZA(gt3,1))*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,6)))/sqrt(2._dp))
resL = resL-((dlam*Conjg(ZA(gt3,1))*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,6)))/sqrt(2._dp))
resL = resL-(gp*Qs1*Conjg(dZN(gt1,1))*Conjg(ZA(gt3,4))*Conjg(ZN(gt2,7)))
resL = resL+(kap*Conjg(dZN(gt1,9))*Conjg(ZA(gt3,5))*Conjg(ZN(gt2,7)))/(3._dp*sqrt(2._dp))
resL = resL+(kap*Conjg(dZN(gt1,8))*Conjg(ZA(gt3,6))*Conjg(ZN(gt2,7)))/(3._dp*sqrt(2._dp))
resL = resL-(gp*Qs1*Conjg(dZA(gt3,4))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,7)))
resL = resL-(dgp*Qs1*Conjg(ZA(gt3,4))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,7)))
resL = resL+(kap*Conjg(dZA(gt3,6))*Conjg(ZN(gt1,8))*Conjg(ZN(gt2,7)))/(3._dp*sqrt(2._dp))
resL = resL+(dkap*Conjg(ZA(gt3,6))*Conjg(ZN(gt1,8))*Conjg(ZN(gt2,7)))/(3._dp*sqrt(2._dp))
resL = resL+(kap*Conjg(dZA(gt3,5))*Conjg(ZN(gt1,9))*Conjg(ZN(gt2,7)))/(3._dp*sqrt(2._dp))
resL = resL+(dkap*Conjg(ZA(gt3,5))*Conjg(ZN(gt1,9))*Conjg(ZN(gt2,7)))/(3._dp*sqrt(2._dp))
resL = resL+(kap*Conjg(dZN(gt1,9))*Conjg(ZA(gt3,4))*Conjg(ZN(gt2,8)))/(3._dp*sqrt(2._dp))
resL = resL-(gp*Qs2*Conjg(dZN(gt1,1))*Conjg(ZA(gt3,5))*Conjg(ZN(gt2,8)))
resL = resL+(kap*Conjg(dZN(gt1,7))*Conjg(ZA(gt3,6))*Conjg(ZN(gt2,8)))/(3._dp*sqrt(2._dp))
resL = resL-(gp*Qs2*Conjg(dZA(gt3,5))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,8)))
resL = resL-(dgp*Qs2*Conjg(ZA(gt3,5))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,8)))
resL = resL+(kap*Conjg(dZA(gt3,6))*Conjg(ZN(gt1,7))*Conjg(ZN(gt2,8)))/(3._dp*sqrt(2._dp))
resL = resL+(dkap*Conjg(ZA(gt3,6))*Conjg(ZN(gt1,7))*Conjg(ZN(gt2,8)))/(3._dp*sqrt(2._dp))
resL = resL+(kap*Conjg(dZA(gt3,4))*Conjg(ZN(gt1,9))*Conjg(ZN(gt2,8)))/(3._dp*sqrt(2._dp))
resL = resL+(dkap*Conjg(ZA(gt3,4))*Conjg(ZN(gt1,9))*Conjg(ZN(gt2,8)))/(3._dp*sqrt(2._dp))
resL = resL+(kap*Conjg(dZN(gt1,8))*Conjg(ZA(gt3,4))*Conjg(ZN(gt2,9)))/(3._dp*sqrt(2._dp))
resL = resL+(kap*Conjg(dZN(gt1,7))*Conjg(ZA(gt3,5))*Conjg(ZN(gt2,9)))/(3._dp*sqrt(2._dp))
resL = resL-(gp*Qs3*Conjg(dZN(gt1,1))*Conjg(ZA(gt3,6))*Conjg(ZN(gt2,9)))
resL = resL-(gp*Qs3*Conjg(dZA(gt3,6))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,9)))
resL = resL-(dgp*Qs3*Conjg(ZA(gt3,6))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,9)))
resL = resL+(kap*Conjg(dZA(gt3,5))*Conjg(ZN(gt1,7))*Conjg(ZN(gt2,9)))/(3._dp*sqrt(2._dp))
resL = resL+(dkap*Conjg(ZA(gt3,5))*Conjg(ZN(gt1,7))*Conjg(ZN(gt2,9)))/(3._dp*sqrt(2._dp))
resL = resL+(kap*Conjg(dZA(gt3,4))*Conjg(ZN(gt1,8))*Conjg(ZN(gt2,9)))/(3._dp*sqrt(2._dp))
resL = resL+(dkap*Conjg(ZA(gt3,4))*Conjg(ZN(gt1,8))*Conjg(ZN(gt2,9)))/(3._dp*sqrt(2._dp))
resR = 0._dp 
resR = resR+gp*QHd*Conjg(ZA(gt3,1))*dZN(gt2,4)*ZN(gt1,1)
resR = resR+gp*QHu*Conjg(ZA(gt3,2))*dZN(gt2,5)*ZN(gt1,1)
resR = resR+gp*Qs*Conjg(ZA(gt3,3))*dZN(gt2,6)*ZN(gt1,1)
resR = resR+gp*Qs1*Conjg(ZA(gt3,4))*dZN(gt2,7)*ZN(gt1,1)
resR = resR+gp*Qs2*Conjg(ZA(gt3,5))*dZN(gt2,8)*ZN(gt1,1)
resR = resR+gp*Qs3*Conjg(ZA(gt3,6))*dZN(gt2,9)*ZN(gt1,1)
resR = resR-(g1*Conjg(ZA(gt3,1))*dZN(gt2,4)*ZN(gt1,2))/2._dp
resR = resR+(g1*Conjg(ZA(gt3,2))*dZN(gt2,5)*ZN(gt1,2))/2._dp
resR = resR+(g2*Conjg(ZA(gt3,1))*dZN(gt2,4)*ZN(gt1,3))/2._dp
resR = resR-(g2*Conjg(ZA(gt3,2))*dZN(gt2,5)*ZN(gt1,3))/2._dp
resR = resR+gp*QHd*Conjg(ZA(gt3,1))*dZN(gt2,1)*ZN(gt1,4)
resR = resR-(g1*Conjg(ZA(gt3,1))*dZN(gt2,2)*ZN(gt1,4))/2._dp
resR = resR+(g2*Conjg(ZA(gt3,1))*dZN(gt2,3)*ZN(gt1,4))/2._dp
resR = resR+(Conjg(lam)*Conjg(ZA(gt3,3))*dZN(gt2,5)*ZN(gt1,4))/sqrt(2._dp)
resR = resR+(Conjg(lam)*Conjg(ZA(gt3,2))*dZN(gt2,6)*ZN(gt1,4))/sqrt(2._dp)
resR = resR+gp*QHu*Conjg(ZA(gt3,2))*dZN(gt2,1)*ZN(gt1,5)
resR = resR+(g1*Conjg(ZA(gt3,2))*dZN(gt2,2)*ZN(gt1,5))/2._dp
resR = resR-(g2*Conjg(ZA(gt3,2))*dZN(gt2,3)*ZN(gt1,5))/2._dp
resR = resR+(Conjg(lam)*Conjg(ZA(gt3,3))*dZN(gt2,4)*ZN(gt1,5))/sqrt(2._dp)
resR = resR+(Conjg(lam)*Conjg(ZA(gt3,1))*dZN(gt2,6)*ZN(gt1,5))/sqrt(2._dp)
resR = resR+gp*Qs*Conjg(ZA(gt3,3))*dZN(gt2,1)*ZN(gt1,6)
resR = resR+(Conjg(lam)*Conjg(ZA(gt3,2))*dZN(gt2,4)*ZN(gt1,6))/sqrt(2._dp)
resR = resR+(Conjg(lam)*Conjg(ZA(gt3,1))*dZN(gt2,5)*ZN(gt1,6))/sqrt(2._dp)
resR = resR+gp*Qs1*Conjg(ZA(gt3,4))*dZN(gt2,1)*ZN(gt1,7)
resR = resR-(Conjg(kap)*Conjg(ZA(gt3,6))*dZN(gt2,8)*ZN(gt1,7))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(kap)*Conjg(ZA(gt3,5))*dZN(gt2,9)*ZN(gt1,7))/(3._dp*sqrt(2._dp))
resR = resR+gp*Qs2*Conjg(ZA(gt3,5))*dZN(gt2,1)*ZN(gt1,8)
resR = resR-(Conjg(kap)*Conjg(ZA(gt3,6))*dZN(gt2,7)*ZN(gt1,8))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(kap)*Conjg(ZA(gt3,4))*dZN(gt2,9)*ZN(gt1,8))/(3._dp*sqrt(2._dp))
resR = resR+gp*Qs3*Conjg(ZA(gt3,6))*dZN(gt2,1)*ZN(gt1,9)
resR = resR-(Conjg(kap)*Conjg(ZA(gt3,5))*dZN(gt2,7)*ZN(gt1,9))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(kap)*Conjg(ZA(gt3,4))*dZN(gt2,8)*ZN(gt1,9))/(3._dp*sqrt(2._dp))
resR = resR+gp*QHd*Conjg(ZA(gt3,1))*dZN(gt1,4)*ZN(gt2,1)
resR = resR+gp*QHu*Conjg(ZA(gt3,2))*dZN(gt1,5)*ZN(gt2,1)
resR = resR+gp*Qs*Conjg(ZA(gt3,3))*dZN(gt1,6)*ZN(gt2,1)
resR = resR+gp*Qs1*Conjg(ZA(gt3,4))*dZN(gt1,7)*ZN(gt2,1)
resR = resR+gp*Qs2*Conjg(ZA(gt3,5))*dZN(gt1,8)*ZN(gt2,1)
resR = resR+gp*Qs3*Conjg(ZA(gt3,6))*dZN(gt1,9)*ZN(gt2,1)
resR = resR+gp*QHd*Conjg(dZA(gt3,1))*ZN(gt1,4)*ZN(gt2,1)
resR = resR+dgp*QHd*Conjg(ZA(gt3,1))*ZN(gt1,4)*ZN(gt2,1)
resR = resR+gp*QHu*Conjg(dZA(gt3,2))*ZN(gt1,5)*ZN(gt2,1)
resR = resR+dgp*QHu*Conjg(ZA(gt3,2))*ZN(gt1,5)*ZN(gt2,1)
resR = resR+gp*Qs*Conjg(dZA(gt3,3))*ZN(gt1,6)*ZN(gt2,1)
resR = resR+dgp*Qs*Conjg(ZA(gt3,3))*ZN(gt1,6)*ZN(gt2,1)
resR = resR+gp*Qs1*Conjg(dZA(gt3,4))*ZN(gt1,7)*ZN(gt2,1)
resR = resR+dgp*Qs1*Conjg(ZA(gt3,4))*ZN(gt1,7)*ZN(gt2,1)
resR = resR+gp*Qs2*Conjg(dZA(gt3,5))*ZN(gt1,8)*ZN(gt2,1)
resR = resR+dgp*Qs2*Conjg(ZA(gt3,5))*ZN(gt1,8)*ZN(gt2,1)
resR = resR+gp*Qs3*Conjg(dZA(gt3,6))*ZN(gt1,9)*ZN(gt2,1)
resR = resR+dgp*Qs3*Conjg(ZA(gt3,6))*ZN(gt1,9)*ZN(gt2,1)
resR = resR-(g1*Conjg(ZA(gt3,1))*dZN(gt1,4)*ZN(gt2,2))/2._dp
resR = resR+(g1*Conjg(ZA(gt3,2))*dZN(gt1,5)*ZN(gt2,2))/2._dp
resR = resR-(g1*Conjg(dZA(gt3,1))*ZN(gt1,4)*ZN(gt2,2))/2._dp
resR = resR-(dg1*Conjg(ZA(gt3,1))*ZN(gt1,4)*ZN(gt2,2))/2._dp
resR = resR+(g1*Conjg(dZA(gt3,2))*ZN(gt1,5)*ZN(gt2,2))/2._dp
resR = resR+(dg1*Conjg(ZA(gt3,2))*ZN(gt1,5)*ZN(gt2,2))/2._dp
resR = resR+(g2*Conjg(ZA(gt3,1))*dZN(gt1,4)*ZN(gt2,3))/2._dp
resR = resR-(g2*Conjg(ZA(gt3,2))*dZN(gt1,5)*ZN(gt2,3))/2._dp
resR = resR+(g2*Conjg(dZA(gt3,1))*ZN(gt1,4)*ZN(gt2,3))/2._dp
resR = resR+(dg2*Conjg(ZA(gt3,1))*ZN(gt1,4)*ZN(gt2,3))/2._dp
resR = resR-(g2*Conjg(dZA(gt3,2))*ZN(gt1,5)*ZN(gt2,3))/2._dp
resR = resR-(dg2*Conjg(ZA(gt3,2))*ZN(gt1,5)*ZN(gt2,3))/2._dp
resR = resR+gp*QHd*Conjg(ZA(gt3,1))*dZN(gt1,1)*ZN(gt2,4)
resR = resR-(g1*Conjg(ZA(gt3,1))*dZN(gt1,2)*ZN(gt2,4))/2._dp
resR = resR+(g2*Conjg(ZA(gt3,1))*dZN(gt1,3)*ZN(gt2,4))/2._dp
resR = resR+(Conjg(lam)*Conjg(ZA(gt3,3))*dZN(gt1,5)*ZN(gt2,4))/sqrt(2._dp)
resR = resR+(Conjg(lam)*Conjg(ZA(gt3,2))*dZN(gt1,6)*ZN(gt2,4))/sqrt(2._dp)
resR = resR+gp*QHd*Conjg(dZA(gt3,1))*ZN(gt1,1)*ZN(gt2,4)
resR = resR+dgp*QHd*Conjg(ZA(gt3,1))*ZN(gt1,1)*ZN(gt2,4)
resR = resR-(g1*Conjg(dZA(gt3,1))*ZN(gt1,2)*ZN(gt2,4))/2._dp
resR = resR-(dg1*Conjg(ZA(gt3,1))*ZN(gt1,2)*ZN(gt2,4))/2._dp
resR = resR+(g2*Conjg(dZA(gt3,1))*ZN(gt1,3)*ZN(gt2,4))/2._dp
resR = resR+(dg2*Conjg(ZA(gt3,1))*ZN(gt1,3)*ZN(gt2,4))/2._dp
resR = resR+(Conjg(lam)*Conjg(dZA(gt3,3))*ZN(gt1,5)*ZN(gt2,4))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*Conjg(ZA(gt3,3))*ZN(gt1,5)*ZN(gt2,4))/sqrt(2._dp)
resR = resR+(Conjg(lam)*Conjg(dZA(gt3,2))*ZN(gt1,6)*ZN(gt2,4))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*Conjg(ZA(gt3,2))*ZN(gt1,6)*ZN(gt2,4))/sqrt(2._dp)
resR = resR+gp*QHu*Conjg(ZA(gt3,2))*dZN(gt1,1)*ZN(gt2,5)
resR = resR+(g1*Conjg(ZA(gt3,2))*dZN(gt1,2)*ZN(gt2,5))/2._dp
resR = resR-(g2*Conjg(ZA(gt3,2))*dZN(gt1,3)*ZN(gt2,5))/2._dp
resR = resR+(Conjg(lam)*Conjg(ZA(gt3,3))*dZN(gt1,4)*ZN(gt2,5))/sqrt(2._dp)
resR = resR+(Conjg(lam)*Conjg(ZA(gt3,1))*dZN(gt1,6)*ZN(gt2,5))/sqrt(2._dp)
resR = resR+gp*QHu*Conjg(dZA(gt3,2))*ZN(gt1,1)*ZN(gt2,5)
resR = resR+dgp*QHu*Conjg(ZA(gt3,2))*ZN(gt1,1)*ZN(gt2,5)
resR = resR+(g1*Conjg(dZA(gt3,2))*ZN(gt1,2)*ZN(gt2,5))/2._dp
resR = resR+(dg1*Conjg(ZA(gt3,2))*ZN(gt1,2)*ZN(gt2,5))/2._dp
resR = resR-(g2*Conjg(dZA(gt3,2))*ZN(gt1,3)*ZN(gt2,5))/2._dp
resR = resR-(dg2*Conjg(ZA(gt3,2))*ZN(gt1,3)*ZN(gt2,5))/2._dp
resR = resR+(Conjg(lam)*Conjg(dZA(gt3,3))*ZN(gt1,4)*ZN(gt2,5))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*Conjg(ZA(gt3,3))*ZN(gt1,4)*ZN(gt2,5))/sqrt(2._dp)
resR = resR+(Conjg(lam)*Conjg(dZA(gt3,1))*ZN(gt1,6)*ZN(gt2,5))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*Conjg(ZA(gt3,1))*ZN(gt1,6)*ZN(gt2,5))/sqrt(2._dp)
resR = resR+gp*Qs*Conjg(ZA(gt3,3))*dZN(gt1,1)*ZN(gt2,6)
resR = resR+(Conjg(lam)*Conjg(ZA(gt3,2))*dZN(gt1,4)*ZN(gt2,6))/sqrt(2._dp)
resR = resR+(Conjg(lam)*Conjg(ZA(gt3,1))*dZN(gt1,5)*ZN(gt2,6))/sqrt(2._dp)
resR = resR+gp*Qs*Conjg(dZA(gt3,3))*ZN(gt1,1)*ZN(gt2,6)
resR = resR+dgp*Qs*Conjg(ZA(gt3,3))*ZN(gt1,1)*ZN(gt2,6)
resR = resR+(Conjg(lam)*Conjg(dZA(gt3,2))*ZN(gt1,4)*ZN(gt2,6))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*Conjg(ZA(gt3,2))*ZN(gt1,4)*ZN(gt2,6))/sqrt(2._dp)
resR = resR+(Conjg(lam)*Conjg(dZA(gt3,1))*ZN(gt1,5)*ZN(gt2,6))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*Conjg(ZA(gt3,1))*ZN(gt1,5)*ZN(gt2,6))/sqrt(2._dp)
resR = resR+gp*Qs1*Conjg(ZA(gt3,4))*dZN(gt1,1)*ZN(gt2,7)
resR = resR-(Conjg(kap)*Conjg(ZA(gt3,6))*dZN(gt1,8)*ZN(gt2,7))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(kap)*Conjg(ZA(gt3,5))*dZN(gt1,9)*ZN(gt2,7))/(3._dp*sqrt(2._dp))
resR = resR+gp*Qs1*Conjg(dZA(gt3,4))*ZN(gt1,1)*ZN(gt2,7)
resR = resR+dgp*Qs1*Conjg(ZA(gt3,4))*ZN(gt1,1)*ZN(gt2,7)
resR = resR-(Conjg(kap)*Conjg(dZA(gt3,6))*ZN(gt1,8)*ZN(gt2,7))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(dkap)*Conjg(ZA(gt3,6))*ZN(gt1,8)*ZN(gt2,7))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(kap)*Conjg(dZA(gt3,5))*ZN(gt1,9)*ZN(gt2,7))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(dkap)*Conjg(ZA(gt3,5))*ZN(gt1,9)*ZN(gt2,7))/(3._dp*sqrt(2._dp))
resR = resR+gp*Qs2*Conjg(ZA(gt3,5))*dZN(gt1,1)*ZN(gt2,8)
resR = resR-(Conjg(kap)*Conjg(ZA(gt3,6))*dZN(gt1,7)*ZN(gt2,8))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(kap)*Conjg(ZA(gt3,4))*dZN(gt1,9)*ZN(gt2,8))/(3._dp*sqrt(2._dp))
resR = resR+gp*Qs2*Conjg(dZA(gt3,5))*ZN(gt1,1)*ZN(gt2,8)
resR = resR+dgp*Qs2*Conjg(ZA(gt3,5))*ZN(gt1,1)*ZN(gt2,8)
resR = resR-(Conjg(kap)*Conjg(dZA(gt3,6))*ZN(gt1,7)*ZN(gt2,8))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(dkap)*Conjg(ZA(gt3,6))*ZN(gt1,7)*ZN(gt2,8))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(kap)*Conjg(dZA(gt3,4))*ZN(gt1,9)*ZN(gt2,8))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(dkap)*Conjg(ZA(gt3,4))*ZN(gt1,9)*ZN(gt2,8))/(3._dp*sqrt(2._dp))
resR = resR+gp*Qs3*Conjg(ZA(gt3,6))*dZN(gt1,1)*ZN(gt2,9)
resR = resR-(Conjg(kap)*Conjg(ZA(gt3,5))*dZN(gt1,7)*ZN(gt2,9))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(kap)*Conjg(ZA(gt3,4))*dZN(gt1,8)*ZN(gt2,9))/(3._dp*sqrt(2._dp))
resR = resR+gp*Qs3*Conjg(dZA(gt3,6))*ZN(gt1,1)*ZN(gt2,9)
resR = resR+dgp*Qs3*Conjg(ZA(gt3,6))*ZN(gt1,1)*ZN(gt2,9)
resR = resR-(Conjg(kap)*Conjg(dZA(gt3,5))*ZN(gt1,7)*ZN(gt2,9))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(dkap)*Conjg(ZA(gt3,5))*ZN(gt1,7)*ZN(gt2,9))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(kap)*Conjg(dZA(gt3,4))*ZN(gt1,8)*ZN(gt2,9))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(dkap)*Conjg(ZA(gt3,4))*ZN(gt1,8)*ZN(gt2,9))/(3._dp*sqrt(2._dp))
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiChiAh  
 
 
Subroutine CT_CouplingcFdFdAh(gt1,gt2,gt3,Yd,ZA,ZDL,ZDR,dYd,dZA,dZDL,dZDR,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Yd(3,3),ZA(6,6),ZDL(3,3),ZDR(3,3),dYd(3,3),dZA(6,6),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZA(gt3,1))*Conjg(ZDL(gt2,j2))*Conjg(ZDR(gt1,j1))*dYd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZDR(gt1,j1))*Conjg(ZA(gt3,1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZDL(gt2,j2))*Conjg(ZA(gt3,1))*Conjg(ZDR(gt1,j1))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZA(gt3,1))*Conjg(ZDL(gt2,j2))*Conjg(ZDR(gt1,j1))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*Conjg(ZA(gt3,1))*dZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*Conjg(ZA(gt3,1))*dZDL(gt1,j2)*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dZA(gt3,1))*Conjg(Yd(j1,j2))*ZDL(gt1,j2)*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYd(j1,j2))*Conjg(ZA(gt3,1))*ZDL(gt1,j2)*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdAh  
 
 
Subroutine CT_CouplingcFeFeAh(gt1,gt2,gt3,Ye,ZA,ZEL,ZER,dYe,dZA,dZEL,dZER,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Ye(3,3),ZA(6,6),ZEL(3,3),ZER(3,3),dYe(3,3),dZA(6,6),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZA(gt3,1))*Conjg(ZEL(gt2,j2))*Conjg(ZER(gt1,j1))*dYe(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZER(gt1,j1))*Conjg(ZA(gt3,1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZEL(gt2,j2))*Conjg(ZA(gt3,1))*Conjg(ZER(gt1,j1))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZA(gt3,1))*Conjg(ZEL(gt2,j2))*Conjg(ZER(gt1,j1))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*Conjg(ZA(gt3,1))*dZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*Conjg(ZA(gt3,1))*dZEL(gt1,j2)*ZER(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dZA(gt3,1))*Conjg(Ye(j1,j2))*ZEL(gt1,j2)*ZER(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYe(j1,j2))*Conjg(ZA(gt3,1))*ZEL(gt1,j2)*ZER(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFeAh  
 
 
Subroutine CT_CouplingcFuFuAh(gt1,gt2,gt3,Yu,ZA,ZUL,ZUR,dYu,dZA,dZUL,dZUR,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Yu(3,3),ZA(6,6),ZUL(3,3),ZUR(3,3),dYu(3,3),dZA(6,6),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZA(gt3,2))*Conjg(ZUL(gt2,j2))*Conjg(ZUR(gt1,j1))*dYu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZUR(gt1,j1))*Conjg(ZA(gt3,2))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZUL(gt2,j2))*Conjg(ZA(gt3,2))*Conjg(ZUR(gt1,j1))*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZA(gt3,2))*Conjg(ZUL(gt2,j2))*Conjg(ZUR(gt1,j1))*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*Conjg(ZA(gt3,2))*dZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*Conjg(ZA(gt3,2))*dZUL(gt1,j2)*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dZA(gt3,2))*Conjg(Yu(j1,j2))*ZUL(gt1,j2)*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYu(j1,j2))*Conjg(ZA(gt3,2))*ZUL(gt1,j2)*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuAh  
 
 
Subroutine CT_CouplingcFvFvAh(gt1,gt2,gt3,Yv,ZA,ZVL,ZVR,dYv,dZA,dZVL,dZVR,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Yv(3,3),ZA(6,6),ZVL(3,3),ZVR(3,3),dYv(3,3),dZA(6,6),dZVL(3,3),dZVR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFvFvAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZA(gt3,2))*Conjg(ZVL(gt2,j1))*Conjg(ZVR(gt1,j2))*dYv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZVR(gt1,j2))*Conjg(ZA(gt3,2))*Conjg(ZVL(gt2,j1))*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZVL(gt2,j1))*Conjg(ZA(gt3,2))*Conjg(ZVR(gt1,j2))*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZA(gt3,2))*Conjg(ZVL(gt2,j1))*Conjg(ZVR(gt1,j2))*Yv(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*Conjg(ZA(gt3,2))*dZVR(gt2,j2)*ZVL(gt1,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*Conjg(ZA(gt3,2))*dZVL(gt1,j1)*ZVR(gt2,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dZA(gt3,2))*Conjg(Yv(j1,j2))*ZVL(gt1,j1)*ZVR(gt2,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYv(j1,j2))*Conjg(ZA(gt3,2))*ZVL(gt1,j1)*ZVR(gt2,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFvFvAh  
 
 
Subroutine CT_CouplingChiChacHpm(gt1,gt2,gt3,g1,g2,gp,lam,ZP,ZN,UM,UP,dg1,            & 
& dg2,dgp,dlam,dZP,dZN,dUM,dUP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gp,ZP(2,2),dg1,dg2,dgp,dZP(2,2)

Complex(dp), Intent(in) :: lam,ZN(9,9),UM(2,2),UP(2,2),dlam,dZN(9,9),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiChacHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(sqrt(2._dp)*gp*QHd*Conjg(UM(gt2,2))*Conjg(ZN(gt1,1))*dZP(gt3,1))
resL = resL+(g1*Conjg(UM(gt2,2))*Conjg(ZN(gt1,2))*dZP(gt3,1))/sqrt(2._dp)
resL = resL+(g2*Conjg(UM(gt2,2))*Conjg(ZN(gt1,3))*dZP(gt3,1))/sqrt(2._dp)
resL = resL-(g2*Conjg(UM(gt2,1))*Conjg(ZN(gt1,4))*dZP(gt3,1))
resL = resL-(lam*Conjg(UM(gt2,2))*Conjg(ZN(gt1,6))*dZP(gt3,2))
resL = resL-(g2*Conjg(dZN(gt1,4))*Conjg(UM(gt2,1))*ZP(gt3,1))
resL = resL-(sqrt(2._dp)*gp*QHd*Conjg(dZN(gt1,1))*Conjg(UM(gt2,2))*ZP(gt3,1))
resL = resL+(g1*Conjg(dZN(gt1,2))*Conjg(UM(gt2,2))*ZP(gt3,1))/sqrt(2._dp)
resL = resL+(g2*Conjg(dZN(gt1,3))*Conjg(UM(gt2,2))*ZP(gt3,1))/sqrt(2._dp)
resL = resL-(sqrt(2._dp)*gp*QHd*Conjg(dUM(gt2,2))*Conjg(ZN(gt1,1))*ZP(gt3,1))
resL = resL-(sqrt(2._dp)*dgp*QHd*Conjg(UM(gt2,2))*Conjg(ZN(gt1,1))*ZP(gt3,1))
resL = resL+(g1*Conjg(dUM(gt2,2))*Conjg(ZN(gt1,2))*ZP(gt3,1))/sqrt(2._dp)
resL = resL+(dg1*Conjg(UM(gt2,2))*Conjg(ZN(gt1,2))*ZP(gt3,1))/sqrt(2._dp)
resL = resL+(g2*Conjg(dUM(gt2,2))*Conjg(ZN(gt1,3))*ZP(gt3,1))/sqrt(2._dp)
resL = resL+(dg2*Conjg(UM(gt2,2))*Conjg(ZN(gt1,3))*ZP(gt3,1))/sqrt(2._dp)
resL = resL-(g2*Conjg(dUM(gt2,1))*Conjg(ZN(gt1,4))*ZP(gt3,1))
resL = resL-(dg2*Conjg(UM(gt2,1))*Conjg(ZN(gt1,4))*ZP(gt3,1))
resL = resL-(lam*Conjg(dZN(gt1,6))*Conjg(UM(gt2,2))*ZP(gt3,2))
resL = resL-(lam*Conjg(dUM(gt2,2))*Conjg(ZN(gt1,6))*ZP(gt3,2))
resL = resL-(dlam*Conjg(UM(gt2,2))*Conjg(ZN(gt1,6))*ZP(gt3,2))
resR = 0._dp 
resR = resR-(sqrt(2._dp)*gp*QHu*dZP(gt3,2)*UP(gt2,2)*ZN(gt1,1))
resR = resR-((g1*dZP(gt3,2)*UP(gt2,2)*ZN(gt1,2))/sqrt(2._dp))
resR = resR-((g2*dZP(gt3,2)*UP(gt2,2)*ZN(gt1,3))/sqrt(2._dp))
resR = resR-(g2*dZP(gt3,2)*UP(gt2,1)*ZN(gt1,5))
resR = resR-(Conjg(lam)*dZP(gt3,1)*UP(gt2,2)*ZN(gt1,6))
resR = resR-(Conjg(lam)*dZN(gt1,6)*UP(gt2,2)*ZP(gt3,1))
resR = resR-(Conjg(lam)*dUP(gt2,2)*ZN(gt1,6)*ZP(gt3,1))
resR = resR-(Conjg(dlam)*UP(gt2,2)*ZN(gt1,6)*ZP(gt3,1))
resR = resR-(g2*dZN(gt1,5)*UP(gt2,1)*ZP(gt3,2))
resR = resR-(sqrt(2._dp)*gp*QHu*dZN(gt1,1)*UP(gt2,2)*ZP(gt3,2))
resR = resR-((g1*dZN(gt1,2)*UP(gt2,2)*ZP(gt3,2))/sqrt(2._dp))
resR = resR-((g2*dZN(gt1,3)*UP(gt2,2)*ZP(gt3,2))/sqrt(2._dp))
resR = resR-(sqrt(2._dp)*gp*QHu*dUP(gt2,2)*ZN(gt1,1)*ZP(gt3,2))
resR = resR-(sqrt(2._dp)*dgp*QHu*UP(gt2,2)*ZN(gt1,1)*ZP(gt3,2))
resR = resR-((g1*dUP(gt2,2)*ZN(gt1,2)*ZP(gt3,2))/sqrt(2._dp))
resR = resR-((dg1*UP(gt2,2)*ZN(gt1,2)*ZP(gt3,2))/sqrt(2._dp))
resR = resR-((g2*dUP(gt2,2)*ZN(gt1,3)*ZP(gt3,2))/sqrt(2._dp))
resR = resR-((dg2*UP(gt2,2)*ZN(gt1,3)*ZP(gt3,2))/sqrt(2._dp))
resR = resR-(g2*dUP(gt2,1)*ZN(gt1,5)*ZP(gt3,2))
resR = resR-(dg2*UP(gt2,1)*ZN(gt1,5)*ZP(gt3,2))
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiChacHpm  
 
 
Subroutine CT_CouplingChaFucSd(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,dg2,             & 
& dYd,dYu,dZD,dUM,dUP,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZD(6,6),UM(2,2),UP(2,2),ZUL(3,3),ZUR(3,3),dYd(3,3),dYu(3,3),          & 
& dZD(6,6),dUM(2,2),dUP(2,2),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChaFucSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(g2*Conjg(UM(gt1,1))*Conjg(ZUL(gt2,j1))*dZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dZUL(gt2,j1))*Conjg(UM(gt1,1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dUM(gt1,1))*Conjg(ZUL(gt2,j1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(dg2*Conjg(UM(gt1,1))*Conjg(ZUL(gt2,j1))*ZD(gt3,j1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UM(gt1,2))*Conjg(ZUL(gt2,j2))*dZD(gt3,3 + j1)*Yd(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UM(gt1,2))*Conjg(ZUL(gt2,j2))*dYd(j1,j2)*ZD(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZUL(gt2,j2))*Conjg(UM(gt1,2))*Yd(j1,j2)*ZD(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUM(gt1,2))*Conjg(ZUL(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*dZUR(gt2,j1)*UP(gt1,2)*ZD(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*dZD(gt3,j2)*UP(gt1,2)*ZUR(gt2,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*dUP(gt1,2)*ZD(gt3,j2)*ZUR(gt2,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYu(j1,j2))*UP(gt1,2)*ZD(gt3,j2)*ZUR(gt2,j1)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChaFucSd  
 
 
Subroutine CT_CouplingChaFvcSe(gt1,gt2,gt3,g2,Ye,Yv,ZE,ZVL,ZVR,UM,UP,dg2,             & 
& dYe,dYv,dZE,dZVL,dZVR,dUM,dUP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZE(6,6),ZVL(3,3),ZVR(3,3),UM(2,2),UP(2,2),dYe(3,3),dYv(3,3),          & 
& dZE(6,6),dZVL(3,3),dZVR(3,3),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChaFvcSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(g2*Conjg(UM(gt1,1))*Conjg(ZVL(gt2,j1))*dZE(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dZVL(gt2,j1))*Conjg(UM(gt1,1))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dUM(gt1,1))*Conjg(ZVL(gt2,j1))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(dg2*Conjg(UM(gt1,1))*Conjg(ZVL(gt2,j1))*ZE(gt3,j1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UM(gt1,2))*Conjg(ZVL(gt2,j2))*dZE(gt3,3 + j1)*Ye(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UM(gt1,2))*Conjg(ZVL(gt2,j2))*dYe(j1,j2)*ZE(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZVL(gt2,j2))*Conjg(UM(gt1,2))*Ye(j1,j2)*ZE(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUM(gt1,2))*Conjg(ZVL(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yv(j1,j2))*dZVR(gt2,j2)*UP(gt1,2)*ZE(gt3,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yv(j1,j2))*dZE(gt3,j1)*UP(gt1,2)*ZVR(gt2,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yv(j1,j2))*dUP(gt1,2)*ZE(gt3,j1)*ZVR(gt2,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYv(j1,j2))*UP(gt1,2)*ZE(gt3,j1)*ZVR(gt2,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChaFvcSe  
 
 
Subroutine CT_CouplingcChaChahh(gt1,gt2,gt3,g2,lam,ZH,UM,UP,dg2,dlam,dZH,             & 
& dUM,dUP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: lam,ZH(6,6),UM(2,2),UP(2,2),dlam,dZH(6,6),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaChahh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-((g2*Conjg(dZH(gt3,1))*Conjg(UM(gt2,2))*Conjg(UP(gt1,1)))/sqrt(2._dp))
resL = resL-((g2*Conjg(dZH(gt3,2))*Conjg(UM(gt2,1))*Conjg(UP(gt1,2)))/sqrt(2._dp))
resL = resL-((lam*Conjg(dZH(gt3,3))*Conjg(UM(gt2,2))*Conjg(UP(gt1,2)))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUP(gt1,1))*Conjg(UM(gt2,2))*Conjg(ZH(gt3,1)))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUM(gt2,2))*Conjg(UP(gt1,1))*Conjg(ZH(gt3,1)))/sqrt(2._dp))
resL = resL-((dg2*Conjg(UM(gt2,2))*Conjg(UP(gt1,1))*Conjg(ZH(gt3,1)))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUP(gt1,2))*Conjg(UM(gt2,1))*Conjg(ZH(gt3,2)))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUM(gt2,1))*Conjg(UP(gt1,2))*Conjg(ZH(gt3,2)))/sqrt(2._dp))
resL = resL-((dg2*Conjg(UM(gt2,1))*Conjg(UP(gt1,2))*Conjg(ZH(gt3,2)))/sqrt(2._dp))
resL = resL-((lam*Conjg(dUP(gt1,2))*Conjg(UM(gt2,2))*Conjg(ZH(gt3,3)))/sqrt(2._dp))
resL = resL-((lam*Conjg(dUM(gt2,2))*Conjg(UP(gt1,2))*Conjg(ZH(gt3,3)))/sqrt(2._dp))
resL = resL-((dlam*Conjg(UM(gt2,2))*Conjg(UP(gt1,2))*Conjg(ZH(gt3,3)))/sqrt(2._dp))
resR = 0._dp 
resR = resR-((g2*Conjg(ZH(gt3,2))*dUP(gt2,2)*UM(gt1,1))/sqrt(2._dp))
resR = resR-((g2*Conjg(ZH(gt3,1))*dUP(gt2,1)*UM(gt1,2))/sqrt(2._dp))
resR = resR-((Conjg(lam)*Conjg(ZH(gt3,3))*dUP(gt2,2)*UM(gt1,2))/sqrt(2._dp))
resR = resR-((g2*Conjg(ZH(gt3,1))*dUM(gt1,2)*UP(gt2,1))/sqrt(2._dp))
resR = resR-((g2*Conjg(dZH(gt3,1))*UM(gt1,2)*UP(gt2,1))/sqrt(2._dp))
resR = resR-((dg2*Conjg(ZH(gt3,1))*UM(gt1,2)*UP(gt2,1))/sqrt(2._dp))
resR = resR-((g2*Conjg(ZH(gt3,2))*dUM(gt1,1)*UP(gt2,2))/sqrt(2._dp))
resR = resR-((Conjg(lam)*Conjg(ZH(gt3,3))*dUM(gt1,2)*UP(gt2,2))/sqrt(2._dp))
resR = resR-((g2*Conjg(dZH(gt3,2))*UM(gt1,1)*UP(gt2,2))/sqrt(2._dp))
resR = resR-((dg2*Conjg(ZH(gt3,2))*UM(gt1,1)*UP(gt2,2))/sqrt(2._dp))
resR = resR-((Conjg(lam)*Conjg(dZH(gt3,3))*UM(gt1,2)*UP(gt2,2))/sqrt(2._dp))
resR = resR-((Conjg(dlam)*Conjg(ZH(gt3,3))*UM(gt1,2)*UP(gt2,2))/sqrt(2._dp))
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaChahh  
 
 
Subroutine CT_CouplingcFdChaSu(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,dg2,             & 
& dYd,dYu,dZU,dUM,dUP,dZDL,dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZU(6,6),UM(2,2),UP(2,2),ZDL(3,3),ZDR(3,3),dYd(3,3),dYu(3,3),          & 
& dZU(6,6),dUM(2,2),dUP(2,2),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdChaSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UM(gt2,2))*Conjg(ZDR(gt1,j1))*Conjg(ZU(gt3,j2))*dYd(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZU(gt3,j2))*Conjg(UM(gt2,2))*Conjg(ZDR(gt1,j1))*Yd(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZDR(gt1,j1))*Conjg(UM(gt2,2))*Conjg(ZU(gt3,j2))*Yd(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUM(gt2,2))*Conjg(ZDR(gt1,j1))*Conjg(ZU(gt3,j2))*Yd(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZU(gt3,j1))*dZDL(gt1,j1)*UP(gt2,1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZU(gt3,j1))*dUP(gt2,1)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(dZU(gt3,j1))*UP(gt2,1)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(dg2*Conjg(ZU(gt3,j1))*UP(gt2,1)*ZDL(gt1,j1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*Conjg(ZU(gt3,3 + j1))*dZDL(gt1,j2)*UP(gt2,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*Conjg(ZU(gt3,3 + j1))*dUP(gt2,2)*ZDL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dZU(gt3,3 + j1))*Conjg(Yu(j1,j2))*UP(gt2,2)*ZDL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYu(j1,j2))*Conjg(ZU(gt3,3 + j1))*UP(gt2,2)*ZDL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdChaSu  
 
 
Subroutine CT_CouplingcFeChaSv(gt1,gt2,gt3,g2,Ye,Yv,ZV,UM,UP,ZEL,ZER,dg2,             & 
& dYe,dYv,dZV,dUM,dUP,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZV(6,6),UM(2,2),UP(2,2),ZEL(3,3),ZER(3,3),dYe(3,3),dYv(3,3),          & 
& dZV(6,6),dUM(2,2),dUP(2,2),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeChaSv' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UM(gt2,2))*Conjg(ZER(gt1,j1))*Conjg(ZV(gt3,j2))*dYe(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZV(gt3,j2))*Conjg(UM(gt2,2))*Conjg(ZER(gt1,j1))*Ye(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZER(gt1,j1))*Conjg(UM(gt2,2))*Conjg(ZV(gt3,j2))*Ye(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUM(gt2,2))*Conjg(ZER(gt1,j1))*Conjg(ZV(gt3,j2))*Ye(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZV(gt3,j1))*dZEL(gt1,j1)*UP(gt2,1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZV(gt3,j1))*dUP(gt2,1)*ZEL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(dZV(gt3,j1))*UP(gt2,1)*ZEL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(dg2*Conjg(ZV(gt3,j1))*UP(gt2,1)*ZEL(gt1,j1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yv(j1,j2))*Conjg(ZV(gt3,3 + j2))*dZEL(gt1,j1)*UP(gt2,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yv(j1,j2))*Conjg(ZV(gt3,3 + j2))*dUP(gt2,2)*ZEL(gt1,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dZV(gt3,3 + j2))*Conjg(Yv(j1,j2))*UP(gt2,2)*ZEL(gt1,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYv(j1,j2))*Conjg(ZV(gt3,3 + j2))*UP(gt2,2)*ZEL(gt1,j1)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeChaSv  
 
 
Subroutine CT_CouplingChiChihh(gt1,gt2,gt3,g1,g2,gp,lam,kap,ZH,ZN,dg1,dg2,            & 
& dgp,dlam,dkap,dZH,dZN,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gp,dg1,dg2,dgp

Complex(dp), Intent(in) :: lam,kap,ZH(6,6),ZN(9,9),dlam,dkap,dZH(6,6),dZN(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiChihh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(gp*QHd*Conjg(dZN(gt2,4))*Conjg(ZH(gt3,1))*Conjg(ZN(gt1,1)))
resL = resL-(gp*QHu*Conjg(dZN(gt2,5))*Conjg(ZH(gt3,2))*Conjg(ZN(gt1,1)))
resL = resL-(gp*Qs*Conjg(dZN(gt2,6))*Conjg(ZH(gt3,3))*Conjg(ZN(gt1,1)))
resL = resL-(gp*Qs1*Conjg(dZN(gt2,7))*Conjg(ZH(gt3,4))*Conjg(ZN(gt1,1)))
resL = resL-(gp*Qs2*Conjg(dZN(gt2,8))*Conjg(ZH(gt3,5))*Conjg(ZN(gt1,1)))
resL = resL-(gp*Qs3*Conjg(dZN(gt2,9))*Conjg(ZH(gt3,6))*Conjg(ZN(gt1,1)))
resL = resL+(g1*Conjg(dZN(gt2,4))*Conjg(ZH(gt3,1))*Conjg(ZN(gt1,2)))/2._dp
resL = resL-(g1*Conjg(dZN(gt2,5))*Conjg(ZH(gt3,2))*Conjg(ZN(gt1,2)))/2._dp
resL = resL-(g2*Conjg(dZN(gt2,4))*Conjg(ZH(gt3,1))*Conjg(ZN(gt1,3)))/2._dp
resL = resL+(g2*Conjg(dZN(gt2,5))*Conjg(ZH(gt3,2))*Conjg(ZN(gt1,3)))/2._dp
resL = resL-(gp*QHd*Conjg(dZN(gt2,1))*Conjg(ZH(gt3,1))*Conjg(ZN(gt1,4)))
resL = resL+(g1*Conjg(dZN(gt2,2))*Conjg(ZH(gt3,1))*Conjg(ZN(gt1,4)))/2._dp
resL = resL-(g2*Conjg(dZN(gt2,3))*Conjg(ZH(gt3,1))*Conjg(ZN(gt1,4)))/2._dp
resL = resL+(lam*Conjg(dZN(gt2,6))*Conjg(ZH(gt3,2))*Conjg(ZN(gt1,4)))/sqrt(2._dp)
resL = resL+(lam*Conjg(dZN(gt2,5))*Conjg(ZH(gt3,3))*Conjg(ZN(gt1,4)))/sqrt(2._dp)
resL = resL+(lam*Conjg(dZN(gt2,6))*Conjg(ZH(gt3,1))*Conjg(ZN(gt1,5)))/sqrt(2._dp)
resL = resL-(gp*QHu*Conjg(dZN(gt2,1))*Conjg(ZH(gt3,2))*Conjg(ZN(gt1,5)))
resL = resL-(g1*Conjg(dZN(gt2,2))*Conjg(ZH(gt3,2))*Conjg(ZN(gt1,5)))/2._dp
resL = resL+(g2*Conjg(dZN(gt2,3))*Conjg(ZH(gt3,2))*Conjg(ZN(gt1,5)))/2._dp
resL = resL+(lam*Conjg(dZN(gt2,4))*Conjg(ZH(gt3,3))*Conjg(ZN(gt1,5)))/sqrt(2._dp)
resL = resL+(lam*Conjg(dZN(gt2,5))*Conjg(ZH(gt3,1))*Conjg(ZN(gt1,6)))/sqrt(2._dp)
resL = resL+(lam*Conjg(dZN(gt2,4))*Conjg(ZH(gt3,2))*Conjg(ZN(gt1,6)))/sqrt(2._dp)
resL = resL-(gp*Qs*Conjg(dZN(gt2,1))*Conjg(ZH(gt3,3))*Conjg(ZN(gt1,6)))
resL = resL-(gp*Qs1*Conjg(dZN(gt2,1))*Conjg(ZH(gt3,4))*Conjg(ZN(gt1,7)))
resL = resL-(kap*Conjg(dZN(gt2,9))*Conjg(ZH(gt3,5))*Conjg(ZN(gt1,7)))/(3._dp*sqrt(2._dp))
resL = resL-(kap*Conjg(dZN(gt2,8))*Conjg(ZH(gt3,6))*Conjg(ZN(gt1,7)))/(3._dp*sqrt(2._dp))
resL = resL-(kap*Conjg(dZN(gt2,9))*Conjg(ZH(gt3,4))*Conjg(ZN(gt1,8)))/(3._dp*sqrt(2._dp))
resL = resL-(gp*Qs2*Conjg(dZN(gt2,1))*Conjg(ZH(gt3,5))*Conjg(ZN(gt1,8)))
resL = resL-(kap*Conjg(dZN(gt2,7))*Conjg(ZH(gt3,6))*Conjg(ZN(gt1,8)))/(3._dp*sqrt(2._dp))
resL = resL-(kap*Conjg(dZN(gt2,8))*Conjg(ZH(gt3,4))*Conjg(ZN(gt1,9)))/(3._dp*sqrt(2._dp))
resL = resL-(kap*Conjg(dZN(gt2,7))*Conjg(ZH(gt3,5))*Conjg(ZN(gt1,9)))/(3._dp*sqrt(2._dp))
resL = resL-(gp*Qs3*Conjg(dZN(gt2,1))*Conjg(ZH(gt3,6))*Conjg(ZN(gt1,9)))
resL = resL-(gp*QHd*Conjg(dZN(gt1,4))*Conjg(ZH(gt3,1))*Conjg(ZN(gt2,1)))
resL = resL-(gp*QHu*Conjg(dZN(gt1,5))*Conjg(ZH(gt3,2))*Conjg(ZN(gt2,1)))
resL = resL-(gp*Qs*Conjg(dZN(gt1,6))*Conjg(ZH(gt3,3))*Conjg(ZN(gt2,1)))
resL = resL-(gp*Qs1*Conjg(dZN(gt1,7))*Conjg(ZH(gt3,4))*Conjg(ZN(gt2,1)))
resL = resL-(gp*Qs2*Conjg(dZN(gt1,8))*Conjg(ZH(gt3,5))*Conjg(ZN(gt2,1)))
resL = resL-(gp*Qs3*Conjg(dZN(gt1,9))*Conjg(ZH(gt3,6))*Conjg(ZN(gt2,1)))
resL = resL-(gp*QHd*Conjg(dZH(gt3,1))*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,1)))
resL = resL-(dgp*QHd*Conjg(ZH(gt3,1))*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,1)))
resL = resL-(gp*QHu*Conjg(dZH(gt3,2))*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,1)))
resL = resL-(dgp*QHu*Conjg(ZH(gt3,2))*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,1)))
resL = resL-(gp*Qs*Conjg(dZH(gt3,3))*Conjg(ZN(gt1,6))*Conjg(ZN(gt2,1)))
resL = resL-(dgp*Qs*Conjg(ZH(gt3,3))*Conjg(ZN(gt1,6))*Conjg(ZN(gt2,1)))
resL = resL-(gp*Qs1*Conjg(dZH(gt3,4))*Conjg(ZN(gt1,7))*Conjg(ZN(gt2,1)))
resL = resL-(dgp*Qs1*Conjg(ZH(gt3,4))*Conjg(ZN(gt1,7))*Conjg(ZN(gt2,1)))
resL = resL-(gp*Qs2*Conjg(dZH(gt3,5))*Conjg(ZN(gt1,8))*Conjg(ZN(gt2,1)))
resL = resL-(dgp*Qs2*Conjg(ZH(gt3,5))*Conjg(ZN(gt1,8))*Conjg(ZN(gt2,1)))
resL = resL-(gp*Qs3*Conjg(dZH(gt3,6))*Conjg(ZN(gt1,9))*Conjg(ZN(gt2,1)))
resL = resL-(dgp*Qs3*Conjg(ZH(gt3,6))*Conjg(ZN(gt1,9))*Conjg(ZN(gt2,1)))
resL = resL+(g1*Conjg(dZN(gt1,4))*Conjg(ZH(gt3,1))*Conjg(ZN(gt2,2)))/2._dp
resL = resL-(g1*Conjg(dZN(gt1,5))*Conjg(ZH(gt3,2))*Conjg(ZN(gt2,2)))/2._dp
resL = resL+(g1*Conjg(dZH(gt3,1))*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,2)))/2._dp
resL = resL+(dg1*Conjg(ZH(gt3,1))*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,2)))/2._dp
resL = resL-(g1*Conjg(dZH(gt3,2))*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,2)))/2._dp
resL = resL-(dg1*Conjg(ZH(gt3,2))*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,2)))/2._dp
resL = resL-(g2*Conjg(dZN(gt1,4))*Conjg(ZH(gt3,1))*Conjg(ZN(gt2,3)))/2._dp
resL = resL+(g2*Conjg(dZN(gt1,5))*Conjg(ZH(gt3,2))*Conjg(ZN(gt2,3)))/2._dp
resL = resL-(g2*Conjg(dZH(gt3,1))*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,3)))/2._dp
resL = resL-(dg2*Conjg(ZH(gt3,1))*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,3)))/2._dp
resL = resL+(g2*Conjg(dZH(gt3,2))*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,3)))/2._dp
resL = resL+(dg2*Conjg(ZH(gt3,2))*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,3)))/2._dp
resL = resL-(gp*QHd*Conjg(dZN(gt1,1))*Conjg(ZH(gt3,1))*Conjg(ZN(gt2,4)))
resL = resL+(g1*Conjg(dZN(gt1,2))*Conjg(ZH(gt3,1))*Conjg(ZN(gt2,4)))/2._dp
resL = resL-(g2*Conjg(dZN(gt1,3))*Conjg(ZH(gt3,1))*Conjg(ZN(gt2,4)))/2._dp
resL = resL+(lam*Conjg(dZN(gt1,6))*Conjg(ZH(gt3,2))*Conjg(ZN(gt2,4)))/sqrt(2._dp)
resL = resL+(lam*Conjg(dZN(gt1,5))*Conjg(ZH(gt3,3))*Conjg(ZN(gt2,4)))/sqrt(2._dp)
resL = resL-(gp*QHd*Conjg(dZH(gt3,1))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,4)))
resL = resL-(dgp*QHd*Conjg(ZH(gt3,1))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,4)))
resL = resL+(g1*Conjg(dZH(gt3,1))*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,4)))/2._dp
resL = resL+(dg1*Conjg(ZH(gt3,1))*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,4)))/2._dp
resL = resL-(g2*Conjg(dZH(gt3,1))*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,4)))/2._dp
resL = resL-(dg2*Conjg(ZH(gt3,1))*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,4)))/2._dp
resL = resL+(lam*Conjg(dZH(gt3,3))*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,4)))/sqrt(2._dp)
resL = resL+(dlam*Conjg(ZH(gt3,3))*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,4)))/sqrt(2._dp)
resL = resL+(lam*Conjg(dZH(gt3,2))*Conjg(ZN(gt1,6))*Conjg(ZN(gt2,4)))/sqrt(2._dp)
resL = resL+(dlam*Conjg(ZH(gt3,2))*Conjg(ZN(gt1,6))*Conjg(ZN(gt2,4)))/sqrt(2._dp)
resL = resL+(lam*Conjg(dZN(gt1,6))*Conjg(ZH(gt3,1))*Conjg(ZN(gt2,5)))/sqrt(2._dp)
resL = resL-(gp*QHu*Conjg(dZN(gt1,1))*Conjg(ZH(gt3,2))*Conjg(ZN(gt2,5)))
resL = resL-(g1*Conjg(dZN(gt1,2))*Conjg(ZH(gt3,2))*Conjg(ZN(gt2,5)))/2._dp
resL = resL+(g2*Conjg(dZN(gt1,3))*Conjg(ZH(gt3,2))*Conjg(ZN(gt2,5)))/2._dp
resL = resL+(lam*Conjg(dZN(gt1,4))*Conjg(ZH(gt3,3))*Conjg(ZN(gt2,5)))/sqrt(2._dp)
resL = resL-(gp*QHu*Conjg(dZH(gt3,2))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,5)))
resL = resL-(dgp*QHu*Conjg(ZH(gt3,2))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,5)))
resL = resL-(g1*Conjg(dZH(gt3,2))*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,5)))/2._dp
resL = resL-(dg1*Conjg(ZH(gt3,2))*Conjg(ZN(gt1,2))*Conjg(ZN(gt2,5)))/2._dp
resL = resL+(g2*Conjg(dZH(gt3,2))*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,5)))/2._dp
resL = resL+(dg2*Conjg(ZH(gt3,2))*Conjg(ZN(gt1,3))*Conjg(ZN(gt2,5)))/2._dp
resL = resL+(lam*Conjg(dZH(gt3,3))*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,5)))/sqrt(2._dp)
resL = resL+(dlam*Conjg(ZH(gt3,3))*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,5)))/sqrt(2._dp)
resL = resL+(lam*Conjg(dZH(gt3,1))*Conjg(ZN(gt1,6))*Conjg(ZN(gt2,5)))/sqrt(2._dp)
resL = resL+(dlam*Conjg(ZH(gt3,1))*Conjg(ZN(gt1,6))*Conjg(ZN(gt2,5)))/sqrt(2._dp)
resL = resL+(lam*Conjg(dZN(gt1,5))*Conjg(ZH(gt3,1))*Conjg(ZN(gt2,6)))/sqrt(2._dp)
resL = resL+(lam*Conjg(dZN(gt1,4))*Conjg(ZH(gt3,2))*Conjg(ZN(gt2,6)))/sqrt(2._dp)
resL = resL-(gp*Qs*Conjg(dZN(gt1,1))*Conjg(ZH(gt3,3))*Conjg(ZN(gt2,6)))
resL = resL-(gp*Qs*Conjg(dZH(gt3,3))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,6)))
resL = resL-(dgp*Qs*Conjg(ZH(gt3,3))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,6)))
resL = resL+(lam*Conjg(dZH(gt3,2))*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,6)))/sqrt(2._dp)
resL = resL+(dlam*Conjg(ZH(gt3,2))*Conjg(ZN(gt1,4))*Conjg(ZN(gt2,6)))/sqrt(2._dp)
resL = resL+(lam*Conjg(dZH(gt3,1))*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,6)))/sqrt(2._dp)
resL = resL+(dlam*Conjg(ZH(gt3,1))*Conjg(ZN(gt1,5))*Conjg(ZN(gt2,6)))/sqrt(2._dp)
resL = resL-(gp*Qs1*Conjg(dZN(gt1,1))*Conjg(ZH(gt3,4))*Conjg(ZN(gt2,7)))
resL = resL-(kap*Conjg(dZN(gt1,9))*Conjg(ZH(gt3,5))*Conjg(ZN(gt2,7)))/(3._dp*sqrt(2._dp))
resL = resL-(kap*Conjg(dZN(gt1,8))*Conjg(ZH(gt3,6))*Conjg(ZN(gt2,7)))/(3._dp*sqrt(2._dp))
resL = resL-(gp*Qs1*Conjg(dZH(gt3,4))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,7)))
resL = resL-(dgp*Qs1*Conjg(ZH(gt3,4))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,7)))
resL = resL-(kap*Conjg(dZH(gt3,6))*Conjg(ZN(gt1,8))*Conjg(ZN(gt2,7)))/(3._dp*sqrt(2._dp))
resL = resL-(dkap*Conjg(ZH(gt3,6))*Conjg(ZN(gt1,8))*Conjg(ZN(gt2,7)))/(3._dp*sqrt(2._dp))
resL = resL-(kap*Conjg(dZH(gt3,5))*Conjg(ZN(gt1,9))*Conjg(ZN(gt2,7)))/(3._dp*sqrt(2._dp))
resL = resL-(dkap*Conjg(ZH(gt3,5))*Conjg(ZN(gt1,9))*Conjg(ZN(gt2,7)))/(3._dp*sqrt(2._dp))
resL = resL-(kap*Conjg(dZN(gt1,9))*Conjg(ZH(gt3,4))*Conjg(ZN(gt2,8)))/(3._dp*sqrt(2._dp))
resL = resL-(gp*Qs2*Conjg(dZN(gt1,1))*Conjg(ZH(gt3,5))*Conjg(ZN(gt2,8)))
resL = resL-(kap*Conjg(dZN(gt1,7))*Conjg(ZH(gt3,6))*Conjg(ZN(gt2,8)))/(3._dp*sqrt(2._dp))
resL = resL-(gp*Qs2*Conjg(dZH(gt3,5))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,8)))
resL = resL-(dgp*Qs2*Conjg(ZH(gt3,5))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,8)))
resL = resL-(kap*Conjg(dZH(gt3,6))*Conjg(ZN(gt1,7))*Conjg(ZN(gt2,8)))/(3._dp*sqrt(2._dp))
resL = resL-(dkap*Conjg(ZH(gt3,6))*Conjg(ZN(gt1,7))*Conjg(ZN(gt2,8)))/(3._dp*sqrt(2._dp))
resL = resL-(kap*Conjg(dZH(gt3,4))*Conjg(ZN(gt1,9))*Conjg(ZN(gt2,8)))/(3._dp*sqrt(2._dp))
resL = resL-(dkap*Conjg(ZH(gt3,4))*Conjg(ZN(gt1,9))*Conjg(ZN(gt2,8)))/(3._dp*sqrt(2._dp))
resL = resL-(kap*Conjg(dZN(gt1,8))*Conjg(ZH(gt3,4))*Conjg(ZN(gt2,9)))/(3._dp*sqrt(2._dp))
resL = resL-(kap*Conjg(dZN(gt1,7))*Conjg(ZH(gt3,5))*Conjg(ZN(gt2,9)))/(3._dp*sqrt(2._dp))
resL = resL-(gp*Qs3*Conjg(dZN(gt1,1))*Conjg(ZH(gt3,6))*Conjg(ZN(gt2,9)))
resL = resL-(gp*Qs3*Conjg(dZH(gt3,6))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,9)))
resL = resL-(dgp*Qs3*Conjg(ZH(gt3,6))*Conjg(ZN(gt1,1))*Conjg(ZN(gt2,9)))
resL = resL-(kap*Conjg(dZH(gt3,5))*Conjg(ZN(gt1,7))*Conjg(ZN(gt2,9)))/(3._dp*sqrt(2._dp))
resL = resL-(dkap*Conjg(ZH(gt3,5))*Conjg(ZN(gt1,7))*Conjg(ZN(gt2,9)))/(3._dp*sqrt(2._dp))
resL = resL-(kap*Conjg(dZH(gt3,4))*Conjg(ZN(gt1,8))*Conjg(ZN(gt2,9)))/(3._dp*sqrt(2._dp))
resL = resL-(dkap*Conjg(ZH(gt3,4))*Conjg(ZN(gt1,8))*Conjg(ZN(gt2,9)))/(3._dp*sqrt(2._dp))
resR = 0._dp 
resR = resR-(gp*QHd*Conjg(ZH(gt3,1))*dZN(gt2,4)*ZN(gt1,1))
resR = resR-(gp*QHu*Conjg(ZH(gt3,2))*dZN(gt2,5)*ZN(gt1,1))
resR = resR-(gp*Qs*Conjg(ZH(gt3,3))*dZN(gt2,6)*ZN(gt1,1))
resR = resR-(gp*Qs1*Conjg(ZH(gt3,4))*dZN(gt2,7)*ZN(gt1,1))
resR = resR-(gp*Qs2*Conjg(ZH(gt3,5))*dZN(gt2,8)*ZN(gt1,1))
resR = resR-(gp*Qs3*Conjg(ZH(gt3,6))*dZN(gt2,9)*ZN(gt1,1))
resR = resR+(g1*Conjg(ZH(gt3,1))*dZN(gt2,4)*ZN(gt1,2))/2._dp
resR = resR-(g1*Conjg(ZH(gt3,2))*dZN(gt2,5)*ZN(gt1,2))/2._dp
resR = resR-(g2*Conjg(ZH(gt3,1))*dZN(gt2,4)*ZN(gt1,3))/2._dp
resR = resR+(g2*Conjg(ZH(gt3,2))*dZN(gt2,5)*ZN(gt1,3))/2._dp
resR = resR-(gp*QHd*Conjg(ZH(gt3,1))*dZN(gt2,1)*ZN(gt1,4))
resR = resR+(g1*Conjg(ZH(gt3,1))*dZN(gt2,2)*ZN(gt1,4))/2._dp
resR = resR-(g2*Conjg(ZH(gt3,1))*dZN(gt2,3)*ZN(gt1,4))/2._dp
resR = resR+(Conjg(lam)*Conjg(ZH(gt3,3))*dZN(gt2,5)*ZN(gt1,4))/sqrt(2._dp)
resR = resR+(Conjg(lam)*Conjg(ZH(gt3,2))*dZN(gt2,6)*ZN(gt1,4))/sqrt(2._dp)
resR = resR-(gp*QHu*Conjg(ZH(gt3,2))*dZN(gt2,1)*ZN(gt1,5))
resR = resR-(g1*Conjg(ZH(gt3,2))*dZN(gt2,2)*ZN(gt1,5))/2._dp
resR = resR+(g2*Conjg(ZH(gt3,2))*dZN(gt2,3)*ZN(gt1,5))/2._dp
resR = resR+(Conjg(lam)*Conjg(ZH(gt3,3))*dZN(gt2,4)*ZN(gt1,5))/sqrt(2._dp)
resR = resR+(Conjg(lam)*Conjg(ZH(gt3,1))*dZN(gt2,6)*ZN(gt1,5))/sqrt(2._dp)
resR = resR-(gp*Qs*Conjg(ZH(gt3,3))*dZN(gt2,1)*ZN(gt1,6))
resR = resR+(Conjg(lam)*Conjg(ZH(gt3,2))*dZN(gt2,4)*ZN(gt1,6))/sqrt(2._dp)
resR = resR+(Conjg(lam)*Conjg(ZH(gt3,1))*dZN(gt2,5)*ZN(gt1,6))/sqrt(2._dp)
resR = resR-(gp*Qs1*Conjg(ZH(gt3,4))*dZN(gt2,1)*ZN(gt1,7))
resR = resR-(Conjg(kap)*Conjg(ZH(gt3,6))*dZN(gt2,8)*ZN(gt1,7))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(kap)*Conjg(ZH(gt3,5))*dZN(gt2,9)*ZN(gt1,7))/(3._dp*sqrt(2._dp))
resR = resR-(gp*Qs2*Conjg(ZH(gt3,5))*dZN(gt2,1)*ZN(gt1,8))
resR = resR-(Conjg(kap)*Conjg(ZH(gt3,6))*dZN(gt2,7)*ZN(gt1,8))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(kap)*Conjg(ZH(gt3,4))*dZN(gt2,9)*ZN(gt1,8))/(3._dp*sqrt(2._dp))
resR = resR-(gp*Qs3*Conjg(ZH(gt3,6))*dZN(gt2,1)*ZN(gt1,9))
resR = resR-(Conjg(kap)*Conjg(ZH(gt3,5))*dZN(gt2,7)*ZN(gt1,9))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(kap)*Conjg(ZH(gt3,4))*dZN(gt2,8)*ZN(gt1,9))/(3._dp*sqrt(2._dp))
resR = resR-(gp*QHd*Conjg(ZH(gt3,1))*dZN(gt1,4)*ZN(gt2,1))
resR = resR-(gp*QHu*Conjg(ZH(gt3,2))*dZN(gt1,5)*ZN(gt2,1))
resR = resR-(gp*Qs*Conjg(ZH(gt3,3))*dZN(gt1,6)*ZN(gt2,1))
resR = resR-(gp*Qs1*Conjg(ZH(gt3,4))*dZN(gt1,7)*ZN(gt2,1))
resR = resR-(gp*Qs2*Conjg(ZH(gt3,5))*dZN(gt1,8)*ZN(gt2,1))
resR = resR-(gp*Qs3*Conjg(ZH(gt3,6))*dZN(gt1,9)*ZN(gt2,1))
resR = resR-(gp*QHd*Conjg(dZH(gt3,1))*ZN(gt1,4)*ZN(gt2,1))
resR = resR-(dgp*QHd*Conjg(ZH(gt3,1))*ZN(gt1,4)*ZN(gt2,1))
resR = resR-(gp*QHu*Conjg(dZH(gt3,2))*ZN(gt1,5)*ZN(gt2,1))
resR = resR-(dgp*QHu*Conjg(ZH(gt3,2))*ZN(gt1,5)*ZN(gt2,1))
resR = resR-(gp*Qs*Conjg(dZH(gt3,3))*ZN(gt1,6)*ZN(gt2,1))
resR = resR-(dgp*Qs*Conjg(ZH(gt3,3))*ZN(gt1,6)*ZN(gt2,1))
resR = resR-(gp*Qs1*Conjg(dZH(gt3,4))*ZN(gt1,7)*ZN(gt2,1))
resR = resR-(dgp*Qs1*Conjg(ZH(gt3,4))*ZN(gt1,7)*ZN(gt2,1))
resR = resR-(gp*Qs2*Conjg(dZH(gt3,5))*ZN(gt1,8)*ZN(gt2,1))
resR = resR-(dgp*Qs2*Conjg(ZH(gt3,5))*ZN(gt1,8)*ZN(gt2,1))
resR = resR-(gp*Qs3*Conjg(dZH(gt3,6))*ZN(gt1,9)*ZN(gt2,1))
resR = resR-(dgp*Qs3*Conjg(ZH(gt3,6))*ZN(gt1,9)*ZN(gt2,1))
resR = resR+(g1*Conjg(ZH(gt3,1))*dZN(gt1,4)*ZN(gt2,2))/2._dp
resR = resR-(g1*Conjg(ZH(gt3,2))*dZN(gt1,5)*ZN(gt2,2))/2._dp
resR = resR+(g1*Conjg(dZH(gt3,1))*ZN(gt1,4)*ZN(gt2,2))/2._dp
resR = resR+(dg1*Conjg(ZH(gt3,1))*ZN(gt1,4)*ZN(gt2,2))/2._dp
resR = resR-(g1*Conjg(dZH(gt3,2))*ZN(gt1,5)*ZN(gt2,2))/2._dp
resR = resR-(dg1*Conjg(ZH(gt3,2))*ZN(gt1,5)*ZN(gt2,2))/2._dp
resR = resR-(g2*Conjg(ZH(gt3,1))*dZN(gt1,4)*ZN(gt2,3))/2._dp
resR = resR+(g2*Conjg(ZH(gt3,2))*dZN(gt1,5)*ZN(gt2,3))/2._dp
resR = resR-(g2*Conjg(dZH(gt3,1))*ZN(gt1,4)*ZN(gt2,3))/2._dp
resR = resR-(dg2*Conjg(ZH(gt3,1))*ZN(gt1,4)*ZN(gt2,3))/2._dp
resR = resR+(g2*Conjg(dZH(gt3,2))*ZN(gt1,5)*ZN(gt2,3))/2._dp
resR = resR+(dg2*Conjg(ZH(gt3,2))*ZN(gt1,5)*ZN(gt2,3))/2._dp
resR = resR-(gp*QHd*Conjg(ZH(gt3,1))*dZN(gt1,1)*ZN(gt2,4))
resR = resR+(g1*Conjg(ZH(gt3,1))*dZN(gt1,2)*ZN(gt2,4))/2._dp
resR = resR-(g2*Conjg(ZH(gt3,1))*dZN(gt1,3)*ZN(gt2,4))/2._dp
resR = resR+(Conjg(lam)*Conjg(ZH(gt3,3))*dZN(gt1,5)*ZN(gt2,4))/sqrt(2._dp)
resR = resR+(Conjg(lam)*Conjg(ZH(gt3,2))*dZN(gt1,6)*ZN(gt2,4))/sqrt(2._dp)
resR = resR-(gp*QHd*Conjg(dZH(gt3,1))*ZN(gt1,1)*ZN(gt2,4))
resR = resR-(dgp*QHd*Conjg(ZH(gt3,1))*ZN(gt1,1)*ZN(gt2,4))
resR = resR+(g1*Conjg(dZH(gt3,1))*ZN(gt1,2)*ZN(gt2,4))/2._dp
resR = resR+(dg1*Conjg(ZH(gt3,1))*ZN(gt1,2)*ZN(gt2,4))/2._dp
resR = resR-(g2*Conjg(dZH(gt3,1))*ZN(gt1,3)*ZN(gt2,4))/2._dp
resR = resR-(dg2*Conjg(ZH(gt3,1))*ZN(gt1,3)*ZN(gt2,4))/2._dp
resR = resR+(Conjg(lam)*Conjg(dZH(gt3,3))*ZN(gt1,5)*ZN(gt2,4))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*Conjg(ZH(gt3,3))*ZN(gt1,5)*ZN(gt2,4))/sqrt(2._dp)
resR = resR+(Conjg(lam)*Conjg(dZH(gt3,2))*ZN(gt1,6)*ZN(gt2,4))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*Conjg(ZH(gt3,2))*ZN(gt1,6)*ZN(gt2,4))/sqrt(2._dp)
resR = resR-(gp*QHu*Conjg(ZH(gt3,2))*dZN(gt1,1)*ZN(gt2,5))
resR = resR-(g1*Conjg(ZH(gt3,2))*dZN(gt1,2)*ZN(gt2,5))/2._dp
resR = resR+(g2*Conjg(ZH(gt3,2))*dZN(gt1,3)*ZN(gt2,5))/2._dp
resR = resR+(Conjg(lam)*Conjg(ZH(gt3,3))*dZN(gt1,4)*ZN(gt2,5))/sqrt(2._dp)
resR = resR+(Conjg(lam)*Conjg(ZH(gt3,1))*dZN(gt1,6)*ZN(gt2,5))/sqrt(2._dp)
resR = resR-(gp*QHu*Conjg(dZH(gt3,2))*ZN(gt1,1)*ZN(gt2,5))
resR = resR-(dgp*QHu*Conjg(ZH(gt3,2))*ZN(gt1,1)*ZN(gt2,5))
resR = resR-(g1*Conjg(dZH(gt3,2))*ZN(gt1,2)*ZN(gt2,5))/2._dp
resR = resR-(dg1*Conjg(ZH(gt3,2))*ZN(gt1,2)*ZN(gt2,5))/2._dp
resR = resR+(g2*Conjg(dZH(gt3,2))*ZN(gt1,3)*ZN(gt2,5))/2._dp
resR = resR+(dg2*Conjg(ZH(gt3,2))*ZN(gt1,3)*ZN(gt2,5))/2._dp
resR = resR+(Conjg(lam)*Conjg(dZH(gt3,3))*ZN(gt1,4)*ZN(gt2,5))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*Conjg(ZH(gt3,3))*ZN(gt1,4)*ZN(gt2,5))/sqrt(2._dp)
resR = resR+(Conjg(lam)*Conjg(dZH(gt3,1))*ZN(gt1,6)*ZN(gt2,5))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*Conjg(ZH(gt3,1))*ZN(gt1,6)*ZN(gt2,5))/sqrt(2._dp)
resR = resR-(gp*Qs*Conjg(ZH(gt3,3))*dZN(gt1,1)*ZN(gt2,6))
resR = resR+(Conjg(lam)*Conjg(ZH(gt3,2))*dZN(gt1,4)*ZN(gt2,6))/sqrt(2._dp)
resR = resR+(Conjg(lam)*Conjg(ZH(gt3,1))*dZN(gt1,5)*ZN(gt2,6))/sqrt(2._dp)
resR = resR-(gp*Qs*Conjg(dZH(gt3,3))*ZN(gt1,1)*ZN(gt2,6))
resR = resR-(dgp*Qs*Conjg(ZH(gt3,3))*ZN(gt1,1)*ZN(gt2,6))
resR = resR+(Conjg(lam)*Conjg(dZH(gt3,2))*ZN(gt1,4)*ZN(gt2,6))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*Conjg(ZH(gt3,2))*ZN(gt1,4)*ZN(gt2,6))/sqrt(2._dp)
resR = resR+(Conjg(lam)*Conjg(dZH(gt3,1))*ZN(gt1,5)*ZN(gt2,6))/sqrt(2._dp)
resR = resR+(Conjg(dlam)*Conjg(ZH(gt3,1))*ZN(gt1,5)*ZN(gt2,6))/sqrt(2._dp)
resR = resR-(gp*Qs1*Conjg(ZH(gt3,4))*dZN(gt1,1)*ZN(gt2,7))
resR = resR-(Conjg(kap)*Conjg(ZH(gt3,6))*dZN(gt1,8)*ZN(gt2,7))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(kap)*Conjg(ZH(gt3,5))*dZN(gt1,9)*ZN(gt2,7))/(3._dp*sqrt(2._dp))
resR = resR-(gp*Qs1*Conjg(dZH(gt3,4))*ZN(gt1,1)*ZN(gt2,7))
resR = resR-(dgp*Qs1*Conjg(ZH(gt3,4))*ZN(gt1,1)*ZN(gt2,7))
resR = resR-(Conjg(kap)*Conjg(dZH(gt3,6))*ZN(gt1,8)*ZN(gt2,7))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(dkap)*Conjg(ZH(gt3,6))*ZN(gt1,8)*ZN(gt2,7))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(kap)*Conjg(dZH(gt3,5))*ZN(gt1,9)*ZN(gt2,7))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(dkap)*Conjg(ZH(gt3,5))*ZN(gt1,9)*ZN(gt2,7))/(3._dp*sqrt(2._dp))
resR = resR-(gp*Qs2*Conjg(ZH(gt3,5))*dZN(gt1,1)*ZN(gt2,8))
resR = resR-(Conjg(kap)*Conjg(ZH(gt3,6))*dZN(gt1,7)*ZN(gt2,8))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(kap)*Conjg(ZH(gt3,4))*dZN(gt1,9)*ZN(gt2,8))/(3._dp*sqrt(2._dp))
resR = resR-(gp*Qs2*Conjg(dZH(gt3,5))*ZN(gt1,1)*ZN(gt2,8))
resR = resR-(dgp*Qs2*Conjg(ZH(gt3,5))*ZN(gt1,1)*ZN(gt2,8))
resR = resR-(Conjg(kap)*Conjg(dZH(gt3,6))*ZN(gt1,7)*ZN(gt2,8))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(dkap)*Conjg(ZH(gt3,6))*ZN(gt1,7)*ZN(gt2,8))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(kap)*Conjg(dZH(gt3,4))*ZN(gt1,9)*ZN(gt2,8))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(dkap)*Conjg(ZH(gt3,4))*ZN(gt1,9)*ZN(gt2,8))/(3._dp*sqrt(2._dp))
resR = resR-(gp*Qs3*Conjg(ZH(gt3,6))*dZN(gt1,1)*ZN(gt2,9))
resR = resR-(Conjg(kap)*Conjg(ZH(gt3,5))*dZN(gt1,7)*ZN(gt2,9))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(kap)*Conjg(ZH(gt3,4))*dZN(gt1,8)*ZN(gt2,9))/(3._dp*sqrt(2._dp))
resR = resR-(gp*Qs3*Conjg(dZH(gt3,6))*ZN(gt1,1)*ZN(gt2,9))
resR = resR-(dgp*Qs3*Conjg(ZH(gt3,6))*ZN(gt1,1)*ZN(gt2,9))
resR = resR-(Conjg(kap)*Conjg(dZH(gt3,5))*ZN(gt1,7)*ZN(gt2,9))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(dkap)*Conjg(ZH(gt3,5))*ZN(gt1,7)*ZN(gt2,9))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(kap)*Conjg(dZH(gt3,4))*ZN(gt1,8)*ZN(gt2,9))/(3._dp*sqrt(2._dp))
resR = resR-(Conjg(dkap)*Conjg(ZH(gt3,4))*ZN(gt1,8)*ZN(gt2,9))/(3._dp*sqrt(2._dp))
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiChihh  
 
 
Subroutine CT_CouplingChiFdcSd(gt1,gt2,gt3,g1,g2,gp,Yd,ZD,ZN,ZDL,ZDR,dg1,             & 
& dg2,dgp,dYd,dZD,dZN,dZDL,dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gp,dg1,dg2,dgp

Complex(dp), Intent(in) :: Yd(3,3),ZD(6,6),ZN(9,9),ZDL(3,3),ZDR(3,3),dYd(3,3),dZD(6,6),dZN(9,9),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiFdcSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Qq*Conjg(ZDL(gt2,j1))*Conjg(ZN(gt1,1))*dZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(ZDL(gt2,j1))*Conjg(ZN(gt1,2))*dZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(ZDL(gt2,j1))*Conjg(ZN(gt1,3))*dZD(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Qq*Conjg(dZN(gt1,1))*Conjg(ZDL(gt2,j1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(dZN(gt1,2))*Conjg(ZDL(gt2,j1))*ZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(dZN(gt1,3))*Conjg(ZDL(gt2,j1))*ZD(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Qq*Conjg(dZDL(gt2,j1))*Conjg(ZN(gt1,1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dgp*Qq*Conjg(ZDL(gt2,j1))*Conjg(ZN(gt1,1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(dZDL(gt2,j1))*Conjg(ZN(gt1,2))*ZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(dg1*Conjg(ZDL(gt2,j1))*Conjg(ZN(gt1,2))*ZD(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(dZDL(gt2,j1))*Conjg(ZN(gt1,3))*ZD(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(dg2*Conjg(ZDL(gt2,j1))*Conjg(ZN(gt1,3))*ZD(gt3,j1))/sqrt(2._dp)
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZDL(gt2,j2))*Conjg(ZN(gt1,4))*dZD(gt3,3 + j1)*Yd(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZDL(gt2,j2))*Conjg(ZN(gt1,4))*dYd(j1,j2)*ZD(gt3,3 + j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZN(gt1,4))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZD(gt3,3 + j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZDL(gt2,j2))*Conjg(ZN(gt1,4))*Yd(j1,j2)*ZD(gt3,3 + j1))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Qd*dZN(gt1,1)*ZD(gt3,3 + j1)*ZDR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g1*dZN(gt1,2)*ZD(gt3,3 + j1)*ZDR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Qd*dZDR(gt2,j1)*ZD(gt3,3 + j1)*ZN(gt1,1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Qd*dZD(gt3,3 + j1)*ZDR(gt2,j1)*ZN(gt1,1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dgp*Qd*ZD(gt3,3 + j1)*ZDR(gt2,j1)*ZN(gt1,1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g1*dZDR(gt2,j1)*ZD(gt3,3 + j1)*ZN(gt1,2))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g1*dZD(gt3,3 + j1)*ZDR(gt2,j1)*ZN(gt1,2))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dg1*ZD(gt3,3 + j1)*ZDR(gt2,j1)*ZN(gt1,2))/3._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,j2))*dZN(gt1,4)*ZD(gt3,j2)*ZDR(gt2,j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,j2))*dZDR(gt2,j1)*ZD(gt3,j2)*ZN(gt1,4))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,j2))*dZD(gt3,j2)*ZDR(gt2,j1)*ZN(gt1,4))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYd(j1,j2))*ZD(gt3,j2)*ZDR(gt2,j1)*ZN(gt1,4))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiFdcSd  
 
 
Subroutine CT_CouplingChiFecSe(gt1,gt2,gt3,g1,g2,gp,Ye,ZE,ZN,ZEL,ZER,dg1,             & 
& dg2,dgp,dYe,dZE,dZN,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gp,dg1,dg2,dgp

Complex(dp), Intent(in) :: Ye(3,3),ZE(6,6),ZN(9,9),ZEL(3,3),ZER(3,3),dYe(3,3),dZE(6,6),dZN(9,9),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiFecSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Ql*Conjg(ZEL(gt2,j1))*Conjg(ZN(gt1,1))*dZE(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(ZEL(gt2,j1))*Conjg(ZN(gt1,2))*dZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(ZEL(gt2,j1))*Conjg(ZN(gt1,3))*dZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Ql*Conjg(dZN(gt1,1))*Conjg(ZEL(gt2,j1))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZN(gt1,2))*Conjg(ZEL(gt2,j1))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(dZN(gt1,3))*Conjg(ZEL(gt2,j1))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Ql*Conjg(dZEL(gt2,j1))*Conjg(ZN(gt1,1))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dgp*Ql*Conjg(ZEL(gt2,j1))*Conjg(ZN(gt1,1))*ZE(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZEL(gt2,j1))*Conjg(ZN(gt1,2))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(dg1*Conjg(ZEL(gt2,j1))*Conjg(ZN(gt1,2))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(g2*Conjg(dZEL(gt2,j1))*Conjg(ZN(gt1,3))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL+(dg2*Conjg(ZEL(gt2,j1))*Conjg(ZN(gt1,3))*ZE(gt3,j1))/sqrt(2._dp)
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZEL(gt2,j2))*Conjg(ZN(gt1,4))*dZE(gt3,3 + j1)*Ye(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZEL(gt2,j2))*Conjg(ZN(gt1,4))*dYe(j1,j2)*ZE(gt3,3 + j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZN(gt1,4))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZE(gt3,3 + j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZEL(gt2,j2))*Conjg(ZN(gt1,4))*Ye(j1,j2)*ZE(gt3,3 + j1))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Qe*dZN(gt1,1)*ZE(gt3,3 + j1)*ZER(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g1*dZN(gt1,2)*ZE(gt3,3 + j1)*ZER(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Qe*dZER(gt2,j1)*ZE(gt3,3 + j1)*ZN(gt1,1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Qe*dZE(gt3,3 + j1)*ZER(gt2,j1)*ZN(gt1,1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dgp*Qe*ZE(gt3,3 + j1)*ZER(gt2,j1)*ZN(gt1,1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g1*dZER(gt2,j1)*ZE(gt3,3 + j1)*ZN(gt1,2))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g1*dZE(gt3,3 + j1)*ZER(gt2,j1)*ZN(gt1,2))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dg1*ZE(gt3,3 + j1)*ZER(gt2,j1)*ZN(gt1,2))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,j2))*dZN(gt1,4)*ZE(gt3,j2)*ZER(gt2,j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,j2))*dZER(gt2,j1)*ZE(gt3,j2)*ZN(gt1,4))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,j2))*dZE(gt3,j2)*ZER(gt2,j1)*ZN(gt1,4))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYe(j1,j2))*ZE(gt3,j2)*ZER(gt2,j1)*ZN(gt1,4))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiFecSe  
 
 
Subroutine CT_CouplingChiFucSu(gt1,gt2,gt3,g1,g2,gp,Yu,ZU,ZN,ZUL,ZUR,dg1,             & 
& dg2,dgp,dYu,dZU,dZN,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gp,dg1,dg2,dgp

Complex(dp), Intent(in) :: Yu(3,3),ZU(6,6),ZN(9,9),ZUL(3,3),ZUR(3,3),dYu(3,3),dZU(6,6),dZN(9,9),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiFucSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Qq*Conjg(ZN(gt1,1))*Conjg(ZUL(gt2,j1))*dZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(ZN(gt1,2))*Conjg(ZUL(gt2,j1))*dZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZN(gt1,3))*Conjg(ZUL(gt2,j1))*dZU(gt3,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Qq*Conjg(dZUL(gt2,j1))*Conjg(ZN(gt1,1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(dZUL(gt2,j1))*Conjg(ZN(gt1,2))*ZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZUL(gt2,j1))*Conjg(ZN(gt1,3))*ZU(gt3,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Qq*Conjg(dZN(gt1,1))*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g1*Conjg(dZN(gt1,2))*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZN(gt1,3))*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dgp*Qq*Conjg(ZN(gt1,1))*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(dg1*Conjg(ZN(gt1,2))*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(ZN(gt1,3))*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZN(gt1,5))*Conjg(ZUL(gt2,j2))*dZU(gt3,3 + j1)*Yu(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZN(gt1,5))*Conjg(ZUL(gt2,j2))*dYu(j1,j2)*ZU(gt3,3 + j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZUL(gt2,j2))*Conjg(ZN(gt1,5))*Yu(j1,j2)*ZU(gt3,3 + j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZN(gt1,5))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZU(gt3,3 + j1))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Qu*dZUR(gt2,j1)*ZN(gt1,1)*ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
resR = resR+(2*sqrt(2._dp)*g1*dZUR(gt2,j1)*ZN(gt1,2)*ZU(gt3,3 + j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Qu*dZU(gt3,3 + j1)*ZN(gt1,1)*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(2*sqrt(2._dp)*g1*dZU(gt3,3 + j1)*ZN(gt1,2)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Qu*dZN(gt1,1)*ZU(gt3,3 + j1)*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(2*sqrt(2._dp)*g1*dZN(gt1,2)*ZU(gt3,3 + j1)*ZUR(gt2,j1))/3._dp
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dgp*Qu*ZN(gt1,1)*ZU(gt3,3 + j1)*ZUR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR+(2*sqrt(2._dp)*dg1*ZN(gt1,2)*ZU(gt3,3 + j1)*ZUR(gt2,j1))/3._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,j2))*dZUR(gt2,j1)*ZN(gt1,5)*ZU(gt3,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,j2))*dZU(gt3,j2)*ZN(gt1,5)*ZUR(gt2,j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,j2))*dZN(gt1,5)*ZU(gt3,j2)*ZUR(gt2,j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYu(j1,j2))*ZN(gt1,5)*ZU(gt3,j2)*ZUR(gt2,j1))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiFucSu  
 
 
Subroutine CT_CouplingChiFvcSv(gt1,gt2,gt3,g1,g2,gp,Yv,ZV,ZN,ZVL,ZVR,dg1,             & 
& dg2,dgp,dYv,dZV,dZN,dZVL,dZVR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gp,dg1,dg2,dgp

Complex(dp), Intent(in) :: Yv(3,3),ZV(6,6),ZN(9,9),ZVL(3,3),ZVR(3,3),dYv(3,3),dZV(6,6),dZN(9,9),dZVL(3,3),dZVR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiFvcSv' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Ql*Conjg(ZN(gt1,1))*Conjg(ZVL(gt2,j1))*dZV(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(ZN(gt1,2))*Conjg(ZVL(gt2,j1))*dZV(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZN(gt1,3))*Conjg(ZVL(gt2,j1))*dZV(gt3,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Ql*Conjg(dZVL(gt2,j1))*Conjg(ZN(gt1,1))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZVL(gt2,j1))*Conjg(ZN(gt1,2))*ZV(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZVL(gt2,j1))*Conjg(ZN(gt1,3))*ZV(gt3,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Ql*Conjg(dZN(gt1,1))*Conjg(ZVL(gt2,j1))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL+(g1*Conjg(dZN(gt1,2))*Conjg(ZVL(gt2,j1))*ZV(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZN(gt1,3))*Conjg(ZVL(gt2,j1))*ZV(gt3,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dgp*Ql*Conjg(ZN(gt1,1))*Conjg(ZVL(gt2,j1))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL+(dg1*Conjg(ZN(gt1,2))*Conjg(ZVL(gt2,j1))*ZV(gt3,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(ZN(gt1,3))*Conjg(ZVL(gt2,j1))*ZV(gt3,j1))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZN(gt1,5))*Conjg(ZVL(gt2,j1))*dZV(gt3,3 + j2)*Yv(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZN(gt1,5))*Conjg(ZVL(gt2,j1))*dYv(j1,j2)*ZV(gt3,3 + j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZVL(gt2,j1))*Conjg(ZN(gt1,5))*Yv(j1,j2)*ZV(gt3,3 + j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZN(gt1,5))*Conjg(ZVL(gt2,j1))*Yv(j1,j2)*ZV(gt3,3 + j2))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Qv*dZVR(gt2,j1)*ZN(gt1,1)*ZV(gt3,3 + j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Qv*dZV(gt3,3 + j1)*ZN(gt1,1)*ZVR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Qv*dZN(gt1,1)*ZV(gt3,3 + j1)*ZVR(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dgp*Qv*ZN(gt1,1)*ZV(gt3,3 + j1)*ZVR(gt2,j1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yv(j1,j2))*dZVR(gt2,j2)*ZN(gt1,5)*ZV(gt3,j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yv(j1,j2))*dZV(gt3,j1)*ZN(gt1,5)*ZVR(gt2,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yv(j1,j2))*dZN(gt1,5)*ZV(gt3,j1)*ZVR(gt2,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYv(j1,j2))*ZN(gt1,5)*ZV(gt3,j1)*ZVR(gt2,j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiFvcSv  
 
 
Subroutine CT_CouplingcChaChiHpm(gt1,gt2,gt3,g1,g2,gp,lam,ZP,ZN,UM,UP,dg1,            & 
& dg2,dgp,dlam,dZP,dZN,dUM,dUP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gp,ZP(2,2),dg1,dg2,dgp,dZP(2,2)

Complex(dp), Intent(in) :: lam,ZN(9,9),UM(2,2),UP(2,2),dlam,dZN(9,9),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaChiHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(lam*Conjg(UP(gt1,2))*Conjg(ZN(gt2,6))*dZP(gt3,1))
resL = resL-(sqrt(2._dp)*gp*QHu*Conjg(UP(gt1,2))*Conjg(ZN(gt2,1))*dZP(gt3,2))
resL = resL-((g1*Conjg(UP(gt1,2))*Conjg(ZN(gt2,2))*dZP(gt3,2))/sqrt(2._dp))
resL = resL-((g2*Conjg(UP(gt1,2))*Conjg(ZN(gt2,3))*dZP(gt3,2))/sqrt(2._dp))
resL = resL-(g2*Conjg(UP(gt1,1))*Conjg(ZN(gt2,5))*dZP(gt3,2))
resL = resL-(lam*Conjg(dZN(gt2,6))*Conjg(UP(gt1,2))*ZP(gt3,1))
resL = resL-(lam*Conjg(dUP(gt1,2))*Conjg(ZN(gt2,6))*ZP(gt3,1))
resL = resL-(dlam*Conjg(UP(gt1,2))*Conjg(ZN(gt2,6))*ZP(gt3,1))
resL = resL-(g2*Conjg(dZN(gt2,5))*Conjg(UP(gt1,1))*ZP(gt3,2))
resL = resL-(sqrt(2._dp)*gp*QHu*Conjg(dZN(gt2,1))*Conjg(UP(gt1,2))*ZP(gt3,2))
resL = resL-((g1*Conjg(dZN(gt2,2))*Conjg(UP(gt1,2))*ZP(gt3,2))/sqrt(2._dp))
resL = resL-((g2*Conjg(dZN(gt2,3))*Conjg(UP(gt1,2))*ZP(gt3,2))/sqrt(2._dp))
resL = resL-(sqrt(2._dp)*gp*QHu*Conjg(dUP(gt1,2))*Conjg(ZN(gt2,1))*ZP(gt3,2))
resL = resL-(sqrt(2._dp)*dgp*QHu*Conjg(UP(gt1,2))*Conjg(ZN(gt2,1))*ZP(gt3,2))
resL = resL-((g1*Conjg(dUP(gt1,2))*Conjg(ZN(gt2,2))*ZP(gt3,2))/sqrt(2._dp))
resL = resL-((dg1*Conjg(UP(gt1,2))*Conjg(ZN(gt2,2))*ZP(gt3,2))/sqrt(2._dp))
resL = resL-((g2*Conjg(dUP(gt1,2))*Conjg(ZN(gt2,3))*ZP(gt3,2))/sqrt(2._dp))
resL = resL-((dg2*Conjg(UP(gt1,2))*Conjg(ZN(gt2,3))*ZP(gt3,2))/sqrt(2._dp))
resL = resL-(g2*Conjg(dUP(gt1,1))*Conjg(ZN(gt2,5))*ZP(gt3,2))
resL = resL-(dg2*Conjg(UP(gt1,1))*Conjg(ZN(gt2,5))*ZP(gt3,2))
resR = 0._dp 
resR = resR-(sqrt(2._dp)*gp*QHd*dZP(gt3,1)*UM(gt1,2)*ZN(gt2,1))
resR = resR+(g1*dZP(gt3,1)*UM(gt1,2)*ZN(gt2,2))/sqrt(2._dp)
resR = resR+(g2*dZP(gt3,1)*UM(gt1,2)*ZN(gt2,3))/sqrt(2._dp)
resR = resR-(g2*dZP(gt3,1)*UM(gt1,1)*ZN(gt2,4))
resR = resR-(Conjg(lam)*dZP(gt3,2)*UM(gt1,2)*ZN(gt2,6))
resR = resR-(g2*dZN(gt2,4)*UM(gt1,1)*ZP(gt3,1))
resR = resR-(sqrt(2._dp)*gp*QHd*dZN(gt2,1)*UM(gt1,2)*ZP(gt3,1))
resR = resR+(g1*dZN(gt2,2)*UM(gt1,2)*ZP(gt3,1))/sqrt(2._dp)
resR = resR+(g2*dZN(gt2,3)*UM(gt1,2)*ZP(gt3,1))/sqrt(2._dp)
resR = resR-(sqrt(2._dp)*gp*QHd*dUM(gt1,2)*ZN(gt2,1)*ZP(gt3,1))
resR = resR-(sqrt(2._dp)*dgp*QHd*UM(gt1,2)*ZN(gt2,1)*ZP(gt3,1))
resR = resR+(g1*dUM(gt1,2)*ZN(gt2,2)*ZP(gt3,1))/sqrt(2._dp)
resR = resR+(dg1*UM(gt1,2)*ZN(gt2,2)*ZP(gt3,1))/sqrt(2._dp)
resR = resR+(g2*dUM(gt1,2)*ZN(gt2,3)*ZP(gt3,1))/sqrt(2._dp)
resR = resR+(dg2*UM(gt1,2)*ZN(gt2,3)*ZP(gt3,1))/sqrt(2._dp)
resR = resR-(g2*dUM(gt1,1)*ZN(gt2,4)*ZP(gt3,1))
resR = resR-(dg2*UM(gt1,1)*ZN(gt2,4)*ZP(gt3,1))
resR = resR-(Conjg(lam)*dZN(gt2,6)*UM(gt1,2)*ZP(gt3,2))
resR = resR-(Conjg(lam)*dUM(gt1,2)*ZN(gt2,6)*ZP(gt3,2))
resR = resR-(Conjg(dlam)*UM(gt1,2)*ZN(gt2,6)*ZP(gt3,2))
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaChiHpm  
 
 
Subroutine CT_CouplingcFdChiSd(gt1,gt2,gt3,g1,g2,gp,Yd,ZD,ZN,ZDL,ZDR,dg1,             & 
& dg2,dgp,dYd,dZD,dZN,dZDL,dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gp,dg1,dg2,dgp

Complex(dp), Intent(in) :: Yd(3,3),ZD(6,6),ZN(9,9),ZDL(3,3),ZDR(3,3),dYd(3,3),dZD(6,6),dZN(9,9),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdChiSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Qd*Conjg(dZN(gt2,1))*Conjg(ZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1)))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g1*Conjg(dZN(gt2,2))*Conjg(ZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Qd*Conjg(dZDR(gt1,j1))*Conjg(ZD(gt3,3 + j1))*Conjg(ZN(gt2,1)))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Qd*Conjg(dZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))*Conjg(ZN(gt2,1)))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dgp*Qd*Conjg(ZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))*Conjg(ZN(gt2,1)))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g1*Conjg(dZDR(gt1,j1))*Conjg(ZD(gt3,3 + j1))*Conjg(ZN(gt2,2)))/3._dp
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g1*Conjg(dZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))*Conjg(ZN(gt2,2)))/3._dp
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dg1*Conjg(ZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))*Conjg(ZN(gt2,2)))/3._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZD(gt3,j2))*Conjg(ZDR(gt1,j1))*Conjg(ZN(gt2,4))*dYd(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZN(gt2,4))*Conjg(ZD(gt3,j2))*Conjg(ZDR(gt1,j1))*Yd(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZDR(gt1,j1))*Conjg(ZD(gt3,j2))*Conjg(ZN(gt2,4))*Yd(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZD(gt3,j2))*Conjg(ZDR(gt1,j1))*Conjg(ZN(gt2,4))*Yd(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Qq*Conjg(ZD(gt3,j1))*dZN(gt2,1)*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZD(gt3,j1))*dZN(gt2,2)*ZDL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(ZD(gt3,j1))*dZN(gt2,3)*ZDL(gt1,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Qq*Conjg(ZD(gt3,j1))*dZDL(gt1,j1)*ZN(gt2,1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Qq*Conjg(dZD(gt3,j1))*ZDL(gt1,j1)*ZN(gt2,1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dgp*Qq*Conjg(ZD(gt3,j1))*ZDL(gt1,j1)*ZN(gt2,1))
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZD(gt3,j1))*dZDL(gt1,j1)*ZN(gt2,2))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(dZD(gt3,j1))*ZDL(gt1,j1)*ZN(gt2,2))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(dg1*Conjg(ZD(gt3,j1))*ZDL(gt1,j1)*ZN(gt2,2))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(ZD(gt3,j1))*dZDL(gt1,j1)*ZN(gt2,3))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(dZD(gt3,j1))*ZDL(gt1,j1)*ZN(gt2,3))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(dg2*Conjg(ZD(gt3,j1))*ZDL(gt1,j1)*ZN(gt2,3))/sqrt(2._dp)
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,j2))*Conjg(ZD(gt3,3 + j1))*dZN(gt2,4)*ZDL(gt1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,j2))*Conjg(ZD(gt3,3 + j1))*dZDL(gt1,j2)*ZN(gt2,4))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dZD(gt3,3 + j1))*Conjg(Yd(j1,j2))*ZDL(gt1,j2)*ZN(gt2,4))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYd(j1,j2))*Conjg(ZD(gt3,3 + j1))*ZDL(gt1,j2)*ZN(gt2,4))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdChiSd  
 
 
Subroutine CT_CouplingcFeChiSe(gt1,gt2,gt3,g1,g2,gp,Ye,ZE,ZN,ZEL,ZER,dg1,             & 
& dg2,dgp,dYe,dZE,dZN,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gp,dg1,dg2,dgp

Complex(dp), Intent(in) :: Ye(3,3),ZE(6,6),ZN(9,9),ZEL(3,3),ZER(3,3),dYe(3,3),dZE(6,6),dZN(9,9),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeChiSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Qe*Conjg(dZN(gt2,1))*Conjg(ZE(gt3,3 + j1))*Conjg(ZER(gt1,j1)))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g1*Conjg(dZN(gt2,2))*Conjg(ZE(gt3,3 + j1))*Conjg(ZER(gt1,j1)))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Qe*Conjg(dZER(gt1,j1))*Conjg(ZE(gt3,3 + j1))*Conjg(ZN(gt2,1)))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Qe*Conjg(dZE(gt3,3 + j1))*Conjg(ZER(gt1,j1))*Conjg(ZN(gt2,1)))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dgp*Qe*Conjg(ZE(gt3,3 + j1))*Conjg(ZER(gt1,j1))*Conjg(ZN(gt2,1)))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g1*Conjg(dZER(gt1,j1))*Conjg(ZE(gt3,3 + j1))*Conjg(ZN(gt2,2)))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g1*Conjg(dZE(gt3,3 + j1))*Conjg(ZER(gt1,j1))*Conjg(ZN(gt2,2)))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dg1*Conjg(ZE(gt3,3 + j1))*Conjg(ZER(gt1,j1))*Conjg(ZN(gt2,2)))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZE(gt3,j2))*Conjg(ZER(gt1,j1))*Conjg(ZN(gt2,4))*dYe(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZN(gt2,4))*Conjg(ZE(gt3,j2))*Conjg(ZER(gt1,j1))*Ye(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZER(gt1,j1))*Conjg(ZE(gt3,j2))*Conjg(ZN(gt2,4))*Ye(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZE(gt3,j2))*Conjg(ZER(gt1,j1))*Conjg(ZN(gt2,4))*Ye(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Ql*Conjg(ZE(gt3,j1))*dZN(gt2,1)*ZEL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZE(gt3,j1))*dZN(gt2,2)*ZEL(gt1,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(ZE(gt3,j1))*dZN(gt2,3)*ZEL(gt1,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Ql*Conjg(ZE(gt3,j1))*dZEL(gt1,j1)*ZN(gt2,1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Ql*Conjg(dZE(gt3,j1))*ZEL(gt1,j1)*ZN(gt2,1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dgp*Ql*Conjg(ZE(gt3,j1))*ZEL(gt1,j1)*ZN(gt2,1))
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZE(gt3,j1))*dZEL(gt1,j1)*ZN(gt2,2))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(dZE(gt3,j1))*ZEL(gt1,j1)*ZN(gt2,2))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(dg1*Conjg(ZE(gt3,j1))*ZEL(gt1,j1)*ZN(gt2,2))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(ZE(gt3,j1))*dZEL(gt1,j1)*ZN(gt2,3))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(g2*Conjg(dZE(gt3,j1))*ZEL(gt1,j1)*ZN(gt2,3))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(dg2*Conjg(ZE(gt3,j1))*ZEL(gt1,j1)*ZN(gt2,3))/sqrt(2._dp)
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,j2))*Conjg(ZE(gt3,3 + j1))*dZN(gt2,4)*ZEL(gt1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,j2))*Conjg(ZE(gt3,3 + j1))*dZEL(gt1,j2)*ZN(gt2,4))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dZE(gt3,3 + j1))*Conjg(Ye(j1,j2))*ZEL(gt1,j2)*ZN(gt2,4))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYe(j1,j2))*Conjg(ZE(gt3,3 + j1))*ZEL(gt1,j2)*ZN(gt2,4))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeChiSe  
 
 
Subroutine CT_CouplingcFuChiSu(gt1,gt2,gt3,g1,g2,gp,Yu,ZU,ZN,ZUL,ZUR,dg1,             & 
& dg2,dgp,dYu,dZU,dZN,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gp,dg1,dg2,dgp

Complex(dp), Intent(in) :: Yu(3,3),ZU(6,6),ZN(9,9),ZUL(3,3),ZUR(3,3),dYu(3,3),dZU(6,6),dZN(9,9),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuChiSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Qu*Conjg(dZUR(gt1,j1))*Conjg(ZN(gt2,1))*Conjg(ZU(gt3,3 + j1)))
End Do 
Do j1 = 1,3
resL = resL+(2*sqrt(2._dp)*g1*Conjg(dZUR(gt1,j1))*Conjg(ZN(gt2,2))*Conjg(ZU(gt3,3 + j1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Qu*Conjg(dZU(gt3,3 + j1))*Conjg(ZN(gt2,1))*Conjg(ZUR(gt1,j1)))
End Do 
Do j1 = 1,3
resL = resL+(2*sqrt(2._dp)*g1*Conjg(dZU(gt3,3 + j1))*Conjg(ZN(gt2,2))*Conjg(ZUR(gt1,j1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Qu*Conjg(dZN(gt2,1))*Conjg(ZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1)))
End Do 
Do j1 = 1,3
resL = resL+(2*sqrt(2._dp)*g1*Conjg(dZN(gt2,2))*Conjg(ZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1)))/3._dp
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dgp*Qu*Conjg(ZN(gt2,1))*Conjg(ZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1)))
End Do 
Do j1 = 1,3
resL = resL+(2*sqrt(2._dp)*dg1*Conjg(ZN(gt2,2))*Conjg(ZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1)))/3._dp
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZN(gt2,5))*Conjg(ZU(gt3,j2))*Conjg(ZUR(gt1,j1))*dYu(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZUR(gt1,j1))*Conjg(ZN(gt2,5))*Conjg(ZU(gt3,j2))*Yu(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZU(gt3,j2))*Conjg(ZN(gt2,5))*Conjg(ZUR(gt1,j1))*Yu(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZN(gt2,5))*Conjg(ZU(gt3,j2))*Conjg(ZUR(gt1,j1))*Yu(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Qq*Conjg(ZU(gt3,j1))*dZUL(gt1,j1)*ZN(gt2,1))
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZU(gt3,j1))*dZUL(gt1,j1)*ZN(gt2,2))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-((g2*Conjg(ZU(gt3,j1))*dZUL(gt1,j1)*ZN(gt2,3))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Qq*Conjg(ZU(gt3,j1))*dZN(gt2,1)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(ZU(gt3,j1))*dZN(gt2,2)*ZUL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-((g2*Conjg(ZU(gt3,j1))*dZN(gt2,3)*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Qq*Conjg(dZU(gt3,j1))*ZN(gt2,1)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dgp*Qq*Conjg(ZU(gt3,j1))*ZN(gt2,1)*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(g1*Conjg(dZU(gt3,j1))*ZN(gt2,2)*ZUL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(dg1*Conjg(ZU(gt3,j1))*ZN(gt2,2)*ZUL(gt1,j1))/(3._dp*sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-((g2*Conjg(dZU(gt3,j1))*ZN(gt2,3)*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-((dg2*Conjg(ZU(gt3,j1))*ZN(gt2,3)*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,j2))*Conjg(ZU(gt3,3 + j1))*dZUL(gt1,j2)*ZN(gt2,5))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yu(j1,j2))*Conjg(ZU(gt3,3 + j1))*dZN(gt2,5)*ZUL(gt1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dZU(gt3,3 + j1))*Conjg(Yu(j1,j2))*ZN(gt2,5)*ZUL(gt1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYu(j1,j2))*Conjg(ZU(gt3,3 + j1))*ZN(gt2,5)*ZUL(gt1,j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuChiSu  
 
 
Subroutine CT_CouplingcFvChiSv(gt1,gt2,gt3,g1,g2,gp,Yv,ZV,ZN,ZVL,ZVR,dg1,             & 
& dg2,dgp,dYv,dZV,dZN,dZVL,dZVR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g1,g2,gp,dg1,dg2,dgp

Complex(dp), Intent(in) :: Yv(3,3),ZV(6,6),ZN(9,9),ZVL(3,3),ZVR(3,3),dYv(3,3),dZV(6,6),dZN(9,9),dZVL(3,3),dZVR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFvChiSv' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Qv*Conjg(dZVR(gt1,j1))*Conjg(ZN(gt2,1))*Conjg(ZV(gt3,3 + j1)))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Qv*Conjg(dZV(gt3,3 + j1))*Conjg(ZN(gt2,1))*Conjg(ZVR(gt1,j1)))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*gp*Qv*Conjg(dZN(gt2,1))*Conjg(ZV(gt3,3 + j1))*Conjg(ZVR(gt1,j1)))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dgp*Qv*Conjg(ZN(gt2,1))*Conjg(ZV(gt3,3 + j1))*Conjg(ZVR(gt1,j1)))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZN(gt2,5))*Conjg(ZV(gt3,j1))*Conjg(ZVR(gt1,j2))*dYv(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZVR(gt1,j2))*Conjg(ZN(gt2,5))*Conjg(ZV(gt3,j1))*Yv(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZV(gt3,j1))*Conjg(ZN(gt2,5))*Conjg(ZVR(gt1,j2))*Yv(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZN(gt2,5))*Conjg(ZV(gt3,j1))*Conjg(ZVR(gt1,j2))*Yv(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Ql*Conjg(ZV(gt3,j1))*dZVL(gt1,j1)*ZN(gt2,1))
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZV(gt3,j1))*dZVL(gt1,j1)*ZN(gt2,2))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR-((g2*Conjg(ZV(gt3,j1))*dZVL(gt1,j1)*ZN(gt2,3))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Ql*Conjg(ZV(gt3,j1))*dZN(gt2,1)*ZVL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(ZV(gt3,j1))*dZN(gt2,2)*ZVL(gt1,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR-((g2*Conjg(ZV(gt3,j1))*dZN(gt2,3)*ZVL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*gp*Ql*Conjg(dZV(gt3,j1))*ZN(gt2,1)*ZVL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dgp*Ql*Conjg(ZV(gt3,j1))*ZN(gt2,1)*ZVL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR+(g1*Conjg(dZV(gt3,j1))*ZN(gt2,2)*ZVL(gt1,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR+(dg1*Conjg(ZV(gt3,j1))*ZN(gt2,2)*ZVL(gt1,j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resR = resR-((g2*Conjg(dZV(gt3,j1))*ZN(gt2,3)*ZVL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR-((dg2*Conjg(ZV(gt3,j1))*ZN(gt2,3)*ZVL(gt1,j1))/sqrt(2._dp))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yv(j1,j2))*Conjg(ZV(gt3,3 + j2))*dZVL(gt1,j1)*ZN(gt2,5))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yv(j1,j2))*Conjg(ZV(gt3,3 + j2))*dZN(gt2,5)*ZVL(gt1,j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dZV(gt3,3 + j2))*Conjg(Yv(j1,j2))*ZN(gt2,5)*ZVL(gt1,j1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYv(j1,j2))*Conjg(ZV(gt3,3 + j2))*ZN(gt2,5)*ZVL(gt1,j1))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFvChiSv  
 
 
Subroutine CT_CouplingGluFdcSd(gt2,gt3,g3,pG,ZD,ZDL,ZDR,dg3,dpG,dZD,dZDL,             & 
& dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(in) :: pG,ZD(6,6),ZDL(3,3),ZDR(3,3),dpG,dZD(6,6),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingGluFdcSd' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g3*pG*Conjg(ZDL(gt2,j1))*dZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g3*pG*Conjg(dZDL(gt2,j1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dpG*g3*Conjg(ZDL(gt2,j1))*ZD(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dg3*pG*Conjg(ZDL(gt2,j1))*ZD(gt3,j1))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*g3*Conjg(pG)*dZDR(gt2,j1)*ZD(gt3,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*g3*Conjg(pG)*dZD(gt3,3 + j1)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*g3*Conjg(dpG)*ZD(gt3,3 + j1)*ZDR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*dg3*Conjg(pG)*ZD(gt3,3 + j1)*ZDR(gt2,j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingGluFdcSd  
 
 
Subroutine CT_CouplingcFdFdhh(gt1,gt2,gt3,Yd,ZH,ZDL,ZDR,dYd,dZH,dZDL,dZDR,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Yd(3,3),ZH(6,6),ZDL(3,3),ZDR(3,3),dYd(3,3),dZH(6,6),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDL(gt2,j2))*Conjg(ZDR(gt1,j1))*Conjg(ZH(gt3,1))*dYd(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZH(gt3,1))*Conjg(ZDL(gt2,j2))*Conjg(ZDR(gt1,j1))*Yd(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Conjg(ZH(gt3,1))*Yd(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZDL(gt2,j2))*Conjg(ZDR(gt1,j1))*Conjg(ZH(gt3,1))*Yd(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*Conjg(ZH(gt3,1))*dZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*Conjg(ZH(gt3,1))*dZDL(gt1,j2)*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dZH(gt3,1))*Conjg(Yd(j1,j2))*ZDL(gt1,j2)*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYd(j1,j2))*Conjg(ZH(gt3,1))*ZDL(gt1,j2)*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdhh  
 
 
Subroutine CT_CouplingcChaFdcSu(gt1,gt2,gt3,g2,Yd,Yu,ZU,UM,UP,ZDL,ZDR,dg2,            & 
& dYd,dYu,dZU,dUM,dUP,dZDL,dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZU(6,6),UM(2,2),UP(2,2),ZDL(3,3),ZDR(3,3),dYd(3,3),dYu(3,3),          & 
& dZU(6,6),dUM(2,2),dUP(2,2),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaFdcSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(g2*Conjg(UP(gt1,1))*Conjg(ZDL(gt2,j1))*dZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dZDL(gt2,j1))*Conjg(UP(gt1,1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dUP(gt1,1))*Conjg(ZDL(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(dg2*Conjg(UP(gt1,1))*Conjg(ZDL(gt2,j1))*ZU(gt3,j1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UP(gt1,2))*Conjg(ZDL(gt2,j2))*dZU(gt3,3 + j1)*Yu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UP(gt1,2))*Conjg(ZDL(gt2,j2))*dYu(j1,j2)*ZU(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZDL(gt2,j2))*Conjg(UP(gt1,2))*Yu(j1,j2)*ZU(gt3,3 + j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUP(gt1,2))*Conjg(ZDL(gt2,j2))*Yu(j1,j2)*ZU(gt3,3 + j1)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*dZU(gt3,j2)*UM(gt1,2)*ZDR(gt2,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*dZDR(gt2,j1)*UM(gt1,2)*ZU(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*dUM(gt1,2)*ZDR(gt2,j1)*ZU(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYd(j1,j2))*UM(gt1,2)*ZDR(gt2,j1)*ZU(gt3,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaFdcSu  
 
 
Subroutine CT_CouplingcFuFdcHpm(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,dYd,             & 
& dYu,dZP,dZDL,dZDR,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2),dZP(2,2)

Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3),dYd(3,3),dYu(3,3),dZDL(3,3),      & 
& dZDR(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFdcHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDL(gt2,j2))*Conjg(ZUR(gt1,j1))*dZP(gt3,2)*Yu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDL(gt2,j2))*Conjg(ZUR(gt1,j1))*dYu(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yu(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZDL(gt2,j2))*Conjg(ZUR(gt1,j1))*Yu(j1,j2)*ZP(gt3,2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*dZUL(gt1,j2)*ZDR(gt2,j1)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*dZP(gt3,1)*ZDR(gt2,j1)*ZUL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*dZDR(gt2,j1)*ZP(gt3,1)*ZUL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYd(j1,j2))*ZDR(gt2,j1)*ZP(gt3,1)*ZUL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFdcHpm  
 
 
Subroutine CT_CouplingcFeFehh(gt1,gt2,gt3,Ye,ZH,ZEL,ZER,dYe,dZH,dZEL,dZER,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Ye(3,3),ZH(6,6),ZEL(3,3),ZER(3,3),dYe(3,3),dZH(6,6),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZEL(gt2,j2))*Conjg(ZER(gt1,j1))*Conjg(ZH(gt3,1))*dYe(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZH(gt3,1))*Conjg(ZEL(gt2,j2))*Conjg(ZER(gt1,j1))*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Conjg(ZH(gt3,1))*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZEL(gt2,j2))*Conjg(ZER(gt1,j1))*Conjg(ZH(gt3,1))*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*Conjg(ZH(gt3,1))*dZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*Conjg(ZH(gt3,1))*dZEL(gt1,j2)*ZER(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dZH(gt3,1))*Conjg(Ye(j1,j2))*ZEL(gt1,j2)*ZER(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYe(j1,j2))*Conjg(ZH(gt3,1))*ZEL(gt1,j2)*ZER(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFehh  
 
 
Subroutine CT_CouplingcChaFecSv(gt1,gt2,gt3,g2,Ye,Yv,ZV,UM,UP,ZEL,ZER,dg2,            & 
& dYe,dYv,dZV,dUM,dUP,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZV(6,6),UM(2,2),UP(2,2),ZEL(3,3),ZER(3,3),dYe(3,3),dYv(3,3),          & 
& dZV(6,6),dUM(2,2),dUP(2,2),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaFecSv' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(g2*Conjg(UP(gt1,1))*Conjg(ZEL(gt2,j1))*dZV(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dZEL(gt2,j1))*Conjg(UP(gt1,1))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(g2*Conjg(dUP(gt1,1))*Conjg(ZEL(gt2,j1))*ZV(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(dg2*Conjg(UP(gt1,1))*Conjg(ZEL(gt2,j1))*ZV(gt3,j1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UP(gt1,2))*Conjg(ZEL(gt2,j1))*dZV(gt3,3 + j2)*Yv(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UP(gt1,2))*Conjg(ZEL(gt2,j1))*dYv(j1,j2)*ZV(gt3,3 + j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZEL(gt2,j1))*Conjg(UP(gt1,2))*Yv(j1,j2)*ZV(gt3,3 + j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUP(gt1,2))*Conjg(ZEL(gt2,j1))*Yv(j1,j2)*ZV(gt3,3 + j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*dZV(gt3,j2)*UM(gt1,2)*ZER(gt2,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*dZER(gt2,j1)*UM(gt1,2)*ZV(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*dUM(gt1,2)*ZER(gt2,j1)*ZV(gt3,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYe(j1,j2))*UM(gt1,2)*ZER(gt2,j1)*ZV(gt3,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaFecSv  
 
 
Subroutine CT_CouplingcFvFecHpm(gt1,gt2,gt3,Ye,Yv,ZP,ZVL,ZVR,ZEL,ZER,dYe,             & 
& dYv,dZP,dZVL,dZVR,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2),dZP(2,2)

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZVL(3,3),ZVR(3,3),ZEL(3,3),ZER(3,3),dYe(3,3),dYv(3,3),dZVL(3,3),      & 
& dZVR(3,3),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFvFecHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZEL(gt2,j1))*Conjg(ZVR(gt1,j2))*dZP(gt3,2)*Yv(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZEL(gt2,j1))*Conjg(ZVR(gt1,j2))*dYv(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZVR(gt1,j2))*Conjg(ZEL(gt2,j1))*Yv(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZEL(gt2,j1))*Conjg(ZVR(gt1,j2))*Yv(j1,j2)*ZP(gt3,2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*dZVL(gt1,j2)*ZER(gt2,j1)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*dZP(gt3,1)*ZER(gt2,j1)*ZVL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*dZER(gt2,j1)*ZP(gt3,1)*ZVL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYe(j1,j2))*ZER(gt2,j1)*ZP(gt3,1)*ZVL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFvFecHpm  
 
 
Subroutine CT_CouplingGluFucSu(gt2,gt3,g3,pG,ZU,ZUL,ZUR,dg3,dpG,dZU,dZUL,             & 
& dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(in) :: pG,ZU(6,6),ZUL(3,3),ZUR(3,3),dpG,dZU(6,6),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingGluFucSu' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g3*pG*Conjg(ZUL(gt2,j1))*dZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*g3*pG*Conjg(dZUL(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dpG*g3*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))
End Do 
Do j1 = 1,3
resL = resL-(sqrt(2._dp)*dg3*pG*Conjg(ZUL(gt2,j1))*ZU(gt3,j1))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*g3*Conjg(pG)*dZUR(gt2,j1)*ZU(gt3,3 + j1)
End Do 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*g3*Conjg(pG)*dZU(gt3,3 + j1)*ZUR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*g3*Conjg(dpG)*ZU(gt3,3 + j1)*ZUR(gt2,j1)
End Do 
Do j1 = 1,3
resR = resR+sqrt(2._dp)*dg3*Conjg(pG)*ZU(gt3,3 + j1)*ZUR(gt2,j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingGluFucSu  
 
 
Subroutine CT_CouplingcFuFuhh(gt1,gt2,gt3,Yu,ZH,ZUL,ZUR,dYu,dZH,dZUL,dZUR,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Yu(3,3),ZH(6,6),ZUL(3,3),ZUR(3,3),dYu(3,3),dZH(6,6),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZH(gt3,2))*Conjg(ZUL(gt2,j2))*Conjg(ZUR(gt1,j1))*dYu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZUR(gt1,j1))*Conjg(ZH(gt3,2))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZUL(gt2,j2))*Conjg(ZH(gt3,2))*Conjg(ZUR(gt1,j1))*Yu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZH(gt3,2))*Conjg(ZUL(gt2,j2))*Conjg(ZUR(gt1,j1))*Yu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*Conjg(ZH(gt3,2))*dZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*Conjg(ZH(gt3,2))*dZUL(gt1,j2)*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dZH(gt3,2))*Conjg(Yu(j1,j2))*ZUL(gt1,j2)*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYu(j1,j2))*Conjg(ZH(gt3,2))*ZUL(gt1,j2)*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuhh  
 
 
Subroutine CT_CouplingcFdFuHpm(gt1,gt2,gt3,Yd,Yu,ZP,ZDL,ZDR,ZUL,ZUR,dYd,              & 
& dYu,dZP,dZDL,dZDR,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2),dZP(2,2)

Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3),dYd(3,3),dYu(3,3),dZDL(3,3),      & 
& dZDR(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFuHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*dZP(gt3,1)*Yd(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*dYd(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZUL(gt2,j2))*Conjg(ZDR(gt1,j1))*Yd(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2)*ZP(gt3,1)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*dZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*dZP(gt3,2)*ZDL(gt1,j2)*ZUR(gt2,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*dZDL(gt1,j2)*ZP(gt3,2)*ZUR(gt2,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYu(j1,j2))*ZDL(gt1,j2)*ZP(gt3,2)*ZUR(gt2,j1)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFuHpm  
 
 
Subroutine CT_CouplingcFvFvhh(gt1,gt2,gt3,Yv,ZH,ZVL,ZVR,dYv,dZH,dZVL,dZVR,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Yv(3,3),ZH(6,6),ZVL(3,3),ZVR(3,3),dYv(3,3),dZH(6,6),dZVL(3,3),dZVR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFvFvhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZH(gt3,2))*Conjg(ZVL(gt2,j1))*Conjg(ZVR(gt1,j2))*dYv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZVR(gt1,j2))*Conjg(ZH(gt3,2))*Conjg(ZVL(gt2,j1))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZVL(gt2,j1))*Conjg(ZH(gt3,2))*Conjg(ZVR(gt1,j2))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZH(gt3,2))*Conjg(ZVL(gt2,j1))*Conjg(ZVR(gt1,j2))*Yv(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*Conjg(ZH(gt3,2))*dZVR(gt2,j2)*ZVL(gt1,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yv(j1,j2))*Conjg(ZH(gt3,2))*dZVL(gt1,j1)*ZVR(gt2,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dZH(gt3,2))*Conjg(Yv(j1,j2))*ZVL(gt1,j1)*ZVR(gt2,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYv(j1,j2))*Conjg(ZH(gt3,2))*ZVL(gt1,j1)*ZVR(gt2,j2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFvFvhh  
 
 
Subroutine CT_CouplingcFeFvHpm(gt1,gt2,gt3,Ye,Yv,ZP,ZVL,ZVR,ZEL,ZER,dYe,              & 
& dYv,dZP,dZVL,dZVR,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(2,2),dZP(2,2)

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZVL(3,3),ZVR(3,3),ZEL(3,3),ZER(3,3),dYe(3,3),dYv(3,3),dZVL(3,3),      & 
& dZVR(3,3),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFvHpm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j1))*Conjg(ZVL(gt2,j2))*dZP(gt3,1)*Ye(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j1))*Conjg(ZVL(gt2,j2))*dYe(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZVL(gt2,j2))*Conjg(ZER(gt1,j1))*Ye(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZER(gt1,j1))*Conjg(ZVL(gt2,j2))*Ye(j1,j2)*ZP(gt3,1)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yv(j1,j2))*dZVR(gt2,j2)*ZEL(gt1,j1)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yv(j1,j2))*dZP(gt3,2)*ZEL(gt1,j1)*ZVR(gt2,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yv(j1,j2))*dZEL(gt1,j1)*ZP(gt3,2)*ZVR(gt2,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYv(j1,j2))*ZEL(gt1,j1)*ZP(gt3,2)*ZVR(gt2,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFvHpm  
 
 
Subroutine CT_CouplingcFdGluSd(gt1,gt3,g3,pG,ZD,ZDL,ZDR,dg3,dpG,dZD,dZDL,             & 
& dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt3
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(in) :: pG,ZD(6,6),ZDL(3,3),ZDR(3,3),dpG,dZD(6,6),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdGluSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*g3*pG*Conjg(dZDR(gt1,j1))*Conjg(ZD(gt3,3 + j1))
End Do 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*g3*pG*Conjg(dZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*dpG*g3*Conjg(ZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*dg3*pG*Conjg(ZD(gt3,3 + j1))*Conjg(ZDR(gt1,j1))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g3*Conjg(pG)*Conjg(ZD(gt3,j1))*dZDL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g3*Conjg(pG)*Conjg(dZD(gt3,j1))*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g3*Conjg(dpG)*Conjg(ZD(gt3,j1))*ZDL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dg3*Conjg(pG)*Conjg(ZD(gt3,j1))*ZDL(gt1,j1))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdGluSd  
 
 
Subroutine CT_CouplingcFuGluSu(gt1,gt3,g3,pG,ZU,ZUL,ZUR,dg3,dpG,dZU,dZUL,             & 
& dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt3
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(in) :: pG,ZU(6,6),ZUL(3,3),ZUR(3,3),dpG,dZU(6,6),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuGluSu' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*g3*pG*Conjg(dZUR(gt1,j1))*Conjg(ZU(gt3,3 + j1))
End Do 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*g3*pG*Conjg(dZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*dpG*g3*Conjg(ZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1))
End Do 
Do j1 = 1,3
resL = resL+sqrt(2._dp)*dg3*pG*Conjg(ZU(gt3,3 + j1))*Conjg(ZUR(gt1,j1))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g3*Conjg(pG)*Conjg(ZU(gt3,j1))*dZUL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g3*Conjg(pG)*Conjg(dZU(gt3,j1))*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*g3*Conjg(dpG)*Conjg(ZU(gt3,j1))*ZUL(gt1,j1))
End Do 
Do j1 = 1,3
resR = resR-(sqrt(2._dp)*dg3*Conjg(pG)*Conjg(ZU(gt3,j1))*ZUL(gt1,j1))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuGluSu  
 
 
Subroutine CT_CouplingcChacFuSd(gt1,gt2,gt3,g2,Yd,Yu,ZD,UM,UP,ZUL,ZUR,dg2,            & 
& dYd,dYu,dZD,dUM,dUP,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Yd(3,3),Yu(3,3),ZD(6,6),UM(2,2),UP(2,2),ZUL(3,3),ZUR(3,3),dYd(3,3),dYu(3,3),          & 
& dZD(6,6),dUM(2,2),dUP(2,2),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChacFuSd' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UP(gt1,2))*Conjg(ZD(gt3,j2))*Conjg(ZUR(gt2,j1))*dYu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZUR(gt2,j1))*Conjg(UP(gt1,2))*Conjg(ZD(gt3,j2))*Yu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZD(gt3,j2))*Conjg(UP(gt1,2))*Conjg(ZUR(gt2,j1))*Yu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUP(gt1,2))*Conjg(ZD(gt3,j2))*Conjg(ZUR(gt2,j1))*Yu(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZD(gt3,j1))*dZUL(gt2,j1)*UM(gt1,1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZD(gt3,j1))*dUM(gt1,1)*ZUL(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(dZD(gt3,j1))*UM(gt1,1)*ZUL(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(dg2*Conjg(ZD(gt3,j1))*UM(gt1,1)*ZUL(gt2,j1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*Conjg(ZD(gt3,3 + j1))*dZUL(gt2,j2)*UM(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*Conjg(ZD(gt3,3 + j1))*dUM(gt1,2)*ZUL(gt2,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dZD(gt3,3 + j1))*Conjg(Yd(j1,j2))*UM(gt1,2)*ZUL(gt2,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYd(j1,j2))*Conjg(ZD(gt3,3 + j1))*UM(gt1,2)*ZUL(gt2,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChacFuSd  
 
 
Subroutine CT_CouplingcChacFvSe(gt1,gt2,gt3,g2,Ye,Yv,ZE,ZVL,ZVR,UM,UP,dg2,            & 
& dYe,dYv,dZE,dZVL,dZVR,dUM,dUP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: Ye(3,3),Yv(3,3),ZE(6,6),ZVL(3,3),ZVR(3,3),UM(2,2),UP(2,2),dYe(3,3),dYv(3,3),          & 
& dZE(6,6),dZVL(3,3),dZVR(3,3),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChacFvSe' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.6)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(UP(gt1,2))*Conjg(ZE(gt3,j1))*Conjg(ZVR(gt2,j2))*dYv(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZVR(gt2,j2))*Conjg(UP(gt1,2))*Conjg(ZE(gt3,j1))*Yv(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZE(gt3,j1))*Conjg(UP(gt1,2))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUP(gt1,2))*Conjg(ZE(gt3,j1))*Conjg(ZVR(gt2,j2))*Yv(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZE(gt3,j1))*dZVL(gt2,j1)*UM(gt1,1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(ZE(gt3,j1))*dUM(gt1,1)*ZVL(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(g2*Conjg(dZE(gt3,j1))*UM(gt1,1)*ZVL(gt2,j1))
End Do 
Do j1 = 1,3
resR = resR-(dg2*Conjg(ZE(gt3,j1))*UM(gt1,1)*ZVL(gt2,j1))
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*Conjg(ZE(gt3,3 + j1))*dZVL(gt2,j2)*UM(gt1,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*Conjg(ZE(gt3,3 + j1))*dUM(gt1,2)*ZVL(gt2,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dZE(gt3,3 + j1))*Conjg(Ye(j1,j2))*UM(gt1,2)*ZVL(gt2,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYe(j1,j2))*Conjg(ZE(gt3,3 + j1))*UM(gt1,2)*ZVL(gt2,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChacFvSe  
 
 
Subroutine CT_CouplingChiChacVWm(gt1,gt2,g2,ZN,UM,UP,dg2,dZN,dUM,dUP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZN(9,9),UM(2,2),UP(2,2),dZN(9,9),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiChacVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(g2*Conjg(UM(gt2,1))*dZN(gt1,3))
resL = resL-((g2*Conjg(UM(gt2,2))*dZN(gt1,4))/sqrt(2._dp))
resL = resL-(g2*Conjg(dUM(gt2,1))*ZN(gt1,3))
resL = resL-(dg2*Conjg(UM(gt2,1))*ZN(gt1,3))
resL = resL-((g2*Conjg(dUM(gt2,2))*ZN(gt1,4))/sqrt(2._dp))
resL = resL-((dg2*Conjg(UM(gt2,2))*ZN(gt1,4))/sqrt(2._dp))
resR = 0._dp 
resR = resR-(g2*Conjg(ZN(gt1,3))*dUP(gt2,1))
resR = resR+(g2*Conjg(ZN(gt1,5))*dUP(gt2,2))/sqrt(2._dp)
resR = resR-(g2*Conjg(dZN(gt1,3))*UP(gt2,1))
resR = resR-(dg2*Conjg(ZN(gt1,3))*UP(gt2,1))
resR = resR+(g2*Conjg(dZN(gt1,5))*UP(gt2,2))/sqrt(2._dp)
resR = resR+(dg2*Conjg(ZN(gt1,5))*UP(gt2,2))/sqrt(2._dp)
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiChacVWm  
 
 
Subroutine CT_CouplingcChaChaVP(gt1,gt2,g1,g2,UM,UP,TW,dg1,dg2,dUM,dUP,               & 
& dSinTW,dCosTW,dTanTW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(in) :: UM(2,2),UP(2,2),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaChaVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+(g1*Conjg(UM(gt2,2))*Cos(TW)*dUM(gt1,2))/2._dp
resL = resL+g2*Conjg(UM(gt2,1))*dUM(gt1,1)*Sin(TW)
resL = resL+(g2*Conjg(UM(gt2,2))*dUM(gt1,2)*Sin(TW))/2._dp
resL = resL+dSinTW*g2*Conjg(UM(gt2,1))*UM(gt1,1)
resL = resL+g2*Conjg(dUM(gt2,1))*Sin(TW)*UM(gt1,1)
resL = resL+dg2*Conjg(UM(gt2,1))*Sin(TW)*UM(gt1,1)
resL = resL+(dCosTW*g1*Conjg(UM(gt2,2))*UM(gt1,2))/2._dp
resL = resL+(dSinTW*g2*Conjg(UM(gt2,2))*UM(gt1,2))/2._dp
resL = resL+(g1*Conjg(dUM(gt2,2))*Cos(TW)*UM(gt1,2))/2._dp
resL = resL+(dg1*Conjg(UM(gt2,2))*Cos(TW)*UM(gt1,2))/2._dp
resL = resL+(g2*Conjg(dUM(gt2,2))*Sin(TW)*UM(gt1,2))/2._dp
resL = resL+(dg2*Conjg(UM(gt2,2))*Sin(TW)*UM(gt1,2))/2._dp
resR = 0._dp 
resR = resR+(g1*Conjg(UP(gt1,2))*Cos(TW)*dUP(gt2,2))/2._dp
resR = resR+g2*Conjg(UP(gt1,1))*dUP(gt2,1)*Sin(TW)
resR = resR+(g2*Conjg(UP(gt1,2))*dUP(gt2,2)*Sin(TW))/2._dp
resR = resR+dSinTW*g2*Conjg(UP(gt1,1))*UP(gt2,1)
resR = resR+g2*Conjg(dUP(gt1,1))*Sin(TW)*UP(gt2,1)
resR = resR+dg2*Conjg(UP(gt1,1))*Sin(TW)*UP(gt2,1)
resR = resR+(dCosTW*g1*Conjg(UP(gt1,2))*UP(gt2,2))/2._dp
resR = resR+(dSinTW*g2*Conjg(UP(gt1,2))*UP(gt2,2))/2._dp
resR = resR+(g1*Conjg(dUP(gt1,2))*Cos(TW)*UP(gt2,2))/2._dp
resR = resR+(dg1*Conjg(UP(gt1,2))*Cos(TW)*UP(gt2,2))/2._dp
resR = resR+(g2*Conjg(dUP(gt1,2))*Sin(TW)*UP(gt2,2))/2._dp
resR = resR+(dg2*Conjg(UP(gt1,2))*Sin(TW)*UP(gt2,2))/2._dp
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaChaVP  
 
 
Subroutine CT_CouplingcChaChaVZ(gt1,gt2,g1,g2,gp,UM,UP,TW,TWp,dg1,dg2,dgp,            & 
& dUM,dUP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(in) :: UM(2,2),UP(2,2),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaChaVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+g2*Conjg(UM(gt2,1))*Cos(TW)*Cos(TWp)*dUM(gt1,1)
resL = resL+(g2*Conjg(UM(gt2,2))*Cos(TW)*Cos(TWp)*dUM(gt1,2))/2._dp
resL = resL-(g1*Conjg(UM(gt2,2))*Cos(TWp)*dUM(gt1,2)*Sin(TW))/2._dp
resL = resL-(gp*QHd*Conjg(UM(gt2,2))*dUM(gt1,2)*Sin(TWp))
resL = resL+dCosTWp*g2*Conjg(UM(gt2,1))*Cos(TW)*UM(gt1,1)
resL = resL+dCosTW*g2*Conjg(UM(gt2,1))*Cos(TWp)*UM(gt1,1)
resL = resL+g2*Conjg(dUM(gt2,1))*Cos(TW)*Cos(TWp)*UM(gt1,1)
resL = resL+dg2*Conjg(UM(gt2,1))*Cos(TW)*Cos(TWp)*UM(gt1,1)
resL = resL-(dSinTWp*gp*QHd*Conjg(UM(gt2,2))*UM(gt1,2))
resL = resL+(dCosTWp*g2*Conjg(UM(gt2,2))*Cos(TW)*UM(gt1,2))/2._dp
resL = resL-(dSinTW*g1*Conjg(UM(gt2,2))*Cos(TWp)*UM(gt1,2))/2._dp
resL = resL+(dCosTW*g2*Conjg(UM(gt2,2))*Cos(TWp)*UM(gt1,2))/2._dp
resL = resL+(g2*Conjg(dUM(gt2,2))*Cos(TW)*Cos(TWp)*UM(gt1,2))/2._dp
resL = resL+(dg2*Conjg(UM(gt2,2))*Cos(TW)*Cos(TWp)*UM(gt1,2))/2._dp
resL = resL-(dCosTWp*g1*Conjg(UM(gt2,2))*Sin(TW)*UM(gt1,2))/2._dp
resL = resL-(g1*Conjg(dUM(gt2,2))*Cos(TWp)*Sin(TW)*UM(gt1,2))/2._dp
resL = resL-(dg1*Conjg(UM(gt2,2))*Cos(TWp)*Sin(TW)*UM(gt1,2))/2._dp
resL = resL-(gp*QHd*Conjg(dUM(gt2,2))*Sin(TWp)*UM(gt1,2))
resL = resL-(dgp*QHd*Conjg(UM(gt2,2))*Sin(TWp)*UM(gt1,2))
resR = 0._dp 
resR = resR+g2*Conjg(UP(gt1,1))*Cos(TW)*Cos(TWp)*dUP(gt2,1)
resR = resR+(g2*Conjg(UP(gt1,2))*Cos(TW)*Cos(TWp)*dUP(gt2,2))/2._dp
resR = resR-(g1*Conjg(UP(gt1,2))*Cos(TWp)*dUP(gt2,2)*Sin(TW))/2._dp
resR = resR+gp*QHu*Conjg(UP(gt1,2))*dUP(gt2,2)*Sin(TWp)
resR = resR+dCosTWp*g2*Conjg(UP(gt1,1))*Cos(TW)*UP(gt2,1)
resR = resR+dCosTW*g2*Conjg(UP(gt1,1))*Cos(TWp)*UP(gt2,1)
resR = resR+g2*Conjg(dUP(gt1,1))*Cos(TW)*Cos(TWp)*UP(gt2,1)
resR = resR+dg2*Conjg(UP(gt1,1))*Cos(TW)*Cos(TWp)*UP(gt2,1)
resR = resR+dSinTWp*gp*QHu*Conjg(UP(gt1,2))*UP(gt2,2)
resR = resR+(dCosTWp*g2*Conjg(UP(gt1,2))*Cos(TW)*UP(gt2,2))/2._dp
resR = resR-(dSinTW*g1*Conjg(UP(gt1,2))*Cos(TWp)*UP(gt2,2))/2._dp
resR = resR+(dCosTW*g2*Conjg(UP(gt1,2))*Cos(TWp)*UP(gt2,2))/2._dp
resR = resR+(g2*Conjg(dUP(gt1,2))*Cos(TW)*Cos(TWp)*UP(gt2,2))/2._dp
resR = resR+(dg2*Conjg(UP(gt1,2))*Cos(TW)*Cos(TWp)*UP(gt2,2))/2._dp
resR = resR-(dCosTWp*g1*Conjg(UP(gt1,2))*Sin(TW)*UP(gt2,2))/2._dp
resR = resR-(g1*Conjg(dUP(gt1,2))*Cos(TWp)*Sin(TW)*UP(gt2,2))/2._dp
resR = resR-(dg1*Conjg(UP(gt1,2))*Cos(TWp)*Sin(TW)*UP(gt2,2))/2._dp
resR = resR+gp*QHu*Conjg(dUP(gt1,2))*Sin(TWp)*UP(gt2,2)
resR = resR+dgp*QHu*Conjg(UP(gt1,2))*Sin(TWp)*UP(gt2,2)
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaChaVZ  
 
 
Subroutine CT_CouplingcChaChaVZp(gt1,gt2,g1,g2,gp,UM,UP,TW,TWp,dg1,dg2,               & 
& dgp,dUM,dUP,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(in) :: UM(2,2),UP(2,2),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaChaVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(gp*QHd*Conjg(UM(gt2,2))*Cos(TWp)*dUM(gt1,2))
resL = resL-(g2*Conjg(UM(gt2,1))*Cos(TW)*dUM(gt1,1)*Sin(TWp))
resL = resL-(g2*Conjg(UM(gt2,2))*Cos(TW)*dUM(gt1,2)*Sin(TWp))/2._dp
resL = resL+(g1*Conjg(UM(gt2,2))*dUM(gt1,2)*Sin(TW)*Sin(TWp))/2._dp
resL = resL-(dSinTWp*g2*Conjg(UM(gt2,1))*Cos(TW)*UM(gt1,1))
resL = resL-(dCosTW*g2*Conjg(UM(gt2,1))*Sin(TWp)*UM(gt1,1))
resL = resL-(g2*Conjg(dUM(gt2,1))*Cos(TW)*Sin(TWp)*UM(gt1,1))
resL = resL-(dg2*Conjg(UM(gt2,1))*Cos(TW)*Sin(TWp)*UM(gt1,1))
resL = resL-(dCosTWp*gp*QHd*Conjg(UM(gt2,2))*UM(gt1,2))
resL = resL-(dSinTWp*g2*Conjg(UM(gt2,2))*Cos(TW)*UM(gt1,2))/2._dp
resL = resL-(gp*QHd*Conjg(dUM(gt2,2))*Cos(TWp)*UM(gt1,2))
resL = resL-(dgp*QHd*Conjg(UM(gt2,2))*Cos(TWp)*UM(gt1,2))
resL = resL+(dSinTWp*g1*Conjg(UM(gt2,2))*Sin(TW)*UM(gt1,2))/2._dp
resL = resL+(dSinTW*g1*Conjg(UM(gt2,2))*Sin(TWp)*UM(gt1,2))/2._dp
resL = resL-(dCosTW*g2*Conjg(UM(gt2,2))*Sin(TWp)*UM(gt1,2))/2._dp
resL = resL-(g2*Conjg(dUM(gt2,2))*Cos(TW)*Sin(TWp)*UM(gt1,2))/2._dp
resL = resL-(dg2*Conjg(UM(gt2,2))*Cos(TW)*Sin(TWp)*UM(gt1,2))/2._dp
resL = resL+(g1*Conjg(dUM(gt2,2))*Sin(TW)*Sin(TWp)*UM(gt1,2))/2._dp
resL = resL+(dg1*Conjg(UM(gt2,2))*Sin(TW)*Sin(TWp)*UM(gt1,2))/2._dp
resR = 0._dp 
resR = resR+gp*QHu*Conjg(UP(gt1,2))*Cos(TWp)*dUP(gt2,2)
resR = resR-(g2*Conjg(UP(gt1,1))*Cos(TW)*dUP(gt2,1)*Sin(TWp))
resR = resR-(g2*Conjg(UP(gt1,2))*Cos(TW)*dUP(gt2,2)*Sin(TWp))/2._dp
resR = resR+(g1*Conjg(UP(gt1,2))*dUP(gt2,2)*Sin(TW)*Sin(TWp))/2._dp
resR = resR-(dSinTWp*g2*Conjg(UP(gt1,1))*Cos(TW)*UP(gt2,1))
resR = resR-(dCosTW*g2*Conjg(UP(gt1,1))*Sin(TWp)*UP(gt2,1))
resR = resR-(g2*Conjg(dUP(gt1,1))*Cos(TW)*Sin(TWp)*UP(gt2,1))
resR = resR-(dg2*Conjg(UP(gt1,1))*Cos(TW)*Sin(TWp)*UP(gt2,1))
resR = resR+dCosTWp*gp*QHu*Conjg(UP(gt1,2))*UP(gt2,2)
resR = resR-(dSinTWp*g2*Conjg(UP(gt1,2))*Cos(TW)*UP(gt2,2))/2._dp
resR = resR+gp*QHu*Conjg(dUP(gt1,2))*Cos(TWp)*UP(gt2,2)
resR = resR+dgp*QHu*Conjg(UP(gt1,2))*Cos(TWp)*UP(gt2,2)
resR = resR+(dSinTWp*g1*Conjg(UP(gt1,2))*Sin(TW)*UP(gt2,2))/2._dp
resR = resR+(dSinTW*g1*Conjg(UP(gt1,2))*Sin(TWp)*UP(gt2,2))/2._dp
resR = resR-(dCosTW*g2*Conjg(UP(gt1,2))*Sin(TWp)*UP(gt2,2))/2._dp
resR = resR-(g2*Conjg(dUP(gt1,2))*Cos(TW)*Sin(TWp)*UP(gt2,2))/2._dp
resR = resR-(dg2*Conjg(UP(gt1,2))*Cos(TW)*Sin(TWp)*UP(gt2,2))/2._dp
resR = resR+(g1*Conjg(dUP(gt1,2))*Sin(TW)*Sin(TWp)*UP(gt2,2))/2._dp
resR = resR+(dg1*Conjg(UP(gt1,2))*Sin(TW)*Sin(TWp)*UP(gt2,2))/2._dp
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaChaVZp  
 
 
Subroutine CT_CouplingChiChiVZ(gt1,gt2,g1,g2,gp,ZN,TW,TWp,dg1,dg2,dgp,dZN,            & 
& dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZN(9,9),dZN(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiChiVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(g2*Conjg(ZN(gt2,4))*Cos(TW)*Cos(TWp)*dZN(gt1,4))/2._dp
resL = resL+(g2*Conjg(ZN(gt2,5))*Cos(TW)*Cos(TWp)*dZN(gt1,5))/2._dp
resL = resL-(g1*Conjg(ZN(gt2,4))*Cos(TWp)*dZN(gt1,4)*Sin(TW))/2._dp
resL = resL+(g1*Conjg(ZN(gt2,5))*Cos(TWp)*dZN(gt1,5)*Sin(TW))/2._dp
resL = resL-(gp*QHd*Conjg(ZN(gt2,4))*dZN(gt1,4)*Sin(TWp))
resL = resL-(gp*QHu*Conjg(ZN(gt2,5))*dZN(gt1,5)*Sin(TWp))
resL = resL-(gp*Qs*Conjg(ZN(gt2,6))*dZN(gt1,6)*Sin(TWp))
resL = resL-(gp*Qs1*Conjg(ZN(gt2,7))*dZN(gt1,7)*Sin(TWp))
resL = resL-(gp*Qs2*Conjg(ZN(gt2,8))*dZN(gt1,8)*Sin(TWp))
resL = resL-(gp*Qs3*Conjg(ZN(gt2,9))*dZN(gt1,9)*Sin(TWp))
resL = resL-(dSinTWp*gp*QHd*Conjg(ZN(gt2,4))*ZN(gt1,4))
resL = resL-(dCosTWp*g2*Conjg(ZN(gt2,4))*Cos(TW)*ZN(gt1,4))/2._dp
resL = resL-(dSinTW*g1*Conjg(ZN(gt2,4))*Cos(TWp)*ZN(gt1,4))/2._dp
resL = resL-(dCosTW*g2*Conjg(ZN(gt2,4))*Cos(TWp)*ZN(gt1,4))/2._dp
resL = resL-(g2*Conjg(dZN(gt2,4))*Cos(TW)*Cos(TWp)*ZN(gt1,4))/2._dp
resL = resL-(dg2*Conjg(ZN(gt2,4))*Cos(TW)*Cos(TWp)*ZN(gt1,4))/2._dp
resL = resL-(dCosTWp*g1*Conjg(ZN(gt2,4))*Sin(TW)*ZN(gt1,4))/2._dp
resL = resL-(g1*Conjg(dZN(gt2,4))*Cos(TWp)*Sin(TW)*ZN(gt1,4))/2._dp
resL = resL-(dg1*Conjg(ZN(gt2,4))*Cos(TWp)*Sin(TW)*ZN(gt1,4))/2._dp
resL = resL-(gp*QHd*Conjg(dZN(gt2,4))*Sin(TWp)*ZN(gt1,4))
resL = resL-(dgp*QHd*Conjg(ZN(gt2,4))*Sin(TWp)*ZN(gt1,4))
resL = resL-(dSinTWp*gp*QHu*Conjg(ZN(gt2,5))*ZN(gt1,5))
resL = resL+(dCosTWp*g2*Conjg(ZN(gt2,5))*Cos(TW)*ZN(gt1,5))/2._dp
resL = resL+(dSinTW*g1*Conjg(ZN(gt2,5))*Cos(TWp)*ZN(gt1,5))/2._dp
resL = resL+(dCosTW*g2*Conjg(ZN(gt2,5))*Cos(TWp)*ZN(gt1,5))/2._dp
resL = resL+(g2*Conjg(dZN(gt2,5))*Cos(TW)*Cos(TWp)*ZN(gt1,5))/2._dp
resL = resL+(dg2*Conjg(ZN(gt2,5))*Cos(TW)*Cos(TWp)*ZN(gt1,5))/2._dp
resL = resL+(dCosTWp*g1*Conjg(ZN(gt2,5))*Sin(TW)*ZN(gt1,5))/2._dp
resL = resL+(g1*Conjg(dZN(gt2,5))*Cos(TWp)*Sin(TW)*ZN(gt1,5))/2._dp
resL = resL+(dg1*Conjg(ZN(gt2,5))*Cos(TWp)*Sin(TW)*ZN(gt1,5))/2._dp
resL = resL-(gp*QHu*Conjg(dZN(gt2,5))*Sin(TWp)*ZN(gt1,5))
resL = resL-(dgp*QHu*Conjg(ZN(gt2,5))*Sin(TWp)*ZN(gt1,5))
resL = resL-(dSinTWp*gp*Qs*Conjg(ZN(gt2,6))*ZN(gt1,6))
resL = resL-(gp*Qs*Conjg(dZN(gt2,6))*Sin(TWp)*ZN(gt1,6))
resL = resL-(dgp*Qs*Conjg(ZN(gt2,6))*Sin(TWp)*ZN(gt1,6))
resL = resL-(dSinTWp*gp*Qs1*Conjg(ZN(gt2,7))*ZN(gt1,7))
resL = resL-(gp*Qs1*Conjg(dZN(gt2,7))*Sin(TWp)*ZN(gt1,7))
resL = resL-(dgp*Qs1*Conjg(ZN(gt2,7))*Sin(TWp)*ZN(gt1,7))
resL = resL-(dSinTWp*gp*Qs2*Conjg(ZN(gt2,8))*ZN(gt1,8))
resL = resL-(gp*Qs2*Conjg(dZN(gt2,8))*Sin(TWp)*ZN(gt1,8))
resL = resL-(dgp*Qs2*Conjg(ZN(gt2,8))*Sin(TWp)*ZN(gt1,8))
resL = resL-(dSinTWp*gp*Qs3*Conjg(ZN(gt2,9))*ZN(gt1,9))
resL = resL-(gp*Qs3*Conjg(dZN(gt2,9))*Sin(TWp)*ZN(gt1,9))
resL = resL-(dgp*Qs3*Conjg(ZN(gt2,9))*Sin(TWp)*ZN(gt1,9))
resR = 0._dp 
resR = resR+(g2*Conjg(ZN(gt1,4))*Cos(TW)*Cos(TWp)*dZN(gt2,4))/2._dp
resR = resR-(g2*Conjg(ZN(gt1,5))*Cos(TW)*Cos(TWp)*dZN(gt2,5))/2._dp
resR = resR+(g1*Conjg(ZN(gt1,4))*Cos(TWp)*dZN(gt2,4)*Sin(TW))/2._dp
resR = resR-(g1*Conjg(ZN(gt1,5))*Cos(TWp)*dZN(gt2,5)*Sin(TW))/2._dp
resR = resR+gp*QHd*Conjg(ZN(gt1,4))*dZN(gt2,4)*Sin(TWp)
resR = resR+gp*QHu*Conjg(ZN(gt1,5))*dZN(gt2,5)*Sin(TWp)
resR = resR+gp*Qs*Conjg(ZN(gt1,6))*dZN(gt2,6)*Sin(TWp)
resR = resR+gp*Qs1*Conjg(ZN(gt1,7))*dZN(gt2,7)*Sin(TWp)
resR = resR+gp*Qs2*Conjg(ZN(gt1,8))*dZN(gt2,8)*Sin(TWp)
resR = resR+gp*Qs3*Conjg(ZN(gt1,9))*dZN(gt2,9)*Sin(TWp)
resR = resR+dSinTWp*gp*QHd*Conjg(ZN(gt1,4))*ZN(gt2,4)
resR = resR+(dCosTWp*g2*Conjg(ZN(gt1,4))*Cos(TW)*ZN(gt2,4))/2._dp
resR = resR+(dSinTW*g1*Conjg(ZN(gt1,4))*Cos(TWp)*ZN(gt2,4))/2._dp
resR = resR+(dCosTW*g2*Conjg(ZN(gt1,4))*Cos(TWp)*ZN(gt2,4))/2._dp
resR = resR+(g2*Conjg(dZN(gt1,4))*Cos(TW)*Cos(TWp)*ZN(gt2,4))/2._dp
resR = resR+(dg2*Conjg(ZN(gt1,4))*Cos(TW)*Cos(TWp)*ZN(gt2,4))/2._dp
resR = resR+(dCosTWp*g1*Conjg(ZN(gt1,4))*Sin(TW)*ZN(gt2,4))/2._dp
resR = resR+(g1*Conjg(dZN(gt1,4))*Cos(TWp)*Sin(TW)*ZN(gt2,4))/2._dp
resR = resR+(dg1*Conjg(ZN(gt1,4))*Cos(TWp)*Sin(TW)*ZN(gt2,4))/2._dp
resR = resR+gp*QHd*Conjg(dZN(gt1,4))*Sin(TWp)*ZN(gt2,4)
resR = resR+dgp*QHd*Conjg(ZN(gt1,4))*Sin(TWp)*ZN(gt2,4)
resR = resR+dSinTWp*gp*QHu*Conjg(ZN(gt1,5))*ZN(gt2,5)
resR = resR-(dCosTWp*g2*Conjg(ZN(gt1,5))*Cos(TW)*ZN(gt2,5))/2._dp
resR = resR-(dSinTW*g1*Conjg(ZN(gt1,5))*Cos(TWp)*ZN(gt2,5))/2._dp
resR = resR-(dCosTW*g2*Conjg(ZN(gt1,5))*Cos(TWp)*ZN(gt2,5))/2._dp
resR = resR-(g2*Conjg(dZN(gt1,5))*Cos(TW)*Cos(TWp)*ZN(gt2,5))/2._dp
resR = resR-(dg2*Conjg(ZN(gt1,5))*Cos(TW)*Cos(TWp)*ZN(gt2,5))/2._dp
resR = resR-(dCosTWp*g1*Conjg(ZN(gt1,5))*Sin(TW)*ZN(gt2,5))/2._dp
resR = resR-(g1*Conjg(dZN(gt1,5))*Cos(TWp)*Sin(TW)*ZN(gt2,5))/2._dp
resR = resR-(dg1*Conjg(ZN(gt1,5))*Cos(TWp)*Sin(TW)*ZN(gt2,5))/2._dp
resR = resR+gp*QHu*Conjg(dZN(gt1,5))*Sin(TWp)*ZN(gt2,5)
resR = resR+dgp*QHu*Conjg(ZN(gt1,5))*Sin(TWp)*ZN(gt2,5)
resR = resR+dSinTWp*gp*Qs*Conjg(ZN(gt1,6))*ZN(gt2,6)
resR = resR+gp*Qs*Conjg(dZN(gt1,6))*Sin(TWp)*ZN(gt2,6)
resR = resR+dgp*Qs*Conjg(ZN(gt1,6))*Sin(TWp)*ZN(gt2,6)
resR = resR+dSinTWp*gp*Qs1*Conjg(ZN(gt1,7))*ZN(gt2,7)
resR = resR+gp*Qs1*Conjg(dZN(gt1,7))*Sin(TWp)*ZN(gt2,7)
resR = resR+dgp*Qs1*Conjg(ZN(gt1,7))*Sin(TWp)*ZN(gt2,7)
resR = resR+dSinTWp*gp*Qs2*Conjg(ZN(gt1,8))*ZN(gt2,8)
resR = resR+gp*Qs2*Conjg(dZN(gt1,8))*Sin(TWp)*ZN(gt2,8)
resR = resR+dgp*Qs2*Conjg(ZN(gt1,8))*Sin(TWp)*ZN(gt2,8)
resR = resR+dSinTWp*gp*Qs3*Conjg(ZN(gt1,9))*ZN(gt2,9)
resR = resR+gp*Qs3*Conjg(dZN(gt1,9))*Sin(TWp)*ZN(gt2,9)
resR = resR+dgp*Qs3*Conjg(ZN(gt1,9))*Sin(TWp)*ZN(gt2,9)
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiChiVZ  
 
 
Subroutine CT_CouplingChiChiVZp(gt1,gt2,g1,g2,gp,ZN,TW,TWp,dg1,dg2,dgp,               & 
& dZN,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(in) :: ZN(9,9),dZN(9,9)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingChiChiVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(gp*QHd*Conjg(ZN(gt2,4))*Cos(TWp)*dZN(gt1,4))
resL = resL-(gp*QHu*Conjg(ZN(gt2,5))*Cos(TWp)*dZN(gt1,5))
resL = resL-(gp*Qs*Conjg(ZN(gt2,6))*Cos(TWp)*dZN(gt1,6))
resL = resL-(gp*Qs1*Conjg(ZN(gt2,7))*Cos(TWp)*dZN(gt1,7))
resL = resL-(gp*Qs2*Conjg(ZN(gt2,8))*Cos(TWp)*dZN(gt1,8))
resL = resL-(gp*Qs3*Conjg(ZN(gt2,9))*Cos(TWp)*dZN(gt1,9))
resL = resL+(g2*Conjg(ZN(gt2,4))*Cos(TW)*dZN(gt1,4)*Sin(TWp))/2._dp
resL = resL-(g2*Conjg(ZN(gt2,5))*Cos(TW)*dZN(gt1,5)*Sin(TWp))/2._dp
resL = resL+(g1*Conjg(ZN(gt2,4))*dZN(gt1,4)*Sin(TW)*Sin(TWp))/2._dp
resL = resL-(g1*Conjg(ZN(gt2,5))*dZN(gt1,5)*Sin(TW)*Sin(TWp))/2._dp
resL = resL-(dCosTWp*gp*QHd*Conjg(ZN(gt2,4))*ZN(gt1,4))
resL = resL+(dSinTWp*g2*Conjg(ZN(gt2,4))*Cos(TW)*ZN(gt1,4))/2._dp
resL = resL-(gp*QHd*Conjg(dZN(gt2,4))*Cos(TWp)*ZN(gt1,4))
resL = resL-(dgp*QHd*Conjg(ZN(gt2,4))*Cos(TWp)*ZN(gt1,4))
resL = resL+(dSinTWp*g1*Conjg(ZN(gt2,4))*Sin(TW)*ZN(gt1,4))/2._dp
resL = resL+(dSinTW*g1*Conjg(ZN(gt2,4))*Sin(TWp)*ZN(gt1,4))/2._dp
resL = resL+(dCosTW*g2*Conjg(ZN(gt2,4))*Sin(TWp)*ZN(gt1,4))/2._dp
resL = resL+(g2*Conjg(dZN(gt2,4))*Cos(TW)*Sin(TWp)*ZN(gt1,4))/2._dp
resL = resL+(dg2*Conjg(ZN(gt2,4))*Cos(TW)*Sin(TWp)*ZN(gt1,4))/2._dp
resL = resL+(g1*Conjg(dZN(gt2,4))*Sin(TW)*Sin(TWp)*ZN(gt1,4))/2._dp
resL = resL+(dg1*Conjg(ZN(gt2,4))*Sin(TW)*Sin(TWp)*ZN(gt1,4))/2._dp
resL = resL-(dCosTWp*gp*QHu*Conjg(ZN(gt2,5))*ZN(gt1,5))
resL = resL-(dSinTWp*g2*Conjg(ZN(gt2,5))*Cos(TW)*ZN(gt1,5))/2._dp
resL = resL-(gp*QHu*Conjg(dZN(gt2,5))*Cos(TWp)*ZN(gt1,5))
resL = resL-(dgp*QHu*Conjg(ZN(gt2,5))*Cos(TWp)*ZN(gt1,5))
resL = resL-(dSinTWp*g1*Conjg(ZN(gt2,5))*Sin(TW)*ZN(gt1,5))/2._dp
resL = resL-(dSinTW*g1*Conjg(ZN(gt2,5))*Sin(TWp)*ZN(gt1,5))/2._dp
resL = resL-(dCosTW*g2*Conjg(ZN(gt2,5))*Sin(TWp)*ZN(gt1,5))/2._dp
resL = resL-(g2*Conjg(dZN(gt2,5))*Cos(TW)*Sin(TWp)*ZN(gt1,5))/2._dp
resL = resL-(dg2*Conjg(ZN(gt2,5))*Cos(TW)*Sin(TWp)*ZN(gt1,5))/2._dp
resL = resL-(g1*Conjg(dZN(gt2,5))*Sin(TW)*Sin(TWp)*ZN(gt1,5))/2._dp
resL = resL-(dg1*Conjg(ZN(gt2,5))*Sin(TW)*Sin(TWp)*ZN(gt1,5))/2._dp
resL = resL-(dCosTWp*gp*Qs*Conjg(ZN(gt2,6))*ZN(gt1,6))
resL = resL-(gp*Qs*Conjg(dZN(gt2,6))*Cos(TWp)*ZN(gt1,6))
resL = resL-(dgp*Qs*Conjg(ZN(gt2,6))*Cos(TWp)*ZN(gt1,6))
resL = resL-(dCosTWp*gp*Qs1*Conjg(ZN(gt2,7))*ZN(gt1,7))
resL = resL-(gp*Qs1*Conjg(dZN(gt2,7))*Cos(TWp)*ZN(gt1,7))
resL = resL-(dgp*Qs1*Conjg(ZN(gt2,7))*Cos(TWp)*ZN(gt1,7))
resL = resL-(dCosTWp*gp*Qs2*Conjg(ZN(gt2,8))*ZN(gt1,8))
resL = resL-(gp*Qs2*Conjg(dZN(gt2,8))*Cos(TWp)*ZN(gt1,8))
resL = resL-(dgp*Qs2*Conjg(ZN(gt2,8))*Cos(TWp)*ZN(gt1,8))
resL = resL-(dCosTWp*gp*Qs3*Conjg(ZN(gt2,9))*ZN(gt1,9))
resL = resL-(gp*Qs3*Conjg(dZN(gt2,9))*Cos(TWp)*ZN(gt1,9))
resL = resL-(dgp*Qs3*Conjg(ZN(gt2,9))*Cos(TWp)*ZN(gt1,9))
resR = 0._dp 
resR = resR+gp*QHd*Conjg(ZN(gt1,4))*Cos(TWp)*dZN(gt2,4)
resR = resR+gp*QHu*Conjg(ZN(gt1,5))*Cos(TWp)*dZN(gt2,5)
resR = resR+gp*Qs*Conjg(ZN(gt1,6))*Cos(TWp)*dZN(gt2,6)
resR = resR+gp*Qs1*Conjg(ZN(gt1,7))*Cos(TWp)*dZN(gt2,7)
resR = resR+gp*Qs2*Conjg(ZN(gt1,8))*Cos(TWp)*dZN(gt2,8)
resR = resR+gp*Qs3*Conjg(ZN(gt1,9))*Cos(TWp)*dZN(gt2,9)
resR = resR-(g2*Conjg(ZN(gt1,4))*Cos(TW)*dZN(gt2,4)*Sin(TWp))/2._dp
resR = resR+(g2*Conjg(ZN(gt1,5))*Cos(TW)*dZN(gt2,5)*Sin(TWp))/2._dp
resR = resR-(g1*Conjg(ZN(gt1,4))*dZN(gt2,4)*Sin(TW)*Sin(TWp))/2._dp
resR = resR+(g1*Conjg(ZN(gt1,5))*dZN(gt2,5)*Sin(TW)*Sin(TWp))/2._dp
resR = resR+dCosTWp*gp*QHd*Conjg(ZN(gt1,4))*ZN(gt2,4)
resR = resR-(dSinTWp*g2*Conjg(ZN(gt1,4))*Cos(TW)*ZN(gt2,4))/2._dp
resR = resR+gp*QHd*Conjg(dZN(gt1,4))*Cos(TWp)*ZN(gt2,4)
resR = resR+dgp*QHd*Conjg(ZN(gt1,4))*Cos(TWp)*ZN(gt2,4)
resR = resR-(dSinTWp*g1*Conjg(ZN(gt1,4))*Sin(TW)*ZN(gt2,4))/2._dp
resR = resR-(dSinTW*g1*Conjg(ZN(gt1,4))*Sin(TWp)*ZN(gt2,4))/2._dp
resR = resR-(dCosTW*g2*Conjg(ZN(gt1,4))*Sin(TWp)*ZN(gt2,4))/2._dp
resR = resR-(g2*Conjg(dZN(gt1,4))*Cos(TW)*Sin(TWp)*ZN(gt2,4))/2._dp
resR = resR-(dg2*Conjg(ZN(gt1,4))*Cos(TW)*Sin(TWp)*ZN(gt2,4))/2._dp
resR = resR-(g1*Conjg(dZN(gt1,4))*Sin(TW)*Sin(TWp)*ZN(gt2,4))/2._dp
resR = resR-(dg1*Conjg(ZN(gt1,4))*Sin(TW)*Sin(TWp)*ZN(gt2,4))/2._dp
resR = resR+dCosTWp*gp*QHu*Conjg(ZN(gt1,5))*ZN(gt2,5)
resR = resR+(dSinTWp*g2*Conjg(ZN(gt1,5))*Cos(TW)*ZN(gt2,5))/2._dp
resR = resR+gp*QHu*Conjg(dZN(gt1,5))*Cos(TWp)*ZN(gt2,5)
resR = resR+dgp*QHu*Conjg(ZN(gt1,5))*Cos(TWp)*ZN(gt2,5)
resR = resR+(dSinTWp*g1*Conjg(ZN(gt1,5))*Sin(TW)*ZN(gt2,5))/2._dp
resR = resR+(dSinTW*g1*Conjg(ZN(gt1,5))*Sin(TWp)*ZN(gt2,5))/2._dp
resR = resR+(dCosTW*g2*Conjg(ZN(gt1,5))*Sin(TWp)*ZN(gt2,5))/2._dp
resR = resR+(g2*Conjg(dZN(gt1,5))*Cos(TW)*Sin(TWp)*ZN(gt2,5))/2._dp
resR = resR+(dg2*Conjg(ZN(gt1,5))*Cos(TW)*Sin(TWp)*ZN(gt2,5))/2._dp
resR = resR+(g1*Conjg(dZN(gt1,5))*Sin(TW)*Sin(TWp)*ZN(gt2,5))/2._dp
resR = resR+(dg1*Conjg(ZN(gt1,5))*Sin(TW)*Sin(TWp)*ZN(gt2,5))/2._dp
resR = resR+dCosTWp*gp*Qs*Conjg(ZN(gt1,6))*ZN(gt2,6)
resR = resR+gp*Qs*Conjg(dZN(gt1,6))*Cos(TWp)*ZN(gt2,6)
resR = resR+dgp*Qs*Conjg(ZN(gt1,6))*Cos(TWp)*ZN(gt2,6)
resR = resR+dCosTWp*gp*Qs1*Conjg(ZN(gt1,7))*ZN(gt2,7)
resR = resR+gp*Qs1*Conjg(dZN(gt1,7))*Cos(TWp)*ZN(gt2,7)
resR = resR+dgp*Qs1*Conjg(ZN(gt1,7))*Cos(TWp)*ZN(gt2,7)
resR = resR+dCosTWp*gp*Qs2*Conjg(ZN(gt1,8))*ZN(gt2,8)
resR = resR+gp*Qs2*Conjg(dZN(gt1,8))*Cos(TWp)*ZN(gt2,8)
resR = resR+dgp*Qs2*Conjg(ZN(gt1,8))*Cos(TWp)*ZN(gt2,8)
resR = resR+dCosTWp*gp*Qs3*Conjg(ZN(gt1,9))*ZN(gt2,9)
resR = resR+gp*Qs3*Conjg(dZN(gt1,9))*Cos(TWp)*ZN(gt2,9)
resR = resR+dgp*Qs3*Conjg(ZN(gt1,9))*Cos(TWp)*ZN(gt2,9)
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingChiChiVZp  
 
 
Subroutine CT_CouplingcChaChiVWm(gt1,gt2,g2,ZN,UM,UP,dg2,dZN,dUM,dUP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZN(9,9),UM(2,2),UP(2,2),dZN(9,9),dUM(2,2),dUP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcChaChiVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.9)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(g2*Conjg(ZN(gt2,3))*dUM(gt1,1))
resL = resL-((g2*Conjg(ZN(gt2,4))*dUM(gt1,2))/sqrt(2._dp))
resL = resL-(g2*Conjg(dZN(gt2,3))*UM(gt1,1))
resL = resL-(dg2*Conjg(ZN(gt2,3))*UM(gt1,1))
resL = resL-((g2*Conjg(dZN(gt2,4))*UM(gt1,2))/sqrt(2._dp))
resL = resL-((dg2*Conjg(ZN(gt2,4))*UM(gt1,2))/sqrt(2._dp))
resR = 0._dp 
resR = resR-(g2*Conjg(UP(gt1,1))*dZN(gt2,3))
resR = resR+(g2*Conjg(UP(gt1,2))*dZN(gt2,5))/sqrt(2._dp)
resR = resR-(g2*Conjg(dUP(gt1,1))*ZN(gt2,3))
resR = resR-(dg2*Conjg(UP(gt1,1))*ZN(gt2,3))
resR = resR+(g2*Conjg(dUP(gt1,2))*ZN(gt2,5))/sqrt(2._dp)
resR = resR+(dg2*Conjg(UP(gt1,2))*ZN(gt2,5))/sqrt(2._dp)
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcChaChiVWm  
 
 
Subroutine CT_CouplingcFdFdVG(gt1,gt2,g3,dg3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(dg3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(dg3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdVG  
 
 
Subroutine CT_CouplingcFdFdVP(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,          & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTW*g1)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*g2)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(dCosTW*g1)/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dg1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdVP  
 
 
Subroutine CT_CouplingcFdFdVZ(gt1,gt2,g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,             & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTWp*gp*Qq)
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTWp*g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*g1*Cos(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTW*g2*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg2*Cos(TW)*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTWp*g1*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg1*Cos(TWp)*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dgp*Qq*Sin(TWp))
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+dSinTWp*gp*Qd
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dSinTW*g1*Cos(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dCosTWp*g1*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dg1*Cos(TWp)*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+dgp*Qd*Sin(TWp)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdVZ  
 
 
Subroutine CT_CouplingcFdFdVZp(gt1,gt2,g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,            & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTWp*gp*Qq)
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTWp*g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dgp*Qq*Cos(TWp))
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTWp*g1*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTW*g1*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTW*g2*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg2*Cos(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg1*Sin(TW)*Sin(TWp))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+dCosTWp*gp*Qd
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+dgp*Qd*Cos(TWp)
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dSinTWp*g1*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dSinTW*g1*Sin(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dg1*Sin(TW)*Sin(TWp))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdVZp  
 
 
Subroutine CT_CouplingcFuFdcVWm(gt1,gt2,g2,ZDL,ZUL,dg2,dZDL,dZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3),dZDL(3,3),dZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFdcVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZDL(gt2,j1))*dZUL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZDL(gt2,j1))*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(ZDL(gt2,j1))*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFdcVWm  
 
 
Subroutine CT_CouplingcFeFeVP(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,          & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTW*g1)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*g2)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg1*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+dCosTW*g1
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+dg1*Cos(TW)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFeVP  
 
 
Subroutine CT_CouplingcFeFeVZ(gt1,gt2,g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,             & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTWp*gp*Ql)
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTWp*g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTW*g1*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTW*g2*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg2*Cos(TW)*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTWp*g1*Sin(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg1*Cos(TWp)*Sin(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dgp*Ql*Sin(TWp))
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+dSinTWp*gp*Qe
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dSinTW*g1*Cos(TWp))
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dCosTWp*g1*Sin(TW))
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dg1*Cos(TWp)*Sin(TW))
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+dgp*Qe*Sin(TWp)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFeVZ  
 
 
Subroutine CT_CouplingcFeFeVZp(gt1,gt2,g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,            & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFeVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTWp*gp*Ql)
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTWp*g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dgp*Ql*Cos(TWp))
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTWp*g1*Sin(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*g1*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTW*g2*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg2*Cos(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg1*Sin(TW)*Sin(TWp))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+dCosTWp*gp*Qe
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+dgp*Qe*Cos(TWp)
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+dSinTWp*g1*Sin(TW)
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+dSinTW*g1*Sin(TWp)
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+dg1*Sin(TW)*Sin(TWp)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFeVZp  
 
 
Subroutine CT_CouplingcFvFecVWm(gt1,gt2,g2,ZVL,ZEL,dg2,dZVL,dZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZVL(3,3),ZEL(3,3),dZVL(3,3),dZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFvFecVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZEL(gt2,j1))*dZVL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZEL(gt2,j1))*ZVL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(ZEL(gt2,j1))*ZVL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFvFecVWm  
 
 
Subroutine CT_CouplingcFuFuVG(gt1,gt2,g3,dg3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(dg3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(dg3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuVG  
 
 
Subroutine CT_CouplingcFuFuVP(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,          & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTW*g1)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTW*g2)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*dCosTW*g1)/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*dg1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuVP  
 
 
Subroutine CT_CouplingcFdFuVWm(gt1,gt2,g2,ZDL,ZUL,dg2,dZDL,dZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3),dZDL(3,3),dZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFuVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZUL(gt2,j1))*dZDL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZUL(gt2,j1))*ZDL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(ZUL(gt2,j1))*ZDL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFuVWm  
 
 
Subroutine CT_CouplingcFuFuVZ(gt1,gt2,g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,             & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTWp*gp*Qq)
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTWp*g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*g1*Cos(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTW*g2*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg2*Cos(TW)*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTWp*g1*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg1*Cos(TWp)*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dgp*Qq*Sin(TWp))
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+dSinTWp*gp*Qu
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*dSinTW*g1*Cos(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*dCosTWp*g1*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*dg1*Cos(TWp)*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+dgp*Qu*Sin(TWp)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuVZ  
 
 
Subroutine CT_CouplingcFuFuVZp(gt1,gt2,g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,            & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTWp*gp*Qq)
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTWp*g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dgp*Qq*Cos(TWp))
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTWp*g1*Sin(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTW*g1*Sin(TWp))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTW*g2*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg2*Cos(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg1*Sin(TW)*Sin(TWp))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+dCosTWp*gp*Qu
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+dgp*Qu*Cos(TWp)
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*dSinTWp*g1*Sin(TW))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*dSinTW*g1*Sin(TWp))/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*dg1*Sin(TW)*Sin(TWp))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuVZp  
 
 
Subroutine CT_CouplingcFeFvVWm(gt1,gt2,g2,ZVL,ZEL,dg2,dZVL,dZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZVL(3,3),ZEL(3,3),dZVL(3,3),dZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFvVWm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZVL(gt2,j1))*dZEL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZVL(gt2,j1))*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(ZVL(gt2,j1))*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFvVWm  
 
 
Subroutine CT_CouplingcFvFvVZ(gt1,gt2,g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,             & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTWp*gp*Ql)
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTWp*g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTW*g1*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTW*g2*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg2*Cos(TW)*Cos(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTWp*g1*Sin(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg1*Cos(TWp)*Sin(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dgp*Ql*Sin(TWp))
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+dSinTWp*gp*Qv
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+dgp*Qv*Sin(TWp)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFvFvVZ  
 
 
Subroutine CT_CouplingcFvFvVZp(gt1,gt2,g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,            & 
& dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,gp,TW,TWp,dg1,dg2,dgp,dSinTW,dCosTW,dTanTW,dSinTWp,dCosTWp,dTanTWp

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFvFvVZp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTWp*gp*Ql)
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTWp*g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dgp*Ql*Cos(TWp))
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTWp*g1*Sin(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*g1*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTW*g2*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg2*Cos(TW)*Sin(TWp))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg1*Sin(TW)*Sin(TWp))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+dCosTWp*gp*Qv
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+dgp*Qv*Cos(TWp)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFvFvVZp  
 
 
Subroutine CT_CouplingGluGluVG(g3,pG,dg3,dpG,resL,resR)

Implicit None 

Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(in) :: pG,dpG

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingGluGluVG' 
 
resL = 0._dp 
resL = resL-(g3*pG*Conjg(dpG))
resL = resL-(dpG*g3*Conjg(pG))
resL = resL-(dg3*pG*Conjg(pG))
resR = 0._dp 
resR = resR-(g3*pG*Conjg(dpG))
resR = resR-(dpG*g3*Conjg(pG))
resR = resR-(dg3*pG*Conjg(pG))
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingGluGluVG  
 
 
End Module CouplingsCT_sec_UMSSM 
