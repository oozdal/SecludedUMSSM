! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 1:10 on 7.11.2019   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_Cha_sec_UMSSM
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

Subroutine Amplitude_Tree_sec_UMSSM_ChaToChaAh(cplcChaChaAhL,cplcChaChaAhR,           & 
& MAh,MCha,MAh2,MCha2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MAh2(6),MCha2(2)

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6)

Complex(dp) :: Amp(2,2,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MAh(gt3) 
! Tree-Level Vertex 
coupT1L = cplcChaChaAhL(gt1,gt2,gt3)
coupT1R = cplcChaChaAhR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_ChaToChaAh


Subroutine Gamma_Real_sec_UMSSM_ChaToChaAh(MLambda,em,gs,cplcChaChaAhL,               & 
& cplcChaChaAhR,MAh,MCha,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6)

Real(dp), Intent(in) :: MAh(6),MCha(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,2,6), GammarealGluon(2,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,2
    Do i3=3,6
CoupL = cplcChaChaAhL(i1,i2,i3)
CoupR = cplcChaChaAhR(i1,i2,i3)
Mex1 = MCha(i1)
Mex2 = MCha(i2)
Mex3 = MAh(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_ChaToChaAh


Subroutine Amplitude_WAVE_sec_UMSSM_ChaToChaAh(cplcChaChaAhL,cplcChaChaAhR,           & 
& ctcplcChaChaAhL,ctcplcChaChaAhR,MAh,MAh2,MCha,MCha2,ZfAh,ZfLm,ZfLp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MAh2(6),MCha(2),MCha2(2)

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6)

Complex(dp), Intent(in) :: ctcplcChaChaAhL(2,2,6),ctcplcChaChaAhR(2,2,6)

Complex(dp), Intent(in) :: ZfAh(6,6),ZfLm(2,2),ZfLp(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MAh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaChaAhL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcChaChaAhR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLp(i1,gt1)*cplcChaChaAhL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChaChaAhR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLm(i1,gt2)*cplcChaChaAhL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLp(i1,gt2))*cplcChaChaAhR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfAh(i1,gt3)*cplcChaChaAhL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfAh(i1,gt3)*cplcChaChaAhR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_ChaToChaAh


Subroutine Amplitude_VERTEX_sec_UMSSM_ChaToChaAh(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,         & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,               & 
& cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,           & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,       & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,             & 
& cplcChaFdcSuR,cplcChaFecSvL,cplcChaFecSvR,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,   & 
& cplcChacFvSeR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFd(3),MFe(3),MFu(3),MFv(3),Mhh(6),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFd2(3),              & 
& MFe2(3),MFu2(3),MFv2(3),Mhh2(6),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),              & 
& MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhAh(6,6,6),cplAhAhhh(6,6,6),cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),          & 
& cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),cplcFdFdAhL(3,3,6),cplcFdFdAhR(3,3,6),         & 
& cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6),cplcFuFuAhL(3,3,6),cplcFuFuAhR(3,3,6),           & 
& cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),cplAhhhhh(6,6,6),cplAhhhVZ(6,6),cplAhhhVZp(6,6), & 
& cplAhHpmcHpm(6,2,2),cplAhHpmcVWm(6,2),cplAhSdcSd(6,6,6),cplAhSecSe(6,6,6),             & 
& cplAhSucSu(6,6,6),cplAhSvcSv(6,6,6),cplAhcHpmVWm(6,2),cplChiChacHpmL(9,2,2),           & 
& cplChiChacHpmR(9,2,2),cplChiChacVWmL(9,2),cplChiChacVWmR(9,2),cplChaFucSdL(2,3,6),     & 
& cplChaFucSdR(2,3,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChahhL(2,2,6),      & 
& cplcChaChahhR(2,2,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvL(3,2,6),      & 
& cplcFeChaSvR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),          & 
& cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcChaChiHpmL(2,9,2),      & 
& cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9),cplcChaFdcSuL(2,3,6),    & 
& cplcChaFdcSuR(2,3,6),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcChacFuSdL(2,3,6),   & 
& cplcChacFuSdR(2,3,6),cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6)

Complex(dp), Intent(out) :: Amp(2,2,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MAh(gt3) 


! {Ah, bar[Cha], bar[Cha]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplcChaChaAhL(i3,gt2,i1)
coup2R = cplcChaChaAhR(i3,gt2,i1)
coup3L = cplcChaChaAhL(i2,i3,gt3)
coup3R = cplcChaChaAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, Ah}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
coup3 = cplAhAhAh(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, Ah}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
coup3 = cplAhAhhh(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, hh}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplAhAhhh(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, hh}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplAhhhhh(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VZ, hh}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = -cplAhhhVZ(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, hh}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = -cplAhhhVZp(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, hh, VZ}
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = -cplcChaChaVZR(i1,gt2)
coup2R = -cplcChaChaVZL(i1,gt2)
coup3 = -cplAhhhVZ(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, hh, VZp}
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = -cplcChaChaVZpR(i1,gt2)
coup2R = -cplcChaChaVZpL(i1,gt2)
coup3 = -cplAhhhVZp(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[Hpm], conj[Hpm]}
Do i1=1,9
  Do i2=1,2
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplAhHpmcHpm(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], conj[Hpm]}
Do i1=1,9
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = -cplAhHpmcVWm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], conj[VWm]}
Do i1=1,9
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = -cplChiChacVWmR(i1,gt2)
coup2R = -cplChiChacVWmL(i1,gt2)
coup3 = -cplAhcHpmVWm(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, Su, Su}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = cplcFdChaSuL(i1,gt2,i3)
coup2R = cplcFdChaSuR(i1,gt2,i3)
coup3 = cplAhSucSu(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Fe, Sv, Sv}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1L = cplcChaFecSvL(gt1,i1,i2)
coup1R = cplcChaFecSvR(gt1,i1,i2)
coup2L = cplcFeChaSvL(i1,gt2,i3)
coup2R = cplcFeChaSvR(i1,gt2,i3)
coup3 = cplAhSvcSv(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, bar[Cha], bar[Cha]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplcChaChahhL(i3,gt2,i1)
coup2R = cplcChaChahhR(i3,gt2,i1)
coup3L = cplcChaChaAhL(i2,i3,gt3)
coup3R = cplcChaChaAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, Chi}
Do i1=1,2
  Do i2=1,9
    Do i3=1,9
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplChiChacHpmL(i3,gt2,i1)
coup2R = cplChiChacHpmR(i3,gt2,i1)
coup3L = cplChiChiAhL(i3,i2,gt3)
coup3R = cplChiChiAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Fu, Fu}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcChacFuSdL(gt1,i2,i1)
coup1R = cplcChacFuSdR(gt1,i2,i1)
coup2L = cplChaFucSdL(gt2,i3,i1)
coup2R = cplChaFucSdR(gt2,i3,i1)
coup3L = cplcFuFuAhL(i3,i2,gt3)
coup3R = cplcFuFuAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Se, Fv, Fv}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplcChacFvSeL(gt1,i2,i1)
coup1R = cplcChacFvSeR(gt1,i2,i1)
coup2L = cplChaFvcSeL(gt2,i3,i1)
coup2R = cplChaFvcSeR(gt2,i3,i1)
coup3L = cplcFvFvAhL(i3,i2,gt3)
coup3R = cplcFvFvAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VP, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = -cplcChaChaVPR(i3,gt2)
coup2R = -cplcChaChaVPL(i3,gt2)
coup3L = cplcChaChaAhL(i2,i3,gt3)
coup3R = cplcChaChaAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Chi, Chi}
  Do i2=1,9
    Do i3=1,9
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = -cplcChaChiVWmR(gt1,i2)
coup1R = -cplcChaChiVWmL(gt1,i2)
coup2L = -cplChiChacVWmR(i3,gt2)
coup2R = -cplChiChacVWmL(i3,gt2)
coup3L = cplChiChiAhL(i3,i2,gt3)
coup3R = cplChiChiAhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = -cplcChaChaVZR(gt1,i2)
coup1R = -cplcChaChaVZL(gt1,i2)
coup2L = -cplcChaChaVZR(i3,gt2)
coup2R = -cplcChaChaVZL(i3,gt2)
coup3L = cplcChaChaAhL(i2,i3,gt3)
coup3R = cplcChaChaAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = -cplcChaChaVZpR(gt1,i2)
coup1R = -cplcChaChaVZpL(gt1,i2)
coup2L = -cplcChaChaVZpR(i3,gt2)
coup2R = -cplcChaChaVZpL(i3,gt2)
coup3L = cplcChaChaAhL(i2,i3,gt3)
coup3R = cplcChaChaAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fu], conj[Sd], conj[Sd]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplChaFucSdL(gt2,i1,i3)
coup2R = cplChaFucSdR(gt2,i1,i3)
coup3 = cplAhSdcSd(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {bar[Fv], conj[Se], conj[Se]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChacFvSeL(gt1,i1,i2)
coup1R = cplcChacFvSeR(gt1,i1,i2)
coup2L = cplChaFvcSeL(gt2,i1,i3)
coup2R = cplChaFvcSeR(gt2,i1,i3)
coup3 = cplAhSecSe(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Su], bar[Fd], bar[Fd]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaFdcSuL(gt1,i2,i1)
coup1R = cplcChaFdcSuR(gt1,i2,i1)
coup2L = cplcFdChaSuL(i3,gt2,i1)
coup2R = cplcFdChaSuR(i3,gt2,i1)
coup3L = cplcFdFdAhL(i2,i3,gt3)
coup3R = cplcFdFdAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {conj[Sv], bar[Fe], bar[Fe]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSv(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFecSvL(gt1,i2,i1)
coup1R = cplcChaFecSvR(gt1,i2,i1)
coup2L = cplcFeChaSvL(i3,gt2,i1)
coup2R = cplcFeChaSvR(i3,gt2,i1)
coup3L = cplcFeFeAhL(i2,i3,gt3)
coup3R = cplcFeFeAhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Do
End Subroutine Amplitude_VERTEX_sec_UMSSM_ChaToChaAh


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaAh(MAh,MCha,MChi,MFd,MFe,            & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhAh,         & 
& cplAhAhhh,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,           & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,               & 
& cplcFvFvAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplAhHpmcHpm,cplAhHpmcVWm,cplAhSdcSd,       & 
& cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplAhcHpmVWm,cplChiChacHpmL,cplChiChacHpmR,           & 
& cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,     & 
& cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,       & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,             & 
& cplcChaFdcSuR,cplcChaFecSvL,cplcChaFecSvR,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,   & 
& cplcChacFvSeR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFd(3),MFe(3),MFu(3),MFv(3),Mhh(6),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFd2(3),              & 
& MFe2(3),MFu2(3),MFv2(3),Mhh2(6),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),              & 
& MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhAh(6,6,6),cplAhAhhh(6,6,6),cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),          & 
& cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),cplcFdFdAhL(3,3,6),cplcFdFdAhR(3,3,6),         & 
& cplcFeFeAhL(3,3,6),cplcFeFeAhR(3,3,6),cplcFuFuAhL(3,3,6),cplcFuFuAhR(3,3,6),           & 
& cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),cplAhhhhh(6,6,6),cplAhhhVZ(6,6),cplAhhhVZp(6,6), & 
& cplAhHpmcHpm(6,2,2),cplAhHpmcVWm(6,2),cplAhSdcSd(6,6,6),cplAhSecSe(6,6,6),             & 
& cplAhSucSu(6,6,6),cplAhSvcSv(6,6,6),cplAhcHpmVWm(6,2),cplChiChacHpmL(9,2,2),           & 
& cplChiChacHpmR(9,2,2),cplChiChacVWmL(9,2),cplChiChacVWmR(9,2),cplChaFucSdL(2,3,6),     & 
& cplChaFucSdR(2,3,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChahhL(2,2,6),      & 
& cplcChaChahhR(2,2,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvL(3,2,6),      & 
& cplcFeChaSvR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),          & 
& cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcChaChiHpmL(2,9,2),      & 
& cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9),cplcChaFdcSuL(2,3,6),    & 
& cplcChaFdcSuR(2,3,6),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcChacFuSdL(2,3,6),   & 
& cplcChacFuSdR(2,3,6),cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6)

Complex(dp), Intent(out) :: Amp(2,2,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MAh(gt3) 


! {VP, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = -cplcChaChaVPR(i3,gt2)
coup2R = -cplcChaChaVPL(i3,gt2)
coup3L = cplcChaChaAhL(i2,i3,gt3)
coup3R = cplcChaChaAhR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaAh


Subroutine Amplitude_Tree_sec_UMSSM_ChaToChahh(cplcChaChahhL,cplcChaChahhR,           & 
& MCha,Mhh,MCha2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),Mhh(6),MCha2(2),Mhh2(6)

Complex(dp), Intent(in) :: cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6)

Complex(dp) :: Amp(2,2,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1L = cplcChaChahhL(gt1,gt2,gt3)
coupT1R = cplcChaChahhR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_ChaToChahh


Subroutine Gamma_Real_sec_UMSSM_ChaToChahh(MLambda,em,gs,cplcChaChahhL,               & 
& cplcChaChahhR,MCha,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6)

Real(dp), Intent(in) :: MCha(2),Mhh(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,2,6), GammarealGluon(2,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,2
    Do i3=1,6
CoupL = cplcChaChahhL(i1,i2,i3)
CoupR = cplcChaChahhR(i1,i2,i3)
Mex1 = MCha(i1)
Mex2 = MCha(i2)
Mex3 = Mhh(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_ChaToChahh


Subroutine Amplitude_WAVE_sec_UMSSM_ChaToChahh(cplcChaChahhL,cplcChaChahhR,           & 
& ctcplcChaChahhL,ctcplcChaChahhR,MCha,MCha2,Mhh,Mhh2,Zfhh,ZfLm,ZfLp,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),Mhh(6),Mhh2(6)

Complex(dp), Intent(in) :: cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6)

Complex(dp), Intent(in) :: ctcplcChaChahhL(2,2,6),ctcplcChaChahhR(2,2,6)

Complex(dp), Intent(in) :: Zfhh(6,6),ZfLm(2,2),ZfLp(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaChahhL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcChaChahhR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLp(i1,gt1)*cplcChaChahhL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChaChahhR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLm(i1,gt2)*cplcChaChahhL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLp(i1,gt2))*cplcChaChahhR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt3)*cplcChaChahhL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt3)*cplcChaChahhR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_ChaToChahh


Subroutine Amplitude_VERTEX_sec_UMSSM_ChaToChahh(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,         & 
& cplcChaChaAhL,cplcChaChaAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,             & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,       & 
& cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,   & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcChaFecSvL,cplcChaFecSvR,cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,           & 
& cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,      & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFuSdL,   & 
& cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFd(3),MFe(3),MFu(3),MFv(3),Mhh(6),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFd2(3),              & 
& MFe2(3),MFu2(3),MFv2(3),Mhh2(6),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),              & 
& MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(6,6,6),cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplAhhhhh(6,6,6),          & 
& cplAhhhVZ(6,6),cplAhhhVZp(6,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),            & 
& cplChiChacVWmL(9,2),cplChiChacVWmR(9,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),       & 
& cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),     & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),       & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),       & 
& cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9),   & 
& cplcFdFdhhL(3,3,6),cplcFdFdhhR(3,3,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),       & 
& cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),       & 
& cplcFuFuhhL(3,3,6),cplcFuFuhhR(3,3,6),cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),           & 
& cplhhhhhh(6,6,6),cplhhHpmcHpm(6,2,2),cplhhHpmcVWm(6,2),cplhhSdcSd(6,6,6),              & 
& cplhhSecSe(6,6,6),cplhhSucSu(6,6,6),cplhhSvcSv(6,6,6),cplhhcHpmVWm(6,2),               & 
& cplhhcVWmVWm(6),cplhhVZVZ(6),cplhhVZVZp(6),cplhhVZpVZp(6),cplcChacFuSdL(2,3,6),        & 
& cplcChacFuSdR(2,3,6),cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6)

