! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 1:04 on 7.11.2019   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_Sv_sec_UMSSM
Use Control 
Use Settings 
Use LoopFunctions 
Use AddLoopFunctions 
Use Model_Data_sec_UMSSM 
Use DecayFFS 
Use DecayFFV 
Use DecaySSS 
Use DecaySFF 
Use DecaySSV 
Use DecaySVV 
Use Bremsstrahlung 

Contains 

Subroutine Amplitude_Tree_sec_UMSSM_SvToSvAh(cplAhSvcSv,MAh,MSv,MAh2,MSv2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MSv(6),MAh2(6),MSv2(6)

Complex(dp), Intent(in) :: cplAhSvcSv(6,6,6)

Complex(dp) :: Amp(6,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MAh(gt3) 
! Tree-Level Vertex 
coupT1 = cplAhSvcSv(gt3,gt2,gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_SvToSvAh


Subroutine Gamma_Real_sec_UMSSM_SvToSvAh(MLambda,em,gs,cplAhSvcSv,MAh,MSv,            & 
& GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhSvcSv(6,6,6)

Real(dp), Intent(in) :: MAh(6),MSv(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,6), GammarealGluon(6,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
    Do i3=3,6
Coup = cplAhSvcSv(i3,i2,i1)
Mex1 = MSv(i1)
Mex2 = MSv(i2)
Mex3 = MAh(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Gammarealphoton(i1,i2,i3) = 0._dp 
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_SvToSvAh


Subroutine Amplitude_WAVE_sec_UMSSM_SvToSvAh(cplAhSvcSv,ctcplAhSvcSv,MAh,             & 
& MAh2,MSv,MSv2,ZfAh,ZfSv,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MAh2(6),MSv(6),MSv2(6)

Complex(dp), Intent(in) :: cplAhSvcSv(6,6,6)

Complex(dp), Intent(in) :: ctcplAhSvcSv(6,6,6)

Complex(dp), Intent(in) :: ZfAh(6,6),ZfSv(6,6)

Complex(dp), Intent(out) :: Amp(6,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MAh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhSvcSv(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSv(i1,gt1))*cplAhSvcSv(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSv(i1,gt2)*cplAhSvcSv(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt3)*cplAhSvcSv(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_SvToSvAh


Subroutine Amplitude_VERTEX_sec_UMSSM_SvToSvAh(MAh,MCha,MChi,MFe,MFv,Mhh,             & 
& MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,              & 
& MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,  & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcFeChaSvL,cplcFeChaSvR,cplChiFvcSvL,             & 
& cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcChaFecSvL,cplcChaFecSvR,cplhhSvcSv,         & 
& cplHpmSvcSe,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,              & 
& cplAhAhSvcSv1,cplAhhhSvcSv1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,cplhhhhSvcSv1,              & 
& cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,cplSeSvcSecSv1,cplSuSvcSucSvaa,cplSvSvcSvcSv1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSv(6),MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),       & 
& MSd2(6),MSe2(6),MSu2(6),MSv2(6),MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhAh(6,6,6),cplAhAhhh(6,6,6),cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),          & 
& cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6),         & 
& cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),cplAhhhhh(6,6,6),cplAhhhVZ(6,6),cplAhhhVZp(6,6), & 
& cplAhHpmcHpm(6,2,2),cplAhHpmcVWm(6,2),cplAhSdcSd(6,6,6),cplAhSecSe(6,6,6),             & 
& cplAhSucSu(6,6,6),cplAhSvcSv(6,6,6),cplAhcHpmVWm(6,2),cplcFeChaSvL(3,2,6),             & 
& cplcFeChaSvR(3,2,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),cplcFvChiSvL(3,9,6),       & 
& cplcFvChiSvR(3,9,6),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplhhSvcSv(6,6,6),       & 
& cplHpmSvcSe(2,6,6),cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),cplSvcSeVWm(6,6),             & 
& cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),cplAhAhSvcSv1(6,6,6,6),cplAhhhSvcSv1(6,6,6,6),        & 
& cplAhHpmSvcSe1(6,2,6,6),cplAhSecHpmcSv1(6,6,2,6),cplhhhhSvcSv1(6,6,6,6),               & 
& cplHpmSvcHpmcSv1(2,6,2,6),cplSdSvcSdcSvaa(6,6,6,6),cplSeSvcSecSv1(6,6,6,6),            & 
& cplSuSvcSucSvaa(6,6,6,6),cplSvSvcSvcSv1(6,6,6,6)

Complex(dp), Intent(out) :: Amp(6,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,6
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MAh(gt3) 


! {Ah, conj[Sv], conj[Sv]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplAhSvcSv(i1,i2,gt1)
coup2 = cplAhSvcSv(i1,gt2,i3)
coup3 = cplAhSvcSv(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, bar[Fv], bar[Fv]}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvcSvL(i1,i2,gt1)
coup1R = cplChiFvcSvR(i1,i2,gt1)
coup2L = cplcFvChiSvL(i3,i1,gt2)
coup2R = cplcFvChiSvR(i3,i1,gt2)
coup3L = cplcFvFvAhL(i2,i3,gt3)
coup3R = cplcFvFvAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, Cha, Cha}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFecSvL(i2,i1,gt1)
coup1R = cplcChaFecSvR(i2,i1,gt1)
coup2L = cplcFeChaSvL(i1,i3,gt2)
coup2R = cplcFeChaSvR(i1,i3,gt2)
coup3L = cplcChaChaAhL(i3,i2,gt3)
coup3R = cplcChaChaAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, Chi, Chi}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvcSvL(i2,i1,gt1)
coup1R = cplChiFvcSvR(i2,i1,gt1)
coup2L = cplcFvChiSvL(i1,i3,gt2)
coup2R = cplcFvChiSvR(i1,i3,gt2)
coup3L = cplChiChiAhL(i3,i2,gt3)
coup3R = cplChiChiAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, conj[Sv], conj[Sv]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplhhSvcSv(i1,i2,gt1)
coup2 = cplhhSvcSv(i1,gt2,i3)
coup3 = cplAhSvcSv(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Se, Hpm, Hpm}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplSecHpmcSv(i1,i2,gt1)
coup2 = cplHpmSvcSe(i3,gt2,i1)
coup3 = cplAhHpmcHpm(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Se, VWm, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSecSvcVWm(i1,gt1)
coup2 = cplHpmSvcSe(i3,gt2,i1)
coup3 = cplAhcHpmVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Se, Hpm, VWm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplSecHpmcSv(i1,i2,gt1)
coup2 = -cplSvcSeVWm(gt2,i1)
coup3 = cplAhHpmcVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sv, Ah, Ah}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhSvcSv(i2,i1,gt1)
coup2 = cplAhSvcSv(i3,gt2,i1)
coup3 = cplAhAhAh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sv, hh, Ah}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvcSv(i2,i1,gt1)
coup2 = cplAhSvcSv(i3,gt2,i1)
coup3 = cplAhAhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sv, Ah, hh}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSvcSv(i2,i1,gt1)
coup2 = cplhhSvcSv(i3,gt2,i1)
coup3 = cplAhAhhh(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sv, hh, hh}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvcSv(i2,i1,gt1)
coup2 = cplhhSvcSv(i3,gt2,i1)
coup3 = cplAhhhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sv, VZ, hh}
Do i1=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplSvcSvVZ(i1,gt1)
coup2 = cplhhSvcSv(i3,gt2,i1)
coup3 = cplAhhhVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sv, VZp, hh}
Do i1=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplSvcSvVZp(i1,gt1)
coup2 = cplhhSvcSv(i3,gt2,i1)
coup3 = cplAhhhVZp(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sv, hh, VZ}
Do i1=1,6
  Do i2=1,6
ML1 = MSv(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhSvcSv(i2,i1,gt1)
coup2 = -cplSvcSvVZ(gt2,i1)
coup3 = cplAhhhVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sv, hh, VZp}
Do i1=1,6
  Do i2=1,6
ML1 = MSv(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhSvcSv(i2,i1,gt1)
coup2 = -cplSvcSvVZp(gt2,i1)
coup3 = cplAhhhVZp(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VZ, conj[Sv], conj[Sv]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplSvcSvVZ(i2,gt1)
coup2 = -cplSvcSvVZ(gt2,i3)
coup3 = cplAhSvcSv(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Sv], conj[Sv]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplSvcSvVZp(i2,gt1)
coup2 = -cplSvcSvVZp(gt2,i3)
coup3 = cplAhSvcSv(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFecSvL(i1,i2,gt1)
coup1R = cplcChaFecSvR(i1,i2,gt1)
coup2L = cplcFeChaSvL(i3,i1,gt2)
coup2R = cplcFeChaSvR(i3,i1,gt2)
coup3L = cplcFeFeAhL(i2,i3,gt3)
coup3R = cplcFeFeAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Hpm], conj[Se], conj[Se]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecHpmcSv(i2,i1,gt1)
coup2 = cplHpmSvcSe(i1,gt2,i3)
coup3 = cplAhSecSe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[VWm], conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSvcVWm(i2,gt1)
coup2 = -cplSvcSeVWm(gt2,i3)
coup3 = cplAhSecSe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, conj[Sv]}
Do i1=1,6
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSv(i2) 
coup1 = cplAhSvcSv(i1,i2,gt1)
coup2 = cplAhAhSvcSv1(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, conj[Sv]}
Do i1=1,6
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSv(i2) 
coup1 = cplhhSvcSv(i1,i2,gt1)
coup2 = cplAhhhSvcSv1(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Se, Hpm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
coup1 = cplSecHpmcSv(i1,i2,gt1)
coup2 = cplAhHpmSvcSe1(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, conj[Sv]}
Do i1=1,6
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSv(i2) 
coup1 = cplAhAhSvcSv1(gt3,i1,i2,gt1)
coup2 = cplAhSvcSv(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {hh, conj[Sv]}
Do i1=1,6
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSv(i2) 
coup1 = cplAhhhSvcSv1(gt3,i1,i2,gt1)
coup2 = cplhhSvcSv(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Se, Hpm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
coup1 = cplAhSecHpmcSv1(gt3,i1,i2,gt1)
coup2 = cplHpmSvcSe(i2,gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Ah, Ah}
Do i1=1,6
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhSvcSv1(i1,i2,gt2,gt1)
coup2 = cplAhAhAh(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Ah, hh}
Do i1=1,6
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhSvcSv1(i1,i2,gt2,gt1)
coup2 = cplAhAhhh(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {hh, hh}
Do i1=1,6
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhSvcSv1(i1,i2,gt2,gt1)
coup2 = cplAhhhhh(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hpm, Hpm}
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplHpmSvcHpmcSv1(i1,gt2,i2,gt1)
coup2 = cplAhHpmcHpm(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Sd, Sd}
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplSdSvcSdcSvaa(i1,gt2,i2,gt1)
coup2 = cplAhSdcSd(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do


! {Se, Se}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplSeSvcSecSv1(i1,gt2,i2,gt1)
coup2 = cplAhSecSe(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Su, Su}
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplSuSvcSucSvaa(i1,gt2,i2,gt1)
coup2 = cplAhSucSu(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do


! {Sv, Sv}
Do i1=1,6
  Do i2=1,6
ML1 = MSv(i1) 
ML2 = MSv(i2) 
coup1 = cplSvSvcSvcSv1(gt2,i1,gt1,i2)
coup2 = cplAhSvcSv(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_sec_UMSSM_SvToSvAh


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SvToSvAh(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,  & 
& cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,cplcFvFvAhR,             & 
& cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,cplAhSecSe,        & 
& cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplcFeChaSvL,cplcFeChaSvR,cplChiFvcSvL,             & 
& cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcChaFecSvL,cplcChaFecSvR,cplhhSvcSv,         & 
& cplHpmSvcSe,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,              & 
& cplAhAhSvcSv1,cplAhhhSvcSv1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,cplhhhhSvcSv1,              & 
& cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,cplSeSvcSecSv1,cplSuSvcSucSvaa,cplSvSvcSvcSv1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSv(6),MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),       & 
& MSd2(6),MSe2(6),MSu2(6),MSv2(6),MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhAh(6,6,6),cplAhAhhh(6,6,6),cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),          & 
& cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6),         & 
& cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),cplAhhhhh(6,6,6),cplAhhhVZ(6,6),cplAhhhVZp(6,6), & 
& cplAhHpmcHpm(6,2,2),cplAhHpmcVWm(6,2),cplAhSdcSd(6,6,6),cplAhSecSe(6,6,6),             & 
& cplAhSucSu(6,6,6),cplAhSvcSv(6,6,6),cplAhcHpmVWm(6,2),cplcFeChaSvL(3,2,6),             & 
& cplcFeChaSvR(3,2,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),cplcFvChiSvL(3,9,6),       & 
& cplcFvChiSvR(3,9,6),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplhhSvcSv(6,6,6),       & 
& cplHpmSvcSe(2,6,6),cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),cplSvcSeVWm(6,6),             & 
& cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),cplAhAhSvcSv1(6,6,6,6),cplAhhhSvcSv1(6,6,6,6),        & 
& cplAhHpmSvcSe1(6,2,6,6),cplAhSecHpmcSv1(6,6,2,6),cplhhhhSvcSv1(6,6,6,6),               & 
& cplHpmSvcHpmcSv1(2,6,2,6),cplSdSvcSdcSvaa(6,6,6,6),cplSeSvcSecSv1(6,6,6,6),            & 
& cplSuSvcSucSvaa(6,6,6,6),cplSvSvcSvcSv1(6,6,6,6)

Complex(dp), Intent(out) :: Amp(6,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,6
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MAh(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SvToSvAh


Subroutine Amplitude_Tree_sec_UMSSM_SvToFvChi(cplChiFvcSvL,cplChiFvcSvR,              & 
& MChi,MFv,MSv,MChi2,MFv2,MSv2,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(9),MFv(3),MSv(6),MChi2(9),MFv2(3),MSv2(6)

Complex(dp), Intent(in) :: cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6)

Complex(dp) :: Amp(2,6,3,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,9
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MChi(gt3) 
! Tree-Level Vertex 
coupT1L = cplChiFvcSvL(gt3,gt2,gt1)
coupT1R = cplChiFvcSvR(gt3,gt2,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_SvToFvChi


Subroutine Gamma_Real_sec_UMSSM_SvToFvChi(MLambda,em,gs,cplChiFvcSvL,cplChiFvcSvR,    & 
& MChi,MFv,MSv,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6)

Real(dp), Intent(in) :: MChi(9),MFv(3),MSv(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,3,9), GammarealGluon(6,3,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,3
    Do i3=1,9
CoupL = cplChiFvcSvL(i3,i2,i1)
CoupR = cplChiFvcSvR(i3,i2,i1)
Mex1 = MSv(i1)
Mex2 = MFv(i2)
Mex3 = MChi(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Gammarealphoton(i1,i2,i3) = 0._dp 
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_SvToFvChi


Subroutine Amplitude_WAVE_sec_UMSSM_SvToFvChi(cplChiFvcSvL,cplChiFvcSvR,              & 
& ctcplChiFvcSvL,ctcplChiFvcSvR,MChi,MChi2,MFv,MFv2,MSv,MSv2,ZfFVL,ZfFVR,ZfL0,ZfSv,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(9),MChi2(9),MFv(3),MFv2(3),MSv(6),MSv2(6)

Complex(dp), Intent(in) :: cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6)

Complex(dp), Intent(in) :: ctcplChiFvcSvL(9,3,6),ctcplChiFvcSvR(9,3,6)

Complex(dp), Intent(in) :: ZfFVL(3,3),ZfFVR(3,3),ZfL0(9,9),ZfSv(6,6)

Complex(dp), Intent(out) :: Amp(2,6,3,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,9
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MChi(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiFvcSvL(gt3,gt2,gt1) 
ZcoupT1R = ctcplChiFvcSvR(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfSv(i1,gt1))*cplChiFvcSvL(gt3,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfSv(i1,gt1))*cplChiFvcSvR(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFVL(i1,gt2)*cplChiFvcSvL(gt3,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFVR(i1,gt2))*cplChiFvcSvR(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,9
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt3)*cplChiFvcSvL(i1,gt2,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt3))*cplChiFvcSvR(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_SvToFvChi


Subroutine Amplitude_VERTEX_sec_UMSSM_SvToFvChi(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,            & 
& MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFvFvAhL,cplcFvFvAhR,cplAhSvcSv,         & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,              & 
& cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,       & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,           & 
& cplcFvFvVZpR,cplhhSvcSv,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVWm,               & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),        & 
& cplAhSvcSv(6,6,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChiChacVWmL(9,2),     & 
& cplChiChacVWmR(9,2),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplChiChihhL(9,9,6),       & 
& cplChiChihhR(9,9,6),cplChiChiVZL(9,9),cplChiChiVZR(9,9),cplChiChiVZpL(9,9),            & 
& cplChiChiVZpR(9,9),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFvcSvL(9,3,6),        & 
& cplChiFvcSvR(9,3,6),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcFeChiSeL(3,9,6),   & 
& cplcFeChiSeR(3,9,6),cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),cplcChaChiVWmL(2,9),       & 
& cplcChaChiVWmR(2,9),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFvFvhhL(3,3,6),      & 
& cplcFvFvhhR(3,3,6),cplcFeFvHpmL(3,3,2),cplcFeFvHpmR(3,3,2),cplcFeFvVWmL(3,3),          & 
& cplcFeFvVWmR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplcFvFvVZpL(3,3),cplcFvFvVZpR(3,3),& 
& cplhhSvcSv(6,6,6),cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),cplSvcSvVZ(6,6),               & 
& cplSvcSvVZp(6,6)

Complex(dp), Intent(out) :: Amp(2,6,3,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,9
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MChi(gt3) 


! {Ah, conj[Sv], bar[Fv]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MSv(i2) 
ML3 = MFv(i3) 
coup1 = cplAhSvcSv(i1,i2,gt1)
coup2L = cplcFvFvAhL(i3,gt2,i1)
coup2R = cplcFvFvAhR(i3,gt2,i1)
coup3L = cplChiFvcSvL(gt3,i3,i2)
coup3R = cplChiFvcSvR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, bar[Fv], conj[Sv]}
Do i1=1,9
  Do i2=1,3
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MFv(i2) 
ML3 = MSv(i3) 
coup1L = cplChiFvcSvL(i1,i2,gt1)
coup1R = cplChiFvcSvR(i1,i2,gt1)
coup2L = cplChiFvcSvL(i1,gt2,i3)
coup2R = cplChiFvcSvR(i1,gt2,i3)
coup3L = cplcFvChiSvL(i2,gt3,i3)
coup3R = cplcFvChiSvR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, Cha, Hpm}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaFecSvL(i2,i1,gt1)
coup1R = cplcChaFecSvR(i2,i1,gt1)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
coup3L = cplChiChacHpmL(gt3,i2,i3)
coup3R = cplChiChacHpmR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, Cha, VWm}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MVWm 
coup1L = cplcChaFecSvL(i2,i1,gt1)
coup1R = cplcChaFecSvR(i2,i1,gt1)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
coup3L = -cplChiChacVWmR(gt3,i2)
coup3R = -cplChiChacVWmL(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, Chi, Ah}
Do i1=1,3
  Do i2=1,9
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MAh(i3) 
coup1L = cplChiFvcSvL(i2,i1,gt1)
coup1R = cplChiFvcSvR(i2,i1,gt1)
coup2L = cplcFvFvAhL(i1,gt2,i3)
coup2R = cplcFvFvAhR(i1,gt2,i3)
coup3L = cplChiChiAhL(gt3,i2,i3)
coup3R = cplChiChiAhR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, Chi, hh}
Do i1=1,3
  Do i2=1,9
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiFvcSvL(i2,i1,gt1)
coup1R = cplChiFvcSvR(i2,i1,gt1)
coup2L = cplcFvFvhhL(i1,gt2,i3)
coup2R = cplcFvFvhhR(i1,gt2,i3)
coup3L = cplChiChihhL(gt3,i2,i3)
coup3R = cplChiChihhR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, Chi, VZ}
Do i1=1,3
  Do i2=1,9
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MVZ 
coup1L = cplChiFvcSvL(i2,i1,gt1)
coup1R = cplChiFvcSvR(i2,i1,gt1)
coup2L = -cplcFvFvVZR(i1,gt2)
coup2R = -cplcFvFvVZL(i1,gt2)
coup3L = -cplChiChiVZR(gt3,i2)
coup3R = -cplChiChiVZL(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, Chi, VZp}
Do i1=1,3
  Do i2=1,9
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MVZp 
coup1L = cplChiFvcSvL(i2,i1,gt1)
coup1R = cplChiFvcSvR(i2,i1,gt1)
coup2L = -cplcFvFvVZpR(i1,gt2)
coup2R = -cplcFvFvVZpL(i1,gt2)
coup3L = -cplChiChiVZpR(gt3,i2)
coup3R = -cplChiChiVZpL(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, conj[Sv], bar[Fv]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MSv(i2) 
ML3 = MFv(i3) 
coup1 = cplhhSvcSv(i1,i2,gt1)
coup2L = cplcFvFvhhL(i3,gt2,i1)
coup2R = cplcFvFvhhR(i3,gt2,i1)
coup3L = cplChiFvcSvL(gt3,i3,i2)
coup3R = cplChiFvcSvR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Se, Hpm, Cha}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MCha(i3) 
coup1 = cplSecHpmcSv(i1,i2,gt1)
coup2L = cplChaFvcSeL(i3,gt2,i1)
coup2R = cplChaFvcSeR(i3,gt2,i1)
coup3L = cplcChaChiHpmL(i3,gt3,i2)
coup3R = cplcChaChiHpmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Se, VWm, Cha}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MCha(i3) 
coup1 = -cplSecSvcVWm(i1,gt1)
coup2L = cplChaFvcSeL(i3,gt2,i1)
coup2R = cplChaFvcSeR(i3,gt2,i1)
coup3L = cplcChaChiVWmL(i3,gt3)
coup3R = cplcChaChiVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sv, Ah, Chi}
Do i1=1,6
  Do i2=1,6
    Do i3=1,9
ML1 = MSv(i1) 
ML2 = MAh(i2) 
ML3 = MChi(i3) 
coup1 = cplAhSvcSv(i2,i1,gt1)
coup2L = cplChiFvcSvL(i3,gt2,i1)
coup2R = cplChiFvcSvR(i3,gt2,i1)
coup3L = cplChiChiAhL(gt3,i3,i2)
coup3R = cplChiChiAhR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sv, hh, Chi}
Do i1=1,6
  Do i2=1,6
    Do i3=1,9
ML1 = MSv(i1) 
ML2 = Mhh(i2) 
ML3 = MChi(i3) 
coup1 = cplhhSvcSv(i2,i1,gt1)
coup2L = cplChiFvcSvL(i3,gt2,i1)
coup2R = cplChiFvcSvR(i3,gt2,i1)
coup3L = cplChiChihhL(gt3,i3,i2)
coup3R = cplChiChihhR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sv, VZ, Chi}
Do i1=1,6
    Do i3=1,9
ML1 = MSv(i1) 
ML2 = MVZ 
ML3 = MChi(i3) 
coup1 = -cplSvcSvVZ(i1,gt1)
coup2L = cplChiFvcSvL(i3,gt2,i1)
coup2R = cplChiFvcSvR(i3,gt2,i1)
coup3L = -cplChiChiVZR(gt3,i3)
coup3R = -cplChiChiVZL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sv, VZp, Chi}
Do i1=1,6
    Do i3=1,9
ML1 = MSv(i1) 
ML2 = MVZp 
ML3 = MChi(i3) 
coup1 = -cplSvcSvVZp(i1,gt1)
coup2L = cplChiFvcSvL(i3,gt2,i1)
coup2R = cplChiFvcSvR(i3,gt2,i1)
coup3L = -cplChiChiVZpR(gt3,i3)
coup3R = -cplChiChiVZpL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VZ, conj[Sv], bar[Fv]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVZ 
ML2 = MSv(i2) 
ML3 = MFv(i3) 
coup1 = -cplSvcSvVZ(i2,gt1)
coup2L = -cplcFvFvVZR(i3,gt2)
coup2R = -cplcFvFvVZL(i3,gt2)
coup3L = cplChiFvcSvL(gt3,i3,i2)
coup3R = cplChiFvcSvR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Sv], bar[Fv]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVZp 
ML2 = MSv(i2) 
ML3 = MFv(i3) 
coup1 = -cplSvcSvVZp(i2,gt1)
coup2L = -cplcFvFvVZpR(i3,gt2)
coup2R = -cplcFvFvVZpL(i3,gt2)
coup3L = cplChiFvcSvL(gt3,i3,i2)
coup3R = cplChiFvcSvR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], bar[Fe], conj[Se]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFecSvL(i1,i2,gt1)
coup1R = cplcChaFecSvR(i1,i2,gt1)
coup2L = cplChaFvcSeL(i1,gt2,i3)
coup2R = cplChaFvcSeR(i1,gt2,i3)
coup3L = cplcFeChiSeL(i2,gt3,i3)
coup3R = cplcFeChiSeR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Hpm], conj[Se], bar[Fe]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MFe(i3) 
coup1 = cplSecHpmcSv(i2,i1,gt1)
coup2L = cplcFeFvHpmL(i3,gt2,i1)
coup2R = cplcFeFvHpmR(i3,gt2,i1)
coup3L = cplChiFecSeL(gt3,i3,i2)
coup3R = cplChiFecSeR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[VWm], conj[Se], bar[Fe]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MFe(i3) 
coup1 = -cplSecSvcVWm(i2,gt1)
coup2L = -cplcFeFvVWmR(i3,gt2)
coup2R = -cplcFeFvVWmL(i3,gt2)
coup3L = cplChiFecSeL(gt3,i3,i2)
coup3R = cplChiFecSeR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_sec_UMSSM_SvToFvChi


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SvToFvChi(MAh,MCha,MChi,MFe,MFv,             & 
& Mhh,MHpm,MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFvFvAhL,cplcFvFvAhR,               & 
& cplAhSvcSv,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,       & 
& cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,           & 
& cplcFvFvVZpR,cplhhSvcSv,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVWm,               & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),        & 
& cplAhSvcSv(6,6,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChiChacVWmL(9,2),     & 
& cplChiChacVWmR(9,2),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplChiChihhL(9,9,6),       & 
& cplChiChihhR(9,9,6),cplChiChiVZL(9,9),cplChiChiVZR(9,9),cplChiChiVZpL(9,9),            & 
& cplChiChiVZpR(9,9),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFvcSvL(9,3,6),        & 
& cplChiFvcSvR(9,3,6),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcFeChiSeL(3,9,6),   & 
& cplcFeChiSeR(3,9,6),cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),cplcChaChiVWmL(2,9),       & 
& cplcChaChiVWmR(2,9),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFvFvhhL(3,3,6),      & 
& cplcFvFvhhR(3,3,6),cplcFeFvHpmL(3,3,2),cplcFeFvHpmR(3,3,2),cplcFeFvVWmL(3,3),          & 
& cplcFeFvVWmR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplcFvFvVZpL(3,3),cplcFvFvVZpR(3,3),& 
& cplhhSvcSv(6,6,6),cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),cplSvcSvVZ(6,6),               & 
& cplSvcSvVZp(6,6)

