! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 1:18 on 7.11.2019   
! ----------------------------------------------------------------------  
 
 
Module Tadpoles_sec_UMSSM 
 
Use Model_Data_sec_UMSSM 
Use TreeLevelMasses_sec_UMSSM 
Use RGEs_sec_UMSSM 
Use Control 
Use Settings 
Use Mathematics 

Contains 


Subroutine SolveTadpoleEquations(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,               & 
& Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,              & 
& M3,M4,vd,vu,vS,vS1,vS2,vS3,Tad1Loop)

Implicit None
Real(dp),Intent(inout) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp), Intent(in) :: Tad1Loop(6)

! For numerical routines 
Real(dp) :: gC(284)
logical :: broycheck 
Real(dp) :: broyx(6)

If (HighScaleModel.Eq."LOW") Then 
mHd2 = -(g1**2*vd**3 + g2**2*vd**3 + 4*gp**2*QHd**2*vd**3 + 4*gp**2*QHd*Qs*vd*vS**2 +        & 
&  4*gp**2*QHd*Qs1*vd*vS1**2 + 4*gp**2*QHd*Qs2*vd*vS2**2 + 4*gp**2*QHd*Qs3*vd*vS3**2 -   & 
&  g1**2*vd*vu**2 - g2**2*vd*vu**2 + 4*gp**2*QHd*QHu*vd*vu**2 + 4*vd*(vS**2 +            & 
&  vu**2)*lam*Conjg(lam) - 2*sqrt(2._dp)*vS*vu*Conjg(Tlam) - 2*sqrt(2._dp)*vS*vu*Tlam -  & 
&  8*Tad1Loop(1))/(8._dp*vd)
mHu2 = -(-(g1**2*vd**2*vu) - g2**2*vd**2*vu + 4*gp**2*QHd*QHu*vd**2*vu + 4*gp**2*QHu*Qs*vS**2*vu +& 
&  4*gp**2*QHu*Qs1*vS1**2*vu + 4*gp**2*QHu*Qs2*vS2**2*vu + 4*gp**2*QHu*Qs3*vS3**2*vu +   & 
&  g1**2*vu**3 + g2**2*vu**3 + 4*gp**2*QHu**2*vu**3 + 4*(vd**2 + vS**2)*vu*lam*Conjg(lam) -& 
&  2*sqrt(2._dp)*vd*vS*Conjg(Tlam) - 2*sqrt(2._dp)*vd*vS*Tlam - 8*Tad1Loop(2))/(8._dp*vu)
ms2 = -(2*gp**2*QHd*Qs*vd**2*vS + 2*gp**2*Qs**2*vS**3 + 2*gp**2*Qs*Qs1*vS*vS1**2 +          & 
&  2*gp**2*Qs*Qs2*vS*vS2**2 + 2*gp**2*Qs*Qs3*vS*vS3**2 + 2*gp**2*QHu*Qs*vS*vu**2 +       & 
&  2*vS*(vd**2 + vu**2)*lam*Conjg(lam) - sqrt(2._dp)*vd*vu*Conjg(Tlam) - sqrt(2._dp)*vd*vu*Tlam -& 
&  4*Tad1Loop(3))/(4._dp*vS)
ms12 = -(2*vS1*(vS2**2 + vS3**2)*kap*Conjg(kap) + 3*(6*gp**2*Qs1*vS1*(QHd*vd**2 +            & 
&  Qs*vS**2 + Qs1*vS1**2 + Qs2*vS2**2 + Qs3*vS3**2 + QHu*vu**2) + sqrt(2._dp)*vS2*vS3*Conjg(Tk) +& 
&  sqrt(2._dp)*vS2*vS3*Tk - 12*Tad1Loop(4)))/(36._dp*vS1)
ms22 = -(2*vS2*(vS1**2 + vS3**2)*kap*Conjg(kap) + 3*(6*gp**2*Qs2*vS2*(QHd*vd**2 +            & 
&  Qs*vS**2 + Qs1*vS1**2 + Qs2*vS2**2 + Qs3*vS3**2 + QHu*vu**2) + sqrt(2._dp)*vS1*vS3*Conjg(Tk) +& 
&  sqrt(2._dp)*vS1*vS3*Tk - 12*Tad1Loop(5)))/(36._dp*vS2)
ms32 = -(2*(vS1**2 + vS2**2)*vS3*kap*Conjg(kap) + 3*(6*gp**2*Qs3*vS3*(QHd*vd**2 +            & 
&  Qs*vS**2 + Qs1*vS1**2 + Qs2*vS2**2 + Qs3*vS3**2 + QHu*vu**2) + sqrt(2._dp)*vS1*vS2*Conjg(Tk) +& 
&  sqrt(2._dp)*vS1*vS2*Tk - 12*Tad1Loop(6)))/(36._dp*vS3)

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (mHd2.ne.mHd2) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mHd2" 
   Call TerminateProgram  
 End If 
 If (mHu2.ne.mHu2) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mHu2" 
   Call TerminateProgram  
 End If 
 If (ms2.ne.ms2) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for ms2" 
   Call TerminateProgram  
 End If 
 If (ms12.ne.ms12) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for ms12" 
   Call TerminateProgram  
 End If 
 If (ms22.ne.ms22) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for ms22" 
   Call TerminateProgram  
 End If 
 If (ms32.ne.ms32) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for ms32" 
   Call TerminateProgram  
 End If 
 Else 