Complex(dp), Intent(out) :: Amp(2,2,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, bar[Cha], bar[Cha]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplcChaChaAhL(i3,gt2,i1)
coup2R = cplcChaChaAhR(i3,gt2,i1)
coup3L = cplcChaChahhL(i2,i3,gt3)
coup3R = cplcChaChahhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, Ah}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
coup3 = cplAhAhhh(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, Ah}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
coup3 = cplAhhhhh(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VZ, Ah}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MAh(i3) 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
coup3 = cplAhhhVZ(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, Ah}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MAh(i3) 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
coup3 = cplAhhhVZp(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, Ah, hh}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplAhhhhh(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, hh}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, VZ}
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MVZ 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = -cplcChaChaVZR(i1,gt2)
coup2R = -cplcChaChaVZL(i1,gt2)
coup3 = cplAhhhVZ(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, VZ, VZ}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MVZ 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = -cplcChaChaVZR(i1,gt2)
coup2R = -cplcChaChaVZL(i1,gt2)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Cha, VZp, VZ}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MVZ 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = -cplcChaChaVZR(i1,gt2)
coup2R = -cplcChaChaVZL(i1,gt2)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Cha, Ah, VZp}
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MVZp 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = -cplcChaChaVZpR(i1,gt2)
coup2R = -cplcChaChaVZpL(i1,gt2)
coup3 = cplAhhhVZp(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, VZ, VZp}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MVZp 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = -cplcChaChaVZpR(i1,gt2)
coup2R = -cplcChaChaVZpL(i1,gt2)
coup3 = cplhhVZVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Cha, VZp, VZp}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MVZp 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = -cplcChaChaVZpR(i1,gt2)
coup2R = -cplcChaChaVZpL(i1,gt2)
coup3 = cplhhVZpVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, conj[Hpm], conj[Hpm]}
Do i1=1,9
  Do i2=1,2
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplhhHpmcHpm(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], conj[Hpm]}
Do i1=1,9
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = -cplhhHpmcVWm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], conj[VWm]}
Do i1=1,9
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = -cplChiChacVWmR(i1,gt2)
coup2R = -cplChiChacVWmL(i1,gt2)
coup3 = -cplhhcHpmVWm(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[VWm], conj[VWm]}
Do i1=1,9
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = -cplChiChacVWmR(i1,gt2)
coup2R = -cplChiChacVWmL(i1,gt2)
coup3 = cplhhcVWmVWm(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, Su, Su}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = cplcFdChaSuL(i1,gt2,i3)
coup2R = cplcFdChaSuR(i1,gt2,i3)
coup3 = cplhhSucSu(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Fe, Sv, Sv}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1L = cplcChaFecSvL(gt1,i1,i2)
coup1R = cplcChaFecSvR(gt1,i1,i2)
coup2L = cplcFeChaSvL(i1,gt2,i3)
coup2R = cplcFeChaSvR(i1,gt2,i3)
coup3 = cplhhSvcSv(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, bar[Cha], bar[Cha]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplcChaChahhL(i3,gt2,i1)
coup2R = cplcChaChahhR(i3,gt2,i1)
coup3L = cplcChaChahhL(i2,i3,gt3)
coup3R = cplcChaChahhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, Chi}
Do i1=1,2
  Do i2=1,9
    Do i3=1,9
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplChiChacHpmL(i3,gt2,i1)
coup2R = cplChiChacHpmR(i3,gt2,i1)
coup3L = cplChiChihhL(i3,i2,gt3)
coup3R = cplChiChihhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Fu, Fu}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcChacFuSdL(gt1,i2,i1)
coup1R = cplcChacFuSdR(gt1,i2,i1)
coup2L = cplChaFucSdL(gt2,i3,i1)
coup2R = cplChaFucSdR(gt2,i3,i1)
coup3L = cplcFuFuhhL(i3,i2,gt3)
coup3R = cplcFuFuhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Se, Fv, Fv}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplcChacFvSeL(gt1,i2,i1)
coup1R = cplcChacFvSeR(gt1,i2,i1)
coup2L = cplChaFvcSeL(gt2,i3,i1)
coup2R = cplChaFvcSeR(gt2,i3,i1)
coup3L = cplcFvFvhhL(i3,i2,gt3)
coup3R = cplcFvFvhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VP, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = -cplcChaChaVPR(i3,gt2)
coup2R = -cplcChaChaVPL(i3,gt2)
coup3L = cplcChaChahhL(i2,i3,gt3)
coup3R = cplcChaChahhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Chi, Chi}
  Do i2=1,9
    Do i3=1,9
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = -cplcChaChiVWmR(gt1,i2)
coup1R = -cplcChaChiVWmL(gt1,i2)
coup2L = -cplChiChacVWmR(i3,gt2)
coup2R = -cplChiChacVWmL(i3,gt2)
coup3L = cplChiChihhL(i3,i2,gt3)
coup3R = cplChiChihhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = -cplcChaChaVZR(gt1,i2)
coup1R = -cplcChaChaVZL(gt1,i2)
coup2L = -cplcChaChaVZR(i3,gt2)
coup2R = -cplcChaChaVZL(i3,gt2)
coup3L = cplcChaChahhL(i2,i3,gt3)
coup3R = cplcChaChahhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = -cplcChaChaVZpR(gt1,i2)
coup1R = -cplcChaChaVZpL(gt1,i2)
coup2L = -cplcChaChaVZpR(i3,gt2)
coup2R = -cplcChaChaVZpL(i3,gt2)
coup3L = cplcChaChahhL(i2,i3,gt3)
coup3R = cplcChaChahhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fu], conj[Sd], conj[Sd]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplChaFucSdL(gt2,i1,i3)
coup2R = cplChaFucSdR(gt2,i1,i3)
coup3 = cplhhSdcSd(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {bar[Fv], conj[Se], conj[Se]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChacFvSeL(gt1,i1,i2)
coup1R = cplcChacFvSeR(gt1,i1,i2)
coup2L = cplChaFvcSeL(gt2,i1,i3)
coup2R = cplChaFvcSeR(gt2,i1,i3)
coup3 = cplhhSecSe(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Su], bar[Fd], bar[Fd]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaFdcSuL(gt1,i2,i1)
coup1R = cplcChaFdcSuR(gt1,i2,i1)
coup2L = cplcFdChaSuL(i3,gt2,i1)
coup2R = cplcFdChaSuR(i3,gt2,i1)
coup3L = cplcFdFdhhL(i2,i3,gt3)
coup3R = cplcFdFdhhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {conj[Sv], bar[Fe], bar[Fe]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSv(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFecSvL(gt1,i2,i1)
coup1R = cplcChaFecSvR(gt1,i2,i1)
coup2L = cplcFeChaSvL(i3,gt2,i1)
coup2R = cplcFeChaSvR(i3,gt2,i1)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Do
End Subroutine Amplitude_VERTEX_sec_UMSSM_ChaToChahh


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaToChahh(MAh,MCha,MChi,MFd,MFe,            & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplAhAhhh,         & 
& cplcChaChaAhL,cplcChaChaAhR,cplAhhhhh,cplAhhhVZ,cplAhhhVZp,cplChiChacHpmL,             & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,   & 
& cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,       & 
& cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,   & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL, & 
& cplcChaChiVWmR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFehhL,        & 
& cplcFeFehhR,cplcChaFecSvL,cplcChaFecSvR,cplcFuFuhhL,cplcFuFuhhR,cplcFvFvhhL,           & 
& cplcFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,      & 
& cplhhSvcSv,cplhhcHpmVWm,cplhhcVWmVWm,cplhhVZVZ,cplhhVZVZp,cplhhVZpVZp,cplcChacFuSdL,   & 
& cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFd(3),MFe(3),MFu(3),MFv(3),Mhh(6),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFd2(3),              & 
& MFe2(3),MFu2(3),MFv2(3),Mhh2(6),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),              & 
& MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplAhAhhh(6,6,6),cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplAhhhhh(6,6,6),          & 
& cplAhhhVZ(6,6),cplAhhhVZp(6,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),            & 
& cplChiChacVWmL(9,2),cplChiChacVWmR(9,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),       & 
& cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),     & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),       & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),       & 
& cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9),   & 
& cplcFdFdhhL(3,3,6),cplcFdFdhhR(3,3,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),       & 
& cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),       & 
& cplcFuFuhhL(3,3,6),cplcFuFuhhR(3,3,6),cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),           & 
& cplhhhhhh(6,6,6),cplhhHpmcHpm(6,2,2),cplhhHpmcVWm(6,2),cplhhSdcSd(6,6,6),              & 
& cplhhSecSe(6,6,6),cplhhSucSu(6,6,6),cplhhSvcSv(6,6,6),cplhhcHpmVWm(6,2),               & 
& cplhhcVWmVWm(6),cplhhVZVZ(6),cplhhVZVZp(6),cplhhVZpVZp(6),cplcChacFuSdL(2,3,6),        & 
& cplcChacFuSdR(2,3,6),cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6)