Complex(dp), Intent(out) :: Amp(2,6,3,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,9
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MChi(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SvToFvChi


Subroutine Amplitude_Tree_sec_UMSSM_SvTocChaFe(cplcChaFecSvL,cplcChaFecSvR,           & 
& MCha,MFe,MSv,MCha2,MFe2,MSv2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFe(3),MSv(6),MCha2(2),MFe2(3),MSv2(6)

Complex(dp), Intent(in) :: cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6)

Complex(dp) :: Amp(2,6,2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,3
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MFe(gt3) 
! Tree-Level Vertex 
coupT1L = cplcChaFecSvL(gt2,gt3,gt1)
coupT1R = cplcChaFecSvR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_SvTocChaFe


Subroutine Gamma_Real_sec_UMSSM_SvTocChaFe(MLambda,em,gs,cplcChaFecSvL,               & 
& cplcChaFecSvR,MCha,MFe,MSv,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6)

Real(dp), Intent(in) :: MCha(2),MFe(3),MSv(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,2,3), GammarealGluon(6,2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
CoupL = cplcChaFecSvL(i2,i3,i1)
CoupR = cplcChaFecSvR(i2,i3,i1)
Mex1 = MSv(i1)
Mex2 = MCha(i2)
Mex3 = MFe(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_SvTocChaFe


Subroutine Amplitude_WAVE_sec_UMSSM_SvTocChaFe(cplcChaFecSvL,cplcChaFecSvR,           & 
& ctcplcChaFecSvL,ctcplcChaFecSvR,MCha,MCha2,MFe,MFe2,MSv,MSv2,ZfFEL,ZfFER,              & 
& ZfLm,ZfLp,ZfSv,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MFe(3),MFe2(3),MSv(6),MSv2(6)

Complex(dp), Intent(in) :: cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6)

Complex(dp), Intent(in) :: ctcplcChaFecSvL(2,3,6),ctcplcChaFecSvR(2,3,6)

Complex(dp), Intent(in) :: ZfFEL(3,3),ZfFER(3,3),ZfLm(2,2),ZfLp(2,2),ZfSv(6,6)

Complex(dp), Intent(out) :: Amp(2,6,2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,3
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MFe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaFecSvL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcChaFecSvR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfSv(i1,gt1))*cplcChaFecSvL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfSv(i1,gt1))*cplcChaFecSvR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLp(i1,gt2)*cplcChaFecSvL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLm(i1,gt2))*cplcChaFecSvR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFEL(i1,gt3)*cplcChaFecSvL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFER(i1,gt3))*cplcChaFecSvR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_SvTocChaFe


Subroutine Amplitude_VERTEX_sec_UMSSM_SvTocChaFe(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,              & 
& MSe2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhSvcSv,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,   & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,     & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplhhSvcSv,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,       & 
& cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVP,MVWm,           & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6),      & 
& cplAhSvcSv(6,6,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),cplcChaChaVPL(2,2),        & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFvcSvL(9,3,6),       & 
& cplChiFvcSvR(9,3,6),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),   & 
& cplcChaChiVWmR(2,9),cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),cplcFeFeVPL(3,3),            & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),& 
& cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFvFecHpmL(3,3,2),cplcFvFecHpmR(3,3,2),   & 
& cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplhhSvcSv(6,6,6),cplcChacFvSeL(2,3,6),          & 
& cplcChacFvSeR(2,3,6),cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),cplSvcSvVZ(6,6),            & 
& cplSvcSvVZp(6,6)

