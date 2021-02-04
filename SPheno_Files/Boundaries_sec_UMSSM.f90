! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 1:12 on 7.11.2019   
! ----------------------------------------------------------------------  
 
 
Module Boundaries_sec_UMSSM 
 
Use Control 
Use Settings 
Use LoopCouplings_sec_UMSSM 
Use LoopMasses_sec_UMSSM 
Use LoopFunctions 
Use Mathematics 
Use Model_Data_sec_UMSSM 
Use RGEs_sec_UMSSM 
Use RunSM_sec_UMSSM 
 
Use Tadpoles_sec_UMSSM 
Use RGEs_SM_HC 
Use LoopMasses_SM_HC 
Use StandardModel 
 
Integer, save :: YukScen 
Real(dp), save :: Lambda, MlambdaS,F_GMSB 
Real(dp),save::mGUT_save,sinW2_Q_mZ&
&, mf_l_Q_SM(3),mf_d_Q_SM(3),mf_u_Q_SM(3) & 
&, mf_l_MS_SM(3),mf_d_MS_SM(3),mf_u_MS_SM(3) 
Complex(dp),save::Yl_mZ(3,3),Yu_mZ(3,3),Yd_mZ(3,3),Yl_Q(3,3),Yu_Q(3,3),Yd_Q(3,3)
Real(dp),Save::vevs_DR_save(2), vSM_save
Contains 
 
Subroutine BoundarySUSY(gA,gB) 
Implicit None 
Real(dp),Intent(in)::gA(:)
Real(dp),Intent(out)::gB(:)
Integer::i1,i2,i_count,kont
Complex(dp) :: Tad1Loop(6) 
Real(dp) :: comp(6) 
Complex(dp) :: cplAhAhUhh(6,6,6),cplAhUhhhh(6,6,6),cplAhUhhVZ(6,6),cplAhUhhVZp(6,6),cplcChaChaUhhL(2,2,6),& 
& cplcChaChaUhhR(2,2,6),cplChiChiUhhL(9,9,6),cplChiChiUhhR(9,9,6),cplcFdFdUhhL(3,3,6),   & 
& cplcFdFdUhhR(3,3,6),cplcFeFeUhhL(3,3,6),cplcFeFeUhhR(3,3,6),cplcFuFuUhhL(3,3,6),       & 
& cplcFuFuUhhR(3,3,6),cplcFvFvUhhL(3,3,6),cplcFvFvUhhR(3,3,6),cplcgWmgWmUhh(6),          & 
& cplcgWpCgWpCUhh(6),cplcgZgZUhh(6),cplcgZpgZUhh(6),cplcgZgZpUhh(6),cplcgZpgZpUhh(6),    & 
& cplUhhhhhh(6,6,6),cplUhhHpmcHpm(6,2,2),cplUhhHpmcVWm(6,2),cplUhhSdcSd(6,6,6),          & 
& cplUhhSecSe(6,6,6),cplUhhSucSu(6,6,6),cplUhhSvcSv(6,6,6),cplUhhcVWmVWm(6),             & 
& cplUhhVZVZ(6),cplUhhVZVZp(6),cplUhhVZpVZp(6),cplAhAhUhhUhh(6,6,6,6),cplUhhUhhhhhh(6,6,6,6),& 
& cplUhhUhhHpmcHpm(6,6,2,2),cplUhhUhhSdcSd(6,6,6,6),cplUhhUhhSecSe(6,6,6,6),             & 
& cplUhhUhhSucSu(6,6,6,6),cplUhhUhhSvcSv(6,6,6,6),cplUhhUhhcVWmVWm(6,6),cplUhhUhhVZVZ(6,6),& 
& cplUhhUhhVZpVZp(6,6)

Real(dp) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp) :: vd,vu,vS,vS1,vS2,vS3

Iname=Iname+1
NameOfUnit(Iname)='BoundarySUSY'
Call GToParameters278(gA,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,               & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 vS = vSInput
vS1 = v1Input
vS2 = v2Input
vS3 = v3Input
kap = KappaInput
lam = LambdaInput
Yv = YvIN
else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 vS = vSIN 
 vS1 = vS1IN 
 vS2 = vS2IN 
 vS3 = vS3IN 
 gp = gpIN 
 lam = lamIN 
 Yv = YvIN 
 kap = kapIN 
 Td = TdIN 
 Te = TeIN 
 Tlam = TlamIN 
 Tv = TvIN 
 Tk = TkIN 
 Tu = TuIN 
 mq2 = mq2IN 
 ml2 = ml2IN 
 mHd2 = mHd2IN 
 mHu2 = mHu2IN 
 md2 = md2IN 
 mu2 = mu2IN 
 me2 = me2IN 
 ms2 = ms2IN 
 ms12 = ms12IN 
 ms22 = ms22IN 
 ms32 = ms32IN 
 mv2 = mv2IN 
 M1 = M1IN 
 M2 = M2IN 
 M3 = M3IN 
 M4 = M4IN 
 vd = (2*Sqrt(mz2/(g1**2 + g2**2)))/Sqrt(1 + TanBeta**2)
vu = (2*Sqrt(mz2/(g1**2 + g2**2))*TanBeta)/Sqrt(1 + TanBeta**2)
End if
 
 ! ----------------------- 
 
If (.Not.FirstRun) Then 
vd = vdSUSY 
vu = vuSUSY 
vS = vSSUSY 
vS1 = vS1SUSY 
vS2 = vS2SUSY 
vS3 = vS3SUSY 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 vS = vSInput
vS1 = v1Input
vS2 = v2Input
vS3 = v3Input
kap = KappaInput
lam = LambdaInput
Yv = YvIN
else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 vS = vSIN 
 vS1 = vS1IN 
 vS2 = vS2IN 
 vS3 = vS3IN 
 gp = gpIN 
 lam = lamIN 
 Yv = YvIN 
 kap = kapIN 
 Td = TdIN 
 Te = TeIN 
 Tlam = TlamIN 
 Tv = TvIN 
 Tk = TkIN 
 Tu = TuIN 
 mq2 = mq2IN 
 ml2 = ml2IN 
 mHd2 = mHd2IN 
 mHu2 = mHu2IN 
 md2 = md2IN 
 mu2 = mu2IN 
 me2 = me2IN 
 ms2 = ms2IN 
 ms12 = ms12IN 
 ms22 = ms22IN 
 ms32 = ms32IN 
 mv2 = mv2IN 
 M1 = M1IN 
 M2 = M2IN 
 M3 = M3IN 
 M4 = M4IN 
 vd = (2*Sqrt(mz2/(g1**2 + g2**2)))/Sqrt(1 + TanBeta**2)
vu = (2*Sqrt(mz2/(g1**2 + g2**2))*TanBeta)/Sqrt(1 + TanBeta**2)
End if
 
 ! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

End if 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG278(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,gB)

Iname=Iname-1
End Subroutine BoundarySUSY 
 
Subroutine BoundaryHS(gA,gB,mGUT) 
Implicit None 
Real(dp),Intent(in)::gA(:)
Real(dp),Intent(in)::mGUT
Real(dp),Intent(out)::gB(:)
Integer::i1,i2
Real(dp) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp) :: Yd_ckm(3,3), Yu_ckm(3,3), Tu_ckm(3,3), Td_ckm(3,3), mq2_ckm(3,3), mu2_ckm(3,3), md2_ckm(3,3) 
Complex(dp) :: Yd_out(3,3), Yu_out(3,3), Tu_out(3,3), Td_out(3,3), mq2_out(3,3), mu2_out(3,3), md2_out(3,3) 
Iname=Iname+1
NameOfUnit(Iname)='BoundaryHS'
Call GToParameters278(gA,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,               & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4)

If (HighScaleModel.ne."LOW") Then 
 If (InputValueforg1) Then 
g1 = g1IN 
Else 
g1 = Sqrt(g1**2 + g2**2)/sqrt(2._dp)
End If 
If (InputValueforg2) Then 
g2 = g2IN 
Else 
g2 = g1
End If 
If (InputValueforgp) Then 
gp = gpIN 
Else 
gp = g1
End If 
gpg1 = 0._dp
g1gp = 0._dp
If (InputValueforTe) Then 
Te = TeIN 
Else 
Te = Azero*Ye
End If 
If (InputValueforTd) Then 
Td = TdIN 
Else 
Td = Azero*Yd
End If 
If (InputValueforTu) Then 
Tu = TuIN 
Else 
Tu = Azero*Yu
End If 
If (InputValueforTv) Then 
Tv = TvIN 
Else 
Tv = Azero*Yv
End If 
If (InputValueformq2) Then 
mq2 = mq2IN 
Else 
mq2 = 0._dp 
Do i1=1,3
mq2(i1,i1) = m0**2
End Do
End If 
If (InputValueforml2) Then 
ml2 = ml2IN 
Else 
ml2 = 0._dp 
Do i1=1,3
ml2(i1,i1) = m0**2
End Do
End If 
If (InputValueformd2) Then 
md2 = md2IN 
Else 
md2 = 0._dp 
Do i1=1,3
md2(i1,i1) = m0**2
End Do
End If 
If (InputValueformu2) Then 
mu2 = mu2IN 
Else 
mu2 = 0._dp 
Do i1=1,3
mu2(i1,i1) = m0**2
End Do
End If 
If (InputValueforme2) Then 
me2 = me2IN 
Else 
me2 = 0._dp 
Do i1=1,3
me2(i1,i1) = m0**2
End Do
End If 
If (InputValueformv2) Then 
mv2 = mv2IN 
Else 
mv2 = 0._dp 
Do i1=1,3
mv2(i1,i1) = m0**2
End Do
End If 
If (InputValueforTk) Then 
Tk = TkIN 
Else 
Tk = AKappaInput*kap
End If 
If (InputValueforTlam) Then 
Tlam = TlamIN 
Else 
Tlam = ALambdaInput*lam
End If 
If (InputValueforM1) Then 
M1 = M1IN 
Else 
M1 = m12
End If 
If (InputValueforM2) Then 
M2 = M2IN 
Else 
M2 = m12
End If 
If (InputValueforM3) Then 
M3 = M3IN 
Else 
M3 = m12
End If 
If (InputValueforM4) Then 
M4 = M4IN 
Else 
M4 = m12
End If 
else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 vS = vSIN 
 vS1 = vS1IN 
 vS2 = vS2IN 
 vS3 = vS3IN 
 gp = gpIN 
 lam = lamIN 
 Yv = YvIN 
 kap = kapIN 
 Td = TdIN 
 Te = TeIN 
 Tlam = TlamIN 
 Tv = TvIN 
 Tk = TkIN 
 Tu = TuIN 
 mq2 = mq2IN 
 ml2 = ml2IN 
 mHd2 = mHd2IN 
 mHu2 = mHu2IN 
 md2 = md2IN 
 mu2 = mu2IN 
 me2 = me2IN 
 ms2 = ms2IN 
 ms12 = ms12IN 
 ms22 = ms22IN 
 ms32 = ms32IN 
 mv2 = mv2IN 
 M1 = M1IN 
 M2 = M2IN 
 M3 = M3IN 
 M4 = M4IN 
 vd = (2*Sqrt(mz2/(g1**2 + g2**2)))/Sqrt(1 + TanBeta**2)
vu = (2*Sqrt(mz2/(g1**2 + g2**2))*TanBeta)/Sqrt(1 + TanBeta**2)
End if
 
 g1GUT =g1
g2GUT =g2
g3GUT =g3
gpGUT =gp
YdGUT =Yd
YeGUT =Ye
lamGUT =lam
YvGUT =Yv
kapGUT =kap
YuGUT =Yu
TdGUT =Td
TeGUT =Te
TlamGUT =Tlam
TvGUT =Tv
TkGUT =Tk
TuGUT =Tu
mq2GUT =mq2
ml2GUT =ml2
mHd2GUT =mHd2
mHu2GUT =mHu2
md2GUT =md2
mu2GUT =mu2
me2GUT =me2
ms2GUT =ms2
ms12GUT =ms12
ms22GUT =ms22
ms32GUT =ms32
mv2GUT =mv2
M1GUT =M1
M2GUT =M2
M3GUT =M3
M4GUT =M4
If (Maxval(Abs(Yd)).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale Yd" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Maxval(Abs(Ye)).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale Ye" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Abs(lam).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale lam" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Maxval(Abs(Yv)).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale Yv" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Abs(kap).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale kap" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Maxval(Abs(Yu)).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale Yu" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Abs(g1).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale appearing for: g1" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Abs(g2).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale appearing for: g2" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Abs(g3).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale appearing for: g3" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 
If (Abs(gp).gt.3._dp) Then 
Write(*,*) "Non pertubative coupling at GUT scale appearing for: gp" 
If (ErrorLevel.gt.0) Call TerminateProgram 
End if 



! Translate input form SCKM to electroweak basis 
If (SwitchToSCKM) Then
Yd_ckm = Yd(1:3,1:3) 
Yu_ckm = Yu(1:3,1:3) 
Td_ckm = Td(1:3,1:3) 
Tu_ckm = Tu(1:3,1:3) 
mq2_ckm = mq2(1:3,1:3) 
md2_ckm = md2(1:3,1:3) 
mu2_ckm = mu2(1:3,1:3) 
Call Switch_from_superCKM(Yd_ckm, Yu_ckm, Td_ckm, Tu_ckm, md2_ckm, mq2_ckm, mu2_ckm& 
&, Td_out, Tu_out, md2_out, mq2_out, mu2_out,.True.) 
If (InputValueforTd) Td = Td_out 
If (InputValueforTu) Tu = Tu_out 
If (InputValueformq2) mq2 = mq2_out 
If (InputValueformd2) md2 = md2_out 
If (InputValueformu2) mu2 = mu2_out 
End If 



Call ParametersToG278(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,gB)

Iname=Iname-1
Contains 

Subroutine Switch_from_superCKM(Y_d, Y_u, Ad_in, Au_in, MD_in, MQ_in, MU_in &
                      &, Ad_out, Au_out, MD_out, MQ_out, MU_out, tr        &
                      &, RSd_in, RSu_in, RSd_out, RSu_out, CKM_out, Yd, Yu )
 !---------------------------------------------------------------------------
 ! shifts the parameter from the  super CKM basis to the electroweak basis
 ! written by werner Porod, 12.03.08
 !---------------------------------------------------------------------------
 Implicit None
  Complex(dp), Intent(in), Dimension(3,3) :: Y_d, Y_u, Au_in, Ad_in, MD_in &
        & , MQ_in, MU_in
  Complex(dp), Optional, Intent(in), Dimension(6,6) :: RSu_in, RSd_in
  Logical, Intent(in) :: tr  ! if true, then the matrices are transposed 
                             ! compared to low energy definition
  Complex(dp), Intent(out), Dimension(3,3) :: Au_out, Ad_out, MD_out, MQ_out &
        & , MU_out
  Complex(dp), Optional, Intent(out), Dimension(6,6) :: RSu_out, RSd_out
  Complex(dp), Optional, Intent(out) :: CKM_out(3,3)
  Complex(dp), Optional, Intent(out) :: Yd(3), Yu(3)

  Complex(dp), Dimension(3,3) :: uU_L, uU_R, uD_L, uD_R, CKM_Q
  Complex(dp) :: rot(6,6), Ephi

  Real(dp) :: mf(3), s12, s23, aR, aI, s13, c13
  Integer :: ierr

  !------------------------------------------
  ! diagonalizing d- and u-Yukawa couplings
  ! I am only interested in the mixing matrices
  !------------------------------------------
  If (tr) Then
   Call FermionMass(Transpose(Y_u), 1._dp, mf, uU_L, uU_R, ierr)
   If (Present(Yu)) Yu = sqrt2 * mf
   Call FermionMass(Transpose(Y_d), 1._dp, mf, uD_L, uD_R, ierr)
   If (Present(Yd)) Yd = sqrt2 * mf
  Else
   Call FermionMass(Y_u, 1._dp, mf, uU_L, uU_R, ierr)
   If (Present(Yu)) Yu = sqrt2 * mf
   Call FermionMass(Y_d, 1._dp, mf, uD_L, uD_R, ierr)
   If (Present(Yd)) Yd = sqrt2 * mf
  End If
  !---------------------------------------------------------
  ! CKM matrix at Q, shifting phases according to PDG form
  !---------------------------------------------------------
  CKM_Q =  Matmul(uU_R, Transpose(Conjg(ud_R)) )
  uD_L(1,:) = uD_L(1,:) / Conjg(CKM_Q(1,1)) * Abs(CKM_Q(1,1))
  uD_L(2,:) = uD_L(2,:) / Conjg(CKM_Q(1,2)) * Abs(CKM_Q(1,2))
  uU_L(2,:) = uU_L(2,:) / CKM_Q(2,3) * Abs(CKM_Q(2,3))
  uU_L(3,:) = uU_L(3,:) / CKM_Q(3,3) * Abs(CKM_Q(3,3))
  !-------------------------------------------------------------------
  ! also the right quark must be multiplied with the conjugate phase
  ! as otherwise the masses get complex
  !-------------------------------------------------------------------
  uD_R(1,:) = uD_R(1,:) / CKM_Q(1,1) * Abs(CKM_Q(1,1))
  uD_R(2,:) = uD_R(2,:) / CKM_Q(1,2) * Abs(CKM_Q(1,2))
  uU_R(2,:) = uU_R(2,:) / Conjg(CKM_Q(2,3)) * Abs(CKM_Q(2,3))
  uU_R(3,:) = uU_R(3,:) / Conjg(CKM_Q(3,3)) * Abs(CKM_Q(3,3))
  CKM_Q =  Matmul(uU_L, Transpose(Conjg(ud_L)) )

  !--------------------------------------------------------------
  ! one more freedom left
  !--------------------------------------------------------------
  s13 = Abs(CKM_Q(1,3))
  c13 = sqrt(1._dp - s13**2)
  s23 = Abs(CKM_Q(2,3))/c13
  s12 = Abs(CKM_Q(1,2))/c13

  aR = Real(CKM_Q(2,2),dp) + s12 * s23 * Real(CKM_Q(1,3),dp)
  aI =  s12 * s23 * Aimag(CKM_Q(1,3)) - Aimag(CKM_Q(2,2))
  Ephi = Cmplx(aR/Sqrt(aR**2+aI**2),aI/Sqrt(aR**2+aI**2),dp)

  uU_L(2:3,:) = Ephi * uU_L(2:3,:)
  uD_L(3,:) = Ephi * uD_L(3,:)
  Ephi = Conjg(Ephi)
  uU_R(2:3,:) = Ephi * uU_R(2:3,:)
  uD_R(3,:) = Ephi * uD_R(3,:)

  CKM_Q =  Matmul(uU_L, Transpose(Conjg(ud_L)) )

  If (Present(CKM_out)) CKM_out = CKM_Q
  !-------------------------------------------------------------------
  ! shifting the parameters from the super CKM basis
  !-------------------------------------------------------------------
  If (tr) Then
   Au_out = Matmul( Matmul(Transpose(uU_R), Au_in), uU_L)
   Ad_out = Matmul( Matmul(Transpose(uD_R), Ad_in), uD_L)

   MD_out = Matmul( Matmul( Transpose(Conjg(uD_R)), MD_in), uD_R)
   MU_out = Matmul( Matmul( Transpose(Conjg(uU_R)), MU_in), uU_R)
   MQ_out = Matmul( Matmul( Transpose(uD_L), MQ_in), Conjg(uD_L) )

  Else
   Au_out = Matmul( Matmul(Transpose(uU_L), Au_in), uU_R)
   Ad_out = Matmul( Matmul(Transpose(uD_L), Ad_in), uD_R)

   MD_out = Matmul( Matmul( Transpose(uD_R), MD_in), Conjg(uD_R))
   MU_out = Matmul( Matmul( Transpose(uU_R), MU_in), Conjg(uU_R))
   MQ_out = Matmul( Matmul( Transpose(Conjg(uD_L)), MQ_in), uD_L )

  End If
  !------------------------------------------------------------------
  ! to avoid numerical problems ensure that matrices are hermitian
  !-----------------------------------------------------------------
  MD_out = 0.5_dp * ( MD_out + Conjg(Transpose(MD_out)) )
  MU_out = 0.5_dp * ( MU_out + Conjg(Transpose(MU_out)) )
  MQ_out = 0.5_dp * ( MQ_out + Conjg(Transpose(MQ_out)) )

   If (Present(RSu_in).And.Present(RSu_out)) Then
    rot = 0._dp
    rot(1:3,1:3) = Conjg(uU_L)
    rot(4:6,4:6) = uU_R
    RSu_out = Matmul(RSu_in, rot)
   End If
   If (Present(RSd_in).And.Present(RSd_out)) Then
    rot = 0._dp
    rot(1:3,1:3) = Conjg(uD_L)
    rot(4:6,4:6) = uD_R
    RSd_out = Matmul(RSd_in, rot)
   End If

 End Subroutine Switch_from_superCKM
End Subroutine BoundaryHS 
 
Subroutine BoundaryEW(i_run,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,              & 
& ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,delta0,gMZ,kont)

Implicit None 
Real(dp),Intent(out)::gMZ(:)
Real(dp),Intent(inout) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp),Intent(inout) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(inout) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp),Intent(inout) :: vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),              & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWmgWmVP,      & 
& cplcgWpCgWpCVP,cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVP(6,6),cplSecSeVP(6,6),      & 
& cplSucSuVP(6,6),cplcVWmVPVWm,cplHpmcHpmVPVP(2,2),cplSdcSdVPVP(6,6),cplSecSeVPVP(6,6),  & 
& cplSucSuVPVP(6,6),cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplAhhhVZ(6,6),      & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(9,9),cplChiChiVZR(9,9),             & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplcgWmgWmVZ,cplcgWpCgWpCVZ,        & 
& cplhhVZVZ(6),cplhhVZVZp(6),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),          & 
& cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvcSvVZ(6,6),cplcVWmVWmVZ,cplAhAhVZVZ(6,6),         & 
& cplhhhhVZVZ(6,6),cplHpmcHpmVZVZ(2,2),cplSdcSdVZVZ(6,6),cplSecSeVZVZ(6,6),              & 
& cplSucSuVZVZ(6,6),cplSvcSvVZVZ(6,6),cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,   & 
& cplHpmcVWmVZp(2),cplcVWmVWmVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,  & 
& cplAhHpmcVWm(6,2),cplChiChacVWmL(9,2),cplChiChacVWmR(9,2),cplcFuFdcVWmL(3,3),          & 
& cplcFuFdcVWmR(3,3),cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplcgWpCgAcVWm,               & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,             & 
& cplhhHpmcVWm(6,2),cplhhcVWmVWm(6),cplSdcSucVWm(6,6),cplSecSvcVWm(6,6),cplAhAhcVWmVWm(6,6),& 
& cplhhhhcVWmVWm(6,6),cplHpmcHpmcVWmVWm(2,2),cplSdcSdcVWmVWm(6,6),cplSecSecVWmVWm(6,6),  & 
& cplSucSucVWmVWm(6,6),cplSvcSvcVWmVWm(6,6),cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,       & 
& cplcVWmcVWmVWmVWm3,cplcHpmVWmVZ(2),cplcHpmVPVWm(2),cplHpmcHpmVPVZ(2,2),cplSdcSdVPVZ(6,6),& 
& cplSecSeVPVZ(6,6),cplSucSuVPVZ(6,6),cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,   & 
& cplcHpmVWmVZp(2),cplHpmcHpmVPVZp(2,2),cplSdcSdVPVZp(6,6),cplSecSeVPVZp(6,6),           & 
& cplSucSuVPVZp(6,6),cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,cplcVWmVPVWmVZp3,cplAhAhVZVZp(6,6),& 
& cplhhhhVZVZp(6,6),cplHpmcHpmVZVZp(2,2),cplSdcSdVZVZp(6,6),cplSecSeVZVZp(6,6),          & 
& cplSucSuVZVZp(6,6),cplSvcSvVZVZp(6,6),cplcVWmVWmVZVZp1,cplcVWmVWmVZVZp2,               & 
& cplcVWmVWmVZVZp3

