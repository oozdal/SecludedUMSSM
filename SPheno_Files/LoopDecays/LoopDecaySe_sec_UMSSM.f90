! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 1:04 on 7.11.2019   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_Se_sec_UMSSM
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

Subroutine Amplitude_Tree_sec_UMSSM_SeToSeAh(cplAhSecSe,MAh,MSe,MAh2,MSe2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MSe(6),MAh2(6),MSe2(6)

Complex(dp), Intent(in) :: cplAhSecSe(6,6,6)

Complex(dp) :: Amp(6,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MAh(gt3) 
! Tree-Level Vertex 
coupT1 = cplAhSecSe(gt3,gt2,gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_SeToSeAh


Subroutine Gamma_Real_sec_UMSSM_SeToSeAh(MLambda,em,gs,cplAhSecSe,MAh,MSe,            & 
& GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhSecSe(6,6,6)

Real(dp), Intent(in) :: MAh(6),MSe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,6), GammarealGluon(6,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
    Do i3=3,6
Coup = cplAhSecSe(i3,i2,i1)
Mex1 = MSe(i1)
Mex2 = MSe(i2)
Mex3 = MAh(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,Coup,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_SeToSeAh


Subroutine Amplitude_WAVE_sec_UMSSM_SeToSeAh(cplAhSecSe,ctcplAhSecSe,MAh,             & 
& MAh2,MSe,MSe2,ZfAh,ZfSe,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MAh2(6),MSe(6),MSe2(6)

Complex(dp), Intent(in) :: cplAhSecSe(6,6,6)

Complex(dp), Intent(in) :: ctcplAhSecSe(6,6,6)

Complex(dp), Intent(in) :: ZfAh(6,6),ZfSe(6,6)

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
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MAh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhSecSe(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplAhSecSe(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSe(i1,gt2)*cplAhSecSe(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh(i1,gt3)*cplAhSecSe(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_SeToSeAh


Subroutine Amplitude_VERTEX_sec_UMSSM_SeToSeAh(MAh,MCha,MChi,MFe,MFv,Mhh,             & 
& MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,           & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,           & 
& cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,cplChaFvcSeR,               & 
& cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplhhSecSe,cplHpmSvcSe,            & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,            & 
& cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,   & 
& cplhhhhSecSe1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,         & 
& cplSeSvcSecSv1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),            & 
& MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhAh(6,6,6),cplAhAhhh(6,6,6),cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),          & 
& cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6),         & 
& cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),cplAhhhhh(6,6,6),cplAhhhVZ(6,6),cplAhhhVZp(6,6), & 
& cplAhHpmcHpm(6,2,2),cplAhHpmcVWm(6,2),cplAhSdcSd(6,6,6),cplAhSecSe(6,6,6),             & 
& cplAhSucSu(6,6,6),cplAhSvcSv(6,6,6),cplAhcHpmVWm(6,2),cplChaFvcSeL(2,3,6),             & 
& cplChaFvcSeR(2,3,6),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplcFeChiSeL(3,9,6),       & 
& cplcFeChiSeR(3,9,6),cplhhSecSe(6,6,6),cplHpmSvcSe(2,6,6),cplSecSeVP(6,6),              & 
& cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),            & 
& cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),cplSvcSeVWm(6,6),cplAhAhSecSe1(6,6,6,6),         & 
& cplAhhhSecSe1(6,6,6,6),cplAhHpmSvcSe1(6,2,6,6),cplAhSecHpmcSv1(6,6,2,6),               & 
& cplhhhhSecSe1(6,6,6,6),cplHpmSecHpmcSe1(2,6,2,6),cplSdSecSdcSeaa(6,6,6,6),             & 
& cplSeSecSecSe1(6,6,6,6),cplSeSucSecSuaa(6,6,6,6),cplSeSvcSecSv1(6,6,6,6)

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
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MAh(gt3) 


! {Ah, conj[Se], conj[Se]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhSecSe(i1,gt2,i3)
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


! {Cha, bar[Fv], bar[Fv]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChaFvcSeL(i1,i2,gt1)
coup1R = cplChaFvcSeR(i1,i2,gt1)
coup2L = cplcChacFvSeL(i1,i3,gt2)
coup2R = cplcChacFvSeR(i1,i3,gt2)
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


! {Chi, bar[Fe], bar[Fe]}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFecSeL(i1,i2,gt1)
coup1R = cplChiFecSeR(i1,i2,gt1)
coup2L = cplcFeChiSeL(i3,i1,gt2)
coup2R = cplcFeChiSeR(i3,i1,gt2)
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


! {Fe, Chi, Chi}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = cplcFeChiSeL(i1,i3,gt2)
coup2R = cplcFeChiSeR(i1,i3,gt2)
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


! {Fv, bar[Cha], bar[Cha]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplChaFvcSeL(i2,i1,gt1)
coup1R = cplChaFvcSeR(i2,i1,gt1)
coup2L = cplcChacFvSeL(i3,i1,gt2)
coup2R = cplcChacFvSeR(i3,i1,gt2)
coup3L = cplcChaChaAhL(i2,i3,gt3)
coup3R = cplcChaChaAhR(i2,i3,gt3)
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


! {hh, conj[Se], conj[Se]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhSecSe(i1,gt2,i3)
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


! {Hpm, conj[Sv], conj[Sv]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplHpmSvcSe(i1,i2,gt1)
coup2 = cplSecHpmcSv(gt2,i1,i3)
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


! {Se, Ah, Ah}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = cplAhSecSe(i3,gt2,i1)
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


! {Se, hh, Ah}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplAhSecSe(i3,gt2,i1)
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


! {Se, Ah, hh}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
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


! {Se, hh, hh}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
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


! {Se, VZ, hh}
Do i1=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplSecSeVZ(i1,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
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


! {Se, VZp, hh}
Do i1=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplSecSeVZp(i1,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
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


! {Se, hh, VZ}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = -cplSecSeVZ(gt2,i1)
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


! {Se, hh, VZp}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = -cplSecSeVZp(gt2,i1)
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


! {Sv, conj[Hpm], conj[Hpm]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSv(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSvcSe(i2,i1,gt1)
coup2 = cplSecHpmcSv(gt2,i3,i1)
coup3 = cplAhHpmcHpm(gt3,i3,i2)
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


! {Sv, conj[VWm], conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSv(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSvcSeVWm(i1,gt1)
coup2 = cplSecHpmcSv(gt2,i3,i1)
coup3 = cplAhHpmcVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sv, conj[Hpm], conj[VWm]}
Do i1=1,6
  Do i2=1,2
ML1 = MSv(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSvcSe(i2,i1,gt1)
coup2 = -cplSecSvcVWm(gt2,i1)
coup3 = cplAhcHpmVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVP(i2,gt1)
coup2 = -cplSecSeVP(gt2,i3)
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


! {VWm, conj[Sv], conj[Sv]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplSvcSeVWm(i2,gt1)
coup2 = -cplSecSvcVWm(gt2,i3)
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


! {VZ, conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVZ(i2,gt1)
coup2 = -cplSecSeVZ(gt2,i3)
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


! {VZp, conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVZp(i2,gt1)
coup2 = -cplSecSeVZp(gt2,i3)
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


! {Ah, conj[Se]}
Do i1=1,6
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhAhSecSe1(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, conj[Se]}
Do i1=1,6
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplAhhhSecSe1(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hpm, conj[Sv]}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSv(i2) 
coup1 = cplHpmSvcSe(i1,i2,gt1)
coup2 = cplAhSecHpmcSv1(gt3,gt2,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, conj[Se]}
Do i1=1,6
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
coup1 = cplAhAhSecSe1(gt3,i1,i2,gt1)
coup2 = cplAhSecSe(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplAhhhSecSe1(gt3,i1,i2,gt1)
coup2 = cplhhSecSe(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplAhHpmSvcSe1(gt3,i1,i2,gt1)
coup2 = cplSecHpmcSv(gt2,i1,i2)
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
coup1 = cplAhAhSecSe1(i1,i2,gt2,gt1)
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
coup1 = cplAhhhSecSe1(i1,i2,gt2,gt1)
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
coup1 = cplhhhhSecSe1(i1,i2,gt2,gt1)
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
coup1 = cplHpmSecHpmcSe1(i1,gt2,i2,gt1)
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
coup1 = cplSdSecSdcSeaa(i1,gt2,i2,gt1)
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
coup1 = cplSeSecSecSe1(gt2,i1,gt1,i2)
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
coup1 = cplSeSucSecSuaa(gt2,i1,gt1,i2)
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
coup1 = cplSeSvcSecSv1(gt2,i1,gt1,i2)
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
End Subroutine Amplitude_VERTEX_sec_UMSSM_SeToSeAh


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SeToSeAh(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,            & 
& MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,cplAhAhhh,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFvFvAhL,           & 
& cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,cplChaFvcSeR,               & 
& cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplhhSecSe,cplHpmSvcSe,            & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,            & 
& cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,cplAhHpmSvcSe1,cplAhSecHpmcSv1,   & 
& cplhhhhSecSe1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,cplSeSecSecSe1,cplSeSucSecSuaa,         & 
& cplSeSvcSecSv1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),            & 
& MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhAh(6,6,6),cplAhAhhh(6,6,6),cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),          & 
& cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6),         & 
& cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),cplAhhhhh(6,6,6),cplAhhhVZ(6,6),cplAhhhVZp(6,6), & 
& cplAhHpmcHpm(6,2,2),cplAhHpmcVWm(6,2),cplAhSdcSd(6,6,6),cplAhSecSe(6,6,6),             & 
& cplAhSucSu(6,6,6),cplAhSvcSv(6,6,6),cplAhcHpmVWm(6,2),cplChaFvcSeL(2,3,6),             & 
& cplChaFvcSeR(2,3,6),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplcFeChiSeL(3,9,6),       & 
& cplcFeChiSeR(3,9,6),cplhhSecSe(6,6,6),cplHpmSvcSe(2,6,6),cplSecSeVP(6,6),              & 
& cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),            & 
& cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),cplSvcSeVWm(6,6),cplAhAhSecSe1(6,6,6,6),         & 
& cplAhhhSecSe1(6,6,6,6),cplAhHpmSvcSe1(6,2,6,6),cplAhSecHpmcSv1(6,6,2,6),               & 
& cplhhhhSecSe1(6,6,6,6),cplHpmSecHpmcSe1(2,6,2,6),cplSdSecSdcSeaa(6,6,6,6),             & 
& cplSeSecSecSe1(6,6,6,6),cplSeSucSecSuaa(6,6,6,6),cplSeSvcSecSv1(6,6,6,6)

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
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MAh(gt3) 


! {VP, conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVP(i2,gt1)
coup2 = -cplSecSeVP(gt2,i3)
coup3 = cplAhSecSe(gt3,i3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SeToSeAh


Subroutine Amplitude_Tree_sec_UMSSM_SeToFvCha(cplChaFvcSeL,cplChaFvcSeR,              & 
& MCha,MFv,MSe,MCha2,MFv2,MSe2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFv(3),MSe(6),MCha2(2),MFv2(3),MSe2(6)

Complex(dp), Intent(in) :: cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6)

Complex(dp) :: Amp(2,6,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,2
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MCha(gt3) 
! Tree-Level Vertex 
coupT1L = cplChaFvcSeL(gt3,gt2,gt1)
coupT1R = cplChaFvcSeR(gt3,gt2,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_SeToFvCha


Subroutine Gamma_Real_sec_UMSSM_SeToFvCha(MLambda,em,gs,cplChaFvcSeL,cplChaFvcSeR,    & 
& MCha,MFv,MSe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6)

Real(dp), Intent(in) :: MCha(2),MFv(3),MSe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,3,2), GammarealGluon(6,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,3
    Do i3=1,2
CoupL = cplChaFvcSeL(i3,i2,i1)
CoupR = cplChaFvcSeR(i3,i2,i1)
Mex1 = MSe(i1)
Mex2 = MFv(i2)
Mex3 = MCha(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,1._dp,0._dp,1._dp,0._dp,0._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_SeToFvCha


Subroutine Amplitude_WAVE_sec_UMSSM_SeToFvCha(cplChaFvcSeL,cplChaFvcSeR,              & 
& ctcplChaFvcSeL,ctcplChaFvcSeR,MCha,MCha2,MFv,MFv2,MSe,MSe2,ZfFVL,ZfFVR,ZfLm,           & 
& ZfLp,ZfSe,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MFv(3),MFv2(3),MSe(6),MSe2(6)

Complex(dp), Intent(in) :: cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6)

Complex(dp), Intent(in) :: ctcplChaFvcSeL(2,3,6),ctcplChaFvcSeR(2,3,6)

Complex(dp), Intent(in) :: ZfFVL(3,3),ZfFVR(3,3),ZfLm(2,2),ZfLp(2,2),ZfSe(6,6)

Complex(dp), Intent(out) :: Amp(2,6,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,2
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MCha(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChaFvcSeL(gt3,gt2,gt1) 
ZcoupT1R = ctcplChaFvcSeR(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplChaFvcSeL(gt3,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplChaFvcSeR(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFVL(i1,gt2)*cplChaFvcSeL(gt3,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFVR(i1,gt2))*cplChaFvcSeR(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLm(i1,gt3)*cplChaFvcSeL(i1,gt2,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLp(i1,gt3))*cplChaFvcSeR(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_SeToFvCha


Subroutine Amplitude_VERTEX_sec_UMSSM_SeToFvCha(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFvFvAhL,cplcFvFvAhR,        & 
& cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,      & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcFvFvhhL,cplcFvFvhhR,           & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,           & 
& cplcFvFvVZpL,cplcFvFvVZpR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,    & 
& cplSvcSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVP,MVWm,           & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),      & 
& cplAhSecSe(6,6,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChiChacVWmL(9,2),     & 
& cplChiChacVWmR(9,2),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChahhL(2,2,6),      & 
& cplcChaChahhR(2,2,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),cplcChaChaVPL(2,2),       & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFvcSvL(9,3,6),       & 
& cplChiFvcSvR(9,3,6),cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),cplcFeFvHpmL(3,3,2),         & 
& cplcFeFvHpmR(3,3,2),cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcFvFvVZL(3,3),              & 
& cplcFvFvVZR(3,3),cplcFvFvVZpL(3,3),cplcFvFvVZpR(3,3),cplhhSecSe(6,6,6),cplHpmSvcSe(2,6,6),& 
& cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSvcSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MCha(gt3) 


! {Ah, conj[Se], bar[Fv]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MFv(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2L = cplcFvFvAhL(i3,gt2,i1)
coup2R = cplcFvFvAhR(i3,gt2,i1)
coup3L = cplChaFvcSeL(gt3,i3,i2)
coup3R = cplChaFvcSeR(gt3,i3,i2)
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


! {Chi, bar[Fe], conj[Sv]}
Do i1=1,9
  Do i2=1,3
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MFe(i2) 
ML3 = MSv(i3) 
coup1L = cplChiFecSeL(i1,i2,gt1)
coup1R = cplChiFecSeR(i1,i2,gt1)
coup2L = cplChiFvcSvL(i1,gt2,i3)
coup2R = cplChiFvcSvR(i1,gt2,i3)
coup3L = cplcFeChaSvL(i2,gt3,i3)
coup3R = cplcFeChaSvR(i2,gt3,i3)
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


! {Fe, Chi, Hpm}
Do i1=1,3
  Do i2=1,9
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MHpm(i3) 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = cplcFeFvHpmL(i1,gt2,i3)
coup2R = cplcFeFvHpmR(i1,gt2,i3)
coup3L = cplChiChacHpmL(i2,gt3,i3)
coup3R = cplChiChacHpmR(i2,gt3,i3)
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


! {Fe, Chi, VWm}
Do i1=1,3
  Do i2=1,9
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MVWm 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = -cplcFeFvVWmR(i1,gt2)
coup2R = -cplcFeFvVWmL(i1,gt2)
coup3L = cplChiChacVWmL(i2,gt3)
coup3R = cplChiChacVWmR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, bar[Cha], Ah}
Do i1=1,3
  Do i2=1,2
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MAh(i3) 
coup1L = cplChaFvcSeL(i2,i1,gt1)
coup1R = cplChaFvcSeR(i2,i1,gt1)
coup2L = cplcFvFvAhL(i1,gt2,i3)
coup2R = cplcFvFvAhR(i1,gt2,i3)
coup3L = cplcChaChaAhL(i2,gt3,i3)
coup3R = cplcChaChaAhR(i2,gt3,i3)
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


! {Fv, bar[Cha], hh}
Do i1=1,3
  Do i2=1,2
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = Mhh(i3) 
coup1L = cplChaFvcSeL(i2,i1,gt1)
coup1R = cplChaFvcSeR(i2,i1,gt1)
coup2L = cplcFvFvhhL(i1,gt2,i3)
coup2R = cplcFvFvhhR(i1,gt2,i3)
coup3L = cplcChaChahhL(i2,gt3,i3)
coup3R = cplcChaChahhR(i2,gt3,i3)
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


! {Fv, bar[Cha], VZ}
Do i1=1,3
  Do i2=1,2
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MVZ 
coup1L = cplChaFvcSeL(i2,i1,gt1)
coup1R = cplChaFvcSeR(i2,i1,gt1)
coup2L = -cplcFvFvVZR(i1,gt2)
coup2R = -cplcFvFvVZL(i1,gt2)
coup3L = cplcChaChaVZL(i2,gt3)
coup3R = cplcChaChaVZR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, bar[Cha], VZp}
Do i1=1,3
  Do i2=1,2
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MVZp 
coup1L = cplChaFvcSeL(i2,i1,gt1)
coup1R = cplChaFvcSeR(i2,i1,gt1)
coup2L = -cplcFvFvVZpR(i1,gt2)
coup2R = -cplcFvFvVZpL(i1,gt2)
coup3L = cplcChaChaVZpL(i2,gt3)
coup3R = cplcChaChaVZpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, conj[Se], bar[Fv]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MFv(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2L = cplcFvFvhhL(i3,gt2,i1)
coup2R = cplcFvFvhhR(i3,gt2,i1)
coup3L = cplChaFvcSeL(gt3,i3,i2)
coup3R = cplChaFvcSeR(gt3,i3,i2)
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


! {Se, Ah, Cha}
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = MCha(i3) 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2L = cplChaFvcSeL(i3,gt2,i1)
coup2R = cplChaFvcSeR(i3,gt2,i1)
coup3L = cplcChaChaAhL(i3,gt3,i2)
coup3R = cplcChaChaAhR(i3,gt3,i2)
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


! {Se, hh, Cha}
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MCha(i3) 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2L = cplChaFvcSeL(i3,gt2,i1)
coup2R = cplChaFvcSeR(i3,gt2,i1)
coup3L = cplcChaChahhL(i3,gt3,i2)
coup3R = cplcChaChahhR(i3,gt3,i2)
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


! {Se, VP, Cha}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MCha(i3) 
coup1 = -cplSecSeVP(i1,gt1)
coup2L = cplChaFvcSeL(i3,gt2,i1)
coup2R = cplChaFvcSeR(i3,gt2,i1)
coup3L = cplcChaChaVPL(i3,gt3)
coup3R = cplcChaChaVPR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Se, VZ, Cha}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = MCha(i3) 
coup1 = -cplSecSeVZ(i1,gt1)
coup2L = cplChaFvcSeL(i3,gt2,i1)
coup2R = cplChaFvcSeR(i3,gt2,i1)
coup3L = cplcChaChaVZL(i3,gt3)
coup3R = cplcChaChaVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Se, VZp, Cha}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVZp 
ML3 = MCha(i3) 
coup1 = -cplSecSeVZp(i1,gt1)
coup2L = cplChaFvcSeL(i3,gt2,i1)
coup2R = cplChaFvcSeR(i3,gt2,i1)
coup3L = cplcChaChaVZpL(i3,gt3)
coup3R = cplcChaChaVZpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sv, conj[Hpm], Chi}
Do i1=1,6
  Do i2=1,2
    Do i3=1,9
ML1 = MSv(i1) 
ML2 = MHpm(i2) 
ML3 = MChi(i3) 
coup1 = cplHpmSvcSe(i2,i1,gt1)
coup2L = cplChiFvcSvL(i3,gt2,i1)
coup2R = cplChiFvcSvR(i3,gt2,i1)
coup3L = cplChiChacHpmL(i3,gt3,i2)
coup3R = cplChiChacHpmR(i3,gt3,i2)
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


! {Sv, conj[VWm], Chi}
Do i1=1,6
    Do i3=1,9
ML1 = MSv(i1) 
ML2 = MVWm 
ML3 = MChi(i3) 
coup1 = -cplSvcSeVWm(i1,gt1)
coup2L = cplChiFvcSvL(i3,gt2,i1)
coup2R = cplChiFvcSvR(i3,gt2,i1)
coup3L = cplChiChacVWmL(i3,gt3)
coup3R = cplChiChacVWmR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VZ, conj[Se], bar[Fv]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVZ 
ML2 = MSe(i2) 
ML3 = MFv(i3) 
coup1 = -cplSecSeVZ(i2,gt1)
coup2L = -cplcFvFvVZR(i3,gt2)
coup2R = -cplcFvFvVZL(i3,gt2)
coup3L = cplChaFvcSeL(gt3,i3,i2)
coup3R = cplChaFvcSeR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Se], bar[Fv]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVZp 
ML2 = MSe(i2) 
ML3 = MFv(i3) 
coup1 = -cplSecSeVZp(i2,gt1)
coup2L = -cplcFvFvVZpR(i3,gt2)
coup2R = -cplcFvFvVZpL(i3,gt2)
coup3L = cplChaFvcSeL(gt3,i3,i2)
coup3R = cplChaFvcSeR(gt3,i3,i2)
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
End Subroutine Amplitude_VERTEX_sec_UMSSM_SeToFvCha


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SeToFvCha(MAh,MCha,MChi,MFe,MFv,             & 
& Mhh,MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,              & 
& MSe2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFvFvAhL,               & 
& cplcFvFvAhR,cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,    & 
& cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFeChaSvL,cplcFeChaSvR,       & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcFvFvhhL,cplcFvFvhhR,           & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWmL,cplcFeFvVWmR,cplcFvFvVZL,cplcFvFvVZR,           & 
& cplcFvFvVZpL,cplcFvFvVZpR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,    & 
& cplSvcSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVP,MVWm,           & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),      & 
& cplAhSecSe(6,6,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChiChacVWmL(9,2),     & 
& cplChiChacVWmR(9,2),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChahhL(2,2,6),      & 
& cplcChaChahhR(2,2,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),cplcChaChaVPL(2,2),       & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFvcSvL(9,3,6),       & 
& cplChiFvcSvR(9,3,6),cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),cplcFeFvHpmL(3,3,2),         & 
& cplcFeFvHpmR(3,3,2),cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplcFvFvVZL(3,3),              & 
& cplcFvFvVZR(3,3),cplcFvFvVZpL(3,3),cplcFvFvVZpR(3,3),cplhhSecSe(6,6,6),cplHpmSvcSe(2,6,6),& 
& cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSvcSeVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,6,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MCha(gt3) 


! {Se, VP, Cha}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MCha(i3) 
coup1 = -cplSecSeVP(i1,gt1)
coup2L = cplChaFvcSeL(i3,gt2,i1)
coup2R = cplChaFvcSeR(i3,gt2,i1)
coup3L = cplcChaChaVPL(i3,gt3)
coup3R = cplcChaChaVPR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SeToFvCha


Subroutine Amplitude_Tree_sec_UMSSM_SeToFeChi(cplChiFecSeL,cplChiFecSeR,              & 
& MChi,MFe,MSe,MChi2,MFe2,MSe2,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(9),MFe(3),MSe(6),MChi2(9),MFe2(3),MSe2(6)

Complex(dp), Intent(in) :: cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6)

Complex(dp) :: Amp(2,6,3,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,3
    Do gt3=1,9
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MChi(gt3) 
! Tree-Level Vertex 
coupT1L = cplChiFecSeL(gt3,gt2,gt1)
coupT1R = cplChiFecSeR(gt3,gt2,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_SeToFeChi


Subroutine Gamma_Real_sec_UMSSM_SeToFeChi(MLambda,em,gs,cplChiFecSeL,cplChiFecSeR,    & 
& MChi,MFe,MSe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6)

Real(dp), Intent(in) :: MChi(9),MFe(3),MSe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,3,9), GammarealGluon(6,3,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,6
  Do i2=1,3
    Do i3=1,9
CoupL = cplChiFecSeL(i3,i2,i1)
CoupR = cplChiFecSeR(i3,i2,i1)
Mex1 = MSe(i1)
Mex2 = MFe(i2)
Mex3 = MChi(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_SeToFeChi


Subroutine Amplitude_WAVE_sec_UMSSM_SeToFeChi(cplChiFecSeL,cplChiFecSeR,              & 
& ctcplChiFecSeL,ctcplChiFecSeR,MChi,MChi2,MFe,MFe2,MSe,MSe2,ZfFEL,ZfFER,ZfL0,ZfSe,Amp)

Implicit None

Real(dp), Intent(in) :: MChi(9),MChi2(9),MFe(3),MFe2(3),MSe(6),MSe2(6)

Complex(dp), Intent(in) :: cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6)

Complex(dp), Intent(in) :: ctcplChiFecSeL(9,3,6),ctcplChiFecSeR(9,3,6)

Complex(dp), Intent(in) :: ZfFEL(3,3),ZfFER(3,3),ZfL0(9,9),ZfSe(6,6)

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
Mex1 = MSe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MChi(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplChiFecSeL(gt3,gt2,gt1) 
ZcoupT1R = ctcplChiFecSeR(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplChiFecSeL(gt3,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplChiFecSeR(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFEL(i1,gt2)*cplChiFecSeL(gt3,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFER(i1,gt2))*cplChiFecSeR(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,9
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt3)*cplChiFecSeL(i1,gt2,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt3))*cplChiFecSeR(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_SeToFeChi


Subroutine Amplitude_VERTEX_sec_UMSSM_SeToFeChi(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,          & 
& cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,            & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,       & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVP,MVWm,           & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6),        & 
& cplAhSecSe(6,6,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChiChacVWmL(9,2),     & 
& cplChiChacVWmR(9,2),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplChiChihhL(9,9,6),       & 
& cplChiChihhR(9,9,6),cplChiChiVZL(9,9),cplChiChiVZR(9,9),cplChiChiVZpL(9,9),            & 
& cplChiChiVZpR(9,9),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFvcSvL(9,3,6),        & 
& cplChiFvcSvR(9,3,6),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcFeChiSeL(3,9,6),   & 
& cplcFeChiSeR(3,9,6),cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),cplcChaChiVWmL(2,9),       & 
& cplcChaChiVWmR(2,9),cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),cplcFeFeVPL(3,3),            & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),& 
& cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFvFecHpmL(3,3,2),cplcFvFecHpmR(3,3,2),   & 
& cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplhhSecSe(6,6,6),cplHpmSvcSe(2,6,6),            & 
& cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSvcSeVWm(6,6)

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
Mex1 = MSe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MChi(gt3) 


! {Ah, conj[Se], bar[Fe]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MFe(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2L = cplcFeFeAhL(i3,gt2,i1)
coup2R = cplcFeFeAhR(i3,gt2,i1)
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


! {Cha, bar[Fv], conj[Sv]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MFv(i2) 
ML3 = MSv(i3) 
coup1L = cplChaFvcSeL(i1,i2,gt1)
coup1R = cplChaFvcSeR(i1,i2,gt1)
coup2L = cplcChaFecSvL(i1,gt2,i3)
coup2R = cplcChaFecSvR(i1,gt2,i3)
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


! {Chi, bar[Fe], conj[Se]}
Do i1=1,9
  Do i2=1,3
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MFe(i2) 
ML3 = MSe(i3) 
coup1L = cplChiFecSeL(i1,i2,gt1)
coup1R = cplChiFecSeR(i1,i2,gt1)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
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


! {Fe, Chi, Ah}
Do i1=1,3
  Do i2=1,9
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MAh(i3) 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
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


! {Fe, Chi, hh}
Do i1=1,3
  Do i2=1,9
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = Mhh(i3) 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, Chi, VZ}
Do i1=1,3
  Do i2=1,9
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MVZ 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
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


! {Fe, Chi, VZp}
Do i1=1,3
  Do i2=1,9
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MVZp 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = -cplcFeFeVZpR(i1,gt2)
coup2R = -cplcFeFeVZpL(i1,gt2)
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


! {Fv, bar[Cha], conj[Hpm]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MHpm(i3) 
coup1L = cplChaFvcSeL(i2,i1,gt1)
coup1R = cplChaFvcSeR(i2,i1,gt1)
coup2L = cplcFvFecHpmL(i1,gt2,i3)
coup2R = cplcFvFecHpmR(i1,gt2,i3)
coup3L = cplcChaChiHpmL(i2,gt3,i3)
coup3R = cplcChaChiHpmR(i2,gt3,i3)
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


! {Fv, bar[Cha], conj[VWm]}
Do i1=1,3
  Do i2=1,2
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MVWm 
coup1L = cplChaFvcSeL(i2,i1,gt1)
coup1R = cplChaFvcSeR(i2,i1,gt1)
coup2L = -cplcFvFecVWmR(i1,gt2)
coup2R = -cplcFvFecVWmL(i1,gt2)
coup3L = cplcChaChiVWmL(i2,gt3)
coup3R = cplcChaChiVWmR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, conj[Se], bar[Fe]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MFe(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
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


! {Hpm, conj[Sv], bar[Fv]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MSv(i2) 
ML3 = MFv(i3) 
coup1 = cplHpmSvcSe(i1,i2,gt1)
coup2L = cplcFvFecHpmL(i3,gt2,i1)
coup2R = cplcFvFecHpmR(i3,gt2,i1)
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


! {Se, Ah, Chi}
Do i1=1,6
  Do i2=1,6
    Do i3=1,9
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = MChi(i3) 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2L = cplChiFecSeL(i3,gt2,i1)
coup2R = cplChiFecSeR(i3,gt2,i1)
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


! {Se, hh, Chi}
Do i1=1,6
  Do i2=1,6
    Do i3=1,9
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MChi(i3) 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2L = cplChiFecSeL(i3,gt2,i1)
coup2R = cplChiFecSeR(i3,gt2,i1)
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


! {Se, VZ, Chi}
Do i1=1,6
    Do i3=1,9
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = MChi(i3) 
coup1 = -cplSecSeVZ(i1,gt1)
coup2L = cplChiFecSeL(i3,gt2,i1)
coup2R = cplChiFecSeR(i3,gt2,i1)
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


! {Se, VZp, Chi}
Do i1=1,6
    Do i3=1,9
ML1 = MSe(i1) 
ML2 = MVZp 
ML3 = MChi(i3) 
coup1 = -cplSecSeVZp(i1,gt1)
coup2L = cplChiFecSeL(i3,gt2,i1)
coup2R = cplChiFecSeR(i3,gt2,i1)
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


! {Sv, conj[Hpm], bar[Cha]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSv(i1) 
ML2 = MHpm(i2) 
ML3 = MCha(i3) 
coup1 = cplHpmSvcSe(i2,i1,gt1)
coup2L = cplcChaFecSvL(i3,gt2,i1)
coup2R = cplcChaFecSvR(i3,gt2,i1)
coup3L = cplChiChacHpmL(gt3,i3,i2)
coup3R = cplChiChacHpmR(gt3,i3,i2)
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


! {Sv, conj[VWm], bar[Cha]}
Do i1=1,6
    Do i3=1,2
ML1 = MSv(i1) 
ML2 = MVWm 
ML3 = MCha(i3) 
coup1 = -cplSvcSeVWm(i1,gt1)
coup2L = cplcChaFecSvL(i3,gt2,i1)
coup2R = cplcChaFecSvR(i3,gt2,i1)
coup3L = -cplChiChacVWmR(gt3,i3)
coup3R = -cplChiChacVWmL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VP, conj[Se], bar[Fe]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MFe(i3) 
coup1 = -cplSecSeVP(i2,gt1)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
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


! {VWm, conj[Sv], bar[Fv]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVWm 
ML2 = MSv(i2) 
ML3 = MFv(i3) 
coup1 = -cplSvcSeVWm(i2,gt1)
coup2L = -cplcFvFecVWmR(i3,gt2)
coup2R = -cplcFvFecVWmL(i3,gt2)
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


! {VZ, conj[Se], bar[Fe]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVZ 
ML2 = MSe(i2) 
ML3 = MFe(i3) 
coup1 = -cplSecSeVZ(i2,gt1)
coup2L = -cplcFeFeVZR(i3,gt2)
coup2R = -cplcFeFeVZL(i3,gt2)
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


! {VZp, conj[Se], bar[Fe]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVZp 
ML2 = MSe(i2) 
ML3 = MFe(i3) 
coup1 = -cplSecSeVZp(i2,gt1)
coup2L = -cplcFeFeVZpR(i3,gt2)
coup2R = -cplcFeFeVZpL(i3,gt2)
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
End Subroutine Amplitude_VERTEX_sec_UMSSM_SeToFeChi


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SeToFeChi(MAh,MCha,MChi,MFe,MFv,             & 
& Mhh,MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,              & 
& MSe2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplChiChiAhL,cplChiChiAhR,cplcFeFeAhL,cplcFeFeAhR,     & 
& cplAhSecSe,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,        & 
& cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,      & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,            & 
& cplcFeFeVZR,cplcFeFeVZpL,cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,       & 
& cplcFvFecHpmR,cplcFvFecVWmL,cplcFvFecVWmR,cplhhSecSe,cplHpmSvcSe,cplSecSeVP,           & 
& cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVP,MVWm,           & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6),        & 
& cplAhSecSe(6,6,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChiChacVWmL(9,2),     & 
& cplChiChacVWmR(9,2),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplChiChihhL(9,9,6),       & 
& cplChiChihhR(9,9,6),cplChiChiVZL(9,9),cplChiChiVZR(9,9),cplChiChiVZpL(9,9),            & 
& cplChiChiVZpR(9,9),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFvcSvL(9,3,6),        & 
& cplChiFvcSvR(9,3,6),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcFeChiSeL(3,9,6),   & 
& cplcFeChiSeR(3,9,6),cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),cplcChaChiVWmL(2,9),       & 
& cplcChaChiVWmR(2,9),cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),cplcFeFeVPL(3,3),            & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),& 
& cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFvFecHpmL(3,3,2),cplcFvFecHpmR(3,3,2),   & 
& cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplhhSecSe(6,6,6),cplHpmSvcSe(2,6,6),            & 
& cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSvcSeVWm(6,6)

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
Mex1 = MSe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MChi(gt3) 


! {VP, conj[Se], bar[Fe]}
  Do i2=1,6
    Do i3=1,3
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MFe(i3) 
coup1 = -cplSecSeVP(i2,gt1)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplChiFecSeL(gt3,i3,i2)
coup3R = cplChiFecSeR(gt3,i3,i2)
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SeToFeChi


Subroutine Amplitude_Tree_sec_UMSSM_SeToSehh(cplhhSecSe,Mhh,MSe,Mhh2,MSe2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(6),MSe(6),Mhh2(6),MSe2(6)

Complex(dp), Intent(in) :: cplhhSecSe(6,6,6)

Complex(dp) :: Amp(6,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,6
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhSecSe(gt3,gt2,gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_SeToSehh


Subroutine Gamma_Real_sec_UMSSM_SeToSehh(MLambda,em,gs,cplhhSecSe,Mhh,MSe,            & 
& GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhSecSe(6,6,6)

Real(dp), Intent(in) :: Mhh(6),MSe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,6), GammarealGluon(6,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
Coup = cplhhSecSe(i3,i2,i1)
Mex1 = MSe(i1)
Mex2 = MSe(i2)
Mex3 = Mhh(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,Coup,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_SeToSehh


Subroutine Amplitude_WAVE_sec_UMSSM_SeToSehh(cplhhSecSe,ctcplhhSecSe,Mhh,             & 
& Mhh2,MSe,MSe2,Zfhh,ZfSe,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(6),Mhh2(6),MSe(6),MSe2(6)

Complex(dp), Intent(in) :: cplhhSecSe(6,6,6)

Complex(dp), Intent(in) :: ctcplhhSecSe(6,6,6)

Complex(dp), Intent(in) :: Zfhh(6,6),ZfSe(6,6)

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
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhSecSe(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplhhSecSe(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSe(i1,gt2)*cplhhSecSe(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt3)*cplhhSecSe(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_SeToSehh


Subroutine Amplitude_VERTEX_sec_UMSSM_SeToSehh(MAh,MCha,MChi,MFe,MFv,Mhh,             & 
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
& cplSecSeVZVZp1,cplSecSeVZpVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),            & 
& MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(6,6,6),cplAhhhhh(6,6,6),cplAhhhVZ(6,6),cplAhhhVZp(6,6),cplAhSecSe(6,6,6),   & 
& cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),     & 
& cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),       & 
& cplcFeChiSeL(3,9,6),cplcFeChiSeR(3,9,6),cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),         & 
& cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),cplhhhhhh(6,6,6),cplhhHpmcHpm(6,2,2),            & 
& cplhhHpmcVWm(6,2),cplhhSdcSd(6,6,6),cplhhSecSe(6,6,6),cplhhSucSu(6,6,6),               & 
& cplhhSvcSv(6,6,6),cplhhcHpmVWm(6,2),cplhhcVWmVWm(6),cplhhVZVZ(6),cplhhVZVZp(6),        & 
& cplhhVZpVZp(6),cplHpmSvcSe(2,6,6),cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),    & 
& cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),       & 
& cplSvcSeVWm(6,6),cplAhAhSecSe1(6,6,6,6),cplAhhhSecSe1(6,6,6,6),cplhhhhSecSe1(6,6,6,6), & 
& cplhhHpmSvcSe1(6,2,6,6),cplhhSecHpmcSv1(6,6,2,6),cplHpmSecHpmcSe1(2,6,2,6),            & 
& cplSdSecSdcSeaa(6,6,6,6),cplSeSecSecSe1(6,6,6,6),cplSeSucSecSuaa(6,6,6,6),             & 
& cplSeSvcSecSv1(6,6,6,6),cplSecSecVWmVWm1(6,6),cplSecSeVZVZ1(6,6),cplSecSeVZVZp1(6,6),  & 
& cplSecSeVZpVZp1(6,6)

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
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, conj[Se], conj[Se]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhSecSe(i1,gt2,i3)
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


! {Cha, bar[Fv], bar[Fv]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChaFvcSeL(i1,i2,gt1)
coup1R = cplChaFvcSeR(i1,i2,gt1)
coup2L = cplcChacFvSeL(i1,i3,gt2)
coup2R = cplcChacFvSeR(i1,i3,gt2)
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


! {Chi, bar[Fe], bar[Fe]}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFecSeL(i1,i2,gt1)
coup1R = cplChiFecSeR(i1,i2,gt1)
coup2L = cplcFeChiSeL(i3,i1,gt2)
coup2R = cplcFeChiSeR(i3,i1,gt2)
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


! {Fe, Chi, Chi}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = cplcFeChiSeL(i1,i3,gt2)
coup2R = cplcFeChiSeR(i1,i3,gt2)
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


! {Fv, bar[Cha], bar[Cha]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplChaFvcSeL(i2,i1,gt1)
coup1R = cplChaFvcSeR(i2,i1,gt1)
coup2L = cplcChacFvSeL(i3,i1,gt2)
coup2R = cplcChacFvSeR(i3,i1,gt2)
coup3L = cplcChaChahhL(i2,i3,gt3)
coup3R = cplcChaChahhR(i2,i3,gt3)
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


! {hh, conj[Se], conj[Se]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhSecSe(i1,gt2,i3)
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


! {Hpm, conj[Sv], conj[Sv]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplHpmSvcSe(i1,i2,gt1)
coup2 = cplSecHpmcSv(gt2,i1,i3)
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


! {Se, Ah, Ah}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = cplAhSecSe(i3,gt2,i1)
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


! {Se, hh, Ah}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplAhSecSe(i3,gt2,i1)
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


! {Se, VZ, Ah}
Do i1=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1 = cplSecSeVZ(i1,gt1)
coup2 = cplAhSecSe(i3,gt2,i1)
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


! {Se, VZp, Ah}
Do i1=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MVZp 
ML3 = MAh(i3) 
coup1 = cplSecSeVZp(i1,gt1)
coup2 = cplAhSecSe(i3,gt2,i1)
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


! {Se, Ah, hh}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
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


! {Se, hh, hh}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
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


! {Se, Ah, VZ}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = MVZ 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = -cplSecSeVZ(gt2,i1)
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


! {Se, VZ, VZ}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplSecSeVZ(i1,gt1)
coup2 = -cplSecSeVZ(gt2,i1)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Se, VZp, VZ}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZp 
ML3 = MVZ 
coup1 = cplSecSeVZp(i1,gt1)
coup2 = -cplSecSeVZ(gt2,i1)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Se, Ah, VZp}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = MVZp 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = -cplSecSeVZp(gt2,i1)
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


! {Se, VZ, VZp}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = MVZp 
coup1 = cplSecSeVZ(i1,gt1)
coup2 = -cplSecSeVZp(gt2,i1)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Se, VZp, VZp}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZp 
ML3 = MVZp 
coup1 = cplSecSeVZp(i1,gt1)
coup2 = -cplSecSeVZp(gt2,i1)
coup3 = cplhhVZpVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Sv, conj[Hpm], conj[Hpm]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSv(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSvcSe(i2,i1,gt1)
coup2 = cplSecHpmcSv(gt2,i3,i1)
coup3 = cplhhHpmcHpm(gt3,i3,i2)
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


! {Sv, conj[VWm], conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSv(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSvcSeVWm(i1,gt1)
coup2 = cplSecHpmcSv(gt2,i3,i1)
coup3 = cplhhHpmcVWm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sv, conj[Hpm], conj[VWm]}
Do i1=1,6
  Do i2=1,2
ML1 = MSv(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSvcSe(i2,i1,gt1)
coup2 = -cplSecSvcVWm(gt2,i1)
coup3 = cplhhcHpmVWm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sv, conj[VWm], conj[VWm]}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSvcSeVWm(i1,gt1)
coup2 = -cplSecSvcVWm(gt2,i1)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VP, conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVP(i2,gt1)
coup2 = -cplSecSeVP(gt2,i3)
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


! {VWm, conj[Sv], conj[Sv]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplSvcSeVWm(i2,gt1)
coup2 = -cplSecSvcVWm(gt2,i3)
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


! {VZ, conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVZ(i2,gt1)
coup2 = -cplSecSeVZ(gt2,i3)
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


! {VZp, conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVZp(i2,gt1)
coup2 = -cplSecSeVZp(gt2,i3)
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


! {Ah, conj[Se]}
Do i1=1,6
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhhhSecSe1(i1,gt3,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, conj[Se]}
Do i1=1,6
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhhhSecSe1(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hpm, conj[Sv]}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSv(i2) 
coup1 = cplHpmSvcSe(i1,i2,gt1)
coup2 = cplhhSecHpmcSv1(gt3,gt2,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, conj[Se]}
Do i1=1,6
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
coup1 = cplAhhhSecSe1(i1,gt3,i2,gt1)
coup2 = cplAhSecSe(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplhhhhSecSe1(gt3,i1,i2,gt1)
coup2 = cplhhSecSe(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplhhHpmSvcSe1(gt3,i1,i2,gt1)
coup2 = cplSecHpmcSv(gt2,i1,i2)
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
coup1 = cplAhAhSecSe1(i1,i2,gt2,gt1)
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
coup1 = cplAhhhSecSe1(i1,i2,gt2,gt1)
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
coup1 = cplhhhhSecSe1(i1,i2,gt2,gt1)
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
coup1 = cplHpmSecHpmcSe1(i1,gt2,i2,gt1)
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
coup1 = cplSdSecSdcSeaa(i1,gt2,i2,gt1)
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
coup1 = cplSeSecSecSe1(gt2,i1,gt1,i2)
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
coup1 = cplSeSucSecSuaa(gt2,i1,gt1,i2)
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
coup1 = cplSeSvcSecSv1(gt2,i1,gt1,i2)
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
coup1 = cplSecSecVWmVWm1(gt2,gt1)
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
coup1 = cplSecSeVZVZ1(gt2,gt1)
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
coup1 = cplSecSeVZVZp1(gt2,gt1)
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
coup1 = cplSecSeVZpVZp1(gt2,gt1)
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
End Subroutine Amplitude_VERTEX_sec_UMSSM_SeToSehh


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SeToSehh(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,            & 
& MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,cplAhhhhh,cplAhhhVZ,         & 
& cplAhhhVZp,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,           & 
& cplChiChihhL,cplChiChihhR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFvFvhhL,cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,   & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,    & 
& cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,cplSvcSeVWm,cplAhAhSecSe1,cplAhhhSecSe1,       & 
& cplhhhhSecSe1,cplhhHpmSvcSe1,cplhhSecHpmcSv1,cplHpmSecHpmcSe1,cplSdSecSdcSeaa,         & 
& cplSeSecSecSe1,cplSeSucSecSuaa,cplSeSvcSecSv1,cplSecSecVWmVWm1,cplSecSeVZVZ1,          & 
& cplSecSeVZVZp1,cplSecSeVZpVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),            & 
& MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(6,6,6),cplAhhhhh(6,6,6),cplAhhhVZ(6,6),cplAhhhVZp(6,6),cplAhSecSe(6,6,6),   & 
& cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),     & 
& cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),       & 
& cplcFeChiSeL(3,9,6),cplcFeChiSeR(3,9,6),cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),         & 
& cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),cplhhhhhh(6,6,6),cplhhHpmcHpm(6,2,2),            & 
& cplhhHpmcVWm(6,2),cplhhSdcSd(6,6,6),cplhhSecSe(6,6,6),cplhhSucSu(6,6,6),               & 
& cplhhSvcSv(6,6,6),cplhhcHpmVWm(6,2),cplhhcVWmVWm(6),cplhhVZVZ(6),cplhhVZVZp(6),        & 
& cplhhVZpVZp(6),cplHpmSvcSe(2,6,6),cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),    & 
& cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),       & 
& cplSvcSeVWm(6,6),cplAhAhSecSe1(6,6,6,6),cplAhhhSecSe1(6,6,6,6),cplhhhhSecSe1(6,6,6,6), & 
& cplhhHpmSvcSe1(6,2,6,6),cplhhSecHpmcSv1(6,6,2,6),cplHpmSecHpmcSe1(2,6,2,6),            & 
& cplSdSecSdcSeaa(6,6,6,6),cplSeSecSecSe1(6,6,6,6),cplSeSucSecSuaa(6,6,6,6),             & 
& cplSeSvcSecSv1(6,6,6,6),cplSecSecVWmVWm1(6,6),cplSecSeVZVZ1(6,6),cplSecSeVZVZp1(6,6),  & 
& cplSecSeVZpVZp1(6,6)

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
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = Mhh(gt3) 


! {VP, conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVP(i2,gt1)
coup2 = -cplSecSeVP(gt2,i3)
coup3 = cplhhSecSe(gt3,i3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SeToSehh


Subroutine Amplitude_Tree_sec_UMSSM_SeToSvHpm(cplHpmSvcSe,MHpm,MSe,MSv,               & 
& MHpm2,MSe2,MSv2,Amp)

Implicit None

Real(dp), Intent(in) :: MHpm(2),MSe(6),MSv(6),MHpm2(2),MSe2(6),MSv2(6)

Complex(dp), Intent(in) :: cplHpmSvcSe(2,6,6)

Complex(dp) :: Amp(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MHpm(gt3) 
! Tree-Level Vertex 
coupT1 = cplHpmSvcSe(gt3,gt2,gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_SeToSvHpm


Subroutine Gamma_Real_sec_UMSSM_SeToSvHpm(MLambda,em,gs,cplHpmSvcSe,MHpm,             & 
& MSe,MSv,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplHpmSvcSe(2,6,6)

Real(dp), Intent(in) :: MHpm(2),MSe(6),MSv(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6,2), GammarealGluon(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
    Do i3=2,2
Coup = cplHpmSvcSe(i3,i2,i1)
Mex1 = MSe(i1)
Mex2 = MSv(i2)
Mex3 = MHpm(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,1._dp,0._dp,1._dp,0._dp,0._dp,1._dp,Coup,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_SeToSvHpm


Subroutine Amplitude_WAVE_sec_UMSSM_SeToSvHpm(cplHpmSvcSe,ctcplHpmSvcSe,              & 
& MHpm,MHpm2,MSe,MSe2,MSv,MSv2,ZfHpm,ZfSe,ZfSv,Amp)

Implicit None

Real(dp), Intent(in) :: MHpm(2),MHpm2(2),MSe(6),MSe2(6),MSv(6),MSv2(6)

Complex(dp), Intent(in) :: cplHpmSvcSe(2,6,6)

Complex(dp), Intent(in) :: ctcplHpmSvcSe(2,6,6)

Complex(dp), Intent(in) :: ZfHpm(2,2),ZfSe(6,6),ZfSv(6,6)

Complex(dp), Intent(out) :: Amp(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MHpm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplHpmSvcSe(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplHpmSvcSe(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSv(i1,gt2)*cplHpmSvcSe(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHpm(i1,gt3)*cplHpmSvcSe(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_SeToSvHpm


Subroutine Amplitude_VERTEX_sec_UMSSM_SeToSvHpm(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,          & 
& MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSecSe,        & 
& cplAhSvcSv,cplChaFvcSeL,cplChaFvcSeR,cplcFeChaSvL,cplcFeChaSvR,cplChiFecSeL,           & 
& cplChiFecSeR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFvChiSvL,cplcFvChiSvR,cplcFeFvHpmL,     & 
& cplcFeFvHpmR,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,cplHpmSucSd,              & 
& cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,cplHpmcHpmVZp,         & 
& cplHpmcVWmVZp,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,    & 
& cplAhHpmSvcSe1,cplhhHpmSvcSe1,cplHpmSecHpmcSe1,cplHpmSvcHpmcSv1,cplSdSvcSecSuaa,       & 
& cplSeSvcSecSv1,cplSvcSeVPVWm1,cplSvcSeVWmVZ1,cplSvcSeVWmVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),            & 
& MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhHpmcHpm(6,2,2),cplAhHpmcVWm(6,2),cplAhSecSe(6,6,6),cplAhSvcSv(6,6,6),            & 
& cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),       & 
& cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),   & 
& cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),cplcFeFvHpmL(3,3,2),cplcFeFvHpmR(3,3,2),       & 
& cplhhHpmcHpm(6,2,2),cplhhHpmcVWm(6,2),cplhhSecSe(6,6,6),cplhhSvcSv(6,6,6),             & 
& cplHpmSucSd(2,6,6),cplHpmSvcSe(2,6,6),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),               & 
& cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),cplSecSeVP(6,6), & 
& cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSvcSeVWm(6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),    & 
& cplAhHpmSvcSe1(6,2,6,6),cplhhHpmSvcSe1(6,2,6,6),cplHpmSecHpmcSe1(2,6,2,6),             & 
& cplHpmSvcHpmcSv1(2,6,2,6),cplSdSvcSecSuaa(6,6,6,6),cplSeSvcSecSv1(6,6,6,6),            & 
& cplSvcSeVPVWm1(6,6),cplSvcSeVWmVZ1(6,6),cplSvcSeVWmVZp1(6,6)

Complex(dp), Intent(out) :: Amp(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MHpm(gt3) 


! {Ah, conj[Se], conj[Sv]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MSv(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhSvcSv(i1,gt2,i3)
coup3 = cplHpmSvcSe(gt3,i3,i2)
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


! {Chi, bar[Fe], bar[Fv]}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFecSeL(i1,i2,gt1)
coup1R = cplChiFecSeR(i1,i2,gt1)
coup2L = cplcFvChiSvL(i3,i1,gt2)
coup2R = cplcFvChiSvR(i3,i1,gt2)
coup3L = cplcFeFvHpmL(i2,i3,gt3)
coup3R = cplcFeFvHpmR(i2,i3,gt3)
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


! {Fe, Chi, Cha}
Do i1=1,3
  Do i2=1,9
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = cplcFeChaSvL(i1,i3,gt2)
coup2R = cplcFeChaSvR(i1,i3,gt2)
coup3L = cplcChaChiHpmL(i3,i2,gt3)
coup3R = cplcChaChiHpmR(i3,i2,gt3)
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


! {Fv, bar[Cha], Chi}
Do i1=1,3
  Do i2=1,2
    Do i3=1,9
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplChaFvcSeL(i2,i1,gt1)
coup1R = cplChaFvcSeR(i2,i1,gt1)
coup2L = cplcFvChiSvL(i1,i3,gt2)
coup2R = cplcFvChiSvR(i1,i3,gt2)
coup3L = cplcChaChiHpmL(i2,i3,gt3)
coup3R = cplcChaChiHpmR(i2,i3,gt3)
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


! {hh, conj[Se], conj[Sv]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MSv(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhSvcSv(i1,gt2,i3)
coup3 = cplHpmSvcSe(gt3,i3,i2)
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


! {Se, Ah, Hpm}
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = cplHpmSvcSe(i3,gt2,i1)
coup3 = cplAhHpmcHpm(i2,gt3,i3)
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


! {Se, hh, Hpm}
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplHpmSvcSe(i3,gt2,i1)
coup3 = cplhhHpmcHpm(i2,gt3,i3)
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


! {Se, VP, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1 = cplSecSeVP(i1,gt1)
coup2 = cplHpmSvcSe(i3,gt2,i1)
coup3 = cplHpmcHpmVP(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Se, VZ, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1 = cplSecSeVZ(i1,gt1)
coup2 = cplHpmSvcSe(i3,gt2,i1)
coup3 = cplHpmcHpmVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Se, VZp, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVZp 
ML3 = MHpm(i3) 
coup1 = cplSecSeVZp(i1,gt1)
coup2 = cplHpmSvcSe(i3,gt2,i1)
coup3 = cplHpmcHpmVZp(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Se, Ah, VWm}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = MVWm 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = -cplSvcSeVWm(gt2,i1)
coup3 = -cplAhHpmcVWm(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Se, hh, VWm}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = -cplSvcSeVWm(gt2,i1)
coup3 = -cplhhHpmcVWm(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Se, VP, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplSecSeVP(i1,gt1)
coup2 = -cplSvcSeVWm(gt2,i1)
coup3 = cplHpmcVWmVP(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Se, VZ, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplSecSeVZ(i1,gt1)
coup2 = -cplSvcSeVWm(gt2,i1)
coup3 = cplHpmcVWmVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Se, VZp, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZp 
ML3 = MVWm 
coup1 = cplSecSeVZp(i1,gt1)
coup2 = -cplSvcSeVWm(gt2,i1)
coup3 = cplHpmcVWmVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Sv, conj[Hpm], Ah}
Do i1=1,6
  Do i2=1,2
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplHpmSvcSe(i2,i1,gt1)
coup2 = cplAhSvcSv(i3,gt2,i1)
coup3 = cplAhHpmcHpm(i3,gt3,i2)
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


! {Sv, conj[VWm], Ah}
Do i1=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MVWm 
ML3 = MAh(i3) 
coup1 = cplSvcSeVWm(i1,gt1)
coup2 = cplAhSvcSv(i3,gt2,i1)
coup3 = -cplAhHpmcVWm(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sv, conj[Hpm], hh}
Do i1=1,6
  Do i2=1,2
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplHpmSvcSe(i2,i1,gt1)
coup2 = cplhhSvcSv(i3,gt2,i1)
coup3 = cplhhHpmcHpm(i3,gt3,i2)
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


! {Sv, conj[VWm], hh}
Do i1=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplSvcSeVWm(i1,gt1)
coup2 = cplhhSvcSv(i3,gt2,i1)
coup3 = -cplhhHpmcVWm(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sv, conj[Hpm], VZ}
Do i1=1,6
  Do i2=1,2
ML1 = MSv(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = cplHpmSvcSe(i2,i1,gt1)
coup2 = -cplSvcSvVZ(gt2,i1)
coup3 = cplHpmcHpmVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sv, conj[VWm], VZ}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplSvcSeVWm(i1,gt1)
coup2 = -cplSvcSvVZ(gt2,i1)
coup3 = cplHpmcVWmVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Sv, conj[Hpm], VZp}
Do i1=1,6
  Do i2=1,2
ML1 = MSv(i1) 
ML2 = MHpm(i2) 
ML3 = MVZp 
coup1 = cplHpmSvcSe(i2,i1,gt1)
coup2 = -cplSvcSvVZp(gt2,i1)
coup3 = cplHpmcHpmVZp(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sv, conj[VWm], VZp}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVWm 
ML3 = MVZp 
coup1 = cplSvcSeVWm(i1,gt1)
coup2 = -cplSvcSvVZp(gt2,i1)
coup3 = cplHpmcVWmVZp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VZ, conj[Se], conj[Sv]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSe(i2) 
ML3 = MSv(i3) 
coup1 = cplSecSeVZ(i2,gt1)
coup2 = -cplSvcSvVZ(gt2,i3)
coup3 = cplHpmSvcSe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Se], conj[Sv]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSe(i2) 
ML3 = MSv(i3) 
coup1 = cplSecSeVZp(i2,gt1)
coup2 = -cplSvcSvVZp(gt2,i3)
coup3 = cplHpmSvcSe(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, conj[Se]}
Do i1=1,6
  Do i2=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhHpmSvcSe1(i1,gt3,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, conj[Se]}
Do i1=1,6
  Do i2=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhHpmSvcSe1(i1,gt3,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hpm, conj[Sv]}
Do i1=1,2
  Do i2=1,6
ML1 = MHpm(i1) 
ML2 = MSv(i2) 
coup1 = cplHpmSvcSe(i1,i2,gt1)
coup2 = cplHpmSvcHpmcSv1(gt3,gt2,i1,i2)
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
coup1 = cplAhHpmSvcSe1(i1,gt3,i2,gt1)
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
coup1 = cplhhHpmSvcSe1(i1,gt3,i2,gt1)
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
coup1 = cplHpmSecHpmcSe1(gt3,i1,i2,gt1)
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


! {Ah, conj[Hpm]}
Do i1=1,6
  Do i2=1,2
ML1 = MAh(i1) 
ML2 = MHpm(i2) 
coup1 = cplAhHpmSvcSe1(i1,i2,gt2,gt1)
coup2 = cplAhHpmcHpm(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {hh, conj[Hpm]}
Do i1=1,6
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = MHpm(i2) 
coup1 = cplhhHpmSvcSe1(i1,i2,gt2,gt1)
coup2 = cplhhHpmcHpm(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Sd, Su}
Do i1=1,6
  Do i2=1,6
ML1 = MSd(i1) 
ML2 = MSu(i2) 
coup1 = cplSdSvcSecSuaa(i1,gt2,gt1,i2)
coup2 = cplHpmSucSd(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 

  End Do
End Do


! {Se, Sv}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = MSv(i2) 
coup1 = cplSeSvcSecSv1(i1,gt2,gt1,i2)
coup2 = cplHpmSvcSe(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {VP, conj[VWm]}
ML1 = MVP 
ML2 = MVWm 
coup1 = cplSvcSeVPVWm1(gt2,gt1)
coup2 = cplHpmcVWmVP(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VWm, VZ}
ML1 = MVWm 
ML2 = MVZ 
coup1 = cplSvcSeVWmVZ1(gt2,gt1)
coup2 = cplHpmcVWmVZ(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VWm, VZp}
ML1 = MVWm 
ML2 = MVZp 
coup1 = cplSvcSeVWmVZp1(gt2,gt1)
coup2 = cplHpmcVWmVZp(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_sec_UMSSM_SeToSvHpm


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SeToSvHpm(MAh,MCha,MChi,MFe,MFv,             & 
& Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,            & 
& MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhHpmcHpm,cplAhHpmcVWm,             & 
& cplAhSecSe,cplAhSvcSv,cplChaFvcSeL,cplChaFvcSeR,cplcFeChaSvL,cplcFeChaSvR,             & 
& cplChiFecSeL,cplChiFecSeR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFvChiSvL,cplcFvChiSvR,     & 
& cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSecSe,cplhhSvcSv,             & 
& cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,cplHpmcVWmVZ,           & 
& cplHpmcHpmVZp,cplHpmcVWmVZp,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplSvcSeVWm,             & 
& cplSvcSvVZ,cplSvcSvVZp,cplAhHpmSvcSe1,cplhhHpmSvcSe1,cplHpmSecHpmcSe1,cplHpmSvcHpmcSv1,& 
& cplSdSvcSecSuaa,cplSeSvcSecSv1,cplSvcSeVPVWm1,cplSvcSeVWmVZ1,cplSvcSeVWmVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSd(6),MSe(6),MSu(6),             & 
& MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),            & 
& MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhHpmcHpm(6,2,2),cplAhHpmcVWm(6,2),cplAhSecSe(6,6,6),cplAhSvcSv(6,6,6),            & 
& cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),       & 
& cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),   & 
& cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),cplcFeFvHpmL(3,3,2),cplcFeFvHpmR(3,3,2),       & 
& cplhhHpmcHpm(6,2,2),cplhhHpmcVWm(6,2),cplhhSecSe(6,6,6),cplhhSvcSv(6,6,6),             & 
& cplHpmSucSd(2,6,6),cplHpmSvcSe(2,6,6),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),               & 
& cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),cplSecSeVP(6,6), & 
& cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSvcSeVWm(6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),    & 
& cplAhHpmSvcSe1(6,2,6,6),cplhhHpmSvcSe1(6,2,6,6),cplHpmSecHpmcSe1(2,6,2,6),             & 
& cplHpmSvcHpmcSv1(2,6,2,6),cplSdSvcSecSuaa(6,6,6,6),cplSeSvcSecSv1(6,6,6,6),            & 
& cplSvcSeVPVWm1(6,6),cplSvcSeVWmVZ1(6,6),cplSvcSeVWmVZp1(6,6)

Complex(dp), Intent(out) :: Amp(6,6,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,6
  Do gt2=1,6
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MHpm(gt3) 


! {Se, VP, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1 = cplSecSeVP(i1,gt1)
coup2 = cplHpmSvcSe(i3,gt2,i1)
coup3 = cplHpmcHpmVP(gt3,i3)
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Se, VP, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplSecSeVP(i1,gt1)
coup2 = -cplSvcSeVWm(gt2,i1)
coup3 = cplHpmcVWmVP(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VP, conj[VWm]}
ML1 = MVP 
ML2 = MVWm 
coup1 = cplSvcSeVPVWm1(gt2,gt1)
coup2 = cplHpmcVWmVP(gt3)
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SeToSvHpm


Subroutine Amplitude_Tree_sec_UMSSM_SeToSeVZ(cplSecSeVZ,MSe,MVZ,MSe2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MSe(6),MVZ,MSe2(6),MVZ2

Complex(dp), Intent(in) :: cplSecSeVZ(6,6)

Complex(dp) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = -cplSecSeVZ(gt2,gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_SeToSeVZ


Subroutine Gamma_Real_sec_UMSSM_SeToSeVZ(MLambda,em,gs,cplSecSeVZ,MSe,MVZ,            & 
& GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplSecSeVZ(6,6)

Real(dp), Intent(in) :: MSe(6),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
Coup = cplSecSeVZ(i2,i1)
Mex1 = MSe(i1)
Mex2 = MSe(i2)
Mex3 = MVZ
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,-1._dp,-1._dp,0._dp,Coup,Gammarealphoton(i1,i2),kont)
 GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_SeToSeVZ


Subroutine Amplitude_WAVE_sec_UMSSM_SeToSeVZ(cplSecSeVP,cplSecSeVZ,cplSecSeVZp,       & 
& ctcplSecSeVP,ctcplSecSeVZ,ctcplSecSeVZp,MSe,MSe2,MVP,MVP2,MVZ,MVZ2,ZfSe,               & 
& ZfVPVZ,ZfVZ,ZfVZpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MSe(6),MSe2(6),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6)

Complex(dp), Intent(in) :: ctcplSecSeVP(6,6),ctcplSecSeVZ(6,6),ctcplSecSeVZp(6,6)

Complex(dp), Intent(in) :: ZfSe(6,6),ZfVPVZ,ZfVZ,ZfVZpVZ

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
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplSecSeVZ(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplSecSeVZ(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSe(i1,gt2)*cplSecSeVZ(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVPVZ*cplSecSeVP(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplSecSeVZ(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZpVZ*cplSecSeVZp(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_SeToSeVZ


Subroutine Amplitude_VERTEX_sec_UMSSM_SeToSeVZ(MAh,MCha,MChi,MFe,MFv,Mhh,             & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,             & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,       & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZL,cplcFeFeVZR,cplcFvFvVZL,cplcFvFvVZR,             & 
& cplhhSecSe,cplhhVZVZ,cplhhVZVZp,cplHpmSvcSe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSecSeVP,      & 
& cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,          & 
& cplSvcSeVWm,cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSeVPVZ1,cplSecSeVZVZ1,          & 
& cplSecSeVZVZp1,cplSecSvcVWmVZ1,cplSvcSeVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVP,MVWm,           & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVZ(6,6),cplAhSecSe(6,6,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),             & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(9,9),cplChiChiVZR(9,9),             & 
& cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplcFeChiSeL(3,9,6),cplcFeChiSeR(3,9,6),       & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplhhSecSe(6,6,6), & 
& cplhhVZVZ(6),cplhhVZVZp(6),cplHpmSvcSe(2,6,6),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),       & 
& cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),& 
& cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),cplSvcSeVWm(6,6),cplSvcSvVZ(6,6),cplcHpmVWmVZ(2),& 
& cplcVWmVWmVZ,cplSecSeVPVZ1(6,6),cplSecSeVZVZ1(6,6),cplSecSeVZVZp1(6,6),cplSecSvcVWmVZ1(6,6),& 
& cplSvcSeVWmVZ1(6,6)

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
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVZ 


! {Ah, conj[Se], conj[Se]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhSecSe(i1,gt2,i3)
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


! {Cha, bar[Fv], bar[Fv]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChaFvcSeL(i1,i2,gt1)
coup1R = cplChaFvcSeR(i1,i2,gt1)
coup2L = cplcChacFvSeL(i1,i3,gt2)
coup2R = cplcChacFvSeR(i1,i3,gt2)
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


! {Chi, bar[Fe], bar[Fe]}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFecSeL(i1,i2,gt1)
coup1R = cplChiFecSeR(i1,i2,gt1)
coup2L = cplcFeChiSeL(i3,i1,gt2)
coup2R = cplcFeChiSeR(i3,i1,gt2)
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


! {Fe, Chi, Chi}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = cplcFeChiSeL(i1,i3,gt2)
coup2R = cplcFeChiSeR(i1,i3,gt2)
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


! {Fv, bar[Cha], bar[Cha]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplChaFvcSeL(i2,i1,gt1)
coup1R = cplChaFvcSeR(i2,i1,gt1)
coup2L = cplcChacFvSeL(i3,i1,gt2)
coup2R = cplcChacFvSeR(i3,i1,gt2)
coup3L = cplcChaChaVZL(i2,i3)
coup3R = cplcChaChaVZR(i2,i3)
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


! {hh, conj[Se], conj[Se]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhSecSe(i1,gt2,i3)
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


! {Hpm, conj[Sv], conj[Sv]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplHpmSvcSe(i1,i2,gt1)
coup2 = cplSecHpmcSv(gt2,i1,i3)
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


! {Se, hh, Ah}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplAhSecSe(i3,gt2,i1)
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


! {Se, Ah, hh}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
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


! {Se, VZ, hh}
Do i1=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplSecSeVZ(i1,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
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


! {Se, VZp, hh}
Do i1=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplSecSeVZp(i1,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
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


! {Se, hh, VZ}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplSecSeVZ(gt2,i1)
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


! {Se, hh, VZp}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplSecSeVZp(gt2,i1)
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


! {Sv, conj[Hpm], conj[Hpm]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSv(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSvcSe(i2,i1,gt1)
coup2 = cplSecHpmcSv(gt2,i3,i1)
coup3 = cplHpmcHpmVZ(i3,i2)
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


! {Sv, conj[VWm], conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSv(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSvcSeVWm(i1,gt1)
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


! {Sv, conj[Hpm], conj[VWm]}
Do i1=1,6
  Do i2=1,2
ML1 = MSv(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSvcSe(i2,i1,gt1)
coup2 = cplSecSvcVWm(gt2,i1)
coup3 = cplcHpmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sv, conj[VWm], conj[VWm]}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSvcSeVWm(i1,gt1)
coup2 = cplSecSvcVWm(gt2,i1)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VP, conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVP(i2,gt1)
coup2 = cplSecSeVP(gt2,i3)
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


! {VWm, conj[Sv], conj[Sv]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplSvcSeVWm(i2,gt1)
coup2 = cplSecSvcVWm(gt2,i3)
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


! {VZ, conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVZ(i2,gt1)
coup2 = cplSecSeVZ(gt2,i3)
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


! {VZp, conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVZp(i2,gt1)
coup2 = cplSecSeVZp(gt2,i3)
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


! {Se, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = -cplSecSeVP(i1,gt1)
coup2 = cplSecSeVPVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VZ}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
coup1 = -cplSecSeVZ(i1,gt1)
coup2 = cplSecSeVZVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VZp}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZp 
coup1 = -cplSecSeVZp(i1,gt1)
coup2 = cplSecSeVZVZp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sv, conj[VWm]}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVWm 
coup1 = -cplSvcSeVWm(i1,gt1)
coup2 = cplSecSvcVWmVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = cplSecSeVPVZ1(i1,gt1)
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
coup1 = cplSecSeVZVZ1(i1,gt1)
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
coup1 = cplSecSeVZVZp1(i1,gt1)
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
coup1 = cplSvcSeVWmVZ1(i1,gt1)
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
End Subroutine Amplitude_VERTEX_sec_UMSSM_SeToSeVZ


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SeToSeVZ(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,              & 
& MSe2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZ,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,cplChiChiVZR,cplChiFecSeL,cplChiFecSeR,       & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZL,cplcFeFeVZR,cplcFvFvVZL,cplcFvFvVZR,             & 
& cplhhSecSe,cplhhVZVZ,cplhhVZVZp,cplHpmSvcSe,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSecSeVP,      & 
& cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,          & 
& cplSvcSeVWm,cplSvcSvVZ,cplcHpmVWmVZ,cplcVWmVWmVZ,cplSecSeVPVZ1,cplSecSeVZVZ1,          & 
& cplSecSeVZVZp1,cplSecSvcVWmVZ1,cplSvcSeVWmVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVP,MVWm,           & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVZ(6,6),cplAhSecSe(6,6,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),             & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(9,9),cplChiChiVZR(9,9),             & 
& cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplcFeChiSeL(3,9,6),cplcFeChiSeR(3,9,6),       & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplhhSecSe(6,6,6), & 
& cplhhVZVZ(6),cplhhVZVZp(6),cplHpmSvcSe(2,6,6),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),       & 
& cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),& 
& cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),cplSvcSeVWm(6,6),cplSvcSvVZ(6,6),cplcHpmVWmVZ(2),& 
& cplcVWmVWmVZ,cplSecSeVPVZ1(6,6),cplSecSeVZVZ1(6,6),cplSecSeVZVZp1(6,6),cplSecSvcVWmVZ1(6,6),& 
& cplSvcSeVWmVZ1(6,6)

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
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVZ 


! {VP, conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVP(i2,gt1)
coup2 = cplSecSeVP(gt2,i3)
coup3 = cplSecSeVZ(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Se, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = -cplSecSeVP(i1,gt1)
coup2 = cplSecSeVPVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = cplSecSeVPVZ1(i1,gt1)
coup2 = cplSecSeVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SeToSeVZ


Subroutine Amplitude_Tree_sec_UMSSM_SeToSeVZp(cplSecSeVZp,MSe,MVZp,MSe2,              & 
& MVZp2,Amp)

Implicit None

Real(dp), Intent(in) :: MSe(6),MVZp,MSe2(6),MVZp2

Complex(dp), Intent(in) :: cplSecSeVZp(6,6)

Complex(dp) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVZp 
! Tree-Level Vertex 
coupT1 = -cplSecSeVZp(gt2,gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_SeToSeVZp


Subroutine Gamma_Real_sec_UMSSM_SeToSeVZp(MLambda,em,gs,cplSecSeVZp,MSe,              & 
& MVZp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplSecSeVZp(6,6)

Real(dp), Intent(in) :: MSe(6),MVZp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
Coup = cplSecSeVZp(i2,i1)
Mex1 = MSe(i1)
Mex2 = MSe(i2)
Mex3 = MVZp
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,-1._dp,-1._dp,0._dp,Coup,Gammarealphoton(i1,i2),kont)
 GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_SeToSeVZp


Subroutine Amplitude_WAVE_sec_UMSSM_SeToSeVZp(cplSecSeVP,cplSecSeVZ,cplSecSeVZp,      & 
& ctcplSecSeVP,ctcplSecSeVZ,ctcplSecSeVZp,MSe,MSe2,MVP,MVP2,MVZp,MVZp2,ZfSe,             & 
& ZfVPVZp,ZfVZp,ZfVZVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MSe(6),MSe2(6),MVP,MVP2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6)

Complex(dp), Intent(in) :: ctcplSecSeVP(6,6),ctcplSecSeVZ(6,6),ctcplSecSeVZp(6,6)

Complex(dp), Intent(in) :: ZfSe(6,6),ZfVPVZp,ZfVZp,ZfVZVZp

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
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVZp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplSecSeVZp(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplSecSeVZp(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSe(i1,gt2)*cplSecSeVZp(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVPVZp*cplSecSeVP(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVZp*cplSecSeVZ(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZp*cplSecSeVZp(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_SeToSeVZp


Subroutine Amplitude_VERTEX_sec_UMSSM_SeToSeVZp(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,            & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,   & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFvFvVZpL,cplcFvFvVZpR,         & 
& cplhhSecSe,cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,            & 
& cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSeVPVZp1,       & 
& cplSecSeVZVZp1,cplSecSeVZpVZp1,cplSecSvcVWmVZp1,cplSvcSeVWmVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVP,MVWm,           & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVZp(6,6),cplAhSecSe(6,6,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),            & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChiVZpL(9,9),cplChiChiVZpR(9,9),         & 
& cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplcFeChiSeL(3,9,6),cplcFeChiSeR(3,9,6),       & 
& cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcFvFvVZpL(3,3),cplcFvFvVZpR(3,3),               & 
& cplhhSecSe(6,6,6),cplhhVZVZp(6),cplhhVZpVZp(6),cplHpmSvcSe(2,6,6),cplHpmcHpmVZp(2,2),  & 
& cplHpmcVWmVZp(2),cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplcChacFvSeL(2,3,6),& 
& cplcChacFvSeR(2,3,6),cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),cplSvcSeVWm(6,6),           & 
& cplSvcSvVZp(6,6),cplcHpmVWmVZp(2),cplcVWmVWmVZp,cplSecSeVPVZp1(6,6),cplSecSeVZVZp1(6,6),& 
& cplSecSeVZpVZp1(6,6),cplSecSvcVWmVZp1(6,6),cplSvcSeVWmVZp1(6,6)

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
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVZp 


! {Ah, conj[Se], conj[Se]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhSecSe(i1,gt2,i3)
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


! {Cha, bar[Fv], bar[Fv]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = MCha(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplChaFvcSeL(i1,i2,gt1)
coup1R = cplChaFvcSeR(i1,i2,gt1)
coup2L = cplcChacFvSeL(i1,i3,gt2)
coup2R = cplcChacFvSeR(i1,i3,gt2)
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


! {Chi, bar[Fe], bar[Fe]}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFecSeL(i1,i2,gt1)
coup1R = cplChiFecSeR(i1,i2,gt1)
coup2L = cplcFeChiSeL(i3,i1,gt2)
coup2R = cplcFeChiSeR(i3,i1,gt2)
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


! {Fe, Chi, Chi}
Do i1=1,3
  Do i2=1,9
    Do i3=1,9
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = cplcFeChiSeL(i1,i3,gt2)
coup2R = cplcFeChiSeR(i1,i3,gt2)
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


! {Fv, bar[Cha], bar[Cha]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplChaFvcSeL(i2,i1,gt1)
coup1R = cplChaFvcSeR(i2,i1,gt1)
coup2L = cplcChacFvSeL(i3,i1,gt2)
coup2R = cplcChacFvSeR(i3,i1,gt2)
coup3L = cplcChaChaVZpL(i2,i3)
coup3R = cplcChaChaVZpR(i2,i3)
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


! {hh, conj[Se], conj[Se]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhSecSe(i1,gt2,i3)
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


! {Hpm, conj[Sv], conj[Sv]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MHpm(i1) 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplHpmSvcSe(i1,i2,gt1)
coup2 = cplSecHpmcSv(gt2,i1,i3)
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


! {Se, hh, Ah}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplAhSecSe(i3,gt2,i1)
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


! {Se, Ah, hh}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
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


! {Se, VZ, hh}
Do i1=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplSecSeVZ(i1,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
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


! {Se, VZp, hh}
Do i1=1,6
    Do i3=1,6
ML1 = MSe(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1 = cplSecSeVZp(i1,gt1)
coup2 = cplhhSecSe(i3,gt2,i1)
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


! {Se, hh, VZ}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplSecSeVZ(gt2,i1)
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


! {Se, hh, VZp}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplSecSeVZp(gt2,i1)
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


! {Sv, conj[Hpm], conj[Hpm]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSv(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSvcSe(i2,i1,gt1)
coup2 = cplSecHpmcSv(gt2,i3,i1)
coup3 = cplHpmcHpmVZp(i3,i2)
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


! {Sv, conj[VWm], conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSv(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSvcSeVWm(i1,gt1)
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


! {Sv, conj[Hpm], conj[VWm]}
Do i1=1,6
  Do i2=1,2
ML1 = MSv(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSvcSe(i2,i1,gt1)
coup2 = cplSecSvcVWm(gt2,i1)
coup3 = cplcHpmVWmVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sv, conj[VWm], conj[VWm]}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSvcSeVWm(i1,gt1)
coup2 = cplSecSvcVWm(gt2,i1)
coup3 = cplcVWmVWmVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VP, conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVP(i2,gt1)
coup2 = cplSecSeVP(gt2,i3)
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


! {VWm, conj[Sv], conj[Sv]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVWm 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1 = cplSvcSeVWm(i2,gt1)
coup2 = cplSecSvcVWm(gt2,i3)
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


! {VZ, conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVZ(i2,gt1)
coup2 = cplSecSeVZ(gt2,i3)
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


! {VZp, conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVZp(i2,gt1)
coup2 = cplSecSeVZp(gt2,i3)
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


! {Se, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = -cplSecSeVP(i1,gt1)
coup2 = cplSecSeVPVZp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VZ}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
coup1 = -cplSecSeVZ(i1,gt1)
coup2 = cplSecSeVZVZp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VZp}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZp 
coup1 = -cplSecSeVZp(i1,gt1)
coup2 = cplSecSeVZpVZp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sv, conj[VWm]}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVWm 
coup1 = -cplSvcSeVWm(i1,gt1)
coup2 = cplSecSvcVWmVZp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = cplSecSeVPVZp1(i1,gt1)
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
coup1 = cplSecSeVZVZp1(i1,gt1)
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
coup1 = cplSecSeVZpVZp1(i1,gt1)
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
coup1 = cplSvcSeVWmVZp1(i1,gt1)
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
End Subroutine Amplitude_VERTEX_sec_UMSSM_SeToSeVZp


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SeToSeVZp(MAh,MCha,MChi,MFe,MFv,             & 
& Mhh,MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,              & 
& MSe2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhhhVZp,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,       & 
& cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,cplChiChiVZpR,cplChiFecSeL,cplChiFecSeR,   & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVZpL,cplcFeFeVZpR,cplcFvFvVZpL,cplcFvFvVZpR,         & 
& cplhhSecSe,cplhhVZVZp,cplhhVZpVZp,cplHpmSvcSe,cplHpmcHpmVZp,cplHpmcVWmVZp,             & 
& cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,            & 
& cplSecSvcVWm,cplSvcSeVWm,cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSeVPVZp1,       & 
& cplSecSeVZVZp1,cplSecSeVZpVZp1,cplSecSvcVWmVZp1,cplSvcSeVWmVZp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVP,MVWm,           & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhhhVZp(6,6),cplAhSecSe(6,6,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),            & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChiVZpL(9,9),cplChiChiVZpR(9,9),         & 
& cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplcFeChiSeL(3,9,6),cplcFeChiSeR(3,9,6),       & 
& cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcFvFvVZpL(3,3),cplcFvFvVZpR(3,3),               & 
& cplhhSecSe(6,6,6),cplhhVZVZp(6),cplhhVZpVZp(6),cplHpmSvcSe(2,6,6),cplHpmcHpmVZp(2,2),  & 
& cplHpmcVWmVZp(2),cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplcChacFvSeL(2,3,6),& 
& cplcChacFvSeR(2,3,6),cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6),cplSvcSeVWm(6,6),           & 
& cplSvcSvVZp(6,6),cplcHpmVWmVZp(2),cplcVWmVWmVZp,cplSecSeVPVZp1(6,6),cplSecSeVZVZp1(6,6),& 
& cplSecSeVZpVZp1(6,6),cplSecSvcVWmVZp1(6,6),cplSvcSeVWmVZp1(6,6)

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
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVZp 


! {VP, conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVP(i2,gt1)
coup2 = cplSecSeVP(gt2,i3)
coup3 = cplSecSeVZp(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Se, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = -cplSecSeVP(i1,gt1)
coup2 = cplSecSeVPVZp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = cplSecSeVPVZp1(i1,gt1)
coup2 = cplSecSeVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SeToSeVZp


Subroutine Amplitude_Tree_sec_UMSSM_SeToSvVWm(cplSvcSeVWm,MSe,MSv,MVWm,               & 
& MSe2,MSv2,MVWm2,Amp)

Implicit None

Real(dp), Intent(in) :: MSe(6),MSv(6),MVWm,MSe2(6),MSv2(6),MVWm2

Complex(dp), Intent(in) :: cplSvcSeVWm(6,6)

Complex(dp) :: Amp(2,6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,6
  Do gt2=1,6
! External masses 
Mex1 = MSe(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MVWm 
! Tree-Level Vertex 
coupT1 = -cplSvcSeVWm(gt2,gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_SeToSvVWm


Subroutine Gamma_Real_sec_UMSSM_SeToSvVWm(MLambda,em,gs,cplSvcSeVWm,MSe,              & 
& MSv,MVWm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplSvcSeVWm(6,6)

Real(dp), Intent(in) :: MSe(6),MSv(6),MVWm

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(6,6), GammarealGluon(6,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,6
  Do i2=1,6
Coup = cplSvcSeVWm(i2,i1)
Mex1 = MSe(i1)
Mex2 = MSv(i2)
Mex3 = MVWm
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,-1._dp,0._dp,-1._dp,Coup,Gammarealphoton(i1,i2),kont)
 GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_SeToSvVWm


Subroutine Amplitude_WAVE_sec_UMSSM_SeToSvVWm(cplSvcSeVWm,ctcplSvcSeVWm,              & 
& MSe,MSe2,MSv,MSv2,MVWm,MVWm2,ZfSe,ZfSv,ZfVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MSe(6),MSe2(6),MSv(6),MSv2(6),MVWm,MVWm2

Complex(dp), Intent(in) :: cplSvcSeVWm(6,6)

Complex(dp), Intent(in) :: ctcplSvcSeVWm(6,6)

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
Mex1 = MSe(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MVWm 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplSvcSeVWm(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplSvcSeVWm(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSv(i1,gt2)*cplSvcSeVWm(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWm*cplSvcSeVWm(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_SeToSvVWm


Subroutine Amplitude_VERTEX_sec_UMSSM_SeToSvVWm(MAh,MCha,MChi,MFe,MFv,Mhh,            & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSecSe,cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,            & 
& cplChaFvcSeR,cplcFeChaSvL,cplcFeChaSvR,cplChiFecSeL,cplChiFecSeR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,       & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,    & 
& cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,             & 
& cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSecVWmVWm1,cplSvcSeVPVWm1,              & 
& cplSvcSeVWmVZ1,cplSvcSeVWmVZp1,cplSvcSvcVWmVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVP,MVWm,           & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhSecSe(6,6,6),cplAhSvcSv(6,6,6),cplAhcHpmVWm(6,2),cplChaFvcSeL(2,3,6),            & 
& cplChaFvcSeR(2,3,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),cplChiFecSeL(9,3,6),       & 
& cplChiFecSeR(9,3,6),cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),cplcChaChiVWmL(2,9),       & 
& cplcChaChiVWmR(2,9),cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplhhSecSe(6,6,6),             & 
& cplhhSvcSv(6,6,6),cplhhcHpmVWm(6,2),cplhhcVWmVWm(6),cplHpmSvcSe(2,6,6),cplSecSeVP(6,6),& 
& cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSvcSeVWm(6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),    & 
& cplcHpmVPVWm(2),cplcVWmVPVWm,cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplcHpmVWmVZp(2),            & 
& cplcVWmVWmVZp,cplSecSecVWmVWm1(6,6),cplSvcSeVPVWm1(6,6),cplSvcSeVWmVZ1(6,6),           & 
& cplSvcSeVWmVZp1(6,6),cplSvcSvcVWmVWm1(6,6)

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
Mex1 = MSe(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MVWm 


! {Ah, conj[Se], conj[Sv]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MSv(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhSvcSv(i1,gt2,i3)
coup3 = cplSvcSeVWm(i3,i2)
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


! {Chi, bar[Fe], bar[Fv]}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplChiFecSeL(i1,i2,gt1)
coup1R = cplChiFecSeR(i1,i2,gt1)
coup2L = cplcFvChiSvL(i3,i1,gt2)
coup2R = cplcFvChiSvR(i3,i1,gt2)
coup3L = cplcFeFvVWmL(i2,i3)
coup3R = cplcFeFvVWmR(i2,i3)
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


! {Fe, Chi, Cha}
Do i1=1,3
  Do i2=1,9
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplChiFecSeL(i2,i1,gt1)
coup1R = cplChiFecSeR(i2,i1,gt1)
coup2L = cplcFeChaSvL(i1,i3,gt2)
coup2R = cplcFeChaSvR(i1,i3,gt2)
coup3L = -cplcChaChiVWmR(i3,i2)
coup3R = -cplcChaChiVWmL(i3,i2)
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


! {Fv, bar[Cha], Chi}
Do i1=1,3
  Do i2=1,2
    Do i3=1,9
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplChaFvcSeL(i2,i1,gt1)
coup1R = cplChaFvcSeR(i2,i1,gt1)
coup2L = cplcFvChiSvL(i1,i3,gt2)
coup2R = cplcFvChiSvR(i1,i3,gt2)
coup3L = cplcChaChiVWmL(i2,i3)
coup3R = cplcChaChiVWmR(i2,i3)
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


! {hh, conj[Se], conj[Sv]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MSv(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhSvcSv(i1,gt2,i3)
coup3 = cplSvcSeVWm(i3,i2)
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


! {Se, Ah, Hpm}
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1 = cplAhSecSe(i2,i1,gt1)
coup2 = cplHpmSvcSe(i3,gt2,i1)
coup3 = -cplAhcHpmVWm(i2,i3)
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


! {Se, hh, Hpm}
Do i1=1,6
  Do i2=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplHpmSvcSe(i3,gt2,i1)
coup3 = -cplhhcHpmVWm(i2,i3)
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


! {Se, VP, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1 = cplSecSeVP(i1,gt1)
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


! {Se, VZ, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1 = cplSecSeVZ(i1,gt1)
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


! {Se, VZp, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVZp 
ML3 = MHpm(i3) 
coup1 = cplSecSeVZp(i1,gt1)
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


! {Se, hh, VWm}
Do i1=1,6
  Do i2=1,6
ML1 = MSe(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1 = cplhhSecSe(i2,i1,gt1)
coup2 = cplSvcSeVWm(gt2,i1)
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


! {Se, VP, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplSecSeVP(i1,gt1)
coup2 = cplSvcSeVWm(gt2,i1)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VZ, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1 = cplSecSeVZ(i1,gt1)
coup2 = cplSvcSeVWm(gt2,i1)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VZp, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZp 
ML3 = MVWm 
coup1 = cplSecSeVZp(i1,gt1)
coup2 = cplSvcSeVWm(gt2,i1)
coup3 = cplcVWmVWmVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sv, conj[Hpm], Ah}
Do i1=1,6
  Do i2=1,2
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1 = cplHpmSvcSe(i2,i1,gt1)
coup2 = cplAhSvcSv(i3,gt2,i1)
coup3 = cplAhcHpmVWm(i3,i2)
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


! {Sv, conj[Hpm], hh}
Do i1=1,6
  Do i2=1,2
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1 = cplHpmSvcSe(i2,i1,gt1)
coup2 = cplhhSvcSv(i3,gt2,i1)
coup3 = cplhhcHpmVWm(i3,i2)
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


! {Sv, conj[VWm], hh}
Do i1=1,6
    Do i3=1,6
ML1 = MSv(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1 = cplSvcSeVWm(i1,gt1)
coup2 = cplhhSvcSv(i3,gt2,i1)
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


! {Sv, conj[Hpm], VZ}
Do i1=1,6
  Do i2=1,2
ML1 = MSv(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1 = cplHpmSvcSe(i2,i1,gt1)
coup2 = cplSvcSvVZ(gt2,i1)
coup3 = cplcHpmVWmVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sv, conj[VWm], VZ}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1 = cplSvcSeVWm(i1,gt1)
coup2 = cplSvcSvVZ(gt2,i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sv, conj[Hpm], VZp}
Do i1=1,6
  Do i2=1,2
ML1 = MSv(i1) 
ML2 = MHpm(i2) 
ML3 = MVZp 
coup1 = cplHpmSvcSe(i2,i1,gt1)
coup2 = cplSvcSvVZp(gt2,i1)
coup3 = cplcHpmVWmVZp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sv, conj[VWm], VZp}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVWm 
ML3 = MVZp 
coup1 = cplSvcSeVWm(i1,gt1)
coup2 = cplSvcSvVZp(gt2,i1)
coup3 = -cplcVWmVWmVZp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VZ, conj[Se], conj[Sv]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSe(i2) 
ML3 = MSv(i3) 
coup1 = cplSecSeVZ(i2,gt1)
coup2 = cplSvcSvVZ(gt2,i3)
coup3 = cplSvcSeVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, conj[Se], conj[Sv]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSe(i2) 
ML3 = MSv(i3) 
coup1 = cplSecSeVZp(i2,gt1)
coup2 = cplSvcSvVZp(gt2,i3)
coup3 = cplSvcSeVWm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Se, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = -cplSecSeVP(i1,gt1)
coup2 = cplSvcSeVPVWm1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VZ}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
coup1 = -cplSecSeVZ(i1,gt1)
coup2 = cplSvcSeVWmVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VZp}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZp 
coup1 = -cplSecSeVZp(i1,gt1)
coup2 = cplSvcSeVWmVZp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sv, conj[VWm]}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVWm 
coup1 = -cplSvcSeVWm(i1,gt1)
coup2 = cplSvcSvcVWmVWm1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVWm 
coup1 = cplSecSecVWmVWm1(i1,gt1)
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
coup1 = cplSvcSeVWmVZ1(i1,gt1)
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
coup1 = cplSvcSeVWmVZp1(i1,gt1)
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
End Subroutine Amplitude_VERTEX_sec_UMSSM_SeToSvVWm


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SeToSvVWm(MAh,MCha,MChi,MFe,MFv,             & 
& Mhh,MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,              & 
& MSe2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSecSe,cplAhSvcSv,cplAhcHpmVWm,cplChaFvcSeL,       & 
& cplChaFvcSeR,cplcFeChaSvL,cplcFeChaSvR,cplChiFecSeL,cplChiFecSeR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhSecSe,       & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplHpmSvcSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,    & 
& cplSvcSeVWm,cplSvcSvVZ,cplSvcSvVZp,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,             & 
& cplcVWmVWmVZ,cplcHpmVWmVZp,cplcVWmVWmVZp,cplSecSecVWmVWm1,cplSvcSeVPVWm1,              & 
& cplSvcSeVWmVZ1,cplSvcSeVWmVZp1,cplSvcSvcVWmVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVP,MVWm,           & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhSecSe(6,6,6),cplAhSvcSv(6,6,6),cplAhcHpmVWm(6,2),cplChaFvcSeL(2,3,6),            & 
& cplChaFvcSeR(2,3,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),cplChiFecSeL(9,3,6),       & 
& cplChiFecSeR(9,3,6),cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),cplcChaChiVWmL(2,9),       & 
& cplcChaChiVWmR(2,9),cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplhhSecSe(6,6,6),             & 
& cplhhSvcSv(6,6,6),cplhhcHpmVWm(6,2),cplhhcVWmVWm(6),cplHpmSvcSe(2,6,6),cplSecSeVP(6,6),& 
& cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplSvcSeVWm(6,6),cplSvcSvVZ(6,6),cplSvcSvVZp(6,6),    & 
& cplcHpmVPVWm(2),cplcVWmVPVWm,cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplcHpmVWmVZp(2),            & 
& cplcVWmVWmVZp,cplSecSecVWmVWm1(6,6),cplSvcSeVPVWm1(6,6),cplSvcSeVWmVZ1(6,6),           & 
& cplSvcSeVWmVZp1(6,6),cplSvcSvcVWmVWm1(6,6)

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
Mex1 = MSe(gt1) 
Mex2 = MSv(gt2) 
Mex3 = MVWm 


! {Se, VP, Hpm}
Do i1=1,6
    Do i3=1,2
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1 = cplSecSeVP(i1,gt1)
coup2 = cplHpmSvcSe(i3,gt2,i1)
coup3 = cplcHpmVPVWm(i3)
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Se, VP, VWm}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1 = cplSecSeVP(i1,gt1)
coup2 = cplSvcSeVWm(gt2,i1)
coup3 = -cplcVWmVPVWm
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = -cplSecSeVP(i1,gt1)
coup2 = cplSvcSeVPVWm1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SeToSvVWm


Subroutine Amplitude_WAVE_sec_UMSSM_SeToSeVP(cplSecSeVP,cplSecSeVZ,cplSecSeVZp,       & 
& ctcplSecSeVP,ctcplSecSeVZ,ctcplSecSeVZp,MSe,MSe2,MVP,MVP2,ZfSe,ZfVP,ZfVZpVP,           & 
& ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MSe(6),MSe2(6),MVP,MVP2

Complex(dp), Intent(in) :: cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6)

Complex(dp), Intent(in) :: ctcplSecSeVP(6,6),ctcplSecSeVZ(6,6),ctcplSecSeVZp(6,6)

Complex(dp), Intent(in) :: ZfSe(6,6),ZfVP,ZfVZpVP,ZfVZVP

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
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVP 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfSe(i1,gt1))*cplSecSeVP(gt2,i1)
End Do


! External Field 2 
Do i1=1,6
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfSe(i1,gt2)*cplSecSeVP(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVP*cplSecSeVZ(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZpVP*cplSecSeVZp(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_SeToSeVP


Subroutine Amplitude_VERTEX_sec_UMSSM_SeToSeVP(MAh,MCha,MChi,MFe,MFv,Mhh,             & 
& MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,MSe2,             & 
& MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,cplcChaChaVPL,         & 
& cplcChaChaVPR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVPL,         & 
& cplcFeFeVPR,cplhhSecSe,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplSecSeVP,               & 
& cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,          & 
& cplSvcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSecSeVPVP1,cplSecSeVPVZ1,cplSecSeVPVZp1,      & 
& cplSecSvcVWmVP1,cplSvcSeVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVP,MVWm,           & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhSecSe(6,6,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChaVPL(2,2),         & 
& cplcChaChaVPR(2,2),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplcFeChiSeL(3,9,6),        & 
& cplcFeChiSeR(3,9,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplhhSecSe(6,6,6),               & 
& cplHpmSvcSe(2,6,6),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSecSeVP(6,6),cplSecSeVZ(6,6),  & 
& cplSecSeVZp(6,6),cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),cplSecHpmcSv(6,2,6),        & 
& cplSecSvcVWm(6,6),cplSvcSeVWm(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplSecSeVPVP1(6,6),    & 
& cplSecSeVPVZ1(6,6),cplSecSeVPVZp1(6,6),cplSecSvcVWmVP1(6,6),cplSvcSeVPVWm1(6,6)

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
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVP 


! {Ah, conj[Se], conj[Se]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = MAh(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplAhSecSe(i1,i2,gt1)
coup2 = cplAhSecSe(i1,gt2,i3)
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


! {Chi, bar[Fe], bar[Fe]}
Do i1=1,9
  Do i2=1,3
    Do i3=1,3
ML1 = MChi(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplChiFecSeL(i1,i2,gt1)
coup1R = cplChiFecSeR(i1,i2,gt1)
coup2L = cplcFeChiSeL(i3,i1,gt2)
coup2R = cplcFeChiSeR(i3,i1,gt2)
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


! {Fv, bar[Cha], bar[Cha]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFv(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplChaFvcSeL(i2,i1,gt1)
coup1R = cplChaFvcSeR(i2,i1,gt1)
coup2L = cplcChacFvSeL(i3,i1,gt2)
coup2R = cplcChacFvSeR(i3,i1,gt2)
coup3L = cplcChaChaVPL(i2,i3)
coup3R = cplcChaChaVPR(i2,i3)
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


! {hh, conj[Se], conj[Se]}
Do i1=1,6
  Do i2=1,6
    Do i3=1,6
ML1 = Mhh(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplhhSecSe(i1,i2,gt1)
coup2 = cplhhSecSe(i1,gt2,i3)
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


! {Sv, conj[Hpm], conj[Hpm]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MSv(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1 = cplHpmSvcSe(i2,i1,gt1)
coup2 = cplSecHpmcSv(gt2,i3,i1)
coup3 = cplHpmcHpmVP(i3,i2)
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


! {Sv, conj[VWm], conj[Hpm]}
Do i1=1,6
    Do i3=1,2
ML1 = MSv(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1 = cplSvcSeVWm(i1,gt1)
coup2 = cplSecHpmcSv(gt2,i3,i1)
coup3 = cplHpmcVWmVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Sv, conj[Hpm], conj[VWm]}
Do i1=1,6
  Do i2=1,2
ML1 = MSv(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1 = cplHpmSvcSe(i2,i1,gt1)
coup2 = cplSecSvcVWm(gt2,i1)
coup3 = cplcHpmVPVWm(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Sv, conj[VWm], conj[VWm]}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1 = cplSvcSeVWm(i1,gt1)
coup2 = cplSecSvcVWm(gt2,i1)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VP, conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVP(i2,gt1)
coup2 = cplSecSeVP(gt2,i3)
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


! {VZ, conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZ 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVZ(i2,gt1)
coup2 = cplSecSeVZ(gt2,i3)
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


! {VZp, conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVZp 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVZp(i2,gt1)
coup2 = cplSecSeVZp(gt2,i3)
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


! {Se, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = -cplSecSeVP(i1,gt1)
coup2 = cplSecSeVPVP1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VZ}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZ 
coup1 = -cplSecSeVZ(i1,gt1)
coup2 = cplSecSeVPVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VZp}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVZp 
coup1 = -cplSecSeVZp(i1,gt1)
coup2 = cplSecSeVPVZp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Sv, conj[VWm]}
Do i1=1,6
ML1 = MSv(i1) 
ML2 = MVWm 
coup1 = -cplSvcSeVWm(i1,gt1)
coup2 = cplSecSvcVWmVP1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = cplSecSeVPVP1(i1,gt1)
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
coup1 = cplSecSeVPVZ1(i1,gt1)
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
coup1 = cplSecSeVPVZp1(i1,gt1)
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
coup1 = cplSvcSeVPVWm1(i1,gt1)
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
End Subroutine Amplitude_VERTEX_sec_UMSSM_SeToSeVP


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SeToSeVP(MAh,MCha,MChi,MFe,MFv,              & 
& Mhh,MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,              & 
& MSe2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhSecSe,cplChaFvcSeL,cplChaFvcSeR,cplcChaChaVPL,    & 
& cplcChaChaVPR,cplChiFecSeL,cplChiFecSeR,cplcFeChiSeL,cplcFeChiSeR,cplcFeFeVPL,         & 
& cplcFeFeVPR,cplhhSecSe,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplSecSeVP,               & 
& cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,          & 
& cplSvcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplSecSeVPVP1,cplSecSeVPVZ1,cplSecSeVPVZp1,      & 
& cplSecSvcVWmVP1,cplSvcSeVPVWm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVP,MVWm,           & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhSecSe(6,6,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChaVPL(2,2),         & 
& cplcChaChaVPR(2,2),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplcFeChiSeL(3,9,6),        & 
& cplcFeChiSeR(3,9,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplhhSecSe(6,6,6),               & 
& cplHpmSvcSe(2,6,6),cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSecSeVP(6,6),cplSecSeVZ(6,6),  & 
& cplSecSeVZp(6,6),cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),cplSecHpmcSv(6,2,6),        & 
& cplSecSvcVWm(6,6),cplSvcSeVWm(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,cplSecSeVPVP1(6,6),    & 
& cplSecSeVPVZ1(6,6),cplSecSeVPVZp1(6,6),cplSecSvcVWmVP1(6,6),cplSvcSeVPVWm1(6,6)

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
Mex1 = MSe(gt1) 
Mex2 = MSe(gt2) 
Mex3 = MVP 


! {VP, conj[Se], conj[Se]}
  Do i2=1,6
    Do i3=1,6
ML1 = MVP 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1 = cplSecSeVP(i2,gt1)
coup2 = cplSecSeVP(gt2,i3)
coup3 = cplSecSeVP(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Se, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = -cplSecSeVP(i1,gt1)
coup2 = cplSecSeVPVP1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Se, VP}
Do i1=1,6
ML1 = MSe(i1) 
ML2 = MVP 
coup1 = cplSecSeVPVP1(i1,gt1)
coup2 = cplSecSeVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_SeToSeVP



End Module OneLoopDecay_Se_sec_UMSSM