Complex(dp), Intent(out) :: Amp(2,6,2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MFe(gt3) 


! {Ah, conj[Sv], Cha}
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MSv(i2) 
ML3 = MCha(i3) 
coup1 = cplAhSvcSv(i1,i2,gt1)
coup2L = cplcChaChaAhL(gt2,i3,i1)
coup2R = cplcChaChaAhR(gt2,i3,i1)
coup3L = cplcChaFecSvL(i3,gt3,i2)
coup3R = cplcChaFecSvR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, bar[Fv], Hpm}
Do i1=1,9
  Do i2=1,3
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MFv(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiFvcSvL(i1,i2,gt1)
coup1R = cplChiFvcSvR(i1,i2,gt1)
coup2L = cplcChaChiHpmL(gt2,i1,i3)
coup2R = cplcChaChiHpmR(gt2,i1,i3)
coup3L = cplcFvFecHpmL(i2,gt3,i3)
coup3R = cplcFvFecHpmR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, bar[Fv], VWm}
Do i1=1,9
  Do i2=1,3
ML1 = MChi(i1) 
ML2 = MFv(i2) 
ML3 = MVWm 
coup1L = cplChiFvcSvL(i1,i2,gt1)
coup1R = cplChiFvcSvR(i1,i2,gt1)
coup2L = cplcChaChiVWmL(gt2,i1)
coup2R = cplcChaChiVWmR(gt2,i1)
coup3L = cplcFvFecVWmL(i2,gt3)
coup3R = cplcFvFecVWmR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, Chi, Se}
Do i1=1,3
  Do i2=1,9
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MSe(i3) 
coup1L = cplChiFvcSvL(i2,i1,gt1)
coup1R = cplChiFvcSvR(i2,i1,gt1)
coup2L = cplcChacFvSeL(gt2,i1,i3)
coup2R = cplcChacFvSeR(gt2,i1,i3)
coup3L = cplChiFecSeL(i2,gt3,i3)
coup3R = cplChiFecSeR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, conj[Sv], Cha}
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MSv(i2) 
ML3 = MCha(i3) 
coup1 = cplhhSvcSv(i1,i2,gt1)
coup2L = cplcChaChahhL(gt2,i3,i1)
coup2R = cplcChaChahhR(gt2,i3,i1)
coup3L = cplcChaFecSvL(i3,gt3,i2)
coup3R = cplcChaFecSvR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sv, Ah, Fe}
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSv(i1) 
ML2 = MAh(i2) 
ML3 = MFe(i3) 
coup1 = cplAhSvcSv(i2,i1,gt1)
coup2L = cplcChaFecSvL(gt2,i3,i1)
coup2R = cplcChaFecSvR(gt2,i3,i1)
coup3L = cplcFeFeAhL(i3,gt3,i2)
coup3R = cplcFeFeAhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sv, hh, Fe}
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MSv(i1) 
ML2 = Mhh(i2) 
ML3 = MFe(i3) 
coup1 = cplhhSvcSv(i2,i1,gt1)
coup2L = cplcChaFecSvL(gt2,i3,i1)
coup2R = cplcChaFecSvR(gt2,i3,i1)
coup3L = cplcFeFehhL(i3,gt3,i2)
coup3R = cplcFeFehhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sv, VZ, Fe}
Do i1=1,6
    Do i3=1,3
ML1 = MSv(i1) 
ML2 = MVZ 
ML3 = MFe(i3) 
coup1 = -cplSvcSvVZ(i1,gt1)
coup2L = cplcChaFecSvL(gt2,i3,i1)
coup2R = cplcChaFecSvR(gt2,i3,i1)
coup3L = cplcFeFeVZL(i3,gt3)
coup3R = cplcFeFeVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sv, VZp, Fe}
Do i1=1,6
    Do i3=1,3
ML1 = MSv(i1) 
ML2 = MVZp 
ML3 = MFe(i3) 
coup1 = -cplSvcSvVZp(i1,gt1)
coup2L = cplcChaFecSvL(gt2,i3,i1)
coup2R = cplcChaFecSvR(gt2,i3,i1)
coup3L = cplcFeFeVZpL(i3,gt3)
coup3R = cplcFeFeVZpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VZ, conj[Sv], Cha}
  Do i2=1,6
    Do i3=1,2
ML1 = MVZ 
ML2 = MSv(i2) 
ML3 = MCha(i3) 
coup1 = -cplSvcSvVZ(i2,gt1)
coup2L = cplcChaChaVZL(gt2,i3)
coup2R = cplcChaChaVZR(gt2,i3)
coup3L = cplcChaFecSvL(i3,gt3,i2)
coup3R = cplcChaFecSvR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Sv], Cha}
  Do i2=1,6
    Do i3=1,2
ML1 = MVZp 
ML2 = MSv(i2) 
ML3 = MCha(i3) 
coup1 = -cplSvcSvVZp(i2,gt1)
coup2L = cplcChaChaVZpL(gt2,i3)
coup2R = cplcChaChaVZpR(gt2,i3)
coup3L = cplcChaFecSvL(i3,gt3,i2)
coup3R = cplcChaFecSvR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], bar[Fe], Ah}
Do i1=1,2
  Do i2=1,3
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaFecSvL(i1,i2,gt1)
coup1R = cplcChaFecSvR(i1,i2,gt1)
coup2L = cplcChaChaAhL(gt2,i1,i3)
coup2R = cplcChaChaAhR(gt2,i1,i3)
coup3L = cplcFeFeAhL(i2,gt3,i3)
coup3R = cplcFeFeAhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[Cha], bar[Fe], hh}
Do i1=1,2
  Do i2=1,3
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaFecSvL(i1,i2,gt1)
coup1R = cplcChaFecSvR(i1,i2,gt1)
coup2L = cplcChaChahhL(gt2,i1,i3)
coup2R = cplcChaChahhR(gt2,i1,i3)
coup3L = cplcFeFehhL(i2,gt3,i3)
coup3R = cplcFeFehhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[Cha], bar[Fe], VP}
Do i1=1,2
  Do i2=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MVP 
coup1L = cplcChaFecSvL(i1,i2,gt1)
coup1R = cplcChaFecSvR(i1,i2,gt1)
coup2L = cplcChaChaVPL(gt2,i1)
coup2R = cplcChaChaVPR(gt2,i1)
coup3L = cplcFeFeVPL(i2,gt3)
coup3R = cplcFeFeVPR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Cha], bar[Fe], VZ}
Do i1=1,2
  Do i2=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MVZ 
coup1L = cplcChaFecSvL(i1,i2,gt1)
coup1R = cplcChaFecSvR(i1,i2,gt1)
coup2L = cplcChaChaVZL(gt2,i1)
coup2R = cplcChaChaVZR(gt2,i1)
coup3L = cplcFeFeVZL(i2,gt3)
coup3R = cplcFeFeVZR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Cha], bar[Fe], VZp}
Do i1=1,2
  Do i2=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MVZp 
coup1L = cplcChaFecSvL(i1,i2,gt1)
coup1R = cplcChaFecSvR(i1,i2,gt1)
coup2L = cplcChaChaVZpL(gt2,i1)
coup2R = cplcChaChaVZpR(gt2,i1)
coup3L = cplcFeFeVZpL(i2,gt3)
coup3R = cplcFeFeVZpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hpm], conj[Se], Chi}
Do i1=1,2
  Do i2=1,6
    Do i3=1,9
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MChi(i3) 
coup1 = cplSecHpmcSv(i2,i1,gt1)
coup2L = cplcChaChiHpmL(gt2,i3,i1)
coup2R = cplcChaChiHpmR(gt2,i3,i1)
coup3L = cplChiFecSeL(i3,gt3,i2)
coup3R = cplChiFecSeR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[VWm], conj[Se], Chi}
  Do i2=1,6
    Do i3=1,9
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MChi(i3) 
coup1 = -cplSecSvcVWm(i2,gt1)
coup2L = cplcChaChiVWmL(gt2,i3)
coup2R = cplcChaChiVWmR(gt2,i3)
coup3L = cplChiFecSeL(i3,gt3,i2)
coup3R = cplChiFecSeR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_sec_UMSSM_SvTocChaFe


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SvTocChaFe(MAh,MCha,MChi,MFe,MFv,            & 
& Mhh,MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,              & 
& MSe2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhSvcSv,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiFecSeL,cplChiFecSeR,   & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR, & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,     & 
& cplcFvFecVWmL,cplcFvFecVWmR,cplhhSvcSv,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,       & 
& cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVP,MVWm,           & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6),      & 
& cplAhSvcSv(6,6,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),cplcChaChaVPL(2,2),        & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFvcSvL(9,3,6),       & 
& cplChiFvcSvR(9,3,6),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),   & 
& cplcChaChiVWmR(2,9),cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),cplcFeFeVPL(3,3),            & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),& 
& cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFvFecHpmL(3,3,2),cplcFvFecHpmR(3,3,2),   & 
& cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplhhSvcSv(6,6,6),cplcChacFvSeL(2,3,6),          & 
& cplcChacFvSeR(2,3,6),cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),cplSvcSvVZ(6,6),            & 
& cplSvcSvVZp(6,6)