Complex(dp) :: cplcUFeFeAhL(3,3,6),cplcUFeFeAhR(3,3,6),cplcUFeChaSvL(3,2,6),cplcUFeChaSvR(3,2,6),    & 
& cplcUFeChiSeL(3,9,6),cplcUFeChiSeR(3,9,6),cplcUFeFehhL(3,3,6),cplcUFeFehhR(3,3,6),     & 
& cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),               & 
& cplcUFeFeVZpL(3,3),cplcUFeFeVZpR(3,3),cplcUFeFvHpmL(3,3,2),cplcUFeFvHpmR(3,3,2),       & 
& cplcUFeFvVWmL(3,3),cplcUFeFvVWmR(3,3),cplcUFdFdAhL(3,3,6),cplcUFdFdAhR(3,3,6),         & 
& cplcUFdChaSuL(3,2,6),cplcUFdChaSuR(3,2,6),cplcUFdChiSdL(3,9,6),cplcUFdChiSdR(3,9,6),   & 
& cplcUFdFdhhL(3,3,6),cplcUFdFdhhR(3,3,6),cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),           & 
& cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),               & 
& cplcUFdFdVZpL(3,3),cplcUFdFdVZpR(3,3),cplcUFdFuHpmL(3,3,2),cplcUFdFuHpmR(3,3,2),       & 
& cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3),cplcUFdGluSdL(3,6),cplcUFdGluSdR(3,6),           & 
& cplcUFuFuAhL(3,3,6),cplcUFuFuAhR(3,3,6),cplcUFuChiSuL(3,9,6),cplcUFuChiSuR(3,9,6),     & 
& cplcUFuFdcHpmL(3,3,2),cplcUFuFdcHpmR(3,3,2),cplcUFuFdcVWmL(3,3),cplcUFuFdcVWmR(3,3),   & 
& cplcUFuFuhhL(3,3,6),cplcUFuFuhhR(3,3,6),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFuFuVZpL(3,3),cplcUFuFuVZpR(3,3),cplcUFuGluSuL(3,6),cplcUFuGluSuR(3,6),           & 
& cplcChacUFuSdL(2,3,6),cplcChacUFuSdR(2,3,6)

Integer, Intent(in) :: i_run 
Real(dp), Intent(in) :: delta0 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4 
Complex(dp) ::uU_L(3,3),uU_R(3,3),uD_L(3,3),uD_R(3,3), NoMatrix(3,3) &
&,uL_L(3,3),uL_R(3,3)
Real(dp)::mW2_run,mZ2_run,test, D_mat(3,3)
Real(dp)::alphaMZ,alpha3,gSU2,rho,delta_rho,delta_rho0,sinW2_Q,vev2&
&,vevs_Q(2),mZ2_mZ,CosW2SinW2,gauge(3),delta,sinW2_old,delta_r&
&,p2,gSU3,tanb,xt2,fac(2),SigQCD,delta_rw,sinW2,cosW2,cosW
Real(dp),Dimension(3)::mf_d_Q,mf_l_Q,mf_u_Q
Real(dp) :: g1SM, g2SM, g3SM, vSM 
Complex(dp) :: dmZ2,dmW2,dmW2_0,yuk_tau,yuk_t,yuk_b
Complex(dp) :: SigSR_u(3,3),SigSL_u(3,3),sigR_u(3,3),SigL_u(3,3)
Complex(dp) :: SigSR_d(3,3),SigSL_d(3,3),SigR_d(3,3),SigL_d(3,3)
Complex(dp) :: SigSR_l(3,3),SigSL_l(3,3),sigR_l(3,3),SigL_l(3,3)
Complex(dp) :: YuSM(3,3),YdSM(3,3),YeSM(3,3), adCKM(3,3),Y_l_old(3,3),Y_d_old(3,3),Y_u_old(3,3) 
Complex(dp) :: uU_L_T(3,3),uU_R_T(3,3)&
&,uD_L_T(3,3),uD_R_T(3,3),uL_L_T(3,3),uL_R_T(3,3)
Logical::converge
Integer :: i_loop, i_loop_max 
Real(dp),Parameter::&
& as2loop=1._dp/24._dp+2011._dp*oo32Pi2/12._dp&
&+Log2/12._dp-oo8Pi2*Zeta3&
&,log2loop_a=123._dp*oo32Pi2,log2loop_b=33._dp*oo32Pi2
Real(dp)::Q2,logQ 


Complex(dp) ::MassFu(3,3),MassFd(3,3),MassFe(3,3) 
Iname=Iname+1
NameOfUnit(Iname)='BoundaryEW'
tanb = tanbetaMZ 
sinW2 = 1 - mW**2/mZ**2 
test = SetRenormalizationScale(mZ2) 
!-----------------
!sin(theta_W)^2
!-----------------
vSM = vSM_save 
If (i_run.Eq.1) Then
   sinW2_Q=sinW2
   sinW2_old=sinW2_Q
   Y_l=0._dp
   Do i1=1,3
       y_l(i1,i1)=sqrt2*mf_l_mZ(i1)/vevSM(1)
   End Do
   mf_l2=mf_l_mZ**2
   mf_d2=mf_d_mZ**2
   mf_u2=mf_u_mZ**2
Else
   sinW2_Q=sinW2_Q_mZ
   sinW2_old=sinW2_Q
   Y_l=Yl_mZ
   Call FermionMass(Yd_mZ,vSM,mf_d2,uD_L_T,uD_R_T,kont)
   Call FermionMass(Yl_mZ,vSM,mf_l2,uL_L_T,uL_R_T,kont)
   Call FermionMass(Yu_mZ,vSM,mf_u2,uU_L_T,uU_R_T,kont)
   mf_l2=mf_l2**2
   mf_d2=mf_d2**2
   mf_u2=mf_u2**2
End If
MFe2(1:3) = mf_l**2 
MFd2(1:3) = mf_d**2 
MFu2(1:3) = mf_u**2 
MFe = sqrt(MFe2) 
MFd = sqrt(MFd2) 
MFu = sqrt(MFu2) 
alphaMZ = AlphaEwDR(mZ,Abs(MVWm),Abs(MSd),Abs(MSu),Abs(MSe),Abs(MHpm),Abs(MCha),Abs(MFe),Abs(MFd),Abs(MFu)) 
 
MFe2(1:3) = mf_l2 
MFd2(1:3) = mf_d2 
MFu2(1:3) = mf_u2 
MFe = sqrt(MFe2) 
MFd = sqrt(MFd2) 
MFu = sqrt(MFu2) 
alpha3 = AlphaSDR(mZ,Abs(MSd),Abs(MSu),Abs(MGlu),Abs(MFd),Abs(MFu)) 
If (.not.OneLoopMatching) alpha3 = AlphaS_MZ 
If (.not.OneLoopMatching) alphaMZ= alpha_MZ_MS 
gSU3 = Sqrt(4._dp*pi*alpha3) 
g3SM = Sqrt(4._dp*pi*alpha3) 
!--------------------
!for 2-loop parts
!--------------------
xt2=3._dp*(G_F*mf_u(3)**2*oo8pi2*oosqrt2)**2&
    &*Abs(ZH(1,2))**2*rho_2(Sqrt(Mhh2(1))/mf_U(3))&
    &*((1._dp+tanb**2)/tanb**2)
fac(1)=alphaMZ*alphaS_mZ*oo4pi&
      &*(2.145_dp*mf_u(3)**2/mZ2+0.575*Log(mf_u(3)/mZ)-0.224_dp&
      &-0.144_dp*mZ2/mf_u(3)**2)/Pi
fac(2)=alphamZ*alphaS_mZ*oo4pi&
      &*(-2.145_dp*mf_u(3)**2/mW2+1.262*Log(mf_u(3)/mZ)-2.24_dp&
      &-0.85_dp*mZ2/mf_u(3)**2)/Pi
Do i1=1,100 
gSU2 = Sqrt( 4._dp*pi*alphamZ/sinW2_Q) 
g1SM =gSU2*Sqrt(sinW2_Q/(1._dp-sinW2_Q)) 
g2SM =gSU2 
YeSM=Yl_MZ
YdSM=Yd_MZ
YuSM=Yu_MZ
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.False.)

TW= Asin(Sqrt(sinw2_Q)) 

 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 
MVZ2 = mZ2 
MVZ= Sqrt(MVZ2) 
MVWm2 = mW2 
MVWm= Sqrt(MVWm2) 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
Call CouplingsForVectorBosons(g1,g2,UM,UP,TW,ZP,vd,vu,ZD,ZE,ZU,gp,ZH,ZA,              & 
& TWp,ZN,vS,vS1,vS2,vS3,ZV,ZDL,ZUL,ZVL,ZEL,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,              & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,cplSucSuVPVP,cplcVWmVPVPVWm1,    & 
& cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,    & 
& cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,              & 
& cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,             & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,      & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvcSvVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,             & 
& cplHpmcVWmVZp,cplcVWmVWmVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,     & 
& cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,  & 
& cplcFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,               & 
& cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplSdcSucVWm,cplSecSvcVWm,    & 
& cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,       & 
& cplSucSucVWmVWm,cplSvcSvcVWmVWm,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,& 
& cplcHpmVWmVZ,cplcHpmVPVWm,cplHpmcHpmVPVZ,cplSdcSdVPVZ,cplSecSeVPVZ,cplSucSuVPVZ,       & 
& cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcHpmVWmVZp,cplHpmcHpmVPVZp,         & 
& cplSdcSdVPVZp,cplSecSeVPVZp,cplSucSuVPVZp,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,           & 
& cplcVWmVPVWmVZp3,cplAhAhVZVZp,cplhhhhVZVZp,cplHpmcHpmVZVZp,cplSdcSdVZVZp,              & 
& cplSecSeVZVZp,cplSucSuVZVZp,cplSvcSvVZVZp,cplcVWmVWmVZVZp1,cplcVWmVWmVZVZp2,           & 
& cplcVWmVWmVZVZp3)

! Top pole mass to calculate delta_rho
MFu(3)=mf_u(3)
MFu2(3)=MFu(3)**2
Call Pi1LoopVZ(mZ2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSv,MSv2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,         & 
& cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,              & 
& cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,             & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,      & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvcSvVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,             & 
& kont,dmZ2)

If (.not.OneLoopMatching) dmZ2 = 0._dp 
mZ2_mZ = Real(dmZ2 + mZ2,dp) 
If (mZ2_mZ.Lt.0._dp) Then
    Iname=Iname-1
    kont=-402
    Call AddError(402)
    Write(*,*) " MZ  getting negative at EW scale" 
    Call TerminateProgram
End If

mZ2_run=mZ2_mZ
mW2_run=mZ2_mZ*(1._dp-sinW2_Q) +0  
MVZ2 = mZ2_run 
MVZ= Sqrt(MVZ2) 
MVWm2 = mW2_run 
MVWm= Sqrt(MVWm2) 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
vev2=mZ2_mZ*CosW2SinW2/(pi*alphamZ) -(0) 
vSM=Sqrt(vev2)
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.False.)

Call CouplingsForVectorBosons(g1,g2,UM,UP,TW,ZP,vd,vu,ZD,ZE,ZU,gp,ZH,ZA,              & 
& TWp,ZN,vS,vS1,vS2,vS3,ZV,ZDL,ZUL,ZVL,ZEL,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,              & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,cplSucSuVPVP,cplcVWmVPVPVWm1,    & 
& cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,    & 
& cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,              & 
& cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,             & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,      & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvcSvVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,             & 
& cplHpmcVWmVZp,cplcVWmVWmVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,     & 
& cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,  & 
& cplcFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,               & 
& cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplSdcSucVWm,cplSecSvcVWm,    & 
& cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,       & 
& cplSucSucVWmVWm,cplSvcSvcVWmVWm,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,& 
& cplcHpmVWmVZ,cplcHpmVPVWm,cplHpmcHpmVPVZ,cplSdcSdVPVZ,cplSecSeVPVZ,cplSucSuVPVZ,       & 
& cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcHpmVWmVZp,cplHpmcHpmVPVZp,         & 
& cplSdcSdVPVZp,cplSecSeVPVZp,cplSucSuVPVZp,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,           & 
& cplcVWmVPVWmVZp3,cplAhAhVZVZp,cplhhhhVZVZp,cplHpmcHpmVZVZp,cplSdcSdVZVZp,              & 
& cplSecSeVZVZp,cplSucSuVZVZp,cplSvcSvVZVZp,cplcVWmVWmVZVZp1,cplcVWmVWmVZVZp2,           & 
& cplcVWmVWmVZVZp3)

Call Pi1LoopVZ(mZ2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSv,MSv2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,         & 
& cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,              & 
& cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,             & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,      & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvcSvVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,             & 
& kont,dmZ2)

If (.not.OneLoopMatching) dmZ2 = 0._dp 
mZ2_mZ = Real(dmZ2 + mZ2,dp) 
If (mZ2_mZ.Lt.0._dp) Then
    Iname=Iname-1
    kont=-402
    Call AddError(402)
    Write(*,*) " MZ  getting negative at EW scale" 
    Call TerminateProgram
End If

mZ2_run=mZ2_mZ
mW2_run=mZ2_mZ*(1._dp-sinW2_Q) +0  
MVZ2 = mZ2_run 
MVZ= Sqrt(MVZ2) 
MVWm2 = mW2_run 
MVWm= Sqrt(MVWm2) 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
vev2=mZ2_mZ *CosW2SinW2/(pi*alphamZ) -(0) 
vSM=sqrt(vev2) 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.False.)

Call CouplingsForVectorBosons(g1,g2,UM,UP,TW,ZP,vd,vu,ZD,ZE,ZU,gp,ZH,ZA,              & 
& TWp,ZN,vS,vS1,vS2,vS3,ZV,ZDL,ZUL,ZVL,ZEL,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,              & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,cplSucSuVPVP,cplcVWmVPVPVWm1,    & 
& cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,    & 
& cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,              & 
& cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,             & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,      & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvcSvVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,             & 
& cplHpmcVWmVZp,cplcVWmVWmVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,     & 
& cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,  & 
& cplcFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,               & 
& cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplSdcSucVWm,cplSecSvcVWm,    & 
& cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,       & 
& cplSucSucVWmVWm,cplSvcSvcVWmVWm,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,& 
& cplcHpmVWmVZ,cplcHpmVPVWm,cplHpmcHpmVPVZ,cplSdcSdVPVZ,cplSecSeVPVZ,cplSucSuVPVZ,       & 
& cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcHpmVWmVZp,cplHpmcHpmVPVZp,         & 
& cplSdcSdVPVZp,cplSecSeVPVZp,cplSucSuVPVZp,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,           & 
& cplcVWmVPVWmVZp3,cplAhAhVZVZp,cplhhhhVZVZp,cplHpmcHpmVZVZp,cplSdcSdVZVZp,              & 
& cplSecSeVZVZp,cplSucSuVZVZp,cplSvcSvVZVZp,cplcVWmVWmVZVZp1,cplcVWmVWmVZVZp2,           & 
& cplcVWmVWmVZVZp3)

Call Pi1LoopVWm(mW2,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,MFu2,               & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSu,MSu2,           & 
& MSd,MSd2,MSv,MSv2,MSe,MSe2,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcFuFdcVWmL,   & 
& cplcFuFdcVWmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,  & 
& cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHpmcVWm,cplhhcVWmVWm,               & 
& cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,cplSecSvcVWm,cplcVWmVPVWm,        & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,            & 
& cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,cplSvcSvcVWmVWm,cplcVWmVPVPVWm3,       & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,& 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,   & 
& cplcVWmVWmVZpVZp3,kont,dmW2)

Call Pi1LoopVWm(0._dp,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,MFu2,             & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSu,MSu2,           & 
& MSd,MSd2,MSv,MSv2,MSe,MSe2,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcFuFdcVWmL,   & 
& cplcFuFdcVWmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,  & 
& cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHpmcVWm,cplhhcVWmVWm,               & 
& cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,cplSecSvcVWm,cplcVWmVPVWm,        & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,            & 
& cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,cplSvcSvcVWmVWm,cplcVWmVPVPVWm3,       & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,& 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,   & 
& cplcVWmVWmVZpVZp3,kont,dmW2_0)

If (.not.OneLoopMatching) dmW2 = 0._dp 
If (.not.OneLoopMatching) dmW2_0 = 0._dp 
rho=(1._dp+Real(dmZ2,dp)/mZ2)/(1._dp+Real(dmW2,dp)/mW2)  
delta_rho=1._dp-1._dp/rho
delta_rho0=0
rho=1._dp/(1._dp-delta_rho-delta_rho0)
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
If (IncludeDeltaVB) Then 
Call DeltaVB(sinW2,sinW2_Q,rho,MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,MSv,MVWm,           & 
& MVZp,g1,g2,gp,TW,TWp,UM,UP,vd,vu,Ye,Yv,ZA,ZE,ZEL,ZER,ZH,ZN,ZP,ZV,ZVL,ZVR,delta)

Else 
delta = 0._dp 
End if 
If (.not.OneLoopMatching) delta = 0._dp 
delta_r=rho*Real(dmW2_0,dp)/mW2-Real(dmZ2,dp)/mZ2+delta
rho=1._dp/(1._dp-delta_rho-delta_rho0-fac(2)/sinW2_Q-xt2)
delta_r=rho*Real(dmW2_0,dp)/mW2-Real(dmZ2,dp)/mZ2+delta&
        &+fac(1)/CosW2SinW2-xt2*(1-delta_r)*rho
CosW2SinW2=pi*alphamZ/(sqrt2*mZ2*G_F*(1-delta_r))
sinW2_Q=0.5_dp-Sqrt(0.25_dp-CosW2SinW2)

If (sinW2_Q.Lt.0._dp) Then
    kont=-403
    Call AddError(403)
    Iname=Iname-1
    Write(*,*) " sinW2 getting negtive at EW scale " 
    Call TerminateProgram
End If
 
If (Abs(sinW2_Q-sinW2_old).Lt.0.1_dp*delta0) Exit

sinW2_old=sinW2_Q
delta_rw=(delta_rho+fac(2)/sinW2_Q+xt2)*(1._dp-delta_r)+delta_r
If ((0.25_dp-alphamz*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))).Lt.0._dp) Then
    kont=-404
    Call AddError(404)
    Iname=Iname-1
     Return
End If

mW2=mZ2*rho*(0.5_dp&
    &+Sqrt(0.25_dp-alphamz*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))))
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
cosW2=mW2/mZ2
cosW=Sqrt(cosW2)
sinW2=1._dp-cosW2
End Do

MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
delta_rw=delta_rho*(1._dp-delta_r)+delta_r
mW2=mZ2*rho*(0.5_dp& 
   &+Sqrt(0.25_dp-alphamz*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))))
mW=Sqrt(mW2)
cosW2=mW2/mZ2
cosW=Sqrt(cosW2)
sinW2=1._dp-cosW2
g1SM=Sqrt(4._dp*pi*alphamZ/(1._dp-sinW2_Q))
g2SM=Sqrt(4._dp*pi*alphamZ/sinW2_Q)
g3SM=Sqrt(4._dp*pi*alpha3)
vev2=mZ2_mZ*CosW2SinW2/(pi*alphamZ) -(0) 
vSM=sqrt(vev2) 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.False.)

Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.)



! -------------------------
!  Calculate Yukawas
! -------------------------
uU_L=id3C
uU_R=id3C
uD_L=id3C
uD_R=id3C
uL_L=id3C
uL_R=id3C
If (GenerationMixing) Then
    Call Adjungate(CKM,adCKM)
 If (YukawaScheme.Eq.1) Then
    uU_L(1:3,1:3)=CKM
 Else
    uD_L(1:3,1:3)=adCKM
 End If
End If
If (i_run.Eq.1) Then
If (rMS.lt.0.5_dp) Then ! shift to DR if necessary 
   mf_l_Q_SM=&
            & mf_l_mZ*(1._dp-oo8pi2*3._dp*(g1SM**2-g2SM**2)/16._dp)
   mf_d_Q_SM=mf_d_mZ*(1._dp-alpha3/(3._dp*pi)&
           &-23._dp*alpha3**2/(72._dp*Pi2)&
           &+oo8pi2*3._dp*g2SM**2/16._dp&
           &-oo8pi2*13._dp*g1SM**2/144._dp)
   mf_u_Q_SM(1:2)=mf_u_mZ(1:2)*(1._dp-alpha3/(3._dp*pi)&
               &-23._dp*alpha3**2/(72._dp*Pi2)&
               &+oo8pi2*3._dp*g2SM**2/16._dp&
               &-oo8pi2*7._dp*g1SM**2/144._dp)
   mf_u_Q_SM(3)=mf_u(3)! QCD+QED shift will be added later