Complex(dp), Intent(out) :: Amp(2,2,2,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = Mhh(gt3) 


! {VP, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = -cplcChaChaVPR(i3,gt2)
coup2R = -cplcChaChaVPL(i3,gt2)
coup3L = cplcChaChahhL(i2,i3,gt3)
coup3R = cplcChaChahhR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaToChahh


Subroutine Amplitude_Tree_sec_UMSSM_ChaToChaVZ(cplcChaChaVZL,cplcChaChaVZR,           & 
& MCha,MVZ,MCha2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MVZ,MCha2(2),MVZ2

Complex(dp), Intent(in) :: cplcChaChaVZL(2,2),cplcChaChaVZR(2,2)

Complex(dp) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1L = cplcChaChaVZL(gt1,gt2)
coupT1R = cplcChaChaVZR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_ChaToChaVZ


Subroutine Gamma_Real_sec_UMSSM_ChaToChaVZ(MLambda,em,gs,cplcChaChaVZL,               & 
& cplcChaChaVZR,MCha,MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaChaVZL(2,2),cplcChaChaVZR(2,2)

Real(dp), Intent(in) :: MCha(2),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,2), GammarealGluon(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,2
CoupL = cplcChaChaVZL(i1,i2)
CoupR = cplcChaChaVZR(i1,i2)
Mex1 = MCha(i1)
Mex2 = MCha(i2)
Mex3 = MVZ
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
  Call hardphotonFFZ(Mex1,Mex2,Mex3,MLambda,-1._dp,-1._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_ChaToChaVZ


Subroutine Amplitude_WAVE_sec_UMSSM_ChaToChaVZ(cplcChaChaVPL,cplcChaChaVPR,           & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,ctcplcChaChaVPL,             & 
& ctcplcChaChaVPR,ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChaVZpL,ctcplcChaChaVZpR,     & 
& MCha,MCha2,MVP,MVP2,MVZ,MVZ2,ZfLm,ZfLp,ZfVPVZ,ZfVZ,ZfVZpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),          & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2)

Complex(dp), Intent(in) :: ctcplcChaChaVPL(2,2),ctcplcChaChaVPR(2,2),ctcplcChaChaVZL(2,2),ctcplcChaChaVZR(2,2),  & 
& ctcplcChaChaVZpL(2,2),ctcplcChaChaVZpR(2,2)

Complex(dp), Intent(in) :: ZfLm(2,2),ZfLp(2,2),ZfVPVZ,ZfVZ,ZfVZpVZ

Complex(dp), Intent(out) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaChaVZL(gt1,gt2) 
ZcoupT1R = ctcplcChaChaVZR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChaChaVZL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfLp(i1,gt1)*cplcChaChaVZR(i1,gt2)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLm(i1,gt2)*cplcChaChaVZL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLp(i1,gt2))*cplcChaChaVZR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVPVZ*cplcChaChaVPL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVPVZ*cplcChaChaVPR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZ*cplcChaChaVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZ*cplcChaChaVZR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZpVZ*cplcChaChaVZpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZpVZ*cplcChaChaVZpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_ChaToChaVZ


Subroutine Amplitude_VERTEX_sec_UMSSM_ChaToChaVZ(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,   & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZL,cplChiChiVZR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFecSvL,         & 
& cplcChaFecSvR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplhhVZVZ,               & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,           & 
& cplSecSeVZ,cplcChacFvSeL,cplcChacFvSeR,cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,             & 
& cplcVWmVWmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFd(3),MFe(3),MFu(3),MFv(3),Mhh(6),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFd2(3),              & 
& MFe2(3),MFu2(3),MFv2(3),Mhh2(6),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),              & 
& MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplAhhhVZ(6,6),cplChiChacHpmL(9,2,2),       & 
& cplChiChacHpmR(9,2,2),cplChiChacVWmL(9,2),cplChiChacVWmR(9,2),cplChaFucSdL(2,3,6),     & 
& cplChaFucSdR(2,3,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChahhL(2,2,6),      & 
& cplcChaChahhR(2,2,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvL(3,2,6),      & 
& cplcFeChaSvR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),          & 
& cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChiVZL(9,9),          & 
& cplChiChiVZR(9,9),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),     & 
& cplcChaChiVWmR(2,9),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcChaFdcSuL(2,3,6),            & 
& cplcChaFdcSuR(2,3,6),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcChaFecSvL(2,3,6),           & 
& cplcChaFecSvR(2,3,6),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFvFvVZL(3,3),               & 
& cplcFvFvVZR(3,3),cplhhVZVZ(6),cplhhVZVZp(6),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),         & 
& cplSdcSdVZ(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplSecSeVZ(6,6),             & 
& cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),cplSucSuVZ(6,6),cplSvcSvVZ(6,6),             & 
& cplcHpmVWmVZ(2),cplcVWmVWmVZ

Complex(dp), Intent(out) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVZ 


! {Ah, bar[Cha], bar[Cha]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplcChaChaAhL(i3,gt2,i1)
coup2R = cplcChaChaAhR(i3,gt2,i1)
coup3L = cplcChaChaVZL(i2,i3)
coup3R = cplcChaChaVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, Ah}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
coup3 = cplAhhhVZ(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, hh}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = -cplAhhhVZ(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VZ, hh}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplcChaChaVZL(gt1,i1)
coup1R = cplcChaChaVZR(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, hh}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = cplcChaChaVZpL(gt1,i1)
coup1R = cplcChaChaVZpR(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, hh, VZ}
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaVZL(i1,gt2)
coup2R = cplcChaChaVZR(i1,gt2)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, hh, VZp}
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaVZpL(i1,gt2)
coup2R = cplcChaChaVZpR(i1,gt2)
coup3 = cplhhVZVZp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[Hpm], conj[Hpm]}
Do i1=1,9
  Do i2=1,2
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplHpmcHpmVZ(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], conj[Hpm]}
Do i1=1,9
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = cplcChaChiVWmL(gt1,i1)
coup1R = cplcChaChiVWmR(gt1,i1)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplHpmcVWmVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], conj[VWm]}
Do i1=1,9
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChacVWmL(i1,gt2)
coup2R = cplChiChacVWmR(i1,gt2)
coup3 = cplcHpmVWmVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[VWm], conj[VWm]}
Do i1=1,9
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = cplcChaChiVWmL(gt1,i1)
coup1R = cplcChaChiVWmR(gt1,i1)
coup2L = cplChiChacVWmL(i1,gt2)
coup2R = cplChiChacVWmR(i1,gt2)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, Su, Su}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = cplcFdChaSuL(i1,gt2,i3)
coup2R = cplcFdChaSuR(i1,gt2,i3)
coup3 = -cplSucSuVZ(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Fe, Sv, Sv}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1L = cplcChaFecSvL(gt1,i1,i2)
coup1R = cplcChaFecSvR(gt1,i1,i2)
coup2L = cplcFeChaSvL(i1,gt2,i3)
coup2R = cplcFeChaSvR(i1,gt2,i3)
coup3 = -cplSvcSvVZ(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, bar[Cha], bar[Cha]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplcChaChahhL(i3,gt2,i1)
coup2R = cplcChaChahhR(i3,gt2,i1)
coup3L = cplcChaChaVZL(i2,i3)
coup3R = cplcChaChaVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, Chi}
Do i1=1,2
  Do i2=1,9
    Do i3=1,9
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplChiChacHpmL(i3,gt2,i1)
coup2R = cplChiChacHpmR(i3,gt2,i1)
coup3L = -cplChiChiVZR(i3,i2)
coup3R = -cplChiChiVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Fu, Fu}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcChacFuSdL(gt1,i2,i1)
coup1R = cplcChacFuSdR(gt1,i2,i1)
coup2L = cplChaFucSdL(gt2,i3,i1)
coup2R = cplChaFucSdR(gt2,i3,i1)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Se, Fv, Fv}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplcChacFvSeL(gt1,i2,i1)
coup1R = cplcChacFvSeR(gt1,i2,i1)
coup2L = cplChaFvcSeL(gt2,i3,i1)
coup2R = cplChaFvcSeR(gt2,i3,i1)
coup3L = -cplcFvFvVZR(i3,i2)
coup3R = -cplcFvFvVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VP, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVPL(gt1,i2)
coup1R = cplcChaChaVPR(gt1,i2)
coup2L = cplcChaChaVPL(i3,gt2)
coup2R = cplcChaChaVPR(i3,gt2)
coup3L = cplcChaChaVZL(i2,i3)
coup3R = cplcChaChaVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Chi, Chi}
  Do i2=1,9
    Do i3=1,9
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChiVWmL(gt1,i2)
coup1R = cplcChaChiVWmR(gt1,i2)
coup2L = cplChiChacVWmL(i3,gt2)
coup2R = cplChiChacVWmR(i3,gt2)
coup3L = -cplChiChiVZR(i3,i2)
coup3R = -cplChiChiVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVZL(gt1,i2)
coup1R = cplcChaChaVZR(gt1,i2)
coup2L = cplcChaChaVZL(i3,gt2)
coup2R = cplcChaChaVZR(i3,gt2)
coup3L = cplcChaChaVZL(i2,i3)
coup3R = cplcChaChaVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVZpL(gt1,i2)
coup1R = cplcChaChaVZpR(gt1,i2)
coup2L = cplcChaChaVZpL(i3,gt2)
coup2R = cplcChaChaVZpR(i3,gt2)
coup3L = cplcChaChaVZL(i2,i3)
coup3R = cplcChaChaVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fu], conj[Sd], conj[Sd]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplChaFucSdL(gt2,i1,i3)
coup2R = cplChaFucSdR(gt2,i1,i3)
coup3 = cplSdcSdVZ(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {bar[Fv], conj[Se], conj[Se]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChacFvSeL(gt1,i1,i2)
coup1R = cplcChacFvSeR(gt1,i1,i2)
coup2L = cplChaFvcSeL(gt2,i1,i3)
coup2R = cplChaFvcSeR(gt2,i1,i3)
coup3 = cplSecSeVZ(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Su], bar[Fd], bar[Fd]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaFdcSuL(gt1,i2,i1)
coup1R = cplcChaFdcSuR(gt1,i2,i1)
coup2L = cplcFdChaSuL(i3,gt2,i1)
coup2R = cplcFdChaSuR(i3,gt2,i1)
coup3L = cplcFdFdVZL(i2,i3)
coup3R = cplcFdFdVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {conj[Sv], bar[Fe], bar[Fe]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSv(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFecSvL(gt1,i2,i1)
coup1R = cplcChaFecSvR(gt1,i2,i1)
coup2L = cplcFeChaSvL(i3,gt2,i1)
coup2R = cplcFeChaSvR(i3,gt2,i1)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_sec_UMSSM_ChaToChaVZ


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaVZ(MAh,MCha,MChi,MFd,MFe,            & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplAhhhVZ,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,   & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZL,cplChiChiVZR,   & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFeVZL,cplcFeFeVZR,cplcChaFecSvL,         & 
& cplcChaFecSvR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplhhVZVZ,               & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplcChacFuSdL,cplcChacFuSdR,           & 
& cplSecSeVZ,cplcChacFvSeL,cplcChacFvSeR,cplSucSuVZ,cplSvcSvVZ,cplcHpmVWmVZ,             & 
& cplcVWmVWmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFd(3),MFe(3),MFu(3),MFv(3),Mhh(6),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFd2(3),              & 
& MFe2(3),MFu2(3),MFv2(3),Mhh2(6),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),              & 
& MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplAhhhVZ(6,6),cplChiChacHpmL(9,2,2),       & 
& cplChiChacHpmR(9,2,2),cplChiChacVWmL(9,2),cplChiChacVWmR(9,2),cplChaFucSdL(2,3,6),     & 
& cplChaFucSdR(2,3,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChahhL(2,2,6),      & 
& cplcChaChahhR(2,2,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvL(3,2,6),      & 
& cplcFeChaSvR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),          & 
& cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChiVZL(9,9),          & 
& cplChiChiVZR(9,9),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),     & 
& cplcChaChiVWmR(2,9),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcChaFdcSuL(2,3,6),            & 
& cplcChaFdcSuR(2,3,6),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcChaFecSvL(2,3,6),           & 
& cplcChaFecSvR(2,3,6),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFvFvVZL(3,3),               & 
& cplcFvFvVZR(3,3),cplhhVZVZ(6),cplhhVZVZp(6),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),         & 
& cplSdcSdVZ(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplSecSeVZ(6,6),             & 
& cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),cplSucSuVZ(6,6),cplSvcSvVZ(6,6),             & 
& cplcHpmVWmVZ(2),cplcVWmVWmVZ

Complex(dp), Intent(out) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVZ 


! {VP, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVPL(gt1,i2)
coup1R = cplcChaChaVPR(gt1,i2)
coup2L = cplcChaChaVPL(i3,gt2)
coup2R = cplcChaChaVPR(i3,gt2)
coup3L = cplcChaChaVZL(i2,i3)
coup3R = cplcChaChaVZR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaVZ


Subroutine Amplitude_Tree_sec_UMSSM_ChaToChaVZp(cplcChaChaVZpL,cplcChaChaVZpR,        & 
& MCha,MVZp,MCha2,MVZp2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MVZp,MCha2(2),MVZp2

Complex(dp), Intent(in) :: cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2)

Complex(dp) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVZp 
! Tree-Level Vertex 
coupT1L = cplcChaChaVZpL(gt1,gt2)
coupT1R = cplcChaChaVZpR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_ChaToChaVZp


Subroutine Gamma_Real_sec_UMSSM_ChaToChaVZp(MLambda,em,gs,cplcChaChaVZpL,             & 
& cplcChaChaVZpR,MCha,MVZp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2)

Real(dp), Intent(in) :: MCha(2),MVZp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,2), GammarealGluon(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,2
CoupL = cplcChaChaVZpL(i1,i2)
CoupR = cplcChaChaVZpR(i1,i2)
Mex1 = MCha(i1)
Mex2 = MCha(i2)
Mex3 = MVZp
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
  Call hardphotonFFZ(Mex1,Mex2,Mex3,MLambda,-1._dp,-1._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_ChaToChaVZp


Subroutine Amplitude_WAVE_sec_UMSSM_ChaToChaVZp(cplcChaChaVPL,cplcChaChaVPR,          & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,ctcplcChaChaVPL,             & 
& ctcplcChaChaVPR,ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChaVZpL,ctcplcChaChaVZpR,     & 
& MCha,MCha2,MVP,MVP2,MVZp,MVZp2,ZfLm,ZfLp,ZfVPVZp,ZfVZp,ZfVZVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MVP,MVP2,MVZp,MVZp2

Complex(dp), Intent(in) :: cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),          & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2)

Complex(dp), Intent(in) :: ctcplcChaChaVPL(2,2),ctcplcChaChaVPR(2,2),ctcplcChaChaVZL(2,2),ctcplcChaChaVZR(2,2),  & 
& ctcplcChaChaVZpL(2,2),ctcplcChaChaVZpR(2,2)

Complex(dp), Intent(in) :: ZfLm(2,2),ZfLp(2,2),ZfVPVZp,ZfVZp,ZfVZVZp

Complex(dp), Intent(out) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVZp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaChaVZpL(gt1,gt2) 
ZcoupT1R = ctcplcChaChaVZpR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChaChaVZpL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfLp(i1,gt1)*cplcChaChaVZpR(i1,gt2)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLm(i1,gt2)*cplcChaChaVZpL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLp(i1,gt2))*cplcChaChaVZpR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVPVZp*cplcChaChaVPL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVPVZp*cplcChaChaVPR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZVZp*cplcChaChaVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZVZp*cplcChaChaVZR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZp*cplcChaChaVZpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZp*cplcChaChaVZpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_ChaToChaVZp


Subroutine Amplitude_VERTEX_sec_UMSSM_ChaToChaVZp(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,  & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplChiChiVZpL,               & 
& cplChiChiVZpR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,             & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFeVZpL,cplcFeFeVZpR,       & 
& cplcChaFecSvL,cplcChaFecSvR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvVZpL,cplcFvFvVZpR,       & 
& cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,cplcChacFuSdL,          & 
& cplcChacFuSdR,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSucSuVZp,cplSvcSvVZp,         & 
& cplcHpmVWmVZp,cplcVWmVWmVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFd(3),MFe(3),MFu(3),MFv(3),Mhh(6),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFd2(3),              & 
& MFe2(3),MFu2(3),MFv2(3),Mhh2(6),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),              & 
& MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplAhhhVZp(6,6),cplChiChacHpmL(9,2,2),      & 
& cplChiChacHpmR(9,2,2),cplChiChacVWmL(9,2),cplChiChacVWmR(9,2),cplChaFucSdL(2,3,6),     & 
& cplChaFucSdR(2,3,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChahhL(2,2,6),      & 
& cplcChaChahhR(2,2,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvL(3,2,6),      & 
& cplcFeChaSvR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),          & 
& cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChiVZpL(9,9),         & 
& cplChiChiVZpR(9,9),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),    & 
& cplcChaChiVWmR(2,9),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcChaFdcSuL(2,3,6),          & 
& cplcChaFdcSuR(2,3,6),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcChaFecSvL(2,3,6),         & 
& cplcChaFecSvR(2,3,6),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcFvFvVZpL(3,3),            & 
& cplcFvFvVZpR(3,3),cplhhVZVZp(6),cplhhVZpVZp(6),cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),    & 
& cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplSecSeVZp(6,6),           & 
& cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),cplSucSuVZp(6,6),cplSvcSvVZp(6,6),           & 
& cplcHpmVWmVZp(2),cplcVWmVWmVZp

Complex(dp), Intent(out) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVZp 


! {Ah, bar[Cha], bar[Cha]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplcChaChaAhL(i3,gt2,i1)
coup2R = cplcChaChaAhR(i3,gt2,i1)
coup3L = cplcChaChaVZpL(i2,i3)
coup3R = cplcChaChaVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, Ah}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaAhL(i1,gt2,i3)
coup2R = cplcChaChaAhR(i1,gt2,i3)
coup3 = cplAhhhVZp(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, hh}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = -cplAhhhVZp(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VZ, hh}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplcChaChaVZL(gt1,i1)
coup1R = cplcChaChaVZR(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplhhVZVZp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, hh}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = Mhh(i3) 
coup1L = cplcChaChaVZpL(gt1,i1)
coup1R = cplcChaChaVZpR(gt1,i1)
coup2L = cplcChaChahhL(i1,gt2,i3)
coup2R = cplcChaChahhR(i1,gt2,i3)
coup3 = cplhhVZpVZp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, hh, VZ}
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaVZL(i1,gt2)
coup2R = cplcChaChaVZR(i1,gt2)
coup3 = cplhhVZVZp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, hh, VZp}
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVZp 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChaVZpL(i1,gt2)
coup2R = cplcChaChaVZpR(i1,gt2)
coup3 = cplhhVZpVZp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[Hpm], conj[Hpm]}
Do i1=1,9
  Do i2=1,2
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplHpmcHpmVZp(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], conj[Hpm]}
Do i1=1,9
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = cplcChaChiVWmL(gt1,i1)
coup1R = cplcChaChiVWmR(gt1,i1)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplHpmcVWmVZp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], conj[VWm]}
Do i1=1,9
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChacVWmL(i1,gt2)
coup2R = cplChiChacVWmR(i1,gt2)
coup3 = cplcHpmVWmVZp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[VWm], conj[VWm]}
Do i1=1,9
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = cplcChaChiVWmL(gt1,i1)
coup1R = cplcChaChiVWmR(gt1,i1)
coup2L = cplChiChacVWmL(i1,gt2)
coup2R = cplChiChacVWmR(i1,gt2)
coup3 = cplcVWmVWmVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, Su, Su}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = cplcFdChaSuL(i1,gt2,i3)
coup2R = cplcFdChaSuR(i1,gt2,i3)
coup3 = -cplSucSuVZp(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Fe, Sv, Sv}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSv(i2) 
ML3 = MSv(i3) 
coup1L = cplcChaFecSvL(gt1,i1,i2)
coup1R = cplcChaFecSvR(gt1,i1,i2)
coup2L = cplcFeChaSvL(i1,gt2,i3)
coup2R = cplcFeChaSvR(i1,gt2,i3)
coup3 = -cplSvcSvVZp(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, bar[Cha], bar[Cha]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplcChaChahhL(i3,gt2,i1)
coup2R = cplcChaChahhR(i3,gt2,i1)
coup3L = cplcChaChaVZpL(i2,i3)
coup3R = cplcChaChaVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, Chi}
Do i1=1,2
  Do i2=1,9
    Do i3=1,9
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplChiChacHpmL(i3,gt2,i1)
coup2R = cplChiChacHpmR(i3,gt2,i1)
coup3L = -cplChiChiVZpR(i3,i2)
coup3R = -cplChiChiVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Fu, Fu}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcChacFuSdL(gt1,i2,i1)
coup1R = cplcChacFuSdR(gt1,i2,i1)
coup2L = cplChaFucSdL(gt2,i3,i1)
coup2R = cplChaFucSdR(gt2,i3,i1)
coup3L = -cplcFuFuVZpR(i3,i2)
coup3R = -cplcFuFuVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Se, Fv, Fv}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplcChacFvSeL(gt1,i2,i1)
coup1R = cplcChacFvSeR(gt1,i2,i1)
coup2L = cplChaFvcSeL(gt2,i3,i1)
coup2R = cplChaFvcSeR(gt2,i3,i1)
coup3L = -cplcFvFvVZpR(i3,i2)
coup3R = -cplcFvFvVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VP, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVPL(gt1,i2)
coup1R = cplcChaChaVPR(gt1,i2)
coup2L = cplcChaChaVPL(i3,gt2)
coup2R = cplcChaChaVPR(i3,gt2)
coup3L = cplcChaChaVZpL(i2,i3)
coup3R = cplcChaChaVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Chi, Chi}
  Do i2=1,9
    Do i3=1,9
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChiVWmL(gt1,i2)
coup1R = cplcChaChiVWmR(gt1,i2)
coup2L = cplChiChacVWmL(i3,gt2)
coup2R = cplChiChacVWmR(i3,gt2)
coup3L = -cplChiChiVZpR(i3,i2)
coup3R = -cplChiChiVZpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVZL(gt1,i2)
coup1R = cplcChaChaVZR(gt1,i2)
coup2L = cplcChaChaVZL(i3,gt2)
coup2R = cplcChaChaVZR(i3,gt2)
coup3L = cplcChaChaVZpL(i2,i3)
coup3R = cplcChaChaVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVZpL(gt1,i2)
coup1R = cplcChaChaVZpR(gt1,i2)
coup2L = cplcChaChaVZpL(i3,gt2)
coup2R = cplcChaChaVZpR(i3,gt2)
coup3L = cplcChaChaVZpL(i2,i3)
coup3R = cplcChaChaVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fu], conj[Sd], conj[Sd]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplChaFucSdL(gt2,i1,i3)
coup2R = cplChaFucSdR(gt2,i1,i3)
coup3 = cplSdcSdVZp(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {bar[Fv], conj[Se], conj[Se]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChacFvSeL(gt1,i1,i2)
coup1R = cplcChacFvSeR(gt1,i1,i2)
coup2L = cplChaFvcSeL(gt2,i1,i3)
coup2R = cplChaFvcSeR(gt2,i1,i3)
coup3 = cplSecSeVZp(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Su], bar[Fd], bar[Fd]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaFdcSuL(gt1,i2,i1)
coup1R = cplcChaFdcSuR(gt1,i2,i1)
coup2L = cplcFdChaSuL(i3,gt2,i1)
coup2R = cplcFdChaSuR(i3,gt2,i1)
coup3L = cplcFdFdVZpL(i2,i3)
coup3R = cplcFdFdVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {conj[Sv], bar[Fe], bar[Fe]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSv(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFecSvL(gt1,i2,i1)
coup1R = cplcChaFecSvR(gt1,i2,i1)
coup2L = cplcFeChaSvL(i3,gt2,i1)
coup2R = cplcFeChaSvR(i3,gt2,i1)
coup3L = cplcFeFeVZpL(i2,i3)
coup3R = cplcFeFeVZpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_sec_UMSSM_ChaToChaVZp


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaVZp(MAh,MCha,MChi,MFd,               & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,              & 
& cplcChaChaAhL,cplcChaChaAhR,cplAhhhVZp,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,   & 
& cplChiChacVWmR,cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,      & 
& cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,       & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiChiVZpL,cplChiChiVZpR,cplcChaChiHpmL,cplcChaChiHpmR,cplcChaChiVWmL,              & 
& cplcChaChiVWmR,cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFeFeVZpL,     & 
& cplcFeFeVZpR,cplcChaFecSvL,cplcChaFecSvR,cplcFuFuVZpL,cplcFuFuVZpR,cplcFvFvVZpL,       & 
& cplcFvFvVZpR,cplhhVZVZp,cplhhVZpVZp,cplHpmcHpmVZp,cplHpmcVWmVZp,cplSdcSdVZp,           & 
& cplcChacFuSdL,cplcChacFuSdR,cplSecSeVZp,cplcChacFvSeL,cplcChacFvSeR,cplSucSuVZp,       & 
& cplSvcSvVZp,cplcHpmVWmVZp,cplcVWmVWmVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFd(3),MFe(3),MFu(3),MFv(3),Mhh(6),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFd2(3),              & 
& MFe2(3),MFu2(3),MFv2(3),Mhh2(6),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),              & 
& MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplAhhhVZp(6,6),cplChiChacHpmL(9,2,2),      & 
& cplChiChacHpmR(9,2,2),cplChiChacVWmL(9,2),cplChiChacVWmR(9,2),cplChaFucSdL(2,3,6),     & 
& cplChaFucSdR(2,3,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChahhL(2,2,6),      & 
& cplcChaChahhR(2,2,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvL(3,2,6),      & 
& cplcFeChaSvR(3,2,6),cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),          & 
& cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChiVZpL(9,9),         & 
& cplChiChiVZpR(9,9),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),    & 
& cplcChaChiVWmR(2,9),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcChaFdcSuL(2,3,6),          & 
& cplcChaFdcSuR(2,3,6),cplcFeFeVZpL(3,3),cplcFeFeVZpR(3,3),cplcChaFecSvL(2,3,6),         & 
& cplcChaFecSvR(2,3,6),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcFvFvVZpL(3,3),            & 
& cplcFvFvVZpR(3,3),cplhhVZVZp(6),cplhhVZpVZp(6),cplHpmcHpmVZp(2,2),cplHpmcVWmVZp(2),    & 
& cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplSecSeVZp(6,6),           & 
& cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),cplSucSuVZp(6,6),cplSvcSvVZp(6,6),           & 
& cplcHpmVWmVZp(2),cplcVWmVWmVZp

Complex(dp), Intent(out) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVZp 


! {VP, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVPL(gt1,i2)
coup1R = cplcChaChaVPR(gt1,i2)
coup2L = cplcChaChaVPL(i3,gt2)
coup2R = cplcChaChaVPR(i3,gt2)
coup3L = cplcChaChaVZpL(i2,i3)
coup3R = cplcChaChaVZpR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaVZp


Subroutine Amplitude_Tree_sec_UMSSM_ChaToChiHpm(cplcChaChiHpmL,cplcChaChiHpmR,        & 
& MCha,MChi,MHpm,MCha2,MChi2,MHpm2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MChi(9),MHpm(2),MCha2(2),MChi2(9),MHpm2(2)

Complex(dp), Intent(in) :: cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2)

Complex(dp) :: Amp(2,2,9,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,9
    Do gt3=1,2
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MHpm(gt3) 
! Tree-Level Vertex 
coupT1L = cplcChaChiHpmL(gt1,gt2,gt3)
coupT1R = cplcChaChiHpmR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_ChaToChiHpm


Subroutine Gamma_Real_sec_UMSSM_ChaToChiHpm(MLambda,em,gs,cplcChaChiHpmL,             & 
& cplcChaChiHpmR,MCha,MChi,MHpm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2)

Real(dp), Intent(in) :: MCha(2),MChi(9),MHpm(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,9,2), GammarealGluon(2,9,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,9
    Do i3=2,2
CoupL = cplcChaChiHpmL(i1,i2,i3)
CoupR = cplcChaChiHpmR(i1,i2,i3)
Mex1 = MCha(i1)
Mex2 = MChi(i2)
Mex3 = MHpm(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,0._dp,1._dp,0._dp,0._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_ChaToChiHpm


Subroutine Amplitude_WAVE_sec_UMSSM_ChaToChiHpm(cplcChaChiHpmL,cplcChaChiHpmR,        & 
& ctcplcChaChiHpmL,ctcplcChaChiHpmR,MCha,MCha2,MChi,MChi2,MHpm,MHpm2,ZfHpm,              & 
& ZfL0,ZfLm,ZfLp,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MChi(9),MChi2(9),MHpm(2),MHpm2(2)

Complex(dp), Intent(in) :: cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2)

Complex(dp), Intent(in) :: ctcplcChaChiHpmL(2,9,2),ctcplcChaChiHpmR(2,9,2)

Complex(dp), Intent(in) :: ZfHpm(2,2),ZfL0(9,9),ZfLm(2,2),ZfLp(2,2)

Complex(dp), Intent(out) :: Amp(2,2,9,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,9
    Do gt3=1,2
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MHpm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaChiHpmL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcChaChiHpmR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLp(i1,gt1)*cplcChaChiHpmL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChaChiHpmR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,9
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt2)*cplcChaChiHpmL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt2))*cplcChaChiHpmR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfHpm(i1,gt3)*cplcChaChiHpmL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfHpm(i1,gt3)*cplcChaChiHpmR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_ChaToChiHpm


Subroutine Amplitude_VERTEX_sec_UMSSM_ChaToChiHpm(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,     & 
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
& cplcChacFvSeR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFd(3),MFe(3),MFu(3),MFv(3),Mhh(6),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFd2(3),              & 
& MFe2(3),MFu2(3),MFv2(3),Mhh2(6),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),              & 
& MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),    & 
& cplAhHpmcHpm(6,2,2),cplAhHpmcVWm(6,2),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),     & 
& cplChiChacVWmL(9,2),cplChiChacVWmR(9,2),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),     & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),       & 
& cplChiChiVZL(9,9),cplChiChiVZR(9,9),cplChiChiVZpL(9,9),cplChiChiVZpR(9,9),             & 
& cplChiFdcSdL(9,3,6),cplChiFdcSdR(9,3,6),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),       & 
& cplChiFucSuL(9,3,6),cplChiFucSuR(9,3,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),       & 
& cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcFdChiSdL(3,9,6),cplcFdChiSdR(3,9,6),   & 
& cplcFeChiSeL(3,9,6),cplcFeChiSeR(3,9,6),cplcFuChiSuL(3,9,6),cplcFuChiSuR(3,9,6),       & 
& cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9),       & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),   & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFeFvHpmL(3,3,2),cplcFeFvHpmR(3,3,2),       & 
& cplhhHpmcHpm(6,2,2),cplhhHpmcVWm(6,2),cplHpmSucSd(2,6,6),cplHpmSvcSe(2,6,6),           & 
& cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplHpmcHpmVZp(2,2),& 
& cplHpmcVWmVZp(2),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChacFvSeL(2,3,6),       & 
& cplcChacFvSeR(2,3,6)