Complex(dp), Intent(out) :: Amp(2,6,2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MFe(gt3) 


! {bar[Cha], bar[Fe], VP}
Do i1=1,2
  Do i2=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MVP 
coup1L = cplcChaFecSvL(i1,i2,gt1)
coup1R = cplcChaFecSvR(i1,i2,gt1)
coup2L = cplcChaChaVPL(gt2,i1)
coup2R = cplcChaChaVPR(gt2,i1)
coup3L = cplcFeFeVPL(i2,gt3)
coup3R = cplcFeFeVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SvTocChaFe


Subroutine Amplitude_Tree_sec_UMSSM_SvToSvhh(cplhhSvcSv,Mhh,MSv,Mhh2,MSv2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(6),MSv(6),Mhh2(6),MSv2(6)

Complex(dp), Intent(in) :: cplhhSvcSv(6,6,6)

Complex(dp) :: Amp(6,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSv(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhSvcSv(gt3,gt2,gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_SvToSvhh


Subroutine Gamma_Real_sec_UMSSM_SvToSvhh(MLambda,em,gs,cplhhSvcSv,Mhh,MSv,            & 
& GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhSvcSv(6,6,6)

Real(dp), Intent(in) :: Mhh(6),MSv(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,6), GammarealGluon(6,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
Coup = cplhhSvcSv(i3,i2,i1)
Mex1 = MSv(i1)
Mex2 = MSv(i2)
Mex3 = Mhh(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Gammarealphoton(i1,i2,i3) = 0._dp 
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_SvToSvhh


Subroutine Amplitude_WAVE_sec_UMSSM_SvToSvhh(cplhhSvcSv,ctcplhhSvcSv,Mhh,             & 
& Mhh2,MSv,MSv2,Zfhh,ZfSv,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(6),Mhh2(6),MSv(6),MSv2(6)

Complex(dp), Intent(in) :: cplhhSvcSv(6,6,6)

Complex(dp), Intent(in) :: ctcplhhSvcSv(6,6,6)

Complex(dp), Intent(in) :: Zfhh(6,6),ZfSv(6,6)

Complex(dp), Intent(out) :: Amp(6,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSv(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhSvcSv(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSv(i1,gt1))*cplhhSvcSv(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSv(i1,gt2)*cplhhSvcSv(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt3)*cplhhSvcSv(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_SvToSvhh


Subroutine Amplitude_VERTEX_sec_UMSSM_SvToSvhh(MAh,MCha,MChi,MFe,MFv,Mhh,             & 
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
& cplSvcSvVZpVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSv(6),MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),       & 
& MSd2(6),MSe2(6),MSu2(6),MSv2(6),MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(6,6,6),cplAhhhhh(6,6,6),cplAhhhVZ(6,6),cplAhhhVZp(6,6),cplAhSvcSv(6,6,6),   & 
& cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),     & 
& cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),       & 
& cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),         & 
& cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),       & 
& cplhhhhhh(6,6,6),cplhhHpmcHpm(6,2,2),cplhhHpmcVWm(6,2),cplhhSdcSd(6,6,6),              & 
& cplhhSecSe(6,6,6),cplhhSucSu(6,6,6),cplhhSvcSv(6,6,6),cplhhcHpmVWm(6,2),               & 
& cplhhcVWmVWm(6),cplhhVZVZ(6),cplhhVZVZp(6),cplhhVZpVZp(6),cplHpmSvcSe(2,6,6),          & 
& cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),cplSvcSeVWm(6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),& 
& cplAhAhSvcSv1(6,6,6,6),cplAhhhSvcSv1(6,6,6,6),cplhhhhSvcSv1(6,6,6,6),cplhhHpmSvcSe1(6,2,6,6),& 
& cplhhSecHpmcSv1(6,6,2,6),cplHpmSvcHpmcSv1(2,6,2,6),cplSdSvcSdcSvaa(6,6,6,6),           & 
& cplSeSvcSecSv1(6,6,6,6),cplSuSvcSucSvaa(6,6,6,6),cplSvSvcSvcSv1(6,6,6,6),              & 
& cplSvcSvcVWmVWm1(6,6),cplSvcSvVZVZ1(6,6),cplSvcSvVZVZp1(6,6),cplSvcSvVZpVZp1(6,6)

Complex(dp), Intent(out) :: Amp(6,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,6
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSv(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, conj[Sv], conj[Sv]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplAhSvcSv(i1,i2,gt1)
coup2 = cplAhSvcSv(i1,gt2,i3)
coup3 = cplhhSvcSv(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, bar[Fv], bar[Fv]}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvcSvL(i1,i2,gt1)
coup1R = cplChiFvcSvR(i1,i2,gt1)
coup2L = cplcFvChiSvL(i3,i1,gt2)
coup2R = cplcFvChiSvR(i3,i1,gt2)
coup3L = cplcFvFvhhL(i2,i3,gt3)
coup3R = cplcFvFvhhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, Cha, Cha}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFecSvL(i2,i1,gt1)
coup1R = cplcChaFecSvR(i2,i1,gt1)
coup2L = cplcFeChaSvL(i1,i3,gt2)
coup2R = cplcFeChaSvR(i1,i3,gt2)
coup3L = cplcChaChahhL(i3,i2,gt3)
coup3R = cplcChaChahhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, Chi, Chi}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvcSvL(i2,i1,gt1)
coup1R = cplChiFvcSvR(i2,i1,gt1)
coup2L = cplcFvChiSvL(i1,i3,gt2)
coup2R = cplcFvChiSvR(i1,i3,gt2)
coup3L = cplChiChihhL(i3,i2,gt3)
coup3R = cplChiChihhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, conj[Sv], conj[Sv]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplhhSvcSv(i1,i2,gt1)
coup2 = cplhhSvcSv(i1,gt2,i3)
coup3 = cplhhSvcSv(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Se, Hpm, Hpm}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplSecHpmcSv(i1,i2,gt1)
coup2 = cplHpmSvcSe(i3,gt2,i1)
coup3 = cplhhHpmcHpm(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Se, VWm, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSecSvcVWm(i1,gt1)
coup2 = cplHpmSvcSe(i3,gt2,i1)
coup3 = cplhhcHpmVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Se, Hpm, VWm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplSecHpmcSv(i1,i2,gt1)
coup2 = -cplSvcSeVWm(gt2,i1)
coup3 = cplhhHpmcVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Se, VWm, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSecSvcVWm(i1,gt1)
coup2 = -cplSvcSeVWm(gt2,i1)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Sv, Ah, Ah}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhSvcSv(i2,i1,gt1)
coup2 = cplAhSvcSv(i3,gt2,i1)
coup3 = cplAhAhhh(i3,i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sv, hh, Ah}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvcSv(i2,i1,gt1)
coup2 = cplAhSvcSv(i3,gt2,i1)
coup3 = cplAhhhhh(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sv, VZ, Ah}
Do i1=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1 = cplSvcSvVZ(i1,gt1)
coup2 = cplAhSvcSv(i3,gt2,i1)
coup3 = -cplAhhhVZ(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sv, VZp, Ah}
Do i1=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MVZp 
ML3 = MAh(i3) 
coup1 = cplSvcSvVZp(i1,gt1)
coup2 = cplAhSvcSv(i3,gt2,i1)
coup3 = -cplAhhhVZp(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sv, Ah, hh}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSvcSv(i2,i1,gt1)
coup2 = cplhhSvcSv(i3,gt2,i1)
coup3 = cplAhhhhh(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sv, hh, hh}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSvcSv(i2,i1,gt1)
coup2 = cplhhSvcSv(i3,gt2,i1)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sv, Ah, VZ}
Do i1=1,6
  Do i2=1,6
ML1 = MSv(i1) 
ML2 = MAh(i2) 
ML3 = MVZ 
coup1 = cplAhSvcSv(i2,i1,gt1)
coup2 = -cplSvcSvVZ(gt2,i1)
coup3 = -cplAhhhVZ(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sv, VZ, VZ}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplSvcSvVZ(i1,gt1)
coup2 = -cplSvcSvVZ(gt2,i1)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Sv, VZp, VZ}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVZp 
ML3 = MVZ 
coup1 = cplSvcSvVZp(i1,gt1)
coup2 = -cplSvcSvVZ(gt2,i1)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Sv, Ah, VZp}
Do i1=1,6
  Do i2=1,6
ML1 = MSv(i1) 
ML2 = MAh(i2) 
ML3 = MVZp 
coup1 = cplAhSvcSv(i2,i1,gt1)
coup2 = -cplSvcSvVZp(gt2,i1)
coup3 = -cplAhhhVZp(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sv, VZ, VZp}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVZ 
ML3 = MVZp 
coup1 = cplSvcSvVZ(i1,gt1)
coup2 = -cplSvcSvVZp(gt2,i1)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Sv, VZp, VZp}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVZp 
ML3 = MVZp 
coup1 = cplSvcSvVZp(i1,gt1)
coup2 = -cplSvcSvVZp(gt2,i1)
coup3 = cplhhVZpVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VZ, conj[Sv], conj[Sv]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplSvcSvVZ(i2,gt1)
coup2 = -cplSvcSvVZ(gt2,i3)
coup3 = cplhhSvcSv(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Sv], conj[Sv]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplSvcSvVZp(i2,gt1)
coup2 = -cplSvcSvVZp(gt2,i3)
coup3 = cplhhSvcSv(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFecSvL(i1,i2,gt1)
coup1R = cplcChaFecSvR(i1,i2,gt1)
coup2L = cplcFeChaSvL(i3,i1,gt2)
coup2R = cplcFeChaSvR(i3,i1,gt2)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Hpm], conj[Se], conj[Se]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecHpmcSv(i2,i1,gt1)
coup2 = cplHpmSvcSe(i1,gt2,i3)
coup3 = cplhhSecSe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[VWm], conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSvcVWm(i2,gt1)
coup2 = -cplSvcSeVWm(gt2,i3)
coup3 = cplhhSecSe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, conj[Sv]}
Do i1=1,6
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSv(i2) 
coup1 = cplAhSvcSv(i1,i2,gt1)
coup2 = cplAhhhSvcSv1(i1,gt3,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, conj[Sv]}
Do i1=1,6
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSv(i2) 
coup1 = cplhhSvcSv(i1,i2,gt1)
coup2 = cplhhhhSvcSv1(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Se, Hpm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
coup1 = cplSecHpmcSv(i1,i2,gt1)
coup2 = cplhhHpmSvcSe1(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, conj[Sv]}
Do i1=1,6
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSv(i2) 
coup1 = cplAhhhSvcSv1(i1,gt3,i2,gt1)
coup2 = cplAhSvcSv(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {hh, conj[Sv]}
Do i1=1,6
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSv(i2) 
coup1 = cplhhhhSvcSv1(gt3,i1,i2,gt1)
coup2 = cplhhSvcSv(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Se, Hpm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhSecHpmcSv1(gt3,i1,i2,gt1)
coup2 = cplHpmSvcSe(i2,gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Ah, Ah}
Do i1=1,6
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MAh(i2) 
coup1 = cplAhAhSvcSv1(i1,i2,gt2,gt1)
coup2 = cplAhAhhh(i1,i2,gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Ah, hh}
Do i1=1,6
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhSvcSv1(i1,i2,gt2,gt1)
coup2 = cplAhhhhh(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {hh, hh}
Do i1=1,6
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhSvcSv1(i1,i2,gt2,gt1)
coup2 = cplhhhhhh(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hpm, Hpm}
Do i1=1,2
  Do i2=1,2
ML1 = MHpm(i1) 
ML2 = MHpm(i2) 
coup1 = cplHpmSvcHpmcSv1(i1,gt2,i2,gt1)
coup2 = cplhhHpmcHpm(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Sd, Sd}
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSd(i2) 
coup1 = cplSdSvcSdcSvaa(i1,gt2,i2,gt1)
coup2 = cplhhSdcSd(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do


! {Se, Se}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSe(i2) 
coup1 = cplSeSvcSecSv1(i1,gt2,i2,gt1)
coup2 = cplhhSecSe(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Su, Su}
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSu(i2) 
coup1 = cplSuSvcSucSvaa(i1,gt2,i2,gt1)
coup2 = cplhhSucSu(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do


! {Sv, Sv}
Do i1=1,6
  Do i2=1,6
ML1 = MSv(i1) 
ML2 = MSv(i2) 
coup1 = cplSvSvcSvcSv1(gt2,i1,gt1,i2)
coup2 = cplhhSvcSv(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {VWm, VWm}
ML1 = MVWm 
ML2 = MVWm 
coup1 = cplSvcSvcVWmVWm1(gt2,gt1)
coup2 = cplhhcVWmVWm(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VZ, VZ}
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplSvcSvVZVZ1(gt2,gt1)
coup2 = cplhhVZVZ(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 



! {VZ, VZp}
ML1 = MVZ 
ML2 = MVZp 
coup1 = cplSvcSvVZVZp1(gt2,gt1)
coup2 = cplhhVZVZp(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VZp, VZp}
ML1 = MVZp 
ML2 = MVZp 
coup1 = cplSvcSvVZpVZp1(gt2,gt1)
coup2 = cplhhVZpVZp(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_sec_UMSSM_SvToSvhh


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SvToSvhh(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSd2,MSe2,MSu2,MSv2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,         & 
& cplAhSvcSv,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,         & 
& cplChiChihhR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFehhL,          & 
& cplcFeFehhR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvhhL,cplcFvFvhhR,cplhhhhhh,             & 
& cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,    & 
& cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplSecHpmcSv,cplSecSvcVWm,   & 
& cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,cplAhAhSvcSv1,cplAhhhSvcSv1,cplhhhhSvcSv1,          & 
& cplhhHpmSvcSe1,cplhhSecHpmcSv1,cplHpmSvcHpmcSv1,cplSdSvcSdcSvaa,cplSeSvcSecSv1,        & 
& cplSuSvcSucSvaa,cplSvSvcSvcSv1,cplSvcSvcVWmVWm1,cplSvcSvVZVZ1,cplSvcSvVZVZp1,          & 
& cplSvcSvVZpVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSv(6),MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),       & 
& MSd2(6),MSe2(6),MSu2(6),MSv2(6),MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(6,6,6),cplAhhhhh(6,6,6),cplAhhhVZ(6,6),cplAhhhVZp(6,6),cplAhSvcSv(6,6,6),   & 
& cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),     & 
& cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),       & 
& cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),         & 
& cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),       & 
& cplhhhhhh(6,6,6),cplhhHpmcHpm(6,2,2),cplhhHpmcVWm(6,2),cplhhSdcSd(6,6,6),              & 
& cplhhSecSe(6,6,6),cplhhSucSu(6,6,6),cplhhSvcSv(6,6,6),cplhhcHpmVWm(6,2),               & 
& cplhhcVWmVWm(6),cplhhVZVZ(6),cplhhVZVZp(6),cplhhVZpVZp(6),cplHpmSvcSe(2,6,6),          & 
& cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),cplSvcSeVWm(6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),& 
& cplAhAhSvcSv1(6,6,6,6),cplAhhhSvcSv1(6,6,6,6),cplhhhhSvcSv1(6,6,6,6),cplhhHpmSvcSe1(6,2,6,6),& 
& cplhhSecHpmcSv1(6,6,2,6),cplHpmSvcHpmcSv1(2,6,2,6),cplSdSvcSdcSvaa(6,6,6,6),           & 
& cplSeSvcSecSv1(6,6,6,6),cplSuSvcSucSvaa(6,6,6,6),cplSvSvcSvcSv1(6,6,6,6),              & 
& cplSvcSvcVWmVWm1(6,6),cplSvcSvVZVZ1(6,6),cplSvcSvVZVZp1(6,6),cplSvcSvVZpVZp1(6,6)

Complex(dp), Intent(out) :: Amp(6,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,6
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSv(gt2) 
Mex3 = Mhh(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SvToSvhh


Subroutine Amplitude_Tree_sec_UMSSM_SvTocHpmSe(cplSecHpmcSv,MHpm,MSe,MSv,             & 
& MHpm2,MSe2,MSv2,Amp)

Implicit None

Real(dp), Intent(in) :: MHpm(2),MSe(6),MSv(6),MHpm2(2),MSe2(6),MSv2(6)

Complex(dp), Intent(in) :: cplSecHpmcSv(6,2,6)

Complex(dp) :: Amp(6,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,6
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MSe(gt3) 
! Tree-Level Vertex 
coupT1 = cplSecHpmcSv(gt3,gt2,gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_SvTocHpmSe


Subroutine Gamma_Real_sec_UMSSM_SvTocHpmSe(MLambda,em,gs,cplSecHpmcSv,MHpm,           & 
& MSe,MSv,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplSecHpmcSv(6,2,6)

Real(dp), Intent(in) :: MHpm(2),MSe(6),MSv(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,2,6), GammarealGluon(6,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=2,2
    Do i3=1,6
Coup = cplSecHpmcSv(i3,i2,i1)
Mex1 = MSv(i1)
Mex2 = MHpm(i2)
Mex3 = MSe(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,Coup,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_SvTocHpmSe


Subroutine Amplitude_WAVE_sec_UMSSM_SvTocHpmSe(cplSecHpmcSv,ctcplSecHpmcSv,           & 
& MHpm,MHpm2,MSe,MSe2,MSv,MSv2,ZfHpm,ZfSe,ZfSv,Amp)

Implicit None

Real(dp), Intent(in) :: MHpm(2),MHpm2(2),MSe(6),MSe2(6),MSv(6),MSv2(6)

Complex(dp), Intent(in) :: cplSecHpmcSv(6,2,6)

Complex(dp), Intent(in) :: ctcplSecHpmcSv(6,2,6)

Complex(dp), Intent(in) :: ZfHpm(2,2),ZfSe(6,6),ZfSv(6,6)

Complex(dp), Intent(out) :: Amp(6,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,6
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MSe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplSecHpmcSv(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSv(i1,gt1))*cplSecHpmcSv(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfHpm(i1,gt2))*cplSecHpmcSv(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSe(i1,gt3)*cplSecHpmcSv(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_SvTocHpmSe


Subroutine Amplitude_VERTEX_sec_UMSSM_SvTocHpmSe(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,            & 
& MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcHpm,cplAhSecSe,               & 
& cplAhSvcSv,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiFvcSvL,cplChiFvcSvR,       & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,     & 
& cplhhHpmcHpm,cplhhSecSe,cplhhSvcSv,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,             & 
& cplHpmcHpmVZp,cplSdcHpmcSu,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,            & 
& cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVPVWm,           & 
& cplcHpmVWmVZ,cplcHpmVWmVZp,cplAhSecHpmcSv1,cplhhSecHpmcSv1,cplHpmSecHpmcSe1,           & 
& cplHpmSvcHpmcSv1,cplSeSucSdcSvaa,cplSeSvcSecSv1,cplSecSvcVWmVP1,cplSecSvcVWmVZ1,       & 
& cplSecSvcVWmVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),            & 
& MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhHpmcHpm(6,2,2),cplAhSecSe(6,6,6),cplAhSvcSv(6,6,6),cplAhcHpmVWm(6,2),            & 
& cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),   & 
& cplcFeChiSeL(3,9,6),cplcFeChiSeR(3,9,6),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),     & 
& cplcFvFecHpmL(3,3,2),cplcFvFecHpmR(3,3,2),cplhhHpmcHpm(6,2,2),cplhhSecSe(6,6,6),       & 
& cplhhSvcSv(6,6,6),cplhhcHpmVWm(6,2),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),               & 
& cplHpmcHpmVZp(2,2),cplSdcHpmcSu(6,2,6),cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),& 
& cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),       & 
& cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcHpmVWmVZp(2),     & 
& cplAhSecHpmcSv1(6,6,2,6),cplhhSecHpmcSv1(6,6,2,6),cplHpmSecHpmcSe1(2,6,2,6),           & 
& cplHpmSvcHpmcSv1(2,6,2,6),cplSeSucSdcSvaa(6,6,6,6),cplSeSvcSecSv1(6,6,6,6),            & 
& cplSecSvcVWmVP1(6,6),cplSecSvcVWmVZ1(6,6),cplSecSvcVWmVZp1(6,6)

Complex(dp), Intent(out) :: Amp(6,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,6
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MSe(gt3) 


! {Ah, conj[Sv], Hpm}
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MSv(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhSvcSv(i1,i2,gt1)
coup2 = cplAhHpmcHpm(i1,i3,gt2)
coup3 = cplSecHpmcSv(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Ah, conj[Sv], VWm}
Do i1=1,6
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSv(i2) 
ML3 = MVWm 
coup1 = cplAhSvcSv(i1,i2,gt1)
coup2 = cplAhcHpmVWm(i1,gt2)
coup3 = cplSecSvcVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, bar[Fv], Cha}
Do i1=1,9
  Do i2=1,3
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MFv(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFvcSvL(i1,i2,gt1)
coup1R = cplChiFvcSvR(i1,i2,gt1)
coup2L = cplChiChacHpmL(i1,i3,gt2)
coup2R = cplChiChacHpmR(i1,i3,gt2)
coup3L = cplcChacFvSeL(i3,i2,gt3)
coup3R = cplcChacFvSeR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, Chi, Fe}
Do i1=1,3
  Do i2=1,9
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFvcSvL(i2,i1,gt1)
coup1R = cplChiFvcSvR(i2,i1,gt1)
coup2L = cplcFvFecHpmL(i1,i3,gt2)
coup2R = cplcFvFecHpmR(i1,i3,gt2)
coup3L = cplcFeChiSeL(i3,i2,gt3)
coup3R = cplcFeChiSeR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, conj[Sv], Hpm}
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MSv(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSvcSv(i1,i2,gt1)
coup2 = cplhhHpmcHpm(i1,i3,gt2)
coup3 = cplSecHpmcSv(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, conj[Sv], VWm}
Do i1=1,6
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSv(i2) 
ML3 = MVWm 
coup1 = cplhhSvcSv(i1,i2,gt1)
coup2 = cplhhcHpmVWm(i1,gt2)
coup3 = cplSecSvcVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sv, Ah, Se}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MAh(i2) 
ML3 = MSe(i3) 
coup1 = cplAhSvcSv(i2,i1,gt1)
coup2 = cplSecHpmcSv(i3,gt2,i1)
coup3 = cplAhSecSe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sv, hh, Se}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = Mhh(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSvcSv(i2,i1,gt1)
coup2 = cplSecHpmcSv(i3,gt2,i1)
coup3 = cplhhSecSe(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sv, VZ, Se}
Do i1=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MVZ 
ML3 = MSe(i3) 
coup1 = cplSvcSvVZ(i1,gt1)
coup2 = cplSecHpmcSv(i3,gt2,i1)
coup3 = cplSecSeVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sv, VZp, Se}
Do i1=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MVZp 
ML3 = MSe(i3) 
coup1 = cplSvcSvVZp(i1,gt1)
coup2 = cplSecHpmcSv(i3,gt2,i1)
coup3 = cplSecSeVZp(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VZ, conj[Sv], Hpm}
  Do i2=1,6
    Do i3=1,2
ML1 = MVZ 
ML2 = MSv(i2) 
ML3 = MHpm(i3) 
coup1 = cplSvcSvVZ(i2,gt1)
coup2 = cplHpmcHpmVZ(i3,gt2)
coup3 = cplSecHpmcSv(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, conj[Sv], VWm}
  Do i2=1,6
ML1 = MVZ 
ML2 = MSv(i2) 
ML3 = MVWm 
coup1 = cplSvcSvVZ(i2,gt1)
coup2 = cplcHpmVWmVZ(gt2)
coup3 = cplSecSvcVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {VZp, conj[Sv], Hpm}
  Do i2=1,6
    Do i3=1,2
ML1 = MVZp 
ML2 = MSv(i2) 
ML3 = MHpm(i3) 
coup1 = cplSvcSvVZp(i2,gt1)
coup2 = cplHpmcHpmVZp(i3,gt2)
coup3 = cplSecHpmcSv(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Sv], VWm}
  Do i2=1,6
ML1 = MVZp 
ML2 = MSv(i2) 
ML3 = MVWm 
coup1 = cplSvcSvVZp(i2,gt1)
coup2 = cplcHpmVWmVZp(gt2)
coup3 = cplSecSvcVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {bar[Cha], bar[Fe], Chi}
Do i1=1,2
  Do i2=1,3
    Do i3=1,9
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaFecSvL(i1,i2,gt1)
coup1R = cplcChaFecSvR(i1,i2,gt1)
coup2L = cplChiChacHpmL(i3,i1,gt2)
coup2R = cplChiChacHpmR(i3,i1,gt2)
coup3L = cplcFeChiSeL(i2,i3,gt3)
coup3R = cplcFeChiSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Hpm], conj[Se], Ah}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MAh(i3) 
coup1 = cplSecHpmcSv(i2,i1,gt1)
coup2 = cplAhHpmcHpm(i3,i1,gt2)
coup3 = cplAhSecSe(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Hpm], conj[Se], hh}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = Mhh(i3) 
coup1 = cplSecHpmcSv(i2,i1,gt1)
coup2 = cplhhHpmcHpm(i3,i1,gt2)
coup3 = cplhhSecSe(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Hpm], conj[Se], VP}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MVP 
coup1 = cplSecHpmcSv(i2,i1,gt1)
coup2 = cplHpmcHpmVP(i1,gt2)
coup3 = cplSecSeVP(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hpm], conj[Se], VZ}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MVZ 
coup1 = cplSecHpmcSv(i2,i1,gt1)
coup2 = cplHpmcHpmVZ(i1,gt2)
coup3 = cplSecSeVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hpm], conj[Se], VZp}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MVZp 
coup1 = cplSecHpmcSv(i2,i1,gt1)
coup2 = cplHpmcHpmVZp(i1,gt2)
coup3 = cplSecSeVZp(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[VWm], conj[Se], Ah}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MAh(i3) 
coup1 = cplSecSvcVWm(i2,gt1)
coup2 = cplAhcHpmVWm(i3,gt2)
coup3 = cplAhSecSe(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[Se], hh}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = Mhh(i3) 
coup1 = cplSecSvcVWm(i2,gt1)
coup2 = cplhhcHpmVWm(i3,gt2)
coup3 = cplhhSecSe(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWm], conj[Se], VP}
  Do i2=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MVP 
coup1 = cplSecSvcVWm(i2,gt1)
coup2 = cplcHpmVPVWm(gt2)
coup3 = cplSecSeVP(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWm], conj[Se], VZ}
  Do i2=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MVZ 
coup1 = cplSecSvcVWm(i2,gt1)
coup2 = cplcHpmVWmVZ(gt2)
coup3 = cplSecSeVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWm], conj[Se], VZp}
  Do i2=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MVZp 