Else 
   mf_l_Q_SM=mf_l_MZ
   mf_d_Q_SM=mf_d_MZ
   mf_u_Q_SM=mf_u_MZ
End if 
mf_l_Q=mf_l_Q_SM
mf_d_Q=mf_d_Q_SM
mf_u_Q=mf_u_Q_SM
YdSM=0._dp
YuSM=0._dp
YeSM=0._dp
Do i1=1,3
    YuSM(i1,i1)=sqrt2*mf_u_Q_SM(i1)/vSM
    YeSM(i1,i1)=sqrt2*mf_l_Q_SM(i1)/vSM
    YdSM(i1,i1)=sqrt2*mf_d_Q_SM(i1)/vSM
End Do
If (GenerationMixing) Then
  If (YukawaScheme.Eq.1) Then
    YuSM=Matmul(Transpose(uU_L(1:3,1:3)),YuSM)
  Else
    YdSM=Matmul(Transpose(uD_L(1:3,1:3)),YdSM)
  End If
End If
Else
YeSM=Yl_MZ
YdSM=Yd_MZ
YuSM=Yu_MZ
End If! i_run.eq.1

converge= .False.
Y_l_old=YeSM
Y_d_old=YdSM
Y_u_old=YuSM
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.False.)



! -------------------------
!  Main Loop
! -------------------------
if (FermionMassResummation) then
  i_loop_max=100! this should be sufficient
else
  i_loop_max=1
end if
Do i_loop=1,i_loop_max
p2=0._dp! for off-diagonal elements

 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 


! Full one-loop corrections
Call CouplingsForSMfermions(Ye,ZA,ZEL,ZER,g2,Yv,ZV,UM,UP,g1,gp,ZE,ZN,ZH,              & 
& TW,TWp,ZP,ZVL,ZVR,Yd,ZDL,ZDR,Yu,ZU,ZD,g3,ZUL,ZUR,pG,cplcUFeFeAhL,cplcUFeFeAhR,         & 
& cplcUFeChaSvL,cplcUFeChaSvR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,cplcUFeFehhR,     & 
& cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,       & 
& cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,cplcUFdFdAhL,cplcUFdFdAhR,     & 
& cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,cplcUFdFdhhL,cplcUFdFdhhR,     & 
& cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,         & 
& cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,   & 
& cplcUFdGluSdL,cplcUFdGluSdR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,     & 
& cplcUFuFdcHpmL,cplcUFuFdcHpmR,cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,              & 
& cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,         & 
& cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,   & 
& cplcChacUFuSdR)

Call Sigma1LoopFeMZ(p2,MFe,MFe2,MAh,MAh2,MSv,MSv2,MCha,MCha2,MSe,MSe2,MChi,           & 
& MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFv,MFv2,MVWm,MVWm2,cplcUFeFeAhL,        & 
& cplcUFeFeAhR,cplcUFeChaSvL,cplcUFeChaSvR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,     & 
& cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,        & 
& cplcUFeFeVZpR,cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,sigR_l,          & 
& sigL_l,sigSL_l,sigSR_l)

Call Sigma1LoopFdMZ(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,MChi,           & 
& MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,MGlu2,          & 
& cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,     & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFuHpmL,cplcUFdFuHpmR,     & 
& cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,cplcUFdGluSdR,sigR_d,sigL_d,sigSL_d,sigSR_d)

Call Sigma1LoopFuMZ(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,              & 
& MFd,MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MGlu,MGlu2,MCha,MCha2,MSd,            & 
& MSd2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,             & 
& cplcUFuFdcHpmR,cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,   & 
& cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,        & 
& cplcUFuFuVZpR,cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,cplcChacUFuSdR,               & 
& sigR_u,sigL_u,sigSL_u,sigSR_u)

! Take care of the new normalisation of Sigma 
SigR_l = 0.5_dp*SigR_L 
SigL_l = 0.5_dp*SigL_L 
SigR_d = 0.5_dp*SigR_d 
SigL_d = 0.5_dp*SigL_d 
SigR_u = 0.5_dp*SigR_u 
SigL_u = 0.5_dp*SigL_u 

If (.not.OneLoopMatching) Then 
sigR_l = 0._dp 
sigL_l = 0._dp 
sigSR_l = 0._dp 
sigSL_l = 0._dp 
sigR_d = 0._dp 
sigL_d = 0._dp 
sigSR_d = 0._dp 
sigSL_d = 0._dp 
sigR_u = 0._dp 
sigL_u = 0._dp 
sigSR_u = 0._dp 
sigSL_u = 0._dp 
End if


! SM two-loop corrections
! Two-loop Non-SUSY from hep-ph/9803493
Q2=GetRenormalizationScale()
logQ=Log(Q2/MFu(3)**2)
If (OneLoopMatching) Then 
SigQCD=-4._dp/3._dp*gSU3**2*MFu(3)*(5._dp-rMS+3._dp*LogQ)&
&-MFu(3)*(-2._dp/3._dp*gSU2)**2*sinW2_Q*(5._dp-rMS+3._dp*LogQ)
Else 
SigQCD=0._dp 
End if 
If (TwoLoopMatching) Then 
SigQCD=-4._dp/3._dp*gSU3**2*MFu(3)*(5._dp-rMS+3._dp*LogQ&
&+( (as2loop + 3.5_dp*oo32pi2*rMS) + (log2loop_a - rMS*oo16pi2)*logQ + log2loop_b*logQ**2 )*gSU3**2) &
&-MFu(3)*(-2._dp/3._dp*gSU2)**2*sinW2_Q*(5._dp-rMS+3._dp*LogQ)
End if 
If (GuessTwoLoopMatchingBSM) Then 
   SigQCD=SigQCD-10._dp*gSU3**4*oo16pi2*(log(Q2/MGlu2))**2*MFu(3) 
End if 
SigQCD=oo16pi2*SigQCD

mf_u_Q_SM(3)=mf_u(3)+SigQCD



! Construct tree-level masses
! Needed for models with additional states mixing with SM particles
Call CalculateMFe(Ye,vd,ZEL,ZER,MFe,kont)

MassFe=0._dp 
Do i1 = 1,3
 MassFe(i1,i1)=MFe(i1) 
End do
MassFe = MatMul(Transpose(ZEL),MatMul(MassFe,Conjg(ZER))) 
MFe(1:3) =mf_l_Q_SM 
Call CalculateMFu(Yu,vu,ZUL,ZUR,MFu,kont)

MassFu=0._dp 
Do i1 = 1,3
 MassFu(i1,i1)=MFu(i1) 
End do
MassFu = MatMul(Transpose(ZUL),MatMul(MassFu,Conjg(ZUR))) 
MFu(1:3) =mf_u_Q_SM 
Call CalculateMFd(Yd,vd,ZDL,ZDR,MFd,kont)

MassFd=0._dp 
Do i1 = 1,3
 MassFd(i1,i1)=MFd(i1) 
End do
MassFd = MatMul(Transpose(ZDL),MatMul(MassFd,Conjg(ZDR))) 
MFd(1:3) =mf_d_Q_SM 


! Obtain Yukawas
Call Yukawas3(MFu,vSM,uU_L,uU_R,SigSL_u,SigL_u,SigR_u&
      &,massFu,YuSM, FermionMassResummation,kont) 
If (kont.Ne.0) Then 
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at EW scale failed" 
    Call TerminateProgram
End If
Call Yukawas3(MFd,vSM,uD_L,uD_R,SigSL_d,SigL_d,SigR_d& 
      &,massFd,YdSM,FermionMassResummation,kont)
If (kont.Ne.0) Then
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at EW scale failed" 
    Call TerminateProgram
End If 
Call Yukawas3(MFe,vSM,uL_L,uL_R,SigSL_l,SigL_l,SigR_l&
     &,massFe,YeSM,.False.,kont) 
If (kont.Ne.0) Then
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at EW scale failed" 
    Call TerminateProgram
End If


! Transpose Yukawas to fit conventions 
YuSM = Transpose(YuSM) 
YdSM= Transpose(YdSM)
YeSM= Transpose(YeSM)
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.False.)



! Re-calculate quarks with new Yukawas
Call CalculateMFe(Ye,vd,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 
Call CalculateMFu(Yu,vu,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
Call CalculateMFd(Yd,vd,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
mf_l_Q  = MFe(1:3) 
mf_d_Q  = MFd(1:3) 
mf_u_Q  = MFu(1:3) 


! Re-calculate other masses which depend on Yukawas
Call CalculateMSd(g1,g2,gp,Qq,QHd,QHu,Qd,Qs,Qs1,Qs2,Qs3,Yd,Td,lam,mq2,md2,            & 
& vd,vu,vS,vS1,vS2,vS3,ZD,MSd,MSd2,kont)

Call CalculateMSu(g1,g2,gp,Qq,QHd,QHu,Qu,Qs,Qs1,Qs2,Qs3,lam,Yu,Tu,mq2,mu2,            & 
& vd,vu,vS,vS1,vS2,vS3,ZU,MSu,MSu2,kont)

Call CalculateMSe(g1,g2,gp,Ql,QHd,QHu,Qe,Qs,Qs1,Qs2,Qs3,Ye,Te,lam,ml2,me2,            & 
& vd,vu,vS,vS1,vS2,vS3,ZE,MSe,MSe2,kont)



! Check convergence 
converge= .True. 
D_mat=Abs(Abs(YeSM)-Abs(Y_l_old))
Where (Abs(YeSM).Ne.0._dp) D_mat=D_mat/Abs(YeSM)
Do i1=1,3
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
  Do i2=i1+1,3 
   If (D_mat(i1,i2).Gt.delta0) converge= .False. 
   If (D_mat(i2,i1).Gt.delta0) converge= .False. 
 End Do 
End Do 
D_mat=Abs(Abs(YdSM)-Abs(Y_d_old))
Where (Abs(YdSM).Ne.0._dp) D_mat=D_mat/Abs(YdSM)
Do i1=1,3 
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
   Do i2=i1+1,3 
    If (D_mat(i1,i2).Gt.10._dp*delta0) converge= .False. 
    If (D_mat(i2,i1).Gt.10._dp*delta0) converge= .False. 
   End Do 
End Do 
D_mat=Abs(Abs(YuSM)-Abs(Y_u_old))
Where (Abs(YuSM).Ne.0._dp) D_mat=D_mat/Abs(YuSM)
Do i1=1,3
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
  Do i2=i1+1,3 
   If (D_mat(i1,i2).Gt.10._dp*delta0) converge= .False. 
   If (D_mat(i2,i1).Gt.10._dp*delta0) converge= .False. 
  End Do 
End Do
If (converge) Exit
  Y_l_old=YeSM
  Y_u_old=YuSM
  Y_d_old=YdSM
!-------------------------------------------------- 
!Either we have run into a numerical problem or 
!perturbation theory breaks down 
!-------------------------------------------------- 
If ((Minval(Abs(mf_l_Q/mf_l)).Lt.0.1_dp)&
&.Or.(Maxval(Abs(mf_l_Q/mf_l)).Gt.10._dp)) Then
Iname=Iname-1
kont=-405
Call AddError(405)
    Write(*,*) " Loop corrections to Yukawa couplings at EW scale too large!" 
    Call TerminateProgram
Else If ((Minval(Abs(mf_d_Q/mf_d)).Lt.0.1_dp)&
&.Or.(Minval(Abs(mf_d_Q/mf_d)).Gt.10._dp)) Then
Iname=Iname-1
kont=-406
Call AddError(406)
    Write(*,*) " Loop corrections to Yukawa couplings at EW scale too large!" 
    Call TerminateProgram
Else If ((Minval(Abs(mf_u_Q/mf_u)).Lt.0.1_dp)&
&.Or.(Minval(Abs(mf_u_Q/mf_u)).Gt.10._dp)) Then
Iname=Iname-1
kont=-407
Call AddError(407)
    Write(*,*) " Loop corrections to Yukawa couplings at EW scale too large!" 
    Call TerminateProgram
End If
End Do! i_loop
If ((.Not.converge).and.FermionMassResummation) Then
Write (ErrCan,*)'Problem in subroutine BoundaryEW!!'
Write (ErrCan,*) "After-1 + (i_loop)iterations no convergence of Yukawas"
End If
Yl_MZ=YeSM
Yd_MZ=YdSM
Yu_MZ=YuSM
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.False.)

Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.False.)

sinW2_Q_mZ=sinW2_Q
vSM_save=vSM
gauge_mZ=gauge

 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))


 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG278(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,gMZ)

test=SetRenormalizationScale(test)
Iname=Iname-1

Contains

Real(dp) Function rho_2(r)
Implicit None
Real(dp),Intent(in)::r
Real(dp)::r2,r3
r2=r*r
r3=r2*r
rho_2=19._dp-16.5_dp*r+43._dp*r2/12._dp&
&+7._dp*r3/120._dp&
&-Pi*Sqrt(r)*(4._dp-1.5_dp*r+3._dp*r2/32._dp&
&+r3/256._dp)&
&-Pi2*(2._dp-2._dp*r+0.5_dp*r2)&
&-Log(r)*(3._dp*r-0.5_dp*r2)
End Function rho_2


Subroutine Yukawas3(mf,vev,uL,uR,SigS,SigL,SigR,MassMatrix,Y,ReSum,kont)
Implicit None
Integer,Intent(inout)::kont
Real(dp),Intent(in)::mf(3),vev
Complex(dp),Dimension(3,3),Intent(in)::uL,uR,SigS,SigL,SigR
Logical,Intent(in)::ReSum
Complex(dp),Intent(inout)::MassMatrix(3,3)
Complex(dp),Intent(out)::Y(3,3)
Integer::i1
Complex(dp),Dimension(3,3)::mass,uLa,uRa,f,invf,invMass2,Ytemp
Call Adjungate(uL,uLa)
Call Adjungate(uR,uRa)
mass=ZeroC
Do i1=1,3
mass(i1,i1)=mf(i1)
End Do
mass=Matmul(Transpose(uL),Matmul(mass,uR))
If (ReSum) Then
kont=0
Call chop(MassMatrix)
invMass2=MassMatrix
Call gaussj(kont,invMass2,3,3)
If (kont.Ne.0) Return
f=id3C-Matmul(SigS,invMass2)-Transpose(SigL)-Matmul(MassMatrix,Matmul(SigR,invMass2))
invf=f
Call gaussj(kont,invf,3,3)
If (kont.Ne.0) Return
Ytemp=Matmul(invf,mass)
Else
Ytemp=mass+SigS+Matmul(Transpose(SigL),MassMatrix)+Matmul(MassMatrix,SigR)
End If
Y=sqrt2*Ytemp(1:3,1:3)/vev
Call chop(y)
End Subroutine Yukawas3

End Subroutine BoundaryEW 
 
Subroutine BoundarySM(i_run,Lambda_SM,delta0,g_SM,kont)

Implicit None 
Real(dp), Intent(out)::g_SM(62)
Integer, Intent(in) :: i_run 
Real(dp) :: mHiggs 
Real(dp), Intent(in) :: delta0 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4 
Real(dp)::mW2_run,mZ2_run,test, D_mat(3,3)
Real(dp)::alphaMZ,alpha3,gSU2,rho,delta_rho,delta_rho0,sinW2_Q,vev2&
&,vevs_Q(2),mZ2_mZ,CosW2SinW2,gauge(3),delta,sinW2_old,delta_r&
&,p2,gSU3,tanb,xt2,fac(2),SigQCD,delta_rw,sinW2,cosW2,cosW
Real(dp),Dimension(3)::mf_d_Q,mf_l_Q,mf_u_Q
Real(dp) :: g1SM, g2SM, g3SM, vSM 
Complex(dp) :: dmZ2,dmW2,dmW2_0,yuk_tau,yuk_t,yuk_b
Complex(dp) ::uU_L(3,3),uU_R(3,3),uD_L(3,3),uD_R(3,3), NoMatrix(3,3) &
&,uL_L(3,3),uL_R(3,3)
Complex(dp) ::uU_L_T(3,3),uU_R_T(3,3),uD_L_T(3,3),uD_R_T(3,3),uL_L_T(3,3),uL_R_T(3,3)
Complex(dp) :: SigSR_u(3,3),SigSL_u(3,3),sigR_u(3,3),SigL_u(3,3)
Complex(dp) :: SigSR_d(3,3),SigSL_d(3,3),SigR_d(3,3),SigL_d(3,3)
Complex(dp) :: SigSR_l(3,3),SigSL_l(3,3),sigR_l(3,3),SigL_l(3,3)
Complex(dp) :: YuSM(3,3),YdSM(3,3),YeSM(3,3), MuSM, adCKM(3,3),Y_l_old(3,3),Y_d_old(3,3),Y_u_old(3,3) 
Complex(dp), Intent(in) :: Lambda_SM 
Logical::converge
Integer :: i_loop, i_loop_max 
Real(dp),Parameter::&
& as2loop=1._dp/24._dp+2011._dp*oo32Pi2/12._dp&
&+Log2/12._dp-oo8Pi2*Zeta3&
&,log2loop_a=123._dp*oo32Pi2,log2loop_b=33._dp*oo32Pi2
Real(dp) :: Q2, logQ 


Complex(dp) ::MassFu(3,3),MassFd(3,3),MassFe(3,3) 
Iname=Iname+1
NameOfUnit(Iname)='BoundarySM'
sinW2 = 1 - mW**2/mZ**2 
test = SetRenormalizationScale(mZ2) 
!-----------------
!sin(theta_W)^2
!-----------------
If (i_run.Eq.1) Then
   vSM = 246._dp 
   sinW2_Q=sinW2
   sinW2_old=sinW2_Q
   Y_l=0._dp
   Do i1=1,3
       y_l(i1,i1)=sqrt2*mf_l_mZ(i1)/vevSM(1)
       yl_MZ(i1,i1)=sqrt2*mf_l_mZ(i1)/vSM 
       yd_MZ(i1,i1)=sqrt2*mf_d_mZ(i1)/vSM 
       yu_MZ(i1,i1)=sqrt2*mf_u_mZ(i1)/vSM 
   End Do
   mf_l2=mf_l_mZ**2
   mf_d2=mf_d_mZ**2
   mf_u2=mf_u_mZ**2
Else
   vSM = vSM_save 
   sinW2_Q=sinW2_Q_mZ
   sinW2_old=sinW2_Q
   Y_l=Yl_mZ
   Call FermionMass(Yd_mZ,vSM,mf_d2,uD_L_T,uD_R_T,kont)
   Call FermionMass(Yl_mZ,vSM,mf_l2,uL_L_T,uL_R_T,kont)
   Call FermionMass(Yu_mZ,vSM,mf_u2,uU_L_T,uU_R_T,kont)
   mf_l2=mf_l2**2
   mf_d2=mf_d2**2
   mf_u2=mf_u2**2
End If
mHiggs= sqrt(Lambda_SM)*vSM 
MuSM = 0.5_dp*Lambda_SM*vSM**2 
alphaMZ = AlphaEW_MS_SM(mZ,mf_d,mf_u,mf_l) 
 
alpha3 = AlphaS_MS_SM(mZ,mf_d,mf_u) 
If (.not.OneLoopMatching) alpha3= AlphaS_mZ 
If (.not.OneLoopMatching) alphaMZ = Alpha_MZ_MS 
gSU3 = Sqrt(4._dp*pi*alpha3) 
g3SM = Sqrt(4._dp*pi*alpha3) 
!--------------------
!for 2-loop parts
!--------------------
xt2=3._dp*(G_F*mf_u(3)**2*oo8pi2*oosqrt2)**2&
    &*rho_2(mHiggs/mf_u(3)) 
fac(1)=alphaMZ*alphaS_mZ*oo4pi&
      &*(2.145_dp*mf_u(3)**2/mZ2+0.575*Log(mf_u(3)/mZ)-0.224_dp&
      &-0.144_dp*mZ2/mf_u(3)**2)/Pi
fac(2)=alphamZ*alphaS_mZ*oo4pi&
      &*(-2.145_dp*mf_u(3)**2/mW2+1.262*Log(mf_u(3)/mZ)-2.24_dp&
      &-0.85_dp*mZ2/mf_u(3)**2)/Pi
Do i1=1,100 
gSU2 = Sqrt( 4._dp*pi*alphamZ/sinW2_Q) 
g1SM =gSU2*Sqrt(sinW2_Q/(1._dp-sinW2_Q)) 
g2SM =gSU2 
YeSM=Yl_MZ
YdSM=Yd_MZ
YuSM=Yu_MZ
TW= Asin(Sqrt(sinw2_Q)) 
mHiggs= sqrt(Lambda_SM)*vSM 
MuSM = 0.5_dp*Lambda_SM*vSM**2 
Yu_MZ(3,3)=mf_u(3)/vSM*Sqrt(2._dp) 
YuSM=Yu_MZ 
Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,Lambda_SM,-YuSM,YdSM,YeSM,kont,dmZ2,           & 
& dmW2,dmW2_0)

If (.not.OneLoopMatching) dmZ2= 0._dp 
If (.not.OneLoopMatching) dmW2= 0._dp 
If (.not.OneLoopMatching) dmW2_0= 0._dp 
mZ2_mZ = Real(dmZ2 + mZ2,dp) 
If (mZ2_mZ.Lt.0._dp) Then
    Iname=Iname-1
    kont=-402
    Call AddError(402)
    Write(*,*) " MZ  getting negative at EW scale" 
    Call TerminateProgram
End If

mZ2_run=mZ2_mZ
mW2_run=mZ2_mZ*(1._dp-sinW2_Q) +0  
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
vev2=mZ2_mZ*CosW2SinW2/(pi*alphamZ) -(0) 
vSM=Sqrt(vev2)
MuSM = 0.5_dp*Lambda_SM*vSM**2 
Yu_MZ(3,3)=mf_u(3)/vSM*Sqrt(2._dp) 
YuSM=Yu_MZ 
Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,Lambda_SM,-YuSM,YdSM,YeSM,kont,dmZ2,           & 
& dmW2,dmW2_0)

If (.not.OneLoopMatching) dmZ2= 0._dp 
If (.not.OneLoopMatching) dmW2= 0._dp 
If (.not.OneLoopMatching) dmW2_0= 0._dp 
mZ2_mZ = Real(dmZ2 + mZ2,dp) 
If (mZ2_mZ.Lt.0._dp) Then
    Iname=Iname-1
    kont=-402
    Call AddError(402)
    Write(*,*) " MZ  getting negative at EW scale" 
    Call TerminateProgram