mHd2 = -(g1**2*vd**3 + g2**2*vd**3 + 4*gp**2*QHd**2*vd**3 + 4*gp**2*QHd*Qs*vd*vS**2 +        & 
&  4*gp**2*QHd*Qs1*vd*vS1**2 + 4*gp**2*QHd*Qs2*vd*vS2**2 + 4*gp**2*QHd*Qs3*vd*vS3**2 -   & 
&  g1**2*vd*vu**2 - g2**2*vd*vu**2 + 4*gp**2*QHd*QHu*vd*vu**2 + 4*vd*(vS**2 +            & 
&  vu**2)*lam*Conjg(lam) - 2*sqrt(2._dp)*vS*vu*Conjg(Tlam) - 2*sqrt(2._dp)*vS*vu*Tlam -  & 
&  8*Tad1Loop(1))/(8._dp*vd)
mHu2 = -(-(g1**2*vd**2*vu) - g2**2*vd**2*vu + 4*gp**2*QHd*QHu*vd**2*vu + 4*gp**2*QHu*Qs*vS**2*vu +& 
&  4*gp**2*QHu*Qs1*vS1**2*vu + 4*gp**2*QHu*Qs2*vS2**2*vu + 4*gp**2*QHu*Qs3*vS3**2*vu +   & 
&  g1**2*vu**3 + g2**2*vu**3 + 4*gp**2*QHu**2*vu**3 + 4*(vd**2 + vS**2)*vu*lam*Conjg(lam) -& 
&  2*sqrt(2._dp)*vd*vS*Conjg(Tlam) - 2*sqrt(2._dp)*vd*vS*Tlam - 8*Tad1Loop(2))/(8._dp*vu)
ms2 = -(2*gp**2*QHd*Qs*vd**2*vS + 2*gp**2*Qs**2*vS**3 + 2*gp**2*Qs*Qs1*vS*vS1**2 +          & 
&  2*gp**2*Qs*Qs2*vS*vS2**2 + 2*gp**2*Qs*Qs3*vS*vS3**2 + 2*gp**2*QHu*Qs*vS*vu**2 +       & 
&  2*vS*(vd**2 + vu**2)*lam*Conjg(lam) - sqrt(2._dp)*vd*vu*Conjg(Tlam) - sqrt(2._dp)*vd*vu*Tlam -& 
&  4*Tad1Loop(3))/(4._dp*vS)
ms12 = -(2*vS1*(vS2**2 + vS3**2)*kap*Conjg(kap) + 3*(6*gp**2*Qs1*vS1*(QHd*vd**2 +            & 
&  Qs*vS**2 + Qs1*vS1**2 + Qs2*vS2**2 + Qs3*vS3**2 + QHu*vu**2) + sqrt(2._dp)*vS2*vS3*Conjg(Tk) +& 
&  sqrt(2._dp)*vS2*vS3*Tk - 12*Tad1Loop(4)))/(36._dp*vS1)
ms22 = -(2*vS2*(vS1**2 + vS3**2)*kap*Conjg(kap) + 3*(6*gp**2*Qs2*vS2*(QHd*vd**2 +            & 
&  Qs*vS**2 + Qs1*vS1**2 + Qs2*vS2**2 + Qs3*vS3**2 + QHu*vu**2) + sqrt(2._dp)*vS1*vS3*Conjg(Tk) +& 
&  sqrt(2._dp)*vS1*vS3*Tk - 12*Tad1Loop(5)))/(36._dp*vS2)
ms32 = -(2*(vS1**2 + vS2**2)*vS3*kap*Conjg(kap) + 3*(6*gp**2*Qs3*vS3*(QHd*vd**2 +            & 
&  Qs*vS**2 + Qs1*vS1**2 + Qs2*vS2**2 + Qs3*vS3**2 + QHu*vu**2) + sqrt(2._dp)*vS1*vS2*Conjg(Tk) +& 
&  sqrt(2._dp)*vS1*vS2*Tk - 12*Tad1Loop(6)))/(36._dp*vS3)

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (mHd2.ne.mHd2) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mHd2" 
   Call TerminateProgram  
 End If 
 If (mHu2.ne.mHu2) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mHu2" 
   Call TerminateProgram  
 End If 
 If (ms2.ne.ms2) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for ms2" 
   Call TerminateProgram  
 End If 
 If (ms12.ne.ms12) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for ms12" 
   Call TerminateProgram  
 End If 
 If (ms22.ne.ms22) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for ms22" 
   Call TerminateProgram  
 End If 
 If (ms32.ne.ms32) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for ms32" 
   Call TerminateProgram  
 End If 
 End if 