Complex(dp), Intent(out) :: Amp(2,2,9,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,9
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MHpm(gt3) 


! {Ah, bar[Cha], Chi}
Do i1=1,6
  Do i2=1,2
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplChiChiAhL(gt2,i3,i1)
coup2R = cplChiChiAhR(gt2,i3,i1)
coup3L = cplcChaChiHpmL(i2,i3,gt3)
coup3R = cplcChaChiHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, Hpm}
Do i1=1,2
  Do i2=1,6
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = cplAhHpmcHpm(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, Hpm}
Do i1=1,2
  Do i2=1,6
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = cplhhHpmcHpm(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VP, Hpm}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = -cplHpmcHpmVP(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZ, Hpm}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = -cplHpmcHpmVZ(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, Hpm}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MHpm(i3) 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = -cplHpmcHpmVZp(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, Ah, VWm}
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MVWm 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = -cplcChaChiVWmR(i1,gt2)
coup2R = -cplcChaChiVWmL(i1,gt2)
coup3 = cplAhHpmcVWm(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, hh, VWm}
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = -cplcChaChiVWmR(i1,gt2)
coup2R = -cplcChaChiVWmL(i1,gt2)
coup3 = cplhhHpmcVWm(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, VP, VWm}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = -cplcChaChiVWmR(i1,gt2)
coup2R = -cplcChaChiVWmL(i1,gt2)
coup3 = cplHpmcVWmVP(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Cha, VZ, VWm}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = -cplcChaChiVWmR(i1,gt2)
coup2R = -cplcChaChiVWmL(i1,gt2)
coup3 = cplHpmcVWmVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Cha, VZp, VWm}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MVWm 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = -cplcChaChiVWmR(i1,gt2)
coup2R = -cplcChaChiVWmL(i1,gt2)
coup3 = cplHpmcVWmVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, conj[Hpm], Ah}
Do i1=1,9
  Do i2=1,2
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
coup3 = cplAhHpmcHpm(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], Ah}
Do i1=1,9
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MAh(i3) 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
coup3 = cplAhHpmcVWm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], hh}
Do i1=1,9
  Do i2=1,2
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
coup3 = cplhhHpmcHpm(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], hh}
Do i1=1,9
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
coup3 = cplhhHpmcVWm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], VZ}
Do i1=1,9
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChiVZL(gt2,i1)
coup2R = cplChiChiVZR(gt2,i1)
coup3 = -cplHpmcHpmVZ(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[VWm], VZ}
Do i1=1,9
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplChiChiVZL(gt2,i1)
coup2R = cplChiChiVZR(gt2,i1)
coup3 = cplHpmcVWmVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Chi, conj[Hpm], VZp}
Do i1=1,9
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVZp 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChiVZpL(gt2,i1)
coup2R = cplChiChiVZpR(gt2,i1)
coup3 = -cplHpmcHpmVZp(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[VWm], VZp}
Do i1=1,9
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MVZp 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplChiChiVZpL(gt2,i1)
coup2R = cplChiChiVZpR(gt2,i1)
coup3 = cplHpmcVWmVZp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, Su, Sd}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MSd(i3) 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = cplcFdChiSdL(i1,gt2,i3)
coup2R = cplcFdChiSdR(i1,gt2,i3)
coup3 = cplHpmSucSd(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Fe, Sv, Se}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSv(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFecSvL(gt1,i1,i2)
coup1R = cplcChaFecSvR(gt1,i1,i2)
coup2L = cplcFeChiSeL(i1,gt2,i3)
coup2R = cplcFeChiSeR(i1,gt2,i3)
coup3 = cplHpmSvcSe(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, bar[Cha], Chi}
Do i1=1,6
  Do i2=1,2
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplChiChihhL(gt2,i3,i1)
coup2R = cplChiChihhR(gt2,i3,i1)
coup3L = cplcChaChiHpmL(i2,i3,gt3)
coup3R = cplcChaChiHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, Cha}
Do i1=1,2
  Do i2=1,9
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplChiChacHpmL(gt2,i3,i1)
coup2R = cplChiChacHpmR(gt2,i3,i1)
coup3L = cplcChaChiHpmL(i3,i2,gt3)
coup3R = cplcChaChiHpmR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Fu, Fd}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcChacFuSdL(gt1,i2,i1)
coup1R = cplcChacFuSdR(gt1,i2,i1)
coup2L = cplChiFdcSdL(gt2,i3,i1)
coup2R = cplChiFdcSdR(gt2,i3,i1)
coup3L = cplcFdFuHpmL(i3,i2,gt3)
coup3R = cplcFdFuHpmR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Se, Fv, Fe}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplcChacFvSeL(gt1,i2,i1)
coup1R = cplcChacFvSeR(gt1,i2,i1)
coup2L = cplChiFecSeL(gt2,i3,i1)
coup2R = cplChiFecSeR(gt2,i3,i1)
coup3L = cplcFeFvHpmL(i3,i2,gt3)
coup3R = cplcFeFvHpmR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VWm, Chi, Cha}
  Do i2=1,9
    Do i3=1,2
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = -cplcChaChiVWmR(gt1,i2)
coup1R = -cplcChaChiVWmL(gt1,i2)
coup2L = cplChiChacVWmL(gt2,i3)
coup2R = cplChiChacVWmR(gt2,i3)
coup3L = cplcChaChiHpmL(i3,i2,gt3)
coup3R = cplcChaChiHpmR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], Chi}
  Do i2=1,2
    Do i3=1,9
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = -cplcChaChaVZR(gt1,i2)
coup1R = -cplcChaChaVZL(gt1,i2)
coup2L = cplChiChiVZL(gt2,i3)
coup2R = cplChiChiVZR(gt2,i3)
coup3L = cplcChaChiHpmL(i2,i3,gt3)
coup3R = cplcChaChiHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], Chi}
  Do i2=1,2
    Do i3=1,9
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = -cplcChaChaVZpR(gt1,i2)
coup1R = -cplcChaChaVZpL(gt1,i2)
coup2L = cplChiChiVZpL(gt2,i3)
coup2R = cplChiChiVZpR(gt2,i3)
coup3L = cplcChaChiHpmL(i2,i3,gt3)
coup3R = cplcChaChiHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fu], conj[Sd], conj[Su]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplChiFucSuL(gt2,i1,i3)
coup2R = cplChiFucSuR(gt2,i1,i3)
coup3 = cplHpmSucSd(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {bar[Fv], conj[Se], conj[Sv]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MSv(i3) 
coup1L = cplcChacFvSeL(gt1,i1,i2)
coup1R = cplcChacFvSeR(gt1,i1,i2)
coup2L = cplChiFvcSvL(gt2,i1,i3)
coup2R = cplChiFvcSvR(gt2,i1,i3)
coup3 = cplHpmSvcSe(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Su], bar[Fd], bar[Fu]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcChaFdcSuL(gt1,i2,i1)
coup1R = cplcChaFdcSuR(gt1,i2,i1)
coup2L = cplcFuChiSuL(i3,gt2,i1)
coup2R = cplcFuChiSuR(i3,gt2,i1)
coup3L = cplcFdFuHpmL(i2,i3,gt3)
coup3R = cplcFdFuHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {conj[Sv], bar[Fe], bar[Fv]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSv(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaFecSvL(gt1,i2,i1)
coup1R = cplcChaFecSvR(gt1,i2,i1)
coup2L = cplcFvChiSvL(i3,gt2,i1)
coup2R = cplcFvChiSvR(i3,gt2,i1)
coup3L = cplcFeFvHpmL(i2,i3,gt3)
coup3R = cplcFeFvHpmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Do
End Subroutine Amplitude_VERTEX_sec_UMSSM_ChaToChiHpm


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaToChiHpm(MAh,MCha,MChi,MFd,               & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,              & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhHpmcHpm,cplAhHpmcVWm,       & 
& cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,             & 
& cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,  & 
& cplcChaChaVZpR,cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,      & 
& cplChiChiVZpR,cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,        & 
& cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,     & 
& cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,         & 
& cplcFvChiSvR,cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFecSvL,  & 
& cplcChaFecSvR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFeFvHpmL,cplcFeFvHpmR,cplhhHpmcHpm,        & 
& cplhhHpmcVWm,cplHpmSucSd,cplHpmSvcSe,cplHpmcHpmVP,cplHpmcVWmVP,cplHpmcHpmVZ,           & 
& cplHpmcVWmVZ,cplHpmcHpmVZp,cplHpmcVWmVZp,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,    & 
& cplcChacFvSeR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFd(3),MFe(3),MFu(3),MFv(3),Mhh(6),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFd2(3),              & 
& MFe2(3),MFu2(3),MFv2(3),Mhh2(6),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),              & 
& MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),    & 
& cplAhHpmcHpm(6,2,2),cplAhHpmcVWm(6,2),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),     & 
& cplChiChacVWmL(9,2),cplChiChacVWmR(9,2),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),     & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),       & 
& cplChiChiVZL(9,9),cplChiChiVZR(9,9),cplChiChiVZpL(9,9),cplChiChiVZpR(9,9),             & 
& cplChiFdcSdL(9,3,6),cplChiFdcSdR(9,3,6),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),       & 
& cplChiFucSuL(9,3,6),cplChiFucSuR(9,3,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),       & 
& cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcFdChiSdL(3,9,6),cplcFdChiSdR(3,9,6),   & 
& cplcFeChiSeL(3,9,6),cplcFeChiSeR(3,9,6),cplcFuChiSuL(3,9,6),cplcFuChiSuR(3,9,6),       & 
& cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9),       & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),   & 
& cplcFdFuHpmL(3,3,2),cplcFdFuHpmR(3,3,2),cplcFeFvHpmL(3,3,2),cplcFeFvHpmR(3,3,2),       & 
& cplhhHpmcHpm(6,2,2),cplhhHpmcVWm(6,2),cplHpmSucSd(2,6,6),cplHpmSvcSe(2,6,6),           & 
& cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplHpmcHpmVZp(2,2),& 
& cplHpmcVWmVZp(2),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChacFvSeL(2,3,6),       & 
& cplcChacFvSeR(2,3,6)

Complex(dp), Intent(out) :: Amp(2,2,9,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,9
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MHpm(gt3) 


! {Cha, VP, Hpm}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = -cplHpmcHpmVP(gt3,i3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VP, VWm}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = -cplcChaChiVWmR(i1,gt2)
coup2R = -cplcChaChiVWmL(i1,gt2)
coup3 = cplHpmcVWmVP(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaToChiHpm


Subroutine Amplitude_Tree_sec_UMSSM_ChaToChiVWm(cplcChaChiVWmL,cplcChaChiVWmR,        & 
& MCha,MChi,MVWm,MCha2,MChi2,MVWm2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MChi(9),MVWm,MCha2(2),MChi2(9),MVWm2

Complex(dp), Intent(in) :: cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9)

Complex(dp) :: Amp(4,2,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,9
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MVWm 
! Tree-Level Vertex 
coupT1L = cplcChaChiVWmL(gt1,gt2)
coupT1R = cplcChaChiVWmR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_ChaToChiVWm


Subroutine Gamma_Real_sec_UMSSM_ChaToChiVWm(MLambda,em,gs,cplcChaChiVWmL,             & 
& cplcChaChiVWmR,MCha,MChi,MVWm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9)

Real(dp), Intent(in) :: MCha(2),MChi(9),MVWm

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,9), GammarealGluon(2,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,9
CoupL = cplcChaChiVWmL(i1,i2)
CoupR = cplcChaChiVWmR(i1,i2)
Mex1 = MCha(i1)
Mex2 = MChi(i2)
Mex3 = MVWm
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
  Call hardphotonFFW(Mex1,Mex2,Mex3,MLambda,-1._dp,0._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_ChaToChiVWm


Subroutine Amplitude_WAVE_sec_UMSSM_ChaToChiVWm(cplcChaChiVWmL,cplcChaChiVWmR,        & 
& ctcplcChaChiVWmL,ctcplcChaChiVWmR,MCha,MCha2,MChi,MChi2,MVWm,MVWm2,ZfL0,               & 
& ZfLm,ZfLp,ZfVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MChi(9),MChi2(9),MVWm,MVWm2

Complex(dp), Intent(in) :: cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9)

Complex(dp), Intent(in) :: ctcplcChaChiVWmL(2,9),ctcplcChaChiVWmR(2,9)

Complex(dp), Intent(in) :: ZfL0(9,9),ZfLm(2,2),ZfLp(2,2),ZfVWm

Complex(dp), Intent(out) :: Amp(4,2,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,9
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MVWm 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaChiVWmL(gt1,gt2) 
ZcoupT1R = ctcplcChaChiVWmR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChaChiVWmL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfLp(i1,gt1)*cplcChaChiVWmR(i1,gt2)
End Do


! External Field 2 
Do i1=1,9
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfL0(i1,gt2)*cplcChaChiVWmL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfL0(i1,gt2))*cplcChaChiVWmR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVWm*cplcChaChiVWmL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVWm*cplcChaChiVWmR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_ChaToChiVWm


Subroutine Amplitude_VERTEX_sec_UMSSM_ChaToChiVWm(MAh,MCha,MChi,MFd,MFe,              & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,     & 
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
& cplcVWmVWmVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFd(3),MFe(3),MFu(3),MFv(3),Mhh(6),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFd2(3),              & 
& MFe2(3),MFu2(3),MFv2(3),Mhh2(6),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),              & 
& MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),    & 
& cplAhcHpmVWm(6,2),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChiChacVWmL(9,2),     & 
& cplChiChacVWmR(9,2),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),cplcChaChaVPL(2,2),      & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),cplChiChiVZL(9,9),         & 
& cplChiChiVZR(9,9),cplChiChiVZpL(9,9),cplChiChiVZpR(9,9),cplChiFdcSdL(9,3,6),           & 
& cplChiFdcSdR(9,3,6),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFucSuL(9,3,6),       & 
& cplChiFucSuR(9,3,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),cplcChaChiHpmL(2,9,2),     & 
& cplcChaChiHpmR(2,9,2),cplcFdChiSdL(3,9,6),cplcFdChiSdR(3,9,6),cplcFeChiSeL(3,9,6),     & 
& cplcFeChiSeR(3,9,6),cplcFuChiSuL(3,9,6),cplcFuChiSuR(3,9,6),cplcFvChiSvL(3,9,6),       & 
& cplcFvChiSvR(3,9,6),cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9),cplcChaFdcSuL(2,3,6),      & 
& cplcChaFdcSuR(2,3,6),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFdFuVWmL(3,3),      & 
& cplcFdFuVWmR(3,3),cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplhhcHpmVWm(6,2),               & 
& cplhhcVWmVWm(6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChacFvSeL(2,3,6),        & 
& cplcChacFvSeR(2,3,6),cplSucSdVWm(6,6),cplSvcSeVWm(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,   & 
& cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplcHpmVWmVZp(2),cplcVWmVWmVZp

Complex(dp), Intent(out) :: Amp(4,2,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,9
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MVWm 


! {Ah, bar[Cha], Chi}
Do i1=1,6
  Do i2=1,2
    Do i3=1,9
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplChiChiAhL(gt2,i3,i1)
coup2R = cplChiChiAhR(gt2,i3,i1)
coup3L = cplcChaChiVWmL(i2,i3)
coup3R = cplcChaChiVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, Hpm}
Do i1=1,2
  Do i2=1,6
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = -cplAhcHpmVWm(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, Hpm}
Do i1=1,2
  Do i2=1,6
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = -cplhhcHpmVWm(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VP, Hpm}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1L = cplcChaChaVPL(gt1,i1)
coup1R = cplcChaChaVPR(gt1,i1)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = cplcHpmVPVWm(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZ, Hpm}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MHpm(i3) 
coup1L = cplcChaChaVZL(gt1,i1)
coup1R = cplcChaChaVZR(gt1,i1)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = cplcHpmVWmVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, Hpm}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MHpm(i3) 
coup1L = cplcChaChaVZpL(gt1,i1)
coup1R = cplcChaChaVZpR(gt1,i1)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = cplcHpmVWmVZp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, hh, VWm}
Do i1=1,2
  Do i2=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MVWm 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaChiVWmL(i1,gt2)