End If

mZ2_run=mZ2_mZ
mW2_run=mZ2_mZ*(1._dp-sinW2_Q)  
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
vev2=mZ2_mZ *CosW2SinW2/(pi*alphamZ) 
vSM=sqrt(vev2) 
mHiggs= sqrt(Lambda_SM)*vSM 
MuSM = 0.5_dp*Lambda_SM*vSM**2 
Yu_MZ(3,3)=mf_u(3)/vSM*Sqrt(2._dp) 
YuSM=Yu_MZ 
Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,Lambda_SM,-YuSM,YdSM,YeSM,kont,dmZ2,           & 
& dmW2,dmW2_0)

If (.not.OneLoopMatching) dmZ2= 0._dp 
If (.not.OneLoopMatching) dmW2= 0._dp 
If (.not.OneLoopMatching) dmW2_0= 0._dp 
rho=(1._dp+Real(dmZ2,dp)/mZ2)/(1._dp+Real(dmW2,dp)/mW2)  
delta_rho=1._dp-1._dp/rho
rho=1._dp/(1._dp-delta_rho)
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
If (IncludeDeltaVB) Then 
Call DeltaVB_SM(sinW2,sinW2_Q,g2SM,rho,delta)

Else 
delta = 0._dp 
End if 
If (.not.OneLoopMatching) delta= 0._dp 
delta_rho0=0._dp
delta_r=rho*Real(dmW2_0,dp)/mW2-Real(dmZ2,dp)/mZ2+delta
rho=1._dp/(1._dp-delta_rho-delta_rho0-fac(2)/sinW2_Q-xt2)
delta_r=rho*Real(dmW2_0,dp)/mW2-Real(dmZ2,dp)/mZ2+delta&
        &+fac(1)/CosW2SinW2-xt2*(1-delta_r)*rho
CosW2SinW2=pi*alphamZ/(sqrt2*mZ2*G_F*(1-delta_r))
sinW2_Q=0.5_dp-Sqrt(0.25_dp-CosW2SinW2)

If (sinW2_Q.Lt.0._dp) Then
    kont=-403
    Call AddError(403)
    Iname=Iname-1
    Write(*,*) " sinW2 getting negtive at EW scale " 
    Call TerminateProgram
End If
 
If (Abs(sinW2_Q-sinW2_old).Lt.0.1_dp*delta0) Exit

sinW2_old=sinW2_Q
delta_rw=(delta_rho+fac(2)/sinW2_Q+xt2)*(1._dp-delta_r)+delta_r
If ((0.25_dp-alphamz*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))).Lt.0._dp) Then
    kont=-404
    Call AddError(404)
    Iname=Iname-1
     Return
End If

mW2=mZ2*rho*(0.5_dp&
    &+Sqrt(0.25_dp-alphamz*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))))
cosW2=mW2/mZ2
cosW=Sqrt(cosW2)
sinW2=1._dp-cosW2
End Do

delta_rw=(delta_rho+fac(2)/sinW2_Q+xt2)*(1._dp-delta_r)+delta_r
mW2=mZ2*rho*(0.5_dp& 
   &+Sqrt(0.25_dp-alphamz*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))))
mW=Sqrt(mW2)
cosW2=mW2/mZ2
cosW=Sqrt(cosW2)
sinW2=1._dp-cosW2
g1SM=Sqrt(4._dp*pi*alphamZ/(1._dp-sinW2_Q))
g2SM=Sqrt(4._dp*pi*alphamZ/sinW2_Q)
g3SM=Sqrt(4._dp*pi*alpha3)
vev2=mZ2_mZ*CosW2SinW2/(pi*alphamZ)  
vSM=sqrt(vev2) 


! -------------------------
!  Calculate Yukawas
! -------------------------
uU_L=id3C
uU_R=id3C
uD_L=id3C
uD_R=id3C
uL_L=id3C
uL_R=id3C
If (GenerationMixing) Then
    Call Adjungate(CKM,adCKM)
 If (YukawaScheme.Eq.1) Then
    uU_L(1:3,1:3)=CKM
 Else
    uD_L(1:3,1:3)=adCKM
 End If
End If
If (i_run.Eq.1) Then
  mf_l_MS_SM=mf_l_MZ
  mf_d_MS_SM=mf_d_MZ
  mf_u_MS_SM=mf_u_MZ
  mf_l_Q=mf_l_MS_SM
  mf_d_Q=mf_d_MS_SM
  mf_u_Q=mf_u_MS_SM
  YdSM=0._dp
  YuSM=0._dp
  YeSM=0._dp
Do i1=1,3
    YuSM(i1,i1)=sqrt2*mf_u_MS_SM(i1)/vSM
    YeSM(i1,i1)=sqrt2*mf_l_MS_SM(i1)/vSM
    YdSM(i1,i1)=sqrt2*mf_d_MS_SM(i1)/vSM
End Do
If (GenerationMixing) Then
  If (YukawaScheme.Eq.1) Then
    YuSM=Matmul(Transpose(uU_L(1:3,1:3)),YuSM)
  Else
    YdSM=Matmul(Transpose(uD_L(1:3,1:3)),YdSM)
  End If
End If
Else
YeSM=Yl_MZ
YdSM=Yd_MZ
YuSM=Yu_MZ
End If! i_run.eq.1

converge= .False.
Y_l_old=YeSM
Y_d_old=YdSM
Y_u_old=YuSM


! -------------------------
!  Main Loop
! -------------------------
if (FermionMassResummation) then
  i_loop_max=100! this should be sufficient
else
  i_loop_max=1
end if
Do i_loop=1,i_loop_max
p2=0._dp! for off-diagonal elements


! Full one-loop corrections
Call OneLoop_d_u_e_SM(vSM,g1SM,g2SM,g3SM,Lambda_SM,-YuSM,YdSM,YeSM,sigR_d,            & 
& sigL_d,sigSR_d,sigSL_d,sigR_u,sigL_u,sigSR_u,sigSL_u,sigR_l,sigL_l,sigSR_l,            & 
& sigSL_l,kont)

If (.not.OneLoopMatching) Then 
sigR_l = 0._dp 
sigL_l = 0._dp 
sigSR_l = 0._dp 
sigSL_l = 0._dp 
sigR_d = 0._dp 
sigL_d = 0._dp 
sigSR_d = 0._dp 
sigSL_d = 0._dp 
sigR_u = 0._dp 
sigL_u = 0._dp 
sigSR_u = 0._dp 
sigSL_u = 0._dp 
End if


! SM two-loop corrections
! Two-loop Non-SUSY from hep-ph/9803493
Q2=GetRenormalizationScale()
logQ=Log(Q2/MFu(3)**2)
If (OneLoopMatching) Then 
SigQCD=-4._dp/3._dp*gSU3**2*MFu(3)*(4._dp+3._dp*LogQ) &
&-MFu(3)*(-2._dp/3._dp*gSU2)**2*sinW2_Q*(4+3._dp*LogQ)
Else  
SigQCD=0._dp 
End if 
If (TwoLoopMatching) Then 
SigQCD=-4._dp/3._dp*gSU3**2*MFu(3)*(4._dp+3._dp*LogQ) &
& -oo16pi2*MFu(3)*((2821._dp + 2028._dp*LogQ + 396._dp*LogQ**2 + 16._dp*Pi**2*(1._dp + 2._dp*log2) - 48._dp*Zeta3)*gSU3**4/18._dp) &
&-MFu(3)*(-2._dp/3._dp*gSU2)**2*sinW2_Q*(4+3._dp*LogQ)
End if 
SigQCD=oo16pi2*SigQCD

mf_u_MS_SM(3)=mf_u(3)+SigQCD



! Obtain Yukawas
Call Yukawas(mf_u_MS_SM,vSM,uU_L,uU_R,SigSL_u,SigL_u,SigR_u&
      &,YuSM, FermionMassResummation,kont) 
If (kont.Ne.0) Then 
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at EW scale failed" 
    Call TerminateProgram
End If
Call Yukawas(mf_d_MS_SM,vSM,uD_L,uD_R,SigSL_d,SigL_d,SigR_d& 
      &,YdSM,FermionMassResummation,kont)
If (kont.Ne.0) Then
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at EW scale failed" 
    Call TerminateProgram
End If 
Call Yukawas(mf_l_MS_SM,vSM,uL_L,uL_R,SigSL_l,SigL_l,SigR_l&
     &,YeSM,.False.,kont) 
If (kont.Ne.0) Then
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at EW scale failed" 
    Call TerminateProgram
End If


! Transpose Yukawas to fit conventions 
YuSM = Transpose(YuSM) 
YdSM= Transpose(YdSM)
YeSM= Transpose(YeSM)
Call FermionMass(YdSM,vSM,mf_d_Q,uD_L_T,uD_R_T,kont) 
Call FermionMass(YeSM,vSM,mf_l_Q,uL_L_T,uL_R_T,kont)
Call FermionMass(YuSM,vSM,mf_u_Q,uU_L_T,uU_R_T,kont)


! Check convergence 
converge= .True. 
D_mat=Abs(Abs(YeSM)-Abs(Y_l_old))
Where (Abs(YeSM).Ne.0._dp) D_mat=D_mat/Abs(YeSM)
Do i1=1,3
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
  Do i2=i1+1,3 
   If (D_mat(i1,i2).Gt.delta0) converge= .False. 
   If (D_mat(i2,i1).Gt.delta0) converge= .False. 
 End Do 
End Do 
D_mat=Abs(Abs(YdSM)-Abs(Y_d_old))
Where (Abs(YdSM).Ne.0._dp) D_mat=D_mat/Abs(YdSM)
Do i1=1,3 
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
   Do i2=i1+1,3 
    If (D_mat(i1,i2).Gt.10._dp*delta0) converge= .False. 
    If (D_mat(i2,i1).Gt.10._dp*delta0) converge= .False. 
   End Do 
End Do 
D_mat=Abs(Abs(YuSM)-Abs(Y_u_old))
Where (Abs(YuSM).Ne.0._dp) D_mat=D_mat/Abs(YuSM)
Do i1=1,3
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
  Do i2=i1+1,3 
   If (D_mat(i1,i2).Gt.10._dp*delta0) converge= .False. 
   If (D_mat(i2,i1).Gt.10._dp*delta0) converge= .False. 
  End Do 
End Do
If (converge) Exit
  Y_l_old=YeSM
  Y_u_old=YuSM
  Y_d_old=YdSM
!-------------------------------------------------- 
!Either we have run into a numerical problem or 
!perturbation theory breaks down 
!-------------------------------------------------- 
If ((Minval(Abs(mf_l_Q/mf_l)).Lt.0.1_dp)&
&.Or.(Maxval(Abs(mf_l_Q/mf_l)).Gt.10._dp)) Then
Iname=Iname-1
kont=-405
Call AddError(405)
    Write(*,*) " Loop corrections to Yukawa couplings at EW scale too large!" 
    Call TerminateProgram
Else If ((Minval(Abs(mf_d_Q/mf_d)).Lt.0.1_dp)&
&.Or.(Minval(Abs(mf_d_Q/mf_d)).Gt.10._dp)) Then
Iname=Iname-1
kont=-406
Call AddError(406)
    Write(*,*) " Loop corrections to Yukawa couplings at EW scale too large!" 
    Call TerminateProgram
Else If ((Minval(Abs(mf_u_Q/mf_u)).Lt.0.1_dp)&
&.Or.(Minval(Abs(mf_u_Q/mf_u)).Gt.10._dp)) Then
Iname=Iname-1
kont=-407
Call AddError(407)
    Write(*,*) " Loop corrections to Yukawa couplings at EW scale too large!" 
    Call TerminateProgram
End If
End Do! i_loop
If ((.Not.converge).and.FermionMassResummation) Then
Write (ErrCan,*)'Problem in subroutine BoundaryEW!!'
Write (ErrCan,*) "After-1 + (i_loop)iterations no convergence of Yukawas"
End If
Yl_MZ=YeSM
Yd_MZ=YdSM
Yu_MZ=YuSM
sinW2_Q_mZ=sinW2_Q
vSM_save=vSM
gauge_mZ=gauge
Call ParametersToG62_SM(g1SM,g2SM,g3SM,Lambda_SM,YuSM,YdSM,YeSM,MuSM,vSM,g_SM)

test=SetRenormalizationScale(test)
Iname=Iname-1

Contains

Real(dp) Function rho_2(r)
Implicit None
Real(dp),Intent(in)::r
Real(dp)::r2,r3
r2=r*r
r3=r2*r
rho_2=19._dp-16.5_dp*r+43._dp*r2/12._dp&
&+7._dp*r3/120._dp&
&-Pi*Sqrt(r)*(4._dp-1.5_dp*r+3._dp*r2/32._dp&
&+r3/256._dp)&
&-Pi2*(2._dp-2._dp*r+0.5_dp*r2)&
&-Log(r)*(3._dp*r-0.5_dp*r2)
End Function rho_2


Subroutine Yukawas(mf,vev,uL,uR,SigS,SigL,SigR,Y,ReSum,kont)
Implicit None
Integer,Intent(inout)::kont
Real(dp),Intent(in)::mf(3),vev
Complex(dp),Dimension(3,3),Intent(in)::uL,uR,SigS,SigL,SigR
Logical,Intent(in)::ReSum
Complex(dp),Intent(inout)::Y(3,3)
Integer::i1
Complex(dp),Dimension(3,3)::mass,uLa,uRa,f,invf,invY
Call Adjungate(uL,uLa)
Call Adjungate(uR,uRa)
mass=ZeroC
Do i1=1,3
mass(i1,i1)=mf(i1)
End Do
mass=Matmul(Transpose(uL),Matmul(mass,uR))
Y=Y*vev*oosqrt2
If (ReSum) Then
kont=0
Call chop(Y)
invY=Y
Call gaussj(kont,invY,3,3)
If (kont.Ne.0) Return
f=id3C-Matmul(SigS,invY)-Transpose(SigL)-Matmul(Y,Matmul(SigR,invY))
invf=f
Call gaussj(kont,invf,3,3)
If (kont.Ne.0) Return
Y=Matmul(invf,mass)
Else
Y=mass+SigS+Matmul(Transpose(SigL),Y)+Matmul(Y,SigR)
End If
Y=sqrt2*Y/vev
Call chop(y)
End Subroutine Yukawas

End Subroutine BoundarySM 
 
Subroutine BoundaryBSM(i_run,g_SM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,            & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,              & 
& ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,delta0,gMZ,kont)

Implicit None 
Real(dp),Intent(out)::gMZ(:) 
Real(dp),Intent(in) :: g_SM(62) 
Real(dp),Intent(inout) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp),Intent(inout) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(inout) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp),Intent(inout) :: vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: cplcChaChaVPL(2,2),cplcChaChaVPR(2,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),              & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWmgWmVP,      & 
& cplcgWpCgWpCVP,cplHpmcHpmVP(2,2),cplHpmcVWmVP(2),cplSdcSdVP(6,6),cplSecSeVP(6,6),      & 
& cplSucSuVP(6,6),cplcVWmVPVWm,cplHpmcHpmVPVP(2,2),cplSdcSdVPVP(6,6),cplSecSeVPVP(6,6),  & 
& cplSucSuVPVP(6,6),cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplAhhhVZ(6,6),      & 
& cplcChaChaVZL(2,2),cplcChaChaVZR(2,2),cplChiChiVZL(9,9),cplChiChiVZR(9,9),             & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplcgWmgWmVZ,cplcgWpCgWpCVZ,        & 
& cplhhVZVZ(6),cplhhVZVZp(6),cplHpmcHpmVZ(2,2),cplHpmcVWmVZ(2),cplSdcSdVZ(6,6),          & 
& cplSecSeVZ(6,6),cplSucSuVZ(6,6),cplSvcSvVZ(6,6),cplcVWmVWmVZ,cplAhAhVZVZ(6,6),         & 
& cplhhhhVZVZ(6,6),cplHpmcHpmVZVZ(2,2),cplSdcSdVZVZ(6,6),cplSecSeVZVZ(6,6),              & 
& cplSucSuVZVZ(6,6),cplSvcSvVZVZ(6,6),cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,   & 
& cplHpmcVWmVZp(2),cplcVWmVWmVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,  & 
& cplAhHpmcVWm(6,2),cplChiChacVWmL(9,2),cplChiChacVWmR(9,2),cplcFuFdcVWmL(3,3),          & 
& cplcFuFdcVWmR(3,3),cplcFvFecVWmL(3,3),cplcFvFecVWmR(3,3),cplcgWpCgAcVWm,               & 
& cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,             & 
& cplhhHpmcVWm(6,2),cplhhcVWmVWm(6),cplSdcSucVWm(6,6),cplSecSvcVWm(6,6),cplAhAhcVWmVWm(6,6),& 
& cplhhhhcVWmVWm(6,6),cplHpmcHpmcVWmVWm(2,2),cplSdcSdcVWmVWm(6,6),cplSecSecVWmVWm(6,6),  & 
& cplSucSucVWmVWm(6,6),cplSvcSvcVWmVWm(6,6),cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,       & 
& cplcVWmcVWmVWmVWm3,cplcHpmVWmVZ(2),cplcHpmVPVWm(2),cplHpmcHpmVPVZ(2,2),cplSdcSdVPVZ(6,6),& 
& cplSecSeVPVZ(6,6),cplSucSuVPVZ(6,6),cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,   & 
& cplcHpmVWmVZp(2),cplHpmcHpmVPVZp(2,2),cplSdcSdVPVZp(6,6),cplSecSeVPVZp(6,6),           & 
& cplSucSuVPVZp(6,6),cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,cplcVWmVPVWmVZp3,cplAhAhVZVZp(6,6),& 
& cplhhhhVZVZp(6,6),cplHpmcHpmVZVZp(2,2),cplSdcSdVZVZp(6,6),cplSecSeVZVZp(6,6),          & 
& cplSucSuVZVZp(6,6),cplSvcSvVZVZp(6,6),cplcVWmVWmVZVZp1,cplcVWmVWmVZVZp2,               & 
& cplcVWmVWmVZVZp3

Complex(dp) :: cplcUFeFeAhL(3,3,6),cplcUFeFeAhR(3,3,6),cplcUFeChaSvL(3,2,6),cplcUFeChaSvR(3,2,6),    & 
& cplcUFeChiSeL(3,9,6),cplcUFeChiSeR(3,9,6),cplcUFeFehhL(3,3,6),cplcUFeFehhR(3,3,6),     & 
& cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),               & 
& cplcUFeFeVZpL(3,3),cplcUFeFeVZpR(3,3),cplcUFeFvHpmL(3,3,2),cplcUFeFvHpmR(3,3,2),       & 
& cplcUFeFvVWmL(3,3),cplcUFeFvVWmR(3,3),cplcUFdFdAhL(3,3,6),cplcUFdFdAhR(3,3,6),         & 
& cplcUFdChaSuL(3,2,6),cplcUFdChaSuR(3,2,6),cplcUFdChiSdL(3,9,6),cplcUFdChiSdR(3,9,6),   & 
& cplcUFdFdhhL(3,3,6),cplcUFdFdhhR(3,3,6),cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),           & 
& cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),               & 
& cplcUFdFdVZpL(3,3),cplcUFdFdVZpR(3,3),cplcUFdFuHpmL(3,3,2),cplcUFdFuHpmR(3,3,2),       & 
& cplcUFdFuVWmL(3,3),cplcUFdFuVWmR(3,3),cplcUFdGluSdL(3,6),cplcUFdGluSdR(3,6),           & 
& cplcUFuFuAhL(3,3,6),cplcUFuFuAhR(3,3,6),cplcUFuChiSuL(3,9,6),cplcUFuChiSuR(3,9,6),     & 
& cplcUFuFdcHpmL(3,3,2),cplcUFuFdcHpmR(3,3,2),cplcUFuFdcVWmL(3,3),cplcUFuFdcVWmR(3,3),   & 
& cplcUFuFuhhL(3,3,6),cplcUFuFuhhR(3,3,6),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFuFuVZpL(3,3),cplcUFuFuVZpR(3,3),cplcUFuGluSuL(3,6),cplcUFuGluSuR(3,6),           & 
& cplcChacUFuSdL(2,3,6),cplcChacUFuSdR(2,3,6)

Integer, Intent(in) :: i_run 
Real(dp), Intent(in) :: delta0 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4 
Complex(dp) ::uU_L(3,3),uU_R(3,3),uD_L(3,3),uD_R(3,3), NoMatrix(3,3) &
&,uL_L(3,3),uL_R(3,3)
Real(dp)::mW2_run,mZ2_run,test, D_mat(3,3)
Real(dp)::alphaQ,alpha3,gSU2,rho,delta_rho,delta_rho0,sinW2_Q,vev2&
&,vevs_Q(2),mZ2_Q,CosW2SinW2,gauge(3),delta,delta_SM,sinW2_old,delta_r&
&,p2,gSU3,tanb,xt2,fac(2),SigQCD,delta_rw,sinW2,cosW2,cosW
Real(dp),Dimension(3)::mf_d_Q,mf_l_Q,mf_u_Q
Real(dp) :: g1SM, g2SM, g3SM, vSM 
Complex(dp) :: dMZ2_SM, dMW2_SM, dMW2_0_SM 
Complex(dp) :: dmZ2,dmW2,dmW2_0,yuk_tau,yuk_t,yuk_b
Complex(dp) :: SigSR_u(3,3),SigSL_u(3,3),sigR_u(3,3),SigL_u(3,3)
Complex(dp) :: SigSR_d(3,3),SigSL_d(3,3),SigR_d(3,3),SigL_d(3,3)
Complex(dp) :: SigSR_l(3,3),SigSL_l(3,3),sigR_l(3,3),SigL_l(3,3)
Complex(dp) :: SigSR_u_SM(3,3),SigSL_u_SM(3,3),sigR_u_SM(3,3),SigL_u_SM(3,3)
Complex(dp) :: SigSR_d_SM(3,3),SigSL_d_SM(3,3),SigR_d_SM(3,3),SigL_d_SM(3,3)
Complex(dp) :: SigSR_l_SM(3,3),SigSL_l_SM(3,3),sigR_l_SM(3,3),SigL_l_SM(3,3)
Complex(dp) :: YuSM(3,3),YdSM(3,3),YeSM(3,3), adCKM(3,3),Y_l_old(3,3),Y_d_old(3,3),Y_u_old(3,3) 
Real(dp) :: g1_MS, g2_MS,g3_MS,v_MS, mf_d_MS(3), mf_u_MS(3), mf_e_MS(3) 
Complex(dp) :: Yu_MS(3,3),Yd_MS(3,3),Ye_MS(3,3), Mu_MS, Lam_MS, MuSM 
Complex(dp) :: uU_L_MS(3,3),uU_R_MS(3,3)&
&,uD_L_MS(3,3),uD_R_MS(3,3),uL_L_MS(3,3),uL_R_MS(3,3), CKM_MS(3,3), delta_r_SM
Complex(dp) :: uU_L_T(3,3),uU_R_T(3,3)&
&,uD_L_T(3,3),uD_R_T(3,3),uL_L_T(3,3),uL_R_T(3,3)
Logical::converge
Integer :: i_loop, i_loop_max 
Real(dp),Parameter::&
& as2loop=1._dp/24._dp+2011._dp*oo32Pi2/12._dp&
&+Log2/12._dp-oo8Pi2*Zeta3&
&,log2loop_a=123._dp*oo32Pi2,log2loop_b=33._dp*oo32Pi2
Real(dp)::Q2,logQ, sinTW_MS, alphaEW_MS, alphaS_MS, mudim, mz2_MS, mw2_MS 


