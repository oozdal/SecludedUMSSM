Module EffectivePotential_sec_UMSSM 
 
Use Control 
Use Settings 
Use Couplings_sec_UMSSM 
Use LoopFunctions 
Use Mathematics 
Use MathematicsQP 
Use Model_Data_sec_UMSSM 
Use StandardModel 
Use TreeLevelMasses_sec_UMSSM 
Use EffPotFunctions
Use DerivativesEffPotFunctions
 
Contains 
 
Subroutine CalculateCorrectionsEffPot(ti_ep2L,pi_ep2L,vd,vu,vS,vS1,vS2,               & 
& vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,             & 
& md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,kont)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp),Intent(in) :: vd,vu,vS,vS1,vS2,vS3

Integer , Intent(inout):: kont 
Integer :: iout 
Real(dp) :: err,h_start,vevs(6) 
Real(dp), Intent(out) :: ti_ep2L(6)  
Real(dp), Intent(out) :: pi_ep2L(6,6)


err2L = 0._dp 
If (.not.PurelyNumericalEffPot) Then 
epsM = 1.0E-8_dp 
epsD = 1.0E-8_dp 
! 2nd deriv. also calculates the 1st deriv. of V
Call SecondDerivativeEffPot2Loop(vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,gp,Yd,Ye,              & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,kont,pi_ep2L,ti_ep2L)

Else 
epsM = 1.0E-6_dp 
epsD = 1.0E-6_dp 
vevs = (/vd,vu,vS,vS1,vS2,vS3/) 
! Calculate 1st (ti_ep) and 2nd derivatives (pi_ep)
ti_ep2L(1) = partialDiff_Ridders(EffPotFunction2Loop,vevs,1,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
ti_ep2L(2) = partialDiff_Ridders(EffPotFunction2Loop,vevs,2,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
ti_ep2L(3) = partialDiff_Ridders(EffPotFunction2Loop,vevs,3,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
ti_ep2L(4) = partialDiff_Ridders(EffPotFunction2Loop,vevs,4,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
ti_ep2L(5) = partialDiff_Ridders(EffPotFunction2Loop,vevs,5,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
ti_ep2L(6) = partialDiff_Ridders(EffPotFunction2Loop,vevs,6,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(1,1) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,1,1,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(2,1) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,2,1,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(2,2) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,2,2,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(3,1) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,3,1,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(3,2) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,3,2,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(3,3) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,3,3,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(4,1) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,4,1,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(4,2) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,4,2,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(4,3) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,4,3,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(4,4) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,4,4,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(5,1) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,5,1,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(5,2) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,5,2,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(5,3) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,5,3,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(5,4) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,5,4,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(5,5) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,5,5,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(6,1) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,6,1,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(6,2) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,6,2,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(6,3) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,6,3,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(6,4) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,6,4,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(6,5) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,6,5,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(6,6) = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,6,6,6,err,h_start,iout) 
If (err.gt.err2L) err2L = err 
pi_ep2L(1,2)=pi_ep2L(2,1)
pi_ep2L(1,3)=pi_ep2L(3,1)
pi_ep2L(2,3)=pi_ep2L(3,2)
pi_ep2L(1,4)=pi_ep2L(4,1)
pi_ep2L(2,4)=pi_ep2L(4,2)
pi_ep2L(3,4)=pi_ep2L(4,3)
pi_ep2L(1,5)=pi_ep2L(5,1)
pi_ep2L(2,5)=pi_ep2L(5,2)
pi_ep2L(3,5)=pi_ep2L(5,3)
pi_ep2L(4,5)=pi_ep2L(5,4)
pi_ep2L(1,6)=pi_ep2L(6,1)
pi_ep2L(2,6)=pi_ep2L(6,2)
pi_ep2L(3,6)=pi_ep2L(6,3)
pi_ep2L(4,6)=pi_ep2L(6,4)
pi_ep2L(5,6)=pi_ep2L(6,5)
End If 
Contains 

Real(dp) Function EffPotFunction(vevs) 
  ! a wrapping function to be passed to numerical differentiation 
  Implicit None 
  Real(dp), Intent(in) :: vevs(6) 
  Real(dp) :: effPot 
Call CalculateEffPot(vevs(1),vevs(2),vevs(3),vevs(4),vevs(5),vevs(6),g1,              & 
& g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,            & 
& me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,kont,effPot)

  EffPotFunction = effPot 
  End Function 

Real(dp) Function EffPotFunction2Loop(vevs) 
  ! a wrapping function to be passed to numerical differentiation 
  Implicit None 
  Real(dp), Intent(in) :: vevs(6) 
  Real(dp) :: effPot2L 
Call CalculateEffPot2Loop(vevs(1),vevs(2),vevs(3),vevs(4),vevs(5),vevs(6)             & 
& ,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,            & 
& mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,kont,effPot2L)

  EffPotFunction2Loop = effPot2L 
  End Function 

End subroutine CalculateCorrectionsEffPot 


Subroutine CalculateEffPot(vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,             & 
& kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,           & 
& mv2,M1,M2,M3,M4,kont,effPot)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp),Intent(in) :: vd,vu,vS,vS1,vS2,vS3

Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Integer, Intent(inout):: kont
Integer :: i 
Real(dp) :: effpot,Qscale,result,temp


Call TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,MSv,MSv2,           & 
& MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,             & 
& ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,              & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

Qscale= getRenormalizationScale()
result=0._dp
temp=0._dp
! sum over real scalars (color *[2 if complex]) 
Do i=1,6
temp=temp+(3*2) * h_SMartin(MSd2(i),Qscale) ! Sd
End Do
Do i=1,6
temp=temp+(2)    * h_SMartin(MSv2(i),Qscale) ! Sv
End Do
Do i=1,6
temp=temp+(3*2) * h_SMartin(MSu2(i),Qscale) ! Su
End Do
Do i=1,6
temp=temp+(2)    * h_SMartin(MSe2(i),Qscale) ! Se
End Do
Do i=1,6
temp=temp+          h_SMartin(Mhh2(i),Qscale) ! hh
End Do
Do i=3,6
temp=temp+          h_SMartin(MAh2(i),Qscale) ! Ah
End Do
Do i=2,2
temp=temp+(2)    * h_SMartin(MHpm2(i),Qscale) ! Hpm
End Do
result=(+1)*temp !scalars

temp=0._dp
! sum over two-component fermions (*color [*2 if Dirac Fermion]) 
Do i=1,2
temp=temp+          h_SMartin(MCha2(i),Qscale)*2 ! Cha
End Do
Do i=1,9
temp=temp+          h_SMartin(MChi2(i),Qscale)*1 ! Chi
End Do
Do i=1,3
temp=temp+(3)   * h_SMartin(MFd2(i),Qscale)*2 ! Fd
End Do
Do i=1,3
temp=temp+          h_SMartin(MFe2(i),Qscale)*2 ! Fe
End Do
Do i=1,3
temp=temp+(3)   * h_SMartin(MFu2(i),Qscale)*2 ! Fu
End Do
Do i=1,3
temp=temp+          h_SMartin(MFv2(i),Qscale)*2 ! Fv
End Do
temp=temp+(8)   * h_SMartin(MGlu2,Qscale)*1 ! Glu
result=result+(-2)*temp ! fermions

temp=0._dp
! sum over real vectors (color *[2 if complex]) 
temp=temp+(8)   * h_SMartin(0._dp,Qscale) ! VG
temp=temp+          h_SMartin(0._dp,Qscale) ! VP
temp=temp+          h_SMartin(MVZ2,Qscale) ! VZ
temp=temp+          h_SMartin(MVZp2,Qscale) ! VZp
temp=temp+(2)    * h_SMartin(MVWm2,Qscale) ! VWm
result=result+(+3)*temp ! vectors

effPot = result * oo16pi2

End Subroutine CalculateEffPot 



 
 
Subroutine CalculateEffPot2Loop(vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,gp,Yd,Ye,               & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,kont,effPot2L)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp),Intent(in) :: vd,vu,vS,vS1,vS2,vS3

Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Integer, Intent(inout):: kont
Real(dp), Intent(out) :: effpot2L
Integer :: i,i1,i2,i3,includeGhosts,NrContr 
Integer :: NrContr1,NrContr2 !nr of contributing diagrams
Real(dp) :: Qscale,result,colorfactor,coeff,coeffbar
Complex(dp) :: temp,coupx,coupxbar,coup1,coup2,coup1L,coup1R,coup2L,coup2R
Complex(dp) :: dcoupx,dcoupxbar,dcoup1,dcoup2,dcoup1L,dcoup1R,dcoup2L,dcoup2R
Complex(dp) :: cplAhAhAh(6,6,6),cplAhAhhh(6,6,6),cplAhhhhh(6,6,6),cplAhHpmcHpm(6,2,2),               & 
& cplAhSdcSd(6,6,6),cplAhSecSe(6,6,6),cplAhSucSu(6,6,6),cplAhSvcSv(6,6,6),               & 
& cplhhhhhh(6,6,6),cplhhHpmcHpm(6,2,2),cplhhSdcSd(6,6,6),cplhhSecSe(6,6,6),              & 
& cplhhSucSu(6,6,6),cplhhSvcSv(6,6,6),cplHpmSucSd(2,6,6),cplHpmSvcSe(2,6,6),             & 
& cplSdcHpmcSu(6,2,6),cplSecHpmcSv(6,2,6),cplSdcSdVG(6,6),cplSucSuVG(6,6),               & 
& cplVGVGVG,cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplChiChiAhL(9,9,6),               & 
& cplChiChiAhR(9,9,6),cplcFdFdAhL(3,3,6),cplcFdFdAhR(3,3,6),cplcFeFeAhL(3,3,6),          & 
& cplcFeFeAhR(3,3,6),cplcFuFuAhL(3,3,6),cplcFuFuAhR(3,3,6),cplcFvFvAhL(3,3,6),           & 
& cplcFvFvAhR(3,3,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChaFucSdL(2,3,6),    & 
& cplChaFucSdR(2,3,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChahhL(2,2,6),      & 
& cplcChaChahhR(2,2,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvL(3,2,6),      & 
& cplcFeChaSvR(3,2,6),cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),cplChiFdcSdL(9,3,6),       & 
& cplChiFdcSdR(9,3,6),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFucSuL(9,3,6),       & 
& cplChiFucSuR(9,3,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),cplcChaChiHpmL(2,9,2),     & 
& cplcChaChiHpmR(2,9,2),cplcFdChiSdL(3,9,6),cplcFdChiSdR(3,9,6),cplcFeChiSeL(3,9,6),     & 
& cplcFeChiSeR(3,9,6),cplcFuChiSuL(3,9,6),cplcFuChiSuR(3,9,6),cplcFvChiSvL(3,9,6),       & 
& cplcFvChiSvR(3,9,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,6),            & 
& cplcFdFdhhR(3,3,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),     & 
& cplcFuFdcHpmR(3,3,2),cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),cplcChaFecSvL(2,3,6),       & 
& cplcChaFecSvR(2,3,6),cplcFvFecHpmL(3,3,2),cplcFvFecHpmR(3,3,2),cplGluFucSuL(3,6),      & 
& cplGluFucSuR(3,6),cplcFuFuhhL(3,3,6),cplcFuFuhhR(3,3,6),cplcFdFuHpmL(3,3,2),           & 
& cplcFdFuHpmR(3,3,2),cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),cplcFeFvHpmL(3,3,2),         & 
& cplcFeFvHpmR(3,3,2),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),             & 
& cplcFuGluSuR(3,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChacFvSeL(2,3,6),      & 
& cplcChacFvSeR(2,3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),               & 
& cplcFuFuVGR(3,3),cplGluGluVGL,cplGluGluVGR

Complex(dp) :: cplAhAhAhAh(6,6,6,6),cplAhAhhhhh(6,6,6,6),cplAhAhHpmcHpm(6,6,2,2),cplAhAhSdcSd(6,6,6,6),& 
& cplAhAhSecSe(6,6,6,6),cplAhAhSucSu(6,6,6,6),cplAhAhSvcSv(6,6,6,6),cplhhhhhhhh(6,6,6,6),& 
& cplhhhhHpmcHpm(6,6,2,2),cplhhhhSdcSd(6,6,6,6),cplhhhhSecSe(6,6,6,6),cplhhhhSucSu(6,6,6,6),& 
& cplhhhhSvcSv(6,6,6,6),cplHpmHpmcHpmcHpm(2,2,2,2),cplHpmSdcHpmcSd(2,6,2,6),             & 
& cplHpmSecHpmcSe(2,6,2,6),cplHpmSucHpmcSu(2,6,2,6),cplHpmSvcHpmcSv(2,6,2,6),            & 
& cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),cplSdSucSdcSu(6,6,6,6),cplSeSecSecSe(6,6,6,6),& 
& cplSeSvcSecSv(6,6,6,6),cplSuSucSucSu(6,6,6,6),cplSuSvcSucSv(6,6,6,6),cplSvSvcSvcSv(6,6,6,6),& 
& cplSdcSdVGVG(6,6),cplSucSuVGVG(6,6)

Real(dp) :: results1(47),results2(28)


Call TreeMassesEffPot(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,            & 
& g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,             & 
& mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

Call CouplingsForEffPot3(lam,Tlam,kap,Tk,ZA,vd,vu,vS,vS1,vS2,vS3,ZH,ZP,               & 
& Yd,Td,ZD,Ye,Te,ZE,Yu,Tu,ZU,Yv,Tv,ZV,g3,UM,UP,ZN,ZDL,ZDR,ZEL,ZER,ZUL,ZUR,               & 
& ZVL,ZVR,pG,cplAhAhAh,cplAhAhhh,cplAhhhhh,cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,           & 
& cplAhSucSu,cplAhSvcSv,cplhhhhhh,cplhhHpmcHpm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,         & 
& cplhhSvcSv,cplHpmSucSd,cplHpmSvcSe,cplSdcHpmcSu,cplSecHpmcSv,cplSdcSdVG,               & 
& cplSucSuVG,cplVGVGVG,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFvFvAhL,cplcFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,cplChaFucSdL,cplChaFucSdR,       & 
& cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,       & 
& cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,         & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,       & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFdGluSdL,cplcFdGluSdR,           & 
& cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,     & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplGluGluVGL,cplGluGluVGR)

Call CouplingsForEffPot4(lam,kap,ZA,ZH,ZP,Yd,ZD,Ye,ZE,Yu,ZU,Yv,ZV,g3,cplAhAhAhAh,     & 
& cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvcSv,        & 
& cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvcSv,        & 
& cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvcHpmcSv,     & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSeSecSecSe,cplSeSvcSecSv,cplSuSucSucSu,   & 
& cplSuSvcSucSv,cplSvSvcSvcSv,cplSdcSdVGVG,cplSucSuVGVG)


Qscale = getRenormalizationScale()
result=0._dp
results1=0._dp
results2=0._dp
temp=0._dp
! ----- Topology1 (sunrise): diagrams w. 3 Particles and 2 Vertices

! ----- diagrams of type SSS, 16 ------ 
! ---- Ah,Ah,Ah ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhAhAh(i1,i2,i3)
coup2 = cplAhAhAh(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*1._dp/12._dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MAh2(i2),MAh2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Ah, Ah]' 
    End Do
  End Do
End Do
results1(1)=temp
! ---- Ah,Ah,hh ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhAhhh(i1,i2,i3)
coup2 = cplAhAhhh(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*0.25_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MAh2(i2),Mhh2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Ah, hh]' 
    End Do
  End Do
End Do
results1(2)=temp
! ---- Ah,hh,hh ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhhhhh(i1,i2,i3)
coup2 = cplAhhhhh(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*0.25_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),Mhh2(i2),Mhh2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, hh, hh]' 
    End Do
  End Do
End Do
results1(3)=temp
! ---- Ah,Hpm,conj[Hpm] ----
temp=0._dp
Do i1=1,6
 Do i2=1,2
    Do i3=1,2
coup1 = cplAhHpmcHpm(i1,i2,i3)
coup2 = cplAhHpmcHpm(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MHpm2(i2),MHpm2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Hpm, conj[Hpm]]' 
    End Do
  End Do
End Do
results1(4)=temp
! ---- Ah,Sd,conj[Sd] ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSdcSd(i1,i2,i3)
coup2 = cplAhSdcSd(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MSd2(i2),MSd2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Sd, conj[Sd]]' 
    End Do
  End Do
End Do
results1(5)=temp
! ---- Ah,Se,conj[Se] ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSecSe(i1,i2,i3)
coup2 = cplAhSecSe(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MSe2(i2),MSe2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Se, conj[Se]]' 
    End Do
  End Do
End Do
results1(6)=temp
! ---- Ah,Su,conj[Su] ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSucSu(i1,i2,i3)
coup2 = cplAhSucSu(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MSu2(i2),MSu2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Su, conj[Su]]' 
    End Do
  End Do
End Do
results1(7)=temp
! ---- Ah,Sv,conj[Sv] ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSvcSv(i1,i2,i3)
coup2 = cplAhSvcSv(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(MAh2(i1),MSv2(i2),MSv2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Sv, conj[Sv]]' 
    End Do
  End Do
End Do
results1(8)=temp
! ---- hh,hh,hh ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhhhhh(i1,i2,i3)
coup2 = cplhhhhhh(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*1._dp/12._dp*abs(coup1)**2*Fep_SSS(Mhh2(i1),Mhh2(i2),Mhh2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, hh, hh]' 
    End Do
  End Do
End Do
results1(9)=temp
! ---- hh,Hpm,conj[Hpm] ----
temp=0._dp
Do i1=1,6
 Do i2=1,2
    Do i3=1,2
coup1 = cplhhHpmcHpm(i1,i2,i3)
coup2 = cplhhHpmcHpm(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(Mhh2(i1),MHpm2(i2),MHpm2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Hpm, conj[Hpm]]' 
    End Do
  End Do
End Do
results1(10)=temp
! ---- hh,Sd,conj[Sd] ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSdcSd(i1,i2,i3)
coup2 = cplhhSdcSd(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(Mhh2(i1),MSd2(i2),MSd2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Sd, conj[Sd]]' 
    End Do
  End Do
End Do
results1(11)=temp
! ---- hh,Se,conj[Se] ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSecSe(i1,i2,i3)
coup2 = cplhhSecSe(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(Mhh2(i1),MSe2(i2),MSe2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Se, conj[Se]]' 
    End Do
  End Do
End Do
results1(12)=temp
! ---- hh,Su,conj[Su] ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSucSu(i1,i2,i3)
coup2 = cplhhSucSu(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(Mhh2(i1),MSu2(i2),MSu2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Su, conj[Su]]' 
    End Do
  End Do
End Do
results1(13)=temp
! ---- hh,Sv,conj[Sv] ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSvcSv(i1,i2,i3)
coup2 = cplhhSvcSv(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSS(Mhh2(i1),MSv2(i2),MSv2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Sv, conj[Sv]]' 
    End Do
  End Do
End Do
results1(14)=temp
! ---- Sd,conj[Hpm],conj[Su] ----
temp=0._dp
Do i1=1,6
 Do i2=1,2
    Do i3=1,6
coup1 = cplSdcHpmcSu(i1,i2,i3)
coup2 = cplHpmSucSd(i2,i3,i1)
colorfactor=3
temp=temp+colorfactor*1._dp*abs(coup1)**2*Fep_SSS(MSd2(i1),MHpm2(i2),MSu2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Sd, conj[Hpm], conj[Su]]' 
    End Do
  End Do
End Do
results1(15)=temp
! ---- Se,conj[Hpm],conj[Sv] ----
temp=0._dp
Do i1=1,6
 Do i2=1,2
    Do i3=1,6
coup1 = cplSecHpmcSv(i1,i2,i3)
coup2 = cplHpmSvcSe(i2,i3,i1)
colorfactor=1
temp=temp+colorfactor*1._dp*abs(coup1)**2*Fep_SSS(MSe2(i1),MHpm2(i2),MSv2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Se, conj[Hpm], conj[Sv]]' 
    End Do
  End Do
End Do
results1(16)=temp
! ----- diagrams of type FFS, 25 ------ 
! ---- Ah,Cha,bar[Cha] ----
temp=0._dp
Do i1=1,6
 Do i2=1,2
    Do i3=1,2
coup1L = cplcChaChaAhL(i3,i2,i1)
coup1R = cplcChaChaAhR(i3,i2,i1)
coup2L = cplcChaChaAhL(i2,i3,i1)
coup2R = cplcChaChaAhR(i2,i3,i1)
colorfactor=1
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MCha2(i3),MCha2(i2),MAh2(i1),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Cha, bar[Cha]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MCha(i2)*MCha(i3)*Fep_FFSbar(MCha2(i3),MCha2(i2),MAh2(i1),Qscale)
    End Do
  End Do
End Do
results1(17)=temp
! ---- Ah,Chi,Chi ----
temp=0._dp
Do i1=1,6
 Do i2=1,9
    Do i3=1,9
coup1L = cplChiChiAhL(i2,i3,i1)
coup1R = cplChiChiAhR(i2,i3,i1)
coup2L = cplChiChiAhL(i2,i3,i1)
coup2R = cplChiChiAhR(i2,i3,i1)
colorfactor=1
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2)*Fep_FFS(MChi2(i3),MChi2(i2),MAh2(i1),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Chi, Chi]' 
temp=temp+colorfactor*0.5_dp*Real(coup1L**2,dp)*MChi(i2)*MChi(i3)*Fep_FFSbar(MChi2(i3),MChi2(i2),MAh2(i1),Qscale)
    End Do
  End Do
End Do
results1(18)=temp
! ---- Ah,Fd,bar[Fd] ----
temp=0._dp
Do i1=1,6
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFdFdAhL(i3,i2,i1)
coup1R = cplcFdFdAhR(i3,i2,i1)
coup2L = cplcFdFdAhL(i2,i3,i1)
coup2R = cplcFdFdAhR(i2,i3,i1)
colorfactor=3
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFd2(i3),MFd2(i2),MAh2(i1),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fd, bar[Fd]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MFd(i2)*MFd(i3)*Fep_FFSbar(MFd2(i3),MFd2(i2),MAh2(i1),Qscale)
    End Do
  End Do
End Do
results1(19)=temp
! ---- Ah,Fe,bar[Fe] ----
temp=0._dp
Do i1=1,6
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFeFeAhL(i3,i2,i1)
coup1R = cplcFeFeAhR(i3,i2,i1)
coup2L = cplcFeFeAhL(i2,i3,i1)
coup2R = cplcFeFeAhR(i2,i3,i1)
colorfactor=1
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFe2(i3),MFe2(i2),MAh2(i1),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fe, bar[Fe]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MFe(i2)*MFe(i3)*Fep_FFSbar(MFe2(i3),MFe2(i2),MAh2(i1),Qscale)
    End Do
  End Do
End Do
results1(20)=temp
! ---- Ah,Fu,bar[Fu] ----
temp=0._dp
Do i1=1,6
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFuFuAhL(i3,i2,i1)
coup1R = cplcFuFuAhR(i3,i2,i1)
coup2L = cplcFuFuAhL(i2,i3,i1)
coup2R = cplcFuFuAhR(i2,i3,i1)
colorfactor=3
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFu2(i3),MFu2(i2),MAh2(i1),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fu, bar[Fu]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MFu(i2)*MFu(i3)*Fep_FFSbar(MFu2(i3),MFu2(i2),MAh2(i1),Qscale)
    End Do
  End Do
End Do
results1(21)=temp
! ---- Ah,Fv,bar[Fv] ----
temp=0._dp
Do i1=1,6
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFvFvAhL(i3,i2,i1)
coup1R = cplcFvFvAhR(i3,i2,i1)
coup2L = cplcFvFvAhL(i2,i3,i1)
coup2R = cplcFvFvAhR(i2,i3,i1)
colorfactor=1
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFv2(i3),MFv2(i2),MAh2(i1),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fv, bar[Fv]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MFv(i2)*MFv(i3)*Fep_FFSbar(MFv2(i3),MFv2(i2),MAh2(i1),Qscale)
    End Do
  End Do
End Do
results1(22)=temp
! ---- Cha,hh,bar[Cha] ----
temp=0._dp
Do i1=1,2
 Do i2=1,6
    Do i3=1,2
coup1L = cplcChaChahhL(i3,i1,i2)
coup1R = cplcChaChahhR(i3,i1,i2)
coup2L = cplcChaChahhL(i1,i3,i2)
coup2R = cplcChaChahhR(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MCha2(i3),MCha2(i1),Mhh2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Cha, hh, bar[Cha]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MCha(i1)*MCha(i3)*Fep_FFSbar(MCha2(i3),MCha2(i1),Mhh2(i2),Qscale)
    End Do
  End Do
End Do
results1(23)=temp
! ---- Chi,Chi,hh ----
temp=0._dp
Do i1=1,9
 Do i2=1,9
    Do i3=1,6
coup1L = cplChiChihhL(i1,i2,i3)
coup1R = cplChiChihhR(i1,i2,i3)
coup2L = cplChiChihhL(i1,i2,i3)
coup2R = cplChiChihhR(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2)*Fep_FFS(MChi2(i2),MChi2(i1),Mhh2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Chi, hh]' 
temp=temp+colorfactor*0.5_dp*Real(coup1L**2,dp)*MChi(i1)*MChi(i2)*Fep_FFSbar(MChi2(i2),MChi2(i1),Mhh2(i3),Qscale)
    End Do
  End Do
End Do
results1(24)=temp
! ---- Chi,Hpm,bar[Cha] ----
temp=0._dp
Do i1=1,9
 Do i2=1,2
    Do i3=1,2
coup1L = cplcChaChiHpmL(i3,i1,i2)
coup1R = cplcChaChiHpmR(i3,i1,i2)
coup2L = cplChiChacHpmL(i1,i3,i2)
coup2R = cplChiChacHpmR(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MCha2(i3),MChi2(i1),MHpm2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Hpm, bar[Cha]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MChi(i1)*MCha(i3)*Fep_FFSbar(MCha2(i3),MChi2(i1),MHpm2(i2),Qscale)
    End Do
  End Do
End Do
results1(25)=temp
! ---- Chi,Sd,bar[Fd] ----
temp=0._dp
Do i1=1,9
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFdChiSdL(i3,i1,i2)
coup1R = cplcFdChiSdR(i3,i1,i2)
coup2L = cplChiFdcSdL(i1,i3,i2)
coup2R = cplChiFdcSdR(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFd2(i3),MChi2(i1),MSd2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Sd, bar[Fd]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MChi(i1)*MFd(i3)*Fep_FFSbar(MFd2(i3),MChi2(i1),MSd2(i2),Qscale)
    End Do
  End Do
End Do
results1(26)=temp
! ---- Chi,Se,bar[Fe] ----
temp=0._dp
Do i1=1,9
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFeChiSeL(i3,i1,i2)
coup1R = cplcFeChiSeR(i3,i1,i2)
coup2L = cplChiFecSeL(i1,i3,i2)
coup2R = cplChiFecSeR(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFe2(i3),MChi2(i1),MSe2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Se, bar[Fe]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MChi(i1)*MFe(i3)*Fep_FFSbar(MFe2(i3),MChi2(i1),MSe2(i2),Qscale)
    End Do
  End Do
End Do
results1(27)=temp
! ---- Chi,Su,bar[Fu] ----
temp=0._dp
Do i1=1,9
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFuChiSuL(i3,i1,i2)
coup1R = cplcFuChiSuR(i3,i1,i2)
coup2L = cplChiFucSuL(i1,i3,i2)
coup2R = cplChiFucSuR(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFu2(i3),MChi2(i1),MSu2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Su, bar[Fu]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MChi(i1)*MFu(i3)*Fep_FFSbar(MFu2(i3),MChi2(i1),MSu2(i2),Qscale)
    End Do
  End Do
End Do
results1(28)=temp
! ---- Chi,Sv,bar[Fv] ----
temp=0._dp
Do i1=1,9
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFvChiSvL(i3,i1,i2)
coup1R = cplcFvChiSvR(i3,i1,i2)
coup2L = cplChiFvcSvL(i1,i3,i2)
coup2R = cplChiFvcSvR(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFv2(i3),MChi2(i1),MSv2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Sv, bar[Fv]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MChi(i1)*MFv(i3)*Fep_FFSbar(MFv2(i3),MChi2(i1),MSv2(i2),Qscale)
    End Do
  End Do
End Do
results1(29)=temp
! ---- Fd,hh,bar[Fd] ----
temp=0._dp
Do i1=1,3
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFdFdhhL(i3,i1,i2)
coup1R = cplcFdFdhhR(i3,i1,i2)
coup2L = cplcFdFdhhL(i1,i3,i2)
coup2R = cplcFdFdhhR(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFd2(i3),MFd2(i1),Mhh2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fd, hh, bar[Fd]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MFd(i1)*MFd(i3)*Fep_FFSbar(MFd2(i3),MFd2(i1),Mhh2(i2),Qscale)
    End Do
  End Do
End Do
results1(30)=temp
! ---- Fd,bar[Cha],conj[Su] ----
temp=0._dp
Do i1=1,3
 Do i2=1,2
    Do i3=1,6
coup1L = cplcChaFdcSuL(i2,i1,i3)
coup1R = cplcChaFdcSuR(i2,i1,i3)
coup2L = cplcFdChaSuL(i1,i2,i3)
coup2R = cplcFdChaSuR(i1,i2,i3)
colorfactor=3
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MCha2(i2),MFd2(i1),MSu2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fd, bar[Cha], conj[Su]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MFd(i1)*MCha(i2)*Fep_FFSbar(MCha2(i2),MFd2(i1),MSu2(i3),Qscale)
    End Do
  End Do
End Do
results1(31)=temp
! ---- Fe,hh,bar[Fe] ----
temp=0._dp
Do i1=1,3
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFeFehhL(i3,i1,i2)
coup1R = cplcFeFehhR(i3,i1,i2)
coup2L = cplcFeFehhL(i1,i3,i2)
coup2R = cplcFeFehhR(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFe2(i3),MFe2(i1),Mhh2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fe, hh, bar[Fe]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MFe(i1)*MFe(i3)*Fep_FFSbar(MFe2(i3),MFe2(i1),Mhh2(i2),Qscale)
    End Do
  End Do
End Do
results1(32)=temp
! ---- Fe,bar[Cha],conj[Sv] ----
temp=0._dp
Do i1=1,3
 Do i2=1,2
    Do i3=1,6
coup1L = cplcChaFecSvL(i2,i1,i3)
coup1R = cplcChaFecSvR(i2,i1,i3)
coup2L = cplcFeChaSvL(i1,i2,i3)
coup2R = cplcFeChaSvR(i1,i2,i3)
colorfactor=1
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MCha2(i2),MFe2(i1),MSv2(i3),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fe, bar[Cha], conj[Sv]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MFe(i1)*MCha(i2)*Fep_FFSbar(MCha2(i2),MFe2(i1),MSv2(i3),Qscale)
    End Do
  End Do
End Do
results1(33)=temp
! ---- Fu,hh,bar[Fu] ----
temp=0._dp
Do i1=1,3
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFuFuhhL(i3,i1,i2)
coup1R = cplcFuFuhhR(i3,i1,i2)
coup2L = cplcFuFuhhL(i1,i3,i2)
coup2R = cplcFuFuhhR(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFu2(i3),MFu2(i1),Mhh2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fu, hh, bar[Fu]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MFu(i1)*MFu(i3)*Fep_FFSbar(MFu2(i3),MFu2(i1),Mhh2(i2),Qscale)
    End Do
  End Do
End Do
results1(34)=temp
! ---- Fu,Hpm,bar[Fd] ----
temp=0._dp
Do i1=1,3
 Do i2=1,2
    Do i3=1,3
coup1L = cplcFdFuHpmL(i3,i1,i2)
coup1R = cplcFdFuHpmR(i3,i1,i2)
coup2L = cplcFuFdcHpmL(i1,i3,i2)
coup2R = cplcFuFdcHpmR(i1,i3,i2)
colorfactor=3
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFd2(i3),MFu2(i1),MHpm2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fu, Hpm, bar[Fd]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MFu(i1)*MFd(i3)*Fep_FFSbar(MFd2(i3),MFu2(i1),MHpm2(i2),Qscale)
    End Do
  End Do
End Do
results1(35)=temp
! ---- Fv,hh,bar[Fv] ----
temp=0._dp
Do i1=1,3
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFvFvhhL(i3,i1,i2)
coup1R = cplcFvFvhhR(i3,i1,i2)
coup2L = cplcFvFvhhL(i1,i3,i2)
coup2R = cplcFvFvhhR(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFv2(i3),MFv2(i1),Mhh2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fv, hh, bar[Fv]]' 
temp=temp+colorfactor*0.5_dp*2*Real(coup1L*conjg(coup1R),dp)*MFv(i1)*MFv(i3)*Fep_FFSbar(MFv2(i3),MFv2(i1),Mhh2(i2),Qscale)
    End Do
  End Do
End Do
results1(36)=temp
! ---- Fv,Hpm,bar[Fe] ----
temp=0._dp
Do i1=1,3
 Do i2=1,2
    Do i3=1,3
coup1L = cplcFeFvHpmL(i3,i1,i2)
coup1R = cplcFeFvHpmR(i3,i1,i2)
coup2L = cplcFvFecHpmL(i1,i3,i2)
coup2R = cplcFvFecHpmR(i1,i3,i2)
colorfactor=1
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFe2(i3),MFv2(i1),MHpm2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fv, Hpm, bar[Fe]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MFv(i1)*MFe(i3)*Fep_FFSbar(MFe2(i3),MFv2(i1),MHpm2(i2),Qscale)
    End Do
  End Do
End Do
results1(37)=temp
! ---- Glu,Sd,bar[Fd] ----
temp=0._dp
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFdGluSdL(i3,i2)
coup1R = cplcFdGluSdR(i3,i2)
coup2L = cplGluFdcSdL(i3,i2)
coup2R = cplGluFdcSdR(i3,i2)
colorfactor=4
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFd2(i3),MGlu2,MSd2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Glu, Sd, bar[Fd]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MGlu*MFd(i3)*Fep_FFSbar(MFd2(i3),MGlu2,MSd2(i2),Qscale)
    End Do
  End Do
results1(38)=temp
! ---- Glu,Su,bar[Fu] ----
temp=0._dp
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFuGluSuL(i3,i2)
coup1R = cplcFuGluSuR(i3,i2)
coup2L = cplGluFucSuL(i3,i2)
coup2R = cplGluFucSuR(i3,i2)
colorfactor=4
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFu2(i3),MGlu2,MSu2(i2),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Glu, Su, bar[Fu]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MGlu*MFu(i3)*Fep_FFSbar(MFu2(i3),MGlu2,MSu2(i2),Qscale)
    End Do
  End Do
results1(39)=temp
! ---- Sd,bar[Cha],bar[Fu] ----
temp=0._dp
Do i1=1,6
 Do i2=1,2
    Do i3=1,3
coup1L = cplcChacFuSdL(i2,i3,i1)
coup1R = cplcChacFuSdR(i2,i3,i1)
coup2L = cplChaFucSdL(i2,i3,i1)
coup2R = cplChaFucSdR(i2,i3,i1)
colorfactor=3
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFu2(i3),MCha2(i2),MSd2(i1),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Sd, bar[Cha], bar[Fu]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MCha(i2)*MFu(i3)*Fep_FFSbar(MFu2(i3),MCha2(i2),MSd2(i1),Qscale)
    End Do
  End Do
End Do
results1(40)=temp
! ---- Se,bar[Cha],bar[Fv] ----
temp=0._dp
Do i1=1,6
 Do i2=1,2
    Do i3=1,3
coup1L = cplcChacFvSeL(i2,i3,i1)
coup1R = cplcChacFvSeR(i2,i3,i1)
coup2L = cplChaFvcSeL(i2,i3,i1)
coup2R = cplChaFvcSeR(i2,i3,i1)
colorfactor=1
temp=temp+colorfactor*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFS(MFv2(i3),MCha2(i2),MSe2(i1),Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Se, bar[Cha], bar[Fv]]' 
temp=temp+colorfactor*2*Real(coup1L*conjg(coup1R),dp)*MCha(i2)*MFv(i3)*Fep_FFSbar(MFv2(i3),MCha2(i2),MSe2(i1),Qscale)
    End Do
  End Do
End Do
results1(41)=temp
! ----- diagrams of type SSV, 2 ------ 
! ---- Sd,VG,conj[Sd] ----
temp=0._dp
Do i1=1,6
    Do i3=1,6
coup1 = cplSdcSdVG(i1,i3)
coup2 = cplSdcSdVG(i3,i1)
colorfactor=4
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSV(MSd2(i3),MSd2(i1),0._dp,Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSV C[Sd, VG, conj[Sd]]' 
    End Do
End Do
results1(42)=temp
! ---- Su,VG,conj[Su] ----
temp=0._dp
Do i1=1,6
    Do i3=1,6
coup1 = cplSucSuVG(i1,i3)
coup2 = cplSucSuVG(i3,i1)
colorfactor=4
temp=temp+colorfactor*0.5_dp*abs(coup1)**2*Fep_SSV(MSu2(i3),MSu2(i1),0._dp,Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSV C[Su, VG, conj[Su]]' 
    End Do
End Do
results1(43)=temp
! ----- diagrams of type FFV, 3 ------ 
! ---- Fd,VG,bar[Fd] ----
temp=0._dp
Do i1=1,3
    Do i3=1,3
coup1L = cplcFdFdVGL(i3,i1)
coup1R = cplcFdFdVGR(i3,i1)
coup2L = cplcFdFdVGL(i1,i3)
coup2R = cplcFdFdVGR(i1,i3)
colorfactor=4
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFV(MFd2(i3),MFd2(i1),0._dp,Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFV C[Fd, VG, bar[Fd]]' 
temp=temp+colorfactor*0.5_dp*2*Real(-coup1L*conjg(coup1R),dp)*MFd(i1)*MFd(i3)*Fep_FFVbar(MFd2(i3),MFd2(i1),0._dp,Qscale)
    End Do
End Do
results1(44)=temp
! ---- Fu,VG,bar[Fu] ----
temp=0._dp
Do i1=1,3
    Do i3=1,3
coup1L = cplcFuFuVGL(i3,i1)
coup1R = cplcFuFuVGR(i3,i1)
coup2L = cplcFuFuVGL(i1,i3)
coup2R = cplcFuFuVGR(i1,i3)
colorfactor=4
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2+abs(coup1R)**2)*Fep_FFV(MFu2(i3),MFu2(i1),0._dp,Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFV C[Fu, VG, bar[Fu]]' 
temp=temp+colorfactor*0.5_dp*2*Real(-coup1L*conjg(coup1R),dp)*MFu(i1)*MFu(i3)*Fep_FFVbar(MFu2(i3),MFu2(i1),0._dp,Qscale)
    End Do
End Do
results1(45)=temp
! ---- Glu,Glu,VG ----
temp=0._dp
coup1L = cplGluGluVGL
coup1R = cplGluGluVGR
coup2L = cplGluGluVGL
coup2R = cplGluGluVGR
colorfactor=24
temp=temp+colorfactor*0.5_dp*(abs(coup1L)**2)*Fep_FFV(MGlu2,MGlu2,0._dp,Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFV C[Glu, Glu, VG]' 
temp=temp+colorfactor*0.5_dp*Real(coup1L**2,dp)*MGlu*MGlu*Fep_FFVbar(MGlu2,MGlu2,0._dp,Qscale)
results1(46)=temp
! ----- diagrams of type VVV, 1 ------ 
! ---- VG,VG,VG ----
temp=0._dp
coup1 = cplVGVGVG
coup2 = cplVGVGVG
colorfactor=24
temp=temp+colorfactor*1._dp/12._dp*(coup1)**2*Fep_gauge(0._dp,0._dp,0._dp,Qscale)
 if (.not.(temp.eq.temp))  write(*,*) 'NaN at VVV C[VG, VG, VG]' 
results1(47)=temp
! ----- Topology2: diagrams w. 2 Particles and 1 Vertex

! ----- diagrams of type SS, 26 ------ 
! ---- Ah,Ah ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplAhAhAhAh(i1,i1,i2,i2)
temp=temp+(-1._dp/8._dp)*(-coup1)*Fep_SS(MAh2(i1),MAh2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Ah, Ah]' 
  End Do
End Do
results2(1)=temp
! ---- Ah,hh ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplAhAhhhhh(i1,i1,i2,i2)
temp=temp+(-0.25_dp)*(-coup1)*Fep_SS(MAh2(i1),Mhh2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, hh, hh]' 
  End Do
End Do
results2(2)=temp
! ---- Ah,Hpm ----
temp=0._dp
Do i1=1,6
 Do i2=1,2
coup1 = cplAhAhHpmcHpm(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MAh2(i1),MHpm2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Hpm, conj[Hpm]]' 
  End Do
End Do
results2(3)=temp
! ---- Ah,Sd ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplAhAhSdcSd(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MAh2(i1),MSd2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Sd, conj[Sd]]' 
  End Do
End Do
results2(4)=temp
! ---- Ah,Se ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplAhAhSecSe(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MAh2(i1),MSe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Se, conj[Se]]' 
  End Do
End Do
results2(5)=temp
! ---- Ah,Su ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplAhAhSucSu(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MAh2(i1),MSu2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Su, conj[Su]]' 
  End Do
End Do
results2(6)=temp
! ---- Ah,Sv ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplAhAhSvcSv(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MAh2(i1),MSv2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Sv, conj[Sv]]' 
  End Do
End Do
results2(7)=temp
! ---- hh,hh ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplhhhhhhhh(i1,i1,i2,i2)
temp=temp+(-1._dp/8._dp)*(-coup1)*Fep_SS(Mhh2(i1),Mhh2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, hh, hh]' 
  End Do
End Do
results2(8)=temp
! ---- hh,Hpm ----
temp=0._dp
Do i1=1,6
 Do i2=1,2
coup1 = cplhhhhHpmcHpm(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(Mhh2(i1),MHpm2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Hpm, conj[Hpm]]' 
  End Do
End Do
results2(9)=temp
! ---- hh,Sd ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplhhhhSdcSd(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(Mhh2(i1),MSd2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Sd, conj[Sd]]' 
  End Do
End Do
results2(10)=temp
! ---- hh,Se ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplhhhhSecSe(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(Mhh2(i1),MSe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Se, conj[Se]]' 
  End Do
End Do
results2(11)=temp
! ---- hh,Su ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplhhhhSucSu(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(Mhh2(i1),MSu2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Su, conj[Su]]' 
  End Do
End Do
results2(12)=temp
! ---- hh,Sv ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplhhhhSvcSv(i1,i1,i2,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(Mhh2(i1),MSv2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Sv, conj[Sv]]' 
  End Do
End Do
results2(13)=temp
! ---- Hpm,Hpm ----
temp=0._dp
Do i1=1,2
 Do i2=1,2
coup1 = cplHpmHpmcHpmcHpm(i1,i2,i1,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MHpm2(i1),MHpm2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Hpm, conj[Hpm], conj[Hpm]]' 
  End Do
End Do
results2(14)=temp
! ---- Hpm,Sd ----
temp=0._dp
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSdcHpmcSd(i1,i2,i1,i2)
temp=temp+(-1._dp)*(-coup1)*Fep_SS(MHpm2(i1),MSd2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Sd, conj[Hpm], conj[Sd]]' 
  End Do
End Do
results2(15)=temp
! ---- Hpm,Se ----
temp=0._dp
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSecHpmcSe(i1,i2,i1,i2)
temp=temp+(-1._dp)*(-coup1)*Fep_SS(MHpm2(i1),MSe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Se, conj[Hpm], conj[Se]]' 
  End Do
End Do
results2(16)=temp
! ---- Hpm,Su ----
temp=0._dp
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSucHpmcSu(i1,i2,i1,i2)
temp=temp+(-1._dp)*(-coup1)*Fep_SS(MHpm2(i1),MSu2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Su, conj[Hpm], conj[Su]]' 
  End Do
End Do
results2(17)=temp
! ---- Hpm,Sv ----
temp=0._dp
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSvcHpmcSv(i1,i2,i1,i2)
temp=temp+(-1._dp)*(-coup1)*Fep_SS(MHpm2(i1),MSv2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Sv, conj[Hpm], conj[Sv]]' 
  End Do
End Do
results2(18)=temp
! ---- Sd,Sd ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSdcSdcSd(i1,i2,i1,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MSd2(i1),MSd2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Sd, Sd, conj[Sd], conj[Sd]]' 
  End Do
End Do
results2(19)=temp
! ---- Sd,Se ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSecSdcSe(i1,i2,i1,i2)
temp=temp+(-1._dp)*(-coup1)*Fep_SS(MSd2(i1),MSe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Sd, Se, conj[Sd], conj[Se]]' 
  End Do
End Do
results2(20)=temp
! ---- Sd,Su ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSucSdcSu(i1,i2,i1,i2)
temp=temp+(-1._dp)*(-coup1)*Fep_SS(MSd2(i1),MSu2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Sd, Su, conj[Sd], conj[Su]]' 
  End Do
End Do
results2(21)=temp
! ---- Se,Se ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSeSecSecSe(i1,i2,i1,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MSe2(i1),MSe2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Se, Se, conj[Se], conj[Se]]' 
  End Do
End Do
results2(22)=temp
! ---- Se,Sv ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSeSvcSecSv(i1,i2,i1,i2)
temp=temp+(-1._dp)*(-coup1)*Fep_SS(MSe2(i1),MSv2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Se, Sv, conj[Se], conj[Sv]]' 
  End Do
End Do
results2(23)=temp
! ---- Su,Su ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSuSucSucSu(i1,i2,i1,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MSu2(i1),MSu2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Su, Su, conj[Su], conj[Su]]' 
  End Do
End Do
results2(24)=temp
! ---- Su,Sv ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSuSvcSucSv(i1,i2,i1,i2)
temp=temp+(-1._dp)*(-coup1)*Fep_SS(MSu2(i1),MSv2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Su, Sv, conj[Su], conj[Sv]]' 
  End Do
End Do
results2(25)=temp
! ---- Sv,Sv ----
temp=0._dp
Do i1=1,6
 Do i2=1,6
coup1 = cplSvSvcSvcSv(i1,i2,i1,i2)
temp=temp+(-0.5_dp)*(-coup1)*Fep_SS(MSv2(i1),MSv2(i2),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Sv, Sv, conj[Sv], conj[Sv]]' 
  End Do
End Do
results2(26)=temp
! ----- diagrams of type VS, 2 ------ 
! ---- Sd,VG ----
temp=0._dp
Do i1=1,6
coup1 = cplSdcSdVGVG(i1,i1)
temp=temp+0.25_dp*coup1*Fep_VS(0._dp,MSd2(i1),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at VS C[Sd, VG, VG, conj[Sd]]' 
End Do
results2(27)=temp
! ---- Su,VG ----
temp=0._dp
Do i1=1,6
coup1 = cplSucSuVGVG(i1,i1)
temp=temp+0.25_dp*coup1*Fep_VS(0._dp,MSu2(i1),Qscale)
if (.not.(temp.eq.temp))  write(*,*) 'NaN at VS C[Su, VG, VG, conj[Su]]' 
End Do
results2(28)=temp
result = sum(results1)+sum(results2) 
effPot2L = result * oo16pi2 * oo16Pi2
End Subroutine CalculateEffPot2Loop


Subroutine SecondDerivativeEffPot2Loop(vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,gp,              & 
& Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,             & 
& ms12,ms22,ms32,mv2,M1,M2,M3,M4,kont,pi2L,ti2L)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp),Intent(in) :: vd,vu,vS,vS1,vS2,vS3

Integer, Intent(inout):: kont
Real(dp), Intent(out) :: pi2L(6,6),ti2L(6)
Integer :: i,i1,i2,i3,NrContr 
Integer :: iv1, iv2 
Integer :: NrContr1,NrContr2 !nr of contributing diagrams
Real(dp) :: Q2,colorfactor,coeff,coeffbar
Complex(dp) :: result,result_ti,temp,temp_ti,temp_tj,tempbar,tempbar_ti,tempbar_tj
Complex(dp) :: coup1,coup2,coup1L,coup1R,coup2L,coup2R,coupx,coupxbar
Complex(dp) :: Di_coup1,Di_coup2,Di_coup1L,Di_coup1R,Di_coup2L,Di_coup2R,Di_coupx,Di_coupxbar
Complex(dp) :: Dj_coup1,Dj_coup2,Dj_coup1L,Dj_coup1R,Dj_coup2L,Dj_coup2R,Dj_coupx,Dj_coupxbar
Complex(dp) :: DDcoup1,DDcoup2,DDcoup1L,DDcoup1R,DDcoup2L,DDcoup2R,DDcoupx,DDcoupxbar
Complex(dp) :: results1(47),results2(28)
Complex(dp) :: results1_ti(47),results2_ti(28)
Real(dp) :: gout(70368) 
Complex(dp) :: cplAhAhAh(6,6,6),cplAhAhhh(6,6,6),cplAhhhhh(6,6,6),cplAhHpmcHpm(6,2,2),               & 
& cplAhSdcSd(6,6,6),cplAhSecSe(6,6,6),cplAhSucSu(6,6,6),cplAhSvcSv(6,6,6),               & 
& cplhhhhhh(6,6,6),cplhhHpmcHpm(6,2,2),cplhhSdcSd(6,6,6),cplhhSecSe(6,6,6),              & 
& cplhhSucSu(6,6,6),cplhhSvcSv(6,6,6),cplHpmSucSd(2,6,6),cplHpmSvcSe(2,6,6),             & 
& cplSdcHpmcSu(6,2,6),cplSecHpmcSv(6,2,6),cplSdcSdVG(6,6),cplSucSuVG(6,6),               & 
& cplVGVGVG,cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplChiChiAhL(9,9,6),               & 
& cplChiChiAhR(9,9,6),cplcFdFdAhL(3,3,6),cplcFdFdAhR(3,3,6),cplcFeFeAhL(3,3,6),          & 
& cplcFeFeAhR(3,3,6),cplcFuFuAhL(3,3,6),cplcFuFuAhR(3,3,6),cplcFvFvAhL(3,3,6),           & 
& cplcFvFvAhR(3,3,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChaFucSdL(2,3,6),    & 
& cplChaFucSdR(2,3,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChahhL(2,2,6),      & 
& cplcChaChahhR(2,2,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvL(3,2,6),      & 
& cplcFeChaSvR(3,2,6),cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),cplChiFdcSdL(9,3,6),       & 
& cplChiFdcSdR(9,3,6),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFucSuL(9,3,6),       & 
& cplChiFucSuR(9,3,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),cplcChaChiHpmL(2,9,2),     & 
& cplcChaChiHpmR(2,9,2),cplcFdChiSdL(3,9,6),cplcFdChiSdR(3,9,6),cplcFeChiSeL(3,9,6),     & 
& cplcFeChiSeR(3,9,6),cplcFuChiSuL(3,9,6),cplcFuChiSuR(3,9,6),cplcFvChiSvL(3,9,6),       & 
& cplcFvChiSvR(3,9,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,6),            & 
& cplcFdFdhhR(3,3,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),     & 
& cplcFuFdcHpmR(3,3,2),cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),cplcChaFecSvL(2,3,6),       & 
& cplcChaFecSvR(2,3,6),cplcFvFecHpmL(3,3,2),cplcFvFecHpmR(3,3,2),cplGluFucSuL(3,6),      & 
& cplGluFucSuR(3,6),cplcFuFuhhL(3,3,6),cplcFuFuhhR(3,3,6),cplcFdFuHpmL(3,3,2),           & 
& cplcFdFuHpmR(3,3,2),cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),cplcFeFvHpmL(3,3,2),         & 
& cplcFeFvHpmR(3,3,2),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),             & 
& cplcFuGluSuR(3,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChacFvSeL(2,3,6),      & 
& cplcChacFvSeR(2,3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),               & 
& cplcFuFuVGR(3,3),cplGluGluVGL,cplGluGluVGR

Complex(dp) :: cplAhAhAhAh(6,6,6,6),cplAhAhhhhh(6,6,6,6),cplAhAhHpmcHpm(6,6,2,2),cplAhAhSdcSd(6,6,6,6),& 
& cplAhAhSecSe(6,6,6,6),cplAhAhSucSu(6,6,6,6),cplAhAhSvcSv(6,6,6,6),cplhhhhhhhh(6,6,6,6),& 
& cplhhhhHpmcHpm(6,6,2,2),cplhhhhSdcSd(6,6,6,6),cplhhhhSecSe(6,6,6,6),cplhhhhSucSu(6,6,6,6),& 
& cplhhhhSvcSv(6,6,6,6),cplHpmHpmcHpmcHpm(2,2,2,2),cplHpmSdcHpmcSd(2,6,2,6),             & 
& cplHpmSecHpmcSe(2,6,2,6),cplHpmSucHpmcSu(2,6,2,6),cplHpmSvcHpmcSv(2,6,2,6),            & 
& cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),cplSdSucSdcSu(6,6,6,6),cplSeSecSecSe(6,6,6,6),& 
& cplSeSvcSecSv(6,6,6,6),cplSuSucSucSu(6,6,6,6),cplSuSvcSucSv(6,6,6,6),cplSvSvcSvcSv(6,6,6,6),& 
& cplSdcSdVGVG(6,6),cplSucSuVGVG(6,6)

Complex(dp) :: dcplAhAhAh(6,6,6,6),dcplAhAhhh(6,6,6,6),dcplAhhhhh(6,6,6,6),dcplAhHpmcHpm(6,2,2,6),   & 
& dcplAhSdcSd(6,6,6,6),dcplAhSecSe(6,6,6,6),dcplAhSucSu(6,6,6,6),dcplAhSvcSv(6,6,6,6),   & 
& dcplhhhhhh(6,6,6,6),dcplhhHpmcHpm(6,2,2,6),dcplhhSdcSd(6,6,6,6),dcplhhSecSe(6,6,6,6),  & 
& dcplhhSucSu(6,6,6,6),dcplhhSvcSv(6,6,6,6),dcplHpmSucSd(2,6,6,6),dcplHpmSvcSe(2,6,6,6), & 
& dcplSdcHpmcSu(6,2,6,6),dcplSecHpmcSv(6,2,6,6),dcplSdcSdVG(6,6,6),dcplSucSuVG(6,6,6),   & 
& dcplVGVGVG(6),dcplcChaChaAhL(2,2,6,6),dcplcChaChaAhR(2,2,6,6),dcplChiChiAhL(9,9,6,6),  & 
& dcplChiChiAhR(9,9,6,6),dcplcFdFdAhL(3,3,6,6),dcplcFdFdAhR(3,3,6,6),dcplcFeFeAhL(3,3,6,6),& 
& dcplcFeFeAhR(3,3,6,6),dcplcFuFuAhL(3,3,6,6),dcplcFuFuAhR(3,3,6,6),dcplcFvFvAhL(3,3,6,6),& 
& dcplcFvFvAhR(3,3,6,6),dcplChiChacHpmL(9,2,2,6),dcplChiChacHpmR(9,2,2,6),               & 
& dcplChaFucSdL(2,3,6,6),dcplChaFucSdR(2,3,6,6),dcplChaFvcSeL(2,3,6,6),dcplChaFvcSeR(2,3,6,6),& 
& dcplcChaChahhL(2,2,6,6),dcplcChaChahhR(2,2,6,6),dcplcFdChaSuL(3,2,6,6),dcplcFdChaSuR(3,2,6,6),& 
& dcplcFeChaSvL(3,2,6,6),dcplcFeChaSvR(3,2,6,6),dcplChiChihhL(9,9,6,6),dcplChiChihhR(9,9,6,6),& 
& dcplChiFdcSdL(9,3,6,6),dcplChiFdcSdR(9,3,6,6),dcplChiFecSeL(9,3,6,6),dcplChiFecSeR(9,3,6,6),& 
& dcplChiFucSuL(9,3,6,6),dcplChiFucSuR(9,3,6,6),dcplChiFvcSvL(9,3,6,6),dcplChiFvcSvR(9,3,6,6),& 
& dcplcChaChiHpmL(2,9,2,6),dcplcChaChiHpmR(2,9,2,6),dcplcFdChiSdL(3,9,6,6),              & 
& dcplcFdChiSdR(3,9,6,6),dcplcFeChiSeL(3,9,6,6),dcplcFeChiSeR(3,9,6,6),dcplcFuChiSuL(3,9,6,6),& 
& dcplcFuChiSuR(3,9,6,6),dcplcFvChiSvL(3,9,6,6),dcplcFvChiSvR(3,9,6,6),dcplGluFdcSdL(3,6,6),& 
& dcplGluFdcSdR(3,6,6),dcplcFdFdhhL(3,3,6,6),dcplcFdFdhhR(3,3,6,6),dcplcChaFdcSuL(2,3,6,6),& 
& dcplcChaFdcSuR(2,3,6,6),dcplcFuFdcHpmL(3,3,2,6),dcplcFuFdcHpmR(3,3,2,6),               & 
& dcplcFeFehhL(3,3,6,6),dcplcFeFehhR(3,3,6,6),dcplcChaFecSvL(2,3,6,6),dcplcChaFecSvR(2,3,6,6),& 
& dcplcFvFecHpmL(3,3,2,6),dcplcFvFecHpmR(3,3,2,6),dcplGluFucSuL(3,6,6),dcplGluFucSuR(3,6,6),& 
& dcplcFuFuhhL(3,3,6,6),dcplcFuFuhhR(3,3,6,6),dcplcFdFuHpmL(3,3,2,6),dcplcFdFuHpmR(3,3,2,6),& 
& dcplcFvFvhhL(3,3,6,6),dcplcFvFvhhR(3,3,6,6),dcplcFeFvHpmL(3,3,2,6),dcplcFeFvHpmR(3,3,2,6),& 
& dcplcFdGluSdL(3,6,6),dcplcFdGluSdR(3,6,6),dcplcFuGluSuL(3,6,6),dcplcFuGluSuR(3,6,6),   & 
& dcplcChacFuSdL(2,3,6,6),dcplcChacFuSdR(2,3,6,6),dcplcChacFvSeL(2,3,6,6),               & 
& dcplcChacFvSeR(2,3,6,6),dcplcFdFdVGL(3,3,6),dcplcFdFdVGR(3,3,6),dcplcFuFuVGL(3,3,6),   & 
& dcplcFuFuVGR(3,3,6),dcplGluGluVGL(6),dcplGluGluVGR(6)

Complex(dp) :: dcplAhAhAhAh(6,6,6,6,6),dcplAhAhhhhh(6,6,6,6,6),dcplAhAhHpmcHpm(6,6,2,2,6),           & 
& dcplAhAhSdcSd(6,6,6,6,6),dcplAhAhSecSe(6,6,6,6,6),dcplAhAhSucSu(6,6,6,6,6),            & 
& dcplAhAhSvcSv(6,6,6,6,6),dcplhhhhhhhh(6,6,6,6,6),dcplhhhhHpmcHpm(6,6,2,2,6),           & 
& dcplhhhhSdcSd(6,6,6,6,6),dcplhhhhSecSe(6,6,6,6,6),dcplhhhhSucSu(6,6,6,6,6),            & 
& dcplhhhhSvcSv(6,6,6,6,6),dcplHpmHpmcHpmcHpm(2,2,2,2,6),dcplHpmSdcHpmcSd(2,6,2,6,6),    & 
& dcplHpmSecHpmcSe(2,6,2,6,6),dcplHpmSucHpmcSu(2,6,2,6,6),dcplHpmSvcHpmcSv(2,6,2,6,6),   & 
& dcplSdSdcSdcSd(6,6,6,6,6),dcplSdSecSdcSe(6,6,6,6,6),dcplSdSucSdcSu(6,6,6,6,6),         & 
& dcplSeSecSecSe(6,6,6,6,6),dcplSeSvcSecSv(6,6,6,6,6),dcplSuSucSucSu(6,6,6,6,6),         & 
& dcplSuSvcSucSv(6,6,6,6,6),dcplSvSvcSvcSv(6,6,6,6,6),dcplSdcSdVGVG(6,6,6),              & 
& dcplSucSuVGVG(6,6,6)

Complex(dp) :: ddcplAhAhAh(6,6,6,6,6),ddcplAhAhhh(6,6,6,6,6),ddcplAhhhhh(6,6,6,6,6),ddcplAhHpmcHpm(6,2,2,6,6),& 
& ddcplAhSdcSd(6,6,6,6,6),ddcplAhSecSe(6,6,6,6,6),ddcplAhSucSu(6,6,6,6,6),               & 
& ddcplAhSvcSv(6,6,6,6,6),ddcplhhhhhh(6,6,6,6,6),ddcplhhHpmcHpm(6,2,2,6,6),              & 
& ddcplhhSdcSd(6,6,6,6,6),ddcplhhSecSe(6,6,6,6,6),ddcplhhSucSu(6,6,6,6,6),               & 
& ddcplhhSvcSv(6,6,6,6,6),ddcplHpmSucSd(2,6,6,6,6),ddcplHpmSvcSe(2,6,6,6,6),             & 
& ddcplSdcHpmcSu(6,2,6,6,6),ddcplSecHpmcSv(6,2,6,6,6),ddcplSdcSdVG(6,6,6,6),             & 
& ddcplSucSuVG(6,6,6,6),ddcplVGVGVG(6,6),ddcplcChaChaAhL(2,2,6,6,6),ddcplcChaChaAhR(2,2,6,6,6),& 
& ddcplChiChiAhL(9,9,6,6,6),ddcplChiChiAhR(9,9,6,6,6),ddcplcFdFdAhL(3,3,6,6,6),          & 
& ddcplcFdFdAhR(3,3,6,6,6),ddcplcFeFeAhL(3,3,6,6,6),ddcplcFeFeAhR(3,3,6,6,6),            & 
& ddcplcFuFuAhL(3,3,6,6,6),ddcplcFuFuAhR(3,3,6,6,6),ddcplcFvFvAhL(3,3,6,6,6),            & 
& ddcplcFvFvAhR(3,3,6,6,6),ddcplChiChacHpmL(9,2,2,6,6),ddcplChiChacHpmR(9,2,2,6,6),      & 
& ddcplChaFucSdL(2,3,6,6,6),ddcplChaFucSdR(2,3,6,6,6),ddcplChaFvcSeL(2,3,6,6,6),         & 
& ddcplChaFvcSeR(2,3,6,6,6),ddcplcChaChahhL(2,2,6,6,6),ddcplcChaChahhR(2,2,6,6,6),       & 
& ddcplcFdChaSuL(3,2,6,6,6),ddcplcFdChaSuR(3,2,6,6,6),ddcplcFeChaSvL(3,2,6,6,6),         & 
& ddcplcFeChaSvR(3,2,6,6,6),ddcplChiChihhL(9,9,6,6,6),ddcplChiChihhR(9,9,6,6,6),         & 
& ddcplChiFdcSdL(9,3,6,6,6),ddcplChiFdcSdR(9,3,6,6,6),ddcplChiFecSeL(9,3,6,6,6),         & 
& ddcplChiFecSeR(9,3,6,6,6),ddcplChiFucSuL(9,3,6,6,6),ddcplChiFucSuR(9,3,6,6,6),         & 
& ddcplChiFvcSvL(9,3,6,6,6),ddcplChiFvcSvR(9,3,6,6,6),ddcplcChaChiHpmL(2,9,2,6,6),       & 
& ddcplcChaChiHpmR(2,9,2,6,6),ddcplcFdChiSdL(3,9,6,6,6),ddcplcFdChiSdR(3,9,6,6,6),       & 
& ddcplcFeChiSeL(3,9,6,6,6),ddcplcFeChiSeR(3,9,6,6,6),ddcplcFuChiSuL(3,9,6,6,6),         & 
& ddcplcFuChiSuR(3,9,6,6,6),ddcplcFvChiSvL(3,9,6,6,6),ddcplcFvChiSvR(3,9,6,6,6),         & 
& ddcplGluFdcSdL(3,6,6,6),ddcplGluFdcSdR(3,6,6,6),ddcplcFdFdhhL(3,3,6,6,6),              & 
& ddcplcFdFdhhR(3,3,6,6,6),ddcplcChaFdcSuL(2,3,6,6,6),ddcplcChaFdcSuR(2,3,6,6,6),        & 
& ddcplcFuFdcHpmL(3,3,2,6,6),ddcplcFuFdcHpmR(3,3,2,6,6),ddcplcFeFehhL(3,3,6,6,6),        & 
& ddcplcFeFehhR(3,3,6,6,6),ddcplcChaFecSvL(2,3,6,6,6),ddcplcChaFecSvR(2,3,6,6,6),        & 
& ddcplcFvFecHpmL(3,3,2,6,6),ddcplcFvFecHpmR(3,3,2,6,6),ddcplGluFucSuL(3,6,6,6),         & 
& ddcplGluFucSuR(3,6,6,6),ddcplcFuFuhhL(3,3,6,6,6),ddcplcFuFuhhR(3,3,6,6,6),             & 
& ddcplcFdFuHpmL(3,3,2,6,6),ddcplcFdFuHpmR(3,3,2,6,6),ddcplcFvFvhhL(3,3,6,6,6),          & 
& ddcplcFvFvhhR(3,3,6,6,6),ddcplcFeFvHpmL(3,3,2,6,6),ddcplcFeFvHpmR(3,3,2,6,6),          & 
& ddcplcFdGluSdL(3,6,6,6),ddcplcFdGluSdR(3,6,6,6),ddcplcFuGluSuL(3,6,6,6),               & 
& ddcplcFuGluSuR(3,6,6,6),ddcplcChacFuSdL(2,3,6,6,6),ddcplcChacFuSdR(2,3,6,6,6),         & 
& ddcplcChacFvSeL(2,3,6,6,6),ddcplcChacFvSeR(2,3,6,6,6),ddcplcFdFdVGL(3,3,6,6),          & 
& ddcplcFdFdVGR(3,3,6,6),ddcplcFuFuVGL(3,3,6,6),ddcplcFuFuVGR(3,3,6,6),ddcplGluGluVGL(6,6),& 
& ddcplGluGluVGR(6,6)

Complex(dp) :: ddcplAhAhAhAh(6,6,6,6,6,6),ddcplAhAhhhhh(6,6,6,6,6,6),ddcplAhAhHpmcHpm(6,6,2,2,6,6),  & 
& ddcplAhAhSdcSd(6,6,6,6,6,6),ddcplAhAhSecSe(6,6,6,6,6,6),ddcplAhAhSucSu(6,6,6,6,6,6),   & 
& ddcplAhAhSvcSv(6,6,6,6,6,6),ddcplhhhhhhhh(6,6,6,6,6,6),ddcplhhhhHpmcHpm(6,6,2,2,6,6),  & 
& ddcplhhhhSdcSd(6,6,6,6,6,6),ddcplhhhhSecSe(6,6,6,6,6,6),ddcplhhhhSucSu(6,6,6,6,6,6),   & 
& ddcplhhhhSvcSv(6,6,6,6,6,6),ddcplHpmHpmcHpmcHpm(2,2,2,2,6,6),ddcplHpmSdcHpmcSd(2,6,2,6,6,6),& 
& ddcplHpmSecHpmcSe(2,6,2,6,6,6),ddcplHpmSucHpmcSu(2,6,2,6,6,6),ddcplHpmSvcHpmcSv(2,6,2,6,6,6),& 
& ddcplSdSdcSdcSd(6,6,6,6,6,6),ddcplSdSecSdcSe(6,6,6,6,6,6),ddcplSdSucSdcSu(6,6,6,6,6,6),& 
& ddcplSeSecSecSe(6,6,6,6,6,6),ddcplSeSvcSecSv(6,6,6,6,6,6),ddcplSuSucSucSu(6,6,6,6,6,6),& 
& ddcplSuSvcSucSv(6,6,6,6,6,6),ddcplSvSvcSvcSv(6,6,6,6,6,6),ddcplSdcSdVGVG(6,6,6,6),     & 
& ddcplSucSuVGVG(6,6,6,6)

Real(dp) :: MSd(6),MSd2(6),MSv(6),MSv2(6),MSu(6),MSu2(6),MSe(6),MSe2(6),Mhh(6),Mhh2(6),           & 
& MAh(6),MAh2(6),MHpm(2),MHpm2(2),MChi(9),MChi2(9),MFv(3),MFv2(3),MCha(2),               & 
& MCha2(2),MFe(3),MFe2(3),MFd(3),MFd2(3),MFu(3),MFu2(3),MGlu,MGlu2,MVZ,MVZp,             & 
& MVZ2,MVZp2,MVWm,MVWm2

Complex(dp) :: dMSd(6,6),dMSd2(6,6),dMSv(6,6),dMSv2(6,6),dMSu(6,6),dMSu2(6,6),dMSe(6,6),             & 
& dMSe2(6,6),dMhh(6,6),dMhh2(6,6),dMAh(6,6),dMAh2(6,6),dMHpm(2,6),dMHpm2(2,6),           & 
& dMChi(9,6),dMChi2(9,6),dMFv(3,6),dMFv2(3,6),dMCha(2,6),dMCha2(2,6),dMFe(3,6),          & 
& dMFe2(3,6),dMFd(3,6),dMFd2(3,6),dMFu(3,6),dMFu2(3,6),dMGlu(1,6),dMGlu2(1,6),           & 
& dMVZ(1,6),dMVZp(1,6),dMVZ2(1,6),dMVZp2(1,6),dMVWm(1,6),dMVWm2(1,6)

Complex(dp) :: ddMSd(6,6,6),ddMSd2(6,6,6),ddMSv(6,6,6),ddMSv2(6,6,6),ddMSu(6,6,6),ddMSu2(6,6,6),     & 
& ddMSe(6,6,6),ddMSe2(6,6,6),ddMhh(6,6,6),ddMhh2(6,6,6),ddMAh(6,6,6),ddMAh2(6,6,6),      & 
& ddMHpm(2,6,6),ddMHpm2(2,6,6),ddMChi(9,6,6),ddMChi2(9,6,6),ddMFv(3,6,6),ddMFv2(3,6,6),  & 
& ddMCha(2,6,6),ddMCha2(2,6,6),ddMFe(3,6,6),ddMFe2(3,6,6),ddMFd(3,6,6),ddMFd2(3,6,6),    & 
& ddMFu(3,6,6),ddMFu2(3,6,6),ddMGlu(1,6,6),ddMGlu2(1,6,6),ddMVZ(1,6,6),ddMVZp(1,6,6),    & 
& ddMVZ2(1,6,6),ddMVZp2(1,6,6),ddMVWm(1,6,6),ddMVWm2(1,6,6)

!! ------------------------------------------------- 
!! Calculate masses, couplings and their derivatives 
!! ------------------------------------------------- 

Do i1=1,6
Call FirstDerivativeMassesCoups(i1,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,gp,Yd,               & 
& Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,           & 
& ms22,ms32,mv2,M1,M2,M3,M4,gout)

Call GToMassesCoups(gout,MSd,MSd2,MSv,MSv2,MSu,MSu2,MSe,MSe2,Mhh,Mhh2,MAh,            & 
& MAh2,MHpm,MHpm2,MChi,MChi2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MFd,MFd2,MFu,MFu2,             & 
& MGlu,MGlu2,MVZ,MVZp,MVZ2,MVZp2,MVWm,MVWm2,cplAhAhAh,cplAhAhhh,cplAhhhhh,               & 
& cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplhhhhhh,cplhhHpmcHpm,       & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplHpmSucSd,cplHpmSvcSe,cplSdcHpmcSu,      & 
& cplSecHpmcSv,cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplcChaChaAhL,cplcChaChaAhR,              & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,         & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,cplChiChihhR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFeFehhL,cplcFeFehhR,cplcChaFecSvL,cplcChaFecSvR,       & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,           & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplcChacFvSeL,cplcChacFvSeR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplGluGluVGL,cplGluGluVGR,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,         & 
& cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvcSv,cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,        & 
& cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvcSv,cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,              & 
& cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvcHpmcSv,cplSdSdcSdcSd,cplSdSecSdcSe,           & 
& cplSdSucSdcSu,cplSeSecSecSe,cplSeSvcSecSv,cplSuSucSucSu,cplSuSvcSucSv,cplSvSvcSvcSv,   & 
& cplSdcSdVGVG,cplSucSuVGVG)

dMSd(:,i1) = MSd
dMSd2(:,i1) = MSd2
dMSv(:,i1) = MSv
dMSv2(:,i1) = MSv2
dMSu(:,i1) = MSu
dMSu2(:,i1) = MSu2
dMSe(:,i1) = MSe
dMSe2(:,i1) = MSe2
dMhh(:,i1) = Mhh
dMhh2(:,i1) = Mhh2
dMAh(:,i1) = MAh
dMAh2(:,i1) = MAh2
dMHpm(:,i1) = MHpm
dMHpm2(:,i1) = MHpm2
dMChi(:,i1) = MChi
dMChi2(:,i1) = MChi2
dMFv(:,i1) = MFv
dMFv2(:,i1) = MFv2
dMCha(:,i1) = MCha
dMCha2(:,i1) = MCha2
dMFe(:,i1) = MFe
dMFe2(:,i1) = MFe2
dMFd(:,i1) = MFd
dMFd2(:,i1) = MFd2
dMFu(:,i1) = MFu
dMFu2(:,i1) = MFu2
dMGlu(:,i1) = MGlu
dMGlu2(:,i1) = MGlu2
dMVZ(:,i1) = MVZ
dMVZp(:,i1) = MVZp
dMVZ2(:,i1) = MVZ2
dMVZp2(:,i1) = MVZp2
dMVWm(:,i1) = MVWm
dMVWm2(:,i1) = MVWm2
dcplAhAhAh(:,:,:,i1) = cplAhAhAh
dcplAhAhhh(:,:,:,i1) = cplAhAhhh
dcplAhhhhh(:,:,:,i1) = cplAhhhhh
dcplAhHpmcHpm(:,:,:,i1) = cplAhHpmcHpm
dcplAhSdcSd(:,:,:,i1) = cplAhSdcSd
dcplAhSecSe(:,:,:,i1) = cplAhSecSe
dcplAhSucSu(:,:,:,i1) = cplAhSucSu
dcplAhSvcSv(:,:,:,i1) = cplAhSvcSv
dcplhhhhhh(:,:,:,i1) = cplhhhhhh
dcplhhHpmcHpm(:,:,:,i1) = cplhhHpmcHpm
dcplhhSdcSd(:,:,:,i1) = cplhhSdcSd
dcplhhSecSe(:,:,:,i1) = cplhhSecSe
dcplhhSucSu(:,:,:,i1) = cplhhSucSu
dcplhhSvcSv(:,:,:,i1) = cplhhSvcSv
dcplHpmSucSd(:,:,:,i1) = cplHpmSucSd
dcplHpmSvcSe(:,:,:,i1) = cplHpmSvcSe
dcplSdcHpmcSu(:,:,:,i1) = cplSdcHpmcSu
dcplSecHpmcSv(:,:,:,i1) = cplSecHpmcSv
dcplSdcSdVG(:,:,i1) = cplSdcSdVG
dcplSucSuVG(:,:,i1) = cplSucSuVG
dcplVGVGVG(i1) = cplVGVGVG
dcplcChaChaAhL(:,:,:,i1) = cplcChaChaAhL
dcplcChaChaAhR(:,:,:,i1) = cplcChaChaAhR
dcplChiChiAhL(:,:,:,i1) = cplChiChiAhL
dcplChiChiAhR(:,:,:,i1) = cplChiChiAhR
dcplcFdFdAhL(:,:,:,i1) = cplcFdFdAhL
dcplcFdFdAhR(:,:,:,i1) = cplcFdFdAhR
dcplcFeFeAhL(:,:,:,i1) = cplcFeFeAhL
dcplcFeFeAhR(:,:,:,i1) = cplcFeFeAhR
dcplcFuFuAhL(:,:,:,i1) = cplcFuFuAhL
dcplcFuFuAhR(:,:,:,i1) = cplcFuFuAhR
dcplcFvFvAhL(:,:,:,i1) = cplcFvFvAhL
dcplcFvFvAhR(:,:,:,i1) = cplcFvFvAhR
dcplChiChacHpmL(:,:,:,i1) = cplChiChacHpmL
dcplChiChacHpmR(:,:,:,i1) = cplChiChacHpmR
dcplChaFucSdL(:,:,:,i1) = cplChaFucSdL
dcplChaFucSdR(:,:,:,i1) = cplChaFucSdR
dcplChaFvcSeL(:,:,:,i1) = cplChaFvcSeL
dcplChaFvcSeR(:,:,:,i1) = cplChaFvcSeR
dcplcChaChahhL(:,:,:,i1) = cplcChaChahhL
dcplcChaChahhR(:,:,:,i1) = cplcChaChahhR
dcplcFdChaSuL(:,:,:,i1) = cplcFdChaSuL
dcplcFdChaSuR(:,:,:,i1) = cplcFdChaSuR
dcplcFeChaSvL(:,:,:,i1) = cplcFeChaSvL
dcplcFeChaSvR(:,:,:,i1) = cplcFeChaSvR
dcplChiChihhL(:,:,:,i1) = cplChiChihhL
dcplChiChihhR(:,:,:,i1) = cplChiChihhR
dcplChiFdcSdL(:,:,:,i1) = cplChiFdcSdL
dcplChiFdcSdR(:,:,:,i1) = cplChiFdcSdR
dcplChiFecSeL(:,:,:,i1) = cplChiFecSeL
dcplChiFecSeR(:,:,:,i1) = cplChiFecSeR
dcplChiFucSuL(:,:,:,i1) = cplChiFucSuL
dcplChiFucSuR(:,:,:,i1) = cplChiFucSuR
dcplChiFvcSvL(:,:,:,i1) = cplChiFvcSvL
dcplChiFvcSvR(:,:,:,i1) = cplChiFvcSvR
dcplcChaChiHpmL(:,:,:,i1) = cplcChaChiHpmL
dcplcChaChiHpmR(:,:,:,i1) = cplcChaChiHpmR
dcplcFdChiSdL(:,:,:,i1) = cplcFdChiSdL
dcplcFdChiSdR(:,:,:,i1) = cplcFdChiSdR
dcplcFeChiSeL(:,:,:,i1) = cplcFeChiSeL
dcplcFeChiSeR(:,:,:,i1) = cplcFeChiSeR
dcplcFuChiSuL(:,:,:,i1) = cplcFuChiSuL
dcplcFuChiSuR(:,:,:,i1) = cplcFuChiSuR
dcplcFvChiSvL(:,:,:,i1) = cplcFvChiSvL
dcplcFvChiSvR(:,:,:,i1) = cplcFvChiSvR
dcplGluFdcSdL(:,:,i1) = cplGluFdcSdL
dcplGluFdcSdR(:,:,i1) = cplGluFdcSdR
dcplcFdFdhhL(:,:,:,i1) = cplcFdFdhhL
dcplcFdFdhhR(:,:,:,i1) = cplcFdFdhhR
dcplcChaFdcSuL(:,:,:,i1) = cplcChaFdcSuL
dcplcChaFdcSuR(:,:,:,i1) = cplcChaFdcSuR
dcplcFuFdcHpmL(:,:,:,i1) = cplcFuFdcHpmL
dcplcFuFdcHpmR(:,:,:,i1) = cplcFuFdcHpmR
dcplcFeFehhL(:,:,:,i1) = cplcFeFehhL
dcplcFeFehhR(:,:,:,i1) = cplcFeFehhR
dcplcChaFecSvL(:,:,:,i1) = cplcChaFecSvL
dcplcChaFecSvR(:,:,:,i1) = cplcChaFecSvR
dcplcFvFecHpmL(:,:,:,i1) = cplcFvFecHpmL
dcplcFvFecHpmR(:,:,:,i1) = cplcFvFecHpmR
dcplGluFucSuL(:,:,i1) = cplGluFucSuL
dcplGluFucSuR(:,:,i1) = cplGluFucSuR
dcplcFuFuhhL(:,:,:,i1) = cplcFuFuhhL
dcplcFuFuhhR(:,:,:,i1) = cplcFuFuhhR
dcplcFdFuHpmL(:,:,:,i1) = cplcFdFuHpmL
dcplcFdFuHpmR(:,:,:,i1) = cplcFdFuHpmR
dcplcFvFvhhL(:,:,:,i1) = cplcFvFvhhL
dcplcFvFvhhR(:,:,:,i1) = cplcFvFvhhR
dcplcFeFvHpmL(:,:,:,i1) = cplcFeFvHpmL
dcplcFeFvHpmR(:,:,:,i1) = cplcFeFvHpmR
dcplcFdGluSdL(:,:,i1) = cplcFdGluSdL
dcplcFdGluSdR(:,:,i1) = cplcFdGluSdR
dcplcFuGluSuL(:,:,i1) = cplcFuGluSuL
dcplcFuGluSuR(:,:,i1) = cplcFuGluSuR
dcplcChacFuSdL(:,:,:,i1) = cplcChacFuSdL
dcplcChacFuSdR(:,:,:,i1) = cplcChacFuSdR
dcplcChacFvSeL(:,:,:,i1) = cplcChacFvSeL
dcplcChacFvSeR(:,:,:,i1) = cplcChacFvSeR
dcplcFdFdVGL(:,:,i1) = cplcFdFdVGL
dcplcFdFdVGR(:,:,i1) = cplcFdFdVGR
dcplcFuFuVGL(:,:,i1) = cplcFuFuVGL
dcplcFuFuVGR(:,:,i1) = cplcFuFuVGR
dcplGluGluVGL(i1) = cplGluGluVGL
dcplGluGluVGR(i1) = cplGluGluVGR
dcplAhAhAhAh(:,:,:,:,i1) = cplAhAhAhAh
dcplAhAhhhhh(:,:,:,:,i1) = cplAhAhhhhh
dcplAhAhHpmcHpm(:,:,:,:,i1) = cplAhAhHpmcHpm
dcplAhAhSdcSd(:,:,:,:,i1) = cplAhAhSdcSd
dcplAhAhSecSe(:,:,:,:,i1) = cplAhAhSecSe
dcplAhAhSucSu(:,:,:,:,i1) = cplAhAhSucSu
dcplAhAhSvcSv(:,:,:,:,i1) = cplAhAhSvcSv
dcplhhhhhhhh(:,:,:,:,i1) = cplhhhhhhhh
dcplhhhhHpmcHpm(:,:,:,:,i1) = cplhhhhHpmcHpm
dcplhhhhSdcSd(:,:,:,:,i1) = cplhhhhSdcSd
dcplhhhhSecSe(:,:,:,:,i1) = cplhhhhSecSe
dcplhhhhSucSu(:,:,:,:,i1) = cplhhhhSucSu
dcplhhhhSvcSv(:,:,:,:,i1) = cplhhhhSvcSv
dcplHpmHpmcHpmcHpm(:,:,:,:,i1) = cplHpmHpmcHpmcHpm
dcplHpmSdcHpmcSd(:,:,:,:,i1) = cplHpmSdcHpmcSd
dcplHpmSecHpmcSe(:,:,:,:,i1) = cplHpmSecHpmcSe
dcplHpmSucHpmcSu(:,:,:,:,i1) = cplHpmSucHpmcSu
dcplHpmSvcHpmcSv(:,:,:,:,i1) = cplHpmSvcHpmcSv
dcplSdSdcSdcSd(:,:,:,:,i1) = cplSdSdcSdcSd
dcplSdSecSdcSe(:,:,:,:,i1) = cplSdSecSdcSe
dcplSdSucSdcSu(:,:,:,:,i1) = cplSdSucSdcSu
dcplSeSecSecSe(:,:,:,:,i1) = cplSeSecSecSe
dcplSeSvcSecSv(:,:,:,:,i1) = cplSeSvcSecSv
dcplSuSucSucSu(:,:,:,:,i1) = cplSuSucSucSu
dcplSuSvcSucSv(:,:,:,:,i1) = cplSuSvcSucSv
dcplSvSvcSvcSv(:,:,:,:,i1) = cplSvSvcSvcSv
dcplSdcSdVGVG(:,:,i1) = cplSdcSdVGVG
dcplSucSuVGVG(:,:,i1) = cplSucSuVGVG
End Do 
 
Do i1=1,6
  Do i2=i1,6
Call SecondDerivativeMassesCoups(i1,i2,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,gp,              & 
& Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,             & 
& ms12,ms22,ms32,mv2,M1,M2,M3,M4,gout)

Call GToMassesCoups(gout,MSd,MSd2,MSv,MSv2,MSu,MSu2,MSe,MSe2,Mhh,Mhh2,MAh,            & 
& MAh2,MHpm,MHpm2,MChi,MChi2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MFd,MFd2,MFu,MFu2,             & 
& MGlu,MGlu2,MVZ,MVZp,MVZ2,MVZp2,MVWm,MVWm2,cplAhAhAh,cplAhAhhh,cplAhhhhh,               & 
& cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplhhhhhh,cplhhHpmcHpm,       & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplHpmSucSd,cplHpmSvcSe,cplSdcHpmcSu,      & 
& cplSecHpmcSv,cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplcChaChaAhL,cplcChaChaAhR,              & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,         & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,cplChiChihhR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFeFehhL,cplcFeFehhR,cplcChaFecSvL,cplcChaFecSvR,       & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,           & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplcChacFvSeL,cplcChacFvSeR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplGluGluVGL,cplGluGluVGR,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,         & 
& cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvcSv,cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,        & 
& cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvcSv,cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,              & 
& cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvcHpmcSv,cplSdSdcSdcSd,cplSdSecSdcSe,           & 
& cplSdSucSdcSu,cplSeSecSecSe,cplSeSvcSecSv,cplSuSucSucSu,cplSuSvcSucSv,cplSvSvcSvcSv,   & 
& cplSdcSdVGVG,cplSucSuVGVG)

ddMSd(:,i1,i2) = MSd
ddMSd2(:,i1,i2) = MSd2
ddMSv(:,i1,i2) = MSv
ddMSv2(:,i1,i2) = MSv2
ddMSu(:,i1,i2) = MSu
ddMSu2(:,i1,i2) = MSu2
ddMSe(:,i1,i2) = MSe
ddMSe2(:,i1,i2) = MSe2
ddMhh(:,i1,i2) = Mhh
ddMhh2(:,i1,i2) = Mhh2
ddMAh(:,i1,i2) = MAh
ddMAh2(:,i1,i2) = MAh2
ddMHpm(:,i1,i2) = MHpm
ddMHpm2(:,i1,i2) = MHpm2
ddMChi(:,i1,i2) = MChi
ddMChi2(:,i1,i2) = MChi2
ddMFv(:,i1,i2) = MFv
ddMFv2(:,i1,i2) = MFv2
ddMCha(:,i1,i2) = MCha
ddMCha2(:,i1,i2) = MCha2
ddMFe(:,i1,i2) = MFe
ddMFe2(:,i1,i2) = MFe2
ddMFd(:,i1,i2) = MFd
ddMFd2(:,i1,i2) = MFd2
ddMFu(:,i1,i2) = MFu
ddMFu2(:,i1,i2) = MFu2
ddMGlu(:,i1,i2) = MGlu
ddMGlu2(:,i1,i2) = MGlu2
ddMVZ(:,i1,i2) = MVZ
ddMVZp(:,i1,i2) = MVZp
ddMVZ2(:,i1,i2) = MVZ2
ddMVZp2(:,i1,i2) = MVZp2
ddMVWm(:,i1,i2) = MVWm
ddMVWm2(:,i1,i2) = MVWm2
ddcplAhAhAh(:,:,:,i1,i2) = cplAhAhAh
ddcplAhAhhh(:,:,:,i1,i2) = cplAhAhhh
ddcplAhhhhh(:,:,:,i1,i2) = cplAhhhhh
ddcplAhHpmcHpm(:,:,:,i1,i2) = cplAhHpmcHpm
ddcplAhSdcSd(:,:,:,i1,i2) = cplAhSdcSd
ddcplAhSecSe(:,:,:,i1,i2) = cplAhSecSe
ddcplAhSucSu(:,:,:,i1,i2) = cplAhSucSu
ddcplAhSvcSv(:,:,:,i1,i2) = cplAhSvcSv
ddcplhhhhhh(:,:,:,i1,i2) = cplhhhhhh
ddcplhhHpmcHpm(:,:,:,i1,i2) = cplhhHpmcHpm
ddcplhhSdcSd(:,:,:,i1,i2) = cplhhSdcSd
ddcplhhSecSe(:,:,:,i1,i2) = cplhhSecSe
ddcplhhSucSu(:,:,:,i1,i2) = cplhhSucSu
ddcplhhSvcSv(:,:,:,i1,i2) = cplhhSvcSv
ddcplHpmSucSd(:,:,:,i1,i2) = cplHpmSucSd
ddcplHpmSvcSe(:,:,:,i1,i2) = cplHpmSvcSe
ddcplSdcHpmcSu(:,:,:,i1,i2) = cplSdcHpmcSu
ddcplSecHpmcSv(:,:,:,i1,i2) = cplSecHpmcSv
ddcplSdcSdVG(:,:,i1,i2) = cplSdcSdVG
ddcplSucSuVG(:,:,i1,i2) = cplSucSuVG
ddcplVGVGVG(i1,i2) = cplVGVGVG
ddcplcChaChaAhL(:,:,:,i1,i2) = cplcChaChaAhL
ddcplcChaChaAhR(:,:,:,i1,i2) = cplcChaChaAhR
ddcplChiChiAhL(:,:,:,i1,i2) = cplChiChiAhL
ddcplChiChiAhR(:,:,:,i1,i2) = cplChiChiAhR
ddcplcFdFdAhL(:,:,:,i1,i2) = cplcFdFdAhL
ddcplcFdFdAhR(:,:,:,i1,i2) = cplcFdFdAhR
ddcplcFeFeAhL(:,:,:,i1,i2) = cplcFeFeAhL
ddcplcFeFeAhR(:,:,:,i1,i2) = cplcFeFeAhR
ddcplcFuFuAhL(:,:,:,i1,i2) = cplcFuFuAhL
ddcplcFuFuAhR(:,:,:,i1,i2) = cplcFuFuAhR
ddcplcFvFvAhL(:,:,:,i1,i2) = cplcFvFvAhL
ddcplcFvFvAhR(:,:,:,i1,i2) = cplcFvFvAhR
ddcplChiChacHpmL(:,:,:,i1,i2) = cplChiChacHpmL
ddcplChiChacHpmR(:,:,:,i1,i2) = cplChiChacHpmR
ddcplChaFucSdL(:,:,:,i1,i2) = cplChaFucSdL
ddcplChaFucSdR(:,:,:,i1,i2) = cplChaFucSdR
ddcplChaFvcSeL(:,:,:,i1,i2) = cplChaFvcSeL
ddcplChaFvcSeR(:,:,:,i1,i2) = cplChaFvcSeR
ddcplcChaChahhL(:,:,:,i1,i2) = cplcChaChahhL
ddcplcChaChahhR(:,:,:,i1,i2) = cplcChaChahhR
ddcplcFdChaSuL(:,:,:,i1,i2) = cplcFdChaSuL
ddcplcFdChaSuR(:,:,:,i1,i2) = cplcFdChaSuR
ddcplcFeChaSvL(:,:,:,i1,i2) = cplcFeChaSvL
ddcplcFeChaSvR(:,:,:,i1,i2) = cplcFeChaSvR
ddcplChiChihhL(:,:,:,i1,i2) = cplChiChihhL
ddcplChiChihhR(:,:,:,i1,i2) = cplChiChihhR
ddcplChiFdcSdL(:,:,:,i1,i2) = cplChiFdcSdL
ddcplChiFdcSdR(:,:,:,i1,i2) = cplChiFdcSdR
ddcplChiFecSeL(:,:,:,i1,i2) = cplChiFecSeL
ddcplChiFecSeR(:,:,:,i1,i2) = cplChiFecSeR
ddcplChiFucSuL(:,:,:,i1,i2) = cplChiFucSuL
ddcplChiFucSuR(:,:,:,i1,i2) = cplChiFucSuR
ddcplChiFvcSvL(:,:,:,i1,i2) = cplChiFvcSvL
ddcplChiFvcSvR(:,:,:,i1,i2) = cplChiFvcSvR
ddcplcChaChiHpmL(:,:,:,i1,i2) = cplcChaChiHpmL
ddcplcChaChiHpmR(:,:,:,i1,i2) = cplcChaChiHpmR
ddcplcFdChiSdL(:,:,:,i1,i2) = cplcFdChiSdL
ddcplcFdChiSdR(:,:,:,i1,i2) = cplcFdChiSdR
ddcplcFeChiSeL(:,:,:,i1,i2) = cplcFeChiSeL
ddcplcFeChiSeR(:,:,:,i1,i2) = cplcFeChiSeR
ddcplcFuChiSuL(:,:,:,i1,i2) = cplcFuChiSuL
ddcplcFuChiSuR(:,:,:,i1,i2) = cplcFuChiSuR
ddcplcFvChiSvL(:,:,:,i1,i2) = cplcFvChiSvL
ddcplcFvChiSvR(:,:,:,i1,i2) = cplcFvChiSvR
ddcplGluFdcSdL(:,:,i1,i2) = cplGluFdcSdL
ddcplGluFdcSdR(:,:,i1,i2) = cplGluFdcSdR
ddcplcFdFdhhL(:,:,:,i1,i2) = cplcFdFdhhL
ddcplcFdFdhhR(:,:,:,i1,i2) = cplcFdFdhhR
ddcplcChaFdcSuL(:,:,:,i1,i2) = cplcChaFdcSuL
ddcplcChaFdcSuR(:,:,:,i1,i2) = cplcChaFdcSuR
ddcplcFuFdcHpmL(:,:,:,i1,i2) = cplcFuFdcHpmL
ddcplcFuFdcHpmR(:,:,:,i1,i2) = cplcFuFdcHpmR
ddcplcFeFehhL(:,:,:,i1,i2) = cplcFeFehhL
ddcplcFeFehhR(:,:,:,i1,i2) = cplcFeFehhR
ddcplcChaFecSvL(:,:,:,i1,i2) = cplcChaFecSvL
ddcplcChaFecSvR(:,:,:,i1,i2) = cplcChaFecSvR
ddcplcFvFecHpmL(:,:,:,i1,i2) = cplcFvFecHpmL
ddcplcFvFecHpmR(:,:,:,i1,i2) = cplcFvFecHpmR
ddcplGluFucSuL(:,:,i1,i2) = cplGluFucSuL
ddcplGluFucSuR(:,:,i1,i2) = cplGluFucSuR
ddcplcFuFuhhL(:,:,:,i1,i2) = cplcFuFuhhL
ddcplcFuFuhhR(:,:,:,i1,i2) = cplcFuFuhhR
ddcplcFdFuHpmL(:,:,:,i1,i2) = cplcFdFuHpmL
ddcplcFdFuHpmR(:,:,:,i1,i2) = cplcFdFuHpmR
ddcplcFvFvhhL(:,:,:,i1,i2) = cplcFvFvhhL
ddcplcFvFvhhR(:,:,:,i1,i2) = cplcFvFvhhR
ddcplcFeFvHpmL(:,:,:,i1,i2) = cplcFeFvHpmL
ddcplcFeFvHpmR(:,:,:,i1,i2) = cplcFeFvHpmR
ddcplcFdGluSdL(:,:,i1,i2) = cplcFdGluSdL
ddcplcFdGluSdR(:,:,i1,i2) = cplcFdGluSdR
ddcplcFuGluSuL(:,:,i1,i2) = cplcFuGluSuL
ddcplcFuGluSuR(:,:,i1,i2) = cplcFuGluSuR
ddcplcChacFuSdL(:,:,:,i1,i2) = cplcChacFuSdL
ddcplcChacFuSdR(:,:,:,i1,i2) = cplcChacFuSdR
ddcplcChacFvSeL(:,:,:,i1,i2) = cplcChacFvSeL
ddcplcChacFvSeR(:,:,:,i1,i2) = cplcChacFvSeR
ddcplcFdFdVGL(:,:,i1,i2) = cplcFdFdVGL
ddcplcFdFdVGR(:,:,i1,i2) = cplcFdFdVGR
ddcplcFuFuVGL(:,:,i1,i2) = cplcFuFuVGL
ddcplcFuFuVGR(:,:,i1,i2) = cplcFuFuVGR
ddcplGluGluVGL(i1,i2) = cplGluGluVGL
ddcplGluGluVGR(i1,i2) = cplGluGluVGR
ddcplAhAhAhAh(:,:,:,:,i1,i2) = cplAhAhAhAh
ddcplAhAhhhhh(:,:,:,:,i1,i2) = cplAhAhhhhh
ddcplAhAhHpmcHpm(:,:,:,:,i1,i2) = cplAhAhHpmcHpm
ddcplAhAhSdcSd(:,:,:,:,i1,i2) = cplAhAhSdcSd
ddcplAhAhSecSe(:,:,:,:,i1,i2) = cplAhAhSecSe
ddcplAhAhSucSu(:,:,:,:,i1,i2) = cplAhAhSucSu
ddcplAhAhSvcSv(:,:,:,:,i1,i2) = cplAhAhSvcSv
ddcplhhhhhhhh(:,:,:,:,i1,i2) = cplhhhhhhhh
ddcplhhhhHpmcHpm(:,:,:,:,i1,i2) = cplhhhhHpmcHpm
ddcplhhhhSdcSd(:,:,:,:,i1,i2) = cplhhhhSdcSd
ddcplhhhhSecSe(:,:,:,:,i1,i2) = cplhhhhSecSe
ddcplhhhhSucSu(:,:,:,:,i1,i2) = cplhhhhSucSu
ddcplhhhhSvcSv(:,:,:,:,i1,i2) = cplhhhhSvcSv
ddcplHpmHpmcHpmcHpm(:,:,:,:,i1,i2) = cplHpmHpmcHpmcHpm
ddcplHpmSdcHpmcSd(:,:,:,:,i1,i2) = cplHpmSdcHpmcSd
ddcplHpmSecHpmcSe(:,:,:,:,i1,i2) = cplHpmSecHpmcSe
ddcplHpmSucHpmcSu(:,:,:,:,i1,i2) = cplHpmSucHpmcSu
ddcplHpmSvcHpmcSv(:,:,:,:,i1,i2) = cplHpmSvcHpmcSv
ddcplSdSdcSdcSd(:,:,:,:,i1,i2) = cplSdSdcSdcSd
ddcplSdSecSdcSe(:,:,:,:,i1,i2) = cplSdSecSdcSe
ddcplSdSucSdcSu(:,:,:,:,i1,i2) = cplSdSucSdcSu
ddcplSeSecSecSe(:,:,:,:,i1,i2) = cplSeSecSecSe
ddcplSeSvcSecSv(:,:,:,:,i1,i2) = cplSeSvcSecSv
ddcplSuSucSucSu(:,:,:,:,i1,i2) = cplSuSucSucSu
ddcplSuSvcSucSv(:,:,:,:,i1,i2) = cplSuSvcSucSv
ddcplSvSvcSvcSv(:,:,:,:,i1,i2) = cplSvSvcSvcSv
ddcplSdcSdVGVG(:,:,i1,i2) = cplSdcSdVGVG
ddcplSucSuVGVG(:,:,i1,i2) = cplSucSuVGVG
  End Do 
 End Do 
 
Call TreeMassesEffPot(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,            & 
& g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,             & 
& mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

Call CouplingsForEffPot3(lam,Tlam,kap,Tk,ZA,vd,vu,vS,vS1,vS2,vS3,ZH,ZP,               & 
& Yd,Td,ZD,Ye,Te,ZE,Yu,Tu,ZU,Yv,Tv,ZV,g3,UM,UP,ZN,ZDL,ZDR,ZEL,ZER,ZUL,ZUR,               & 
& ZVL,ZVR,pG,cplAhAhAh,cplAhAhhh,cplAhhhhh,cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,           & 
& cplAhSucSu,cplAhSvcSv,cplhhhhhh,cplhhHpmcHpm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,         & 
& cplhhSvcSv,cplHpmSucSd,cplHpmSvcSe,cplSdcHpmcSu,cplSecHpmcSv,cplSdcSdVG,               & 
& cplSucSuVG,cplVGVGVG,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFvFvAhL,cplcFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,cplChaFucSdL,cplChaFucSdR,       & 
& cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,       & 
& cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,         & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,       & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFdGluSdL,cplcFdGluSdR,           & 
& cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,     & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplGluGluVGL,cplGluGluVGR)

Call CouplingsForEffPot4(lam,kap,ZA,ZH,ZP,Yd,ZD,Ye,ZE,Yu,ZU,Yv,ZV,g3,cplAhAhAhAh,     & 
& cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvcSv,        & 
& cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvcSv,        & 
& cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvcHpmcSv,     & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSeSecSecSe,cplSeSvcSecSv,cplSuSucSucSu,   & 
& cplSuSvcSucSv,cplSvSvcSvcSv,cplSdcSdVGVG,cplSucSuVGVG)



!! ------------------------------------------------- 
!! Calculate derivative of effective potential      
!! ------------------------------------------------- 



Q2 = getRenormalizationScale()
Do iv1=1,6
  Do iv2=iv1,6
    result = ZeroC
    result_ti = ZeroC
    results1 = ZeroC
    results1_ti = ZeroC
    results2 = ZeroC
    results2_ti = ZeroC


! ----- Topology1 (sunrise): diagrams w. 3 Particles and 2 Vertices


! ----- diagrams of type SSS, 16 ------ 

! ---- Ah,Ah,Ah ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhAhAh(i1,i2,i3)
coup2 = cplAhAhAh(i1,i2,i3)
Di_coup1 = dcplAhAhAh(i1,i2,i3,iv1)
Dj_coup1 = dcplAhAhAh(i1,i2,i3,iv2)
DDcoup1 = ddcplAhAhAh(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MAh2(i2),MAh2(i3),dMAh2(i1,iv1)            & 
& ,dMAh2(i2,iv1),dMAh2(i3,iv1),dMAh2(i1,iv2),dMAh2(i2,iv2),dMAh2(i3,iv2),ddMAh2(i1,iv1,iv2)& 
& ,ddMAh2(i2,iv1,iv2),ddMAh2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 1._dp/12._dp
colorfactor = 1
results1(1)=results1(1) + coeff*colorfactor*temp
results1_ti(1)=results1_ti(1) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(1).eq.results1(1)))  write(*,*) 'NaN at SSS C[Ah, Ah, Ah]' 
! ---- Ah,Ah,hh ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhAhhh(i1,i2,i3)
coup2 = cplAhAhhh(i1,i2,i3)
Di_coup1 = dcplAhAhhh(i1,i2,i3,iv1)
Dj_coup1 = dcplAhAhhh(i1,i2,i3,iv2)
DDcoup1 = ddcplAhAhhh(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MAh2(i2),Mhh2(i3),dMAh2(i1,iv1)            & 
& ,dMAh2(i2,iv1),dMhh2(i3,iv1),dMAh2(i1,iv2),dMAh2(i2,iv2),dMhh2(i3,iv2),ddMAh2(i1,iv1,iv2)& 
& ,ddMAh2(i2,iv1,iv2),ddMhh2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.25_dp
colorfactor = 1
results1(2)=results1(2) + coeff*colorfactor*temp
results1_ti(2)=results1_ti(2) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(2).eq.results1(2)))  write(*,*) 'NaN at SSS C[Ah, Ah, hh]' 
! ---- Ah,hh,hh ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhhhhh(i1,i2,i3)
coup2 = cplAhhhhh(i1,i2,i3)
Di_coup1 = dcplAhhhhh(i1,i2,i3,iv1)
Dj_coup1 = dcplAhhhhh(i1,i2,i3,iv2)
DDcoup1 = ddcplAhhhhh(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),Mhh2(i2),Mhh2(i3),dMAh2(i1,iv1)            & 
& ,dMhh2(i2,iv1),dMhh2(i3,iv1),dMAh2(i1,iv2),dMhh2(i2,iv2),dMhh2(i3,iv2),ddMAh2(i1,iv1,iv2)& 
& ,ddMhh2(i2,iv1,iv2),ddMhh2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.25_dp
colorfactor = 1
results1(3)=results1(3) + coeff*colorfactor*temp
results1_ti(3)=results1_ti(3) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(3).eq.results1(3)))  write(*,*) 'NaN at SSS C[Ah, hh, hh]' 
! ---- Ah,Hpm,conj[Hpm] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,2
coup1 = cplAhHpmcHpm(i1,i2,i3)
coup2 = cplAhHpmcHpm(i1,i3,i2)
Di_coup1 = dcplAhHpmcHpm(i1,i2,i3,iv1)
Dj_coup1 = dcplAhHpmcHpm(i1,i2,i3,iv2)
DDcoup1 = ddcplAhHpmcHpm(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MHpm2(i2),MHpm2(i3),dMAh2(i1,iv1)          & 
& ,dMHpm2(i2,iv1),dMHpm2(i3,iv1),dMAh2(i1,iv2),dMHpm2(i2,iv2),dMHpm2(i3,iv2)             & 
& ,ddMAh2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),ddMHpm2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 1
results1(4)=results1(4) + coeff*colorfactor*temp
results1_ti(4)=results1_ti(4) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(4).eq.results1(4)))  write(*,*) 'NaN at SSS C[Ah, Hpm, conj[Hpm]]' 
! ---- Ah,Sd,conj[Sd] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSdcSd(i1,i2,i3)
coup2 = cplAhSdcSd(i1,i3,i2)
Di_coup1 = dcplAhSdcSd(i1,i2,i3,iv1)
Dj_coup1 = dcplAhSdcSd(i1,i2,i3,iv2)
DDcoup1 = ddcplAhSdcSd(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MSd2(i2),MSd2(i3),dMAh2(i1,iv1)            & 
& ,dMSd2(i2,iv1),dMSd2(i3,iv1),dMAh2(i1,iv2),dMSd2(i2,iv2),dMSd2(i3,iv2),ddMAh2(i1,iv1,iv2)& 
& ,ddMSd2(i2,iv1,iv2),ddMSd2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 3
results1(5)=results1(5) + coeff*colorfactor*temp
results1_ti(5)=results1_ti(5) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(5).eq.results1(5)))  write(*,*) 'NaN at SSS C[Ah, Sd, conj[Sd]]' 
! ---- Ah,Se,conj[Se] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSecSe(i1,i2,i3)
coup2 = cplAhSecSe(i1,i3,i2)
Di_coup1 = dcplAhSecSe(i1,i2,i3,iv1)
Dj_coup1 = dcplAhSecSe(i1,i2,i3,iv2)
DDcoup1 = ddcplAhSecSe(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MSe2(i2),MSe2(i3),dMAh2(i1,iv1)            & 
& ,dMSe2(i2,iv1),dMSe2(i3,iv1),dMAh2(i1,iv2),dMSe2(i2,iv2),dMSe2(i3,iv2),ddMAh2(i1,iv1,iv2)& 
& ,ddMSe2(i2,iv1,iv2),ddMSe2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 1
results1(6)=results1(6) + coeff*colorfactor*temp
results1_ti(6)=results1_ti(6) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(6).eq.results1(6)))  write(*,*) 'NaN at SSS C[Ah, Se, conj[Se]]' 
! ---- Ah,Su,conj[Su] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSucSu(i1,i2,i3)
coup2 = cplAhSucSu(i1,i3,i2)
Di_coup1 = dcplAhSucSu(i1,i2,i3,iv1)
Dj_coup1 = dcplAhSucSu(i1,i2,i3,iv2)
DDcoup1 = ddcplAhSucSu(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MSu2(i2),MSu2(i3),dMAh2(i1,iv1)            & 
& ,dMSu2(i2,iv1),dMSu2(i3,iv1),dMAh2(i1,iv2),dMSu2(i2,iv2),dMSu2(i3,iv2),ddMAh2(i1,iv1,iv2)& 
& ,ddMSu2(i2,iv1,iv2),ddMSu2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 3
results1(7)=results1(7) + coeff*colorfactor*temp
results1_ti(7)=results1_ti(7) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(7).eq.results1(7)))  write(*,*) 'NaN at SSS C[Ah, Su, conj[Su]]' 
! ---- Ah,Sv,conj[Sv] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSvcSv(i1,i2,i3)
coup2 = cplAhSvcSv(i1,i3,i2)
Di_coup1 = dcplAhSvcSv(i1,i2,i3,iv1)
Dj_coup1 = dcplAhSvcSv(i1,i2,i3,iv2)
DDcoup1 = ddcplAhSvcSv(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MAh2(i1),MSv2(i2),MSv2(i3),dMAh2(i1,iv1)            & 
& ,dMSv2(i2,iv1),dMSv2(i3,iv1),dMAh2(i1,iv2),dMSv2(i2,iv2),dMSv2(i3,iv2),ddMAh2(i1,iv1,iv2)& 
& ,ddMSv2(i2,iv1,iv2),ddMSv2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 1
results1(8)=results1(8) + coeff*colorfactor*temp
results1_ti(8)=results1_ti(8) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(8).eq.results1(8)))  write(*,*) 'NaN at SSS C[Ah, Sv, conj[Sv]]' 
! ---- hh,hh,hh ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhhhhh(i1,i2,i3)
coup2 = cplhhhhhh(i1,i2,i3)
Di_coup1 = dcplhhhhhh(i1,i2,i3,iv1)
Dj_coup1 = dcplhhhhhh(i1,i2,i3,iv2)
DDcoup1 = ddcplhhhhhh(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(Mhh2(i1),Mhh2(i2),Mhh2(i3),dMhh2(i1,iv1)            & 
& ,dMhh2(i2,iv1),dMhh2(i3,iv1),dMhh2(i1,iv2),dMhh2(i2,iv2),dMhh2(i3,iv2),ddMhh2(i1,iv1,iv2)& 
& ,ddMhh2(i2,iv1,iv2),ddMhh2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 1._dp/12._dp
colorfactor = 1
results1(9)=results1(9) + coeff*colorfactor*temp
results1_ti(9)=results1_ti(9) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(9).eq.results1(9)))  write(*,*) 'NaN at SSS C[hh, hh, hh]' 
! ---- hh,Hpm,conj[Hpm] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,2
coup1 = cplhhHpmcHpm(i1,i2,i3)
coup2 = cplhhHpmcHpm(i1,i3,i2)
Di_coup1 = dcplhhHpmcHpm(i1,i2,i3,iv1)
Dj_coup1 = dcplhhHpmcHpm(i1,i2,i3,iv2)
DDcoup1 = ddcplhhHpmcHpm(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(Mhh2(i1),MHpm2(i2),MHpm2(i3),dMhh2(i1,iv1)          & 
& ,dMHpm2(i2,iv1),dMHpm2(i3,iv1),dMhh2(i1,iv2),dMHpm2(i2,iv2),dMHpm2(i3,iv2)             & 
& ,ddMhh2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),ddMHpm2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 1
results1(10)=results1(10) + coeff*colorfactor*temp
results1_ti(10)=results1_ti(10) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(10).eq.results1(10)))  write(*,*) 'NaN at SSS C[hh, Hpm, conj[Hpm]]' 
! ---- hh,Sd,conj[Sd] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSdcSd(i1,i2,i3)
coup2 = cplhhSdcSd(i1,i3,i2)
Di_coup1 = dcplhhSdcSd(i1,i2,i3,iv1)
Dj_coup1 = dcplhhSdcSd(i1,i2,i3,iv2)
DDcoup1 = ddcplhhSdcSd(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(Mhh2(i1),MSd2(i2),MSd2(i3),dMhh2(i1,iv1)            & 
& ,dMSd2(i2,iv1),dMSd2(i3,iv1),dMhh2(i1,iv2),dMSd2(i2,iv2),dMSd2(i3,iv2),ddMhh2(i1,iv1,iv2)& 
& ,ddMSd2(i2,iv1,iv2),ddMSd2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 3
results1(11)=results1(11) + coeff*colorfactor*temp
results1_ti(11)=results1_ti(11) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(11).eq.results1(11)))  write(*,*) 'NaN at SSS C[hh, Sd, conj[Sd]]' 
! ---- hh,Se,conj[Se] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSecSe(i1,i2,i3)
coup2 = cplhhSecSe(i1,i3,i2)
Di_coup1 = dcplhhSecSe(i1,i2,i3,iv1)
Dj_coup1 = dcplhhSecSe(i1,i2,i3,iv2)
DDcoup1 = ddcplhhSecSe(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(Mhh2(i1),MSe2(i2),MSe2(i3),dMhh2(i1,iv1)            & 
& ,dMSe2(i2,iv1),dMSe2(i3,iv1),dMhh2(i1,iv2),dMSe2(i2,iv2),dMSe2(i3,iv2),ddMhh2(i1,iv1,iv2)& 
& ,ddMSe2(i2,iv1,iv2),ddMSe2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 1
results1(12)=results1(12) + coeff*colorfactor*temp
results1_ti(12)=results1_ti(12) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(12).eq.results1(12)))  write(*,*) 'NaN at SSS C[hh, Se, conj[Se]]' 
! ---- hh,Su,conj[Su] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSucSu(i1,i2,i3)
coup2 = cplhhSucSu(i1,i3,i2)
Di_coup1 = dcplhhSucSu(i1,i2,i3,iv1)
Dj_coup1 = dcplhhSucSu(i1,i2,i3,iv2)
DDcoup1 = ddcplhhSucSu(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(Mhh2(i1),MSu2(i2),MSu2(i3),dMhh2(i1,iv1)            & 
& ,dMSu2(i2,iv1),dMSu2(i3,iv1),dMhh2(i1,iv2),dMSu2(i2,iv2),dMSu2(i3,iv2),ddMhh2(i1,iv1,iv2)& 
& ,ddMSu2(i2,iv1,iv2),ddMSu2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 3
results1(13)=results1(13) + coeff*colorfactor*temp
results1_ti(13)=results1_ti(13) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(13).eq.results1(13)))  write(*,*) 'NaN at SSS C[hh, Su, conj[Su]]' 
! ---- hh,Sv,conj[Sv] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSvcSv(i1,i2,i3)
coup2 = cplhhSvcSv(i1,i3,i2)
Di_coup1 = dcplhhSvcSv(i1,i2,i3,iv1)
Dj_coup1 = dcplhhSvcSv(i1,i2,i3,iv2)
DDcoup1 = ddcplhhSvcSv(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(Mhh2(i1),MSv2(i2),MSv2(i3),dMhh2(i1,iv1)            & 
& ,dMSv2(i2,iv1),dMSv2(i3,iv1),dMhh2(i1,iv2),dMSv2(i2,iv2),dMSv2(i3,iv2),ddMhh2(i1,iv1,iv2)& 
& ,ddMSv2(i2,iv1,iv2),ddMSv2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 1
results1(14)=results1(14) + coeff*colorfactor*temp
results1_ti(14)=results1_ti(14) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(14).eq.results1(14)))  write(*,*) 'NaN at SSS C[hh, Sv, conj[Sv]]' 
! ---- Sd,conj[Hpm],conj[Su] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,6
coup1 = cplSdcHpmcSu(i1,i2,i3)
coup2 = cplHpmSucSd(i2,i3,i1)
Di_coup1 = dcplSdcHpmcSu(i1,i2,i3,iv1)
Dj_coup1 = dcplSdcHpmcSu(i1,i2,i3,iv2)
DDcoup1 = ddcplSdcHpmcSu(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MSd2(i1),MHpm2(i2),MSu2(i3),dMSd2(i1,iv1)           & 
& ,dMHpm2(i2,iv1),dMSu2(i3,iv1),dMSd2(i1,iv2),dMHpm2(i2,iv2),dMSu2(i3,iv2)               & 
& ,ddMSd2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),ddMSu2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 1._dp
colorfactor = 3
results1(15)=results1(15) + coeff*colorfactor*temp
results1_ti(15)=results1_ti(15) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(15).eq.results1(15)))  write(*,*) 'NaN at SSS C[Sd, conj[Hpm], conj[Su]]' 
! ---- Se,conj[Hpm],conj[Sv] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,6
coup1 = cplSecHpmcSv(i1,i2,i3)
coup2 = cplHpmSvcSe(i2,i3,i1)
Di_coup1 = dcplSecHpmcSv(i1,i2,i3,iv1)
Dj_coup1 = dcplSecHpmcSv(i1,i2,i3,iv2)
DDcoup1 = ddcplSecHpmcSv(i1,i2,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MSe2(i1),MHpm2(i2),MSv2(i3),dMSe2(i1,iv1)           & 
& ,dMHpm2(i2,iv1),dMSv2(i3,iv1),dMSe2(i1,iv2),dMHpm2(i2,iv2),dMSv2(i3,iv2)               & 
& ,ddMSe2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),ddMSv2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'SSS   ',Q2,temp,temp_ti,temp_tj)
coeff = 1._dp
colorfactor = 1
results1(16)=results1(16) + coeff*colorfactor*temp
results1_ti(16)=results1_ti(16) + coeff*colorfactor*temp_ti
    End Do
  End Do
End Do
if (.not.(results1(16).eq.results1(16)))  write(*,*) 'NaN at SSS C[Se, conj[Hpm], conj[Sv]]' 

! ----- diagrams of type FFS, 25 ------ 

! ---- Ah,Cha,bar[Cha] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,2
coup1L = cplcChaChaAhL(i3,i2,i1)
coup1R = cplcChaChaAhR(i3,i2,i1)
coup2L = cplcChaChaAhL(i2,i3,i1)
coup2R = cplcChaChaAhR(i2,i3,i1)
Di_coup1L = dcplcChaChaAhL(i3,i2,i1,iv1)
Di_coup1R = dcplcChaChaAhR(i3,i2,i1,iv1)
Dj_coup1L = dcplcChaChaAhL(i3,i2,i1,iv2)
Dj_coup1R = dcplcChaChaAhR(i3,i2,i1,iv2)
DDcoup1L = ddcplcChaChaAhL(i3,i2,i1,iv1,iv2)
DDcoup1R = ddcplcChaChaAhR(i3,i2,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MCha2(i3),MCha2(i2),MAh2(i1),dMCha2(i3,iv1)         & 
& ,dMCha2(i2,iv1),dMAh2(i1,iv1),dMCha2(i3,iv2),dMCha2(i2,iv2),dMAh2(i1,iv2)              & 
& ,ddMCha2(i3,iv1,iv2),ddMCha2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MCha2(i3),MCha2(i2),MAh2(i1),dMCha2(i3,iv1)         & 
& ,dMCha2(i2,iv1),dMAh2(i1,iv1),dMCha2(i3,iv2),dMCha2(i2,iv2),dMAh2(i1,iv2)              & 
& ,ddMCha2(i3,iv1,iv2),ddMCha2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 1
results1(17)=results1(17) + coeff*colorfactor*temp
results1_ti(17)=results1_ti(17) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(17)=results1(17) + coeffbar*colorfactor*tempbar
results1_ti(17)=results1_ti(17) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(17).eq.results1(17)))  write(*,*) 'NaN at FFS C[Ah, Cha, bar[Cha]]' 
! ---- Ah,Chi,Chi ----
Do i1=1,6
 Do i2=1,9
    Do i3=1,9
coup1L = cplChiChiAhL(i2,i3,i1)
coup1R = cplChiChiAhR(i2,i3,i1)
coup2L = cplChiChiAhL(i2,i3,i1)
coup2R = cplChiChiAhR(i2,i3,i1)
Di_coup1L = dcplChiChiAhL(i2,i3,i1,iv1)
Di_coup1R = dcplChiChiAhR(i2,i3,i1,iv1)
Dj_coup1L = dcplChiChiAhL(i2,i3,i1,iv2)
Dj_coup1R = dcplChiChiAhR(i2,i3,i1,iv2)
DDcoup1L = ddcplChiChiAhL(i2,i3,i1,iv1,iv2)
DDcoup1R = ddcplChiChiAhR(i2,i3,i1,iv1,iv2)
coupx = abs(coup1L)**2
Di_coupx=Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) 
Dj_coupx=Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L)  
Call SecondDerivativeVeff_sunrise(MChi2(i3),MChi2(i2),MAh2(i1),dMChi2(i3,iv1)         & 
& ,dMChi2(i2,iv1),dMAh2(i1,iv1),dMChi2(i3,iv2),dMChi2(i2,iv2),dMAh2(i1,iv2)              & 
& ,ddMChi2(i3,iv1,iv2),ddMChi2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = Real(coup1L**2,dp) 
Di_coupxbar = Real(2*Di_coup1L*coup1L,dp) 
Dj_coupxbar = Real(2*Dj_coup1L*coup1L,dp) 
DDcoupxbar = Real(2*DDcoup1L*coup1L + 2*Di_coup1L*Dj_coup1L,dp) 
Call SecondDerivativeVeff_sunrise(MChi2(i3),MChi2(i2),MAh2(i1),dMChi2(i3,iv1)         & 
& ,dMChi2(i2,iv1),dMAh2(i1,iv1),dMChi2(i3,iv2),dMChi2(i2,iv2),dMAh2(i1,iv2)              & 
& ,ddMChi2(i3,iv1,iv2),ddMChi2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 1
results1(18)=results1(18) + coeff*colorfactor*temp
results1_ti(18)=results1_ti(18) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(18)=results1(18) + coeffbar*colorfactor*tempbar
results1_ti(18)=results1_ti(18) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(18).eq.results1(18)))  write(*,*) 'NaN at FFS C[Ah, Chi, Chi]' 
! ---- Ah,Fd,bar[Fd] ----
Do i1=1,6
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFdFdAhL(i3,i2,i1)
coup1R = cplcFdFdAhR(i3,i2,i1)
coup2L = cplcFdFdAhL(i2,i3,i1)
coup2R = cplcFdFdAhR(i2,i3,i1)
Di_coup1L = dcplcFdFdAhL(i3,i2,i1,iv1)
Di_coup1R = dcplcFdFdAhR(i3,i2,i1,iv1)
Dj_coup1L = dcplcFdFdAhL(i3,i2,i1,iv2)
Dj_coup1R = dcplcFdFdAhR(i3,i2,i1,iv2)
DDcoup1L = ddcplcFdFdAhL(i3,i2,i1,iv1,iv2)
DDcoup1R = ddcplcFdFdAhR(i3,i2,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFd2(i2),MAh2(i1),dMFd2(i3,iv1)            & 
& ,dMFd2(i2,iv1),dMAh2(i1,iv1),dMFd2(i3,iv2),dMFd2(i2,iv2),dMAh2(i1,iv2),ddMFd2(i3,iv1,iv2)& 
& ,ddMFd2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFd2(i2),MAh2(i1),dMFd2(i3,iv1)            & 
& ,dMFd2(i2,iv1),dMAh2(i1,iv1),dMFd2(i3,iv2),dMFd2(i2,iv2),dMAh2(i1,iv2),ddMFd2(i3,iv1,iv2)& 
& ,ddMFd2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 3
results1(19)=results1(19) + coeff*colorfactor*temp
results1_ti(19)=results1_ti(19) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(19)=results1(19) + coeffbar*colorfactor*tempbar
results1_ti(19)=results1_ti(19) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(19).eq.results1(19)))  write(*,*) 'NaN at FFS C[Ah, Fd, bar[Fd]]' 
! ---- Ah,Fe,bar[Fe] ----
Do i1=1,6
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFeFeAhL(i3,i2,i1)
coup1R = cplcFeFeAhR(i3,i2,i1)
coup2L = cplcFeFeAhL(i2,i3,i1)
coup2R = cplcFeFeAhR(i2,i3,i1)
Di_coup1L = dcplcFeFeAhL(i3,i2,i1,iv1)
Di_coup1R = dcplcFeFeAhR(i3,i2,i1,iv1)
Dj_coup1L = dcplcFeFeAhL(i3,i2,i1,iv2)
Dj_coup1R = dcplcFeFeAhR(i3,i2,i1,iv2)
DDcoup1L = ddcplcFeFeAhL(i3,i2,i1,iv1,iv2)
DDcoup1R = ddcplcFeFeAhR(i3,i2,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFe2(i3),MFe2(i2),MAh2(i1),dMFe2(i3,iv1)            & 
& ,dMFe2(i2,iv1),dMAh2(i1,iv1),dMFe2(i3,iv2),dMFe2(i2,iv2),dMAh2(i1,iv2),ddMFe2(i3,iv1,iv2)& 
& ,ddMFe2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFe2(i3),MFe2(i2),MAh2(i1),dMFe2(i3,iv1)            & 
& ,dMFe2(i2,iv1),dMAh2(i1,iv1),dMFe2(i3,iv2),dMFe2(i2,iv2),dMAh2(i1,iv2),ddMFe2(i3,iv1,iv2)& 
& ,ddMFe2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 1
results1(20)=results1(20) + coeff*colorfactor*temp
results1_ti(20)=results1_ti(20) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(20)=results1(20) + coeffbar*colorfactor*tempbar
results1_ti(20)=results1_ti(20) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(20).eq.results1(20)))  write(*,*) 'NaN at FFS C[Ah, Fe, bar[Fe]]' 
! ---- Ah,Fu,bar[Fu] ----
Do i1=1,6
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFuFuAhL(i3,i2,i1)
coup1R = cplcFuFuAhR(i3,i2,i1)
coup2L = cplcFuFuAhL(i2,i3,i1)
coup2R = cplcFuFuAhR(i2,i3,i1)
Di_coup1L = dcplcFuFuAhL(i3,i2,i1,iv1)
Di_coup1R = dcplcFuFuAhR(i3,i2,i1,iv1)
Dj_coup1L = dcplcFuFuAhL(i3,i2,i1,iv2)
Dj_coup1R = dcplcFuFuAhR(i3,i2,i1,iv2)
DDcoup1L = ddcplcFuFuAhL(i3,i2,i1,iv1,iv2)
DDcoup1R = ddcplcFuFuAhR(i3,i2,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFu2(i3),MFu2(i2),MAh2(i1),dMFu2(i3,iv1)            & 
& ,dMFu2(i2,iv1),dMAh2(i1,iv1),dMFu2(i3,iv2),dMFu2(i2,iv2),dMAh2(i1,iv2),ddMFu2(i3,iv1,iv2)& 
& ,ddMFu2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFu2(i3),MFu2(i2),MAh2(i1),dMFu2(i3,iv1)            & 
& ,dMFu2(i2,iv1),dMAh2(i1,iv1),dMFu2(i3,iv2),dMFu2(i2,iv2),dMAh2(i1,iv2),ddMFu2(i3,iv1,iv2)& 
& ,ddMFu2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 3
results1(21)=results1(21) + coeff*colorfactor*temp
results1_ti(21)=results1_ti(21) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(21)=results1(21) + coeffbar*colorfactor*tempbar
results1_ti(21)=results1_ti(21) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(21).eq.results1(21)))  write(*,*) 'NaN at FFS C[Ah, Fu, bar[Fu]]' 
! ---- Ah,Fv,bar[Fv] ----
Do i1=1,6
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFvFvAhL(i3,i2,i1)
coup1R = cplcFvFvAhR(i3,i2,i1)
coup2L = cplcFvFvAhL(i2,i3,i1)
coup2R = cplcFvFvAhR(i2,i3,i1)
Di_coup1L = dcplcFvFvAhL(i3,i2,i1,iv1)
Di_coup1R = dcplcFvFvAhR(i3,i2,i1,iv1)
Dj_coup1L = dcplcFvFvAhL(i3,i2,i1,iv2)
Dj_coup1R = dcplcFvFvAhR(i3,i2,i1,iv2)
DDcoup1L = ddcplcFvFvAhL(i3,i2,i1,iv1,iv2)
DDcoup1R = ddcplcFvFvAhR(i3,i2,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFv2(i3),MFv2(i2),MAh2(i1),dMFv2(i3,iv1)            & 
& ,dMFv2(i2,iv1),dMAh2(i1,iv1),dMFv2(i3,iv2),dMFv2(i2,iv2),dMAh2(i1,iv2),ddMFv2(i3,iv1,iv2)& 
& ,ddMFv2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFv2(i3),MFv2(i2),MAh2(i1),dMFv2(i3,iv1)            & 
& ,dMFv2(i2,iv1),dMAh2(i1,iv1),dMFv2(i3,iv2),dMFv2(i2,iv2),dMAh2(i1,iv2),ddMFv2(i3,iv1,iv2)& 
& ,ddMFv2(i2,iv1,iv2),ddMAh2(i1,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 1
results1(22)=results1(22) + coeff*colorfactor*temp
results1_ti(22)=results1_ti(22) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(22)=results1(22) + coeffbar*colorfactor*tempbar
results1_ti(22)=results1_ti(22) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(22).eq.results1(22)))  write(*,*) 'NaN at FFS C[Ah, Fv, bar[Fv]]' 
! ---- Cha,hh,bar[Cha] ----
Do i1=1,2
 Do i2=1,6
    Do i3=1,2
coup1L = cplcChaChahhL(i3,i1,i2)
coup1R = cplcChaChahhR(i3,i1,i2)
coup2L = cplcChaChahhL(i1,i3,i2)
coup2R = cplcChaChahhR(i1,i3,i2)
Di_coup1L = dcplcChaChahhL(i3,i1,i2,iv1)
Di_coup1R = dcplcChaChahhR(i3,i1,i2,iv1)
Dj_coup1L = dcplcChaChahhL(i3,i1,i2,iv2)
Dj_coup1R = dcplcChaChahhR(i3,i1,i2,iv2)
DDcoup1L = ddcplcChaChahhL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcChaChahhR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MCha2(i3),MCha2(i1),Mhh2(i2),dMCha2(i3,iv1)         & 
& ,dMCha2(i1,iv1),dMhh2(i2,iv1),dMCha2(i3,iv2),dMCha2(i1,iv2),dMhh2(i2,iv2)              & 
& ,ddMCha2(i3,iv1,iv2),ddMCha2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MCha2(i3),MCha2(i1),Mhh2(i2),dMCha2(i3,iv1)         & 
& ,dMCha2(i1,iv1),dMhh2(i2,iv1),dMCha2(i3,iv2),dMCha2(i1,iv2),dMhh2(i2,iv2)              & 
& ,ddMCha2(i3,iv1,iv2),ddMCha2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 1
results1(23)=results1(23) + coeff*colorfactor*temp
results1_ti(23)=results1_ti(23) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(23)=results1(23) + coeffbar*colorfactor*tempbar
results1_ti(23)=results1_ti(23) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(23).eq.results1(23)))  write(*,*) 'NaN at FFS C[Cha, hh, bar[Cha]]' 
! ---- Chi,Chi,hh ----
Do i1=1,9
 Do i2=1,9
    Do i3=1,6
coup1L = cplChiChihhL(i1,i2,i3)
coup1R = cplChiChihhR(i1,i2,i3)
coup2L = cplChiChihhL(i1,i2,i3)
coup2R = cplChiChihhR(i1,i2,i3)
Di_coup1L = dcplChiChihhL(i1,i2,i3,iv1)
Di_coup1R = dcplChiChihhR(i1,i2,i3,iv1)
Dj_coup1L = dcplChiChihhL(i1,i2,i3,iv2)
Dj_coup1R = dcplChiChihhR(i1,i2,i3,iv2)
DDcoup1L = ddcplChiChihhL(i1,i2,i3,iv1,iv2)
DDcoup1R = ddcplChiChihhR(i1,i2,i3,iv1,iv2)
coupx = abs(coup1L)**2
Di_coupx=Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) 
Dj_coupx=Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L)  
Call SecondDerivativeVeff_sunrise(MChi2(i2),MChi2(i1),Mhh2(i3),dMChi2(i2,iv1)         & 
& ,dMChi2(i1,iv1),dMhh2(i3,iv1),dMChi2(i2,iv2),dMChi2(i1,iv2),dMhh2(i3,iv2)              & 
& ,ddMChi2(i2,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMhh2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = Real(coup1L**2,dp) 
Di_coupxbar = Real(2*Di_coup1L*coup1L,dp) 
Dj_coupxbar = Real(2*Dj_coup1L*coup1L,dp) 
DDcoupxbar = Real(2*DDcoup1L*coup1L + 2*Di_coup1L*Dj_coup1L,dp) 
Call SecondDerivativeVeff_sunrise(MChi2(i2),MChi2(i1),Mhh2(i3),dMChi2(i2,iv1)         & 
& ,dMChi2(i1,iv1),dMhh2(i3,iv1),dMChi2(i2,iv2),dMChi2(i1,iv2),dMhh2(i3,iv2)              & 
& ,ddMChi2(i2,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMhh2(i3,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 1
results1(24)=results1(24) + coeff*colorfactor*temp
results1_ti(24)=results1_ti(24) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(24)=results1(24) + coeffbar*colorfactor*tempbar
results1_ti(24)=results1_ti(24) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(24).eq.results1(24)))  write(*,*) 'NaN at FFS C[Chi, Chi, hh]' 
! ---- Chi,Hpm,bar[Cha] ----
Do i1=1,9
 Do i2=1,2
    Do i3=1,2
coup1L = cplcChaChiHpmL(i3,i1,i2)
coup1R = cplcChaChiHpmR(i3,i1,i2)
coup2L = cplChiChacHpmL(i1,i3,i2)
coup2R = cplChiChacHpmR(i1,i3,i2)
Di_coup1L = dcplcChaChiHpmL(i3,i1,i2,iv1)
Di_coup1R = dcplcChaChiHpmR(i3,i1,i2,iv1)
Dj_coup1L = dcplcChaChiHpmL(i3,i1,i2,iv2)
Dj_coup1R = dcplcChaChiHpmR(i3,i1,i2,iv2)
DDcoup1L = ddcplcChaChiHpmL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcChaChiHpmR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MCha2(i3),MChi2(i1),MHpm2(i2),dMCha2(i3,iv1)        & 
& ,dMChi2(i1,iv1),dMHpm2(i2,iv1),dMCha2(i3,iv2),dMChi2(i1,iv2),dMHpm2(i2,iv2)            & 
& ,ddMCha2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MCha2(i3),MChi2(i1),MHpm2(i2),dMCha2(i3,iv1)        & 
& ,dMChi2(i1,iv1),dMHpm2(i2,iv1),dMCha2(i3,iv2),dMChi2(i1,iv2),dMHpm2(i2,iv2)            & 
& ,ddMCha2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 1
results1(25)=results1(25) + coeff*colorfactor*temp
results1_ti(25)=results1_ti(25) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(25)=results1(25) + coeffbar*colorfactor*tempbar
results1_ti(25)=results1_ti(25) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(25).eq.results1(25)))  write(*,*) 'NaN at FFS C[Chi, Hpm, bar[Cha]]' 
! ---- Chi,Sd,bar[Fd] ----
Do i1=1,9
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFdChiSdL(i3,i1,i2)
coup1R = cplcFdChiSdR(i3,i1,i2)
coup2L = cplChiFdcSdL(i1,i3,i2)
coup2R = cplChiFdcSdR(i1,i3,i2)
Di_coup1L = dcplcFdChiSdL(i3,i1,i2,iv1)
Di_coup1R = dcplcFdChiSdR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFdChiSdL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFdChiSdR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFdChiSdL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFdChiSdR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFd2(i3),MChi2(i1),MSd2(i2),dMFd2(i3,iv1)           & 
& ,dMChi2(i1,iv1),dMSd2(i2,iv1),dMFd2(i3,iv2),dMChi2(i1,iv2),dMSd2(i2,iv2)               & 
& ,ddMFd2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSd2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFd2(i3),MChi2(i1),MSd2(i2),dMFd2(i3,iv1)           & 
& ,dMChi2(i1,iv1),dMSd2(i2,iv1),dMFd2(i3,iv2),dMChi2(i1,iv2),dMSd2(i2,iv2)               & 
& ,ddMFd2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSd2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 3
results1(26)=results1(26) + coeff*colorfactor*temp
results1_ti(26)=results1_ti(26) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(26)=results1(26) + coeffbar*colorfactor*tempbar
results1_ti(26)=results1_ti(26) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(26).eq.results1(26)))  write(*,*) 'NaN at FFS C[Chi, Sd, bar[Fd]]' 
! ---- Chi,Se,bar[Fe] ----
Do i1=1,9
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFeChiSeL(i3,i1,i2)
coup1R = cplcFeChiSeR(i3,i1,i2)
coup2L = cplChiFecSeL(i1,i3,i2)
coup2R = cplChiFecSeR(i1,i3,i2)
Di_coup1L = dcplcFeChiSeL(i3,i1,i2,iv1)
Di_coup1R = dcplcFeChiSeR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFeChiSeL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFeChiSeR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFeChiSeL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFeChiSeR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFe2(i3),MChi2(i1),MSe2(i2),dMFe2(i3,iv1)           & 
& ,dMChi2(i1,iv1),dMSe2(i2,iv1),dMFe2(i3,iv2),dMChi2(i1,iv2),dMSe2(i2,iv2)               & 
& ,ddMFe2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFe2(i3),MChi2(i1),MSe2(i2),dMFe2(i3,iv1)           & 
& ,dMChi2(i1,iv1),dMSe2(i2,iv1),dMFe2(i3,iv2),dMChi2(i1,iv2),dMSe2(i2,iv2)               & 
& ,ddMFe2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 1
results1(27)=results1(27) + coeff*colorfactor*temp
results1_ti(27)=results1_ti(27) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(27)=results1(27) + coeffbar*colorfactor*tempbar
results1_ti(27)=results1_ti(27) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(27).eq.results1(27)))  write(*,*) 'NaN at FFS C[Chi, Se, bar[Fe]]' 
! ---- Chi,Su,bar[Fu] ----
Do i1=1,9
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFuChiSuL(i3,i1,i2)
coup1R = cplcFuChiSuR(i3,i1,i2)
coup2L = cplChiFucSuL(i1,i3,i2)
coup2R = cplChiFucSuR(i1,i3,i2)
Di_coup1L = dcplcFuChiSuL(i3,i1,i2,iv1)
Di_coup1R = dcplcFuChiSuR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFuChiSuL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFuChiSuR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFuChiSuL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFuChiSuR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFu2(i3),MChi2(i1),MSu2(i2),dMFu2(i3,iv1)           & 
& ,dMChi2(i1,iv1),dMSu2(i2,iv1),dMFu2(i3,iv2),dMChi2(i1,iv2),dMSu2(i2,iv2)               & 
& ,ddMFu2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSu2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFu2(i3),MChi2(i1),MSu2(i2),dMFu2(i3,iv1)           & 
& ,dMChi2(i1,iv1),dMSu2(i2,iv1),dMFu2(i3,iv2),dMChi2(i1,iv2),dMSu2(i2,iv2)               & 
& ,ddMFu2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSu2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 3
results1(28)=results1(28) + coeff*colorfactor*temp
results1_ti(28)=results1_ti(28) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(28)=results1(28) + coeffbar*colorfactor*tempbar
results1_ti(28)=results1_ti(28) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(28).eq.results1(28)))  write(*,*) 'NaN at FFS C[Chi, Su, bar[Fu]]' 
! ---- Chi,Sv,bar[Fv] ----
Do i1=1,9
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFvChiSvL(i3,i1,i2)
coup1R = cplcFvChiSvR(i3,i1,i2)
coup2L = cplChiFvcSvL(i1,i3,i2)
coup2R = cplChiFvcSvR(i1,i3,i2)
Di_coup1L = dcplcFvChiSvL(i3,i1,i2,iv1)
Di_coup1R = dcplcFvChiSvR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFvChiSvL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFvChiSvR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFvChiSvL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFvChiSvR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFv2(i3),MChi2(i1),MSv2(i2),dMFv2(i3,iv1)           & 
& ,dMChi2(i1,iv1),dMSv2(i2,iv1),dMFv2(i3,iv2),dMChi2(i1,iv2),dMSv2(i2,iv2)               & 
& ,ddMFv2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSv2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFv2(i3),MChi2(i1),MSv2(i2),dMFv2(i3,iv1)           & 
& ,dMChi2(i1,iv1),dMSv2(i2,iv1),dMFv2(i3,iv2),dMChi2(i1,iv2),dMSv2(i2,iv2)               & 
& ,ddMFv2(i3,iv1,iv2),ddMChi2(i1,iv1,iv2),ddMSv2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 1
results1(29)=results1(29) + coeff*colorfactor*temp
results1_ti(29)=results1_ti(29) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(29)=results1(29) + coeffbar*colorfactor*tempbar
results1_ti(29)=results1_ti(29) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(29).eq.results1(29)))  write(*,*) 'NaN at FFS C[Chi, Sv, bar[Fv]]' 
! ---- Fd,hh,bar[Fd] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFdFdhhL(i3,i1,i2)
coup1R = cplcFdFdhhR(i3,i1,i2)
coup2L = cplcFdFdhhL(i1,i3,i2)
coup2R = cplcFdFdhhR(i1,i3,i2)
Di_coup1L = dcplcFdFdhhL(i3,i1,i2,iv1)
Di_coup1R = dcplcFdFdhhR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFdFdhhL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFdFdhhR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFdFdhhL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFdFdhhR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),Mhh2(i2),dMFd2(i3,iv1)            & 
& ,dMFd2(i1,iv1),dMhh2(i2,iv1),dMFd2(i3,iv2),dMFd2(i1,iv2),dMhh2(i2,iv2),ddMFd2(i3,iv1,iv2)& 
& ,ddMFd2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),Mhh2(i2),dMFd2(i3,iv1)            & 
& ,dMFd2(i1,iv1),dMhh2(i2,iv1),dMFd2(i3,iv2),dMFd2(i1,iv2),dMhh2(i2,iv2),ddMFd2(i3,iv1,iv2)& 
& ,ddMFd2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 3
results1(30)=results1(30) + coeff*colorfactor*temp
results1_ti(30)=results1_ti(30) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(30)=results1(30) + coeffbar*colorfactor*tempbar
results1_ti(30)=results1_ti(30) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(30).eq.results1(30)))  write(*,*) 'NaN at FFS C[Fd, hh, bar[Fd]]' 
! ---- Fd,bar[Cha],conj[Su] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,6
coup1L = cplcChaFdcSuL(i2,i1,i3)
coup1R = cplcChaFdcSuR(i2,i1,i3)
coup2L = cplcFdChaSuL(i1,i2,i3)
coup2R = cplcFdChaSuR(i1,i2,i3)
Di_coup1L = dcplcChaFdcSuL(i2,i1,i3,iv1)
Di_coup1R = dcplcChaFdcSuR(i2,i1,i3,iv1)
Dj_coup1L = dcplcChaFdcSuL(i2,i1,i3,iv2)
Dj_coup1R = dcplcChaFdcSuR(i2,i1,i3,iv2)
DDcoup1L = ddcplcChaFdcSuL(i2,i1,i3,iv1,iv2)
DDcoup1R = ddcplcChaFdcSuR(i2,i1,i3,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MCha2(i2),MFd2(i1),MSu2(i3),dMCha2(i2,iv1)          & 
& ,dMFd2(i1,iv1),dMSu2(i3,iv1),dMCha2(i2,iv2),dMFd2(i1,iv2),dMSu2(i3,iv2),ddMCha2(i2,iv1,iv2)& 
& ,ddMFd2(i1,iv1,iv2),ddMSu2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MCha2(i2),MFd2(i1),MSu2(i3),dMCha2(i2,iv1)          & 
& ,dMFd2(i1,iv1),dMSu2(i3,iv1),dMCha2(i2,iv2),dMFd2(i1,iv2),dMSu2(i3,iv2),ddMCha2(i2,iv1,iv2)& 
& ,ddMFd2(i1,iv1,iv2),ddMSu2(i3,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 3
results1(31)=results1(31) + coeff*colorfactor*temp
results1_ti(31)=results1_ti(31) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(31)=results1(31) + coeffbar*colorfactor*tempbar
results1_ti(31)=results1_ti(31) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(31).eq.results1(31)))  write(*,*) 'NaN at FFS C[Fd, bar[Cha], conj[Su]]' 
! ---- Fe,hh,bar[Fe] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFeFehhL(i3,i1,i2)
coup1R = cplcFeFehhR(i3,i1,i2)
coup2L = cplcFeFehhL(i1,i3,i2)
coup2R = cplcFeFehhR(i1,i3,i2)
Di_coup1L = dcplcFeFehhL(i3,i1,i2,iv1)
Di_coup1R = dcplcFeFehhR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFeFehhL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFeFehhR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFeFehhL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFeFehhR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFe2(i3),MFe2(i1),Mhh2(i2),dMFe2(i3,iv1)            & 
& ,dMFe2(i1,iv1),dMhh2(i2,iv1),dMFe2(i3,iv2),dMFe2(i1,iv2),dMhh2(i2,iv2),ddMFe2(i3,iv1,iv2)& 
& ,ddMFe2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFe2(i3),MFe2(i1),Mhh2(i2),dMFe2(i3,iv1)            & 
& ,dMFe2(i1,iv1),dMhh2(i2,iv1),dMFe2(i3,iv2),dMFe2(i1,iv2),dMhh2(i2,iv2),ddMFe2(i3,iv1,iv2)& 
& ,ddMFe2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 1
results1(32)=results1(32) + coeff*colorfactor*temp
results1_ti(32)=results1_ti(32) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(32)=results1(32) + coeffbar*colorfactor*tempbar
results1_ti(32)=results1_ti(32) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(32).eq.results1(32)))  write(*,*) 'NaN at FFS C[Fe, hh, bar[Fe]]' 
! ---- Fe,bar[Cha],conj[Sv] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,6
coup1L = cplcChaFecSvL(i2,i1,i3)
coup1R = cplcChaFecSvR(i2,i1,i3)
coup2L = cplcFeChaSvL(i1,i2,i3)
coup2R = cplcFeChaSvR(i1,i2,i3)
Di_coup1L = dcplcChaFecSvL(i2,i1,i3,iv1)
Di_coup1R = dcplcChaFecSvR(i2,i1,i3,iv1)
Dj_coup1L = dcplcChaFecSvL(i2,i1,i3,iv2)
Dj_coup1R = dcplcChaFecSvR(i2,i1,i3,iv2)
DDcoup1L = ddcplcChaFecSvL(i2,i1,i3,iv1,iv2)
DDcoup1R = ddcplcChaFecSvR(i2,i1,i3,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MCha2(i2),MFe2(i1),MSv2(i3),dMCha2(i2,iv1)          & 
& ,dMFe2(i1,iv1),dMSv2(i3,iv1),dMCha2(i2,iv2),dMFe2(i1,iv2),dMSv2(i3,iv2),ddMCha2(i2,iv1,iv2)& 
& ,ddMFe2(i1,iv1,iv2),ddMSv2(i3,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MCha2(i2),MFe2(i1),MSv2(i3),dMCha2(i2,iv1)          & 
& ,dMFe2(i1,iv1),dMSv2(i3,iv1),dMCha2(i2,iv2),dMFe2(i1,iv2),dMSv2(i3,iv2),ddMCha2(i2,iv1,iv2)& 
& ,ddMFe2(i1,iv1,iv2),ddMSv2(i3,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 1
results1(33)=results1(33) + coeff*colorfactor*temp
results1_ti(33)=results1_ti(33) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(33)=results1(33) + coeffbar*colorfactor*tempbar
results1_ti(33)=results1_ti(33) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(33).eq.results1(33)))  write(*,*) 'NaN at FFS C[Fe, bar[Cha], conj[Sv]]' 
! ---- Fu,hh,bar[Fu] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFuFuhhL(i3,i1,i2)
coup1R = cplcFuFuhhR(i3,i1,i2)
coup2L = cplcFuFuhhL(i1,i3,i2)
coup2R = cplcFuFuhhR(i1,i3,i2)
Di_coup1L = dcplcFuFuhhL(i3,i1,i2,iv1)
Di_coup1R = dcplcFuFuhhR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFuFuhhL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFuFuhhR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFuFuhhL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFuFuhhR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),Mhh2(i2),dMFu2(i3,iv1)            & 
& ,dMFu2(i1,iv1),dMhh2(i2,iv1),dMFu2(i3,iv2),dMFu2(i1,iv2),dMhh2(i2,iv2),ddMFu2(i3,iv1,iv2)& 
& ,ddMFu2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),Mhh2(i2),dMFu2(i3,iv1)            & 
& ,dMFu2(i1,iv1),dMhh2(i2,iv1),dMFu2(i3,iv2),dMFu2(i1,iv2),dMhh2(i2,iv2),ddMFu2(i3,iv1,iv2)& 
& ,ddMFu2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 3
results1(34)=results1(34) + coeff*colorfactor*temp
results1_ti(34)=results1_ti(34) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(34)=results1(34) + coeffbar*colorfactor*tempbar
results1_ti(34)=results1_ti(34) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(34).eq.results1(34)))  write(*,*) 'NaN at FFS C[Fu, hh, bar[Fu]]' 
! ---- Fu,Hpm,bar[Fd] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,3
coup1L = cplcFdFuHpmL(i3,i1,i2)
coup1R = cplcFdFuHpmR(i3,i1,i2)
coup2L = cplcFuFdcHpmL(i1,i3,i2)
coup2R = cplcFuFdcHpmR(i1,i3,i2)
Di_coup1L = dcplcFdFuHpmL(i3,i1,i2,iv1)
Di_coup1R = dcplcFdFuHpmR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFdFuHpmL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFdFuHpmR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFdFuHpmL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFdFuHpmR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFu2(i1),MHpm2(i2),dMFd2(i3,iv1)           & 
& ,dMFu2(i1,iv1),dMHpm2(i2,iv1),dMFd2(i3,iv2),dMFu2(i1,iv2),dMHpm2(i2,iv2)               & 
& ,ddMFd2(i3,iv1,iv2),ddMFu2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFu2(i1),MHpm2(i2),dMFd2(i3,iv1)           & 
& ,dMFu2(i1,iv1),dMHpm2(i2,iv1),dMFd2(i3,iv2),dMFu2(i1,iv2),dMHpm2(i2,iv2)               & 
& ,ddMFd2(i3,iv1,iv2),ddMFu2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 3
results1(35)=results1(35) + coeff*colorfactor*temp
results1_ti(35)=results1_ti(35) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(35)=results1(35) + coeffbar*colorfactor*tempbar
results1_ti(35)=results1_ti(35) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(35).eq.results1(35)))  write(*,*) 'NaN at FFS C[Fu, Hpm, bar[Fd]]' 
! ---- Fv,hh,bar[Fv] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFvFvhhL(i3,i1,i2)
coup1R = cplcFvFvhhR(i3,i1,i2)
coup2L = cplcFvFvhhL(i1,i3,i2)
coup2R = cplcFvFvhhR(i1,i3,i2)
Di_coup1L = dcplcFvFvhhL(i3,i1,i2,iv1)
Di_coup1R = dcplcFvFvhhR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFvFvhhL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFvFvhhR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFvFvhhL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFvFvhhR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFv2(i3),MFv2(i1),Mhh2(i2),dMFv2(i3,iv1)            & 
& ,dMFv2(i1,iv1),dMhh2(i2,iv1),dMFv2(i3,iv2),dMFv2(i1,iv2),dMhh2(i2,iv2),ddMFv2(i3,iv1,iv2)& 
& ,ddMFv2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFv2(i3),MFv2(i1),Mhh2(i2),dMFv2(i3,iv1)            & 
& ,dMFv2(i1,iv1),dMhh2(i2,iv1),dMFv2(i3,iv2),dMFv2(i1,iv2),dMhh2(i2,iv2),ddMFv2(i3,iv1,iv2)& 
& ,ddMFv2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 1
results1(36)=results1(36) + coeff*colorfactor*temp
results1_ti(36)=results1_ti(36) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(36)=results1(36) + coeffbar*colorfactor*tempbar
results1_ti(36)=results1_ti(36) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(36).eq.results1(36)))  write(*,*) 'NaN at FFS C[Fv, hh, bar[Fv]]' 
! ---- Fv,Hpm,bar[Fe] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,3
coup1L = cplcFeFvHpmL(i3,i1,i2)
coup1R = cplcFeFvHpmR(i3,i1,i2)
coup2L = cplcFvFecHpmL(i1,i3,i2)
coup2R = cplcFvFecHpmR(i1,i3,i2)
Di_coup1L = dcplcFeFvHpmL(i3,i1,i2,iv1)
Di_coup1R = dcplcFeFvHpmR(i3,i1,i2,iv1)
Dj_coup1L = dcplcFeFvHpmL(i3,i1,i2,iv2)
Dj_coup1R = dcplcFeFvHpmR(i3,i1,i2,iv2)
DDcoup1L = ddcplcFeFvHpmL(i3,i1,i2,iv1,iv2)
DDcoup1R = ddcplcFeFvHpmR(i3,i1,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFe2(i3),MFv2(i1),MHpm2(i2),dMFe2(i3,iv1)           & 
& ,dMFv2(i1,iv1),dMHpm2(i2,iv1),dMFe2(i3,iv2),dMFv2(i1,iv2),dMHpm2(i2,iv2)               & 
& ,ddMFe2(i3,iv1,iv2),ddMFv2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFe2(i3),MFv2(i1),MHpm2(i2),dMFe2(i3,iv1)           & 
& ,dMFv2(i1,iv1),dMHpm2(i2,iv1),dMFe2(i3,iv2),dMFv2(i1,iv2),dMHpm2(i2,iv2)               & 
& ,ddMFe2(i3,iv1,iv2),ddMFv2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 1
results1(37)=results1(37) + coeff*colorfactor*temp
results1_ti(37)=results1_ti(37) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(37)=results1(37) + coeffbar*colorfactor*tempbar
results1_ti(37)=results1_ti(37) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(37).eq.results1(37)))  write(*,*) 'NaN at FFS C[Fv, Hpm, bar[Fe]]' 
! ---- Glu,Sd,bar[Fd] ----
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFdGluSdL(i3,i2)
coup1R = cplcFdGluSdR(i3,i2)
coup2L = cplGluFdcSdL(i3,i2)
coup2R = cplGluFdcSdR(i3,i2)
Di_coup1L = dcplcFdGluSdL(i3,i2,iv1)
Di_coup1R = dcplcFdGluSdR(i3,i2,iv1)
Dj_coup1L = dcplcFdGluSdL(i3,i2,iv2)
Dj_coup1R = dcplcFdGluSdR(i3,i2,iv2)
DDcoup1L = ddcplcFdGluSdL(i3,i2,iv1,iv2)
DDcoup1R = ddcplcFdGluSdR(i3,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFd2(i3),MGlu2,MSd2(i2),dMFd2(i3,iv1)               & 
& ,dMGlu2(1,iv1),dMSd2(i2,iv1),dMFd2(i3,iv2),dMGlu2(1,iv2),dMSd2(i2,iv2),ddMFd2(i3,iv1,iv2)& 
& ,ddMGlu2(1,iv1,iv2),ddMSd2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFd2(i3),MGlu2,MSd2(i2),dMFd2(i3,iv1)               & 
& ,dMGlu2(1,iv1),dMSd2(i2,iv1),dMFd2(i3,iv2),dMGlu2(1,iv2),dMSd2(i2,iv2),ddMFd2(i3,iv1,iv2)& 
& ,ddMGlu2(1,iv1,iv2),ddMSd2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 4
results1(38)=results1(38) + coeff*colorfactor*temp
results1_ti(38)=results1_ti(38) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(38)=results1(38) + coeffbar*colorfactor*tempbar
results1_ti(38)=results1_ti(38) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
if (.not.(results1(38).eq.results1(38)))  write(*,*) 'NaN at FFS C[Glu, Sd, bar[Fd]]' 
! ---- Glu,Su,bar[Fu] ----
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFuGluSuL(i3,i2)
coup1R = cplcFuGluSuR(i3,i2)
coup2L = cplGluFucSuL(i3,i2)
coup2R = cplGluFucSuR(i3,i2)
Di_coup1L = dcplcFuGluSuL(i3,i2,iv1)
Di_coup1R = dcplcFuGluSuR(i3,i2,iv1)
Dj_coup1L = dcplcFuGluSuL(i3,i2,iv2)
Dj_coup1R = dcplcFuGluSuR(i3,i2,iv2)
DDcoup1L = ddcplcFuGluSuL(i3,i2,iv1,iv2)
DDcoup1R = ddcplcFuGluSuR(i3,i2,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFu2(i3),MGlu2,MSu2(i2),dMFu2(i3,iv1)               & 
& ,dMGlu2(1,iv1),dMSu2(i2,iv1),dMFu2(i3,iv2),dMGlu2(1,iv2),dMSu2(i2,iv2),ddMFu2(i3,iv1,iv2)& 
& ,ddMGlu2(1,iv1,iv2),ddMSu2(i2,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFu2(i3),MGlu2,MSu2(i2),dMFu2(i3,iv1)               & 
& ,dMGlu2(1,iv1),dMSu2(i2,iv1),dMFu2(i3,iv2),dMGlu2(1,iv2),dMSu2(i2,iv2),ddMFu2(i3,iv1,iv2)& 
& ,ddMGlu2(1,iv1,iv2),ddMSu2(i2,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 4
results1(39)=results1(39) + coeff*colorfactor*temp
results1_ti(39)=results1_ti(39) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(39)=results1(39) + coeffbar*colorfactor*tempbar
results1_ti(39)=results1_ti(39) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
if (.not.(results1(39).eq.results1(39)))  write(*,*) 'NaN at FFS C[Glu, Su, bar[Fu]]' 
! ---- Sd,bar[Cha],bar[Fu] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,3
coup1L = cplcChacFuSdL(i2,i3,i1)
coup1R = cplcChacFuSdR(i2,i3,i1)
coup2L = cplChaFucSdL(i2,i3,i1)
coup2R = cplChaFucSdR(i2,i3,i1)
Di_coup1L = dcplcChacFuSdL(i2,i3,i1,iv1)
Di_coup1R = dcplcChacFuSdR(i2,i3,i1,iv1)
Dj_coup1L = dcplcChacFuSdL(i2,i3,i1,iv2)
Dj_coup1R = dcplcChacFuSdR(i2,i3,i1,iv2)
DDcoup1L = ddcplcChacFuSdL(i2,i3,i1,iv1,iv2)
DDcoup1R = ddcplcChacFuSdR(i2,i3,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFu2(i3),MCha2(i2),MSd2(i1),dMFu2(i3,iv1)           & 
& ,dMCha2(i2,iv1),dMSd2(i1,iv1),dMFu2(i3,iv2),dMCha2(i2,iv2),dMSd2(i1,iv2)               & 
& ,ddMFu2(i3,iv1,iv2),ddMCha2(i2,iv1,iv2),ddMSd2(i1,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFu2(i3),MCha2(i2),MSd2(i1),dMFu2(i3,iv1)           & 
& ,dMCha2(i2,iv1),dMSd2(i1,iv1),dMFu2(i3,iv2),dMCha2(i2,iv2),dMSd2(i1,iv2)               & 
& ,ddMFu2(i3,iv1,iv2),ddMCha2(i2,iv1,iv2),ddMSd2(i1,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 3
results1(40)=results1(40) + coeff*colorfactor*temp
results1_ti(40)=results1_ti(40) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(40)=results1(40) + coeffbar*colorfactor*tempbar
results1_ti(40)=results1_ti(40) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(40).eq.results1(40)))  write(*,*) 'NaN at FFS C[Sd, bar[Cha], bar[Fu]]' 
! ---- Se,bar[Cha],bar[Fv] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,3
coup1L = cplcChacFvSeL(i2,i3,i1)
coup1R = cplcChacFvSeR(i2,i3,i1)
coup2L = cplChaFvcSeL(i2,i3,i1)
coup2R = cplChaFvcSeR(i2,i3,i1)
Di_coup1L = dcplcChacFvSeL(i2,i3,i1,iv1)
Di_coup1R = dcplcChacFvSeR(i2,i3,i1,iv1)
Dj_coup1L = dcplcChacFvSeL(i2,i3,i1,iv2)
Dj_coup1R = dcplcChacFvSeR(i2,i3,i1,iv2)
DDcoup1L = ddcplcChacFvSeL(i2,i3,i1,iv1,iv2)
DDcoup1R = ddcplcChacFvSeR(i2,i3,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFv2(i3),MCha2(i2),MSe2(i1),dMFv2(i3,iv1)           & 
& ,dMCha2(i2,iv1),dMSe2(i1,iv1),dMFv2(i3,iv2),dMCha2(i2,iv2),dMSe2(i1,iv2)               & 
& ,ddMFv2(i3,iv1,iv2),ddMCha2(i2,iv1,iv2),ddMSe2(i1,iv1,iv2),coupx,Di_coupx,Dj_coupx,DDcoupx,'FFS   ',Q2,temp,temp_ti,temp_tj)
coupxbar = 2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFv2(i3),MCha2(i2),MSe2(i1),dMFv2(i3,iv1)           & 
& ,dMCha2(i2,iv1),dMSe2(i1,iv1),dMFv2(i3,iv2),dMCha2(i2,iv2),dMSe2(i1,iv2)               & 
& ,ddMFv2(i3,iv1,iv2),ddMCha2(i2,iv1,iv2),ddMSe2(i1,iv1,iv2),coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFSbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 1._dp
colorfactor = 1
results1(41)=results1(41) + coeff*colorfactor*temp
results1_ti(41)=results1_ti(41) + coeff*colorfactor*temp_ti
coeffbar = 1._dp
results1(41)=results1(41) + coeffbar*colorfactor*tempbar
results1_ti(41)=results1_ti(41) + coeffbar*colorfactor*tempbar_ti
    End Do
  End Do
End Do
if (.not.(results1(41).eq.results1(41)))  write(*,*) 'NaN at FFS C[Se, bar[Cha], bar[Fv]]' 

! ----- diagrams of type SSV, 2 ------ 

! ---- Sd,VG,conj[Sd] ----
Do i1=1,6
    Do i3=1,6
coup1 = cplSdcSdVG(i1,i3)
coup2 = cplSdcSdVG(i3,i1)
Di_coup1 = dcplSdcSdVG(i1,i3,iv1)
Dj_coup1 = dcplSdcSdVG(i1,i3,iv2)
DDcoup1 = ddcplSdcSdVG(i1,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MSd2(i3),MSd2(i1),0._dp,dMSd2(i3,iv1)               & 
& ,dMSd2(i1,iv1),ZeroC,dMSd2(i3,iv2),dMSd2(i1,iv2),ZeroC,ddMSd2(i3,iv1,iv2)              & 
& ,ddMSd2(i1,iv1,iv2),ZeroC,coupx,Di_coupx,Dj_coupx,DDcoupx,'SSV   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 4
results1(42)=results1(42) + coeff*colorfactor*temp
results1_ti(42)=results1_ti(42) + coeff*colorfactor*temp_ti
    End Do
End Do
if (.not.(results1(42).eq.results1(42)))  write(*,*) 'NaN at SSV C[Sd, VG, conj[Sd]]' 
! ---- Su,VG,conj[Su] ----
Do i1=1,6
    Do i3=1,6
coup1 = cplSucSuVG(i1,i3)
coup2 = cplSucSuVG(i3,i1)
Di_coup1 = dcplSucSuVG(i1,i3,iv1)
Dj_coup1 = dcplSucSuVG(i1,i3,iv2)
DDcoup1 = ddcplSucSuVG(i1,i3,iv1,iv2)
coupx=abs(coup1)**2 
Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) 
Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) 
DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & 
& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  
Call SecondDerivativeVeff_sunrise(MSu2(i3),MSu2(i1),0._dp,dMSu2(i3,iv1)               & 
& ,dMSu2(i1,iv1),ZeroC,dMSu2(i3,iv2),dMSu2(i1,iv2),ZeroC,ddMSu2(i3,iv1,iv2)              & 
& ,ddMSu2(i1,iv1,iv2),ZeroC,coupx,Di_coupx,Dj_coupx,DDcoupx,'SSV   ',Q2,temp,temp_ti,temp_tj)
coeff = 0.5_dp
colorfactor = 4
results1(43)=results1(43) + coeff*colorfactor*temp
results1_ti(43)=results1_ti(43) + coeff*colorfactor*temp_ti
    End Do
End Do
if (.not.(results1(43).eq.results1(43)))  write(*,*) 'NaN at SSV C[Su, VG, conj[Su]]' 

! ----- diagrams of type FFV, 3 ------ 

! ---- Fd,VG,bar[Fd] ----
Do i1=1,3
    Do i3=1,3
coup1L = cplcFdFdVGL(i3,i1)
coup1R = cplcFdFdVGR(i3,i1)
coup2L = cplcFdFdVGL(i1,i3)
coup2R = cplcFdFdVGR(i1,i3)
Di_coup1L = dcplcFdFdVGL(i3,i1,iv1)
Di_coup1R = dcplcFdFdVGR(i3,i1,iv1)
Dj_coup1L = dcplcFdFdVGL(i3,i1,iv2)
Dj_coup1R = dcplcFdFdVGR(i3,i1,iv2)
DDcoup1L = ddcplcFdFdVGL(i3,i1,iv1,iv2)
DDcoup1R = ddcplcFdFdVGR(i3,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),0._dp,dMFd2(i3,iv1)               & 
& ,dMFd2(i1,iv1),ZeroC,dMFd2(i3,iv2),dMFd2(i1,iv2),ZeroC,ddMFd2(i3,iv1,iv2)              & 
& ,ddMFd2(i1,iv1,iv2),ZeroC,coupx,Di_coupx,Dj_coupx,DDcoupx,'FFV   ',Q2,temp,temp_ti,temp_tj)
coupxbar = -2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = -2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = -2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = -2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),0._dp,dMFd2(i3,iv1)               & 
& ,dMFd2(i1,iv1),ZeroC,dMFd2(i3,iv2),dMFd2(i1,iv2),ZeroC,ddMFd2(i3,iv1,iv2)              & 
& ,ddMFd2(i1,iv1,iv2),ZeroC,coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFVbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 4
results1(44)=results1(44) + coeff*colorfactor*temp
results1_ti(44)=results1_ti(44) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(44)=results1(44) + coeffbar*colorfactor*tempbar
results1_ti(44)=results1_ti(44) + coeffbar*colorfactor*tempbar_ti
    End Do
End Do
if (.not.(results1(44).eq.results1(44)))  write(*,*) 'NaN at FFV C[Fd, VG, bar[Fd]]' 
! ---- Fu,VG,bar[Fu] ----
Do i1=1,3
    Do i3=1,3
coup1L = cplcFuFuVGL(i3,i1)
coup1R = cplcFuFuVGR(i3,i1)
coup2L = cplcFuFuVGL(i1,i3)
coup2R = cplcFuFuVGR(i1,i3)
Di_coup1L = dcplcFuFuVGL(i3,i1,iv1)
Di_coup1R = dcplcFuFuVGR(i3,i1,iv1)
Dj_coup1L = dcplcFuFuVGL(i3,i1,iv2)
Dj_coup1R = dcplcFuFuVGR(i3,i1,iv2)
DDcoup1L = ddcplcFuFuVGL(i3,i1,iv1,iv2)
DDcoup1R = ddcplcFuFuVGR(i3,i1,iv1,iv2)
coupx = (abs(coup1L)**2 + abs(coup1R)**2) 
Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &
& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) 
Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &
& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & 
& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & 
& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  
Call SecondDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),0._dp,dMFu2(i3,iv1)               & 
& ,dMFu2(i1,iv1),ZeroC,dMFu2(i3,iv2),dMFu2(i1,iv2),ZeroC,ddMFu2(i3,iv1,iv2)              & 
& ,ddMFu2(i1,iv1,iv2),ZeroC,coupx,Di_coupx,Dj_coupx,DDcoupx,'FFV   ',Q2,temp,temp_ti,temp_tj)
coupxbar = -2*Real(coup1L*conjg(coup1R),dp) 
Di_coupxbar = -2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) 
Dj_coupxbar = -2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) 
DDcoupxbar = -2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  
&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) 
Call SecondDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),0._dp,dMFu2(i3,iv1)               & 
& ,dMFu2(i1,iv1),ZeroC,dMFu2(i3,iv2),dMFu2(i1,iv2),ZeroC,ddMFu2(i3,iv1,iv2)              & 
& ,ddMFu2(i1,iv1,iv2),ZeroC,coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFVbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 4
results1(45)=results1(45) + coeff*colorfactor*temp
results1_ti(45)=results1_ti(45) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(45)=results1(45) + coeffbar*colorfactor*tempbar
results1_ti(45)=results1_ti(45) + coeffbar*colorfactor*tempbar_ti
    End Do
End Do
if (.not.(results1(45).eq.results1(45)))  write(*,*) 'NaN at FFV C[Fu, VG, bar[Fu]]' 
! ---- Glu,Glu,VG ----
coup1L = cplGluGluVGL
coup1R = cplGluGluVGR
coup2L = cplGluGluVGL
coup2R = cplGluGluVGR
Di_coup1L = dcplGluGluVGL(iv1)
Di_coup1R = dcplGluGluVGR(iv1)
Dj_coup1L = dcplGluGluVGL(iv2)
Dj_coup1R = dcplGluGluVGR(iv2)
DDcoup1L = ddcplGluGluVGL(iv1,iv2)
DDcoup1R = ddcplGluGluVGR(iv1,iv2)
coupx = abs(coup1L)**2
Di_coupx=Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) 
Dj_coupx=Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) 
DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & 
& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L)  
Call SecondDerivativeVeff_sunrise(MGlu2,MGlu2,0._dp,dMGlu2(1,iv1),dMGlu2(1,iv1)       & 
& ,ZeroC,dMGlu2(1,iv2),dMGlu2(1,iv2),ZeroC,ddMGlu2(1,iv1,iv2),ddMGlu2(1,iv1,iv2)         & 
& ,ZeroC,coupx,Di_coupx,Dj_coupx,DDcoupx,'FFV   ',Q2,temp,temp_ti,temp_tj)
coupxbar = Real(coup1L**2,dp) 
Di_coupxbar = Real(2*Di_coup1L*coup1L,dp) 
Dj_coupxbar = Real(2*Dj_coup1L*coup1L,dp) 
DDcoupxbar = Real(2*DDcoup1L*coup1L + 2*Di_coup1L*Dj_coup1L,dp) 
Call SecondDerivativeVeff_sunrise(MGlu2,MGlu2,0._dp,dMGlu2(1,iv1),dMGlu2(1,iv1)       & 
& ,ZeroC,dMGlu2(1,iv2),dMGlu2(1,iv2),ZeroC,ddMGlu2(1,iv1,iv2),ddMGlu2(1,iv1,iv2)         & 
& ,ZeroC,coupxbar,Di_coupxbar,Dj_coupxbar,DDcoupxbar,'FFVbar',Q2,tempbar,tempbar_ti,tempbar_tj)
coeff = 0.5_dp
colorfactor = 24
results1(46)=results1(46) + coeff*colorfactor*temp
results1_ti(46)=results1_ti(46) + coeff*colorfactor*temp_ti
coeffbar = 0.5_dp
results1(46)=results1(46) + coeffbar*colorfactor*tempbar
results1_ti(46)=results1_ti(46) + coeffbar*colorfactor*tempbar_ti
if (.not.(results1(46).eq.results1(46)))  write(*,*) 'NaN at FFV C[Glu, Glu, VG]' 

! ----- diagrams of type VVV, 1 ------ 

! ---- VG,VG,VG ----
coup1 = cplVGVGVG
coup2 = cplVGVGVG
Di_coup1 = dcplVGVGVG(iv1)
Dj_coup1 = dcplVGVGVG(iv2)
DDcoup1 = ddcplVGVGVG(iv1,iv2)
coeff = 0.000
colorfactor = 24
results1(47)=results1(47) + coeff*colorfactor*temp
results1_ti(47)=results1_ti(47) + coeff*colorfactor*temp_ti
if (.not.(results1(47).eq.results1(47)))  write(*,*) 'NaN at VVV C[VG, VG, VG]' 
! ----- Topology2: diagrams w. 2 Particles and 1 Vertex


! ----- diagrams of type SS, 26 ------ 

! ---- Ah,Ah ----
Do i1=1,6
 Do i2=1,6
coup1 = cplAhAhAhAh(i1,i1,i2,i2)
Di_coup1 = dcplAhAhAhAh(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplAhAhAhAh(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplAhAhAhAh(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MAh2(i1),MAh2(i2),dMAh2(i1,iv1),dMAh2(i2,iv1)         & 
& ,dMAh2(i1,iv2),dMAh2(i2,iv2),ddMAh2(i1,iv1,iv2),ddMAh2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp/8._dp)
results2(1)=results2(1) + coeff*temp
results2_ti(1)=results2_ti(1) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(1).eq.results2(1)))  write(*,*) 'NaN at SS C[Ah, Ah, Ah, Ah]' 
! ---- Ah,hh ----
Do i1=1,6
 Do i2=1,6
coup1 = cplAhAhhhhh(i1,i1,i2,i2)
Di_coup1 = dcplAhAhhhhh(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplAhAhhhhh(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplAhAhhhhh(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MAh2(i1),Mhh2(i2),dMAh2(i1,iv1),dMhh2(i2,iv1)         & 
& ,dMAh2(i1,iv2),dMhh2(i2,iv2),ddMAh2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.25_dp)
results2(2)=results2(2) + coeff*temp
results2_ti(2)=results2_ti(2) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(2).eq.results2(2)))  write(*,*) 'NaN at SS C[Ah, Ah, hh, hh]' 
! ---- Ah,Hpm ----
Do i1=1,6
 Do i2=1,2
coup1 = cplAhAhHpmcHpm(i1,i1,i2,i2)
Di_coup1 = dcplAhAhHpmcHpm(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplAhAhHpmcHpm(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplAhAhHpmcHpm(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MAh2(i1),MHpm2(i2),dMAh2(i1,iv1),dMHpm2(i2,iv1)       & 
& ,dMAh2(i1,iv2),dMHpm2(i2,iv2),ddMAh2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(3)=results2(3) + coeff*temp
results2_ti(3)=results2_ti(3) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(3).eq.results2(3)))  write(*,*) 'NaN at SS C[Ah, Ah, Hpm, conj[Hpm]]' 
! ---- Ah,Sd ----
Do i1=1,6
 Do i2=1,6
coup1 = cplAhAhSdcSd(i1,i1,i2,i2)
Di_coup1 = dcplAhAhSdcSd(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplAhAhSdcSd(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplAhAhSdcSd(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MAh2(i1),MSd2(i2),dMAh2(i1,iv1),dMSd2(i2,iv1)         & 
& ,dMAh2(i1,iv2),dMSd2(i2,iv2),ddMAh2(i1,iv1,iv2),ddMSd2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(4)=results2(4) + coeff*temp
results2_ti(4)=results2_ti(4) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(4).eq.results2(4)))  write(*,*) 'NaN at SS C[Ah, Ah, Sd, conj[Sd]]' 
! ---- Ah,Se ----
Do i1=1,6
 Do i2=1,6
coup1 = cplAhAhSecSe(i1,i1,i2,i2)
Di_coup1 = dcplAhAhSecSe(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplAhAhSecSe(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplAhAhSecSe(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MAh2(i1),MSe2(i2),dMAh2(i1,iv1),dMSe2(i2,iv1)         & 
& ,dMAh2(i1,iv2),dMSe2(i2,iv2),ddMAh2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(5)=results2(5) + coeff*temp
results2_ti(5)=results2_ti(5) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(5).eq.results2(5)))  write(*,*) 'NaN at SS C[Ah, Ah, Se, conj[Se]]' 
! ---- Ah,Su ----
Do i1=1,6
 Do i2=1,6
coup1 = cplAhAhSucSu(i1,i1,i2,i2)
Di_coup1 = dcplAhAhSucSu(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplAhAhSucSu(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplAhAhSucSu(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MAh2(i1),MSu2(i2),dMAh2(i1,iv1),dMSu2(i2,iv1)         & 
& ,dMAh2(i1,iv2),dMSu2(i2,iv2),ddMAh2(i1,iv1,iv2),ddMSu2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(6)=results2(6) + coeff*temp
results2_ti(6)=results2_ti(6) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(6).eq.results2(6)))  write(*,*) 'NaN at SS C[Ah, Ah, Su, conj[Su]]' 
! ---- Ah,Sv ----
Do i1=1,6
 Do i2=1,6
coup1 = cplAhAhSvcSv(i1,i1,i2,i2)
Di_coup1 = dcplAhAhSvcSv(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplAhAhSvcSv(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplAhAhSvcSv(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MAh2(i1),MSv2(i2),dMAh2(i1,iv1),dMSv2(i2,iv1)         & 
& ,dMAh2(i1,iv2),dMSv2(i2,iv2),ddMAh2(i1,iv1,iv2),ddMSv2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(7)=results2(7) + coeff*temp
results2_ti(7)=results2_ti(7) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(7).eq.results2(7)))  write(*,*) 'NaN at SS C[Ah, Ah, Sv, conj[Sv]]' 
! ---- hh,hh ----
Do i1=1,6
 Do i2=1,6
coup1 = cplhhhhhhhh(i1,i1,i2,i2)
Di_coup1 = dcplhhhhhhhh(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplhhhhhhhh(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplhhhhhhhh(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(Mhh2(i1),Mhh2(i2),dMhh2(i1,iv1),dMhh2(i2,iv1)         & 
& ,dMhh2(i1,iv2),dMhh2(i2,iv2),ddMhh2(i1,iv1,iv2),ddMhh2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp/8._dp)
results2(8)=results2(8) + coeff*temp
results2_ti(8)=results2_ti(8) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(8).eq.results2(8)))  write(*,*) 'NaN at SS C[hh, hh, hh, hh]' 
! ---- hh,Hpm ----
Do i1=1,6
 Do i2=1,2
coup1 = cplhhhhHpmcHpm(i1,i1,i2,i2)
Di_coup1 = dcplhhhhHpmcHpm(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplhhhhHpmcHpm(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplhhhhHpmcHpm(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(Mhh2(i1),MHpm2(i2),dMhh2(i1,iv1),dMHpm2(i2,iv1)       & 
& ,dMhh2(i1,iv2),dMHpm2(i2,iv2),ddMhh2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(9)=results2(9) + coeff*temp
results2_ti(9)=results2_ti(9) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(9).eq.results2(9)))  write(*,*) 'NaN at SS C[hh, hh, Hpm, conj[Hpm]]' 
! ---- hh,Sd ----
Do i1=1,6
 Do i2=1,6
coup1 = cplhhhhSdcSd(i1,i1,i2,i2)
Di_coup1 = dcplhhhhSdcSd(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplhhhhSdcSd(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplhhhhSdcSd(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(Mhh2(i1),MSd2(i2),dMhh2(i1,iv1),dMSd2(i2,iv1)         & 
& ,dMhh2(i1,iv2),dMSd2(i2,iv2),ddMhh2(i1,iv1,iv2),ddMSd2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(10)=results2(10) + coeff*temp
results2_ti(10)=results2_ti(10) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(10).eq.results2(10)))  write(*,*) 'NaN at SS C[hh, hh, Sd, conj[Sd]]' 
! ---- hh,Se ----
Do i1=1,6
 Do i2=1,6
coup1 = cplhhhhSecSe(i1,i1,i2,i2)
Di_coup1 = dcplhhhhSecSe(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplhhhhSecSe(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplhhhhSecSe(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(Mhh2(i1),MSe2(i2),dMhh2(i1,iv1),dMSe2(i2,iv1)         & 
& ,dMhh2(i1,iv2),dMSe2(i2,iv2),ddMhh2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(11)=results2(11) + coeff*temp
results2_ti(11)=results2_ti(11) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(11).eq.results2(11)))  write(*,*) 'NaN at SS C[hh, hh, Se, conj[Se]]' 
! ---- hh,Su ----
Do i1=1,6
 Do i2=1,6
coup1 = cplhhhhSucSu(i1,i1,i2,i2)
Di_coup1 = dcplhhhhSucSu(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplhhhhSucSu(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplhhhhSucSu(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(Mhh2(i1),MSu2(i2),dMhh2(i1,iv1),dMSu2(i2,iv1)         & 
& ,dMhh2(i1,iv2),dMSu2(i2,iv2),ddMhh2(i1,iv1,iv2),ddMSu2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(12)=results2(12) + coeff*temp
results2_ti(12)=results2_ti(12) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(12).eq.results2(12)))  write(*,*) 'NaN at SS C[hh, hh, Su, conj[Su]]' 
! ---- hh,Sv ----
Do i1=1,6
 Do i2=1,6
coup1 = cplhhhhSvcSv(i1,i1,i2,i2)
Di_coup1 = dcplhhhhSvcSv(i1,i1,i2,i2,iv1)
Dj_coup1 = dcplhhhhSvcSv(i1,i1,i2,i2,iv2)
DDcoup1 = ddcplhhhhSvcSv(i1,i1,i2,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(Mhh2(i1),MSv2(i2),dMhh2(i1,iv1),dMSv2(i2,iv1)         & 
& ,dMhh2(i1,iv2),dMSv2(i2,iv2),ddMhh2(i1,iv1,iv2),ddMSv2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(13)=results2(13) + coeff*temp
results2_ti(13)=results2_ti(13) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(13).eq.results2(13)))  write(*,*) 'NaN at SS C[hh, hh, Sv, conj[Sv]]' 
! ---- Hpm,Hpm ----
Do i1=1,2
 Do i2=1,2
coup1 = cplHpmHpmcHpmcHpm(i1,i2,i1,i2)
Di_coup1 = dcplHpmHpmcHpmcHpm(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplHpmHpmcHpmcHpm(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplHpmHpmcHpmcHpm(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MHpm2(i1),MHpm2(i2),dMHpm2(i1,iv1),dMHpm2(i2,iv1)     & 
& ,dMHpm2(i1,iv2),dMHpm2(i2,iv2),ddMHpm2(i1,iv1,iv2),ddMHpm2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(14)=results2(14) + coeff*temp
results2_ti(14)=results2_ti(14) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(14).eq.results2(14)))  write(*,*) 'NaN at SS C[Hpm, Hpm, conj[Hpm], conj[Hpm]]' 
! ---- Hpm,Sd ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSdcHpmcSd(i1,i2,i1,i2)
Di_coup1 = dcplHpmSdcHpmcSd(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplHpmSdcHpmcSd(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplHpmSdcHpmcSd(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MHpm2(i1),MSd2(i2),dMHpm2(i1,iv1),dMSd2(i2,iv1)       & 
& ,dMHpm2(i1,iv2),dMSd2(i2,iv2),ddMHpm2(i1,iv1,iv2),ddMSd2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp)
results2(15)=results2(15) + coeff*temp
results2_ti(15)=results2_ti(15) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(15).eq.results2(15)))  write(*,*) 'NaN at SS C[Hpm, Sd, conj[Hpm], conj[Sd]]' 
! ---- Hpm,Se ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSecHpmcSe(i1,i2,i1,i2)
Di_coup1 = dcplHpmSecHpmcSe(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplHpmSecHpmcSe(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplHpmSecHpmcSe(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MHpm2(i1),MSe2(i2),dMHpm2(i1,iv1),dMSe2(i2,iv1)       & 
& ,dMHpm2(i1,iv2),dMSe2(i2,iv2),ddMHpm2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp)
results2(16)=results2(16) + coeff*temp
results2_ti(16)=results2_ti(16) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(16).eq.results2(16)))  write(*,*) 'NaN at SS C[Hpm, Se, conj[Hpm], conj[Se]]' 
! ---- Hpm,Su ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSucHpmcSu(i1,i2,i1,i2)
Di_coup1 = dcplHpmSucHpmcSu(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplHpmSucHpmcSu(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplHpmSucHpmcSu(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MHpm2(i1),MSu2(i2),dMHpm2(i1,iv1),dMSu2(i2,iv1)       & 
& ,dMHpm2(i1,iv2),dMSu2(i2,iv2),ddMHpm2(i1,iv1,iv2),ddMSu2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp)
results2(17)=results2(17) + coeff*temp
results2_ti(17)=results2_ti(17) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(17).eq.results2(17)))  write(*,*) 'NaN at SS C[Hpm, Su, conj[Hpm], conj[Su]]' 
! ---- Hpm,Sv ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSvcHpmcSv(i1,i2,i1,i2)
Di_coup1 = dcplHpmSvcHpmcSv(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplHpmSvcHpmcSv(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplHpmSvcHpmcSv(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MHpm2(i1),MSv2(i2),dMHpm2(i1,iv1),dMSv2(i2,iv1)       & 
& ,dMHpm2(i1,iv2),dMSv2(i2,iv2),ddMHpm2(i1,iv1,iv2),ddMSv2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp)
results2(18)=results2(18) + coeff*temp
results2_ti(18)=results2_ti(18) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(18).eq.results2(18)))  write(*,*) 'NaN at SS C[Hpm, Sv, conj[Hpm], conj[Sv]]' 
! ---- Sd,Sd ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSdcSdcSd(i1,i2,i1,i2)
Di_coup1 = dcplSdSdcSdcSd(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplSdSdcSdcSd(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplSdSdcSdcSd(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSd2(i1),MSd2(i2),dMSd2(i1,iv1),dMSd2(i2,iv1)         & 
& ,dMSd2(i1,iv2),dMSd2(i2,iv2),ddMSd2(i1,iv1,iv2),ddMSd2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(19)=results2(19) + coeff*temp
results2_ti(19)=results2_ti(19) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(19).eq.results2(19)))  write(*,*) 'NaN at SS C[Sd, Sd, conj[Sd], conj[Sd]]' 
! ---- Sd,Se ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSecSdcSe(i1,i2,i1,i2)
Di_coup1 = dcplSdSecSdcSe(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplSdSecSdcSe(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplSdSecSdcSe(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSd2(i1),MSe2(i2),dMSd2(i1,iv1),dMSe2(i2,iv1)         & 
& ,dMSd2(i1,iv2),dMSe2(i2,iv2),ddMSd2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp)
results2(20)=results2(20) + coeff*temp
results2_ti(20)=results2_ti(20) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(20).eq.results2(20)))  write(*,*) 'NaN at SS C[Sd, Se, conj[Sd], conj[Se]]' 
! ---- Sd,Su ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSucSdcSu(i1,i2,i1,i2)
Di_coup1 = dcplSdSucSdcSu(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplSdSucSdcSu(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplSdSucSdcSu(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSd2(i1),MSu2(i2),dMSd2(i1,iv1),dMSu2(i2,iv1)         & 
& ,dMSd2(i1,iv2),dMSu2(i2,iv2),ddMSd2(i1,iv1,iv2),ddMSu2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp)
results2(21)=results2(21) + coeff*temp
results2_ti(21)=results2_ti(21) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(21).eq.results2(21)))  write(*,*) 'NaN at SS C[Sd, Su, conj[Sd], conj[Su]]' 
! ---- Se,Se ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSeSecSecSe(i1,i2,i1,i2)
Di_coup1 = dcplSeSecSecSe(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplSeSecSecSe(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplSeSecSecSe(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSe2(i1),MSe2(i2),dMSe2(i1,iv1),dMSe2(i2,iv1)         & 
& ,dMSe2(i1,iv2),dMSe2(i2,iv2),ddMSe2(i1,iv1,iv2),ddMSe2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(22)=results2(22) + coeff*temp
results2_ti(22)=results2_ti(22) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(22).eq.results2(22)))  write(*,*) 'NaN at SS C[Se, Se, conj[Se], conj[Se]]' 
! ---- Se,Sv ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSeSvcSecSv(i1,i2,i1,i2)
Di_coup1 = dcplSeSvcSecSv(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplSeSvcSecSv(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplSeSvcSecSv(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSe2(i1),MSv2(i2),dMSe2(i1,iv1),dMSv2(i2,iv1)         & 
& ,dMSe2(i1,iv2),dMSv2(i2,iv2),ddMSe2(i1,iv1,iv2),ddMSv2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp)
results2(23)=results2(23) + coeff*temp
results2_ti(23)=results2_ti(23) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(23).eq.results2(23)))  write(*,*) 'NaN at SS C[Se, Sv, conj[Se], conj[Sv]]' 
! ---- Su,Su ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSuSucSucSu(i1,i2,i1,i2)
Di_coup1 = dcplSuSucSucSu(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplSuSucSucSu(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplSuSucSucSu(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSu2(i1),MSu2(i2),dMSu2(i1,iv1),dMSu2(i2,iv1)         & 
& ,dMSu2(i1,iv2),dMSu2(i2,iv2),ddMSu2(i1,iv1,iv2),ddMSu2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(24)=results2(24) + coeff*temp
results2_ti(24)=results2_ti(24) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(24).eq.results2(24)))  write(*,*) 'NaN at SS C[Su, Su, conj[Su], conj[Su]]' 
! ---- Su,Sv ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSuSvcSucSv(i1,i2,i1,i2)
Di_coup1 = dcplSuSvcSucSv(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplSuSvcSucSv(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplSuSvcSucSv(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSu2(i1),MSv2(i2),dMSu2(i1,iv1),dMSv2(i2,iv1)         & 
& ,dMSu2(i1,iv2),dMSv2(i2,iv2),ddMSu2(i1,iv1,iv2),ddMSv2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-1._dp)
results2(25)=results2(25) + coeff*temp
results2_ti(25)=results2_ti(25) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(25).eq.results2(25)))  write(*,*) 'NaN at SS C[Su, Sv, conj[Su], conj[Sv]]' 
! ---- Sv,Sv ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSvSvcSvcSv(i1,i2,i1,i2)
Di_coup1 = dcplSvSvcSvcSv(i1,i2,i1,i2,iv1)
Dj_coup1 = dcplSvSvcSvcSv(i1,i2,i1,i2,iv2)
DDcoup1 = ddcplSvSvcSvcSv(i1,i2,i1,i2,iv1,iv2)
Call SecondDerivativeVeff_balls(MSv2(i1),MSv2(i2),dMSv2(i1,iv1),dMSv2(i2,iv1)         & 
& ,dMSv2(i1,iv2),dMSv2(i2,iv2),ddMSv2(i1,iv1,iv2),ddMSv2(i2,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'SS',Q2,temp,temp_ti,temp_tj)
coeff = (-0.5_dp)
results2(26)=results2(26) + coeff*temp
results2_ti(26)=results2_ti(26) + coeff*temp_ti
  End Do
End Do
if (.not.(results2(26).eq.results2(26)))  write(*,*) 'NaN at SS C[Sv, Sv, conj[Sv], conj[Sv]]' 

! ----- diagrams of type VS, 2 ------ 

! ---- Sd,VG ----
Do i1=1,6
coup1 = cplSdcSdVGVG(i1,i1)
Di_coup1 = dcplSdcSdVGVG(i1,i1,iv1)
Dj_coup1 = dcplSdcSdVGVG(i1,i1,iv2)
DDcoup1 = ddcplSdcSdVGVG(i1,i1,iv1,iv2)
Call SecondDerivativeVeff_balls(0._dp,MSd2(i1),ZeroC,dMSd2(i1,iv1),ZeroC,dMSd2(i1,iv2)& 
& ,ZeroC,ddMSd2(i1,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'VS',Q2,temp,temp_ti,temp_tj)
coeff = 0._dp
results2(27)=results2(27) + coeff*temp
results2_ti(27)=results2_ti(27) + coeff*temp_ti
End Do
if (.not.(results2(27).eq.results2(27)))  write(*,*) 'NaN at VS C[Sd, VG, VG, conj[Sd]]' 
! ---- Su,VG ----
Do i1=1,6
coup1 = cplSucSuVGVG(i1,i1)
Di_coup1 = dcplSucSuVGVG(i1,i1,iv1)
Dj_coup1 = dcplSucSuVGVG(i1,i1,iv2)
DDcoup1 = ddcplSucSuVGVG(i1,i1,iv1,iv2)
Call SecondDerivativeVeff_balls(0._dp,MSu2(i1),ZeroC,dMSu2(i1,iv1),ZeroC,dMSu2(i1,iv2)& 
& ,ZeroC,ddMSu2(i1,iv1,iv2),coup1,Di_coup1,Dj_coup1,DDcoup1,'VS',Q2,temp,temp_ti,temp_tj)
coeff = 0._dp
results2(28)=results2(28) + coeff*temp
results2_ti(28)=results2_ti(28) + coeff*temp_ti
End Do
if (.not.(results2(28).eq.results2(28)))  write(*,*) 'NaN at VS C[Su, VG, VG, conj[Su]]' 

  result = sum(results1)+sum(results2) ! 2nd deriv. of V
  result_ti = sum(results1_ti)+sum(results2_ti) ! 1st deriv. of V
  pi2L(iv1,iv2) = oo16pi2**2 * Real(result,dp) 
  End Do 
  ti2L(iv1) = oo16pi2**2 * Real(result_ti,dp) 
End Do 
Do iv1=1,6
  Do iv2=1,iv1-1
  pi2L(iv1,iv2) = pi2L(iv2,iv1) 
  End Do 
End Do 
End Subroutine SecondDerivativeEffPot2Loop 





Subroutine FirstDerivativeEffPot2Loop(vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,gp,               & 
& Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,             & 
& ms12,ms22,ms32,mv2,M1,M2,M3,M4,kont,ti2L)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp),Intent(in) :: vd,vu,vS,vS1,vS2,vS3

Integer, Intent(inout):: kont
Real(dp), Intent(out) :: ti2L(6)
Integer :: i,i1,i2,i3,includeGhosts,NrContr 
Integer :: iv1, iv2 
Integer :: NrContr1,NrContr2 !nr of contributing diagrams
Real(dp) :: Q2,colorfactor,coeff,coeffbar
Complex(dp) :: result,temp,tempbar
Complex(dp) :: coup1,coup2,coup1L,coup1R,coup2L,coup2R,coupx,coupxbar
Complex(dp) :: dcoup1,dcoup2,dcoup1L,dcoup1R,dcoup2L,dcoup2R,dcoupx,dcoupxbar
Real(dp) :: gout(70368) 
Real(dp) :: results1(47),results2(28)
Complex(dp) :: cplAhAhAh(6,6,6),cplAhAhhh(6,6,6),cplAhhhhh(6,6,6),cplAhHpmcHpm(6,2,2),               & 
& cplAhSdcSd(6,6,6),cplAhSecSe(6,6,6),cplAhSucSu(6,6,6),cplAhSvcSv(6,6,6),               & 
& cplhhhhhh(6,6,6),cplhhHpmcHpm(6,2,2),cplhhSdcSd(6,6,6),cplhhSecSe(6,6,6),              & 
& cplhhSucSu(6,6,6),cplhhSvcSv(6,6,6),cplHpmSucSd(2,6,6),cplHpmSvcSe(2,6,6),             & 
& cplSdcHpmcSu(6,2,6),cplSecHpmcSv(6,2,6),cplSdcSdVG(6,6),cplSucSuVG(6,6),               & 
& cplVGVGVG,cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplChiChiAhL(9,9,6),               & 
& cplChiChiAhR(9,9,6),cplcFdFdAhL(3,3,6),cplcFdFdAhR(3,3,6),cplcFeFeAhL(3,3,6),          & 
& cplcFeFeAhR(3,3,6),cplcFuFuAhL(3,3,6),cplcFuFuAhR(3,3,6),cplcFvFvAhL(3,3,6),           & 
& cplcFvFvAhR(3,3,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChaFucSdL(2,3,6),    & 
& cplChaFucSdR(2,3,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChahhL(2,2,6),      & 
& cplcChaChahhR(2,2,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvL(3,2,6),      & 
& cplcFeChaSvR(3,2,6),cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),cplChiFdcSdL(9,3,6),       & 
& cplChiFdcSdR(9,3,6),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFucSuL(9,3,6),       & 
& cplChiFucSuR(9,3,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),cplcChaChiHpmL(2,9,2),     & 
& cplcChaChiHpmR(2,9,2),cplcFdChiSdL(3,9,6),cplcFdChiSdR(3,9,6),cplcFeChiSeL(3,9,6),     & 
& cplcFeChiSeR(3,9,6),cplcFuChiSuL(3,9,6),cplcFuChiSuR(3,9,6),cplcFvChiSvL(3,9,6),       & 
& cplcFvChiSvR(3,9,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,6),            & 
& cplcFdFdhhR(3,3,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),     & 
& cplcFuFdcHpmR(3,3,2),cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),cplcChaFecSvL(2,3,6),       & 
& cplcChaFecSvR(2,3,6),cplcFvFecHpmL(3,3,2),cplcFvFecHpmR(3,3,2),cplGluFucSuL(3,6),      & 
& cplGluFucSuR(3,6),cplcFuFuhhL(3,3,6),cplcFuFuhhR(3,3,6),cplcFdFuHpmL(3,3,2),           & 
& cplcFdFuHpmR(3,3,2),cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),cplcFeFvHpmL(3,3,2),         & 
& cplcFeFvHpmR(3,3,2),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),             & 
& cplcFuGluSuR(3,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChacFvSeL(2,3,6),      & 
& cplcChacFvSeR(2,3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),               & 
& cplcFuFuVGR(3,3),cplGluGluVGL,cplGluGluVGR

Complex(dp) :: cplAhAhAhAh(6,6,6,6),cplAhAhhhhh(6,6,6,6),cplAhAhHpmcHpm(6,6,2,2),cplAhAhSdcSd(6,6,6,6),& 
& cplAhAhSecSe(6,6,6,6),cplAhAhSucSu(6,6,6,6),cplAhAhSvcSv(6,6,6,6),cplhhhhhhhh(6,6,6,6),& 
& cplhhhhHpmcHpm(6,6,2,2),cplhhhhSdcSd(6,6,6,6),cplhhhhSecSe(6,6,6,6),cplhhhhSucSu(6,6,6,6),& 
& cplhhhhSvcSv(6,6,6,6),cplHpmHpmcHpmcHpm(2,2,2,2),cplHpmSdcHpmcSd(2,6,2,6),             & 
& cplHpmSecHpmcSe(2,6,2,6),cplHpmSucHpmcSu(2,6,2,6),cplHpmSvcHpmcSv(2,6,2,6),            & 
& cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),cplSdSucSdcSu(6,6,6,6),cplSeSecSecSe(6,6,6,6),& 
& cplSeSvcSecSv(6,6,6,6),cplSuSucSucSu(6,6,6,6),cplSuSvcSucSv(6,6,6,6),cplSvSvcSvcSv(6,6,6,6),& 
& cplSdcSdVGVG(6,6),cplSucSuVGVG(6,6)

Complex(dp) :: dcplAhAhAh(6,6,6,6),dcplAhAhhh(6,6,6,6),dcplAhhhhh(6,6,6,6),dcplAhHpmcHpm(6,2,2,6),   & 
& dcplAhSdcSd(6,6,6,6),dcplAhSecSe(6,6,6,6),dcplAhSucSu(6,6,6,6),dcplAhSvcSv(6,6,6,6),   & 
& dcplhhhhhh(6,6,6,6),dcplhhHpmcHpm(6,2,2,6),dcplhhSdcSd(6,6,6,6),dcplhhSecSe(6,6,6,6),  & 
& dcplhhSucSu(6,6,6,6),dcplhhSvcSv(6,6,6,6),dcplHpmSucSd(2,6,6,6),dcplHpmSvcSe(2,6,6,6), & 
& dcplSdcHpmcSu(6,2,6,6),dcplSecHpmcSv(6,2,6,6),dcplSdcSdVG(6,6,6),dcplSucSuVG(6,6,6),   & 
& dcplVGVGVG(6),dcplcChaChaAhL(2,2,6,6),dcplcChaChaAhR(2,2,6,6),dcplChiChiAhL(9,9,6,6),  & 
& dcplChiChiAhR(9,9,6,6),dcplcFdFdAhL(3,3,6,6),dcplcFdFdAhR(3,3,6,6),dcplcFeFeAhL(3,3,6,6),& 
& dcplcFeFeAhR(3,3,6,6),dcplcFuFuAhL(3,3,6,6),dcplcFuFuAhR(3,3,6,6),dcplcFvFvAhL(3,3,6,6),& 
& dcplcFvFvAhR(3,3,6,6),dcplChiChacHpmL(9,2,2,6),dcplChiChacHpmR(9,2,2,6),               & 
& dcplChaFucSdL(2,3,6,6),dcplChaFucSdR(2,3,6,6),dcplChaFvcSeL(2,3,6,6),dcplChaFvcSeR(2,3,6,6),& 
& dcplcChaChahhL(2,2,6,6),dcplcChaChahhR(2,2,6,6),dcplcFdChaSuL(3,2,6,6),dcplcFdChaSuR(3,2,6,6),& 
& dcplcFeChaSvL(3,2,6,6),dcplcFeChaSvR(3,2,6,6),dcplChiChihhL(9,9,6,6),dcplChiChihhR(9,9,6,6),& 
& dcplChiFdcSdL(9,3,6,6),dcplChiFdcSdR(9,3,6,6),dcplChiFecSeL(9,3,6,6),dcplChiFecSeR(9,3,6,6),& 
& dcplChiFucSuL(9,3,6,6),dcplChiFucSuR(9,3,6,6),dcplChiFvcSvL(9,3,6,6),dcplChiFvcSvR(9,3,6,6),& 
& dcplcChaChiHpmL(2,9,2,6),dcplcChaChiHpmR(2,9,2,6),dcplcFdChiSdL(3,9,6,6),              & 
& dcplcFdChiSdR(3,9,6,6),dcplcFeChiSeL(3,9,6,6),dcplcFeChiSeR(3,9,6,6),dcplcFuChiSuL(3,9,6,6),& 
& dcplcFuChiSuR(3,9,6,6),dcplcFvChiSvL(3,9,6,6),dcplcFvChiSvR(3,9,6,6),dcplGluFdcSdL(3,6,6),& 
& dcplGluFdcSdR(3,6,6),dcplcFdFdhhL(3,3,6,6),dcplcFdFdhhR(3,3,6,6),dcplcChaFdcSuL(2,3,6,6),& 
& dcplcChaFdcSuR(2,3,6,6),dcplcFuFdcHpmL(3,3,2,6),dcplcFuFdcHpmR(3,3,2,6),               & 
& dcplcFeFehhL(3,3,6,6),dcplcFeFehhR(3,3,6,6),dcplcChaFecSvL(2,3,6,6),dcplcChaFecSvR(2,3,6,6),& 
& dcplcFvFecHpmL(3,3,2,6),dcplcFvFecHpmR(3,3,2,6),dcplGluFucSuL(3,6,6),dcplGluFucSuR(3,6,6),& 
& dcplcFuFuhhL(3,3,6,6),dcplcFuFuhhR(3,3,6,6),dcplcFdFuHpmL(3,3,2,6),dcplcFdFuHpmR(3,3,2,6),& 
& dcplcFvFvhhL(3,3,6,6),dcplcFvFvhhR(3,3,6,6),dcplcFeFvHpmL(3,3,2,6),dcplcFeFvHpmR(3,3,2,6),& 
& dcplcFdGluSdL(3,6,6),dcplcFdGluSdR(3,6,6),dcplcFuGluSuL(3,6,6),dcplcFuGluSuR(3,6,6),   & 
& dcplcChacFuSdL(2,3,6,6),dcplcChacFuSdR(2,3,6,6),dcplcChacFvSeL(2,3,6,6),               & 
& dcplcChacFvSeR(2,3,6,6),dcplcFdFdVGL(3,3,6),dcplcFdFdVGR(3,3,6),dcplcFuFuVGL(3,3,6),   & 
& dcplcFuFuVGR(3,3,6),dcplGluGluVGL(6),dcplGluGluVGR(6)

Complex(dp) :: dcplAhAhAhAh(6,6,6,6,6),dcplAhAhhhhh(6,6,6,6,6),dcplAhAhHpmcHpm(6,6,2,2,6),           & 
& dcplAhAhSdcSd(6,6,6,6,6),dcplAhAhSecSe(6,6,6,6,6),dcplAhAhSucSu(6,6,6,6,6),            & 
& dcplAhAhSvcSv(6,6,6,6,6),dcplhhhhhhhh(6,6,6,6,6),dcplhhhhHpmcHpm(6,6,2,2,6),           & 
& dcplhhhhSdcSd(6,6,6,6,6),dcplhhhhSecSe(6,6,6,6,6),dcplhhhhSucSu(6,6,6,6,6),            & 
& dcplhhhhSvcSv(6,6,6,6,6),dcplHpmHpmcHpmcHpm(2,2,2,2,6),dcplHpmSdcHpmcSd(2,6,2,6,6),    & 
& dcplHpmSecHpmcSe(2,6,2,6,6),dcplHpmSucHpmcSu(2,6,2,6,6),dcplHpmSvcHpmcSv(2,6,2,6,6),   & 
& dcplSdSdcSdcSd(6,6,6,6,6),dcplSdSecSdcSe(6,6,6,6,6),dcplSdSucSdcSu(6,6,6,6,6),         & 
& dcplSeSecSecSe(6,6,6,6,6),dcplSeSvcSecSv(6,6,6,6,6),dcplSuSucSucSu(6,6,6,6,6),         & 
& dcplSuSvcSucSv(6,6,6,6,6),dcplSvSvcSvcSv(6,6,6,6,6),dcplSdcSdVGVG(6,6,6),              & 
& dcplSucSuVGVG(6,6,6)

Real(dp) :: MSd(6),MSd2(6),MSv(6),MSv2(6),MSu(6),MSu2(6),MSe(6),MSe2(6),Mhh(6),Mhh2(6),           & 
& MAh(6),MAh2(6),MHpm(2),MHpm2(2),MChi(9),MChi2(9),MFv(3),MFv2(3),MCha(2),               & 
& MCha2(2),MFe(3),MFe2(3),MFd(3),MFd2(3),MFu(3),MFu2(3),MGlu,MGlu2,MVZ,MVZp,             & 
& MVZ2,MVZp2,MVWm,MVWm2

Complex(dp) :: dMSd(6,6),dMSd2(6,6),dMSv(6,6),dMSv2(6,6),dMSu(6,6),dMSu2(6,6),dMSe(6,6),             & 
& dMSe2(6,6),dMhh(6,6),dMhh2(6,6),dMAh(6,6),dMAh2(6,6),dMHpm(2,6),dMHpm2(2,6),           & 
& dMChi(9,6),dMChi2(9,6),dMFv(3,6),dMFv2(3,6),dMCha(2,6),dMCha2(2,6),dMFe(3,6),          & 
& dMFe2(3,6),dMFd(3,6),dMFd2(3,6),dMFu(3,6),dMFu2(3,6),dMGlu(1,6),dMGlu2(1,6),           & 
& dMVZ(1,6),dMVZp(1,6),dMVZ2(1,6),dMVZp2(1,6),dMVWm(1,6),dMVWm2(1,6)

!! ------------------------------------------------- 
!! Calculate masses, couplings and their derivatives 
!! ------------------------------------------------- 

Do i1=1,6
Call FirstDerivativeMassesCoups(i1,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,gp,Yd,               & 
& Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,           & 
& ms22,ms32,mv2,M1,M2,M3,M4,gout)

Call GToMassesCoups(gout,MSd,MSd2,MSv,MSv2,MSu,MSu2,MSe,MSe2,Mhh,Mhh2,MAh,            & 
& MAh2,MHpm,MHpm2,MChi,MChi2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MFd,MFd2,MFu,MFu2,             & 
& MGlu,MGlu2,MVZ,MVZp,MVZ2,MVZp2,MVWm,MVWm2,cplAhAhAh,cplAhAhhh,cplAhhhhh,               & 
& cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplhhhhhh,cplhhHpmcHpm,       & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplHpmSucSd,cplHpmSvcSe,cplSdcHpmcSu,      & 
& cplSecHpmcSv,cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplcChaChaAhL,cplcChaChaAhR,              & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,         & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,cplChiChihhR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFeFehhL,cplcFeFehhR,cplcChaFecSvL,cplcChaFecSvR,       & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,           & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplcChacFvSeL,cplcChacFvSeR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplGluGluVGL,cplGluGluVGR,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,         & 
& cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvcSv,cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,        & 
& cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvcSv,cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,              & 
& cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvcHpmcSv,cplSdSdcSdcSd,cplSdSecSdcSe,           & 
& cplSdSucSdcSu,cplSeSecSecSe,cplSeSvcSecSv,cplSuSucSucSu,cplSuSvcSucSv,cplSvSvcSvcSv,   & 
& cplSdcSdVGVG,cplSucSuVGVG)

dMSd(:,i1) = MSd
dMSd2(:,i1) = MSd2
dMSv(:,i1) = MSv
dMSv2(:,i1) = MSv2
dMSu(:,i1) = MSu
dMSu2(:,i1) = MSu2
dMSe(:,i1) = MSe
dMSe2(:,i1) = MSe2
dMhh(:,i1) = Mhh
dMhh2(:,i1) = Mhh2
dMAh(:,i1) = MAh
dMAh2(:,i1) = MAh2
dMHpm(:,i1) = MHpm
dMHpm2(:,i1) = MHpm2
dMChi(:,i1) = MChi
dMChi2(:,i1) = MChi2
dMFv(:,i1) = MFv
dMFv2(:,i1) = MFv2
dMCha(:,i1) = MCha
dMCha2(:,i1) = MCha2
dMFe(:,i1) = MFe
dMFe2(:,i1) = MFe2
dMFd(:,i1) = MFd
dMFd2(:,i1) = MFd2
dMFu(:,i1) = MFu
dMFu2(:,i1) = MFu2
dMGlu(:,i1) = MGlu
dMGlu2(:,i1) = MGlu2
dMVZ(:,i1) = MVZ
dMVZp(:,i1) = MVZp
dMVZ2(:,i1) = MVZ2
dMVZp2(:,i1) = MVZp2
dMVWm(:,i1) = MVWm
dMVWm2(:,i1) = MVWm2
dcplAhAhAh(:,:,:,i1) = cplAhAhAh
dcplAhAhhh(:,:,:,i1) = cplAhAhhh
dcplAhhhhh(:,:,:,i1) = cplAhhhhh
dcplAhHpmcHpm(:,:,:,i1) = cplAhHpmcHpm
dcplAhSdcSd(:,:,:,i1) = cplAhSdcSd
dcplAhSecSe(:,:,:,i1) = cplAhSecSe
dcplAhSucSu(:,:,:,i1) = cplAhSucSu
dcplAhSvcSv(:,:,:,i1) = cplAhSvcSv
dcplhhhhhh(:,:,:,i1) = cplhhhhhh
dcplhhHpmcHpm(:,:,:,i1) = cplhhHpmcHpm
dcplhhSdcSd(:,:,:,i1) = cplhhSdcSd
dcplhhSecSe(:,:,:,i1) = cplhhSecSe
dcplhhSucSu(:,:,:,i1) = cplhhSucSu
dcplhhSvcSv(:,:,:,i1) = cplhhSvcSv
dcplHpmSucSd(:,:,:,i1) = cplHpmSucSd
dcplHpmSvcSe(:,:,:,i1) = cplHpmSvcSe
dcplSdcHpmcSu(:,:,:,i1) = cplSdcHpmcSu
dcplSecHpmcSv(:,:,:,i1) = cplSecHpmcSv
dcplSdcSdVG(:,:,i1) = cplSdcSdVG
dcplSucSuVG(:,:,i1) = cplSucSuVG
dcplVGVGVG(i1) = cplVGVGVG
dcplcChaChaAhL(:,:,:,i1) = cplcChaChaAhL
dcplcChaChaAhR(:,:,:,i1) = cplcChaChaAhR
dcplChiChiAhL(:,:,:,i1) = cplChiChiAhL
dcplChiChiAhR(:,:,:,i1) = cplChiChiAhR
dcplcFdFdAhL(:,:,:,i1) = cplcFdFdAhL
dcplcFdFdAhR(:,:,:,i1) = cplcFdFdAhR
dcplcFeFeAhL(:,:,:,i1) = cplcFeFeAhL
dcplcFeFeAhR(:,:,:,i1) = cplcFeFeAhR
dcplcFuFuAhL(:,:,:,i1) = cplcFuFuAhL
dcplcFuFuAhR(:,:,:,i1) = cplcFuFuAhR
dcplcFvFvAhL(:,:,:,i1) = cplcFvFvAhL
dcplcFvFvAhR(:,:,:,i1) = cplcFvFvAhR
dcplChiChacHpmL(:,:,:,i1) = cplChiChacHpmL
dcplChiChacHpmR(:,:,:,i1) = cplChiChacHpmR
dcplChaFucSdL(:,:,:,i1) = cplChaFucSdL
dcplChaFucSdR(:,:,:,i1) = cplChaFucSdR
dcplChaFvcSeL(:,:,:,i1) = cplChaFvcSeL
dcplChaFvcSeR(:,:,:,i1) = cplChaFvcSeR
dcplcChaChahhL(:,:,:,i1) = cplcChaChahhL
dcplcChaChahhR(:,:,:,i1) = cplcChaChahhR
dcplcFdChaSuL(:,:,:,i1) = cplcFdChaSuL
dcplcFdChaSuR(:,:,:,i1) = cplcFdChaSuR
dcplcFeChaSvL(:,:,:,i1) = cplcFeChaSvL
dcplcFeChaSvR(:,:,:,i1) = cplcFeChaSvR
dcplChiChihhL(:,:,:,i1) = cplChiChihhL
dcplChiChihhR(:,:,:,i1) = cplChiChihhR
dcplChiFdcSdL(:,:,:,i1) = cplChiFdcSdL
dcplChiFdcSdR(:,:,:,i1) = cplChiFdcSdR
dcplChiFecSeL(:,:,:,i1) = cplChiFecSeL
dcplChiFecSeR(:,:,:,i1) = cplChiFecSeR
dcplChiFucSuL(:,:,:,i1) = cplChiFucSuL
dcplChiFucSuR(:,:,:,i1) = cplChiFucSuR
dcplChiFvcSvL(:,:,:,i1) = cplChiFvcSvL
dcplChiFvcSvR(:,:,:,i1) = cplChiFvcSvR
dcplcChaChiHpmL(:,:,:,i1) = cplcChaChiHpmL
dcplcChaChiHpmR(:,:,:,i1) = cplcChaChiHpmR
dcplcFdChiSdL(:,:,:,i1) = cplcFdChiSdL
dcplcFdChiSdR(:,:,:,i1) = cplcFdChiSdR
dcplcFeChiSeL(:,:,:,i1) = cplcFeChiSeL
dcplcFeChiSeR(:,:,:,i1) = cplcFeChiSeR
dcplcFuChiSuL(:,:,:,i1) = cplcFuChiSuL
dcplcFuChiSuR(:,:,:,i1) = cplcFuChiSuR
dcplcFvChiSvL(:,:,:,i1) = cplcFvChiSvL
dcplcFvChiSvR(:,:,:,i1) = cplcFvChiSvR
dcplGluFdcSdL(:,:,i1) = cplGluFdcSdL
dcplGluFdcSdR(:,:,i1) = cplGluFdcSdR
dcplcFdFdhhL(:,:,:,i1) = cplcFdFdhhL
dcplcFdFdhhR(:,:,:,i1) = cplcFdFdhhR
dcplcChaFdcSuL(:,:,:,i1) = cplcChaFdcSuL
dcplcChaFdcSuR(:,:,:,i1) = cplcChaFdcSuR
dcplcFuFdcHpmL(:,:,:,i1) = cplcFuFdcHpmL
dcplcFuFdcHpmR(:,:,:,i1) = cplcFuFdcHpmR
dcplcFeFehhL(:,:,:,i1) = cplcFeFehhL
dcplcFeFehhR(:,:,:,i1) = cplcFeFehhR
dcplcChaFecSvL(:,:,:,i1) = cplcChaFecSvL
dcplcChaFecSvR(:,:,:,i1) = cplcChaFecSvR
dcplcFvFecHpmL(:,:,:,i1) = cplcFvFecHpmL
dcplcFvFecHpmR(:,:,:,i1) = cplcFvFecHpmR
dcplGluFucSuL(:,:,i1) = cplGluFucSuL
dcplGluFucSuR(:,:,i1) = cplGluFucSuR
dcplcFuFuhhL(:,:,:,i1) = cplcFuFuhhL
dcplcFuFuhhR(:,:,:,i1) = cplcFuFuhhR
dcplcFdFuHpmL(:,:,:,i1) = cplcFdFuHpmL
dcplcFdFuHpmR(:,:,:,i1) = cplcFdFuHpmR
dcplcFvFvhhL(:,:,:,i1) = cplcFvFvhhL
dcplcFvFvhhR(:,:,:,i1) = cplcFvFvhhR
dcplcFeFvHpmL(:,:,:,i1) = cplcFeFvHpmL
dcplcFeFvHpmR(:,:,:,i1) = cplcFeFvHpmR
dcplcFdGluSdL(:,:,i1) = cplcFdGluSdL
dcplcFdGluSdR(:,:,i1) = cplcFdGluSdR
dcplcFuGluSuL(:,:,i1) = cplcFuGluSuL
dcplcFuGluSuR(:,:,i1) = cplcFuGluSuR
dcplcChacFuSdL(:,:,:,i1) = cplcChacFuSdL
dcplcChacFuSdR(:,:,:,i1) = cplcChacFuSdR
dcplcChacFvSeL(:,:,:,i1) = cplcChacFvSeL
dcplcChacFvSeR(:,:,:,i1) = cplcChacFvSeR
dcplcFdFdVGL(:,:,i1) = cplcFdFdVGL
dcplcFdFdVGR(:,:,i1) = cplcFdFdVGR
dcplcFuFuVGL(:,:,i1) = cplcFuFuVGL
dcplcFuFuVGR(:,:,i1) = cplcFuFuVGR
dcplGluGluVGL(i1) = cplGluGluVGL
dcplGluGluVGR(i1) = cplGluGluVGR
dcplAhAhAhAh(:,:,:,:,i1) = cplAhAhAhAh
dcplAhAhhhhh(:,:,:,:,i1) = cplAhAhhhhh
dcplAhAhHpmcHpm(:,:,:,:,i1) = cplAhAhHpmcHpm
dcplAhAhSdcSd(:,:,:,:,i1) = cplAhAhSdcSd
dcplAhAhSecSe(:,:,:,:,i1) = cplAhAhSecSe
dcplAhAhSucSu(:,:,:,:,i1) = cplAhAhSucSu
dcplAhAhSvcSv(:,:,:,:,i1) = cplAhAhSvcSv
dcplhhhhhhhh(:,:,:,:,i1) = cplhhhhhhhh
dcplhhhhHpmcHpm(:,:,:,:,i1) = cplhhhhHpmcHpm
dcplhhhhSdcSd(:,:,:,:,i1) = cplhhhhSdcSd
dcplhhhhSecSe(:,:,:,:,i1) = cplhhhhSecSe
dcplhhhhSucSu(:,:,:,:,i1) = cplhhhhSucSu
dcplhhhhSvcSv(:,:,:,:,i1) = cplhhhhSvcSv
dcplHpmHpmcHpmcHpm(:,:,:,:,i1) = cplHpmHpmcHpmcHpm
dcplHpmSdcHpmcSd(:,:,:,:,i1) = cplHpmSdcHpmcSd
dcplHpmSecHpmcSe(:,:,:,:,i1) = cplHpmSecHpmcSe
dcplHpmSucHpmcSu(:,:,:,:,i1) = cplHpmSucHpmcSu
dcplHpmSvcHpmcSv(:,:,:,:,i1) = cplHpmSvcHpmcSv
dcplSdSdcSdcSd(:,:,:,:,i1) = cplSdSdcSdcSd
dcplSdSecSdcSe(:,:,:,:,i1) = cplSdSecSdcSe
dcplSdSucSdcSu(:,:,:,:,i1) = cplSdSucSdcSu
dcplSeSecSecSe(:,:,:,:,i1) = cplSeSecSecSe
dcplSeSvcSecSv(:,:,:,:,i1) = cplSeSvcSecSv
dcplSuSucSucSu(:,:,:,:,i1) = cplSuSucSucSu
dcplSuSvcSucSv(:,:,:,:,i1) = cplSuSvcSucSv
dcplSvSvcSvcSv(:,:,:,:,i1) = cplSvSvcSvcSv
dcplSdcSdVGVG(:,:,i1) = cplSdcSdVGVG
dcplSucSuVGVG(:,:,i1) = cplSucSuVGVG
End Do 
 
Call TreeMassesEffPot(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,            & 
& g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,             & 
& mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

Call CouplingsForEffPot3(lam,Tlam,kap,Tk,ZA,vd,vu,vS,vS1,vS2,vS3,ZH,ZP,               & 
& Yd,Td,ZD,Ye,Te,ZE,Yu,Tu,ZU,Yv,Tv,ZV,g3,UM,UP,ZN,ZDL,ZDR,ZEL,ZER,ZUL,ZUR,               & 
& ZVL,ZVR,pG,cplAhAhAh,cplAhAhhh,cplAhhhhh,cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,           & 
& cplAhSucSu,cplAhSvcSv,cplhhhhhh,cplhhHpmcHpm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,         & 
& cplhhSvcSv,cplHpmSucSd,cplHpmSvcSe,cplSdcHpmcSu,cplSecHpmcSv,cplSdcSdVG,               & 
& cplSucSuVG,cplVGVGVG,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFvFvAhL,cplcFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,cplChaFucSdL,cplChaFucSdR,       & 
& cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,       & 
& cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,         & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,       & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFdGluSdL,cplcFdGluSdR,           & 
& cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,     & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplGluGluVGL,cplGluGluVGR)

Call CouplingsForEffPot4(lam,kap,ZA,ZH,ZP,Yd,ZD,Ye,ZE,Yu,ZU,Yv,ZV,g3,cplAhAhAhAh,     & 
& cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvcSv,        & 
& cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvcSv,        & 
& cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvcHpmcSv,     & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSeSecSecSe,cplSeSvcSecSv,cplSuSucSucSu,   & 
& cplSuSvcSucSv,cplSvSvcSvcSv,cplSdcSdVGVG,cplSucSuVGVG)



!! ------------------------------------------------- 
!! Calculate derivative of effective potential      
!! ------------------------------------------------- 



Q2 = getRenormalizationScale()
ti2L = 0._dp
result = ZeroC
results1 = ZeroC
results2 = ZeroC
Do iv1=1,6
! ----- Topology1 (sunrise): diagrams w. 3 Particles and 2 Vertices

! ----- diagrams of type SSS, 16 ------ 
! ---- Ah,Ah,Ah ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhAhAh(i1,i2,i3)
coup2 = cplAhAhAh(i1,i2,i3)
dcoup1 = dcplAhAhAh(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MAh2(i2),MAh2(i3),dMAh2(i1,iv1)             & 
& ,dMAh2(i2,iv1),dMAh2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 1._dp/12._dp
colorfactor = 1
results1(1)=results1(1) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Ah, Ah]' 
    End Do
  End Do
End Do
! ---- Ah,Ah,hh ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhAhhh(i1,i2,i3)
coup2 = cplAhAhhh(i1,i2,i3)
dcoup1 = dcplAhAhhh(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MAh2(i2),Mhh2(i3),dMAh2(i1,iv1)             & 
& ,dMAh2(i2,iv1),dMhh2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.25_dp
colorfactor = 1
results1(2)=results1(2) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Ah, hh]' 
    End Do
  End Do
End Do
! ---- Ah,hh,hh ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhhhhh(i1,i2,i3)
coup2 = cplAhhhhh(i1,i2,i3)
dcoup1 = dcplAhhhhh(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),Mhh2(i2),Mhh2(i3),dMAh2(i1,iv1)             & 
& ,dMhh2(i2,iv1),dMhh2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.25_dp
colorfactor = 1
results1(3)=results1(3) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, hh, hh]' 
    End Do
  End Do
End Do
! ---- Ah,Hpm,conj[Hpm] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,2
coup1 = cplAhHpmcHpm(i1,i2,i3)
coup2 = cplAhHpmcHpm(i1,i3,i2)
dcoup1 = dcplAhHpmcHpm(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MHpm2(i2),MHpm2(i3),dMAh2(i1,iv1)           & 
& ,dMHpm2(i2,iv1),dMHpm2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 1
results1(4)=results1(4) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Hpm, conj[Hpm]]' 
    End Do
  End Do
End Do
! ---- Ah,Sd,conj[Sd] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSdcSd(i1,i2,i3)
coup2 = cplAhSdcSd(i1,i3,i2)
dcoup1 = dcplAhSdcSd(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MSd2(i2),MSd2(i3),dMAh2(i1,iv1)             & 
& ,dMSd2(i2,iv1),dMSd2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 3
results1(5)=results1(5) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Sd, conj[Sd]]' 
    End Do
  End Do
End Do
! ---- Ah,Se,conj[Se] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSecSe(i1,i2,i3)
coup2 = cplAhSecSe(i1,i3,i2)
dcoup1 = dcplAhSecSe(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MSe2(i2),MSe2(i3),dMAh2(i1,iv1)             & 
& ,dMSe2(i2,iv1),dMSe2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 1
results1(6)=results1(6) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Se, conj[Se]]' 
    End Do
  End Do
End Do
! ---- Ah,Su,conj[Su] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSucSu(i1,i2,i3)
coup2 = cplAhSucSu(i1,i3,i2)
dcoup1 = dcplAhSucSu(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MSu2(i2),MSu2(i3),dMAh2(i1,iv1)             & 
& ,dMSu2(i2,iv1),dMSu2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 3
results1(7)=results1(7) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Su, conj[Su]]' 
    End Do
  End Do
End Do
! ---- Ah,Sv,conj[Sv] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplAhSvcSv(i1,i2,i3)
coup2 = cplAhSvcSv(i1,i3,i2)
dcoup1 = dcplAhSvcSv(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MAh2(i1),MSv2(i2),MSv2(i3),dMAh2(i1,iv1)             & 
& ,dMSv2(i2,iv1),dMSv2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 1
results1(8)=results1(8) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Ah, Sv, conj[Sv]]' 
    End Do
  End Do
End Do
! ---- hh,hh,hh ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhhhhh(i1,i2,i3)
coup2 = cplhhhhhh(i1,i2,i3)
dcoup1 = dcplhhhhhh(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(Mhh2(i1),Mhh2(i2),Mhh2(i3),dMhh2(i1,iv1)             & 
& ,dMhh2(i2,iv1),dMhh2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 1._dp/12._dp
colorfactor = 1
results1(9)=results1(9) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, hh, hh]' 
    End Do
  End Do
End Do
! ---- hh,Hpm,conj[Hpm] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,2
coup1 = cplhhHpmcHpm(i1,i2,i3)
coup2 = cplhhHpmcHpm(i1,i3,i2)
dcoup1 = dcplhhHpmcHpm(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(Mhh2(i1),MHpm2(i2),MHpm2(i3),dMhh2(i1,iv1)           & 
& ,dMHpm2(i2,iv1),dMHpm2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 1
results1(10)=results1(10) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Hpm, conj[Hpm]]' 
    End Do
  End Do
End Do
! ---- hh,Sd,conj[Sd] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSdcSd(i1,i2,i3)
coup2 = cplhhSdcSd(i1,i3,i2)
dcoup1 = dcplhhSdcSd(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(Mhh2(i1),MSd2(i2),MSd2(i3),dMhh2(i1,iv1)             & 
& ,dMSd2(i2,iv1),dMSd2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 3
results1(11)=results1(11) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Sd, conj[Sd]]' 
    End Do
  End Do
End Do
! ---- hh,Se,conj[Se] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSecSe(i1,i2,i3)
coup2 = cplhhSecSe(i1,i3,i2)
dcoup1 = dcplhhSecSe(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(Mhh2(i1),MSe2(i2),MSe2(i3),dMhh2(i1,iv1)             & 
& ,dMSe2(i2,iv1),dMSe2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 1
results1(12)=results1(12) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Se, conj[Se]]' 
    End Do
  End Do
End Do
! ---- hh,Su,conj[Su] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSucSu(i1,i2,i3)
coup2 = cplhhSucSu(i1,i3,i2)
dcoup1 = dcplhhSucSu(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(Mhh2(i1),MSu2(i2),MSu2(i3),dMhh2(i1,iv1)             & 
& ,dMSu2(i2,iv1),dMSu2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 3
results1(13)=results1(13) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Su, conj[Su]]' 
    End Do
  End Do
End Do
! ---- hh,Sv,conj[Sv] ----
Do i1=1,6
 Do i2=1,6
    Do i3=1,6
coup1 = cplhhSvcSv(i1,i2,i3)
coup2 = cplhhSvcSv(i1,i3,i2)
dcoup1 = dcplhhSvcSv(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(Mhh2(i1),MSv2(i2),MSv2(i3),dMhh2(i1,iv1)             & 
& ,dMSv2(i2,iv1),dMSv2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 1
results1(14)=results1(14) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[hh, Sv, conj[Sv]]' 
    End Do
  End Do
End Do
! ---- Sd,conj[Hpm],conj[Su] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,6
coup1 = cplSdcHpmcSu(i1,i2,i3)
coup2 = cplHpmSucSd(i2,i3,i1)
dcoup1 = dcplSdcHpmcSu(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MSd2(i1),MHpm2(i2),MSu2(i3),dMSd2(i1,iv1)            & 
& ,dMHpm2(i2,iv1),dMSu2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 1._dp
colorfactor = 3
results1(15)=results1(15) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Sd, conj[Hpm], conj[Su]]' 
    End Do
  End Do
End Do
! ---- Se,conj[Hpm],conj[Sv] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,6
coup1 = cplSecHpmcSv(i1,i2,i3)
coup2 = cplHpmSvcSe(i2,i3,i1)
dcoup1 = dcplSecHpmcSv(i1,i2,i3,iv1)
coupx=abs(coup1)**2 
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MSe2(i1),MHpm2(i2),MSv2(i3),dMSe2(i1,iv1)            & 
& ,dMHpm2(i2,iv1),dMSv2(i3,iv1),coupx,dcoupx,'SSS   ',Q2,temp)
coeff = 1._dp
colorfactor = 1
results1(16)=results1(16) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSS C[Se, conj[Hpm], conj[Sv]]' 
    End Do
  End Do
End Do
! ----- diagrams of type FFS, 25 ------ 
! ---- Ah,Cha,bar[Cha] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,2
coup1L = cplcChaChaAhL(i3,i2,i1)
coup1R = cplcChaChaAhR(i3,i2,i1)
coup2L = cplcChaChaAhL(i2,i3,i1)
coup2R = cplcChaChaAhR(i2,i3,i1)
dcoup1L = dcplcChaChaAhL(i3,i2,i1,iv1)
dcoup1R = dcplcChaChaAhR(i3,i2,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MCha2(i3),MCha2(i2),MAh2(i1),dMCha2(i3,iv1)          & 
& ,dMCha2(i2,iv1),dMAh2(i1,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MCha2(i3),MCha2(i2),MAh2(i1),dMCha2(i3,iv1)          & 
& ,dMCha2(i2,iv1),dMAh2(i1,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 1
results1(17)=results1(17) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Cha, bar[Cha]]' 
coeffbar = 0.5_dp
results1(17)=results1(17) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Ah,Chi,Chi ----
Do i1=1,6
 Do i2=1,9
    Do i3=1,9
coup1L = cplChiChiAhL(i2,i3,i1)
coup1R = cplChiChiAhR(i2,i3,i1)
coup2L = cplChiChiAhL(i2,i3,i1)
coup2R = cplChiChiAhR(i2,i3,i1)
dcoup1L = dcplChiChiAhL(i2,i3,i1,iv1)
dcoup1R = dcplChiChiAhR(i2,i3,i1,iv1)
coupx=(abs(coup1L)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L) 
coupxbar=Real(coup1L**2,dp) 
dcoupxbar=Real(2*dcoup1L*coup1L,dp) 
Call FirstDerivativeVeff_sunrise(MChi2(i3),MChi2(i2),MAh2(i1),dMChi2(i3,iv1)          & 
& ,dMChi2(i2,iv1),dMAh2(i1,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MChi2(i3),MChi2(i2),MAh2(i1),dMChi2(i3,iv1)          & 
& ,dMChi2(i2,iv1),dMAh2(i1,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 1
results1(18)=results1(18) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Chi, Chi]' 
coeffbar = 0.5_dp
results1(18)=results1(18) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Ah,Fd,bar[Fd] ----
Do i1=1,6
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFdFdAhL(i3,i2,i1)
coup1R = cplcFdFdAhR(i3,i2,i1)
coup2L = cplcFdFdAhL(i2,i3,i1)
coup2R = cplcFdFdAhR(i2,i3,i1)
dcoup1L = dcplcFdFdAhL(i3,i2,i1,iv1)
dcoup1R = dcplcFdFdAhR(i3,i2,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFd2(i2),MAh2(i1),dMFd2(i3,iv1)             & 
& ,dMFd2(i2,iv1),dMAh2(i1,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFd2(i2),MAh2(i1),dMFd2(i3,iv1)             & 
& ,dMFd2(i2,iv1),dMAh2(i1,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 3
results1(19)=results1(19) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fd, bar[Fd]]' 
coeffbar = 0.5_dp
results1(19)=results1(19) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Ah,Fe,bar[Fe] ----
Do i1=1,6
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFeFeAhL(i3,i2,i1)
coup1R = cplcFeFeAhR(i3,i2,i1)
coup2L = cplcFeFeAhL(i2,i3,i1)
coup2R = cplcFeFeAhR(i2,i3,i1)
dcoup1L = dcplcFeFeAhL(i3,i2,i1,iv1)
dcoup1R = dcplcFeFeAhR(i3,i2,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFe2(i3),MFe2(i2),MAh2(i1),dMFe2(i3,iv1)             & 
& ,dMFe2(i2,iv1),dMAh2(i1,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFe2(i3),MFe2(i2),MAh2(i1),dMFe2(i3,iv1)             & 
& ,dMFe2(i2,iv1),dMAh2(i1,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 1
results1(20)=results1(20) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fe, bar[Fe]]' 
coeffbar = 0.5_dp
results1(20)=results1(20) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Ah,Fu,bar[Fu] ----
Do i1=1,6
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFuFuAhL(i3,i2,i1)
coup1R = cplcFuFuAhR(i3,i2,i1)
coup2L = cplcFuFuAhL(i2,i3,i1)
coup2R = cplcFuFuAhR(i2,i3,i1)
dcoup1L = dcplcFuFuAhL(i3,i2,i1,iv1)
dcoup1R = dcplcFuFuAhR(i3,i2,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFu2(i3),MFu2(i2),MAh2(i1),dMFu2(i3,iv1)             & 
& ,dMFu2(i2,iv1),dMAh2(i1,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFu2(i3),MFu2(i2),MAh2(i1),dMFu2(i3,iv1)             & 
& ,dMFu2(i2,iv1),dMAh2(i1,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 3
results1(21)=results1(21) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fu, bar[Fu]]' 
coeffbar = 0.5_dp
results1(21)=results1(21) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Ah,Fv,bar[Fv] ----
Do i1=1,6
 Do i2=1,3
    Do i3=1,3
coup1L = cplcFvFvAhL(i3,i2,i1)
coup1R = cplcFvFvAhR(i3,i2,i1)
coup2L = cplcFvFvAhL(i2,i3,i1)
coup2R = cplcFvFvAhR(i2,i3,i1)
dcoup1L = dcplcFvFvAhL(i3,i2,i1,iv1)
dcoup1R = dcplcFvFvAhR(i3,i2,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFv2(i3),MFv2(i2),MAh2(i1),dMFv2(i3,iv1)             & 
& ,dMFv2(i2,iv1),dMAh2(i1,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFv2(i3),MFv2(i2),MAh2(i1),dMFv2(i3,iv1)             & 
& ,dMFv2(i2,iv1),dMAh2(i1,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 1
results1(22)=results1(22) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Ah, Fv, bar[Fv]]' 
coeffbar = 0.5_dp
results1(22)=results1(22) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Cha,hh,bar[Cha] ----
Do i1=1,2
 Do i2=1,6
    Do i3=1,2
coup1L = cplcChaChahhL(i3,i1,i2)
coup1R = cplcChaChahhR(i3,i1,i2)
coup2L = cplcChaChahhL(i1,i3,i2)
coup2R = cplcChaChahhR(i1,i3,i2)
dcoup1L = dcplcChaChahhL(i3,i1,i2,iv1)
dcoup1R = dcplcChaChahhR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MCha2(i3),MCha2(i1),Mhh2(i2),dMCha2(i3,iv1)          & 
& ,dMCha2(i1,iv1),dMhh2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MCha2(i3),MCha2(i1),Mhh2(i2),dMCha2(i3,iv1)          & 
& ,dMCha2(i1,iv1),dMhh2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 1
results1(23)=results1(23) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Cha, hh, bar[Cha]]' 
coeffbar = 0.5_dp
results1(23)=results1(23) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Chi,Chi,hh ----
Do i1=1,9
 Do i2=1,9
    Do i3=1,6
coup1L = cplChiChihhL(i1,i2,i3)
coup1R = cplChiChihhR(i1,i2,i3)
coup2L = cplChiChihhL(i1,i2,i3)
coup2R = cplChiChihhR(i1,i2,i3)
dcoup1L = dcplChiChihhL(i1,i2,i3,iv1)
dcoup1R = dcplChiChihhR(i1,i2,i3,iv1)
coupx=(abs(coup1L)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L) 
coupxbar=Real(coup1L**2,dp) 
dcoupxbar=Real(2*dcoup1L*coup1L,dp) 
Call FirstDerivativeVeff_sunrise(MChi2(i2),MChi2(i1),Mhh2(i3),dMChi2(i2,iv1)          & 
& ,dMChi2(i1,iv1),dMhh2(i3,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MChi2(i2),MChi2(i1),Mhh2(i3),dMChi2(i2,iv1)          & 
& ,dMChi2(i1,iv1),dMhh2(i3,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 1
results1(24)=results1(24) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Chi, hh]' 
coeffbar = 0.5_dp
results1(24)=results1(24) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Chi,Hpm,bar[Cha] ----
Do i1=1,9
 Do i2=1,2
    Do i3=1,2
coup1L = cplcChaChiHpmL(i3,i1,i2)
coup1R = cplcChaChiHpmR(i3,i1,i2)
coup2L = cplChiChacHpmL(i1,i3,i2)
coup2R = cplChiChacHpmR(i1,i3,i2)
dcoup1L = dcplcChaChiHpmL(i3,i1,i2,iv1)
dcoup1R = dcplcChaChiHpmR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MCha2(i3),MChi2(i1),MHpm2(i2),dMCha2(i3,iv1)         & 
& ,dMChi2(i1,iv1),dMHpm2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MCha2(i3),MChi2(i1),MHpm2(i2),dMCha2(i3,iv1)         & 
& ,dMChi2(i1,iv1),dMHpm2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 1
results1(25)=results1(25) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Hpm, bar[Cha]]' 
coeffbar = 1._dp
results1(25)=results1(25) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Chi,Sd,bar[Fd] ----
Do i1=1,9
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFdChiSdL(i3,i1,i2)
coup1R = cplcFdChiSdR(i3,i1,i2)
coup2L = cplChiFdcSdL(i1,i3,i2)
coup2R = cplChiFdcSdR(i1,i3,i2)
dcoup1L = dcplcFdChiSdL(i3,i1,i2,iv1)
dcoup1R = dcplcFdChiSdR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFd2(i3),MChi2(i1),MSd2(i2),dMFd2(i3,iv1)            & 
& ,dMChi2(i1,iv1),dMSd2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFd2(i3),MChi2(i1),MSd2(i2),dMFd2(i3,iv1)            & 
& ,dMChi2(i1,iv1),dMSd2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 3
results1(26)=results1(26) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Sd, bar[Fd]]' 
coeffbar = 1._dp
results1(26)=results1(26) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Chi,Se,bar[Fe] ----
Do i1=1,9
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFeChiSeL(i3,i1,i2)
coup1R = cplcFeChiSeR(i3,i1,i2)
coup2L = cplChiFecSeL(i1,i3,i2)
coup2R = cplChiFecSeR(i1,i3,i2)
dcoup1L = dcplcFeChiSeL(i3,i1,i2,iv1)
dcoup1R = dcplcFeChiSeR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFe2(i3),MChi2(i1),MSe2(i2),dMFe2(i3,iv1)            & 
& ,dMChi2(i1,iv1),dMSe2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFe2(i3),MChi2(i1),MSe2(i2),dMFe2(i3,iv1)            & 
& ,dMChi2(i1,iv1),dMSe2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 1
results1(27)=results1(27) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Se, bar[Fe]]' 
coeffbar = 1._dp
results1(27)=results1(27) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Chi,Su,bar[Fu] ----
Do i1=1,9
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFuChiSuL(i3,i1,i2)
coup1R = cplcFuChiSuR(i3,i1,i2)
coup2L = cplChiFucSuL(i1,i3,i2)
coup2R = cplChiFucSuR(i1,i3,i2)
dcoup1L = dcplcFuChiSuL(i3,i1,i2,iv1)
dcoup1R = dcplcFuChiSuR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFu2(i3),MChi2(i1),MSu2(i2),dMFu2(i3,iv1)            & 
& ,dMChi2(i1,iv1),dMSu2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFu2(i3),MChi2(i1),MSu2(i2),dMFu2(i3,iv1)            & 
& ,dMChi2(i1,iv1),dMSu2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 3
results1(28)=results1(28) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Su, bar[Fu]]' 
coeffbar = 1._dp
results1(28)=results1(28) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Chi,Sv,bar[Fv] ----
Do i1=1,9
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFvChiSvL(i3,i1,i2)
coup1R = cplcFvChiSvR(i3,i1,i2)
coup2L = cplChiFvcSvL(i1,i3,i2)
coup2R = cplChiFvcSvR(i1,i3,i2)
dcoup1L = dcplcFvChiSvL(i3,i1,i2,iv1)
dcoup1R = dcplcFvChiSvR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFv2(i3),MChi2(i1),MSv2(i2),dMFv2(i3,iv1)            & 
& ,dMChi2(i1,iv1),dMSv2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFv2(i3),MChi2(i1),MSv2(i2),dMFv2(i3,iv1)            & 
& ,dMChi2(i1,iv1),dMSv2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 1
results1(29)=results1(29) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Chi, Sv, bar[Fv]]' 
coeffbar = 1._dp
results1(29)=results1(29) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fd,hh,bar[Fd] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFdFdhhL(i3,i1,i2)
coup1R = cplcFdFdhhR(i3,i1,i2)
coup2L = cplcFdFdhhL(i1,i3,i2)
coup2R = cplcFdFdhhR(i1,i3,i2)
dcoup1L = dcplcFdFdhhL(i3,i1,i2,iv1)
dcoup1R = dcplcFdFdhhR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),Mhh2(i2),dMFd2(i3,iv1)             & 
& ,dMFd2(i1,iv1),dMhh2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),Mhh2(i2),dMFd2(i3,iv1)             & 
& ,dMFd2(i1,iv1),dMhh2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 3
results1(30)=results1(30) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fd, hh, bar[Fd]]' 
coeffbar = 0.5_dp
results1(30)=results1(30) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fd,bar[Cha],conj[Su] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,6
coup1L = cplcChaFdcSuL(i2,i1,i3)
coup1R = cplcChaFdcSuR(i2,i1,i3)
coup2L = cplcFdChaSuL(i1,i2,i3)
coup2R = cplcFdChaSuR(i1,i2,i3)
dcoup1L = dcplcChaFdcSuL(i2,i1,i3,iv1)
dcoup1R = dcplcChaFdcSuR(i2,i1,i3,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MCha2(i2),MFd2(i1),MSu2(i3),dMCha2(i2,iv1)           & 
& ,dMFd2(i1,iv1),dMSu2(i3,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MCha2(i2),MFd2(i1),MSu2(i3),dMCha2(i2,iv1)           & 
& ,dMFd2(i1,iv1),dMSu2(i3,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 3
results1(31)=results1(31) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fd, bar[Cha], conj[Su]]' 
coeffbar = 1._dp
results1(31)=results1(31) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fe,hh,bar[Fe] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFeFehhL(i3,i1,i2)
coup1R = cplcFeFehhR(i3,i1,i2)
coup2L = cplcFeFehhL(i1,i3,i2)
coup2R = cplcFeFehhR(i1,i3,i2)
dcoup1L = dcplcFeFehhL(i3,i1,i2,iv1)
dcoup1R = dcplcFeFehhR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFe2(i3),MFe2(i1),Mhh2(i2),dMFe2(i3,iv1)             & 
& ,dMFe2(i1,iv1),dMhh2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFe2(i3),MFe2(i1),Mhh2(i2),dMFe2(i3,iv1)             & 
& ,dMFe2(i1,iv1),dMhh2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 1
results1(32)=results1(32) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fe, hh, bar[Fe]]' 
coeffbar = 0.5_dp
results1(32)=results1(32) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fe,bar[Cha],conj[Sv] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,6
coup1L = cplcChaFecSvL(i2,i1,i3)
coup1R = cplcChaFecSvR(i2,i1,i3)
coup2L = cplcFeChaSvL(i1,i2,i3)
coup2R = cplcFeChaSvR(i1,i2,i3)
dcoup1L = dcplcChaFecSvL(i2,i1,i3,iv1)
dcoup1R = dcplcChaFecSvR(i2,i1,i3,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MCha2(i2),MFe2(i1),MSv2(i3),dMCha2(i2,iv1)           & 
& ,dMFe2(i1,iv1),dMSv2(i3,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MCha2(i2),MFe2(i1),MSv2(i3),dMCha2(i2,iv1)           & 
& ,dMFe2(i1,iv1),dMSv2(i3,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 1
results1(33)=results1(33) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fe, bar[Cha], conj[Sv]]' 
coeffbar = 1._dp
results1(33)=results1(33) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fu,hh,bar[Fu] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFuFuhhL(i3,i1,i2)
coup1R = cplcFuFuhhR(i3,i1,i2)
coup2L = cplcFuFuhhL(i1,i3,i2)
coup2R = cplcFuFuhhR(i1,i3,i2)
dcoup1L = dcplcFuFuhhL(i3,i1,i2,iv1)
dcoup1R = dcplcFuFuhhR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),Mhh2(i2),dMFu2(i3,iv1)             & 
& ,dMFu2(i1,iv1),dMhh2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),Mhh2(i2),dMFu2(i3,iv1)             & 
& ,dMFu2(i1,iv1),dMhh2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 3
results1(34)=results1(34) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fu, hh, bar[Fu]]' 
coeffbar = 0.5_dp
results1(34)=results1(34) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fu,Hpm,bar[Fd] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,3
coup1L = cplcFdFuHpmL(i3,i1,i2)
coup1R = cplcFdFuHpmR(i3,i1,i2)
coup2L = cplcFuFdcHpmL(i1,i3,i2)
coup2R = cplcFuFdcHpmR(i1,i3,i2)
dcoup1L = dcplcFdFuHpmL(i3,i1,i2,iv1)
dcoup1R = dcplcFdFuHpmR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFu2(i1),MHpm2(i2),dMFd2(i3,iv1)            & 
& ,dMFu2(i1,iv1),dMHpm2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFu2(i1),MHpm2(i2),dMFd2(i3,iv1)            & 
& ,dMFu2(i1,iv1),dMHpm2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 3
results1(35)=results1(35) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fu, Hpm, bar[Fd]]' 
coeffbar = 1._dp
results1(35)=results1(35) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fv,hh,bar[Fv] ----
Do i1=1,3
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFvFvhhL(i3,i1,i2)
coup1R = cplcFvFvhhR(i3,i1,i2)
coup2L = cplcFvFvhhL(i1,i3,i2)
coup2R = cplcFvFvhhR(i1,i3,i2)
dcoup1L = dcplcFvFvhhL(i3,i1,i2,iv1)
dcoup1R = dcplcFvFvhhR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFv2(i3),MFv2(i1),Mhh2(i2),dMFv2(i3,iv1)             & 
& ,dMFv2(i1,iv1),dMhh2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFv2(i3),MFv2(i1),Mhh2(i2),dMFv2(i3,iv1)             & 
& ,dMFv2(i1,iv1),dMhh2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 0.5_dp
colorfactor = 1
results1(36)=results1(36) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fv, hh, bar[Fv]]' 
coeffbar = 0.5_dp
results1(36)=results1(36) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Fv,Hpm,bar[Fe] ----
Do i1=1,3
 Do i2=1,2
    Do i3=1,3
coup1L = cplcFeFvHpmL(i3,i1,i2)
coup1R = cplcFeFvHpmR(i3,i1,i2)
coup2L = cplcFvFecHpmL(i1,i3,i2)
coup2R = cplcFvFecHpmR(i1,i3,i2)
dcoup1L = dcplcFeFvHpmL(i3,i1,i2,iv1)
dcoup1R = dcplcFeFvHpmR(i3,i1,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFe2(i3),MFv2(i1),MHpm2(i2),dMFe2(i3,iv1)            & 
& ,dMFv2(i1,iv1),dMHpm2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFe2(i3),MFv2(i1),MHpm2(i2),dMFe2(i3,iv1)            & 
& ,dMFv2(i1,iv1),dMHpm2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 1
results1(37)=results1(37) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Fv, Hpm, bar[Fe]]' 
coeffbar = 1._dp
results1(37)=results1(37) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Glu,Sd,bar[Fd] ----
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFdGluSdL(i3,i2)
coup1R = cplcFdGluSdR(i3,i2)
coup2L = cplGluFdcSdL(i3,i2)
coup2R = cplGluFdcSdR(i3,i2)
dcoup1L = dcplcFdGluSdL(i3,i2,iv1)
dcoup1R = dcplcFdGluSdR(i3,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFd2(i3),MGlu2,MSd2(i2),dMFd2(i3,iv1),dMGlu2(1,iv1)  & 
& ,dMSd2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFd2(i3),MGlu2,MSd2(i2),dMFd2(i3,iv1),dMGlu2(1,iv1)  & 
& ,dMSd2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 4
results1(38)=results1(38) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Glu, Sd, bar[Fd]]' 
coeffbar = 1._dp
results1(38)=results1(38) + coeffbar*colorfactor*tempbar
    End Do
  End Do
! ---- Glu,Su,bar[Fu] ----
 Do i2=1,6
    Do i3=1,3
coup1L = cplcFuGluSuL(i3,i2)
coup1R = cplcFuGluSuR(i3,i2)
coup2L = cplGluFucSuL(i3,i2)
coup2R = cplGluFucSuR(i3,i2)
dcoup1L = dcplcFuGluSuL(i3,i2,iv1)
dcoup1R = dcplcFuGluSuR(i3,i2,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFu2(i3),MGlu2,MSu2(i2),dMFu2(i3,iv1),dMGlu2(1,iv1)  & 
& ,dMSu2(i2,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFu2(i3),MGlu2,MSu2(i2),dMFu2(i3,iv1),dMGlu2(1,iv1)  & 
& ,dMSu2(i2,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 4
results1(39)=results1(39) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Glu, Su, bar[Fu]]' 
coeffbar = 1._dp
results1(39)=results1(39) + coeffbar*colorfactor*tempbar
    End Do
  End Do
! ---- Sd,bar[Cha],bar[Fu] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,3
coup1L = cplcChacFuSdL(i2,i3,i1)
coup1R = cplcChacFuSdR(i2,i3,i1)
coup2L = cplChaFucSdL(i2,i3,i1)
coup2R = cplChaFucSdR(i2,i3,i1)
dcoup1L = dcplcChacFuSdL(i2,i3,i1,iv1)
dcoup1R = dcplcChacFuSdR(i2,i3,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFu2(i3),MCha2(i2),MSd2(i1),dMFu2(i3,iv1)            & 
& ,dMCha2(i2,iv1),dMSd2(i1,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFu2(i3),MCha2(i2),MSd2(i1),dMFu2(i3,iv1)            & 
& ,dMCha2(i2,iv1),dMSd2(i1,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 3
results1(40)=results1(40) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Sd, bar[Cha], bar[Fu]]' 
coeffbar = 1._dp
results1(40)=results1(40) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ---- Se,bar[Cha],bar[Fv] ----
Do i1=1,6
 Do i2=1,2
    Do i3=1,3
coup1L = cplcChacFvSeL(i2,i3,i1)
coup1R = cplcChacFvSeR(i2,i3,i1)
coup2L = cplChaFvcSeL(i2,i3,i1)
coup2R = cplChaFvcSeR(i2,i3,i1)
dcoup1L = dcplcChacFvSeL(i2,i3,i1,iv1)
dcoup1R = dcplcChacFvSeR(i2,i3,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFv2(i3),MCha2(i2),MSe2(i1),dMFv2(i3,iv1)            & 
& ,dMCha2(i2,iv1),dMSe2(i1,iv1),coupx,dcoupx,'FFS   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFv2(i3),MCha2(i2),MSe2(i1),dMFv2(i3,iv1)            & 
& ,dMCha2(i2,iv1),dMSe2(i1,iv1),coupxbar,dcoupxbar,'FFSbar',Q2,tempbar)
coeff = 1._dp
colorfactor = 1
results1(41)=results1(41) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFS C[Se, bar[Cha], bar[Fv]]' 
coeffbar = 1._dp
results1(41)=results1(41) + coeffbar*colorfactor*tempbar
    End Do
  End Do
End Do
! ----- diagrams of type SSV, 2 ------ 
! ---- Sd,VG,conj[Sd] ----
Do i1=1,6
    Do i3=1,6
coup1 = cplSdcSdVG(i1,i3)
coup2 = cplSdcSdVG(i3,i1)
dcoup1 = dcplSdcSdVG(i1,i3,iv1)
coupx=abs(coup1)**2
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MSd2(i3),MSd2(i1),0._dp,dMSd2(i3,iv1),dMSd2(i1,iv1)  & 
& ,ZeroC,coupx,dcoupx,'SSV   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 4
results1(42)=results1(42) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSV C[Sd, VG, conj[Sd]]' 
    End Do
End Do
! ---- Su,VG,conj[Su] ----
Do i1=1,6
    Do i3=1,6
coup1 = cplSucSuVG(i1,i3)
coup2 = cplSucSuVG(i3,i1)
dcoup1 = dcplSucSuVG(i1,i3,iv1)
coupx=abs(coup1)**2
dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) 
Call FirstDerivativeVeff_sunrise(MSu2(i3),MSu2(i1),0._dp,dMSu2(i3,iv1),dMSu2(i1,iv1)  & 
& ,ZeroC,coupx,dcoupx,'SSV   ',Q2,temp)
coeff = 0.5_dp
colorfactor = 4
results1(43)=results1(43) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SSV C[Su, VG, conj[Su]]' 
    End Do
End Do
! ----- diagrams of type FFV, 3 ------ 
! ---- Fd,VG,bar[Fd] ----
Do i1=1,3
    Do i3=1,3
coup1L = cplcFdFdVGL(i3,i1)
coup1R = cplcFdFdVGR(i3,i1)
coup2L = cplcFdFdVGL(i1,i3)
coup2R = cplcFdFdVGR(i1,i3)
dcoup1L = dcplcFdFdVGL(i3,i1,iv1)
dcoup1R = dcplcFdFdVGR(i3,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=-2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=-2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),0._dp,dMFd2(i3,iv1),dMFd2(i1,iv1)  & 
& ,ZeroC,coupx,dcoupx,'FFV   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFd2(i3),MFd2(i1),0._dp,dMFd2(i3,iv1),dMFd2(i1,iv1)  & 
& ,ZeroC,coupxbar,dcoupxbar,'FFVbar',Q2,temp)
coeff = 0.5_dp
colorfactor = 4
results1(44)=results1(44) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFV C[Fd, VG, bar[Fd]]' 
coeffbar = 0.5_dp
results1(44)=results1(44) + coeffbar*colorfactor*tempbar
    End Do
End Do
! ---- Fu,VG,bar[Fu] ----
Do i1=1,3
    Do i3=1,3
coup1L = cplcFuFuVGL(i3,i1)
coup1R = cplcFuFuVGR(i3,i1)
coup2L = cplcFuFuVGL(i1,i3)
coup2R = cplcFuFuVGR(i1,i3)
dcoup1L = dcplcFuFuVGL(i3,i1,iv1)
dcoup1R = dcplcFuFuVGR(i3,i1,iv1)
coupx=(abs(coup1L)**2+abs(coup1R)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) 
coupxbar=-2*Real(coup1L*conjg(coup1R),dp) 
dcoupxbar=-2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) 
Call FirstDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),0._dp,dMFu2(i3,iv1),dMFu2(i1,iv1)  & 
& ,ZeroC,coupx,dcoupx,'FFV   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MFu2(i3),MFu2(i1),0._dp,dMFu2(i3,iv1),dMFu2(i1,iv1)  & 
& ,ZeroC,coupxbar,dcoupxbar,'FFVbar',Q2,temp)
coeff = 0.5_dp
colorfactor = 4
results1(45)=results1(45) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFV C[Fu, VG, bar[Fu]]' 
coeffbar = 0.5_dp
results1(45)=results1(45) + coeffbar*colorfactor*tempbar
    End Do
End Do
! ---- Glu,Glu,VG ----
coup1L = cplGluGluVGL
coup1R = cplGluGluVGR
coup2L = cplGluGluVGL
coup2R = cplGluGluVGR
dcoup1L = dcplGluGluVGL(iv1)
dcoup1R = dcplGluGluVGR(iv1)
coupx=(abs(coup1L)**2) 
dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L) 
coupxbar=Real(coup1L**2,dp) 
dcoupxbar=Real(2*dcoup1L*coup1L,dp) 
Call FirstDerivativeVeff_sunrise(MGlu2,MGlu2,0._dp,dMGlu2(1,iv1),dMGlu2(1,iv1)        & 
& ,ZeroC,coupx,dcoupx,'FFV   ',Q2,temp)
Call FirstDerivativeVeff_sunrise(MGlu2,MGlu2,0._dp,dMGlu2(1,iv1),dMGlu2(1,iv1)        & 
& ,ZeroC,coupxbar,dcoupxbar,'FFVbar',Q2,temp)
coeff = 0.5_dp
colorfactor = 24
results1(46)=results1(46) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at FFV C[Glu, Glu, VG]' 
coeffbar = 0.5_dp
results1(46)=results1(46) + coeffbar*colorfactor*tempbar
! ----- diagrams of type VVV, 1 ------ 
! ---- VG,VG,VG ----
coup1 = cplVGVGVG
coup2 = cplVGVGVG
dcoup1 = dcplVGVGVG(iv1)
coeff = 0.0000
colorfactor = 24
results1(47)=results1(47) + coeff*colorfactor*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at VVV C[VG, VG, VG]' 
! ----- Topology2: diagrams w. 2 Particles and 1 Vertex

! ----- diagrams of type SS, 26 ------ 
! ---- Ah,Ah ----
Do i1=1,6
 Do i2=1,6
coup1 = cplAhAhAhAh(i1,i1,i2,i2)
dcoup1 = dcplAhAhAhAh(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MAh2(i1),MAh2(i2),dMAh2(i1,iv1),dMAh2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp/8._dp)
results2(1)=results2(1) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Ah, Ah]' 
  End Do
End Do
! ---- Ah,hh ----
Do i1=1,6
 Do i2=1,6
coup1 = cplAhAhhhhh(i1,i1,i2,i2)
dcoup1 = dcplAhAhhhhh(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MAh2(i1),Mhh2(i2),dMAh2(i1,iv1),dMhh2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.25_dp)
results2(2)=results2(2) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, hh, hh]' 
  End Do
End Do
! ---- Ah,Hpm ----
Do i1=1,6
 Do i2=1,2
coup1 = cplAhAhHpmcHpm(i1,i1,i2,i2)
dcoup1 = dcplAhAhHpmcHpm(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MAh2(i1),MHpm2(i2),dMAh2(i1,iv1),dMHpm2(i2,iv1)        & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(3)=results2(3) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Hpm, conj[Hpm]]' 
  End Do
End Do
! ---- Ah,Sd ----
Do i1=1,6
 Do i2=1,6
coup1 = cplAhAhSdcSd(i1,i1,i2,i2)
dcoup1 = dcplAhAhSdcSd(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MAh2(i1),MSd2(i2),dMAh2(i1,iv1),dMSd2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(4)=results2(4) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Sd, conj[Sd]]' 
  End Do
End Do
! ---- Ah,Se ----
Do i1=1,6
 Do i2=1,6
coup1 = cplAhAhSecSe(i1,i1,i2,i2)
dcoup1 = dcplAhAhSecSe(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MAh2(i1),MSe2(i2),dMAh2(i1,iv1),dMSe2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(5)=results2(5) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Se, conj[Se]]' 
  End Do
End Do
! ---- Ah,Su ----
Do i1=1,6
 Do i2=1,6
coup1 = cplAhAhSucSu(i1,i1,i2,i2)
dcoup1 = dcplAhAhSucSu(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MAh2(i1),MSu2(i2),dMAh2(i1,iv1),dMSu2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(6)=results2(6) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Su, conj[Su]]' 
  End Do
End Do
! ---- Ah,Sv ----
Do i1=1,6
 Do i2=1,6
coup1 = cplAhAhSvcSv(i1,i1,i2,i2)
dcoup1 = dcplAhAhSvcSv(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(MAh2(i1),MSv2(i2),dMAh2(i1,iv1),dMSv2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(7)=results2(7) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Ah, Ah, Sv, conj[Sv]]' 
  End Do
End Do
! ---- hh,hh ----
Do i1=1,6
 Do i2=1,6
coup1 = cplhhhhhhhh(i1,i1,i2,i2)
dcoup1 = dcplhhhhhhhh(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(Mhh2(i1),Mhh2(i2),dMhh2(i1,iv1),dMhh2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp/8._dp)
results2(8)=results2(8) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, hh, hh]' 
  End Do
End Do
! ---- hh,Hpm ----
Do i1=1,6
 Do i2=1,2
coup1 = cplhhhhHpmcHpm(i1,i1,i2,i2)
dcoup1 = dcplhhhhHpmcHpm(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(Mhh2(i1),MHpm2(i2),dMhh2(i1,iv1),dMHpm2(i2,iv1)        & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(9)=results2(9) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Hpm, conj[Hpm]]' 
  End Do
End Do
! ---- hh,Sd ----
Do i1=1,6
 Do i2=1,6
coup1 = cplhhhhSdcSd(i1,i1,i2,i2)
dcoup1 = dcplhhhhSdcSd(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(Mhh2(i1),MSd2(i2),dMhh2(i1,iv1),dMSd2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(10)=results2(10) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Sd, conj[Sd]]' 
  End Do
End Do
! ---- hh,Se ----
Do i1=1,6
 Do i2=1,6
coup1 = cplhhhhSecSe(i1,i1,i2,i2)
dcoup1 = dcplhhhhSecSe(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(Mhh2(i1),MSe2(i2),dMhh2(i1,iv1),dMSe2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(11)=results2(11) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Se, conj[Se]]' 
  End Do
End Do
! ---- hh,Su ----
Do i1=1,6
 Do i2=1,6
coup1 = cplhhhhSucSu(i1,i1,i2,i2)
dcoup1 = dcplhhhhSucSu(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(Mhh2(i1),MSu2(i2),dMhh2(i1,iv1),dMSu2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(12)=results2(12) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Su, conj[Su]]' 
  End Do
End Do
! ---- hh,Sv ----
Do i1=1,6
 Do i2=1,6
coup1 = cplhhhhSvcSv(i1,i1,i2,i2)
dcoup1 = dcplhhhhSvcSv(i1,i1,i2,i2,iv1)
Call FirstDerivativeVeff_balls(Mhh2(i1),MSv2(i2),dMhh2(i1,iv1),dMSv2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(13)=results2(13) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[hh, hh, Sv, conj[Sv]]' 
  End Do
End Do
! ---- Hpm,Hpm ----
Do i1=1,2
 Do i2=1,2
coup1 = cplHpmHpmcHpmcHpm(i1,i2,i1,i2)
dcoup1 = dcplHpmHpmcHpmcHpm(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MHpm2(i1),MHpm2(i2),dMHpm2(i1,iv1),dMHpm2(i2,iv1)      & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(14)=results2(14) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Hpm, conj[Hpm], conj[Hpm]]' 
  End Do
End Do
! ---- Hpm,Sd ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSdcHpmcSd(i1,i2,i1,i2)
dcoup1 = dcplHpmSdcHpmcSd(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MHpm2(i1),MSd2(i2),dMHpm2(i1,iv1),dMSd2(i2,iv1)        & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp)
results2(15)=results2(15) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Sd, conj[Hpm], conj[Sd]]' 
  End Do
End Do
! ---- Hpm,Se ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSecHpmcSe(i1,i2,i1,i2)
dcoup1 = dcplHpmSecHpmcSe(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MHpm2(i1),MSe2(i2),dMHpm2(i1,iv1),dMSe2(i2,iv1)        & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp)
results2(16)=results2(16) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Se, conj[Hpm], conj[Se]]' 
  End Do
End Do
! ---- Hpm,Su ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSucHpmcSu(i1,i2,i1,i2)
dcoup1 = dcplHpmSucHpmcSu(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MHpm2(i1),MSu2(i2),dMHpm2(i1,iv1),dMSu2(i2,iv1)        & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp)
results2(17)=results2(17) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Su, conj[Hpm], conj[Su]]' 
  End Do
End Do
! ---- Hpm,Sv ----
Do i1=1,2
 Do i2=1,6
coup1 = cplHpmSvcHpmcSv(i1,i2,i1,i2)
dcoup1 = dcplHpmSvcHpmcSv(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MHpm2(i1),MSv2(i2),dMHpm2(i1,iv1),dMSv2(i2,iv1)        & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp)
results2(18)=results2(18) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Hpm, Sv, conj[Hpm], conj[Sv]]' 
  End Do
End Do
! ---- Sd,Sd ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSdcSdcSd(i1,i2,i1,i2)
dcoup1 = dcplSdSdcSdcSd(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MSd2(i1),MSd2(i2),dMSd2(i1,iv1),dMSd2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(19)=results2(19) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Sd, Sd, conj[Sd], conj[Sd]]' 
  End Do
End Do
! ---- Sd,Se ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSecSdcSe(i1,i2,i1,i2)
dcoup1 = dcplSdSecSdcSe(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MSd2(i1),MSe2(i2),dMSd2(i1,iv1),dMSe2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp)
results2(20)=results2(20) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Sd, Se, conj[Sd], conj[Se]]' 
  End Do
End Do
! ---- Sd,Su ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSdSucSdcSu(i1,i2,i1,i2)
dcoup1 = dcplSdSucSdcSu(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MSd2(i1),MSu2(i2),dMSd2(i1,iv1),dMSu2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp)
results2(21)=results2(21) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Sd, Su, conj[Sd], conj[Su]]' 
  End Do
End Do
! ---- Se,Se ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSeSecSecSe(i1,i2,i1,i2)
dcoup1 = dcplSeSecSecSe(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MSe2(i1),MSe2(i2),dMSe2(i1,iv1),dMSe2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(22)=results2(22) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Se, Se, conj[Se], conj[Se]]' 
  End Do
End Do
! ---- Se,Sv ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSeSvcSecSv(i1,i2,i1,i2)
dcoup1 = dcplSeSvcSecSv(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MSe2(i1),MSv2(i2),dMSe2(i1,iv1),dMSv2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp)
results2(23)=results2(23) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Se, Sv, conj[Se], conj[Sv]]' 
  End Do
End Do
! ---- Su,Su ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSuSucSucSu(i1,i2,i1,i2)
dcoup1 = dcplSuSucSucSu(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MSu2(i1),MSu2(i2),dMSu2(i1,iv1),dMSu2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(24)=results2(24) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Su, Su, conj[Su], conj[Su]]' 
  End Do
End Do
! ---- Su,Sv ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSuSvcSucSv(i1,i2,i1,i2)
dcoup1 = dcplSuSvcSucSv(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MSu2(i1),MSv2(i2),dMSu2(i1,iv1),dMSv2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-1._dp)
results2(25)=results2(25) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Su, Sv, conj[Su], conj[Sv]]' 
  End Do
End Do
! ---- Sv,Sv ----
Do i1=1,6
 Do i2=1,6
coup1 = cplSvSvcSvcSv(i1,i2,i1,i2)
dcoup1 = dcplSvSvcSvcSv(i1,i2,i1,i2,iv1)
Call FirstDerivativeVeff_balls(MSv2(i1),MSv2(i2),dMSv2(i1,iv1),dMSv2(i2,iv1)          & 
& ,coup1,dcoup1,'SS',Q2,temp)
coeff = (-0.5_dp)
results2(26)=results2(26) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at SS C[Sv, Sv, conj[Sv], conj[Sv]]' 
  End Do
End Do
! ----- diagrams of type VS, 2 ------ 
! ---- Sd,VG ----
Do i1=1,6
coup1 = cplSdcSdVGVG(i1,i1)
dcoup1 = dcplSdcSdVGVG(i1,i1,iv1)
Call FirstDerivativeVeff_balls(0._dp,MSd2(i1),ZeroC,dMSd2(i1,iv1),coup1,dcoup1,'VS',Q2,temp)
coeff = 0._dp
results2(27)=results2(27) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at VS C[Sd, VG, VG, conj[Sd]]' 
End Do
! ---- Su,VG ----
Do i1=1,6
coup1 = cplSucSuVGVG(i1,i1)
dcoup1 = dcplSucSuVGVG(i1,i1,iv1)
Call FirstDerivativeVeff_balls(0._dp,MSu2(i1),ZeroC,dMSu2(i1,iv1),coup1,dcoup1,'VS',Q2,temp)
coeff = 0._dp
results2(28)=results2(28) + coeff*temp
if (.not.(temp.eq.temp))  write(*,*) 'NaN at VS C[Su, VG, VG, conj[Su]]' 
End Do
result = sum(results1)+sum(results2) 


 
ti2L(iv1) = oo16pi2**2 * Real(result,dp) 
End Do 
End Subroutine FirstDerivativeEffPot2Loop 


Subroutine SecondDerivativeMassesCoups(i1,i2,vd,vu,vS,vS1,vS2,vS3,g1,g2,              & 
& g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,               & 
& me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,gout)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp),Intent(in) :: vd,vu,vS,vS1,vS2,vS3

Real(dp), Intent(out) :: gout(:) 
Real(dp) :: err, vevs(6) 
Integer :: iout 
Integer, Intent(in) :: i1,i2 
vevs = (/vd,vu,vS,vS1,vS2,vS3/) 
gout = partialDiffXY_RiddersMulDim(AllMassesCouplings,70368,vevs,i1,i2,6,err) 
If (err.gt.err2L) err2L = err 
End Subroutine SecondDerivativeMassesCoups

Subroutine FirstDerivativeMassesCoups(i1,vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,               & 
& gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,              & 
& ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,gout)

Real(dp),Intent(in) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp),Intent(in) :: vd,vu,vS,vS1,vS2,vS3

Real(dp), Intent(out) :: gout(:) 
Real(dp) :: err, vevs(6) 
Integer :: iout 
Integer, Intent(in) :: i1 
vevs = (/vd,vu,vS,vS1,vS2,vS3/) 
gout = partialDiff_RiddersMulDim(AllMassesCouplings,70368,vevs,i1,6,err) 
If (err.gt.err2L) err2L = err 
End Subroutine FirstDerivativeMassesCoups

Subroutine AllMassesCouplings(vevs,gout) 
Implicit None 
Real(dp), Intent(out) :: gout(70368) 
Real(dp), Intent(in) :: vevs(6) 
Integer :: kont 
Real(dp) :: vd,vu,vS,vS1,vS2,vS3

Complex(dp) :: cplAhAhAh(6,6,6),cplAhAhhh(6,6,6),cplAhhhhh(6,6,6),cplAhHpmcHpm(6,2,2),               & 
& cplAhSdcSd(6,6,6),cplAhSecSe(6,6,6),cplAhSucSu(6,6,6),cplAhSvcSv(6,6,6),               & 
& cplhhhhhh(6,6,6),cplhhHpmcHpm(6,2,2),cplhhSdcSd(6,6,6),cplhhSecSe(6,6,6),              & 
& cplhhSucSu(6,6,6),cplhhSvcSv(6,6,6),cplHpmSucSd(2,6,6),cplHpmSvcSe(2,6,6),             & 
& cplSdcHpmcSu(6,2,6),cplSecHpmcSv(6,2,6),cplSdcSdVG(6,6),cplSucSuVG(6,6),               & 
& cplVGVGVG,cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplChiChiAhL(9,9,6),               & 
& cplChiChiAhR(9,9,6),cplcFdFdAhL(3,3,6),cplcFdFdAhR(3,3,6),cplcFeFeAhL(3,3,6),          & 
& cplcFeFeAhR(3,3,6),cplcFuFuAhL(3,3,6),cplcFuFuAhR(3,3,6),cplcFvFvAhL(3,3,6),           & 
& cplcFvFvAhR(3,3,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChaFucSdL(2,3,6),    & 
& cplChaFucSdR(2,3,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChahhL(2,2,6),      & 
& cplcChaChahhR(2,2,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvL(3,2,6),      & 
& cplcFeChaSvR(3,2,6),cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),cplChiFdcSdL(9,3,6),       & 
& cplChiFdcSdR(9,3,6),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFucSuL(9,3,6),       & 
& cplChiFucSuR(9,3,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),cplcChaChiHpmL(2,9,2),     & 
& cplcChaChiHpmR(2,9,2),cplcFdChiSdL(3,9,6),cplcFdChiSdR(3,9,6),cplcFeChiSeL(3,9,6),     & 
& cplcFeChiSeR(3,9,6),cplcFuChiSuL(3,9,6),cplcFuChiSuR(3,9,6),cplcFvChiSvL(3,9,6),       & 
& cplcFvChiSvR(3,9,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,6),            & 
& cplcFdFdhhR(3,3,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),     & 
& cplcFuFdcHpmR(3,3,2),cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),cplcChaFecSvL(2,3,6),       & 
& cplcChaFecSvR(2,3,6),cplcFvFecHpmL(3,3,2),cplcFvFecHpmR(3,3,2),cplGluFucSuL(3,6),      & 
& cplGluFucSuR(3,6),cplcFuFuhhL(3,3,6),cplcFuFuhhR(3,3,6),cplcFdFuHpmL(3,3,2),           & 
& cplcFdFuHpmR(3,3,2),cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),cplcFeFvHpmL(3,3,2),         & 
& cplcFeFvHpmR(3,3,2),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),             & 
& cplcFuGluSuR(3,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChacFvSeL(2,3,6),      & 
& cplcChacFvSeR(2,3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),               & 
& cplcFuFuVGR(3,3),cplGluGluVGL,cplGluGluVGR

Complex(dp) :: cplAhAhAhAh(6,6,6,6),cplAhAhhhhh(6,6,6,6),cplAhAhHpmcHpm(6,6,2,2),cplAhAhSdcSd(6,6,6,6),& 
& cplAhAhSecSe(6,6,6,6),cplAhAhSucSu(6,6,6,6),cplAhAhSvcSv(6,6,6,6),cplhhhhhhhh(6,6,6,6),& 
& cplhhhhHpmcHpm(6,6,2,2),cplhhhhSdcSd(6,6,6,6),cplhhhhSecSe(6,6,6,6),cplhhhhSucSu(6,6,6,6),& 
& cplhhhhSvcSv(6,6,6,6),cplHpmHpmcHpmcHpm(2,2,2,2),cplHpmSdcHpmcSd(2,6,2,6),             & 
& cplHpmSecHpmcSe(2,6,2,6),cplHpmSucHpmcSu(2,6,2,6),cplHpmSvcHpmcSv(2,6,2,6),            & 
& cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),cplSdSucSdcSu(6,6,6,6),cplSeSecSecSe(6,6,6,6),& 
& cplSeSvcSecSv(6,6,6,6),cplSuSucSucSu(6,6,6,6),cplSuSvcSucSv(6,6,6,6),cplSvSvcSvcSv(6,6,6,6),& 
& cplSdcSdVGVG(6,6),cplSucSuVGVG(6,6)

Real(dp) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

vd=vevs(1) 
vu=vevs(2) 
vS=vevs(3) 
vS1=vevs(4) 
vS2=vevs(5) 
vS3=vevs(6) 
Call WrapperForDerivatives(vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,             & 
& kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,           & 
& mv2,M1,M2,M3,M4,gout)

End Subroutine 

Subroutine WrapperForDerivatives(vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,gp,Yd,Ye,              & 
& lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,              & 
& ms22,ms32,mv2,M1,M2,M3,M4,gout)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp),Intent(in) :: vd,vu,vS,vS1,vS2,vS3

Real(dp), Intent(out) :: gout(:) 
Integer :: kont 
Real(dp) :: MSd(6),MSd2(6),MSv(6),MSv2(6),MSu(6),MSu2(6),MSe(6),MSe2(6),Mhh(6),Mhh2(6),           & 
& MAh(6),MAh2(6),MHpm(2),MHpm2(2),MChi(9),MChi2(9),MFv(3),MFv2(3),MCha(2),               & 
& MCha2(2),MFe(3),MFe2(3),MFd(3),MFd2(3),MFu(3),MFu2(3),MGlu,MGlu2,MVZ,MVZp,             & 
& MVZ2,MVZp2,MVWm,MVWm2

Complex(dp) :: cplAhAhAh(6,6,6),cplAhAhhh(6,6,6),cplAhhhhh(6,6,6),cplAhHpmcHpm(6,2,2),               & 
& cplAhSdcSd(6,6,6),cplAhSecSe(6,6,6),cplAhSucSu(6,6,6),cplAhSvcSv(6,6,6),               & 
& cplhhhhhh(6,6,6),cplhhHpmcHpm(6,2,2),cplhhSdcSd(6,6,6),cplhhSecSe(6,6,6),              & 
& cplhhSucSu(6,6,6),cplhhSvcSv(6,6,6),cplHpmSucSd(2,6,6),cplHpmSvcSe(2,6,6),             & 
& cplSdcHpmcSu(6,2,6),cplSecHpmcSv(6,2,6),cplSdcSdVG(6,6),cplSucSuVG(6,6),               & 
& cplVGVGVG,cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplChiChiAhL(9,9,6),               & 
& cplChiChiAhR(9,9,6),cplcFdFdAhL(3,3,6),cplcFdFdAhR(3,3,6),cplcFeFeAhL(3,3,6),          & 
& cplcFeFeAhR(3,3,6),cplcFuFuAhL(3,3,6),cplcFuFuAhR(3,3,6),cplcFvFvAhL(3,3,6),           & 
& cplcFvFvAhR(3,3,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChaFucSdL(2,3,6),    & 
& cplChaFucSdR(2,3,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChahhL(2,2,6),      & 
& cplcChaChahhR(2,2,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvL(3,2,6),      & 
& cplcFeChaSvR(3,2,6),cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),cplChiFdcSdL(9,3,6),       & 
& cplChiFdcSdR(9,3,6),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFucSuL(9,3,6),       & 
& cplChiFucSuR(9,3,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),cplcChaChiHpmL(2,9,2),     & 
& cplcChaChiHpmR(2,9,2),cplcFdChiSdL(3,9,6),cplcFdChiSdR(3,9,6),cplcFeChiSeL(3,9,6),     & 
& cplcFeChiSeR(3,9,6),cplcFuChiSuL(3,9,6),cplcFuChiSuR(3,9,6),cplcFvChiSvL(3,9,6),       & 
& cplcFvChiSvR(3,9,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,6),            & 
& cplcFdFdhhR(3,3,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),     & 
& cplcFuFdcHpmR(3,3,2),cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),cplcChaFecSvL(2,3,6),       & 
& cplcChaFecSvR(2,3,6),cplcFvFecHpmL(3,3,2),cplcFvFecHpmR(3,3,2),cplGluFucSuL(3,6),      & 
& cplGluFucSuR(3,6),cplcFuFuhhL(3,3,6),cplcFuFuhhR(3,3,6),cplcFdFuHpmL(3,3,2),           & 
& cplcFdFuHpmR(3,3,2),cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),cplcFeFvHpmL(3,3,2),         & 
& cplcFeFvHpmR(3,3,2),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),             & 
& cplcFuGluSuR(3,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChacFvSeL(2,3,6),      & 
& cplcChacFvSeR(2,3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),               & 
& cplcFuFuVGR(3,3),cplGluGluVGL,cplGluGluVGR

Complex(dp) :: cplAhAhAhAh(6,6,6,6),cplAhAhhhhh(6,6,6,6),cplAhAhHpmcHpm(6,6,2,2),cplAhAhSdcSd(6,6,6,6),& 
& cplAhAhSecSe(6,6,6,6),cplAhAhSucSu(6,6,6,6),cplAhAhSvcSv(6,6,6,6),cplhhhhhhhh(6,6,6,6),& 
& cplhhhhHpmcHpm(6,6,2,2),cplhhhhSdcSd(6,6,6,6),cplhhhhSecSe(6,6,6,6),cplhhhhSucSu(6,6,6,6),& 
& cplhhhhSvcSv(6,6,6,6),cplHpmHpmcHpmcHpm(2,2,2,2),cplHpmSdcHpmcSd(2,6,2,6),             & 
& cplHpmSecHpmcSe(2,6,2,6),cplHpmSucHpmcSu(2,6,2,6),cplHpmSvcHpmcSv(2,6,2,6),            & 
& cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),cplSdSucSdcSu(6,6,6,6),cplSeSecSecSe(6,6,6,6),& 
& cplSeSvcSecSv(6,6,6,6),cplSuSucSucSu(6,6,6,6),cplSuSvcSucSv(6,6,6,6),cplSvSvcSvcSv(6,6,6,6),& 
& cplSdcSdVGVG(6,6),cplSucSuVGVG(6,6)

Call TreeMassesEffPot(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,            & 
& g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,             & 
& mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,.True.,kont)

Call CouplingsForEffPot3(lam,Tlam,kap,Tk,ZA,vd,vu,vS,vS1,vS2,vS3,ZH,ZP,               & 
& Yd,Td,ZD,Ye,Te,ZE,Yu,Tu,ZU,Yv,Tv,ZV,g3,UM,UP,ZN,ZDL,ZDR,ZEL,ZER,ZUL,ZUR,               & 
& ZVL,ZVR,pG,cplAhAhAh,cplAhAhhh,cplAhhhhh,cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,           & 
& cplAhSucSu,cplAhSvcSv,cplhhhhhh,cplhhHpmcHpm,cplhhSdcSd,cplhhSecSe,cplhhSucSu,         & 
& cplhhSvcSv,cplHpmSucSd,cplHpmSvcSe,cplSdcHpmcSu,cplSecHpmcSv,cplSdcSdVG,               & 
& cplSucSuVG,cplVGVGVG,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,cplChiChiAhR,            & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFvFvAhL,cplcFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,cplChaFucSdL,cplChaFucSdR,       & 
& cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,cplcFdChaSuR,       & 
& cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,cplChiFdcSdR,         & 
& cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,cplChiFvcSvR,         & 
& cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,cplcFeChiSeR,     & 
& cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,cplGluFdcSdL,cplGluFdcSdR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,cplcFuFdcHpmR,       & 
& cplcFeFehhL,cplcFeFehhR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,cplcFvFecHpmR,       & 
& cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,cplcFdFuHpmR,           & 
& cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFdGluSdL,cplcFdGluSdR,           & 
& cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,cplcChacFvSeR,     & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplGluGluVGL,cplGluGluVGR)

Call CouplingsForEffPot4(lam,kap,ZA,ZH,ZP,Yd,ZD,Ye,ZE,Yu,ZU,Yv,ZV,g3,cplAhAhAhAh,     & 
& cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvcSv,        & 
& cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvcSv,        & 
& cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvcHpmcSv,     & 
& cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,cplSeSecSecSe,cplSeSvcSecSv,cplSuSucSucSu,   & 
& cplSuSvcSucSv,cplSvSvcSvcSv,cplSdcSdVGVG,cplSucSuVGVG)

Call MassesCoupsToG(MSd,MSd2,MSv,MSv2,MSu,MSu2,MSe,MSe2,Mhh,Mhh2,MAh,MAh2,            & 
& MHpm,MHpm2,MChi,MChi2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MFd,MFd2,MFu,MFu2,MGlu,             & 
& MGlu2,MVZ,MVZp,MVZ2,MVZp2,MVWm,MVWm2,cplAhAhAh,cplAhAhhh,cplAhhhhh,cplAhHpmcHpm,       & 
& cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplhhhhhh,cplhhHpmcHpm,cplhhSdcSd,         & 
& cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplHpmSucSd,cplHpmSvcSe,cplSdcHpmcSu,cplSecHpmcSv,    & 
& cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplcChaChaAhL,cplcChaChaAhR,cplChiChiAhL,              & 
& cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,              & 
& cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,cplChaFucSdL,        & 
& cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,cplcFdChaSuL,       & 
& cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,cplChiChihhR,cplChiFdcSdL,         & 
& cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,cplChiFvcSvL,         & 
& cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,cplcFeChiSeL,     & 
& cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,cplGluFdcSdL,         & 
& cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,cplcFuFdcHpmL,        & 
& cplcFuFdcHpmR,cplcFeFehhL,cplcFeFehhR,cplcChaFecSvL,cplcChaFecSvR,cplcFvFecHpmL,       & 
& cplcFvFecHpmR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuHpmL,          & 
& cplcFdFuHpmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFdGluSdL,           & 
& cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,cplcChacFvSeL,      & 
& cplcChacFvSeR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplGluGluVGL,            & 
& cplGluGluVGR,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,cplAhAhSecSe,         & 
& cplAhAhSucSu,cplAhAhSvcSv,cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,cplhhhhSecSe,        & 
& cplhhhhSucSu,cplhhhhSvcSv,cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,cplHpmSecHpmcSe,           & 
& cplHpmSucHpmcSu,cplHpmSvcHpmcSv,cplSdSdcSdcSd,cplSdSecSdcSe,cplSdSucSdcSu,             & 
& cplSeSecSecSe,cplSeSvcSecSv,cplSuSucSucSu,cplSuSvcSucSv,cplSvSvcSvcSv,cplSdcSdVGVG,    & 
& cplSucSuVGVG,gout)

End Subroutine WrapperForDerivatives

Subroutine MassesCoupsToG(MSd,MSd2,MSv,MSv2,MSu,MSu2,MSe,MSe2,Mhh,Mhh2,               & 
& MAh,MAh2,MHpm,MHpm2,MChi,MChi2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MFd,MFd2,MFu,              & 
& MFu2,MGlu,MGlu2,MVZ,MVZp,MVZ2,MVZp2,MVWm,MVWm2,cplAhAhAh,cplAhAhhh,cplAhhhhh,          & 
& cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplhhhhhh,cplhhHpmcHpm,       & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplHpmSucSd,cplHpmSvcSe,cplSdcHpmcSu,      & 
& cplSecHpmcSv,cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplcChaChaAhL,cplcChaChaAhR,              & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,         & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,cplChiChihhR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFeFehhL,cplcFeFehhR,cplcChaFecSvL,cplcChaFecSvR,       & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,           & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplcChacFvSeL,cplcChacFvSeR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplGluGluVGL,cplGluGluVGR,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,         & 
& cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvcSv,cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,        & 
& cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvcSv,cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,              & 
& cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvcHpmcSv,cplSdSdcSdcSd,cplSdSecSdcSe,           & 
& cplSdSucSdcSu,cplSeSecSecSe,cplSeSvcSecSv,cplSuSucSucSu,cplSuSvcSucSv,cplSvSvcSvcSv,   & 
& cplSdcSdVGVG,cplSucSuVGVG,g)

Implicit None 
Real(dp), Intent(out) :: g(:) 
Integer :: i1,i2,i3,i4, sumI
Real(dp),Intent(in) :: MSd(6),MSd2(6),MSv(6),MSv2(6),MSu(6),MSu2(6),MSe(6),MSe2(6),Mhh(6),Mhh2(6),           & 
& MAh(6),MAh2(6),MHpm(2),MHpm2(2),MChi(9),MChi2(9),MFv(3),MFv2(3),MCha(2),               & 
& MCha2(2),MFe(3),MFe2(3),MFd(3),MFd2(3),MFu(3),MFu2(3),MGlu,MGlu2,MVZ,MVZp,             & 
& MVZ2,MVZp2,MVWm,MVWm2

Complex(dp),Intent(in) :: cplAhAhAh(6,6,6),cplAhAhhh(6,6,6),cplAhhhhh(6,6,6),cplAhHpmcHpm(6,2,2),               & 
& cplAhSdcSd(6,6,6),cplAhSecSe(6,6,6),cplAhSucSu(6,6,6),cplAhSvcSv(6,6,6),               & 
& cplhhhhhh(6,6,6),cplhhHpmcHpm(6,2,2),cplhhSdcSd(6,6,6),cplhhSecSe(6,6,6),              & 
& cplhhSucSu(6,6,6),cplhhSvcSv(6,6,6),cplHpmSucSd(2,6,6),cplHpmSvcSe(2,6,6),             & 
& cplSdcHpmcSu(6,2,6),cplSecHpmcSv(6,2,6),cplSdcSdVG(6,6),cplSucSuVG(6,6),               & 
& cplVGVGVG,cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplChiChiAhL(9,9,6),               & 
& cplChiChiAhR(9,9,6),cplcFdFdAhL(3,3,6),cplcFdFdAhR(3,3,6),cplcFeFeAhL(3,3,6),          & 
& cplcFeFeAhR(3,3,6),cplcFuFuAhL(3,3,6),cplcFuFuAhR(3,3,6),cplcFvFvAhL(3,3,6),           & 
& cplcFvFvAhR(3,3,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChaFucSdL(2,3,6),    & 
& cplChaFucSdR(2,3,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChahhL(2,2,6),      & 
& cplcChaChahhR(2,2,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvL(3,2,6),      & 
& cplcFeChaSvR(3,2,6),cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),cplChiFdcSdL(9,3,6),       & 
& cplChiFdcSdR(9,3,6),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFucSuL(9,3,6),       & 
& cplChiFucSuR(9,3,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),cplcChaChiHpmL(2,9,2),     & 
& cplcChaChiHpmR(2,9,2),cplcFdChiSdL(3,9,6),cplcFdChiSdR(3,9,6),cplcFeChiSeL(3,9,6),     & 
& cplcFeChiSeR(3,9,6),cplcFuChiSuL(3,9,6),cplcFuChiSuR(3,9,6),cplcFvChiSvL(3,9,6),       & 
& cplcFvChiSvR(3,9,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,6),            & 
& cplcFdFdhhR(3,3,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),     & 
& cplcFuFdcHpmR(3,3,2),cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),cplcChaFecSvL(2,3,6),       & 
& cplcChaFecSvR(2,3,6),cplcFvFecHpmL(3,3,2),cplcFvFecHpmR(3,3,2),cplGluFucSuL(3,6),      & 
& cplGluFucSuR(3,6),cplcFuFuhhL(3,3,6),cplcFuFuhhR(3,3,6),cplcFdFuHpmL(3,3,2),           & 
& cplcFdFuHpmR(3,3,2),cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),cplcFeFvHpmL(3,3,2),         & 
& cplcFeFvHpmR(3,3,2),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),             & 
& cplcFuGluSuR(3,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChacFvSeL(2,3,6),      & 
& cplcChacFvSeR(2,3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),               & 
& cplcFuFuVGR(3,3),cplGluGluVGL,cplGluGluVGR

Complex(dp),Intent(in) :: cplAhAhAhAh(6,6,6,6),cplAhAhhhhh(6,6,6,6),cplAhAhHpmcHpm(6,6,2,2),cplAhAhSdcSd(6,6,6,6),& 
& cplAhAhSecSe(6,6,6,6),cplAhAhSucSu(6,6,6,6),cplAhAhSvcSv(6,6,6,6),cplhhhhhhhh(6,6,6,6),& 
& cplhhhhHpmcHpm(6,6,2,2),cplhhhhSdcSd(6,6,6,6),cplhhhhSecSe(6,6,6,6),cplhhhhSucSu(6,6,6,6),& 
& cplhhhhSvcSv(6,6,6,6),cplHpmHpmcHpmcHpm(2,2,2,2),cplHpmSdcHpmcSd(2,6,2,6),             & 
& cplHpmSecHpmcSe(2,6,2,6),cplHpmSucHpmcSu(2,6,2,6),cplHpmSvcHpmcSv(2,6,2,6),            & 
& cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),cplSdSucSdcSu(6,6,6,6),cplSeSecSecSe(6,6,6,6),& 
& cplSeSvcSecSv(6,6,6,6),cplSuSucSucSu(6,6,6,6),cplSuSvcSucSv(6,6,6,6),cplSvSvcSvcSv(6,6,6,6),& 
& cplSdcSdVGVG(6,6),cplSucSuVGVG(6,6)

g(1:6) = MSd
g(7:12) = MSd2
g(13:18) = MSv
g(19:24) = MSv2
g(25:30) = MSu
g(31:36) = MSu2
g(37:42) = MSe
g(43:48) = MSe2
g(49:54) = Mhh
g(55:60) = Mhh2
g(61:66) = MAh
g(67:72) = MAh2
g(73:74) = MHpm
g(75:76) = MHpm2
g(77:85) = MChi
g(86:94) = MChi2
g(95:97) = MFv
g(98:100) = MFv2
g(101:102) = MCha
g(103:104) = MCha2
g(105:107) = MFe
g(108:110) = MFe2
g(111:113) = MFd
g(114:116) = MFd2
g(117:119) = MFu
g(120:122) = MFu2
g(123) = MGlu
g(124) = MGlu2
g(125) = MVZ
g(126) = MVZp
g(127) = MVZ2
g(128) = MVZp2
g(129) = MVWm
g(130) = MVWm2
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+131) = Real(cplAhAhAh(i1,i2,i3), dp) 
g(SumI+132) = Aimag(cplAhAhAh(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+563) = Real(cplAhAhhh(i1,i2,i3), dp) 
g(SumI+564) = Aimag(cplAhAhhh(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+995) = Real(cplAhhhhh(i1,i2,i3), dp) 
g(SumI+996) = Aimag(cplAhhhhh(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,2
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*4
SumI = SumI*2 
g(SumI+1427) = Real(cplAhHpmcHpm(i1,i2,i3), dp) 
g(SumI+1428) = Aimag(cplAhHpmcHpm(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+1475) = Real(cplAhSdcSd(i1,i2,i3), dp) 
g(SumI+1476) = Aimag(cplAhSdcSd(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+1907) = Real(cplAhSecSe(i1,i2,i3), dp) 
g(SumI+1908) = Aimag(cplAhSecSe(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+2339) = Real(cplAhSucSu(i1,i2,i3), dp) 
g(SumI+2340) = Aimag(cplAhSucSu(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+2771) = Real(cplAhSvcSv(i1,i2,i3), dp) 
g(SumI+2772) = Aimag(cplAhSvcSv(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+3203) = Real(cplhhhhhh(i1,i2,i3), dp) 
g(SumI+3204) = Aimag(cplhhhhhh(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,2
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*4
SumI = SumI*2 
g(SumI+3635) = Real(cplhhHpmcHpm(i1,i2,i3), dp) 
g(SumI+3636) = Aimag(cplhhHpmcHpm(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+3683) = Real(cplhhSdcSd(i1,i2,i3), dp) 
g(SumI+3684) = Aimag(cplhhSdcSd(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+4115) = Real(cplhhSecSe(i1,i2,i3), dp) 
g(SumI+4116) = Aimag(cplhhSecSe(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+4547) = Real(cplhhSucSu(i1,i2,i3), dp) 
g(SumI+4548) = Aimag(cplhhSucSu(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+4979) = Real(cplhhSvcSv(i1,i2,i3), dp) 
g(SumI+4980) = Aimag(cplhhSvcSv(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+5411) = Real(cplHpmSucSd(i1,i2,i3), dp) 
g(SumI+5412) = Aimag(cplHpmSucSd(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
g(SumI+5555) = Real(cplHpmSvcSe(i1,i2,i3), dp) 
g(SumI+5556) = Aimag(cplHpmSvcSe(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+5699) = Real(cplSdcHpmcSu(i1,i2,i3), dp) 
g(SumI+5700) = Aimag(cplSdcHpmcSu(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+5843) = Real(cplSecHpmcSv(i1,i2,i3), dp) 
g(SumI+5844) = Aimag(cplSecHpmcSv(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+5987) = Real(cplSdcSdVG(i1,i2), dp) 
g(SumI+5988) = Aimag(cplSdcSdVG(i1,i2)) 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+6059) = Real(cplSucSuVG(i1,i2), dp) 
g(SumI+6060) = Aimag(cplSucSuVG(i1,i2)) 
End Do 
End Do 

g(6131) = Real(cplVGVGVG,dp)  
g(6132) = Aimag(cplVGVGVG)  
Do i1 = 1,2
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+6133) = Real(cplcChaChaAhL(i1,i2,i3), dp) 
g(SumI+6134) = Aimag(cplcChaChaAhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+6181) = Real(cplcChaChaAhR(i1,i2,i3), dp) 
g(SumI+6182) = Aimag(cplcChaChaAhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
g(SumI+6229) = Real(cplChiChiAhL(i1,i2,i3), dp) 
g(SumI+6230) = Aimag(cplChiChiAhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
g(SumI+7201) = Real(cplChiChiAhR(i1,i2,i3), dp) 
g(SumI+7202) = Aimag(cplChiChiAhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+8173) = Real(cplcFdFdAhL(i1,i2,i3), dp) 
g(SumI+8174) = Aimag(cplcFdFdAhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+8281) = Real(cplcFdFdAhR(i1,i2,i3), dp) 
g(SumI+8282) = Aimag(cplcFdFdAhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+8389) = Real(cplcFeFeAhL(i1,i2,i3), dp) 
g(SumI+8390) = Aimag(cplcFeFeAhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+8497) = Real(cplcFeFeAhR(i1,i2,i3), dp) 
g(SumI+8498) = Aimag(cplcFeFeAhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+8605) = Real(cplcFuFuAhL(i1,i2,i3), dp) 
g(SumI+8606) = Aimag(cplcFuFuAhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+8713) = Real(cplcFuFuAhR(i1,i2,i3), dp) 
g(SumI+8714) = Aimag(cplcFuFuAhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+8821) = Real(cplcFvFvAhL(i1,i2,i3), dp) 
g(SumI+8822) = Aimag(cplcFvFvAhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+8929) = Real(cplcFvFvAhR(i1,i2,i3), dp) 
g(SumI+8930) = Aimag(cplcFvFvAhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,2
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*4
SumI = SumI*2 
g(SumI+9037) = Real(cplChiChacHpmL(i1,i2,i3), dp) 
g(SumI+9038) = Aimag(cplChiChacHpmL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,2
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*4
SumI = SumI*2 
g(SumI+9109) = Real(cplChiChacHpmR(i1,i2,i3), dp) 
g(SumI+9110) = Aimag(cplChiChacHpmR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+9181) = Real(cplChaFucSdL(i1,i2,i3), dp) 
g(SumI+9182) = Aimag(cplChaFucSdL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+9253) = Real(cplChaFucSdR(i1,i2,i3), dp) 
g(SumI+9254) = Aimag(cplChaFucSdR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+9325) = Real(cplChaFvcSeL(i1,i2,i3), dp) 
g(SumI+9326) = Aimag(cplChaFvcSeL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+9397) = Real(cplChaFvcSeR(i1,i2,i3), dp) 
g(SumI+9398) = Aimag(cplChaFvcSeR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+9469) = Real(cplcChaChahhL(i1,i2,i3), dp) 
g(SumI+9470) = Aimag(cplcChaChahhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+9517) = Real(cplcChaChahhR(i1,i2,i3), dp) 
g(SumI+9518) = Aimag(cplcChaChahhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+9565) = Real(cplcFdChaSuL(i1,i2,i3), dp) 
g(SumI+9566) = Aimag(cplcFdChaSuL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+9637) = Real(cplcFdChaSuR(i1,i2,i3), dp) 
g(SumI+9638) = Aimag(cplcFdChaSuR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+9709) = Real(cplcFeChaSvL(i1,i2,i3), dp) 
g(SumI+9710) = Aimag(cplcFeChaSvL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
g(SumI+9781) = Real(cplcFeChaSvR(i1,i2,i3), dp) 
g(SumI+9782) = Aimag(cplcFeChaSvR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
g(SumI+9853) = Real(cplChiChihhL(i1,i2,i3), dp) 
g(SumI+9854) = Aimag(cplChiChihhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
g(SumI+10825) = Real(cplChiChihhR(i1,i2,i3), dp) 
g(SumI+10826) = Aimag(cplChiChihhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+11797) = Real(cplChiFdcSdL(i1,i2,i3), dp) 
g(SumI+11798) = Aimag(cplChiFdcSdL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+12121) = Real(cplChiFdcSdR(i1,i2,i3), dp) 
g(SumI+12122) = Aimag(cplChiFdcSdR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+12445) = Real(cplChiFecSeL(i1,i2,i3), dp) 
g(SumI+12446) = Aimag(cplChiFecSeL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+12769) = Real(cplChiFecSeR(i1,i2,i3), dp) 
g(SumI+12770) = Aimag(cplChiFecSeR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+13093) = Real(cplChiFucSuL(i1,i2,i3), dp) 
g(SumI+13094) = Aimag(cplChiFucSuL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+13417) = Real(cplChiFucSuR(i1,i2,i3), dp) 
g(SumI+13418) = Aimag(cplChiFucSuR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+13741) = Real(cplChiFvcSvL(i1,i2,i3), dp) 
g(SumI+13742) = Aimag(cplChiFvcSvL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,9
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+14065) = Real(cplChiFvcSvR(i1,i2,i3), dp) 
g(SumI+14066) = Aimag(cplChiFvcSvR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,9
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*18
SumI = SumI*2 
g(SumI+14389) = Real(cplcChaChiHpmL(i1,i2,i3), dp) 
g(SumI+14390) = Aimag(cplcChaChiHpmL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,9
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*18
SumI = SumI*2 
g(SumI+14461) = Real(cplcChaChiHpmR(i1,i2,i3), dp) 
g(SumI+14462) = Aimag(cplcChaChiHpmR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
g(SumI+14533) = Real(cplcFdChiSdL(i1,i2,i3), dp) 
g(SumI+14534) = Aimag(cplcFdChiSdL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
g(SumI+14857) = Real(cplcFdChiSdR(i1,i2,i3), dp) 
g(SumI+14858) = Aimag(cplcFdChiSdR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
g(SumI+15181) = Real(cplcFeChiSeL(i1,i2,i3), dp) 
g(SumI+15182) = Aimag(cplcFeChiSeL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
g(SumI+15505) = Real(cplcFeChiSeR(i1,i2,i3), dp) 
g(SumI+15506) = Aimag(cplcFeChiSeR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
g(SumI+15829) = Real(cplcFuChiSuL(i1,i2,i3), dp) 
g(SumI+15830) = Aimag(cplcFuChiSuL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
g(SumI+16153) = Real(cplcFuChiSuR(i1,i2,i3), dp) 
g(SumI+16154) = Aimag(cplcFuChiSuR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
g(SumI+16477) = Real(cplcFvChiSvL(i1,i2,i3), dp) 
g(SumI+16478) = Aimag(cplcFvChiSvL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
g(SumI+16801) = Real(cplcFvChiSvR(i1,i2,i3), dp) 
g(SumI+16802) = Aimag(cplcFvChiSvR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+17125) = Real(cplGluFdcSdL(i1,i2), dp) 
g(SumI+17126) = Aimag(cplGluFdcSdL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+17161) = Real(cplGluFdcSdR(i1,i2), dp) 
g(SumI+17162) = Aimag(cplGluFdcSdR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+17197) = Real(cplcFdFdhhL(i1,i2,i3), dp) 
g(SumI+17198) = Aimag(cplcFdFdhhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+17305) = Real(cplcFdFdhhR(i1,i2,i3), dp) 
g(SumI+17306) = Aimag(cplcFdFdhhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+17413) = Real(cplcChaFdcSuL(i1,i2,i3), dp) 
g(SumI+17414) = Aimag(cplcChaFdcSuL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+17485) = Real(cplcChaFdcSuR(i1,i2,i3), dp) 
g(SumI+17486) = Aimag(cplcChaFdcSuR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
g(SumI+17557) = Real(cplcFuFdcHpmL(i1,i2,i3), dp) 
g(SumI+17558) = Aimag(cplcFuFdcHpmL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
g(SumI+17593) = Real(cplcFuFdcHpmR(i1,i2,i3), dp) 
g(SumI+17594) = Aimag(cplcFuFdcHpmR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+17629) = Real(cplcFeFehhL(i1,i2,i3), dp) 
g(SumI+17630) = Aimag(cplcFeFehhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+17737) = Real(cplcFeFehhR(i1,i2,i3), dp) 
g(SumI+17738) = Aimag(cplcFeFehhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+17845) = Real(cplcChaFecSvL(i1,i2,i3), dp) 
g(SumI+17846) = Aimag(cplcChaFecSvL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+17917) = Real(cplcChaFecSvR(i1,i2,i3), dp) 
g(SumI+17918) = Aimag(cplcChaFecSvR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
g(SumI+17989) = Real(cplcFvFecHpmL(i1,i2,i3), dp) 
g(SumI+17990) = Aimag(cplcFvFecHpmL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
g(SumI+18025) = Real(cplcFvFecHpmR(i1,i2,i3), dp) 
g(SumI+18026) = Aimag(cplcFvFecHpmR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+18061) = Real(cplGluFucSuL(i1,i2), dp) 
g(SumI+18062) = Aimag(cplGluFucSuL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+18097) = Real(cplGluFucSuR(i1,i2), dp) 
g(SumI+18098) = Aimag(cplGluFucSuR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+18133) = Real(cplcFuFuhhL(i1,i2,i3), dp) 
g(SumI+18134) = Aimag(cplcFuFuhhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+18241) = Real(cplcFuFuhhR(i1,i2,i3), dp) 
g(SumI+18242) = Aimag(cplcFuFuhhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
g(SumI+18349) = Real(cplcFdFuHpmL(i1,i2,i3), dp) 
g(SumI+18350) = Aimag(cplcFdFuHpmL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
g(SumI+18385) = Real(cplcFdFuHpmR(i1,i2,i3), dp) 
g(SumI+18386) = Aimag(cplcFdFuHpmR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+18421) = Real(cplcFvFvhhL(i1,i2,i3), dp) 
g(SumI+18422) = Aimag(cplcFvFvhhL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+18529) = Real(cplcFvFvhhR(i1,i2,i3), dp) 
g(SumI+18530) = Aimag(cplcFvFvhhR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
g(SumI+18637) = Real(cplcFeFvHpmL(i1,i2,i3), dp) 
g(SumI+18638) = Aimag(cplcFeFvHpmL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
g(SumI+18673) = Real(cplcFeFvHpmR(i1,i2,i3), dp) 
g(SumI+18674) = Aimag(cplcFeFvHpmR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+18709) = Real(cplcFdGluSdL(i1,i2), dp) 
g(SumI+18710) = Aimag(cplcFdGluSdL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+18745) = Real(cplcFdGluSdR(i1,i2), dp) 
g(SumI+18746) = Aimag(cplcFdGluSdR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+18781) = Real(cplcFuGluSuL(i1,i2), dp) 
g(SumI+18782) = Aimag(cplcFuGluSuL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+18817) = Real(cplcFuGluSuR(i1,i2), dp) 
g(SumI+18818) = Aimag(cplcFuGluSuR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+18853) = Real(cplcChacFuSdL(i1,i2,i3), dp) 
g(SumI+18854) = Aimag(cplcChacFuSdL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+18925) = Real(cplcChacFuSdR(i1,i2,i3), dp) 
g(SumI+18926) = Aimag(cplcChacFuSdR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+18997) = Real(cplcChacFvSeL(i1,i2,i3), dp) 
g(SumI+18998) = Aimag(cplcChacFvSeL(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
g(SumI+19069) = Real(cplcChacFvSeR(i1,i2,i3), dp) 
g(SumI+19070) = Aimag(cplcChacFvSeR(i1,i2,i3)) 
End Do 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+19141) = Real(cplcFdFdVGL(i1,i2), dp) 
g(SumI+19142) = Aimag(cplcFdFdVGL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+19159) = Real(cplcFdFdVGR(i1,i2), dp) 
g(SumI+19160) = Aimag(cplcFdFdVGR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+19177) = Real(cplcFuFuVGL(i1,i2), dp) 
g(SumI+19178) = Aimag(cplcFuFuVGL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+19195) = Real(cplcFuFuVGR(i1,i2), dp) 
g(SumI+19196) = Aimag(cplcFuFuVGR(i1,i2)) 
End Do 
End Do 

g(19213) = Real(cplGluGluVGL,dp)  
g(19214) = Aimag(cplGluGluVGL)  
g(19215) = Real(cplGluGluVGR,dp)  
g(19216) = Aimag(cplGluGluVGR)  
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+19217) = Real(cplAhAhAhAh(i1,i2,i3,i4), dp) 
g(SumI+19218) = Aimag(cplAhAhAhAh(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+21809) = Real(cplAhAhhhhh(i1,i2,i3,i4), dp) 
g(SumI+21810) = Aimag(cplAhAhhhhh(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,2
SumI = (i4-1) + (i3-1)*2 + (i2-1)*4 + (i1-1)*24
SumI = SumI*2 
g(SumI+24401) = Real(cplAhAhHpmcHpm(i1,i2,i3,i4), dp) 
g(SumI+24402) = Aimag(cplAhAhHpmcHpm(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+24689) = Real(cplAhAhSdcSd(i1,i2,i3,i4), dp) 
g(SumI+24690) = Aimag(cplAhAhSdcSd(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+27281) = Real(cplAhAhSecSe(i1,i2,i3,i4), dp) 
g(SumI+27282) = Aimag(cplAhAhSecSe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+29873) = Real(cplAhAhSucSu(i1,i2,i3,i4), dp) 
g(SumI+29874) = Aimag(cplAhAhSucSu(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+32465) = Real(cplAhAhSvcSv(i1,i2,i3,i4), dp) 
g(SumI+32466) = Aimag(cplAhAhSvcSv(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+35057) = Real(cplhhhhhhhh(i1,i2,i3,i4), dp) 
g(SumI+35058) = Aimag(cplhhhhhhhh(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,2
SumI = (i4-1) + (i3-1)*2 + (i2-1)*4 + (i1-1)*24
SumI = SumI*2 
g(SumI+37649) = Real(cplhhhhHpmcHpm(i1,i2,i3,i4), dp) 
g(SumI+37650) = Aimag(cplhhhhHpmcHpm(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+37937) = Real(cplhhhhSdcSd(i1,i2,i3,i4), dp) 
g(SumI+37938) = Aimag(cplhhhhSdcSd(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+40529) = Real(cplhhhhSecSe(i1,i2,i3,i4), dp) 
g(SumI+40530) = Aimag(cplhhhhSecSe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+43121) = Real(cplhhhhSucSu(i1,i2,i3,i4), dp) 
g(SumI+43122) = Aimag(cplhhhhSucSu(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+45713) = Real(cplhhhhSvcSv(i1,i2,i3,i4), dp) 
g(SumI+45714) = Aimag(cplhhhhSvcSv(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,2
Do i3 = 1,2
Do i4 = 1,2
SumI = (i4-1) + (i3-1)*2 + (i2-1)*4 + (i1-1)*8
SumI = SumI*2 
g(SumI+48305) = Real(cplHpmHpmcHpmcHpm(i1,i2,i3,i4), dp) 
g(SumI+48306) = Aimag(cplHpmHpmcHpmcHpm(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
g(SumI+48337) = Real(cplHpmSdcHpmcSd(i1,i2,i3,i4), dp) 
g(SumI+48338) = Aimag(cplHpmSdcHpmcSd(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
g(SumI+48625) = Real(cplHpmSecHpmcSe(i1,i2,i3,i4), dp) 
g(SumI+48626) = Aimag(cplHpmSecHpmcSe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
g(SumI+48913) = Real(cplHpmSucHpmcSu(i1,i2,i3,i4), dp) 
g(SumI+48914) = Aimag(cplHpmSucHpmcSu(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
g(SumI+49201) = Real(cplHpmSvcHpmcSv(i1,i2,i3,i4), dp) 
g(SumI+49202) = Aimag(cplHpmSvcHpmcSv(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+49489) = Real(cplSdSdcSdcSd(i1,i2,i3,i4), dp) 
g(SumI+49490) = Aimag(cplSdSdcSdcSd(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+52081) = Real(cplSdSecSdcSe(i1,i2,i3,i4), dp) 
g(SumI+52082) = Aimag(cplSdSecSdcSe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+54673) = Real(cplSdSucSdcSu(i1,i2,i3,i4), dp) 
g(SumI+54674) = Aimag(cplSdSucSdcSu(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+57265) = Real(cplSeSecSecSe(i1,i2,i3,i4), dp) 
g(SumI+57266) = Aimag(cplSeSecSecSe(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+59857) = Real(cplSeSvcSecSv(i1,i2,i3,i4), dp) 
g(SumI+59858) = Aimag(cplSeSvcSecSv(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+62449) = Real(cplSuSucSucSu(i1,i2,i3,i4), dp) 
g(SumI+62450) = Aimag(cplSuSucSucSu(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+65041) = Real(cplSuSvcSucSv(i1,i2,i3,i4), dp) 
g(SumI+65042) = Aimag(cplSuSvcSucSv(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
g(SumI+67633) = Real(cplSvSvcSvcSv(i1,i2,i3,i4), dp) 
g(SumI+67634) = Aimag(cplSvSvcSvcSv(i1,i2,i3,i4)) 
End Do 
End Do 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+70225) = Real(cplSdcSdVGVG(i1,i2), dp) 
g(SumI+70226) = Aimag(cplSdcSdVGVG(i1,i2)) 
End Do 
End Do 

Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
g(SumI+70297) = Real(cplSucSuVGVG(i1,i2), dp) 
g(SumI+70298) = Aimag(cplSucSuVGVG(i1,i2)) 
End Do 
End Do 

End Subroutine MassesCoupsToG

Subroutine GToMassesCoups(g,MSd,MSd2,MSv,MSv2,MSu,MSu2,MSe,MSe2,Mhh,Mhh2,             & 
& MAh,MAh2,MHpm,MHpm2,MChi,MChi2,MFv,MFv2,MCha,MCha2,MFe,MFe2,MFd,MFd2,MFu,              & 
& MFu2,MGlu,MGlu2,MVZ,MVZp,MVZ2,MVZp2,MVWm,MVWm2,cplAhAhAh,cplAhAhhh,cplAhhhhh,          & 
& cplAhHpmcHpm,cplAhSdcSd,cplAhSecSe,cplAhSucSu,cplAhSvcSv,cplhhhhhh,cplhhHpmcHpm,       & 
& cplhhSdcSd,cplhhSecSe,cplhhSucSu,cplhhSvcSv,cplHpmSucSd,cplHpmSvcSe,cplSdcHpmcSu,      & 
& cplSecHpmcSv,cplSdcSdVG,cplSucSuVG,cplVGVGVG,cplcChaChaAhL,cplcChaChaAhR,              & 
& cplChiChiAhL,cplChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFvFvAhL,cplcFvFvAhR,cplChiChacHpmL,cplChiChacHpmR,         & 
& cplChaFucSdL,cplChaFucSdR,cplChaFvcSeL,cplChaFvcSeR,cplcChaChahhL,cplcChaChahhR,       & 
& cplcFdChaSuL,cplcFdChaSuR,cplcFeChaSvL,cplcFeChaSvR,cplChiChihhL,cplChiChihhR,         & 
& cplChiFdcSdL,cplChiFdcSdR,cplChiFecSeL,cplChiFecSeR,cplChiFucSuL,cplChiFucSuR,         & 
& cplChiFvcSvL,cplChiFvcSvR,cplcChaChiHpmL,cplcChaChiHpmR,cplcFdChiSdL,cplcFdChiSdR,     & 
& cplcFeChiSeL,cplcFeChiSeR,cplcFuChiSuL,cplcFuChiSuR,cplcFvChiSvL,cplcFvChiSvR,         & 
& cplGluFdcSdL,cplGluFdcSdR,cplcFdFdhhL,cplcFdFdhhR,cplcChaFdcSuL,cplcChaFdcSuR,         & 
& cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFeFehhL,cplcFeFehhR,cplcChaFecSvL,cplcChaFecSvR,       & 
& cplcFvFecHpmL,cplcFvFecHpmR,cplGluFucSuL,cplGluFucSuR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFdFuHpmL,cplcFdFuHpmR,cplcFvFvhhL,cplcFvFvhhR,cplcFeFvHpmL,cplcFeFvHpmR,           & 
& cplcFdGluSdL,cplcFdGluSdR,cplcFuGluSuL,cplcFuGluSuR,cplcChacFuSdL,cplcChacFuSdR,       & 
& cplcChacFvSeL,cplcChacFvSeR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplGluGluVGL,cplGluGluVGR,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpmcHpm,cplAhAhSdcSd,         & 
& cplAhAhSecSe,cplAhAhSucSu,cplAhAhSvcSv,cplhhhhhhhh,cplhhhhHpmcHpm,cplhhhhSdcSd,        & 
& cplhhhhSecSe,cplhhhhSucSu,cplhhhhSvcSv,cplHpmHpmcHpmcHpm,cplHpmSdcHpmcSd,              & 
& cplHpmSecHpmcSe,cplHpmSucHpmcSu,cplHpmSvcHpmcSv,cplSdSdcSdcSd,cplSdSecSdcSe,           & 
& cplSdSucSdcSu,cplSeSecSecSe,cplSeSvcSecSv,cplSuSucSucSu,cplSuSvcSucSv,cplSvSvcSvcSv,   & 
& cplSdcSdVGVG,cplSucSuVGVG)

Implicit None 
Real(dp), Intent(in) :: g(:) 
Integer :: i1,i2,i3,i4, sumI
Real(dp),Intent(inout) :: MSd(6),MSd2(6),MSv(6),MSv2(6),MSu(6),MSu2(6),MSe(6),MSe2(6),Mhh(6),Mhh2(6),           & 
& MAh(6),MAh2(6),MHpm(2),MHpm2(2),MChi(9),MChi2(9),MFv(3),MFv2(3),MCha(2),               & 
& MCha2(2),MFe(3),MFe2(3),MFd(3),MFd2(3),MFu(3),MFu2(3),MGlu,MGlu2,MVZ,MVZp,             & 
& MVZ2,MVZp2,MVWm,MVWm2

Complex(dp),Intent(inout) :: cplAhAhAh(6,6,6),cplAhAhhh(6,6,6),cplAhhhhh(6,6,6),cplAhHpmcHpm(6,2,2),               & 
& cplAhSdcSd(6,6,6),cplAhSecSe(6,6,6),cplAhSucSu(6,6,6),cplAhSvcSv(6,6,6),               & 
& cplhhhhhh(6,6,6),cplhhHpmcHpm(6,2,2),cplhhSdcSd(6,6,6),cplhhSecSe(6,6,6),              & 
& cplhhSucSu(6,6,6),cplhhSvcSv(6,6,6),cplHpmSucSd(2,6,6),cplHpmSvcSe(2,6,6),             & 
& cplSdcHpmcSu(6,2,6),cplSecHpmcSv(6,2,6),cplSdcSdVG(6,6),cplSucSuVG(6,6),               & 
& cplVGVGVG,cplcChaChaAhL(2,2,6),cplcChaChaAhR(2,2,6),cplChiChiAhL(9,9,6),               & 
& cplChiChiAhR(9,9,6),cplcFdFdAhL(3,3,6),cplcFdFdAhR(3,3,6),cplcFeFeAhL(3,3,6),          & 
& cplcFeFeAhR(3,3,6),cplcFuFuAhL(3,3,6),cplcFuFuAhR(3,3,6),cplcFvFvAhL(3,3,6),           & 
& cplcFvFvAhR(3,3,6),cplChiChacHpmL(9,2,2),cplChiChacHpmR(9,2,2),cplChaFucSdL(2,3,6),    & 
& cplChaFucSdR(2,3,6),cplChaFvcSeL(2,3,6),cplChaFvcSeR(2,3,6),cplcChaChahhL(2,2,6),      & 
& cplcChaChahhR(2,2,6),cplcFdChaSuL(3,2,6),cplcFdChaSuR(3,2,6),cplcFeChaSvL(3,2,6),      & 
& cplcFeChaSvR(3,2,6),cplChiChihhL(9,9,6),cplChiChihhR(9,9,6),cplChiFdcSdL(9,3,6),       & 
& cplChiFdcSdR(9,3,6),cplChiFecSeL(9,3,6),cplChiFecSeR(9,3,6),cplChiFucSuL(9,3,6),       & 
& cplChiFucSuR(9,3,6),cplChiFvcSvL(9,3,6),cplChiFvcSvR(9,3,6),cplcChaChiHpmL(2,9,2),     & 
& cplcChaChiHpmR(2,9,2),cplcFdChiSdL(3,9,6),cplcFdChiSdR(3,9,6),cplcFeChiSeL(3,9,6),     & 
& cplcFeChiSeR(3,9,6),cplcFuChiSuL(3,9,6),cplcFuChiSuR(3,9,6),cplcFvChiSvL(3,9,6),       & 
& cplcFvChiSvR(3,9,6),cplGluFdcSdL(3,6),cplGluFdcSdR(3,6),cplcFdFdhhL(3,3,6),            & 
& cplcFdFdhhR(3,3,6),cplcChaFdcSuL(2,3,6),cplcChaFdcSuR(2,3,6),cplcFuFdcHpmL(3,3,2),     & 
& cplcFuFdcHpmR(3,3,2),cplcFeFehhL(3,3,6),cplcFeFehhR(3,3,6),cplcChaFecSvL(2,3,6),       & 
& cplcChaFecSvR(2,3,6),cplcFvFecHpmL(3,3,2),cplcFvFecHpmR(3,3,2),cplGluFucSuL(3,6),      & 
& cplGluFucSuR(3,6),cplcFuFuhhL(3,3,6),cplcFuFuhhR(3,3,6),cplcFdFuHpmL(3,3,2),           & 
& cplcFdFuHpmR(3,3,2),cplcFvFvhhL(3,3,6),cplcFvFvhhR(3,3,6),cplcFeFvHpmL(3,3,2),         & 
& cplcFeFvHpmR(3,3,2),cplcFdGluSdL(3,6),cplcFdGluSdR(3,6),cplcFuGluSuL(3,6),             & 
& cplcFuGluSuR(3,6),cplcChacFuSdL(2,3,6),cplcChacFuSdR(2,3,6),cplcChacFvSeL(2,3,6),      & 
& cplcChacFvSeR(2,3,6),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),               & 
& cplcFuFuVGR(3,3),cplGluGluVGL,cplGluGluVGR

Complex(dp),Intent(inout) :: cplAhAhAhAh(6,6,6,6),cplAhAhhhhh(6,6,6,6),cplAhAhHpmcHpm(6,6,2,2),cplAhAhSdcSd(6,6,6,6),& 
& cplAhAhSecSe(6,6,6,6),cplAhAhSucSu(6,6,6,6),cplAhAhSvcSv(6,6,6,6),cplhhhhhhhh(6,6,6,6),& 
& cplhhhhHpmcHpm(6,6,2,2),cplhhhhSdcSd(6,6,6,6),cplhhhhSecSe(6,6,6,6),cplhhhhSucSu(6,6,6,6),& 
& cplhhhhSvcSv(6,6,6,6),cplHpmHpmcHpmcHpm(2,2,2,2),cplHpmSdcHpmcSd(2,6,2,6),             & 
& cplHpmSecHpmcSe(2,6,2,6),cplHpmSucHpmcSu(2,6,2,6),cplHpmSvcHpmcSv(2,6,2,6),            & 
& cplSdSdcSdcSd(6,6,6,6),cplSdSecSdcSe(6,6,6,6),cplSdSucSdcSu(6,6,6,6),cplSeSecSecSe(6,6,6,6),& 
& cplSeSvcSecSv(6,6,6,6),cplSuSucSucSu(6,6,6,6),cplSuSvcSucSv(6,6,6,6),cplSvSvcSvcSv(6,6,6,6),& 
& cplSdcSdVGVG(6,6),cplSucSuVGVG(6,6)

MSd=g(1:6) 
MSd2=g(7:12) 
MSv=g(13:18) 
MSv2=g(19:24) 
MSu=g(25:30) 
MSu2=g(31:36) 
MSe=g(37:42) 
MSe2=g(43:48) 
Mhh=g(49:54) 
Mhh2=g(55:60) 
MAh=g(61:66) 
MAh2=g(67:72) 
MHpm=g(73:74) 
MHpm2=g(75:76) 
MChi=g(77:85) 
MChi2=g(86:94) 
MFv=g(95:97) 
MFv2=g(98:100) 
MCha=g(101:102) 
MCha2=g(103:104) 
MFe=g(105:107) 
MFe2=g(108:110) 
MFd=g(111:113) 
MFd2=g(114:116) 
MFu=g(117:119) 
MFu2=g(120:122) 
MGlu=g(123) 
MGlu2=g(124) 
MVZ=g(125) 
MVZp=g(126) 
MVZ2=g(127) 
MVZp2=g(128) 
MVWm=g(129) 
MVWm2=g(130) 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplAhAhAh(i1,i2,i3) = Cmplx( g(SumI+131), g(SumI+132), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplAhAhhh(i1,i2,i3) = Cmplx( g(SumI+563), g(SumI+564), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplAhhhhh(i1,i2,i3) = Cmplx( g(SumI+995), g(SumI+996), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,2
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*4
SumI = SumI*2 
cplAhHpmcHpm(i1,i2,i3) = Cmplx( g(SumI+1427), g(SumI+1428), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplAhSdcSd(i1,i2,i3) = Cmplx( g(SumI+1475), g(SumI+1476), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplAhSecSe(i1,i2,i3) = Cmplx( g(SumI+1907), g(SumI+1908), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplAhSucSu(i1,i2,i3) = Cmplx( g(SumI+2339), g(SumI+2340), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplAhSvcSv(i1,i2,i3) = Cmplx( g(SumI+2771), g(SumI+2772), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplhhhhhh(i1,i2,i3) = Cmplx( g(SumI+3203), g(SumI+3204), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,2
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*4
SumI = SumI*2 
cplhhHpmcHpm(i1,i2,i3) = Cmplx( g(SumI+3635), g(SumI+3636), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplhhSdcSd(i1,i2,i3) = Cmplx( g(SumI+3683), g(SumI+3684), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplhhSecSe(i1,i2,i3) = Cmplx( g(SumI+4115), g(SumI+4116), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplhhSucSu(i1,i2,i3) = Cmplx( g(SumI+4547), g(SumI+4548), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplhhSvcSv(i1,i2,i3) = Cmplx( g(SumI+4979), g(SumI+4980), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplHpmSucSd(i1,i2,i3) = Cmplx( g(SumI+5411), g(SumI+5412), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*36
SumI = SumI*2 
cplHpmSvcSe(i1,i2,i3) = Cmplx( g(SumI+5555), g(SumI+5556), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplSdcHpmcSu(i1,i2,i3) = Cmplx( g(SumI+5699), g(SumI+5700), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplSecHpmcSv(i1,i2,i3) = Cmplx( g(SumI+5843), g(SumI+5844), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplSdcSdVG(i1,i2) = Cmplx( g(SumI+5987), g(SumI+5988), dp) 
End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplSucSuVG(i1,i2) = Cmplx( g(SumI+6059), g(SumI+6060), dp) 
End Do 
 End Do 
 
cplVGVGVG= Cmplx(g(6131),g(6132),dp) 
Do i1 = 1,2
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplcChaChaAhL(i1,i2,i3) = Cmplx( g(SumI+6133), g(SumI+6134), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplcChaChaAhR(i1,i2,i3) = Cmplx( g(SumI+6181), g(SumI+6182), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
cplChiChiAhL(i1,i2,i3) = Cmplx( g(SumI+6229), g(SumI+6230), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
cplChiChiAhR(i1,i2,i3) = Cmplx( g(SumI+7201), g(SumI+7202), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcFdFdAhL(i1,i2,i3) = Cmplx( g(SumI+8173), g(SumI+8174), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcFdFdAhR(i1,i2,i3) = Cmplx( g(SumI+8281), g(SumI+8282), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcFeFeAhL(i1,i2,i3) = Cmplx( g(SumI+8389), g(SumI+8390), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcFeFeAhR(i1,i2,i3) = Cmplx( g(SumI+8497), g(SumI+8498), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcFuFuAhL(i1,i2,i3) = Cmplx( g(SumI+8605), g(SumI+8606), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcFuFuAhR(i1,i2,i3) = Cmplx( g(SumI+8713), g(SumI+8714), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcFvFvAhL(i1,i2,i3) = Cmplx( g(SumI+8821), g(SumI+8822), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcFvFvAhR(i1,i2,i3) = Cmplx( g(SumI+8929), g(SumI+8930), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,2
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*4
SumI = SumI*2 
cplChiChacHpmL(i1,i2,i3) = Cmplx( g(SumI+9037), g(SumI+9038), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,2
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*4
SumI = SumI*2 
cplChiChacHpmR(i1,i2,i3) = Cmplx( g(SumI+9109), g(SumI+9110), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChaFucSdL(i1,i2,i3) = Cmplx( g(SumI+9181), g(SumI+9182), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChaFucSdR(i1,i2,i3) = Cmplx( g(SumI+9253), g(SumI+9254), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChaFvcSeL(i1,i2,i3) = Cmplx( g(SumI+9325), g(SumI+9326), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChaFvcSeR(i1,i2,i3) = Cmplx( g(SumI+9397), g(SumI+9398), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplcChaChahhL(i1,i2,i3) = Cmplx( g(SumI+9469), g(SumI+9470), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplcChaChahhR(i1,i2,i3) = Cmplx( g(SumI+9517), g(SumI+9518), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplcFdChaSuL(i1,i2,i3) = Cmplx( g(SumI+9565), g(SumI+9566), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplcFdChaSuR(i1,i2,i3) = Cmplx( g(SumI+9637), g(SumI+9638), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplcFeChaSvL(i1,i2,i3) = Cmplx( g(SumI+9709), g(SumI+9710), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,2
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*12
SumI = SumI*2 
cplcFeChaSvR(i1,i2,i3) = Cmplx( g(SumI+9781), g(SumI+9782), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
cplChiChihhL(i1,i2,i3) = Cmplx( g(SumI+9853), g(SumI+9854), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
cplChiChihhR(i1,i2,i3) = Cmplx( g(SumI+10825), g(SumI+10826), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChiFdcSdL(i1,i2,i3) = Cmplx( g(SumI+11797), g(SumI+11798), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChiFdcSdR(i1,i2,i3) = Cmplx( g(SumI+12121), g(SumI+12122), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChiFecSeL(i1,i2,i3) = Cmplx( g(SumI+12445), g(SumI+12446), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChiFecSeR(i1,i2,i3) = Cmplx( g(SumI+12769), g(SumI+12770), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChiFucSuL(i1,i2,i3) = Cmplx( g(SumI+13093), g(SumI+13094), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChiFucSuR(i1,i2,i3) = Cmplx( g(SumI+13417), g(SumI+13418), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChiFvcSvL(i1,i2,i3) = Cmplx( g(SumI+13741), g(SumI+13742), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,9
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplChiFvcSvR(i1,i2,i3) = Cmplx( g(SumI+14065), g(SumI+14066), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,9
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*18
SumI = SumI*2 
cplcChaChiHpmL(i1,i2,i3) = Cmplx( g(SumI+14389), g(SumI+14390), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,9
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*18
SumI = SumI*2 
cplcChaChiHpmR(i1,i2,i3) = Cmplx( g(SumI+14461), g(SumI+14462), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
cplcFdChiSdL(i1,i2,i3) = Cmplx( g(SumI+14533), g(SumI+14534), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
cplcFdChiSdR(i1,i2,i3) = Cmplx( g(SumI+14857), g(SumI+14858), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
cplcFeChiSeL(i1,i2,i3) = Cmplx( g(SumI+15181), g(SumI+15182), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
cplcFeChiSeR(i1,i2,i3) = Cmplx( g(SumI+15505), g(SumI+15506), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
cplcFuChiSuL(i1,i2,i3) = Cmplx( g(SumI+15829), g(SumI+15830), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
cplcFuChiSuR(i1,i2,i3) = Cmplx( g(SumI+16153), g(SumI+16154), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
cplcFvChiSvL(i1,i2,i3) = Cmplx( g(SumI+16477), g(SumI+16478), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,9
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*54
SumI = SumI*2 
cplcFvChiSvR(i1,i2,i3) = Cmplx( g(SumI+16801), g(SumI+16802), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplGluFdcSdL(i1,i2) = Cmplx( g(SumI+17125), g(SumI+17126), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplGluFdcSdR(i1,i2) = Cmplx( g(SumI+17161), g(SumI+17162), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcFdFdhhL(i1,i2,i3) = Cmplx( g(SumI+17197), g(SumI+17198), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcFdFdhhR(i1,i2,i3) = Cmplx( g(SumI+17305), g(SumI+17306), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcChaFdcSuL(i1,i2,i3) = Cmplx( g(SumI+17413), g(SumI+17414), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcChaFdcSuR(i1,i2,i3) = Cmplx( g(SumI+17485), g(SumI+17486), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
cplcFuFdcHpmL(i1,i2,i3) = Cmplx( g(SumI+17557), g(SumI+17558), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
cplcFuFdcHpmR(i1,i2,i3) = Cmplx( g(SumI+17593), g(SumI+17594), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcFeFehhL(i1,i2,i3) = Cmplx( g(SumI+17629), g(SumI+17630), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcFeFehhR(i1,i2,i3) = Cmplx( g(SumI+17737), g(SumI+17738), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcChaFecSvL(i1,i2,i3) = Cmplx( g(SumI+17845), g(SumI+17846), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcChaFecSvR(i1,i2,i3) = Cmplx( g(SumI+17917), g(SumI+17918), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
cplcFvFecHpmL(i1,i2,i3) = Cmplx( g(SumI+17989), g(SumI+17990), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
cplcFvFecHpmR(i1,i2,i3) = Cmplx( g(SumI+18025), g(SumI+18026), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplGluFucSuL(i1,i2) = Cmplx( g(SumI+18061), g(SumI+18062), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplGluFucSuR(i1,i2) = Cmplx( g(SumI+18097), g(SumI+18098), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcFuFuhhL(i1,i2,i3) = Cmplx( g(SumI+18133), g(SumI+18134), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcFuFuhhR(i1,i2,i3) = Cmplx( g(SumI+18241), g(SumI+18242), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
cplcFdFuHpmL(i1,i2,i3) = Cmplx( g(SumI+18349), g(SumI+18350), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
cplcFdFuHpmR(i1,i2,i3) = Cmplx( g(SumI+18385), g(SumI+18386), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcFvFvhhL(i1,i2,i3) = Cmplx( g(SumI+18421), g(SumI+18422), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcFvFvhhR(i1,i2,i3) = Cmplx( g(SumI+18529), g(SumI+18530), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
cplcFeFvHpmL(i1,i2,i3) = Cmplx( g(SumI+18637), g(SumI+18638), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
Do i3 = 1,2
SumI = (i3-1) + (i2-1)*2 + (i1-1)*6
SumI = SumI*2 
cplcFeFvHpmR(i1,i2,i3) = Cmplx( g(SumI+18673), g(SumI+18674), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplcFdGluSdL(i1,i2) = Cmplx( g(SumI+18709), g(SumI+18710), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplcFdGluSdR(i1,i2) = Cmplx( g(SumI+18745), g(SumI+18746), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplcFuGluSuL(i1,i2) = Cmplx( g(SumI+18781), g(SumI+18782), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplcFuGluSuR(i1,i2) = Cmplx( g(SumI+18817), g(SumI+18818), dp) 
End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcChacFuSdL(i1,i2,i3) = Cmplx( g(SumI+18853), g(SumI+18854), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcChacFuSdR(i1,i2,i3) = Cmplx( g(SumI+18925), g(SumI+18926), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcChacFvSeL(i1,i2,i3) = Cmplx( g(SumI+18997), g(SumI+18998), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,3
Do i3 = 1,6
SumI = (i3-1) + (i2-1)*6 + (i1-1)*18
SumI = SumI*2 
cplcChacFvSeR(i1,i2,i3) = Cmplx( g(SumI+19069), g(SumI+19070), dp) 
End Do 
 End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
cplcFdFdVGL(i1,i2) = Cmplx( g(SumI+19141), g(SumI+19142), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
cplcFdFdVGR(i1,i2) = Cmplx( g(SumI+19159), g(SumI+19160), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
cplcFuFuVGL(i1,i2) = Cmplx( g(SumI+19177), g(SumI+19178), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
cplcFuFuVGR(i1,i2) = Cmplx( g(SumI+19195), g(SumI+19196), dp) 
End Do 
 End Do 
 
cplGluGluVGL= Cmplx(g(19213),g(19214),dp) 
cplGluGluVGR= Cmplx(g(19215),g(19216),dp) 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplAhAhAhAh(i1,i2,i3,i4) = Cmplx( g(SumI+19217), g(SumI+19218), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplAhAhhhhh(i1,i2,i3,i4) = Cmplx( g(SumI+21809), g(SumI+21810), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,2
SumI = (i4-1) + (i3-1)*2 + (i2-1)*4 + (i1-1)*24
SumI = SumI*2 
cplAhAhHpmcHpm(i1,i2,i3,i4) = Cmplx( g(SumI+24401), g(SumI+24402), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplAhAhSdcSd(i1,i2,i3,i4) = Cmplx( g(SumI+24689), g(SumI+24690), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplAhAhSecSe(i1,i2,i3,i4) = Cmplx( g(SumI+27281), g(SumI+27282), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplAhAhSucSu(i1,i2,i3,i4) = Cmplx( g(SumI+29873), g(SumI+29874), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplAhAhSvcSv(i1,i2,i3,i4) = Cmplx( g(SumI+32465), g(SumI+32466), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplhhhhhhhh(i1,i2,i3,i4) = Cmplx( g(SumI+35057), g(SumI+35058), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,2
SumI = (i4-1) + (i3-1)*2 + (i2-1)*4 + (i1-1)*24
SumI = SumI*2 
cplhhhhHpmcHpm(i1,i2,i3,i4) = Cmplx( g(SumI+37649), g(SumI+37650), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplhhhhSdcSd(i1,i2,i3,i4) = Cmplx( g(SumI+37937), g(SumI+37938), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplhhhhSecSe(i1,i2,i3,i4) = Cmplx( g(SumI+40529), g(SumI+40530), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplhhhhSucSu(i1,i2,i3,i4) = Cmplx( g(SumI+43121), g(SumI+43122), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplhhhhSvcSv(i1,i2,i3,i4) = Cmplx( g(SumI+45713), g(SumI+45714), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,2
Do i3 = 1,2
Do i4 = 1,2
SumI = (i4-1) + (i3-1)*2 + (i2-1)*4 + (i1-1)*8
SumI = SumI*2 
cplHpmHpmcHpmcHpm(i1,i2,i3,i4) = Cmplx( g(SumI+48305), g(SumI+48306), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
cplHpmSdcHpmcSd(i1,i2,i3,i4) = Cmplx( g(SumI+48337), g(SumI+48338), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
cplHpmSecHpmcSe(i1,i2,i3,i4) = Cmplx( g(SumI+48625), g(SumI+48626), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
cplHpmSucHpmcSu(i1,i2,i3,i4) = Cmplx( g(SumI+48913), g(SumI+48914), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,2
Do i2 = 1,6
Do i3 = 1,2
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*12 + (i1-1)*72
SumI = SumI*2 
cplHpmSvcHpmcSv(i1,i2,i3,i4) = Cmplx( g(SumI+49201), g(SumI+49202), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSdSdcSdcSd(i1,i2,i3,i4) = Cmplx( g(SumI+49489), g(SumI+49490), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSdSecSdcSe(i1,i2,i3,i4) = Cmplx( g(SumI+52081), g(SumI+52082), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSdSucSdcSu(i1,i2,i3,i4) = Cmplx( g(SumI+54673), g(SumI+54674), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSeSecSecSe(i1,i2,i3,i4) = Cmplx( g(SumI+57265), g(SumI+57266), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSeSvcSecSv(i1,i2,i3,i4) = Cmplx( g(SumI+59857), g(SumI+59858), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSuSucSucSu(i1,i2,i3,i4) = Cmplx( g(SumI+62449), g(SumI+62450), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSuSvcSucSv(i1,i2,i3,i4) = Cmplx( g(SumI+65041), g(SumI+65042), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
Do i3 = 1,6
Do i4 = 1,6
SumI = (i4-1) + (i3-1)*6 + (i2-1)*36 + (i1-1)*216
SumI = SumI*2 
cplSvSvcSvcSv(i1,i2,i3,i4) = Cmplx( g(SumI+67633), g(SumI+67634), dp) 
End Do 
 End Do 
 End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplSdcSdVGVG(i1,i2) = Cmplx( g(SumI+70225), g(SumI+70226), dp) 
End Do 
 End Do 
 
Do i1 = 1,6
Do i2 = 1,6
SumI = (i2-1) + (i1-1)*6
SumI = SumI*2 
cplSucSuVGVG(i1,i2) = Cmplx( g(SumI+70297), g(SumI+70298), dp) 
End Do 
 End Do 
 
End Subroutine GToMassesCoups

End Module EffectivePotential_sec_UMSSM 
 