coup2R = cplcChaChiVWmR(i1,gt2)
coup3 = cplhhcVWmVWm(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Cha, VP, VWm}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1L = cplcChaChaVPL(gt1,i1)
coup1R = cplcChaChaVPR(gt1,i1)
coup2L = cplcChaChiVWmL(i1,gt2)
coup2R = cplcChaChiVWmR(i1,gt2)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Cha, VZ, VWm}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MVWm 
coup1L = cplcChaChaVZL(gt1,i1)
coup1R = cplcChaChaVZR(gt1,i1)
coup2L = cplcChaChiVWmL(i1,gt2)
coup2R = cplcChaChiVWmR(i1,gt2)
coup3 = cplcVWmVWmVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Cha, VZp, VWm}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MVWm 
coup1L = cplcChaChaVZpL(gt1,i1)
coup1R = cplcChaChaVZpR(gt1,i1)
coup2L = cplcChaChiVWmL(i1,gt2)
coup2R = cplcChaChiVWmR(i1,gt2)
coup3 = cplcVWmVWmVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Chi, conj[Hpm], Ah}
Do i1=1,9
  Do i2=1,2
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChiAhL(gt2,i1,i3)
coup2R = cplChiChiAhR(gt2,i1,i3)
coup3 = cplAhcHpmVWm(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[Hpm], hh}
Do i1=1,9
  Do i2=1,2
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
coup3 = cplhhcHpmVWm(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], hh}
Do i1=1,9
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = Mhh(i3) 
coup1L = cplcChaChiVWmL(gt1,i1)
coup1R = cplcChaChiVWmR(gt1,i1)
coup2L = cplChiChihhL(gt2,i1,i3)
coup2R = cplChiChihhR(gt2,i1,i3)
coup3 = cplhhcVWmVWm(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], VZ}
Do i1=1,9
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVZ 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = -cplChiChiVZR(gt2,i1)
coup2R = -cplChiChiVZL(gt2,i1)
coup3 = cplcHpmVWmVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[VWm], VZ}
Do i1=1,9
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MVZ 
coup1L = cplcChaChiVWmL(gt1,i1)
coup1R = cplcChaChiVWmR(gt1,i1)
coup2L = -cplChiChiVZR(gt2,i1)
coup2R = -cplChiChiVZL(gt2,i1)
coup3 = -cplcVWmVWmVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Chi, conj[Hpm], VZp}
Do i1=1,9
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVZp 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = -cplChiChiVZpR(gt2,i1)
coup2R = -cplChiChiVZpL(gt2,i1)
coup3 = cplcHpmVWmVZp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[VWm], VZp}
Do i1=1,9
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MVZp 
coup1L = cplcChaChiVWmL(gt1,i1)
coup1R = cplcChaChiVWmR(gt1,i1)
coup2L = -cplChiChiVZpR(gt2,i1)
coup2R = -cplChiChiVZpL(gt2,i1)
coup3 = -cplcVWmVWmVZp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, Su, Sd}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MSd(i3) 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = cplcFdChiSdL(i1,gt2,i3)
coup2R = cplcFdChiSdR(i1,gt2,i3)
coup3 = -cplSucSdVWm(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Fe, Sv, Se}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSv(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaFecSvL(gt1,i1,i2)
coup1R = cplcChaFecSvR(gt1,i1,i2)
coup2L = cplcFeChiSeL(i1,gt2,i3)
coup2R = cplcFeChiSeR(i1,gt2,i3)
coup3 = -cplSvcSeVWm(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, bar[Cha], Chi}
Do i1=1,6
  Do i2=1,2
    Do i3=1,9
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplChiChihhL(gt2,i3,i1)
coup2R = cplChiChihhR(gt2,i3,i1)
coup3L = cplcChaChiVWmL(i2,i3)
coup3R = cplcChaChiVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, Cha}
Do i1=1,2
  Do i2=1,9
    Do i3=1,2
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplChiChacHpmL(gt2,i3,i1)
coup2R = cplChiChacHpmR(gt2,i3,i1)
coup3L = -cplcChaChiVWmR(i3,i2)
coup3R = -cplcChaChiVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Fu, Fd}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcChacFuSdL(gt1,i2,i1)
coup1R = cplcChacFuSdR(gt1,i2,i1)
coup2L = cplChiFdcSdL(gt2,i3,i1)
coup2R = cplChiFdcSdR(gt2,i3,i1)
coup3L = -cplcFdFuVWmR(i3,i2)
coup3R = -cplcFdFuVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Se, Fv, Fe}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSe(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplcChacFvSeL(gt1,i2,i1)
coup1R = cplcChacFvSeR(gt1,i2,i1)
coup2L = cplChiFecSeL(gt2,i3,i1)
coup2R = cplChiFecSeR(gt2,i3,i1)
coup3L = -cplcFeFvVWmR(i3,i2)
coup3R = -cplcFeFvVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VWm, Chi, Cha}
  Do i2=1,9
    Do i3=1,2
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChiVWmL(gt1,i2)
coup1R = cplcChaChiVWmR(gt1,i2)
coup2L = -cplChiChacVWmR(gt2,i3)
coup2R = -cplChiChacVWmL(gt2,i3)
coup3L = -cplcChaChiVWmR(i3,i2)
coup3R = -cplcChaChiVWmL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], Chi}
  Do i2=1,2
    Do i3=1,9
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChaVZL(gt1,i2)
coup1R = cplcChaChaVZR(gt1,i2)
coup2L = -cplChiChiVZR(gt2,i3)
coup2R = -cplChiChiVZL(gt2,i3)
coup3L = cplcChaChiVWmL(i2,i3)
coup3R = cplcChaChiVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], Chi}
  Do i2=1,2
    Do i3=1,9
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaChaVZpL(gt1,i2)
coup1R = cplcChaChaVZpR(gt1,i2)
coup2L = -cplChiChiVZpR(gt2,i3)
coup2R = -cplChiChiVZpL(gt2,i3)
coup3L = cplcChaChiVWmL(i2,i3)
coup3R = cplcChaChiVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fu], conj[Sd], conj[Su]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MSu(i3) 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplChiFucSuL(gt2,i1,i3)
coup2R = cplChiFucSuR(gt2,i1,i3)
coup3 = cplSucSdVWm(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {bar[Fv], conj[Se], conj[Sv]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MSv(i3) 
coup1L = cplcChacFvSeL(gt1,i1,i2)
coup1R = cplcChacFvSeR(gt1,i1,i2)
coup2L = cplChiFvcSvL(gt2,i1,i3)
coup2R = cplChiFvcSvR(gt2,i1,i3)
coup3 = cplSvcSeVWm(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Su], bar[Fd], bar[Fu]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcChaFdcSuL(gt1,i2,i1)
coup1R = cplcChaFdcSuR(gt1,i2,i1)
coup2L = cplcFuChiSuL(i3,gt2,i1)
coup2R = cplcFuChiSuR(i3,gt2,i1)
coup3L = cplcFdFuVWmL(i2,i3)
coup3R = cplcFdFuVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {conj[Sv], bar[Fe], bar[Fv]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSv(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaFecSvL(gt1,i2,i1)
coup1R = cplcChaFecSvR(gt1,i2,i1)
coup2L = cplcFvChiSvL(i3,gt2,i1)
coup2R = cplcFvChiSvR(i3,gt2,i1)
coup3L = cplcFeFvVWmL(i2,i3)
coup3R = cplcFeFvVWmR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_sec_UMSSM_ChaToChiVWm


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaToChiVWm(MAh,MCha,MChi,MFd,               & 
& MFe,MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,               & 
& MFd2,MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,              & 
& cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,cplAhcHpmVWm,cplChiChacHpmL,     & 
& cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,cplcChaChahhL,cplcChaChahhR,              & 
& cplcChaChaVPL,cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR, & 
& cplChiChihhL,cplChiChihhR,cplChiChiVZL,cplChiChiVZR,cplChiChiVZpL,cplChiChiVZpR,       & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcChaFecSvL,               & 
& cplcChaFecSvR,cplcFdFuVWmL,cplcFdFuVWmR,cplcFeFvVWmL,cplcFeFvVWmR,cplhhcHpmVWm,        & 
& cplhhcVWmVWm,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,cplSucSdVWm,      & 
& cplSvcSeVWm,cplcHpmVPVWm,cplcVWmVPVWm,cplcHpmVWmVZ,cplcVWmVWmVZ,cplcHpmVWmVZp,         & 
& cplcVWmVWmVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFd(3),MFe(3),MFu(3),MFv(3),Mhh(6),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFd2(3),              & 
& MFe2(3),MFu2(3),MFv2(3),Mhh2(6),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),              & 
& MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplChiChiAhL(9,9,6),cplChiChiAhR(9,9,6),    & 
& cplAhcHpmVWm(6,2),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChiChacVWmL(9,2),     & 
& cplChiChacVWmR(9,2),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),cplcChaChaVPL(2,2),      & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),cplChiChiVZL(9,9),         & 
& cplChiChiVZR(9,9),cplChiChiVZpL(9,9),cplChiChiVZpR(9,9),cplChiFdcSdL(9,3,6),           & 
& cplChiFdcSdR(9,3,6),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFucSuL(9,3,6),       & 
& cplChiFucSuR(9,3,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),cplcChaChiHpmL(2,9,2),     & 
& cplcChaChiHpmR(2,9,2),cplcFdChiSdL(3,9,6),cplcFdChiSdR(3,9,6),cplcFeChiSeL(3,9,6),     & 
& cplcFeChiSeR(3,9,6),cplcFuChiSuL(3,9,6),cplcFuChiSuR(3,9,6),cplcFvChiSvL(3,9,6),       & 
& cplcFvChiSvR(3,9,6),cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9),cplcChaFdcSuL(2,3,6),      & 
& cplcChaFdcSuR(2,3,6),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFdFuVWmL(3,3),      & 
& cplcFdFuVWmR(3,3),cplcFeFvVWmL(3,3),cplcFeFvVWmR(3,3),cplhhcHpmVWm(6,2),               & 
& cplhhcVWmVWm(6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChacFvSeL(2,3,6),        & 
& cplcChacFvSeR(2,3,6),cplSucSdVWm(6,6),cplSvcSeVWm(6,6),cplcHpmVPVWm(2),cplcVWmVPVWm,   & 
& cplcHpmVWmVZ(2),cplcVWmVWmVZ,cplcHpmVWmVZp(2),cplcVWmVWmVZp

Complex(dp), Intent(out) :: Amp(4,2,9) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,9
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MChi(gt2) 
Mex3 = MVWm 


! {Cha, VP, Hpm}
Do i1=1,2
    Do i3=1,2
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MHpm(i3) 
coup1L = cplcChaChaVPL(gt1,i1)
coup1R = cplcChaChaVPR(gt1,i1)
coup2L = cplcChaChiHpmL(i1,gt2,i3)
coup2R = cplcChaChiHpmR(i1,gt2,i3)
coup3 = cplcHpmVPVWm(i3)
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VP, VWm}
Do i1=1,2
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MVWm 
coup1L = cplcChaChaVPL(gt1,i1)
coup1R = cplcChaChaVPR(gt1,i1)
coup2L = cplcChaChiVWmL(i1,gt2)
coup2R = cplcChaChiVWmR(i1,gt2)
coup3 = -cplcVWmVPVWm
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaToChiVWm


Subroutine Amplitude_Tree_sec_UMSSM_ChaToFdcSu(cplcChaFdcSuL,cplcChaFdcSuR,           & 
& MCha,MFd,MSu,MCha2,MFd2,MSu2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFd(3),MSu(6),MCha2(2),MFd2(3),MSu2(6)

Complex(dp), Intent(in) :: cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6)

Complex(dp) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MSu(gt3) 
! Tree-Level Vertex 
coupT1L = cplcChaFdcSuL(gt1,gt2,gt3)
coupT1R = cplcChaFdcSuR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_ChaToFdcSu


Subroutine Gamma_Real_sec_UMSSM_ChaToFdcSu(MLambda,em,gs,cplcChaFdcSuL,               & 
& cplcChaFdcSuR,MCha,MFd,MSu,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6)

Real(dp), Intent(in) :: MCha(2),MFd(3),MSu(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,3,6), GammarealGluon(2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,3
    Do i3=1,6
CoupL = cplcChaFdcSuL(i1,i2,i3)
CoupR = cplcChaFdcSuR(i1,i2,i3)
Mex1 = MCha(i1)
Mex2 = MFd(i2)
Mex3 = MSu(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,3._dp,1._dp,2._dp,1._dp/3._dp,2._dp/3._dp,4._dp/3._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,gs,0._dp,0._dp,0._dp,4._dp,-4._dp,4._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_ChaToFdcSu


Subroutine Amplitude_WAVE_sec_UMSSM_ChaToFdcSu(cplcChaFdcSuL,cplcChaFdcSuR,           & 
& ctcplcChaFdcSuL,ctcplcChaFdcSuR,MCha,MCha2,MFd,MFd2,MSu,MSu2,ZfFDL,ZfFDR,              & 
& ZfLm,ZfLp,ZfSu,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MFd(3),MFd2(3),MSu(6),MSu2(6)

Complex(dp), Intent(in) :: cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6)

Complex(dp), Intent(in) :: ctcplcChaFdcSuL(2,3,6),ctcplcChaFdcSuR(2,3,6)

Complex(dp), Intent(in) :: ZfFDL(3,3),ZfFDR(3,3),ZfLm(2,2),ZfLp(2,2),ZfSu(6,6)

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MSu(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaFdcSuL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcChaFdcSuR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLp(i1,gt1)*cplcChaFdcSuL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChaFdcSuR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFDL(i1,gt2)*cplcChaFdcSuL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFDR(i1,gt2))*cplcChaFdcSuR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfSu(i1,gt3))*cplcChaFdcSuL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfSu(i1,gt3))*cplcChaFdcSuR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_ChaToFdcSu


Subroutine Amplitude_VERTEX_sec_UMSSM_ChaToFdcSu(MAh,MCha,MChi,MFd,MFu,               & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,          & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,          & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,        & 
& cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,              & 
& cplSucSuVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFd(3),MFu(3),MGlu,Mhh(6),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFd2(3),MFu2(3),MGlu2,Mhh2(6),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplcFdFdAhL(3,3,6),cplcFdFdAhR(3,3,6),      & 
& cplAhSucSu(6,6,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),cplcChaChaVPL(2,2),        & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplChiFdcSdL(9,3,6),cplChiFdcSdR(9,3,6),cplChiFucSuL(9,3,6),       & 
& cplChiFucSuR(9,3,6),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),   & 
& cplcChaChiVWmR(2,9),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,6),            & 
& cplcFdFdhhR(3,3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),& 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcChaFdcSuL(2,3,6),& 
& cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),     & 
& cplcFuFdcVWmR(3,3),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplhhSucSu(6,6,6),              & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),       & 
& cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6)

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MSu(gt3) 