Complex(dp) ::MassFu(3,3),MassFd(3,3),MassFe(3,3) 
Iname=Iname+1
NameOfUnit(Iname)='BoundaryBSM'
rMS_SM = rMS 
tanb = tanbetaMZ 
sinW2 = 1 - mW**2/mZ**2 
mudim = GetRenormalizationScale() 
mudim = sqrt(mudim) 
Call GToParameters62_SM(g_SM,g1_MS,g2_MS,g3_MS,Lam_MS,Yu_MS,Yd_MS,Ye_MS,Mu_MS,v_MS) 
sinTW_MS = g1_MS/sqrt(g1_MS**2+g2_MS**2) 
sinW2_Q = sinTW_MS**2 
alphaEW_MS = (sinTW_MS*g2_MS)**2/(4._dp*Pi) 
alphaS_MS = g3_MS**2/(4._dp*Pi) 
mz2_MS = (g1_MS**2+g2_MS**2)/(4._dp)*(v_MS**2) 
delta_r_SM = 1._dp - alphaEW_MS*Pi/(G_F*mz2*sqrt2*sinW2_Q*(1-sinW2_Q))
   Call FermionMass(Yd_MS,v_MS,mf_d_MS,uD_L_MS,uD_R_MS,kont)
   Call FermionMass(Ye_MS,v_MS,mf_e_MS,uL_L_MS,uL_R_MS,kont)
   Call FermionMass(Yu_MS,v_MS,mf_u_MS,uU_L_MS,uU_R_MS,kont)
   CKM_MS = MatMul(uU_R_MS,Transpose(Conjg(uD_R_MS))) 
!-----------------
!sin(theta_W)^2
!-----------------
vSM = v_MS 
   sinW2_old=sinW2_Q
   mf_l2=mf_e_MS**2
   mf_d2=mf_d_MS**2
   mf_u2=mf_u_MS**2
MFe2(1:3) = mf_l**2 
MFd2(1:3) = mf_d**2 
MFu2(1:3) = mf_u**2 
MFe = sqrt(MFe2) 
MFd = sqrt(MFd2) 
MFu = sqrt(MFu2) 
alphaQ = AlphaEw_T(alphaEW_MS,mudim,Abs(MVWm),Abs(MSd),Abs(MSu),Abs(MSe),Abs(MHpm),Abs(MCha),Abs(MFe),Abs(MFd),Abs(MFu)) 
 
MFe2(1:3) = mf_l2 
MFd2(1:3) = mf_d2 
MFu2(1:3) = mf_u2 
MFe = sqrt(MFe2) 
MFd = sqrt(MFd2) 
MFu = sqrt(MFu2) 
alpha3 = AlphaS_T(alphaS_MS,mudim,Abs(MSd),Abs(MSu),Abs(MGlu),Abs(MFd),Abs(MFu)) 
If (.not.OneLoopMatching) alpha3 = alphaS_MS 
gSU3 = Sqrt(4._dp*pi*alpha3) 
g3SM = Sqrt(4._dp*pi*alpha3) 
Do i1=1,100 
gSU2 = Sqrt( 4._dp*pi*alphaQ/sinW2_Q) 
g1SM =gSU2*Sqrt(sinW2_Q/(1._dp-sinW2_Q)) 
g2SM =gSU2 
If (i_run.eq.1) Then 
 YeSM=Yl_MZ
 YdSM=Yd_MZ
 YuSM=Yu_MZ
Else 
 YeSM=Yl_Q
 YdSM=Yd_Q
 YuSM=Yu_Q
End if 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.False.)

Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,GenerationMixing,kont)

TW= Asin(Sqrt(sinw2_Q)) 

 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 
MVZ2 = mZ2 
MVZ= Sqrt(MVZ2) 
MVWm2 = mW2 
MVWm= Sqrt(MVWm2) 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
If (.not.MatchZWpoleMasses) Then 
Call CouplingsForVectorBosons(g1,g2,UM,UP,TW,ZP,vd,vu,ZD,ZE,ZU,gp,ZH,ZA,              & 
& TWp,ZN,vS,vS1,vS2,vS3,ZV,ZDL,ZUL,ZVL,ZEL,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,              & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,cplSucSuVPVP,cplcVWmVPVPVWm1,    & 
& cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,    & 
& cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,              & 
& cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,             & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,      & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvcSvVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,             & 
& cplHpmcVWmVZp,cplcVWmVWmVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,     & 
& cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,  & 
& cplcFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,               & 
& cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplSdcSucVWm,cplSecSvcVWm,    & 
& cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,       & 
& cplSucSucVWmVWm,cplSvcSvcVWmVWm,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,& 
& cplcHpmVWmVZ,cplcHpmVPVWm,cplHpmcHpmVPVZ,cplSdcSdVPVZ,cplSecSeVPVZ,cplSucSuVPVZ,       & 
& cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcHpmVWmVZp,cplHpmcHpmVPVZp,         & 
& cplSdcSdVPVZp,cplSecSeVPVZp,cplSucSuVPVZp,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,           & 
& cplcVWmVPVWmVZp3,cplAhAhVZVZp,cplhhhhVZVZp,cplHpmcHpmVZVZp,cplSdcSdVZVZp,              & 
& cplSecSeVZVZp,cplSucSuVZVZp,cplSvcSvVZVZp,cplcVWmVWmVZVZp1,cplcVWmVWmVZVZp2,           & 
& cplcVWmVWmVZVZp3)

Call Pi1LoopVZ(mZ2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSv,MSv2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,         & 
& cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,              & 
& cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,             & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,      & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvcSvVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,             & 
& kont,dmZ2)

Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,Lam_MS,-YuSM,YdSM,YeSM,kont,dmZ2_SM,           & 
& dmW2_SM,dmW2_0_SM)

dmZ2 = dmZ2 - dmZ2_SM
If (.not.OneLoopMatching) dmZ2 = 0._dp 
mZ2_Q = Real(dmZ2 + mZ2_MS,dp) 
If (mZ2_Q.Lt.0._dp) Then
    Iname=Iname-1
    kont=-402
    Call AddError(402)
    Write(*,*) " MZ  getting negative at renormalisation scale" 
    Call TerminateProgram
End If

mZ2_run=mZ2_Q
mW2_run=mZ2_Q*(1._dp-sinW2_Q) +0  
MVZ2 = mZ2_run 
MVZ= Sqrt(MVZ2) 
MVWm2 = mW2_run 
MVWm= Sqrt(MVWm2) 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
vev2=mZ2_Q*CosW2SinW2/(pi*alphaQ) -(0) 
vSM=Sqrt(vev2)
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.False.)

Call CouplingsForVectorBosons(g1,g2,UM,UP,TW,ZP,vd,vu,ZD,ZE,ZU,gp,ZH,ZA,              & 
& TWp,ZN,vS,vS1,vS2,vS3,ZV,ZDL,ZUL,ZVL,ZEL,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,              & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,cplSucSuVPVP,cplcVWmVPVPVWm1,    & 
& cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,    & 
& cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,              & 
& cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,             & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,      & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvcSvVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,             & 
& cplHpmcVWmVZp,cplcVWmVWmVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,     & 
& cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,  & 
& cplcFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,               & 
& cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplSdcSucVWm,cplSecSvcVWm,    & 
& cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,       & 
& cplSucSucVWmVWm,cplSvcSvcVWmVWm,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,& 
& cplcHpmVWmVZ,cplcHpmVPVWm,cplHpmcHpmVPVZ,cplSdcSdVPVZ,cplSecSeVPVZ,cplSucSuVPVZ,       & 
& cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcHpmVWmVZp,cplHpmcHpmVPVZp,         & 
& cplSdcSdVPVZp,cplSecSeVPVZp,cplSucSuVPVZp,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,           & 
& cplcVWmVPVWmVZp3,cplAhAhVZVZp,cplhhhhVZVZp,cplHpmcHpmVZVZp,cplSdcSdVZVZp,              & 
& cplSecSeVZVZp,cplSucSuVZVZp,cplSvcSvVZVZp,cplcVWmVWmVZVZp1,cplcVWmVWmVZVZp2,           & 
& cplcVWmVWmVZVZp3)

Call Pi1LoopVZ(mZ2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSv,MSv2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,         & 
& cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,              & 
& cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,             & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,      & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvcSvVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,             & 
& kont,dmZ2)

Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,Lam_MS,-YuSM,YdSM,YeSM,kont,dmZ2_SM,           & 
& dmW2_SM,dmW2_0_SM)

dmZ2 = dmZ2 - dmZ2_SM
If (.not.OneLoopMatching) dmZ2 = 0._dp 
mZ2_Q = Real(dmZ2 + mZ2_MS,dp) 
If (mZ2_Q.Lt.0._dp) Then
    Iname=Iname-1
    kont=-402
    Call AddError(402)
    Write(*,*) " MZ  getting negative at renormalisation scale" 
    Call TerminateProgram
End If

mZ2_run=mZ2_Q
mW2_run=mZ2_Q*(1._dp-sinW2_Q) +0  
MVZ2 = mZ2_run 
MVZ= Sqrt(MVZ2) 
MVWm2 = mW2_run 
MVWm= Sqrt(MVWm2) 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
vev2=mZ2_Q *CosW2SinW2/(pi*alphaQ) -(0) 
vSM=sqrt(vev2) 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.False.)

Call CouplingsForVectorBosons(g1,g2,UM,UP,TW,ZP,vd,vu,ZD,ZE,ZU,gp,ZH,ZA,              & 
& TWp,ZN,vS,vS1,vS2,vS3,ZV,ZDL,ZUL,ZVL,ZEL,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,              & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,cplSucSuVPVP,cplcVWmVPVPVWm1,    & 
& cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,    & 
& cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,              & 
& cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,             & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,      & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvcSvVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,             & 
& cplHpmcVWmVZp,cplcVWmVWmVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,     & 
& cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,  & 
& cplcFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,               & 
& cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplSdcSucVWm,cplSecSvcVWm,    & 
& cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,       & 
& cplSucSucVWmVWm,cplSvcSvcVWmVWm,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,& 
& cplcHpmVWmVZ,cplcHpmVPVWm,cplHpmcHpmVPVZ,cplSdcSdVPVZ,cplSecSeVPVZ,cplSucSuVPVZ,       & 
& cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcHpmVWmVZp,cplHpmcHpmVPVZp,         & 
& cplSdcSdVPVZp,cplSecSeVPVZp,cplSucSuVPVZp,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,           & 
& cplcVWmVPVWmVZp3,cplAhAhVZVZp,cplhhhhVZVZp,cplHpmcHpmVZVZp,cplSdcSdVZVZp,              & 
& cplSecSeVZVZp,cplSucSuVZVZp,cplSvcSvVZVZp,cplcVWmVWmVZVZp1,cplcVWmVWmVZVZp2,           & 
& cplcVWmVWmVZVZp3)

Call Pi1LoopVWm(mW2,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,MFu2,               & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSu,MSu2,           & 
& MSd,MSd2,MSv,MSv2,MSe,MSe2,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcFuFdcVWmL,   & 
& cplcFuFdcVWmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,  & 
& cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHpmcVWm,cplhhcVWmVWm,               & 
& cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,cplSecSvcVWm,cplcVWmVPVWm,        & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,            & 
& cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,cplSvcSvcVWmVWm,cplcVWmVPVPVWm3,       & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,& 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,   & 
& cplcVWmVWmVZpVZp3,kont,dmW2)

Call Pi1LoopVWm(0._dp,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,MFu2,             & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSu,MSu2,           & 
& MSd,MSd2,MSv,MSv2,MSe,MSe2,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcFuFdcVWmL,   & 
& cplcFuFdcVWmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,  & 
& cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHpmcVWm,cplhhcVWmVWm,               & 
& cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,cplSecSvcVWm,cplcVWmVPVWm,        & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,            & 
& cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,cplSvcSvcVWmVWm,cplcVWmVPVPVWm3,       & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,& 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,   & 
& cplcVWmVWmVZpVZp3,kont,dmW2_0)

Call OneLoop_Z_W_SM(vSM,g1SM,g2SM,g3SM,Lam_MS,-YuSM,YdSM,YeSM,kont,dmZ2_SM,           & 
& dmW2_SM,dmW2_0_SM)

dmW2 = dmW2 - dmW2_SM
dmW2_0 = dmW2_0 - dmW2_0_SM
If (.not.OneLoopMatching) dmW2 = 0._dp 
If (.not.OneLoopMatching) dmW2_0 = 0._dp 
rho=(1._dp+Real(dmZ2,dp)/mZ2)/(1._dp+Real(dmW2,dp)/mW2)  
delta_rho=1._dp-1._dp/rho
delta_rho0=0
rho=1._dp/(1._dp-delta_rho-delta_rho0)
CosW2SinW2=(1._dp-sinW2_Q)*sinW2_Q
If (IncludeDeltaVB) Then 
Call DeltaVB(sinW2,sinW2_Q,rho,MAh,MCha,MChi,MFe,MFv,Mhh,MHpm,MSe,MSv,MVWm,           & 
& MVZp,g1,g2,gp,TW,TWp,UM,UP,vd,vu,Ye,Yv,ZA,ZE,ZEL,ZER,ZH,ZN,ZP,ZV,ZVL,ZVR,delta)

Call DeltaVB_SM(sinW2,sinW2_Q,g2SM,rho,delta_SM)

 delta=delta-delta_SM 
Else 
 delta = 0._dp 
End if 
If (.not.OneLoopMatching) delta = 0._dp 
delta_r=rho*Real(dmW2_0,dp)/mW2-Real(dmZ2,dp)/mZ2+delta
delta_rho0=0
rho=1._dp/(1._dp-delta_rho-delta_rho0)
delta_r=rho*Real(dmW2_0,dp)/mW2-Real(dmZ2,dp)/mZ2+delta
CosW2SinW2=pi*alphaQ/(sqrt2*mZ2*G_F*(1-delta_r_SM - delta_r))
sinW2_Q=0.5_dp-Sqrt(0.25_dp-CosW2SinW2)

If (sinW2_Q.Lt.0._dp) Then
    kont=-403
    Call AddError(403)
    Iname=Iname-1
    Write(*,*) " sinW2 getting negtive at renormalisation scale " 
    Call TerminateProgram
End If
 
If (Abs(sinW2_Q-sinW2_old).Lt.0.1_dp*delta0) Exit

sinW2_old=sinW2_Q
delta_rw=delta_rho*(1._dp-delta_r_SM - delta_r)+delta_r_SM + delta_r
If ((0.25_dp-alphaQ*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))).Lt.0._dp) Then
    kont=-404
    Call AddError(404)
    Iname=Iname-1
     Return
End If

mW2=mZ2*rho*(0.5_dp&
    &+Sqrt(0.25_dp-alphaQ*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))))
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
cosW2=mW2/mZ2
cosW=Sqrt(cosW2)
sinW2=1._dp-cosW2
Else 
Call CouplingsForVectorBosons(g1,g2,UM,UP,TW,ZP,vd,vu,ZD,ZE,ZU,gp,ZH,ZA,              & 
& TWp,ZN,vS,vS1,vS2,vS3,ZV,ZDL,ZUL,ZVL,ZEL,cplcChaChaVPL,cplcChaChaVPR,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWmgWmVP,              & 
& cplcgWpCgWpCVP,cplHpmcHpmVP,cplHpmcVWmVP,cplSdcSdVP,cplSecSeVP,cplSucSuVP,             & 
& cplcVWmVPVWm,cplHpmcHpmVPVP,cplSdcSdVPVP,cplSecSeVPVP,cplSucSuVPVP,cplcVWmVPVPVWm1,    & 
& cplcVWmVPVPVWm2,cplcVWmVPVPVWm3,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,    & 
& cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,              & 
& cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,             & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,      & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvcSvVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,             & 
& cplHpmcVWmVZp,cplcVWmVWmVZp,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,cplcVWmVWmVZpVZp3,     & 
& cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcFuFdcVWmL,cplcFuFdcVWmR,cplcFvFecVWmL,  & 
& cplcFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,cplcgZpgWmcVWm,               & 
& cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHpmcVWm,cplhhcVWmVWm,cplSdcSucVWm,cplSecSvcVWm,    & 
& cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,cplSdcSdcVWmVWm,cplSecSecVWmVWm,       & 
& cplSucSucVWmVWm,cplSvcSvcVWmVWm,cplcVWmcVWmVWmVWm1,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,& 
& cplcHpmVWmVZ,cplcHpmVPVWm,cplHpmcHpmVPVZ,cplSdcSdVPVZ,cplSecSeVPVZ,cplSucSuVPVZ,       & 
& cplcVWmVPVWmVZ1,cplcVWmVPVWmVZ2,cplcVWmVPVWmVZ3,cplcHpmVWmVZp,cplHpmcHpmVPVZp,         & 
& cplSdcSdVPVZp,cplSecSeVPVZp,cplSucSuVPVZp,cplcVWmVPVWmVZp1,cplcVWmVPVWmVZp2,           & 
& cplcVWmVPVWmVZp3,cplAhAhVZVZp,cplhhhhVZVZp,cplHpmcHpmVZVZp,cplSdcSdVZVZp,              & 
& cplSecSeVZVZp,cplSucSuVZVZp,cplSvcSvVZVZp,cplcVWmVWmVZVZp1,cplcVWmVWmVZVZp2,           & 
& cplcVWmVWmVZVZp3)

Call Pi1LoopVZ(mZ2,Mhh,Mhh2,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MVWm,MVWm2,MSd,MSd2,             & 
& MSe,MSe2,MSu,MSu2,MSv,MSv2,cplAhhhVZ,cplcChaChaVZL,cplcChaChaVZR,cplChiChiVZL,         & 
& cplChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,              & 
& cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWmgWmVZ,cplcgWpCgWpCVZ,cplhhVZVZ,             & 
& cplhhVZVZp,cplHpmcHpmVZ,cplHpmcVWmVZ,cplSdcSdVZ,cplSecSeVZ,cplSucSuVZ,cplSvcSvVZ,      & 
& cplcVWmVWmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplSdcSdVZVZ,cplSecSeVZVZ,         & 
& cplSucSuVZVZ,cplSvcSvVZVZ,cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,             & 
& kont,dmZ2)

Call Pi1LoopVWm(mW2,MHpm,MHpm2,MAh,MAh2,MChi,MChi2,MCha,MCha2,MFu,MFu2,               & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,MSu,MSu2,           & 
& MSd,MSd2,MSv,MSv2,MSe,MSe2,cplAhHpmcVWm,cplChiChacVWmL,cplChiChacVWmR,cplcFuFdcVWmL,   & 
& cplcFuFdcVWmR,cplcFvFecVWmL,cplcFvFecVWmR,cplcgWpCgAcVWm,cplcgAgWmcVWm,cplcgZgWmcVWm,  & 
& cplcgZpgWmcVWm,cplcgWpCgZcVWm,cplcgWpCgZpcVWm,cplhhHpmcVWm,cplhhcVWmVWm,               & 
& cplHpmcVWmVP,cplHpmcVWmVZ,cplHpmcVWmVZp,cplSdcSucVWm,cplSecSvcVWm,cplcVWmVPVWm,        & 
& cplcVWmVWmVZ,cplcVWmVWmVZp,cplAhAhcVWmVWm,cplhhhhcVWmVWm,cplHpmcHpmcVWmVWm,            & 
& cplSdcSdcVWmVWm,cplSecSecVWmVWm,cplSucSucVWmVWm,cplSvcSvcVWmVWm,cplcVWmVPVPVWm3,       & 
& cplcVWmVPVPVWm1,cplcVWmVPVPVWm2,cplcVWmcVWmVWmVWm2,cplcVWmcVWmVWmVWm3,cplcVWmcVWmVWmVWm1,& 
& cplcVWmVWmVZVZ1,cplcVWmVWmVZVZ2,cplcVWmVWmVZVZ3,cplcVWmVWmVZpVZp1,cplcVWmVWmVZpVZp2,   & 
& cplcVWmVWmVZpVZp3,kont,dmW2)

Call OneLoop_Z_W_SM(v_MS,g1_MS,g2_MS,g3_MS,Lam_MS,Yu_MS,Yd_MS,Ye_MS,kont,             & 
& dmZ2_SM,dmW2_SM,dmW2_0_SM)

If (.not.OneLoopMatching) dmZ2_SM = 0._dp 
If (.not.OneLoopMatching) dmW2_SM = 0._dp 
If (.not.OneLoopMatching) dmW2_0_SM = 0._dp 
mZ2_run=mZ2_MS-dmZ2+dmz2_SM
mW2_run=mw2_MS-dmW2+dmw2_SM
sinW2_Q=1._dp-mW2_run/MZ2_run
g1SM=Sqrt(4._dp*pi*alphaQ/(1._dp-sinW2_Q))
g2SM=Sqrt(4._dp*pi*alphaQ/sinW2_Q)
g3SM=Sqrt(4._dp*pi*alpha3)
vSM=sqrt(4._dp*mz2_run/(g1SM**2+g2SM**2))
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.False.)

vev2=4._dp*mz2_run/(g1SM**2+g2SM**2) -(0) 
vSM=sqrt(vev2) 
End If 
End Do

MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZp
MAh2(2)=MVZp2
MHpm(1)=MVWm
MHpm2(1)=MVWm2
If (.not.MatchZWpoleMasses) Then 
delta_rw=delta_rho*(1._dp-delta_r_SM - delta_r)+delta_r_SM + delta_r
mW2=mZ2*rho*(0.5_dp& 
   &+Sqrt(0.25_dp-alphaQ*pi/(sqrt2*G_F*mz2*rho*(1._dp-delta_rw))))
mW=Sqrt(mW2)
vev2=mZ2_Q*CosW2SinW2/(pi*alphaQ) -(0) 
vSM=sqrt(vev2) 
Else 
mW2=(1._dp-sinW2_Q)*MZ2 
mW=Sqrt(mW2)
End If 
cosW2=mW2/mZ2
cosW=Sqrt(cosW2)
sinW2=1._dp-cosW2
g1SM=Sqrt(4._dp*pi*alphaQ/(1._dp-sinW2_Q))
g2SM=Sqrt(4._dp*pi*alphaQ/sinW2_Q)
g3SM=Sqrt(4._dp*pi*alpha3)
vSM_Q = vSM
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.False.)

Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.)



! -------------------------
!  Calculate Yukawas
! -------------------------
uU_L=id3C
uU_R=id3C
uD_L=id3C
uD_R=id3C
uL_L=id3C
uL_R=id3C
If (GenerationMixing) Then
    Call Adjungate(CKM_MS,adCKM)
 If (YukawaScheme.Eq.1) Then
    uU_L(1:3,1:3)=CKM_MS
 Else
    uD_L(1:3,1:3)=adCKM
 End If
End If
If (rMS.lt.0.5_dp) Then ! shift to DR if necessary 
   mf_l_Q_SM=&
            & mf_e_MS*(1._dp-alphaQ/(4._dp*Pi))
   mf_d_Q_SM=mf_d_MS*(1._dp-alpha3/(3._dp*pi)&
           &-43._dp*alpha3**2/(144._dp*Pi2) - alphaQ/(36._dp*Pi))
   mf_u_Q_SM(1:3)=mf_u_MS(1:3)*(1._dp-alpha3/(3._dp*pi)&
               &-43._dp*alpha3**2/(144._dp*Pi2)- alphaQ/(9._dp*Pi))
Else 
   mf_l_Q_SM=mf_e_MS
   mf_d_Q_SM=mf_d_MS
   mf_u_Q_SM=mf_u_MS
End if 
mf_l_Q=mf_l_Q_SM
mf_d_Q=mf_d_Q_SM
mf_u_Q=mf_u_Q_SM
YdSM=0._dp
YuSM=0._dp
YeSM=0._dp
Do i1=1,3
    YuSM(i1,i1)=sqrt2*mf_u_Q_SM(i1)/vSM
    YeSM(i1,i1)=sqrt2*mf_l_Q_SM(i1)/vSM
    YdSM(i1,i1)=sqrt2*mf_d_Q_SM(i1)/vSM
End Do
If (GenerationMixing) Then
  If (YukawaScheme.Eq.1) Then
    YuSM=Matmul(Transpose(uU_L(1:3,1:3)),YuSM)
  Else
    YdSM=Matmul(Transpose(uD_L(1:3,1:3)),YdSM)
  End If
End If
converge= .False.
Y_l_old=YeSM
Y_d_old=YdSM
Y_u_old=YuSM
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.False.)



! -------------------------
!  Main Loop
! -------------------------
if (FermionMassResummation) then
  i_loop_max=100! this should be sufficient
else
  i_loop_max=1
end if
Do i_loop=1,i_loop_max
p2=0._dp! for off-diagonal elements

 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 


! Full one-loop corrections
Call CouplingsForSMfermions(Ye,ZA,ZEL,ZER,g2,Yv,ZV,UM,UP,g1,gp,ZE,ZN,ZH,              & 
& TW,TWp,ZP,ZVL,ZVR,Yd,ZDL,ZDR,Yu,ZU,ZD,g3,ZUL,ZUR,pG,cplcUFeFeAhL,cplcUFeFeAhR,         & 
& cplcUFeChaSvL,cplcUFeChaSvR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,cplcUFeFehhR,     & 
& cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,cplcUFeFeVZpR,       & 
& cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,cplcUFdFdAhL,cplcUFdFdAhR,     & 
& cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,cplcUFdFdhhL,cplcUFdFdhhR,     & 
& cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,         & 
& cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWmL,cplcUFdFuVWmR,   & 
& cplcUFdGluSdL,cplcUFdGluSdR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,     & 
& cplcUFuFdcHpmL,cplcUFuFdcHpmR,cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,              & 
& cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,         & 
& cplcUFuFuVZR,cplcUFuFuVZpL,cplcUFuFuVZpR,cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,   & 
& cplcChacUFuSdR)

Call Sigma1LoopFeMZ(p2,MFe,MFe2,MAh,MAh2,MSv,MSv2,MCha,MCha2,MSe,MSe2,MChi,           & 
& MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFv,MFv2,MVWm,MVWm2,cplcUFeFeAhL,        & 
& cplcUFeFeAhR,cplcUFeChaSvL,cplcUFeChaSvR,cplcUFeChiSeL,cplcUFeChiSeR,cplcUFeFehhL,     & 
& cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZpL,        & 
& cplcUFeFeVZpR,cplcUFeFvHpmL,cplcUFeFvHpmR,cplcUFeFvVWmL,cplcUFeFvVWmR,sigR_l,          & 
& sigL_l,sigSL_l,sigSR_l)

Call Sigma1LoopFdMZ(p2,MFd,MFd2,MAh,MAh2,MSu,MSu2,MCha,MCha2,MSd,MSd2,MChi,           & 
& MChi2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MHpm,MHpm2,MFu,MFu2,MVWm,MVWm2,MGlu,MGlu2,          & 
& cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdChaSuL,cplcUFdChaSuR,cplcUFdChiSdL,cplcUFdChiSdR,     & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZpL,cplcUFdFdVZpR,cplcUFdFuHpmL,cplcUFdFuHpmR,     & 
& cplcUFdFuVWmL,cplcUFdFuVWmR,cplcUFdGluSdL,cplcUFdGluSdR,sigR_d,sigL_d,sigSL_d,sigSR_d)

Call Sigma1LoopFuMZ(p2,MFu,MFu2,MAh,MAh2,MSu,MSu2,MChi,MChi2,MHpm,MHpm2,              & 
& MFd,MFd2,MVWm,MVWm2,Mhh,Mhh2,MVZ,MVZ2,MVZp,MVZp2,MGlu,MGlu2,MCha,MCha2,MSd,            & 
& MSd2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuChiSuL,cplcUFuChiSuR,cplcUFuFdcHpmL,             & 
& cplcUFuFdcHpmR,cplcUFuFdcVWmL,cplcUFuFdcVWmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,   & 
& cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZpL,        & 
& cplcUFuFuVZpR,cplcUFuGluSuL,cplcUFuGluSuR,cplcChacUFuSdL,cplcChacUFuSdR,               & 
& sigR_u,sigL_u,sigSL_u,sigSR_u)

! Take care of the new normalisation of Sigma 
SigR_l = 0.5_dp*SigR_L 
SigL_l = 0.5_dp*SigL_L 
SigR_d = 0.5_dp*SigR_d 
SigL_d = 0.5_dp*SigL_d 
SigR_u = 0.5_dp*SigR_u 
SigL_u = 0.5_dp*SigL_u 

Call OneLoop_d_u_e_SM(vSM,g1SM,g2SM,g3SM,Lam_MS,-YuSM,YdSM,YeSM,sigR_d_SM,            & 
& sigL_d_SM,sigSR_d_SM,sigSL_d_SM,sigR_u_SM,sigL_u_SM,sigSR_u_SM,sigSL_u_SM,             & 
& sigR_l_SM,sigL_l_SM,sigSR_l_SM,sigSL_l_SM,kont)

sigR_l(1:3,1:3) = sigR_l(1:3,1:3) - sigR_l_SM
sigL_l(1:3,1:3) = sigL_l(1:3,1:3) - sigL_l_SM
sigSR_l(1:3,1:3) = sigSR_l(1:3,1:3) - sigSR_l_SM
sigSL_l(1:3,1:3) = sigSL_l(1:3,1:3) - sigSL_l_SM
sigR_d(1:3,1:3) = sigR_d(1:3,1:3) - sigR_d_SM
sigL_d(1:3,1:3) = sigL_d(1:3,1:3) - sigL_d_SM
sigSR_d(1:3,1:3) = sigSR_d(1:3,1:3) - sigSR_d_SM
sigSL_d(1:3,1:3) = sigSL_d(1:3,1:3) - sigSL_d_SM
sigR_u(1:3,1:3) = sigR_u(1:3,1:3) - sigR_u_SM
sigL_u(1:3,1:3) = sigL_u(1:3,1:3) - sigL_u_SM
sigSR_u(1:3,1:3) = sigSR_u(1:3,1:3) - sigSR_u_SM
sigSL_u(1:3,1:3) = sigSL_u(1:3,1:3) - sigSL_u_SM


If (.not.OneLoopMatching) Then 
sigR_l = 0._dp 
sigL_l = 0._dp 
sigSR_l = 0._dp 
sigSL_l = 0._dp 
sigR_d = 0._dp 
sigL_d = 0._dp 
sigSR_d = 0._dp 
sigSL_d = 0._dp 
sigR_u = 0._dp 
sigL_u = 0._dp 
sigSR_u = 0._dp 
sigSL_u = 0._dp 
End if
If (GuessTwoLoopMatchingBSM) Then 
   Q2=GetRenormalizationScale() 
    mf_u_Q_SM(3)=mf_u_MS(3)*(1._dp-alpha3/(3._dp*pi)&
               &-43._dp*alpha3**2/(144._dp*Pi2)- alphaQ/(9._dp*Pi))
    SigQCD=SigQCD-10._dp*gSU3**4*oo16pi2*(log(Q2/MGlu2))**2*MFu(3) 
    SigQCD=oo16pi2*SigQCD

    mf_u_Q_SM(3)=mf_u_Q_SM(3)+SigQCD

End if 


! Construct tree-level masses
! Needed for models with additional states mixing with SM particles
Call CalculateMFe(Ye,vd,ZEL,ZER,MFe,kont)

MassFe=0._dp 
Do i1 = 1,3
 MassFe(i1,i1)=MFe(i1) 
End do
MassFe = MatMul(Transpose(ZEL),MatMul(MassFe,Conjg(ZER))) 
MFe(1:3) =mf_l_Q_SM 
Call CalculateMFu(Yu,vu,ZUL,ZUR,MFu,kont)

MassFu=0._dp 
Do i1 = 1,3
 MassFu(i1,i1)=MFu(i1) 
End do
MassFu = MatMul(Transpose(ZUL),MatMul(MassFu,Conjg(ZUR))) 
MFu(1:3) =mf_u_Q_SM 
Call CalculateMFd(Yd,vd,ZDL,ZDR,MFd,kont)

MassFd=0._dp 
Do i1 = 1,3
 MassFd(i1,i1)=MFd(i1) 
End do
MassFd = MatMul(Transpose(ZDL),MatMul(MassFd,Conjg(ZDR))) 
MFd(1:3) =mf_d_Q_SM 


! Obtain Yukawas
Call Yukawas3(MFu,vSM,uU_L,uU_R,SigSL_u,SigL_u,SigR_u&
      &,massFu,YuSM, FermionMassResummation,kont) 
If (kont.Ne.0) Then 
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at renormalisation scale failed" 
    Call TerminateProgram
End If
Call Yukawas3(MFd,vSM,uD_L,uD_R,SigSL_d,SigL_d,SigR_d& 
      &,massFd,YdSM,FermionMassResummation,kont)
If (kont.Ne.0) Then
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at renormalisation scale failed" 
    Call TerminateProgram
End If 
Call Yukawas3(MFe,vSM,uL_L,uL_R,SigSL_l,SigL_l,SigR_l&
     &,massFe,YeSM,.False.,kont) 
If (kont.Ne.0) Then
    Iname=Iname-1
    Write(*,*) " Fit of Yukawa couplings at renormalisation scale failed" 
    Call TerminateProgram
End If


! Transpose Yukawas to fit conventions 
YuSM = Transpose(YuSM) 
YdSM= Transpose(YdSM)
YeSM= Transpose(YeSM)
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.False.)



! Re-calculate quarks with new Yukawas
Call CalculateMFe(Ye,vd,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 
Call CalculateMFu(Yu,vu,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
Call CalculateMFd(Yd,vd,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
mf_l_Q  = MFe(1:3) 
mf_d_Q  = MFd(1:3) 
mf_u_Q  = MFu(1:3) 


! Re-calculate other masses which depend on Yukawas
Call CalculateMSd(g1,g2,gp,Qq,QHd,QHu,Qd,Qs,Qs1,Qs2,Qs3,Yd,Td,lam,mq2,md2,            & 
& vd,vu,vS,vS1,vS2,vS3,ZD,MSd,MSd2,kont)

Call CalculateMSu(g1,g2,gp,Qq,QHd,QHu,Qu,Qs,Qs1,Qs2,Qs3,lam,Yu,Tu,mq2,mu2,            & 
& vd,vu,vS,vS1,vS2,vS3,ZU,MSu,MSu2,kont)

Call CalculateMSe(g1,g2,gp,Ql,QHd,QHu,Qe,Qs,Qs1,Qs2,Qs3,Ye,Te,lam,ml2,me2,            & 
& vd,vu,vS,vS1,vS2,vS3,ZE,MSe,MSe2,kont)



! Check convergence 
converge= .True. 
D_mat=Abs(Abs(YeSM)-Abs(Y_l_old))
Where (Abs(YeSM).Ne.0._dp) D_mat=D_mat/Abs(YeSM)
Do i1=1,3
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
  Do i2=i1+1,3 
   If (D_mat(i1,i2).Gt.delta0) converge= .False. 
   If (D_mat(i2,i1).Gt.delta0) converge= .False. 
 End Do 
End Do 
D_mat=Abs(Abs(YdSM)-Abs(Y_d_old))
Where (Abs(YdSM).Ne.0._dp) D_mat=D_mat/Abs(YdSM)
Do i1=1,3 
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
   Do i2=i1+1,3 
    If (D_mat(i1,i2).Gt.10._dp*delta0) converge= .False. 
    If (D_mat(i2,i1).Gt.10._dp*delta0) converge= .False. 
   End Do 
End Do 
D_mat=Abs(Abs(YuSM)-Abs(Y_u_old))
Where (Abs(YuSM).Ne.0._dp) D_mat=D_mat/Abs(YuSM)
Do i1=1,3
 If (D_mat(i1,i1).Gt.0.1_dp*delta0) converge= .False. 
  Do i2=i1+1,3 
   If (D_mat(i1,i2).Gt.10._dp*delta0) converge= .False. 
   If (D_mat(i2,i1).Gt.10._dp*delta0) converge= .False. 
  End Do 
End Do
If (converge) Exit
  Y_l_old=YeSM
  Y_u_old=YuSM
  Y_d_old=YdSM
!-------------------------------------------------- 
!Either we have run into a numerical problem or 
!perturbation theory breaks down 
!-------------------------------------------------- 
If ((Minval(Abs(mf_l_Q/mf_l)).Lt.0.1_dp)&
&.Or.(Maxval(Abs(mf_l_Q/mf_l)).Gt.10._dp)) Then
Iname=Iname-1
kont=-405
Call AddError(405)
    Write(*,*) " Loop corrections to Yukawa couplings at renormalisation scale too large!" 
    Call TerminateProgram
Else If ((Minval(Abs(mf_d_Q/mf_d)).Lt.0.1_dp)&
&.Or.(Minval(Abs(mf_d_Q/mf_d)).Gt.10._dp)) Then
Iname=Iname-1
kont=-406
Call AddError(406)
    Write(*,*) " Loop corrections to Yukawa couplings at renormalisation scale too large!" 
    Call TerminateProgram
Else If ((Minval(Abs(mf_u_Q/mf_u)).Lt.0.1_dp)&
&.Or.(Minval(Abs(mf_u_Q/mf_u)).Gt.10._dp)) Then
Iname=Iname-1
kont=-407
Call AddError(407)
    Write(*,*) " Loop corrections to Yukawa couplings at renormalisation scale too large!" 
    Call TerminateProgram
End If
End Do! i_loop
If ((.Not.converge).and.FermionMassResummation) Then
Write (ErrCan,*)'Problem in subroutine BoundaryEW!!'
Write (ErrCan,*) "After-1 + (i_loop)iterations no convergence of Yukawas"
End If
Yl_Q=YeSM
Yd_Q=YdSM
Yu_Q=YuSM
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.False.)

Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.False.)

sinW2_Q_mZ=sinW2_Q
vSM_save=vSM
gauge_mZ=gauge

 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))


 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG278(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,gMZ)

rMS_SM = 1._dp 
Iname=Iname-1

Contains

Real(dp) Function rho_2(r)
Implicit None
Real(dp),Intent(in)::r
Real(dp)::r2,r3
r2=r*r
r3=r2*r
rho_2=19._dp-16.5_dp*r+43._dp*r2/12._dp&
&+7._dp*r3/120._dp&
&-Pi*Sqrt(r)*(4._dp-1.5_dp*r+3._dp*r2/32._dp&
&+r3/256._dp)&
&-Pi2*(2._dp-2._dp*r+0.5_dp*r2)&
&-Log(r)*(3._dp*r-0.5_dp*r2)
End Function rho_2


Subroutine Yukawas3(mf,vev,uL,uR,SigS,SigL,SigR,MassMatrix,Y,ReSum,kont)
Implicit None
Integer,Intent(inout)::kont
Real(dp),Intent(in)::mf(3),vev
Complex(dp),Dimension(3,3),Intent(in)::uL,uR,SigS,SigL,SigR
Logical,Intent(in)::ReSum
Complex(dp),Intent(inout)::MassMatrix(3,3)
Complex(dp),Intent(out)::Y(3,3)
Integer::i1
Complex(dp),Dimension(3,3)::mass,uLa,uRa,f,invf,invMass2,Ytemp
Call Adjungate(uL,uLa)
Call Adjungate(uR,uRa)
mass=ZeroC
Do i1=1,3
mass(i1,i1)=mf(i1)
End Do
mass=Matmul(Transpose(uL),Matmul(mass,uR))
If (ReSum) Then
kont=0
Call chop(MassMatrix)
invMass2=MassMatrix
Call gaussj(kont,invMass2,3,3)
If (kont.Ne.0) Return
f=id3C-Matmul(SigS,invMass2)-Transpose(SigL)-Matmul(MassMatrix,Matmul(SigR,invMass2))
invf=f
Call gaussj(kont,invf,3,3)
If (kont.Ne.0) Return
Ytemp=Matmul(invf,mass)
Else
Ytemp=mass+SigS+Matmul(Transpose(SigL),MassMatrix)+Matmul(MassMatrix,SigR)
End If
Y=sqrt2*Ytemp(1:3,1:3)/vev
Call chop(y)
End Subroutine Yukawas3

End Subroutine BoundaryBSM 
 
Subroutine Sugra(delta0,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,             & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,mGut,kont,WriteComment,niter)

Implicit None
Logical,Intent(in) :: WriteComment
Integer,Intent(inout) :: kont
Integer,Intent(in) :: niter
Real(dp) :: delta0,deltaG0, gA(278), gB(278)
Real(dp) :: gC(284),  gD(284) 
Real(dp),Intent(out) :: mGUT
Complex(dp) :: Tad1Loop(6) 
Real(dp) :: comp(6), tanbQ, vev2 
Complex(dp) :: cplAhAhUhh(6,6,6),cplAhUhhhh(6,6,6),cplAhUhhVZ(6,6),cplAhUhhVZp(6,6),cplcChaChaUhhL(2,2,6),& 
& cplcChaChaUhhR(2,2,6),cplChiChiUhhL(9,9,6),cplChiChiUhhR(9,9,6),cplcFdFdUhhL(3,3,6),   & 
& cplcFdFdUhhR(3,3,6),cplcFeFeUhhL(3,3,6),cplcFeFeUhhR(3,3,6),cplcFuFuUhhL(3,3,6),       & 
& cplcFuFuUhhR(3,3,6),cplcFvFvUhhL(3,3,6),cplcFvFvUhhR(3,3,6),cplcgWmgWmUhh(6),          & 
& cplcgWpCgWpCUhh(6),cplcgZgZUhh(6),cplcgZpgZUhh(6),cplcgZgZpUhh(6),cplcgZpgZpUhh(6),    & 
& cplUhhhhhh(6,6,6),cplUhhHpmcHpm(6,2,2),cplUhhHpmcVWm(6,2),cplUhhSdcSd(6,6,6),          & 
& cplUhhSecSe(6,6,6),cplUhhSucSu(6,6,6),cplUhhSvcSv(6,6,6),cplUhhcVWmVWm(6),             & 
& cplUhhVZVZ(6),cplUhhVZVZp(6),cplUhhVZpVZp(6),cplAhAhUhhUhh(6,6,6,6),cplUhhUhhhhhh(6,6,6,6),& 
& cplUhhUhhHpmcHpm(6,6,2,2),cplUhhUhhSdcSd(6,6,6,6),cplUhhUhhSecSe(6,6,6,6),             & 
& cplUhhUhhSucSu(6,6,6,6),cplUhhUhhSvcSv(6,6,6,6),cplUhhUhhcVWmVWm(6,6),cplUhhUhhVZVZ(6,6),& 
& cplUhhUhhVZpVZp(6,6)

Real(dp),Intent(inout) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(inout) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp),Intent(inout) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp) ::mass_new(50),mass_old(50),diff_m(50)
Real(dp) :: tz,dt,q,q2,mudim,mudimNew, vev, sinW2 
Logical::FoundResult, SignMassChangedSave 
Integer::j,n_tot, i_count, i1, i2 
Iname=Iname+1
NameOfUnit(Iname)='Sugra'
kont=0
FoundResult= .False.
n_tot =1
mass_old(n_tot:n_tot+5) = MSd
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+5) = MSv
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+5) = MSu
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+5) = MSe
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+5) = Mhh
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+5) = MAh
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+1) = MHpm
n_tot = n_tot + 2 
mass_old(n_tot:n_tot+8) = MChi
n_tot = n_tot + 9 
mass_old(n_tot:n_tot+1) = MCha
n_tot = n_tot + 2 
mass_old(n_tot:n_tot+0) = MGlu
If (.Not.UseFixedScale) Then 
mudim=Max(mZ**2,Abs(MSu(1)*MSu(6))) 
Call SetRGEScale(mudim) 
UseFixedScale= .False. 
End If 
Write(*,*) "Calculating mass spectrum" 
CalculateOneLoopMassesSave = CalculateOneLoopMasses 
CalculateOneLoopMasses = .false. 
Do j=1,niter 
Write(*,*) "  ", j,".-iteration" 
Write(ErrCan,*) "RGE Running ", j,".-iteration" 
Call BoundaryEW(j,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,               & 
& MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,               & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,            & 
& g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,             & 
& mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,delta0,gB,kont)