coup1 = cplSecSvcVWm(i2,gt1)
coup2 = cplcHpmVWmVZp(gt2)
coup3 = cplSecSeVZp(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, conj[Sv]}
Do i1=1,6
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSv(i2) 
coup1 = cplAhSvcSv(i1,i2,gt1)
coup2 = cplAhSecHpmcSv1(i1,gt3,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, conj[Sv]}
Do i1=1,6
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSv(i2) 
coup1 = cplhhSvcSv(i1,i2,gt1)
coup2 = cplhhSecHpmcSv1(i1,gt3,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Se, Hpm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
coup1 = cplSecHpmcSv(i1,i2,gt1)
coup2 = cplHpmSecHpmcSe1(i2,gt3,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, Hpm}
Do i1=1,6
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MHpm(i2) 
coup1 = cplAhSecHpmcSv1(i1,gt3,i2,gt1)
coup2 = cplAhHpmcHpm(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {hh, Hpm}
Do i1=1,6
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhSecHpmcSv1(i1,gt3,i2,gt1)
coup2 = cplhhHpmcHpm(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Su, Sd}
Do i1=1,6
  Do i2=1,6
ML1 = MSu(i1) 
ML2 = MSd(i2) 
coup1 = cplSeSucSdcSvaa(gt3,i1,i2,gt1)
coup2 = cplSdcHpmcSu(i2,gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do


! {Sv, Se}
Do i1=1,6
  Do i2=1,6
ML1 = MSv(i1) 
ML2 = MSe(i2) 
coup1 = cplSeSvcSecSv1(gt3,i1,i2,gt1)
coup2 = cplSecHpmcSv(i2,gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {VP, VWm}
ML1 = MVP 
ML2 = MVWm 
coup1 = cplSecSvcVWmVP1(gt3,gt1)
coup2 = cplcHpmVPVWm(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VZ, VWm}
ML1 = MVZ 
ML2 = MVWm 
coup1 = cplSecSvcVWmVZ1(gt3,gt1)
coup2 = cplcHpmVWmVZ(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VZp, VWm}
ML1 = MVZp 
ML2 = MVWm 
coup1 = cplSecSvcVWmVZp1(gt3,gt1)
coup2 = cplcHpmVWmVZp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {Ah, conj[Se]}
Do i1=1,6
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
coup1 = cplAhSecHpmcSv1(i1,i2,gt2,gt1)
coup2 = cplAhSecSe(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {hh, conj[Se]}
Do i1=1,6
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
coup1 = cplhhSecHpmcSv1(i1,i2,gt2,gt1)
coup2 = cplhhSecSe(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Hpm, conj[Sv]}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSv(i2) 
coup1 = cplHpmSvcHpmcSv1(i1,i2,gt2,gt1)
coup2 = cplSecHpmcSv(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_sec_UMSSM_SvTocHpmSe


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SvTocHpmSe(MAh,MCha,MChi,MFe,MFv,            & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,            & 
& MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcHpm,cplAhSecSe,               & 
& cplAhSvcSv,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,cplChiFvcSvL,cplChiFvcSvR,       & 
& cplcFeChiSeL,cplcFeChiSeR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,     & 
& cplhhHpmcHpm,cplhhSecSe,cplhhSvcSv,cplhhcHpmVWm,cplHpmcHpmVP,cplHpmcHpmVZ,             & 
& cplHpmcHpmVZp,cplSdcHpmcSu,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,            & 
& cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVPVWm,           & 
& cplcHpmVWmVZ,cplcHpmVWmVZp,cplAhSecHpmcSv1,cplhhSecHpmcSv1,cplHpmSecHpmcSe1,           & 
& cplHpmSvcHpmcSv1,cplSeSucSdcSvaa,cplSeSvcSecSv1,cplSecSvcVWmVP1,cplSecSvcVWmVZ1,       & 
& cplSecSvcVWmVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),            & 
& MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhHpmcHpm(6,2,2),cplAhSecSe(6,6,6),cplAhSvcSv(6,6,6),cplAhcHpmVWm(6,2),            & 
& cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),   & 
& cplcFeChiSeL(3,9,6),cplcFeChiSeR(3,9,6),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),     & 
& cplcFvFecHpmL(3,3,2),cplcFvFecHpmR(3,3,2),cplhhHpmcHpm(6,2,2),cplhhSecSe(6,6,6),       & 
& cplhhSvcSv(6,6,6),cplhhcHpmVWm(6,2),cplHpmcHpmVP(2,2),cplHpmcHpmVZ(2,2),               & 
& cplHpmcHpmVZp(2,2),cplSdcHpmcSu(6,2,6),cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),& 
& cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),       & 
& cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),cplcHpmVPVWm(2),cplcHpmVWmVZ(2),cplcHpmVWmVZp(2),     & 
& cplAhSecHpmcSv1(6,6,2,6),cplhhSecHpmcSv1(6,6,2,6),cplHpmSecHpmcSe1(2,6,2,6),           & 
& cplHpmSvcHpmcSv1(2,6,2,6),cplSeSucSdcSvaa(6,6,6,6),cplSeSvcSecSv1(6,6,6,6),            & 
& cplSecSvcVWmVP1(6,6),cplSecSvcVWmVZ1(6,6),cplSecSvcVWmVZp1(6,6)

Complex(dp), Intent(out) :: Amp(6,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,2
    Do gt3=1,6
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MHpm(gt2) 
Mex3 = MSe(gt3) 


! {conj[Hpm], conj[Se], VP}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MVP 
coup1 = cplSecHpmcSv(i2,i1,gt1)
coup2 = cplHpmcHpmVP(i1,gt2)
coup3 = cplSecSeVP(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[VWm], conj[Se], VP}
  Do i2=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MVP 
coup1 = cplSecSvcVWm(i2,gt1)
coup2 = cplcHpmVPVWm(gt2)
coup3 = cplSecSeVP(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {VP, VWm}
ML1 = MVP 
ML2 = MVWm 
coup1 = cplSecSvcVWmVP1(gt3,gt1)
coup2 = cplcHpmVPVWm(gt2)
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SvTocHpmSe


Subroutine Amplitude_Tree_sec_UMSSM_SvToSecVWm(cplSecSvcVWm,MSe,MSv,MVWm,             & 
& MSe2,MSv2,MVWm2,Amp)

Implicit None

Real(dp), Intent(in) :: MSe(6),MSv(6),MVWm,MSe2(6),MSv2(6),MVWm2

Complex(dp), Intent(in) :: cplSecSvcVWm(6,6)

Complex(dp) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVWm 
! Tree-Level Vertex 
coupT1 = -cplSecSvcVWm(gt2,gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_SvToSecVWm


Subroutine Gamma_Real_sec_UMSSM_SvToSecVWm(MLambda,em,gs,cplSecSvcVWm,MSe,            & 
& MSv,MVWm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplSecSvcVWm(6,6)

Real(dp), Intent(in) :: MSe(6),MSv(6),MVWm

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
Coup = cplSecSvcVWm(i2,i1)
Mex1 = MSv(i1)
Mex2 = MSe(i2)
Mex3 = MVWm
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,0._dp,-1._dp,1._dp,Coup,Gammarealphoton(i1,i2),kont)
 GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_SvToSecVWm


Subroutine Amplitude_WAVE_sec_UMSSM_SvToSecVWm(cplSecSvcVWm,ctcplSecSvcVWm,           & 
& MSe,MSe2,MSv,MSv2,MVWm,MVWm2,ZfSe,ZfSv,ZfVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MSe(6),MSe2(6),MSv(6),MSv2(6),MVWm,MVWm2

Complex(dp), Intent(in) :: cplSecSvcVWm(6,6)

Complex(dp), Intent(in) :: ctcplSecSvcVWm(6,6)

Complex(dp), Intent(in) :: ZfSe(6,6),ZfSv(6,6),ZfVWm

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVWm 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplSecSvcVWm(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSv(i1,gt1))*cplSecSvcVWm(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSe(i1,gt2)*cplSecSvcVWm(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWm*cplSecSvcVWm(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_SvToSecVWm


Subroutine Amplitude_VERTEX_sec_UMSSM_SvToSecVWm(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,              & 
& MSe2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcVWm,cplAhSecSe,cplAhSvcSv,cplChiChacVWmL,     & 
& cplChiChacVWmR,cplChiFvcSvL,cplChiFvcSvR,cplcFeChiSeL,cplcFeChiSeR,cplcChaFecSvL,      & 
& cplcChaFecSvR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,          & 
& cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSecSeVP,cplSecSeVZ,            & 
& cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,          & 
& cplSvcSvVZp,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplSecSvcVWmVP1,cplSecSecVWmVWm1,  & 
& cplSecSvcVWmVZ1,cplSecSvcVWmVZp1,cplSvcSvcVWmVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVP,MVWm,           & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhHpmcVWm(6,2),cplAhSecSe(6,6,6),cplAhSvcSv(6,6,6),cplChiChacVWmL(9,2),            & 
& cplChiChacVWmR(9,2),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),cplcFeChiSeL(3,9,6),       & 
& cplcFeChiSeR(3,9,6),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFvFecVWmL(3,3),      & 
& cplcFvFecVWmR(3,3),cplhhHpmcVWm(6,2),cplhhSecSe(6,6,6),cplhhSvcSv(6,6,6),              & 
& cplhhcVWmVWm(6),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),cplSecSeVP(6,6),      & 
& cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),            & 
& cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),cplcVWmVPVWm,   & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplSecSvcVWmVP1(6,6),cplSecSecVWmVWm1(6,6),cplSecSvcVWmVZ1(6,6),& 
& cplSecSvcVWmVZp1(6,6),cplSvcSvcVWmVWm1(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVWm 


! {Ah, conj[Sv], conj[Se]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSv(i2) 
ML3 = MSe(i3) 
coup1 = cplAhSvcSv(i1,i2,gt1)
coup2 = cplAhSecSe(i1,gt2,i3)
coup3 = cplSecSvcVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, bar[Fv], bar[Fe]}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFvcSvL(i1,i2,gt1)
coup1R = cplChiFvcSvR(i1,i2,gt1)
coup2L = cplcFeChiSeL(i3,i1,gt2)
coup2R = cplcFeChiSeR(i3,i1,gt2)
coup3L = cplcFvFecVWmL(i2,i3)
coup3R = cplcFvFecVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, Cha, Chi}
Do i1=1,3
  Do i2=1,2
    Do i3=1,9
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaFecSvL(i2,i1,gt1)
coup1R = cplcChaFecSvR(i2,i1,gt1)
coup2L = cplcFeChiSeL(i1,i3,gt2)
coup2R = cplcFeChiSeR(i1,i3,gt2)
coup3L = -cplChiChacVWmR(i3,i2)
coup3R = -cplChiChacVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, Chi, bar[Cha]}
Do i1=1,3
  Do i2=1,9
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFvcSvL(i2,i1,gt1)
coup1R = cplChiFvcSvR(i2,i1,gt1)
coup2L = cplcChacFvSeL(i3,i1,gt2)
coup2R = cplcChacFvSeR(i3,i1,gt2)
coup3L = cplChiChacVWmL(i2,i3)
coup3R = cplChiChacVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, conj[Sv], conj[Se]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSv(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSvcSv(i1,i2,gt1)
coup2 = cplhhSecSe(i1,gt2,i3)
coup3 = cplSecSvcVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Se, Hpm, Ah}
Do i1=1,6
  Do i2=1,2
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplSecHpmcSv(i1,i2,gt1)
coup2 = cplAhSecSe(i3,gt2,i1)
coup3 = cplAhHpmcVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Se, Hpm, hh}
Do i1=1,6
  Do i2=1,2
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplSecHpmcSv(i1,i2,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
coup3 = cplhhHpmcVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Se, VWm, hh}
Do i1=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplSecSvcVWm(i1,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
coup3 = cplhhcVWmVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Se, Hpm, VP}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplSecHpmcSv(i1,i2,gt1)
coup2 = cplSecSeVP(gt2,i1)
coup3 = cplHpmcVWmVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Se, VWm, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplSecSvcVWm(i1,gt1)
coup2 = cplSecSeVP(gt2,i1)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, Hpm, VZ}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = cplSecHpmcSv(i1,i2,gt1)
coup2 = cplSecSeVZ(gt2,i1)
coup3 = cplHpmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Se, VWm, VZ}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplSecSvcVWm(i1,gt1)
coup2 = cplSecSeVZ(gt2,i1)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, Hpm, VZp}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVZp 
coup1 = cplSecHpmcSv(i1,i2,gt1)
coup2 = cplSecSeVZp(gt2,i1)
coup3 = cplHpmcVWmVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Se, VWm, VZp}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVZp 
coup1 = cplSecSvcVWm(i1,gt1)
coup2 = cplSecSeVZp(gt2,i1)
coup3 = cplcVWmVWmVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sv, Ah, conj[Hpm]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSv(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhSvcSv(i2,i1,gt1)
coup2 = cplSecHpmcSv(gt2,i3,i1)
coup3 = -cplAhHpmcVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sv, hh, conj[Hpm]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSv(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSvcSv(i2,i1,gt1)
coup2 = cplSecHpmcSv(gt2,i3,i1)
coup3 = -cplhhHpmcVWm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sv, VZ, conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSv(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1 = cplSvcSvVZ(i1,gt1)
coup2 = cplSecHpmcSv(gt2,i3,i1)
coup3 = cplHpmcVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sv, VZp, conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSv(i1) 
ML2 = MVZp 
ML3 = MHpm(i3) 
coup1 = cplSvcSvVZp(i1,gt1)
coup2 = cplSecHpmcSv(gt2,i3,i1)
coup3 = cplHpmcVWmVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sv, hh, conj[VWm]}
Do i1=1,6
  Do i2=1,6
ML1 = MSv(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhSvcSv(i2,i1,gt1)
coup2 = cplSecSvcVWm(gt2,i1)
coup3 = cplhhcVWmVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sv, VZ, conj[VWm]}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplSvcSvVZ(i1,gt1)
coup2 = cplSecSvcVWm(gt2,i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sv, VZp, conj[VWm]}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVZp 
ML3 = MVWm 
coup1 = cplSvcSvVZp(i1,gt1)
coup2 = cplSecSvcVWm(gt2,i1)
coup3 = -cplcVWmVWmVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VZ, conj[Sv], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSv(i2) 
ML3 = MSe(i3) 
coup1 = cplSvcSvVZ(i2,gt1)
coup2 = cplSecSeVZ(gt2,i3)
coup3 = cplSecSvcVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Sv], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSv(i2) 
ML3 = MSe(i3) 
coup1 = cplSvcSvVZp(i2,gt1)
coup2 = cplSecSeVZp(gt2,i3)
coup3 = cplSecSvcVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Se, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
coup1 = -cplSecSvcVWm(i1,gt1)
coup2 = cplSecSecVWmVWm1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sv, VZ}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVZ 
coup1 = -cplSvcSvVZ(i1,gt1)
coup2 = cplSecSvcVWmVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sv, VZp}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVZp 
coup1 = -cplSvcSvVZp(i1,gt1)
coup2 = cplSecSvcVWmVZp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = cplSecSvcVWmVP1(i1,gt1)
coup2 = cplSecSeVP(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Se, VZ}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
coup1 = cplSecSvcVWmVZ1(i1,gt1)
coup2 = cplSecSeVZ(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Se, VZp}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZp 
coup1 = cplSecSvcVWmVZp1(i1,gt1)
coup2 = cplSecSeVZp(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Sv, conj[VWm]}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVWm 
coup1 = cplSvcSvcVWmVWm1(i1,gt1)
coup2 = cplSecSvcVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_sec_UMSSM_SvToSecVWm


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SvToSecVWm(MAh,MCha,MChi,MFe,MFv,            & 
& Mhh,MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,              & 
& MSe2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcVWm,cplAhSecSe,cplAhSvcSv,cplChiChacVWmL,     & 
& cplChiChacVWmR,cplChiFvcSvL,cplChiFvcSvR,cplcFeChiSeL,cplcFeChiSeR,cplcChaFecSvL,      & 
& cplcChaFecSvR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,          & 
& cplhhcVWmVWm,cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSecSeVP,cplSecSeVZ,            & 
& cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSvVZ,          & 
& cplSvcSvVZp,cplcVWmVPVWm,cplcVWmVWmVZ,cplcVWmVWmVZp,cplSecSvcVWmVP1,cplSecSecVWmVWm1,  & 
& cplSecSvcVWmVZ1,cplSecSvcVWmVZp1,cplSvcSvcVWmVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVP,MVWm,           & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhHpmcVWm(6,2),cplAhSecSe(6,6,6),cplAhSvcSv(6,6,6),cplChiChacVWmL(9,2),            & 
& cplChiChacVWmR(9,2),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),cplcFeChiSeL(3,9,6),       & 
& cplcFeChiSeR(3,9,6),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFvFecVWmL(3,3),      & 
& cplcFvFecVWmR(3,3),cplhhHpmcVWm(6,2),cplhhSecSe(6,6,6),cplhhSvcSv(6,6,6),              & 
& cplhhcVWmVWm(6),cplHpmcVWmVP(2),cplHpmcVWmVZ(2),cplHpmcVWmVZp(2),cplSecSeVP(6,6),      & 
& cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),            & 
& cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),cplcVWmVPVWm,   & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplSecSvcVWmVP1(6,6),cplSecSecVWmVWm1(6,6),cplSecSvcVWmVZ1(6,6),& 
& cplSecSvcVWmVZp1(6,6),cplSvcSvcVWmVWm1(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVWm 


! {Se, Hpm, VP}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVP 
coup1 = cplSecHpmcSv(i1,i2,gt1)
coup2 = cplSecSeVP(gt2,i1)
coup3 = cplHpmcVWmVP(i2)
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Se, VWm, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVP 
coup1 = cplSecSvcVWm(i1,gt1)
coup2 = cplSecSeVP(gt2,i1)
coup3 = -cplcVWmVPVWm
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = cplSecSvcVWmVP1(i1,gt1)
coup2 = cplSecSeVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SvToSecVWm


Subroutine Amplitude_Tree_sec_UMSSM_SvToSvVZ(cplSvcSvVZ,MSv,MVZ,MSv2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MSv(6),MVZ,MSv2(6),MVZ2

Complex(dp), Intent(in) :: cplSvcSvVZ(6,6)

Complex(dp) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = -cplSvcSvVZ(gt2,gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_SvToSvVZ


Subroutine Gamma_Real_sec_UMSSM_SvToSvVZ(MLambda,em,gs,cplSvcSvVZ,MSv,MVZ,            & 
& GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplSvcSvVZ(6,6)

Real(dp), Intent(in) :: MSv(6),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
Coup = cplSvcSvVZ(i2,i1)
Mex1 = MSv(i1)
Mex2 = MSv(i2)
Mex3 = MVZ
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Gammarealphoton(i1,i2) = 0._dp 
 GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_SvToSvVZ


Subroutine Amplitude_WAVE_sec_UMSSM_SvToSvVZ(cplSvcSvVZ,cplSvcSvVZp,ctcplSvcSvVZ,     & 
& ctcplSvcSvVZp,MSv,MSv2,MVZ,MVZ2,ZfSv,ZfVZ,ZfVZpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MSv(6),MSv2(6),MVZ,MVZ2

Complex(dp), Intent(in) :: cplSvcSvVZ(6,6),cplSvcSvVZp(6,6)

Complex(dp), Intent(in) :: ctcplSvcSvVZ(6,6),ctcplSvcSvVZp(6,6)

Complex(dp), Intent(in) :: ZfSv(6,6),ZfVZ,ZfVZpVZ

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplSvcSvVZ(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSv(i1,gt1))*cplSvcSvVZ(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSv(i1,gt2)*cplSvcSvVZ(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplSvcSvVZ(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZpVZ*cplSvcSvVZp(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_SvToSvVZ


Subroutine Amplitude_VERTEX_sec_UMSSM_SvToSvVZ(MAh,MCha,MChi,MFe,MFv,Mhh,             & 
& MHpm,MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,            & 
& MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSvcSv,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVZL,         & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,        & 
& cplcFvChiSvR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvVZL,          & 
& cplcFvFvVZR,cplhhSvcSv,cplhhVZVZ,cplhhVZVZp,cplHpmSvcSe,cplHpmcHpmVZ,cplHpmcVWmVZ,     & 
& cplSecSeVZ,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,               & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSvcVWmVZ1,cplSvcSeVWmVZ1,cplSvcSvVZVZ1,cplSvcSvVZVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVWm,               & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVZ(6,6),cplAhSvcSv(6,6,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),             & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(9,9),cplChiChiVZR(9,9),             & 
& cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),       & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),           & 
& cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplhhSvcSv(6,6,6),cplhhVZVZ(6),cplhhVZVZp(6),        & 
& cplHpmSvcSe(2,6,6),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSecSeVZ(6,6),cplSecHpmcSv(6,2,6),& 
& cplSecSvcVWm(6,6),cplSvcSeVWm(6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),cplcHpmVWmVZ(2),   & 
& cplcVWmVWmVZ,cplSecSvcVWmVZ1(6,6),cplSvcSeVWmVZ1(6,6),cplSvcSvVZVZ1(6,6),              & 
& cplSvcSvVZVZp1(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MVZ 


! {Ah, conj[Sv], conj[Sv]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplAhSvcSv(i1,i2,gt1)
coup2 = cplAhSvcSv(i1,gt2,i3)
coup3 = cplSvcSvVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, bar[Fv], bar[Fv]}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvcSvL(i1,i2,gt1)
coup1R = cplChiFvcSvR(i1,i2,gt1)
coup2L = cplcFvChiSvL(i3,i1,gt2)
coup2R = cplcFvChiSvR(i3,i1,gt2)
coup3L = cplcFvFvVZL(i2,i3)
coup3R = cplcFvFvVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, Cha, Cha}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFecSvL(i2,i1,gt1)
coup1R = cplcChaFecSvR(i2,i1,gt1)
coup2L = cplcFeChaSvL(i1,i3,gt2)
coup2R = cplcFeChaSvR(i1,i3,gt2)
coup3L = -cplcChaChaVZR(i3,i2)
coup3R = -cplcChaChaVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, Chi, Chi}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvcSvL(i2,i1,gt1)
coup1R = cplChiFvcSvR(i2,i1,gt1)
coup2L = cplcFvChiSvL(i1,i3,gt2)
coup2R = cplcFvChiSvR(i1,i3,gt2)
coup3L = -cplChiChiVZR(i3,i2)
coup3R = -cplChiChiVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, conj[Sv], conj[Sv]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplhhSvcSv(i1,i2,gt1)
coup2 = cplhhSvcSv(i1,gt2,i3)
coup3 = cplSvcSvVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Se, Hpm, Hpm}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplSecHpmcSv(i1,i2,gt1)
coup2 = cplHpmSvcSe(i3,gt2,i1)
coup3 = -cplHpmcHpmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Se, VWm, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSecSvcVWm(i1,gt1)
coup2 = cplHpmSvcSe(i3,gt2,i1)
coup3 = cplcHpmVWmVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Se, Hpm, VWm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplSecHpmcSv(i1,i2,gt1)
coup2 = cplSvcSeVWm(gt2,i1)
coup3 = cplHpmcVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Se, VWm, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSecSvcVWm(i1,gt1)
coup2 = cplSvcSeVWm(gt2,i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sv, hh, Ah}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvcSv(i2,i1,gt1)
coup2 = cplAhSvcSv(i3,gt2,i1)
coup3 = cplAhhhVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sv, Ah, hh}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSvcSv(i2,i1,gt1)
coup2 = cplhhSvcSv(i3,gt2,i1)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sv, VZ, hh}
Do i1=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplSvcSvVZ(i1,gt1)
coup2 = cplhhSvcSv(i3,gt2,i1)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sv, VZp, hh}
Do i1=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplSvcSvVZp(i1,gt1)
coup2 = cplhhSvcSv(i3,gt2,i1)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sv, hh, VZ}
Do i1=1,6
  Do i2=1,6
ML1 = MSv(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhSvcSv(i2,i1,gt1)
coup2 = cplSvcSvVZ(gt2,i1)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sv, hh, VZp}
Do i1=1,6
  Do i2=1,6
ML1 = MSv(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhSvcSv(i2,i1,gt1)
coup2 = cplSvcSvVZp(gt2,i1)
coup3 = cplhhVZVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VZ, conj[Sv], conj[Sv]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplSvcSvVZ(i2,gt1)
coup2 = cplSvcSvVZ(gt2,i3)
coup3 = cplSvcSvVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Sv], conj[Sv]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplSvcSvVZp(i2,gt1)
coup2 = cplSvcSvVZp(gt2,i3)
coup3 = cplSvcSvVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFecSvL(i1,i2,gt1)
coup1R = cplcChaFecSvR(i1,i2,gt1)
coup2L = cplcFeChaSvL(i3,i1,gt2)
coup2R = cplcFeChaSvR(i3,i1,gt2)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Hpm], conj[Se], conj[Se]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecHpmcSv(i2,i1,gt1)
coup2 = cplHpmSvcSe(i1,gt2,i3)
coup3 = cplSecSeVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[VWm], conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSvcVWm(i2,gt1)
coup2 = cplSvcSeVWm(gt2,i3)
coup3 = cplSecSeVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Se, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
coup1 = -cplSecSvcVWm(i1,gt1)
coup2 = cplSvcSeVWmVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sv, VZ}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVZ 
coup1 = -cplSvcSvVZ(i1,gt1)
coup2 = cplSvcSvVZVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sv, VZp}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVZp 
coup1 = -cplSvcSvVZp(i1,gt1)
coup2 = cplSvcSvVZVZp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
coup1 = cplSecSvcVWmVZ1(i1,gt1)
coup2 = cplSvcSeVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Sv, VZ}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVZ 
coup1 = cplSvcSvVZVZ1(i1,gt1)
coup2 = cplSvcSvVZ(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Sv, VZp}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVZp 
coup1 = cplSvcSvVZVZp1(i1,gt1)
coup2 = cplSvcSvVZp(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_sec_UMSSM_SvToSvVZ


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SvToSvVZ(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSvcSv,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVZL,    & 
& cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,        & 
& cplcFvChiSvR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvVZL,          & 
& cplcFvFvVZR,cplhhSvcSv,cplhhVZVZ,cplhhVZVZp,cplHpmSvcSe,cplHpmcHpmVZ,cplHpmcVWmVZ,     & 
& cplSecSeVZ,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,               & 
& cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSvcVWmVZ1,cplSvcSeVWmVZ1,cplSvcSvVZVZ1,cplSvcSvVZVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVWm,               & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVZ(6,6),cplAhSvcSv(6,6,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),             & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(9,9),cplChiChiVZR(9,9),             & 
& cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),       & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),           & 
& cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplhhSvcSv(6,6,6),cplhhVZVZ(6),cplhhVZVZp(6),        & 
& cplHpmSvcSe(2,6,6),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSecSeVZ(6,6),cplSecHpmcSv(6,2,6),& 
& cplSecSvcVWm(6,6),cplSvcSeVWm(6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),cplcHpmVWmVZ(2),   & 
& cplcVWmVWmVZ,cplSecSvcVWmVZ1(6,6),cplSvcSeVWmVZ1(6,6),cplSvcSvVZVZ1(6,6),              & 
& cplSvcSvVZVZp1(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MVZ 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SvToSvVZ


Subroutine Amplitude_Tree_sec_UMSSM_SvToSvVZp(cplSvcSvVZp,MSv,MVZp,MSv2,              & 
& MVZp2,Amp)

Implicit None

Real(dp), Intent(in) :: MSv(6),MVZp,MSv2(6),MVZp2

Complex(dp), Intent(in) :: cplSvcSvVZp(6,6)

Complex(dp) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MVZp 
! Tree-Level Vertex 
coupT1 = -cplSvcSvVZp(gt2,gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_SvToSvVZp


Subroutine Gamma_Real_sec_UMSSM_SvToSvVZp(MLambda,em,gs,cplSvcSvVZp,MSv,              & 
& MVZp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplSvcSvVZp(6,6)

Real(dp), Intent(in) :: MSv(6),MVZp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
Coup = cplSvcSvVZp(i2,i1)
Mex1 = MSv(i1)
Mex2 = MSv(i2)
Mex3 = MVZp
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Gammarealphoton(i1,i2) = 0._dp 
 GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_SvToSvVZp


Subroutine Amplitude_WAVE_sec_UMSSM_SvToSvVZp(cplSvcSvVZ,cplSvcSvVZp,ctcplSvcSvVZ,    & 
& ctcplSvcSvVZp,MSv,MSv2,MVZ,MVZ2,MVZp,MVZp2,ZfSv,ZfVZp,ZfVZVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MSv(6),MSv2(6),MVZ,MVZ2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplSvcSvVZ(6,6),cplSvcSvVZp(6,6)

Complex(dp), Intent(in) :: ctcplSvcSvVZ(6,6),ctcplSvcSvVZp(6,6)

Complex(dp), Intent(in) :: ZfSv(6,6),ZfVZp,ZfVZVZp

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MVZp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplSvcSvVZp(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSv(i1,gt1))*cplSvcSvVZp(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSv(i1,gt2)*cplSvcSvVZp(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVZp*cplSvcSvVZ(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZp*cplSvcSvVZp(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_SvToSvVZp


Subroutine Amplitude_VERTEX_sec_UMSSM_SvToSvVZp(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,MSv2,            & 
& MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSvcSv,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVZpL,       & 
& cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,     & 
& cplcFvChiSvR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvVZpL,       & 
& cplcFvFvVZpR,cplhhSvcSv,cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplHpmcHpmVZp,              & 
& cplHpmcVWmVZp,cplSecSeVZp,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,            & 
& cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSvcVWmVZp1,cplSvcSeVWmVZp1,              & 
& cplSvcSvVZVZp1,cplSvcSvVZpVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVWm,               & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVZp(6,6),cplAhSvcSv(6,6,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),            & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChiVZpL(9,9),cplChiChiVZpR(9,9),         & 
& cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),       & 
& cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),         & 
& cplcFvFvVZpL(3,3),cplcFvFvVZpR(3,3),cplhhSvcSv(6,6,6),cplhhVZVZp(6),cplhhVZpVZp(6),    & 
& cplHpmSvcSe(2,6,6),cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),cplSecSeVZp(6,6),               & 
& cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),cplSvcSeVWm(6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),& 
& cplcHpmVWmVZp(2),cplcVWmVWmVZp,cplSecSvcVWmVZp1(6,6),cplSvcSeVWmVZp1(6,6),             & 
& cplSvcSvVZVZp1(6,6),cplSvcSvVZpVZp1(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MVZp 


! {Ah, conj[Sv], conj[Sv]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplAhSvcSv(i1,i2,gt1)
coup2 = cplAhSvcSv(i1,gt2,i3)
coup3 = cplSvcSvVZp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, bar[Fv], bar[Fv]}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFvcSvL(i1,i2,gt1)
coup1R = cplChiFvcSvR(i1,i2,gt1)
coup2L = cplcFvChiSvL(i3,i1,gt2)
coup2R = cplcFvChiSvR(i3,i1,gt2)
coup3L = cplcFvFvVZpL(i2,i3)
coup3R = cplcFvFvVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, Cha, Cha}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFecSvL(i2,i1,gt1)
coup1R = cplcChaFecSvR(i2,i1,gt1)
coup2L = cplcFeChaSvL(i1,i3,gt2)
coup2R = cplcFeChaSvR(i1,i3,gt2)
coup3L = -cplcChaChaVZpR(i3,i2)
coup3R = -cplcChaChaVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fv, Chi, Chi}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MFv(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFvcSvL(i2,i1,gt1)
coup1R = cplChiFvcSvR(i2,i1,gt1)
coup2L = cplcFvChiSvL(i1,i3,gt2)
coup2R = cplcFvChiSvR(i1,i3,gt2)
coup3L = -cplChiChiVZpR(i3,i2)
coup3R = -cplChiChiVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, conj[Sv], conj[Sv]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplhhSvcSv(i1,i2,gt1)
coup2 = cplhhSvcSv(i1,gt2,i3)
coup3 = cplSvcSvVZp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Se, Hpm, Hpm}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplSecHpmcSv(i1,i2,gt1)
coup2 = cplHpmSvcSe(i3,gt2,i1)
coup3 = -cplHpmcHpmVZp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Se, VWm, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSecSvcVWm(i1,gt1)
coup2 = cplHpmSvcSe(i3,gt2,i1)
coup3 = cplcHpmVWmVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Se, Hpm, VWm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplSecHpmcSv(i1,i2,gt1)
coup2 = cplSvcSeVWm(gt2,i1)
coup3 = cplHpmcVWmVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Se, VWm, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSecSvcVWm(i1,gt1)
coup2 = cplSvcSeVWm(gt2,i1)
coup3 = -cplcVWmVWmVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sv, hh, Ah}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSvcSv(i2,i1,gt1)
coup2 = cplAhSvcSv(i3,gt2,i1)
coup3 = cplAhhhVZp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sv, Ah, hh}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSvcSv(i2,i1,gt1)
coup2 = cplhhSvcSv(i3,gt2,i1)
coup3 = -cplAhhhVZp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sv, VZ, hh}
Do i1=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplSvcSvVZ(i1,gt1)
coup2 = cplhhSvcSv(i3,gt2,i1)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sv, VZp, hh}
Do i1=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplSvcSvVZp(i1,gt1)
coup2 = cplhhSvcSv(i3,gt2,i1)
coup3 = cplhhVZpVZp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sv, hh, VZ}
Do i1=1,6
  Do i2=1,6