! {Ah, bar[Cha], bar[Fd]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplcFdFdAhL(i3,gt2,i1)
coup2R = cplcFdFdAhR(i3,gt2,i1)
coup3L = cplcChaFdcSuL(i2,i3,gt3)
coup3R = cplcChaFdcSuR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, conj[Su]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MSu(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaFdcSuL(i1,gt2,i3)
coup2R = cplcChaFdcSuR(i1,gt2,i3)
coup3 = cplAhSucSu(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, conj[Su]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MSu(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaFdcSuL(i1,gt2,i3)
coup2R = cplcChaFdcSuR(i1,gt2,i3)
coup3 = cplhhSucSu(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VP, conj[Su]}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MSu(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChaFdcSuL(i1,gt2,i3)
coup2R = cplcChaFdcSuR(i1,gt2,i3)
coup3 = cplSucSuVP(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZ, conj[Su]}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MSu(i3) 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = cplcChaFdcSuL(i1,gt2,i3)
coup2R = cplcChaFdcSuR(i1,gt2,i3)
coup3 = cplSucSuVZ(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, conj[Su]}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MSu(i3) 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = cplcChaFdcSuL(i1,gt2,i3)
coup2R = cplcChaFdcSuR(i1,gt2,i3)
coup3 = cplSucSuVZp(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], conj[Sd]}
Do i1=1,9
  Do i2=1,2
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MSd(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiFdcSdL(i1,gt2,i3)
coup2R = cplChiFdcSdR(i1,gt2,i3)
coup3 = cplSdcHpmcSu(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], conj[Sd]}
Do i1=1,9
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MSd(i3) 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplChiFdcSdL(i1,gt2,i3)
coup2R = cplChiFdcSdR(i1,gt2,i3)
coup3 = cplSdcSucVWm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fd, Su, Ah}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = cplcFdFdAhL(i1,gt2,i3)
coup2R = cplcFdFdAhR(i1,gt2,i3)
coup3 = cplAhSucSu(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fd, Su, hh}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
coup3 = cplhhSucSu(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fd, Su, VG}
Do i1=1,3
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MVG 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = -cplcFdFdVGR(i1,gt2)
coup2R = -cplcFdFdVGL(i1,gt2)
coup3 = cplSucSuVG(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {Fd, Su, VP}
Do i1=1,3
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MVP 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = -cplcFdFdVPR(i1,gt2)
coup2R = -cplcFdFdVPL(i1,gt2)
coup3 = cplSucSuVP(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, Su, VZ}
Do i1=1,3
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MVZ 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = -cplcFdFdVZR(i1,gt2)
coup2R = -cplcFdFdVZL(i1,gt2)
coup3 = cplSucSuVZ(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, Su, VZp}
Do i1=1,3
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MVZp 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = -cplcFdFdVZpR(i1,gt2)
coup2R = -cplcFdFdVZpL(i1,gt2)
coup3 = cplSucSuVZp(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, bar[Cha], bar[Fd]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplcFdFdhhL(i3,gt2,i1)
coup2R = cplcFdFdhhR(i3,gt2,i1)
coup3L = cplcChaFdcSuL(i2,i3,gt3)
coup3R = cplcChaFdcSuR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, bar[Fu]}
Do i1=1,2
  Do i2=1,9
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MFu(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplcFuFdcHpmL(i3,gt2,i1)
coup2R = cplcFuFdcHpmR(i3,gt2,i1)
coup3L = cplChiFucSuL(i2,i3,gt3)
coup3R = cplChiFucSuR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Fu, Chi}
Do i1=1,6
  Do i2=1,3
    Do i3=1,9
ML1 = MSd(i1) 
ML2 = MFu(i2) 
ML3 = MChi(i3) 
coup1L = cplcChacFuSdL(gt1,i2,i1)
coup1R = cplcChacFuSdR(gt1,i2,i1)
coup2L = cplChiFdcSdL(i3,gt2,i1)
coup2R = cplChiFdcSdR(i3,gt2,i1)
coup3L = cplChiFucSuL(i3,i2,gt3)
coup3R = cplChiFucSuR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Fu, Glu}
Do i1=1,6
  Do i2=1,3
ML1 = MSd(i1) 
ML2 = MFu(i2) 
ML3 = MGlu 
coup1L = cplcChacFuSdL(gt1,i2,i1)
coup1R = cplcChacFuSdR(gt1,i2,i1)
coup2L = cplGluFdcSdL(gt2,i1)
coup2R = cplGluFdcSdR(gt2,i1)
coup3L = cplGluFucSuL(i2,gt3)
coup3R = cplGluFucSuR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {VP, bar[Cha], bar[Fd]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MFd(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = -cplcFdFdVPR(i3,gt2)
coup2R = -cplcFdFdVPL(i3,gt2)
coup3L = cplcChaFdcSuL(i2,i3,gt3)
coup3R = cplcChaFdcSuR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Chi, bar[Fu]}
  Do i2=1,9
    Do i3=1,3
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MFu(i3) 
coup1L = -cplcChaChiVWmR(gt1,i2)
coup1R = -cplcChaChiVWmL(gt1,i2)
coup2L = -cplcFuFdcVWmR(i3,gt2)
coup2R = -cplcFuFdcVWmL(i3,gt2)
coup3L = cplChiFucSuL(i2,i3,gt3)
coup3R = cplChiFucSuR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], bar[Fd]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MFd(i3) 
coup1L = -cplcChaChaVZR(gt1,i2)
coup1R = -cplcChaChaVZL(gt1,i2)
coup2L = -cplcFdFdVZR(i3,gt2)
coup2R = -cplcFdFdVZL(i3,gt2)
coup3L = cplcChaFdcSuL(i2,i3,gt3)
coup3R = cplcChaFdcSuR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], bar[Fd]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MFd(i3) 
coup1L = -cplcChaChaVZpR(gt1,i2)
coup1R = -cplcChaChaVZpL(gt1,i2)
coup2L = -cplcFdFdVZpR(i3,gt2)
coup2R = -cplcFdFdVZpL(i3,gt2)
coup3L = cplcChaFdcSuL(i2,i3,gt3)
coup3R = cplcChaFdcSuR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Subroutine Amplitude_VERTEX_sec_UMSSM_ChaToFdcSu


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaToFdcSu(MAh,MCha,MChi,MFd,MFu,            & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,          & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplcFdFdAhL,cplcFdFdAhR,cplAhSucSu,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,          & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFucSuL,cplChiFucSuR,cplcChaChiHpmL,cplcChaChiHpmR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,       & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFdVZpL,cplcFdFdVZpR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,     & 
& cplcFuFdcVWmL,cplcFuFdcVWmR,cplGluFucSuL,cplGluFucSuR,cplhhSucSu,cplcChacFuSdL,        & 
& cplcChacFuSdR,cplSdcHpmcSu,cplSdcSucVWm,cplSucSuVG,cplSucSuVP,cplSucSuVZ,              & 
& cplSucSuVZp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFd(3),MFu(3),MGlu,Mhh(6),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFd2(3),MFu2(3),MGlu2,Mhh2(6),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplcFdFdAhL(3,3,6),cplcFdFdAhR(3,3,6),      & 
& cplAhSucSu(6,6,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),cplcChaChaVPL(2,2),        & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplChiFdcSdL(9,3,6),cplChiFdcSdR(9,3,6),cplChiFucSuL(9,3,6),       & 
& cplChiFucSuR(9,3,6),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcChaChiVWmL(2,9),   & 
& cplcChaChiVWmR(2,9),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,6),            & 
& cplcFdFdhhR(3,3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),& 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZpL(3,3),cplcFdFdVZpR(3,3),cplcChaFdcSuL(2,3,6),& 
& cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),     & 
& cplcFuFdcVWmR(3,3),cplGluFucSuL(3,6),cplGluFucSuR(3,6),cplhhSucSu(6,6,6),              & 
& cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6),       & 
& cplSucSuVG(6,6),cplSucSuVP(6,6),cplSucSuVZ(6,6),cplSucSuVZp(6,6)

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MSu(gt3) 


! {Cha, VP, conj[Su]}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MSu(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChaFdcSuL(i1,gt2,i3)
coup2R = cplcChaFdcSuR(i1,gt2,i3)
coup3 = cplSucSuVP(i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fd, Su, VG}
Do i1=1,3
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MVG 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = -cplcFdFdVGR(i1,gt2)
coup2R = -cplcFdFdVGL(i1,gt2)
coup3 = cplSucSuVG(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {Fd, Su, VP}
Do i1=1,3
  Do i2=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MVP 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = -cplcFdFdVPR(i1,gt2)
coup2R = -cplcFdFdVPL(i1,gt2)
coup3 = cplSucSuVP(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, bar[Cha], bar[Fd]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MFd(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = -cplcFdFdVPR(i3,gt2)
coup2R = -cplcFdFdVPL(i3,gt2)
coup3L = cplcChaFdcSuL(i2,i3,gt3)
coup3R = cplcChaFdcSuR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaToFdcSu


Subroutine Amplitude_Tree_sec_UMSSM_ChaToFecSv(cplcChaFecSvL,cplcChaFecSvR,           & 
& MCha,MFe,MSv,MCha2,MFe2,MSv2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFe(3),MSv(6),MCha2(2),MFe2(3),MSv2(6)

Complex(dp), Intent(in) :: cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6)

Complex(dp) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MSv(gt3) 
! Tree-Level Vertex 
coupT1L = cplcChaFecSvL(gt1,gt2,gt3)
coupT1R = cplcChaFecSvR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_ChaToFecSv


Subroutine Gamma_Real_sec_UMSSM_ChaToFecSv(MLambda,em,gs,cplcChaFecSvL,               & 
& cplcChaFecSvR,MCha,MFe,MSv,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6)

Real(dp), Intent(in) :: MCha(2),MFe(3),MSv(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,3,6), GammarealGluon(2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,3
    Do i3=1,6
CoupL = cplcChaFecSvL(i1,i2,i3)
CoupR = cplcChaFecSvR(i1,i2,i3)
Mex1 = MCha(i1)
Mex2 = MFe(i2)
Mex3 = MSv(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_ChaToFecSv


Subroutine Amplitude_WAVE_sec_UMSSM_ChaToFecSv(cplcChaFecSvL,cplcChaFecSvR,           & 
& ctcplcChaFecSvL,ctcplcChaFecSvR,MCha,MCha2,MFe,MFe2,MSv,MSv2,ZfFEL,ZfFER,              & 
& ZfLm,ZfLp,ZfSv,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MFe(3),MFe2(3),MSv(6),MSv2(6)

Complex(dp), Intent(in) :: cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6)

Complex(dp), Intent(in) :: ctcplcChaFecSvL(2,3,6),ctcplcChaFecSvR(2,3,6)

Complex(dp), Intent(in) :: ZfFEL(3,3),ZfFER(3,3),ZfLm(2,2),ZfLp(2,2),ZfSv(6,6)

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MSv(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChaFecSvL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcChaFecSvR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLp(i1,gt1)*cplcChaFecSvL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChaFecSvR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFEL(i1,gt2)*cplcChaFecSvL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFER(i1,gt2))*cplcChaFecSvR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfSv(i1,gt3))*cplcChaFecSvL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfSv(i1,gt3))*cplcChaFecSvR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_ChaToFecSv


Subroutine Amplitude_VERTEX_sec_UMSSM_ChaToFecSv(MAh,MCha,MChi,MFe,MFv,               & 
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

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MSv(gt3) 


! {Ah, bar[Cha], bar[Fe]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplcFeFeAhL(i3,gt2,i1)
coup2R = cplcFeFeAhR(i3,gt2,i1)
coup3L = cplcChaFecSvL(i2,i3,gt3)
coup3R = cplcChaFecSvR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, conj[Sv]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MSv(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChaFecSvL(i1,gt2,i3)
coup2R = cplcChaFecSvR(i1,gt2,i3)
coup3 = cplAhSvcSv(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, conj[Sv]}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MSv(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChaFecSvL(i1,gt2,i3)
coup2R = cplcChaFecSvR(i1,gt2,i3)
coup3 = cplhhSvcSv(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VZ, conj[Sv]}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MSv(i3) 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = cplcChaFecSvL(i1,gt2,i3)
coup2R = cplcChaFecSvR(i1,gt2,i3)
coup3 = cplSvcSvVZ(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, conj[Sv]}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MSv(i3) 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = cplcChaFecSvL(i1,gt2,i3)
coup2R = cplcChaFecSvR(i1,gt2,i3)
coup3 = cplSvcSvVZp(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], conj[Se]}
Do i1=1,9
  Do i2=1,2
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
coup3 = cplSecHpmcSv(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], conj[Se]}
Do i1=1,9
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MSe(i3) 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplChiFecSeL(i1,gt2,i3)
coup2R = cplChiFecSeR(i1,gt2,i3)
coup3 = cplSecSvcVWm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fe, Sv, Ah}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSv(i2) 
ML3 = MAh(i3) 
coup1L = cplcChaFecSvL(gt1,i1,i2)
coup1R = cplcChaFecSvR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2,i3)
coup2R = cplcFeFeAhR(i1,gt2,i3)
coup3 = cplAhSvcSv(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, Sv, hh}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFe(i1) 
ML2 = MSv(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChaFecSvL(gt1,i1,i2)
coup1R = cplcChaFecSvR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
coup3 = cplhhSvcSv(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fe, Sv, VZ}
Do i1=1,3
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MSv(i2) 
ML3 = MVZ 
coup1L = cplcChaFecSvL(gt1,i1,i2)
coup1R = cplcChaFecSvR(gt1,i1,i2)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = cplSvcSvVZ(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, Sv, VZp}
Do i1=1,3
  Do i2=1,6
ML1 = MFe(i1) 
ML2 = MSv(i2) 
ML3 = MVZp 
coup1L = cplcChaFecSvL(gt1,i1,i2)
coup1R = cplcChaFecSvR(gt1,i1,i2)
coup2L = -cplcFeFeVZpR(i1,gt2)
coup2R = -cplcFeFeVZpL(i1,gt2)
coup3 = cplSvcSvVZp(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, bar[Cha], bar[Fe]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplcChaFecSvL(i2,i3,gt3)
coup3R = cplcChaFecSvR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, bar[Fv]}
Do i1=1,2
  Do i2=1,9
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplcFvFecHpmL(i3,gt2,i1)
coup2R = cplcFvFecHpmR(i3,gt2,i1)
coup3L = cplChiFvcSvL(i2,i3,gt3)
coup3R = cplChiFvcSvR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Se, Fv, Chi}
Do i1=1,6
  Do i2=1,3
    Do i3=1,9
ML1 = MSe(i1) 
ML2 = MFv(i2) 
ML3 = MChi(i3) 
coup1L = cplcChacFvSeL(gt1,i2,i1)
coup1R = cplcChacFvSeR(gt1,i2,i1)
coup2L = cplChiFecSeL(i3,gt2,i1)
coup2R = cplChiFecSeR(i3,gt2,i1)
coup3L = cplChiFvcSvL(i3,i2,gt3)
coup3R = cplChiFvcSvR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VP, bar[Cha], bar[Fe]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcChaFecSvL(i2,i3,gt3)
coup3R = cplcChaFecSvR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Chi, bar[Fv]}
  Do i2=1,9
    Do i3=1,3
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MFv(i3) 
coup1L = -cplcChaChiVWmR(gt1,i2)
coup1R = -cplcChaChiVWmL(gt1,i2)
coup2L = -cplcFvFecVWmR(i3,gt2)
coup2R = -cplcFvFecVWmL(i3,gt2)
coup3L = cplChiFvcSvL(i2,i3,gt3)
coup3R = cplChiFvcSvR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], bar[Fe]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = -cplcChaChaVZR(gt1,i2)
coup1R = -cplcChaChaVZL(gt1,i2)
coup2L = -cplcFeFeVZR(i3,gt2)
coup2R = -cplcFeFeVZL(i3,gt2)
coup3L = cplcChaFecSvL(i2,i3,gt3)
coup3R = cplcChaFecSvR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], bar[Fe]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = -cplcChaChaVZpR(gt1,i2)
coup1R = -cplcChaChaVZpL(gt1,i2)
coup2L = -cplcFeFeVZpR(i3,gt2)
coup2R = -cplcFeFeVZpL(i3,gt2)
coup3L = cplcChaFecSvL(i2,i3,gt3)
coup3R = cplcChaFecSvR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Subroutine Amplitude_VERTEX_sec_UMSSM_ChaToFecSv


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaToFecSv(MAh,MCha,MChi,MFe,MFv,            & 
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

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MSv(gt3) 


! {VP, bar[Cha], bar[Fe]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MFe(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcChaFecSvL(i2,i3,gt3)
coup3R = cplcChaFecSvR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaToFecSv


Subroutine Amplitude_Tree_sec_UMSSM_ChaTocFuSd(cplcChacFuSdL,cplcChacFuSdR,           & 
& MCha,MFu,MSd,MCha2,MFu2,MSd2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFu(3),MSd(6),MCha2(2),MFu2(3),MSd2(6)

Complex(dp), Intent(in) :: cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

Complex(dp) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MSd(gt3) 
! Tree-Level Vertex 
coupT1L = cplcChacFuSdL(gt1,gt2,gt3)
coupT1R = cplcChacFuSdR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_ChaTocFuSd


Subroutine Gamma_Real_sec_UMSSM_ChaTocFuSd(MLambda,em,gs,cplcChacFuSdL,               & 
& cplcChacFuSdR,MCha,MFu,MSd,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

Real(dp), Intent(in) :: MCha(2),MFu(3),MSd(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,3,6), GammarealGluon(2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,3
    Do i3=1,6
CoupL = cplcChacFuSdL(i1,i2,i3)
CoupR = cplcChacFuSdR(i1,i2,i3)
Mex1 = MCha(i1)
Mex2 = MFu(i2)
Mex3 = MSd(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,3._dp,2._dp,1._dp,4._dp/3._dp,2._dp/3._dp,1._dp/3._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,gs,0._dp,0._dp,0._dp,4._dp,-4._dp,4._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_ChaTocFuSd


Subroutine Amplitude_WAVE_sec_UMSSM_ChaTocFuSd(cplcChacFuSdL,cplcChacFuSdR,           & 
& ctcplcChacFuSdL,ctcplcChacFuSdR,MCha,MCha2,MFu,MFu2,MSd,MSd2,ZfFUL,ZfFUR,              & 
& ZfLm,ZfLp,ZfSd,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MFu(3),MFu2(3),MSd(6),MSd2(6)

Complex(dp), Intent(in) :: cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6)

Complex(dp), Intent(in) :: ctcplcChacFuSdL(2,3,6),ctcplcChacFuSdR(2,3,6)

Complex(dp), Intent(in) :: ZfFUL(3,3),ZfFUR(3,3),ZfLm(2,2),ZfLp(2,2),ZfSd(6,6)

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MSd(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChacFuSdL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcChacFuSdR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLp(i1,gt1)*cplcChacFuSdL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChacFuSdR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFUR(i1,gt2)*cplcChacFuSdL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFUL(i1,gt2))*cplcChacFuSdR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfSd(i1,gt3)*cplcChacFuSdL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfSd(i1,gt3)*cplcChacFuSdR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_ChaTocFuSd


Subroutine Amplitude_VERTEX_sec_UMSSM_ChaTocFuSd(MAh,MCha,MChi,MFd,MFu,               & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,          & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,          & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,               & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,         & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,           & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,              & 
& cplSdcHpmcSu,cplSdcSucVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFd(3),MFu(3),MGlu,Mhh(6),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFd2(3),MFu2(3),MGlu2,Mhh2(6),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplcFuFuAhL(3,3,6),cplcFuFuAhR(3,3,6),      & 
& cplAhSdcSd(6,6,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),cplcChaChaVPL(2,2),        & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcFdChiSdL(3,9,6),   & 
& cplcFdChiSdR(3,9,6),cplcFuChiSuL(3,9,6),cplcFuChiSuR(3,9,6),cplcChaChiVWmL(2,9),       & 
& cplcChaChiVWmR(2,9),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),    & 
& cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuhhL(3,3,6),         & 
& cplcFuFuhhR(3,3,6),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcFdGluSdL(3,6),& 
& cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplhhSdcSd(6,6,6),               & 
& cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6), & 
& cplcChacFuSdR(2,3,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MSd(gt3) 


! {Ah, bar[Cha], Fu}
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MFu(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplcFuFuAhL(gt2,i3,i1)
coup2R = cplcFuFuAhR(gt2,i3,i1)
coup3L = cplcChacFuSdL(i2,i3,gt3)
coup3R = cplcChacFuSdR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, Sd}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MSd(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChacFuSdL(i1,gt2,i3)
coup2R = cplcChacFuSdR(i1,gt2,i3)
coup3 = cplAhSdcSd(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, Sd}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MSd(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChacFuSdL(i1,gt2,i3)
coup2R = cplcChacFuSdR(i1,gt2,i3)
coup3 = cplhhSdcSd(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VP, Sd}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MSd(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChacFuSdL(i1,gt2,i3)
coup2R = cplcChacFuSdR(i1,gt2,i3)
coup3 = -cplSdcSdVP(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZ, Sd}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MSd(i3) 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = cplcChacFuSdL(i1,gt2,i3)
coup2R = cplcChacFuSdR(i1,gt2,i3)
coup3 = -cplSdcSdVZ(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, Sd}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MSd(i3) 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = cplcChacFuSdL(i1,gt2,i3)
coup2R = cplcChacFuSdR(i1,gt2,i3)
coup3 = -cplSdcSdVZp(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], Su}
Do i1=1,9
  Do i2=1,2
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MSu(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplcFuChiSuL(gt2,i1,i3)
coup2R = cplcFuChiSuR(gt2,i1,i3)
coup3 = cplSdcHpmcSu(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], Su}
Do i1=1,9
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MSu(i3) 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplcFuChiSuL(gt2,i1,i3)
coup2R = cplcFuChiSuR(gt2,i1,i3)
coup3 = -cplSdcSucVWm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, bar[Cha], Fu}
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MFu(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplcFuFuhhL(gt2,i3,i1)
coup2R = cplcFuFuhhR(gt2,i3,i1)
coup3L = cplcChacFuSdL(i2,i3,gt3)
coup3R = cplcChacFuSdR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, Fd}
Do i1=1,2
  Do i2=1,9
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplcFuFdcHpmL(gt2,i3,i1)
coup2R = cplcFuFdcHpmR(gt2,i3,i1)
coup3L = cplcFdChiSdL(i3,i2,gt3)
coup3R = cplcFdChiSdR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VP, bar[Cha], Fu}
  Do i2=1,2
    Do i3=1,3
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MFu(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = cplcFuFuVPL(gt2,i3)
coup2R = cplcFuFuVPR(gt2,i3)
coup3L = cplcChacFuSdL(i2,i3,gt3)
coup3R = cplcChacFuSdR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWm, Chi, Fd}
  Do i2=1,9
    Do i3=1,3
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MFd(i3) 
coup1L = -cplcChaChiVWmR(gt1,i2)
coup1R = -cplcChaChiVWmL(gt1,i2)
coup2L = cplcFuFdcVWmL(gt2,i3)
coup2R = cplcFuFdcVWmR(gt2,i3)
coup3L = cplcFdChiSdL(i3,i2,gt3)
coup3R = cplcFdChiSdR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], Fu}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MFu(i3) 
coup1L = -cplcChaChaVZR(gt1,i2)
coup1R = -cplcChaChaVZL(gt1,i2)
coup2L = cplcFuFuVZL(gt2,i3)
coup2R = cplcFuFuVZR(gt2,i3)
coup3L = cplcChacFuSdL(i2,i3,gt3)
coup3R = cplcChacFuSdR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], Fu}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MFu(i3) 
coup1L = -cplcChaChaVZpR(gt1,i2)
coup1R = -cplcChaChaVZpL(gt1,i2)
coup2L = cplcFuFuVZpL(gt2,i3)
coup2R = cplcFuFuVZpR(gt2,i3)
coup3L = cplcChacFuSdL(i2,i3,gt3)
coup3R = cplcChacFuSdR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fu], conj[Sd], Ah}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MAh(i3) 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplcFuFuAhL(gt2,i1,i3)
coup2R = cplcFuFuAhR(gt2,i1,i3)
coup3 = cplAhSdcSd(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[Fu], conj[Sd], hh}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplcFuFuhhL(gt2,i1,i3)
coup2R = cplcFuFuhhR(gt2,i1,i3)
coup3 = cplhhSdcSd(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[Fu], conj[Sd], VG}
Do i1=1,3
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MVG 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplcFuFuVGL(gt2,i1)
coup2R = cplcFuFuVGR(gt2,i1)
coup3 = -cplSdcSdVG(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {bar[Fu], conj[Sd], VP}
Do i1=1,3
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MVP 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplcFuFuVPL(gt2,i1)
coup2R = cplcFuFuVPR(gt2,i1)
coup3 = -cplSdcSdVP(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fu], conj[Sd], VZ}
Do i1=1,3
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MVZ 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplcFuFuVZL(gt2,i1)
coup2R = cplcFuFuVZR(gt2,i1)
coup3 = -cplSdcSdVZ(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fu], conj[Sd], VZp}
Do i1=1,3
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MVZp 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplcFuFuVZpL(gt2,i1)
coup2R = cplcFuFuVZpR(gt2,i1)
coup3 = -cplSdcSdVZp(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Su], bar[Fd], Chi}
Do i1=1,6
  Do i2=1,3
    Do i3=1,9