If (kont.Ne.0) Then
Iname=Iname-1
    Write(*,*) " Problem with boundary conditions at EW scale" 
    Call TerminateProgram
End If
 
Call RunRGE(kont,0.1_dp*delta0,gB,gA,mGUT)
 
Call GToParameters278(gA,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,               & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
If (kont.Ne.0) Then
Iname=Iname-1
    Write(*,*) " RGE running not possible. Errorcode:", kont 
    Call TerminateProgram
End If
mudim=GetRenormalizationScale() 
Q=Sqrt(mudim) 
Q2=mudim 
tz=Log(Q/mZ)
dt=-tz/50._dp
vd=1._dp
vu=tanbeta 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 vS = vSInput
vS1 = v1Input
vS2 = v2Input
vS3 = v3Input
kap = KappaInput
lam = LambdaInput
Yv = YvIN
else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 vS = vSIN 
 vS1 = vS1IN 
 vS2 = vS2IN 
 vS3 = vS3IN 
 gp = gpIN 
 lam = lamIN 
 Yv = YvIN 
 kap = kapIN 
 Td = TdIN 
 Te = TeIN 
 Tlam = TlamIN 
 Tv = TvIN 
 Tk = TkIN 
 Tu = TuIN 
 mq2 = mq2IN 
 ml2 = ml2IN 
 mHd2 = mHd2IN 
 mHu2 = mHu2IN 
 md2 = md2IN 
 mu2 = mu2IN 
 me2 = me2IN 
 ms2 = ms2IN 
 ms12 = ms12IN 
 ms22 = ms22IN 
 ms32 = ms32IN 
 mv2 = mv2IN 
 M1 = M1IN 
 M2 = M2IN 
 M3 = M3IN 
 M4 = M4IN 
 vd = (2*Sqrt(mz2/(g1**2 + g2**2)))/Sqrt(1 + TanBeta**2)
vu = (2*Sqrt(mz2/(g1**2 + g2**2))*TanBeta)/Sqrt(1 + TanBeta**2)
End if
 
 ! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))


 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,gC)

Call odeint(gC,284,tz,0._dp,0.1_dp*delta0,dt,0._dp,rge284,kont)
Call GToParameters284(gC,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,               & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
  tanbetaMZ = vu/vd 
vd = vdMZ
vu = vuMZ

 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

vSMZ = vS 
vS1MZ = vS1 
vS2MZ = vS2 
vS3MZ = vS3 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,gD)

tz=Log(mZ/Q)
dt=-tz/50._dp
Call odeint(gD,284,tz,0._dp,0.1_dp*delta0,dt,0._dp,rge284,kont)
Call GToParameters284(gD,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,               & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 


  tanbQ = tanbeta 
vev2=4._dp*Real(mZ2,dp)/(g1**2+g2**2) -0._dp
vd=Sqrt(vev2/(1._dp+tanbQ**2))
vu=tanbQ*vd
vdSUSY = vd 
vuSUSY = vu 
vSSUSY = vS 
vS1SUSY = vS1 
vS2SUSY = vS2 
vS3SUSY = vS3 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 vS = vSInput
vS1 = v1Input
vS2 = v2Input
vS3 = v3Input
kap = KappaInput
lam = LambdaInput
Yv = YvIN
else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 vS = vSIN 
 vS1 = vS1IN 
 vS2 = vS2IN 
 vS3 = vS3IN 
 gp = gpIN 
 lam = lamIN 
 Yv = YvIN 
 kap = kapIN 
 Td = TdIN 
 Te = TeIN 
 Tlam = TlamIN 
 Tv = TvIN 
 Tk = TkIN 
 Tu = TuIN 
 mq2 = mq2IN 
 ml2 = ml2IN 
 mHd2 = mHd2IN 
 mHu2 = mHu2IN 
 md2 = md2IN 
 mu2 = mu2IN 
 me2 = me2IN 
 ms2 = ms2IN 
 ms12 = ms12IN 
 ms22 = ms22IN 
 ms32 = ms32IN 
 mv2 = mv2IN 
 M1 = M1IN 
 M2 = M2IN 
 M3 = M3IN 
 M4 = M4IN 
 vd = (2*Sqrt(mz2/(g1**2 + g2**2)))/Sqrt(1 + TanBeta**2)
vu = (2*Sqrt(mz2/(g1**2 + g2**2))*TanBeta)/Sqrt(1 + TanBeta**2)
End if
 
 ! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

Call OneLoopMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,               & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,            & 
& g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,             & 
& mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,kont)

 FirstRun = .False. 
If (kont.Ne.0) Then
Iname=Iname-1
    Write(*,*) " Problem in RGE Running. Errorcode:", kont 
    If (kont.eq.-12) Then 
      Write(*,*) "Stepsize underflow in rkqs (most likely due to a Landau pole) " 
    Else If ((kont.eq.-1).or.(kont.eq.-5).or.(kont.eq.-9)) Then 
      Write(*,*) "Stepsize smaller than minimum." 
    Else If ((kont.eq.-2).or.(kont.eq.-6).or.(kont.eq.-10)) Then 
      Write(*,*) "Running values larger 10^36." 
    Else If ((kont.eq.-3).or.(kont.eq.-7).or.(kont.eq.-11)) Then 
      Write(*,*) "Too many steps: Running has not converged." 
    Else If ((kont.eq.-4).or.(kont.eq.-8)) Then 
      Write(*,*) "No GUT scale found." 
End If
    Call TerminateProgram
End If
n_tot =1
mass_new(n_tot:n_tot+5) = MSd
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+5) = MSv
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+5) = MSu
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+5) = MSe
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+5) = Mhh
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+5) = MAh
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+1) = MHpm
n_tot = n_tot + 2 
mass_new(n_tot:n_tot+8) = MChi
n_tot = n_tot + 9 
mass_new(n_tot:n_tot+1) = MCha
n_tot = n_tot + 2 
mass_new(n_tot:n_tot+0) = MGlu
Where (mass_new.lt.1E-10_dp) mass_new=0._dp 
diff_m=Abs(mass_new-mass_old)
Where (Abs(mass_old).Gt.0._dp) diff_m=diff_m/Abs(mass_old)
deltag0=Maxval(diff_m)
Write(*,*) "  ... reached precision:", deltag0 
If (WriteComment) Write(*,*) "Sugra,Comparing",deltag0
If ((deltag0.Lt.delta0).And.(j.Gt.1)) Then! require at least two iterations
   FoundResult= .True.
If (SignOfMassChanged) Then
  If (.Not.IgnoreNegativeMasses) Then
  Write(*,*) " Mass spectrum converged, but negative mass squared present." 
   Call TerminateProgram 
  Else 
   SignOfMassChanged = .False. 
   kont = 0 
  End If
End If
If (SignOfMuChanged) Then
  If (.Not.IgnoreMuSignFlip) Then
  Write(*,*) " Mass spectrum converged, but negative |mu|^2 from tadpoles." 
   Call TerminateProgram 
  Else 
   SignOfMuChanged = .False. 
   kont = 0 
  End If
End If
Exit
Else
If (SignOfMassChanged) Then
  If ((j.ge.MinimalNumberIterations).And.(.Not.IgnoreNegativeMasses)) Then
  Write(*,*) " Still a negative mass squared after ",MinimalNumberIterations," iterations. Stop calculation. "  
   Call TerminateProgram 
  Else 
   SignOfMassChanged = .False. 
   kont = 0 
  End If
End If
If (SignOfMuChanged) Then
  If ((j.ge.MinimalNumberIterations).And.(.Not.IgnoreMuSignFlip)) Then
  Write(*,*) " Still a negative |mu|^2 after ",MinimalNumberIterations," iterations. Stop calculation. "  
   Call TerminateProgram 
  Else 
   SignOfMuChanged = .False. 
   kont = 0 
  End If
End If
mass_old=mass_new 
If (.Not.UseFixedScale) Then 
mudimNew=Max(mZ**2,Abs(MSu(1)*MSu(6))) 
If (HighScaleModel.eq."LOW") Call SetGUTscale(sqrt(mudimNew)) 
 UseFixedScale= .False. 
End If 
If (j.lt.niter) Then 
Call GToParameters284(gC,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,               & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)

vd = vdMZ 
vu = vuMZ 

 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 

 
 ! --- Boundary conditions at EW-scale when running down --- 
! ----------------------- 
 

 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))


 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 
If (IgnoreNegativeMassesMZ) Then 
  SignMassChangedSave = SignOfMassChanged 
End if 
Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,GenerationMixing,kont)

If (IgnoreNegativeMassesMZ) Then 
  SignOfMassChanged = SignMassChangedSave  
End if 
If (.Not.UseFixedScale) Then 
Call SetRGEScale(mudimNew) 
UseFixedScale= .False. 
End If 
Else
  FoundIterativeSolution = .False. 
End if
End If
End Do
If (CalculateOneLoopMassesSave) Then 
CalculateOneLoopMasses =  CalculateOneLoopMassesSave 
Write(*,*) "Calculate loop corrected masses " 
Call OneLoopMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,               & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,            & 
& g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,             & 
& mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,kont)

If (SignOfMassChanged) Then
  If (.Not.IgnoreNegativeMasses) Then
  Write(*,*) " Mass spectrum converged, but negative mass squared present." 
   Call TerminateProgram 
  Else 
   SignOfMassChanged = .False. 
   kont = 0 
  End If
End If
If (SignOfMuChanged) Then
  If (.Not.IgnoreMuSignFlip) Then
  Write(*,*) " Mass spectrum converged, but negative |mu|^2 from tadpoles." 
   Call TerminateProgram 
  Else 
   SignOfMuChanged = .False. 
   kont = 0 
  End If
End If
End if 
Iname=Iname-1
 
End Subroutine Sugra
 
Subroutine RunRGE(kont, delta0, g1A, g1C, mGUT)
Implicit None
Integer,Intent(inout)::kont
Real(dp),Intent(in)::delta0
Integer :: i1, i2, i3, i4 
Real(dp),Intent(inout)::g1A(278)
Real(dp),Intent(out)::g1C(278),mGUT
Real(dp)::tz,dt,t_out 
Real(dp)::mudim,gGUT,gA_h(278),g1b(278),m_hi,m_lo
Real(dp)::g1S(278)
Logical :: FoundUnification, unified, greater 

Iname=Iname+1
NameOfUnit(Iname)='runRGE'

If (.Not.UseFixedGUTScale) Then
m_lo=5.e12_dp
Else 
m_lo=Min(5.e12_dp,GUT_Scale)
End If 
mudim=GetRenormalizationScale()
mudim=Max(mudim,mZ2)
tz=0.5_dp*Log(mZ2/mudim)
dt=tz/100._dp
Call odeint(g1A,278,tz,0._dp,delta0,dt,0._dp,rge278,kont)

If (kont.Ne.0) Then 
  Iname=Iname-1 
  Write(*,*) " Problem with RGE running. Errorcode:", kont 
  Call TerminateProgram 
End If 
Call BoundarySUSY(g1a,g1B)

FoundUnification= .False. 
tz=Log(sqrt(mudim)/m_lo)
dt=-tz/50._dp

Call odeint(g1B,278,tz,0._dp,delta0,dt,0._dp,rge278,kont)

If (kont.Ne.0) Then 
Iname=Iname-1 
  Write(*,*) " Problem with RGE running. Errorcode:", kont 
Call TerminateProgram 
End If 
If (.Not.UseFixedGUTScale) Then
tz=Log(m_lo/1.e20_dp)
dt=-tz/50._dp

Call odeintB2(g1B,278,tz,0._dp,delta0,dt,0._dp,rge278,checkGUT278,t_out,kont)

If (kont.Eq.0) Then
FoundUnification= .True. 
mGUT=1.e20_dp*Exp(t_out)
gGUT=Sqrt(0.5_dp*(g1b(1)**2+g1b(2)**2))
If (StrictUnification) g1b(3)=gGUT
Else
Write(ErrCan,*) "kont",kont,delta0,tz,dt
Write (ErrCan,*) "t_out",t_out,1.e20_dp*Exp(t_out)
Write(ErrCan,*) " "
Iname=Iname-1
Return
End If
Else
  tz=Log(m_lo/GUT_scale)
  mGUT=GUT_scale
  dt=-tz/50._dp
Call odeint(g1B,278,tz,0._dp,delta0,dt,0._dp,rge278,kont)

If (kont.Ne.0) Then 
Iname=Iname-1 
  Write(*,*) " Problem with RGE running. Errorcode:", kont 
Call TerminateProgram 
End If 
End If

mGUT_Save=mGUT
Call BoundaryHS(g1B,g1c,mGUT)

mudim=GetRenormalizationScale()
mudim=Max(mudim,mZ2)
tz=0.5_dp*Log(mudim/mGUT_save**2)
dt=tz/100._dp
Call odeint(g1c,278,0._dp,tz,delta0,dt,0._dp,rge278,kont)
Iname=Iname-1
End Subroutine RunRGE

Subroutine Match_and_Run(delta0,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,              & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,              & 
& ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,g1,g2,g3,gp,             & 
& Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,             & 
& ms12,ms22,ms32,mv2,M1,M2,M3,M4,mGut,kont,WriteComment,niter)

Implicit None
Logical,Intent(in) :: WriteComment
Integer,Intent(inout) :: kont
Integer,Intent(in) :: niter
Real(dp) :: g_SM(62) 
Real(dp) :: delta0,deltaG0, gA(278), gB(278)
Real(dp) :: gC(284),  gD(284) 
Real(dp),Intent(out) :: mGUT
Complex(dp) :: Tad1Loop(6), lambda_SM, lambda_MZ 
Real(dp) :: comp(6), tanbQ, vev2 
Complex(dp) :: cplAhAhUhh(6,6,6),cplAhUhhhh(6,6,6),cplAhUhhVZ(6,6),cplAhUhhVZp(6,6),cplcChaChaUhhL(2,2,6),& 
& cplcChaChaUhhR(2,2,6),cplChiChiUhhL(9,9,6),cplChiChiUhhR(9,9,6),cplcFdFdUhhL(3,3,6),   & 
& cplcFdFdUhhR(3,3,6),cplcFeFeUhhL(3,3,6),cplcFeFeUhhR(3,3,6),cplcFuFuUhhL(3,3,6),       & 
& cplcFuFuUhhR(3,3,6),cplcFvFvUhhL(3,3,6),cplcFvFvUhhR(3,3,6),cplcgWmgWmUhh(6),          & 
& cplcgWpCgWpCUhh(6),cplcgZgZUhh(6),cplcgZpgZUhh(6),cplcgZgZpUhh(6),cplcgZpgZpUhh(6),    & 
& cplUhhhhhh(6,6,6),cplUhhHpmcHpm(6,2,2),cplUhhHpmcVWm(6,2),cplUhhSdcSd(6,6,6),          & 
& cplUhhSecSe(6,6,6),cplUhhSucSu(6,6,6),cplUhhSvcSv(6,6,6),cplUhhcVWmVWm(6),             & 
& cplUhhVZVZ(6),cplUhhVZVZp(6),cplUhhVZpVZp(6),cplAhAhUhhUhh(6,6,6,6),cplUhhUhhhhhh(6,6,6,6),& 
& cplUhhUhhHpmcHpm(6,6,2,2),cplUhhUhhSdcSd(6,6,6,6),cplUhhUhhSecSe(6,6,6,6),             & 
& cplUhhUhhSucSu(6,6,6,6),cplUhhUhhSvcSv(6,6,6,6),cplUhhUhhcVWmVWm(6,6),cplUhhUhhVZVZ(6,6),& 
& cplUhhUhhVZpVZp(6,6)

Real(dp),Intent(inout) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(inout) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp),Intent(inout) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp) ::mass_new(62),mass_old(62),diff_m(62)
Real(dp) :: tz,dt,q,q2,mudim,mudimNew, vev, sinW2, mh_SM 
Logical::FoundResult, SignMassChangedSave 
Integer::j,n_tot, i_count, i1, i2 
Iname=Iname+1
NameOfUnit(Iname)='Match_and_Run'
kont=0
FoundResult= .False.
n_tot =1
mass_old(n_tot:n_tot+5) = MSd
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+5) = MSv
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+5) = MSu
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+5) = MSe
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+5) = Mhh
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+5) = MAh
n_tot = n_tot + 6 
mass_old(n_tot:n_tot+1) = MHpm
n_tot = n_tot + 2 
mass_old(n_tot:n_tot+8) = MChi
n_tot = n_tot + 9 
mass_old(n_tot:n_tot+1) = MCha
n_tot = n_tot + 2 
mass_old(n_tot:n_tot+0) = MGlu
If (.Not.UseFixedScale) Then 
mudim=Max(mZ**2,Abs(MSu(1)*MSu(6))) 
Call SetRGEScale(mudim) 
UseFixedScale= .False. 
End If 
Write(*,*) "Calculating mass spectrum" 
CalculateOneLoopMassesSave = CalculateOneLoopMasses 
CalculateOneLoopMasses = .false. 
Lambda_MZ = 0.1_dp 
Do j=1,niter 
Write(*,*) "  ", j,".-iteration" 
Write(ErrCan,*) "RGE Running ", j,".-iteration" 
Call BoundarySM(j,Lambda_MZ,delta0,g_SM,kont)

g_SM_save = g_SM 
mudim=GetRenormalizationScale()
mudim=Max(mudim,mZ2)
tz=0.5_dp*Log(mZ2/mudim)
dt=tz/100._dp
g_SM(1) = Sqrt(5._dp/3._dp)*g_SM(1) 
Call odeint(g_SM,62,tz,0._dp,delta0,dt,0._dp,rge62_SM,kont)

g_SM(1) = Sqrt(3._dp/5._dp)*g_SM(1) 
If (kont.Ne.0) Then 
  Iname=Iname-1 
  Write(*,*) " Problem with RGE running. Errorcode:", kont 
  Call TerminateProgram 
End If 
Call BoundaryBSM(j,g_SM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,             & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,            & 
& g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,             & 
& mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,delta0,gB,kont)

If (kont.Ne.0) Then
Iname=Iname-1
    Write(*,*) " Problem with boundary conditions at EW scale" 
    Call TerminateProgram
End If
 
Call RunRGE_New(kont,0.1_dp*delta0,gB,gA,mGUT)
 
Call GToParameters278(gA,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,               & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
If (kont.Ne.0) Then
Iname=Iname-1
    Write(*,*) " RGE running not possible. Errorcode:", kont 
    Call TerminateProgram
End If
mudim=GetRenormalizationScale() 
Q=Sqrt(mudim) 
Q2=mudim 
tz=Log(Q/mZ)
dt=-tz/50._dp
vd=1._dp
vu=tanbeta 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 vS = vSInput
vS1 = v1Input
vS2 = v2Input
vS3 = v3Input
kap = KappaInput
lam = LambdaInput
Yv = YvIN
else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 vS = vSIN 
 vS1 = vS1IN 
 vS2 = vS2IN 
 vS3 = vS3IN 
 gp = gpIN 
 lam = lamIN 
 Yv = YvIN 
 kap = kapIN 
 Td = TdIN 
 Te = TeIN 
 Tlam = TlamIN 
 Tv = TvIN 
 Tk = TkIN 
 Tu = TuIN 
 mq2 = mq2IN 
 ml2 = ml2IN 
 mHd2 = mHd2IN 
 mHu2 = mHu2IN 
 md2 = md2IN 
 mu2 = mu2IN 
 me2 = me2IN 
 ms2 = ms2IN 
 ms12 = ms12IN 
 ms22 = ms22IN 
 ms32 = ms32IN 
 mv2 = mv2IN 
 M1 = M1IN 
 M2 = M2IN 
 M3 = M3IN 
 M4 = M4IN 
 vd = (2*Sqrt(mz2/(g1**2 + g2**2)))/Sqrt(1 + TanBeta**2)
vu = (2*Sqrt(mz2/(g1**2 + g2**2))*TanBeta)/Sqrt(1 + TanBeta**2)
End if
 
 ! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))


 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,gC)

Call odeint(gC,284,tz,0._dp,0.1_dp*delta0,dt,0._dp,rge284,kont)
Call GToParameters284(gC,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,               & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
  tanbetaMZ = vu/vd 
vd = vdMZ
vu = vuMZ

 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

vSMZ = vS 
vS1MZ = vS1 
vS2MZ = vS2 
vS3MZ = vS3 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 
Call ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,vu,             & 
& vS,vS1,vS2,vS3,gD)

tz=Log(mZ/Q)
dt=-tz/50._dp
Call odeint(gD,284,tz,0._dp,0.1_dp*delta0,dt,0._dp,rge284,kont)
Call GToParameters284(gD,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,               & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 


  tanbQ = tanbeta 
vev2=4._dp*Real(mZ2,dp)/(g1**2+g2**2) -0._dp
vd=Sqrt(vev2/(1._dp+tanbQ**2))
vu=tanbQ*vd
vdSUSY = vd 
vuSUSY = vu 
vSSUSY = vS 
vS1SUSY = vS1 
vS2SUSY = vS2 
vS3SUSY = vS3 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 vS = vSInput
vS1 = v1Input
vS2 = v2Input
vS3 = v3Input
kap = KappaInput
lam = LambdaInput
Yv = YvIN
else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 vS = vSIN 
 vS1 = vS1IN 
 vS2 = vS2IN 
 vS3 = vS3IN 
 gp = gpIN 
 lam = lamIN 
 Yv = YvIN 
 kap = kapIN 
 Td = TdIN 
 Te = TeIN 
 Tlam = TlamIN 
 Tv = TvIN 
 Tk = TkIN 
 Tu = TuIN 
 mq2 = mq2IN 
 ml2 = ml2IN 
 mHd2 = mHd2IN 
 mHu2 = mHu2IN 
 md2 = md2IN 
 mu2 = mu2IN 
 me2 = me2IN 
 ms2 = ms2IN 
 ms12 = ms12IN 
 ms22 = ms22IN 
 ms32 = ms32IN 
 mv2 = mv2IN 
 M1 = M1IN 
 M2 = M2IN 
 M3 = M3IN 
 M4 = M4IN 
 vd = (2*Sqrt(mz2/(g1**2 + g2**2)))/Sqrt(1 + TanBeta**2)
vu = (2*Sqrt(mz2/(g1**2 + g2**2))*TanBeta)/Sqrt(1 + TanBeta**2)
End if
 
 ! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

Call OneLoopMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,               & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,            & 
& g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,             & 
& mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,kont)

 FirstRun = .False. 