ML1 = MSv(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhSvcSv(i2,i1,gt1)
coup2 = cplSvcSvVZ(gt2,i1)
coup3 = cplhhVZVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sv, hh, VZp}
Do i1=1,6
  Do i2=1,6
ML1 = MSv(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhSvcSv(i2,i1,gt1)
coup2 = cplSvcSvVZp(gt2,i1)
coup3 = cplhhVZpVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VZ, conj[Sv], conj[Sv]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplSvcSvVZ(i2,gt1)
coup2 = cplSvcSvVZ(gt2,i3)
coup3 = cplSvcSvVZp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Sv], conj[Sv]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplSvcSvVZp(i2,gt1)
coup2 = cplSvcSvVZp(gt2,i3)
coup3 = cplSvcSvVZp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Cha], bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFecSvL(i1,i2,gt1)
coup1R = cplcChaFecSvR(i1,i2,gt1)
coup2L = cplcFeChaSvL(i3,i1,gt2)
coup2R = cplcFeChaSvR(i3,i1,gt2)
coup3L = cplcFeFeVZpL(i2,i3)
coup3R = cplcFeFeVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Hpm], conj[Se], conj[Se]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecHpmcSv(i2,i1,gt1)
coup2 = cplHpmSvcSe(i1,gt2,i3)
coup3 = cplSecSeVZp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[VWm], conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSvcVWm(i2,gt1)
coup2 = cplSvcSeVWm(gt2,i3)
coup3 = cplSecSeVZp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Se, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
coup1 = -cplSecSvcVWm(i1,gt1)
coup2 = cplSvcSeVWmVZp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sv, VZ}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVZ 
coup1 = -cplSvcSvVZ(i1,gt1)
coup2 = cplSvcSvVZVZp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sv, VZp}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVZp 
coup1 = -cplSvcSvVZp(i1,gt1)
coup2 = cplSvcSvVZpVZp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
coup1 = cplSecSvcVWmVZp1(i1,gt1)
coup2 = cplSvcSeVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Sv, VZ}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVZ 
coup1 = cplSvcSvVZVZp1(i1,gt1)
coup2 = cplSvcSvVZ(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Sv, VZp}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVZp 
coup1 = cplSvcSvVZpVZp1(i1,gt1)
coup2 = cplSvcSvVZp(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_sec_UMSSM_SvToSvVZp


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SvToSvVZp(MAh,MCha,MChi,MFe,MFv,             & 
& Mhh,MHpm,MSe,MSv,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSvcSv,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFvcSvL,cplChiFvcSvR,cplcFvChiSvL,     & 
& cplcFvChiSvR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFvVZpL,       & 
& cplcFvFvVZpR,cplhhSvcSv,cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplHpmcHpmVZp,              & 
& cplHpmcVWmVZp,cplSecSeVZp,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZ,            & 
& cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSvcVWmVZp1,cplSvcSeVWmVZp1,              & 
& cplSvcSvVZVZp1,cplSvcSvVZpVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVWm,               & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVZp(6,6),cplAhSvcSv(6,6,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),            & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChiVZpL(9,9),cplChiChiVZpR(9,9),         & 
& cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),       & 
& cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),         & 
& cplcFvFvVZpL(3,3),cplcFvFvVZpR(3,3),cplhhSvcSv(6,6,6),cplhhVZVZp(6),cplhhVZpVZp(6),    & 
& cplHpmSvcSe(2,6,6),cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),cplSecSeVZp(6,6),               & 
& cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),cplSvcSeVWm(6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),& 
& cplcHpmVWmVZp(2),cplcVWmVWmVZp,cplSecSvcVWmVZp1(6,6),cplSvcSeVWmVZp1(6,6),             & 
& cplSvcSvVZVZp1(6,6),cplSvcSvVZpVZp1(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MVZp 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SvToSvVZp


Subroutine Amplitude_WAVE_sec_UMSSM_SvToSvVP(cplSvcSvVZ,cplSvcSvVZp,ctcplSvcSvVZ,     & 
& ctcplSvcSvVZp,MSv,MSv2,MVP,MVP2,MVZ,MVZ2,ZfSv,ZfVP,ZfVZpVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MSv(6),MSv2(6),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplSvcSvVZ(6,6),cplSvcSvVZp(6,6)

Complex(dp), Intent(in) :: ctcplSvcSvVZ(6,6),ctcplSvcSvVZp(6,6)

Complex(dp), Intent(in) :: ZfSv(6,6),ZfVP,ZfVZpVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MVP 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVP*cplSvcSvVZ(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZpVP*cplSvcSvVZp(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_SvToSvVP


Subroutine Amplitude_VERTEX_sec_UMSSM_SvToSvVP(MCha,MFe,MHpm,MSe,MSv,MVP,             & 
& MVWm,MCha2,MFe2,MHpm2,MSe2,MSv2,MVP2,MVWm2,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,    & 
& cplcChaChaVPR,cplcFeFeVPL,cplcFeFeVPR,cplcChaFecSvL,cplcChaFecSvR,cplHpmSvcSe,         & 
& cplHpmcHpmVP,cplHpmcVWmVP,cplSecSeVP,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,            & 
& cplcHpmVPVWm,cplcVWmVPVWm,cplSecSvcVWmVP1,cplSvcSeVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFe(3),MHpm(2),MSe(6),MSv(6),MVP,MVWm,MCha2(2),MFe2(3),MHpm2(2),              & 
& MSe2(6),MSv2(6),MVP2,MVWm2

Complex(dp), Intent(in) :: cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),        & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),           & 
& cplHpmSvcSe(2,6,6),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSecSeVP(6,6),cplSecHpmcSv(6,2,6),& 
& cplSecSvcVWm(6,6),cplSvcSeVWm(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplSecSvcVWmVP1(6,6),  & 
& cplSvcSeVPVWm1(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MVP 


! {Fe, Cha, Cha}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaFecSvL(i2,i1,gt1)
coup1R = cplcChaFecSvR(i2,i1,gt1)
coup2L = cplcFeChaSvL(i1,i3,gt2)
coup2R = cplcFeChaSvR(i1,i3,gt2)
coup3L = -cplcChaChaVPR(i3,i2)
coup3R = -cplcChaChaVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Se, Hpm, Hpm}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplSecHpmcSv(i1,i2,gt1)
coup2 = cplHpmSvcSe(i3,gt2,i1)
coup3 = -cplHpmcHpmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Se, VWm, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSecSvcVWm(i1,gt1)
coup2 = cplHpmSvcSe(i3,gt2,i1)
coup3 = cplcHpmVPVWm(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Se, Hpm, VWm}
Do i1=1,6
  Do i2=1,2
ML1 = MSe(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplSecHpmcSv(i1,i2,gt1)
coup2 = cplSvcSeVWm(gt2,i1)
coup3 = cplHpmcVWmVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Se, VWm, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSecSvcVWm(i1,gt1)
coup2 = cplSvcSeVWm(gt2,i1)
coup3 = cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {bar[Cha], bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFecSvL(i1,i2,gt1)
coup1R = cplcChaFecSvR(i1,i2,gt1)
coup2L = cplcFeChaSvL(i3,i1,gt2)
coup2R = cplcFeChaSvR(i3,i1,gt2)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Hpm], conj[Se], conj[Se]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecHpmcSv(i2,i1,gt1)
coup2 = cplHpmSvcSe(i1,gt2,i3)
coup3 = cplSecSeVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[VWm], conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSvcVWm(i2,gt1)
coup2 = cplSvcSeVWm(gt2,i3)
coup3 = cplSecSeVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Se, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
coup1 = -cplSecSvcVWm(i1,gt1)
coup2 = cplSvcSeVPVWm1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
coup1 = cplSecSvcVWmVP1(i1,gt1)
coup2 = cplSvcSeVWm(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_sec_UMSSM_SvToSvVP


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SvToSvVP(MCha,MFe,MHpm,MSe,MSv,              & 
& MVP,MVWm,MCha2,MFe2,MHpm2,MSe2,MSv2,MVP2,MVWm2,cplcFeChaSvL,cplcFeChaSvR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcFeFeVPL,cplcFeFeVPR,cplcChaFecSvL,cplcChaFecSvR,       & 
& cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplSecSeVP,cplSecHpmcSv,cplSecSvcVWm,            & 
& cplSvcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSecSvcVWmVP1,cplSvcSeVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFe(3),MHpm(2),MSe(6),MSv(6),MVP,MVWm,MCha2(2),MFe2(3),MHpm2(2),              & 
& MSe2(6),MSv2(6),MVP2,MVWm2

Complex(dp), Intent(in) :: cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),        & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),           & 
& cplHpmSvcSe(2,6,6),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSecSeVP(6,6),cplSecHpmcSv(6,2,6),& 
& cplSecSvcVWm(6,6),cplSvcSeVWm(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplSecSvcVWmVP1(6,6),  & 
& cplSvcSeVPVWm1(6,6)

Complex(dp), Intent(out) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSv(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MVP 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SvToSvVP



End Module OneLoopDecay_Sv_sec_UMSSM