ML1 = MSu(i1) 
ML2 = MFd(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaFdcSuL(gt1,i2,i1)
coup1R = cplcChaFdcSuR(gt1,i2,i1)
coup2L = cplcFuChiSuL(gt2,i3,i1)
coup2R = cplcFuChiSuR(gt2,i3,i1)
coup3L = cplcFdChiSdL(i2,i3,gt3)
coup3R = cplcFdChiSdR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Su], bar[Fd], Glu}
Do i1=1,6
  Do i2=1,3
ML1 = MSu(i1) 
ML2 = MFd(i2) 
ML3 = MGlu 
coup1L = cplcChaFdcSuL(gt1,i2,i1)
coup1R = cplcChaFdcSuR(gt1,i2,i1)
coup2L = cplcFuGluSuL(gt2,i1)
coup2R = cplcFuGluSuR(gt2,i1)
coup3L = cplcFdGluSdL(i2,gt3)
coup3R = cplcFdGluSdR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_sec_UMSSM_ChaTocFuSd


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaTocFuSd(MAh,MCha,MChi,MFd,MFu,            & 
& MGlu,Mhh,MHpm,MSd,MSu,MVG,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,MFu2,MGlu2,          & 
& Mhh2,MHpm2,MSd2,MSu2,MVG2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,           & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhSdcSd,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,          & 
& cplcChaChaVPR,cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,               & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFuChiSuL,cplcFuChiSuR,     & 
& cplcChaChiVWmL,cplcChaChiVWmR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,               & 
& cplcFuFdcHpmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,         & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZpL,              & 
& cplcFuFuVZpR,cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplhhSdcSd,           & 
& cplSdcSdVG,cplSdcSdVP,cplSdcSdVZ,cplSdcSdVZp,cplcChacFuSdL,cplcChacFuSdR,              & 
& cplSdcHpmcSu,cplSdcSucVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFd(3),MFu(3),MGlu,Mhh(6),MHpm(2),MSd(6),MSu(6),               & 
& MVG,MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFd2(3),MFu2(3),MGlu2,Mhh2(6),         & 
& MHpm2(2),MSd2(6),MSu2(6),MVG2,MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplcFuFuAhL(3,3,6),cplcFuFuAhR(3,3,6),      & 
& cplAhSdcSd(6,6,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),cplcChaChaVPL(2,2),        & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcFdChiSdL(3,9,6),   & 
& cplcFdChiSdR(3,9,6),cplcFuChiSuL(3,9,6),cplcFuChiSuR(3,9,6),cplcChaChiVWmL(2,9),       & 
& cplcChaChiVWmR(2,9),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),    & 
& cplcFuFdcHpmR(3,3,2),cplcFuFdcVWmL(3,3),cplcFuFdcVWmR(3,3),cplcFuFuhhL(3,3,6),         & 
& cplcFuFuhhR(3,3,6),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZpL(3,3),cplcFuFuVZpR(3,3),cplcFdGluSdL(3,6),& 
& cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),cplcFuGluSuR(3,6),cplhhSdcSd(6,6,6),               & 
& cplSdcSdVG(6,6),cplSdcSdVP(6,6),cplSdcSdVZ(6,6),cplSdcSdVZp(6,6),cplcChacFuSdL(2,3,6), & 
& cplcChacFuSdR(2,3,6),cplSdcHpmcSu(6,2,6),cplSdcSucVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MSd(gt3) 


! {Cha, VP, Sd}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MSd(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChacFuSdL(i1,gt2,i3)
coup2R = cplcChacFuSdR(i1,gt2,i3)
coup3 = -cplSdcSdVP(gt3,i3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VP, bar[Cha], Fu}
  Do i2=1,2
    Do i3=1,3
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MFu(i3) 
coup1L = -cplcChaChaVPR(gt1,i2)
coup1R = -cplcChaChaVPL(gt1,i2)
coup2L = cplcFuFuVPL(gt2,i3)
coup2R = cplcFuFuVPR(gt2,i3)
coup3L = cplcChacFuSdL(i2,i3,gt3)
coup3R = cplcChacFuSdR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fu], conj[Sd], VG}
Do i1=1,3
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MVG 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplcFuFuVGL(gt2,i1)
coup2R = cplcFuFuVGR(gt2,i1)
coup3 = -cplSdcSdVG(gt3,i2)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {bar[Fu], conj[Sd], VP}
Do i1=1,3
  Do i2=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MVP 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplcFuFuVPL(gt2,i1)
coup2R = cplcFuFuVPR(gt2,i1)
coup3 = -cplSdcSdVP(gt3,i2)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaTocFuSd


Subroutine Amplitude_Tree_sec_UMSSM_ChaTocFvSe(cplcChacFvSeL,cplcChacFvSeR,           & 
& MCha,MFv,MSe,MCha2,MFv2,MSe2,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MFv(3),MSe(6),MCha2(2),MFv2(3),MSe2(6)

Complex(dp), Intent(in) :: cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6)

Complex(dp) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MSe(gt3) 
! Tree-Level Vertex 
coupT1L = cplcChacFvSeL(gt1,gt2,gt3)
coupT1R = cplcChacFvSeR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_sec_UMSSM_ChaTocFvSe


Subroutine Gamma_Real_sec_UMSSM_ChaTocFvSe(MLambda,em,gs,cplcChacFvSeL,               & 
& cplcChacFvSeR,MCha,MFv,MSe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6)

Real(dp), Intent(in) :: MCha(2),MFv(3),MSe(6)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,3,6), GammarealGluon(2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,3
    Do i3=1,6
CoupL = cplcChacFvSeL(i1,i2,i3)
CoupR = cplcChacFvSeR(i1,i2,i3)
Mex1 = MCha(i1)
Mex2 = MFv(i2)
Mex3 = MSe(i3)
If (Abs(Mex1).gt.(Abs(Mex2)+Abs(Mex3))) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,0._dp,1._dp,0._dp,0._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_sec_UMSSM_ChaTocFvSe


Subroutine Amplitude_WAVE_sec_UMSSM_ChaTocFvSe(cplcChacFvSeL,cplcChacFvSeR,           & 
& ctcplcChacFvSeL,ctcplcChacFvSeR,MCha,MCha2,MFv,MFv2,MSe,MSe2,ZfFVL,ZfFVR,              & 
& ZfLm,ZfLp,ZfSe,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MFv(3),MFv2(3),MSe(6),MSe2(6)

Complex(dp), Intent(in) :: cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6)

Complex(dp), Intent(in) :: ctcplcChacFvSeL(2,3,6),ctcplcChacFvSeR(2,3,6)

Complex(dp), Intent(in) :: ZfFVL(3,3),ZfFVR(3,3),ZfLm(2,2),ZfLp(2,2),ZfSe(6,6)

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MSe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcChacFvSeL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcChacFvSeR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLp(i1,gt1)*cplcChacFvSeL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChacFvSeR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfFVR(i1,gt2)*cplcChacFvSeL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfFVL(i1,gt2))*cplcChacFvSeR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,6
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfSe(i1,gt3)*cplcChacFvSeL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfSe(i1,gt3)*cplcChacFvSeR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_ChaTocFvSe


Subroutine Amplitude_VERTEX_sec_UMSSM_ChaTocFvSe(MAh,MCha,MChi,MFe,MFv,               & 
& Mhh,MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,              & 
& MSe2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFvFvAhL,               & 
& cplcFvFvAhR,cplAhSecSe,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,              & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,  & 
& cplcFvFecVWmR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,            & 
& cplcFvFvVZpR,cplhhSecSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,               & 
& cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVP,MVWm,           & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),      & 
& cplAhSecSe(6,6,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),cplcChaChaVPL(2,2),        & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcFeChiSeL(3,9,6),   & 
& cplcFeChiSeR(3,9,6),cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),cplcChaChiVWmL(2,9),       & 
& cplcChaChiVWmR(2,9),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFvFecHpmL(3,3,2),    & 
& cplcFvFecHpmR(3,3,2),cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplcFvFvhhL(3,3,6),         & 
& cplcFvFvhhR(3,3,6),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplcFvFvVZpL(3,3),cplcFvFvVZpR(3,3),& 
& cplhhSecSe(6,6,6),cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplcChacFvSeL(2,3,6),& 
& cplcChacFvSeR(2,3,6),cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MSe(gt3) 


! {Ah, bar[Cha], Fv}
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplcFvFvAhL(gt2,i3,i1)
coup2R = cplcFvFvAhR(gt2,i3,i1)
coup3L = cplcChacFvSeL(i2,i3,gt3)
coup3R = cplcChacFvSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, Ah, Se}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MAh(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaChaAhL(gt1,i1,i2)
coup1R = cplcChaChaAhR(gt1,i1,i2)
coup2L = cplcChacFvSeL(i1,gt2,i3)
coup2R = cplcChacFvSeR(i1,gt2,i3)
coup3 = cplAhSecSe(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, hh, Se}
Do i1=1,2
  Do i2=1,6
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = Mhh(i2) 
ML3 = MSe(i3) 
coup1L = cplcChaChahhL(gt1,i1,i2)
coup1R = cplcChaChahhR(gt1,i1,i2)
coup2L = cplcChacFvSeL(i1,gt2,i3)
coup2R = cplcChacFvSeR(i1,gt2,i3)
coup3 = cplhhSecSe(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Cha, VP, Se}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MSe(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChacFvSeL(i1,gt2,i3)
coup2R = cplcChacFvSeR(i1,gt2,i3)
coup3 = -cplSecSeVP(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZ, Se}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZ 
ML3 = MSe(i3) 
coup1L = -cplcChaChaVZR(gt1,i1)
coup1R = -cplcChaChaVZL(gt1,i1)
coup2L = cplcChacFvSeL(i1,gt2,i3)
coup2R = cplcChacFvSeR(i1,gt2,i3)
coup3 = -cplSecSeVZ(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Cha, VZp, Se}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVZp 
ML3 = MSe(i3) 
coup1L = -cplcChaChaVZpR(gt1,i1)
coup1R = -cplcChaChaVZpL(gt1,i1)
coup2L = cplcChacFvSeL(i1,gt2,i3)
coup2R = cplcChacFvSeR(i1,gt2,i3)
coup3 = -cplSecSeVZp(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], Sv}
Do i1=1,9
  Do i2=1,2
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MSv(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplcFvChiSvL(gt2,i1,i3)
coup2R = cplcFvChiSvR(gt2,i1,i3)
coup3 = cplSecHpmcSv(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], Sv}
Do i1=1,9
    Do i3=1,6
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MSv(i3) 
coup1L = -cplcChaChiVWmR(gt1,i1)
coup1R = -cplcChaChiVWmL(gt1,i1)
coup2L = cplcFvChiSvL(gt2,i1,i3)
coup2R = cplcFvChiSvR(gt2,i1,i3)
coup3 = -cplSecSvcVWm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, bar[Cha], Fv}
Do i1=1,6
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MFv(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplcFvFvhhL(gt2,i3,i1)
coup2R = cplcFvFvhhR(gt2,i3,i1)
coup3L = cplcChacFvSeL(i2,i3,gt3)
coup3R = cplcChacFvSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hpm, Chi, Fe}
Do i1=1,2
  Do i2=1,9
    Do i3=1,3
ML1 = MHpm(i1) 
ML2 = MChi(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaChiHpmL(gt1,i2,i1)
coup1R = cplcChaChiHpmR(gt1,i2,i1)
coup2L = cplcFvFecHpmL(gt2,i3,i1)
coup2R = cplcFvFecHpmR(gt2,i3,i1)
coup3L = cplcFeChiSeL(i3,i2,gt3)
coup3R = cplcFeChiSeR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VWm, Chi, Fe}
  Do i2=1,9
    Do i3=1,3