If (kont.Ne.0) Then
Iname=Iname-1
    Write(*,*) " Problem in RGE Running. Errorcode:", kont 
    If (kont.eq.-12) Then 
      Write(*,*) "Stepsize underflow in rkqs (most likely due to a Landau pole) " 
    Else If ((kont.eq.-1).or.(kont.eq.-5).or.(kont.eq.-9)) Then 
      Write(*,*) "Stepsize smaller than minimum." 
    Else If ((kont.eq.-2).or.(kont.eq.-6).or.(kont.eq.-10)) Then 
      Write(*,*) "Running values larger 10^36." 
    Else If ((kont.eq.-3).or.(kont.eq.-7).or.(kont.eq.-11)) Then 
      Write(*,*) "Too many steps: Running has not converged." 
    Else If ((kont.eq.-4).or.(kont.eq.-8)) Then 
      Write(*,*) "No GUT scale found." 
End If
    Call TerminateProgram
End If
n_tot =1
mass_new(n_tot:n_tot+5) = MSd
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+5) = MSv
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+5) = MSu
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+5) = MSe
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+5) = Mhh
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+5) = MAh
n_tot = n_tot + 6 
mass_new(n_tot:n_tot+1) = MHpm
n_tot = n_tot + 2 
mass_new(n_tot:n_tot+8) = MChi
n_tot = n_tot + 9 
mass_new(n_tot:n_tot+1) = MCha
n_tot = n_tot + 2 
mass_new(n_tot:n_tot+0) = MGlu
Where (mass_new.lt.1E-10_dp) mass_new=0._dp 
diff_m=Abs(mass_new-mass_old)
Where (Abs(mass_old).Gt.0._dp) diff_m=diff_m/Abs(mass_old)
deltag0=Maxval(diff_m)
Write(*,*) "  ... reached precision:", deltag0 
If (WriteComment) Write(*,*) "Sugra,Comparing",deltag0
If ((deltag0.Lt.delta0).And.(j.Gt.1)) Then! require at least two iterations
   FoundResult= .True.
If (SignOfMassChanged) Then
  If (.Not.IgnoreNegativeMasses) Then
  Write(*,*) " Mass spectrum converged, but negative mass squared present." 
   Call TerminateProgram 
  Else 
   SignOfMassChanged = .False. 
   kont = 0 
  End If
End If
If (SignOfMuChanged) Then
  If (.Not.IgnoreMuSignFlip) Then
  Write(*,*) " Mass spectrum converged, but negative |mu|^2 from tadpoles." 
   Call TerminateProgram 
  Else 
   SignOfMuChanged = .False. 
   kont = 0 
  End If
End If
Exit
Else
If (SignOfMassChanged) Then
  If ((j.ge.MinimalNumberIterations).And.(.Not.IgnoreNegativeMasses)) Then
  Write(*,*) " Still a negative mass squared after ",MinimalNumberIterations," iterations. Stop calculation. "  
   Call TerminateProgram 
  Else 
   SignOfMassChanged = .False. 
   kont = 0 
  End If
End If
If (SignOfMuChanged) Then
  If ((j.ge.MinimalNumberIterations).And.(.Not.IgnoreMuSignFlip)) Then
  Write(*,*) " Still a negative |mu|^2 after ",MinimalNumberIterations," iterations. Stop calculation. "  
   Call TerminateProgram 
  Else 
   SignOfMuChanged = .False. 
   kont = 0 
  End If
End If
mass_old=mass_new 
If (.Not.UseFixedScale) Then 
mudimNew=Max(mZ**2,Abs(MSu(1)*MSu(6))) 
If (HighScaleModel.eq."LOW") Call SetGUTscale(sqrt(mudimNew)) 
 UseFixedScale= .False. 
End If 
If (j.lt.niter) Then 
mudim=GetRenormalizationScale()
mudim=Max(mudim,mZ2)
tz=0.5_dp*Log(mZ2/mudim)
dt=tz/100._dp 
g_SM(1)=g_SM(1)*sqrt(5._dp/3._dp) 
g_SM(4)=Mhh2(1)/g_SM(62)**2 
Call odeint(g_SM,62,0._dp,tz,delta0,dt,0._dp,rge62_SM,kont) 
g_SM(1)=g_SM(1)/sqrt(5._dp/3._dp) 
Lambda_MZ=g_SM(4) 
If (.Not.UseFixedScale) Then 
Call SetRGEScale(mudimNew) 
UseFixedScale= .False. 
End If 
Else
  FoundIterativeSolution = .False. 
End if
End If
End Do
If (CalculateOneLoopMassesSave) Then 
CalculateOneLoopMasses =  CalculateOneLoopMassesSave 
Write(*,*) "Calculate loop corrected masses " 
Call OneLoopMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,               & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,            & 
& g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,             & 
& mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,kont)

If (((Calculate_mh_within_SM).and.(Mhh(2).gt.300._dp)).OR.(Force_mh_within_SM))Then
Write(*,*) "Calculate Higgs mass within effective SM " 
Call Get_mh_pole_SM(g_SM,mudim,delta0,Mhh2(1),mh_SM) 
Mhh2(1) = mh_SM**2 
Mhh(1) = mh_SM 
End if
If (SignOfMassChanged) Then
  If (.Not.IgnoreNegativeMasses) Then
  Write(*,*) " Mass spectrum converged, but negative mass squared present." 
   Call TerminateProgram 
  Else 
   SignOfMassChanged = .False. 
   kont = 0 
  End If
End If
If (SignOfMuChanged) Then
  If (.Not.IgnoreMuSignFlip) Then
  Write(*,*) " Mass spectrum converged, but negative |mu|^2 from tadpoles." 
   Call TerminateProgram 
  Else 
   SignOfMuChanged = .False. 
   kont = 0 
  End If
End If
End if 
Iname=Iname-1
 
End Subroutine Match_and_Run
 
Subroutine RunRGE_new(kont, delta0, g1A, g1C, mGUT)
Implicit None
Integer,Intent(inout)::kont
Real(dp),Intent(in)::delta0
Integer :: i1, i2, i3, i4 
Real(dp),Intent(inout)::g1A(278)
Real(dp),Intent(out)::g1C(278),mGUT
Real(dp)::tz,dt,t_out 
Real(dp)::mudim,gGUT,gA_h(278),m_hi,m_lo
Real(dp)::g1B(278)
Real(dp)::g1S(278)
Logical :: FoundUnification, unified, greater 

Iname=Iname+1
NameOfUnit(Iname)='runRGE'

If (.Not.UseFixedGUTScale) Then
m_lo=5.e12_dp
Else 
m_lo=Min(5.e12_dp,GUT_Scale)
End If 
mudim=GetRenormalizationScale()
mudim=Max(mudim,mZ2)
FoundUnification= .False. 
tz=Log(sqrt(mudim)/m_lo)
dt=-tz/50._dp

g1B=g1A

Call odeint(g1B,278,tz,0._dp,delta0,dt,0._dp,rge278,kont)

If (kont.Ne.0) Then 
Iname=Iname-1 
  Write(*,*) " Problem with RGE running. Errorcode:", kont 
Call TerminateProgram 
End If 
If (.Not.UseFixedGUTScale) Then
tz=Log(m_lo/1.e20_dp)
dt=-tz/50._dp

Call odeintB2(g1B,278,tz,0._dp,delta0,dt,0._dp,rge278,checkGUT278,t_out,kont)

If (kont.Eq.0) Then
FoundUnification= .True. 
mGUT=1.e20_dp*Exp(t_out)
gGUT=Sqrt(0.5_dp*(g1b(1)**2+g1b(2)**2))
If (StrictUnification) g1b(3)=gGUT
Else
Write(ErrCan,*) "kont",kont,delta0,tz,dt
Write (ErrCan,*) "t_out",t_out,1.e20_dp*Exp(t_out)
Write(ErrCan,*) " "
Iname=Iname-1
Return
End If
Else
  tz=Log(m_lo/GUT_scale)
  mGUT=GUT_scale
  dt=-tz/50._dp
Call odeint(g1B,278,tz,0._dp,delta0,dt,0._dp,rge278,kont)

If (kont.Ne.0) Then 
Iname=Iname-1 
  Write(*,*) " Problem with RGE running. Errorcode:", kont 
Call TerminateProgram 
End If 
End If

mGUT_Save=mGUT
Call BoundaryHS(g1B,g1c,mGUT)

mudim=GetRenormalizationScale()
mudim=Max(mudim,mZ2)
tz=0.5_dp*Log(mudim/mGUT_save**2)
dt=tz/100._dp
Call odeint(g1c,278,0._dp,tz,delta0,dt,0._dp,rge278,kont)
Iname=Iname-1
End Subroutine RunRGE_new

Subroutine checkGUT278(y,eps,unified,greater)  
Implicit None 
Real(dp), Intent(in) :: y(278), eps 
Logical, Intent(out) :: unified, greater 
Call GToParameters278(y,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,             & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4)

If ((((g1)-(g2)).Gt.0._dp).And.(((g1)-(g2)).Lt.eps)) Then 
  unified = .True. 
Else 
   unified = .False. 
End If 
If ((g1).Gt.(g2)) Then 
  greater = .True. 
Else 
  greater = .False. 
End If 
End Subroutine checkGUT278
 
Subroutine FirstGuess(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,            & 
& g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,             & 
& mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,kont)

Implicit None 
Real(dp),Intent(out) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp),Intent(out) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp),Intent(out) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(out) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Integer,Intent(inout)::kont
Integer :: i1, i2
Real(dp),Intent(inout) :: vd,vu,vS,vS1,vS2,vS3

Real(dp)::vev,vevs(2),vev2,mgut,mudim,mudimNew,sigma(2),cosW,cosW2,sinW2 
Complex(dp):: YeSM(3,3), YdSM(3,3), YuSM(3,3) 
Real(dp) :: k_fac, g1SM, g2SM, g3SM, vSM 
Real(dp), Parameter :: oo2pi=1._dp/(2._dp*pi),oo6pi=oo2pi/3._dp 
Real(dp):: gA(278), gB(278), Scale_Save 
Logical::TwoLoopRGE_save, UseFixedScale_save 
Iname=Iname+1 
NameOfUnit(Iname)="FirstGuess" 
If (HighScaleModel.eq."LOW") UseFixedGUTScale = .true. 

If (tanbeta.gt.3._dp) Then 
 tanb = tanbeta 
 tanbetaMZ = tanbeta 
Else 
 tanb = 5._dp 
 tanbetaMZ = 5._dp 
End if 
mW2=mZ2*(0.5_dp+Sqrt(0.25_dp-Alpha_Mz*pi/(sqrt2*G_F*mZ2)))
mW=Sqrt(mW2) 
cosW2=mw2/mZ2 
sinW2=1._dp-cosW2 
cosW=Sqrt(cosW2) 
 
If (tanbeta.gt.5._dp) Then 
 k_fac=1._dp-alpha*(oo6pi & 
  &-oo2pi*(57._dp*Log(10._dp)+16._dp*Log(mf_u(3)/mZ))/9._dp) 
Else 
 k_fac=1._dp 
End if 
g1SM=Sqrt(3._dp/5._dp)*Sqrt(20._dp*pi*alpha_mZ/(k_fac*3._dp*(1._dp-sinW2))) 
g2SM=Sqrt(4._dp*pi*alpha_mZ/(k_fac*sinW2)) 
If (tanbeta.gt.5._dp) Then 
 k_fac=1-AlphaS_mZ*oo2pi*(0.5_dp-4._dp*Log(10._dp) &
  &-2._dp*Log(mf_u(3)/mZ)/3._dp) 
Else 
 k_fac=1._dp 
End if 
g3SM=Sqrt(4._dp*pi*alphas_mZ) 
g3SM=Sqrt(4._dp*pi*alphas_mZ/k_fac) 
 
vSM=2._dp*mW/g2SM 
YeSM=0._dp 
YdSM=0._dp 
YuSM=0._dp 
Do i1=1,3 
  YeSM(i1,i1)=sqrt2*mf_L_mZ(i1)/vSM 
  If (i1.Eq.3) Then! top and bottom are special: 
  ! TanBeta Aufsummierung fehlt bei Yd!! 
  YuSM(i1,i1)=sqrt2*mf_U(i1)/vSM& 
    &*(1._dp-oo3pi*alphas_mZ*(5._dp+3._dp*Log(mZ2/mf_u2(3)))) 
  YdSM(i1,i1)=sqrt2*mf_D_mZ(i1)/(vSM * (1._dp + 0.015*tanb)) 
Else 
  YuSM(i1,i1)=sqrt2*mf_U_mZ(i1)/vSM 
  YdSM(i1,i1)=sqrt2*mf_D_mZ(i1)/vSM 
End If  
End Do 
If (GenerationMixing) Then 
  If (YukawaScheme.Eq.1) Then 
    YuSM=Matmul(Transpose(CKM),YuSM) 
  Else 
    YdSM=Matmul(Conjg(CKM),YdSM) 
  End If 
End If 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.False.)

TwoLoopRGE_save=TwoLoopRGE 
UseFixedScale_save = UseFixedScale 
Scale_save=GetRenormalizationScale() 
UseFixedScale = .True. 
Call SetRGEScale(mZ2) 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.False.)

 
 ! 1. Run 
 

 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 vS = vSInput
vS1 = v1Input
vS2 = v2Input
vS3 = v3Input
kap = KappaInput
lam = LambdaInput
Yv = YvIN
else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 vS = vSIN 
 vS1 = vS1IN 
 vS2 = vS2IN 
 vS3 = vS3IN 
 gp = gpIN 
 lam = lamIN 
 Yv = YvIN 
 kap = kapIN 
 Td = TdIN 
 Te = TeIN 
 Tlam = TlamIN 
 Tv = TvIN 
 Tk = TkIN 
 Tu = TuIN 
 mq2 = mq2IN 
 ml2 = ml2IN 
 mHd2 = mHd2IN 
 mHu2 = mHu2IN 
 md2 = md2IN 
 mu2 = mu2IN 
 me2 = me2IN 
 ms2 = ms2IN 
 ms12 = ms12IN 
 ms22 = ms22IN 
 ms32 = ms32IN 
 mv2 = mv2IN 
 M1 = M1IN 
 M2 = M2IN 
 M3 = M3IN 
 M4 = M4IN 
 vd = (2*Sqrt(mz2/(g1**2 + g2**2)))/Sqrt(1 + TanBeta**2)
vu = (2*Sqrt(mz2/(g1**2 + g2**2))*TanBeta)/Sqrt(1 + TanBeta**2)
End if
 
 ! ----------------------- 
 
mHd2 = 0._dp 
mHu2 = 0._dp 
ms2 = 0._dp 
ms12 = 0._dp 
ms22 = 0._dp 
ms32 = 0._dp 

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 


Call ParametersToG278(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,gA)

If (.Not.UseFixedScale) Then 
  If (HighScaleModel.eq."LOW") Then 
     mudim=1000._dp**2 
   Else 
    mudim= Real(m0**2 + 4*m12**2, dp) 
    mudim=Max(mf_u2(3),mudim) 
  End if  
   Call SetRGEScale(mudim) 
   UseFixedScale= .False. 
Else 
  mudim=GetRenormalizationScale() 
End If 
If (HighScaleModel.eq."LOW") Call SetGUTscale(sqrt(mudim)) 
 TwoLoopRGE= .False. 
kont=0 
Call RunRGE(kont,0.001_dp,gA,gB,mGUT) 
If (kont.Ne.0) Then 
Iname=Iname-1 
    Write(*,*) " Problem with RGE running. Errorcode:", kont 
    Call TerminateProgram
End if 
Call GToParameters278(gB,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,               & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 



 
 ! --- Boundary conditions at EW-scale when running down --- 
! ----------------------- 
 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.False.)

 
 ! 2. Run 
 

 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 vS = vSInput
vS1 = v1Input
vS2 = v2Input
vS3 = v3Input
kap = KappaInput
lam = LambdaInput
Yv = YvIN
else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 vS = vSIN 
 vS1 = vS1IN 
 vS2 = vS2IN 
 vS3 = vS3IN 
 gp = gpIN 
 lam = lamIN 
 Yv = YvIN 
 kap = kapIN 
 Td = TdIN 
 Te = TeIN 
 Tlam = TlamIN 
 Tv = TvIN 
 Tk = TkIN 
 Tu = TuIN 
 mq2 = mq2IN 
 ml2 = ml2IN 
 mHd2 = mHd2IN 
 mHu2 = mHu2IN 
 md2 = md2IN 
 mu2 = mu2IN 
 me2 = me2IN 
 ms2 = ms2IN 
 ms12 = ms12IN 
 ms22 = ms22IN 
 ms32 = ms32IN 
 mv2 = mv2IN 
 M1 = M1IN 
 M2 = M2IN 
 M3 = M3IN 
 M4 = M4IN 
 vd = (2*Sqrt(mz2/(g1**2 + g2**2)))/Sqrt(1 + TanBeta**2)
vu = (2*Sqrt(mz2/(g1**2 + g2**2))*TanBeta)/Sqrt(1 + TanBeta**2)
End if
 
 ! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))


 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 


Call ParametersToG278(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,gA)

If (.Not.UseFixedScale) Then 
  If (HighScaleModel.eq."LOW") Then 
     mudim=1000._dp**2 
   Else 
    mudim= Real(m0**2 + 4*m12**2, dp) 
    mudim=Max(mf_u2(3),mudim) 
  End if  
   Call SetRGEScale(mudim) 
   UseFixedScale= .False. 
Else 
  mudim=GetRenormalizationScale() 
End If 
If (HighScaleModel.eq."LOW") Call SetGUTscale(sqrt(mudim)) 
 TwoLoopRGE= .False. 
kont=0 
Call RunRGE(kont,0.001_dp,gA,gB,mGUT) 
If (kont.Ne.0) Then 
Iname=Iname-1 
    Write(*,*) " Problem with RGE running. Errorcode:", kont 
    Call TerminateProgram
End if 
Call GToParameters278(gB,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,               & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 



 
 ! --- Boundary conditions at EW-scale when running down --- 
! ----------------------- 
 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.False.)

 
 ! 3. Run 
 

 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 

 
 ! --- Boundary conditions at SUSY-scale --- 
If (HighScaleModel.ne."LOW") Then 
 vS = vSInput
vS1 = v1Input
vS2 = v2Input
vS3 = v3Input
kap = KappaInput
lam = LambdaInput
Yv = YvIN
else If (HighScaleModel.Eq."LOW") Then 
 ! Setting values 
 vS = vSIN 
 vS1 = vS1IN 
 vS2 = vS2IN 
 vS3 = vS3IN 
 gp = gpIN 
 lam = lamIN 
 Yv = YvIN 
 kap = kapIN 
 Td = TdIN 
 Te = TeIN 
 Tlam = TlamIN 
 Tv = TvIN 
 Tk = TkIN 
 Tu = TuIN 
 mq2 = mq2IN 
 ml2 = ml2IN 
 mHd2 = mHd2IN 
 mHu2 = mHu2IN 
 md2 = md2IN 
 mu2 = mu2IN 
 me2 = me2IN 
 ms2 = ms2IN 
 ms12 = ms12IN 
 ms22 = ms22IN 
 ms32 = ms32IN 
 mv2 = mv2IN 
 M1 = M1IN 
 M2 = M2IN 
 M3 = M3IN 
 M4 = M4IN 
 vd = (2*Sqrt(mz2/(g1**2 + g2**2)))/Sqrt(1 + TanBeta**2)
vu = (2*Sqrt(mz2/(g1**2 + g2**2))*TanBeta)/Sqrt(1 + TanBeta**2)
End if
 
 ! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))


 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
gp = 1*gp 
! ----------------------- 
 


Call ParametersToG278(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,               & 
& Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,gA)

Call SetRGEScale(Scale_save) 
UseFixedScale = UseFixedScale_save 
If (.Not.UseFixedScale) Then 
  If (HighScaleModel.eq."LOW") Then 
     mudim=1000._dp**2 
   Else 
    mudim= Real(m0**2 + 4*m12**2, dp) 
    mudim=Max(mf_u2(3),mudim) 
  End if  
   Call SetRGEScale(mudim) 
   UseFixedScale= .False. 
Else 
  mudim=GetRenormalizationScale() 
End If 
If (HighScaleModel.eq."LOW") Call SetGUTscale(sqrt(mudim)) 
 TwoLoopRGE= .False. 
kont=0 
Call RunRGE(kont,0.001_dp,gA,gB,mGUT) 
If (kont.Ne.0) Then 
Iname=Iname-1 
    Write(*,*) " Problem with RGE running. Errorcode:", kont 
    Call TerminateProgram
End if 
Call GToParameters278(gB,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,               & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
gp = 1*gp 
! ----------------------- 
 



 
 ! --- Boundary conditions at EW-scale when running down --- 
! ----------------------- 
 
TwoLoopRGE = TwoLoopRGE_save 
vSM_save = vSM 

 
 ! --- Boundary conditions at EW-scale --- 
! ----------------------- 
 
Call SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,             & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3,(/ ZeroC, ZeroC, ZeroC, ZeroC, ZeroC, ZeroC /))

Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,GenerationMixing,kont)

tanb = tanbeta 
tanbetaMZ = tanbeta 
MVWm = mW 
MVWm2 = mW2 
MVZ = mZ 
MVZ2 = mZ2 
MFe(1:3) = mf_l 
MFe2(1:3) = mf_l**2 
MFu(1:3) = mf_u 
MFu2(1:3) = mf_u**2 
MFd(1:3) = mf_d 
MFd2(1:3) = mf_d**2 
Iname=Iname-1 
End subroutine FirstGuess 
End Module Boundaries_sec_UMSSM 