End Subroutine SolveTadpoleEquations

Subroutine CalculateTadpoles(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,              & 
& Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,             & 
& vd,vu,vS,vS1,vS2,vS3,Tad1Loop,TadpoleValues)

Real(dp),Intent(in) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Complex(dp), Intent(in) :: Tad1Loop(6)

Real(dp), Intent(out) :: TadpoleValues(6)

TadpoleValues(1) = Real(((g1**2 + g2**2 + 4*gp**2*QHd**2)*vd**3 + vd*(8._dp*(mHd2)    & 
&  + 4*gp**2*QHd*Qs1*vS1**2 + 4*gp**2*QHd*Qs2*vS2**2 + 4*gp**2*QHd*Qs3*vS3**2 - g1**2*vu**2 - g2**2*vu**2 + 4*gp**2*QHd*QHu*vu**2 + 4*vu**2*lam*Conjg(lam)& 
&  + 4*vS**2*(gp**2*QHd*Qs + lam*Conjg(lam))) - 2*sqrt(2._dp)*vS*vu*(Conjg(Tlam)         & 
&  + Tlam))/8._dp - Tad1Loop(1),dp) 
TadpoleValues(2) = Real((vu*(8._dp*(mHu2) + 4*gp**2*QHu*Qs1*vS1**2 + 4*gp**2*QHu*Qs2*vS2**2 + 4*gp**2*QHu*Qs3*vS3**2 + g1**2*vu**2 + g2**2*vu**2 + 4*gp**2*QHu**2*vu**2 - vd**2*(g1**2 + g2**2 - 4*gp**2*QHd*QHu - 4*lam*Conjg(lam))& 
&  + 4*vS**2*(gp**2*QHu*Qs + lam*Conjg(lam))) - 2*sqrt(2._dp)*vd*vS*Conjg(Tlam)          & 
&  - 2*sqrt(2._dp)*vd*vS*Tlam)/8._dp - Tad1Loop(2),dp) 
TadpoleValues(3) = Real((2*gp**2*Qs**2*vS**3 + 2*vS*(2._dp*(ms2) + gp**2*Qs*Qs1*vS1**2 + gp**2*Qs*Qs2*vS2**2 + gp**2*Qs*Qs3*vS3**2 + gp**2*QHu*Qs*vu**2 + vu**2*lam*Conjg(lam)& 
&  + vd**2*(gp**2*QHd*Qs + lam*Conjg(lam))) - sqrt(2._dp)*vd*vu*(Conjg(Tlam)             & 
&  + Tlam))/4._dp - Tad1Loop(3),dp) 
TadpoleValues(4) = Real((18*gp**2*Qs1**2*vS1**3 + 2*vS1*(18._dp*(ms12) + 9*gp**2*QHd*Qs1*vd**2 + 9*gp**2*Qs*Qs1*vS**2 + 9*gp**2*Qs1*Qs2*vS2**2 + 9*gp**2*Qs1*Qs3*vS3**2 + 9*gp**2*QHu*Qs1*vu**2 + vS2**2*kap*Conjg(kap)& 
&  + vS3**2*kap*Conjg(kap)) + 3*sqrt(2._dp)*vS2*vS3*(Conjg(Tk) + Tk))/36._dp - Tad1Loop(4),dp) 
TadpoleValues(5) = Real((18*gp**2*Qs2**2*vS2**3 + 2*vS2*(18._dp*(ms22) + 9*gp**2*QHd*Qs2*vd**2 + 9*gp**2*Qs*Qs2*vS**2 + 9*gp**2*Qs1*Qs2*vS1**2 + 9*gp**2*Qs2*Qs3*vS3**2 + 9*gp**2*QHu*Qs2*vu**2 + vS1**2*kap*Conjg(kap)& 
&  + vS3**2*kap*Conjg(kap)) + 3*sqrt(2._dp)*vS1*vS3*(Conjg(Tk) + Tk))/36._dp - Tad1Loop(5),dp) 
TadpoleValues(6) = Real((2*vS3*(18._dp*(ms32) + 9*gp**2*QHd*Qs3*vd**2 + 9*gp**2*Qs*Qs3*vS**2 + 9*gp**2*Qs1*Qs3*vS1**2 + 9*gp**2*Qs2*Qs3*vS2**2 + 9*gp**2*Qs3**2*vS3**2 + 9*gp**2*QHu*Qs3*vu**2 + vS1**2*kap*Conjg(kap)& 
&  + vS2**2*kap*Conjg(kap)) + 3*sqrt(2._dp)*vS1*vS2*Conjg(Tk) + 3*sqrt(2._dp)            & 
& *vS1*vS2*Tk)/36._dp - Tad1Loop(6),dp) 
End Subroutine CalculateTadpoles 

End Module Tadpoles_sec_UMSSM 
 