ML1 = MVWm 
ML2 = MChi(i2) 
ML3 = MFe(i3) 
coup1L = -cplcChaChiVWmR(gt1,i2)
coup1R = -cplcChaChiVWmL(gt1,i2)
coup2L = cplcFvFecVWmL(gt2,i3)
coup2R = cplcFvFecVWmR(gt2,i3)
coup3L = cplcFeChiSeL(i3,i2,gt3)
coup3R = cplcFeChiSeR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], Fv}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MFv(i3) 
coup1L = -cplcChaChaVZR(gt1,i2)
coup1R = -cplcChaChaVZL(gt1,i2)
coup2L = cplcFvFvVZL(gt2,i3)
coup2R = cplcFvFvVZR(gt2,i3)
coup3L = cplcChacFvSeL(i2,i3,gt3)
coup3R = cplcChacFvSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], Fv}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MFv(i3) 
coup1L = -cplcChaChaVZpR(gt1,i2)
coup1R = -cplcChaChaVZpL(gt1,i2)
coup2L = cplcFvFvVZpL(gt2,i3)
coup2R = cplcFvFvVZpR(gt2,i3)
coup3L = cplcChacFvSeL(i2,i3,gt3)
coup3R = cplcChacFvSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fv], conj[Se], Ah}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MAh(i3) 
coup1L = cplcChacFvSeL(gt1,i1,i2)
coup1R = cplcChacFvSeR(gt1,i1,i2)
coup2L = cplcFvFvAhL(gt2,i1,i3)
coup2R = cplcFvFvAhR(gt2,i1,i3)
coup3 = cplAhSecSe(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[Fv], conj[Se], hh}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = Mhh(i3) 
coup1L = cplcChacFvSeL(gt1,i1,i2)
coup1R = cplcChacFvSeR(gt1,i1,i2)
coup2L = cplcFvFvhhL(gt2,i1,i3)
coup2R = cplcFvFvhhR(gt2,i1,i3)
coup3 = cplhhSecSe(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[Fv], conj[Se], VZ}
Do i1=1,3
  Do i2=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MVZ 
coup1L = cplcChacFvSeL(gt1,i1,i2)
coup1R = cplcChacFvSeR(gt1,i1,i2)
coup2L = cplcFvFvVZL(gt2,i1)
coup2R = cplcFvFvVZR(gt2,i1)
coup3 = -cplSecSeVZ(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fv], conj[Se], VZp}
Do i1=1,3
  Do i2=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MVZp 
coup1L = cplcChacFvSeL(gt1,i1,i2)
coup1R = cplcChacFvSeR(gt1,i1,i2)
coup2L = cplcFvFvVZpL(gt2,i1)
coup2R = cplcFvFvVZpR(gt2,i1)
coup3 = -cplSecSeVZp(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Sv], bar[Fe], Chi}
Do i1=1,6
  Do i2=1,3
    Do i3=1,9
ML1 = MSv(i1) 
ML2 = MFe(i2) 
ML3 = MChi(i3) 
coup1L = cplcChaFecSvL(gt1,i2,i1)
coup1R = cplcChaFecSvR(gt1,i2,i1)
coup2L = cplcFvChiSvL(gt2,i3,i1)
coup2R = cplcFvChiSvR(gt2,i3,i1)
coup3L = cplcFeChiSeL(i2,i3,gt3)
coup3R = cplcFeChiSeR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Do
End Subroutine Amplitude_VERTEX_sec_UMSSM_ChaTocFvSe


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaTocFvSe(MAh,MCha,MChi,MFe,MFv,            & 
& Mhh,MHpm,MSe,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFe2,MFv2,Mhh2,MHpm2,              & 
& MSe2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,cplcChaChaAhR,cplcFvFvAhL,               & 
& cplcFvFvAhR,cplAhSecSe,cplcChaChahhL,cplcChaChahhR,cplcChaChaVPL,cplcChaChaVPR,        & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,              & 
& cplcChaChiHpmR,cplcFeChiSeL,cplcFeChiSeR,cplcFvChiSvL,cplcFvChiSvR,cplcChaChiVWmL,     & 
& cplcChaChiVWmR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,cplcFvFecVWmL,  & 
& cplcFvFecVWmR,cplcFvFvhhL,cplcFvFvhhR,cplcFvFvVZL,cplcFvFvVZR,cplcFvFvVZpL,            & 
& cplcFvFvVZpR,cplhhSecSe,cplSecSeVP,cplSecSeVZ,cplSecSeVZp,cplcChacFvSeL,               & 
& cplcChacFvSeR,cplSecHpmcSv,cplSecSvcVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFe(3),MFv(3),Mhh(6),MHpm(2),MSe(6),MSv(6),MVP,MVWm,           & 
& MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFe2(3),MFv2(3),Mhh2(6),MHpm2(2),MSe2(6),           & 
& MSv2(6),MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplcFvFvAhL(3,3,6),cplcFvFvAhR(3,3,6),      & 
& cplAhSecSe(6,6,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),cplcChaChaVPL(2,2),        & 
& cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplcChaChaVZpL(2,2),          & 
& cplcChaChaVZpR(2,2),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),cplcFeChiSeL(3,9,6),   & 
& cplcFeChiSeR(3,9,6),cplcFvChiSvL(3,9,6),cplcFvChiSvR(3,9,6),cplcChaChiVWmL(2,9),       & 
& cplcChaChiVWmR(2,9),cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFvFecHpmL(3,3,2),    & 
& cplcFvFecHpmR(3,3,2),cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplcFvFvhhL(3,3,6),         & 
& cplcFvFvhhR(3,3,6),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplcFvFvVZpL(3,3),cplcFvFvVZpR(3,3),& 
& cplhhSecSe(6,6,6),cplSecSeVP(6,6),cplSecSeVZ(6,6),cplSecSeVZp(6,6),cplcChacFvSeL(2,3,6),& 
& cplcChacFvSeR(2,3,6),cplSecHpmcSv(6,2,6),cplSecSvcVWm(6,6)

Complex(dp), Intent(out) :: Amp(2,2,3,6) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,6
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MSe(gt3) 


! {Cha, VP, Se}
Do i1=1,2
    Do i3=1,6
ML1 = MCha(i1) 
ML2 = MVP 
ML3 = MSe(i3) 
coup1L = -cplcChaChaVPR(gt1,i1)
coup1R = -cplcChaChaVPL(gt1,i1)
coup2L = cplcChacFvSeL(i1,gt2,i3)
coup2R = cplcChacFvSeR(i1,gt2,i3)
coup3 = -cplSecSeVP(gt3,i3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaTocFvSe


Subroutine Amplitude_WAVE_sec_UMSSM_ChaToChaVP(cplcChaChaVPL,cplcChaChaVPR,           & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,ctcplcChaChaVPL,             & 
& ctcplcChaChaVPR,ctcplcChaChaVZL,ctcplcChaChaVZR,ctcplcChaChaVZpL,ctcplcChaChaVZpR,     & 
& MCha,MCha2,MVP,MVP2,ZfLm,ZfLp,ZfVP,ZfVZpVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MCha(2),MCha2(2),MVP,MVP2

Complex(dp), Intent(in) :: cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),          & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2)

Complex(dp), Intent(in) :: ctcplcChaChaVPL(2,2),ctcplcChaChaVPR(2,2),ctcplcChaChaVZL(2,2),ctcplcChaChaVZR(2,2),  & 
& ctcplcChaChaVZpL(2,2),ctcplcChaChaVZpR(2,2)

Complex(dp), Intent(in) :: ZfLm(2,2),ZfLp(2,2),ZfVP,ZfVZpVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVP 
ZcoupT1L = 0._dp 
ZcoupT1R = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfLm(i1,gt1))*cplcChaChaVPL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfLp(i1,gt1)*cplcChaChaVPR(i1,gt2)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfLm(i1,gt2)*cplcChaChaVPL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfLp(i1,gt2))*cplcChaChaVPR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZVP*cplcChaChaVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZVP*cplcChaChaVZR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZpVP*cplcChaChaVZpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZpVP*cplcChaChaVZpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_sec_UMSSM_ChaToChaVP


Subroutine Amplitude_VERTEX_sec_UMSSM_ChaToChaVP(MAh,MCha,MChi,MFd,MFe,               & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,             & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,              & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVPL,cplcFdFdVPR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplcFeFeVPL,cplcFeFeVPR,cplcChaFecSvL,cplcChaFecSvR,cplcFuFuVPL,         & 
& cplcFuFuVPR,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplcChacFuSdL,cplcChacFuSdR,          & 
& cplSecSeVP,cplcChacFvSeL,cplcChacFvSeR,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFd(3),MFe(3),MFu(3),MFv(3),Mhh(6),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFd2(3),              & 
& MFe2(3),MFu2(3),MFv2(3),Mhh2(6),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),              & 
& MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),& 
& cplChiChacVWmL(9,2),cplChiChacVWmR(9,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),       & 
& cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),     & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),       & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),   & 
& cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),             & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),           & 
& cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),           & 
& cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVP(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),& 
& cplSecSeVP(6,6),cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),cplSucSuVP(6,6),             & 
& cplcHpmVPVWm(2),cplcVWmVPVWm

Complex(dp), Intent(out) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVP 


! {Ah, bar[Cha], bar[Cha]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = MAh(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaAhL(gt1,i2,i1)
coup1R = cplcChaChaAhR(gt1,i2,i1)
coup2L = cplcChaChaAhL(i3,gt2,i1)
coup2R = cplcChaChaAhR(i3,gt2,i1)
coup3L = cplcChaChaVPL(i2,i3)
coup3R = cplcChaChaVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[Hpm], conj[Hpm]}
Do i1=1,9
  Do i2=1,2
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MHpm(i3) 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplHpmcHpmVP(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Chi, conj[VWm], conj[Hpm]}
Do i1=1,9
    Do i3=1,2
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MHpm(i3) 
coup1L = cplcChaChiVWmL(gt1,i1)
coup1R = cplcChaChiVWmR(gt1,i1)
coup2L = cplChiChacHpmL(i1,gt2,i3)
coup2R = cplChiChacHpmR(i1,gt2,i3)
coup3 = cplHpmcVWmVP(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Chi, conj[Hpm], conj[VWm]}
Do i1=1,9
  Do i2=1,2
ML1 = MChi(i1) 
ML2 = MHpm(i2) 
ML3 = MVWm 
coup1L = cplcChaChiHpmL(gt1,i1,i2)
coup1R = cplcChaChiHpmR(gt1,i1,i2)
coup2L = cplChiChacVWmL(i1,gt2)
coup2R = cplChiChacVWmR(i1,gt2)
coup3 = cplcHpmVPVWm(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Chi, conj[VWm], conj[VWm]}
Do i1=1,9
ML1 = MChi(i1) 
ML2 = MVWm 
ML3 = MVWm 
coup1L = cplcChaChiVWmL(gt1,i1)
coup1R = cplcChaChiVWmR(gt1,i1)
coup2L = cplChiChacVWmL(i1,gt2)
coup2R = cplChiChacVWmR(i1,gt2)
coup3 = -cplcVWmVPVWm
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, Su, Su}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFd(i1) 
ML2 = MSu(i2) 
ML3 = MSu(i3) 
coup1L = cplcChaFdcSuL(gt1,i1,i2)
coup1R = cplcChaFdcSuR(gt1,i1,i2)
coup2L = cplcFdChaSuL(i1,gt2,i3)
coup2R = cplcFdChaSuR(i1,gt2,i3)
coup3 = -cplSucSuVP(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {hh, bar[Cha], bar[Cha]}
Do i1=1,6
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChahhL(gt1,i2,i1)
coup1R = cplcChaChahhR(gt1,i2,i1)
coup2L = cplcChaChahhL(i3,gt2,i1)
coup2R = cplcChaChahhR(i3,gt2,i1)
coup3L = cplcChaChaVPL(i2,i3)
coup3R = cplcChaChaVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Sd, Fu, Fu}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSd(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcChacFuSdL(gt1,i2,i1)
coup1R = cplcChacFuSdR(gt1,i2,i1)
coup2L = cplChaFucSdL(gt2,i3,i1)
coup2R = cplChaFucSdR(gt2,i3,i1)
coup3L = -cplcFuFuVPR(i3,i2)
coup3R = -cplcFuFuVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {VP, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVPL(gt1,i2)
coup1R = cplcChaChaVPR(gt1,i2)
coup2L = cplcChaChaVPL(i3,gt2)
coup2R = cplcChaChaVPR(i3,gt2)
coup3L = cplcChaChaVPL(i2,i3)
coup3R = cplcChaChaVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVZL(gt1,i2)
coup1R = cplcChaChaVZR(gt1,i2)
coup2L = cplcChaChaVZL(i3,gt2)
coup2R = cplcChaChaVZR(i3,gt2)
coup3L = cplcChaChaVPL(i2,i3)
coup3R = cplcChaChaVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZp, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZp 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVZpL(gt1,i2)
coup1R = cplcChaChaVZpR(gt1,i2)
coup2L = cplcChaChaVZpL(i3,gt2)
coup2R = cplcChaChaVZpR(i3,gt2)
coup3L = cplcChaChaVPL(i2,i3)
coup3R = cplcChaChaVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fu], conj[Sd], conj[Sd]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFu(i1) 
ML2 = MSd(i2) 
ML3 = MSd(i3) 
coup1L = cplcChacFuSdL(gt1,i1,i2)
coup1R = cplcChacFuSdR(gt1,i1,i2)
coup2L = cplChaFucSdL(gt2,i1,i3)
coup2R = cplChaFucSdR(gt2,i1,i3)
coup3 = cplSdcSdVP(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {bar[Fv], conj[Se], conj[Se]}
Do i1=1,3
  Do i2=1,6
    Do i3=1,6
ML1 = MFv(i1) 
ML2 = MSe(i2) 
ML3 = MSe(i3) 
coup1L = cplcChacFvSeL(gt1,i1,i2)
coup1R = cplcChacFvSeR(gt1,i1,i2)
coup2L = cplChaFvcSeL(gt2,i1,i3)
coup2R = cplChaFvcSeR(gt2,i1,i3)
coup3 = cplSecSeVP(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Su], bar[Fd], bar[Fd]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSu(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcChaFdcSuL(gt1,i2,i1)
coup1R = cplcChaFdcSuR(gt1,i2,i1)
coup2L = cplcFdChaSuL(i3,gt2,i1)
coup2R = cplcFdChaSuR(i3,gt2,i1)
coup3L = cplcFdFdVPL(i2,i3)
coup3R = cplcFdFdVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {conj[Sv], bar[Fe], bar[Fe]}
Do i1=1,6
  Do i2=1,3
    Do i3=1,3
ML1 = MSv(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcChaFecSvL(gt1,i2,i1)
coup1R = cplcChaFecSvR(gt1,i2,i1)
coup2L = cplcFeChaSvL(i3,gt2,i1)
coup2R = cplcFeChaSvR(i3,gt2,i1)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_sec_UMSSM_ChaToChaVP


Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaVP(MAh,MCha,MChi,MFd,MFe,            & 
& MFu,MFv,Mhh,MHpm,MSd,MSe,MSu,MSv,MVP,MVWm,MVZ,MVZp,MAh2,MCha2,MChi2,MFd2,              & 
& MFe2,MFu2,MFv2,Mhh2,MHpm2,MSd2,MSe2,MSu2,MSv2,MVP2,MVWm2,MVZ2,MVZp2,cplcChaChaAhL,     & 
& cplcChaChaAhR,cplChiChacHpmL,cplChiChacHpmR,cplChiChacVWmL,cplChiChacVWmR,             & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplcChaChaVPL,cplcChaChaVPR,       & 
& cplcChaChaVZL,cplcChaChaVZR,cplcChaChaVZpL,cplcChaChaVZpR,cplcChaChiHpmL,              & 
& cplcChaChiHpmR,cplcChaChiVWmL,cplcChaChiVWmR,cplcFdFdVPL,cplcFdFdVPR,cplcChaFdcSuL,    & 
& cplcChaFdcSuR,cplcFeFeVPL,cplcFeFeVPR,cplcChaFecSvL,cplcChaFecSvR,cplcFuFuVPL,         & 
& cplcFuFuVPR,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplcChacFuSdL,cplcChacFuSdR,          & 
& cplSecSeVP,cplcChacFvSeL,cplcChacFvSeR,cplSucSuVP,cplcHpmVPVWm,cplcVWmVPVWm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh(6),MCha(2),MChi(9),MFd(3),MFe(3),MFu(3),MFv(3),Mhh(6),MHpm(2),MSd(6),             & 
& MSe(6),MSu(6),MSv(6),MVP,MVWm,MVZ,MVZp,MAh2(6),MCha2(2),MChi2(9),MFd2(3),              & 
& MFe2(3),MFu2(3),MFv2(3),Mhh2(6),MHpm2(2),MSd2(6),MSe2(6),MSu2(6),MSv2(6),              & 
& MVP2,MVWm2,MVZ2,MVZp2

Complex(dp), Intent(in) :: cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),& 
& cplChiChacVWmL(9,2),cplChiChacVWmR(9,2),cplChaFucSdL(2,3,6),cplChaFucSdR(2,3,6),       & 
& cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChahhL(2,2,6),cplcChaChahhR(2,2,6),     & 
& cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvL(3,2,6),cplcFeChaSvR(3,2,6),       & 
& cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),           & 
& cplcChaChaVZpL(2,2),cplcChaChaVZpR(2,2),cplcChaChiHpmL(2,9,2),cplcChaChiHpmR(2,9,2),   & 
& cplcChaChiVWmL(2,9),cplcChaChiVWmR(2,9),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),             & 
& cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),           & 
& cplcChaFecSvL(2,3,6),cplcChaFecSvR(2,3,6),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),           & 
& cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVP(6,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),& 
& cplSecSeVP(6,6),cplcChacFvSeL(2,3,6),cplcChacFvSeR(2,3,6),cplSucSuVP(6,6),             & 
& cplcHpmVPVWm(2),cplcVWmVPVWm

Complex(dp), Intent(out) :: Amp(4,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MCha(gt1) 
Mex2 = MCha(gt2) 
Mex3 = MVP 


! {VP, bar[Cha], bar[Cha]}
  Do i2=1,2
    Do i3=1,2
ML1 = MVP 
ML2 = MCha(i2) 
ML3 = MCha(i3) 
coup1L = cplcChaChaVPL(gt1,i2)
coup1R = cplcChaChaVPR(gt1,i2)
coup2L = cplcChaChaVPL(i3,gt2)
coup2R = cplcChaChaVPR(i3,gt2)
coup3L = cplcChaChaVPL(i2,i3)
coup3R = cplcChaChaVPR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_sec_UMSSM_ChaToChaVP



End Module OneLoopDecay_Cha_sec_UMSSM
