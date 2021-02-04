! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 0:56 on 7.11.2019   
! ----------------------------------------------------------------------  
 
 
Module RGEs_sec_UMSSM 
 
Use Control 
Use Settings 
Use Model_Data_sec_UMSSM 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters278(g,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,             & 
& Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4)

Implicit None 
Real(dp), Intent(in) :: g(278) 
Real(dp),Intent(out) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp),Intent(out) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters278' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
gp= g(4) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+5), g(SumI+6), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+23), g(SumI+24), dp) 
End Do 
 End Do 
 
lam= Cmplx(g(41),g(42),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yv(i1,i2) = Cmplx( g(SumI+43), g(SumI+44), dp) 
End Do 
 End Do 
 
kap= Cmplx(g(61),g(62),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+63), g(SumI+64), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Td(i1,i2) = Cmplx( g(SumI+81), g(SumI+82), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Te(i1,i2) = Cmplx( g(SumI+99), g(SumI+100), dp) 
End Do 
 End Do 
 
Tlam= Cmplx(g(117),g(118),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Tv(i1,i2) = Cmplx( g(SumI+119), g(SumI+120), dp) 
End Do 
 End Do 
 
Tk= Cmplx(g(137),g(138),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Tu(i1,i2) = Cmplx( g(SumI+139), g(SumI+140), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mq2(i1,i2) = Cmplx( g(SumI+157), g(SumI+158), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
ml2(i1,i2) = Cmplx( g(SumI+175), g(SumI+176), dp) 
End Do 
 End Do 
 
mHd2= g(193) 
mHu2= g(194) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
md2(i1,i2) = Cmplx( g(SumI+195), g(SumI+196), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mu2(i1,i2) = Cmplx( g(SumI+213), g(SumI+214), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
me2(i1,i2) = Cmplx( g(SumI+231), g(SumI+232), dp) 
End Do 
 End Do 
 
ms2= g(249) 
ms12= g(250) 
ms22= g(251) 
ms32= g(252) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mv2(i1,i2) = Cmplx( g(SumI+253), g(SumI+254), dp) 
End Do 
 End Do 
 
M1= Cmplx(g(271),g(272),dp) 
M2= Cmplx(g(273),g(274),dp) 
M3= Cmplx(g(275),g(276),dp) 
M4= Cmplx(g(277),g(278),dp) 
Do i1=1,278 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters278

Subroutine ParametersToG278(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,               & 
& Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,g)

Implicit None 
Real(dp), Intent(out) :: g(278) 
Real(dp), Intent(in) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp), Intent(in) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG278' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = gp  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+5) = Real(Yd(i1,i2), dp) 
g(SumI+6) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+23) = Real(Ye(i1,i2), dp) 
g(SumI+24) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

g(41) = Real(lam,dp)  
g(42) = Aimag(lam)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+43) = Real(Yv(i1,i2), dp) 
g(SumI+44) = Aimag(Yv(i1,i2)) 
End Do 
End Do 

g(61) = Real(kap,dp)  
g(62) = Aimag(kap)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+63) = Real(Yu(i1,i2), dp) 
g(SumI+64) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+81) = Real(Td(i1,i2), dp) 
g(SumI+82) = Aimag(Td(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+99) = Real(Te(i1,i2), dp) 
g(SumI+100) = Aimag(Te(i1,i2)) 
End Do 
End Do 

g(117) = Real(Tlam,dp)  
g(118) = Aimag(Tlam)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+119) = Real(Tv(i1,i2), dp) 
g(SumI+120) = Aimag(Tv(i1,i2)) 
End Do 
End Do 

g(137) = Real(Tk,dp)  
g(138) = Aimag(Tk)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+139) = Real(Tu(i1,i2), dp) 
g(SumI+140) = Aimag(Tu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+157) = Real(mq2(i1,i2), dp) 
g(SumI+158) = Aimag(mq2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+175) = Real(ml2(i1,i2), dp) 
g(SumI+176) = Aimag(ml2(i1,i2)) 
End Do 
End Do 

g(193) = mHd2  
g(194) = mHu2  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+195) = Real(md2(i1,i2), dp) 
g(SumI+196) = Aimag(md2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+213) = Real(mu2(i1,i2), dp) 
g(SumI+214) = Aimag(mu2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+231) = Real(me2(i1,i2), dp) 
g(SumI+232) = Aimag(me2(i1,i2)) 
End Do 
End Do 

g(249) = ms2  
g(250) = ms12  
g(251) = ms22  
g(252) = ms32  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+253) = Real(mv2(i1,i2), dp) 
g(SumI+254) = Aimag(mv2(i1,i2)) 
End Do 
End Do 

g(271) = Real(M1,dp)  
g(272) = Aimag(M1)  
g(273) = Real(M2,dp)  
g(274) = Aimag(M2)  
g(275) = Real(M3,dp)  
g(276) = Aimag(M3)  
g(277) = Real(M4,dp)  
g(278) = Aimag(M4)  
Iname = Iname - 1 
 
End Subroutine ParametersToG278

Subroutine rge278(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,gp,betagp1,betagp2,Dgp,mHd2,betamHd21,betamHd22,DmHd2,mHu2,betamHu21,              & 
& betamHu22,DmHu2,ms2,betams21,betams22,Dms2,ms12,betams121,betams122,Dms12,             & 
& ms22,betams221,betams222,Dms22,ms32,betams321,betams322,Dms32
Complex(dp) :: Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3)          & 
& ,betaYe1(3,3),betaYe2(3,3),DYe(3,3),adjYe(3,3),lam,betalam1,betalam2,Dlam,             & 
& Yv(3,3),betaYv1(3,3),betaYv2(3,3),DYv(3,3),adjYv(3,3),kap,betakap1,betakap2,           & 
& Dkap,Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3),Td(3,3),betaTd1(3,3)        & 
& ,betaTd2(3,3),DTd(3,3),adjTd(3,3),Te(3,3),betaTe1(3,3),betaTe2(3,3),DTe(3,3)           & 
& ,adjTe(3,3),Tlam,betaTlam1,betaTlam2,DTlam,Tv(3,3),betaTv1(3,3),betaTv2(3,3)           & 
& ,DTv(3,3),adjTv(3,3),Tk,betaTk1,betaTk2,DTk,Tu(3,3),betaTu1(3,3),betaTu2(3,3)          & 
& ,DTu(3,3),adjTu(3,3),mq2(3,3),betamq21(3,3),betamq22(3,3),Dmq2(3,3),ml2(3,3)           & 
& ,betaml21(3,3),betaml22(3,3),Dml2(3,3),md2(3,3),betamd21(3,3),betamd22(3,3)            & 
& ,Dmd2(3,3),mu2(3,3),betamu21(3,3),betamu22(3,3),Dmu2(3,3),me2(3,3),betame21(3,3)       & 
& ,betame22(3,3),Dme2(3,3),mv2(3,3),betamv21(3,3),betamv22(3,3),Dmv2(3,3),               & 
& M1,betaM11,betaM12,DM1,M2,betaM21,betaM22,DM2,M3,betaM31,betaM32,DM3,M4,               & 
& betaM41,betaM42,DM4
Real(dp) :: Tr1(4),Tr2(4),Tr3(4) 
Real(dp) :: Tr2U1(4,4) 
Real(dp) :: Abslam,Abskap,AbsTlam,AbsTk,AbsM1,AbsM2,AbsM3,AbsM4
Complex(dp) :: md2Yd(3,3),me2Ye(3,3),ml2adjYe(3,3),ml2CYv(3,3),mq2adjYd(3,3),mq2adjYu(3,3),          & 
& mu2Yu(3,3),mv2TpYv(3,3),Ydmq2(3,3),YdadjYd(3,3),Yeml2(3,3),YeadjYe(3,3),               & 
& Yumq2(3,3),YuadjYu(3,3),YvadjYv(3,3),adjYdmd2(3,3),adjYdYd(3,3),adjYdTd(3,3),          & 
& adjYeme2(3,3),adjYeYe(3,3),adjYeTe(3,3),adjYumu2(3,3),adjYuYu(3,3),adjYuTu(3,3),       & 
& adjYvYv(3,3),adjYvCml2(3,3),adjYvTv(3,3),adjTdTd(3,3),adjTeTe(3,3),adjTuTu(3,3),       & 
& Cmv2adjYv(3,3),CYeYv(3,3),CYeTv(3,3),CYvmv2(3,3),CYvTpYv(3,3),CYvTpTv(3,3),            & 
& CTdTpTd(3,3),CTeTpTe(3,3),CTuTpTu(3,3),CTvTpTv(3,3),TdadjTd(3,3),TeadjTe(3,3),         & 
& TuadjTu(3,3),TpYvml2(3,3),TpYvCYv(3,3),TpTvCTv(3,3),md2YdadjYd(3,3),me2YeadjYe(3,3),   & 
& ml2adjYeYe(3,3),ml2CYvTpYv(3,3),mq2adjYdYd(3,3),mq2adjYuYu(3,3),mu2YuadjYu(3,3),       & 
& mv2TpYvCYv(3,3),Ydmq2adjYd(3,3),YdadjYdmd2(3,3),YdadjYdYd(3,3),YdadjYdTd(3,3),         & 
& YdadjYuYu(3,3),YdadjYuTu(3,3),Yeml2adjYe(3,3),YeadjYeme2(3,3),YeadjYeYe(3,3),          & 
& YeadjYeTe(3,3),YeCYvTpYv(3,3),YeCYvTpTv(3,3),Yumq2adjYu(3,3),YuadjYdYd(3,3),           & 
& YuadjYdTd(3,3),YuadjYumu2(3,3),YuadjYuYu(3,3),YuadjYuTu(3,3),YvadjYvYv(3,3),           & 
& YvadjYvCml2(3,3),YvadjYvTv(3,3),YvCmv2adjYv(3,3),adjYdmd2Yd(3,3),adjYdYdmq2(3,3),      & 
& adjYeme2Ye(3,3),adjYeYeml2(3,3),adjYumu2Yu(3,3),adjYuYumq2(3,3),CYvmv2TpYv(3,3),       & 
& CYvTpYvml2(3,3),TdadjYdYd(3,3),TdadjYuYu(3,3),TeadjYeYe(3,3),TeCYvTpYv(3,3),           & 
& TuadjYdYd(3,3),TuadjYuYu(3,3),TvadjYvYv(3,3),TpYeCYeYv(3,3),TpYeCYeTv(3,3),            & 
& TpYvml2CYv(3,3),TpYvCYvmv2(3,3),TpTeCYeYv(3,3)

Complex(dp) :: YdadjYu(3,3),YdadjTd(3,3),YdadjTu(3,3),YeadjTe(3,3),YeCYv(3,3),YeCTv(3,3),            & 
& YuadjYd(3,3),YuadjTd(3,3),YuadjTu(3,3),adjYdCmd2(3,3),adjYeCme2(3,3),adjYuCmu2(3,3),   & 
& adjTdYd(3,3),adjTeYe(3,3),adjTuYu(3,3),Cme2CYe(3,3),Cml2adjYe(3,3),Cmq2adjYd(3,3),     & 
& Cmq2adjYu(3,3),CYeCml2(3,3),CTdTpYd(3,3),CTeTv(3,3),CTeTpYe(3,3),CTuTpYu(3,3),         & 
& CTvTpYv(3,3),TdadjYd(3,3),TdadjYu(3,3),TdadjTu(3,3),TeadjYe(3,3),TeCYv(3,3),           & 
& TeCTv(3,3),TuadjYd(3,3),TuadjYu(3,3),TuadjTd(3,3),TvadjYv(3,3),TvadjTv(3,3),           & 
& TpYeCYe(3,3),TpYvadjYe(3,3),TpYvadjTe(3,3),TpYvCTv(3,3),TpTeCTe(3,3),TpTvadjYe(3,3),   & 
& TpTvadjTe(3,3),TpTvCYv(3,3),md2YdadjYu(3,3),me2YeCYv(3,3),ml2YvadjYv(3,3),             & 
& mu2YuadjYd(3,3),mv2adjYvYv(3,3),mv2TpYvadjYe(3,3),Ydmq2adjYu(3,3),YdadjYdCmd2(3,3),    & 
& YdadjYumu2(3,3),YdadjTdTd(3,3),YdCmq2adjYd(3,3),Yeml2CYv(3,3),YeadjYeCme2(3,3),        & 
& YeadjTeTe(3,3),YeCml2adjYe(3,3),YeCYvmv2(3,3),Yumq2adjYd(3,3),YuadjYdmd2(3,3),         & 
& YuadjYuCmu2(3,3),YuadjTuTu(3,3),YuCmq2adjYu(3,3),adjYdYdadjYd(3,3),adjYdYdadjYu(3,3),  & 
& adjYdYdadjTd(3,3),adjYdYdadjTu(3,3),adjYdTdadjYd(3,3),adjYdTdadjYu(3,3),               & 
& adjYdTdadjTd(3,3),adjYdTdadjTu(3,3),adjYeYeadjYe(3,3),adjYeYeadjTe(3,3),               & 
& adjYeYeCYv(3,3),adjYeYeCTv(3,3),adjYeTeadjYe(3,3),adjYeTeadjTe(3,3),adjYeTeCTv(3,3),   & 
& adjYuYuadjYd(3,3),adjYuYuadjYu(3,3),adjYuYuadjTd(3,3),adjYuYuadjTu(3,3),               & 
& adjYuTuadjYd(3,3),adjYuTuadjYu(3,3),adjYuTuadjTd(3,3),adjYuTuadjTu(3,3),               & 
& adjYvYvadjYv(3,3),adjYvTvadjYv(3,3),adjYvTvadjTv(3,3),adjYvTpYeCYe(3,3),               & 
& adjYvTpTeCTe(3,3),adjTdYdadjYd(3,3),adjTdYdadjYu(3,3),adjTdTdadjYd(3,3),               & 
& adjTdTdadjYu(3,3),adjTeYeadjYe(3,3),adjTeYeCYv(3,3),adjTeTeadjYe(3,3),adjTeTeCYv(3,3), & 
& adjTuYuadjYd(3,3),adjTuYuadjYu(3,3),adjTuTuadjYd(3,3),adjTuTuadjYu(3,3),               & 
& adjTvTvadjYv(3,3),Cml2YvadjYv(3,3),Cml2TpYeCYe(3,3),CYvTpYvadjYe(3,3),CYvTpYvadjTe(3,3),& 
& CYvTpYvCYv(3,3),CYvTpYvCTv(3,3),CYvTpTvadjTe(3,3),CYvTpTvCTv(3,3),CTvTpYvadjYe(3,3),   & 
& CTvTpYvCYv(3,3),CTvTpTvadjYe(3,3),CTvTpTvCYv(3,3),TdadjTdYd(3,3),TeadjTeYe(3,3),       & 
& TeCTvTpYv(3,3),TuadjTuYu(3,3),TpYeCme2CYe(3,3),TpYeCYeCml2(3,3),TpYeCTeTv(3,3),        & 
& TpYvml2adjYe(3,3),TpYvadjYeme2(3,3),TpYvadjYeYe(3,3),TpYvadjYeTe(3,3),TpYvCYvTpYv(3,3),& 
& TpYvCYvTpTv(3,3),TpYvCTvTpTv(3,3),TpTvadjYeYe(3,3),TpTvCYvTpYv(3,3),TpTvCTvTpYv(3,3),  & 
& md2YdadjYdYd(3,3),me2YeadjYeYe(3,3),ml2adjYeYeadjYe(3,3),ml2adjYeYeCYv(3,3),           & 
& ml2CYvTpYvadjYe(3,3),ml2CYvTpYvCYv(3,3),mq2adjYdYdadjYd(3,3),mq2adjYdYdadjYu(3,3),     & 
& mq2adjYuYuadjYd(3,3),mq2adjYuYuadjYu(3,3),mu2YuadjYuYu(3,3),mv2TpYvCYvTpYv(3,3),       & 
& Ydmq2adjYdYd(3,3),YdadjYdmd2Yd(3,3),YdadjYdYdmq2(3,3),YdadjYdYdadjYd(3,3),             & 
& YdadjYdTdadjYd(3,3),YdadjYdTdadjTd(3,3),YdadjYuYuadjYd(3,3),YdadjYuTuadjYd(3,3),       & 
& YdadjYuTuadjTd(3,3),YdadjTdTdadjYd(3,3),YdadjTuTuadjYd(3,3),Yeml2adjYeYe(3,3),         & 
& YeadjYeme2Ye(3,3),YeadjYeYeml2(3,3),YeadjYeYeadjYe(3,3),YeadjYeTeadjYe(3,3),           & 
& YeadjYeTeadjTe(3,3),YeadjTeTeadjYe(3,3),YeCYvTpYvadjYe(3,3),YeCYvTpTvadjTe(3,3),       & 
& YeCTvTpTvadjYe(3,3),Yumq2adjYuYu(3,3),YuadjYdYdadjYu(3,3),YuadjYdTdadjYu(3,3),         & 
& YuadjYdTdadjTu(3,3),YuadjYumu2Yu(3,3),YuadjYuYumq2(3,3),YuadjYuYuadjYu(3,3)

Complex(dp) :: YuadjYuTuadjYu(3,3),YuadjYuTuadjTu(3,3),YuadjTdTdadjYu(3,3),YuadjTuTuadjYu(3,3),       & 
& YvadjYvYvadjYv(3,3),YvadjYvTvadjYv(3,3),YvadjYvTvadjTv(3,3),YvadjYvTpYeCYe(3,3),       & 
& YvadjYvTpTeCTe(3,3),YvadjTvTvadjYv(3,3),adjYdmd2YdadjYd(3,3),adjYdmd2YdadjYu(3,3),     & 
& adjYdYdmq2adjYd(3,3),adjYdYdmq2adjYu(3,3),adjYdYdadjYdmd2(3,3),adjYdYdadjYdYd(3,3),    & 
& adjYdYdadjYdTd(3,3),adjYdYdadjYumu2(3,3),adjYdYdadjYuYu(3,3),adjYdYdadjYuTu(3,3),      & 
& adjYdYdadjTdTd(3,3),adjYdTdadjYdYd(3,3),adjYdTdadjYuYu(3,3),adjYdTdadjTdYd(3,3),       & 
& adjYeme2YeadjYe(3,3),adjYeme2YeCYv(3,3),adjYeYeml2adjYe(3,3),adjYeYeml2CYv(3,3),       & 
& adjYeYeadjYeme2(3,3),adjYeYeadjYeYe(3,3),adjYeYeadjYeTe(3,3),adjYeYeadjTeTe(3,3),      & 
& adjYeYeCYvmv2(3,3),adjYeTeadjYeYe(3,3),adjYeTeadjTeYe(3,3),adjYeTeCYvTpYv(3,3),        & 
& adjYeTeCTvTpYv(3,3),adjYumu2YuadjYd(3,3),adjYumu2YuadjYu(3,3),adjYuYumq2adjYd(3,3),    & 
& adjYuYumq2adjYu(3,3),adjYuYuadjYdmd2(3,3),adjYuYuadjYdYd(3,3),adjYuYuadjYdTd(3,3),     & 
& adjYuYuadjYumu2(3,3),adjYuYuadjYuYu(3,3),adjYuYuadjYuTu(3,3),adjYuYuadjTuTu(3,3),      & 
& adjYuTuadjYdYd(3,3),adjYuTuadjYuYu(3,3),adjYuTuadjTuYu(3,3),adjYvYvadjYvYv(3,3),       & 
& adjYvYvadjYvCml2(3,3),adjYvYvadjYvTv(3,3),adjYvYvCmv2adjYv(3,3),adjYvCml2YvadjYv(3,3), & 
& adjYvCml2TpYeCYe(3,3),adjYvTvadjYvYv(3,3),adjYvTpYeCme2CYe(3,3),adjYvTpYeCYeYv(3,3),   & 
& adjYvTpYeCYeCml2(3,3),adjYvTpYeCYeTv(3,3),adjYvTpYeCTeTv(3,3),adjYvTpTeCYeYv(3,3),     & 
& adjTdYdadjYdTd(3,3),adjTdTdadjYdYd(3,3),adjTeYeadjYeTe(3,3),adjTeTeadjYeYe(3,3),       & 
& adjTuYuadjYuTu(3,3),adjTuTuadjYuYu(3,3),Cmv2adjYvYvadjYv(3,3),Cmv2adjYvTpYeCYe(3,3),   & 
& CYeTpYeCYeYv(3,3),CYeTpYeCYeTv(3,3),CYeTpTeCYeYv(3,3),CYvmv2TpYvadjYe(3,3),            & 
& CYvmv2TpYvCYv(3,3),CYvTpYvml2adjYe(3,3),CYvTpYvml2CYv(3,3),CYvTpYvadjYeme2(3,3),       & 
& CYvTpYvadjYeYe(3,3),CYvTpYvadjYeTe(3,3),CYvTpYvCYvmv2(3,3),CYvTpYvCYvTpYv(3,3),        & 
& CYvTpYvCYvTpTv(3,3),CYvTpYvCTvTpTv(3,3),CYvTpTvadjYeYe(3,3),CYvTpTvCYvTpYv(3,3),       & 
& CYvTpTvCTvTpYv(3,3),CTvTpYvCYvTpTv(3,3),CTvTpTvCYvTpYv(3,3),TdadjYdYdadjTd(3,3),       & 
& TdadjYuYuadjTd(3,3),TdadjTdYdadjYd(3,3),TdadjTuYuadjYd(3,3),TeadjYeYeadjTe(3,3),       & 
& TeadjTeYeadjYe(3,3),TeCYvTpYvadjTe(3,3),TeCTvTpYvadjYe(3,3),TuadjYdYdadjTu(3,3),       & 
& TuadjYuYuadjTu(3,3),TuadjTdYdadjYu(3,3),TuadjTuYuadjYu(3,3),TpYvml2CYvTpYv(3,3),       & 
& TpYvadjYeYeCYv(3,3),TpYvadjYeTeCTv(3,3),TpYvadjTeTeCYv(3,3),TpYvCYvmv2TpYv(3,3),       & 
& TpYvCYvTpYvml2(3,3),TpYvCYvTpYvCYv(3,3),TpYvCYvTpTvCTv(3,3),TpYvCTvTpTvCYv(3,3),       & 
& TpTvadjYeYeCTv(3,3),TpTvadjTeYeCYv(3,3),TpTvCYvTpYvCTv(3,3),TpTvCTvTpYvCYv(3,3),       & 
& md2YdadjYdYdadjYd(3,3),md2YdadjYuYuadjYd(3,3),me2YeadjYeYeadjYe(3,3),me2YeCYvTpYvadjYe(3,3),& 
& ml2adjYeYeadjYeYe(3,3),ml2CYvTpYvCYvTpYv(3,3),mq2adjYdYdadjYdYd(3,3),mq2adjYdYdadjYuYu(3,3),& 
& mq2adjYuYuadjYdYd(3,3),mq2adjYuYuadjYuYu(3,3),mu2YuadjYdYdadjYu(3,3),mu2YuadjYuYuadjYu(3,3),& 
& mv2TpYvadjYeYeCYv(3,3),mv2TpYvCYvTpYvCYv(3,3),Ydmq2adjYdYdadjYd(3,3),Ydmq2adjYuYuadjYd(3,3),& 
& YdadjYdmd2YdadjYd(3,3),YdadjYdYdmq2adjYd(3,3),YdadjYdYdadjYdmd2(3,3),YdadjYdYdadjYdYd(3,3),& 
& YdadjYdYdadjYdTd(3,3),YdadjYdTdadjYdYd(3,3),YdadjYumu2YuadjYd(3,3),YdadjYuYumq2adjYd(3,3),& 
& YdadjYuYuadjYdmd2(3,3),YdadjYuYuadjYdYd(3,3),YdadjYuYuadjYdTd(3,3),YdadjYuYuadjYuYu(3,3),& 
& YdadjYuYuadjYuTu(3,3),YdadjYuTuadjYdYd(3,3),YdadjYuTuadjYuYu(3,3),Yeml2adjYeYeadjYe(3,3)

Complex(dp) :: Yeml2CYvTpYvadjYe(3,3),YeadjYeme2YeadjYe(3,3),YeadjYeYeml2adjYe(3,3),YeadjYeYeadjYeme2(3,3),& 
& YeadjYeYeadjYeYe(3,3),YeadjYeYeadjYeTe(3,3),YeadjYeTeadjYeYe(3,3),YeCYvmv2TpYvadjYe(3,3),& 
& YeCYvTpYvml2adjYe(3,3),YeCYvTpYvadjYeme2(3,3),YeCYvTpYvadjYeYe(3,3),YeCYvTpYvadjYeTe(3,3),& 
& YeCYvTpYvCYvTpYv(3,3),YeCYvTpYvCYvTpTv(3,3),YeCYvTpTvadjYeYe(3,3),YeCYvTpTvCYvTpYv(3,3),& 
& Yumq2adjYdYdadjYu(3,3),Yumq2adjYuYuadjYu(3,3),YuadjYdmd2YdadjYu(3,3),YuadjYdYdmq2adjYu(3,3),& 
& YuadjYdYdadjYdYd(3,3),YuadjYdYdadjYdTd(3,3),YuadjYdYdadjYumu2(3,3),YuadjYdYdadjYuYu(3,3),& 
& YuadjYdYdadjYuTu(3,3),YuadjYdTdadjYdYd(3,3),YuadjYdTdadjYuYu(3,3),YuadjYumu2YuadjYu(3,3),& 
& YuadjYuYumq2adjYu(3,3),YuadjYuYuadjYumu2(3,3),YuadjYuYuadjYuYu(3,3),YuadjYuYuadjYuTu(3,3),& 
& YuadjYuTuadjYuYu(3,3),YvadjYvYvadjYvYv(3,3),YvadjYvYvadjYvCml2(3,3),YvadjYvYvadjYvTv(3,3),& 
& YvadjYvYvCmv2adjYv(3,3),YvadjYvCml2YvadjYv(3,3),YvadjYvCml2TpYeCYe(3,3),               & 
& YvadjYvTvadjYvYv(3,3),YvadjYvTpYeCme2CYe(3,3),YvadjYvTpYeCYeYv(3,3),YvadjYvTpYeCYeCml2(3,3),& 
& YvadjYvTpYeCYeTv(3,3),YvadjYvTpTeCYeYv(3,3),YvCmv2adjYvYvadjYv(3,3),YvCmv2adjYvTpYeCYe(3,3),& 
& adjYdmd2YdadjYdYd(3,3),adjYdYdmq2adjYdYd(3,3),adjYdYdadjYdmd2Yd(3,3),adjYdYdadjYdYdmq2(3,3),& 
& adjYeme2YeadjYeYe(3,3),adjYeYeml2adjYeYe(3,3),adjYeYeadjYeme2Ye(3,3),adjYeYeadjYeYeml2(3,3),& 
& adjYumu2YuadjYuYu(3,3),adjYuYumq2adjYuYu(3,3),adjYuYuadjYumu2Yu(3,3),adjYuYuadjYuYumq2(3,3),& 
& CYvmv2TpYvCYvTpYv(3,3),CYvTpYvml2CYvTpYv(3,3),CYvTpYvCYvmv2TpYv(3,3),CYvTpYvCYvTpYvml2(3,3),& 
& TdadjYdYdadjYdYd(3,3),TdadjYuYuadjYdYd(3,3),TdadjYuYuadjYuYu(3,3),TeadjYeYeadjYeYe(3,3),& 
& TeCYvTpYvadjYeYe(3,3),TeCYvTpYvCYvTpYv(3,3),TuadjYdYdadjYdYd(3,3),TuadjYdYdadjYuYu(3,3),& 
& TuadjYuYuadjYuYu(3,3),TvadjYvYvadjYvYv(3,3),TvadjYvTpYeCYeYv(3,3),TpYeCYeTpYeCYeYv(3,3),& 
& TpYeCYeTpYeCYeTv(3,3),TpYeCYeTpTeCYeYv(3,3),TpYvml2adjYeYeCYv(3,3),TpYvml2CYvTpYvCYv(3,3),& 
& TpYvadjYeme2YeCYv(3,3),TpYvadjYeYeml2CYv(3,3),TpYvadjYeYeCYvmv2(3,3),TpYvCYvmv2TpYvCYv(3,3),& 
& TpYvCYvTpYvml2CYv(3,3),TpYvCYvTpYvCYvmv2(3,3),TpTeCYeTpYeCYeYv(3,3)

Complex(dp) :: Trmd2,Trme2,Trml2,Trmq2,Trmu2,Trmv2,TrYdadjYd,TrYeadjYe,TrYuadjYu,TrYvadjYv,          & 
& TradjYdTd,TradjYeTe,TradjYuTu,TradjYvTv,TrCTdTpTd,TrCTeTpTe,TrCTuTpTu,TrCTvTpTv,       & 
& Trmd2YdadjYd,Trme2YeadjYe,Trml2adjYeYe,Trmq2adjYdYd,Trmq2adjYuYu,Trmu2YuadjYu,         & 
& TrYvadjYvCml2,TrYvCmv2adjYv

Complex(dp) :: TrCTdTpYd,TrCTeTpYe,TrCTuTpYu,TrCTvTpYv,Trml2YvadjYv,Trmv2adjYvYv,TrYdadjYdCmd2,      & 
& TrYdCmq2adjYd,TrYeadjYeCme2,TrYeCml2adjYe,TrYuadjYuCmu2,TrYuCmq2adjYu,TrYdadjYdYdadjYd,& 
& TrYdadjYdTdadjYd,TrYdadjYdTdadjTd,TrYdadjYuYuadjYd,TrYdadjYuTuadjYd,TrYdadjYuTuadjTd,  & 
& TrYdadjTdTdadjYd,TrYdadjTuTuadjYd,TrYeadjYeYeadjYe,TrYeadjYeTeadjYe,TrYeadjYeTeadjTe,  & 
& TrYeadjTeTeadjYe,TrYeCTvTpTvadjYe,TrYuadjYdTdadjYu,TrYuadjYdTdadjTu,TrYuadjYuYuadjYu,  & 
& TrYuadjYuTuadjYu,TrYuadjYuTuadjTu,TrYuadjTdTdadjYu,TrYuadjTuTuadjYu,TrYvadjYvYvadjYv,  & 
& TrYvadjYvTvadjYv,TrYvadjYvTvadjTv,TrYvadjYvTpYeCYe,TrYvadjYvTpTeCTe,TrYvadjTvTvadjYv,  & 
& TradjYeTeCYvTpYv,TradjYeTeCTvTpYv,TradjYvTpYeCYeTv,TradjYvTpYeCTeTv,Trmd2YdadjYdYdadjYd,& 
& Trmd2YdadjYuYuadjYd,Trme2YeadjYeYeadjYe,Trml2adjYeYeadjYeYe,Trmq2adjYdYdadjYdYd,       & 
& Trmq2adjYdYdadjYuYu,Trmq2adjYuYuadjYdYd,Trmq2adjYuYuadjYuYu,Trmu2YuadjYdYdadjYu,       & 
& Trmu2YuadjYuYuadjYu,TrYvadjYvYvadjYvCml2,TrYvadjYvYvCmv2adjYv,TrYvadjYvCml2YvadjYv,    & 
& TrYvadjYvCml2TpYeCYe,TrYvadjYvTpYeCme2CYe,TrYvadjYvTpYeCYeCml2,TrYvCmv2adjYvYvadjYv,   & 
& TrYvCmv2adjYvTpYeCYe

Real(dp) :: g1p2,g1p3,g2p2,g2p3,g3p2,g3p3,gpp2,gpp3,Qdp2,Qep2,QHdp2,QHup2,Qlp2,Qqp2,              & 
& Qsp2,Qs1p2,Qs2p2,Qs3p2,Qup2,Qvp2

Complex(dp) :: sqrt3ov5,ooSqrt15,lamp2

Real(dp) :: g1p4,g2p4,g3p4,gpp4,Qdp4,Qep3,Qep4,QHdp3,QHdp4,QHup3,QHup4,Qlp3,Qlp4,Qqp3,            & 
& Qqp4,Qsp3,Qsp4,Qs1p3,Qs1p4,Qs2p3,Qs2p4,Qs3p3,Qs3p4,Qup3,Qup4,Qvp3,Qvp4

Complex(dp) :: kapp2,lamp3,Ckapp2,Clamp2

Iname = Iname +1 
NameOfUnit(Iname) = 'rge278' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters278(gy,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,               & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4)

Abslam = Conjg(lam)*lam
Abskap = Conjg(kap)*kap
AbsTlam = Conjg(Tlam)*Tlam
AbsTk = Conjg(Tk)*Tk
AbsM1 = Conjg(M1)*M1
AbsM2 = Conjg(M2)*M2
AbsM3 = Conjg(M3)*M3
AbsM4 = Conjg(M4)*M4
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
Call Adjungate(Yv,adjYv)
Call Adjungate(Yu,adjYu)
Call Adjungate(Td,adjTd)
Call Adjungate(Te,adjTe)
Call Adjungate(Tv,adjTv)
Call Adjungate(Tu,adjTu)
 md2Yd = Matmul2(md2,Yd,OnlyDiagonal) 
 me2Ye = Matmul2(me2,Ye,OnlyDiagonal) 
 ml2adjYe = Matmul2(ml2,adjYe,OnlyDiagonal) 
 ml2CYv = Matmul2(ml2,Conjg(Yv),OnlyDiagonal) 
 mq2adjYd = Matmul2(mq2,adjYd,OnlyDiagonal) 
 mq2adjYu = Matmul2(mq2,adjYu,OnlyDiagonal) 
 mu2Yu = Matmul2(mu2,Yu,OnlyDiagonal) 
 mv2TpYv = Matmul2(mv2,Transpose(Yv),OnlyDiagonal) 
 Ydmq2 = Matmul2(Yd,mq2,OnlyDiagonal) 
 YdadjYd = Matmul2(Yd,adjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYd(i2,i2) =  Real(YdadjYd(i2,i2),dp) 
 Yeml2 = Matmul2(Ye,ml2,OnlyDiagonal) 
 YeadjYe = Matmul2(Ye,adjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeadjYe(i2,i2) =  Real(YeadjYe(i2,i2),dp) 
 Yumq2 = Matmul2(Yu,mq2,OnlyDiagonal) 
 YuadjYu = Matmul2(Yu,adjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYu(i2,i2) =  Real(YuadjYu(i2,i2),dp) 
 YvadjYv = Matmul2(Yv,adjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvadjYv(i2,i2) =  Real(YvadjYv(i2,i2),dp) 
 adjYdmd2 = Matmul2(adjYd,md2,OnlyDiagonal) 
 adjYdYd = Matmul2(adjYd,Yd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdYd(i2,i2) =  Real(adjYdYd(i2,i2),dp) 
 adjYdTd = Matmul2(adjYd,Td,OnlyDiagonal) 
 adjYeme2 = Matmul2(adjYe,me2,OnlyDiagonal) 
 adjYeYe = Matmul2(adjYe,Ye,OnlyDiagonal) 
Forall(i2=1:3)  adjYeYe(i2,i2) =  Real(adjYeYe(i2,i2),dp) 
 adjYeTe = Matmul2(adjYe,Te,OnlyDiagonal) 
 adjYumu2 = Matmul2(adjYu,mu2,OnlyDiagonal) 
 adjYuYu = Matmul2(adjYu,Yu,OnlyDiagonal) 
Forall(i2=1:3)  adjYuYu(i2,i2) =  Real(adjYuYu(i2,i2),dp) 
 adjYuTu = Matmul2(adjYu,Tu,OnlyDiagonal) 
 adjYvYv = Matmul2(adjYv,Yv,OnlyDiagonal) 
Forall(i2=1:3)  adjYvYv(i2,i2) =  Real(adjYvYv(i2,i2),dp) 
 adjYvCml2 = Matmul2(adjYv,Conjg(ml2),OnlyDiagonal) 
 adjYvTv = Matmul2(adjYv,Tv,OnlyDiagonal) 
 adjTdTd = Matmul2(adjTd,Td,OnlyDiagonal) 
 adjTeTe = Matmul2(adjTe,Te,OnlyDiagonal) 
 adjTuTu = Matmul2(adjTu,Tu,OnlyDiagonal) 
 Cmv2adjYv = Matmul2(Conjg(mv2),adjYv,OnlyDiagonal) 
 CYeYv = Matmul2(Conjg(Ye),Yv,OnlyDiagonal) 
 CYeTv = Matmul2(Conjg(Ye),Tv,OnlyDiagonal) 
 CYvmv2 = Matmul2(Conjg(Yv),mv2,OnlyDiagonal) 
 CYvTpYv = Matmul2(Conjg(Yv),Transpose(Yv),OnlyDiagonal) 
Forall(i2=1:3)  CYvTpYv(i2,i2) =  Real(CYvTpYv(i2,i2),dp) 
 CYvTpTv = Matmul2(Conjg(Yv),Transpose(Tv),OnlyDiagonal) 
 CTdTpTd = Matmul2(Conjg(Td),Transpose(Td),OnlyDiagonal) 
Forall(i2=1:3)  CTdTpTd(i2,i2) =  Real(CTdTpTd(i2,i2),dp) 
 CTeTpTe = Matmul2(Conjg(Te),Transpose(Te),OnlyDiagonal) 
Forall(i2=1:3)  CTeTpTe(i2,i2) =  Real(CTeTpTe(i2,i2),dp) 
 CTuTpTu = Matmul2(Conjg(Tu),Transpose(Tu),OnlyDiagonal) 
Forall(i2=1:3)  CTuTpTu(i2,i2) =  Real(CTuTpTu(i2,i2),dp) 
 CTvTpTv = Matmul2(Conjg(Tv),Transpose(Tv),OnlyDiagonal) 
Forall(i2=1:3)  CTvTpTv(i2,i2) =  Real(CTvTpTv(i2,i2),dp) 
 TdadjTd = Matmul2(Td,adjTd,OnlyDiagonal) 
 TeadjTe = Matmul2(Te,adjTe,OnlyDiagonal) 
 TuadjTu = Matmul2(Tu,adjTu,OnlyDiagonal) 
 TpYvml2 = Matmul2(Transpose(Yv),ml2,OnlyDiagonal) 
 TpYvCYv = Matmul2(Transpose(Yv),Conjg(Yv),OnlyDiagonal) 
Forall(i2=1:3)  TpYvCYv(i2,i2) =  Real(TpYvCYv(i2,i2),dp) 
 TpTvCTv = Matmul2(Transpose(Tv),Conjg(Tv),OnlyDiagonal) 
Forall(i2=1:3)  TpTvCTv(i2,i2) =  Real(TpTvCTv(i2,i2),dp) 
 md2YdadjYd = Matmul2(md2,YdadjYd,OnlyDiagonal) 
 me2YeadjYe = Matmul2(me2,YeadjYe,OnlyDiagonal) 
 ml2adjYeYe = Matmul2(ml2,adjYeYe,OnlyDiagonal) 
 ml2CYvTpYv = Matmul2(ml2,CYvTpYv,OnlyDiagonal) 
 mq2adjYdYd = Matmul2(mq2,adjYdYd,OnlyDiagonal) 
 mq2adjYuYu = Matmul2(mq2,adjYuYu,OnlyDiagonal) 
 mu2YuadjYu = Matmul2(mu2,YuadjYu,OnlyDiagonal) 
 mv2TpYvCYv = Matmul2(mv2,TpYvCYv,OnlyDiagonal) 
 Ydmq2adjYd = Matmul2(Yd,mq2adjYd,OnlyDiagonal) 
Forall(i2=1:3)  Ydmq2adjYd(i2,i2) =  Real(Ydmq2adjYd(i2,i2),dp) 
 YdadjYdmd2 = Matmul2(Yd,adjYdmd2,OnlyDiagonal) 
 YdadjYdYd = Matmul2(Yd,adjYdYd,OnlyDiagonal) 
 YdadjYdTd = Matmul2(Yd,adjYdTd,OnlyDiagonal) 
 YdadjYuYu = Matmul2(Yd,adjYuYu,OnlyDiagonal) 
 YdadjYuTu = Matmul2(Yd,adjYuTu,OnlyDiagonal) 
 Yeml2adjYe = Matmul2(Ye,ml2adjYe,OnlyDiagonal) 
Forall(i2=1:3)  Yeml2adjYe(i2,i2) =  Real(Yeml2adjYe(i2,i2),dp) 
 YeadjYeme2 = Matmul2(Ye,adjYeme2,OnlyDiagonal) 
 YeadjYeYe = Matmul2(Ye,adjYeYe,OnlyDiagonal) 
 YeadjYeTe = Matmul2(Ye,adjYeTe,OnlyDiagonal) 
 YeCYvTpYv = Matmul2(Ye,CYvTpYv,OnlyDiagonal) 
 YeCYvTpTv = Matmul2(Ye,CYvTpTv,OnlyDiagonal) 
 Yumq2adjYu = Matmul2(Yu,mq2adjYu,OnlyDiagonal) 
Forall(i2=1:3)  Yumq2adjYu(i2,i2) =  Real(Yumq2adjYu(i2,i2),dp) 
 YuadjYdYd = Matmul2(Yu,adjYdYd,OnlyDiagonal) 
 YuadjYdTd = Matmul2(Yu,adjYdTd,OnlyDiagonal) 
 YuadjYumu2 = Matmul2(Yu,adjYumu2,OnlyDiagonal) 
 YuadjYuYu = Matmul2(Yu,adjYuYu,OnlyDiagonal) 
 YuadjYuTu = Matmul2(Yu,adjYuTu,OnlyDiagonal) 
 YvadjYvYv = Matmul2(Yv,adjYvYv,OnlyDiagonal) 
 YvadjYvCml2 = Matmul2(Yv,adjYvCml2,OnlyDiagonal) 
 YvadjYvTv = Matmul2(Yv,adjYvTv,OnlyDiagonal) 
 YvCmv2adjYv = Matmul2(Yv,Cmv2adjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvCmv2adjYv(i2,i2) =  Real(YvCmv2adjYv(i2,i2),dp) 
 adjYdmd2Yd = Matmul2(adjYd,md2Yd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdmd2Yd(i2,i2) =  Real(adjYdmd2Yd(i2,i2),dp) 
 adjYdYdmq2 = Matmul2(adjYd,Ydmq2,OnlyDiagonal) 
 adjYeme2Ye = Matmul2(adjYe,me2Ye,OnlyDiagonal) 
Forall(i2=1:3)  adjYeme2Ye(i2,i2) =  Real(adjYeme2Ye(i2,i2),dp) 
 adjYeYeml2 = Matmul2(adjYe,Yeml2,OnlyDiagonal) 
 adjYumu2Yu = Matmul2(adjYu,mu2Yu,OnlyDiagonal) 
Forall(i2=1:3)  adjYumu2Yu(i2,i2) =  Real(adjYumu2Yu(i2,i2),dp) 
 adjYuYumq2 = Matmul2(adjYu,Yumq2,OnlyDiagonal) 
 CYvmv2TpYv = Matmul2(Conjg(Yv),mv2TpYv,OnlyDiagonal) 
Forall(i2=1:3)  CYvmv2TpYv(i2,i2) =  Real(CYvmv2TpYv(i2,i2),dp) 
 CYvTpYvml2 = Matmul2(Conjg(Yv),TpYvml2,OnlyDiagonal) 
 TdadjYdYd = Matmul2(Td,adjYdYd,OnlyDiagonal) 
 TdadjYuYu = Matmul2(Td,adjYuYu,OnlyDiagonal) 
 TeadjYeYe = Matmul2(Te,adjYeYe,OnlyDiagonal) 
 TeCYvTpYv = Matmul2(Te,CYvTpYv,OnlyDiagonal) 
 TuadjYdYd = Matmul2(Tu,adjYdYd,OnlyDiagonal) 
 TuadjYuYu = Matmul2(Tu,adjYuYu,OnlyDiagonal) 
 TvadjYvYv = Matmul2(Tv,adjYvYv,OnlyDiagonal) 
 TpYeCYeYv = Matmul2(Transpose(Ye),CYeYv,OnlyDiagonal) 
 TpYeCYeTv = Matmul2(Transpose(Ye),CYeTv,OnlyDiagonal) 
 TpYvml2CYv = Matmul2(Transpose(Yv),ml2CYv,OnlyDiagonal) 
Forall(i2=1:3)  TpYvml2CYv(i2,i2) =  Real(TpYvml2CYv(i2,i2),dp) 
 TpYvCYvmv2 = Matmul2(Transpose(Yv),CYvmv2,OnlyDiagonal) 
 TpTeCYeYv = Matmul2(Transpose(Te),CYeYv,OnlyDiagonal) 
 Trmd2 = Real(cTrace(md2),dp) 
 Trme2 = Real(cTrace(me2),dp) 
 Trml2 = Real(cTrace(ml2),dp) 
 Trmq2 = Real(cTrace(mq2),dp) 
 Trmu2 = Real(cTrace(mu2),dp) 
 Trmv2 = Real(cTrace(mv2),dp) 
 TrYdadjYd = Real(cTrace(YdadjYd),dp) 
 TrYeadjYe = Real(cTrace(YeadjYe),dp) 
 TrYuadjYu = Real(cTrace(YuadjYu),dp) 
 TrYvadjYv = Real(cTrace(YvadjYv),dp) 
 TradjYdTd = cTrace(adjYdTd) 
 TradjYeTe = cTrace(adjYeTe) 
 TradjYuTu = cTrace(adjYuTu) 
 TradjYvTv = cTrace(adjYvTv) 
 TrCTdTpTd = Real(cTrace(CTdTpTd),dp) 
 TrCTeTpTe = Real(cTrace(CTeTpTe),dp) 
 TrCTuTpTu = Real(cTrace(CTuTpTu),dp) 
 TrCTvTpTv = Real(cTrace(CTvTpTv),dp) 
 Trmd2YdadjYd = cTrace(md2YdadjYd) 
 Trme2YeadjYe = cTrace(me2YeadjYe) 
 Trml2adjYeYe = cTrace(ml2adjYeYe) 
 Trmq2adjYdYd = cTrace(mq2adjYdYd) 
 Trmq2adjYuYu = cTrace(mq2adjYuYu) 
 Trmu2YuadjYu = cTrace(mu2YuadjYu) 
 TrYvadjYvCml2 = cTrace(YvadjYvCml2) 
 TrYvCmv2adjYv = Real(cTrace(YvCmv2adjYv),dp) 
 sqrt3ov5 =Sqrt(3._dp/5._dp) 
 ooSqrt15 =1._dp/sqrt(15._dp) 
 g1p2 =g1**2 
 g1p3 =g1**3 
 g2p2 =g2**2 
 g2p3 =g2**3 
 g3p2 =g3**2 
 g3p3 =g3**3 
 gpp2 =gp**2 
 gpp3 =gp**3 
 Qdp2 =Qd**2 
 Qep2 =Qe**2 
 QHdp2 =QHd**2 
 QHup2 =QHu**2 
 Qlp2 =Ql**2 
 Qqp2 =Qq**2 
 Qsp2 =Qs**2 
 Qs1p2 =Qs1**2 
 Qs2p2 =Qs2**2 
 Qs3p2 =Qs3**2 
 Qup2 =Qu**2 
 Qvp2 =Qv**2 
 lamp2 =lam**2 
 g1p4 =g1**4 
 g2p4 =g2**4 
 g3p4 =g3**4 
 gpp4 =gp**4 
 Qdp4 =Qd**4 
 Qep3 =Qe**3 
 Qep4 =Qe**4 
 QHdp3 =QHd**3 
 QHdp4 =QHd**4 
 QHup3 =QHu**3 
 QHup4 =QHu**4 
 Qlp3 =Ql**3 
 Qlp4 =Ql**4 
 Qqp3 =Qq**3 
 Qqp4 =Qq**4 
 Qsp3 =Qs**3 
 Qsp4 =Qs**4 
 Qs1p3 =Qs1**3 
 Qs1p4 =Qs1**4 
 Qs2p3 =Qs2**3 
 Qs2p4 =Qs2**4 
 Qs3p3 =Qs3**3 
 Qs3p4 =Qs3**4 
 Qup3 =Qu**3 
 Qup4 =Qu**4 
 Qvp3 =Qv**3 
 Qvp4 =Qv**4 
 kapp2 =kap**2 
 lamp3 =lam**3 
 Ckapp2 =Conjg(kap)**2 
 Clamp2 =Conjg(lam)**2 


If (TwoLoopRGE) Then 
 YdadjYu = Matmul2(Yd,adjYu,OnlyDiagonal) 
 YdadjTd = Matmul2(Yd,adjTd,OnlyDiagonal) 
 YdadjTu = Matmul2(Yd,adjTu,OnlyDiagonal) 
 YeadjTe = Matmul2(Ye,adjTe,OnlyDiagonal) 
 YeCYv = Matmul2(Ye,Conjg(Yv),OnlyDiagonal) 
 YeCTv = Matmul2(Ye,Conjg(Tv),OnlyDiagonal) 
 YuadjYd = Matmul2(Yu,adjYd,OnlyDiagonal) 
 YuadjTd = Matmul2(Yu,adjTd,OnlyDiagonal) 
 YuadjTu = Matmul2(Yu,adjTu,OnlyDiagonal) 
 adjYdCmd2 = Matmul2(adjYd,Conjg(md2),OnlyDiagonal) 
 adjYeCme2 = Matmul2(adjYe,Conjg(me2),OnlyDiagonal) 
 adjYuCmu2 = Matmul2(adjYu,Conjg(mu2),OnlyDiagonal) 
 adjTdYd = Matmul2(adjTd,Yd,OnlyDiagonal) 
 adjTeYe = Matmul2(adjTe,Ye,OnlyDiagonal) 
 adjTuYu = Matmul2(adjTu,Yu,OnlyDiagonal) 
 Cme2CYe = Matmul2(Conjg(me2),Conjg(Ye),OnlyDiagonal) 
 Cml2adjYe = Matmul2(Conjg(ml2),adjYe,OnlyDiagonal) 
 Cmq2adjYd = Matmul2(Conjg(mq2),adjYd,OnlyDiagonal) 
 Cmq2adjYu = Matmul2(Conjg(mq2),adjYu,OnlyDiagonal) 
 CYeCml2 = Matmul2(Conjg(Ye),Conjg(ml2),OnlyDiagonal) 
 CTdTpYd = Matmul2(Conjg(Td),Transpose(Yd),OnlyDiagonal) 
 CTeTv = Matmul2(Conjg(Te),Tv,OnlyDiagonal) 
 CTeTpYe = Matmul2(Conjg(Te),Transpose(Ye),OnlyDiagonal) 
 CTuTpYu = Matmul2(Conjg(Tu),Transpose(Yu),OnlyDiagonal) 
 CTvTpYv = Matmul2(Conjg(Tv),Transpose(Yv),OnlyDiagonal) 
 TdadjYd = Matmul2(Td,adjYd,OnlyDiagonal) 
 TdadjYu = Matmul2(Td,adjYu,OnlyDiagonal) 
 TdadjTu = Matmul2(Td,adjTu,OnlyDiagonal) 
 TeadjYe = Matmul2(Te,adjYe,OnlyDiagonal) 
 TeCYv = Matmul2(Te,Conjg(Yv),OnlyDiagonal) 
 TeCTv = Matmul2(Te,Conjg(Tv),OnlyDiagonal) 
 TuadjYd = Matmul2(Tu,adjYd,OnlyDiagonal) 
 TuadjYu = Matmul2(Tu,adjYu,OnlyDiagonal) 
 TuadjTd = Matmul2(Tu,adjTd,OnlyDiagonal) 
 TvadjYv = Matmul2(Tv,adjYv,OnlyDiagonal) 
 TvadjTv = Matmul2(Tv,adjTv,OnlyDiagonal) 
 TpYeCYe = Matmul2(Transpose(Ye),Conjg(Ye),OnlyDiagonal) 
Forall(i2=1:3)  TpYeCYe(i2,i2) =  Real(TpYeCYe(i2,i2),dp) 
 TpYvadjYe = Matmul2(Transpose(Yv),adjYe,OnlyDiagonal) 
 TpYvadjTe = Matmul2(Transpose(Yv),adjTe,OnlyDiagonal) 
 TpYvCTv = Matmul2(Transpose(Yv),Conjg(Tv),OnlyDiagonal) 
 TpTeCTe = Matmul2(Transpose(Te),Conjg(Te),OnlyDiagonal) 
Forall(i2=1:3)  TpTeCTe(i2,i2) =  Real(TpTeCTe(i2,i2),dp) 
 TpTvadjYe = Matmul2(Transpose(Tv),adjYe,OnlyDiagonal) 
 TpTvadjTe = Matmul2(Transpose(Tv),adjTe,OnlyDiagonal) 
 TpTvCYv = Matmul2(Transpose(Tv),Conjg(Yv),OnlyDiagonal) 
 md2YdadjYu = Matmul2(md2,YdadjYu,OnlyDiagonal) 
 me2YeCYv = Matmul2(me2,YeCYv,OnlyDiagonal) 
 ml2YvadjYv = Matmul2(ml2,YvadjYv,OnlyDiagonal) 
 mu2YuadjYd = Matmul2(mu2,YuadjYd,OnlyDiagonal) 
 mv2adjYvYv = Matmul2(mv2,adjYvYv,OnlyDiagonal) 
 mv2TpYvadjYe = Matmul2(mv2,TpYvadjYe,OnlyDiagonal) 
 Ydmq2adjYu = Matmul2(Yd,mq2adjYu,OnlyDiagonal) 
 YdadjYdCmd2 = Matmul2(Yd,adjYdCmd2,OnlyDiagonal) 
 YdadjYumu2 = Matmul2(Yd,adjYumu2,OnlyDiagonal) 
 YdadjTdTd = Matmul2(Yd,adjTdTd,OnlyDiagonal) 
 YdCmq2adjYd = Matmul2(Yd,Cmq2adjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdCmq2adjYd(i2,i2) =  Real(YdCmq2adjYd(i2,i2),dp) 
 Yeml2CYv = Matmul2(Ye,ml2CYv,OnlyDiagonal) 
 YeadjYeCme2 = Matmul2(Ye,adjYeCme2,OnlyDiagonal) 
 YeadjTeTe = Matmul2(Ye,adjTeTe,OnlyDiagonal) 
 YeCml2adjYe = Matmul2(Ye,Cml2adjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeCml2adjYe(i2,i2) =  Real(YeCml2adjYe(i2,i2),dp) 
 YeCYvmv2 = Matmul2(Ye,CYvmv2,OnlyDiagonal) 
 Yumq2adjYd = Matmul2(Yu,mq2adjYd,OnlyDiagonal) 
 YuadjYdmd2 = Matmul2(Yu,adjYdmd2,OnlyDiagonal) 
 YuadjYuCmu2 = Matmul2(Yu,adjYuCmu2,OnlyDiagonal) 
 YuadjTuTu = Matmul2(Yu,adjTuTu,OnlyDiagonal) 
 YuCmq2adjYu = Matmul2(Yu,Cmq2adjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuCmq2adjYu(i2,i2) =  Real(YuCmq2adjYu(i2,i2),dp) 
 adjYdYdadjYd = Matmul2(adjYd,YdadjYd,OnlyDiagonal) 
 adjYdYdadjYu = Matmul2(adjYd,YdadjYu,OnlyDiagonal) 
 adjYdYdadjTd = Matmul2(adjYd,YdadjTd,OnlyDiagonal) 
 adjYdYdadjTu = Matmul2(adjYd,YdadjTu,OnlyDiagonal) 
 adjYdTdadjYd = Matmul2(adjYd,TdadjYd,OnlyDiagonal) 
 adjYdTdadjYu = Matmul2(adjYd,TdadjYu,OnlyDiagonal) 
 adjYdTdadjTd = Matmul2(adjYd,TdadjTd,OnlyDiagonal) 
 adjYdTdadjTu = Matmul2(adjYd,TdadjTu,OnlyDiagonal) 
 adjYeYeadjYe = Matmul2(adjYe,YeadjYe,OnlyDiagonal) 
 adjYeYeadjTe = Matmul2(adjYe,YeadjTe,OnlyDiagonal) 
 adjYeYeCYv = Matmul2(adjYe,YeCYv,OnlyDiagonal) 
 adjYeYeCTv = Matmul2(adjYe,YeCTv,OnlyDiagonal) 
 adjYeTeadjYe = Matmul2(adjYe,TeadjYe,OnlyDiagonal) 
 adjYeTeadjTe = Matmul2(adjYe,TeadjTe,OnlyDiagonal) 
 adjYeTeCTv = Matmul2(adjYe,TeCTv,OnlyDiagonal) 
 adjYuYuadjYd = Matmul2(adjYu,YuadjYd,OnlyDiagonal) 
 adjYuYuadjYu = Matmul2(adjYu,YuadjYu,OnlyDiagonal) 
 adjYuYuadjTd = Matmul2(adjYu,YuadjTd,OnlyDiagonal) 
 adjYuYuadjTu = Matmul2(adjYu,YuadjTu,OnlyDiagonal) 
 adjYuTuadjYd = Matmul2(adjYu,TuadjYd,OnlyDiagonal) 
 adjYuTuadjYu = Matmul2(adjYu,TuadjYu,OnlyDiagonal) 
 adjYuTuadjTd = Matmul2(adjYu,TuadjTd,OnlyDiagonal) 
 adjYuTuadjTu = Matmul2(adjYu,TuadjTu,OnlyDiagonal) 
 adjYvYvadjYv = Matmul2(adjYv,YvadjYv,OnlyDiagonal) 
 adjYvTvadjYv = Matmul2(adjYv,TvadjYv,OnlyDiagonal) 
 adjYvTvadjTv = Matmul2(adjYv,TvadjTv,OnlyDiagonal) 
 adjYvTpYeCYe = Matmul2(adjYv,TpYeCYe,OnlyDiagonal) 
 adjYvTpTeCTe = Matmul2(adjYv,TpTeCTe,OnlyDiagonal) 
 adjTdYdadjYd = Matmul2(adjTd,YdadjYd,OnlyDiagonal) 
 adjTdYdadjYu = Matmul2(adjTd,YdadjYu,OnlyDiagonal) 
 adjTdTdadjYd = Matmul2(adjTd,TdadjYd,OnlyDiagonal) 
 adjTdTdadjYu = Matmul2(adjTd,TdadjYu,OnlyDiagonal) 
 adjTeYeadjYe = Matmul2(adjTe,YeadjYe,OnlyDiagonal) 
 adjTeYeCYv = Matmul2(adjTe,YeCYv,OnlyDiagonal) 
 adjTeTeadjYe = Matmul2(adjTe,TeadjYe,OnlyDiagonal) 
 adjTeTeCYv = Matmul2(adjTe,TeCYv,OnlyDiagonal) 
 adjTuYuadjYd = Matmul2(adjTu,YuadjYd,OnlyDiagonal) 
 adjTuYuadjYu = Matmul2(adjTu,YuadjYu,OnlyDiagonal) 
 adjTuTuadjYd = Matmul2(adjTu,TuadjYd,OnlyDiagonal) 
 adjTuTuadjYu = Matmul2(adjTu,TuadjYu,OnlyDiagonal) 
 adjTvTvadjYv = Matmul2(adjTv,TvadjYv,OnlyDiagonal) 
 Cml2YvadjYv = Matmul2(Conjg(ml2),YvadjYv,OnlyDiagonal) 
 Cml2TpYeCYe = Matmul2(Conjg(ml2),TpYeCYe,OnlyDiagonal) 
 CYvTpYvadjYe = Matmul2(Conjg(Yv),TpYvadjYe,OnlyDiagonal) 
 CYvTpYvadjTe = Matmul2(Conjg(Yv),TpYvadjTe,OnlyDiagonal) 
 CYvTpYvCYv = Matmul2(Conjg(Yv),TpYvCYv,OnlyDiagonal) 
 CYvTpYvCTv = Matmul2(Conjg(Yv),TpYvCTv,OnlyDiagonal) 
 CYvTpTvadjTe = Matmul2(Conjg(Yv),TpTvadjTe,OnlyDiagonal) 
 CYvTpTvCTv = Matmul2(Conjg(Yv),TpTvCTv,OnlyDiagonal) 
 CTvTpYvadjYe = Matmul2(Conjg(Tv),TpYvadjYe,OnlyDiagonal) 
 CTvTpYvCYv = Matmul2(Conjg(Tv),TpYvCYv,OnlyDiagonal) 
 CTvTpTvadjYe = Matmul2(Conjg(Tv),TpTvadjYe,OnlyDiagonal) 
 CTvTpTvCYv = Matmul2(Conjg(Tv),TpTvCYv,OnlyDiagonal) 
 TdadjTdYd = Matmul2(Td,adjTdYd,OnlyDiagonal) 
 TeadjTeYe = Matmul2(Te,adjTeYe,OnlyDiagonal) 
 TeCTvTpYv = Matmul2(Te,CTvTpYv,OnlyDiagonal) 
 TuadjTuYu = Matmul2(Tu,adjTuYu,OnlyDiagonal) 
 TpYeCme2CYe = Matmul2(Transpose(Ye),Cme2CYe,OnlyDiagonal) 
Forall(i2=1:3)  TpYeCme2CYe(i2,i2) =  Real(TpYeCme2CYe(i2,i2),dp) 
 TpYeCYeCml2 = Matmul2(Transpose(Ye),CYeCml2,OnlyDiagonal) 
 TpYeCTeTv = Matmul2(Transpose(Ye),CTeTv,OnlyDiagonal) 
 TpYvml2adjYe = Matmul2(Transpose(Yv),ml2adjYe,OnlyDiagonal) 
 TpYvadjYeme2 = Matmul2(Transpose(Yv),adjYeme2,OnlyDiagonal) 
 TpYvadjYeYe = Matmul2(Transpose(Yv),adjYeYe,OnlyDiagonal) 
 TpYvadjYeTe = Matmul2(Transpose(Yv),adjYeTe,OnlyDiagonal) 
 TpYvCYvTpYv = Matmul2(Transpose(Yv),CYvTpYv,OnlyDiagonal) 
 TpYvCYvTpTv = Matmul2(Transpose(Yv),CYvTpTv,OnlyDiagonal) 
 TpYvCTvTpTv = Matmul2(Transpose(Yv),CTvTpTv,OnlyDiagonal) 
 TpTvadjYeYe = Matmul2(Transpose(Tv),adjYeYe,OnlyDiagonal) 
 TpTvCYvTpYv = Matmul2(Transpose(Tv),CYvTpYv,OnlyDiagonal) 
 TpTvCTvTpYv = Matmul2(Transpose(Tv),CTvTpYv,OnlyDiagonal) 
 md2YdadjYdYd = Matmul2(md2,YdadjYdYd,OnlyDiagonal) 
 me2YeadjYeYe = Matmul2(me2,YeadjYeYe,OnlyDiagonal) 
 ml2adjYeYeadjYe = Matmul2(ml2,adjYeYeadjYe,OnlyDiagonal) 
 ml2adjYeYeCYv = Matmul2(ml2,adjYeYeCYv,OnlyDiagonal) 
 ml2CYvTpYvadjYe = Matmul2(ml2,CYvTpYvadjYe,OnlyDiagonal) 
 ml2CYvTpYvCYv = Matmul2(ml2,CYvTpYvCYv,OnlyDiagonal) 
 mq2adjYdYdadjYd = Matmul2(mq2,adjYdYdadjYd,OnlyDiagonal) 
 mq2adjYdYdadjYu = Matmul2(mq2,adjYdYdadjYu,OnlyDiagonal) 
 mq2adjYuYuadjYd = Matmul2(mq2,adjYuYuadjYd,OnlyDiagonal) 
 mq2adjYuYuadjYu = Matmul2(mq2,adjYuYuadjYu,OnlyDiagonal) 
 mu2YuadjYuYu = Matmul2(mu2,YuadjYuYu,OnlyDiagonal) 
 mv2TpYvCYvTpYv = Matmul2(mv2,TpYvCYvTpYv,OnlyDiagonal) 
 Ydmq2adjYdYd = Matmul2(Yd,mq2adjYdYd,OnlyDiagonal) 
 YdadjYdmd2Yd = Matmul2(Yd,adjYdmd2Yd,OnlyDiagonal) 
 YdadjYdYdmq2 = Matmul2(Yd,adjYdYdmq2,OnlyDiagonal) 
 YdadjYdYdadjYd = Matmul2(Yd,adjYdYdadjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYdYdadjYd(i2,i2) =  Real(YdadjYdYdadjYd(i2,i2),dp) 
 YdadjYdTdadjYd = Matmul2(Yd,adjYdTdadjYd,OnlyDiagonal) 
 YdadjYdTdadjTd = Matmul2(Yd,adjYdTdadjTd,OnlyDiagonal) 
 YdadjYuYuadjYd = Matmul2(Yd,adjYuYuadjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYuYuadjYd(i2,i2) =  Real(YdadjYuYuadjYd(i2,i2),dp) 
 YdadjYuTuadjYd = Matmul2(Yd,adjYuTuadjYd,OnlyDiagonal) 
 YdadjYuTuadjTd = Matmul2(Yd,adjYuTuadjTd,OnlyDiagonal) 
 YdadjTdTdadjYd = Matmul2(Yd,adjTdTdadjYd,OnlyDiagonal) 
 YdadjTuTuadjYd = Matmul2(Yd,adjTuTuadjYd,OnlyDiagonal) 
 Yeml2adjYeYe = Matmul2(Ye,ml2adjYeYe,OnlyDiagonal) 
 YeadjYeme2Ye = Matmul2(Ye,adjYeme2Ye,OnlyDiagonal) 
 YeadjYeYeml2 = Matmul2(Ye,adjYeYeml2,OnlyDiagonal) 
 YeadjYeYeadjYe = Matmul2(Ye,adjYeYeadjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeadjYeYeadjYe(i2,i2) =  Real(YeadjYeYeadjYe(i2,i2),dp) 
 YeadjYeTeadjYe = Matmul2(Ye,adjYeTeadjYe,OnlyDiagonal) 
 YeadjYeTeadjTe = Matmul2(Ye,adjYeTeadjTe,OnlyDiagonal) 
 YeadjTeTeadjYe = Matmul2(Ye,adjTeTeadjYe,OnlyDiagonal) 
 YeCYvTpYvadjYe = Matmul2(Ye,CYvTpYvadjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeCYvTpYvadjYe(i2,i2) =  Real(YeCYvTpYvadjYe(i2,i2),dp) 
 YeCYvTpTvadjTe = Matmul2(Ye,CYvTpTvadjTe,OnlyDiagonal) 
 YeCTvTpTvadjYe = Matmul2(Ye,CTvTpTvadjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeCTvTpTvadjYe(i2,i2) =  Real(YeCTvTpTvadjYe(i2,i2),dp) 
 Yumq2adjYuYu = Matmul2(Yu,mq2adjYuYu,OnlyDiagonal) 
 YuadjYdYdadjYu = Matmul2(Yu,adjYdYdadjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYdYdadjYu(i2,i2) =  Real(YuadjYdYdadjYu(i2,i2),dp) 
 YuadjYdTdadjYu = Matmul2(Yu,adjYdTdadjYu,OnlyDiagonal) 
 YuadjYdTdadjTu = Matmul2(Yu,adjYdTdadjTu,OnlyDiagonal) 
 YuadjYumu2Yu = Matmul2(Yu,adjYumu2Yu,OnlyDiagonal) 
 YuadjYuYumq2 = Matmul2(Yu,adjYuYumq2,OnlyDiagonal) 
 YuadjYuYuadjYu = Matmul2(Yu,adjYuYuadjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYuYuadjYu(i2,i2) =  Real(YuadjYuYuadjYu(i2,i2),dp) 
 YuadjYuTuadjYu = Matmul2(Yu,adjYuTuadjYu,OnlyDiagonal) 
 YuadjYuTuadjTu = Matmul2(Yu,adjYuTuadjTu,OnlyDiagonal) 
 YuadjTdTdadjYu = Matmul2(Yu,adjTdTdadjYu,OnlyDiagonal) 
 YuadjTuTuadjYu = Matmul2(Yu,adjTuTuadjYu,OnlyDiagonal) 
 YvadjYvYvadjYv = Matmul2(Yv,adjYvYvadjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvadjYvYvadjYv(i2,i2) =  Real(YvadjYvYvadjYv(i2,i2),dp) 
 YvadjYvTvadjYv = Matmul2(Yv,adjYvTvadjYv,OnlyDiagonal) 
 YvadjYvTvadjTv = Matmul2(Yv,adjYvTvadjTv,OnlyDiagonal) 
 YvadjYvTpYeCYe = Matmul2(Yv,adjYvTpYeCYe,OnlyDiagonal) 
 YvadjYvTpTeCTe = Matmul2(Yv,adjYvTpTeCTe,OnlyDiagonal) 
 YvadjTvTvadjYv = Matmul2(Yv,adjTvTvadjYv,OnlyDiagonal) 
 adjYdmd2YdadjYd = Matmul2(adjYd,md2YdadjYd,OnlyDiagonal) 
 adjYdmd2YdadjYu = Matmul2(adjYd,md2YdadjYu,OnlyDiagonal) 
 adjYdYdmq2adjYd = Matmul2(adjYd,Ydmq2adjYd,OnlyDiagonal) 
 adjYdYdmq2adjYu = Matmul2(adjYd,Ydmq2adjYu,OnlyDiagonal) 
 adjYdYdadjYdmd2 = Matmul2(adjYd,YdadjYdmd2,OnlyDiagonal) 
 adjYdYdadjYdYd = Matmul2(adjYd,YdadjYdYd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdYdadjYdYd(i2,i2) =  Real(adjYdYdadjYdYd(i2,i2),dp) 
 adjYdYdadjYdTd = Matmul2(adjYd,YdadjYdTd,OnlyDiagonal) 
 adjYdYdadjYumu2 = Matmul2(adjYd,YdadjYumu2,OnlyDiagonal) 
 adjYdYdadjYuYu = Matmul2(adjYd,YdadjYuYu,OnlyDiagonal) 
 adjYdYdadjYuTu = Matmul2(adjYd,YdadjYuTu,OnlyDiagonal) 
 adjYdYdadjTdTd = Matmul2(adjYd,YdadjTdTd,OnlyDiagonal) 
 adjYdTdadjYdYd = Matmul2(adjYd,TdadjYdYd,OnlyDiagonal) 
 adjYdTdadjYuYu = Matmul2(adjYd,TdadjYuYu,OnlyDiagonal) 
 adjYdTdadjTdYd = Matmul2(adjYd,TdadjTdYd,OnlyDiagonal) 
 adjYeme2YeadjYe = Matmul2(adjYe,me2YeadjYe,OnlyDiagonal) 
 adjYeme2YeCYv = Matmul2(adjYe,me2YeCYv,OnlyDiagonal) 
 adjYeYeml2adjYe = Matmul2(adjYe,Yeml2adjYe,OnlyDiagonal) 
 adjYeYeml2CYv = Matmul2(adjYe,Yeml2CYv,OnlyDiagonal) 
 adjYeYeadjYeme2 = Matmul2(adjYe,YeadjYeme2,OnlyDiagonal) 
 adjYeYeadjYeYe = Matmul2(adjYe,YeadjYeYe,OnlyDiagonal) 
Forall(i2=1:3)  adjYeYeadjYeYe(i2,i2) =  Real(adjYeYeadjYeYe(i2,i2),dp) 
 adjYeYeadjYeTe = Matmul2(adjYe,YeadjYeTe,OnlyDiagonal) 
 adjYeYeadjTeTe = Matmul2(adjYe,YeadjTeTe,OnlyDiagonal) 
 adjYeYeCYvmv2 = Matmul2(adjYe,YeCYvmv2,OnlyDiagonal) 
 adjYeTeadjYeYe = Matmul2(adjYe,TeadjYeYe,OnlyDiagonal) 
 adjYeTeadjTeYe = Matmul2(adjYe,TeadjTeYe,OnlyDiagonal) 
 adjYeTeCYvTpYv = Matmul2(adjYe,TeCYvTpYv,OnlyDiagonal) 
 adjYeTeCTvTpYv = Matmul2(adjYe,TeCTvTpYv,OnlyDiagonal) 
 adjYumu2YuadjYd = Matmul2(adjYu,mu2YuadjYd,OnlyDiagonal) 
 adjYumu2YuadjYu = Matmul2(adjYu,mu2YuadjYu,OnlyDiagonal) 
 adjYuYumq2adjYd = Matmul2(adjYu,Yumq2adjYd,OnlyDiagonal) 
 adjYuYumq2adjYu = Matmul2(adjYu,Yumq2adjYu,OnlyDiagonal) 
 adjYuYuadjYdmd2 = Matmul2(adjYu,YuadjYdmd2,OnlyDiagonal) 
 adjYuYuadjYdYd = Matmul2(adjYu,YuadjYdYd,OnlyDiagonal) 
 adjYuYuadjYdTd = Matmul2(adjYu,YuadjYdTd,OnlyDiagonal) 
 adjYuYuadjYumu2 = Matmul2(adjYu,YuadjYumu2,OnlyDiagonal) 
 adjYuYuadjYuYu = Matmul2(adjYu,YuadjYuYu,OnlyDiagonal) 
Forall(i2=1:3)  adjYuYuadjYuYu(i2,i2) =  Real(adjYuYuadjYuYu(i2,i2),dp) 
 adjYuYuadjYuTu = Matmul2(adjYu,YuadjYuTu,OnlyDiagonal) 
 adjYuYuadjTuTu = Matmul2(adjYu,YuadjTuTu,OnlyDiagonal) 
 adjYuTuadjYdYd = Matmul2(adjYu,TuadjYdYd,OnlyDiagonal) 
 adjYuTuadjYuYu = Matmul2(adjYu,TuadjYuYu,OnlyDiagonal) 
 adjYuTuadjTuYu = Matmul2(adjYu,TuadjTuYu,OnlyDiagonal) 
 adjYvYvadjYvYv = Matmul2(adjYv,YvadjYvYv,OnlyDiagonal) 
Forall(i2=1:3)  adjYvYvadjYvYv(i2,i2) =  Real(adjYvYvadjYvYv(i2,i2),dp) 
 adjYvYvadjYvCml2 = Matmul2(adjYv,YvadjYvCml2,OnlyDiagonal) 
 adjYvYvadjYvTv = Matmul2(adjYv,YvadjYvTv,OnlyDiagonal) 
 adjYvYvCmv2adjYv = Matmul2(adjYv,YvCmv2adjYv,OnlyDiagonal) 
 adjYvCml2YvadjYv = Matmul2(adjYv,Cml2YvadjYv,OnlyDiagonal) 
 adjYvCml2TpYeCYe = Matmul2(adjYv,Cml2TpYeCYe,OnlyDiagonal) 
 adjYvTvadjYvYv = Matmul2(adjYv,TvadjYvYv,OnlyDiagonal) 
 adjYvTpYeCme2CYe = Matmul2(adjYv,TpYeCme2CYe,OnlyDiagonal) 
 adjYvTpYeCYeYv = Matmul2(adjYv,TpYeCYeYv,OnlyDiagonal) 
Forall(i2=1:3)  adjYvTpYeCYeYv(i2,i2) =  Real(adjYvTpYeCYeYv(i2,i2),dp) 
 adjYvTpYeCYeCml2 = Matmul2(adjYv,TpYeCYeCml2,OnlyDiagonal) 
 adjYvTpYeCYeTv = Matmul2(adjYv,TpYeCYeTv,OnlyDiagonal) 
 adjYvTpYeCTeTv = Matmul2(adjYv,TpYeCTeTv,OnlyDiagonal) 
 adjYvTpTeCYeYv = Matmul2(adjYv,TpTeCYeYv,OnlyDiagonal) 
 adjTdYdadjYdTd = Matmul2(adjTd,YdadjYdTd,OnlyDiagonal) 
 adjTdTdadjYdYd = Matmul2(adjTd,TdadjYdYd,OnlyDiagonal) 
 adjTeYeadjYeTe = Matmul2(adjTe,YeadjYeTe,OnlyDiagonal) 
 adjTeTeadjYeYe = Matmul2(adjTe,TeadjYeYe,OnlyDiagonal) 
 adjTuYuadjYuTu = Matmul2(adjTu,YuadjYuTu,OnlyDiagonal) 
 adjTuTuadjYuYu = Matmul2(adjTu,TuadjYuYu,OnlyDiagonal) 
 Cmv2adjYvYvadjYv = Matmul2(Conjg(mv2),adjYvYvadjYv,OnlyDiagonal) 
 Cmv2adjYvTpYeCYe = Matmul2(Conjg(mv2),adjYvTpYeCYe,OnlyDiagonal) 
 CYeTpYeCYeYv = Matmul2(Conjg(Ye),TpYeCYeYv,OnlyDiagonal) 
 CYeTpYeCYeTv = Matmul2(Conjg(Ye),TpYeCYeTv,OnlyDiagonal) 
 CYeTpTeCYeYv = Matmul2(Conjg(Ye),TpTeCYeYv,OnlyDiagonal) 
 CYvmv2TpYvadjYe = Matmul2(Conjg(Yv),mv2TpYvadjYe,OnlyDiagonal) 
 CYvmv2TpYvCYv = Matmul2(Conjg(Yv),mv2TpYvCYv,OnlyDiagonal) 
 CYvTpYvml2adjYe = Matmul2(Conjg(Yv),TpYvml2adjYe,OnlyDiagonal) 
 CYvTpYvml2CYv = Matmul2(Conjg(Yv),TpYvml2CYv,OnlyDiagonal) 
 CYvTpYvadjYeme2 = Matmul2(Conjg(Yv),TpYvadjYeme2,OnlyDiagonal) 
 CYvTpYvadjYeYe = Matmul2(Conjg(Yv),TpYvadjYeYe,OnlyDiagonal) 
 CYvTpYvadjYeTe = Matmul2(Conjg(Yv),TpYvadjYeTe,OnlyDiagonal) 
 CYvTpYvCYvmv2 = Matmul2(Conjg(Yv),TpYvCYvmv2,OnlyDiagonal) 
 CYvTpYvCYvTpYv = Matmul2(Conjg(Yv),TpYvCYvTpYv,OnlyDiagonal) 
Forall(i2=1:3)  CYvTpYvCYvTpYv(i2,i2) =  Real(CYvTpYvCYvTpYv(i2,i2),dp) 
 CYvTpYvCYvTpTv = Matmul2(Conjg(Yv),TpYvCYvTpTv,OnlyDiagonal) 
 CYvTpYvCTvTpTv = Matmul2(Conjg(Yv),TpYvCTvTpTv,OnlyDiagonal) 
 CYvTpTvadjYeYe = Matmul2(Conjg(Yv),TpTvadjYeYe,OnlyDiagonal) 
 CYvTpTvCYvTpYv = Matmul2(Conjg(Yv),TpTvCYvTpYv,OnlyDiagonal) 
 CYvTpTvCTvTpYv = Matmul2(Conjg(Yv),TpTvCTvTpYv,OnlyDiagonal) 
Forall(i2=1:3)  CYvTpTvCTvTpYv(i2,i2) =  Real(CYvTpTvCTvTpYv(i2,i2),dp) 
 CTvTpYvCYvTpTv = Matmul2(Conjg(Tv),TpYvCYvTpTv,OnlyDiagonal) 
Forall(i2=1:3)  CTvTpYvCYvTpTv(i2,i2) =  Real(CTvTpYvCYvTpTv(i2,i2),dp) 
 CTvTpTvCYvTpYv = Matmul2(Conjg(Tv),TpTvCYvTpYv,OnlyDiagonal) 
 TdadjYdYdadjTd = Matmul2(Td,adjYdYdadjTd,OnlyDiagonal) 
 TdadjYuYuadjTd = Matmul2(Td,adjYuYuadjTd,OnlyDiagonal) 
 TdadjTdYdadjYd = Matmul2(Td,adjTdYdadjYd,OnlyDiagonal) 
 TdadjTuYuadjYd = Matmul2(Td,adjTuYuadjYd,OnlyDiagonal) 
 TeadjYeYeadjTe = Matmul2(Te,adjYeYeadjTe,OnlyDiagonal) 
 TeadjTeYeadjYe = Matmul2(Te,adjTeYeadjYe,OnlyDiagonal) 
 TeCYvTpYvadjTe = Matmul2(Te,CYvTpYvadjTe,OnlyDiagonal) 
 TeCTvTpYvadjYe = Matmul2(Te,CTvTpYvadjYe,OnlyDiagonal) 
 TuadjYdYdadjTu = Matmul2(Tu,adjYdYdadjTu,OnlyDiagonal) 
 TuadjYuYuadjTu = Matmul2(Tu,adjYuYuadjTu,OnlyDiagonal) 
 TuadjTdYdadjYu = Matmul2(Tu,adjTdYdadjYu,OnlyDiagonal) 
 TuadjTuYuadjYu = Matmul2(Tu,adjTuYuadjYu,OnlyDiagonal) 
 TpYvml2CYvTpYv = Matmul2(Transpose(Yv),ml2CYvTpYv,OnlyDiagonal) 
 TpYvadjYeYeCYv = Matmul2(Transpose(Yv),adjYeYeCYv,OnlyDiagonal) 
Forall(i2=1:3)  TpYvadjYeYeCYv(i2,i2) =  Real(TpYvadjYeYeCYv(i2,i2),dp) 
 TpYvadjYeTeCTv = Matmul2(Transpose(Yv),adjYeTeCTv,OnlyDiagonal) 
 TpYvadjTeTeCYv = Matmul2(Transpose(Yv),adjTeTeCYv,OnlyDiagonal) 
 TpYvCYvmv2TpYv = Matmul2(Transpose(Yv),CYvmv2TpYv,OnlyDiagonal) 
 TpYvCYvTpYvml2 = Matmul2(Transpose(Yv),CYvTpYvml2,OnlyDiagonal) 
 TpYvCYvTpYvCYv = Matmul2(Transpose(Yv),CYvTpYvCYv,OnlyDiagonal) 
Forall(i2=1:3)  TpYvCYvTpYvCYv(i2,i2) =  Real(TpYvCYvTpYvCYv(i2,i2),dp) 
 TpYvCYvTpTvCTv = Matmul2(Transpose(Yv),CYvTpTvCTv,OnlyDiagonal) 
 TpYvCTvTpTvCYv = Matmul2(Transpose(Yv),CTvTpTvCYv,OnlyDiagonal) 
Forall(i2=1:3)  TpYvCTvTpTvCYv(i2,i2) =  Real(TpYvCTvTpTvCYv(i2,i2),dp) 
 TpTvadjYeYeCTv = Matmul2(Transpose(Tv),adjYeYeCTv,OnlyDiagonal) 
Forall(i2=1:3)  TpTvadjYeYeCTv(i2,i2) =  Real(TpTvadjYeYeCTv(i2,i2),dp) 
 TpTvadjTeYeCYv = Matmul2(Transpose(Tv),adjTeYeCYv,OnlyDiagonal) 
 TpTvCYvTpYvCTv = Matmul2(Transpose(Tv),CYvTpYvCTv,OnlyDiagonal) 
Forall(i2=1:3)  TpTvCYvTpYvCTv(i2,i2) =  Real(TpTvCYvTpYvCTv(i2,i2),dp) 
 TpTvCTvTpYvCYv = Matmul2(Transpose(Tv),CTvTpYvCYv,OnlyDiagonal) 
 md2YdadjYdYdadjYd = Matmul2(md2,YdadjYdYdadjYd,OnlyDiagonal) 
 md2YdadjYuYuadjYd = Matmul2(md2,YdadjYuYuadjYd,OnlyDiagonal) 
 me2YeadjYeYeadjYe = Matmul2(me2,YeadjYeYeadjYe,OnlyDiagonal) 
 me2YeCYvTpYvadjYe = Matmul2(me2,YeCYvTpYvadjYe,OnlyDiagonal) 
 ml2adjYeYeadjYeYe = Matmul2(ml2,adjYeYeadjYeYe,OnlyDiagonal) 
 ml2CYvTpYvCYvTpYv = Matmul2(ml2,CYvTpYvCYvTpYv,OnlyDiagonal) 
 mq2adjYdYdadjYdYd = Matmul2(mq2,adjYdYdadjYdYd,OnlyDiagonal) 
 mq2adjYdYdadjYuYu = Matmul2(mq2,adjYdYdadjYuYu,OnlyDiagonal) 
 mq2adjYuYuadjYdYd = Matmul2(mq2,adjYuYuadjYdYd,OnlyDiagonal) 
 mq2adjYuYuadjYuYu = Matmul2(mq2,adjYuYuadjYuYu,OnlyDiagonal) 
 mu2YuadjYdYdadjYu = Matmul2(mu2,YuadjYdYdadjYu,OnlyDiagonal) 
 mu2YuadjYuYuadjYu = Matmul2(mu2,YuadjYuYuadjYu,OnlyDiagonal) 
 mv2TpYvadjYeYeCYv = Matmul2(mv2,TpYvadjYeYeCYv,OnlyDiagonal) 
 mv2TpYvCYvTpYvCYv = Matmul2(mv2,TpYvCYvTpYvCYv,OnlyDiagonal) 
 Ydmq2adjYdYdadjYd = Matmul2(Yd,mq2adjYdYdadjYd,OnlyDiagonal) 
 Ydmq2adjYuYuadjYd = Matmul2(Yd,mq2adjYuYuadjYd,OnlyDiagonal) 
 YdadjYdmd2YdadjYd = Matmul2(Yd,adjYdmd2YdadjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYdmd2YdadjYd(i2,i2) =  Real(YdadjYdmd2YdadjYd(i2,i2),dp) 
 YdadjYdYdmq2adjYd = Matmul2(Yd,adjYdYdmq2adjYd,OnlyDiagonal) 
 YdadjYdYdadjYdmd2 = Matmul2(Yd,adjYdYdadjYdmd2,OnlyDiagonal) 
 YdadjYdYdadjYdYd = Matmul2(Yd,adjYdYdadjYdYd,OnlyDiagonal) 
 YdadjYdYdadjYdTd = Matmul2(Yd,adjYdYdadjYdTd,OnlyDiagonal) 
 YdadjYdTdadjYdYd = Matmul2(Yd,adjYdTdadjYdYd,OnlyDiagonal) 
 YdadjYumu2YuadjYd = Matmul2(Yd,adjYumu2YuadjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYumu2YuadjYd(i2,i2) =  Real(YdadjYumu2YuadjYd(i2,i2),dp) 
 YdadjYuYumq2adjYd = Matmul2(Yd,adjYuYumq2adjYd,OnlyDiagonal) 
 YdadjYuYuadjYdmd2 = Matmul2(Yd,adjYuYuadjYdmd2,OnlyDiagonal) 
 YdadjYuYuadjYdYd = Matmul2(Yd,adjYuYuadjYdYd,OnlyDiagonal) 
 YdadjYuYuadjYdTd = Matmul2(Yd,adjYuYuadjYdTd,OnlyDiagonal) 
 YdadjYuYuadjYuYu = Matmul2(Yd,adjYuYuadjYuYu,OnlyDiagonal) 
 YdadjYuYuadjYuTu = Matmul2(Yd,adjYuYuadjYuTu,OnlyDiagonal) 
 YdadjYuTuadjYdYd = Matmul2(Yd,adjYuTuadjYdYd,OnlyDiagonal) 
 YdadjYuTuadjYuYu = Matmul2(Yd,adjYuTuadjYuYu,OnlyDiagonal) 
 Yeml2adjYeYeadjYe = Matmul2(Ye,ml2adjYeYeadjYe,OnlyDiagonal) 
 Yeml2CYvTpYvadjYe = Matmul2(Ye,ml2CYvTpYvadjYe,OnlyDiagonal) 
 YeadjYeme2YeadjYe = Matmul2(Ye,adjYeme2YeadjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeadjYeme2YeadjYe(i2,i2) =  Real(YeadjYeme2YeadjYe(i2,i2),dp) 
 YeadjYeYeml2adjYe = Matmul2(Ye,adjYeYeml2adjYe,OnlyDiagonal) 
 YeadjYeYeadjYeme2 = Matmul2(Ye,adjYeYeadjYeme2,OnlyDiagonal) 
 YeadjYeYeadjYeYe = Matmul2(Ye,adjYeYeadjYeYe,OnlyDiagonal) 
 YeadjYeYeadjYeTe = Matmul2(Ye,adjYeYeadjYeTe,OnlyDiagonal) 
 YeadjYeTeadjYeYe = Matmul2(Ye,adjYeTeadjYeYe,OnlyDiagonal) 
 YeCYvmv2TpYvadjYe = Matmul2(Ye,CYvmv2TpYvadjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeCYvmv2TpYvadjYe(i2,i2) =  Real(YeCYvmv2TpYvadjYe(i2,i2),dp) 
 YeCYvTpYvml2adjYe = Matmul2(Ye,CYvTpYvml2adjYe,OnlyDiagonal) 
 YeCYvTpYvadjYeme2 = Matmul2(Ye,CYvTpYvadjYeme2,OnlyDiagonal) 
 YeCYvTpYvadjYeYe = Matmul2(Ye,CYvTpYvadjYeYe,OnlyDiagonal) 
 YeCYvTpYvadjYeTe = Matmul2(Ye,CYvTpYvadjYeTe,OnlyDiagonal) 
 YeCYvTpYvCYvTpYv = Matmul2(Ye,CYvTpYvCYvTpYv,OnlyDiagonal) 
 YeCYvTpYvCYvTpTv = Matmul2(Ye,CYvTpYvCYvTpTv,OnlyDiagonal) 
 YeCYvTpTvadjYeYe = Matmul2(Ye,CYvTpTvadjYeYe,OnlyDiagonal) 
 YeCYvTpTvCYvTpYv = Matmul2(Ye,CYvTpTvCYvTpYv,OnlyDiagonal) 
 Yumq2adjYdYdadjYu = Matmul2(Yu,mq2adjYdYdadjYu,OnlyDiagonal) 
 Yumq2adjYuYuadjYu = Matmul2(Yu,mq2adjYuYuadjYu,OnlyDiagonal) 
 YuadjYdmd2YdadjYu = Matmul2(Yu,adjYdmd2YdadjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYdmd2YdadjYu(i2,i2) =  Real(YuadjYdmd2YdadjYu(i2,i2),dp) 
 YuadjYdYdmq2adjYu = Matmul2(Yu,adjYdYdmq2adjYu,OnlyDiagonal) 
 YuadjYdYdadjYdYd = Matmul2(Yu,adjYdYdadjYdYd,OnlyDiagonal) 
 YuadjYdYdadjYdTd = Matmul2(Yu,adjYdYdadjYdTd,OnlyDiagonal) 
 YuadjYdYdadjYumu2 = Matmul2(Yu,adjYdYdadjYumu2,OnlyDiagonal) 
 YuadjYdYdadjYuYu = Matmul2(Yu,adjYdYdadjYuYu,OnlyDiagonal) 
 YuadjYdYdadjYuTu = Matmul2(Yu,adjYdYdadjYuTu,OnlyDiagonal) 
 YuadjYdTdadjYdYd = Matmul2(Yu,adjYdTdadjYdYd,OnlyDiagonal) 
 YuadjYdTdadjYuYu = Matmul2(Yu,adjYdTdadjYuYu,OnlyDiagonal) 
 YuadjYumu2YuadjYu = Matmul2(Yu,adjYumu2YuadjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYumu2YuadjYu(i2,i2) =  Real(YuadjYumu2YuadjYu(i2,i2),dp) 
 YuadjYuYumq2adjYu = Matmul2(Yu,adjYuYumq2adjYu,OnlyDiagonal) 
 YuadjYuYuadjYumu2 = Matmul2(Yu,adjYuYuadjYumu2,OnlyDiagonal) 
 YuadjYuYuadjYuYu = Matmul2(Yu,adjYuYuadjYuYu,OnlyDiagonal) 
 YuadjYuYuadjYuTu = Matmul2(Yu,adjYuYuadjYuTu,OnlyDiagonal) 
 YuadjYuTuadjYuYu = Matmul2(Yu,adjYuTuadjYuYu,OnlyDiagonal) 
 YvadjYvYvadjYvYv = Matmul2(Yv,adjYvYvadjYvYv,OnlyDiagonal) 
 YvadjYvYvadjYvCml2 = Matmul2(Yv,adjYvYvadjYvCml2,OnlyDiagonal) 
 YvadjYvYvadjYvTv = Matmul2(Yv,adjYvYvadjYvTv,OnlyDiagonal) 
 YvadjYvYvCmv2adjYv = Matmul2(Yv,adjYvYvCmv2adjYv,OnlyDiagonal) 
 YvadjYvCml2YvadjYv = Matmul2(Yv,adjYvCml2YvadjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvadjYvCml2YvadjYv(i2,i2) =  Real(YvadjYvCml2YvadjYv(i2,i2),dp) 
 YvadjYvCml2TpYeCYe = Matmul2(Yv,adjYvCml2TpYeCYe,OnlyDiagonal) 
 YvadjYvTvadjYvYv = Matmul2(Yv,adjYvTvadjYvYv,OnlyDiagonal) 
 YvadjYvTpYeCme2CYe = Matmul2(Yv,adjYvTpYeCme2CYe,OnlyDiagonal) 
 YvadjYvTpYeCYeYv = Matmul2(Yv,adjYvTpYeCYeYv,OnlyDiagonal) 
 YvadjYvTpYeCYeCml2 = Matmul2(Yv,adjYvTpYeCYeCml2,OnlyDiagonal) 
 YvadjYvTpYeCYeTv = Matmul2(Yv,adjYvTpYeCYeTv,OnlyDiagonal) 
 YvadjYvTpTeCYeYv = Matmul2(Yv,adjYvTpTeCYeYv,OnlyDiagonal) 
 YvCmv2adjYvYvadjYv = Matmul2(Yv,Cmv2adjYvYvadjYv,OnlyDiagonal) 
 YvCmv2adjYvTpYeCYe = Matmul2(Yv,Cmv2adjYvTpYeCYe,OnlyDiagonal) 
 adjYdmd2YdadjYdYd = Matmul2(adjYd,md2YdadjYdYd,OnlyDiagonal) 
 adjYdYdmq2adjYdYd = Matmul2(adjYd,Ydmq2adjYdYd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdYdmq2adjYdYd(i2,i2) =  Real(adjYdYdmq2adjYdYd(i2,i2),dp) 
 adjYdYdadjYdmd2Yd = Matmul2(adjYd,YdadjYdmd2Yd,OnlyDiagonal) 
 adjYdYdadjYdYdmq2 = Matmul2(adjYd,YdadjYdYdmq2,OnlyDiagonal) 
 adjYeme2YeadjYeYe = Matmul2(adjYe,me2YeadjYeYe,OnlyDiagonal) 
 adjYeYeml2adjYeYe = Matmul2(adjYe,Yeml2adjYeYe,OnlyDiagonal) 
Forall(i2=1:3)  adjYeYeml2adjYeYe(i2,i2) =  Real(adjYeYeml2adjYeYe(i2,i2),dp) 
 adjYeYeadjYeme2Ye = Matmul2(adjYe,YeadjYeme2Ye,OnlyDiagonal) 
 adjYeYeadjYeYeml2 = Matmul2(adjYe,YeadjYeYeml2,OnlyDiagonal) 
 adjYumu2YuadjYuYu = Matmul2(adjYu,mu2YuadjYuYu,OnlyDiagonal) 
 adjYuYumq2adjYuYu = Matmul2(adjYu,Yumq2adjYuYu,OnlyDiagonal) 
Forall(i2=1:3)  adjYuYumq2adjYuYu(i2,i2) =  Real(adjYuYumq2adjYuYu(i2,i2),dp) 
 adjYuYuadjYumu2Yu = Matmul2(adjYu,YuadjYumu2Yu,OnlyDiagonal) 
 adjYuYuadjYuYumq2 = Matmul2(adjYu,YuadjYuYumq2,OnlyDiagonal) 
 CYvmv2TpYvCYvTpYv = Matmul2(Conjg(Yv),mv2TpYvCYvTpYv,OnlyDiagonal) 
 CYvTpYvml2CYvTpYv = Matmul2(Conjg(Yv),TpYvml2CYvTpYv,OnlyDiagonal) 
Forall(i2=1:3)  CYvTpYvml2CYvTpYv(i2,i2) =  Real(CYvTpYvml2CYvTpYv(i2,i2),dp) 
 CYvTpYvCYvmv2TpYv = Matmul2(Conjg(Yv),TpYvCYvmv2TpYv,OnlyDiagonal) 
 CYvTpYvCYvTpYvml2 = Matmul2(Conjg(Yv),TpYvCYvTpYvml2,OnlyDiagonal) 
 TdadjYdYdadjYdYd = Matmul2(Td,adjYdYdadjYdYd,OnlyDiagonal) 
 TdadjYuYuadjYdYd = Matmul2(Td,adjYuYuadjYdYd,OnlyDiagonal) 
 TdadjYuYuadjYuYu = Matmul2(Td,adjYuYuadjYuYu,OnlyDiagonal) 
 TeadjYeYeadjYeYe = Matmul2(Te,adjYeYeadjYeYe,OnlyDiagonal) 
 TeCYvTpYvadjYeYe = Matmul2(Te,CYvTpYvadjYeYe,OnlyDiagonal) 
 TeCYvTpYvCYvTpYv = Matmul2(Te,CYvTpYvCYvTpYv,OnlyDiagonal) 
 TuadjYdYdadjYdYd = Matmul2(Tu,adjYdYdadjYdYd,OnlyDiagonal) 
 TuadjYdYdadjYuYu = Matmul2(Tu,adjYdYdadjYuYu,OnlyDiagonal) 
 TuadjYuYuadjYuYu = Matmul2(Tu,adjYuYuadjYuYu,OnlyDiagonal) 
 TvadjYvYvadjYvYv = Matmul2(Tv,adjYvYvadjYvYv,OnlyDiagonal) 
 TvadjYvTpYeCYeYv = Matmul2(Tv,adjYvTpYeCYeYv,OnlyDiagonal) 
 TpYeCYeTpYeCYeYv = Matmul2(Transpose(Ye),CYeTpYeCYeYv,OnlyDiagonal) 
 TpYeCYeTpYeCYeTv = Matmul2(Transpose(Ye),CYeTpYeCYeTv,OnlyDiagonal) 
 TpYeCYeTpTeCYeYv = Matmul2(Transpose(Ye),CYeTpTeCYeYv,OnlyDiagonal) 
 TpYvml2adjYeYeCYv = Matmul2(Transpose(Yv),ml2adjYeYeCYv,OnlyDiagonal) 
 TpYvml2CYvTpYvCYv = Matmul2(Transpose(Yv),ml2CYvTpYvCYv,OnlyDiagonal) 
 TpYvadjYeme2YeCYv = Matmul2(Transpose(Yv),adjYeme2YeCYv,OnlyDiagonal) 
Forall(i2=1:3)  TpYvadjYeme2YeCYv(i2,i2) =  Real(TpYvadjYeme2YeCYv(i2,i2),dp) 
 TpYvadjYeYeml2CYv = Matmul2(Transpose(Yv),adjYeYeml2CYv,OnlyDiagonal) 
 TpYvadjYeYeCYvmv2 = Matmul2(Transpose(Yv),adjYeYeCYvmv2,OnlyDiagonal) 
 TpYvCYvmv2TpYvCYv = Matmul2(Transpose(Yv),CYvmv2TpYvCYv,OnlyDiagonal) 
Forall(i2=1:3)  TpYvCYvmv2TpYvCYv(i2,i2) =  Real(TpYvCYvmv2TpYvCYv(i2,i2),dp) 
 TpYvCYvTpYvml2CYv = Matmul2(Transpose(Yv),CYvTpYvml2CYv,OnlyDiagonal) 
 TpYvCYvTpYvCYvmv2 = Matmul2(Transpose(Yv),CYvTpYvCYvmv2,OnlyDiagonal) 
 TpTeCYeTpYeCYeYv = Matmul2(Transpose(Te),CYeTpYeCYeYv,OnlyDiagonal) 
 TrCTdTpYd = cTrace(CTdTpYd)
 TrCTeTpYe = cTrace(CTeTpYe)
 TrCTuTpYu = cTrace(CTuTpYu)
 TrCTvTpYv = cTrace(CTvTpYv)
 Trml2YvadjYv = cTrace(ml2YvadjYv)
 Trmv2adjYvYv = cTrace(mv2adjYvYv)
 TrYdadjYdCmd2 = cTrace(YdadjYdCmd2)
 TrYdCmq2adjYd = Real(cTrace(YdCmq2adjYd),dp)  
 TrYeadjYeCme2 = cTrace(YeadjYeCme2)
 TrYeCml2adjYe = Real(cTrace(YeCml2adjYe),dp)  
 TrYuadjYuCmu2 = cTrace(YuadjYuCmu2)
 TrYuCmq2adjYu = Real(cTrace(YuCmq2adjYu),dp)  
 TrYdadjYdYdadjYd = Real(cTrace(YdadjYdYdadjYd),dp)  
 TrYdadjYdTdadjYd = cTrace(YdadjYdTdadjYd)
 TrYdadjYdTdadjTd = cTrace(YdadjYdTdadjTd)
 TrYdadjYuYuadjYd = Real(cTrace(YdadjYuYuadjYd),dp)  
 TrYdadjYuTuadjYd = cTrace(YdadjYuTuadjYd)
 TrYdadjYuTuadjTd = cTrace(YdadjYuTuadjTd)
 TrYdadjTdTdadjYd = cTrace(YdadjTdTdadjYd)
 TrYdadjTuTuadjYd = cTrace(YdadjTuTuadjYd)
 TrYeadjYeYeadjYe = Real(cTrace(YeadjYeYeadjYe),dp)  
 TrYeadjYeTeadjYe = cTrace(YeadjYeTeadjYe)
 TrYeadjYeTeadjTe = cTrace(YeadjYeTeadjTe)
 TrYeadjTeTeadjYe = cTrace(YeadjTeTeadjYe)
 TrYeCTvTpTvadjYe = Real(cTrace(YeCTvTpTvadjYe),dp)  
 TrYuadjYdTdadjYu = cTrace(YuadjYdTdadjYu)
 TrYuadjYdTdadjTu = cTrace(YuadjYdTdadjTu)
 TrYuadjYuYuadjYu = Real(cTrace(YuadjYuYuadjYu),dp)  
 TrYuadjYuTuadjYu = cTrace(YuadjYuTuadjYu)
 TrYuadjYuTuadjTu = cTrace(YuadjYuTuadjTu)
 TrYuadjTdTdadjYu = cTrace(YuadjTdTdadjYu)
 TrYuadjTuTuadjYu = cTrace(YuadjTuTuadjYu)
 TrYvadjYvYvadjYv = Real(cTrace(YvadjYvYvadjYv),dp)  
 TrYvadjYvTvadjYv = cTrace(YvadjYvTvadjYv)
 TrYvadjYvTvadjTv = cTrace(YvadjYvTvadjTv)
 TrYvadjYvTpYeCYe = cTrace(YvadjYvTpYeCYe)
 TrYvadjYvTpTeCTe = cTrace(YvadjYvTpTeCTe)
 TrYvadjTvTvadjYv = cTrace(YvadjTvTvadjYv)
 TradjYeTeCYvTpYv = cTrace(adjYeTeCYvTpYv)
 TradjYeTeCTvTpYv = cTrace(adjYeTeCTvTpYv)
 TradjYvTpYeCYeTv = cTrace(adjYvTpYeCYeTv)
 TradjYvTpYeCTeTv = cTrace(adjYvTpYeCTeTv)
 Trmd2YdadjYdYdadjYd = cTrace(md2YdadjYdYdadjYd)
 Trmd2YdadjYuYuadjYd = cTrace(md2YdadjYuYuadjYd)
 Trme2YeadjYeYeadjYe = cTrace(me2YeadjYeYeadjYe)
 Trml2adjYeYeadjYeYe = cTrace(ml2adjYeYeadjYeYe)
 Trmq2adjYdYdadjYdYd = cTrace(mq2adjYdYdadjYdYd)
 Trmq2adjYdYdadjYuYu = cTrace(mq2adjYdYdadjYuYu)
 Trmq2adjYuYuadjYdYd = cTrace(mq2adjYuYuadjYdYd)
 Trmq2adjYuYuadjYuYu = cTrace(mq2adjYuYuadjYuYu)
 Trmu2YuadjYdYdadjYu = cTrace(mu2YuadjYdYdadjYu)
 Trmu2YuadjYuYuadjYu = cTrace(mu2YuadjYuYuadjYu)
 TrYvadjYvYvadjYvCml2 = cTrace(YvadjYvYvadjYvCml2)
 TrYvadjYvYvCmv2adjYv = cTrace(YvadjYvYvCmv2adjYv)
 TrYvadjYvCml2YvadjYv = Real(cTrace(YvadjYvCml2YvadjYv),dp)  
 TrYvadjYvCml2TpYeCYe = cTrace(YvadjYvCml2TpYeCYe)
 TrYvadjYvTpYeCme2CYe = cTrace(YvadjYvTpYeCme2CYe)
 TrYvadjYvTpYeCYeCml2 = cTrace(YvadjYvTpYeCYeCml2)
 TrYvCmv2adjYvYvadjYv = cTrace(YvCmv2adjYvYvadjYv)
 TrYvCmv2adjYvTpYeCYe = cTrace(YvCmv2adjYvTpYeCYe)
 g1p4 =g1**4 
 g2p4 =g2**4 
 g3p4 =g3**4 
 gpp4 =gp**4 
 Qdp4 =Qd**4 
 Qep3 =Qe**3 
 Qep4 =Qe**4 
 QHdp3 =QHd**3 
 QHdp4 =QHd**4 
 QHup3 =QHu**3 
 QHup4 =QHu**4 
 Qlp3 =Ql**3 
 Qlp4 =Ql**4 
 Qqp3 =Qq**3 
 Qqp4 =Qq**4 
 Qsp3 =Qs**3 
 Qsp4 =Qs**4 
 Qs1p3 =Qs1**3 
 Qs1p4 =Qs1**4 
 Qs2p3 =Qs2**3 
 Qs2p4 =Qs2**4 
 Qs3p3 =Qs3**3 
 Qs3p4 =Qs3**4 
 Qup3 =Qu**3 
 Qup4 =Qu**4 
 Qvp3 =Qv**3 
 Qvp4 =Qv**4 
 kapp2 =kap**2 
 lamp3 =lam**3 
 Ckapp2 =Conjg(kap)**2 
 Clamp2 =Conjg(lam)**2 
End If 
 
 
Tr1(1) = g1*sqrt3ov5*(-1._dp*(mHd2) + mHu2 + Trmd2 + Trme2 - Trml2 + Trmq2 -          & 
&  2._dp*(Trmu2))

Tr1(4) = gp*(2*mHd2*QHd + 2*mHu2*QHu + ms2*Qs + ms12*Qs1 + ms22*Qs2 + ms32*Qs3 +      & 
&  3*Qd*Trmd2 + Qe*Trme2 + 2*Ql*Trml2 + 6*Qq*Trmq2 + 3*Qu*Trmu2 + Qv*Trmv2)

If (TwoLoopRGE) Then 
Tr2U1(1, 1) = (g1p2*(3._dp*(mHd2) + 3._dp*(mHu2) + 2._dp*(Trmd2) + 6._dp*(Trme2)      & 
&  + 3._dp*(Trml2) + Trmq2 + 8._dp*(Trmu2)))/10._dp

Tr2U1(1, 4) = g1*gp*sqrt3ov5*(-(mHd2*QHd) + mHu2*QHu + Qd*Trmd2 + Qe*Trme2 -          & 
&  Ql*Trml2 + Qq*Trmq2 - 2*Qu*Trmu2)

Tr3(1) = (g1*ooSqrt15*(-9*g1p2*mHd2 - 45*g2p2*mHd2 + 30*Abslam*(mHd2 - mHu2)          & 
&  + 9*g1p2*mHu2 + 45*g2p2*mHu2 - 60*gpp2*mHd2*QHdp2 + 60*gpp2*mHu2*QHup2 +              & 
&  4*(g1p2 + 20._dp*(g3p2) + 15*gpp2*Qdp2)*Trmd2 + 36*g1p2*Trme2 + 60*gpp2*Qep2*Trme2 -  & 
&  9*g1p2*Trml2 - 45*g2p2*Trml2 - 60*gpp2*Qlp2*Trml2 + 30._dp*(Trml2YvadjYv)             & 
&  + g1p2*Trmq2 + 45*g2p2*Trmq2 + 80*g3p2*Trmq2 + 60*gpp2*Qqp2*Trmq2 - 32*g1p2*Trmu2 -   & 
&  160*g3p2*Trmu2 - 120*gpp2*Qup2*Trmu2 + 90*mHd2*TrYdadjYd - 60._dp*(TrYdadjYdCmd2)     & 
&  - 30._dp*(TrYdCmq2adjYd) + 30*mHd2*TrYeadjYe - 60._dp*(TrYeadjYeCme2) +               & 
&  30._dp*(TrYeCml2adjYe) - 90*mHu2*TrYuadjYu + 120._dp*(TrYuadjYuCmu2) - 30._dp*(TrYuCmq2adjYu)& 
&  - 30*mHu2*TrYvadjYv))/20._dp

Tr2(2) = (mHd2 + mHu2 + Trml2 + 3._dp*(Trmq2))/2._dp

Tr2(3) = (Trmd2 + 2._dp*(Trmq2) + Trmu2)/2._dp

Tr2U1(4, 1) = g1*gp*sqrt3ov5*(-(mHd2*QHd) + mHu2*QHu + Qd*Trmd2 + Qe*Trme2 -          & 
&  Ql*Trml2 + Qq*Trmq2 - 2*Qu*Trmu2)

Tr2U1(4, 4) = gpp2*(2*mHd2*QHdp2 + 2*mHu2*QHup2 + ms12*Qs1p2 + ms22*Qs2p2 +           & 
&  ms32*Qs3p2 + ms2*Qsp2 + 3*Qdp2*Trmd2 + Qep2*Trme2 + 2*Qlp2*Trml2 + 6*Qqp2*Trmq2 +     & 
&  3*Qup2*Trmu2 + Qvp2*Trmv2)

Tr3(4) = (gp*(-5*Abskap*(ms12*Qs1 + ms22*Qs2 + ms32*Qs3) + 9*(3*g1p2*mHd2*QHd +       & 
&  15*g2p2*mHd2*QHd + 20*gpp2*mHd2*QHdp3 + 3*g1p2*mHu2*QHu + 15*g2p2*mHu2*QHu +          & 
&  20*gpp2*mHu2*QHup3 - 10*Abslam*(mHd2*QHd + mHu2*QHu + ms2*Qs) + 10*gpp2*ms12*Qs1p3 +  & 
&  10*gpp2*ms22*Qs2p3 + 10*gpp2*ms32*Qs3p3 + 10*gpp2*ms2*Qsp3 + 2*Qd*(g1p2 +             & 
&  20._dp*(g3p2) + 15*gpp2*Qdp2)*Trmd2 + 6*g1p2*Qe*Trme2 + 10*gpp2*Qep3*Trme2 +          & 
&  3*g1p2*Ql*Trml2 + 15*g2p2*Ql*Trml2 + 20*gpp2*Qlp3*Trml2 - 10*Ql*Trml2YvadjYv +        & 
&  g1p2*Qq*Trmq2 + 45*g2p2*Qq*Trmq2 + 80*g3p2*Qq*Trmq2 + 60*gpp2*Qqp3*Trmq2 +            & 
&  8*g1p2*Qu*Trmu2 + 40*g3p2*Qu*Trmu2 + 30*gpp2*Qup3*Trmu2 + 10*gpp2*Qvp3*Trmv2 -        & 
&  10*Qv*Trmv2adjYvYv - 30*mHd2*QHd*TrYdadjYd - 30*Qd*TrYdadjYdCmd2 - 30*Qq*TrYdCmq2adjYd -& 
&  10*mHd2*QHd*TrYeadjYe - 10*Qe*TrYeadjYeCme2 - 10*Ql*TrYeCml2adjYe - 30*mHu2*QHu*TrYuadjYu -& 
&  30*Qu*TrYuadjYuCmu2 - 30*Qq*TrYuCmq2adjYu - 10*mHu2*QHu*TrYvadjYv)))/90._dp

End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 33._dp*(g1p3)/5._dp

 
 
If (TwoLoopRGE) Then 
betag12 = (g1p3*(-30._dp*(Abslam) + 199._dp*(g1p2) + 135._dp*(g2p2) + 440._dp*(g3p2) +          & 
&  60*gpp2*Qdp2 + 180*gpp2*Qep2 + 30*gpp2*QHdp2 + 30*gpp2*QHup2 + 90*gpp2*Qlp2 +         & 
&  30*gpp2*Qqp2 + 240*gpp2*Qup2 - 70._dp*(TrYdadjYd) - 90._dp*(TrYeadjYe) -              & 
&  130._dp*(TrYuadjYu) - 30._dp*(TrYvadjYv)))/25._dp

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = g2p3

 
 
If (TwoLoopRGE) Then 
betag22 = (g2p3*(-10._dp*(Abslam) + 9._dp*(g1p2) + 125._dp*(g2p2) + 120._dp*(g3p2) +            & 
&  10*gpp2*QHdp2 + 10*gpp2*QHup2 + 30*gpp2*Qlp2 + 90*gpp2*Qqp2 - 30._dp*(TrYdadjYd) -    & 
&  10._dp*(TrYeadjYe) - 30._dp*(TrYuadjYu) - 10._dp*(TrYvadjYv)))/5._dp

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = -3._dp*(g3p3)

 
 
If (TwoLoopRGE) Then 
betag32 = (g3p3*(11._dp*(g1p2) + 45._dp*(g2p2) + 70._dp*(g3p2) + 30*gpp2*Qdp2 + 60*gpp2*Qqp2 +  & 
&  30*gpp2*Qup2 - 20._dp*(TrYdadjYd) - 20._dp*(TrYuadjYu)))/5._dp

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! gp 
!-------------------- 
 
betagp1  = gpp3*(9._dp*(Qdp2) + 3._dp*(Qep2) + 2._dp*(QHdp2) + 2._dp*(QHup2)          & 
&  + 6._dp*(Qlp2) + 18._dp*(Qqp2) + Qs1p2 + Qs2p2 + Qs3p2 + Qsp2 + 9._dp*(Qup2)          & 
&  + 3._dp*(Qvp2))

 
 
If (TwoLoopRGE) Then 
betagp2 = (2*gpp3*(-5*Abskap*(Qs1p2 + Qs2p2 + Qs3p2) + 9*(6*g1p2*Qdp2 + 120*g3p2*Qdp2 +         & 
&  90*gpp2*Qdp4 + 18*g1p2*Qep2 + 30*gpp2*Qep4 + 3*g1p2*QHdp2 + 15*g2p2*QHdp2 +           & 
&  20*gpp2*QHdp4 + 3*g1p2*QHup2 + 15*g2p2*QHup2 + 20*gpp2*QHup4 + 9*g1p2*Qlp2 +          & 
&  45*g2p2*Qlp2 + 60*gpp2*Qlp4 + 3*g1p2*Qqp2 + 135*g2p2*Qqp2 + 240*g3p2*Qqp2 +           & 
&  180*gpp2*Qqp4 + 10*gpp2*Qs1p4 + 10*gpp2*Qs2p4 + 10*gpp2*Qs3p4 - 10*Abslam*(QHdp2 +    & 
&  QHup2 + Qsp2) + 10*gpp2*Qsp4 + 24*g1p2*Qup2 + 120*g3p2*Qup2 + 90*gpp2*Qup4 +          & 
&  30*gpp2*Qvp4 - 30*(Qdp2 + QHdp2 + Qqp2)*TrYdadjYd - 10*Qep2*TrYeadjYe -               & 
&  10*QHdp2*TrYeadjYe - 10*Qlp2*TrYeadjYe - 30*QHup2*TrYuadjYu - 30*Qqp2*TrYuadjYu -     & 
&  30*Qup2*TrYuadjYu - 10*QHup2*TrYvadjYv - 10*Qlp2*TrYvadjYv - 10*Qvp2*TrYvadjYv)))/45._dp

 
Dgp = oo16pi2*( betagp1 + oo16pi2 * betagp2 ) 

 
Else 
Dgp = oo16pi2* betagp1 
End If 
 
 
!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = (Abslam - 7._dp*(g1p2)/15._dp - 3._dp*(g2p2) - 16._dp*(g3p2)               & 
& /3._dp - 2*gpp2*Qdp2 - 2*gpp2*QHdp2 - 2*gpp2*Qqp2 + 3._dp*(TrYdadjYd) + TrYeadjYe)     & 
& *Yd + 3._dp*(YdadjYdYd) + YdadjYuYu

 
 
If (TwoLoopRGE) Then 
betaYd2 = (287._dp*(g1p4)/90._dp + g1p2*g2p2 + 15._dp*(g2p4)/2._dp + (8*g1p2*g3p2)/9._dp +      & 
&  8*g2p2*g3p2 - 16._dp*(g3p4)/9._dp - 3*Clamp2*lamp2 + (44*g1p2*gpp2*Qdp2)/15._dp +     & 
&  (32*g3p2*gpp2*Qdp2)/3._dp + 22*gpp4*Qdp4 + (12*g1p2*gpp2*Qd*Qe)/5._dp +               & 
&  6*gpp4*Qdp2*Qep2 - (22*g1p2*gpp2*Qd*QHd)/5._dp - (18*g1p2*gpp2*Qe*QHd)/5._dp +        & 
&  (12*g1p2*gpp2*QHdp2)/5._dp + 6*g2p2*gpp2*QHdp2 + 22*gpp4*Qdp2*QHdp2 + 6*gpp4*Qep2*QHdp2 +& 
&  8*gpp4*QHdp4 + (4*g1p2*gpp2*Qd*QHu)/5._dp - (6*g1p2*gpp2*QHd*QHu)/5._dp +             & 
&  4*gpp4*Qdp2*QHup2 + 4*gpp4*QHdp2*QHup2 - (12*g1p2*gpp2*Qd*Ql)/5._dp + (18*g1p2*gpp2*QHd*Ql)/5._dp +& 
&  12*gpp4*Qdp2*Qlp2 + 12*gpp4*QHdp2*Qlp2 + (18*g1p2*gpp2*Qd*Qq)/5._dp + (6*g1p2*gpp2*Qe*Qq)/5._dp -& 
&  4*g1p2*gpp2*QHd*Qq + (2*g1p2*gpp2*QHu*Qq)/5._dp - (6*g1p2*gpp2*Ql*Qq)/5._dp +         & 
&  (4*g1p2*gpp2*Qqp2)/3._dp + 6*g2p2*gpp2*Qqp2 + (32*g3p2*gpp2*Qqp2)/3._dp +             & 
&  54*gpp4*Qdp2*Qqp2 + 6*gpp4*Qep2*Qqp2 + 40*gpp4*QHdp2*Qqp2 + 4*gpp4*QHup2*Qqp2 +       & 
&  12*gpp4*Qlp2*Qqp2 + 40*gpp4*Qqp4 + 2*gpp4*Qdp2*Qs1p2 + 2*gpp4*QHdp2*Qs1p2 +           & 
&  2*gpp4*Qqp2*Qs1p2 + 2*gpp4*Qdp2*Qs2p2 + 2*gpp4*QHdp2*Qs2p2 + 2*gpp4*Qqp2*Qs2p2 +      & 
&  2*gpp4*Qdp2*Qs3p2 + 2*gpp4*QHdp2*Qs3p2 + 2*gpp4*Qqp2*Qs3p2 + 2*gpp4*Qdp2*Qsp2 +       & 
&  2*gpp4*QHdp2*Qsp2 + 2*gpp4*Qqp2*Qsp2 - (24*g1p2*gpp2*Qd*Qu)/5._dp + (36*g1p2*gpp2*QHd*Qu)/5._dp -& 
&  (12*g1p2*gpp2*Qq*Qu)/5._dp + 18*gpp4*Qdp2*Qup2 + 18*gpp4*QHdp2*Qup2 + 18*gpp4*Qqp2*Qup2 +& 
&  6*gpp4*Qdp2*Qvp2 + 6*gpp4*QHdp2*Qvp2 + 6*gpp4*Qqp2*Qvp2 - (2*(g1p2 - 5*(8._dp*(g3p2) +& 
&  3*gpp2*(Qdp2 - QHdp2 + Qqp2)))*TrYdadjYd)/5._dp - 9._dp*(TrYdadjYdYdadjYd) -          & 
&  3._dp*(TrYdadjYuYuadjYd) + (6*g1p2*TrYeadjYe)/5._dp + 2*gpp2*Qep2*TrYeadjYe -         & 
&  2*gpp2*QHdp2*TrYeadjYe + 2*gpp2*Qlp2*TrYeadjYe - 3._dp*(TrYeadjYeYeadjYe) -           & 
&  Abslam*(2*gpp2*(QHdp2 - QHup2 - Qsp2) + 3._dp*(TrYuadjYu) + TrYvadjYv) -              & 
&  TrYvadjYvTpYeCYe)*Yd + (-3._dp*(Abslam) + 4._dp*(g1p2)/5._dp + 6._dp*(g2p2) -         & 
&  2*gpp2*Qdp2 + 6*gpp2*QHdp2 + 2*gpp2*Qqp2 - 9._dp*(TrYdadjYd) - 3._dp*(TrYeadjYe))*YdadjYdYd  
betaYd2 =  betaYd2- 4._dp*(YdadjYdYdadjYdYd) - Abslam*YdadjYuYu + (4*g1p2*YdadjYuYu)/5._dp +              & 
&  2*gpp2*QHup2*YdadjYuYu - 2*gpp2*Qqp2*YdadjYuYu + 2*gpp2*Qup2*YdadjYuYu -              & 
&  3*TrYuadjYu*YdadjYuYu - TrYvadjYv*YdadjYuYu - 2._dp*(YdadjYuYuadjYdYd) -              & 
&  2._dp*(YdadjYuYuadjYuYu)

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = (Abslam - 9._dp*(g1p2)/5._dp - 3._dp*(g2p2) - 2*gpp2*Qep2 - 2*gpp2*QHdp2 - & 
&  2*gpp2*Qlp2 + 3._dp*(TrYdadjYd) + TrYeadjYe)*Ye + 3._dp*(YeadjYeYe) + YeCYvTpYv

 
 
If (TwoLoopRGE) Then 
betaYe2 = ((135._dp*(g1p4) + 18*g1p2*g2p2 + 75._dp*(g2p4) - 30*Clamp2*lamp2 + 72*g1p2*gpp2*Qd*Qe +& 
&  120*g1p2*gpp2*Qep2 + 180*gpp4*Qdp2*Qep2 + 100*gpp4*Qep4 - 36*g1p2*gpp2*Qd*QHd -       & 
&  60*g1p2*gpp2*Qe*QHd + 24*g1p2*gpp2*QHdp2 + 60*g2p2*gpp2*QHdp2 + 180*gpp4*Qdp2*QHdp2 + & 
&  100*gpp4*Qep2*QHdp2 + 80*gpp4*QHdp4 + 24*g1p2*gpp2*Qe*QHu - 12*g1p2*gpp2*QHd*QHu +    & 
&  40*gpp4*Qep2*QHup2 + 40*gpp4*QHdp2*QHup2 - 36*g1p2*gpp2*Qd*Ql - 108*g1p2*gpp2*Qe*Ql + & 
&  48*g1p2*gpp2*QHd*Ql - 12*g1p2*gpp2*QHu*Ql + 48*g1p2*gpp2*Qlp2 + 60*g2p2*gpp2*Qlp2 +   & 
&  180*gpp4*Qdp2*Qlp2 + 180*gpp4*Qep2*Qlp2 + 160*gpp4*QHdp2*Qlp2 + 40*gpp4*QHup2*Qlp2 +  & 
&  160*gpp4*Qlp4 + 72*g1p2*gpp2*Qe*Qq - 36*g1p2*gpp2*QHd*Qq - 36*g1p2*gpp2*Ql*Qq +       & 
&  360*gpp4*Qep2*Qqp2 + 360*gpp4*QHdp2*Qqp2 + 360*gpp4*Qlp2*Qqp2 + 20*gpp4*Qep2*Qs1p2 +  & 
&  20*gpp4*QHdp2*Qs1p2 + 20*gpp4*Qlp2*Qs1p2 + 20*gpp4*Qep2*Qs2p2 + 20*gpp4*QHdp2*Qs2p2 + & 
&  20*gpp4*Qlp2*Qs2p2 + 20*gpp4*Qep2*Qs3p2 + 20*gpp4*QHdp2*Qs3p2 + 20*gpp4*Qlp2*Qs3p2 +  & 
&  20*gpp4*Qep2*Qsp2 + 20*gpp4*QHdp2*Qsp2 + 20*gpp4*Qlp2*Qsp2 - 144*g1p2*gpp2*Qe*Qu +    & 
&  72*g1p2*gpp2*QHd*Qu + 72*g1p2*gpp2*Ql*Qu + 180*gpp4*Qep2*Qup2 + 180*gpp4*QHdp2*Qup2 + & 
&  180*gpp4*Qlp2*Qup2 + 60*gpp4*Qep2*Qvp2 + 60*gpp4*QHdp2*Qvp2 + 60*gpp4*Qlp2*Qvp2 -     & 
&  4*(g1p2 - 5*(8._dp*(g3p2) + 3*gpp2*(Qdp2 - QHdp2 + Qqp2)))*TrYdadjYd - 90._dp*(TrYdadjYdYdadjYd) -& 
&  30._dp*(TrYdadjYuYuadjYd) + 12*g1p2*TrYeadjYe + 20*gpp2*Qep2*TrYeadjYe -              & 
&  20*gpp2*QHdp2*TrYeadjYe + 20*gpp2*Qlp2*TrYeadjYe - 30._dp*(TrYeadjYeYeadjYe) -        & 
&  10*Abslam*(2*gpp2*(QHdp2 - QHup2 - Qsp2) + 3._dp*(TrYuadjYu) + TrYvadjYv) -           & 
&  10._dp*(TrYvadjYvTpYeCYe))*Ye)/10._dp + (-3._dp*(Abslam) + 6._dp*(g2p2) -             & 
&  2*gpp2*Qep2 + 6*gpp2*QHdp2 + 2*gpp2*Qlp2 - 9._dp*(TrYdadjYd) - 3._dp*(TrYeadjYe))*YeadjYeYe -& 
&  4._dp*(YeadjYeYeadjYeYe) - Abslam*YeCYvTpYv + 2*gpp2*QHup2*YeCYvTpYv - 2*gpp2*Qlp2*YeCYvTpYv  
betaYe2 =  betaYe2+ 2*gpp2*Qvp2*YeCYvTpYv - 3*TrYuadjYu*YeCYvTpYv - TrYvadjYv*YeCYvTpYv - 2._dp*(YeCYvTpYvadjYeYe) -& 
&  2._dp*(YeCYvTpYvCYvTpYv)

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! lam 
!-------------------- 
 
betalam1  = (-3*g1p2*lam)/5._dp - 3*g2p2*lam - 2*gpp2*QHdp2*lam - 2*gpp2*QHup2*lam -  & 
&  2*gpp2*Qsp2*lam + 3*TrYdadjYd*lam + TrYeadjYe*lam + 3*TrYuadjYu*lam + TrYvadjYv*lam + & 
&  4*lamp2*Conjg(lam)

 
 
If (TwoLoopRGE) Then 
betalam2 = -10*Clamp2*lamp3 + (207*g1p4*lam)/50._dp + (9*g1p2*g2p2*lam)/5._dp + (15*g2p4*lam)/2._dp -& 
&  (18*g1p2*gpp2*Qd*QHd*lam)/5._dp - (18*g1p2*gpp2*Qe*QHd*lam)/5._dp + (12*g1p2*gpp2*QHdp2*lam)/5._dp +& 
&  6*g2p2*gpp2*QHdp2*lam + 18*gpp4*Qdp2*QHdp2*lam + 6*gpp4*Qep2*QHdp2*lam +              & 
&  8*gpp4*QHdp4*lam + (18*g1p2*gpp2*Qd*QHu*lam)/5._dp + (18*g1p2*gpp2*Qe*QHu*lam)/5._dp -& 
&  (12*g1p2*gpp2*QHd*QHu*lam)/5._dp + (12*g1p2*gpp2*QHup2*lam)/5._dp + 6*g2p2*gpp2*QHup2*lam +& 
&  18*gpp4*Qdp2*QHup2*lam + 6*gpp4*Qep2*QHup2*lam + 8*gpp4*QHdp2*QHup2*lam +             & 
&  8*gpp4*QHup4*lam + (18*g1p2*gpp2*QHd*Ql*lam)/5._dp - (18*g1p2*gpp2*QHu*Ql*lam)/5._dp +& 
&  12*gpp4*QHdp2*Qlp2*lam + 12*gpp4*QHup2*Qlp2*lam - (18*g1p2*gpp2*QHd*Qq*lam)/5._dp +   & 
&  (18*g1p2*gpp2*QHu*Qq*lam)/5._dp + 36*gpp4*QHdp2*Qqp2*lam + 36*gpp4*QHup2*Qqp2*lam +   & 
&  2*gpp4*QHdp2*Qs1p2*lam + 2*gpp4*QHup2*Qs1p2*lam + 2*gpp4*QHdp2*Qs2p2*lam +            & 
&  2*gpp4*QHup2*Qs2p2*lam + 2*gpp4*QHdp2*Qs3p2*lam + 2*gpp4*QHup2*Qs3p2*lam +            & 
&  18*gpp4*Qdp2*Qsp2*lam + 6*gpp4*Qep2*Qsp2*lam + 6*gpp4*QHdp2*Qsp2*lam + 6*gpp4*QHup2*Qsp2*lam +& 
&  12*gpp4*Qlp2*Qsp2*lam + 36*gpp4*Qqp2*Qsp2*lam + 2*gpp4*Qs1p2*Qsp2*lam +               & 
&  2*gpp4*Qs2p2*Qsp2*lam + 2*gpp4*Qs3p2*Qsp2*lam + 6*gpp4*Qsp4*lam + (36*g1p2*gpp2*QHd*Qu*lam)/5._dp -& 
&  (36*g1p2*gpp2*QHu*Qu*lam)/5._dp + 18*gpp4*QHdp2*Qup2*lam + 18*gpp4*QHup2*Qup2*lam +   & 
&  18*gpp4*Qsp2*Qup2*lam + 6*gpp4*QHdp2*Qvp2*lam + 6*gpp4*QHup2*Qvp2*lam +               & 
&  6*gpp4*Qsp2*Qvp2*lam - (2*(g1p2 - 5*(8._dp*(g3p2) + 3*gpp2*(Qdp2 - QHdp2 +            & 
&  Qqp2)))*TrYdadjYd*lam)/5._dp - 9*TrYdadjYdYdadjYd*lam - 6*TrYdadjYuYuadjYd*lam +      & 
&  (6*g1p2*TrYeadjYe*lam)/5._dp + 2*gpp2*Qep2*TrYeadjYe*lam - 2*gpp2*QHdp2*TrYeadjYe*lam +& 
&  2*gpp2*Qlp2*TrYeadjYe*lam - 3*TrYeadjYeYeadjYe*lam + (4*g1p2*TrYuadjYu*lam)/5._dp +   & 
&  16*g3p2*TrYuadjYu*lam - 6*gpp2*QHup2*TrYuadjYu*lam + 6*gpp2*Qqp2*TrYuadjYu*lam  
betalam2 =  betalam2+ 6*gpp2*Qup2*TrYuadjYu*lam - 9*TrYuadjYuYuadjYu*lam - 2*gpp2*QHup2*TrYvadjYv*lam +     & 
&  2*gpp2*Qlp2*TrYvadjYv*lam + 2*gpp2*Qvp2*TrYvadjYv*lam - 2*TrYvadjYvTpYeCYe*lam -      & 
&  3*TrYvadjYvYvadjYv*lam + (lamp2*(6._dp*(g1p2) + 30._dp*(g2p2) + 20*gpp2*QHdp2 +       & 
&  20*gpp2*QHup2 - 45._dp*(TrYdadjYd) - 15._dp*(TrYeadjYe) - 45._dp*(TrYuadjYu) -        & 
&  15._dp*(TrYvadjYv))*Conjg(lam))/5._dp

 
Dlam = oo16pi2*( betalam1 + oo16pi2 * betalam2 ) 

 
Else 
Dlam = oo16pi2* betalam1 
End If 
 
 
Call Chop(Dlam) 

!-------------------- 
! Yv 
!-------------------- 
 
betaYv1  = TpYeCYeYv + (Abslam - 3._dp*(g1p2)/5._dp - 3._dp*(g2p2) - 2*gpp2*QHup2 -   & 
&  2*gpp2*Qlp2 - 2*gpp2*Qvp2 + 3._dp*(TrYuadjYu) + TrYvadjYv)*Yv + 3._dp*(YvadjYvYv)

 
 
If (TwoLoopRGE) Then 
betaYv2 = -2._dp*(TpYeCYeTpYeCYeYv) - Abslam*TpYeCYeYv + (6*g1p2*TpYeCYeYv)/5._dp +             & 
&  2*gpp2*Qep2*TpYeCYeYv + 2*gpp2*QHdp2*TpYeCYeYv - 2*gpp2*Qlp2*TpYeCYeYv -              & 
&  3*TpYeCYeYv*TrYdadjYd - TpYeCYeYv*TrYeadjYe + (207._dp*(g1p4)/50._dp + (9*g1p2*g2p2)/5._dp +& 
&  15._dp*(g2p4)/2._dp - 3*Clamp2*lamp2 + (18*g1p2*gpp2*Qd*QHu)/5._dp + (18*g1p2*gpp2*Qe*QHu)/5._dp -& 
&  (6*g1p2*gpp2*QHd*QHu)/5._dp + (12*g1p2*gpp2*QHup2)/5._dp + 6*g2p2*gpp2*QHup2 +        & 
&  18*gpp4*Qdp2*QHup2 + 6*gpp4*Qep2*QHup2 + 4*gpp4*QHdp2*QHup2 + 8*gpp4*QHup4 -          & 
&  (18*g1p2*gpp2*Qd*Ql)/5._dp - (18*g1p2*gpp2*Qe*Ql)/5._dp + (6*g1p2*gpp2*QHd*Ql)/5._dp -& 
&  (24*g1p2*gpp2*QHu*Ql)/5._dp + (24*g1p2*gpp2*Qlp2)/5._dp + 6*g2p2*gpp2*Qlp2 +          & 
&  18*gpp4*Qdp2*Qlp2 + 6*gpp4*Qep2*Qlp2 + 4*gpp4*QHdp2*Qlp2 + 16*gpp4*QHup2*Qlp2 +       & 
&  16*gpp4*Qlp4 + (18*g1p2*gpp2*QHu*Qq)/5._dp - (18*g1p2*gpp2*Ql*Qq)/5._dp +             & 
&  36*gpp4*QHup2*Qqp2 + 36*gpp4*Qlp2*Qqp2 + 2*gpp4*QHup2*Qs1p2 + 2*gpp4*Qlp2*Qs1p2 +     & 
&  2*gpp4*QHup2*Qs2p2 + 2*gpp4*Qlp2*Qs2p2 + 2*gpp4*QHup2*Qs3p2 + 2*gpp4*Qlp2*Qs3p2 +     & 
&  2*gpp4*QHup2*Qsp2 + 2*gpp4*Qlp2*Qsp2 - (36*g1p2*gpp2*QHu*Qu)/5._dp + (36*g1p2*gpp2*Ql*Qu)/5._dp +& 
&  18*gpp4*QHup2*Qup2 + 18*gpp4*Qlp2*Qup2 + 18*gpp4*Qdp2*Qvp2 + 6*gpp4*Qep2*Qvp2 +       & 
&  4*gpp4*QHdp2*Qvp2 + 10*gpp4*QHup2*Qvp2 + 18*gpp4*Qlp2*Qvp2 + 36*gpp4*Qqp2*Qvp2 +      & 
&  2*gpp4*Qs1p2*Qvp2 + 2*gpp4*Qs2p2*Qvp2 + 2*gpp4*Qs3p2*Qvp2 + 2*gpp4*Qsp2*Qvp2 +        & 
&  18*gpp4*Qup2*Qvp2 + 10*gpp4*Qvp4 - 3._dp*(TrYdadjYuYuadjYd) + Abslam*(2*gpp2*(QHdp2 - & 
&  QHup2 + Qsp2) - 3._dp*(TrYdadjYd) - TrYeadjYe) + (2*(2._dp*(g1p2) + 40._dp*(g3p2) +   & 
&  15*gpp2*(-1._dp*(QHup2) + Qqp2 + Qup2))*TrYuadjYu)/5._dp - 9._dp*(TrYuadjYuYuadjYu) - & 
&  2*gpp2*QHup2*TrYvadjYv + 2*gpp2*Qlp2*TrYvadjYv + 2*gpp2*Qvp2*TrYvadjYv -              & 
&  TrYvadjYvTpYeCYe - 3._dp*(TrYvadjYvYvadjYv))*Yv - 2._dp*(YvadjYvTpYeCYeYv)  
betaYv2 =  betaYv2+ (-3._dp*(Abslam) + 6._dp*(g1p2)/5._dp + 6._dp*(g2p2) + 6*gpp2*QHup2 + 2*gpp2*Qlp2 -   & 
&  2*gpp2*Qvp2 - 9._dp*(TrYuadjYu) - 3._dp*(TrYvadjYv))*YvadjYvYv - 4._dp*(YvadjYvYvadjYvYv)

 
DYv = oo16pi2*( betaYv1 + oo16pi2 * betaYv2 ) 

 
Else 
DYv = oo16pi2* betaYv1 
End If 
 
 
Call Chop(DYv) 

!-------------------- 
! kap 
!-------------------- 
 
betakap1  = ((Abskap - 6*gpp2*(Qs1p2 + Qs2p2 + Qs3p2))*kap)/3._dp

 
 
If (TwoLoopRGE) Then 
betakap2 = (2*(-(Ckapp2*kapp2) + 3*Abskap*gpp2*(Qs1p2 + Qs2p2 + Qs3p2) + 27*gpp4*(2*QHdp2*Qs1p2 +& 
&  2*QHup2*Qs1p2 + 6*Qlp2*Qs1p2 + 18*Qqp2*Qs1p2 + 3._dp*(Qs1p4) + 2*QHdp2*Qs2p2 +        & 
&  2*QHup2*Qs2p2 + 6*Qlp2*Qs2p2 + 18*Qqp2*Qs2p2 + 2*Qs1p2*Qs2p2 + 3._dp*(Qs2p4) +        & 
&  2*QHdp2*Qs3p2 + 2*QHup2*Qs3p2 + 6*Qlp2*Qs3p2 + 18*Qqp2*Qs3p2 + 2*Qs1p2*Qs3p2 +        & 
&  2*Qs2p2*Qs3p2 + 9*Qdp2*(Qs1p2 + Qs2p2 + Qs3p2) + 3*Qep2*(Qs1p2 + Qs2p2 +              & 
&  Qs3p2) + 3._dp*(Qs3p4) + Qs1p2*Qsp2 + Qs2p2*Qsp2 + Qs3p2*Qsp2 + 9*Qs1p2*Qup2 +        & 
&  9*Qs2p2*Qup2 + 9*Qs3p2*Qup2 + 3*Qs1p2*Qvp2 + 3*Qs2p2*Qvp2 + 3*Qs3p2*Qvp2))*kap)/27._dp

 
Dkap = oo16pi2*( betakap1 + oo16pi2 * betakap2 ) 

 
Else 
Dkap = oo16pi2* betakap1 
End If 
 
 
Call Chop(Dkap) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = (Abslam - 13._dp*(g1p2)/15._dp - 3._dp*(g2p2) - 16._dp*(g3p2)              & 
& /3._dp - 2*gpp2*QHup2 - 2*gpp2*Qqp2 - 2*gpp2*Qup2 + 3._dp*(TrYuadjYu) + TrYvadjYv)     & 
& *Yu + YuadjYdYd + 3._dp*(YuadjYuYu)

 
 
If (TwoLoopRGE) Then 
betaYu2 = (2743._dp*(g1p4)/450._dp + g1p2*g2p2 + 15._dp*(g2p4)/2._dp + (136*g1p2*g3p2)/45._dp + & 
&  8*g2p2*g3p2 - 16._dp*(g3p4)/9._dp - 3*Clamp2*lamp2 + (18*g1p2*gpp2*Qd*QHu)/5._dp +    & 
&  (18*g1p2*gpp2*Qe*QHu)/5._dp - (6*g1p2*gpp2*QHd*QHu)/5._dp + (12*g1p2*gpp2*QHup2)/5._dp +& 
&  6*g2p2*gpp2*QHup2 + 18*gpp4*Qdp2*QHup2 + 6*gpp4*Qep2*QHup2 + 4*gpp4*QHdp2*QHup2 +     & 
&  8*gpp4*QHup4 - (18*g1p2*gpp2*QHu*Ql)/5._dp + 12*gpp4*QHup2*Qlp2 + (6*g1p2*gpp2*Qd*Qq)/5._dp +& 
&  (6*g1p2*gpp2*Qe*Qq)/5._dp - (2*g1p2*gpp2*QHd*Qq)/5._dp + 4*g1p2*gpp2*QHu*Qq -         & 
&  (6*g1p2*gpp2*Ql*Qq)/5._dp + (4*g1p2*gpp2*Qqp2)/3._dp + 6*g2p2*gpp2*Qqp2 +             & 
&  (32*g3p2*gpp2*Qqp2)/3._dp + 18*gpp4*Qdp2*Qqp2 + 6*gpp4*Qep2*Qqp2 + 4*gpp4*QHdp2*Qqp2 +& 
&  40*gpp4*QHup2*Qqp2 + 12*gpp4*Qlp2*Qqp2 + 40*gpp4*Qqp4 + 2*gpp4*QHup2*Qs1p2 +          & 
&  2*gpp4*Qqp2*Qs1p2 + 2*gpp4*QHup2*Qs2p2 + 2*gpp4*Qqp2*Qs2p2 + 2*gpp4*QHup2*Qs3p2 +     & 
&  2*gpp4*Qqp2*Qs3p2 + 2*gpp4*QHup2*Qsp2 + 2*gpp4*Qqp2*Qsp2 - (24*g1p2*gpp2*Qd*Qu)/5._dp -& 
&  (24*g1p2*gpp2*Qe*Qu)/5._dp + (8*g1p2*gpp2*QHd*Qu)/5._dp - (44*g1p2*gpp2*QHu*Qu)/5._dp +& 
&  (24*g1p2*gpp2*Ql*Qu)/5._dp - (36*g1p2*gpp2*Qq*Qu)/5._dp + (176*g1p2*gpp2*Qup2)/15._dp +& 
&  (32*g3p2*gpp2*Qup2)/3._dp + 18*gpp4*Qdp2*Qup2 + 6*gpp4*Qep2*Qup2 + 4*gpp4*QHdp2*Qup2 +& 
&  22*gpp4*QHup2*Qup2 + 12*gpp4*Qlp2*Qup2 + 54*gpp4*Qqp2*Qup2 + 2*gpp4*Qs1p2*Qup2 +      & 
&  2*gpp4*Qs2p2*Qup2 + 2*gpp4*Qs3p2*Qup2 + 2*gpp4*Qsp2*Qup2 + 22*gpp4*Qup4 +             & 
&  6*gpp4*QHup2*Qvp2 + 6*gpp4*Qqp2*Qvp2 + 6*gpp4*Qup2*Qvp2 - 3._dp*(TrYdadjYuYuadjYd) +  & 
&  Abslam*(2*gpp2*(QHdp2 - QHup2 + Qsp2) - 3._dp*(TrYdadjYd) - TrYeadjYe) +              & 
&  (2*(2._dp*(g1p2) + 40._dp*(g3p2) + 15*gpp2*(-1._dp*(QHup2) + Qqp2 + Qup2))*TrYuadjYu)/5._dp -& 
&  9._dp*(TrYuadjYuYuadjYu) - 2*gpp2*QHup2*TrYvadjYv + 2*gpp2*Qlp2*TrYvadjYv +           & 
&  2*gpp2*Qvp2*TrYvadjYv - TrYvadjYvTpYeCYe - 3._dp*(TrYvadjYvYvadjYv))*Yu  
betaYu2 =  betaYu2+ (-1._dp*(Abslam) + 2._dp*(g1p2)/5._dp + 2*gpp2*Qdp2 + 2*gpp2*QHdp2 - 2*gpp2*Qqp2 -    & 
&  3._dp*(TrYdadjYd) - TrYeadjYe)*YuadjYdYd - 2._dp*(YuadjYdYdadjYdYd) - 2._dp*(YuadjYdYdadjYuYu) -& 
&  3*Abslam*YuadjYuYu + (2*g1p2*YuadjYuYu)/5._dp + 6*g2p2*YuadjYuYu + 6*gpp2*QHup2*YuadjYuYu +& 
&  2*gpp2*Qqp2*YuadjYuYu - 2*gpp2*Qup2*YuadjYuYu - 9*TrYuadjYu*YuadjYuYu -               & 
&  3*TrYvadjYv*YuadjYuYu - 4._dp*(YuadjYuYuadjYuYu)

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! Td 
!-------------------- 
 
betaTd1  = 5._dp*(TdadjYdYd) + TdadjYuYu + 4._dp*(YdadjYdTd) + 2._dp*(YdadjYuTu)      & 
&  + Abslam*Td - (7*g1p2*Td)/15._dp - 3*g2p2*Td - (16*g3p2*Td)/3._dp - 2*gpp2*Qdp2*Td -  & 
&  2*gpp2*QHdp2*Td - 2*gpp2*Qqp2*Td + 3*TrYdadjYd*Td + TrYeadjYe*Td + Yd*((14*g1p2*M1)   & 
& /15._dp + (32*g3p2*M3)/3._dp + 6*g2p2*M2 + 4*gpp2*M4*Qdp2 + 4*gpp2*M4*QHdp2 +          & 
&  4*gpp2*M4*Qqp2 + 6._dp*(TradjYdTd) + 2._dp*(TradjYeTe) + 2*Conjg(lam)*Tlam)

 
 
If (TwoLoopRGE) Then 
betaTd2 = -5*Abslam*TdadjYdYd + (6*g1p2*TdadjYdYd)/5._dp + 12*g2p2*TdadjYdYd - 6*gpp2*Qdp2*TdadjYdYd +& 
&  10*gpp2*QHdp2*TdadjYdYd + 6*gpp2*Qqp2*TdadjYdYd - 6._dp*(TdadjYdYdadjYdYd) -          & 
&  Abslam*TdadjYuYu + (4*g1p2*TdadjYuYu)/5._dp + 2*gpp2*QHup2*TdadjYuYu - 2*gpp2*Qqp2*TdadjYuYu +& 
&  2*gpp2*Qup2*TdadjYuYu - 4._dp*(TdadjYuYuadjYdYd) - 2._dp*(TdadjYuYuadjYuYu) -         & 
&  15*TdadjYdYd*TrYdadjYd - 5*TdadjYdYd*TrYeadjYe - 3*TdadjYuYu*TrYuadjYu -              & 
&  TdadjYuYu*TrYvadjYv - 4*Abslam*YdadjYdTd + (6*g1p2*YdadjYdTd)/5._dp + 6*g2p2*YdadjYdTd +& 
&  8*gpp2*QHdp2*YdadjYdTd - 12*TrYdadjYd*YdadjYdTd - 4*TrYeadjYe*YdadjYdTd -             & 
&  8._dp*(YdadjYdTdadjYdYd) - 6._dp*(YdadjYdYdadjYdTd) - 2*Abslam*YdadjYuTu +            & 
&  (8*g1p2*YdadjYuTu)/5._dp + 4*gpp2*QHup2*YdadjYuTu - 4*gpp2*Qqp2*YdadjYuTu +           & 
&  4*gpp2*Qup2*YdadjYuTu - 6*TrYuadjYu*YdadjYuTu - 2*TrYvadjYv*YdadjYuTu -               & 
&  4._dp*(YdadjYuTuadjYdYd) - 4._dp*(YdadjYuTuadjYuYu) - (8*g1p2*M1*YdadjYuYu)/5._dp -   & 
&  4*gpp2*M4*QHup2*YdadjYuYu + 4*gpp2*M4*Qqp2*YdadjYuYu - 4*gpp2*M4*Qup2*YdadjYuYu -     & 
&  6*TradjYuTu*YdadjYuYu - 2*TradjYvTv*YdadjYuYu - 2._dp*(YdadjYuYuadjYdTd) -            & 
&  4._dp*(YdadjYuYuadjYuTu) + (287*g1p4*Td)/90._dp + g1p2*g2p2*Td + (15*g2p4*Td)/2._dp + & 
&  (8*g1p2*g3p2*Td)/9._dp + 8*g2p2*g3p2*Td - (16*g3p4*Td)/9._dp - 3*Clamp2*lamp2*Td +    & 
&  (44*g1p2*gpp2*Qdp2*Td)/15._dp + (32*g3p2*gpp2*Qdp2*Td)/3._dp + 22*gpp4*Qdp4*Td +      & 
&  (12*g1p2*gpp2*Qd*Qe*Td)/5._dp + 6*gpp4*Qdp2*Qep2*Td - (22*g1p2*gpp2*Qd*QHd*Td)/5._dp -& 
&  (18*g1p2*gpp2*Qe*QHd*Td)/5._dp - 2*Abslam*gpp2*QHdp2*Td + (12*g1p2*gpp2*QHdp2*Td)/5._dp +& 
&  6*g2p2*gpp2*QHdp2*Td + 22*gpp4*Qdp2*QHdp2*Td + 6*gpp4*Qep2*QHdp2*Td + 8*gpp4*QHdp4*Td +& 
&  (4*g1p2*gpp2*Qd*QHu*Td)/5._dp - (6*g1p2*gpp2*QHd*QHu*Td)/5._dp + 2*Abslam*gpp2*QHup2*Td +& 
&  4*gpp4*Qdp2*QHup2*Td + 4*gpp4*QHdp2*QHup2*Td - (12*g1p2*gpp2*Qd*Ql*Td)/5._dp  
betaTd2 =  betaTd2+ (18*g1p2*gpp2*QHd*Ql*Td)/5._dp + 12*gpp4*Qdp2*Qlp2*Td + 12*gpp4*QHdp2*Qlp2*Td +       & 
&  (18*g1p2*gpp2*Qd*Qq*Td)/5._dp + (6*g1p2*gpp2*Qe*Qq*Td)/5._dp - 4*g1p2*gpp2*QHd*Qq*Td +& 
&  (2*g1p2*gpp2*QHu*Qq*Td)/5._dp - (6*g1p2*gpp2*Ql*Qq*Td)/5._dp + (4*g1p2*gpp2*Qqp2*Td)/3._dp +& 
&  6*g2p2*gpp2*Qqp2*Td + (32*g3p2*gpp2*Qqp2*Td)/3._dp + 54*gpp4*Qdp2*Qqp2*Td +           & 
&  6*gpp4*Qep2*Qqp2*Td + 40*gpp4*QHdp2*Qqp2*Td + 4*gpp4*QHup2*Qqp2*Td + 12*gpp4*Qlp2*Qqp2*Td +& 
&  40*gpp4*Qqp4*Td + 2*gpp4*Qdp2*Qs1p2*Td + 2*gpp4*QHdp2*Qs1p2*Td + 2*gpp4*Qqp2*Qs1p2*Td +& 
&  2*gpp4*Qdp2*Qs2p2*Td + 2*gpp4*QHdp2*Qs2p2*Td + 2*gpp4*Qqp2*Qs2p2*Td + 2*gpp4*Qdp2*Qs3p2*Td +& 
&  2*gpp4*QHdp2*Qs3p2*Td + 2*gpp4*Qqp2*Qs3p2*Td + 2*Abslam*gpp2*Qsp2*Td + 2*gpp4*Qdp2*Qsp2*Td +& 
&  2*gpp4*QHdp2*Qsp2*Td + 2*gpp4*Qqp2*Qsp2*Td - (24*g1p2*gpp2*Qd*Qu*Td)/5._dp +          & 
&  (36*g1p2*gpp2*QHd*Qu*Td)/5._dp - (12*g1p2*gpp2*Qq*Qu*Td)/5._dp + 18*gpp4*Qdp2*Qup2*Td +& 
&  18*gpp4*QHdp2*Qup2*Td + 18*gpp4*Qqp2*Qup2*Td + 6*gpp4*Qdp2*Qvp2*Td + 6*gpp4*QHdp2*Qvp2*Td +& 
&  6*gpp4*Qqp2*Qvp2*Td - (2*g1p2*TrYdadjYd*Td)/5._dp + 16*g3p2*TrYdadjYd*Td +            & 
&  6*gpp2*Qdp2*TrYdadjYd*Td - 6*gpp2*QHdp2*TrYdadjYd*Td + 6*gpp2*Qqp2*TrYdadjYd*Td -     & 
&  9*TrYdadjYdYdadjYd*Td - 3*TrYdadjYuYuadjYd*Td + (6*g1p2*TrYeadjYe*Td)/5._dp +         & 
&  2*gpp2*Qep2*TrYeadjYe*Td - 2*gpp2*QHdp2*TrYeadjYe*Td + 2*gpp2*Qlp2*TrYeadjYe*Td -     & 
&  3*TrYeadjYeYeadjYe*Td - 3*Abslam*TrYuadjYu*Td - Abslam*TrYvadjYv*Td - TrYvadjYvTpYeCYe*Td -& 
&  2*YdadjYuYu*Conjg(lam)*Tlam - (2*YdadjYdYd*(4*g1p2*M1 + 30*g2p2*M2 - 10*gpp2*M4*Qdp2 +& 
&  30*gpp2*M4*QHdp2 + 10*gpp2*M4*Qqp2 + 45._dp*(TradjYdTd) + 15._dp*(TradjYeTe) +        & 
&  15*Conjg(lam)*Tlam))/5._dp - (2*Yd*(287*g1p4*M1 + 45*g1p2*g2p2*M1 + 40*g1p2*g3p2*M1 + & 
&  40*g1p2*g3p2*M3 + 360*g2p2*g3p2*M3 - 160*g3p4*M3 + 45*g1p2*g2p2*M2 + 675*g2p4*M2 +    & 
&  360*g2p2*g3p2*M2 + 132*g1p2*gpp2*M1*Qdp2 + 480*g3p2*gpp2*M3*Qdp2 + 132*g1p2*gpp2*M4*Qdp2 +& 
&  480*g3p2*gpp2*M4*Qdp2 + 1980*gpp4*M4*Qdp4 + 108*g1p2*gpp2*M1*Qd*Qe + 108*g1p2*gpp2*M4*Qd*Qe +& 
&  540*gpp4*M4*Qdp2*Qep2 - 198*g1p2*gpp2*M1*Qd*QHd - 198*g1p2*gpp2*M4*Qd*QHd -           & 
&  162*g1p2*gpp2*M1*Qe*QHd - 162*g1p2*gpp2*M4*Qe*QHd + 108*g1p2*gpp2*M1*QHdp2 +          & 
&  108*g1p2*gpp2*M4*QHdp2 + 270*g2p2*gpp2*M4*QHdp2 + 270*g2p2*gpp2*M2*QHdp2 +            & 
&  1980*gpp4*M4*Qdp2*QHdp2 + 540*gpp4*M4*Qep2*QHdp2 + 720*gpp4*M4*QHdp4 + 36*g1p2*gpp2*M1*Qd*QHu +& 
&  36*g1p2*gpp2*M4*Qd*QHu - 54*g1p2*gpp2*M1*QHd*QHu - 54*g1p2*gpp2*M4*QHd*QHu +          & 
&  360*gpp4*M4*Qdp2*QHup2 + 360*gpp4*M4*QHdp2*QHup2 - 108*g1p2*gpp2*M1*Qd*Ql -           & 
&  108*g1p2*gpp2*M4*Qd*Ql + 162*g1p2*gpp2*M1*QHd*Ql + 162*g1p2*gpp2*M4*QHd*Ql +          & 
&  1080*gpp4*M4*Qdp2*Qlp2 + 1080*gpp4*M4*QHdp2*Qlp2 + 162*g1p2*gpp2*M1*Qd*Qq +           & 
&  162*g1p2*gpp2*M4*Qd*Qq + 54*g1p2*gpp2*M1*Qe*Qq + 54*g1p2*gpp2*M4*Qe*Qq -              & 
&  180*g1p2*gpp2*M1*QHd*Qq - 180*g1p2*gpp2*M4*QHd*Qq + 18*g1p2*gpp2*M1*QHu*Qq +          & 
&  18*g1p2*gpp2*M4*QHu*Qq - 54*g1p2*gpp2*M1*Ql*Qq - 54*g1p2*gpp2*M4*Ql*Qq +              & 
&  60*g1p2*gpp2*M1*Qqp2 + 480*g3p2*gpp2*M3*Qqp2 + 60*g1p2*gpp2*M4*Qqp2 + 270*g2p2*gpp2*M4*Qqp2 +& 
&  480*g3p2*gpp2*M4*Qqp2 + 270*g2p2*gpp2*M2*Qqp2 + 4860*gpp4*M4*Qdp2*Qqp2 +              & 
&  540*gpp4*M4*Qep2*Qqp2 + 3600*gpp4*M4*QHdp2*Qqp2 + 360*gpp4*M4*QHup2*Qqp2 +            & 
&  1080*gpp4*M4*Qlp2*Qqp2 + 3600*gpp4*M4*Qqp4 + 180*gpp4*M4*Qdp2*Qs1p2 + 180*gpp4*M4*QHdp2*Qs1p2 +& 
&  180*gpp4*M4*Qqp2*Qs1p2 + 180*gpp4*M4*Qdp2*Qs2p2 + 180*gpp4*M4*QHdp2*Qs2p2 +           & 
&  180*gpp4*M4*Qqp2*Qs2p2 + 180*gpp4*M4*Qdp2*Qs3p2 + 180*gpp4*M4*QHdp2*Qs3p2 +           & 
&  180*gpp4*M4*Qqp2*Qs3p2 + 180*gpp4*M4*Qdp2*Qsp2 + 180*gpp4*M4*QHdp2*Qsp2 +             & 
&  180*gpp4*M4*Qqp2*Qsp2 - 216*g1p2*gpp2*M1*Qd*Qu - 216*g1p2*gpp2*M4*Qd*Qu +             & 
&  324*g1p2*gpp2*M1*QHd*Qu + 324*g1p2*gpp2*M4*QHd*Qu - 108*g1p2*gpp2*M1*Qq*Qu -          & 
&  108*g1p2*gpp2*M4*Qq*Qu + 1620*gpp4*M4*Qdp2*Qup2 + 1620*gpp4*M4*QHdp2*Qup2 +           & 
&  1620*gpp4*M4*Qqp2*Qup2 + 540*gpp4*M4*Qdp2*Qvp2 + 540*gpp4*M4*QHdp2*Qvp2 +             & 
&  540*gpp4*M4*Qqp2*Qvp2 + 18*g1p2*TradjYdTd - 720*g3p2*TradjYdTd - 270*gpp2*Qdp2*TradjYdTd +& 
&  270*gpp2*QHdp2*TradjYdTd - 270*gpp2*Qqp2*TradjYdTd - 54*g1p2*TradjYeTe -              & 
&  90*gpp2*Qep2*TradjYeTe + 90*gpp2*QHdp2*TradjYeTe - 90*gpp2*Qlp2*TradjYeTe +           & 
&  45._dp*(TradjYeTeCYvTpYv) + 45._dp*(TradjYvTpYeCYeTv) - 18*(g1p2*M1 - 5*(8*g3p2*M3 +  & 
&  3*gpp2*M4*(Qdp2 - QHdp2 + Qqp2)))*TrYdadjYd + 810._dp*(TrYdadjYdTdadjYd) +            & 
&  135._dp*(TrYdadjYuTuadjYd) + 54*g1p2*M1*TrYeadjYe + 90*gpp2*M4*Qep2*TrYeadjYe -       & 
&  90*gpp2*M4*QHdp2*TrYeadjYe + 90*gpp2*M4*Qlp2*TrYeadjYe + 270._dp*(TrYeadjYeTeadjYe) + & 
&  135._dp*(TrYuadjYdTdadjYu) + 270*Clamp2*lam*Tlam - 45*Conjg(lam)*((2*gpp2*M4*(QHdp2 - & 
&  QHup2 - Qsp2) - 3._dp*(TradjYuTu) - TradjYvTv)*lam - (2*gpp2*(QHdp2 - QHup2 -         & 
&  Qsp2) + 3._dp*(TrYuadjYu) + TrYvadjYv)*Tlam)))/45._dp

 
DTd = oo16pi2*( betaTd1 + oo16pi2 * betaTd2 ) 

 
Else 
DTd = oo16pi2* betaTd1 
End If 
 
 
Call Chop(DTd) 

!-------------------- 
! Te 
!-------------------- 
 
betaTe1  = 5._dp*(TeadjYeYe) + TeCYvTpYv + 4._dp*(YeadjYeTe) + 2._dp*(YeCYvTpTv)      & 
&  + Abslam*Te - (9*g1p2*Te)/5._dp - 3*g2p2*Te - 2*gpp2*Qep2*Te - 2*gpp2*QHdp2*Te -      & 
&  2*gpp2*Qlp2*Te + 3*TrYdadjYd*Te + TrYeadjYe*Te + Ye*((18*g1p2*M1)/5._dp +             & 
&  6*g2p2*M2 + 4*gpp2*M4*Qep2 + 4*gpp2*M4*QHdp2 + 4*gpp2*M4*Qlp2 + 6._dp*(TradjYdTd)     & 
&  + 2._dp*(TradjYeTe) + 2*Conjg(lam)*Tlam)

 
 
If (TwoLoopRGE) Then 
betaTe2 = -5*Abslam*TeadjYeYe - (6*g1p2*TeadjYeYe)/5._dp + 12*g2p2*TeadjYeYe - 6*gpp2*Qep2*TeadjYeYe +& 
&  10*gpp2*QHdp2*TeadjYeYe + 6*gpp2*Qlp2*TeadjYeYe - 6._dp*(TeadjYeYeadjYeYe) -          & 
&  Abslam*TeCYvTpYv + 2*gpp2*QHup2*TeCYvTpYv - 2*gpp2*Qlp2*TeCYvTpYv + 2*gpp2*Qvp2*TeCYvTpYv -& 
&  4._dp*(TeCYvTpYvadjYeYe) - 2._dp*(TeCYvTpYvCYvTpYv) - 15*TeadjYeYe*TrYdadjYd -        & 
&  5*TeadjYeYe*TrYeadjYe - 3*TeCYvTpYv*TrYuadjYu - TeCYvTpYv*TrYvadjYv - 4*Abslam*YeadjYeTe +& 
&  (6*g1p2*YeadjYeTe)/5._dp + 6*g2p2*YeadjYeTe + 8*gpp2*QHdp2*YeadjYeTe - 12*TrYdadjYd*YeadjYeTe -& 
&  4*TrYeadjYe*YeadjYeTe - 8._dp*(YeadjYeTeadjYeYe) - 6._dp*(YeadjYeYeadjYeTe) -         & 
&  2*Abslam*YeCYvTpTv + 4*gpp2*QHup2*YeCYvTpTv - 4*gpp2*Qlp2*YeCYvTpTv + 4*gpp2*Qvp2*YeCYvTpTv -& 
&  6*TrYuadjYu*YeCYvTpTv - 2*TrYvadjYv*YeCYvTpTv - 4._dp*(YeCYvTpTvadjYeYe) -            & 
&  4._dp*(YeCYvTpTvCYvTpYv) - 4*gpp2*M4*QHup2*YeCYvTpYv + 4*gpp2*M4*Qlp2*YeCYvTpYv -     & 
&  4*gpp2*M4*Qvp2*YeCYvTpYv - 6*TradjYuTu*YeCYvTpYv - 2*TradjYvTv*YeCYvTpYv -            & 
&  2._dp*(YeCYvTpYvadjYeTe) - 4._dp*(YeCYvTpYvCYvTpTv) + (27*g1p4*Te)/2._dp +            & 
&  (9*g1p2*g2p2*Te)/5._dp + (15*g2p4*Te)/2._dp - 3*Clamp2*lamp2*Te + (36*g1p2*gpp2*Qd*Qe*Te)/5._dp +& 
&  12*g1p2*gpp2*Qep2*Te + 18*gpp4*Qdp2*Qep2*Te + 10*gpp4*Qep4*Te - (18*g1p2*gpp2*Qd*QHd*Te)/5._dp -& 
&  6*g1p2*gpp2*Qe*QHd*Te - 2*Abslam*gpp2*QHdp2*Te + (12*g1p2*gpp2*QHdp2*Te)/5._dp +      & 
&  6*g2p2*gpp2*QHdp2*Te + 18*gpp4*Qdp2*QHdp2*Te + 10*gpp4*Qep2*QHdp2*Te + 8*gpp4*QHdp4*Te +& 
&  (12*g1p2*gpp2*Qe*QHu*Te)/5._dp - (6*g1p2*gpp2*QHd*QHu*Te)/5._dp + 2*Abslam*gpp2*QHup2*Te +& 
&  4*gpp4*Qep2*QHup2*Te + 4*gpp4*QHdp2*QHup2*Te - (18*g1p2*gpp2*Qd*Ql*Te)/5._dp -        & 
&  (54*g1p2*gpp2*Qe*Ql*Te)/5._dp + (24*g1p2*gpp2*QHd*Ql*Te)/5._dp - (6*g1p2*gpp2*QHu*Ql*Te)/5._dp +& 
&  (24*g1p2*gpp2*Qlp2*Te)/5._dp + 6*g2p2*gpp2*Qlp2*Te + 18*gpp4*Qdp2*Qlp2*Te +           & 
&  18*gpp4*Qep2*Qlp2*Te + 16*gpp4*QHdp2*Qlp2*Te + 4*gpp4*QHup2*Qlp2*Te + 16*gpp4*Qlp4*Te  
betaTe2 =  betaTe2+ (36*g1p2*gpp2*Qe*Qq*Te)/5._dp - (18*g1p2*gpp2*QHd*Qq*Te)/5._dp - (18*g1p2*gpp2*Ql*Qq*Te)/5._dp +& 
&  36*gpp4*Qep2*Qqp2*Te + 36*gpp4*QHdp2*Qqp2*Te + 36*gpp4*Qlp2*Qqp2*Te + 2*gpp4*Qep2*Qs1p2*Te +& 
&  2*gpp4*QHdp2*Qs1p2*Te + 2*gpp4*Qlp2*Qs1p2*Te + 2*gpp4*Qep2*Qs2p2*Te + 2*gpp4*QHdp2*Qs2p2*Te +& 
&  2*gpp4*Qlp2*Qs2p2*Te + 2*gpp4*Qep2*Qs3p2*Te + 2*gpp4*QHdp2*Qs3p2*Te + 2*gpp4*Qlp2*Qs3p2*Te +& 
&  2*Abslam*gpp2*Qsp2*Te + 2*gpp4*Qep2*Qsp2*Te + 2*gpp4*QHdp2*Qsp2*Te + 2*gpp4*Qlp2*Qsp2*Te -& 
&  (72*g1p2*gpp2*Qe*Qu*Te)/5._dp + (36*g1p2*gpp2*QHd*Qu*Te)/5._dp + (36*g1p2*gpp2*Ql*Qu*Te)/5._dp +& 
&  18*gpp4*Qep2*Qup2*Te + 18*gpp4*QHdp2*Qup2*Te + 18*gpp4*Qlp2*Qup2*Te + 6*gpp4*Qep2*Qvp2*Te +& 
&  6*gpp4*QHdp2*Qvp2*Te + 6*gpp4*Qlp2*Qvp2*Te - (2*g1p2*TrYdadjYd*Te)/5._dp +            & 
&  16*g3p2*TrYdadjYd*Te + 6*gpp2*Qdp2*TrYdadjYd*Te - 6*gpp2*QHdp2*TrYdadjYd*Te +         & 
&  6*gpp2*Qqp2*TrYdadjYd*Te - 9*TrYdadjYdYdadjYd*Te - 3*TrYdadjYuYuadjYd*Te +            & 
&  (6*g1p2*TrYeadjYe*Te)/5._dp + 2*gpp2*Qep2*TrYeadjYe*Te - 2*gpp2*QHdp2*TrYeadjYe*Te +  & 
&  2*gpp2*Qlp2*TrYeadjYe*Te - 3*TrYeadjYeYeadjYe*Te - 3*Abslam*TrYuadjYu*Te -            & 
&  Abslam*TrYvadjYv*Te - TrYvadjYvTpYeCYe*Te - 2*YeCYvTpYv*Conjg(lam)*Tlam -             & 
&  2*YeadjYeYe*(6*g2p2*M2 - 2*gpp2*M4*Qep2 + 6*gpp2*M4*QHdp2 + 2*gpp2*M4*Qlp2 +          & 
&  9._dp*(TradjYdTd) + 3._dp*(TradjYeTe) + 3*Conjg(lam)*Tlam) - (2*Ye*(135*g1p4*M1 +     & 
&  9*g1p2*g2p2*M1 + 9*g1p2*g2p2*M2 + 75*g2p4*M2 + 36*g1p2*gpp2*M1*Qd*Qe + 36*g1p2*gpp2*M4*Qd*Qe +& 
&  60*g1p2*gpp2*M1*Qep2 + 60*g1p2*gpp2*M4*Qep2 + 180*gpp4*M4*Qdp2*Qep2 + 100*gpp4*M4*Qep4 -& 
&  18*g1p2*gpp2*M1*Qd*QHd - 18*g1p2*gpp2*M4*Qd*QHd - 30*g1p2*gpp2*M1*Qe*QHd -            & 
&  30*g1p2*gpp2*M4*Qe*QHd + 12*g1p2*gpp2*M1*QHdp2 + 12*g1p2*gpp2*M4*QHdp2 +              & 
&  30*g2p2*gpp2*M4*QHdp2 + 30*g2p2*gpp2*M2*QHdp2 + 180*gpp4*M4*Qdp2*QHdp2 +              & 
&  100*gpp4*M4*Qep2*QHdp2 + 80*gpp4*M4*QHdp4 + 12*g1p2*gpp2*M1*Qe*QHu + 12*g1p2*gpp2*M4*Qe*QHu -& 
&  6*g1p2*gpp2*M1*QHd*QHu - 6*g1p2*gpp2*M4*QHd*QHu + 40*gpp4*M4*Qep2*QHup2 +             & 
&  40*gpp4*M4*QHdp2*QHup2 - 18*g1p2*gpp2*M1*Qd*Ql - 18*g1p2*gpp2*M4*Qd*Ql -              & 
&  54*g1p2*gpp2*M1*Qe*Ql - 54*g1p2*gpp2*M4*Qe*Ql + 24*g1p2*gpp2*M1*QHd*Ql +              & 
&  24*g1p2*gpp2*M4*QHd*Ql - 6*g1p2*gpp2*M1*QHu*Ql - 6*g1p2*gpp2*M4*QHu*Ql +              & 
&  24*g1p2*gpp2*M1*Qlp2 + 24*g1p2*gpp2*M4*Qlp2 + 30*g2p2*gpp2*M4*Qlp2 + 30*g2p2*gpp2*M2*Qlp2 +& 
&  180*gpp4*M4*Qdp2*Qlp2 + 180*gpp4*M4*Qep2*Qlp2 + 160*gpp4*M4*QHdp2*Qlp2 +              & 
&  40*gpp4*M4*QHup2*Qlp2 + 160*gpp4*M4*Qlp4 + 36*g1p2*gpp2*M1*Qe*Qq + 36*g1p2*gpp2*M4*Qe*Qq -& 
&  18*g1p2*gpp2*M1*QHd*Qq - 18*g1p2*gpp2*M4*QHd*Qq - 18*g1p2*gpp2*M1*Ql*Qq -             & 
&  18*g1p2*gpp2*M4*Ql*Qq + 360*gpp4*M4*Qep2*Qqp2 + 360*gpp4*M4*QHdp2*Qqp2 +              & 
&  360*gpp4*M4*Qlp2*Qqp2 + 20*gpp4*M4*Qep2*Qs1p2 + 20*gpp4*M4*QHdp2*Qs1p2 +              & 
&  20*gpp4*M4*Qlp2*Qs1p2 + 20*gpp4*M4*Qep2*Qs2p2 + 20*gpp4*M4*QHdp2*Qs2p2 +              & 
&  20*gpp4*M4*Qlp2*Qs2p2 + 20*gpp4*M4*Qep2*Qs3p2 + 20*gpp4*M4*QHdp2*Qs3p2 +              & 
&  20*gpp4*M4*Qlp2*Qs3p2 + 20*gpp4*M4*Qep2*Qsp2 + 20*gpp4*M4*QHdp2*Qsp2 + 20*gpp4*M4*Qlp2*Qsp2 -& 
&  72*g1p2*gpp2*M1*Qe*Qu - 72*g1p2*gpp2*M4*Qe*Qu + 36*g1p2*gpp2*M1*QHd*Qu +              & 
&  36*g1p2*gpp2*M4*QHd*Qu + 36*g1p2*gpp2*M1*Ql*Qu + 36*g1p2*gpp2*M4*Ql*Qu +              & 
&  180*gpp4*M4*Qep2*Qup2 + 180*gpp4*M4*QHdp2*Qup2 + 180*gpp4*M4*Qlp2*Qup2 +              & 
&  60*gpp4*M4*Qep2*Qvp2 + 60*gpp4*M4*QHdp2*Qvp2 + 60*gpp4*M4*Qlp2*Qvp2 + 2*g1p2*TradjYdTd -& 
&  80*g3p2*TradjYdTd - 30*gpp2*Qdp2*TradjYdTd + 30*gpp2*QHdp2*TradjYdTd - 30*gpp2*Qqp2*TradjYdTd -& 
&  6*g1p2*TradjYeTe - 10*gpp2*Qep2*TradjYeTe + 10*gpp2*QHdp2*TradjYeTe - 10*gpp2*Qlp2*TradjYeTe +& 
&  5._dp*(TradjYeTeCYvTpYv) + 5._dp*(TradjYvTpYeCYeTv) + (-2*g1p2*M1 + 80*g3p2*M3 +      & 
&  30*gpp2*M4*(Qdp2 - QHdp2 + Qqp2))*TrYdadjYd + 90._dp*(TrYdadjYdTdadjYd) +             & 
&  15._dp*(TrYdadjYuTuadjYd) + 6*g1p2*M1*TrYeadjYe + 10*gpp2*M4*Qep2*TrYeadjYe -         & 
&  10*gpp2*M4*QHdp2*TrYeadjYe + 10*gpp2*M4*Qlp2*TrYeadjYe + 30._dp*(TrYeadjYeTeadjYe) +  & 
&  15._dp*(TrYuadjYdTdadjYu) + 30*Clamp2*lam*Tlam - 5*Conjg(lam)*((2*gpp2*M4*(QHdp2 -    & 
&  QHup2 - Qsp2) - 3._dp*(TradjYuTu) - TradjYvTv)*lam - (2*gpp2*(QHdp2 - QHup2 -         & 
&  Qsp2) + 3._dp*(TrYuadjYu) + TrYvadjYv)*Tlam)))/5._dp

 
DTe = oo16pi2*( betaTe1 + oo16pi2 * betaTe2 ) 

 
Else 
DTe = oo16pi2* betaTe1 
End If 
 
 
Call Chop(DTe) 

!-------------------- 
! Tlam 
!-------------------- 
 
betaTlam1  = (2*(3*g1p2*M1 + 15*g2p2*M2 + 10*gpp2*M4*QHdp2 + 10*gpp2*M4*QHup2 +       & 
&  10*gpp2*M4*Qsp2 + 15._dp*(TradjYdTd) + 5._dp*(TradjYeTe) + 15._dp*(TradjYuTu)         & 
&  + 5._dp*(TradjYvTv))*lam)/5._dp + (12._dp*(Abslam) - 3._dp*(g1p2)/5._dp -             & 
&  3._dp*(g2p2) - 2*gpp2*QHdp2 - 2*gpp2*QHup2 - 2*gpp2*Qsp2 + 3._dp*(TrYdadjYd)          & 
&  + TrYeadjYe + 3._dp*(TrYuadjYu) + TrYvadjYv)*Tlam

 
 
If (TwoLoopRGE) Then 
betaTlam2 = (-2*(207*g1p4*M1 + 45*g1p2*g2p2*M1 + 45*g1p2*g2p2*M2 + 375*g2p4*M2 - 90*g1p2*gpp2*M1*Qd*QHd -& 
&  90*g1p2*gpp2*M4*Qd*QHd - 90*g1p2*gpp2*M1*Qe*QHd - 90*g1p2*gpp2*M4*Qe*QHd +            & 
&  60*g1p2*gpp2*M1*QHdp2 + 60*g1p2*gpp2*M4*QHdp2 + 150*g2p2*gpp2*M4*QHdp2 +              & 
&  150*g2p2*gpp2*M2*QHdp2 + 900*gpp4*M4*Qdp2*QHdp2 + 300*gpp4*M4*Qep2*QHdp2 +            & 
&  400*gpp4*M4*QHdp4 + 90*g1p2*gpp2*M1*Qd*QHu + 90*g1p2*gpp2*M4*Qd*QHu + 90*g1p2*gpp2*M1*Qe*QHu +& 
&  90*g1p2*gpp2*M4*Qe*QHu - 60*g1p2*gpp2*M1*QHd*QHu - 60*g1p2*gpp2*M4*QHd*QHu +          & 
&  60*g1p2*gpp2*M1*QHup2 + 60*g1p2*gpp2*M4*QHup2 + 150*g2p2*gpp2*M4*QHup2 +              & 
&  150*g2p2*gpp2*M2*QHup2 + 900*gpp4*M4*Qdp2*QHup2 + 300*gpp4*M4*Qep2*QHup2 +            & 
&  400*gpp4*M4*QHdp2*QHup2 + 400*gpp4*M4*QHup4 + 90*g1p2*gpp2*M1*QHd*Ql + 90*g1p2*gpp2*M4*QHd*Ql -& 
&  90*g1p2*gpp2*M1*QHu*Ql - 90*g1p2*gpp2*M4*QHu*Ql + 600*gpp4*M4*QHdp2*Qlp2 +            & 
&  600*gpp4*M4*QHup2*Qlp2 - 90*g1p2*gpp2*M1*QHd*Qq - 90*g1p2*gpp2*M4*QHd*Qq +            & 
&  90*g1p2*gpp2*M1*QHu*Qq + 90*g1p2*gpp2*M4*QHu*Qq + 1800*gpp4*M4*QHdp2*Qqp2 +           & 
&  1800*gpp4*M4*QHup2*Qqp2 + 100*gpp4*M4*QHdp2*Qs1p2 + 100*gpp4*M4*QHup2*Qs1p2 +         & 
&  100*gpp4*M4*QHdp2*Qs2p2 + 100*gpp4*M4*QHup2*Qs2p2 + 100*gpp4*M4*QHdp2*Qs3p2 +         & 
&  100*gpp4*M4*QHup2*Qs3p2 + 900*gpp4*M4*Qdp2*Qsp2 + 300*gpp4*M4*Qep2*Qsp2 +             & 
&  300*gpp4*M4*QHdp2*Qsp2 + 300*gpp4*M4*QHup2*Qsp2 + 600*gpp4*M4*Qlp2*Qsp2 +             & 
&  1800*gpp4*M4*Qqp2*Qsp2 + 100*gpp4*M4*Qs1p2*Qsp2 + 100*gpp4*M4*Qs2p2*Qsp2 +            & 
&  100*gpp4*M4*Qs3p2*Qsp2 + 300*gpp4*M4*Qsp4 + 180*g1p2*gpp2*M1*QHd*Qu + 180*g1p2*gpp2*M4*QHd*Qu -& 
&  180*g1p2*gpp2*M1*QHu*Qu - 180*g1p2*gpp2*M4*QHu*Qu + 900*gpp4*M4*QHdp2*Qup2 +          & 
&  900*gpp4*M4*QHup2*Qup2 + 900*gpp4*M4*Qsp2*Qup2 + 300*gpp4*M4*QHdp2*Qvp2 +             & 
&  300*gpp4*M4*QHup2*Qvp2 + 300*gpp4*M4*Qsp2*Qvp2 + 10*g1p2*TradjYdTd - 400*g3p2*TradjYdTd -& 
&  150*gpp2*Qdp2*TradjYdTd + 150*gpp2*QHdp2*TradjYdTd - 150*gpp2*Qqp2*TradjYdTd -        & 
&  30*g1p2*TradjYeTe - 50*gpp2*Qep2*TradjYeTe + 50*gpp2*QHdp2*TradjYeTe - 50*gpp2*Qlp2*TradjYeTe +& 
&  50._dp*(TradjYeTeCYvTpYv) - 20*g1p2*TradjYuTu - 400*g3p2*TradjYuTu + 150*gpp2*QHup2*TradjYuTu -& 
&  150*gpp2*Qqp2*TradjYuTu - 150*gpp2*Qup2*TradjYuTu + 50._dp*(TradjYvTpYeCYeTv) +       & 
&  50*gpp2*QHup2*TradjYvTv - 50*gpp2*Qlp2*TradjYvTv - 50*gpp2*Qvp2*TradjYvTv -           & 
&  10*(g1p2*M1 - 5*(8*g3p2*M3 + 3*gpp2*M4*(Qdp2 - QHdp2 + Qqp2)))*TrYdadjYd +            & 
&  450._dp*(TrYdadjYdTdadjYd) + 150._dp*(TrYdadjYuTuadjYd) + 10*(3*g1p2*M1 +             & 
&  5*gpp2*M4*(Qep2 - QHdp2 + Qlp2))*TrYeadjYe + 150._dp*(TrYeadjYeTeadjYe) +             & 
&  150._dp*(TrYuadjYdTdadjYu) + 20*g1p2*M1*TrYuadjYu + 400*g3p2*M3*TrYuadjYu -           & 
&  150*gpp2*M4*QHup2*TrYuadjYu + 150*gpp2*M4*Qqp2*TrYuadjYu + 150*gpp2*M4*Qup2*TrYuadjYu +& 
&  450._dp*(TrYuadjYuTuadjYu) - 50*gpp2*M4*QHup2*TrYvadjYv + 50*gpp2*M4*Qlp2*TrYvadjYv + & 
&  50*gpp2*M4*Qvp2*TrYvadjYv + 150._dp*(TrYvadjYvTvadjYv))*lam)/25._dp - 50*Clamp2*lamp2*Tlam  
betaTlam2 =  betaTlam2+ (207._dp*(g1p4)/50._dp + (9*g1p2*g2p2)/5._dp + 15._dp*(g2p4)/2._dp - (18*g1p2*gpp2*Qd*QHd)/5._dp -& 
&  (18*g1p2*gpp2*Qe*QHd)/5._dp + (12*g1p2*gpp2*QHdp2)/5._dp + 6*g2p2*gpp2*QHdp2 +        & 
&  18*gpp4*Qdp2*QHdp2 + 6*gpp4*Qep2*QHdp2 + 8*gpp4*QHdp4 + (18*g1p2*gpp2*Qd*QHu)/5._dp + & 
&  (18*g1p2*gpp2*Qe*QHu)/5._dp - (12*g1p2*gpp2*QHd*QHu)/5._dp + (12*g1p2*gpp2*QHup2)/5._dp +& 
&  6*g2p2*gpp2*QHup2 + 18*gpp4*Qdp2*QHup2 + 6*gpp4*Qep2*QHup2 + 8*gpp4*QHdp2*QHup2 +     & 
&  8*gpp4*QHup4 + (18*g1p2*gpp2*QHd*Ql)/5._dp - (18*g1p2*gpp2*QHu*Ql)/5._dp +            & 
&  12*gpp4*QHdp2*Qlp2 + 12*gpp4*QHup2*Qlp2 - (18*g1p2*gpp2*QHd*Qq)/5._dp +               & 
&  (18*g1p2*gpp2*QHu*Qq)/5._dp + 36*gpp4*QHdp2*Qqp2 + 36*gpp4*QHup2*Qqp2 +               & 
&  2*gpp4*QHdp2*Qs1p2 + 2*gpp4*QHup2*Qs1p2 + 2*gpp4*QHdp2*Qs2p2 + 2*gpp4*QHup2*Qs2p2 +   & 
&  2*gpp4*QHdp2*Qs3p2 + 2*gpp4*QHup2*Qs3p2 + 18*gpp4*Qdp2*Qsp2 + 6*gpp4*Qep2*Qsp2 +      & 
&  6*gpp4*QHdp2*Qsp2 + 6*gpp4*QHup2*Qsp2 + 12*gpp4*Qlp2*Qsp2 + 36*gpp4*Qqp2*Qsp2 +       & 
&  2*gpp4*Qs1p2*Qsp2 + 2*gpp4*Qs2p2*Qsp2 + 2*gpp4*Qs3p2*Qsp2 + 6*gpp4*Qsp4 +             & 
&  (36*g1p2*gpp2*QHd*Qu)/5._dp - (36*g1p2*gpp2*QHu*Qu)/5._dp + 18*gpp4*QHdp2*Qup2 +      & 
&  18*gpp4*QHup2*Qup2 + 18*gpp4*Qsp2*Qup2 + 6*gpp4*QHdp2*Qvp2 + 6*gpp4*QHup2*Qvp2 +      & 
&  6*gpp4*Qsp2*Qvp2 - (2*(g1p2 - 5*(8._dp*(g3p2) + 3*gpp2*(Qdp2 - QHdp2 + Qqp2)))*TrYdadjYd)/5._dp -& 
&  9._dp*(TrYdadjYdYdadjYd) - 6._dp*(TrYdadjYuYuadjYd) + (2*(3._dp*(g1p2) +              & 
&  5*gpp2*(Qep2 - QHdp2 + Qlp2))*TrYeadjYe)/5._dp - 3._dp*(TrYeadjYeYeadjYe) +           & 
&  (4*g1p2*TrYuadjYu)/5._dp + 16*g3p2*TrYuadjYu - 6*gpp2*QHup2*TrYuadjYu +               & 
&  6*gpp2*Qqp2*TrYuadjYu + 6*gpp2*Qup2*TrYuadjYu - 9._dp*(TrYuadjYuYuadjYu) -            & 
&  2*gpp2*QHup2*TrYvadjYv + 2*gpp2*Qlp2*TrYvadjYv + 2*gpp2*Qvp2*TrYvadjYv -              & 
&  2._dp*(TrYvadjYvTpYeCYe) - 3._dp*(TrYvadjYvYvadjYv))*Tlam - (Abslam*(2*(6*g1p2*M1 +   & 
&  30*g2p2*M2 + 20*gpp2*M4*QHdp2 + 20*gpp2*M4*QHup2 + 45._dp*(TradjYdTd) +               & 
&  15._dp*(TradjYeTe) + 45._dp*(TradjYuTu) + 15._dp*(TradjYvTv))*lam - 3*(6._dp*(g1p2) + & 
&  30._dp*(g2p2) + 20*gpp2*QHdp2 + 20*gpp2*QHup2 - 45._dp*(TrYdadjYd) - 15._dp*(TrYeadjYe) -& 
&  45._dp*(TrYuadjYu) - 15._dp*(TrYvadjYv))*Tlam))/5._dp

 
DTlam = oo16pi2*( betaTlam1 + oo16pi2 * betaTlam2 ) 

 
Else 
DTlam = oo16pi2* betaTlam1 
End If 
 
 
Call Chop(DTlam) 

!-------------------- 
! Tv 
!-------------------- 
 
betaTv1  = 2._dp*(TpTeCYeYv) + TpYeCYeTv + 4._dp*(TvadjYvYv) + 5._dp*(YvadjYvTv)      & 
&  + Abslam*Tv - (3*g1p2*Tv)/5._dp - 3*g2p2*Tv - 2*gpp2*QHup2*Tv - 2*gpp2*Qlp2*Tv -      & 
&  2*gpp2*Qvp2*Tv + 3*TrYuadjYu*Tv + TrYvadjYv*Tv + Yv*((6*g1p2*M1)/5._dp +              & 
&  6*g2p2*M2 + 4*gpp2*M4*QHup2 + 4*gpp2*M4*Qlp2 + 4*gpp2*M4*Qvp2 + 6._dp*(TradjYuTu)     & 
&  + 2._dp*(TradjYvTv) + 2*Conjg(lam)*Tlam)

 
 
If (TwoLoopRGE) Then 
betaTv2 = -4._dp*(TpTeCYeTpYeCYeYv) - 2*Abslam*TpTeCYeYv + (12*g1p2*TpTeCYeYv)/5._dp +          & 
&  4*gpp2*Qep2*TpTeCYeYv + 4*gpp2*QHdp2*TpTeCYeYv - 4*gpp2*Qlp2*TpTeCYeYv -              & 
&  4._dp*(TpYeCYeTpTeCYeYv) - 2._dp*(TpYeCYeTpYeCYeTv) - Abslam*TpYeCYeTv +              & 
&  (6*g1p2*TpYeCYeTv)/5._dp + 2*gpp2*Qep2*TpYeCYeTv + 2*gpp2*QHdp2*TpYeCYeTv -           & 
&  2*gpp2*Qlp2*TpYeCYeTv - (12*g1p2*M1*TpYeCYeYv)/5._dp - 4*gpp2*M4*Qep2*TpYeCYeYv -     & 
&  4*gpp2*M4*QHdp2*TpYeCYeYv + 4*gpp2*M4*Qlp2*TpYeCYeYv - 6*TpYeCYeYv*TradjYdTd -        & 
&  2*TpYeCYeYv*TradjYeTe - 6*TpTeCYeYv*TrYdadjYd - 3*TpYeCYeTv*TrYdadjYd -               & 
&  2*TpTeCYeYv*TrYeadjYe - TpYeCYeTv*TrYeadjYe - 2._dp*(TvadjYvTpYeCYeYv) -              & 
&  4*Abslam*TvadjYvYv + (6*g1p2*TvadjYvYv)/5._dp + 6*g2p2*TvadjYvYv + 8*gpp2*QHup2*TvadjYvYv -& 
&  12*TrYuadjYu*TvadjYvYv - 4*TrYvadjYv*TvadjYvYv - 6._dp*(TvadjYvYvadjYvYv) -           & 
&  4._dp*(YvadjYvTpTeCYeYv) - 4._dp*(YvadjYvTpYeCYeTv) - 5*Abslam*YvadjYvTv +            & 
&  (12*g1p2*YvadjYvTv)/5._dp + 12*g2p2*YvadjYvTv + 10*gpp2*QHup2*YvadjYvTv +             & 
&  6*gpp2*Qlp2*YvadjYvTv - 6*gpp2*Qvp2*YvadjYvTv - 15*TrYuadjYu*YvadjYvTv -              & 
&  5*TrYvadjYv*YvadjYvTv - 8._dp*(YvadjYvTvadjYvYv) - 6._dp*(YvadjYvYvadjYvTv) +         & 
&  (207*g1p4*Tv)/50._dp + (9*g1p2*g2p2*Tv)/5._dp + (15*g2p4*Tv)/2._dp - 3*Clamp2*lamp2*Tv +& 
&  2*Abslam*gpp2*QHdp2*Tv + (18*g1p2*gpp2*Qd*QHu*Tv)/5._dp + (18*g1p2*gpp2*Qe*QHu*Tv)/5._dp -& 
&  (6*g1p2*gpp2*QHd*QHu*Tv)/5._dp - 2*Abslam*gpp2*QHup2*Tv + (12*g1p2*gpp2*QHup2*Tv)/5._dp +& 
&  6*g2p2*gpp2*QHup2*Tv + 18*gpp4*Qdp2*QHup2*Tv + 6*gpp4*Qep2*QHup2*Tv + 4*gpp4*QHdp2*QHup2*Tv +& 
&  8*gpp4*QHup4*Tv - (18*g1p2*gpp2*Qd*Ql*Tv)/5._dp - (18*g1p2*gpp2*Qe*Ql*Tv)/5._dp +     & 
&  (6*g1p2*gpp2*QHd*Ql*Tv)/5._dp - (24*g1p2*gpp2*QHu*Ql*Tv)/5._dp + (24*g1p2*gpp2*Qlp2*Tv)/5._dp +& 
&  6*g2p2*gpp2*Qlp2*Tv + 18*gpp4*Qdp2*Qlp2*Tv + 6*gpp4*Qep2*Qlp2*Tv + 4*gpp4*QHdp2*Qlp2*Tv  
betaTv2 =  betaTv2+ 16*gpp4*QHup2*Qlp2*Tv + 16*gpp4*Qlp4*Tv + (18*g1p2*gpp2*QHu*Qq*Tv)/5._dp -            & 
&  (18*g1p2*gpp2*Ql*Qq*Tv)/5._dp + 36*gpp4*QHup2*Qqp2*Tv + 36*gpp4*Qlp2*Qqp2*Tv +        & 
&  2*gpp4*QHup2*Qs1p2*Tv + 2*gpp4*Qlp2*Qs1p2*Tv + 2*gpp4*QHup2*Qs2p2*Tv + 2*gpp4*Qlp2*Qs2p2*Tv +& 
&  2*gpp4*QHup2*Qs3p2*Tv + 2*gpp4*Qlp2*Qs3p2*Tv + 2*Abslam*gpp2*Qsp2*Tv + 2*gpp4*QHup2*Qsp2*Tv +& 
&  2*gpp4*Qlp2*Qsp2*Tv - (36*g1p2*gpp2*QHu*Qu*Tv)/5._dp + (36*g1p2*gpp2*Ql*Qu*Tv)/5._dp +& 
&  18*gpp4*QHup2*Qup2*Tv + 18*gpp4*Qlp2*Qup2*Tv + 18*gpp4*Qdp2*Qvp2*Tv + 6*gpp4*Qep2*Qvp2*Tv +& 
&  4*gpp4*QHdp2*Qvp2*Tv + 10*gpp4*QHup2*Qvp2*Tv + 18*gpp4*Qlp2*Qvp2*Tv + 36*gpp4*Qqp2*Qvp2*Tv +& 
&  2*gpp4*Qs1p2*Qvp2*Tv + 2*gpp4*Qs2p2*Qvp2*Tv + 2*gpp4*Qs3p2*Qvp2*Tv + 2*gpp4*Qsp2*Qvp2*Tv +& 
&  18*gpp4*Qup2*Qvp2*Tv + 10*gpp4*Qvp4*Tv - 3*Abslam*TrYdadjYd*Tv - 3*TrYdadjYuYuadjYd*Tv -& 
&  Abslam*TrYeadjYe*Tv + (4*g1p2*TrYuadjYu*Tv)/5._dp + 16*g3p2*TrYuadjYu*Tv -            & 
&  6*gpp2*QHup2*TrYuadjYu*Tv + 6*gpp2*Qqp2*TrYuadjYu*Tv + 6*gpp2*Qup2*TrYuadjYu*Tv -     & 
&  9*TrYuadjYuYuadjYu*Tv - 2*gpp2*QHup2*TrYvadjYv*Tv + 2*gpp2*Qlp2*TrYvadjYv*Tv +        & 
&  2*gpp2*Qvp2*TrYvadjYv*Tv - TrYvadjYvTpYeCYe*Tv - 3*TrYvadjYvYvadjYv*Tv -              & 
&  2*TpYeCYeYv*Conjg(lam)*Tlam - (2*YvadjYvYv*(6*g1p2*M1 + 30*g2p2*M2 + 30*gpp2*M4*QHup2 +& 
&  10*gpp2*M4*Qlp2 - 10*gpp2*M4*Qvp2 + 45._dp*(TradjYuTu) + 15._dp*(TradjYvTv) +         & 
&  15*Conjg(lam)*Tlam))/5._dp - (2*Yv*(207*g1p4*M1 + 45*g1p2*g2p2*M1 + 45*g1p2*g2p2*M2 + & 
&  375*g2p4*M2 + 90*g1p2*gpp2*M1*Qd*QHu + 90*g1p2*gpp2*M4*Qd*QHu + 90*g1p2*gpp2*M1*Qe*QHu +& 
&  90*g1p2*gpp2*M4*Qe*QHu - 30*g1p2*gpp2*M1*QHd*QHu - 30*g1p2*gpp2*M4*QHd*QHu +          & 
&  60*g1p2*gpp2*M1*QHup2 + 60*g1p2*gpp2*M4*QHup2 + 150*g2p2*gpp2*M4*QHup2 +              & 
&  150*g2p2*gpp2*M2*QHup2 + 900*gpp4*M4*Qdp2*QHup2 + 300*gpp4*M4*Qep2*QHup2 +            & 
&  200*gpp4*M4*QHdp2*QHup2 + 400*gpp4*M4*QHup4 - 90*g1p2*gpp2*M1*Qd*Ql - 90*g1p2*gpp2*M4*Qd*Ql -& 
&  90*g1p2*gpp2*M1*Qe*Ql - 90*g1p2*gpp2*M4*Qe*Ql + 30*g1p2*gpp2*M1*QHd*Ql +              & 
&  30*g1p2*gpp2*M4*QHd*Ql - 120*g1p2*gpp2*M1*QHu*Ql - 120*g1p2*gpp2*M4*QHu*Ql +          & 
&  120*g1p2*gpp2*M1*Qlp2 + 120*g1p2*gpp2*M4*Qlp2 + 150*g2p2*gpp2*M4*Qlp2 +               & 
&  150*g2p2*gpp2*M2*Qlp2 + 900*gpp4*M4*Qdp2*Qlp2 + 300*gpp4*M4*Qep2*Qlp2 +               & 
&  200*gpp4*M4*QHdp2*Qlp2 + 800*gpp4*M4*QHup2*Qlp2 + 800*gpp4*M4*Qlp4 + 90*g1p2*gpp2*M1*QHu*Qq +& 
&  90*g1p2*gpp2*M4*QHu*Qq - 90*g1p2*gpp2*M1*Ql*Qq - 90*g1p2*gpp2*M4*Ql*Qq +              & 
&  1800*gpp4*M4*QHup2*Qqp2 + 1800*gpp4*M4*Qlp2*Qqp2 + 100*gpp4*M4*QHup2*Qs1p2 +          & 
&  100*gpp4*M4*Qlp2*Qs1p2 + 100*gpp4*M4*QHup2*Qs2p2 + 100*gpp4*M4*Qlp2*Qs2p2 +           & 
&  100*gpp4*M4*QHup2*Qs3p2 + 100*gpp4*M4*Qlp2*Qs3p2 + 100*gpp4*M4*QHup2*Qsp2 +           & 
&  100*gpp4*M4*Qlp2*Qsp2 - 180*g1p2*gpp2*M1*QHu*Qu - 180*g1p2*gpp2*M4*QHu*Qu +           & 
&  180*g1p2*gpp2*M1*Ql*Qu + 180*g1p2*gpp2*M4*Ql*Qu + 900*gpp4*M4*QHup2*Qup2 +            & 
&  900*gpp4*M4*Qlp2*Qup2 + 900*gpp4*M4*Qdp2*Qvp2 + 300*gpp4*M4*Qep2*Qvp2 +               & 
&  200*gpp4*M4*QHdp2*Qvp2 + 500*gpp4*M4*QHup2*Qvp2 + 900*gpp4*M4*Qlp2*Qvp2 +             & 
&  1800*gpp4*M4*Qqp2*Qvp2 + 100*gpp4*M4*Qs1p2*Qvp2 + 100*gpp4*M4*Qs2p2*Qvp2 +            & 
&  100*gpp4*M4*Qs3p2*Qvp2 + 100*gpp4*M4*Qsp2*Qvp2 + 900*gpp4*M4*Qup2*Qvp2 +              & 
&  500*gpp4*M4*Qvp4 + 25._dp*(TradjYeTeCYvTpYv) - 20*g1p2*TradjYuTu - 400*g3p2*TradjYuTu +& 
&  150*gpp2*QHup2*TradjYuTu - 150*gpp2*Qqp2*TradjYuTu - 150*gpp2*Qup2*TradjYuTu +        & 
&  25._dp*(TradjYvTpYeCYeTv) + 50*gpp2*QHup2*TradjYvTv - 50*gpp2*Qlp2*TradjYvTv -        & 
&  50*gpp2*Qvp2*TradjYvTv + 75._dp*(TrYdadjYuTuadjYd) + 75._dp*(TrYuadjYdTdadjYu) +      & 
&  10*(2*g1p2*M1 + 40*g3p2*M3 + 15*gpp2*M4*(-1._dp*(QHup2) + Qqp2 + Qup2))*TrYuadjYu +   & 
&  450._dp*(TrYuadjYuTuadjYu) - 50*gpp2*M4*QHup2*TrYvadjYv + 50*gpp2*M4*Qlp2*TrYvadjYv + & 
&  50*gpp2*M4*Qvp2*TrYvadjYv + 150._dp*(TrYvadjYvTvadjYv) + 150*Clamp2*lam*Tlam +        & 
&  25*Conjg(lam)*((2*gpp2*M4*(QHdp2 - QHup2 + Qsp2) + 3._dp*(TradjYdTd) + TradjYeTe)*lam +& 
&  (-2*gpp2*(QHdp2 - QHup2 + Qsp2) + 3._dp*(TrYdadjYd) + TrYeadjYe)*Tlam)))/25._dp

 
DTv = oo16pi2*( betaTv1 + oo16pi2 * betaTv2 ) 

 
Else 
DTv = oo16pi2* betaTv1 
End If 
 
 
Call Chop(DTv) 

!-------------------- 
! Tk 
!-------------------- 
 
betaTk1  = 4*gpp2*M4*(Qs1p2 + Qs2p2 + Qs3p2)*kap + (Abskap - 2*gpp2*(Qs1p2 +          & 
&  Qs2p2 + Qs3p2))*Tk

 
 
If (TwoLoopRGE) Then 
betaTk2 = (-2*Abskap*gpp2*(Qs1p2 + Qs2p2 + Qs3p2)*(2*M4*kap - 3*Tk))/9._dp - 2*gpp4*(2*QHdp2*Qs1p2 +& 
&  2*QHup2*Qs1p2 + 6*Qlp2*Qs1p2 + 18*Qqp2*Qs1p2 + 3._dp*(Qs1p4) + 2*QHdp2*Qs2p2 +        & 
&  2*QHup2*Qs2p2 + 6*Qlp2*Qs2p2 + 18*Qqp2*Qs2p2 + 2*Qs1p2*Qs2p2 + 3._dp*(Qs2p4) +        & 
&  2*QHdp2*Qs3p2 + 2*QHup2*Qs3p2 + 6*Qlp2*Qs3p2 + 18*Qqp2*Qs3p2 + 2*Qs1p2*Qs3p2 +        & 
&  2*Qs2p2*Qs3p2 + 9*Qdp2*(Qs1p2 + Qs2p2 + Qs3p2) + 3*Qep2*(Qs1p2 + Qs2p2 +              & 
&  Qs3p2) + 3._dp*(Qs3p4) + Qs1p2*Qsp2 + Qs2p2*Qsp2 + Qs3p2*Qsp2 + 9*Qs1p2*Qup2 +        & 
&  9*Qs2p2*Qup2 + 9*Qs3p2*Qup2 + 3*Qs1p2*Qvp2 + 3*Qs2p2*Qvp2 + 3*Qs3p2*Qvp2)*(4*M4*kap - & 
&  Tk) - (10*Ckapp2*kapp2*Tk)/27._dp

 
DTk = oo16pi2*( betaTk1 + oo16pi2 * betaTk2 ) 

 
Else 
DTk = oo16pi2* betaTk1 
End If 
 
 
Call Chop(DTk) 

!-------------------- 
! Tu 
!-------------------- 
 
betaTu1  = TuadjYdYd + 5._dp*(TuadjYuYu) + 2._dp*(YuadjYdTd) + 4._dp*(YuadjYuTu)      & 
&  + Abslam*Tu - (13*g1p2*Tu)/15._dp - 3*g2p2*Tu - (16*g3p2*Tu)/3._dp - 2*gpp2*QHup2*Tu -& 
&  2*gpp2*Qqp2*Tu - 2*gpp2*Qup2*Tu + 3*TrYuadjYu*Tu + TrYvadjYv*Tu + Yu*((26*g1p2*M1)    & 
& /15._dp + (32*g3p2*M3)/3._dp + 6*g2p2*M2 + 4*gpp2*M4*QHup2 + 4*gpp2*M4*Qqp2 +          & 
&  4*gpp2*M4*Qup2 + 6._dp*(TradjYuTu) + 2._dp*(TradjYvTv) + 2*Conjg(lam)*Tlam)

 
 
If (TwoLoopRGE) Then 
betaTu2 = -(Abslam*TuadjYdYd) + (2*g1p2*TuadjYdYd)/5._dp + 2*gpp2*Qdp2*TuadjYdYd +              & 
&  2*gpp2*QHdp2*TuadjYdYd - 2*gpp2*Qqp2*TuadjYdYd - 3*TrYdadjYd*TuadjYdYd -              & 
&  TrYeadjYe*TuadjYdYd - 2._dp*(TuadjYdYdadjYdYd) - 4._dp*(TuadjYdYdadjYuYu) -           & 
&  5*Abslam*TuadjYuYu + 12*g2p2*TuadjYuYu + 10*gpp2*QHup2*TuadjYuYu + 6*gpp2*Qqp2*TuadjYuYu -& 
&  6*gpp2*Qup2*TuadjYuYu - 15*TrYuadjYu*TuadjYuYu - 5*TrYvadjYv*TuadjYuYu -              & 
&  6._dp*(TuadjYuYuadjYuYu) - 2*Abslam*YuadjYdTd + (4*g1p2*YuadjYdTd)/5._dp +            & 
&  4*gpp2*Qdp2*YuadjYdTd + 4*gpp2*QHdp2*YuadjYdTd - 4*gpp2*Qqp2*YuadjYdTd -              & 
&  6*TrYdadjYd*YuadjYdTd - 2*TrYeadjYe*YuadjYdTd - 4._dp*(YuadjYdTdadjYdYd) -            & 
&  4._dp*(YuadjYdTdadjYuYu) - 4._dp*(YuadjYdYdadjYdTd) - 2._dp*(YuadjYdYdadjYuTu) -      & 
&  4*Abslam*YuadjYuTu + (6*g1p2*YuadjYuTu)/5._dp + 6*g2p2*YuadjYuTu + 8*gpp2*QHup2*YuadjYuTu -& 
&  12*TrYuadjYu*YuadjYuTu - 4*TrYvadjYv*YuadjYuTu - 8._dp*(YuadjYuTuadjYuYu) -           & 
&  (4*g1p2*M1*YuadjYuYu)/5._dp - 12*g2p2*M2*YuadjYuYu - 12*gpp2*M4*QHup2*YuadjYuYu -     & 
&  4*gpp2*M4*Qqp2*YuadjYuYu + 4*gpp2*M4*Qup2*YuadjYuYu - 18*TradjYuTu*YuadjYuYu -        & 
&  6*TradjYvTv*YuadjYuYu - 6._dp*(YuadjYuYuadjYuTu) + (2743*g1p4*Tu)/450._dp +           & 
&  g1p2*g2p2*Tu + (15*g2p4*Tu)/2._dp + (136*g1p2*g3p2*Tu)/45._dp + 8*g2p2*g3p2*Tu -      & 
&  (16*g3p4*Tu)/9._dp - 3*Clamp2*lamp2*Tu + 2*Abslam*gpp2*QHdp2*Tu + (18*g1p2*gpp2*Qd*QHu*Tu)/5._dp +& 
&  (18*g1p2*gpp2*Qe*QHu*Tu)/5._dp - (6*g1p2*gpp2*QHd*QHu*Tu)/5._dp - 2*Abslam*gpp2*QHup2*Tu +& 
&  (12*g1p2*gpp2*QHup2*Tu)/5._dp + 6*g2p2*gpp2*QHup2*Tu + 18*gpp4*Qdp2*QHup2*Tu +        & 
&  6*gpp4*Qep2*QHup2*Tu + 4*gpp4*QHdp2*QHup2*Tu + 8*gpp4*QHup4*Tu - (18*g1p2*gpp2*QHu*Ql*Tu)/5._dp +& 
&  12*gpp4*QHup2*Qlp2*Tu + (6*g1p2*gpp2*Qd*Qq*Tu)/5._dp + (6*g1p2*gpp2*Qe*Qq*Tu)/5._dp - & 
&  (2*g1p2*gpp2*QHd*Qq*Tu)/5._dp + 4*g1p2*gpp2*QHu*Qq*Tu - (6*g1p2*gpp2*Ql*Qq*Tu)/5._dp  
betaTu2 =  betaTu2+ (4*g1p2*gpp2*Qqp2*Tu)/3._dp + 6*g2p2*gpp2*Qqp2*Tu + (32*g3p2*gpp2*Qqp2*Tu)/3._dp +    & 
&  18*gpp4*Qdp2*Qqp2*Tu + 6*gpp4*Qep2*Qqp2*Tu + 4*gpp4*QHdp2*Qqp2*Tu + 40*gpp4*QHup2*Qqp2*Tu +& 
&  12*gpp4*Qlp2*Qqp2*Tu + 40*gpp4*Qqp4*Tu + 2*gpp4*QHup2*Qs1p2*Tu + 2*gpp4*Qqp2*Qs1p2*Tu +& 
&  2*gpp4*QHup2*Qs2p2*Tu + 2*gpp4*Qqp2*Qs2p2*Tu + 2*gpp4*QHup2*Qs3p2*Tu + 2*gpp4*Qqp2*Qs3p2*Tu +& 
&  2*Abslam*gpp2*Qsp2*Tu + 2*gpp4*QHup2*Qsp2*Tu + 2*gpp4*Qqp2*Qsp2*Tu - (24*g1p2*gpp2*Qd*Qu*Tu)/5._dp -& 
&  (24*g1p2*gpp2*Qe*Qu*Tu)/5._dp + (8*g1p2*gpp2*QHd*Qu*Tu)/5._dp - (44*g1p2*gpp2*QHu*Qu*Tu)/5._dp +& 
&  (24*g1p2*gpp2*Ql*Qu*Tu)/5._dp - (36*g1p2*gpp2*Qq*Qu*Tu)/5._dp + (176*g1p2*gpp2*Qup2*Tu)/15._dp +& 
&  (32*g3p2*gpp2*Qup2*Tu)/3._dp + 18*gpp4*Qdp2*Qup2*Tu + 6*gpp4*Qep2*Qup2*Tu +           & 
&  4*gpp4*QHdp2*Qup2*Tu + 22*gpp4*QHup2*Qup2*Tu + 12*gpp4*Qlp2*Qup2*Tu + 54*gpp4*Qqp2*Qup2*Tu +& 
&  2*gpp4*Qs1p2*Qup2*Tu + 2*gpp4*Qs2p2*Qup2*Tu + 2*gpp4*Qs3p2*Qup2*Tu + 2*gpp4*Qsp2*Qup2*Tu +& 
&  22*gpp4*Qup4*Tu + 6*gpp4*QHup2*Qvp2*Tu + 6*gpp4*Qqp2*Qvp2*Tu + 6*gpp4*Qup2*Qvp2*Tu -  & 
&  3*Abslam*TrYdadjYd*Tu - 3*TrYdadjYuYuadjYd*Tu - Abslam*TrYeadjYe*Tu + (4*g1p2*TrYuadjYu*Tu)/5._dp +& 
&  16*g3p2*TrYuadjYu*Tu - 6*gpp2*QHup2*TrYuadjYu*Tu + 6*gpp2*Qqp2*TrYuadjYu*Tu +         & 
&  6*gpp2*Qup2*TrYuadjYu*Tu - 9*TrYuadjYuYuadjYu*Tu - 2*gpp2*QHup2*TrYvadjYv*Tu +        & 
&  2*gpp2*Qlp2*TrYvadjYv*Tu + 2*gpp2*Qvp2*TrYvadjYv*Tu - TrYvadjYvTpYeCYe*Tu -           & 
&  3*TrYvadjYvYvadjYv*Tu - 6*YuadjYuYu*Conjg(lam)*Tlam + YuadjYdYd*((-4*g1p2*M1)/5._dp - & 
&  4*gpp2*M4*Qdp2 - 4*gpp2*M4*QHdp2 + 4*gpp2*M4*Qqp2 - 6._dp*(TradjYdTd) -               & 
&  2._dp*(TradjYeTe) - 2*Conjg(lam)*Tlam) - (2*Yu*(2743*g1p4*M1 + 225*g1p2*g2p2*M1 +     & 
&  680*g1p2*g3p2*M1 + 680*g1p2*g3p2*M3 + 1800*g2p2*g3p2*M3 - 800*g3p4*M3 +               & 
&  225*g1p2*g2p2*M2 + 3375*g2p4*M2 + 1800*g2p2*g3p2*M2 + 810*g1p2*gpp2*M1*Qd*QHu +       & 
&  810*g1p2*gpp2*M4*Qd*QHu + 810*g1p2*gpp2*M1*Qe*QHu + 810*g1p2*gpp2*M4*Qe*QHu -         & 
&  270*g1p2*gpp2*M1*QHd*QHu - 270*g1p2*gpp2*M4*QHd*QHu + 540*g1p2*gpp2*M1*QHup2 +        & 
&  540*g1p2*gpp2*M4*QHup2 + 1350*g2p2*gpp2*M4*QHup2 + 1350*g2p2*gpp2*M2*QHup2 +          & 
&  8100*gpp4*M4*Qdp2*QHup2 + 2700*gpp4*M4*Qep2*QHup2 + 1800*gpp4*M4*QHdp2*QHup2 +        & 
&  3600*gpp4*M4*QHup4 - 810*g1p2*gpp2*M1*QHu*Ql - 810*g1p2*gpp2*M4*QHu*Ql +              & 
&  5400*gpp4*M4*QHup2*Qlp2 + 270*g1p2*gpp2*M1*Qd*Qq + 270*g1p2*gpp2*M4*Qd*Qq +           & 
&  270*g1p2*gpp2*M1*Qe*Qq + 270*g1p2*gpp2*M4*Qe*Qq - 90*g1p2*gpp2*M1*QHd*Qq -            & 
&  90*g1p2*gpp2*M4*QHd*Qq + 900*g1p2*gpp2*M1*QHu*Qq + 900*g1p2*gpp2*M4*QHu*Qq -          & 
&  270*g1p2*gpp2*M1*Ql*Qq - 270*g1p2*gpp2*M4*Ql*Qq + 300*g1p2*gpp2*M1*Qqp2 +             & 
&  2400*g3p2*gpp2*M3*Qqp2 + 300*g1p2*gpp2*M4*Qqp2 + 1350*g2p2*gpp2*M4*Qqp2 +             & 
&  2400*g3p2*gpp2*M4*Qqp2 + 1350*g2p2*gpp2*M2*Qqp2 + 8100*gpp4*M4*Qdp2*Qqp2 +            & 
&  2700*gpp4*M4*Qep2*Qqp2 + 1800*gpp4*M4*QHdp2*Qqp2 + 18000._dp*gpp4*M4*QHup2*Qqp2 +     & 
&  5400*gpp4*M4*Qlp2*Qqp2 + 18000._dp*gpp4*M4*Qqp4 + 900*gpp4*M4*QHup2*Qs1p2 +           & 
&  900*gpp4*M4*Qqp2*Qs1p2 + 900*gpp4*M4*QHup2*Qs2p2 + 900*gpp4*M4*Qqp2*Qs2p2 +           & 
&  900*gpp4*M4*QHup2*Qs3p2 + 900*gpp4*M4*Qqp2*Qs3p2 + 900*gpp4*M4*QHup2*Qsp2 +           & 
&  900*gpp4*M4*Qqp2*Qsp2 - 1080*g1p2*gpp2*M1*Qd*Qu - 1080*g1p2*gpp2*M4*Qd*Qu -           & 
&  1080*g1p2*gpp2*M1*Qe*Qu - 1080*g1p2*gpp2*M4*Qe*Qu + 360*g1p2*gpp2*M1*QHd*Qu +         & 
&  360*g1p2*gpp2*M4*QHd*Qu - 1980*g1p2*gpp2*M1*QHu*Qu - 1980*g1p2*gpp2*M4*QHu*Qu +       & 
&  1080*g1p2*gpp2*M1*Ql*Qu + 1080*g1p2*gpp2*M4*Ql*Qu - 1620*g1p2*gpp2*M1*Qq*Qu -         & 
&  1620*g1p2*gpp2*M4*Qq*Qu + 2640*g1p2*gpp2*M1*Qup2 + 2400*g3p2*gpp2*M3*Qup2 +           & 
&  2640*g1p2*gpp2*M4*Qup2 + 2400*g3p2*gpp2*M4*Qup2 + 8100*gpp4*M4*Qdp2*Qup2 +            & 
&  2700*gpp4*M4*Qep2*Qup2 + 1800*gpp4*M4*QHdp2*Qup2 + 9900*gpp4*M4*QHup2*Qup2 +          & 
&  5400*gpp4*M4*Qlp2*Qup2 + 24300._dp*gpp4*M4*Qqp2*Qup2 + 900*gpp4*M4*Qs1p2*Qup2 +       & 
&  900*gpp4*M4*Qs2p2*Qup2 + 900*gpp4*M4*Qs3p2*Qup2 + 900*gpp4*M4*Qsp2*Qup2 +             & 
&  9900*gpp4*M4*Qup4 + 2700*gpp4*M4*QHup2*Qvp2 + 2700*gpp4*M4*Qqp2*Qvp2 + 2700*gpp4*M4*Qup2*Qvp2 +& 
&  225._dp*(TradjYeTeCYvTpYv) - 180*g1p2*TradjYuTu - 3600*g3p2*TradjYuTu +               & 
&  1350*gpp2*QHup2*TradjYuTu - 1350*gpp2*Qqp2*TradjYuTu - 1350*gpp2*Qup2*TradjYuTu +     & 
&  225._dp*(TradjYvTpYeCYeTv) + 450*gpp2*QHup2*TradjYvTv - 450*gpp2*Qlp2*TradjYvTv -     & 
&  450*gpp2*Qvp2*TradjYvTv + 675._dp*(TrYdadjYuTuadjYd) + 675._dp*(TrYuadjYdTdadjYu) +   & 
&  90*(2*g1p2*M1 + 40*g3p2*M3 + 15*gpp2*M4*(-1._dp*(QHup2) + Qqp2 + Qup2))*TrYuadjYu +   & 
&  4050._dp*(TrYuadjYuTuadjYu) - 450*gpp2*M4*QHup2*TrYvadjYv + 450*gpp2*M4*Qlp2*TrYvadjYv +& 
&  450*gpp2*M4*Qvp2*TrYvadjYv + 1350._dp*(TrYvadjYvTvadjYv) + 1350*Clamp2*lam*Tlam +     & 
&  225*Conjg(lam)*((2*gpp2*M4*(QHdp2 - QHup2 + Qsp2) + 3._dp*(TradjYdTd) +               & 
&  TradjYeTe)*lam + (-2*gpp2*(QHdp2 - QHup2 + Qsp2) + 3._dp*(TrYdadjYd) + TrYeadjYe)*Tlam)))/225._dp

 
DTu = oo16pi2*( betaTu1 + oo16pi2 * betaTu2 ) 

 
Else 
DTu = oo16pi2* betaTu1 
End If 
 
 
Call Chop(DTu) 

!-------------------- 
! mq2 
!-------------------- 
 
betamq21  = 2._dp*(adjTdTd) + 2._dp*(adjTuTu) + 2._dp*(adjYdmd2Yd) + adjYdYdmq2 +     & 
&  2._dp*(adjYumu2Yu) + adjYuYumq2 - (2*AbsM1*g1p2*id3R)/15._dp - 6*AbsM2*g2p2*id3R -    & 
&  (32*AbsM3*g3p2*id3R)/3._dp + 2*adjYdYd*mHd2 + 2*adjYuYu*mHu2 + mq2adjYdYd +           & 
&  mq2adjYuYu - 8*AbsM4*gpp2*id3R*Qqp2 + g1*id3R*ooSqrt15*Tr1(1) + 2*gp*id3R*Qq*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betamq22 = -2*Abslam*adjTdTd - 4._dp*(adjTdTdadjYdYd) - 4._dp*(adjTdYdadjYdTd) - 2*Abslam*adjTuTu -& 
&  4._dp*(adjTuTuadjYuYu) - 4._dp*(adjTuYuadjYuTu) - 2*Abslam*adjYdmd2Yd -               & 
&  4._dp*(adjYdmd2YdadjYdYd) - 4._dp*(adjYdTdadjTdYd) - 2*AbsTlam*adjYdYd -              & 
&  4._dp*(adjYdYdadjTdTd) - 4._dp*(adjYdYdadjYdmd2Yd) - 2._dp*(adjYdYdadjYdYdmq2) -      & 
&  Abslam*adjYdYdmq2 - 4._dp*(adjYdYdmq2adjYdYd) - 2*Abslam*adjYumu2Yu - 4._dp*(adjYumu2YuadjYuYu) -& 
&  4._dp*(adjYuTuadjTuYu) - 2*AbsTlam*adjYuYu - 4._dp*(adjYuYuadjTuTu) - 4._dp*(adjYuYuadjYumu2Yu) -& 
&  2._dp*(adjYuYuadjYuYumq2) - Abslam*adjYuYumq2 - 4._dp*(adjYuYumq2adjYuYu) +           & 
&  (4*adjTdTd*g1p2)/5._dp + (8*adjTuTu*g1p2)/5._dp + (4*adjYdmd2Yd*g1p2)/5._dp +         & 
&  (2*adjYdYdmq2*g1p2)/5._dp + (8*adjYumu2Yu*g1p2)/5._dp + (4*adjYuYumq2*g1p2)/5._dp +   & 
&  (2*AbsM2*g1p2*g2p2*id3R)/5._dp + 33*AbsM2*g2p4*id3R + 32*AbsM2*g2p2*g3p2*id3R -       & 
&  (4*adjTdYd*g1p2*M1)/5._dp - (8*adjTuYu*g1p2*M1)/5._dp - 4*Abslam*adjYdYd*mHd2 -       & 
&  8*adjYdYdadjYdYd*mHd2 - 2*Abslam*adjYuYu*mHd2 + (4*adjYdYd*g1p2*mHd2)/5._dp -         & 
&  2*Abslam*adjYdYd*mHu2 - 4*Abslam*adjYuYu*mHu2 - 8*adjYuYuadjYuYu*mHu2 +               & 
&  (8*adjYuYu*g1p2*mHu2)/5._dp - Abslam*mq2adjYdYd + (2*g1p2*mq2adjYdYd)/5._dp -         & 
&  2._dp*(mq2adjYdYdadjYdYd) - Abslam*mq2adjYuYu + (4*g1p2*mq2adjYuYu)/5._dp -           & 
&  2._dp*(mq2adjYuYuadjYuYu) - 2*Abslam*adjYdYd*ms2 - 2*Abslam*adjYuYu*ms2 +             & 
&  4*adjTdTd*gpp2*Qdp2 + 4*adjYdmd2Yd*gpp2*Qdp2 + 8*AbsM4*adjYdYd*gpp2*Qdp2 +            & 
&  2*adjYdYdmq2*gpp2*Qdp2 - 4*adjTdYd*gpp2*M4*Qdp2 + 4*adjYdYd*gpp2*mHd2*Qdp2 +          & 
&  2*gpp2*mq2adjYdYd*Qdp2 + 4*adjTdTd*gpp2*QHdp2 + 4*adjYdmd2Yd*gpp2*QHdp2 +             & 
&  8*AbsM4*adjYdYd*gpp2*QHdp2 + 2*adjYdYdmq2*gpp2*QHdp2 - 4*adjTdYd*gpp2*M4*QHdp2 +      & 
&  4*adjYdYd*gpp2*mHd2*QHdp2 + 2*gpp2*mq2adjYdYd*QHdp2 + 4*adjTuTu*gpp2*QHup2  
betamq22 =  betamq22+ 4*adjYumu2Yu*gpp2*QHup2 + 8*AbsM4*adjYuYu*gpp2*QHup2 + 2*adjYuYumq2*gpp2*QHup2 -      & 
&  4*adjTuYu*gpp2*M4*QHup2 + 4*adjYuYu*gpp2*mHu2*QHup2 + 2*gpp2*mq2adjYuYu*QHup2 +       & 
&  (24*AbsM4*g1p2*gpp2*id3R*Qd*Qq)/5._dp + (24*AbsM4*g1p2*gpp2*id3R*Qe*Qq)/5._dp -       & 
&  (8*AbsM4*g1p2*gpp2*id3R*QHd*Qq)/5._dp + (8*AbsM4*g1p2*gpp2*id3R*QHu*Qq)/5._dp -       & 
&  (24*AbsM4*g1p2*gpp2*id3R*Ql*Qq)/5._dp - 4*adjTdTd*gpp2*Qqp2 - 4*adjTuTu*gpp2*Qqp2 -   & 
&  4*adjYdmd2Yd*gpp2*Qqp2 - 8*AbsM4*adjYdYd*gpp2*Qqp2 - 2*adjYdYdmq2*gpp2*Qqp2 -         & 
&  4*adjYumu2Yu*gpp2*Qqp2 - 8*AbsM4*adjYuYu*gpp2*Qqp2 - 2*adjYuYumq2*gpp2*Qqp2 +         & 
&  (16*AbsM4*g1p2*gpp2*id3R*Qqp2)/3._dp + 24*AbsM2*g2p2*gpp2*id3R*Qqp2 + 24*AbsM4*g2p2*gpp2*id3R*Qqp2 +& 
&  (128*AbsM4*g3p2*gpp2*id3R*Qqp2)/3._dp + 4*adjTdYd*gpp2*M4*Qqp2 + 4*adjTuYu*gpp2*M4*Qqp2 -& 
&  4*adjYdYd*gpp2*mHd2*Qqp2 - 4*adjYuYu*gpp2*mHu2*Qqp2 - 2*gpp2*mq2adjYdYd*Qqp2 -        & 
&  2*gpp2*mq2adjYuYu*Qqp2 + 216*AbsM4*gpp4*id3R*Qdp2*Qqp2 + 72*AbsM4*gpp4*id3R*Qep2*Qqp2 +& 
&  48*AbsM4*gpp4*id3R*QHdp2*Qqp2 + 48*AbsM4*gpp4*id3R*QHup2*Qqp2 + 144*AbsM4*gpp4*id3R*Qlp2*Qqp2 +& 
&  480*AbsM4*gpp4*id3R*Qqp4 + 24*AbsM4*gpp4*id3R*Qqp2*Qs1p2 + 24*AbsM4*gpp4*id3R*Qqp2*Qs2p2 +& 
&  24*AbsM4*gpp4*id3R*Qqp2*Qs3p2 + 24*AbsM4*gpp4*id3R*Qqp2*Qsp2 - (48*AbsM4*g1p2*gpp2*id3R*Qq*Qu)/5._dp +& 
&  4*adjTuTu*gpp2*Qup2 + 4*adjYumu2Yu*gpp2*Qup2 + 8*AbsM4*adjYuYu*gpp2*Qup2 +            & 
&  2*adjYuYumq2*gpp2*Qup2 - 4*adjTuYu*gpp2*M4*Qup2 + 4*adjYuYu*gpp2*mHu2*Qup2 +          & 
&  2*gpp2*mq2adjYuYu*Qup2 + 216*AbsM4*gpp4*id3R*Qqp2*Qup2 + 72*AbsM4*gpp4*id3R*Qqp2*Qvp2 -& 
&  6*adjTdYd*TradjYdTd - 2*adjTdYd*TradjYeTe - 6*adjTuYu*TradjYuTu - 2*adjTuYu*TradjYvTv -& 
&  6*adjYdYd*TrCTdTpTd - 6*adjYdTd*TrCTdTpYd - 2*adjYdYd*TrCTeTpTe - 2*adjYdTd*TrCTeTpYe -& 
&  6*adjYuYu*TrCTuTpTu - 6*adjYuTu*TrCTuTpYu - 2*adjYuYu*TrCTvTpTv - 2*adjYuTu*TrCTvTpYv -& 
&  6*adjYdYd*Trmd2YdadjYd - 2*adjYdYd*Trme2YeadjYe - 2*adjYdYd*Trml2adjYeYe  
betamq22 =  betamq22- 6*adjYdYd*Trmq2adjYdYd - 6*adjYuYu*Trmq2adjYuYu - 6*adjYuYu*Trmu2YuadjYu -            & 
&  6*adjTdTd*TrYdadjYd - 6*adjYdmd2Yd*TrYdadjYd - 3*adjYdYdmq2*TrYdadjYd -               & 
&  12*adjYdYd*mHd2*TrYdadjYd - 3*mq2adjYdYd*TrYdadjYd - 2*adjTdTd*TrYeadjYe -            & 
&  2*adjYdmd2Yd*TrYeadjYe - adjYdYdmq2*TrYeadjYe - 4*adjYdYd*mHd2*TrYeadjYe -            & 
&  mq2adjYdYd*TrYeadjYe - 6*adjTuTu*TrYuadjYu - 6*adjYumu2Yu*TrYuadjYu - 3*adjYuYumq2*TrYuadjYu -& 
&  12*adjYuYu*mHu2*TrYuadjYu - 3*mq2adjYuYu*TrYuadjYu - 2*adjTuTu*TrYvadjYv -            & 
&  2*adjYumu2Yu*TrYvadjYv - adjYuYumq2*TrYvadjYv - 4*adjYuYu*mHu2*TrYvadjYv -            & 
&  mq2adjYuYu*TrYvadjYv - 2*adjYuYu*TrYvadjYvCml2 - 2*adjYuYu*TrYvCmv2adjYv +            & 
&  (g1p2*(180*(-1._dp*(adjYdTd) - 2._dp*(adjYuTu) + 2*adjYdYd*M1 + 4*adjYuYu*M1) +       & 
&  id3R*(597*g1p2*M1 + 80*g3p2*(2._dp*(M1) + M3) + 45*g2p2*(2._dp*(M1) + M2) +           & 
&  60*gpp2*(2._dp*(M1) + M4)*Qq*(9._dp*(Qd) + 9._dp*(Qe) - 3._dp*(QHd) + 3._dp*(QHu) -   & 
&  9._dp*(Ql) + 10._dp*(Qq) - 18._dp*(Qu))))*Conjg(M1))/225._dp - (16*g3p2*id3R*(-       & 
& (g1p2*(M1 + 2._dp*(M3))) - 15*(-8*g3p2*M3 + 3*g2p2*(2._dp*(M3) + M2) + 4*gpp2*(2._dp*(M3) +& 
&  M4)*Qqp2))*Conjg(M3))/45._dp - 4*adjYdTd*gpp2*Qdp2*Conjg(M4) - 4*adjYdTd*gpp2*QHdp2*Conjg(M4) -& 
&  4*adjYuTu*gpp2*QHup2*Conjg(M4) + (12*g1p2*gpp2*id3R*M1*Qd*Qq*Conjg(M4))/5._dp +       & 
&  (12*g1p2*gpp2*id3R*M1*Qe*Qq*Conjg(M4))/5._dp - (4*g1p2*gpp2*id3R*M1*QHd*Qq*Conjg(M4))/5._dp +& 
&  (4*g1p2*gpp2*id3R*M1*QHu*Qq*Conjg(M4))/5._dp - (12*g1p2*gpp2*id3R*M1*Ql*Qq*Conjg(M4))/5._dp +& 
&  4*adjYdTd*gpp2*Qqp2*Conjg(M4) + 4*adjYuTu*gpp2*Qqp2*Conjg(M4) + (8*g1p2*gpp2*id3R*M1*Qqp2*Conjg(M4))/3._dp +& 
&  (64*g3p2*gpp2*id3R*M3*Qqp2*Conjg(M4))/3._dp + 12*g2p2*gpp2*id3R*M2*Qqp2*Conjg(M4) -   & 
&  (24*g1p2*gpp2*id3R*M1*Qq*Qu*Conjg(M4))/5._dp - 4*adjYuTu*gpp2*Qup2*Conjg(M4) +        & 
&  (g1p2*g2p2*id3R*M1*Conjg(M2))/5._dp + 16*g2p2*g3p2*id3R*M3*Conjg(M2) + 12*g2p2*gpp2*id3R*M4*Qqp2*Conjg(M2)  
betamq22 =  betamq22- 2*adjYdTd*lam*Conjg(Tlam) - 2*adjYuTu*lam*Conjg(Tlam) - 2*adjTdYd*Conjg(lam)*Tlam -   & 
&  2*adjTuYu*Conjg(lam)*Tlam + 6*g2p4*id3R*Tr2(2) + (32*g3p4*id3R*Tr2(3))/3._dp +        & 
&  (2*g1p2*id3R*Tr2U1(1,1))/15._dp + 4*g1*gp*id3R*ooSqrt15*Qq*Tr2U1(1,4) +               & 
&  4*g1*gp*id3R*ooSqrt15*Qq*Tr2U1(4,1) + 8*gpp2*id3R*Qqp2*Tr2U1(4,4) + 4*g1*id3R*ooSqrt15*Tr3(1) +& 
&  8*gp*id3R*Qq*Tr3(4)

 
Dmq2 = oo16pi2*( betamq21 + oo16pi2 * betamq22 ) 

 
Else 
Dmq2 = oo16pi2* betamq21 
End If 
 
 
Call Chop(Dmq2) 

Forall(i1=1:3) Dmq2(i1,i1) =  Real(Dmq2(i1,i1),dp) 
Dmq2 = 0.5_dp*(Dmq2+ Conjg(Transpose(Dmq2)) ) 
!-------------------- 
! ml2 
!-------------------- 
 
betaml21  = 2._dp*(adjTeTe) + 2._dp*(adjYeme2Ye) + adjYeYeml2 + 2._dp*(CTvTpTv)       & 
&  + 2._dp*(CYvmv2TpYv) + CYvTpYvml2 - (6*AbsM1*g1p2*id3R)/5._dp - 6*AbsM2*g2p2*id3R +   & 
&  2*adjYeYe*mHd2 + 2*CYvTpYv*mHu2 + ml2adjYeYe + ml2CYvTpYv - 8*AbsM4*gpp2*id3R*Qlp2 -  & 
&  g1*id3R*sqrt3ov5*Tr1(1) + 2*gp*id3R*Ql*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betaml22 = -2*Abslam*adjTeTe - 4._dp*(adjTeTeadjYeYe) - 4._dp*(adjTeYeadjYeTe) - 2*Abslam*adjYeme2Ye -& 
&  4._dp*(adjYeme2YeadjYeYe) - 4._dp*(adjYeTeadjTeYe) - 2*AbsTlam*adjYeYe -              & 
&  4._dp*(adjYeYeadjTeTe) - 4._dp*(adjYeYeadjYeme2Ye) - 2._dp*(adjYeYeadjYeYeml2) -      & 
&  Abslam*adjYeYeml2 - 4._dp*(adjYeYeml2adjYeYe) - 2*Abslam*CTvTpTv - 4._dp*(CTvTpTvCYvTpYv) -& 
&  4._dp*(CTvTpYvCYvTpTv) - 2*Abslam*CYvmv2TpYv - 4._dp*(CYvmv2TpYvCYvTpYv) -            & 
&  4._dp*(CYvTpTvCTvTpYv) - 2*AbsTlam*CYvTpYv - 4._dp*(CYvTpYvCTvTpTv) - 4._dp*(CYvTpYvCYvmv2TpYv) -& 
&  2._dp*(CYvTpYvCYvTpYvml2) - Abslam*CYvTpYvml2 - 4._dp*(CYvTpYvml2CYvTpYv) +           & 
&  (12*adjTeTe*g1p2)/5._dp + (12*adjYeme2Ye*g1p2)/5._dp + (6*adjYeYeml2*g1p2)/5._dp +    & 
&  (18*AbsM2*g1p2*g2p2*id3R)/5._dp + 33*AbsM2*g2p4*id3R - (12*adjTeYe*g1p2*M1)/5._dp -   & 
&  4*Abslam*adjYeYe*mHd2 - 8*adjYeYeadjYeYe*mHd2 - 2*Abslam*CYvTpYv*mHd2 +               & 
&  (12*adjYeYe*g1p2*mHd2)/5._dp - 2*Abslam*adjYeYe*mHu2 - 4*Abslam*CYvTpYv*mHu2 -        & 
&  8*CYvTpYvCYvTpYv*mHu2 - Abslam*ml2adjYeYe + (6*g1p2*ml2adjYeYe)/5._dp -               & 
&  2._dp*(ml2adjYeYeadjYeYe) - Abslam*ml2CYvTpYv - 2._dp*(ml2CYvTpYvCYvTpYv) -           & 
&  2*Abslam*adjYeYe*ms2 - 2*Abslam*CYvTpYv*ms2 + 4*adjTeTe*gpp2*Qep2 + 4*adjYeme2Ye*gpp2*Qep2 +& 
&  2*adjYeYeml2*gpp2*Qep2 - 4*adjTeYe*gpp2*M4*Qep2 + 4*adjYeYe*gpp2*mHd2*Qep2 +          & 
&  2*gpp2*ml2adjYeYe*Qep2 + 4*adjTeTe*gpp2*QHdp2 + 4*adjYeme2Ye*gpp2*QHdp2 +             & 
&  2*adjYeYeml2*gpp2*QHdp2 - 4*adjTeYe*gpp2*M4*QHdp2 + 4*adjYeYe*gpp2*mHd2*QHdp2 +       & 
&  2*gpp2*ml2adjYeYe*QHdp2 + 4*CTvTpTv*gpp2*QHup2 + 4*CYvmv2TpYv*gpp2*QHup2 +            & 
&  2*CYvTpYvml2*gpp2*QHup2 - 4*CTvTpYv*gpp2*M4*QHup2 + 4*CYvTpYv*gpp2*mHu2*QHup2 +       & 
&  2*gpp2*ml2CYvTpYv*QHup2 - 4*adjTeTe*gpp2*Qlp2 - 4*adjYeme2Ye*gpp2*Qlp2 -              & 
&  2*adjYeYeml2*gpp2*Qlp2 - 4*CTvTpTv*gpp2*Qlp2 - 4*CYvmv2TpYv*gpp2*Qlp2  
betaml22 =  betaml22- 2*CYvTpYvml2*gpp2*Qlp2 + 24*AbsM2*g2p2*gpp2*id3R*Qlp2 + 4*adjTeYe*gpp2*M4*Qlp2 +      & 
&  4*CTvTpYv*gpp2*M4*Qlp2 - 4*adjYeYe*gpp2*mHd2*Qlp2 - 4*CYvTpYv*gpp2*mHu2*Qlp2 -        & 
&  2*gpp2*ml2adjYeYe*Qlp2 - 2*gpp2*ml2CYvTpYv*Qlp2 + 4*CTvTpTv*gpp2*Qvp2 +               & 
&  4*CYvmv2TpYv*gpp2*Qvp2 + 2*CYvTpYvml2*gpp2*Qvp2 - 4*CTvTpYv*gpp2*M4*Qvp2 +            & 
&  4*CYvTpYv*gpp2*mHu2*Qvp2 + 2*gpp2*ml2CYvTpYv*Qvp2 - 6*adjTeYe*TradjYdTd -             & 
&  2*adjTeYe*TradjYeTe - 6*CTvTpYv*TradjYuTu - 2*CTvTpYv*TradjYvTv - 6*adjYeYe*TrCTdTpTd -& 
&  6*adjYeTe*TrCTdTpYd - 2*adjYeYe*TrCTeTpTe - 2*adjYeTe*TrCTeTpYe - 6*CYvTpYv*TrCTuTpTu -& 
&  6*CYvTpTv*TrCTuTpYu - 2*CYvTpYv*TrCTvTpTv - 2*CYvTpTv*TrCTvTpYv - 6*adjYeYe*Trmd2YdadjYd -& 
&  2*adjYeYe*Trme2YeadjYe - 2*adjYeYe*Trml2adjYeYe - 6*adjYeYe*Trmq2adjYdYd -            & 
&  6*CYvTpYv*Trmq2adjYuYu - 6*CYvTpYv*Trmu2YuadjYu - 6*adjTeTe*TrYdadjYd -               & 
&  6*adjYeme2Ye*TrYdadjYd - 3*adjYeYeml2*TrYdadjYd - 12*adjYeYe*mHd2*TrYdadjYd -         & 
&  3*ml2adjYeYe*TrYdadjYd - 2*adjTeTe*TrYeadjYe - 2*adjYeme2Ye*TrYeadjYe -               & 
&  adjYeYeml2*TrYeadjYe - 4*adjYeYe*mHd2*TrYeadjYe - ml2adjYeYe*TrYeadjYe -              & 
&  6*CTvTpTv*TrYuadjYu - 6*CYvmv2TpYv*TrYuadjYu - 3*CYvTpYvml2*TrYuadjYu -               & 
&  12*CYvTpYv*mHu2*TrYuadjYu - 3*ml2CYvTpYv*TrYuadjYu - 2*CTvTpTv*TrYvadjYv -            & 
&  2*CYvmv2TpYv*TrYvadjYv - CYvTpYvml2*TrYvadjYv - 4*CYvTpYv*mHu2*TrYvadjYv -            & 
&  ml2CYvTpYv*TrYvadjYv - 2*CYvTpYv*TrYvadjYvCml2 - 2*CYvTpYv*TrYvCmv2adjYv +            & 
&  (3*g1p2*(-20._dp*(adjYeTe) + 40*adjYeYe*M1 + id3R*(207*g1p2*M1 + 15*g2p2*(2._dp*(M1) +& 
&  M2) + 20*gpp2*(2._dp*(M1) + M4)*Ql*(-3._dp*(Qd) - 3._dp*(Qe) + QHd - QHu +            & 
&  4._dp*(Ql) - 3._dp*(Qq) + 6._dp*(Qu))))*Conjg(M1))/25._dp + (4*gpp2*(5*(-             & 
& (adjYeTe*(Qep2 + QHdp2 - Qlp2)) + 2*adjYeYe*M4*(Qep2 + QHdp2 - Qlp2) + (-              & 
& 1._dp*(CYvTpTv) + 2*CYvTpYv*M4)*(QHup2 - Qlp2 + Qvp2)) + 3*id3R*Ql*(-(g1p2*(M1 +       & 
&  2._dp*(M4))*(3._dp*(Qd) + 3._dp*(Qe) - QHd + QHu - 4._dp*(Ql) + 3._dp*(Qq) -          & 
&  6._dp*(Qu))) + 5*Ql*(g2p2*(2._dp*(M4) + M2) + 2*gpp2*M4*(9._dp*(Qdp2) +               & 
&  3._dp*(Qep2) + 2._dp*(QHdp2) + 2._dp*(QHup2) + 8._dp*(Qlp2) + 18._dp*(Qqp2) +         & 
&  Qs1p2 + Qs2p2 + Qs3p2 + Qsp2 + 9._dp*(Qup2) + 3._dp*(Qvp2)))))*Conjg(M4))/5._dp  
betaml22 =  betaml22+ (9*g1p2*g2p2*id3R*M1*Conjg(M2))/5._dp + 12*g2p2*gpp2*id3R*M4*Qlp2*Conjg(M2) -         & 
&  2*adjYeTe*lam*Conjg(Tlam) - 2*CYvTpTv*lam*Conjg(Tlam) - 2*adjTeYe*Conjg(lam)*Tlam -   & 
&  2*CTvTpYv*Conjg(lam)*Tlam + 6*g2p4*id3R*Tr2(2) + (6*g1p2*id3R*Tr2U1(1,1))/5._dp -     & 
&  4*g1*gp*id3R*Ql*sqrt3ov5*Tr2U1(1,4) - 4*g1*gp*id3R*Ql*sqrt3ov5*Tr2U1(4,               & 
& 1) + 8*gpp2*id3R*Qlp2*Tr2U1(4,4) - 4*g1*id3R*sqrt3ov5*Tr3(1) + 8*gp*id3R*Ql*Tr3(4)

 
Dml2 = oo16pi2*( betaml21 + oo16pi2 * betaml22 ) 

 
Else 
Dml2 = oo16pi2* betaml21 
End If 
 
 
Call Chop(Dml2) 

Forall(i1=1:3) Dml2(i1,i1) =  Real(Dml2(i1,i1),dp) 
Dml2 = 0.5_dp*(Dml2+ Conjg(Transpose(Dml2)) ) 
!-------------------- 
! mHd2 
!-------------------- 
 
betamHd21  = 2._dp*(AbsTlam) - (6*AbsM1*g1p2)/5._dp - 6*AbsM2*g2p2 + 2*Abslam*mHd2 +  & 
&  2*Abslam*mHu2 + 2*Abslam*ms2 - 8*AbsM4*gpp2*QHdp2 + 6._dp*(TrCTdTpTd) +               & 
&  2._dp*(TrCTeTpTe) + 6._dp*(Trmd2YdadjYd) + 2._dp*(Trme2YeadjYe) + 2._dp*(Trml2adjYeYe)& 
&  + 6._dp*(Trmq2adjYdYd) + 6*mHd2*TrYdadjYd + 2*mHd2*TrYeadjYe - g1*sqrt3ov5*Tr1(1)     & 
&  + 2*gp*QHd*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betamHd22 = -24*Abslam*AbsTlam + (18*AbsM2*g1p2*g2p2)/5._dp + 33*AbsM2*g2p4 - 12*Clamp2*lamp2*mHd2 -& 
&  12*Clamp2*lamp2*mHu2 - 12*Clamp2*lamp2*ms2 - 4*AbsTlam*gpp2*QHdp2 + 24*AbsM2*g2p2*gpp2*QHdp2 -& 
&  4*Abslam*gpp2*mHd2*QHdp2 - 4*Abslam*gpp2*mHu2*QHdp2 - 4*Abslam*gpp2*ms2*QHdp2 +       & 
&  4*AbsTlam*gpp2*QHup2 + 4*Abslam*gpp2*mHd2*QHup2 + 4*Abslam*gpp2*mHu2*QHup2 +          & 
&  4*Abslam*gpp2*ms2*QHup2 + 4*AbsTlam*gpp2*Qsp2 + 4*Abslam*gpp2*mHd2*Qsp2 +             & 
&  4*Abslam*gpp2*mHu2*Qsp2 + 4*Abslam*gpp2*ms2*Qsp2 - 2._dp*(TradjYeTeCTvTpYv) -         & 
&  2._dp*(TradjYvTpYeCTeTv) - (4*g1p2*TrCTdTpTd)/5._dp + 32*g3p2*TrCTdTpTd +             & 
&  12*gpp2*Qdp2*TrCTdTpTd - 12*gpp2*QHdp2*TrCTdTpTd + 12*gpp2*Qqp2*TrCTdTpTd +           & 
&  (4*g1p2*M1*TrCTdTpYd)/5._dp - 32*g3p2*M3*TrCTdTpYd - 12*gpp2*M4*Qdp2*TrCTdTpYd +      & 
&  12*gpp2*M4*QHdp2*TrCTdTpYd - 12*gpp2*M4*Qqp2*TrCTdTpYd + (12*g1p2*TrCTeTpTe)/5._dp +  & 
&  4*gpp2*Qep2*TrCTeTpTe - 4*gpp2*QHdp2*TrCTeTpTe + 4*gpp2*Qlp2*TrCTeTpTe -              & 
&  (12*g1p2*M1*TrCTeTpYe)/5._dp - 4*gpp2*M4*Qep2*TrCTeTpYe + 4*gpp2*M4*QHdp2*TrCTeTpYe - & 
&  4*gpp2*M4*Qlp2*TrCTeTpYe - 6*Abslam*TrCTuTpTu - 2*Abslam*TrCTvTpTv - (4*g1p2*Trmd2YdadjYd)/5._dp +& 
&  32*g3p2*Trmd2YdadjYd + 12*gpp2*Qdp2*Trmd2YdadjYd - 12*gpp2*QHdp2*Trmd2YdadjYd +       & 
&  12*gpp2*Qqp2*Trmd2YdadjYd - 36._dp*(Trmd2YdadjYdYdadjYd) - 6._dp*(Trmd2YdadjYuYuadjYd) +& 
&  (12*g1p2*Trme2YeadjYe)/5._dp + 4*gpp2*Qep2*Trme2YeadjYe - 4*gpp2*QHdp2*Trme2YeadjYe + & 
&  4*gpp2*Qlp2*Trme2YeadjYe - 12._dp*(Trme2YeadjYeYeadjYe) + (12*g1p2*Trml2adjYeYe)/5._dp +& 
&  4*gpp2*Qep2*Trml2adjYeYe - 4*gpp2*QHdp2*Trml2adjYeYe + 4*gpp2*Qlp2*Trml2adjYeYe -     & 
&  12._dp*(Trml2adjYeYeadjYeYe) - (4*g1p2*Trmq2adjYdYd)/5._dp + 32*g3p2*Trmq2adjYdYd +   & 
&  12*gpp2*Qdp2*Trmq2adjYdYd - 12*gpp2*QHdp2*Trmq2adjYdYd + 12*gpp2*Qqp2*Trmq2adjYdYd -  & 
&  36._dp*(Trmq2adjYdYdadjYdYd) - 6._dp*(Trmq2adjYdYdadjYuYu) - 6*Abslam*Trmq2adjYuYu  
betamHd22 =  betamHd22- 6._dp*(Trmq2adjYuYuadjYdYd) - 6._dp*(Trmu2YuadjYdYdadjYu) - 6*Abslam*Trmu2YuadjYu -   & 
&  36._dp*(TrYdadjTdTdadjYd) - 6._dp*(TrYdadjTuTuadjYd) + 64*AbsM3*g3p2*TrYdadjYd -      & 
&  (4*g1p2*mHd2*TrYdadjYd)/5._dp + 32*g3p2*mHd2*TrYdadjYd + 12*gpp2*mHd2*Qdp2*TrYdadjYd -& 
&  12*gpp2*mHd2*QHdp2*TrYdadjYd + 12*gpp2*mHd2*Qqp2*TrYdadjYd - 36._dp*(TrYdadjYdTdadjTd) -& 
&  36*mHd2*TrYdadjYdYdadjYd - 6._dp*(TrYdadjYuTuadjTd) - 6*mHd2*TrYdadjYuYuadjYd -       & 
&  6*mHu2*TrYdadjYuYuadjYd - 12._dp*(TrYeadjTeTeadjYe) + (12*g1p2*mHd2*TrYeadjYe)/5._dp +& 
&  4*gpp2*mHd2*Qep2*TrYeadjYe - 4*gpp2*mHd2*QHdp2*TrYeadjYe + 4*gpp2*mHd2*Qlp2*TrYeadjYe -& 
&  12._dp*(TrYeadjYeTeadjTe) - 12*mHd2*TrYeadjYeYeadjYe - 2._dp*(TrYeCTvTpTvadjYe) -     & 
&  6._dp*(TrYuadjTdTdadjYu) - 6._dp*(TrYuadjYdTdadjTu) - 6*AbsTlam*TrYuadjYu -           & 
&  6*Abslam*mHd2*TrYuadjYu - 12*Abslam*mHu2*TrYuadjYu - 6*Abslam*ms2*TrYuadjYu -         & 
&  2*AbsTlam*TrYvadjYv - 2*Abslam*mHd2*TrYvadjYv - 4*Abslam*mHu2*TrYvadjYv -             & 
&  2*Abslam*ms2*TrYvadjYv - 2*Abslam*TrYvadjYvCml2 - 2._dp*(TrYvadjYvCml2TpYeCYe) -      & 
&  2._dp*(TrYvadjYvTpTeCTe) - 2._dp*(TrYvadjYvTpYeCme2CYe) - 2*mHd2*TrYvadjYvTpYeCYe -   & 
&  2*mHu2*TrYvadjYvTpYeCYe - 2._dp*(TrYvadjYvTpYeCYeCml2) - 2*Abslam*TrYvCmv2adjYv -     & 
&  2._dp*(TrYvCmv2adjYvTpYeCYe) + (g1p2*(621*g1p2*M1 + 90*g2p2*M1 + 45*g2p2*M2 -         & 
&  360*gpp2*M1*Qd*QHd - 180*gpp2*M4*Qd*QHd - 360*gpp2*M1*Qe*QHd - 180*gpp2*M4*Qe*QHd +   & 
&  240*gpp2*M1*QHdp2 + 120*gpp2*M4*QHdp2 - 120*gpp2*M1*QHd*QHu - 60*gpp2*M4*QHd*QHu +    & 
&  360*gpp2*M1*QHd*Ql + 180*gpp2*M4*QHd*Ql - 360*gpp2*M1*QHd*Qq - 180*gpp2*M4*QHd*Qq +   & 
&  720*gpp2*M1*QHd*Qu + 360*gpp2*M4*QHd*Qu + 20._dp*(TradjYdTd) - 60._dp*(TradjYeTe) -   & 
&  40*M1*TrYdadjYd + 120*M1*TrYeadjYe)*Conjg(M1))/25._dp - 32*g3p2*TradjYdTd*Conjg(M3) + & 
&  (9*g1p2*g2p2*M1*Conjg(M2))/5._dp + 12*g2p2*gpp2*M4*QHdp2*Conjg(M2) + 4*gpp2*M4*QHdp2*lam*Conjg(Tlam)  
betamHd22 =  betamHd22- 4*gpp2*M4*QHup2*lam*Conjg(Tlam) - 4*gpp2*M4*Qsp2*lam*Conjg(Tlam) - 6*TradjYuTu*lam*Conjg(Tlam) -& 
&  2*TradjYvTv*lam*Conjg(Tlam) + (4*gpp2*Conjg(M4)*(-9*g1p2*M1*Qd*QHd - 18*g1p2*M4*Qd*QHd -& 
&  9*g1p2*M1*Qe*QHd - 18*g1p2*M4*Qe*QHd + 6*g1p2*M1*QHdp2 + 12*g1p2*M4*QHdp2 +           & 
&  30*g2p2*M4*QHdp2 + 15*g2p2*M2*QHdp2 + 270*gpp2*M4*Qdp2*QHdp2 + 90*gpp2*M4*Qep2*QHdp2 +& 
&  120*gpp2*M4*QHdp4 - 3*g1p2*M1*QHd*QHu - 6*g1p2*M4*QHd*QHu + 60*gpp2*M4*QHdp2*QHup2 +  & 
&  9*g1p2*M1*QHd*Ql + 18*g1p2*M4*QHd*Ql + 180*gpp2*M4*QHdp2*Qlp2 - 9*g1p2*M1*QHd*Qq -    & 
&  18*g1p2*M4*QHd*Qq + 540*gpp2*M4*QHdp2*Qqp2 + 30*gpp2*M4*QHdp2*Qs1p2 + 30*gpp2*M4*QHdp2*Qs2p2 +& 
&  30*gpp2*M4*QHdp2*Qs3p2 + 30*gpp2*M4*QHdp2*Qsp2 + 18*g1p2*M1*QHd*Qu + 36*g1p2*M4*QHd*Qu +& 
&  270*gpp2*M4*QHdp2*Qup2 + 90*gpp2*M4*QHdp2*Qvp2 - 15*Qdp2*TradjYdTd + 15*QHdp2*TradjYdTd -& 
&  15*Qqp2*TradjYdTd - 5*Qep2*TradjYeTe + 5*QHdp2*TradjYeTe - 5*Qlp2*TradjYeTe +         & 
&  30*M4*(Qdp2 - QHdp2 + Qqp2)*TrYdadjYd + 10*M4*Qep2*TrYeadjYe - 10*M4*QHdp2*TrYeadjYe +& 
&  10*M4*Qlp2*TrYeadjYe - 5*(QHdp2 - QHup2 - Qsp2)*Conjg(lam)*(2*M4*lam - Tlam)))/5._dp -& 
&  6*TrCTuTpYu*Conjg(lam)*Tlam - 2*TrCTvTpYv*Conjg(lam)*Tlam + 6*g2p4*Tr2(2) +           & 
&  (6*g1p2*Tr2U1(1,1))/5._dp - 4*g1*gp*QHd*sqrt3ov5*Tr2U1(1,4) - 4*g1*gp*QHd*sqrt3ov5*Tr2U1(4,& 
& 1) + 8*gpp2*QHdp2*Tr2U1(4,4) - 4*g1*sqrt3ov5*Tr3(1) + 8*gp*QHd*Tr3(4)

 
DmHd2 = oo16pi2*( betamHd21 + oo16pi2 * betamHd22 ) 

 
Else 
DmHd2 = oo16pi2* betamHd21 
End If 
 
 
!-------------------- 
! mHu2 
!-------------------- 
 
betamHu21  = 2._dp*(AbsTlam) - (6*AbsM1*g1p2)/5._dp - 6*AbsM2*g2p2 + 2*Abslam*mHd2 +  & 
&  2*Abslam*mHu2 + 2*Abslam*ms2 - 8*AbsM4*gpp2*QHup2 + 6._dp*(TrCTuTpTu) +               & 
&  2._dp*(TrCTvTpTv) + 6._dp*(Trmq2adjYuYu) + 6._dp*(Trmu2YuadjYu) + 6*mHu2*TrYuadjYu +  & 
&  2*mHu2*TrYvadjYv + 2._dp*(TrYvadjYvCml2) + 2._dp*(TrYvCmv2adjYv) + g1*sqrt3ov5*Tr1(1) & 
&  + 2*gp*QHu*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betamHu22 = -24*Abslam*AbsTlam + (18*AbsM2*g1p2*g2p2)/5._dp + 33*AbsM2*g2p4 - 12*Clamp2*lamp2*mHd2 -& 
&  12*Clamp2*lamp2*mHu2 - 12*Clamp2*lamp2*ms2 + 4*AbsTlam*gpp2*QHdp2 + 4*Abslam*gpp2*mHd2*QHdp2 +& 
&  4*Abslam*gpp2*mHu2*QHdp2 + 4*Abslam*gpp2*ms2*QHdp2 - 4*AbsTlam*gpp2*QHup2 +           & 
&  24*AbsM2*g2p2*gpp2*QHup2 - 4*Abslam*gpp2*mHd2*QHup2 - 4*Abslam*gpp2*mHu2*QHup2 -      & 
&  4*Abslam*gpp2*ms2*QHup2 + 4*AbsTlam*gpp2*Qsp2 + 4*Abslam*gpp2*mHd2*Qsp2 +             & 
&  4*Abslam*gpp2*mHu2*Qsp2 + 4*Abslam*gpp2*ms2*Qsp2 - 2._dp*(TradjYeTeCTvTpYv) -         & 
&  2._dp*(TradjYvTpYeCTeTv) - 6*Abslam*TrCTdTpTd - 2*Abslam*TrCTeTpTe + (8*g1p2*TrCTuTpTu)/5._dp +& 
&  32*g3p2*TrCTuTpTu - 12*gpp2*QHup2*TrCTuTpTu + 12*gpp2*Qqp2*TrCTuTpTu + 12*gpp2*Qup2*TrCTuTpTu -& 
&  (8*g1p2*M1*TrCTuTpYu)/5._dp - 32*g3p2*M3*TrCTuTpYu + 12*gpp2*M4*QHup2*TrCTuTpYu -     & 
&  12*gpp2*M4*Qqp2*TrCTuTpYu - 12*gpp2*M4*Qup2*TrCTuTpYu - 4*gpp2*QHup2*TrCTvTpTv +      & 
&  4*gpp2*Qlp2*TrCTvTpTv + 4*gpp2*Qvp2*TrCTvTpTv + 4*gpp2*M4*QHup2*TrCTvTpYv -           & 
&  4*gpp2*M4*Qlp2*TrCTvTpYv - 4*gpp2*M4*Qvp2*TrCTvTpYv - 6*Abslam*Trmd2YdadjYd -         & 
&  6._dp*(Trmd2YdadjYuYuadjYd) - 2*Abslam*Trme2YeadjYe - 2*Abslam*Trml2adjYeYe -         & 
&  6*Abslam*Trmq2adjYdYd - 6._dp*(Trmq2adjYdYdadjYuYu) + (8*g1p2*Trmq2adjYuYu)/5._dp +   & 
&  32*g3p2*Trmq2adjYuYu - 12*gpp2*QHup2*Trmq2adjYuYu + 12*gpp2*Qqp2*Trmq2adjYuYu +       & 
&  12*gpp2*Qup2*Trmq2adjYuYu - 6._dp*(Trmq2adjYuYuadjYdYd) - 36._dp*(Trmq2adjYuYuadjYuYu) -& 
&  6._dp*(Trmu2YuadjYdYdadjYu) + (8*g1p2*Trmu2YuadjYu)/5._dp + 32*g3p2*Trmu2YuadjYu -    & 
&  12*gpp2*QHup2*Trmu2YuadjYu + 12*gpp2*Qqp2*Trmu2YuadjYu + 12*gpp2*Qup2*Trmu2YuadjYu -  & 
&  36._dp*(Trmu2YuadjYuYuadjYu) - 6._dp*(TrYdadjTuTuadjYd) - 6*AbsTlam*TrYdadjYd -       & 
&  12*Abslam*mHd2*TrYdadjYd - 6*Abslam*mHu2*TrYdadjYd - 6*Abslam*ms2*TrYdadjYd -         & 
&  6._dp*(TrYdadjYuTuadjTd) - 6*mHd2*TrYdadjYuYuadjYd - 6*mHu2*TrYdadjYuYuadjYd  
betamHu22 =  betamHu22- 2*AbsTlam*TrYeadjYe - 4*Abslam*mHd2*TrYeadjYe - 2*Abslam*mHu2*TrYeadjYe -             & 
&  2*Abslam*ms2*TrYeadjYe - 2._dp*(TrYeCTvTpTvadjYe) - 6._dp*(TrYuadjTdTdadjYu) -        & 
&  36._dp*(TrYuadjTuTuadjYu) - 6._dp*(TrYuadjYdTdadjTu) + 64*AbsM3*g3p2*TrYuadjYu +      & 
&  (8*g1p2*mHu2*TrYuadjYu)/5._dp + 32*g3p2*mHu2*TrYuadjYu - 12*gpp2*mHu2*QHup2*TrYuadjYu +& 
&  12*gpp2*mHu2*Qqp2*TrYuadjYu + 12*gpp2*mHu2*Qup2*TrYuadjYu - 36._dp*(TrYuadjYuTuadjTu) -& 
&  36*mHu2*TrYuadjYuYuadjYu - 12._dp*(TrYvadjTvTvadjYv) - 4*gpp2*mHu2*QHup2*TrYvadjYv +  & 
&  4*gpp2*mHu2*Qlp2*TrYvadjYv + 4*gpp2*mHu2*Qvp2*TrYvadjYv - 4*gpp2*QHup2*TrYvadjYvCml2 +& 
&  4*gpp2*Qlp2*TrYvadjYvCml2 + 4*gpp2*Qvp2*TrYvadjYvCml2 - 2._dp*(TrYvadjYvCml2TpYeCYe) -& 
&  6._dp*(TrYvadjYvCml2YvadjYv) - 2._dp*(TrYvadjYvTpTeCTe) - 2._dp*(TrYvadjYvTpYeCme2CYe) -& 
&  2*mHd2*TrYvadjYvTpYeCYe - 2*mHu2*TrYvadjYvTpYeCYe - 2._dp*(TrYvadjYvTpYeCYeCml2) -    & 
&  12._dp*(TrYvadjYvTvadjTv) - 12*mHu2*TrYvadjYvYvadjYv - 6._dp*(TrYvadjYvYvadjYvCml2) - & 
&  6._dp*(TrYvadjYvYvCmv2adjYv) - 4*gpp2*QHup2*TrYvCmv2adjYv + 4*gpp2*Qlp2*TrYvCmv2adjYv +& 
&  4*gpp2*Qvp2*TrYvCmv2adjYv - 2._dp*(TrYvCmv2adjYvTpYeCYe) - 6._dp*(TrYvCmv2adjYvYvadjYv) +& 
&  (g1p2*(621*g1p2*M1 + 45*g2p2*(2._dp*(M1) + M2) + 60*gpp2*(2._dp*(M1) + M4)*QHu*(3._dp*(Qd) +& 
&  3._dp*(Qe) - QHd + 2._dp*(QHu) - 3._dp*(Ql) + 3._dp*(Qq) - 6._dp*(Qu)) -              & 
&  40._dp*(TradjYuTu) + 80*M1*TrYuadjYu)*Conjg(M1))/25._dp - 32*g3p2*TradjYuTu*Conjg(M3) +& 
&  (9*g1p2*g2p2*M1*Conjg(M2))/5._dp + 12*g2p2*gpp2*M4*QHup2*Conjg(M2) - 4*gpp2*M4*QHdp2*lam*Conjg(Tlam) +& 
&  4*gpp2*M4*QHup2*lam*Conjg(Tlam) - 4*gpp2*M4*Qsp2*lam*Conjg(Tlam) - 6*TradjYdTd*lam*Conjg(Tlam) -& 
&  2*TradjYeTe*lam*Conjg(Tlam) + (4*gpp2*Conjg(M4)*(9*g1p2*M1*Qd*QHu + 18*g1p2*M4*Qd*QHu +& 
&  9*g1p2*M1*Qe*QHu + 18*g1p2*M4*Qe*QHu - 3*g1p2*M1*QHd*QHu - 6*g1p2*M4*QHd*QHu +        & 
&  6*g1p2*M1*QHup2 + 12*g1p2*M4*QHup2 + 30*g2p2*M4*QHup2 + 15*g2p2*M2*QHup2 +            & 
&  270*gpp2*M4*Qdp2*QHup2 + 90*gpp2*M4*Qep2*QHup2 + 60*gpp2*M4*QHdp2*QHup2 +             & 
&  120*gpp2*M4*QHup4 - 9*g1p2*M1*QHu*Ql - 18*g1p2*M4*QHu*Ql + 180*gpp2*M4*QHup2*Qlp2 +   & 
&  9*g1p2*M1*QHu*Qq + 18*g1p2*M4*QHu*Qq + 540*gpp2*M4*QHup2*Qqp2 + 30*gpp2*M4*QHup2*Qs1p2 +& 
&  30*gpp2*M4*QHup2*Qs2p2 + 30*gpp2*M4*QHup2*Qs3p2 + 30*gpp2*M4*QHup2*Qsp2 -             & 
&  18*g1p2*M1*QHu*Qu - 36*g1p2*M4*QHu*Qu + 270*gpp2*M4*QHup2*Qup2 + 90*gpp2*M4*QHup2*Qvp2 +& 
&  15*QHup2*TradjYuTu - 15*Qqp2*TradjYuTu - 15*Qup2*TradjYuTu + 5*QHup2*TradjYvTv -      & 
&  5*Qlp2*TradjYvTv - 5*Qvp2*TradjYvTv - 30*M4*(QHup2 - Qqp2 - Qup2)*TrYuadjYu -         & 
&  10*M4*QHup2*TrYvadjYv + 10*M4*Qlp2*TrYvadjYv + 10*M4*Qvp2*TrYvadjYv + 5*(QHdp2 -      & 
&  QHup2 + Qsp2)*Conjg(lam)*(2*M4*lam - Tlam)))/5._dp - 6*TrCTdTpYd*Conjg(lam)*Tlam  
betamHu22 =  betamHu22- 2*TrCTeTpYe*Conjg(lam)*Tlam + 6*g2p4*Tr2(2) + (6*g1p2*Tr2U1(1,1))/5._dp +             & 
&  4*g1*gp*QHu*sqrt3ov5*Tr2U1(1,4) + 4*g1*gp*QHu*sqrt3ov5*Tr2U1(4,1) + 8*gpp2*QHup2*Tr2U1(4,& 
& 4) + 4*g1*sqrt3ov5*Tr3(1) + 8*gp*QHu*Tr3(4)

 
DmHu2 = oo16pi2*( betamHu21 + oo16pi2 * betamHu22 ) 

 
Else 
DmHu2 = oo16pi2* betamHu21 
End If 
 
 
!-------------------- 
! md2 
!-------------------- 
 
betamd21  = (-8*AbsM1*g1p2*id3R)/15._dp - (32*AbsM3*g3p2*id3R)/3._dp + 2._dp*(md2YdadjYd)& 
&  - 8*AbsM4*gpp2*id3R*Qdp2 + 4._dp*(TdadjTd) + 4*mHd2*YdadjYd + 2._dp*(YdadjYdmd2)      & 
&  + 4._dp*(Ydmq2adjYd) + 2*g1*id3R*ooSqrt15*Tr1(1) + 2*gp*id3R*Qd*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betamd22 = -2*Abslam*md2YdadjYd + (2*g1p2*md2YdadjYd)/5._dp + 6*g2p2*md2YdadjYd - 2._dp*(md2YdadjYdYdadjYd) -& 
&  2._dp*(md2YdadjYuYuadjYd) + (176*AbsM4*g1p2*gpp2*id3R*Qdp2)/15._dp + (128*AbsM4*g3p2*gpp2*id3R*Qdp2)/3._dp -& 
&  4*gpp2*md2YdadjYd*Qdp2 + 264*AbsM4*gpp4*id3R*Qdp4 + (48*AbsM4*g1p2*gpp2*id3R*Qd*Qe)/5._dp +& 
&  72*AbsM4*gpp4*id3R*Qdp2*Qep2 - (16*AbsM4*g1p2*gpp2*id3R*Qd*QHd)/5._dp +               & 
&  4*gpp2*md2YdadjYd*QHdp2 + 48*AbsM4*gpp4*id3R*Qdp2*QHdp2 + (16*AbsM4*g1p2*gpp2*id3R*Qd*QHu)/5._dp +& 
&  48*AbsM4*gpp4*id3R*Qdp2*QHup2 - (48*AbsM4*g1p2*gpp2*id3R*Qd*Ql)/5._dp +               & 
&  144*AbsM4*gpp4*id3R*Qdp2*Qlp2 + (48*AbsM4*g1p2*gpp2*id3R*Qd*Qq)/5._dp +               & 
&  4*gpp2*md2YdadjYd*Qqp2 + 432*AbsM4*gpp4*id3R*Qdp2*Qqp2 + 24*AbsM4*gpp4*id3R*Qdp2*Qs1p2 +& 
&  24*AbsM4*gpp4*id3R*Qdp2*Qs2p2 + 24*AbsM4*gpp4*id3R*Qdp2*Qs3p2 + 24*AbsM4*gpp4*id3R*Qdp2*Qsp2 -& 
&  (96*AbsM4*g1p2*gpp2*id3R*Qd*Qu)/5._dp + 216*AbsM4*gpp4*id3R*Qdp2*Qup2 +               & 
&  72*AbsM4*gpp4*id3R*Qdp2*Qvp2 - 4*Abslam*TdadjTd + (4*g1p2*TdadjTd)/5._dp +            & 
&  12*g2p2*TdadjTd - 8*gpp2*Qdp2*TdadjTd + 8*gpp2*QHdp2*TdadjTd + 8*gpp2*Qqp2*TdadjTd -  & 
&  4._dp*(TdadjTdYdadjYd) - 4._dp*(TdadjTuYuadjYd) - 4._dp*(TdadjYdYdadjTd) -            & 
&  4._dp*(TdadjYuYuadjTd) - 12*TdadjYd*TrCTdTpYd - 4*TdadjYd*TrCTeTpYe - 6*md2YdadjYd*TrYdadjYd -& 
&  12*TdadjTd*TrYdadjYd - 2*md2YdadjYd*TrYeadjYe - 4*TdadjTd*TrYeadjYe - (4*g1p2*M1*YdadjTd)/5._dp -& 
&  12*g2p2*M2*YdadjTd + 8*gpp2*M4*Qdp2*YdadjTd - 8*gpp2*M4*QHdp2*YdadjTd -               & 
&  8*gpp2*M4*Qqp2*YdadjTd - 12*TradjYdTd*YdadjTd - 4*TradjYeTe*YdadjTd - 4._dp*(YdadjTdTdadjYd) -& 
&  4._dp*(YdadjTuTuadjYd) - 4*AbsTlam*YdadjYd + 24*AbsM2*g2p2*YdadjYd - 8*Abslam*mHd2*YdadjYd +& 
&  (4*g1p2*mHd2*YdadjYd)/5._dp + 12*g2p2*mHd2*YdadjYd - 4*Abslam*mHu2*YdadjYd -          & 
&  4*Abslam*ms2*YdadjYd - 16*AbsM4*gpp2*Qdp2*YdadjYd - 8*gpp2*mHd2*Qdp2*YdadjYd +        & 
&  16*AbsM4*gpp2*QHdp2*YdadjYd + 8*gpp2*mHd2*QHdp2*YdadjYd + 16*AbsM4*gpp2*Qqp2*YdadjYd  
betamd22 =  betamd22+ 8*gpp2*mHd2*Qqp2*YdadjYd - 12*TrCTdTpTd*YdadjYd - 4*TrCTeTpTe*YdadjYd -               & 
&  12*Trmd2YdadjYd*YdadjYd - 4*Trme2YeadjYe*YdadjYd - 4*Trml2adjYeYe*YdadjYd -           & 
&  12*Trmq2adjYdYd*YdadjYd - 24*mHd2*TrYdadjYd*YdadjYd - 8*mHd2*TrYeadjYe*YdadjYd -      & 
&  2*Abslam*YdadjYdmd2 + (2*g1p2*YdadjYdmd2)/5._dp + 6*g2p2*YdadjYdmd2 - 4*gpp2*Qdp2*YdadjYdmd2 +& 
&  4*gpp2*QHdp2*YdadjYdmd2 + 4*gpp2*Qqp2*YdadjYdmd2 - 6*TrYdadjYd*YdadjYdmd2 -           & 
&  2*TrYeadjYe*YdadjYdmd2 - 4._dp*(YdadjYdmd2YdadjYd) - 4._dp*(YdadjYdTdadjTd) -         & 
&  8*mHd2*YdadjYdYdadjYd - 2._dp*(YdadjYdYdadjYdmd2) - 4._dp*(YdadjYdYdmq2adjYd) -       & 
&  4._dp*(YdadjYumu2YuadjYd) - 4._dp*(YdadjYuTuadjTd) - 4*mHd2*YdadjYuYuadjYd -          & 
&  4*mHu2*YdadjYuYuadjYd - 2._dp*(YdadjYuYuadjYdmd2) - 4._dp*(YdadjYuYumq2adjYd) -       & 
&  4*Abslam*Ydmq2adjYd + (4*g1p2*Ydmq2adjYd)/5._dp + 12*g2p2*Ydmq2adjYd - 8*gpp2*Qdp2*Ydmq2adjYd +& 
&  8*gpp2*QHdp2*Ydmq2adjYd + 8*gpp2*Qqp2*Ydmq2adjYd - 12*TrYdadjYd*Ydmq2adjYd -          & 
&  4*TrYeadjYe*Ydmq2adjYd - 4._dp*(Ydmq2adjYdYdadjYd) - 4._dp*(Ydmq2adjYuYuadjYd) +      & 
&  (4*g1p2*(2*id3R*(303*g1p2*M1 + 40*g3p2*(2._dp*(M1) + M3) + 15*gpp2*(2._dp*(M1) +      & 
&  M4)*Qd*(11._dp*(Qd) + 3*(3._dp*(Qe) - QHd + QHu - 3._dp*(Ql) + 3._dp*(Qq) -           & 
&  6._dp*(Qu)))) - 45._dp*(TdadjYd) + 90*M1*YdadjYd)*Conjg(M1))/225._dp - (64*g3p2*id3R*(30*g3p2*M3 -& 
&  g1p2*(M1 + 2._dp*(M3)) - 15*gpp2*(2._dp*(M3) + M4)*Qdp2)*Conjg(M3))/45._dp +          & 
&  (88*g1p2*gpp2*id3R*M1*Qdp2*Conjg(M4))/15._dp + (64*g3p2*gpp2*id3R*M3*Qdp2*Conjg(M4))/3._dp +& 
&  (24*g1p2*gpp2*id3R*M1*Qd*Qe*Conjg(M4))/5._dp - (8*g1p2*gpp2*id3R*M1*Qd*QHd*Conjg(M4))/5._dp +& 
&  (8*g1p2*gpp2*id3R*M1*Qd*QHu*Conjg(M4))/5._dp - (24*g1p2*gpp2*id3R*M1*Qd*Ql*Conjg(M4))/5._dp +& 
&  (24*g1p2*gpp2*id3R*M1*Qd*Qq*Conjg(M4))/5._dp - (48*g1p2*gpp2*id3R*M1*Qd*Qu*Conjg(M4))/5._dp +& 
&  8*gpp2*Qdp2*TdadjYd*Conjg(M4) - 8*gpp2*QHdp2*TdadjYd*Conjg(M4) - 8*gpp2*Qqp2*TdadjYd*Conjg(M4)  
betamd22 =  betamd22- 12*g2p2*TdadjYd*Conjg(M2) - 4*TdadjYd*lam*Conjg(Tlam) - 4*YdadjTd*Conjg(lam)*Tlam +   & 
&  (32*g3p4*id3R*Tr2(3))/3._dp + (8*g1p2*id3R*Tr2U1(1,1))/15._dp + 8*g1*gp*id3R*ooSqrt15*Qd*Tr2U1(1,& 
& 4) + 8*g1*gp*id3R*ooSqrt15*Qd*Tr2U1(4,1) + 8*gpp2*id3R*Qdp2*Tr2U1(4,4) +               & 
&  8*g1*id3R*ooSqrt15*Tr3(1) + 8*gp*id3R*Qd*Tr3(4)

 
Dmd2 = oo16pi2*( betamd21 + oo16pi2 * betamd22 ) 

 
Else 
Dmd2 = oo16pi2* betamd21 
End If 
 
 
Call Chop(Dmd2) 

Forall(i1=1:3) Dmd2(i1,i1) =  Real(Dmd2(i1,i1),dp) 
Dmd2 = 0.5_dp*(Dmd2+ Conjg(Transpose(Dmd2)) ) 
!-------------------- 
! mu2 
!-------------------- 
 
betamu21  = (-32*AbsM1*g1p2*id3R)/15._dp - (32*AbsM3*g3p2*id3R)/3._dp +               & 
&  2._dp*(mu2YuadjYu) - 8*AbsM4*gpp2*id3R*Qup2 + 4._dp*(TuadjTu) + 4*mHu2*YuadjYu +      & 
&  2._dp*(YuadjYumu2) + 4._dp*(Yumq2adjYu) - 4*g1*id3R*ooSqrt15*Tr1(1) + 2*gp*id3R*Qu*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betamu22 = -2._dp*(mu2YuadjYdYdadjYu) - 2*Abslam*mu2YuadjYu - (2*g1p2*mu2YuadjYu)/5._dp +        & 
&  6*g2p2*mu2YuadjYu - 2._dp*(mu2YuadjYuYuadjYu) + 4*gpp2*mu2YuadjYu*QHup2 +             & 
&  4*gpp2*mu2YuadjYu*Qqp2 - (96*AbsM4*g1p2*gpp2*id3R*Qd*Qu)/5._dp - (96*AbsM4*g1p2*gpp2*id3R*Qe*Qu)/5._dp +& 
&  (32*AbsM4*g1p2*gpp2*id3R*QHd*Qu)/5._dp - (32*AbsM4*g1p2*gpp2*id3R*QHu*Qu)/5._dp +     & 
&  (96*AbsM4*g1p2*gpp2*id3R*Ql*Qu)/5._dp - (96*AbsM4*g1p2*gpp2*id3R*Qq*Qu)/5._dp +       & 
&  (704*AbsM4*g1p2*gpp2*id3R*Qup2)/15._dp + (128*AbsM4*g3p2*gpp2*id3R*Qup2)/3._dp -      & 
&  4*gpp2*mu2YuadjYu*Qup2 + 216*AbsM4*gpp4*id3R*Qdp2*Qup2 + 72*AbsM4*gpp4*id3R*Qep2*Qup2 +& 
&  48*AbsM4*gpp4*id3R*QHdp2*Qup2 + 48*AbsM4*gpp4*id3R*QHup2*Qup2 + 144*AbsM4*gpp4*id3R*Qlp2*Qup2 +& 
&  432*AbsM4*gpp4*id3R*Qqp2*Qup2 + 24*AbsM4*gpp4*id3R*Qs1p2*Qup2 + 24*AbsM4*gpp4*id3R*Qs2p2*Qup2 +& 
&  24*AbsM4*gpp4*id3R*Qs3p2*Qup2 + 24*AbsM4*gpp4*id3R*Qsp2*Qup2 + 264*AbsM4*gpp4*id3R*Qup4 +& 
&  72*AbsM4*gpp4*id3R*Qup2*Qvp2 - 6*mu2YuadjYu*TrYuadjYu - 2*mu2YuadjYu*TrYvadjYv -      & 
&  4._dp*(TuadjTdYdadjYu) - 4*Abslam*TuadjTu - (4*g1p2*TuadjTu)/5._dp + 12*g2p2*TuadjTu +& 
&  8*gpp2*QHup2*TuadjTu + 8*gpp2*Qqp2*TuadjTu - 8*gpp2*Qup2*TuadjTu - 12*TrYuadjYu*TuadjTu -& 
&  4*TrYvadjYv*TuadjTu - 4._dp*(TuadjTuYuadjYu) - 4._dp*(TuadjYdYdadjTu) -               & 
&  12*TrCTuTpYu*TuadjYu - 4*TrCTvTpYv*TuadjYu - 4._dp*(TuadjYuYuadjTu) - 4._dp*(YuadjTdTdadjYu) +& 
&  (4*g1p2*M1*YuadjTu)/5._dp - 12*g2p2*M2*YuadjTu - 8*gpp2*M4*QHup2*YuadjTu -            & 
&  8*gpp2*M4*Qqp2*YuadjTu + 8*gpp2*M4*Qup2*YuadjTu - 12*TradjYuTu*YuadjTu -              & 
&  4*TradjYvTv*YuadjTu - 4._dp*(YuadjTuTuadjYu) - 4._dp*(YuadjYdmd2YdadjYu) -            & 
&  4._dp*(YuadjYdTdadjTu) - 4*mHd2*YuadjYdYdadjYu - 4*mHu2*YuadjYdYdadjYu -              & 
&  2._dp*(YuadjYdYdadjYumu2) - 4._dp*(YuadjYdYdmq2adjYu) - 4*AbsTlam*YuadjYu +           & 
&  24*AbsM2*g2p2*YuadjYu - 4*Abslam*mHd2*YuadjYu - 8*Abslam*mHu2*YuadjYu  
betamu22 =  betamu22- (4*g1p2*mHu2*YuadjYu)/5._dp + 12*g2p2*mHu2*YuadjYu - 4*Abslam*ms2*YuadjYu +           & 
&  16*AbsM4*gpp2*QHup2*YuadjYu + 8*gpp2*mHu2*QHup2*YuadjYu + 16*AbsM4*gpp2*Qqp2*YuadjYu +& 
&  8*gpp2*mHu2*Qqp2*YuadjYu - 16*AbsM4*gpp2*Qup2*YuadjYu - 8*gpp2*mHu2*Qup2*YuadjYu -    & 
&  12*TrCTuTpTu*YuadjYu - 4*TrCTvTpTv*YuadjYu - 12*Trmq2adjYuYu*YuadjYu - 12*Trmu2YuadjYu*YuadjYu -& 
&  24*mHu2*TrYuadjYu*YuadjYu - 8*mHu2*TrYvadjYv*YuadjYu - 4*TrYvadjYvCml2*YuadjYu -      & 
&  4*TrYvCmv2adjYv*YuadjYu - 2*Abslam*YuadjYumu2 - (2*g1p2*YuadjYumu2)/5._dp +           & 
&  6*g2p2*YuadjYumu2 + 4*gpp2*QHup2*YuadjYumu2 + 4*gpp2*Qqp2*YuadjYumu2 - 4*gpp2*Qup2*YuadjYumu2 -& 
&  6*TrYuadjYu*YuadjYumu2 - 2*TrYvadjYv*YuadjYumu2 - 4._dp*(YuadjYumu2YuadjYu) -         & 
&  4._dp*(YuadjYuTuadjTu) - 8*mHu2*YuadjYuYuadjYu - 2._dp*(YuadjYuYuadjYumu2) -          & 
&  4._dp*(YuadjYuYumq2adjYu) - 4._dp*(Yumq2adjYdYdadjYu) - 4*Abslam*Yumq2adjYu -         & 
&  (4*g1p2*Yumq2adjYu)/5._dp + 12*g2p2*Yumq2adjYu + 8*gpp2*QHup2*Yumq2adjYu +            & 
&  8*gpp2*Qqp2*Yumq2adjYu - 8*gpp2*Qup2*Yumq2adjYu - 12*TrYuadjYu*Yumq2adjYu -           & 
&  4*TrYvadjYv*Yumq2adjYu - 4._dp*(Yumq2adjYuYuadjYu) + (4*g1p2*(4*id3R*(642*g1p2*M1 +   & 
&  80*g3p2*(2._dp*(M1) + M3) - 15*gpp2*(2._dp*(M1) + M4)*(9._dp*(Qd) + 9._dp*(Qe) -      & 
&  3._dp*(QHd) + 3._dp*(QHu) - 9._dp*(Ql) + 9._dp*(Qq) - 22._dp*(Qu))*Qu) +              & 
&  45*(TuadjYu - 2*M1*YuadjYu))*Conjg(M1))/225._dp - (64*g3p2*id3R*(30*g3p2*M3 -         & 
&  4*g1p2*(M1 + 2._dp*(M3)) - 15*gpp2*(2._dp*(M3) + M4)*Qup2)*Conjg(M3))/45._dp -        & 
&  (48*g1p2*gpp2*id3R*M1*Qd*Qu*Conjg(M4))/5._dp - (48*g1p2*gpp2*id3R*M1*Qe*Qu*Conjg(M4))/5._dp +& 
&  (16*g1p2*gpp2*id3R*M1*QHd*Qu*Conjg(M4))/5._dp - (16*g1p2*gpp2*id3R*M1*QHu*Qu*Conjg(M4))/5._dp +& 
&  (48*g1p2*gpp2*id3R*M1*Ql*Qu*Conjg(M4))/5._dp - (48*g1p2*gpp2*id3R*M1*Qq*Qu*Conjg(M4))/5._dp +& 
&  (352*g1p2*gpp2*id3R*M1*Qup2*Conjg(M4))/15._dp + (64*g3p2*gpp2*id3R*M3*Qup2*Conjg(M4))/3._dp  
betamu22 =  betamu22- 8*gpp2*QHup2*TuadjYu*Conjg(M4) - 8*gpp2*Qqp2*TuadjYu*Conjg(M4) + 8*gpp2*Qup2*TuadjYu*Conjg(M4) -& 
&  12*g2p2*TuadjYu*Conjg(M2) - 4*TuadjYu*lam*Conjg(Tlam) - 4*YuadjTu*Conjg(lam)*Tlam +   & 
&  (32*g3p4*id3R*Tr2(3))/3._dp + (32*g1p2*id3R*Tr2U1(1,1))/15._dp - 16*g1*gp*id3R*ooSqrt15*Qu*Tr2U1(1,& 
& 4) - 16*g1*gp*id3R*ooSqrt15*Qu*Tr2U1(4,1) + 8*gpp2*id3R*Qup2*Tr2U1(4,4) -              & 
&  16*g1*id3R*ooSqrt15*Tr3(1) + 8*gp*id3R*Qu*Tr3(4)

 
Dmu2 = oo16pi2*( betamu21 + oo16pi2 * betamu22 ) 

 
Else 
Dmu2 = oo16pi2* betamu21 
End If 
 
 
Call Chop(Dmu2) 

Forall(i1=1:3) Dmu2(i1,i1) =  Real(Dmu2(i1,i1),dp) 
Dmu2 = 0.5_dp*(Dmu2+ Conjg(Transpose(Dmu2)) ) 
!-------------------- 
! me2 
!-------------------- 
 
betame21  = (-24*AbsM1*g1p2*id3R)/5._dp + 2._dp*(me2YeadjYe) - 8*AbsM4*gpp2*id3R*Qep2 +& 
&  4._dp*(TeadjTe) + 4*mHd2*YeadjYe + 2._dp*(YeadjYeme2) + 4._dp*(Yeml2adjYe)            & 
&  + 2*g1*id3R*sqrt3ov5*Tr1(1) + 2*gp*id3R*Qe*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betame22 = -2*Abslam*me2YeadjYe - (6*g1p2*me2YeadjYe)/5._dp + 6*g2p2*me2YeadjYe - 2._dp*(me2YeadjYeYeadjYe) -& 
&  2._dp*(me2YeCYvTpYvadjYe) - 4*gpp2*me2YeadjYe*Qep2 + 4*gpp2*me2YeadjYe*QHdp2 +        & 
&  4*gpp2*me2YeadjYe*Qlp2 - 4*Abslam*TeadjTe - (12*g1p2*TeadjTe)/5._dp + 12*g2p2*TeadjTe -& 
&  8*gpp2*Qep2*TeadjTe + 8*gpp2*QHdp2*TeadjTe + 8*gpp2*Qlp2*TeadjTe - 4._dp*(TeadjTeYeadjYe) -& 
&  4._dp*(TeadjYeYeadjTe) - 4._dp*(TeCTvTpYvadjYe) - 4._dp*(TeCYvTpYvadjTe) -            & 
&  12*TeadjYe*TrCTdTpYd - 4*TeadjYe*TrCTeTpYe - 6*me2YeadjYe*TrYdadjYd - 12*TeadjTe*TrYdadjYd -& 
&  2*me2YeadjYe*TrYeadjYe - 4*TeadjTe*TrYeadjYe + (12*g1p2*M1*YeadjTe)/5._dp -           & 
&  12*g2p2*M2*YeadjTe + 8*gpp2*M4*Qep2*YeadjTe - 8*gpp2*M4*QHdp2*YeadjTe -               & 
&  8*gpp2*M4*Qlp2*YeadjTe - 12*TradjYdTd*YeadjTe - 4*TradjYeTe*YeadjTe - 4._dp*(YeadjTeTeadjYe) -& 
&  4*AbsTlam*YeadjYe + 24*AbsM2*g2p2*YeadjYe - 8*Abslam*mHd2*YeadjYe - (12*g1p2*mHd2*YeadjYe)/5._dp +& 
&  12*g2p2*mHd2*YeadjYe - 4*Abslam*mHu2*YeadjYe - 4*Abslam*ms2*YeadjYe - 8*gpp2*mHd2*Qep2*YeadjYe +& 
&  8*gpp2*mHd2*QHdp2*YeadjYe + 8*gpp2*mHd2*Qlp2*YeadjYe - 12*TrCTdTpTd*YeadjYe -         & 
&  4*TrCTeTpTe*YeadjYe - 12*Trmd2YdadjYd*YeadjYe - 4*Trme2YeadjYe*YeadjYe -              & 
&  4*Trml2adjYeYe*YeadjYe - 12*Trmq2adjYdYd*YeadjYe - 24*mHd2*TrYdadjYd*YeadjYe -        & 
&  8*mHd2*TrYeadjYe*YeadjYe - 2*Abslam*YeadjYeme2 - (6*g1p2*YeadjYeme2)/5._dp +          & 
&  6*g2p2*YeadjYeme2 - 4*gpp2*Qep2*YeadjYeme2 + 4*gpp2*QHdp2*YeadjYeme2 + 4*gpp2*Qlp2*YeadjYeme2 -& 
&  6*TrYdadjYd*YeadjYeme2 - 2*TrYeadjYe*YeadjYeme2 - 4._dp*(YeadjYeme2YeadjYe) -         & 
&  4._dp*(YeadjYeTeadjTe) - 8*mHd2*YeadjYeYeadjYe - 2._dp*(YeadjYeYeadjYeme2) -          & 
&  4._dp*(YeadjYeYeml2adjYe) - 4._dp*(YeCTvTpTvadjYe) - 4._dp*(YeCYvmv2TpYvadjYe) -      & 
&  4._dp*(YeCYvTpTvadjTe) - 4*mHd2*YeCYvTpYvadjYe - 4*mHu2*YeCYvTpYvadjYe -              & 
&  2._dp*(YeCYvTpYvadjYeme2) - 4._dp*(YeCYvTpYvml2adjYe) - 4*Abslam*Yeml2adjYe  
betame22 =  betame22- (12*g1p2*Yeml2adjYe)/5._dp + 12*g2p2*Yeml2adjYe - 8*gpp2*Qep2*Yeml2adjYe +            & 
&  8*gpp2*QHdp2*Yeml2adjYe + 8*gpp2*Qlp2*Yeml2adjYe - 12*TrYdadjYd*Yeml2adjYe -          & 
&  4*TrYeadjYe*Yeml2adjYe - 4._dp*(Yeml2adjYeYeadjYe) - 4._dp*(Yeml2CYvTpYvadjYe) +      & 
&  (12*g1p2*(2*id3R*(117*g1p2*M1 + 5*gpp2*(2._dp*(M1) + M4)*Qe*(3._dp*(Qd) +             & 
&  5._dp*(Qe) - QHd + QHu - 3._dp*(Ql) + 3._dp*(Qq) - 6._dp*(Qu))) + 5*(TeadjYe -        & 
&  2*M1*YeadjYe))*Conjg(M1))/25._dp + (8*gpp2*(3*id3R*Qe*(g1p2*(M1 + 2._dp*(M4))*(3._dp*(Qd) +& 
&  5._dp*(Qe) - QHd + QHu - 3._dp*(Ql) + 3._dp*(Qq) - 6._dp*(Qu)) + 5*gpp2*M4*Qe*(9._dp*(Qdp2) +& 
&  5._dp*(Qep2) + 2._dp*(QHdp2) + 2._dp*(QHup2) + 6._dp*(Qlp2) + 18._dp*(Qqp2) +         & 
&  Qs1p2 + Qs2p2 + Qs3p2 + Qsp2 + 9._dp*(Qup2) + 3._dp*(Qvp2))) - 5*(Qep2 -              & 
&  QHdp2 - Qlp2)*(-1._dp*(TeadjYe) + 2*M4*YeadjYe))*Conjg(M4))/5._dp - 12*g2p2*TeadjYe*Conjg(M2) -& 
&  4*TeadjYe*lam*Conjg(Tlam) - 4*YeadjTe*Conjg(lam)*Tlam + (24*g1p2*id3R*Tr2U1(1,        & 
& 1))/5._dp + 8*g1*gp*id3R*Qe*sqrt3ov5*Tr2U1(1,4) + 8*g1*gp*id3R*Qe*sqrt3ov5*Tr2U1(4,    & 
& 1) + 8*gpp2*id3R*Qep2*Tr2U1(4,4) + 8*g1*id3R*sqrt3ov5*Tr3(1) + 8*gp*id3R*Qe*Tr3(4)

 
Dme2 = oo16pi2*( betame21 + oo16pi2 * betame22 ) 

 
Else 
Dme2 = oo16pi2* betame21 
End If 
 
 
Call Chop(Dme2) 

Forall(i1=1:3) Dme2(i1,i1) =  Real(Dme2(i1,i1),dp) 
Dme2 = 0.5_dp*(Dme2+ Conjg(Transpose(Dme2)) ) 
!-------------------- 
! ms2 
!-------------------- 
 
betams21  = 4._dp*(AbsTlam) + 4*Abslam*(mHd2 + mHu2 + ms2) - 8*AbsM4*gpp2*Qsp2 +      & 
&  2*gp*Qs*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betams22 = (12*AbsTlam*g1p2)/5._dp + 12*AbsTlam*g2p2 - 16*Clamp2*lamp2*(mHd2 + mHu2 +            & 
&  ms2) + 8*AbsTlam*gpp2*QHdp2 + 8*AbsTlam*gpp2*QHup2 - 8*AbsTlam*gpp2*Qsp2 -            & 
&  12*AbsTlam*TrYdadjYd - 4*AbsTlam*TrYeadjYe - 12*AbsTlam*TrYuadjYu - 4*AbsTlam*TrYvadjYv -& 
&  (12*g1p2*M1*lam*Conjg(Tlam))/5._dp - 12*g2p2*M2*lam*Conjg(Tlam) - 8*gpp2*M4*QHdp2*lam*Conjg(Tlam) -& 
&  8*gpp2*M4*QHup2*lam*Conjg(Tlam) + 8*gpp2*M4*Qsp2*lam*Conjg(Tlam) - 12*TradjYdTd*lam*Conjg(Tlam) -& 
&  4*TradjYeTe*lam*Conjg(Tlam) - 12*TradjYuTu*lam*Conjg(Tlam) - 4*TradjYvTv*lam*Conjg(Tlam) +& 
&  8*Conjg(M4)*(3*gpp4*M4*Qsp2*(9._dp*(Qdp2) + 3._dp*(Qep2) + 2._dp*(QHdp2) +            & 
&  2._dp*(QHup2) + 6._dp*(Qlp2) + 18._dp*(Qqp2) + Qs1p2 + Qs2p2 + Qs3p2 + 3._dp*(Qsp2) + & 
&  9._dp*(Qup2) + 3._dp*(Qvp2)) + gpp2*(QHdp2 + QHup2 - Qsp2)*Conjg(lam)*(2*M4*lam -     & 
&  Tlam)) + (4*Conjg(lam)*(-40*AbsTlam*lam + 3*g1p2*mHd2*lam + 15*g2p2*mHd2*lam +        & 
&  3*g1p2*mHu2*lam + 15*g2p2*mHu2*lam + 3*g1p2*ms2*lam + 15*g2p2*ms2*lam +               & 
&  10*gpp2*mHd2*QHdp2*lam + 10*gpp2*mHu2*QHdp2*lam + 10*gpp2*ms2*QHdp2*lam +             & 
&  10*gpp2*mHd2*QHup2*lam + 10*gpp2*mHu2*QHup2*lam + 10*gpp2*ms2*QHup2*lam -             & 
&  10*gpp2*mHd2*Qsp2*lam - 10*gpp2*mHu2*Qsp2*lam - 10*gpp2*ms2*Qsp2*lam - 15*TrCTdTpTd*lam -& 
&  5*TrCTeTpTe*lam - 15*TrCTuTpTu*lam - 5*TrCTvTpTv*lam - 15*Trmd2YdadjYd*lam -          & 
&  5*Trme2YeadjYe*lam - 5*Trml2adjYeYe*lam - 15*Trmq2adjYdYd*lam - 15*Trmq2adjYuYu*lam - & 
&  15*Trmu2YuadjYu*lam - 30*mHd2*TrYdadjYd*lam - 15*mHu2*TrYdadjYd*lam - 15*ms2*TrYdadjYd*lam -& 
&  10*mHd2*TrYeadjYe*lam - 5*mHu2*TrYeadjYe*lam - 5*ms2*TrYeadjYe*lam - 15*mHd2*TrYuadjYu*lam -& 
&  30*mHu2*TrYuadjYu*lam - 15*ms2*TrYuadjYu*lam - 5*mHd2*TrYvadjYv*lam - 10*mHu2*TrYvadjYv*lam -& 
&  5*ms2*TrYvadjYv*lam - 5*TrYvadjYvCml2*lam - 5*TrYvCmv2adjYv*lam + 3*g1p2*Conjg(M1)*(2*M1*lam -& 
&  Tlam) + 15*g2p2*Conjg(M2)*(2*M2*lam - Tlam) - 15*TrCTdTpYd*Tlam - 5*TrCTeTpYe*Tlam -  & 
&  15*TrCTuTpYu*Tlam - 5*TrCTvTpYv*Tlam))/5._dp + 8*gpp2*Qsp2*Tr2U1(4,4)  
betams22 =  betams22+ 8*gp*Qs*Tr3(4)

 
Dms2 = oo16pi2*( betams21 + oo16pi2 * betams22 ) 

 
Else 
Dms2 = oo16pi2* betams21 
End If 
 
 
!-------------------- 
! ms12 
!-------------------- 
 
betams121  = (2*(AbsTk + Abskap*(ms12 + ms22 + ms32) - 36*AbsM4*gpp2*Qs1p2 +          & 
&  9*gp*Qs1*Tr1(4)))/9._dp

 
 
If (TwoLoopRGE) Then 
betams122 = (4*(-2*Ckapp2*kapp2*(ms12 + ms22 + ms32) + Abskap*(-4._dp*(AbsTk) - 9*gpp2*(ms12 +    & 
&  ms22 + ms32)*(Qs1p2 - Qs2p2 - Qs3p2)) + 9*Conjg(M4)*(54*gpp4*M4*Qs1p2*(9._dp*(Qdp2) + & 
&  3._dp*(Qep2) + 2._dp*(QHdp2) + 2._dp*(QHup2) + 6._dp*(Qlp2) + 18._dp*(Qqp2) +         & 
&  3._dp*(Qs1p2) + Qs2p2 + Qs3p2 + Qsp2 + 9._dp*(Qup2) + 3._dp*(Qvp2)) - gpp2*(Qs1p2 -   & 
&  Qs2p2 - Qs3p2)*Conjg(kap)*(2*M4*kap - Tk)) + 9*gp*(gp*(Qs1p2 - Qs2p2 - Qs3p2)*Conjg(Tk)*(M4*kap -& 
&  Tk) + 18*Qs1*(gp*Qs1*Tr2U1(4,4) + Tr3(4)))))/81._dp

 
Dms12 = oo16pi2*( betams121 + oo16pi2 * betams122 ) 

 
Else 
Dms12 = oo16pi2* betams121 
End If 
 
 
!-------------------- 
! ms22 
!-------------------- 
 
betams221  = (2*(AbsTk + Abskap*(ms12 + ms22 + ms32) - 36*AbsM4*gpp2*Qs2p2 +          & 
&  9*gp*Qs2*Tr1(4)))/9._dp

 
 
If (TwoLoopRGE) Then 
betams222 = (4*(-2*Ckapp2*kapp2*(ms12 + ms22 + ms32) + Abskap*(-4._dp*(AbsTk) + 9*gpp2*(ms12 +    & 
&  ms22 + ms32)*(Qs1p2 - Qs2p2 + Qs3p2)) + 9*Conjg(M4)*(54*gpp4*M4*Qs2p2*(9._dp*(Qdp2) + & 
&  3._dp*(Qep2) + 2._dp*(QHdp2) + 2._dp*(QHup2) + 6._dp*(Qlp2) + 18._dp*(Qqp2) +         & 
&  Qs1p2 + 3._dp*(Qs2p2) + Qs3p2 + Qsp2 + 9._dp*(Qup2) + 3._dp*(Qvp2)) + gpp2*(Qs1p2 -   & 
&  Qs2p2 + Qs3p2)*Conjg(kap)*(2*M4*kap - Tk)) + 9*gp*(-(gp*(Qs1p2 - Qs2p2 +              & 
&  Qs3p2)*Conjg(Tk)*(M4*kap - Tk)) + 18*Qs2*(gp*Qs2*Tr2U1(4,4) + Tr3(4)))))/81._dp

 
Dms22 = oo16pi2*( betams221 + oo16pi2 * betams222 ) 

 
Else 
Dms22 = oo16pi2* betams221 
End If 
 
 
!-------------------- 
! ms32 
!-------------------- 
 
betams321  = (2*(AbsTk + Abskap*(ms12 + ms22 + ms32) - 36*AbsM4*gpp2*Qs3p2 +          & 
&  9*gp*Qs3*Tr1(4)))/9._dp

 
 
If (TwoLoopRGE) Then 
betams322 = (4*(-2*Ckapp2*kapp2*(ms12 + ms22 + ms32) + Abskap*(-4._dp*(AbsTk) + 9*gpp2*(ms12 +    & 
&  ms22 + ms32)*(Qs1p2 + Qs2p2 - Qs3p2)) + 9*Conjg(M4)*(54*gpp4*M4*Qs3p2*(9._dp*(Qdp2) + & 
&  3._dp*(Qep2) + 2._dp*(QHdp2) + 2._dp*(QHup2) + 6._dp*(Qlp2) + 18._dp*(Qqp2) +         & 
&  Qs1p2 + Qs2p2 + 3._dp*(Qs3p2) + Qsp2 + 9._dp*(Qup2) + 3._dp*(Qvp2)) + gpp2*(Qs1p2 +   & 
&  Qs2p2 - Qs3p2)*Conjg(kap)*(2*M4*kap - Tk)) + 9*gp*(-(gp*(Qs1p2 + Qs2p2 -              & 
&  Qs3p2)*Conjg(Tk)*(M4*kap - Tk)) + 18*Qs3*(gp*Qs3*Tr2U1(4,4) + Tr3(4)))))/81._dp

 
Dms32 = oo16pi2*( betams321 + oo16pi2 * betams322 ) 

 
Else 
Dms32 = oo16pi2* betams321 
End If 
 
 
!-------------------- 
! mv2 
!-------------------- 
 
betamv21  = 2*(mv2TpYvCYv - 4*AbsM4*gpp2*id3R*Qvp2 + 2._dp*(TpTvCTv) + 2*mHu2*TpYvCYv +& 
&  TpYvCYvmv2 + 2._dp*(TpYvml2CYv) + gp*id3R*Qv*Tr1(4))

 
 
If (TwoLoopRGE) Then 
betamv22 = -2._dp*(mv2TpYvadjYeYeCYv) - 2*Abslam*mv2TpYvCYv + (6*g1p2*mv2TpYvCYv)/5._dp +        & 
&  6*g2p2*mv2TpYvCYv - 2._dp*(mv2TpYvCYvTpYvCYv) + 4*gpp2*mv2TpYvCYv*QHup2 +             & 
&  4*gpp2*mv2TpYvCYv*Qlp2 - 4*gpp2*mv2TpYvCYv*Qvp2 - 4._dp*(TpTvadjTeYeCYv) -            & 
&  4._dp*(TpTvadjYeYeCTv) - 4*Abslam*TpTvCTv + (12*g1p2*TpTvCTv)/5._dp + 12*g2p2*TpTvCTv +& 
&  8*gpp2*QHup2*TpTvCTv + 8*gpp2*Qlp2*TpTvCTv - 8*gpp2*Qvp2*TpTvCTv - 4._dp*(TpTvCTvTpYvCYv) -& 
&  4._dp*(TpTvCYvTpYvCTv) - 4._dp*(TpYvadjTeTeCYv) - 4._dp*(TpYvadjYeme2YeCYv) -         & 
&  4._dp*(TpYvadjYeTeCTv) - 4*mHd2*TpYvadjYeYeCYv - 4*mHu2*TpYvadjYeYeCYv -              & 
&  2._dp*(TpYvadjYeYeCYvmv2) - 4._dp*(TpYvadjYeYeml2CYv) - (12*g1p2*M1*TpYvCTv)/5._dp -  & 
&  12*g2p2*M2*TpYvCTv - 8*gpp2*M4*QHup2*TpYvCTv - 8*gpp2*M4*Qlp2*TpYvCTv +               & 
&  8*gpp2*M4*Qvp2*TpYvCTv - 4._dp*(TpYvCTvTpTvCYv) - 4*AbsTlam*TpYvCYv + (24*AbsM1*g1p2*TpYvCYv)/5._dp +& 
&  24*AbsM2*g2p2*TpYvCYv - 4*Abslam*mHd2*TpYvCYv - 8*Abslam*mHu2*TpYvCYv +               & 
&  (12*g1p2*mHu2*TpYvCYv)/5._dp + 12*g2p2*mHu2*TpYvCYv - 4*Abslam*ms2*TpYvCYv +          & 
&  8*gpp2*mHu2*QHup2*TpYvCYv + 8*gpp2*mHu2*Qlp2*TpYvCYv - 8*gpp2*mHu2*Qvp2*TpYvCYv -     & 
&  2*Abslam*TpYvCYvmv2 + (6*g1p2*TpYvCYvmv2)/5._dp + 6*g2p2*TpYvCYvmv2 + 4*gpp2*QHup2*TpYvCYvmv2 +& 
&  4*gpp2*Qlp2*TpYvCYvmv2 - 4*gpp2*Qvp2*TpYvCYvmv2 - 4._dp*(TpYvCYvmv2TpYvCYv) -         & 
&  4._dp*(TpYvCYvTpTvCTv) - 8*mHu2*TpYvCYvTpYvCYv - 2._dp*(TpYvCYvTpYvCYvmv2) -          & 
&  4._dp*(TpYvCYvTpYvml2CYv) - 4._dp*(TpYvml2adjYeYeCYv) - 4*Abslam*TpYvml2CYv +         & 
&  (12*g1p2*TpYvml2CYv)/5._dp + 12*g2p2*TpYvml2CYv + 8*gpp2*QHup2*TpYvml2CYv +           & 
&  8*gpp2*Qlp2*TpYvml2CYv - 8*gpp2*Qvp2*TpYvml2CYv - 4._dp*(TpYvml2CYvTpYvCYv) -         & 
&  12*TpYvCTv*TradjYuTu - 4*TpYvCTv*TradjYvTv - 12*TpYvCYv*TrCTuTpTu - 12*TpTvCYv*TrCTuTpYu -& 
&  4*TpYvCYv*TrCTvTpTv - 4*TpTvCYv*TrCTvTpYv - 12*TpYvCYv*Trmq2adjYuYu - 12*TpYvCYv*Trmu2YuadjYu  
betamv22 =  betamv22- 6*mv2TpYvCYv*TrYuadjYu - 12*TpTvCTv*TrYuadjYu - 24*mHu2*TpYvCYv*TrYuadjYu -           & 
&  6*TpYvCYvmv2*TrYuadjYu - 12*TpYvml2CYv*TrYuadjYu - 2*mv2TpYvCYv*TrYvadjYv -           & 
&  4*TpTvCTv*TrYvadjYv - 8*mHu2*TpYvCYv*TrYvadjYv - 2*TpYvCYvmv2*TrYvadjYv -             & 
&  4*TpYvml2CYv*TrYvadjYv - 4*TpYvCYv*TrYvadjYvCml2 - 4*TpYvCYv*TrYvCmv2adjYv -          & 
&  (12*g1p2*TpTvCYv*Conjg(M1))/5._dp + 8*(3*gpp4*id3R*M4*Qvp2*(9._dp*(Qdp2) +            & 
&  3._dp*(Qep2) + 2._dp*(QHdp2) + 2._dp*(QHup2) + 6._dp*(Qlp2) + 18._dp*(Qqp2) +         & 
&  Qs1p2 + Qs2p2 + Qs3p2 + Qsp2 + 9._dp*(Qup2) + 5._dp*(Qvp2)) + gpp2*(QHup2 +           & 
&  Qlp2 - Qvp2)*(-1._dp*(TpTvCYv) + 2*M4*TpYvCYv))*Conjg(M4) - 12*g2p2*TpTvCYv*Conjg(M2) -& 
&  4*TpTvCYv*lam*Conjg(Tlam) - 4*TpYvCTv*Conjg(lam)*Tlam + 8*gp*id3R*Qv*(gp*Qv*Tr2U1(4,  & 
& 4) + Tr3(4))

 
Dmv2 = oo16pi2*( betamv21 + oo16pi2 * betamv22 ) 

 
Else 
Dmv2 = oo16pi2* betamv21 
End If 
 
 
Call Chop(Dmv2) 

Forall(i1=1:3) Dmv2(i1,i1) =  Real(Dmv2(i1,i1),dp) 
Dmv2 = 0.5_dp*(Dmv2+ Conjg(Transpose(Dmv2)) ) 
!-------------------- 
! M1 
!-------------------- 
 
betaM11  = (66*g1p2*M1)/5._dp

 
 
If (TwoLoopRGE) Then 
betaM12 = (2*g1p2*(398*g1p2*M1 + 135*g2p2*M1 + 440*g3p2*M1 + 440*g3p2*M3 + 135*g2p2*M2 +        & 
&  60*gpp2*M1*Qdp2 + 60*gpp2*M4*Qdp2 + 180*gpp2*M1*Qep2 + 180*gpp2*M4*Qep2 +             & 
&  30*gpp2*M1*QHdp2 + 30*gpp2*M4*QHdp2 + 30*gpp2*M1*QHup2 + 30*gpp2*M4*QHup2 +           & 
&  90*gpp2*M1*Qlp2 + 90*gpp2*M4*Qlp2 + 30*gpp2*M1*Qqp2 + 30*gpp2*M4*Qqp2 +               & 
&  240*gpp2*M1*Qup2 + 240*gpp2*M4*Qup2 + 70._dp*(TradjYdTd) + 90._dp*(TradjYeTe) +       & 
&  130._dp*(TradjYuTu) + 30._dp*(TradjYvTv) - 70*M1*TrYdadjYd - 90*M1*TrYeadjYe -        & 
&  130*M1*TrYuadjYu - 30*M1*TrYvadjYv - 30*Conjg(lam)*(M1*lam - Tlam)))/25._dp

 
DM1 = oo16pi2*( betaM11 + oo16pi2 * betaM12 ) 

 
Else 
DM1 = oo16pi2* betaM11 
End If 
 
 
Call Chop(DM1) 

!-------------------- 
! M2 
!-------------------- 
 
betaM21  = 2*g2p2*M2

 
 
If (TwoLoopRGE) Then 
betaM22 = (2*g2p2*(9*g1p2*M1 + 120*g3p2*M3 + 9*g1p2*M2 + 250*g2p2*M2 + 120*g3p2*M2 +            & 
&  10*gpp2*M4*QHdp2 + 10*gpp2*M2*QHdp2 + 10*gpp2*M4*QHup2 + 10*gpp2*M2*QHup2 +           & 
&  30*gpp2*M4*Qlp2 + 30*gpp2*M2*Qlp2 + 90*gpp2*M4*Qqp2 + 90*gpp2*M2*Qqp2 +               & 
&  30._dp*(TradjYdTd) + 10._dp*(TradjYeTe) + 30._dp*(TradjYuTu) + 10._dp*(TradjYvTv) -   & 
&  30*M2*TrYdadjYd - 10*M2*TrYeadjYe - 30*M2*TrYuadjYu - 10*M2*TrYvadjYv -               & 
&  10*Conjg(lam)*(M2*lam - Tlam)))/5._dp

 
DM2 = oo16pi2*( betaM21 + oo16pi2 * betaM22 ) 

 
Else 
DM2 = oo16pi2* betaM21 
End If 
 
 
Call Chop(DM2) 

!-------------------- 
! M3 
!-------------------- 
 
betaM31  = -6*g3p2*M3

 
 
If (TwoLoopRGE) Then 
betaM32 = (2*g3p2*(11*g1p2*M1 + 11*g1p2*M3 + 45*g2p2*M3 + 140*g3p2*M3 + 45*g2p2*M2 +            & 
&  30*gpp2*M3*Qdp2 + 30*gpp2*M4*Qdp2 + 60*gpp2*M3*Qqp2 + 60*gpp2*M4*Qqp2 +               & 
&  30*gpp2*M3*Qup2 + 30*gpp2*M4*Qup2 + 20._dp*(TradjYdTd) + 20._dp*(TradjYuTu) -         & 
&  20*M3*TrYdadjYd - 20*M3*TrYuadjYu))/5._dp

 
DM3 = oo16pi2*( betaM31 + oo16pi2 * betaM32 ) 

 
Else 
DM3 = oo16pi2* betaM31 
End If 
 
 
Call Chop(DM3) 

!-------------------- 
! M4 
!-------------------- 
 
betaM41  = 2*gpp2*M4*(9._dp*(Qdp2) + 3._dp*(Qep2) + 2._dp*(QHdp2) + 2._dp*(QHup2)     & 
&  + 6._dp*(Qlp2) + 18._dp*(Qqp2) + Qs1p2 + Qs2p2 + Qs3p2 + Qsp2 + 9._dp*(Qup2)          & 
&  + 3._dp*(Qvp2))

 
 
If (TwoLoopRGE) Then 
betaM42 = (4*gpp2*(-5*(Qs1p2 + Qs2p2 + Qs3p2)*Conjg(kap)*(M4*kap - Tk) + 9*(6*g1p2*M1*Qdp2 +    & 
&  120*g3p2*M3*Qdp2 + 6*g1p2*M4*Qdp2 + 120*g3p2*M4*Qdp2 + 180*gpp2*M4*Qdp4 +             & 
&  18*g1p2*M1*Qep2 + 18*g1p2*M4*Qep2 + 60*gpp2*M4*Qep4 + 3*g1p2*M1*QHdp2 +               & 
&  3*g1p2*M4*QHdp2 + 15*g2p2*M4*QHdp2 + 15*g2p2*M2*QHdp2 + 40*gpp2*M4*QHdp4 +            & 
&  3*g1p2*M1*QHup2 + 3*g1p2*M4*QHup2 + 15*g2p2*M4*QHup2 + 15*g2p2*M2*QHup2 +             & 
&  40*gpp2*M4*QHup4 + 9*g1p2*M1*Qlp2 + 9*g1p2*M4*Qlp2 + 45*g2p2*M4*Qlp2 + 45*g2p2*M2*Qlp2 +& 
&  120*gpp2*M4*Qlp4 + 3*g1p2*M1*Qqp2 + 240*g3p2*M3*Qqp2 + 3*g1p2*M4*Qqp2 +               & 
&  135*g2p2*M4*Qqp2 + 240*g3p2*M4*Qqp2 + 135*g2p2*M2*Qqp2 + 360*gpp2*M4*Qqp4 +           & 
&  20*gpp2*M4*Qs1p4 + 20*gpp2*M4*Qs2p4 + 20*gpp2*M4*Qs3p4 + 20*gpp2*M4*Qsp4 +            & 
&  24*g1p2*M1*Qup2 + 120*g3p2*M3*Qup2 + 24*g1p2*M4*Qup2 + 120*g3p2*M4*Qup2 +             & 
&  180*gpp2*M4*Qup4 + 60*gpp2*M4*Qvp4 + 30*Qdp2*TradjYdTd + 30*QHdp2*TradjYdTd +         & 
&  30*Qqp2*TradjYdTd + 10*Qep2*TradjYeTe + 10*QHdp2*TradjYeTe + 10*Qlp2*TradjYeTe +      & 
&  30*QHup2*TradjYuTu + 30*Qqp2*TradjYuTu + 30*Qup2*TradjYuTu + 10*QHup2*TradjYvTv +     & 
&  10*Qlp2*TradjYvTv + 10*Qvp2*TradjYvTv - 30*M4*(Qdp2 + QHdp2 + Qqp2)*TrYdadjYd -       & 
&  10*M4*Qep2*TrYeadjYe - 10*M4*QHdp2*TrYeadjYe - 10*M4*Qlp2*TrYeadjYe - 30*M4*QHup2*TrYuadjYu -& 
&  30*M4*Qqp2*TrYuadjYu - 30*M4*Qup2*TrYuadjYu - 10*M4*QHup2*TrYvadjYv - 10*M4*Qlp2*TrYvadjYv -& 
&  10*M4*Qvp2*TrYvadjYv - 10*(QHdp2 + QHup2 + Qsp2)*Conjg(lam)*(M4*lam - Tlam))))/45._dp

 
DM4 = oo16pi2*( betaM41 + oo16pi2 * betaM42 ) 

 
Else 
DM4 = oo16pi2* betaM41 
End If 
 
 
Call Chop(DM4) 

Call ParametersToG278(Dg1,Dg2,Dg3,Dgp,DYd,DYe,Dlam,DYv,Dkap,DYu,DTd,DTe,              & 
& DTlam,DTv,DTk,DTu,Dmq2,Dml2,DmHd2,DmHu2,Dmd2,Dmu2,Dme2,Dms2,Dms12,Dms22,               & 
& Dms32,Dmv2,DM1,DM2,DM3,DM4,f)

Iname = Iname - 1 
 
End Subroutine rge278  

Subroutine GToParameters284(g,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,             & 
& Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,             & 
& vd,vu,vS,vS1,vS2,vS3)

Implicit None 
Real(dp), Intent(in) :: g(284) 
Real(dp),Intent(out) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp),Intent(out) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters284' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
gp= g(4) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+5), g(SumI+6), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+23), g(SumI+24), dp) 
End Do 
 End Do 
 
lam= Cmplx(g(41),g(42),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yv(i1,i2) = Cmplx( g(SumI+43), g(SumI+44), dp) 
End Do 
 End Do 
 
kap= Cmplx(g(61),g(62),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+63), g(SumI+64), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Td(i1,i2) = Cmplx( g(SumI+81), g(SumI+82), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Te(i1,i2) = Cmplx( g(SumI+99), g(SumI+100), dp) 
End Do 
 End Do 
 
Tlam= Cmplx(g(117),g(118),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Tv(i1,i2) = Cmplx( g(SumI+119), g(SumI+120), dp) 
End Do 
 End Do 
 
Tk= Cmplx(g(137),g(138),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Tu(i1,i2) = Cmplx( g(SumI+139), g(SumI+140), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mq2(i1,i2) = Cmplx( g(SumI+157), g(SumI+158), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
ml2(i1,i2) = Cmplx( g(SumI+175), g(SumI+176), dp) 
End Do 
 End Do 
 
mHd2= g(193) 
mHu2= g(194) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
md2(i1,i2) = Cmplx( g(SumI+195), g(SumI+196), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mu2(i1,i2) = Cmplx( g(SumI+213), g(SumI+214), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
me2(i1,i2) = Cmplx( g(SumI+231), g(SumI+232), dp) 
End Do 
 End Do 
 
ms2= g(249) 
ms12= g(250) 
ms22= g(251) 
ms32= g(252) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
mv2(i1,i2) = Cmplx( g(SumI+253), g(SumI+254), dp) 
End Do 
 End Do 
 
M1= Cmplx(g(271),g(272),dp) 
M2= Cmplx(g(273),g(274),dp) 
M3= Cmplx(g(275),g(276),dp) 
M4= Cmplx(g(277),g(278),dp) 
vd= g(279) 
vu= g(280) 
vS= g(281) 
vS1= g(282) 
vS2= g(283) 
vS3= g(284) 
Do i1=1,284 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters284

Subroutine ParametersToG284(g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,               & 
& Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,             & 
& vd,vu,vS,vS1,vS2,vS3,g)

Implicit None 
Real(dp), Intent(out) :: g(284) 
Real(dp), Intent(in) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp), Intent(in) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG284' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = gp  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+5) = Real(Yd(i1,i2), dp) 
g(SumI+6) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+23) = Real(Ye(i1,i2), dp) 
g(SumI+24) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

g(41) = Real(lam,dp)  
g(42) = Aimag(lam)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+43) = Real(Yv(i1,i2), dp) 
g(SumI+44) = Aimag(Yv(i1,i2)) 
End Do 
End Do 

g(61) = Real(kap,dp)  
g(62) = Aimag(kap)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+63) = Real(Yu(i1,i2), dp) 
g(SumI+64) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+81) = Real(Td(i1,i2), dp) 
g(SumI+82) = Aimag(Td(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+99) = Real(Te(i1,i2), dp) 
g(SumI+100) = Aimag(Te(i1,i2)) 
End Do 
End Do 

g(117) = Real(Tlam,dp)  
g(118) = Aimag(Tlam)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+119) = Real(Tv(i1,i2), dp) 
g(SumI+120) = Aimag(Tv(i1,i2)) 
End Do 
End Do 

g(137) = Real(Tk,dp)  
g(138) = Aimag(Tk)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+139) = Real(Tu(i1,i2), dp) 
g(SumI+140) = Aimag(Tu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+157) = Real(mq2(i1,i2), dp) 
g(SumI+158) = Aimag(mq2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+175) = Real(ml2(i1,i2), dp) 
g(SumI+176) = Aimag(ml2(i1,i2)) 
End Do 
End Do 

g(193) = mHd2  
g(194) = mHu2  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+195) = Real(md2(i1,i2), dp) 
g(SumI+196) = Aimag(md2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+213) = Real(mu2(i1,i2), dp) 
g(SumI+214) = Aimag(mu2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+231) = Real(me2(i1,i2), dp) 
g(SumI+232) = Aimag(me2(i1,i2)) 
End Do 
End Do 

g(249) = ms2  
g(250) = ms12  
g(251) = ms22  
g(252) = ms32  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+253) = Real(mv2(i1,i2), dp) 
g(SumI+254) = Aimag(mv2(i1,i2)) 
End Do 
End Do 

g(271) = Real(M1,dp)  
g(272) = Aimag(M1)  
g(273) = Real(M2,dp)  
g(274) = Aimag(M2)  
g(275) = Real(M3,dp)  
g(276) = Aimag(M3)  
g(277) = Real(M4,dp)  
g(278) = Aimag(M4)  
g(279) = vd  
g(280) = vu  
g(281) = vS  
g(282) = vS1  
g(283) = vS2  
g(284) = vS3  
Iname = Iname - 1 
 
End Subroutine ParametersToG284

Subroutine rge284(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,gp,betagp1,betagp2,Dgp,mHd2,betamHd21,betamHd22,DmHd2,mHu2,betamHu21,              & 
& betamHu22,DmHu2,ms2,betams21,betams22,Dms2,ms12,betams121,betams122,Dms12,             & 
& ms22,betams221,betams222,Dms22,ms32,betams321,betams322,Dms32,vd,betavd1,              & 
& betavd2,Dvd,vu,betavu1,betavu2,Dvu,vS,betavS1,betavS2,DvS,vS1,betavS11,betavS12,       & 
& DvS1,vS2,betavS21,betavS22,DvS2,vS3,betavS31,betavS32,DvS3
Complex(dp) :: Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3)          & 
& ,betaYe1(3,3),betaYe2(3,3),DYe(3,3),adjYe(3,3),lam,betalam1,betalam2,Dlam,             & 
& Yv(3,3),betaYv1(3,3),betaYv2(3,3),DYv(3,3),adjYv(3,3),kap,betakap1,betakap2,           & 
& Dkap,Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3),Td(3,3),betaTd1(3,3)        & 
& ,betaTd2(3,3),DTd(3,3),adjTd(3,3),Te(3,3),betaTe1(3,3),betaTe2(3,3),DTe(3,3)           & 
& ,adjTe(3,3),Tlam,betaTlam1,betaTlam2,DTlam,Tv(3,3),betaTv1(3,3),betaTv2(3,3)           & 
& ,DTv(3,3),adjTv(3,3),Tk,betaTk1,betaTk2,DTk,Tu(3,3),betaTu1(3,3),betaTu2(3,3)          & 
& ,DTu(3,3),adjTu(3,3),mq2(3,3),betamq21(3,3),betamq22(3,3),Dmq2(3,3),ml2(3,3)           & 
& ,betaml21(3,3),betaml22(3,3),Dml2(3,3),md2(3,3),betamd21(3,3),betamd22(3,3)            & 
& ,Dmd2(3,3),mu2(3,3),betamu21(3,3),betamu22(3,3),Dmu2(3,3),me2(3,3),betame21(3,3)       & 
& ,betame22(3,3),Dme2(3,3),mv2(3,3),betamv21(3,3),betamv22(3,3),Dmv2(3,3),               & 
& M1,betaM11,betaM12,DM1,M2,betaM21,betaM22,DM2,M3,betaM31,betaM32,DM3,M4,               & 
& betaM41,betaM42,DM4
Real(dp) :: Tr1(4),Tr2(4),Tr3(4) 
Real(dp) :: Tr2U1(4,4) 
Real(dp) :: Abslam,Abskap,AbsTlam,AbsTk,AbsM1,AbsM2,AbsM3,AbsM4
Complex(dp) :: md2Yd(3,3),me2Ye(3,3),ml2adjYe(3,3),ml2CYv(3,3),mq2adjYd(3,3),mq2adjYu(3,3),          & 
& mu2Yu(3,3),mv2TpYv(3,3),Ydmq2(3,3),YdadjYd(3,3),Yeml2(3,3),YeadjYe(3,3),               & 
& Yumq2(3,3),YuadjYu(3,3),YvadjYv(3,3),adjYdmd2(3,3),adjYdYd(3,3),adjYdTd(3,3),          & 
& adjYeme2(3,3),adjYeYe(3,3),adjYeTe(3,3),adjYumu2(3,3),adjYuYu(3,3),adjYuTu(3,3),       & 
& adjYvYv(3,3),adjYvCml2(3,3),adjYvTv(3,3),adjTdTd(3,3),adjTeTe(3,3),adjTuTu(3,3),       & 
& Cmv2adjYv(3,3),CYeYv(3,3),CYeTv(3,3),CYvmv2(3,3),CYvTpYv(3,3),CYvTpTv(3,3),            & 
& CTdTpTd(3,3),CTeTpTe(3,3),CTuTpTu(3,3),CTvTpTv(3,3),TdadjTd(3,3),TeadjTe(3,3),         & 
& TuadjTu(3,3),TpYvml2(3,3),TpYvCYv(3,3),TpTvCTv(3,3),md2YdadjYd(3,3),me2YeadjYe(3,3),   & 
& ml2adjYeYe(3,3),ml2CYvTpYv(3,3),mq2adjYdYd(3,3),mq2adjYuYu(3,3),mu2YuadjYu(3,3),       & 
& mv2TpYvCYv(3,3),Ydmq2adjYd(3,3),YdadjYdmd2(3,3),YdadjYdYd(3,3),YdadjYdTd(3,3),         & 
& YdadjYuYu(3,3),YdadjYuTu(3,3),Yeml2adjYe(3,3),YeadjYeme2(3,3),YeadjYeYe(3,3),          & 
& YeadjYeTe(3,3),YeCYvTpYv(3,3),YeCYvTpTv(3,3),Yumq2adjYu(3,3),YuadjYdYd(3,3),           & 
& YuadjYdTd(3,3),YuadjYumu2(3,3),YuadjYuYu(3,3),YuadjYuTu(3,3),YvadjYvYv(3,3),           & 
& YvadjYvCml2(3,3),YvadjYvTv(3,3),YvCmv2adjYv(3,3),adjYdmd2Yd(3,3),adjYdYdmq2(3,3),      & 
& adjYeme2Ye(3,3),adjYeYeml2(3,3),adjYumu2Yu(3,3),adjYuYumq2(3,3),CYvmv2TpYv(3,3),       & 
& CYvTpYvml2(3,3),TdadjYdYd(3,3),TdadjYuYu(3,3),TeadjYeYe(3,3),TeCYvTpYv(3,3),           & 
& TuadjYdYd(3,3),TuadjYuYu(3,3),TvadjYvYv(3,3),TpYeCYeYv(3,3),TpYeCYeTv(3,3),            & 
& TpYvml2CYv(3,3),TpYvCYvmv2(3,3),TpTeCYeYv(3,3)

Complex(dp) :: YdadjYu(3,3),YdadjTd(3,3),YdadjTu(3,3),YeadjTe(3,3),YeCYv(3,3),YeCTv(3,3),            & 
& YuadjYd(3,3),YuadjTd(3,3),YuadjTu(3,3),adjYdCmd2(3,3),adjYeCme2(3,3),adjYuCmu2(3,3),   & 
& adjTdYd(3,3),adjTeYe(3,3),adjTuYu(3,3),Cme2CYe(3,3),Cml2adjYe(3,3),Cmq2adjYd(3,3),     & 
& Cmq2adjYu(3,3),CYeCml2(3,3),CTdTpYd(3,3),CTeTv(3,3),CTeTpYe(3,3),CTuTpYu(3,3),         & 
& CTvTpYv(3,3),TdadjYd(3,3),TdadjYu(3,3),TdadjTu(3,3),TeadjYe(3,3),TeCYv(3,3),           & 
& TeCTv(3,3),TuadjYd(3,3),TuadjYu(3,3),TuadjTd(3,3),TvadjYv(3,3),TvadjTv(3,3),           & 
& TpYeCYe(3,3),TpYvadjYe(3,3),TpYvadjTe(3,3),TpYvCTv(3,3),TpTeCTe(3,3),TpTvadjYe(3,3),   & 
& TpTvadjTe(3,3),TpTvCYv(3,3),md2YdadjYu(3,3),me2YeCYv(3,3),ml2YvadjYv(3,3),             & 
& mu2YuadjYd(3,3),mv2adjYvYv(3,3),mv2TpYvadjYe(3,3),Ydmq2adjYu(3,3),YdadjYdCmd2(3,3),    & 
& YdadjYumu2(3,3),YdadjTdTd(3,3),YdCmq2adjYd(3,3),Yeml2CYv(3,3),YeadjYeCme2(3,3),        & 
& YeadjTeTe(3,3),YeCml2adjYe(3,3),YeCYvmv2(3,3),Yumq2adjYd(3,3),YuadjYdmd2(3,3),         & 
& YuadjYuCmu2(3,3),YuadjTuTu(3,3),YuCmq2adjYu(3,3),adjYdYdadjYd(3,3),adjYdYdadjYu(3,3),  & 
& adjYdYdadjTd(3,3),adjYdYdadjTu(3,3),adjYdTdadjYd(3,3),adjYdTdadjYu(3,3),               & 
& adjYdTdadjTd(3,3),adjYdTdadjTu(3,3),adjYeYeadjYe(3,3),adjYeYeadjTe(3,3),               & 
& adjYeYeCYv(3,3),adjYeYeCTv(3,3),adjYeTeadjYe(3,3),adjYeTeadjTe(3,3),adjYeTeCTv(3,3),   & 
& adjYuYuadjYd(3,3),adjYuYuadjYu(3,3),adjYuYuadjTd(3,3),adjYuYuadjTu(3,3),               & 
& adjYuTuadjYd(3,3),adjYuTuadjYu(3,3),adjYuTuadjTd(3,3),adjYuTuadjTu(3,3),               & 
& adjYvYvadjYv(3,3),adjYvTvadjYv(3,3),adjYvTvadjTv(3,3),adjYvTpYeCYe(3,3),               & 
& adjYvTpTeCTe(3,3),adjTdYdadjYd(3,3),adjTdYdadjYu(3,3),adjTdTdadjYd(3,3),               & 
& adjTdTdadjYu(3,3),adjTeYeadjYe(3,3),adjTeYeCYv(3,3),adjTeTeadjYe(3,3),adjTeTeCYv(3,3), & 
& adjTuYuadjYd(3,3),adjTuYuadjYu(3,3),adjTuTuadjYd(3,3),adjTuTuadjYu(3,3),               & 
& adjTvTvadjYv(3,3),Cml2YvadjYv(3,3),Cml2TpYeCYe(3,3),CYvTpYvadjYe(3,3),CYvTpYvadjTe(3,3),& 
& CYvTpYvCYv(3,3),CYvTpYvCTv(3,3),CYvTpTvadjTe(3,3),CYvTpTvCTv(3,3),CTvTpYvadjYe(3,3),   & 
& CTvTpYvCYv(3,3),CTvTpTvadjYe(3,3),CTvTpTvCYv(3,3),TdadjTdYd(3,3),TeadjTeYe(3,3),       & 
& TeCTvTpYv(3,3),TuadjTuYu(3,3),TpYeCme2CYe(3,3),TpYeCYeCml2(3,3),TpYeCTeTv(3,3),        & 
& TpYvml2adjYe(3,3),TpYvadjYeme2(3,3),TpYvadjYeYe(3,3),TpYvadjYeTe(3,3),TpYvCYvTpYv(3,3),& 
& TpYvCYvTpTv(3,3),TpYvCTvTpTv(3,3),TpTvadjYeYe(3,3),TpTvCYvTpYv(3,3),TpTvCTvTpYv(3,3),  & 
& md2YdadjYdYd(3,3),me2YeadjYeYe(3,3),ml2adjYeYeadjYe(3,3),ml2adjYeYeCYv(3,3),           & 
& ml2CYvTpYvadjYe(3,3),ml2CYvTpYvCYv(3,3),mq2adjYdYdadjYd(3,3),mq2adjYdYdadjYu(3,3),     & 
& mq2adjYuYuadjYd(3,3),mq2adjYuYuadjYu(3,3),mu2YuadjYuYu(3,3),mv2TpYvCYvTpYv(3,3),       & 
& Ydmq2adjYdYd(3,3),YdadjYdmd2Yd(3,3),YdadjYdYdmq2(3,3),YdadjYdYdadjYd(3,3),             & 
& YdadjYdTdadjYd(3,3),YdadjYdTdadjTd(3,3),YdadjYuYuadjYd(3,3),YdadjYuTuadjYd(3,3),       & 
& YdadjYuTuadjTd(3,3),YdadjTdTdadjYd(3,3),YdadjTuTuadjYd(3,3),Yeml2adjYeYe(3,3),         & 
& YeadjYeme2Ye(3,3),YeadjYeYeml2(3,3),YeadjYeYeadjYe(3,3),YeadjYeTeadjYe(3,3),           & 
& YeadjYeTeadjTe(3,3),YeadjTeTeadjYe(3,3),YeCYvTpYvadjYe(3,3),YeCYvTpTvadjTe(3,3),       & 
& YeCTvTpTvadjYe(3,3),Yumq2adjYuYu(3,3),YuadjYdYdadjYu(3,3),YuadjYdTdadjYu(3,3),         & 
& YuadjYdTdadjTu(3,3),YuadjYumu2Yu(3,3),YuadjYuYumq2(3,3),YuadjYuYuadjYu(3,3)

Complex(dp) :: YuadjYuTuadjYu(3,3),YuadjYuTuadjTu(3,3),YuadjTdTdadjYu(3,3),YuadjTuTuadjYu(3,3),       & 
& YvadjYvYvadjYv(3,3),YvadjYvTvadjYv(3,3),YvadjYvTvadjTv(3,3),YvadjYvTpYeCYe(3,3),       & 
& YvadjYvTpTeCTe(3,3),YvadjTvTvadjYv(3,3),adjYdmd2YdadjYd(3,3),adjYdmd2YdadjYu(3,3),     & 
& adjYdYdmq2adjYd(3,3),adjYdYdmq2adjYu(3,3),adjYdYdadjYdmd2(3,3),adjYdYdadjYdYd(3,3),    & 
& adjYdYdadjYdTd(3,3),adjYdYdadjYumu2(3,3),adjYdYdadjYuYu(3,3),adjYdYdadjYuTu(3,3),      & 
& adjYdYdadjTdTd(3,3),adjYdTdadjYdYd(3,3),adjYdTdadjYuYu(3,3),adjYdTdadjTdYd(3,3),       & 
& adjYeme2YeadjYe(3,3),adjYeme2YeCYv(3,3),adjYeYeml2adjYe(3,3),adjYeYeml2CYv(3,3),       & 
& adjYeYeadjYeme2(3,3),adjYeYeadjYeYe(3,3),adjYeYeadjYeTe(3,3),adjYeYeadjTeTe(3,3),      & 
& adjYeYeCYvmv2(3,3),adjYeTeadjYeYe(3,3),adjYeTeadjTeYe(3,3),adjYeTeCYvTpYv(3,3),        & 
& adjYeTeCTvTpYv(3,3),adjYumu2YuadjYd(3,3),adjYumu2YuadjYu(3,3),adjYuYumq2adjYd(3,3),    & 
& adjYuYumq2adjYu(3,3),adjYuYuadjYdmd2(3,3),adjYuYuadjYdYd(3,3),adjYuYuadjYdTd(3,3),     & 
& adjYuYuadjYumu2(3,3),adjYuYuadjYuYu(3,3),adjYuYuadjYuTu(3,3),adjYuYuadjTuTu(3,3),      & 
& adjYuTuadjYdYd(3,3),adjYuTuadjYuYu(3,3),adjYuTuadjTuYu(3,3),adjYvYvadjYvYv(3,3),       & 
& adjYvYvadjYvCml2(3,3),adjYvYvadjYvTv(3,3),adjYvYvCmv2adjYv(3,3),adjYvCml2YvadjYv(3,3), & 
& adjYvCml2TpYeCYe(3,3),adjYvTvadjYvYv(3,3),adjYvTpYeCme2CYe(3,3),adjYvTpYeCYeYv(3,3),   & 
& adjYvTpYeCYeCml2(3,3),adjYvTpYeCYeTv(3,3),adjYvTpYeCTeTv(3,3),adjYvTpTeCYeYv(3,3),     & 
& adjTdYdadjYdTd(3,3),adjTdTdadjYdYd(3,3),adjTeYeadjYeTe(3,3),adjTeTeadjYeYe(3,3),       & 
& adjTuYuadjYuTu(3,3),adjTuTuadjYuYu(3,3),Cmv2adjYvYvadjYv(3,3),Cmv2adjYvTpYeCYe(3,3),   & 
& CYeTpYeCYeYv(3,3),CYeTpYeCYeTv(3,3),CYeTpTeCYeYv(3,3),CYvmv2TpYvadjYe(3,3),            & 
& CYvmv2TpYvCYv(3,3),CYvTpYvml2adjYe(3,3),CYvTpYvml2CYv(3,3),CYvTpYvadjYeme2(3,3),       & 
& CYvTpYvadjYeYe(3,3),CYvTpYvadjYeTe(3,3),CYvTpYvCYvmv2(3,3),CYvTpYvCYvTpYv(3,3),        & 
& CYvTpYvCYvTpTv(3,3),CYvTpYvCTvTpTv(3,3),CYvTpTvadjYeYe(3,3),CYvTpTvCYvTpYv(3,3),       & 
& CYvTpTvCTvTpYv(3,3),CTvTpYvCYvTpTv(3,3),CTvTpTvCYvTpYv(3,3),TdadjYdYdadjTd(3,3),       & 
& TdadjYuYuadjTd(3,3),TdadjTdYdadjYd(3,3),TdadjTuYuadjYd(3,3),TeadjYeYeadjTe(3,3),       & 
& TeadjTeYeadjYe(3,3),TeCYvTpYvadjTe(3,3),TeCTvTpYvadjYe(3,3),TuadjYdYdadjTu(3,3),       & 
& TuadjYuYuadjTu(3,3),TuadjTdYdadjYu(3,3),TuadjTuYuadjYu(3,3),TpYvml2CYvTpYv(3,3),       & 
& TpYvadjYeYeCYv(3,3),TpYvadjYeTeCTv(3,3),TpYvadjTeTeCYv(3,3),TpYvCYvmv2TpYv(3,3),       & 
& TpYvCYvTpYvml2(3,3),TpYvCYvTpYvCYv(3,3),TpYvCYvTpTvCTv(3,3),TpYvCTvTpTvCYv(3,3),       & 
& TpTvadjYeYeCTv(3,3),TpTvadjTeYeCYv(3,3),TpTvCYvTpYvCTv(3,3),TpTvCTvTpYvCYv(3,3),       & 
& md2YdadjYdYdadjYd(3,3),md2YdadjYuYuadjYd(3,3),me2YeadjYeYeadjYe(3,3),me2YeCYvTpYvadjYe(3,3),& 
& ml2adjYeYeadjYeYe(3,3),ml2CYvTpYvCYvTpYv(3,3),mq2adjYdYdadjYdYd(3,3),mq2adjYdYdadjYuYu(3,3),& 
& mq2adjYuYuadjYdYd(3,3),mq2adjYuYuadjYuYu(3,3),mu2YuadjYdYdadjYu(3,3),mu2YuadjYuYuadjYu(3,3),& 
& mv2TpYvadjYeYeCYv(3,3),mv2TpYvCYvTpYvCYv(3,3),Ydmq2adjYdYdadjYd(3,3),Ydmq2adjYuYuadjYd(3,3),& 
& YdadjYdmd2YdadjYd(3,3),YdadjYdYdmq2adjYd(3,3),YdadjYdYdadjYdmd2(3,3),YdadjYdYdadjYdYd(3,3),& 
& YdadjYdYdadjYdTd(3,3),YdadjYdTdadjYdYd(3,3),YdadjYumu2YuadjYd(3,3),YdadjYuYumq2adjYd(3,3),& 
& YdadjYuYuadjYdmd2(3,3),YdadjYuYuadjYdYd(3,3),YdadjYuYuadjYdTd(3,3),YdadjYuYuadjYuYu(3,3),& 
& YdadjYuYuadjYuTu(3,3),YdadjYuTuadjYdYd(3,3),YdadjYuTuadjYuYu(3,3),Yeml2adjYeYeadjYe(3,3)

Complex(dp) :: Yeml2CYvTpYvadjYe(3,3),YeadjYeme2YeadjYe(3,3),YeadjYeYeml2adjYe(3,3),YeadjYeYeadjYeme2(3,3),& 
& YeadjYeYeadjYeYe(3,3),YeadjYeYeadjYeTe(3,3),YeadjYeTeadjYeYe(3,3),YeCYvmv2TpYvadjYe(3,3),& 
& YeCYvTpYvml2adjYe(3,3),YeCYvTpYvadjYeme2(3,3),YeCYvTpYvadjYeYe(3,3),YeCYvTpYvadjYeTe(3,3),& 
& YeCYvTpYvCYvTpYv(3,3),YeCYvTpYvCYvTpTv(3,3),YeCYvTpTvadjYeYe(3,3),YeCYvTpTvCYvTpYv(3,3),& 
& Yumq2adjYdYdadjYu(3,3),Yumq2adjYuYuadjYu(3,3),YuadjYdmd2YdadjYu(3,3),YuadjYdYdmq2adjYu(3,3),& 
& YuadjYdYdadjYdYd(3,3),YuadjYdYdadjYdTd(3,3),YuadjYdYdadjYumu2(3,3),YuadjYdYdadjYuYu(3,3),& 
& YuadjYdYdadjYuTu(3,3),YuadjYdTdadjYdYd(3,3),YuadjYdTdadjYuYu(3,3),YuadjYumu2YuadjYu(3,3),& 
& YuadjYuYumq2adjYu(3,3),YuadjYuYuadjYumu2(3,3),YuadjYuYuadjYuYu(3,3),YuadjYuYuadjYuTu(3,3),& 
& YuadjYuTuadjYuYu(3,3),YvadjYvYvadjYvYv(3,3),YvadjYvYvadjYvCml2(3,3),YvadjYvYvadjYvTv(3,3),& 
& YvadjYvYvCmv2adjYv(3,3),YvadjYvCml2YvadjYv(3,3),YvadjYvCml2TpYeCYe(3,3),               & 
& YvadjYvTvadjYvYv(3,3),YvadjYvTpYeCme2CYe(3,3),YvadjYvTpYeCYeYv(3,3),YvadjYvTpYeCYeCml2(3,3),& 
& YvadjYvTpYeCYeTv(3,3),YvadjYvTpTeCYeYv(3,3),YvCmv2adjYvYvadjYv(3,3),YvCmv2adjYvTpYeCYe(3,3),& 
& adjYdmd2YdadjYdYd(3,3),adjYdYdmq2adjYdYd(3,3),adjYdYdadjYdmd2Yd(3,3),adjYdYdadjYdYdmq2(3,3),& 
& adjYeme2YeadjYeYe(3,3),adjYeYeml2adjYeYe(3,3),adjYeYeadjYeme2Ye(3,3),adjYeYeadjYeYeml2(3,3),& 
& adjYumu2YuadjYuYu(3,3),adjYuYumq2adjYuYu(3,3),adjYuYuadjYumu2Yu(3,3),adjYuYuadjYuYumq2(3,3),& 
& CYvmv2TpYvCYvTpYv(3,3),CYvTpYvml2CYvTpYv(3,3),CYvTpYvCYvmv2TpYv(3,3),CYvTpYvCYvTpYvml2(3,3),& 
& TdadjYdYdadjYdYd(3,3),TdadjYuYuadjYdYd(3,3),TdadjYuYuadjYuYu(3,3),TeadjYeYeadjYeYe(3,3),& 
& TeCYvTpYvadjYeYe(3,3),TeCYvTpYvCYvTpYv(3,3),TuadjYdYdadjYdYd(3,3),TuadjYdYdadjYuYu(3,3),& 
& TuadjYuYuadjYuYu(3,3),TvadjYvYvadjYvYv(3,3),TvadjYvTpYeCYeYv(3,3),TpYeCYeTpYeCYeYv(3,3),& 
& TpYeCYeTpYeCYeTv(3,3),TpYeCYeTpTeCYeYv(3,3),TpYvml2adjYeYeCYv(3,3),TpYvml2CYvTpYvCYv(3,3),& 
& TpYvadjYeme2YeCYv(3,3),TpYvadjYeYeml2CYv(3,3),TpYvadjYeYeCYvmv2(3,3),TpYvCYvmv2TpYvCYv(3,3),& 
& TpYvCYvTpYvml2CYv(3,3),TpYvCYvTpYvCYvmv2(3,3),TpTeCYeTpYeCYeYv(3,3)

Complex(dp) :: Trmd2,Trme2,Trml2,Trmq2,Trmu2,Trmv2,TrYdadjYd,TrYeadjYe,TrYuadjYu,TrYvadjYv,          & 
& TradjYdTd,TradjYeTe,TradjYuTu,TradjYvTv,TrCTdTpTd,TrCTeTpTe,TrCTuTpTu,TrCTvTpTv,       & 
& Trmd2YdadjYd,Trme2YeadjYe,Trml2adjYeYe,Trmq2adjYdYd,Trmq2adjYuYu,Trmu2YuadjYu,         & 
& TrYvadjYvCml2,TrYvCmv2adjYv

Complex(dp) :: TrCTdTpYd,TrCTeTpYe,TrCTuTpYu,TrCTvTpYv,Trml2YvadjYv,Trmv2adjYvYv,TrYdadjYdCmd2,      & 
& TrYdCmq2adjYd,TrYeadjYeCme2,TrYeCml2adjYe,TrYuadjYuCmu2,TrYuCmq2adjYu,TrYdadjYdYdadjYd,& 
& TrYdadjYdTdadjYd,TrYdadjYdTdadjTd,TrYdadjYuYuadjYd,TrYdadjYuTuadjYd,TrYdadjYuTuadjTd,  & 
& TrYdadjTdTdadjYd,TrYdadjTuTuadjYd,TrYeadjYeYeadjYe,TrYeadjYeTeadjYe,TrYeadjYeTeadjTe,  & 
& TrYeadjTeTeadjYe,TrYeCTvTpTvadjYe,TrYuadjYdTdadjYu,TrYuadjYdTdadjTu,TrYuadjYuYuadjYu,  & 
& TrYuadjYuTuadjYu,TrYuadjYuTuadjTu,TrYuadjTdTdadjYu,TrYuadjTuTuadjYu,TrYvadjYvYvadjYv,  & 
& TrYvadjYvTvadjYv,TrYvadjYvTvadjTv,TrYvadjYvTpYeCYe,TrYvadjYvTpTeCTe,TrYvadjTvTvadjYv,  & 
& TradjYeTeCYvTpYv,TradjYeTeCTvTpYv,TradjYvTpYeCYeTv,TradjYvTpYeCTeTv,Trmd2YdadjYdYdadjYd,& 
& Trmd2YdadjYuYuadjYd,Trme2YeadjYeYeadjYe,Trml2adjYeYeadjYeYe,Trmq2adjYdYdadjYdYd,       & 
& Trmq2adjYdYdadjYuYu,Trmq2adjYuYuadjYdYd,Trmq2adjYuYuadjYuYu,Trmu2YuadjYdYdadjYu,       & 
& Trmu2YuadjYuYuadjYu,TrYvadjYvYvadjYvCml2,TrYvadjYvYvCmv2adjYv,TrYvadjYvCml2YvadjYv,    & 
& TrYvadjYvCml2TpYeCYe,TrYvadjYvTpYeCme2CYe,TrYvadjYvTpYeCYeCml2,TrYvCmv2adjYvYvadjYv,   & 
& TrYvCmv2adjYvTpYeCYe

Real(dp) :: g1p2,g1p3,g2p2,g2p3,g3p2,g3p3,gpp2,gpp3,Qdp2,Qep2,QHdp2,QHup2,Qlp2,Qqp2,              & 
& Qsp2,Qs1p2,Qs2p2,Qs3p2,Qup2,Qvp2

Complex(dp) :: sqrt3ov5,ooSqrt15,lamp2

Real(dp) :: g1p4,g2p4,g3p4,gpp4,Qdp4,Qep3,Qep4,QHdp3,QHdp4,QHup3,QHup4,Qlp3,Qlp4,Qqp3,            & 
& Qqp4,Qsp3,Qsp4,Qs1p3,Qs1p4,Qs2p3,Qs2p4,Qs3p3,Qs3p4,Qup3,Qup4,Qvp3,Qvp4

Complex(dp) :: Xip2,kapp2,lamp3,Ckapp2,Clamp2

Iname = Iname +1 
NameOfUnit(Iname) = 'rge284' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters284(gy,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,               & 
& Tk,Tu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,vd,             & 
& vu,vS,vS1,vS2,vS3)

Abslam = Conjg(lam)*lam
Abskap = Conjg(kap)*kap
AbsTlam = Conjg(Tlam)*Tlam
AbsTk = Conjg(Tk)*Tk
AbsM1 = Conjg(M1)*M1
AbsM2 = Conjg(M2)*M2
AbsM3 = Conjg(M3)*M3
AbsM4 = Conjg(M4)*M4
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
Call Adjungate(Yv,adjYv)
Call Adjungate(Yu,adjYu)
Call Adjungate(Td,adjTd)
Call Adjungate(Te,adjTe)
Call Adjungate(Tv,adjTv)
Call Adjungate(Tu,adjTu)
 md2Yd = Matmul2(md2,Yd,OnlyDiagonal) 
 me2Ye = Matmul2(me2,Ye,OnlyDiagonal) 
 ml2adjYe = Matmul2(ml2,adjYe,OnlyDiagonal) 
 ml2CYv = Matmul2(ml2,Conjg(Yv),OnlyDiagonal) 
 mq2adjYd = Matmul2(mq2,adjYd,OnlyDiagonal) 
 mq2adjYu = Matmul2(mq2,adjYu,OnlyDiagonal) 
 mu2Yu = Matmul2(mu2,Yu,OnlyDiagonal) 
 mv2TpYv = Matmul2(mv2,Transpose(Yv),OnlyDiagonal) 
 Ydmq2 = Matmul2(Yd,mq2,OnlyDiagonal) 
 YdadjYd = Matmul2(Yd,adjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYd(i2,i2) =  Real(YdadjYd(i2,i2),dp) 
 Yeml2 = Matmul2(Ye,ml2,OnlyDiagonal) 
 YeadjYe = Matmul2(Ye,adjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeadjYe(i2,i2) =  Real(YeadjYe(i2,i2),dp) 
 Yumq2 = Matmul2(Yu,mq2,OnlyDiagonal) 
 YuadjYu = Matmul2(Yu,adjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYu(i2,i2) =  Real(YuadjYu(i2,i2),dp) 
 YvadjYv = Matmul2(Yv,adjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvadjYv(i2,i2) =  Real(YvadjYv(i2,i2),dp) 
 adjYdmd2 = Matmul2(adjYd,md2,OnlyDiagonal) 
 adjYdYd = Matmul2(adjYd,Yd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdYd(i2,i2) =  Real(adjYdYd(i2,i2),dp) 
 adjYdTd = Matmul2(adjYd,Td,OnlyDiagonal) 
 adjYeme2 = Matmul2(adjYe,me2,OnlyDiagonal) 
 adjYeYe = Matmul2(adjYe,Ye,OnlyDiagonal) 
Forall(i2=1:3)  adjYeYe(i2,i2) =  Real(adjYeYe(i2,i2),dp) 
 adjYeTe = Matmul2(adjYe,Te,OnlyDiagonal) 
 adjYumu2 = Matmul2(adjYu,mu2,OnlyDiagonal) 
 adjYuYu = Matmul2(adjYu,Yu,OnlyDiagonal) 
Forall(i2=1:3)  adjYuYu(i2,i2) =  Real(adjYuYu(i2,i2),dp) 
 adjYuTu = Matmul2(adjYu,Tu,OnlyDiagonal) 
 adjYvYv = Matmul2(adjYv,Yv,OnlyDiagonal) 
Forall(i2=1:3)  adjYvYv(i2,i2) =  Real(adjYvYv(i2,i2),dp) 
 adjYvCml2 = Matmul2(adjYv,Conjg(ml2),OnlyDiagonal) 
 adjYvTv = Matmul2(adjYv,Tv,OnlyDiagonal) 
 adjTdTd = Matmul2(adjTd,Td,OnlyDiagonal) 
 adjTeTe = Matmul2(adjTe,Te,OnlyDiagonal) 
 adjTuTu = Matmul2(adjTu,Tu,OnlyDiagonal) 
 Cmv2adjYv = Matmul2(Conjg(mv2),adjYv,OnlyDiagonal) 
 CYeYv = Matmul2(Conjg(Ye),Yv,OnlyDiagonal) 
 CYeTv = Matmul2(Conjg(Ye),Tv,OnlyDiagonal) 
 CYvmv2 = Matmul2(Conjg(Yv),mv2,OnlyDiagonal) 
 CYvTpYv = Matmul2(Conjg(Yv),Transpose(Yv),OnlyDiagonal) 
Forall(i2=1:3)  CYvTpYv(i2,i2) =  Real(CYvTpYv(i2,i2),dp) 
 CYvTpTv = Matmul2(Conjg(Yv),Transpose(Tv),OnlyDiagonal) 
 CTdTpTd = Matmul2(Conjg(Td),Transpose(Td),OnlyDiagonal) 
Forall(i2=1:3)  CTdTpTd(i2,i2) =  Real(CTdTpTd(i2,i2),dp) 
 CTeTpTe = Matmul2(Conjg(Te),Transpose(Te),OnlyDiagonal) 
Forall(i2=1:3)  CTeTpTe(i2,i2) =  Real(CTeTpTe(i2,i2),dp) 
 CTuTpTu = Matmul2(Conjg(Tu),Transpose(Tu),OnlyDiagonal) 
Forall(i2=1:3)  CTuTpTu(i2,i2) =  Real(CTuTpTu(i2,i2),dp) 
 CTvTpTv = Matmul2(Conjg(Tv),Transpose(Tv),OnlyDiagonal) 
Forall(i2=1:3)  CTvTpTv(i2,i2) =  Real(CTvTpTv(i2,i2),dp) 
 TdadjTd = Matmul2(Td,adjTd,OnlyDiagonal) 
 TeadjTe = Matmul2(Te,adjTe,OnlyDiagonal) 
 TuadjTu = Matmul2(Tu,adjTu,OnlyDiagonal) 
 TpYvml2 = Matmul2(Transpose(Yv),ml2,OnlyDiagonal) 
 TpYvCYv = Matmul2(Transpose(Yv),Conjg(Yv),OnlyDiagonal) 
Forall(i2=1:3)  TpYvCYv(i2,i2) =  Real(TpYvCYv(i2,i2),dp) 
 TpTvCTv = Matmul2(Transpose(Tv),Conjg(Tv),OnlyDiagonal) 
Forall(i2=1:3)  TpTvCTv(i2,i2) =  Real(TpTvCTv(i2,i2),dp) 
 md2YdadjYd = Matmul2(md2,YdadjYd,OnlyDiagonal) 
 me2YeadjYe = Matmul2(me2,YeadjYe,OnlyDiagonal) 
 ml2adjYeYe = Matmul2(ml2,adjYeYe,OnlyDiagonal) 
 ml2CYvTpYv = Matmul2(ml2,CYvTpYv,OnlyDiagonal) 
 mq2adjYdYd = Matmul2(mq2,adjYdYd,OnlyDiagonal) 
 mq2adjYuYu = Matmul2(mq2,adjYuYu,OnlyDiagonal) 
 mu2YuadjYu = Matmul2(mu2,YuadjYu,OnlyDiagonal) 
 mv2TpYvCYv = Matmul2(mv2,TpYvCYv,OnlyDiagonal) 
 Ydmq2adjYd = Matmul2(Yd,mq2adjYd,OnlyDiagonal) 
Forall(i2=1:3)  Ydmq2adjYd(i2,i2) =  Real(Ydmq2adjYd(i2,i2),dp) 
 YdadjYdmd2 = Matmul2(Yd,adjYdmd2,OnlyDiagonal) 
 YdadjYdYd = Matmul2(Yd,adjYdYd,OnlyDiagonal) 
 YdadjYdTd = Matmul2(Yd,adjYdTd,OnlyDiagonal) 
 YdadjYuYu = Matmul2(Yd,adjYuYu,OnlyDiagonal) 
 YdadjYuTu = Matmul2(Yd,adjYuTu,OnlyDiagonal) 
 Yeml2adjYe = Matmul2(Ye,ml2adjYe,OnlyDiagonal) 
Forall(i2=1:3)  Yeml2adjYe(i2,i2) =  Real(Yeml2adjYe(i2,i2),dp) 
 YeadjYeme2 = Matmul2(Ye,adjYeme2,OnlyDiagonal) 
 YeadjYeYe = Matmul2(Ye,adjYeYe,OnlyDiagonal) 
 YeadjYeTe = Matmul2(Ye,adjYeTe,OnlyDiagonal) 
 YeCYvTpYv = Matmul2(Ye,CYvTpYv,OnlyDiagonal) 
 YeCYvTpTv = Matmul2(Ye,CYvTpTv,OnlyDiagonal) 
 Yumq2adjYu = Matmul2(Yu,mq2adjYu,OnlyDiagonal) 
Forall(i2=1:3)  Yumq2adjYu(i2,i2) =  Real(Yumq2adjYu(i2,i2),dp) 
 YuadjYdYd = Matmul2(Yu,adjYdYd,OnlyDiagonal) 
 YuadjYdTd = Matmul2(Yu,adjYdTd,OnlyDiagonal) 
 YuadjYumu2 = Matmul2(Yu,adjYumu2,OnlyDiagonal) 
 YuadjYuYu = Matmul2(Yu,adjYuYu,OnlyDiagonal) 
 YuadjYuTu = Matmul2(Yu,adjYuTu,OnlyDiagonal) 
 YvadjYvYv = Matmul2(Yv,adjYvYv,OnlyDiagonal) 
 YvadjYvCml2 = Matmul2(Yv,adjYvCml2,OnlyDiagonal) 
 YvadjYvTv = Matmul2(Yv,adjYvTv,OnlyDiagonal) 
 YvCmv2adjYv = Matmul2(Yv,Cmv2adjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvCmv2adjYv(i2,i2) =  Real(YvCmv2adjYv(i2,i2),dp) 
 adjYdmd2Yd = Matmul2(adjYd,md2Yd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdmd2Yd(i2,i2) =  Real(adjYdmd2Yd(i2,i2),dp) 
 adjYdYdmq2 = Matmul2(adjYd,Ydmq2,OnlyDiagonal) 
 adjYeme2Ye = Matmul2(adjYe,me2Ye,OnlyDiagonal) 
Forall(i2=1:3)  adjYeme2Ye(i2,i2) =  Real(adjYeme2Ye(i2,i2),dp) 
 adjYeYeml2 = Matmul2(adjYe,Yeml2,OnlyDiagonal) 
 adjYumu2Yu = Matmul2(adjYu,mu2Yu,OnlyDiagonal) 
Forall(i2=1:3)  adjYumu2Yu(i2,i2) =  Real(adjYumu2Yu(i2,i2),dp) 
 adjYuYumq2 = Matmul2(adjYu,Yumq2,OnlyDiagonal) 
 CYvmv2TpYv = Matmul2(Conjg(Yv),mv2TpYv,OnlyDiagonal) 
Forall(i2=1:3)  CYvmv2TpYv(i2,i2) =  Real(CYvmv2TpYv(i2,i2),dp) 
 CYvTpYvml2 = Matmul2(Conjg(Yv),TpYvml2,OnlyDiagonal) 
 TdadjYdYd = Matmul2(Td,adjYdYd,OnlyDiagonal) 
 TdadjYuYu = Matmul2(Td,adjYuYu,OnlyDiagonal) 
 TeadjYeYe = Matmul2(Te,adjYeYe,OnlyDiagonal) 
 TeCYvTpYv = Matmul2(Te,CYvTpYv,OnlyDiagonal) 
 TuadjYdYd = Matmul2(Tu,adjYdYd,OnlyDiagonal) 
 TuadjYuYu = Matmul2(Tu,adjYuYu,OnlyDiagonal) 
 TvadjYvYv = Matmul2(Tv,adjYvYv,OnlyDiagonal) 
 TpYeCYeYv = Matmul2(Transpose(Ye),CYeYv,OnlyDiagonal) 
 TpYeCYeTv = Matmul2(Transpose(Ye),CYeTv,OnlyDiagonal) 
 TpYvml2CYv = Matmul2(Transpose(Yv),ml2CYv,OnlyDiagonal) 
Forall(i2=1:3)  TpYvml2CYv(i2,i2) =  Real(TpYvml2CYv(i2,i2),dp) 
 TpYvCYvmv2 = Matmul2(Transpose(Yv),CYvmv2,OnlyDiagonal) 
 TpTeCYeYv = Matmul2(Transpose(Te),CYeYv,OnlyDiagonal) 
 Trmd2 = Real(cTrace(md2),dp) 
 Trme2 = Real(cTrace(me2),dp) 
 Trml2 = Real(cTrace(ml2),dp) 
 Trmq2 = Real(cTrace(mq2),dp) 
 Trmu2 = Real(cTrace(mu2),dp) 
 Trmv2 = Real(cTrace(mv2),dp) 
 TrYdadjYd = Real(cTrace(YdadjYd),dp) 
 TrYeadjYe = Real(cTrace(YeadjYe),dp) 
 TrYuadjYu = Real(cTrace(YuadjYu),dp) 
 TrYvadjYv = Real(cTrace(YvadjYv),dp) 
 TradjYdTd = cTrace(adjYdTd) 
 TradjYeTe = cTrace(adjYeTe) 
 TradjYuTu = cTrace(adjYuTu) 
 TradjYvTv = cTrace(adjYvTv) 
 TrCTdTpTd = Real(cTrace(CTdTpTd),dp) 
 TrCTeTpTe = Real(cTrace(CTeTpTe),dp) 
 TrCTuTpTu = Real(cTrace(CTuTpTu),dp) 
 TrCTvTpTv = Real(cTrace(CTvTpTv),dp) 
 Trmd2YdadjYd = cTrace(md2YdadjYd) 
 Trme2YeadjYe = cTrace(me2YeadjYe) 
 Trml2adjYeYe = cTrace(ml2adjYeYe) 
 Trmq2adjYdYd = cTrace(mq2adjYdYd) 
 Trmq2adjYuYu = cTrace(mq2adjYuYu) 
 Trmu2YuadjYu = cTrace(mu2YuadjYu) 
 TrYvadjYvCml2 = cTrace(YvadjYvCml2) 
 TrYvCmv2adjYv = Real(cTrace(YvCmv2adjYv),dp) 
 sqrt3ov5 =Sqrt(3._dp/5._dp) 
 ooSqrt15 =1._dp/sqrt(15._dp) 
 g1p2 =g1**2 
 g1p3 =g1**3 
 g2p2 =g2**2 
 g2p3 =g2**3 
 g3p2 =g3**2 
 g3p3 =g3**3 
 gpp2 =gp**2 
 gpp3 =gp**3 
 Qdp2 =Qd**2 
 Qep2 =Qe**2 
 QHdp2 =QHd**2 
 QHup2 =QHu**2 
 Qlp2 =Ql**2 
 Qqp2 =Qq**2 
 Qsp2 =Qs**2 
 Qs1p2 =Qs1**2 
 Qs2p2 =Qs2**2 
 Qs3p2 =Qs3**2 
 Qup2 =Qu**2 
 Qvp2 =Qv**2 
 lamp2 =lam**2 
 g1p4 =g1**4 
 g2p4 =g2**4 
 g3p4 =g3**4 
 gpp4 =gp**4 
 Qdp4 =Qd**4 
 Qep3 =Qe**3 
 Qep4 =Qe**4 
 QHdp3 =QHd**3 
 QHdp4 =QHd**4 
 QHup3 =QHu**3 
 QHup4 =QHu**4 
 Qlp3 =Ql**3 
 Qlp4 =Ql**4 
 Qqp3 =Qq**3 
 Qqp4 =Qq**4 
 Qsp3 =Qs**3 
 Qsp4 =Qs**4 
 Qs1p3 =Qs1**3 
 Qs1p4 =Qs1**4 
 Qs2p3 =Qs2**3 
 Qs2p4 =Qs2**4 
 Qs3p3 =Qs3**3 
 Qs3p4 =Qs3**4 
 Qup3 =Qu**3 
 Qup4 =Qu**4 
 Qvp3 =Qv**3 
 Qvp4 =Qv**4 
 Xip2 =Xi**2 
 kapp2 =kap**2 
 lamp3 =lam**3 
 Ckapp2 =Conjg(kap)**2 
 Clamp2 =Conjg(lam)**2 


If (TwoLoopRGE) Then 
 YdadjYu = Matmul2(Yd,adjYu,OnlyDiagonal) 
 YdadjTd = Matmul2(Yd,adjTd,OnlyDiagonal) 
 YdadjTu = Matmul2(Yd,adjTu,OnlyDiagonal) 
 YeadjTe = Matmul2(Ye,adjTe,OnlyDiagonal) 
 YeCYv = Matmul2(Ye,Conjg(Yv),OnlyDiagonal) 
 YeCTv = Matmul2(Ye,Conjg(Tv),OnlyDiagonal) 
 YuadjYd = Matmul2(Yu,adjYd,OnlyDiagonal) 
 YuadjTd = Matmul2(Yu,adjTd,OnlyDiagonal) 
 YuadjTu = Matmul2(Yu,adjTu,OnlyDiagonal) 
 adjYdCmd2 = Matmul2(adjYd,Conjg(md2),OnlyDiagonal) 
 adjYeCme2 = Matmul2(adjYe,Conjg(me2),OnlyDiagonal) 
 adjYuCmu2 = Matmul2(adjYu,Conjg(mu2),OnlyDiagonal) 
 adjTdYd = Matmul2(adjTd,Yd,OnlyDiagonal) 
 adjTeYe = Matmul2(adjTe,Ye,OnlyDiagonal) 
 adjTuYu = Matmul2(adjTu,Yu,OnlyDiagonal) 
 Cme2CYe = Matmul2(Conjg(me2),Conjg(Ye),OnlyDiagonal) 
 Cml2adjYe = Matmul2(Conjg(ml2),adjYe,OnlyDiagonal) 
 Cmq2adjYd = Matmul2(Conjg(mq2),adjYd,OnlyDiagonal) 
 Cmq2adjYu = Matmul2(Conjg(mq2),adjYu,OnlyDiagonal) 
 CYeCml2 = Matmul2(Conjg(Ye),Conjg(ml2),OnlyDiagonal) 
 CTdTpYd = Matmul2(Conjg(Td),Transpose(Yd),OnlyDiagonal) 
 CTeTv = Matmul2(Conjg(Te),Tv,OnlyDiagonal) 
 CTeTpYe = Matmul2(Conjg(Te),Transpose(Ye),OnlyDiagonal) 
 CTuTpYu = Matmul2(Conjg(Tu),Transpose(Yu),OnlyDiagonal) 
 CTvTpYv = Matmul2(Conjg(Tv),Transpose(Yv),OnlyDiagonal) 
 TdadjYd = Matmul2(Td,adjYd,OnlyDiagonal) 
 TdadjYu = Matmul2(Td,adjYu,OnlyDiagonal) 
 TdadjTu = Matmul2(Td,adjTu,OnlyDiagonal) 
 TeadjYe = Matmul2(Te,adjYe,OnlyDiagonal) 
 TeCYv = Matmul2(Te,Conjg(Yv),OnlyDiagonal) 
 TeCTv = Matmul2(Te,Conjg(Tv),OnlyDiagonal) 
 TuadjYd = Matmul2(Tu,adjYd,OnlyDiagonal) 
 TuadjYu = Matmul2(Tu,adjYu,OnlyDiagonal) 
 TuadjTd = Matmul2(Tu,adjTd,OnlyDiagonal) 
 TvadjYv = Matmul2(Tv,adjYv,OnlyDiagonal) 
 TvadjTv = Matmul2(Tv,adjTv,OnlyDiagonal) 
 TpYeCYe = Matmul2(Transpose(Ye),Conjg(Ye),OnlyDiagonal) 
Forall(i2=1:3)  TpYeCYe(i2,i2) =  Real(TpYeCYe(i2,i2),dp) 
 TpYvadjYe = Matmul2(Transpose(Yv),adjYe,OnlyDiagonal) 
 TpYvadjTe = Matmul2(Transpose(Yv),adjTe,OnlyDiagonal) 
 TpYvCTv = Matmul2(Transpose(Yv),Conjg(Tv),OnlyDiagonal) 
 TpTeCTe = Matmul2(Transpose(Te),Conjg(Te),OnlyDiagonal) 
Forall(i2=1:3)  TpTeCTe(i2,i2) =  Real(TpTeCTe(i2,i2),dp) 
 TpTvadjYe = Matmul2(Transpose(Tv),adjYe,OnlyDiagonal) 
 TpTvadjTe = Matmul2(Transpose(Tv),adjTe,OnlyDiagonal) 
 TpTvCYv = Matmul2(Transpose(Tv),Conjg(Yv),OnlyDiagonal) 
 md2YdadjYu = Matmul2(md2,YdadjYu,OnlyDiagonal) 
 me2YeCYv = Matmul2(me2,YeCYv,OnlyDiagonal) 
 ml2YvadjYv = Matmul2(ml2,YvadjYv,OnlyDiagonal) 
 mu2YuadjYd = Matmul2(mu2,YuadjYd,OnlyDiagonal) 
 mv2adjYvYv = Matmul2(mv2,adjYvYv,OnlyDiagonal) 
 mv2TpYvadjYe = Matmul2(mv2,TpYvadjYe,OnlyDiagonal) 
 Ydmq2adjYu = Matmul2(Yd,mq2adjYu,OnlyDiagonal) 
 YdadjYdCmd2 = Matmul2(Yd,adjYdCmd2,OnlyDiagonal) 
 YdadjYumu2 = Matmul2(Yd,adjYumu2,OnlyDiagonal) 
 YdadjTdTd = Matmul2(Yd,adjTdTd,OnlyDiagonal) 
 YdCmq2adjYd = Matmul2(Yd,Cmq2adjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdCmq2adjYd(i2,i2) =  Real(YdCmq2adjYd(i2,i2),dp) 
 Yeml2CYv = Matmul2(Ye,ml2CYv,OnlyDiagonal) 
 YeadjYeCme2 = Matmul2(Ye,adjYeCme2,OnlyDiagonal) 
 YeadjTeTe = Matmul2(Ye,adjTeTe,OnlyDiagonal) 
 YeCml2adjYe = Matmul2(Ye,Cml2adjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeCml2adjYe(i2,i2) =  Real(YeCml2adjYe(i2,i2),dp) 
 YeCYvmv2 = Matmul2(Ye,CYvmv2,OnlyDiagonal) 
 Yumq2adjYd = Matmul2(Yu,mq2adjYd,OnlyDiagonal) 
 YuadjYdmd2 = Matmul2(Yu,adjYdmd2,OnlyDiagonal) 
 YuadjYuCmu2 = Matmul2(Yu,adjYuCmu2,OnlyDiagonal) 
 YuadjTuTu = Matmul2(Yu,adjTuTu,OnlyDiagonal) 
 YuCmq2adjYu = Matmul2(Yu,Cmq2adjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuCmq2adjYu(i2,i2) =  Real(YuCmq2adjYu(i2,i2),dp) 
 adjYdYdadjYd = Matmul2(adjYd,YdadjYd,OnlyDiagonal) 
 adjYdYdadjYu = Matmul2(adjYd,YdadjYu,OnlyDiagonal) 
 adjYdYdadjTd = Matmul2(adjYd,YdadjTd,OnlyDiagonal) 
 adjYdYdadjTu = Matmul2(adjYd,YdadjTu,OnlyDiagonal) 
 adjYdTdadjYd = Matmul2(adjYd,TdadjYd,OnlyDiagonal) 
 adjYdTdadjYu = Matmul2(adjYd,TdadjYu,OnlyDiagonal) 
 adjYdTdadjTd = Matmul2(adjYd,TdadjTd,OnlyDiagonal) 
 adjYdTdadjTu = Matmul2(adjYd,TdadjTu,OnlyDiagonal) 
 adjYeYeadjYe = Matmul2(adjYe,YeadjYe,OnlyDiagonal) 
 adjYeYeadjTe = Matmul2(adjYe,YeadjTe,OnlyDiagonal) 
 adjYeYeCYv = Matmul2(adjYe,YeCYv,OnlyDiagonal) 
 adjYeYeCTv = Matmul2(adjYe,YeCTv,OnlyDiagonal) 
 adjYeTeadjYe = Matmul2(adjYe,TeadjYe,OnlyDiagonal) 
 adjYeTeadjTe = Matmul2(adjYe,TeadjTe,OnlyDiagonal) 
 adjYeTeCTv = Matmul2(adjYe,TeCTv,OnlyDiagonal) 
 adjYuYuadjYd = Matmul2(adjYu,YuadjYd,OnlyDiagonal) 
 adjYuYuadjYu = Matmul2(adjYu,YuadjYu,OnlyDiagonal) 
 adjYuYuadjTd = Matmul2(adjYu,YuadjTd,OnlyDiagonal) 
 adjYuYuadjTu = Matmul2(adjYu,YuadjTu,OnlyDiagonal) 
 adjYuTuadjYd = Matmul2(adjYu,TuadjYd,OnlyDiagonal) 
 adjYuTuadjYu = Matmul2(adjYu,TuadjYu,OnlyDiagonal) 
 adjYuTuadjTd = Matmul2(adjYu,TuadjTd,OnlyDiagonal) 
 adjYuTuadjTu = Matmul2(adjYu,TuadjTu,OnlyDiagonal) 
 adjYvYvadjYv = Matmul2(adjYv,YvadjYv,OnlyDiagonal) 
 adjYvTvadjYv = Matmul2(adjYv,TvadjYv,OnlyDiagonal) 
 adjYvTvadjTv = Matmul2(adjYv,TvadjTv,OnlyDiagonal) 
 adjYvTpYeCYe = Matmul2(adjYv,TpYeCYe,OnlyDiagonal) 
 adjYvTpTeCTe = Matmul2(adjYv,TpTeCTe,OnlyDiagonal) 
 adjTdYdadjYd = Matmul2(adjTd,YdadjYd,OnlyDiagonal) 
 adjTdYdadjYu = Matmul2(adjTd,YdadjYu,OnlyDiagonal) 
 adjTdTdadjYd = Matmul2(adjTd,TdadjYd,OnlyDiagonal) 
 adjTdTdadjYu = Matmul2(adjTd,TdadjYu,OnlyDiagonal) 
 adjTeYeadjYe = Matmul2(adjTe,YeadjYe,OnlyDiagonal) 
 adjTeYeCYv = Matmul2(adjTe,YeCYv,OnlyDiagonal) 
 adjTeTeadjYe = Matmul2(adjTe,TeadjYe,OnlyDiagonal) 
 adjTeTeCYv = Matmul2(adjTe,TeCYv,OnlyDiagonal) 
 adjTuYuadjYd = Matmul2(adjTu,YuadjYd,OnlyDiagonal) 
 adjTuYuadjYu = Matmul2(adjTu,YuadjYu,OnlyDiagonal) 
 adjTuTuadjYd = Matmul2(adjTu,TuadjYd,OnlyDiagonal) 
 adjTuTuadjYu = Matmul2(adjTu,TuadjYu,OnlyDiagonal) 
 adjTvTvadjYv = Matmul2(adjTv,TvadjYv,OnlyDiagonal) 
 Cml2YvadjYv = Matmul2(Conjg(ml2),YvadjYv,OnlyDiagonal) 
 Cml2TpYeCYe = Matmul2(Conjg(ml2),TpYeCYe,OnlyDiagonal) 
 CYvTpYvadjYe = Matmul2(Conjg(Yv),TpYvadjYe,OnlyDiagonal) 
 CYvTpYvadjTe = Matmul2(Conjg(Yv),TpYvadjTe,OnlyDiagonal) 
 CYvTpYvCYv = Matmul2(Conjg(Yv),TpYvCYv,OnlyDiagonal) 
 CYvTpYvCTv = Matmul2(Conjg(Yv),TpYvCTv,OnlyDiagonal) 
 CYvTpTvadjTe = Matmul2(Conjg(Yv),TpTvadjTe,OnlyDiagonal) 
 CYvTpTvCTv = Matmul2(Conjg(Yv),TpTvCTv,OnlyDiagonal) 
 CTvTpYvadjYe = Matmul2(Conjg(Tv),TpYvadjYe,OnlyDiagonal) 
 CTvTpYvCYv = Matmul2(Conjg(Tv),TpYvCYv,OnlyDiagonal) 
 CTvTpTvadjYe = Matmul2(Conjg(Tv),TpTvadjYe,OnlyDiagonal) 
 CTvTpTvCYv = Matmul2(Conjg(Tv),TpTvCYv,OnlyDiagonal) 
 TdadjTdYd = Matmul2(Td,adjTdYd,OnlyDiagonal) 
 TeadjTeYe = Matmul2(Te,adjTeYe,OnlyDiagonal) 
 TeCTvTpYv = Matmul2(Te,CTvTpYv,OnlyDiagonal) 
 TuadjTuYu = Matmul2(Tu,adjTuYu,OnlyDiagonal) 
 TpYeCme2CYe = Matmul2(Transpose(Ye),Cme2CYe,OnlyDiagonal) 
Forall(i2=1:3)  TpYeCme2CYe(i2,i2) =  Real(TpYeCme2CYe(i2,i2),dp) 
 TpYeCYeCml2 = Matmul2(Transpose(Ye),CYeCml2,OnlyDiagonal) 
 TpYeCTeTv = Matmul2(Transpose(Ye),CTeTv,OnlyDiagonal) 
 TpYvml2adjYe = Matmul2(Transpose(Yv),ml2adjYe,OnlyDiagonal) 
 TpYvadjYeme2 = Matmul2(Transpose(Yv),adjYeme2,OnlyDiagonal) 
 TpYvadjYeYe = Matmul2(Transpose(Yv),adjYeYe,OnlyDiagonal) 
 TpYvadjYeTe = Matmul2(Transpose(Yv),adjYeTe,OnlyDiagonal) 
 TpYvCYvTpYv = Matmul2(Transpose(Yv),CYvTpYv,OnlyDiagonal) 
 TpYvCYvTpTv = Matmul2(Transpose(Yv),CYvTpTv,OnlyDiagonal) 
 TpYvCTvTpTv = Matmul2(Transpose(Yv),CTvTpTv,OnlyDiagonal) 
 TpTvadjYeYe = Matmul2(Transpose(Tv),adjYeYe,OnlyDiagonal) 
 TpTvCYvTpYv = Matmul2(Transpose(Tv),CYvTpYv,OnlyDiagonal) 
 TpTvCTvTpYv = Matmul2(Transpose(Tv),CTvTpYv,OnlyDiagonal) 
 md2YdadjYdYd = Matmul2(md2,YdadjYdYd,OnlyDiagonal) 
 me2YeadjYeYe = Matmul2(me2,YeadjYeYe,OnlyDiagonal) 
 ml2adjYeYeadjYe = Matmul2(ml2,adjYeYeadjYe,OnlyDiagonal) 
 ml2adjYeYeCYv = Matmul2(ml2,adjYeYeCYv,OnlyDiagonal) 
 ml2CYvTpYvadjYe = Matmul2(ml2,CYvTpYvadjYe,OnlyDiagonal) 
 ml2CYvTpYvCYv = Matmul2(ml2,CYvTpYvCYv,OnlyDiagonal) 
 mq2adjYdYdadjYd = Matmul2(mq2,adjYdYdadjYd,OnlyDiagonal) 
 mq2adjYdYdadjYu = Matmul2(mq2,adjYdYdadjYu,OnlyDiagonal) 
 mq2adjYuYuadjYd = Matmul2(mq2,adjYuYuadjYd,OnlyDiagonal) 
 mq2adjYuYuadjYu = Matmul2(mq2,adjYuYuadjYu,OnlyDiagonal) 
 mu2YuadjYuYu = Matmul2(mu2,YuadjYuYu,OnlyDiagonal) 
 mv2TpYvCYvTpYv = Matmul2(mv2,TpYvCYvTpYv,OnlyDiagonal) 
 Ydmq2adjYdYd = Matmul2(Yd,mq2adjYdYd,OnlyDiagonal) 
 YdadjYdmd2Yd = Matmul2(Yd,adjYdmd2Yd,OnlyDiagonal) 
 YdadjYdYdmq2 = Matmul2(Yd,adjYdYdmq2,OnlyDiagonal) 
 YdadjYdYdadjYd = Matmul2(Yd,adjYdYdadjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYdYdadjYd(i2,i2) =  Real(YdadjYdYdadjYd(i2,i2),dp) 
 YdadjYdTdadjYd = Matmul2(Yd,adjYdTdadjYd,OnlyDiagonal) 
 YdadjYdTdadjTd = Matmul2(Yd,adjYdTdadjTd,OnlyDiagonal) 
 YdadjYuYuadjYd = Matmul2(Yd,adjYuYuadjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYuYuadjYd(i2,i2) =  Real(YdadjYuYuadjYd(i2,i2),dp) 
 YdadjYuTuadjYd = Matmul2(Yd,adjYuTuadjYd,OnlyDiagonal) 
 YdadjYuTuadjTd = Matmul2(Yd,adjYuTuadjTd,OnlyDiagonal) 
 YdadjTdTdadjYd = Matmul2(Yd,adjTdTdadjYd,OnlyDiagonal) 
 YdadjTuTuadjYd = Matmul2(Yd,adjTuTuadjYd,OnlyDiagonal) 
 Yeml2adjYeYe = Matmul2(Ye,ml2adjYeYe,OnlyDiagonal) 
 YeadjYeme2Ye = Matmul2(Ye,adjYeme2Ye,OnlyDiagonal) 
 YeadjYeYeml2 = Matmul2(Ye,adjYeYeml2,OnlyDiagonal) 
 YeadjYeYeadjYe = Matmul2(Ye,adjYeYeadjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeadjYeYeadjYe(i2,i2) =  Real(YeadjYeYeadjYe(i2,i2),dp) 
 YeadjYeTeadjYe = Matmul2(Ye,adjYeTeadjYe,OnlyDiagonal) 
 YeadjYeTeadjTe = Matmul2(Ye,adjYeTeadjTe,OnlyDiagonal) 
 YeadjTeTeadjYe = Matmul2(Ye,adjTeTeadjYe,OnlyDiagonal) 
 YeCYvTpYvadjYe = Matmul2(Ye,CYvTpYvadjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeCYvTpYvadjYe(i2,i2) =  Real(YeCYvTpYvadjYe(i2,i2),dp) 
 YeCYvTpTvadjTe = Matmul2(Ye,CYvTpTvadjTe,OnlyDiagonal) 
 YeCTvTpTvadjYe = Matmul2(Ye,CTvTpTvadjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeCTvTpTvadjYe(i2,i2) =  Real(YeCTvTpTvadjYe(i2,i2),dp) 
 Yumq2adjYuYu = Matmul2(Yu,mq2adjYuYu,OnlyDiagonal) 
 YuadjYdYdadjYu = Matmul2(Yu,adjYdYdadjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYdYdadjYu(i2,i2) =  Real(YuadjYdYdadjYu(i2,i2),dp) 
 YuadjYdTdadjYu = Matmul2(Yu,adjYdTdadjYu,OnlyDiagonal) 
 YuadjYdTdadjTu = Matmul2(Yu,adjYdTdadjTu,OnlyDiagonal) 
 YuadjYumu2Yu = Matmul2(Yu,adjYumu2Yu,OnlyDiagonal) 
 YuadjYuYumq2 = Matmul2(Yu,adjYuYumq2,OnlyDiagonal) 
 YuadjYuYuadjYu = Matmul2(Yu,adjYuYuadjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYuYuadjYu(i2,i2) =  Real(YuadjYuYuadjYu(i2,i2),dp) 
 YuadjYuTuadjYu = Matmul2(Yu,adjYuTuadjYu,OnlyDiagonal) 
 YuadjYuTuadjTu = Matmul2(Yu,adjYuTuadjTu,OnlyDiagonal) 
 YuadjTdTdadjYu = Matmul2(Yu,adjTdTdadjYu,OnlyDiagonal) 
 YuadjTuTuadjYu = Matmul2(Yu,adjTuTuadjYu,OnlyDiagonal) 
 YvadjYvYvadjYv = Matmul2(Yv,adjYvYvadjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvadjYvYvadjYv(i2,i2) =  Real(YvadjYvYvadjYv(i2,i2),dp) 
 YvadjYvTvadjYv = Matmul2(Yv,adjYvTvadjYv,OnlyDiagonal) 
 YvadjYvTvadjTv = Matmul2(Yv,adjYvTvadjTv,OnlyDiagonal) 
 YvadjYvTpYeCYe = Matmul2(Yv,adjYvTpYeCYe,OnlyDiagonal) 
 YvadjYvTpTeCTe = Matmul2(Yv,adjYvTpTeCTe,OnlyDiagonal) 
 YvadjTvTvadjYv = Matmul2(Yv,adjTvTvadjYv,OnlyDiagonal) 
 adjYdmd2YdadjYd = Matmul2(adjYd,md2YdadjYd,OnlyDiagonal) 
 adjYdmd2YdadjYu = Matmul2(adjYd,md2YdadjYu,OnlyDiagonal) 
 adjYdYdmq2adjYd = Matmul2(adjYd,Ydmq2adjYd,OnlyDiagonal) 
 adjYdYdmq2adjYu = Matmul2(adjYd,Ydmq2adjYu,OnlyDiagonal) 
 adjYdYdadjYdmd2 = Matmul2(adjYd,YdadjYdmd2,OnlyDiagonal) 
 adjYdYdadjYdYd = Matmul2(adjYd,YdadjYdYd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdYdadjYdYd(i2,i2) =  Real(adjYdYdadjYdYd(i2,i2),dp) 
 adjYdYdadjYdTd = Matmul2(adjYd,YdadjYdTd,OnlyDiagonal) 
 adjYdYdadjYumu2 = Matmul2(adjYd,YdadjYumu2,OnlyDiagonal) 
 adjYdYdadjYuYu = Matmul2(adjYd,YdadjYuYu,OnlyDiagonal) 
 adjYdYdadjYuTu = Matmul2(adjYd,YdadjYuTu,OnlyDiagonal) 
 adjYdYdadjTdTd = Matmul2(adjYd,YdadjTdTd,OnlyDiagonal) 
 adjYdTdadjYdYd = Matmul2(adjYd,TdadjYdYd,OnlyDiagonal) 
 adjYdTdadjYuYu = Matmul2(adjYd,TdadjYuYu,OnlyDiagonal) 
 adjYdTdadjTdYd = Matmul2(adjYd,TdadjTdYd,OnlyDiagonal) 
 adjYeme2YeadjYe = Matmul2(adjYe,me2YeadjYe,OnlyDiagonal) 
 adjYeme2YeCYv = Matmul2(adjYe,me2YeCYv,OnlyDiagonal) 
 adjYeYeml2adjYe = Matmul2(adjYe,Yeml2adjYe,OnlyDiagonal) 
 adjYeYeml2CYv = Matmul2(adjYe,Yeml2CYv,OnlyDiagonal) 
 adjYeYeadjYeme2 = Matmul2(adjYe,YeadjYeme2,OnlyDiagonal) 
 adjYeYeadjYeYe = Matmul2(adjYe,YeadjYeYe,OnlyDiagonal) 
Forall(i2=1:3)  adjYeYeadjYeYe(i2,i2) =  Real(adjYeYeadjYeYe(i2,i2),dp) 
 adjYeYeadjYeTe = Matmul2(adjYe,YeadjYeTe,OnlyDiagonal) 
 adjYeYeadjTeTe = Matmul2(adjYe,YeadjTeTe,OnlyDiagonal) 
 adjYeYeCYvmv2 = Matmul2(adjYe,YeCYvmv2,OnlyDiagonal) 
 adjYeTeadjYeYe = Matmul2(adjYe,TeadjYeYe,OnlyDiagonal) 
 adjYeTeadjTeYe = Matmul2(adjYe,TeadjTeYe,OnlyDiagonal) 
 adjYeTeCYvTpYv = Matmul2(adjYe,TeCYvTpYv,OnlyDiagonal) 
 adjYeTeCTvTpYv = Matmul2(adjYe,TeCTvTpYv,OnlyDiagonal) 
 adjYumu2YuadjYd = Matmul2(adjYu,mu2YuadjYd,OnlyDiagonal) 
 adjYumu2YuadjYu = Matmul2(adjYu,mu2YuadjYu,OnlyDiagonal) 
 adjYuYumq2adjYd = Matmul2(adjYu,Yumq2adjYd,OnlyDiagonal) 
 adjYuYumq2adjYu = Matmul2(adjYu,Yumq2adjYu,OnlyDiagonal) 
 adjYuYuadjYdmd2 = Matmul2(adjYu,YuadjYdmd2,OnlyDiagonal) 
 adjYuYuadjYdYd = Matmul2(adjYu,YuadjYdYd,OnlyDiagonal) 
 adjYuYuadjYdTd = Matmul2(adjYu,YuadjYdTd,OnlyDiagonal) 
 adjYuYuadjYumu2 = Matmul2(adjYu,YuadjYumu2,OnlyDiagonal) 
 adjYuYuadjYuYu = Matmul2(adjYu,YuadjYuYu,OnlyDiagonal) 
Forall(i2=1:3)  adjYuYuadjYuYu(i2,i2) =  Real(adjYuYuadjYuYu(i2,i2),dp) 
 adjYuYuadjYuTu = Matmul2(adjYu,YuadjYuTu,OnlyDiagonal) 
 adjYuYuadjTuTu = Matmul2(adjYu,YuadjTuTu,OnlyDiagonal) 
 adjYuTuadjYdYd = Matmul2(adjYu,TuadjYdYd,OnlyDiagonal) 
 adjYuTuadjYuYu = Matmul2(adjYu,TuadjYuYu,OnlyDiagonal) 
 adjYuTuadjTuYu = Matmul2(adjYu,TuadjTuYu,OnlyDiagonal) 
 adjYvYvadjYvYv = Matmul2(adjYv,YvadjYvYv,OnlyDiagonal) 
Forall(i2=1:3)  adjYvYvadjYvYv(i2,i2) =  Real(adjYvYvadjYvYv(i2,i2),dp) 
 adjYvYvadjYvCml2 = Matmul2(adjYv,YvadjYvCml2,OnlyDiagonal) 
 adjYvYvadjYvTv = Matmul2(adjYv,YvadjYvTv,OnlyDiagonal) 
 adjYvYvCmv2adjYv = Matmul2(adjYv,YvCmv2adjYv,OnlyDiagonal) 
 adjYvCml2YvadjYv = Matmul2(adjYv,Cml2YvadjYv,OnlyDiagonal) 
 adjYvCml2TpYeCYe = Matmul2(adjYv,Cml2TpYeCYe,OnlyDiagonal) 
 adjYvTvadjYvYv = Matmul2(adjYv,TvadjYvYv,OnlyDiagonal) 
 adjYvTpYeCme2CYe = Matmul2(adjYv,TpYeCme2CYe,OnlyDiagonal) 
 adjYvTpYeCYeYv = Matmul2(adjYv,TpYeCYeYv,OnlyDiagonal) 
Forall(i2=1:3)  adjYvTpYeCYeYv(i2,i2) =  Real(adjYvTpYeCYeYv(i2,i2),dp) 
 adjYvTpYeCYeCml2 = Matmul2(adjYv,TpYeCYeCml2,OnlyDiagonal) 
 adjYvTpYeCYeTv = Matmul2(adjYv,TpYeCYeTv,OnlyDiagonal) 
 adjYvTpYeCTeTv = Matmul2(adjYv,TpYeCTeTv,OnlyDiagonal) 
 adjYvTpTeCYeYv = Matmul2(adjYv,TpTeCYeYv,OnlyDiagonal) 
 adjTdYdadjYdTd = Matmul2(adjTd,YdadjYdTd,OnlyDiagonal) 
 adjTdTdadjYdYd = Matmul2(adjTd,TdadjYdYd,OnlyDiagonal) 
 adjTeYeadjYeTe = Matmul2(adjTe,YeadjYeTe,OnlyDiagonal) 
 adjTeTeadjYeYe = Matmul2(adjTe,TeadjYeYe,OnlyDiagonal) 
 adjTuYuadjYuTu = Matmul2(adjTu,YuadjYuTu,OnlyDiagonal) 
 adjTuTuadjYuYu = Matmul2(adjTu,TuadjYuYu,OnlyDiagonal) 
 Cmv2adjYvYvadjYv = Matmul2(Conjg(mv2),adjYvYvadjYv,OnlyDiagonal) 
 Cmv2adjYvTpYeCYe = Matmul2(Conjg(mv2),adjYvTpYeCYe,OnlyDiagonal) 
 CYeTpYeCYeYv = Matmul2(Conjg(Ye),TpYeCYeYv,OnlyDiagonal) 
 CYeTpYeCYeTv = Matmul2(Conjg(Ye),TpYeCYeTv,OnlyDiagonal) 
 CYeTpTeCYeYv = Matmul2(Conjg(Ye),TpTeCYeYv,OnlyDiagonal) 
 CYvmv2TpYvadjYe = Matmul2(Conjg(Yv),mv2TpYvadjYe,OnlyDiagonal) 
 CYvmv2TpYvCYv = Matmul2(Conjg(Yv),mv2TpYvCYv,OnlyDiagonal) 
 CYvTpYvml2adjYe = Matmul2(Conjg(Yv),TpYvml2adjYe,OnlyDiagonal) 
 CYvTpYvml2CYv = Matmul2(Conjg(Yv),TpYvml2CYv,OnlyDiagonal) 
 CYvTpYvadjYeme2 = Matmul2(Conjg(Yv),TpYvadjYeme2,OnlyDiagonal) 
 CYvTpYvadjYeYe = Matmul2(Conjg(Yv),TpYvadjYeYe,OnlyDiagonal) 
 CYvTpYvadjYeTe = Matmul2(Conjg(Yv),TpYvadjYeTe,OnlyDiagonal) 
 CYvTpYvCYvmv2 = Matmul2(Conjg(Yv),TpYvCYvmv2,OnlyDiagonal) 
 CYvTpYvCYvTpYv = Matmul2(Conjg(Yv),TpYvCYvTpYv,OnlyDiagonal) 
Forall(i2=1:3)  CYvTpYvCYvTpYv(i2,i2) =  Real(CYvTpYvCYvTpYv(i2,i2),dp) 
 CYvTpYvCYvTpTv = Matmul2(Conjg(Yv),TpYvCYvTpTv,OnlyDiagonal) 
 CYvTpYvCTvTpTv = Matmul2(Conjg(Yv),TpYvCTvTpTv,OnlyDiagonal) 
 CYvTpTvadjYeYe = Matmul2(Conjg(Yv),TpTvadjYeYe,OnlyDiagonal) 
 CYvTpTvCYvTpYv = Matmul2(Conjg(Yv),TpTvCYvTpYv,OnlyDiagonal) 
 CYvTpTvCTvTpYv = Matmul2(Conjg(Yv),TpTvCTvTpYv,OnlyDiagonal) 
Forall(i2=1:3)  CYvTpTvCTvTpYv(i2,i2) =  Real(CYvTpTvCTvTpYv(i2,i2),dp) 
 CTvTpYvCYvTpTv = Matmul2(Conjg(Tv),TpYvCYvTpTv,OnlyDiagonal) 
Forall(i2=1:3)  CTvTpYvCYvTpTv(i2,i2) =  Real(CTvTpYvCYvTpTv(i2,i2),dp) 
 CTvTpTvCYvTpYv = Matmul2(Conjg(Tv),TpTvCYvTpYv,OnlyDiagonal) 
 TdadjYdYdadjTd = Matmul2(Td,adjYdYdadjTd,OnlyDiagonal) 
 TdadjYuYuadjTd = Matmul2(Td,adjYuYuadjTd,OnlyDiagonal) 
 TdadjTdYdadjYd = Matmul2(Td,adjTdYdadjYd,OnlyDiagonal) 
 TdadjTuYuadjYd = Matmul2(Td,adjTuYuadjYd,OnlyDiagonal) 
 TeadjYeYeadjTe = Matmul2(Te,adjYeYeadjTe,OnlyDiagonal) 
 TeadjTeYeadjYe = Matmul2(Te,adjTeYeadjYe,OnlyDiagonal) 
 TeCYvTpYvadjTe = Matmul2(Te,CYvTpYvadjTe,OnlyDiagonal) 
 TeCTvTpYvadjYe = Matmul2(Te,CTvTpYvadjYe,OnlyDiagonal) 
 TuadjYdYdadjTu = Matmul2(Tu,adjYdYdadjTu,OnlyDiagonal) 
 TuadjYuYuadjTu = Matmul2(Tu,adjYuYuadjTu,OnlyDiagonal) 
 TuadjTdYdadjYu = Matmul2(Tu,adjTdYdadjYu,OnlyDiagonal) 
 TuadjTuYuadjYu = Matmul2(Tu,adjTuYuadjYu,OnlyDiagonal) 
 TpYvml2CYvTpYv = Matmul2(Transpose(Yv),ml2CYvTpYv,OnlyDiagonal) 
 TpYvadjYeYeCYv = Matmul2(Transpose(Yv),adjYeYeCYv,OnlyDiagonal) 
Forall(i2=1:3)  TpYvadjYeYeCYv(i2,i2) =  Real(TpYvadjYeYeCYv(i2,i2),dp) 
 TpYvadjYeTeCTv = Matmul2(Transpose(Yv),adjYeTeCTv,OnlyDiagonal) 
 TpYvadjTeTeCYv = Matmul2(Transpose(Yv),adjTeTeCYv,OnlyDiagonal) 
 TpYvCYvmv2TpYv = Matmul2(Transpose(Yv),CYvmv2TpYv,OnlyDiagonal) 
 TpYvCYvTpYvml2 = Matmul2(Transpose(Yv),CYvTpYvml2,OnlyDiagonal) 
 TpYvCYvTpYvCYv = Matmul2(Transpose(Yv),CYvTpYvCYv,OnlyDiagonal) 
Forall(i2=1:3)  TpYvCYvTpYvCYv(i2,i2) =  Real(TpYvCYvTpYvCYv(i2,i2),dp) 
 TpYvCYvTpTvCTv = Matmul2(Transpose(Yv),CYvTpTvCTv,OnlyDiagonal) 
 TpYvCTvTpTvCYv = Matmul2(Transpose(Yv),CTvTpTvCYv,OnlyDiagonal) 
Forall(i2=1:3)  TpYvCTvTpTvCYv(i2,i2) =  Real(TpYvCTvTpTvCYv(i2,i2),dp) 
 TpTvadjYeYeCTv = Matmul2(Transpose(Tv),adjYeYeCTv,OnlyDiagonal) 
Forall(i2=1:3)  TpTvadjYeYeCTv(i2,i2) =  Real(TpTvadjYeYeCTv(i2,i2),dp) 
 TpTvadjTeYeCYv = Matmul2(Transpose(Tv),adjTeYeCYv,OnlyDiagonal) 
 TpTvCYvTpYvCTv = Matmul2(Transpose(Tv),CYvTpYvCTv,OnlyDiagonal) 
Forall(i2=1:3)  TpTvCYvTpYvCTv(i2,i2) =  Real(TpTvCYvTpYvCTv(i2,i2),dp) 
 TpTvCTvTpYvCYv = Matmul2(Transpose(Tv),CTvTpYvCYv,OnlyDiagonal) 
 md2YdadjYdYdadjYd = Matmul2(md2,YdadjYdYdadjYd,OnlyDiagonal) 
 md2YdadjYuYuadjYd = Matmul2(md2,YdadjYuYuadjYd,OnlyDiagonal) 
 me2YeadjYeYeadjYe = Matmul2(me2,YeadjYeYeadjYe,OnlyDiagonal) 
 me2YeCYvTpYvadjYe = Matmul2(me2,YeCYvTpYvadjYe,OnlyDiagonal) 
 ml2adjYeYeadjYeYe = Matmul2(ml2,adjYeYeadjYeYe,OnlyDiagonal) 
 ml2CYvTpYvCYvTpYv = Matmul2(ml2,CYvTpYvCYvTpYv,OnlyDiagonal) 
 mq2adjYdYdadjYdYd = Matmul2(mq2,adjYdYdadjYdYd,OnlyDiagonal) 
 mq2adjYdYdadjYuYu = Matmul2(mq2,adjYdYdadjYuYu,OnlyDiagonal) 
 mq2adjYuYuadjYdYd = Matmul2(mq2,adjYuYuadjYdYd,OnlyDiagonal) 
 mq2adjYuYuadjYuYu = Matmul2(mq2,adjYuYuadjYuYu,OnlyDiagonal) 
 mu2YuadjYdYdadjYu = Matmul2(mu2,YuadjYdYdadjYu,OnlyDiagonal) 
 mu2YuadjYuYuadjYu = Matmul2(mu2,YuadjYuYuadjYu,OnlyDiagonal) 
 mv2TpYvadjYeYeCYv = Matmul2(mv2,TpYvadjYeYeCYv,OnlyDiagonal) 
 mv2TpYvCYvTpYvCYv = Matmul2(mv2,TpYvCYvTpYvCYv,OnlyDiagonal) 
 Ydmq2adjYdYdadjYd = Matmul2(Yd,mq2adjYdYdadjYd,OnlyDiagonal) 
 Ydmq2adjYuYuadjYd = Matmul2(Yd,mq2adjYuYuadjYd,OnlyDiagonal) 
 YdadjYdmd2YdadjYd = Matmul2(Yd,adjYdmd2YdadjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYdmd2YdadjYd(i2,i2) =  Real(YdadjYdmd2YdadjYd(i2,i2),dp) 
 YdadjYdYdmq2adjYd = Matmul2(Yd,adjYdYdmq2adjYd,OnlyDiagonal) 
 YdadjYdYdadjYdmd2 = Matmul2(Yd,adjYdYdadjYdmd2,OnlyDiagonal) 
 YdadjYdYdadjYdYd = Matmul2(Yd,adjYdYdadjYdYd,OnlyDiagonal) 
 YdadjYdYdadjYdTd = Matmul2(Yd,adjYdYdadjYdTd,OnlyDiagonal) 
 YdadjYdTdadjYdYd = Matmul2(Yd,adjYdTdadjYdYd,OnlyDiagonal) 
 YdadjYumu2YuadjYd = Matmul2(Yd,adjYumu2YuadjYd,OnlyDiagonal) 
Forall(i2=1:3)  YdadjYumu2YuadjYd(i2,i2) =  Real(YdadjYumu2YuadjYd(i2,i2),dp) 
 YdadjYuYumq2adjYd = Matmul2(Yd,adjYuYumq2adjYd,OnlyDiagonal) 
 YdadjYuYuadjYdmd2 = Matmul2(Yd,adjYuYuadjYdmd2,OnlyDiagonal) 
 YdadjYuYuadjYdYd = Matmul2(Yd,adjYuYuadjYdYd,OnlyDiagonal) 
 YdadjYuYuadjYdTd = Matmul2(Yd,adjYuYuadjYdTd,OnlyDiagonal) 
 YdadjYuYuadjYuYu = Matmul2(Yd,adjYuYuadjYuYu,OnlyDiagonal) 
 YdadjYuYuadjYuTu = Matmul2(Yd,adjYuYuadjYuTu,OnlyDiagonal) 
 YdadjYuTuadjYdYd = Matmul2(Yd,adjYuTuadjYdYd,OnlyDiagonal) 
 YdadjYuTuadjYuYu = Matmul2(Yd,adjYuTuadjYuYu,OnlyDiagonal) 
 Yeml2adjYeYeadjYe = Matmul2(Ye,ml2adjYeYeadjYe,OnlyDiagonal) 
 Yeml2CYvTpYvadjYe = Matmul2(Ye,ml2CYvTpYvadjYe,OnlyDiagonal) 
 YeadjYeme2YeadjYe = Matmul2(Ye,adjYeme2YeadjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeadjYeme2YeadjYe(i2,i2) =  Real(YeadjYeme2YeadjYe(i2,i2),dp) 
 YeadjYeYeml2adjYe = Matmul2(Ye,adjYeYeml2adjYe,OnlyDiagonal) 
 YeadjYeYeadjYeme2 = Matmul2(Ye,adjYeYeadjYeme2,OnlyDiagonal) 
 YeadjYeYeadjYeYe = Matmul2(Ye,adjYeYeadjYeYe,OnlyDiagonal) 
 YeadjYeYeadjYeTe = Matmul2(Ye,adjYeYeadjYeTe,OnlyDiagonal) 
 YeadjYeTeadjYeYe = Matmul2(Ye,adjYeTeadjYeYe,OnlyDiagonal) 
 YeCYvmv2TpYvadjYe = Matmul2(Ye,CYvmv2TpYvadjYe,OnlyDiagonal) 
Forall(i2=1:3)  YeCYvmv2TpYvadjYe(i2,i2) =  Real(YeCYvmv2TpYvadjYe(i2,i2),dp) 
 YeCYvTpYvml2adjYe = Matmul2(Ye,CYvTpYvml2adjYe,OnlyDiagonal) 
 YeCYvTpYvadjYeme2 = Matmul2(Ye,CYvTpYvadjYeme2,OnlyDiagonal) 
 YeCYvTpYvadjYeYe = Matmul2(Ye,CYvTpYvadjYeYe,OnlyDiagonal) 
 YeCYvTpYvadjYeTe = Matmul2(Ye,CYvTpYvadjYeTe,OnlyDiagonal) 
 YeCYvTpYvCYvTpYv = Matmul2(Ye,CYvTpYvCYvTpYv,OnlyDiagonal) 
 YeCYvTpYvCYvTpTv = Matmul2(Ye,CYvTpYvCYvTpTv,OnlyDiagonal) 
 YeCYvTpTvadjYeYe = Matmul2(Ye,CYvTpTvadjYeYe,OnlyDiagonal) 
 YeCYvTpTvCYvTpYv = Matmul2(Ye,CYvTpTvCYvTpYv,OnlyDiagonal) 
 Yumq2adjYdYdadjYu = Matmul2(Yu,mq2adjYdYdadjYu,OnlyDiagonal) 
 Yumq2adjYuYuadjYu = Matmul2(Yu,mq2adjYuYuadjYu,OnlyDiagonal) 
 YuadjYdmd2YdadjYu = Matmul2(Yu,adjYdmd2YdadjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYdmd2YdadjYu(i2,i2) =  Real(YuadjYdmd2YdadjYu(i2,i2),dp) 
 YuadjYdYdmq2adjYu = Matmul2(Yu,adjYdYdmq2adjYu,OnlyDiagonal) 
 YuadjYdYdadjYdYd = Matmul2(Yu,adjYdYdadjYdYd,OnlyDiagonal) 
 YuadjYdYdadjYdTd = Matmul2(Yu,adjYdYdadjYdTd,OnlyDiagonal) 
 YuadjYdYdadjYumu2 = Matmul2(Yu,adjYdYdadjYumu2,OnlyDiagonal) 
 YuadjYdYdadjYuYu = Matmul2(Yu,adjYdYdadjYuYu,OnlyDiagonal) 
 YuadjYdYdadjYuTu = Matmul2(Yu,adjYdYdadjYuTu,OnlyDiagonal) 
 YuadjYdTdadjYdYd = Matmul2(Yu,adjYdTdadjYdYd,OnlyDiagonal) 
 YuadjYdTdadjYuYu = Matmul2(Yu,adjYdTdadjYuYu,OnlyDiagonal) 
 YuadjYumu2YuadjYu = Matmul2(Yu,adjYumu2YuadjYu,OnlyDiagonal) 
Forall(i2=1:3)  YuadjYumu2YuadjYu(i2,i2) =  Real(YuadjYumu2YuadjYu(i2,i2),dp) 
 YuadjYuYumq2adjYu = Matmul2(Yu,adjYuYumq2adjYu,OnlyDiagonal) 
 YuadjYuYuadjYumu2 = Matmul2(Yu,adjYuYuadjYumu2,OnlyDiagonal) 
 YuadjYuYuadjYuYu = Matmul2(Yu,adjYuYuadjYuYu,OnlyDiagonal) 
 YuadjYuYuadjYuTu = Matmul2(Yu,adjYuYuadjYuTu,OnlyDiagonal) 
 YuadjYuTuadjYuYu = Matmul2(Yu,adjYuTuadjYuYu,OnlyDiagonal) 
 YvadjYvYvadjYvYv = Matmul2(Yv,adjYvYvadjYvYv,OnlyDiagonal) 
 YvadjYvYvadjYvCml2 = Matmul2(Yv,adjYvYvadjYvCml2,OnlyDiagonal) 
 YvadjYvYvadjYvTv = Matmul2(Yv,adjYvYvadjYvTv,OnlyDiagonal) 
 YvadjYvYvCmv2adjYv = Matmul2(Yv,adjYvYvCmv2adjYv,OnlyDiagonal) 
 YvadjYvCml2YvadjYv = Matmul2(Yv,adjYvCml2YvadjYv,OnlyDiagonal) 
Forall(i2=1:3)  YvadjYvCml2YvadjYv(i2,i2) =  Real(YvadjYvCml2YvadjYv(i2,i2),dp) 
 YvadjYvCml2TpYeCYe = Matmul2(Yv,adjYvCml2TpYeCYe,OnlyDiagonal) 
 YvadjYvTvadjYvYv = Matmul2(Yv,adjYvTvadjYvYv,OnlyDiagonal) 
 YvadjYvTpYeCme2CYe = Matmul2(Yv,adjYvTpYeCme2CYe,OnlyDiagonal) 
 YvadjYvTpYeCYeYv = Matmul2(Yv,adjYvTpYeCYeYv,OnlyDiagonal) 
 YvadjYvTpYeCYeCml2 = Matmul2(Yv,adjYvTpYeCYeCml2,OnlyDiagonal) 
 YvadjYvTpYeCYeTv = Matmul2(Yv,adjYvTpYeCYeTv,OnlyDiagonal) 
 YvadjYvTpTeCYeYv = Matmul2(Yv,adjYvTpTeCYeYv,OnlyDiagonal) 
 YvCmv2adjYvYvadjYv = Matmul2(Yv,Cmv2adjYvYvadjYv,OnlyDiagonal) 
 YvCmv2adjYvTpYeCYe = Matmul2(Yv,Cmv2adjYvTpYeCYe,OnlyDiagonal) 
 adjYdmd2YdadjYdYd = Matmul2(adjYd,md2YdadjYdYd,OnlyDiagonal) 
 adjYdYdmq2adjYdYd = Matmul2(adjYd,Ydmq2adjYdYd,OnlyDiagonal) 
Forall(i2=1:3)  adjYdYdmq2adjYdYd(i2,i2) =  Real(adjYdYdmq2adjYdYd(i2,i2),dp) 
 adjYdYdadjYdmd2Yd = Matmul2(adjYd,YdadjYdmd2Yd,OnlyDiagonal) 
 adjYdYdadjYdYdmq2 = Matmul2(adjYd,YdadjYdYdmq2,OnlyDiagonal) 
 adjYeme2YeadjYeYe = Matmul2(adjYe,me2YeadjYeYe,OnlyDiagonal) 
 adjYeYeml2adjYeYe = Matmul2(adjYe,Yeml2adjYeYe,OnlyDiagonal) 
Forall(i2=1:3)  adjYeYeml2adjYeYe(i2,i2) =  Real(adjYeYeml2adjYeYe(i2,i2),dp) 
 adjYeYeadjYeme2Ye = Matmul2(adjYe,YeadjYeme2Ye,OnlyDiagonal) 
 adjYeYeadjYeYeml2 = Matmul2(adjYe,YeadjYeYeml2,OnlyDiagonal) 
 adjYumu2YuadjYuYu = Matmul2(adjYu,mu2YuadjYuYu,OnlyDiagonal) 
 adjYuYumq2adjYuYu = Matmul2(adjYu,Yumq2adjYuYu,OnlyDiagonal) 
Forall(i2=1:3)  adjYuYumq2adjYuYu(i2,i2) =  Real(adjYuYumq2adjYuYu(i2,i2),dp) 
 adjYuYuadjYumu2Yu = Matmul2(adjYu,YuadjYumu2Yu,OnlyDiagonal) 
 adjYuYuadjYuYumq2 = Matmul2(adjYu,YuadjYuYumq2,OnlyDiagonal) 
 CYvmv2TpYvCYvTpYv = Matmul2(Conjg(Yv),mv2TpYvCYvTpYv,OnlyDiagonal) 
 CYvTpYvml2CYvTpYv = Matmul2(Conjg(Yv),TpYvml2CYvTpYv,OnlyDiagonal) 
Forall(i2=1:3)  CYvTpYvml2CYvTpYv(i2,i2) =  Real(CYvTpYvml2CYvTpYv(i2,i2),dp) 
 CYvTpYvCYvmv2TpYv = Matmul2(Conjg(Yv),TpYvCYvmv2TpYv,OnlyDiagonal) 
 CYvTpYvCYvTpYvml2 = Matmul2(Conjg(Yv),TpYvCYvTpYvml2,OnlyDiagonal) 
 TdadjYdYdadjYdYd = Matmul2(Td,adjYdYdadjYdYd,OnlyDiagonal) 
 TdadjYuYuadjYdYd = Matmul2(Td,adjYuYuadjYdYd,OnlyDiagonal) 
 TdadjYuYuadjYuYu = Matmul2(Td,adjYuYuadjYuYu,OnlyDiagonal) 
 TeadjYeYeadjYeYe = Matmul2(Te,adjYeYeadjYeYe,OnlyDiagonal) 
 TeCYvTpYvadjYeYe = Matmul2(Te,CYvTpYvadjYeYe,OnlyDiagonal) 
 TeCYvTpYvCYvTpYv = Matmul2(Te,CYvTpYvCYvTpYv,OnlyDiagonal) 
 TuadjYdYdadjYdYd = Matmul2(Tu,adjYdYdadjYdYd,OnlyDiagonal) 
 TuadjYdYdadjYuYu = Matmul2(Tu,adjYdYdadjYuYu,OnlyDiagonal) 
 TuadjYuYuadjYuYu = Matmul2(Tu,adjYuYuadjYuYu,OnlyDiagonal) 
 TvadjYvYvadjYvYv = Matmul2(Tv,adjYvYvadjYvYv,OnlyDiagonal) 
 TvadjYvTpYeCYeYv = Matmul2(Tv,adjYvTpYeCYeYv,OnlyDiagonal) 
 TpYeCYeTpYeCYeYv = Matmul2(Transpose(Ye),CYeTpYeCYeYv,OnlyDiagonal) 
 TpYeCYeTpYeCYeTv = Matmul2(Transpose(Ye),CYeTpYeCYeTv,OnlyDiagonal) 
 TpYeCYeTpTeCYeYv = Matmul2(Transpose(Ye),CYeTpTeCYeYv,OnlyDiagonal) 
 TpYvml2adjYeYeCYv = Matmul2(Transpose(Yv),ml2adjYeYeCYv,OnlyDiagonal) 
 TpYvml2CYvTpYvCYv = Matmul2(Transpose(Yv),ml2CYvTpYvCYv,OnlyDiagonal) 
 TpYvadjYeme2YeCYv = Matmul2(Transpose(Yv),adjYeme2YeCYv,OnlyDiagonal) 
Forall(i2=1:3)  TpYvadjYeme2YeCYv(i2,i2) =  Real(TpYvadjYeme2YeCYv(i2,i2),dp) 
 TpYvadjYeYeml2CYv = Matmul2(Transpose(Yv),adjYeYeml2CYv,OnlyDiagonal) 
 TpYvadjYeYeCYvmv2 = Matmul2(Transpose(Yv),adjYeYeCYvmv2,OnlyDiagonal) 
 TpYvCYvmv2TpYvCYv = Matmul2(Transpose(Yv),CYvmv2TpYvCYv,OnlyDiagonal) 
Forall(i2=1:3)  TpYvCYvmv2TpYvCYv(i2,i2) =  Real(TpYvCYvmv2TpYvCYv(i2,i2),dp) 
 TpYvCYvTpYvml2CYv = Matmul2(Transpose(Yv),CYvTpYvml2CYv,OnlyDiagonal) 
 TpYvCYvTpYvCYvmv2 = Matmul2(Transpose(Yv),CYvTpYvCYvmv2,OnlyDiagonal) 
 TpTeCYeTpYeCYeYv = Matmul2(Transpose(Te),CYeTpYeCYeYv,OnlyDiagonal) 
 TrCTdTpYd = cTrace(CTdTpYd)
 TrCTeTpYe = cTrace(CTeTpYe)
 TrCTuTpYu = cTrace(CTuTpYu)
 TrCTvTpYv = cTrace(CTvTpYv)
 Trml2YvadjYv = cTrace(ml2YvadjYv)
 Trmv2adjYvYv = cTrace(mv2adjYvYv)
 TrYdadjYdCmd2 = cTrace(YdadjYdCmd2)
 TrYdCmq2adjYd = Real(cTrace(YdCmq2adjYd),dp)  
 TrYeadjYeCme2 = cTrace(YeadjYeCme2)
 TrYeCml2adjYe = Real(cTrace(YeCml2adjYe),dp)  
 TrYuadjYuCmu2 = cTrace(YuadjYuCmu2)
 TrYuCmq2adjYu = Real(cTrace(YuCmq2adjYu),dp)  
 TrYdadjYdYdadjYd = Real(cTrace(YdadjYdYdadjYd),dp)  
 TrYdadjYdTdadjYd = cTrace(YdadjYdTdadjYd)
 TrYdadjYdTdadjTd = cTrace(YdadjYdTdadjTd)
 TrYdadjYuYuadjYd = Real(cTrace(YdadjYuYuadjYd),dp)  
 TrYdadjYuTuadjYd = cTrace(YdadjYuTuadjYd)
 TrYdadjYuTuadjTd = cTrace(YdadjYuTuadjTd)
 TrYdadjTdTdadjYd = cTrace(YdadjTdTdadjYd)
 TrYdadjTuTuadjYd = cTrace(YdadjTuTuadjYd)
 TrYeadjYeYeadjYe = Real(cTrace(YeadjYeYeadjYe),dp)  
 TrYeadjYeTeadjYe = cTrace(YeadjYeTeadjYe)
 TrYeadjYeTeadjTe = cTrace(YeadjYeTeadjTe)
 TrYeadjTeTeadjYe = cTrace(YeadjTeTeadjYe)
 TrYeCTvTpTvadjYe = Real(cTrace(YeCTvTpTvadjYe),dp)  
 TrYuadjYdTdadjYu = cTrace(YuadjYdTdadjYu)
 TrYuadjYdTdadjTu = cTrace(YuadjYdTdadjTu)
 TrYuadjYuYuadjYu = Real(cTrace(YuadjYuYuadjYu),dp)  
 TrYuadjYuTuadjYu = cTrace(YuadjYuTuadjYu)
 TrYuadjYuTuadjTu = cTrace(YuadjYuTuadjTu)
 TrYuadjTdTdadjYu = cTrace(YuadjTdTdadjYu)
 TrYuadjTuTuadjYu = cTrace(YuadjTuTuadjYu)
 TrYvadjYvYvadjYv = Real(cTrace(YvadjYvYvadjYv),dp)  
 TrYvadjYvTvadjYv = cTrace(YvadjYvTvadjYv)
 TrYvadjYvTvadjTv = cTrace(YvadjYvTvadjTv)
 TrYvadjYvTpYeCYe = cTrace(YvadjYvTpYeCYe)
 TrYvadjYvTpTeCTe = cTrace(YvadjYvTpTeCTe)
 TrYvadjTvTvadjYv = cTrace(YvadjTvTvadjYv)
 TradjYeTeCYvTpYv = cTrace(adjYeTeCYvTpYv)
 TradjYeTeCTvTpYv = cTrace(adjYeTeCTvTpYv)
 TradjYvTpYeCYeTv = cTrace(adjYvTpYeCYeTv)
 TradjYvTpYeCTeTv = cTrace(adjYvTpYeCTeTv)
 Trmd2YdadjYdYdadjYd = cTrace(md2YdadjYdYdadjYd)
 Trmd2YdadjYuYuadjYd = cTrace(md2YdadjYuYuadjYd)
 Trme2YeadjYeYeadjYe = cTrace(me2YeadjYeYeadjYe)
 Trml2adjYeYeadjYeYe = cTrace(ml2adjYeYeadjYeYe)
 Trmq2adjYdYdadjYdYd = cTrace(mq2adjYdYdadjYdYd)
 Trmq2adjYdYdadjYuYu = cTrace(mq2adjYdYdadjYuYu)
 Trmq2adjYuYuadjYdYd = cTrace(mq2adjYuYuadjYdYd)
 Trmq2adjYuYuadjYuYu = cTrace(mq2adjYuYuadjYuYu)
 Trmu2YuadjYdYdadjYu = cTrace(mu2YuadjYdYdadjYu)
 Trmu2YuadjYuYuadjYu = cTrace(mu2YuadjYuYuadjYu)
 TrYvadjYvYvadjYvCml2 = cTrace(YvadjYvYvadjYvCml2)
 TrYvadjYvYvCmv2adjYv = cTrace(YvadjYvYvCmv2adjYv)
 TrYvadjYvCml2YvadjYv = Real(cTrace(YvadjYvCml2YvadjYv),dp)  
 TrYvadjYvCml2TpYeCYe = cTrace(YvadjYvCml2TpYeCYe)
 TrYvadjYvTpYeCme2CYe = cTrace(YvadjYvTpYeCme2CYe)
 TrYvadjYvTpYeCYeCml2 = cTrace(YvadjYvTpYeCYeCml2)
 TrYvCmv2adjYvYvadjYv = cTrace(YvCmv2adjYvYvadjYv)
 TrYvCmv2adjYvTpYeCYe = cTrace(YvCmv2adjYvTpYeCYe)
 g1p4 =g1**4 
 g2p4 =g2**4 
 g3p4 =g3**4 
 gpp4 =gp**4 
 Qdp4 =Qd**4 
 Qep3 =Qe**3 
 Qep4 =Qe**4 
 QHdp3 =QHd**3 
 QHdp4 =QHd**4 
 QHup3 =QHu**3 
 QHup4 =QHu**4 
 Qlp3 =Ql**3 
 Qlp4 =Ql**4 
 Qqp3 =Qq**3 
 Qqp4 =Qq**4 
 Qsp3 =Qs**3 
 Qsp4 =Qs**4 
 Qs1p3 =Qs1**3 
 Qs1p4 =Qs1**4 
 Qs2p3 =Qs2**3 
 Qs2p4 =Qs2**4 
 Qs3p3 =Qs3**3 
 Qs3p4 =Qs3**4 
 Qup3 =Qu**3 
 Qup4 =Qu**4 
 Qvp3 =Qv**3 
 Qvp4 =Qv**4 
 Xip2 =Xi**2 
 kapp2 =kap**2 
 lamp3 =lam**3 
 Ckapp2 =Conjg(kap)**2 
 Clamp2 =Conjg(lam)**2 
End If 
 
 
Tr1(1) = g1*sqrt3ov5*(-1._dp*(mHd2) + mHu2 + Trmd2 + Trme2 - Trml2 + Trmq2 -          & 
&  2._dp*(Trmu2))

Tr1(4) = gp*(2*mHd2*QHd + 2*mHu2*QHu + ms2*Qs + ms12*Qs1 + ms22*Qs2 + ms32*Qs3 +      & 
&  3*Qd*Trmd2 + Qe*Trme2 + 2*Ql*Trml2 + 6*Qq*Trmq2 + 3*Qu*Trmu2 + Qv*Trmv2)

If (TwoLoopRGE) Then 
Tr2U1(1, 1) = (g1p2*(3._dp*(mHd2) + 3._dp*(mHu2) + 2._dp*(Trmd2) + 6._dp*(Trme2)      & 
&  + 3._dp*(Trml2) + Trmq2 + 8._dp*(Trmu2)))/10._dp

Tr2U1(1, 4) = g1*gp*sqrt3ov5*(-(mHd2*QHd) + mHu2*QHu + Qd*Trmd2 + Qe*Trme2 -          & 
&  Ql*Trml2 + Qq*Trmq2 - 2*Qu*Trmu2)

Tr3(1) = (g1*ooSqrt15*(-9*g1p2*mHd2 - 45*g2p2*mHd2 + 30*Abslam*(mHd2 - mHu2)          & 
&  + 9*g1p2*mHu2 + 45*g2p2*mHu2 - 60*gpp2*mHd2*QHdp2 + 60*gpp2*mHu2*QHup2 +              & 
&  4*(g1p2 + 20._dp*(g3p2) + 15*gpp2*Qdp2)*Trmd2 + 36*g1p2*Trme2 + 60*gpp2*Qep2*Trme2 -  & 
&  9*g1p2*Trml2 - 45*g2p2*Trml2 - 60*gpp2*Qlp2*Trml2 + 30._dp*(Trml2YvadjYv)             & 
&  + g1p2*Trmq2 + 45*g2p2*Trmq2 + 80*g3p2*Trmq2 + 60*gpp2*Qqp2*Trmq2 - 32*g1p2*Trmu2 -   & 
&  160*g3p2*Trmu2 - 120*gpp2*Qup2*Trmu2 + 90*mHd2*TrYdadjYd - 60._dp*(TrYdadjYdCmd2)     & 
&  - 30._dp*(TrYdCmq2adjYd) + 30*mHd2*TrYeadjYe - 60._dp*(TrYeadjYeCme2) +               & 
&  30._dp*(TrYeCml2adjYe) - 90*mHu2*TrYuadjYu + 120._dp*(TrYuadjYuCmu2) - 30._dp*(TrYuCmq2adjYu)& 
&  - 30*mHu2*TrYvadjYv))/20._dp

Tr2(2) = (mHd2 + mHu2 + Trml2 + 3._dp*(Trmq2))/2._dp

Tr2(3) = (Trmd2 + 2._dp*(Trmq2) + Trmu2)/2._dp

Tr2U1(4, 1) = g1*gp*sqrt3ov5*(-(mHd2*QHd) + mHu2*QHu + Qd*Trmd2 + Qe*Trme2 -          & 
&  Ql*Trml2 + Qq*Trmq2 - 2*Qu*Trmu2)

Tr2U1(4, 4) = gpp2*(2*mHd2*QHdp2 + 2*mHu2*QHup2 + ms12*Qs1p2 + ms22*Qs2p2 +           & 
&  ms32*Qs3p2 + ms2*Qsp2 + 3*Qdp2*Trmd2 + Qep2*Trme2 + 2*Qlp2*Trml2 + 6*Qqp2*Trmq2 +     & 
&  3*Qup2*Trmu2 + Qvp2*Trmv2)

Tr3(4) = (gp*(-5*Abskap*(ms12*Qs1 + ms22*Qs2 + ms32*Qs3) + 9*(3*g1p2*mHd2*QHd +       & 
&  15*g2p2*mHd2*QHd + 20*gpp2*mHd2*QHdp3 + 3*g1p2*mHu2*QHu + 15*g2p2*mHu2*QHu +          & 
&  20*gpp2*mHu2*QHup3 - 10*Abslam*(mHd2*QHd + mHu2*QHu + ms2*Qs) + 10*gpp2*ms12*Qs1p3 +  & 
&  10*gpp2*ms22*Qs2p3 + 10*gpp2*ms32*Qs3p3 + 10*gpp2*ms2*Qsp3 + 2*Qd*(g1p2 +             & 
&  20._dp*(g3p2) + 15*gpp2*Qdp2)*Trmd2 + 6*g1p2*Qe*Trme2 + 10*gpp2*Qep3*Trme2 +          & 
&  3*g1p2*Ql*Trml2 + 15*g2p2*Ql*Trml2 + 20*gpp2*Qlp3*Trml2 - 10*Ql*Trml2YvadjYv +        & 
&  g1p2*Qq*Trmq2 + 45*g2p2*Qq*Trmq2 + 80*g3p2*Qq*Trmq2 + 60*gpp2*Qqp3*Trmq2 +            & 
&  8*g1p2*Qu*Trmu2 + 40*g3p2*Qu*Trmu2 + 30*gpp2*Qup3*Trmu2 + 10*gpp2*Qvp3*Trmv2 -        & 
&  10*Qv*Trmv2adjYvYv - 30*mHd2*QHd*TrYdadjYd - 30*Qd*TrYdadjYdCmd2 - 30*Qq*TrYdCmq2adjYd -& 
&  10*mHd2*QHd*TrYeadjYe - 10*Qe*TrYeadjYeCme2 - 10*Ql*TrYeCml2adjYe - 30*mHu2*QHu*TrYuadjYu -& 
&  30*Qu*TrYuadjYuCmu2 - 30*Qq*TrYuCmq2adjYu - 10*mHu2*QHu*TrYvadjYv)))/90._dp

End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 33._dp*(g1p3)/5._dp

 
 
If (TwoLoopRGE) Then 
betag12 = (g1p3*(-30._dp*(Abslam) + 199._dp*(g1p2) + 135._dp*(g2p2) + 440._dp*(g3p2) +          & 
&  60*gpp2*Qdp2 + 180*gpp2*Qep2 + 30*gpp2*QHdp2 + 30*gpp2*QHup2 + 90*gpp2*Qlp2 +         & 
&  30*gpp2*Qqp2 + 240*gpp2*Qup2 - 70._dp*(TrYdadjYd) - 90._dp*(TrYeadjYe) -              & 
&  130._dp*(TrYuadjYu) - 30._dp*(TrYvadjYv)))/25._dp

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = g2p3

 
 
If (TwoLoopRGE) Then 
betag22 = (g2p3*(-10._dp*(Abslam) + 9._dp*(g1p2) + 125._dp*(g2p2) + 120._dp*(g3p2) +            & 
&  10*gpp2*QHdp2 + 10*gpp2*QHup2 + 30*gpp2*Qlp2 + 90*gpp2*Qqp2 - 30._dp*(TrYdadjYd) -    & 
&  10._dp*(TrYeadjYe) - 30._dp*(TrYuadjYu) - 10._dp*(TrYvadjYv)))/5._dp

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = -3._dp*(g3p3)

 
 
If (TwoLoopRGE) Then 
betag32 = (g3p3*(11._dp*(g1p2) + 45._dp*(g2p2) + 70._dp*(g3p2) + 30*gpp2*Qdp2 + 60*gpp2*Qqp2 +  & 
&  30*gpp2*Qup2 - 20._dp*(TrYdadjYd) - 20._dp*(TrYuadjYu)))/5._dp

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! gp 
!-------------------- 
 
betagp1  = gpp3*(9._dp*(Qdp2) + 3._dp*(Qep2) + 2._dp*(QHdp2) + 2._dp*(QHup2)          & 
&  + 6._dp*(Qlp2) + 18._dp*(Qqp2) + Qs1p2 + Qs2p2 + Qs3p2 + Qsp2 + 9._dp*(Qup2)          & 
&  + 3._dp*(Qvp2))

 
 
If (TwoLoopRGE) Then 
betagp2 = (2*gpp3*(-5*Abskap*(Qs1p2 + Qs2p2 + Qs3p2) + 9*(6*g1p2*Qdp2 + 120*g3p2*Qdp2 +         & 
&  90*gpp2*Qdp4 + 18*g1p2*Qep2 + 30*gpp2*Qep4 + 3*g1p2*QHdp2 + 15*g2p2*QHdp2 +           & 
&  20*gpp2*QHdp4 + 3*g1p2*QHup2 + 15*g2p2*QHup2 + 20*gpp2*QHup4 + 9*g1p2*Qlp2 +          & 
&  45*g2p2*Qlp2 + 60*gpp2*Qlp4 + 3*g1p2*Qqp2 + 135*g2p2*Qqp2 + 240*g3p2*Qqp2 +           & 
&  180*gpp2*Qqp4 + 10*gpp2*Qs1p4 + 10*gpp2*Qs2p4 + 10*gpp2*Qs3p4 - 10*Abslam*(QHdp2 +    & 
&  QHup2 + Qsp2) + 10*gpp2*Qsp4 + 24*g1p2*Qup2 + 120*g3p2*Qup2 + 90*gpp2*Qup4 +          & 
&  30*gpp2*Qvp4 - 30*(Qdp2 + QHdp2 + Qqp2)*TrYdadjYd - 10*Qep2*TrYeadjYe -               & 
&  10*QHdp2*TrYeadjYe - 10*Qlp2*TrYeadjYe - 30*QHup2*TrYuadjYu - 30*Qqp2*TrYuadjYu -     & 
&  30*Qup2*TrYuadjYu - 10*QHup2*TrYvadjYv - 10*Qlp2*TrYvadjYv - 10*Qvp2*TrYvadjYv)))/45._dp

 
Dgp = oo16pi2*( betagp1 + oo16pi2 * betagp2 ) 

 
Else 
Dgp = oo16pi2* betagp1 
End If 
 
 
!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = (Abslam - 7._dp*(g1p2)/15._dp - 3._dp*(g2p2) - 16._dp*(g3p2)               & 
& /3._dp - 2*gpp2*Qdp2 - 2*gpp2*QHdp2 - 2*gpp2*Qqp2 + 3._dp*(TrYdadjYd) + TrYeadjYe)     & 
& *Yd + 3._dp*(YdadjYdYd) + YdadjYuYu

 
 
If (TwoLoopRGE) Then 
betaYd2 = (287._dp*(g1p4)/90._dp + g1p2*g2p2 + 15._dp*(g2p4)/2._dp + (8*g1p2*g3p2)/9._dp +      & 
&  8*g2p2*g3p2 - 16._dp*(g3p4)/9._dp - 3*Clamp2*lamp2 + (44*g1p2*gpp2*Qdp2)/15._dp +     & 
&  (32*g3p2*gpp2*Qdp2)/3._dp + 22*gpp4*Qdp4 + (12*g1p2*gpp2*Qd*Qe)/5._dp +               & 
&  6*gpp4*Qdp2*Qep2 - (22*g1p2*gpp2*Qd*QHd)/5._dp - (18*g1p2*gpp2*Qe*QHd)/5._dp +        & 
&  (12*g1p2*gpp2*QHdp2)/5._dp + 6*g2p2*gpp2*QHdp2 + 22*gpp4*Qdp2*QHdp2 + 6*gpp4*Qep2*QHdp2 +& 
&  8*gpp4*QHdp4 + (4*g1p2*gpp2*Qd*QHu)/5._dp - (6*g1p2*gpp2*QHd*QHu)/5._dp +             & 
&  4*gpp4*Qdp2*QHup2 + 4*gpp4*QHdp2*QHup2 - (12*g1p2*gpp2*Qd*Ql)/5._dp + (18*g1p2*gpp2*QHd*Ql)/5._dp +& 
&  12*gpp4*Qdp2*Qlp2 + 12*gpp4*QHdp2*Qlp2 + (18*g1p2*gpp2*Qd*Qq)/5._dp + (6*g1p2*gpp2*Qe*Qq)/5._dp -& 
&  4*g1p2*gpp2*QHd*Qq + (2*g1p2*gpp2*QHu*Qq)/5._dp - (6*g1p2*gpp2*Ql*Qq)/5._dp +         & 
&  (4*g1p2*gpp2*Qqp2)/3._dp + 6*g2p2*gpp2*Qqp2 + (32*g3p2*gpp2*Qqp2)/3._dp +             & 
&  54*gpp4*Qdp2*Qqp2 + 6*gpp4*Qep2*Qqp2 + 40*gpp4*QHdp2*Qqp2 + 4*gpp4*QHup2*Qqp2 +       & 
&  12*gpp4*Qlp2*Qqp2 + 40*gpp4*Qqp4 + 2*gpp4*Qdp2*Qs1p2 + 2*gpp4*QHdp2*Qs1p2 +           & 
&  2*gpp4*Qqp2*Qs1p2 + 2*gpp4*Qdp2*Qs2p2 + 2*gpp4*QHdp2*Qs2p2 + 2*gpp4*Qqp2*Qs2p2 +      & 
&  2*gpp4*Qdp2*Qs3p2 + 2*gpp4*QHdp2*Qs3p2 + 2*gpp4*Qqp2*Qs3p2 + 2*gpp4*Qdp2*Qsp2 +       & 
&  2*gpp4*QHdp2*Qsp2 + 2*gpp4*Qqp2*Qsp2 - (24*g1p2*gpp2*Qd*Qu)/5._dp + (36*g1p2*gpp2*QHd*Qu)/5._dp -& 
&  (12*g1p2*gpp2*Qq*Qu)/5._dp + 18*gpp4*Qdp2*Qup2 + 18*gpp4*QHdp2*Qup2 + 18*gpp4*Qqp2*Qup2 +& 
&  6*gpp4*Qdp2*Qvp2 + 6*gpp4*QHdp2*Qvp2 + 6*gpp4*Qqp2*Qvp2 - (2*(g1p2 - 5*(8._dp*(g3p2) +& 
&  3*gpp2*(Qdp2 - QHdp2 + Qqp2)))*TrYdadjYd)/5._dp - 9._dp*(TrYdadjYdYdadjYd) -          & 
&  3._dp*(TrYdadjYuYuadjYd) + (6*g1p2*TrYeadjYe)/5._dp + 2*gpp2*Qep2*TrYeadjYe -         & 
&  2*gpp2*QHdp2*TrYeadjYe + 2*gpp2*Qlp2*TrYeadjYe - 3._dp*(TrYeadjYeYeadjYe) -           & 
&  Abslam*(2*gpp2*(QHdp2 - QHup2 - Qsp2) + 3._dp*(TrYuadjYu) + TrYvadjYv) -              & 
&  TrYvadjYvTpYeCYe)*Yd + (-3._dp*(Abslam) + 4._dp*(g1p2)/5._dp + 6._dp*(g2p2) -         & 
&  2*gpp2*Qdp2 + 6*gpp2*QHdp2 + 2*gpp2*Qqp2 - 9._dp*(TrYdadjYd) - 3._dp*(TrYeadjYe))*YdadjYdYd  
betaYd2 =  betaYd2- 4._dp*(YdadjYdYdadjYdYd) - Abslam*YdadjYuYu + (4*g1p2*YdadjYuYu)/5._dp +              & 
&  2*gpp2*QHup2*YdadjYuYu - 2*gpp2*Qqp2*YdadjYuYu + 2*gpp2*Qup2*YdadjYuYu -              & 
&  3*TrYuadjYu*YdadjYuYu - TrYvadjYv*YdadjYuYu - 2._dp*(YdadjYuYuadjYdYd) -              & 
&  2._dp*(YdadjYuYuadjYuYu)

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = (Abslam - 9._dp*(g1p2)/5._dp - 3._dp*(g2p2) - 2*gpp2*Qep2 - 2*gpp2*QHdp2 - & 
&  2*gpp2*Qlp2 + 3._dp*(TrYdadjYd) + TrYeadjYe)*Ye + 3._dp*(YeadjYeYe) + YeCYvTpYv

 
 
If (TwoLoopRGE) Then 
betaYe2 = ((135._dp*(g1p4) + 18*g1p2*g2p2 + 75._dp*(g2p4) - 30*Clamp2*lamp2 + 72*g1p2*gpp2*Qd*Qe +& 
&  120*g1p2*gpp2*Qep2 + 180*gpp4*Qdp2*Qep2 + 100*gpp4*Qep4 - 36*g1p2*gpp2*Qd*QHd -       & 
&  60*g1p2*gpp2*Qe*QHd + 24*g1p2*gpp2*QHdp2 + 60*g2p2*gpp2*QHdp2 + 180*gpp4*Qdp2*QHdp2 + & 
&  100*gpp4*Qep2*QHdp2 + 80*gpp4*QHdp4 + 24*g1p2*gpp2*Qe*QHu - 12*g1p2*gpp2*QHd*QHu +    & 
&  40*gpp4*Qep2*QHup2 + 40*gpp4*QHdp2*QHup2 - 36*g1p2*gpp2*Qd*Ql - 108*g1p2*gpp2*Qe*Ql + & 
&  48*g1p2*gpp2*QHd*Ql - 12*g1p2*gpp2*QHu*Ql + 48*g1p2*gpp2*Qlp2 + 60*g2p2*gpp2*Qlp2 +   & 
&  180*gpp4*Qdp2*Qlp2 + 180*gpp4*Qep2*Qlp2 + 160*gpp4*QHdp2*Qlp2 + 40*gpp4*QHup2*Qlp2 +  & 
&  160*gpp4*Qlp4 + 72*g1p2*gpp2*Qe*Qq - 36*g1p2*gpp2*QHd*Qq - 36*g1p2*gpp2*Ql*Qq +       & 
&  360*gpp4*Qep2*Qqp2 + 360*gpp4*QHdp2*Qqp2 + 360*gpp4*Qlp2*Qqp2 + 20*gpp4*Qep2*Qs1p2 +  & 
&  20*gpp4*QHdp2*Qs1p2 + 20*gpp4*Qlp2*Qs1p2 + 20*gpp4*Qep2*Qs2p2 + 20*gpp4*QHdp2*Qs2p2 + & 
&  20*gpp4*Qlp2*Qs2p2 + 20*gpp4*Qep2*Qs3p2 + 20*gpp4*QHdp2*Qs3p2 + 20*gpp4*Qlp2*Qs3p2 +  & 
&  20*gpp4*Qep2*Qsp2 + 20*gpp4*QHdp2*Qsp2 + 20*gpp4*Qlp2*Qsp2 - 144*g1p2*gpp2*Qe*Qu +    & 
&  72*g1p2*gpp2*QHd*Qu + 72*g1p2*gpp2*Ql*Qu + 180*gpp4*Qep2*Qup2 + 180*gpp4*QHdp2*Qup2 + & 
&  180*gpp4*Qlp2*Qup2 + 60*gpp4*Qep2*Qvp2 + 60*gpp4*QHdp2*Qvp2 + 60*gpp4*Qlp2*Qvp2 -     & 
&  4*(g1p2 - 5*(8._dp*(g3p2) + 3*gpp2*(Qdp2 - QHdp2 + Qqp2)))*TrYdadjYd - 90._dp*(TrYdadjYdYdadjYd) -& 
&  30._dp*(TrYdadjYuYuadjYd) + 12*g1p2*TrYeadjYe + 20*gpp2*Qep2*TrYeadjYe -              & 
&  20*gpp2*QHdp2*TrYeadjYe + 20*gpp2*Qlp2*TrYeadjYe - 30._dp*(TrYeadjYeYeadjYe) -        & 
&  10*Abslam*(2*gpp2*(QHdp2 - QHup2 - Qsp2) + 3._dp*(TrYuadjYu) + TrYvadjYv) -           & 
&  10._dp*(TrYvadjYvTpYeCYe))*Ye)/10._dp + (-3._dp*(Abslam) + 6._dp*(g2p2) -             & 
&  2*gpp2*Qep2 + 6*gpp2*QHdp2 + 2*gpp2*Qlp2 - 9._dp*(TrYdadjYd) - 3._dp*(TrYeadjYe))*YeadjYeYe -& 
&  4._dp*(YeadjYeYeadjYeYe) - Abslam*YeCYvTpYv + 2*gpp2*QHup2*YeCYvTpYv - 2*gpp2*Qlp2*YeCYvTpYv  
betaYe2 =  betaYe2+ 2*gpp2*Qvp2*YeCYvTpYv - 3*TrYuadjYu*YeCYvTpYv - TrYvadjYv*YeCYvTpYv - 2._dp*(YeCYvTpYvadjYeYe) -& 
&  2._dp*(YeCYvTpYvCYvTpYv)

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! lam 
!-------------------- 
 
betalam1  = (-3*g1p2*lam)/5._dp - 3*g2p2*lam - 2*gpp2*QHdp2*lam - 2*gpp2*QHup2*lam -  & 
&  2*gpp2*Qsp2*lam + 3*TrYdadjYd*lam + TrYeadjYe*lam + 3*TrYuadjYu*lam + TrYvadjYv*lam + & 
&  4*lamp2*Conjg(lam)

 
 
If (TwoLoopRGE) Then 
betalam2 = -10*Clamp2*lamp3 + (207*g1p4*lam)/50._dp + (9*g1p2*g2p2*lam)/5._dp + (15*g2p4*lam)/2._dp -& 
&  (18*g1p2*gpp2*Qd*QHd*lam)/5._dp - (18*g1p2*gpp2*Qe*QHd*lam)/5._dp + (12*g1p2*gpp2*QHdp2*lam)/5._dp +& 
&  6*g2p2*gpp2*QHdp2*lam + 18*gpp4*Qdp2*QHdp2*lam + 6*gpp4*Qep2*QHdp2*lam +              & 
&  8*gpp4*QHdp4*lam + (18*g1p2*gpp2*Qd*QHu*lam)/5._dp + (18*g1p2*gpp2*Qe*QHu*lam)/5._dp -& 
&  (12*g1p2*gpp2*QHd*QHu*lam)/5._dp + (12*g1p2*gpp2*QHup2*lam)/5._dp + 6*g2p2*gpp2*QHup2*lam +& 
&  18*gpp4*Qdp2*QHup2*lam + 6*gpp4*Qep2*QHup2*lam + 8*gpp4*QHdp2*QHup2*lam +             & 
&  8*gpp4*QHup4*lam + (18*g1p2*gpp2*QHd*Ql*lam)/5._dp - (18*g1p2*gpp2*QHu*Ql*lam)/5._dp +& 
&  12*gpp4*QHdp2*Qlp2*lam + 12*gpp4*QHup2*Qlp2*lam - (18*g1p2*gpp2*QHd*Qq*lam)/5._dp +   & 
&  (18*g1p2*gpp2*QHu*Qq*lam)/5._dp + 36*gpp4*QHdp2*Qqp2*lam + 36*gpp4*QHup2*Qqp2*lam +   & 
&  2*gpp4*QHdp2*Qs1p2*lam + 2*gpp4*QHup2*Qs1p2*lam + 2*gpp4*QHdp2*Qs2p2*lam +            & 
&  2*gpp4*QHup2*Qs2p2*lam + 2*gpp4*QHdp2*Qs3p2*lam + 2*gpp4*QHup2*Qs3p2*lam +            & 
&  18*gpp4*Qdp2*Qsp2*lam + 6*gpp4*Qep2*Qsp2*lam + 6*gpp4*QHdp2*Qsp2*lam + 6*gpp4*QHup2*Qsp2*lam +& 
&  12*gpp4*Qlp2*Qsp2*lam + 36*gpp4*Qqp2*Qsp2*lam + 2*gpp4*Qs1p2*Qsp2*lam +               & 
&  2*gpp4*Qs2p2*Qsp2*lam + 2*gpp4*Qs3p2*Qsp2*lam + 6*gpp4*Qsp4*lam + (36*g1p2*gpp2*QHd*Qu*lam)/5._dp -& 
&  (36*g1p2*gpp2*QHu*Qu*lam)/5._dp + 18*gpp4*QHdp2*Qup2*lam + 18*gpp4*QHup2*Qup2*lam +   & 
&  18*gpp4*Qsp2*Qup2*lam + 6*gpp4*QHdp2*Qvp2*lam + 6*gpp4*QHup2*Qvp2*lam +               & 
&  6*gpp4*Qsp2*Qvp2*lam - (2*(g1p2 - 5*(8._dp*(g3p2) + 3*gpp2*(Qdp2 - QHdp2 +            & 
&  Qqp2)))*TrYdadjYd*lam)/5._dp - 9*TrYdadjYdYdadjYd*lam - 6*TrYdadjYuYuadjYd*lam +      & 
&  (6*g1p2*TrYeadjYe*lam)/5._dp + 2*gpp2*Qep2*TrYeadjYe*lam - 2*gpp2*QHdp2*TrYeadjYe*lam +& 
&  2*gpp2*Qlp2*TrYeadjYe*lam - 3*TrYeadjYeYeadjYe*lam + (4*g1p2*TrYuadjYu*lam)/5._dp +   & 
&  16*g3p2*TrYuadjYu*lam - 6*gpp2*QHup2*TrYuadjYu*lam + 6*gpp2*Qqp2*TrYuadjYu*lam  
betalam2 =  betalam2+ 6*gpp2*Qup2*TrYuadjYu*lam - 9*TrYuadjYuYuadjYu*lam - 2*gpp2*QHup2*TrYvadjYv*lam +     & 
&  2*gpp2*Qlp2*TrYvadjYv*lam + 2*gpp2*Qvp2*TrYvadjYv*lam - 2*TrYvadjYvTpYeCYe*lam -      & 
&  3*TrYvadjYvYvadjYv*lam + (lamp2*(6._dp*(g1p2) + 30._dp*(g2p2) + 20*gpp2*QHdp2 +       & 
&  20*gpp2*QHup2 - 45._dp*(TrYdadjYd) - 15._dp*(TrYeadjYe) - 45._dp*(TrYuadjYu) -        & 
&  15._dp*(TrYvadjYv))*Conjg(lam))/5._dp

 
Dlam = oo16pi2*( betalam1 + oo16pi2 * betalam2 ) 

 
Else 
Dlam = oo16pi2* betalam1 
End If 
 
 
Call Chop(Dlam) 

!-------------------- 
! Yv 
!-------------------- 
 
betaYv1  = TpYeCYeYv + (Abslam - 3._dp*(g1p2)/5._dp - 3._dp*(g2p2) - 2*gpp2*QHup2 -   & 
&  2*gpp2*Qlp2 - 2*gpp2*Qvp2 + 3._dp*(TrYuadjYu) + TrYvadjYv)*Yv + 3._dp*(YvadjYvYv)

 
 
If (TwoLoopRGE) Then 
betaYv2 = -2._dp*(TpYeCYeTpYeCYeYv) - Abslam*TpYeCYeYv + (6*g1p2*TpYeCYeYv)/5._dp +             & 
&  2*gpp2*Qep2*TpYeCYeYv + 2*gpp2*QHdp2*TpYeCYeYv - 2*gpp2*Qlp2*TpYeCYeYv -              & 
&  3*TpYeCYeYv*TrYdadjYd - TpYeCYeYv*TrYeadjYe + (207._dp*(g1p4)/50._dp + (9*g1p2*g2p2)/5._dp +& 
&  15._dp*(g2p4)/2._dp - 3*Clamp2*lamp2 + (18*g1p2*gpp2*Qd*QHu)/5._dp + (18*g1p2*gpp2*Qe*QHu)/5._dp -& 
&  (6*g1p2*gpp2*QHd*QHu)/5._dp + (12*g1p2*gpp2*QHup2)/5._dp + 6*g2p2*gpp2*QHup2 +        & 
&  18*gpp4*Qdp2*QHup2 + 6*gpp4*Qep2*QHup2 + 4*gpp4*QHdp2*QHup2 + 8*gpp4*QHup4 -          & 
&  (18*g1p2*gpp2*Qd*Ql)/5._dp - (18*g1p2*gpp2*Qe*Ql)/5._dp + (6*g1p2*gpp2*QHd*Ql)/5._dp -& 
&  (24*g1p2*gpp2*QHu*Ql)/5._dp + (24*g1p2*gpp2*Qlp2)/5._dp + 6*g2p2*gpp2*Qlp2 +          & 
&  18*gpp4*Qdp2*Qlp2 + 6*gpp4*Qep2*Qlp2 + 4*gpp4*QHdp2*Qlp2 + 16*gpp4*QHup2*Qlp2 +       & 
&  16*gpp4*Qlp4 + (18*g1p2*gpp2*QHu*Qq)/5._dp - (18*g1p2*gpp2*Ql*Qq)/5._dp +             & 
&  36*gpp4*QHup2*Qqp2 + 36*gpp4*Qlp2*Qqp2 + 2*gpp4*QHup2*Qs1p2 + 2*gpp4*Qlp2*Qs1p2 +     & 
&  2*gpp4*QHup2*Qs2p2 + 2*gpp4*Qlp2*Qs2p2 + 2*gpp4*QHup2*Qs3p2 + 2*gpp4*Qlp2*Qs3p2 +     & 
&  2*gpp4*QHup2*Qsp2 + 2*gpp4*Qlp2*Qsp2 - (36*g1p2*gpp2*QHu*Qu)/5._dp + (36*g1p2*gpp2*Ql*Qu)/5._dp +& 
&  18*gpp4*QHup2*Qup2 + 18*gpp4*Qlp2*Qup2 + 18*gpp4*Qdp2*Qvp2 + 6*gpp4*Qep2*Qvp2 +       & 
&  4*gpp4*QHdp2*Qvp2 + 10*gpp4*QHup2*Qvp2 + 18*gpp4*Qlp2*Qvp2 + 36*gpp4*Qqp2*Qvp2 +      & 
&  2*gpp4*Qs1p2*Qvp2 + 2*gpp4*Qs2p2*Qvp2 + 2*gpp4*Qs3p2*Qvp2 + 2*gpp4*Qsp2*Qvp2 +        & 
&  18*gpp4*Qup2*Qvp2 + 10*gpp4*Qvp4 - 3._dp*(TrYdadjYuYuadjYd) + Abslam*(2*gpp2*(QHdp2 - & 
&  QHup2 + Qsp2) - 3._dp*(TrYdadjYd) - TrYeadjYe) + (2*(2._dp*(g1p2) + 40._dp*(g3p2) +   & 
&  15*gpp2*(-1._dp*(QHup2) + Qqp2 + Qup2))*TrYuadjYu)/5._dp - 9._dp*(TrYuadjYuYuadjYu) - & 
&  2*gpp2*QHup2*TrYvadjYv + 2*gpp2*Qlp2*TrYvadjYv + 2*gpp2*Qvp2*TrYvadjYv -              & 
&  TrYvadjYvTpYeCYe - 3._dp*(TrYvadjYvYvadjYv))*Yv - 2._dp*(YvadjYvTpYeCYeYv)  
betaYv2 =  betaYv2+ (-3._dp*(Abslam) + 6._dp*(g1p2)/5._dp + 6._dp*(g2p2) + 6*gpp2*QHup2 + 2*gpp2*Qlp2 -   & 
&  2*gpp2*Qvp2 - 9._dp*(TrYuadjYu) - 3._dp*(TrYvadjYv))*YvadjYvYv - 4._dp*(YvadjYvYvadjYvYv)

 
DYv = oo16pi2*( betaYv1 + oo16pi2 * betaYv2 ) 

 
Else 
DYv = oo16pi2* betaYv1 
End If 
 
 
Call Chop(DYv) 

!-------------------- 
! kap 
!-------------------- 
 
betakap1  = ((Abskap - 6*gpp2*(Qs1p2 + Qs2p2 + Qs3p2))*kap)/3._dp

 
 
If (TwoLoopRGE) Then 
betakap2 = (2*(-(Ckapp2*kapp2) + 3*Abskap*gpp2*(Qs1p2 + Qs2p2 + Qs3p2) + 27*gpp4*(2*QHdp2*Qs1p2 +& 
&  2*QHup2*Qs1p2 + 6*Qlp2*Qs1p2 + 18*Qqp2*Qs1p2 + 3._dp*(Qs1p4) + 2*QHdp2*Qs2p2 +        & 
&  2*QHup2*Qs2p2 + 6*Qlp2*Qs2p2 + 18*Qqp2*Qs2p2 + 2*Qs1p2*Qs2p2 + 3._dp*(Qs2p4) +        & 
&  2*QHdp2*Qs3p2 + 2*QHup2*Qs3p2 + 6*Qlp2*Qs3p2 + 18*Qqp2*Qs3p2 + 2*Qs1p2*Qs3p2 +        & 
&  2*Qs2p2*Qs3p2 + 9*Qdp2*(Qs1p2 + Qs2p2 + Qs3p2) + 3*Qep2*(Qs1p2 + Qs2p2 +              & 
&  Qs3p2) + 3._dp*(Qs3p4) + Qs1p2*Qsp2 + Qs2p2*Qsp2 + Qs3p2*Qsp2 + 9*Qs1p2*Qup2 +        & 
&  9*Qs2p2*Qup2 + 9*Qs3p2*Qup2 + 3*Qs1p2*Qvp2 + 3*Qs2p2*Qvp2 + 3*Qs3p2*Qvp2))*kap)/27._dp

 
Dkap = oo16pi2*( betakap1 + oo16pi2 * betakap2 ) 

 
Else 
Dkap = oo16pi2* betakap1 
End If 
 
 
Call Chop(Dkap) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = (Abslam - 13._dp*(g1p2)/15._dp - 3._dp*(g2p2) - 16._dp*(g3p2)              & 
& /3._dp - 2*gpp2*QHup2 - 2*gpp2*Qqp2 - 2*gpp2*Qup2 + 3._dp*(TrYuadjYu) + TrYvadjYv)     & 
& *Yu + YuadjYdYd + 3._dp*(YuadjYuYu)

 
 
If (TwoLoopRGE) Then 
betaYu2 = (2743._dp*(g1p4)/450._dp + g1p2*g2p2 + 15._dp*(g2p4)/2._dp + (136*g1p2*g3p2)/45._dp + & 
&  8*g2p2*g3p2 - 16._dp*(g3p4)/9._dp - 3*Clamp2*lamp2 + (18*g1p2*gpp2*Qd*QHu)/5._dp +    & 
&  (18*g1p2*gpp2*Qe*QHu)/5._dp - (6*g1p2*gpp2*QHd*QHu)/5._dp + (12*g1p2*gpp2*QHup2)/5._dp +& 
&  6*g2p2*gpp2*QHup2 + 18*gpp4*Qdp2*QHup2 + 6*gpp4*Qep2*QHup2 + 4*gpp4*QHdp2*QHup2 +     & 
&  8*gpp4*QHup4 - (18*g1p2*gpp2*QHu*Ql)/5._dp + 12*gpp4*QHup2*Qlp2 + (6*g1p2*gpp2*Qd*Qq)/5._dp +& 
&  (6*g1p2*gpp2*Qe*Qq)/5._dp - (2*g1p2*gpp2*QHd*Qq)/5._dp + 4*g1p2*gpp2*QHu*Qq -         & 
&  (6*g1p2*gpp2*Ql*Qq)/5._dp + (4*g1p2*gpp2*Qqp2)/3._dp + 6*g2p2*gpp2*Qqp2 +             & 
&  (32*g3p2*gpp2*Qqp2)/3._dp + 18*gpp4*Qdp2*Qqp2 + 6*gpp4*Qep2*Qqp2 + 4*gpp4*QHdp2*Qqp2 +& 
&  40*gpp4*QHup2*Qqp2 + 12*gpp4*Qlp2*Qqp2 + 40*gpp4*Qqp4 + 2*gpp4*QHup2*Qs1p2 +          & 
&  2*gpp4*Qqp2*Qs1p2 + 2*gpp4*QHup2*Qs2p2 + 2*gpp4*Qqp2*Qs2p2 + 2*gpp4*QHup2*Qs3p2 +     & 
&  2*gpp4*Qqp2*Qs3p2 + 2*gpp4*QHup2*Qsp2 + 2*gpp4*Qqp2*Qsp2 - (24*g1p2*gpp2*Qd*Qu)/5._dp -& 
&  (24*g1p2*gpp2*Qe*Qu)/5._dp + (8*g1p2*gpp2*QHd*Qu)/5._dp - (44*g1p2*gpp2*QHu*Qu)/5._dp +& 
&  (24*g1p2*gpp2*Ql*Qu)/5._dp - (36*g1p2*gpp2*Qq*Qu)/5._dp + (176*g1p2*gpp2*Qup2)/15._dp +& 
&  (32*g3p2*gpp2*Qup2)/3._dp + 18*gpp4*Qdp2*Qup2 + 6*gpp4*Qep2*Qup2 + 4*gpp4*QHdp2*Qup2 +& 
&  22*gpp4*QHup2*Qup2 + 12*gpp4*Qlp2*Qup2 + 54*gpp4*Qqp2*Qup2 + 2*gpp4*Qs1p2*Qup2 +      & 
&  2*gpp4*Qs2p2*Qup2 + 2*gpp4*Qs3p2*Qup2 + 2*gpp4*Qsp2*Qup2 + 22*gpp4*Qup4 +             & 
&  6*gpp4*QHup2*Qvp2 + 6*gpp4*Qqp2*Qvp2 + 6*gpp4*Qup2*Qvp2 - 3._dp*(TrYdadjYuYuadjYd) +  & 
&  Abslam*(2*gpp2*(QHdp2 - QHup2 + Qsp2) - 3._dp*(TrYdadjYd) - TrYeadjYe) +              & 
&  (2*(2._dp*(g1p2) + 40._dp*(g3p2) + 15*gpp2*(-1._dp*(QHup2) + Qqp2 + Qup2))*TrYuadjYu)/5._dp -& 
&  9._dp*(TrYuadjYuYuadjYu) - 2*gpp2*QHup2*TrYvadjYv + 2*gpp2*Qlp2*TrYvadjYv +           & 
&  2*gpp2*Qvp2*TrYvadjYv - TrYvadjYvTpYeCYe - 3._dp*(TrYvadjYvYvadjYv))*Yu  
betaYu2 =  betaYu2+ (-1._dp*(Abslam) + 2._dp*(g1p2)/5._dp + 2*gpp2*Qdp2 + 2*gpp2*QHdp2 - 2*gpp2*Qqp2 -    & 
&  3._dp*(TrYdadjYd) - TrYeadjYe)*YuadjYdYd - 2._dp*(YuadjYdYdadjYdYd) - 2._dp*(YuadjYdYdadjYuYu) -& 
&  3*Abslam*YuadjYuYu + (2*g1p2*YuadjYuYu)/5._dp + 6*g2p2*YuadjYuYu + 6*gpp2*QHup2*YuadjYuYu +& 
&  2*gpp2*Qqp2*YuadjYuYu - 2*gpp2*Qup2*YuadjYuYu - 9*TrYuadjYu*YuadjYuYu -               & 
&  3*TrYvadjYv*YuadjYuYu - 4._dp*(YuadjYuYuadjYuYu)

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! Td 
!-------------------- 
 
betaTd1  = 5._dp*(TdadjYdYd) + TdadjYuYu + 4._dp*(YdadjYdTd) + 2._dp*(YdadjYuTu)      & 
&  + Abslam*Td - (7*g1p2*Td)/15._dp - 3*g2p2*Td - (16*g3p2*Td)/3._dp - 2*gpp2*Qdp2*Td -  & 
&  2*gpp2*QHdp2*Td - 2*gpp2*Qqp2*Td + 3*TrYdadjYd*Td + TrYeadjYe*Td + Yd*((14*g1p2*M1)   & 
& /15._dp + (32*g3p2*M3)/3._dp + 6*g2p2*M2 + 4*gpp2*M4*Qdp2 + 4*gpp2*M4*QHdp2 +          & 
&  4*gpp2*M4*Qqp2 + 6._dp*(TradjYdTd) + 2._dp*(TradjYeTe) + 2*Conjg(lam)*Tlam)

 
 
If (TwoLoopRGE) Then 
betaTd2 = -5*Abslam*TdadjYdYd + (6*g1p2*TdadjYdYd)/5._dp + 12*g2p2*TdadjYdYd - 6*gpp2*Qdp2*TdadjYdYd +& 
&  10*gpp2*QHdp2*TdadjYdYd + 6*gpp2*Qqp2*TdadjYdYd - 6._dp*(TdadjYdYdadjYdYd) -          & 
&  Abslam*TdadjYuYu + (4*g1p2*TdadjYuYu)/5._dp + 2*gpp2*QHup2*TdadjYuYu - 2*gpp2*Qqp2*TdadjYuYu +& 
&  2*gpp2*Qup2*TdadjYuYu - 4._dp*(TdadjYuYuadjYdYd) - 2._dp*(TdadjYuYuadjYuYu) -         & 
&  15*TdadjYdYd*TrYdadjYd - 5*TdadjYdYd*TrYeadjYe - 3*TdadjYuYu*TrYuadjYu -              & 
&  TdadjYuYu*TrYvadjYv - 4*Abslam*YdadjYdTd + (6*g1p2*YdadjYdTd)/5._dp + 6*g2p2*YdadjYdTd +& 
&  8*gpp2*QHdp2*YdadjYdTd - 12*TrYdadjYd*YdadjYdTd - 4*TrYeadjYe*YdadjYdTd -             & 
&  8._dp*(YdadjYdTdadjYdYd) - 6._dp*(YdadjYdYdadjYdTd) - 2*Abslam*YdadjYuTu +            & 
&  (8*g1p2*YdadjYuTu)/5._dp + 4*gpp2*QHup2*YdadjYuTu - 4*gpp2*Qqp2*YdadjYuTu +           & 
&  4*gpp2*Qup2*YdadjYuTu - 6*TrYuadjYu*YdadjYuTu - 2*TrYvadjYv*YdadjYuTu -               & 
&  4._dp*(YdadjYuTuadjYdYd) - 4._dp*(YdadjYuTuadjYuYu) - (8*g1p2*M1*YdadjYuYu)/5._dp -   & 
&  4*gpp2*M4*QHup2*YdadjYuYu + 4*gpp2*M4*Qqp2*YdadjYuYu - 4*gpp2*M4*Qup2*YdadjYuYu -     & 
&  6*TradjYuTu*YdadjYuYu - 2*TradjYvTv*YdadjYuYu - 2._dp*(YdadjYuYuadjYdTd) -            & 
&  4._dp*(YdadjYuYuadjYuTu) + (287*g1p4*Td)/90._dp + g1p2*g2p2*Td + (15*g2p4*Td)/2._dp + & 
&  (8*g1p2*g3p2*Td)/9._dp + 8*g2p2*g3p2*Td - (16*g3p4*Td)/9._dp - 3*Clamp2*lamp2*Td +    & 
&  (44*g1p2*gpp2*Qdp2*Td)/15._dp + (32*g3p2*gpp2*Qdp2*Td)/3._dp + 22*gpp4*Qdp4*Td +      & 
&  (12*g1p2*gpp2*Qd*Qe*Td)/5._dp + 6*gpp4*Qdp2*Qep2*Td - (22*g1p2*gpp2*Qd*QHd*Td)/5._dp -& 
&  (18*g1p2*gpp2*Qe*QHd*Td)/5._dp - 2*Abslam*gpp2*QHdp2*Td + (12*g1p2*gpp2*QHdp2*Td)/5._dp +& 
&  6*g2p2*gpp2*QHdp2*Td + 22*gpp4*Qdp2*QHdp2*Td + 6*gpp4*Qep2*QHdp2*Td + 8*gpp4*QHdp4*Td +& 
&  (4*g1p2*gpp2*Qd*QHu*Td)/5._dp - (6*g1p2*gpp2*QHd*QHu*Td)/5._dp + 2*Abslam*gpp2*QHup2*Td +& 
&  4*gpp4*Qdp2*QHup2*Td + 4*gpp4*QHdp2*QHup2*Td - (12*g1p2*gpp2*Qd*Ql*Td)/5._dp  
betaTd2 =  betaTd2+ (18*g1p2*gpp2*QHd*Ql*Td)/5._dp + 12*gpp4*Qdp2*Qlp2*Td + 12*gpp4*QHdp2*Qlp2*Td +       & 
&  (18*g1p2*gpp2*Qd*Qq*Td)/5._dp + (6*g1p2*gpp2*Qe*Qq*Td)/5._dp - 4*g1p2*gpp2*QHd*Qq*Td +& 
&  (2*g1p2*gpp2*QHu*Qq*Td)/5._dp - (6*g1p2*gpp2*Ql*Qq*Td)/5._dp + (4*g1p2*gpp2*Qqp2*Td)/3._dp +& 
&  6*g2p2*gpp2*Qqp2*Td + (32*g3p2*gpp2*Qqp2*Td)/3._dp + 54*gpp4*Qdp2*Qqp2*Td +           & 
&  6*gpp4*Qep2*Qqp2*Td + 40*gpp4*QHdp2*Qqp2*Td + 4*gpp4*QHup2*Qqp2*Td + 12*gpp4*Qlp2*Qqp2*Td +& 
&  40*gpp4*Qqp4*Td + 2*gpp4*Qdp2*Qs1p2*Td + 2*gpp4*QHdp2*Qs1p2*Td + 2*gpp4*Qqp2*Qs1p2*Td +& 
&  2*gpp4*Qdp2*Qs2p2*Td + 2*gpp4*QHdp2*Qs2p2*Td + 2*gpp4*Qqp2*Qs2p2*Td + 2*gpp4*Qdp2*Qs3p2*Td +& 
&  2*gpp4*QHdp2*Qs3p2*Td + 2*gpp4*Qqp2*Qs3p2*Td + 2*Abslam*gpp2*Qsp2*Td + 2*gpp4*Qdp2*Qsp2*Td +& 
&  2*gpp4*QHdp2*Qsp2*Td + 2*gpp4*Qqp2*Qsp2*Td - (24*g1p2*gpp2*Qd*Qu*Td)/5._dp +          & 
&  (36*g1p2*gpp2*QHd*Qu*Td)/5._dp - (12*g1p2*gpp2*Qq*Qu*Td)/5._dp + 18*gpp4*Qdp2*Qup2*Td +& 
&  18*gpp4*QHdp2*Qup2*Td + 18*gpp4*Qqp2*Qup2*Td + 6*gpp4*Qdp2*Qvp2*Td + 6*gpp4*QHdp2*Qvp2*Td +& 
&  6*gpp4*Qqp2*Qvp2*Td - (2*g1p2*TrYdadjYd*Td)/5._dp + 16*g3p2*TrYdadjYd*Td +            & 
&  6*gpp2*Qdp2*TrYdadjYd*Td - 6*gpp2*QHdp2*TrYdadjYd*Td + 6*gpp2*Qqp2*TrYdadjYd*Td -     & 
&  9*TrYdadjYdYdadjYd*Td - 3*TrYdadjYuYuadjYd*Td + (6*g1p2*TrYeadjYe*Td)/5._dp +         & 
&  2*gpp2*Qep2*TrYeadjYe*Td - 2*gpp2*QHdp2*TrYeadjYe*Td + 2*gpp2*Qlp2*TrYeadjYe*Td -     & 
&  3*TrYeadjYeYeadjYe*Td - 3*Abslam*TrYuadjYu*Td - Abslam*TrYvadjYv*Td - TrYvadjYvTpYeCYe*Td -& 
&  2*YdadjYuYu*Conjg(lam)*Tlam - (2*YdadjYdYd*(4*g1p2*M1 + 30*g2p2*M2 - 10*gpp2*M4*Qdp2 +& 
&  30*gpp2*M4*QHdp2 + 10*gpp2*M4*Qqp2 + 45._dp*(TradjYdTd) + 15._dp*(TradjYeTe) +        & 
&  15*Conjg(lam)*Tlam))/5._dp - (2*Yd*(287*g1p4*M1 + 45*g1p2*g2p2*M1 + 40*g1p2*g3p2*M1 + & 
&  40*g1p2*g3p2*M3 + 360*g2p2*g3p2*M3 - 160*g3p4*M3 + 45*g1p2*g2p2*M2 + 675*g2p4*M2 +    & 
&  360*g2p2*g3p2*M2 + 132*g1p2*gpp2*M1*Qdp2 + 480*g3p2*gpp2*M3*Qdp2 + 132*g1p2*gpp2*M4*Qdp2 +& 
&  480*g3p2*gpp2*M4*Qdp2 + 1980*gpp4*M4*Qdp4 + 108*g1p2*gpp2*M1*Qd*Qe + 108*g1p2*gpp2*M4*Qd*Qe +& 
&  540*gpp4*M4*Qdp2*Qep2 - 198*g1p2*gpp2*M1*Qd*QHd - 198*g1p2*gpp2*M4*Qd*QHd -           & 
&  162*g1p2*gpp2*M1*Qe*QHd - 162*g1p2*gpp2*M4*Qe*QHd + 108*g1p2*gpp2*M1*QHdp2 +          & 
&  108*g1p2*gpp2*M4*QHdp2 + 270*g2p2*gpp2*M4*QHdp2 + 270*g2p2*gpp2*M2*QHdp2 +            & 
&  1980*gpp4*M4*Qdp2*QHdp2 + 540*gpp4*M4*Qep2*QHdp2 + 720*gpp4*M4*QHdp4 + 36*g1p2*gpp2*M1*Qd*QHu +& 
&  36*g1p2*gpp2*M4*Qd*QHu - 54*g1p2*gpp2*M1*QHd*QHu - 54*g1p2*gpp2*M4*QHd*QHu +          & 
&  360*gpp4*M4*Qdp2*QHup2 + 360*gpp4*M4*QHdp2*QHup2 - 108*g1p2*gpp2*M1*Qd*Ql -           & 
&  108*g1p2*gpp2*M4*Qd*Ql + 162*g1p2*gpp2*M1*QHd*Ql + 162*g1p2*gpp2*M4*QHd*Ql +          & 
&  1080*gpp4*M4*Qdp2*Qlp2 + 1080*gpp4*M4*QHdp2*Qlp2 + 162*g1p2*gpp2*M1*Qd*Qq +           & 
&  162*g1p2*gpp2*M4*Qd*Qq + 54*g1p2*gpp2*M1*Qe*Qq + 54*g1p2*gpp2*M4*Qe*Qq -              & 
&  180*g1p2*gpp2*M1*QHd*Qq - 180*g1p2*gpp2*M4*QHd*Qq + 18*g1p2*gpp2*M1*QHu*Qq +          & 
&  18*g1p2*gpp2*M4*QHu*Qq - 54*g1p2*gpp2*M1*Ql*Qq - 54*g1p2*gpp2*M4*Ql*Qq +              & 
&  60*g1p2*gpp2*M1*Qqp2 + 480*g3p2*gpp2*M3*Qqp2 + 60*g1p2*gpp2*M4*Qqp2 + 270*g2p2*gpp2*M4*Qqp2 +& 
&  480*g3p2*gpp2*M4*Qqp2 + 270*g2p2*gpp2*M2*Qqp2 + 4860*gpp4*M4*Qdp2*Qqp2 +              & 
&  540*gpp4*M4*Qep2*Qqp2 + 3600*gpp4*M4*QHdp2*Qqp2 + 360*gpp4*M4*QHup2*Qqp2 +            & 
&  1080*gpp4*M4*Qlp2*Qqp2 + 3600*gpp4*M4*Qqp4 + 180*gpp4*M4*Qdp2*Qs1p2 + 180*gpp4*M4*QHdp2*Qs1p2 +& 
&  180*gpp4*M4*Qqp2*Qs1p2 + 180*gpp4*M4*Qdp2*Qs2p2 + 180*gpp4*M4*QHdp2*Qs2p2 +           & 
&  180*gpp4*M4*Qqp2*Qs2p2 + 180*gpp4*M4*Qdp2*Qs3p2 + 180*gpp4*M4*QHdp2*Qs3p2 +           & 
&  180*gpp4*M4*Qqp2*Qs3p2 + 180*gpp4*M4*Qdp2*Qsp2 + 180*gpp4*M4*QHdp2*Qsp2 +             & 
&  180*gpp4*M4*Qqp2*Qsp2 - 216*g1p2*gpp2*M1*Qd*Qu - 216*g1p2*gpp2*M4*Qd*Qu +             & 
&  324*g1p2*gpp2*M1*QHd*Qu + 324*g1p2*gpp2*M4*QHd*Qu - 108*g1p2*gpp2*M1*Qq*Qu -          & 
&  108*g1p2*gpp2*M4*Qq*Qu + 1620*gpp4*M4*Qdp2*Qup2 + 1620*gpp4*M4*QHdp2*Qup2 +           & 
&  1620*gpp4*M4*Qqp2*Qup2 + 540*gpp4*M4*Qdp2*Qvp2 + 540*gpp4*M4*QHdp2*Qvp2 +             & 
&  540*gpp4*M4*Qqp2*Qvp2 + 18*g1p2*TradjYdTd - 720*g3p2*TradjYdTd - 270*gpp2*Qdp2*TradjYdTd +& 
&  270*gpp2*QHdp2*TradjYdTd - 270*gpp2*Qqp2*TradjYdTd - 54*g1p2*TradjYeTe -              & 
&  90*gpp2*Qep2*TradjYeTe + 90*gpp2*QHdp2*TradjYeTe - 90*gpp2*Qlp2*TradjYeTe +           & 
&  45._dp*(TradjYeTeCYvTpYv) + 45._dp*(TradjYvTpYeCYeTv) - 18*(g1p2*M1 - 5*(8*g3p2*M3 +  & 
&  3*gpp2*M4*(Qdp2 - QHdp2 + Qqp2)))*TrYdadjYd + 810._dp*(TrYdadjYdTdadjYd) +            & 
&  135._dp*(TrYdadjYuTuadjYd) + 54*g1p2*M1*TrYeadjYe + 90*gpp2*M4*Qep2*TrYeadjYe -       & 
&  90*gpp2*M4*QHdp2*TrYeadjYe + 90*gpp2*M4*Qlp2*TrYeadjYe + 270._dp*(TrYeadjYeTeadjYe) + & 
&  135._dp*(TrYuadjYdTdadjYu) + 270*Clamp2*lam*Tlam - 45*Conjg(lam)*((2*gpp2*M4*(QHdp2 - & 
&  QHup2 - Qsp2) - 3._dp*(TradjYuTu) - TradjYvTv)*lam - (2*gpp2*(QHdp2 - QHup2 -         & 
&  Qsp2) + 3._dp*(TrYuadjYu) + TrYvadjYv)*Tlam)))/45._dp

 
DTd = oo16pi2*( betaTd1 + oo16pi2 * betaTd2 ) 

 
Else 
DTd = oo16pi2* betaTd1 
End If 
 
 
Call Chop(DTd) 

!-------------------- 
! Te 
!-------------------- 
 
betaTe1  = 5._dp*(TeadjYeYe) + TeCYvTpYv + 4._dp*(YeadjYeTe) + 2._dp*(YeCYvTpTv)      & 
&  + Abslam*Te - (9*g1p2*Te)/5._dp - 3*g2p2*Te - 2*gpp2*Qep2*Te - 2*gpp2*QHdp2*Te -      & 
&  2*gpp2*Qlp2*Te + 3*TrYdadjYd*Te + TrYeadjYe*Te + Ye*((18*g1p2*M1)/5._dp +             & 
&  6*g2p2*M2 + 4*gpp2*M4*Qep2 + 4*gpp2*M4*QHdp2 + 4*gpp2*M4*Qlp2 + 6._dp*(TradjYdTd)     & 
&  + 2._dp*(TradjYeTe) + 2*Conjg(lam)*Tlam)

 
 
If (TwoLoopRGE) Then 
betaTe2 = -5*Abslam*TeadjYeYe - (6*g1p2*TeadjYeYe)/5._dp + 12*g2p2*TeadjYeYe - 6*gpp2*Qep2*TeadjYeYe +& 
&  10*gpp2*QHdp2*TeadjYeYe + 6*gpp2*Qlp2*TeadjYeYe - 6._dp*(TeadjYeYeadjYeYe) -          & 
&  Abslam*TeCYvTpYv + 2*gpp2*QHup2*TeCYvTpYv - 2*gpp2*Qlp2*TeCYvTpYv + 2*gpp2*Qvp2*TeCYvTpYv -& 
&  4._dp*(TeCYvTpYvadjYeYe) - 2._dp*(TeCYvTpYvCYvTpYv) - 15*TeadjYeYe*TrYdadjYd -        & 
&  5*TeadjYeYe*TrYeadjYe - 3*TeCYvTpYv*TrYuadjYu - TeCYvTpYv*TrYvadjYv - 4*Abslam*YeadjYeTe +& 
&  (6*g1p2*YeadjYeTe)/5._dp + 6*g2p2*YeadjYeTe + 8*gpp2*QHdp2*YeadjYeTe - 12*TrYdadjYd*YeadjYeTe -& 
&  4*TrYeadjYe*YeadjYeTe - 8._dp*(YeadjYeTeadjYeYe) - 6._dp*(YeadjYeYeadjYeTe) -         & 
&  2*Abslam*YeCYvTpTv + 4*gpp2*QHup2*YeCYvTpTv - 4*gpp2*Qlp2*YeCYvTpTv + 4*gpp2*Qvp2*YeCYvTpTv -& 
&  6*TrYuadjYu*YeCYvTpTv - 2*TrYvadjYv*YeCYvTpTv - 4._dp*(YeCYvTpTvadjYeYe) -            & 
&  4._dp*(YeCYvTpTvCYvTpYv) - 4*gpp2*M4*QHup2*YeCYvTpYv + 4*gpp2*M4*Qlp2*YeCYvTpYv -     & 
&  4*gpp2*M4*Qvp2*YeCYvTpYv - 6*TradjYuTu*YeCYvTpYv - 2*TradjYvTv*YeCYvTpYv -            & 
&  2._dp*(YeCYvTpYvadjYeTe) - 4._dp*(YeCYvTpYvCYvTpTv) + (27*g1p4*Te)/2._dp +            & 
&  (9*g1p2*g2p2*Te)/5._dp + (15*g2p4*Te)/2._dp - 3*Clamp2*lamp2*Te + (36*g1p2*gpp2*Qd*Qe*Te)/5._dp +& 
&  12*g1p2*gpp2*Qep2*Te + 18*gpp4*Qdp2*Qep2*Te + 10*gpp4*Qep4*Te - (18*g1p2*gpp2*Qd*QHd*Te)/5._dp -& 
&  6*g1p2*gpp2*Qe*QHd*Te - 2*Abslam*gpp2*QHdp2*Te + (12*g1p2*gpp2*QHdp2*Te)/5._dp +      & 
&  6*g2p2*gpp2*QHdp2*Te + 18*gpp4*Qdp2*QHdp2*Te + 10*gpp4*Qep2*QHdp2*Te + 8*gpp4*QHdp4*Te +& 
&  (12*g1p2*gpp2*Qe*QHu*Te)/5._dp - (6*g1p2*gpp2*QHd*QHu*Te)/5._dp + 2*Abslam*gpp2*QHup2*Te +& 
&  4*gpp4*Qep2*QHup2*Te + 4*gpp4*QHdp2*QHup2*Te - (18*g1p2*gpp2*Qd*Ql*Te)/5._dp -        & 
&  (54*g1p2*gpp2*Qe*Ql*Te)/5._dp + (24*g1p2*gpp2*QHd*Ql*Te)/5._dp - (6*g1p2*gpp2*QHu*Ql*Te)/5._dp +& 
&  (24*g1p2*gpp2*Qlp2*Te)/5._dp + 6*g2p2*gpp2*Qlp2*Te + 18*gpp4*Qdp2*Qlp2*Te +           & 
&  18*gpp4*Qep2*Qlp2*Te + 16*gpp4*QHdp2*Qlp2*Te + 4*gpp4*QHup2*Qlp2*Te + 16*gpp4*Qlp4*Te  
betaTe2 =  betaTe2+ (36*g1p2*gpp2*Qe*Qq*Te)/5._dp - (18*g1p2*gpp2*QHd*Qq*Te)/5._dp - (18*g1p2*gpp2*Ql*Qq*Te)/5._dp +& 
&  36*gpp4*Qep2*Qqp2*Te + 36*gpp4*QHdp2*Qqp2*Te + 36*gpp4*Qlp2*Qqp2*Te + 2*gpp4*Qep2*Qs1p2*Te +& 
&  2*gpp4*QHdp2*Qs1p2*Te + 2*gpp4*Qlp2*Qs1p2*Te + 2*gpp4*Qep2*Qs2p2*Te + 2*gpp4*QHdp2*Qs2p2*Te +& 
&  2*gpp4*Qlp2*Qs2p2*Te + 2*gpp4*Qep2*Qs3p2*Te + 2*gpp4*QHdp2*Qs3p2*Te + 2*gpp4*Qlp2*Qs3p2*Te +& 
&  2*Abslam*gpp2*Qsp2*Te + 2*gpp4*Qep2*Qsp2*Te + 2*gpp4*QHdp2*Qsp2*Te + 2*gpp4*Qlp2*Qsp2*Te -& 
&  (72*g1p2*gpp2*Qe*Qu*Te)/5._dp + (36*g1p2*gpp2*QHd*Qu*Te)/5._dp + (36*g1p2*gpp2*Ql*Qu*Te)/5._dp +& 
&  18*gpp4*Qep2*Qup2*Te + 18*gpp4*QHdp2*Qup2*Te + 18*gpp4*Qlp2*Qup2*Te + 6*gpp4*Qep2*Qvp2*Te +& 
&  6*gpp4*QHdp2*Qvp2*Te + 6*gpp4*Qlp2*Qvp2*Te - (2*g1p2*TrYdadjYd*Te)/5._dp +            & 
&  16*g3p2*TrYdadjYd*Te + 6*gpp2*Qdp2*TrYdadjYd*Te - 6*gpp2*QHdp2*TrYdadjYd*Te +         & 
&  6*gpp2*Qqp2*TrYdadjYd*Te - 9*TrYdadjYdYdadjYd*Te - 3*TrYdadjYuYuadjYd*Te +            & 
&  (6*g1p2*TrYeadjYe*Te)/5._dp + 2*gpp2*Qep2*TrYeadjYe*Te - 2*gpp2*QHdp2*TrYeadjYe*Te +  & 
&  2*gpp2*Qlp2*TrYeadjYe*Te - 3*TrYeadjYeYeadjYe*Te - 3*Abslam*TrYuadjYu*Te -            & 
&  Abslam*TrYvadjYv*Te - TrYvadjYvTpYeCYe*Te - 2*YeCYvTpYv*Conjg(lam)*Tlam -             & 
&  2*YeadjYeYe*(6*g2p2*M2 - 2*gpp2*M4*Qep2 + 6*gpp2*M4*QHdp2 + 2*gpp2*M4*Qlp2 +          & 
&  9._dp*(TradjYdTd) + 3._dp*(TradjYeTe) + 3*Conjg(lam)*Tlam) - (2*Ye*(135*g1p4*M1 +     & 
&  9*g1p2*g2p2*M1 + 9*g1p2*g2p2*M2 + 75*g2p4*M2 + 36*g1p2*gpp2*M1*Qd*Qe + 36*g1p2*gpp2*M4*Qd*Qe +& 
&  60*g1p2*gpp2*M1*Qep2 + 60*g1p2*gpp2*M4*Qep2 + 180*gpp4*M4*Qdp2*Qep2 + 100*gpp4*M4*Qep4 -& 
&  18*g1p2*gpp2*M1*Qd*QHd - 18*g1p2*gpp2*M4*Qd*QHd - 30*g1p2*gpp2*M1*Qe*QHd -            & 
&  30*g1p2*gpp2*M4*Qe*QHd + 12*g1p2*gpp2*M1*QHdp2 + 12*g1p2*gpp2*M4*QHdp2 +              & 
&  30*g2p2*gpp2*M4*QHdp2 + 30*g2p2*gpp2*M2*QHdp2 + 180*gpp4*M4*Qdp2*QHdp2 +              & 
&  100*gpp4*M4*Qep2*QHdp2 + 80*gpp4*M4*QHdp4 + 12*g1p2*gpp2*M1*Qe*QHu + 12*g1p2*gpp2*M4*Qe*QHu -& 
&  6*g1p2*gpp2*M1*QHd*QHu - 6*g1p2*gpp2*M4*QHd*QHu + 40*gpp4*M4*Qep2*QHup2 +             & 
&  40*gpp4*M4*QHdp2*QHup2 - 18*g1p2*gpp2*M1*Qd*Ql - 18*g1p2*gpp2*M4*Qd*Ql -              & 
&  54*g1p2*gpp2*M1*Qe*Ql - 54*g1p2*gpp2*M4*Qe*Ql + 24*g1p2*gpp2*M1*QHd*Ql +              & 
&  24*g1p2*gpp2*M4*QHd*Ql - 6*g1p2*gpp2*M1*QHu*Ql - 6*g1p2*gpp2*M4*QHu*Ql +              & 
&  24*g1p2*gpp2*M1*Qlp2 + 24*g1p2*gpp2*M4*Qlp2 + 30*g2p2*gpp2*M4*Qlp2 + 30*g2p2*gpp2*M2*Qlp2 +& 
&  180*gpp4*M4*Qdp2*Qlp2 + 180*gpp4*M4*Qep2*Qlp2 + 160*gpp4*M4*QHdp2*Qlp2 +              & 
&  40*gpp4*M4*QHup2*Qlp2 + 160*gpp4*M4*Qlp4 + 36*g1p2*gpp2*M1*Qe*Qq + 36*g1p2*gpp2*M4*Qe*Qq -& 
&  18*g1p2*gpp2*M1*QHd*Qq - 18*g1p2*gpp2*M4*QHd*Qq - 18*g1p2*gpp2*M1*Ql*Qq -             & 
&  18*g1p2*gpp2*M4*Ql*Qq + 360*gpp4*M4*Qep2*Qqp2 + 360*gpp4*M4*QHdp2*Qqp2 +              & 
&  360*gpp4*M4*Qlp2*Qqp2 + 20*gpp4*M4*Qep2*Qs1p2 + 20*gpp4*M4*QHdp2*Qs1p2 +              & 
&  20*gpp4*M4*Qlp2*Qs1p2 + 20*gpp4*M4*Qep2*Qs2p2 + 20*gpp4*M4*QHdp2*Qs2p2 +              & 
&  20*gpp4*M4*Qlp2*Qs2p2 + 20*gpp4*M4*Qep2*Qs3p2 + 20*gpp4*M4*QHdp2*Qs3p2 +              & 
&  20*gpp4*M4*Qlp2*Qs3p2 + 20*gpp4*M4*Qep2*Qsp2 + 20*gpp4*M4*QHdp2*Qsp2 + 20*gpp4*M4*Qlp2*Qsp2 -& 
&  72*g1p2*gpp2*M1*Qe*Qu - 72*g1p2*gpp2*M4*Qe*Qu + 36*g1p2*gpp2*M1*QHd*Qu +              & 
&  36*g1p2*gpp2*M4*QHd*Qu + 36*g1p2*gpp2*M1*Ql*Qu + 36*g1p2*gpp2*M4*Ql*Qu +              & 
&  180*gpp4*M4*Qep2*Qup2 + 180*gpp4*M4*QHdp2*Qup2 + 180*gpp4*M4*Qlp2*Qup2 +              & 
&  60*gpp4*M4*Qep2*Qvp2 + 60*gpp4*M4*QHdp2*Qvp2 + 60*gpp4*M4*Qlp2*Qvp2 + 2*g1p2*TradjYdTd -& 
&  80*g3p2*TradjYdTd - 30*gpp2*Qdp2*TradjYdTd + 30*gpp2*QHdp2*TradjYdTd - 30*gpp2*Qqp2*TradjYdTd -& 
&  6*g1p2*TradjYeTe - 10*gpp2*Qep2*TradjYeTe + 10*gpp2*QHdp2*TradjYeTe - 10*gpp2*Qlp2*TradjYeTe +& 
&  5._dp*(TradjYeTeCYvTpYv) + 5._dp*(TradjYvTpYeCYeTv) + (-2*g1p2*M1 + 80*g3p2*M3 +      & 
&  30*gpp2*M4*(Qdp2 - QHdp2 + Qqp2))*TrYdadjYd + 90._dp*(TrYdadjYdTdadjYd) +             & 
&  15._dp*(TrYdadjYuTuadjYd) + 6*g1p2*M1*TrYeadjYe + 10*gpp2*M4*Qep2*TrYeadjYe -         & 
&  10*gpp2*M4*QHdp2*TrYeadjYe + 10*gpp2*M4*Qlp2*TrYeadjYe + 30._dp*(TrYeadjYeTeadjYe) +  & 
&  15._dp*(TrYuadjYdTdadjYu) + 30*Clamp2*lam*Tlam - 5*Conjg(lam)*((2*gpp2*M4*(QHdp2 -    & 
&  QHup2 - Qsp2) - 3._dp*(TradjYuTu) - TradjYvTv)*lam - (2*gpp2*(QHdp2 - QHup2 -         & 
&  Qsp2) + 3._dp*(TrYuadjYu) + TrYvadjYv)*Tlam)))/5._dp

 
DTe = oo16pi2*( betaTe1 + oo16pi2 * betaTe2 ) 

 
Else 
DTe = oo16pi2* betaTe1 
End If 
 
 
Call Chop(DTe) 

!-------------------- 
! Tlam 
!-------------------- 
 
betaTlam1  = (2*(3*g1p2*M1 + 15*g2p2*M2 + 10*gpp2*M4*QHdp2 + 10*gpp2*M4*QHup2 +       & 
&  10*gpp2*M4*Qsp2 + 15._dp*(TradjYdTd) + 5._dp*(TradjYeTe) + 15._dp*(TradjYuTu)         & 
&  + 5._dp*(TradjYvTv))*lam)/5._dp + (12._dp*(Abslam) - 3._dp*(g1p2)/5._dp -             & 
&  3._dp*(g2p2) - 2*gpp2*QHdp2 - 2*gpp2*QHup2 - 2*gpp2*Qsp2 + 3._dp*(TrYdadjYd)          & 
&  + TrYeadjYe + 3._dp*(TrYuadjYu) + TrYvadjYv)*Tlam

 
 
If (TwoLoopRGE) Then 
betaTlam2 = (-2*(207*g1p4*M1 + 45*g1p2*g2p2*M1 + 45*g1p2*g2p2*M2 + 375*g2p4*M2 - 90*g1p2*gpp2*M1*Qd*QHd -& 
&  90*g1p2*gpp2*M4*Qd*QHd - 90*g1p2*gpp2*M1*Qe*QHd - 90*g1p2*gpp2*M4*Qe*QHd +            & 
&  60*g1p2*gpp2*M1*QHdp2 + 60*g1p2*gpp2*M4*QHdp2 + 150*g2p2*gpp2*M4*QHdp2 +              & 
&  150*g2p2*gpp2*M2*QHdp2 + 900*gpp4*M4*Qdp2*QHdp2 + 300*gpp4*M4*Qep2*QHdp2 +            & 
&  400*gpp4*M4*QHdp4 + 90*g1p2*gpp2*M1*Qd*QHu + 90*g1p2*gpp2*M4*Qd*QHu + 90*g1p2*gpp2*M1*Qe*QHu +& 
&  90*g1p2*gpp2*M4*Qe*QHu - 60*g1p2*gpp2*M1*QHd*QHu - 60*g1p2*gpp2*M4*QHd*QHu +          & 
&  60*g1p2*gpp2*M1*QHup2 + 60*g1p2*gpp2*M4*QHup2 + 150*g2p2*gpp2*M4*QHup2 +              & 
&  150*g2p2*gpp2*M2*QHup2 + 900*gpp4*M4*Qdp2*QHup2 + 300*gpp4*M4*Qep2*QHup2 +            & 
&  400*gpp4*M4*QHdp2*QHup2 + 400*gpp4*M4*QHup4 + 90*g1p2*gpp2*M1*QHd*Ql + 90*g1p2*gpp2*M4*QHd*Ql -& 
&  90*g1p2*gpp2*M1*QHu*Ql - 90*g1p2*gpp2*M4*QHu*Ql + 600*gpp4*M4*QHdp2*Qlp2 +            & 
&  600*gpp4*M4*QHup2*Qlp2 - 90*g1p2*gpp2*M1*QHd*Qq - 90*g1p2*gpp2*M4*QHd*Qq +            & 
&  90*g1p2*gpp2*M1*QHu*Qq + 90*g1p2*gpp2*M4*QHu*Qq + 1800*gpp4*M4*QHdp2*Qqp2 +           & 
&  1800*gpp4*M4*QHup2*Qqp2 + 100*gpp4*M4*QHdp2*Qs1p2 + 100*gpp4*M4*QHup2*Qs1p2 +         & 
&  100*gpp4*M4*QHdp2*Qs2p2 + 100*gpp4*M4*QHup2*Qs2p2 + 100*gpp4*M4*QHdp2*Qs3p2 +         & 
&  100*gpp4*M4*QHup2*Qs3p2 + 900*gpp4*M4*Qdp2*Qsp2 + 300*gpp4*M4*Qep2*Qsp2 +             & 
&  300*gpp4*M4*QHdp2*Qsp2 + 300*gpp4*M4*QHup2*Qsp2 + 600*gpp4*M4*Qlp2*Qsp2 +             & 
&  1800*gpp4*M4*Qqp2*Qsp2 + 100*gpp4*M4*Qs1p2*Qsp2 + 100*gpp4*M4*Qs2p2*Qsp2 +            & 
&  100*gpp4*M4*Qs3p2*Qsp2 + 300*gpp4*M4*Qsp4 + 180*g1p2*gpp2*M1*QHd*Qu + 180*g1p2*gpp2*M4*QHd*Qu -& 
&  180*g1p2*gpp2*M1*QHu*Qu - 180*g1p2*gpp2*M4*QHu*Qu + 900*gpp4*M4*QHdp2*Qup2 +          & 
&  900*gpp4*M4*QHup2*Qup2 + 900*gpp4*M4*Qsp2*Qup2 + 300*gpp4*M4*QHdp2*Qvp2 +             & 
&  300*gpp4*M4*QHup2*Qvp2 + 300*gpp4*M4*Qsp2*Qvp2 + 10*g1p2*TradjYdTd - 400*g3p2*TradjYdTd -& 
&  150*gpp2*Qdp2*TradjYdTd + 150*gpp2*QHdp2*TradjYdTd - 150*gpp2*Qqp2*TradjYdTd -        & 
&  30*g1p2*TradjYeTe - 50*gpp2*Qep2*TradjYeTe + 50*gpp2*QHdp2*TradjYeTe - 50*gpp2*Qlp2*TradjYeTe +& 
&  50._dp*(TradjYeTeCYvTpYv) - 20*g1p2*TradjYuTu - 400*g3p2*TradjYuTu + 150*gpp2*QHup2*TradjYuTu -& 
&  150*gpp2*Qqp2*TradjYuTu - 150*gpp2*Qup2*TradjYuTu + 50._dp*(TradjYvTpYeCYeTv) +       & 
&  50*gpp2*QHup2*TradjYvTv - 50*gpp2*Qlp2*TradjYvTv - 50*gpp2*Qvp2*TradjYvTv -           & 
&  10*(g1p2*M1 - 5*(8*g3p2*M3 + 3*gpp2*M4*(Qdp2 - QHdp2 + Qqp2)))*TrYdadjYd +            & 
&  450._dp*(TrYdadjYdTdadjYd) + 150._dp*(TrYdadjYuTuadjYd) + 10*(3*g1p2*M1 +             & 
&  5*gpp2*M4*(Qep2 - QHdp2 + Qlp2))*TrYeadjYe + 150._dp*(TrYeadjYeTeadjYe) +             & 
&  150._dp*(TrYuadjYdTdadjYu) + 20*g1p2*M1*TrYuadjYu + 400*g3p2*M3*TrYuadjYu -           & 
&  150*gpp2*M4*QHup2*TrYuadjYu + 150*gpp2*M4*Qqp2*TrYuadjYu + 150*gpp2*M4*Qup2*TrYuadjYu +& 
&  450._dp*(TrYuadjYuTuadjYu) - 50*gpp2*M4*QHup2*TrYvadjYv + 50*gpp2*M4*Qlp2*TrYvadjYv + & 
&  50*gpp2*M4*Qvp2*TrYvadjYv + 150._dp*(TrYvadjYvTvadjYv))*lam)/25._dp - 50*Clamp2*lamp2*Tlam  
betaTlam2 =  betaTlam2+ (207._dp*(g1p4)/50._dp + (9*g1p2*g2p2)/5._dp + 15._dp*(g2p4)/2._dp - (18*g1p2*gpp2*Qd*QHd)/5._dp -& 
&  (18*g1p2*gpp2*Qe*QHd)/5._dp + (12*g1p2*gpp2*QHdp2)/5._dp + 6*g2p2*gpp2*QHdp2 +        & 
&  18*gpp4*Qdp2*QHdp2 + 6*gpp4*Qep2*QHdp2 + 8*gpp4*QHdp4 + (18*g1p2*gpp2*Qd*QHu)/5._dp + & 
&  (18*g1p2*gpp2*Qe*QHu)/5._dp - (12*g1p2*gpp2*QHd*QHu)/5._dp + (12*g1p2*gpp2*QHup2)/5._dp +& 
&  6*g2p2*gpp2*QHup2 + 18*gpp4*Qdp2*QHup2 + 6*gpp4*Qep2*QHup2 + 8*gpp4*QHdp2*QHup2 +     & 
&  8*gpp4*QHup4 + (18*g1p2*gpp2*QHd*Ql)/5._dp - (18*g1p2*gpp2*QHu*Ql)/5._dp +            & 
&  12*gpp4*QHdp2*Qlp2 + 12*gpp4*QHup2*Qlp2 - (18*g1p2*gpp2*QHd*Qq)/5._dp +               & 
&  (18*g1p2*gpp2*QHu*Qq)/5._dp + 36*gpp4*QHdp2*Qqp2 + 36*gpp4*QHup2*Qqp2 +               & 
&  2*gpp4*QHdp2*Qs1p2 + 2*gpp4*QHup2*Qs1p2 + 2*gpp4*QHdp2*Qs2p2 + 2*gpp4*QHup2*Qs2p2 +   & 
&  2*gpp4*QHdp2*Qs3p2 + 2*gpp4*QHup2*Qs3p2 + 18*gpp4*Qdp2*Qsp2 + 6*gpp4*Qep2*Qsp2 +      & 
&  6*gpp4*QHdp2*Qsp2 + 6*gpp4*QHup2*Qsp2 + 12*gpp4*Qlp2*Qsp2 + 36*gpp4*Qqp2*Qsp2 +       & 
&  2*gpp4*Qs1p2*Qsp2 + 2*gpp4*Qs2p2*Qsp2 + 2*gpp4*Qs3p2*Qsp2 + 6*gpp4*Qsp4 +             & 
&  (36*g1p2*gpp2*QHd*Qu)/5._dp - (36*g1p2*gpp2*QHu*Qu)/5._dp + 18*gpp4*QHdp2*Qup2 +      & 
&  18*gpp4*QHup2*Qup2 + 18*gpp4*Qsp2*Qup2 + 6*gpp4*QHdp2*Qvp2 + 6*gpp4*QHup2*Qvp2 +      & 
&  6*gpp4*Qsp2*Qvp2 - (2*(g1p2 - 5*(8._dp*(g3p2) + 3*gpp2*(Qdp2 - QHdp2 + Qqp2)))*TrYdadjYd)/5._dp -& 
&  9._dp*(TrYdadjYdYdadjYd) - 6._dp*(TrYdadjYuYuadjYd) + (2*(3._dp*(g1p2) +              & 
&  5*gpp2*(Qep2 - QHdp2 + Qlp2))*TrYeadjYe)/5._dp - 3._dp*(TrYeadjYeYeadjYe) +           & 
&  (4*g1p2*TrYuadjYu)/5._dp + 16*g3p2*TrYuadjYu - 6*gpp2*QHup2*TrYuadjYu +               & 
&  6*gpp2*Qqp2*TrYuadjYu + 6*gpp2*Qup2*TrYuadjYu - 9._dp*(TrYuadjYuYuadjYu) -            & 
&  2*gpp2*QHup2*TrYvadjYv + 2*gpp2*Qlp2*TrYvadjYv + 2*gpp2*Qvp2*TrYvadjYv -              & 
&  2._dp*(TrYvadjYvTpYeCYe) - 3._dp*(TrYvadjYvYvadjYv))*Tlam - (Abslam*(2*(6*g1p2*M1 +   & 
&  30*g2p2*M2 + 20*gpp2*M4*QHdp2 + 20*gpp2*M4*QHup2 + 45._dp*(TradjYdTd) +               & 
&  15._dp*(TradjYeTe) + 45._dp*(TradjYuTu) + 15._dp*(TradjYvTv))*lam - 3*(6._dp*(g1p2) + & 
&  30._dp*(g2p2) + 20*gpp2*QHdp2 + 20*gpp2*QHup2 - 45._dp*(TrYdadjYd) - 15._dp*(TrYeadjYe) -& 
&  45._dp*(TrYuadjYu) - 15._dp*(TrYvadjYv))*Tlam))/5._dp

 
DTlam = oo16pi2*( betaTlam1 + oo16pi2 * betaTlam2 ) 

 
Else 
DTlam = oo16pi2* betaTlam1 
End If 
 
 
Call Chop(DTlam) 

!-------------------- 
! Tv 
!-------------------- 
 
betaTv1  = 2._dp*(TpTeCYeYv) + TpYeCYeTv + 4._dp*(TvadjYvYv) + 5._dp*(YvadjYvTv)      & 
&  + Abslam*Tv - (3*g1p2*Tv)/5._dp - 3*g2p2*Tv - 2*gpp2*QHup2*Tv - 2*gpp2*Qlp2*Tv -      & 
&  2*gpp2*Qvp2*Tv + 3*TrYuadjYu*Tv + TrYvadjYv*Tv + Yv*((6*g1p2*M1)/5._dp +              & 
&  6*g2p2*M2 + 4*gpp2*M4*QHup2 + 4*gpp2*M4*Qlp2 + 4*gpp2*M4*Qvp2 + 6._dp*(TradjYuTu)     & 
&  + 2._dp*(TradjYvTv) + 2*Conjg(lam)*Tlam)

 
 
If (TwoLoopRGE) Then 
betaTv2 = -4._dp*(TpTeCYeTpYeCYeYv) - 2*Abslam*TpTeCYeYv + (12*g1p2*TpTeCYeYv)/5._dp +          & 
&  4*gpp2*Qep2*TpTeCYeYv + 4*gpp2*QHdp2*TpTeCYeYv - 4*gpp2*Qlp2*TpTeCYeYv -              & 
&  4._dp*(TpYeCYeTpTeCYeYv) - 2._dp*(TpYeCYeTpYeCYeTv) - Abslam*TpYeCYeTv +              & 
&  (6*g1p2*TpYeCYeTv)/5._dp + 2*gpp2*Qep2*TpYeCYeTv + 2*gpp2*QHdp2*TpYeCYeTv -           & 
&  2*gpp2*Qlp2*TpYeCYeTv - (12*g1p2*M1*TpYeCYeYv)/5._dp - 4*gpp2*M4*Qep2*TpYeCYeYv -     & 
&  4*gpp2*M4*QHdp2*TpYeCYeYv + 4*gpp2*M4*Qlp2*TpYeCYeYv - 6*TpYeCYeYv*TradjYdTd -        & 
&  2*TpYeCYeYv*TradjYeTe - 6*TpTeCYeYv*TrYdadjYd - 3*TpYeCYeTv*TrYdadjYd -               & 
&  2*TpTeCYeYv*TrYeadjYe - TpYeCYeTv*TrYeadjYe - 2._dp*(TvadjYvTpYeCYeYv) -              & 
&  4*Abslam*TvadjYvYv + (6*g1p2*TvadjYvYv)/5._dp + 6*g2p2*TvadjYvYv + 8*gpp2*QHup2*TvadjYvYv -& 
&  12*TrYuadjYu*TvadjYvYv - 4*TrYvadjYv*TvadjYvYv - 6._dp*(TvadjYvYvadjYvYv) -           & 
&  4._dp*(YvadjYvTpTeCYeYv) - 4._dp*(YvadjYvTpYeCYeTv) - 5*Abslam*YvadjYvTv +            & 
&  (12*g1p2*YvadjYvTv)/5._dp + 12*g2p2*YvadjYvTv + 10*gpp2*QHup2*YvadjYvTv +             & 
&  6*gpp2*Qlp2*YvadjYvTv - 6*gpp2*Qvp2*YvadjYvTv - 15*TrYuadjYu*YvadjYvTv -              & 
&  5*TrYvadjYv*YvadjYvTv - 8._dp*(YvadjYvTvadjYvYv) - 6._dp*(YvadjYvYvadjYvTv) +         & 
&  (207*g1p4*Tv)/50._dp + (9*g1p2*g2p2*Tv)/5._dp + (15*g2p4*Tv)/2._dp - 3*Clamp2*lamp2*Tv +& 
&  2*Abslam*gpp2*QHdp2*Tv + (18*g1p2*gpp2*Qd*QHu*Tv)/5._dp + (18*g1p2*gpp2*Qe*QHu*Tv)/5._dp -& 
&  (6*g1p2*gpp2*QHd*QHu*Tv)/5._dp - 2*Abslam*gpp2*QHup2*Tv + (12*g1p2*gpp2*QHup2*Tv)/5._dp +& 
&  6*g2p2*gpp2*QHup2*Tv + 18*gpp4*Qdp2*QHup2*Tv + 6*gpp4*Qep2*QHup2*Tv + 4*gpp4*QHdp2*QHup2*Tv +& 
&  8*gpp4*QHup4*Tv - (18*g1p2*gpp2*Qd*Ql*Tv)/5._dp - (18*g1p2*gpp2*Qe*Ql*Tv)/5._dp +     & 
&  (6*g1p2*gpp2*QHd*Ql*Tv)/5._dp - (24*g1p2*gpp2*QHu*Ql*Tv)/5._dp + (24*g1p2*gpp2*Qlp2*Tv)/5._dp +& 
&  6*g2p2*gpp2*Qlp2*Tv + 18*gpp4*Qdp2*Qlp2*Tv + 6*gpp4*Qep2*Qlp2*Tv + 4*gpp4*QHdp2*Qlp2*Tv  
betaTv2 =  betaTv2+ 16*gpp4*QHup2*Qlp2*Tv + 16*gpp4*Qlp4*Tv + (18*g1p2*gpp2*QHu*Qq*Tv)/5._dp -            & 
&  (18*g1p2*gpp2*Ql*Qq*Tv)/5._dp + 36*gpp4*QHup2*Qqp2*Tv + 36*gpp4*Qlp2*Qqp2*Tv +        & 
&  2*gpp4*QHup2*Qs1p2*Tv + 2*gpp4*Qlp2*Qs1p2*Tv + 2*gpp4*QHup2*Qs2p2*Tv + 2*gpp4*Qlp2*Qs2p2*Tv +& 
&  2*gpp4*QHup2*Qs3p2*Tv + 2*gpp4*Qlp2*Qs3p2*Tv + 2*Abslam*gpp2*Qsp2*Tv + 2*gpp4*QHup2*Qsp2*Tv +& 
&  2*gpp4*Qlp2*Qsp2*Tv - (36*g1p2*gpp2*QHu*Qu*Tv)/5._dp + (36*g1p2*gpp2*Ql*Qu*Tv)/5._dp +& 
&  18*gpp4*QHup2*Qup2*Tv + 18*gpp4*Qlp2*Qup2*Tv + 18*gpp4*Qdp2*Qvp2*Tv + 6*gpp4*Qep2*Qvp2*Tv +& 
&  4*gpp4*QHdp2*Qvp2*Tv + 10*gpp4*QHup2*Qvp2*Tv + 18*gpp4*Qlp2*Qvp2*Tv + 36*gpp4*Qqp2*Qvp2*Tv +& 
&  2*gpp4*Qs1p2*Qvp2*Tv + 2*gpp4*Qs2p2*Qvp2*Tv + 2*gpp4*Qs3p2*Qvp2*Tv + 2*gpp4*Qsp2*Qvp2*Tv +& 
&  18*gpp4*Qup2*Qvp2*Tv + 10*gpp4*Qvp4*Tv - 3*Abslam*TrYdadjYd*Tv - 3*TrYdadjYuYuadjYd*Tv -& 
&  Abslam*TrYeadjYe*Tv + (4*g1p2*TrYuadjYu*Tv)/5._dp + 16*g3p2*TrYuadjYu*Tv -            & 
&  6*gpp2*QHup2*TrYuadjYu*Tv + 6*gpp2*Qqp2*TrYuadjYu*Tv + 6*gpp2*Qup2*TrYuadjYu*Tv -     & 
&  9*TrYuadjYuYuadjYu*Tv - 2*gpp2*QHup2*TrYvadjYv*Tv + 2*gpp2*Qlp2*TrYvadjYv*Tv +        & 
&  2*gpp2*Qvp2*TrYvadjYv*Tv - TrYvadjYvTpYeCYe*Tv - 3*TrYvadjYvYvadjYv*Tv -              & 
&  2*TpYeCYeYv*Conjg(lam)*Tlam - (2*YvadjYvYv*(6*g1p2*M1 + 30*g2p2*M2 + 30*gpp2*M4*QHup2 +& 
&  10*gpp2*M4*Qlp2 - 10*gpp2*M4*Qvp2 + 45._dp*(TradjYuTu) + 15._dp*(TradjYvTv) +         & 
&  15*Conjg(lam)*Tlam))/5._dp - (2*Yv*(207*g1p4*M1 + 45*g1p2*g2p2*M1 + 45*g1p2*g2p2*M2 + & 
&  375*g2p4*M2 + 90*g1p2*gpp2*M1*Qd*QHu + 90*g1p2*gpp2*M4*Qd*QHu + 90*g1p2*gpp2*M1*Qe*QHu +& 
&  90*g1p2*gpp2*M4*Qe*QHu - 30*g1p2*gpp2*M1*QHd*QHu - 30*g1p2*gpp2*M4*QHd*QHu +          & 
&  60*g1p2*gpp2*M1*QHup2 + 60*g1p2*gpp2*M4*QHup2 + 150*g2p2*gpp2*M4*QHup2 +              & 
&  150*g2p2*gpp2*M2*QHup2 + 900*gpp4*M4*Qdp2*QHup2 + 300*gpp4*M4*Qep2*QHup2 +            & 
&  200*gpp4*M4*QHdp2*QHup2 + 400*gpp4*M4*QHup4 - 90*g1p2*gpp2*M1*Qd*Ql - 90*g1p2*gpp2*M4*Qd*Ql -& 
&  90*g1p2*gpp2*M1*Qe*Ql - 90*g1p2*gpp2*M4*Qe*Ql + 30*g1p2*gpp2*M1*QHd*Ql +              & 
&  30*g1p2*gpp2*M4*QHd*Ql - 120*g1p2*gpp2*M1*QHu*Ql - 120*g1p2*gpp2*M4*QHu*Ql +          & 
&  120*g1p2*gpp2*M1*Qlp2 + 120*g1p2*gpp2*M4*Qlp2 + 150*g2p2*gpp2*M4*Qlp2 +               & 
&  150*g2p2*gpp2*M2*Qlp2 + 900*gpp4*M4*Qdp2*Qlp2 + 300*gpp4*M4*Qep2*Qlp2 +               & 
&  200*gpp4*M4*QHdp2*Qlp2 + 800*gpp4*M4*QHup2*Qlp2 + 800*gpp4*M4*Qlp4 + 90*g1p2*gpp2*M1*QHu*Qq +& 
&  90*g1p2*gpp2*M4*QHu*Qq - 90*g1p2*gpp2*M1*Ql*Qq - 90*g1p2*gpp2*M4*Ql*Qq +              & 
&  1800*gpp4*M4*QHup2*Qqp2 + 1800*gpp4*M4*Qlp2*Qqp2 + 100*gpp4*M4*QHup2*Qs1p2 +          & 
&  100*gpp4*M4*Qlp2*Qs1p2 + 100*gpp4*M4*QHup2*Qs2p2 + 100*gpp4*M4*Qlp2*Qs2p2 +           & 
&  100*gpp4*M4*QHup2*Qs3p2 + 100*gpp4*M4*Qlp2*Qs3p2 + 100*gpp4*M4*QHup2*Qsp2 +           & 
&  100*gpp4*M4*Qlp2*Qsp2 - 180*g1p2*gpp2*M1*QHu*Qu - 180*g1p2*gpp2*M4*QHu*Qu +           & 
&  180*g1p2*gpp2*M1*Ql*Qu + 180*g1p2*gpp2*M4*Ql*Qu + 900*gpp4*M4*QHup2*Qup2 +            & 
&  900*gpp4*M4*Qlp2*Qup2 + 900*gpp4*M4*Qdp2*Qvp2 + 300*gpp4*M4*Qep2*Qvp2 +               & 
&  200*gpp4*M4*QHdp2*Qvp2 + 500*gpp4*M4*QHup2*Qvp2 + 900*gpp4*M4*Qlp2*Qvp2 +             & 
&  1800*gpp4*M4*Qqp2*Qvp2 + 100*gpp4*M4*Qs1p2*Qvp2 + 100*gpp4*M4*Qs2p2*Qvp2 +            & 
&  100*gpp4*M4*Qs3p2*Qvp2 + 100*gpp4*M4*Qsp2*Qvp2 + 900*gpp4*M4*Qup2*Qvp2 +              & 
&  500*gpp4*M4*Qvp4 + 25._dp*(TradjYeTeCYvTpYv) - 20*g1p2*TradjYuTu - 400*g3p2*TradjYuTu +& 
&  150*gpp2*QHup2*TradjYuTu - 150*gpp2*Qqp2*TradjYuTu - 150*gpp2*Qup2*TradjYuTu +        & 
&  25._dp*(TradjYvTpYeCYeTv) + 50*gpp2*QHup2*TradjYvTv - 50*gpp2*Qlp2*TradjYvTv -        & 
&  50*gpp2*Qvp2*TradjYvTv + 75._dp*(TrYdadjYuTuadjYd) + 75._dp*(TrYuadjYdTdadjYu) +      & 
&  10*(2*g1p2*M1 + 40*g3p2*M3 + 15*gpp2*M4*(-1._dp*(QHup2) + Qqp2 + Qup2))*TrYuadjYu +   & 
&  450._dp*(TrYuadjYuTuadjYu) - 50*gpp2*M4*QHup2*TrYvadjYv + 50*gpp2*M4*Qlp2*TrYvadjYv + & 
&  50*gpp2*M4*Qvp2*TrYvadjYv + 150._dp*(TrYvadjYvTvadjYv) + 150*Clamp2*lam*Tlam +        & 
&  25*Conjg(lam)*((2*gpp2*M4*(QHdp2 - QHup2 + Qsp2) + 3._dp*(TradjYdTd) + TradjYeTe)*lam +& 
&  (-2*gpp2*(QHdp2 - QHup2 + Qsp2) + 3._dp*(TrYdadjYd) + TrYeadjYe)*Tlam)))/25._dp

 
DTv = oo16pi2*( betaTv1 + oo16pi2 * betaTv2 ) 

 
Else 
DTv = oo16pi2* betaTv1 
End If 
 
 
Call Chop(DTv) 

!-------------------- 
! Tk 
!-------------------- 
 
betaTk1  = 4*gpp2*M4*(Qs1p2 + Qs2p2 + Qs3p2)*kap + (Abskap - 2*gpp2*(Qs1p2 +          & 
&  Qs2p2 + Qs3p2))*Tk

 
 
If (TwoLoopRGE) Then 
betaTk2 = (-2*Abskap*gpp2*(Qs1p2 + Qs2p2 + Qs3p2)*(2*M4*kap - 3*Tk))/9._dp - 2*gpp4*(2*QHdp2*Qs1p2 +& 
&  2*QHup2*Qs1p2 + 6*Qlp2*Qs1p2 + 18*Qqp2*Qs1p2 + 3._dp*(Qs1p4) + 2*QHdp2*Qs2p2 +        & 
&  2*QHup2*Qs2p2 + 6*Qlp2*Qs2p2 + 18*Qqp2*Qs2p2 + 2*Qs1p2*Qs2p2 + 3._dp*(Qs2p4) +        & 
&  2*QHdp2*Qs3p2 + 2*QHup2*Qs3p2 + 6*Qlp2*Qs3p2 + 18*Qqp2*Qs3p2 + 2*Qs1p2*Qs3p2 +        & 
&  2*Qs2p2*Qs3p2 + 9*Qdp2*(Qs1p2 + Qs2p2 + Qs3p2) + 3*Qep2*(Qs1p2 + Qs2p2 +              & 
&  Qs3p2) + 3._dp*(Qs3p4) + Qs1p2*Qsp2 + Qs2p2*Qsp2 + Qs3p2*Qsp2 + 9*Qs1p2*Qup2 +        & 
&  9*Qs2p2*Qup2 + 9*Qs3p2*Qup2 + 3*Qs1p2*Qvp2 + 3*Qs2p2*Qvp2 + 3*Qs3p2*Qvp2)*(4*M4*kap - & 
&  Tk) - (10*Ckapp2*kapp2*Tk)/27._dp

 
DTk = oo16pi2*( betaTk1 + oo16pi2 * betaTk2 ) 

 
Else 
DTk = oo16pi2* betaTk1 
End If 
 
 
Call Chop(DTk) 

!-------------------- 
! Tu 
!-------------------- 
 
betaTu1  = TuadjYdYd + 5._dp*(TuadjYuYu) + 2._dp*(YuadjYdTd) + 4._dp*(YuadjYuTu)      & 
&  + Abslam*Tu - (13*g1p2*Tu)/15._dp - 3*g2p2*Tu - (16*g3p2*Tu)/3._dp - 2*gpp2*QHup2*Tu -& 
&  2*gpp2*Qqp2*Tu - 2*gpp2*Qup2*Tu + 3*TrYuadjYu*Tu + TrYvadjYv*Tu + Yu*((26*g1p2*M1)    & 
& /15._dp + (32*g3p2*M3)/3._dp + 6*g2p2*M2 + 4*gpp2*M4*QHup2 + 4*gpp2*M4*Qqp2 +          & 
&  4*gpp2*M4*Qup2 + 6._dp*(TradjYuTu) + 2._dp*(TradjYvTv) + 2*Conjg(lam)*Tlam)

 
 
If (TwoLoopRGE) Then 
betaTu2 = -(Abslam*TuadjYdYd) + (2*g1p2*TuadjYdYd)/5._dp + 2*gpp2*Qdp2*TuadjYdYd +              & 
&  2*gpp2*QHdp2*TuadjYdYd - 2*gpp2*Qqp2*TuadjYdYd - 3*TrYdadjYd*TuadjYdYd -              & 
&  TrYeadjYe*TuadjYdYd - 2._dp*(TuadjYdYdadjYdYd) - 4._dp*(TuadjYdYdadjYuYu) -           & 
&  5*Abslam*TuadjYuYu + 12*g2p2*TuadjYuYu + 10*gpp2*QHup2*TuadjYuYu + 6*gpp2*Qqp2*TuadjYuYu -& 
&  6*gpp2*Qup2*TuadjYuYu - 15*TrYuadjYu*TuadjYuYu - 5*TrYvadjYv*TuadjYuYu -              & 
&  6._dp*(TuadjYuYuadjYuYu) - 2*Abslam*YuadjYdTd + (4*g1p2*YuadjYdTd)/5._dp +            & 
&  4*gpp2*Qdp2*YuadjYdTd + 4*gpp2*QHdp2*YuadjYdTd - 4*gpp2*Qqp2*YuadjYdTd -              & 
&  6*TrYdadjYd*YuadjYdTd - 2*TrYeadjYe*YuadjYdTd - 4._dp*(YuadjYdTdadjYdYd) -            & 
&  4._dp*(YuadjYdTdadjYuYu) - 4._dp*(YuadjYdYdadjYdTd) - 2._dp*(YuadjYdYdadjYuTu) -      & 
&  4*Abslam*YuadjYuTu + (6*g1p2*YuadjYuTu)/5._dp + 6*g2p2*YuadjYuTu + 8*gpp2*QHup2*YuadjYuTu -& 
&  12*TrYuadjYu*YuadjYuTu - 4*TrYvadjYv*YuadjYuTu - 8._dp*(YuadjYuTuadjYuYu) -           & 
&  (4*g1p2*M1*YuadjYuYu)/5._dp - 12*g2p2*M2*YuadjYuYu - 12*gpp2*M4*QHup2*YuadjYuYu -     & 
&  4*gpp2*M4*Qqp2*YuadjYuYu + 4*gpp2*M4*Qup2*YuadjYuYu - 18*TradjYuTu*YuadjYuYu -        & 
&  6*TradjYvTv*YuadjYuYu - 6._dp*(YuadjYuYuadjYuTu) + (2743*g1p4*Tu)/450._dp +           & 
&  g1p2*g2p2*Tu + (15*g2p4*Tu)/2._dp + (136*g1p2*g3p2*Tu)/45._dp + 8*g2p2*g3p2*Tu -      & 
&  (16*g3p4*Tu)/9._dp - 3*Clamp2*lamp2*Tu + 2*Abslam*gpp2*QHdp2*Tu + (18*g1p2*gpp2*Qd*QHu*Tu)/5._dp +& 
&  (18*g1p2*gpp2*Qe*QHu*Tu)/5._dp - (6*g1p2*gpp2*QHd*QHu*Tu)/5._dp - 2*Abslam*gpp2*QHup2*Tu +& 
&  (12*g1p2*gpp2*QHup2*Tu)/5._dp + 6*g2p2*gpp2*QHup2*Tu + 18*gpp4*Qdp2*QHup2*Tu +        & 
&  6*gpp4*Qep2*QHup2*Tu + 4*gpp4*QHdp2*QHup2*Tu + 8*gpp4*QHup4*Tu - (18*g1p2*gpp2*QHu*Ql*Tu)/5._dp +& 
&  12*gpp4*QHup2*Qlp2*Tu + (6*g1p2*gpp2*Qd*Qq*Tu)/5._dp + (6*g1p2*gpp2*Qe*Qq*Tu)/5._dp - & 
&  (2*g1p2*gpp2*QHd*Qq*Tu)/5._dp + 4*g1p2*gpp2*QHu*Qq*Tu - (6*g1p2*gpp2*Ql*Qq*Tu)/5._dp  
betaTu2 =  betaTu2+ (4*g1p2*gpp2*Qqp2*Tu)/3._dp + 6*g2p2*gpp2*Qqp2*Tu + (32*g3p2*gpp2*Qqp2*Tu)/3._dp +    & 
&  18*gpp4*Qdp2*Qqp2*Tu + 6*gpp4*Qep2*Qqp2*Tu + 4*gpp4*QHdp2*Qqp2*Tu + 40*gpp4*QHup2*Qqp2*Tu +& 
&  12*gpp4*Qlp2*Qqp2*Tu + 40*gpp4*Qqp4*Tu + 2*gpp4*QHup2*Qs1p2*Tu + 2*gpp4*Qqp2*Qs1p2*Tu +& 
&  2*gpp4*QHup2*Qs2p2*Tu + 2*gpp4*Qqp2*Qs2p2*Tu + 2*gpp4*QHup2*Qs3p2*Tu + 2*gpp4*Qqp2*Qs3p2*Tu +& 
&  2*Abslam*gpp2*Qsp2*Tu + 2*gpp4*QHup2*Qsp2*Tu + 2*gpp4*Qqp2*Qsp2*Tu - (24*g1p2*gpp2*Qd*Qu*Tu)/5._dp -& 
&  (24*g1p2*gpp2*Qe*Qu*Tu)/5._dp + (8*g1p2*gpp2*QHd*Qu*Tu)/5._dp - (44*g1p2*gpp2*QHu*Qu*Tu)/5._dp +& 
&  (24*g1p2*gpp2*Ql*Qu*Tu)/5._dp - (36*g1p2*gpp2*Qq*Qu*Tu)/5._dp + (176*g1p2*gpp2*Qup2*Tu)/15._dp +& 
&  (32*g3p2*gpp2*Qup2*Tu)/3._dp + 18*gpp4*Qdp2*Qup2*Tu + 6*gpp4*Qep2*Qup2*Tu +           & 
&  4*gpp4*QHdp2*Qup2*Tu + 22*gpp4*QHup2*Qup2*Tu + 12*gpp4*Qlp2*Qup2*Tu + 54*gpp4*Qqp2*Qup2*Tu +& 
&  2*gpp4*Qs1p2*Qup2*Tu + 2*gpp4*Qs2p2*Qup2*Tu + 2*gpp4*Qs3p2*Qup2*Tu + 2*gpp4*Qsp2*Qup2*Tu +& 
&  22*gpp4*Qup4*Tu + 6*gpp4*QHup2*Qvp2*Tu + 6*gpp4*Qqp2*Qvp2*Tu + 6*gpp4*Qup2*Qvp2*Tu -  & 
&  3*Abslam*TrYdadjYd*Tu - 3*TrYdadjYuYuadjYd*Tu - Abslam*TrYeadjYe*Tu + (4*g1p2*TrYuadjYu*Tu)/5._dp +& 
&  16*g3p2*TrYuadjYu*Tu - 6*gpp2*QHup2*TrYuadjYu*Tu + 6*gpp2*Qqp2*TrYuadjYu*Tu +         & 
&  6*gpp2*Qup2*TrYuadjYu*Tu - 9*TrYuadjYuYuadjYu*Tu - 2*gpp2*QHup2*TrYvadjYv*Tu +        & 
&  2*gpp2*Qlp2*TrYvadjYv*Tu + 2*gpp2*Qvp2*TrYvadjYv*Tu - TrYvadjYvTpYeCYe*Tu -           & 
&  3*TrYvadjYvYvadjYv*Tu - 6*YuadjYuYu*Conjg(lam)*Tlam + YuadjYdYd*((-4*g1p2*M1)/5._dp - & 
&  4*gpp2*M4*Qdp2 - 4*gpp2*M4*QHdp2 + 4*gpp2*M4*Qqp2 - 6._dp*(TradjYdTd) -               & 
&  2._dp*(TradjYeTe) - 2*Conjg(lam)*Tlam) - (2*Yu*(2743*g1p4*M1 + 225*g1p2*g2p2*M1 +     & 
&  680*g1p2*g3p2*M1 + 680*g1p2*g3p2*M3 + 1800*g2p2*g3p2*M3 - 800*g3p4*M3 +               & 
&  225*g1p2*g2p2*M2 + 3375*g2p4*M2 + 1800*g2p2*g3p2*M2 + 810*g1p2*gpp2*M1*Qd*QHu +       & 
&  810*g1p2*gpp2*M4*Qd*QHu + 810*g1p2*gpp2*M1*Qe*QHu + 810*g1p2*gpp2*M4*Qe*QHu -         & 
&  270*g1p2*gpp2*M1*QHd*QHu - 270*g1p2*gpp2*M4*QHd*QHu + 540*g1p2*gpp2*M1*QHup2 +        & 
&  540*g1p2*gpp2*M4*QHup2 + 1350*g2p2*gpp2*M4*QHup2 + 1350*g2p2*gpp2*M2*QHup2 +          & 
&  8100*gpp4*M4*Qdp2*QHup2 + 2700*gpp4*M4*Qep2*QHup2 + 1800*gpp4*M4*QHdp2*QHup2 +        & 
&  3600*gpp4*M4*QHup4 - 810*g1p2*gpp2*M1*QHu*Ql - 810*g1p2*gpp2*M4*QHu*Ql +              & 
&  5400*gpp4*M4*QHup2*Qlp2 + 270*g1p2*gpp2*M1*Qd*Qq + 270*g1p2*gpp2*M4*Qd*Qq +           & 
&  270*g1p2*gpp2*M1*Qe*Qq + 270*g1p2*gpp2*M4*Qe*Qq - 90*g1p2*gpp2*M1*QHd*Qq -            & 
&  90*g1p2*gpp2*M4*QHd*Qq + 900*g1p2*gpp2*M1*QHu*Qq + 900*g1p2*gpp2*M4*QHu*Qq -          & 
&  270*g1p2*gpp2*M1*Ql*Qq - 270*g1p2*gpp2*M4*Ql*Qq + 300*g1p2*gpp2*M1*Qqp2 +             & 
&  2400*g3p2*gpp2*M3*Qqp2 + 300*g1p2*gpp2*M4*Qqp2 + 1350*g2p2*gpp2*M4*Qqp2 +             & 
&  2400*g3p2*gpp2*M4*Qqp2 + 1350*g2p2*gpp2*M2*Qqp2 + 8100*gpp4*M4*Qdp2*Qqp2 +            & 
&  2700*gpp4*M4*Qep2*Qqp2 + 1800*gpp4*M4*QHdp2*Qqp2 + 18000._dp*gpp4*M4*QHup2*Qqp2 +     & 
&  5400*gpp4*M4*Qlp2*Qqp2 + 18000._dp*gpp4*M4*Qqp4 + 900*gpp4*M4*QHup2*Qs1p2 +           & 
&  900*gpp4*M4*Qqp2*Qs1p2 + 900*gpp4*M4*QHup2*Qs2p2 + 900*gpp4*M4*Qqp2*Qs2p2 +           & 
&  900*gpp4*M4*QHup2*Qs3p2 + 900*gpp4*M4*Qqp2*Qs3p2 + 900*gpp4*M4*QHup2*Qsp2 +           & 
&  900*gpp4*M4*Qqp2*Qsp2 - 1080*g1p2*gpp2*M1*Qd*Qu - 1080*g1p2*gpp2*M4*Qd*Qu -           & 
&  1080*g1p2*gpp2*M1*Qe*Qu - 1080*g1p2*gpp2*M4*Qe*Qu + 360*g1p2*gpp2*M1*QHd*Qu +         & 
&  360*g1p2*gpp2*M4*QHd*Qu - 1980*g1p2*gpp2*M1*QHu*Qu - 1980*g1p2*gpp2*M4*QHu*Qu +       & 
&  1080*g1p2*gpp2*M1*Ql*Qu + 1080*g1p2*gpp2*M4*Ql*Qu - 1620*g1p2*gpp2*M1*Qq*Qu -         & 
&  1620*g1p2*gpp2*M4*Qq*Qu + 2640*g1p2*gpp2*M1*Qup2 + 2400*g3p2*gpp2*M3*Qup2 +           & 
&  2640*g1p2*gpp2*M4*Qup2 + 2400*g3p2*gpp2*M4*Qup2 + 8100*gpp4*M4*Qdp2*Qup2 +            & 
&  2700*gpp4*M4*Qep2*Qup2 + 1800*gpp4*M4*QHdp2*Qup2 + 9900*gpp4*M4*QHup2*Qup2 +          & 
&  5400*gpp4*M4*Qlp2*Qup2 + 24300._dp*gpp4*M4*Qqp2*Qup2 + 900*gpp4*M4*Qs1p2*Qup2 +       & 
&  900*gpp4*M4*Qs2p2*Qup2 + 900*gpp4*M4*Qs3p2*Qup2 + 900*gpp4*M4*Qsp2*Qup2 +             & 
&  9900*gpp4*M4*Qup4 + 2700*gpp4*M4*QHup2*Qvp2 + 2700*gpp4*M4*Qqp2*Qvp2 + 2700*gpp4*M4*Qup2*Qvp2 +& 
&  225._dp*(TradjYeTeCYvTpYv) - 180*g1p2*TradjYuTu - 3600*g3p2*TradjYuTu +               & 
&  1350*gpp2*QHup2*TradjYuTu - 1350*gpp2*Qqp2*TradjYuTu - 1350*gpp2*Qup2*TradjYuTu +     & 
&  225._dp*(TradjYvTpYeCYeTv) + 450*gpp2*QHup2*TradjYvTv - 450*gpp2*Qlp2*TradjYvTv -     & 
&  450*gpp2*Qvp2*TradjYvTv + 675._dp*(TrYdadjYuTuadjYd) + 675._dp*(TrYuadjYdTdadjYu) +   & 
&  90*(2*g1p2*M1 + 40*g3p2*M3 + 15*gpp2*M4*(-1._dp*(QHup2) + Qqp2 + Qup2))*TrYuadjYu +   & 
&  4050._dp*(TrYuadjYuTuadjYu) - 450*gpp2*M4*QHup2*TrYvadjYv + 450*gpp2*M4*Qlp2*TrYvadjYv +& 
&  450*gpp2*M4*Qvp2*TrYvadjYv + 1350._dp*(TrYvadjYvTvadjYv) + 1350*Clamp2*lam*Tlam +     & 
&  225*Conjg(lam)*((2*gpp2*M4*(QHdp2 - QHup2 + Qsp2) + 3._dp*(TradjYdTd) +               & 
&  TradjYeTe)*lam + (-2*gpp2*(QHdp2 - QHup2 + Qsp2) + 3._dp*(TrYdadjYd) + TrYeadjYe)*Tlam)))/225._dp

 
DTu = oo16pi2*( betaTu1 + oo16pi2 * betaTu2 ) 

 
Else 
DTu = oo16pi2* betaTu1 
End If 
 
 
Call Chop(DTu) 

!-------------------- 
! mq2 
!-------------------- 
 
betamq21  = 2._dp*(adjTdTd) + 2._dp*(adjTuTu) + 2._dp*(adjYdmd2Yd) + adjYdYdmq2 +     & 
&  2._dp*(adjYumu2Yu) + adjYuYumq2 - (2*AbsM1*g1p2*id3R)/15._dp - 6*AbsM2*g2p2*id3R -    & 
&  (32*AbsM3*g3p2*id3R)/3._dp + 2*adjYdYd*mHd2 + 2*adjYuYu*mHu2 + mq2adjYdYd +           & 
&  mq2adjYuYu - 8*AbsM4*gpp2*id3R*Qqp2 + g1*id3R*ooSqrt15*Tr1(1) + 2*gp*id3R*Qq*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betamq22 = -2*Abslam*adjTdTd - 4._dp*(adjTdTdadjYdYd) - 4._dp*(adjTdYdadjYdTd) - 2*Abslam*adjTuTu -& 
&  4._dp*(adjTuTuadjYuYu) - 4._dp*(adjTuYuadjYuTu) - 2*Abslam*adjYdmd2Yd -               & 
&  4._dp*(adjYdmd2YdadjYdYd) - 4._dp*(adjYdTdadjTdYd) - 2*AbsTlam*adjYdYd -              & 
&  4._dp*(adjYdYdadjTdTd) - 4._dp*(adjYdYdadjYdmd2Yd) - 2._dp*(adjYdYdadjYdYdmq2) -      & 
&  Abslam*adjYdYdmq2 - 4._dp*(adjYdYdmq2adjYdYd) - 2*Abslam*adjYumu2Yu - 4._dp*(adjYumu2YuadjYuYu) -& 
&  4._dp*(adjYuTuadjTuYu) - 2*AbsTlam*adjYuYu - 4._dp*(adjYuYuadjTuTu) - 4._dp*(adjYuYuadjYumu2Yu) -& 
&  2._dp*(adjYuYuadjYuYumq2) - Abslam*adjYuYumq2 - 4._dp*(adjYuYumq2adjYuYu) +           & 
&  (4*adjTdTd*g1p2)/5._dp + (8*adjTuTu*g1p2)/5._dp + (4*adjYdmd2Yd*g1p2)/5._dp +         & 
&  (2*adjYdYdmq2*g1p2)/5._dp + (8*adjYumu2Yu*g1p2)/5._dp + (4*adjYuYumq2*g1p2)/5._dp +   & 
&  (2*AbsM2*g1p2*g2p2*id3R)/5._dp + 33*AbsM2*g2p4*id3R + 32*AbsM2*g2p2*g3p2*id3R -       & 
&  (4*adjTdYd*g1p2*M1)/5._dp - (8*adjTuYu*g1p2*M1)/5._dp - 4*Abslam*adjYdYd*mHd2 -       & 
&  8*adjYdYdadjYdYd*mHd2 - 2*Abslam*adjYuYu*mHd2 + (4*adjYdYd*g1p2*mHd2)/5._dp -         & 
&  2*Abslam*adjYdYd*mHu2 - 4*Abslam*adjYuYu*mHu2 - 8*adjYuYuadjYuYu*mHu2 +               & 
&  (8*adjYuYu*g1p2*mHu2)/5._dp - Abslam*mq2adjYdYd + (2*g1p2*mq2adjYdYd)/5._dp -         & 
&  2._dp*(mq2adjYdYdadjYdYd) - Abslam*mq2adjYuYu + (4*g1p2*mq2adjYuYu)/5._dp -           & 
&  2._dp*(mq2adjYuYuadjYuYu) - 2*Abslam*adjYdYd*ms2 - 2*Abslam*adjYuYu*ms2 +             & 
&  4*adjTdTd*gpp2*Qdp2 + 4*adjYdmd2Yd*gpp2*Qdp2 + 8*AbsM4*adjYdYd*gpp2*Qdp2 +            & 
&  2*adjYdYdmq2*gpp2*Qdp2 - 4*adjTdYd*gpp2*M4*Qdp2 + 4*adjYdYd*gpp2*mHd2*Qdp2 +          & 
&  2*gpp2*mq2adjYdYd*Qdp2 + 4*adjTdTd*gpp2*QHdp2 + 4*adjYdmd2Yd*gpp2*QHdp2 +             & 
&  8*AbsM4*adjYdYd*gpp2*QHdp2 + 2*adjYdYdmq2*gpp2*QHdp2 - 4*adjTdYd*gpp2*M4*QHdp2 +      & 
&  4*adjYdYd*gpp2*mHd2*QHdp2 + 2*gpp2*mq2adjYdYd*QHdp2 + 4*adjTuTu*gpp2*QHup2  
betamq22 =  betamq22+ 4*adjYumu2Yu*gpp2*QHup2 + 8*AbsM4*adjYuYu*gpp2*QHup2 + 2*adjYuYumq2*gpp2*QHup2 -      & 
&  4*adjTuYu*gpp2*M4*QHup2 + 4*adjYuYu*gpp2*mHu2*QHup2 + 2*gpp2*mq2adjYuYu*QHup2 +       & 
&  (24*AbsM4*g1p2*gpp2*id3R*Qd*Qq)/5._dp + (24*AbsM4*g1p2*gpp2*id3R*Qe*Qq)/5._dp -       & 
&  (8*AbsM4*g1p2*gpp2*id3R*QHd*Qq)/5._dp + (8*AbsM4*g1p2*gpp2*id3R*QHu*Qq)/5._dp -       & 
&  (24*AbsM4*g1p2*gpp2*id3R*Ql*Qq)/5._dp - 4*adjTdTd*gpp2*Qqp2 - 4*adjTuTu*gpp2*Qqp2 -   & 
&  4*adjYdmd2Yd*gpp2*Qqp2 - 8*AbsM4*adjYdYd*gpp2*Qqp2 - 2*adjYdYdmq2*gpp2*Qqp2 -         & 
&  4*adjYumu2Yu*gpp2*Qqp2 - 8*AbsM4*adjYuYu*gpp2*Qqp2 - 2*adjYuYumq2*gpp2*Qqp2 +         & 
&  (16*AbsM4*g1p2*gpp2*id3R*Qqp2)/3._dp + 24*AbsM2*g2p2*gpp2*id3R*Qqp2 + 24*AbsM4*g2p2*gpp2*id3R*Qqp2 +& 
&  (128*AbsM4*g3p2*gpp2*id3R*Qqp2)/3._dp + 4*adjTdYd*gpp2*M4*Qqp2 + 4*adjTuYu*gpp2*M4*Qqp2 -& 
&  4*adjYdYd*gpp2*mHd2*Qqp2 - 4*adjYuYu*gpp2*mHu2*Qqp2 - 2*gpp2*mq2adjYdYd*Qqp2 -        & 
&  2*gpp2*mq2adjYuYu*Qqp2 + 216*AbsM4*gpp4*id3R*Qdp2*Qqp2 + 72*AbsM4*gpp4*id3R*Qep2*Qqp2 +& 
&  48*AbsM4*gpp4*id3R*QHdp2*Qqp2 + 48*AbsM4*gpp4*id3R*QHup2*Qqp2 + 144*AbsM4*gpp4*id3R*Qlp2*Qqp2 +& 
&  480*AbsM4*gpp4*id3R*Qqp4 + 24*AbsM4*gpp4*id3R*Qqp2*Qs1p2 + 24*AbsM4*gpp4*id3R*Qqp2*Qs2p2 +& 
&  24*AbsM4*gpp4*id3R*Qqp2*Qs3p2 + 24*AbsM4*gpp4*id3R*Qqp2*Qsp2 - (48*AbsM4*g1p2*gpp2*id3R*Qq*Qu)/5._dp +& 
&  4*adjTuTu*gpp2*Qup2 + 4*adjYumu2Yu*gpp2*Qup2 + 8*AbsM4*adjYuYu*gpp2*Qup2 +            & 
&  2*adjYuYumq2*gpp2*Qup2 - 4*adjTuYu*gpp2*M4*Qup2 + 4*adjYuYu*gpp2*mHu2*Qup2 +          & 
&  2*gpp2*mq2adjYuYu*Qup2 + 216*AbsM4*gpp4*id3R*Qqp2*Qup2 + 72*AbsM4*gpp4*id3R*Qqp2*Qvp2 -& 
&  6*adjTdYd*TradjYdTd - 2*adjTdYd*TradjYeTe - 6*adjTuYu*TradjYuTu - 2*adjTuYu*TradjYvTv -& 
&  6*adjYdYd*TrCTdTpTd - 6*adjYdTd*TrCTdTpYd - 2*adjYdYd*TrCTeTpTe - 2*adjYdTd*TrCTeTpYe -& 
&  6*adjYuYu*TrCTuTpTu - 6*adjYuTu*TrCTuTpYu - 2*adjYuYu*TrCTvTpTv - 2*adjYuTu*TrCTvTpYv -& 
&  6*adjYdYd*Trmd2YdadjYd - 2*adjYdYd*Trme2YeadjYe - 2*adjYdYd*Trml2adjYeYe  
betamq22 =  betamq22- 6*adjYdYd*Trmq2adjYdYd - 6*adjYuYu*Trmq2adjYuYu - 6*adjYuYu*Trmu2YuadjYu -            & 
&  6*adjTdTd*TrYdadjYd - 6*adjYdmd2Yd*TrYdadjYd - 3*adjYdYdmq2*TrYdadjYd -               & 
&  12*adjYdYd*mHd2*TrYdadjYd - 3*mq2adjYdYd*TrYdadjYd - 2*adjTdTd*TrYeadjYe -            & 
&  2*adjYdmd2Yd*TrYeadjYe - adjYdYdmq2*TrYeadjYe - 4*adjYdYd*mHd2*TrYeadjYe -            & 
&  mq2adjYdYd*TrYeadjYe - 6*adjTuTu*TrYuadjYu - 6*adjYumu2Yu*TrYuadjYu - 3*adjYuYumq2*TrYuadjYu -& 
&  12*adjYuYu*mHu2*TrYuadjYu - 3*mq2adjYuYu*TrYuadjYu - 2*adjTuTu*TrYvadjYv -            & 
&  2*adjYumu2Yu*TrYvadjYv - adjYuYumq2*TrYvadjYv - 4*adjYuYu*mHu2*TrYvadjYv -            & 
&  mq2adjYuYu*TrYvadjYv - 2*adjYuYu*TrYvadjYvCml2 - 2*adjYuYu*TrYvCmv2adjYv +            & 
&  (g1p2*(180*(-1._dp*(adjYdTd) - 2._dp*(adjYuTu) + 2*adjYdYd*M1 + 4*adjYuYu*M1) +       & 
&  id3R*(597*g1p2*M1 + 80*g3p2*(2._dp*(M1) + M3) + 45*g2p2*(2._dp*(M1) + M2) +           & 
&  60*gpp2*(2._dp*(M1) + M4)*Qq*(9._dp*(Qd) + 9._dp*(Qe) - 3._dp*(QHd) + 3._dp*(QHu) -   & 
&  9._dp*(Ql) + 10._dp*(Qq) - 18._dp*(Qu))))*Conjg(M1))/225._dp - (16*g3p2*id3R*(-       & 
& (g1p2*(M1 + 2._dp*(M3))) - 15*(-8*g3p2*M3 + 3*g2p2*(2._dp*(M3) + M2) + 4*gpp2*(2._dp*(M3) +& 
&  M4)*Qqp2))*Conjg(M3))/45._dp - 4*adjYdTd*gpp2*Qdp2*Conjg(M4) - 4*adjYdTd*gpp2*QHdp2*Conjg(M4) -& 
&  4*adjYuTu*gpp2*QHup2*Conjg(M4) + (12*g1p2*gpp2*id3R*M1*Qd*Qq*Conjg(M4))/5._dp +       & 
&  (12*g1p2*gpp2*id3R*M1*Qe*Qq*Conjg(M4))/5._dp - (4*g1p2*gpp2*id3R*M1*QHd*Qq*Conjg(M4))/5._dp +& 
&  (4*g1p2*gpp2*id3R*M1*QHu*Qq*Conjg(M4))/5._dp - (12*g1p2*gpp2*id3R*M1*Ql*Qq*Conjg(M4))/5._dp +& 
&  4*adjYdTd*gpp2*Qqp2*Conjg(M4) + 4*adjYuTu*gpp2*Qqp2*Conjg(M4) + (8*g1p2*gpp2*id3R*M1*Qqp2*Conjg(M4))/3._dp +& 
&  (64*g3p2*gpp2*id3R*M3*Qqp2*Conjg(M4))/3._dp + 12*g2p2*gpp2*id3R*M2*Qqp2*Conjg(M4) -   & 
&  (24*g1p2*gpp2*id3R*M1*Qq*Qu*Conjg(M4))/5._dp - 4*adjYuTu*gpp2*Qup2*Conjg(M4) +        & 
&  (g1p2*g2p2*id3R*M1*Conjg(M2))/5._dp + 16*g2p2*g3p2*id3R*M3*Conjg(M2) + 12*g2p2*gpp2*id3R*M4*Qqp2*Conjg(M2)  
betamq22 =  betamq22- 2*adjYdTd*lam*Conjg(Tlam) - 2*adjYuTu*lam*Conjg(Tlam) - 2*adjTdYd*Conjg(lam)*Tlam -   & 
&  2*adjTuYu*Conjg(lam)*Tlam + 6*g2p4*id3R*Tr2(2) + (32*g3p4*id3R*Tr2(3))/3._dp +        & 
&  (2*g1p2*id3R*Tr2U1(1,1))/15._dp + 4*g1*gp*id3R*ooSqrt15*Qq*Tr2U1(1,4) +               & 
&  4*g1*gp*id3R*ooSqrt15*Qq*Tr2U1(4,1) + 8*gpp2*id3R*Qqp2*Tr2U1(4,4) + 4*g1*id3R*ooSqrt15*Tr3(1) +& 
&  8*gp*id3R*Qq*Tr3(4)

 
Dmq2 = oo16pi2*( betamq21 + oo16pi2 * betamq22 ) 

 
Else 
Dmq2 = oo16pi2* betamq21 
End If 
 
 
Call Chop(Dmq2) 

Forall(i1=1:3) Dmq2(i1,i1) =  Real(Dmq2(i1,i1),dp) 
Dmq2 = 0.5_dp*(Dmq2+ Conjg(Transpose(Dmq2)) ) 
!-------------------- 
! ml2 
!-------------------- 
 
betaml21  = 2._dp*(adjTeTe) + 2._dp*(adjYeme2Ye) + adjYeYeml2 + 2._dp*(CTvTpTv)       & 
&  + 2._dp*(CYvmv2TpYv) + CYvTpYvml2 - (6*AbsM1*g1p2*id3R)/5._dp - 6*AbsM2*g2p2*id3R +   & 
&  2*adjYeYe*mHd2 + 2*CYvTpYv*mHu2 + ml2adjYeYe + ml2CYvTpYv - 8*AbsM4*gpp2*id3R*Qlp2 -  & 
&  g1*id3R*sqrt3ov5*Tr1(1) + 2*gp*id3R*Ql*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betaml22 = -2*Abslam*adjTeTe - 4._dp*(adjTeTeadjYeYe) - 4._dp*(adjTeYeadjYeTe) - 2*Abslam*adjYeme2Ye -& 
&  4._dp*(adjYeme2YeadjYeYe) - 4._dp*(adjYeTeadjTeYe) - 2*AbsTlam*adjYeYe -              & 
&  4._dp*(adjYeYeadjTeTe) - 4._dp*(adjYeYeadjYeme2Ye) - 2._dp*(adjYeYeadjYeYeml2) -      & 
&  Abslam*adjYeYeml2 - 4._dp*(adjYeYeml2adjYeYe) - 2*Abslam*CTvTpTv - 4._dp*(CTvTpTvCYvTpYv) -& 
&  4._dp*(CTvTpYvCYvTpTv) - 2*Abslam*CYvmv2TpYv - 4._dp*(CYvmv2TpYvCYvTpYv) -            & 
&  4._dp*(CYvTpTvCTvTpYv) - 2*AbsTlam*CYvTpYv - 4._dp*(CYvTpYvCTvTpTv) - 4._dp*(CYvTpYvCYvmv2TpYv) -& 
&  2._dp*(CYvTpYvCYvTpYvml2) - Abslam*CYvTpYvml2 - 4._dp*(CYvTpYvml2CYvTpYv) +           & 
&  (12*adjTeTe*g1p2)/5._dp + (12*adjYeme2Ye*g1p2)/5._dp + (6*adjYeYeml2*g1p2)/5._dp +    & 
&  (18*AbsM2*g1p2*g2p2*id3R)/5._dp + 33*AbsM2*g2p4*id3R - (12*adjTeYe*g1p2*M1)/5._dp -   & 
&  4*Abslam*adjYeYe*mHd2 - 8*adjYeYeadjYeYe*mHd2 - 2*Abslam*CYvTpYv*mHd2 +               & 
&  (12*adjYeYe*g1p2*mHd2)/5._dp - 2*Abslam*adjYeYe*mHu2 - 4*Abslam*CYvTpYv*mHu2 -        & 
&  8*CYvTpYvCYvTpYv*mHu2 - Abslam*ml2adjYeYe + (6*g1p2*ml2adjYeYe)/5._dp -               & 
&  2._dp*(ml2adjYeYeadjYeYe) - Abslam*ml2CYvTpYv - 2._dp*(ml2CYvTpYvCYvTpYv) -           & 
&  2*Abslam*adjYeYe*ms2 - 2*Abslam*CYvTpYv*ms2 + 4*adjTeTe*gpp2*Qep2 + 4*adjYeme2Ye*gpp2*Qep2 +& 
&  2*adjYeYeml2*gpp2*Qep2 - 4*adjTeYe*gpp2*M4*Qep2 + 4*adjYeYe*gpp2*mHd2*Qep2 +          & 
&  2*gpp2*ml2adjYeYe*Qep2 + 4*adjTeTe*gpp2*QHdp2 + 4*adjYeme2Ye*gpp2*QHdp2 +             & 
&  2*adjYeYeml2*gpp2*QHdp2 - 4*adjTeYe*gpp2*M4*QHdp2 + 4*adjYeYe*gpp2*mHd2*QHdp2 +       & 
&  2*gpp2*ml2adjYeYe*QHdp2 + 4*CTvTpTv*gpp2*QHup2 + 4*CYvmv2TpYv*gpp2*QHup2 +            & 
&  2*CYvTpYvml2*gpp2*QHup2 - 4*CTvTpYv*gpp2*M4*QHup2 + 4*CYvTpYv*gpp2*mHu2*QHup2 +       & 
&  2*gpp2*ml2CYvTpYv*QHup2 - 4*adjTeTe*gpp2*Qlp2 - 4*adjYeme2Ye*gpp2*Qlp2 -              & 
&  2*adjYeYeml2*gpp2*Qlp2 - 4*CTvTpTv*gpp2*Qlp2 - 4*CYvmv2TpYv*gpp2*Qlp2  
betaml22 =  betaml22- 2*CYvTpYvml2*gpp2*Qlp2 + 24*AbsM2*g2p2*gpp2*id3R*Qlp2 + 4*adjTeYe*gpp2*M4*Qlp2 +      & 
&  4*CTvTpYv*gpp2*M4*Qlp2 - 4*adjYeYe*gpp2*mHd2*Qlp2 - 4*CYvTpYv*gpp2*mHu2*Qlp2 -        & 
&  2*gpp2*ml2adjYeYe*Qlp2 - 2*gpp2*ml2CYvTpYv*Qlp2 + 4*CTvTpTv*gpp2*Qvp2 +               & 
&  4*CYvmv2TpYv*gpp2*Qvp2 + 2*CYvTpYvml2*gpp2*Qvp2 - 4*CTvTpYv*gpp2*M4*Qvp2 +            & 
&  4*CYvTpYv*gpp2*mHu2*Qvp2 + 2*gpp2*ml2CYvTpYv*Qvp2 - 6*adjTeYe*TradjYdTd -             & 
&  2*adjTeYe*TradjYeTe - 6*CTvTpYv*TradjYuTu - 2*CTvTpYv*TradjYvTv - 6*adjYeYe*TrCTdTpTd -& 
&  6*adjYeTe*TrCTdTpYd - 2*adjYeYe*TrCTeTpTe - 2*adjYeTe*TrCTeTpYe - 6*CYvTpYv*TrCTuTpTu -& 
&  6*CYvTpTv*TrCTuTpYu - 2*CYvTpYv*TrCTvTpTv - 2*CYvTpTv*TrCTvTpYv - 6*adjYeYe*Trmd2YdadjYd -& 
&  2*adjYeYe*Trme2YeadjYe - 2*adjYeYe*Trml2adjYeYe - 6*adjYeYe*Trmq2adjYdYd -            & 
&  6*CYvTpYv*Trmq2adjYuYu - 6*CYvTpYv*Trmu2YuadjYu - 6*adjTeTe*TrYdadjYd -               & 
&  6*adjYeme2Ye*TrYdadjYd - 3*adjYeYeml2*TrYdadjYd - 12*adjYeYe*mHd2*TrYdadjYd -         & 
&  3*ml2adjYeYe*TrYdadjYd - 2*adjTeTe*TrYeadjYe - 2*adjYeme2Ye*TrYeadjYe -               & 
&  adjYeYeml2*TrYeadjYe - 4*adjYeYe*mHd2*TrYeadjYe - ml2adjYeYe*TrYeadjYe -              & 
&  6*CTvTpTv*TrYuadjYu - 6*CYvmv2TpYv*TrYuadjYu - 3*CYvTpYvml2*TrYuadjYu -               & 
&  12*CYvTpYv*mHu2*TrYuadjYu - 3*ml2CYvTpYv*TrYuadjYu - 2*CTvTpTv*TrYvadjYv -            & 
&  2*CYvmv2TpYv*TrYvadjYv - CYvTpYvml2*TrYvadjYv - 4*CYvTpYv*mHu2*TrYvadjYv -            & 
&  ml2CYvTpYv*TrYvadjYv - 2*CYvTpYv*TrYvadjYvCml2 - 2*CYvTpYv*TrYvCmv2adjYv +            & 
&  (3*g1p2*(-20._dp*(adjYeTe) + 40*adjYeYe*M1 + id3R*(207*g1p2*M1 + 15*g2p2*(2._dp*(M1) +& 
&  M2) + 20*gpp2*(2._dp*(M1) + M4)*Ql*(-3._dp*(Qd) - 3._dp*(Qe) + QHd - QHu +            & 
&  4._dp*(Ql) - 3._dp*(Qq) + 6._dp*(Qu))))*Conjg(M1))/25._dp + (4*gpp2*(5*(-             & 
& (adjYeTe*(Qep2 + QHdp2 - Qlp2)) + 2*adjYeYe*M4*(Qep2 + QHdp2 - Qlp2) + (-              & 
& 1._dp*(CYvTpTv) + 2*CYvTpYv*M4)*(QHup2 - Qlp2 + Qvp2)) + 3*id3R*Ql*(-(g1p2*(M1 +       & 
&  2._dp*(M4))*(3._dp*(Qd) + 3._dp*(Qe) - QHd + QHu - 4._dp*(Ql) + 3._dp*(Qq) -          & 
&  6._dp*(Qu))) + 5*Ql*(g2p2*(2._dp*(M4) + M2) + 2*gpp2*M4*(9._dp*(Qdp2) +               & 
&  3._dp*(Qep2) + 2._dp*(QHdp2) + 2._dp*(QHup2) + 8._dp*(Qlp2) + 18._dp*(Qqp2) +         & 
&  Qs1p2 + Qs2p2 + Qs3p2 + Qsp2 + 9._dp*(Qup2) + 3._dp*(Qvp2)))))*Conjg(M4))/5._dp  
betaml22 =  betaml22+ (9*g1p2*g2p2*id3R*M1*Conjg(M2))/5._dp + 12*g2p2*gpp2*id3R*M4*Qlp2*Conjg(M2) -         & 
&  2*adjYeTe*lam*Conjg(Tlam) - 2*CYvTpTv*lam*Conjg(Tlam) - 2*adjTeYe*Conjg(lam)*Tlam -   & 
&  2*CTvTpYv*Conjg(lam)*Tlam + 6*g2p4*id3R*Tr2(2) + (6*g1p2*id3R*Tr2U1(1,1))/5._dp -     & 
&  4*g1*gp*id3R*Ql*sqrt3ov5*Tr2U1(1,4) - 4*g1*gp*id3R*Ql*sqrt3ov5*Tr2U1(4,               & 
& 1) + 8*gpp2*id3R*Qlp2*Tr2U1(4,4) - 4*g1*id3R*sqrt3ov5*Tr3(1) + 8*gp*id3R*Ql*Tr3(4)

 
Dml2 = oo16pi2*( betaml21 + oo16pi2 * betaml22 ) 

 
Else 
Dml2 = oo16pi2* betaml21 
End If 
 
 
Call Chop(Dml2) 

Forall(i1=1:3) Dml2(i1,i1) =  Real(Dml2(i1,i1),dp) 
Dml2 = 0.5_dp*(Dml2+ Conjg(Transpose(Dml2)) ) 
!-------------------- 
! mHd2 
!-------------------- 
 
betamHd21  = 2._dp*(AbsTlam) - (6*AbsM1*g1p2)/5._dp - 6*AbsM2*g2p2 + 2*Abslam*mHd2 +  & 
&  2*Abslam*mHu2 + 2*Abslam*ms2 - 8*AbsM4*gpp2*QHdp2 + 6._dp*(TrCTdTpTd) +               & 
&  2._dp*(TrCTeTpTe) + 6._dp*(Trmd2YdadjYd) + 2._dp*(Trme2YeadjYe) + 2._dp*(Trml2adjYeYe)& 
&  + 6._dp*(Trmq2adjYdYd) + 6*mHd2*TrYdadjYd + 2*mHd2*TrYeadjYe - g1*sqrt3ov5*Tr1(1)     & 
&  + 2*gp*QHd*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betamHd22 = -24*Abslam*AbsTlam + (18*AbsM2*g1p2*g2p2)/5._dp + 33*AbsM2*g2p4 - 12*Clamp2*lamp2*mHd2 -& 
&  12*Clamp2*lamp2*mHu2 - 12*Clamp2*lamp2*ms2 - 4*AbsTlam*gpp2*QHdp2 + 24*AbsM2*g2p2*gpp2*QHdp2 -& 
&  4*Abslam*gpp2*mHd2*QHdp2 - 4*Abslam*gpp2*mHu2*QHdp2 - 4*Abslam*gpp2*ms2*QHdp2 +       & 
&  4*AbsTlam*gpp2*QHup2 + 4*Abslam*gpp2*mHd2*QHup2 + 4*Abslam*gpp2*mHu2*QHup2 +          & 
&  4*Abslam*gpp2*ms2*QHup2 + 4*AbsTlam*gpp2*Qsp2 + 4*Abslam*gpp2*mHd2*Qsp2 +             & 
&  4*Abslam*gpp2*mHu2*Qsp2 + 4*Abslam*gpp2*ms2*Qsp2 - 2._dp*(TradjYeTeCTvTpYv) -         & 
&  2._dp*(TradjYvTpYeCTeTv) - (4*g1p2*TrCTdTpTd)/5._dp + 32*g3p2*TrCTdTpTd +             & 
&  12*gpp2*Qdp2*TrCTdTpTd - 12*gpp2*QHdp2*TrCTdTpTd + 12*gpp2*Qqp2*TrCTdTpTd +           & 
&  (4*g1p2*M1*TrCTdTpYd)/5._dp - 32*g3p2*M3*TrCTdTpYd - 12*gpp2*M4*Qdp2*TrCTdTpYd +      & 
&  12*gpp2*M4*QHdp2*TrCTdTpYd - 12*gpp2*M4*Qqp2*TrCTdTpYd + (12*g1p2*TrCTeTpTe)/5._dp +  & 
&  4*gpp2*Qep2*TrCTeTpTe - 4*gpp2*QHdp2*TrCTeTpTe + 4*gpp2*Qlp2*TrCTeTpTe -              & 
&  (12*g1p2*M1*TrCTeTpYe)/5._dp - 4*gpp2*M4*Qep2*TrCTeTpYe + 4*gpp2*M4*QHdp2*TrCTeTpYe - & 
&  4*gpp2*M4*Qlp2*TrCTeTpYe - 6*Abslam*TrCTuTpTu - 2*Abslam*TrCTvTpTv - (4*g1p2*Trmd2YdadjYd)/5._dp +& 
&  32*g3p2*Trmd2YdadjYd + 12*gpp2*Qdp2*Trmd2YdadjYd - 12*gpp2*QHdp2*Trmd2YdadjYd +       & 
&  12*gpp2*Qqp2*Trmd2YdadjYd - 36._dp*(Trmd2YdadjYdYdadjYd) - 6._dp*(Trmd2YdadjYuYuadjYd) +& 
&  (12*g1p2*Trme2YeadjYe)/5._dp + 4*gpp2*Qep2*Trme2YeadjYe - 4*gpp2*QHdp2*Trme2YeadjYe + & 
&  4*gpp2*Qlp2*Trme2YeadjYe - 12._dp*(Trme2YeadjYeYeadjYe) + (12*g1p2*Trml2adjYeYe)/5._dp +& 
&  4*gpp2*Qep2*Trml2adjYeYe - 4*gpp2*QHdp2*Trml2adjYeYe + 4*gpp2*Qlp2*Trml2adjYeYe -     & 
&  12._dp*(Trml2adjYeYeadjYeYe) - (4*g1p2*Trmq2adjYdYd)/5._dp + 32*g3p2*Trmq2adjYdYd +   & 
&  12*gpp2*Qdp2*Trmq2adjYdYd - 12*gpp2*QHdp2*Trmq2adjYdYd + 12*gpp2*Qqp2*Trmq2adjYdYd -  & 
&  36._dp*(Trmq2adjYdYdadjYdYd) - 6._dp*(Trmq2adjYdYdadjYuYu) - 6*Abslam*Trmq2adjYuYu  
betamHd22 =  betamHd22- 6._dp*(Trmq2adjYuYuadjYdYd) - 6._dp*(Trmu2YuadjYdYdadjYu) - 6*Abslam*Trmu2YuadjYu -   & 
&  36._dp*(TrYdadjTdTdadjYd) - 6._dp*(TrYdadjTuTuadjYd) + 64*AbsM3*g3p2*TrYdadjYd -      & 
&  (4*g1p2*mHd2*TrYdadjYd)/5._dp + 32*g3p2*mHd2*TrYdadjYd + 12*gpp2*mHd2*Qdp2*TrYdadjYd -& 
&  12*gpp2*mHd2*QHdp2*TrYdadjYd + 12*gpp2*mHd2*Qqp2*TrYdadjYd - 36._dp*(TrYdadjYdTdadjTd) -& 
&  36*mHd2*TrYdadjYdYdadjYd - 6._dp*(TrYdadjYuTuadjTd) - 6*mHd2*TrYdadjYuYuadjYd -       & 
&  6*mHu2*TrYdadjYuYuadjYd - 12._dp*(TrYeadjTeTeadjYe) + (12*g1p2*mHd2*TrYeadjYe)/5._dp +& 
&  4*gpp2*mHd2*Qep2*TrYeadjYe - 4*gpp2*mHd2*QHdp2*TrYeadjYe + 4*gpp2*mHd2*Qlp2*TrYeadjYe -& 
&  12._dp*(TrYeadjYeTeadjTe) - 12*mHd2*TrYeadjYeYeadjYe - 2._dp*(TrYeCTvTpTvadjYe) -     & 
&  6._dp*(TrYuadjTdTdadjYu) - 6._dp*(TrYuadjYdTdadjTu) - 6*AbsTlam*TrYuadjYu -           & 
&  6*Abslam*mHd2*TrYuadjYu - 12*Abslam*mHu2*TrYuadjYu - 6*Abslam*ms2*TrYuadjYu -         & 
&  2*AbsTlam*TrYvadjYv - 2*Abslam*mHd2*TrYvadjYv - 4*Abslam*mHu2*TrYvadjYv -             & 
&  2*Abslam*ms2*TrYvadjYv - 2*Abslam*TrYvadjYvCml2 - 2._dp*(TrYvadjYvCml2TpYeCYe) -      & 
&  2._dp*(TrYvadjYvTpTeCTe) - 2._dp*(TrYvadjYvTpYeCme2CYe) - 2*mHd2*TrYvadjYvTpYeCYe -   & 
&  2*mHu2*TrYvadjYvTpYeCYe - 2._dp*(TrYvadjYvTpYeCYeCml2) - 2*Abslam*TrYvCmv2adjYv -     & 
&  2._dp*(TrYvCmv2adjYvTpYeCYe) + (g1p2*(621*g1p2*M1 + 90*g2p2*M1 + 45*g2p2*M2 -         & 
&  360*gpp2*M1*Qd*QHd - 180*gpp2*M4*Qd*QHd - 360*gpp2*M1*Qe*QHd - 180*gpp2*M4*Qe*QHd +   & 
&  240*gpp2*M1*QHdp2 + 120*gpp2*M4*QHdp2 - 120*gpp2*M1*QHd*QHu - 60*gpp2*M4*QHd*QHu +    & 
&  360*gpp2*M1*QHd*Ql + 180*gpp2*M4*QHd*Ql - 360*gpp2*M1*QHd*Qq - 180*gpp2*M4*QHd*Qq +   & 
&  720*gpp2*M1*QHd*Qu + 360*gpp2*M4*QHd*Qu + 20._dp*(TradjYdTd) - 60._dp*(TradjYeTe) -   & 
&  40*M1*TrYdadjYd + 120*M1*TrYeadjYe)*Conjg(M1))/25._dp - 32*g3p2*TradjYdTd*Conjg(M3) + & 
&  (9*g1p2*g2p2*M1*Conjg(M2))/5._dp + 12*g2p2*gpp2*M4*QHdp2*Conjg(M2) + 4*gpp2*M4*QHdp2*lam*Conjg(Tlam)  
betamHd22 =  betamHd22- 4*gpp2*M4*QHup2*lam*Conjg(Tlam) - 4*gpp2*M4*Qsp2*lam*Conjg(Tlam) - 6*TradjYuTu*lam*Conjg(Tlam) -& 
&  2*TradjYvTv*lam*Conjg(Tlam) + (4*gpp2*Conjg(M4)*(-9*g1p2*M1*Qd*QHd - 18*g1p2*M4*Qd*QHd -& 
&  9*g1p2*M1*Qe*QHd - 18*g1p2*M4*Qe*QHd + 6*g1p2*M1*QHdp2 + 12*g1p2*M4*QHdp2 +           & 
&  30*g2p2*M4*QHdp2 + 15*g2p2*M2*QHdp2 + 270*gpp2*M4*Qdp2*QHdp2 + 90*gpp2*M4*Qep2*QHdp2 +& 
&  120*gpp2*M4*QHdp4 - 3*g1p2*M1*QHd*QHu - 6*g1p2*M4*QHd*QHu + 60*gpp2*M4*QHdp2*QHup2 +  & 
&  9*g1p2*M1*QHd*Ql + 18*g1p2*M4*QHd*Ql + 180*gpp2*M4*QHdp2*Qlp2 - 9*g1p2*M1*QHd*Qq -    & 
&  18*g1p2*M4*QHd*Qq + 540*gpp2*M4*QHdp2*Qqp2 + 30*gpp2*M4*QHdp2*Qs1p2 + 30*gpp2*M4*QHdp2*Qs2p2 +& 
&  30*gpp2*M4*QHdp2*Qs3p2 + 30*gpp2*M4*QHdp2*Qsp2 + 18*g1p2*M1*QHd*Qu + 36*g1p2*M4*QHd*Qu +& 
&  270*gpp2*M4*QHdp2*Qup2 + 90*gpp2*M4*QHdp2*Qvp2 - 15*Qdp2*TradjYdTd + 15*QHdp2*TradjYdTd -& 
&  15*Qqp2*TradjYdTd - 5*Qep2*TradjYeTe + 5*QHdp2*TradjYeTe - 5*Qlp2*TradjYeTe +         & 
&  30*M4*(Qdp2 - QHdp2 + Qqp2)*TrYdadjYd + 10*M4*Qep2*TrYeadjYe - 10*M4*QHdp2*TrYeadjYe +& 
&  10*M4*Qlp2*TrYeadjYe - 5*(QHdp2 - QHup2 - Qsp2)*Conjg(lam)*(2*M4*lam - Tlam)))/5._dp -& 
&  6*TrCTuTpYu*Conjg(lam)*Tlam - 2*TrCTvTpYv*Conjg(lam)*Tlam + 6*g2p4*Tr2(2) +           & 
&  (6*g1p2*Tr2U1(1,1))/5._dp - 4*g1*gp*QHd*sqrt3ov5*Tr2U1(1,4) - 4*g1*gp*QHd*sqrt3ov5*Tr2U1(4,& 
& 1) + 8*gpp2*QHdp2*Tr2U1(4,4) - 4*g1*sqrt3ov5*Tr3(1) + 8*gp*QHd*Tr3(4)

 
DmHd2 = oo16pi2*( betamHd21 + oo16pi2 * betamHd22 ) 

 
Else 
DmHd2 = oo16pi2* betamHd21 
End If 
 
 
!-------------------- 
! mHu2 
!-------------------- 
 
betamHu21  = 2._dp*(AbsTlam) - (6*AbsM1*g1p2)/5._dp - 6*AbsM2*g2p2 + 2*Abslam*mHd2 +  & 
&  2*Abslam*mHu2 + 2*Abslam*ms2 - 8*AbsM4*gpp2*QHup2 + 6._dp*(TrCTuTpTu) +               & 
&  2._dp*(TrCTvTpTv) + 6._dp*(Trmq2adjYuYu) + 6._dp*(Trmu2YuadjYu) + 6*mHu2*TrYuadjYu +  & 
&  2*mHu2*TrYvadjYv + 2._dp*(TrYvadjYvCml2) + 2._dp*(TrYvCmv2adjYv) + g1*sqrt3ov5*Tr1(1) & 
&  + 2*gp*QHu*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betamHu22 = -24*Abslam*AbsTlam + (18*AbsM2*g1p2*g2p2)/5._dp + 33*AbsM2*g2p4 - 12*Clamp2*lamp2*mHd2 -& 
&  12*Clamp2*lamp2*mHu2 - 12*Clamp2*lamp2*ms2 + 4*AbsTlam*gpp2*QHdp2 + 4*Abslam*gpp2*mHd2*QHdp2 +& 
&  4*Abslam*gpp2*mHu2*QHdp2 + 4*Abslam*gpp2*ms2*QHdp2 - 4*AbsTlam*gpp2*QHup2 +           & 
&  24*AbsM2*g2p2*gpp2*QHup2 - 4*Abslam*gpp2*mHd2*QHup2 - 4*Abslam*gpp2*mHu2*QHup2 -      & 
&  4*Abslam*gpp2*ms2*QHup2 + 4*AbsTlam*gpp2*Qsp2 + 4*Abslam*gpp2*mHd2*Qsp2 +             & 
&  4*Abslam*gpp2*mHu2*Qsp2 + 4*Abslam*gpp2*ms2*Qsp2 - 2._dp*(TradjYeTeCTvTpYv) -         & 
&  2._dp*(TradjYvTpYeCTeTv) - 6*Abslam*TrCTdTpTd - 2*Abslam*TrCTeTpTe + (8*g1p2*TrCTuTpTu)/5._dp +& 
&  32*g3p2*TrCTuTpTu - 12*gpp2*QHup2*TrCTuTpTu + 12*gpp2*Qqp2*TrCTuTpTu + 12*gpp2*Qup2*TrCTuTpTu -& 
&  (8*g1p2*M1*TrCTuTpYu)/5._dp - 32*g3p2*M3*TrCTuTpYu + 12*gpp2*M4*QHup2*TrCTuTpYu -     & 
&  12*gpp2*M4*Qqp2*TrCTuTpYu - 12*gpp2*M4*Qup2*TrCTuTpYu - 4*gpp2*QHup2*TrCTvTpTv +      & 
&  4*gpp2*Qlp2*TrCTvTpTv + 4*gpp2*Qvp2*TrCTvTpTv + 4*gpp2*M4*QHup2*TrCTvTpYv -           & 
&  4*gpp2*M4*Qlp2*TrCTvTpYv - 4*gpp2*M4*Qvp2*TrCTvTpYv - 6*Abslam*Trmd2YdadjYd -         & 
&  6._dp*(Trmd2YdadjYuYuadjYd) - 2*Abslam*Trme2YeadjYe - 2*Abslam*Trml2adjYeYe -         & 
&  6*Abslam*Trmq2adjYdYd - 6._dp*(Trmq2adjYdYdadjYuYu) + (8*g1p2*Trmq2adjYuYu)/5._dp +   & 
&  32*g3p2*Trmq2adjYuYu - 12*gpp2*QHup2*Trmq2adjYuYu + 12*gpp2*Qqp2*Trmq2adjYuYu +       & 
&  12*gpp2*Qup2*Trmq2adjYuYu - 6._dp*(Trmq2adjYuYuadjYdYd) - 36._dp*(Trmq2adjYuYuadjYuYu) -& 
&  6._dp*(Trmu2YuadjYdYdadjYu) + (8*g1p2*Trmu2YuadjYu)/5._dp + 32*g3p2*Trmu2YuadjYu -    & 
&  12*gpp2*QHup2*Trmu2YuadjYu + 12*gpp2*Qqp2*Trmu2YuadjYu + 12*gpp2*Qup2*Trmu2YuadjYu -  & 
&  36._dp*(Trmu2YuadjYuYuadjYu) - 6._dp*(TrYdadjTuTuadjYd) - 6*AbsTlam*TrYdadjYd -       & 
&  12*Abslam*mHd2*TrYdadjYd - 6*Abslam*mHu2*TrYdadjYd - 6*Abslam*ms2*TrYdadjYd -         & 
&  6._dp*(TrYdadjYuTuadjTd) - 6*mHd2*TrYdadjYuYuadjYd - 6*mHu2*TrYdadjYuYuadjYd  
betamHu22 =  betamHu22- 2*AbsTlam*TrYeadjYe - 4*Abslam*mHd2*TrYeadjYe - 2*Abslam*mHu2*TrYeadjYe -             & 
&  2*Abslam*ms2*TrYeadjYe - 2._dp*(TrYeCTvTpTvadjYe) - 6._dp*(TrYuadjTdTdadjYu) -        & 
&  36._dp*(TrYuadjTuTuadjYu) - 6._dp*(TrYuadjYdTdadjTu) + 64*AbsM3*g3p2*TrYuadjYu +      & 
&  (8*g1p2*mHu2*TrYuadjYu)/5._dp + 32*g3p2*mHu2*TrYuadjYu - 12*gpp2*mHu2*QHup2*TrYuadjYu +& 
&  12*gpp2*mHu2*Qqp2*TrYuadjYu + 12*gpp2*mHu2*Qup2*TrYuadjYu - 36._dp*(TrYuadjYuTuadjTu) -& 
&  36*mHu2*TrYuadjYuYuadjYu - 12._dp*(TrYvadjTvTvadjYv) - 4*gpp2*mHu2*QHup2*TrYvadjYv +  & 
&  4*gpp2*mHu2*Qlp2*TrYvadjYv + 4*gpp2*mHu2*Qvp2*TrYvadjYv - 4*gpp2*QHup2*TrYvadjYvCml2 +& 
&  4*gpp2*Qlp2*TrYvadjYvCml2 + 4*gpp2*Qvp2*TrYvadjYvCml2 - 2._dp*(TrYvadjYvCml2TpYeCYe) -& 
&  6._dp*(TrYvadjYvCml2YvadjYv) - 2._dp*(TrYvadjYvTpTeCTe) - 2._dp*(TrYvadjYvTpYeCme2CYe) -& 
&  2*mHd2*TrYvadjYvTpYeCYe - 2*mHu2*TrYvadjYvTpYeCYe - 2._dp*(TrYvadjYvTpYeCYeCml2) -    & 
&  12._dp*(TrYvadjYvTvadjTv) - 12*mHu2*TrYvadjYvYvadjYv - 6._dp*(TrYvadjYvYvadjYvCml2) - & 
&  6._dp*(TrYvadjYvYvCmv2adjYv) - 4*gpp2*QHup2*TrYvCmv2adjYv + 4*gpp2*Qlp2*TrYvCmv2adjYv +& 
&  4*gpp2*Qvp2*TrYvCmv2adjYv - 2._dp*(TrYvCmv2adjYvTpYeCYe) - 6._dp*(TrYvCmv2adjYvYvadjYv) +& 
&  (g1p2*(621*g1p2*M1 + 45*g2p2*(2._dp*(M1) + M2) + 60*gpp2*(2._dp*(M1) + M4)*QHu*(3._dp*(Qd) +& 
&  3._dp*(Qe) - QHd + 2._dp*(QHu) - 3._dp*(Ql) + 3._dp*(Qq) - 6._dp*(Qu)) -              & 
&  40._dp*(TradjYuTu) + 80*M1*TrYuadjYu)*Conjg(M1))/25._dp - 32*g3p2*TradjYuTu*Conjg(M3) +& 
&  (9*g1p2*g2p2*M1*Conjg(M2))/5._dp + 12*g2p2*gpp2*M4*QHup2*Conjg(M2) - 4*gpp2*M4*QHdp2*lam*Conjg(Tlam) +& 
&  4*gpp2*M4*QHup2*lam*Conjg(Tlam) - 4*gpp2*M4*Qsp2*lam*Conjg(Tlam) - 6*TradjYdTd*lam*Conjg(Tlam) -& 
&  2*TradjYeTe*lam*Conjg(Tlam) + (4*gpp2*Conjg(M4)*(9*g1p2*M1*Qd*QHu + 18*g1p2*M4*Qd*QHu +& 
&  9*g1p2*M1*Qe*QHu + 18*g1p2*M4*Qe*QHu - 3*g1p2*M1*QHd*QHu - 6*g1p2*M4*QHd*QHu +        & 
&  6*g1p2*M1*QHup2 + 12*g1p2*M4*QHup2 + 30*g2p2*M4*QHup2 + 15*g2p2*M2*QHup2 +            & 
&  270*gpp2*M4*Qdp2*QHup2 + 90*gpp2*M4*Qep2*QHup2 + 60*gpp2*M4*QHdp2*QHup2 +             & 
&  120*gpp2*M4*QHup4 - 9*g1p2*M1*QHu*Ql - 18*g1p2*M4*QHu*Ql + 180*gpp2*M4*QHup2*Qlp2 +   & 
&  9*g1p2*M1*QHu*Qq + 18*g1p2*M4*QHu*Qq + 540*gpp2*M4*QHup2*Qqp2 + 30*gpp2*M4*QHup2*Qs1p2 +& 
&  30*gpp2*M4*QHup2*Qs2p2 + 30*gpp2*M4*QHup2*Qs3p2 + 30*gpp2*M4*QHup2*Qsp2 -             & 
&  18*g1p2*M1*QHu*Qu - 36*g1p2*M4*QHu*Qu + 270*gpp2*M4*QHup2*Qup2 + 90*gpp2*M4*QHup2*Qvp2 +& 
&  15*QHup2*TradjYuTu - 15*Qqp2*TradjYuTu - 15*Qup2*TradjYuTu + 5*QHup2*TradjYvTv -      & 
&  5*Qlp2*TradjYvTv - 5*Qvp2*TradjYvTv - 30*M4*(QHup2 - Qqp2 - Qup2)*TrYuadjYu -         & 
&  10*M4*QHup2*TrYvadjYv + 10*M4*Qlp2*TrYvadjYv + 10*M4*Qvp2*TrYvadjYv + 5*(QHdp2 -      & 
&  QHup2 + Qsp2)*Conjg(lam)*(2*M4*lam - Tlam)))/5._dp - 6*TrCTdTpYd*Conjg(lam)*Tlam  
betamHu22 =  betamHu22- 2*TrCTeTpYe*Conjg(lam)*Tlam + 6*g2p4*Tr2(2) + (6*g1p2*Tr2U1(1,1))/5._dp +             & 
&  4*g1*gp*QHu*sqrt3ov5*Tr2U1(1,4) + 4*g1*gp*QHu*sqrt3ov5*Tr2U1(4,1) + 8*gpp2*QHup2*Tr2U1(4,& 
& 4) + 4*g1*sqrt3ov5*Tr3(1) + 8*gp*QHu*Tr3(4)

 
DmHu2 = oo16pi2*( betamHu21 + oo16pi2 * betamHu22 ) 

 
Else 
DmHu2 = oo16pi2* betamHu21 
End If 
 
 
!-------------------- 
! md2 
!-------------------- 
 
betamd21  = (-8*AbsM1*g1p2*id3R)/15._dp - (32*AbsM3*g3p2*id3R)/3._dp + 2._dp*(md2YdadjYd)& 
&  - 8*AbsM4*gpp2*id3R*Qdp2 + 4._dp*(TdadjTd) + 4*mHd2*YdadjYd + 2._dp*(YdadjYdmd2)      & 
&  + 4._dp*(Ydmq2adjYd) + 2*g1*id3R*ooSqrt15*Tr1(1) + 2*gp*id3R*Qd*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betamd22 = -2*Abslam*md2YdadjYd + (2*g1p2*md2YdadjYd)/5._dp + 6*g2p2*md2YdadjYd - 2._dp*(md2YdadjYdYdadjYd) -& 
&  2._dp*(md2YdadjYuYuadjYd) + (176*AbsM4*g1p2*gpp2*id3R*Qdp2)/15._dp + (128*AbsM4*g3p2*gpp2*id3R*Qdp2)/3._dp -& 
&  4*gpp2*md2YdadjYd*Qdp2 + 264*AbsM4*gpp4*id3R*Qdp4 + (48*AbsM4*g1p2*gpp2*id3R*Qd*Qe)/5._dp +& 
&  72*AbsM4*gpp4*id3R*Qdp2*Qep2 - (16*AbsM4*g1p2*gpp2*id3R*Qd*QHd)/5._dp +               & 
&  4*gpp2*md2YdadjYd*QHdp2 + 48*AbsM4*gpp4*id3R*Qdp2*QHdp2 + (16*AbsM4*g1p2*gpp2*id3R*Qd*QHu)/5._dp +& 
&  48*AbsM4*gpp4*id3R*Qdp2*QHup2 - (48*AbsM4*g1p2*gpp2*id3R*Qd*Ql)/5._dp +               & 
&  144*AbsM4*gpp4*id3R*Qdp2*Qlp2 + (48*AbsM4*g1p2*gpp2*id3R*Qd*Qq)/5._dp +               & 
&  4*gpp2*md2YdadjYd*Qqp2 + 432*AbsM4*gpp4*id3R*Qdp2*Qqp2 + 24*AbsM4*gpp4*id3R*Qdp2*Qs1p2 +& 
&  24*AbsM4*gpp4*id3R*Qdp2*Qs2p2 + 24*AbsM4*gpp4*id3R*Qdp2*Qs3p2 + 24*AbsM4*gpp4*id3R*Qdp2*Qsp2 -& 
&  (96*AbsM4*g1p2*gpp2*id3R*Qd*Qu)/5._dp + 216*AbsM4*gpp4*id3R*Qdp2*Qup2 +               & 
&  72*AbsM4*gpp4*id3R*Qdp2*Qvp2 - 4*Abslam*TdadjTd + (4*g1p2*TdadjTd)/5._dp +            & 
&  12*g2p2*TdadjTd - 8*gpp2*Qdp2*TdadjTd + 8*gpp2*QHdp2*TdadjTd + 8*gpp2*Qqp2*TdadjTd -  & 
&  4._dp*(TdadjTdYdadjYd) - 4._dp*(TdadjTuYuadjYd) - 4._dp*(TdadjYdYdadjTd) -            & 
&  4._dp*(TdadjYuYuadjTd) - 12*TdadjYd*TrCTdTpYd - 4*TdadjYd*TrCTeTpYe - 6*md2YdadjYd*TrYdadjYd -& 
&  12*TdadjTd*TrYdadjYd - 2*md2YdadjYd*TrYeadjYe - 4*TdadjTd*TrYeadjYe - (4*g1p2*M1*YdadjTd)/5._dp -& 
&  12*g2p2*M2*YdadjTd + 8*gpp2*M4*Qdp2*YdadjTd - 8*gpp2*M4*QHdp2*YdadjTd -               & 
&  8*gpp2*M4*Qqp2*YdadjTd - 12*TradjYdTd*YdadjTd - 4*TradjYeTe*YdadjTd - 4._dp*(YdadjTdTdadjYd) -& 
&  4._dp*(YdadjTuTuadjYd) - 4*AbsTlam*YdadjYd + 24*AbsM2*g2p2*YdadjYd - 8*Abslam*mHd2*YdadjYd +& 
&  (4*g1p2*mHd2*YdadjYd)/5._dp + 12*g2p2*mHd2*YdadjYd - 4*Abslam*mHu2*YdadjYd -          & 
&  4*Abslam*ms2*YdadjYd - 16*AbsM4*gpp2*Qdp2*YdadjYd - 8*gpp2*mHd2*Qdp2*YdadjYd +        & 
&  16*AbsM4*gpp2*QHdp2*YdadjYd + 8*gpp2*mHd2*QHdp2*YdadjYd + 16*AbsM4*gpp2*Qqp2*YdadjYd  
betamd22 =  betamd22+ 8*gpp2*mHd2*Qqp2*YdadjYd - 12*TrCTdTpTd*YdadjYd - 4*TrCTeTpTe*YdadjYd -               & 
&  12*Trmd2YdadjYd*YdadjYd - 4*Trme2YeadjYe*YdadjYd - 4*Trml2adjYeYe*YdadjYd -           & 
&  12*Trmq2adjYdYd*YdadjYd - 24*mHd2*TrYdadjYd*YdadjYd - 8*mHd2*TrYeadjYe*YdadjYd -      & 
&  2*Abslam*YdadjYdmd2 + (2*g1p2*YdadjYdmd2)/5._dp + 6*g2p2*YdadjYdmd2 - 4*gpp2*Qdp2*YdadjYdmd2 +& 
&  4*gpp2*QHdp2*YdadjYdmd2 + 4*gpp2*Qqp2*YdadjYdmd2 - 6*TrYdadjYd*YdadjYdmd2 -           & 
&  2*TrYeadjYe*YdadjYdmd2 - 4._dp*(YdadjYdmd2YdadjYd) - 4._dp*(YdadjYdTdadjTd) -         & 
&  8*mHd2*YdadjYdYdadjYd - 2._dp*(YdadjYdYdadjYdmd2) - 4._dp*(YdadjYdYdmq2adjYd) -       & 
&  4._dp*(YdadjYumu2YuadjYd) - 4._dp*(YdadjYuTuadjTd) - 4*mHd2*YdadjYuYuadjYd -          & 
&  4*mHu2*YdadjYuYuadjYd - 2._dp*(YdadjYuYuadjYdmd2) - 4._dp*(YdadjYuYumq2adjYd) -       & 
&  4*Abslam*Ydmq2adjYd + (4*g1p2*Ydmq2adjYd)/5._dp + 12*g2p2*Ydmq2adjYd - 8*gpp2*Qdp2*Ydmq2adjYd +& 
&  8*gpp2*QHdp2*Ydmq2adjYd + 8*gpp2*Qqp2*Ydmq2adjYd - 12*TrYdadjYd*Ydmq2adjYd -          & 
&  4*TrYeadjYe*Ydmq2adjYd - 4._dp*(Ydmq2adjYdYdadjYd) - 4._dp*(Ydmq2adjYuYuadjYd) +      & 
&  (4*g1p2*(2*id3R*(303*g1p2*M1 + 40*g3p2*(2._dp*(M1) + M3) + 15*gpp2*(2._dp*(M1) +      & 
&  M4)*Qd*(11._dp*(Qd) + 3*(3._dp*(Qe) - QHd + QHu - 3._dp*(Ql) + 3._dp*(Qq) -           & 
&  6._dp*(Qu)))) - 45._dp*(TdadjYd) + 90*M1*YdadjYd)*Conjg(M1))/225._dp - (64*g3p2*id3R*(30*g3p2*M3 -& 
&  g1p2*(M1 + 2._dp*(M3)) - 15*gpp2*(2._dp*(M3) + M4)*Qdp2)*Conjg(M3))/45._dp +          & 
&  (88*g1p2*gpp2*id3R*M1*Qdp2*Conjg(M4))/15._dp + (64*g3p2*gpp2*id3R*M3*Qdp2*Conjg(M4))/3._dp +& 
&  (24*g1p2*gpp2*id3R*M1*Qd*Qe*Conjg(M4))/5._dp - (8*g1p2*gpp2*id3R*M1*Qd*QHd*Conjg(M4))/5._dp +& 
&  (8*g1p2*gpp2*id3R*M1*Qd*QHu*Conjg(M4))/5._dp - (24*g1p2*gpp2*id3R*M1*Qd*Ql*Conjg(M4))/5._dp +& 
&  (24*g1p2*gpp2*id3R*M1*Qd*Qq*Conjg(M4))/5._dp - (48*g1p2*gpp2*id3R*M1*Qd*Qu*Conjg(M4))/5._dp +& 
&  8*gpp2*Qdp2*TdadjYd*Conjg(M4) - 8*gpp2*QHdp2*TdadjYd*Conjg(M4) - 8*gpp2*Qqp2*TdadjYd*Conjg(M4)  
betamd22 =  betamd22- 12*g2p2*TdadjYd*Conjg(M2) - 4*TdadjYd*lam*Conjg(Tlam) - 4*YdadjTd*Conjg(lam)*Tlam +   & 
&  (32*g3p4*id3R*Tr2(3))/3._dp + (8*g1p2*id3R*Tr2U1(1,1))/15._dp + 8*g1*gp*id3R*ooSqrt15*Qd*Tr2U1(1,& 
& 4) + 8*g1*gp*id3R*ooSqrt15*Qd*Tr2U1(4,1) + 8*gpp2*id3R*Qdp2*Tr2U1(4,4) +               & 
&  8*g1*id3R*ooSqrt15*Tr3(1) + 8*gp*id3R*Qd*Tr3(4)

 
Dmd2 = oo16pi2*( betamd21 + oo16pi2 * betamd22 ) 

 
Else 
Dmd2 = oo16pi2* betamd21 
End If 
 
 
Call Chop(Dmd2) 

Forall(i1=1:3) Dmd2(i1,i1) =  Real(Dmd2(i1,i1),dp) 
Dmd2 = 0.5_dp*(Dmd2+ Conjg(Transpose(Dmd2)) ) 
!-------------------- 
! mu2 
!-------------------- 
 
betamu21  = (-32*AbsM1*g1p2*id3R)/15._dp - (32*AbsM3*g3p2*id3R)/3._dp +               & 
&  2._dp*(mu2YuadjYu) - 8*AbsM4*gpp2*id3R*Qup2 + 4._dp*(TuadjTu) + 4*mHu2*YuadjYu +      & 
&  2._dp*(YuadjYumu2) + 4._dp*(Yumq2adjYu) - 4*g1*id3R*ooSqrt15*Tr1(1) + 2*gp*id3R*Qu*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betamu22 = -2._dp*(mu2YuadjYdYdadjYu) - 2*Abslam*mu2YuadjYu - (2*g1p2*mu2YuadjYu)/5._dp +        & 
&  6*g2p2*mu2YuadjYu - 2._dp*(mu2YuadjYuYuadjYu) + 4*gpp2*mu2YuadjYu*QHup2 +             & 
&  4*gpp2*mu2YuadjYu*Qqp2 - (96*AbsM4*g1p2*gpp2*id3R*Qd*Qu)/5._dp - (96*AbsM4*g1p2*gpp2*id3R*Qe*Qu)/5._dp +& 
&  (32*AbsM4*g1p2*gpp2*id3R*QHd*Qu)/5._dp - (32*AbsM4*g1p2*gpp2*id3R*QHu*Qu)/5._dp +     & 
&  (96*AbsM4*g1p2*gpp2*id3R*Ql*Qu)/5._dp - (96*AbsM4*g1p2*gpp2*id3R*Qq*Qu)/5._dp +       & 
&  (704*AbsM4*g1p2*gpp2*id3R*Qup2)/15._dp + (128*AbsM4*g3p2*gpp2*id3R*Qup2)/3._dp -      & 
&  4*gpp2*mu2YuadjYu*Qup2 + 216*AbsM4*gpp4*id3R*Qdp2*Qup2 + 72*AbsM4*gpp4*id3R*Qep2*Qup2 +& 
&  48*AbsM4*gpp4*id3R*QHdp2*Qup2 + 48*AbsM4*gpp4*id3R*QHup2*Qup2 + 144*AbsM4*gpp4*id3R*Qlp2*Qup2 +& 
&  432*AbsM4*gpp4*id3R*Qqp2*Qup2 + 24*AbsM4*gpp4*id3R*Qs1p2*Qup2 + 24*AbsM4*gpp4*id3R*Qs2p2*Qup2 +& 
&  24*AbsM4*gpp4*id3R*Qs3p2*Qup2 + 24*AbsM4*gpp4*id3R*Qsp2*Qup2 + 264*AbsM4*gpp4*id3R*Qup4 +& 
&  72*AbsM4*gpp4*id3R*Qup2*Qvp2 - 6*mu2YuadjYu*TrYuadjYu - 2*mu2YuadjYu*TrYvadjYv -      & 
&  4._dp*(TuadjTdYdadjYu) - 4*Abslam*TuadjTu - (4*g1p2*TuadjTu)/5._dp + 12*g2p2*TuadjTu +& 
&  8*gpp2*QHup2*TuadjTu + 8*gpp2*Qqp2*TuadjTu - 8*gpp2*Qup2*TuadjTu - 12*TrYuadjYu*TuadjTu -& 
&  4*TrYvadjYv*TuadjTu - 4._dp*(TuadjTuYuadjYu) - 4._dp*(TuadjYdYdadjTu) -               & 
&  12*TrCTuTpYu*TuadjYu - 4*TrCTvTpYv*TuadjYu - 4._dp*(TuadjYuYuadjTu) - 4._dp*(YuadjTdTdadjYu) +& 
&  (4*g1p2*M1*YuadjTu)/5._dp - 12*g2p2*M2*YuadjTu - 8*gpp2*M4*QHup2*YuadjTu -            & 
&  8*gpp2*M4*Qqp2*YuadjTu + 8*gpp2*M4*Qup2*YuadjTu - 12*TradjYuTu*YuadjTu -              & 
&  4*TradjYvTv*YuadjTu - 4._dp*(YuadjTuTuadjYu) - 4._dp*(YuadjYdmd2YdadjYu) -            & 
&  4._dp*(YuadjYdTdadjTu) - 4*mHd2*YuadjYdYdadjYu - 4*mHu2*YuadjYdYdadjYu -              & 
&  2._dp*(YuadjYdYdadjYumu2) - 4._dp*(YuadjYdYdmq2adjYu) - 4*AbsTlam*YuadjYu +           & 
&  24*AbsM2*g2p2*YuadjYu - 4*Abslam*mHd2*YuadjYu - 8*Abslam*mHu2*YuadjYu  
betamu22 =  betamu22- (4*g1p2*mHu2*YuadjYu)/5._dp + 12*g2p2*mHu2*YuadjYu - 4*Abslam*ms2*YuadjYu +           & 
&  16*AbsM4*gpp2*QHup2*YuadjYu + 8*gpp2*mHu2*QHup2*YuadjYu + 16*AbsM4*gpp2*Qqp2*YuadjYu +& 
&  8*gpp2*mHu2*Qqp2*YuadjYu - 16*AbsM4*gpp2*Qup2*YuadjYu - 8*gpp2*mHu2*Qup2*YuadjYu -    & 
&  12*TrCTuTpTu*YuadjYu - 4*TrCTvTpTv*YuadjYu - 12*Trmq2adjYuYu*YuadjYu - 12*Trmu2YuadjYu*YuadjYu -& 
&  24*mHu2*TrYuadjYu*YuadjYu - 8*mHu2*TrYvadjYv*YuadjYu - 4*TrYvadjYvCml2*YuadjYu -      & 
&  4*TrYvCmv2adjYv*YuadjYu - 2*Abslam*YuadjYumu2 - (2*g1p2*YuadjYumu2)/5._dp +           & 
&  6*g2p2*YuadjYumu2 + 4*gpp2*QHup2*YuadjYumu2 + 4*gpp2*Qqp2*YuadjYumu2 - 4*gpp2*Qup2*YuadjYumu2 -& 
&  6*TrYuadjYu*YuadjYumu2 - 2*TrYvadjYv*YuadjYumu2 - 4._dp*(YuadjYumu2YuadjYu) -         & 
&  4._dp*(YuadjYuTuadjTu) - 8*mHu2*YuadjYuYuadjYu - 2._dp*(YuadjYuYuadjYumu2) -          & 
&  4._dp*(YuadjYuYumq2adjYu) - 4._dp*(Yumq2adjYdYdadjYu) - 4*Abslam*Yumq2adjYu -         & 
&  (4*g1p2*Yumq2adjYu)/5._dp + 12*g2p2*Yumq2adjYu + 8*gpp2*QHup2*Yumq2adjYu +            & 
&  8*gpp2*Qqp2*Yumq2adjYu - 8*gpp2*Qup2*Yumq2adjYu - 12*TrYuadjYu*Yumq2adjYu -           & 
&  4*TrYvadjYv*Yumq2adjYu - 4._dp*(Yumq2adjYuYuadjYu) + (4*g1p2*(4*id3R*(642*g1p2*M1 +   & 
&  80*g3p2*(2._dp*(M1) + M3) - 15*gpp2*(2._dp*(M1) + M4)*(9._dp*(Qd) + 9._dp*(Qe) -      & 
&  3._dp*(QHd) + 3._dp*(QHu) - 9._dp*(Ql) + 9._dp*(Qq) - 22._dp*(Qu))*Qu) +              & 
&  45*(TuadjYu - 2*M1*YuadjYu))*Conjg(M1))/225._dp - (64*g3p2*id3R*(30*g3p2*M3 -         & 
&  4*g1p2*(M1 + 2._dp*(M3)) - 15*gpp2*(2._dp*(M3) + M4)*Qup2)*Conjg(M3))/45._dp -        & 
&  (48*g1p2*gpp2*id3R*M1*Qd*Qu*Conjg(M4))/5._dp - (48*g1p2*gpp2*id3R*M1*Qe*Qu*Conjg(M4))/5._dp +& 
&  (16*g1p2*gpp2*id3R*M1*QHd*Qu*Conjg(M4))/5._dp - (16*g1p2*gpp2*id3R*M1*QHu*Qu*Conjg(M4))/5._dp +& 
&  (48*g1p2*gpp2*id3R*M1*Ql*Qu*Conjg(M4))/5._dp - (48*g1p2*gpp2*id3R*M1*Qq*Qu*Conjg(M4))/5._dp +& 
&  (352*g1p2*gpp2*id3R*M1*Qup2*Conjg(M4))/15._dp + (64*g3p2*gpp2*id3R*M3*Qup2*Conjg(M4))/3._dp  
betamu22 =  betamu22- 8*gpp2*QHup2*TuadjYu*Conjg(M4) - 8*gpp2*Qqp2*TuadjYu*Conjg(M4) + 8*gpp2*Qup2*TuadjYu*Conjg(M4) -& 
&  12*g2p2*TuadjYu*Conjg(M2) - 4*TuadjYu*lam*Conjg(Tlam) - 4*YuadjTu*Conjg(lam)*Tlam +   & 
&  (32*g3p4*id3R*Tr2(3))/3._dp + (32*g1p2*id3R*Tr2U1(1,1))/15._dp - 16*g1*gp*id3R*ooSqrt15*Qu*Tr2U1(1,& 
& 4) - 16*g1*gp*id3R*ooSqrt15*Qu*Tr2U1(4,1) + 8*gpp2*id3R*Qup2*Tr2U1(4,4) -              & 
&  16*g1*id3R*ooSqrt15*Tr3(1) + 8*gp*id3R*Qu*Tr3(4)

 
Dmu2 = oo16pi2*( betamu21 + oo16pi2 * betamu22 ) 

 
Else 
Dmu2 = oo16pi2* betamu21 
End If 
 
 
Call Chop(Dmu2) 

Forall(i1=1:3) Dmu2(i1,i1) =  Real(Dmu2(i1,i1),dp) 
Dmu2 = 0.5_dp*(Dmu2+ Conjg(Transpose(Dmu2)) ) 
!-------------------- 
! me2 
!-------------------- 
 
betame21  = (-24*AbsM1*g1p2*id3R)/5._dp + 2._dp*(me2YeadjYe) - 8*AbsM4*gpp2*id3R*Qep2 +& 
&  4._dp*(TeadjTe) + 4*mHd2*YeadjYe + 2._dp*(YeadjYeme2) + 4._dp*(Yeml2adjYe)            & 
&  + 2*g1*id3R*sqrt3ov5*Tr1(1) + 2*gp*id3R*Qe*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betame22 = -2*Abslam*me2YeadjYe - (6*g1p2*me2YeadjYe)/5._dp + 6*g2p2*me2YeadjYe - 2._dp*(me2YeadjYeYeadjYe) -& 
&  2._dp*(me2YeCYvTpYvadjYe) - 4*gpp2*me2YeadjYe*Qep2 + 4*gpp2*me2YeadjYe*QHdp2 +        & 
&  4*gpp2*me2YeadjYe*Qlp2 - 4*Abslam*TeadjTe - (12*g1p2*TeadjTe)/5._dp + 12*g2p2*TeadjTe -& 
&  8*gpp2*Qep2*TeadjTe + 8*gpp2*QHdp2*TeadjTe + 8*gpp2*Qlp2*TeadjTe - 4._dp*(TeadjTeYeadjYe) -& 
&  4._dp*(TeadjYeYeadjTe) - 4._dp*(TeCTvTpYvadjYe) - 4._dp*(TeCYvTpYvadjTe) -            & 
&  12*TeadjYe*TrCTdTpYd - 4*TeadjYe*TrCTeTpYe - 6*me2YeadjYe*TrYdadjYd - 12*TeadjTe*TrYdadjYd -& 
&  2*me2YeadjYe*TrYeadjYe - 4*TeadjTe*TrYeadjYe + (12*g1p2*M1*YeadjTe)/5._dp -           & 
&  12*g2p2*M2*YeadjTe + 8*gpp2*M4*Qep2*YeadjTe - 8*gpp2*M4*QHdp2*YeadjTe -               & 
&  8*gpp2*M4*Qlp2*YeadjTe - 12*TradjYdTd*YeadjTe - 4*TradjYeTe*YeadjTe - 4._dp*(YeadjTeTeadjYe) -& 
&  4*AbsTlam*YeadjYe + 24*AbsM2*g2p2*YeadjYe - 8*Abslam*mHd2*YeadjYe - (12*g1p2*mHd2*YeadjYe)/5._dp +& 
&  12*g2p2*mHd2*YeadjYe - 4*Abslam*mHu2*YeadjYe - 4*Abslam*ms2*YeadjYe - 8*gpp2*mHd2*Qep2*YeadjYe +& 
&  8*gpp2*mHd2*QHdp2*YeadjYe + 8*gpp2*mHd2*Qlp2*YeadjYe - 12*TrCTdTpTd*YeadjYe -         & 
&  4*TrCTeTpTe*YeadjYe - 12*Trmd2YdadjYd*YeadjYe - 4*Trme2YeadjYe*YeadjYe -              & 
&  4*Trml2adjYeYe*YeadjYe - 12*Trmq2adjYdYd*YeadjYe - 24*mHd2*TrYdadjYd*YeadjYe -        & 
&  8*mHd2*TrYeadjYe*YeadjYe - 2*Abslam*YeadjYeme2 - (6*g1p2*YeadjYeme2)/5._dp +          & 
&  6*g2p2*YeadjYeme2 - 4*gpp2*Qep2*YeadjYeme2 + 4*gpp2*QHdp2*YeadjYeme2 + 4*gpp2*Qlp2*YeadjYeme2 -& 
&  6*TrYdadjYd*YeadjYeme2 - 2*TrYeadjYe*YeadjYeme2 - 4._dp*(YeadjYeme2YeadjYe) -         & 
&  4._dp*(YeadjYeTeadjTe) - 8*mHd2*YeadjYeYeadjYe - 2._dp*(YeadjYeYeadjYeme2) -          & 
&  4._dp*(YeadjYeYeml2adjYe) - 4._dp*(YeCTvTpTvadjYe) - 4._dp*(YeCYvmv2TpYvadjYe) -      & 
&  4._dp*(YeCYvTpTvadjTe) - 4*mHd2*YeCYvTpYvadjYe - 4*mHu2*YeCYvTpYvadjYe -              & 
&  2._dp*(YeCYvTpYvadjYeme2) - 4._dp*(YeCYvTpYvml2adjYe) - 4*Abslam*Yeml2adjYe  
betame22 =  betame22- (12*g1p2*Yeml2adjYe)/5._dp + 12*g2p2*Yeml2adjYe - 8*gpp2*Qep2*Yeml2adjYe +            & 
&  8*gpp2*QHdp2*Yeml2adjYe + 8*gpp2*Qlp2*Yeml2adjYe - 12*TrYdadjYd*Yeml2adjYe -          & 
&  4*TrYeadjYe*Yeml2adjYe - 4._dp*(Yeml2adjYeYeadjYe) - 4._dp*(Yeml2CYvTpYvadjYe) +      & 
&  (12*g1p2*(2*id3R*(117*g1p2*M1 + 5*gpp2*(2._dp*(M1) + M4)*Qe*(3._dp*(Qd) +             & 
&  5._dp*(Qe) - QHd + QHu - 3._dp*(Ql) + 3._dp*(Qq) - 6._dp*(Qu))) + 5*(TeadjYe -        & 
&  2*M1*YeadjYe))*Conjg(M1))/25._dp + (8*gpp2*(3*id3R*Qe*(g1p2*(M1 + 2._dp*(M4))*(3._dp*(Qd) +& 
&  5._dp*(Qe) - QHd + QHu - 3._dp*(Ql) + 3._dp*(Qq) - 6._dp*(Qu)) + 5*gpp2*M4*Qe*(9._dp*(Qdp2) +& 
&  5._dp*(Qep2) + 2._dp*(QHdp2) + 2._dp*(QHup2) + 6._dp*(Qlp2) + 18._dp*(Qqp2) +         & 
&  Qs1p2 + Qs2p2 + Qs3p2 + Qsp2 + 9._dp*(Qup2) + 3._dp*(Qvp2))) - 5*(Qep2 -              & 
&  QHdp2 - Qlp2)*(-1._dp*(TeadjYe) + 2*M4*YeadjYe))*Conjg(M4))/5._dp - 12*g2p2*TeadjYe*Conjg(M2) -& 
&  4*TeadjYe*lam*Conjg(Tlam) - 4*YeadjTe*Conjg(lam)*Tlam + (24*g1p2*id3R*Tr2U1(1,        & 
& 1))/5._dp + 8*g1*gp*id3R*Qe*sqrt3ov5*Tr2U1(1,4) + 8*g1*gp*id3R*Qe*sqrt3ov5*Tr2U1(4,    & 
& 1) + 8*gpp2*id3R*Qep2*Tr2U1(4,4) + 8*g1*id3R*sqrt3ov5*Tr3(1) + 8*gp*id3R*Qe*Tr3(4)

 
Dme2 = oo16pi2*( betame21 + oo16pi2 * betame22 ) 

 
Else 
Dme2 = oo16pi2* betame21 
End If 
 
 
Call Chop(Dme2) 

Forall(i1=1:3) Dme2(i1,i1) =  Real(Dme2(i1,i1),dp) 
Dme2 = 0.5_dp*(Dme2+ Conjg(Transpose(Dme2)) ) 
!-------------------- 
! ms2 
!-------------------- 
 
betams21  = 4._dp*(AbsTlam) + 4*Abslam*(mHd2 + mHu2 + ms2) - 8*AbsM4*gpp2*Qsp2 +      & 
&  2*gp*Qs*Tr1(4)

 
 
If (TwoLoopRGE) Then 
betams22 = (12*AbsTlam*g1p2)/5._dp + 12*AbsTlam*g2p2 - 16*Clamp2*lamp2*(mHd2 + mHu2 +            & 
&  ms2) + 8*AbsTlam*gpp2*QHdp2 + 8*AbsTlam*gpp2*QHup2 - 8*AbsTlam*gpp2*Qsp2 -            & 
&  12*AbsTlam*TrYdadjYd - 4*AbsTlam*TrYeadjYe - 12*AbsTlam*TrYuadjYu - 4*AbsTlam*TrYvadjYv -& 
&  (12*g1p2*M1*lam*Conjg(Tlam))/5._dp - 12*g2p2*M2*lam*Conjg(Tlam) - 8*gpp2*M4*QHdp2*lam*Conjg(Tlam) -& 
&  8*gpp2*M4*QHup2*lam*Conjg(Tlam) + 8*gpp2*M4*Qsp2*lam*Conjg(Tlam) - 12*TradjYdTd*lam*Conjg(Tlam) -& 
&  4*TradjYeTe*lam*Conjg(Tlam) - 12*TradjYuTu*lam*Conjg(Tlam) - 4*TradjYvTv*lam*Conjg(Tlam) +& 
&  8*Conjg(M4)*(3*gpp4*M4*Qsp2*(9._dp*(Qdp2) + 3._dp*(Qep2) + 2._dp*(QHdp2) +            & 
&  2._dp*(QHup2) + 6._dp*(Qlp2) + 18._dp*(Qqp2) + Qs1p2 + Qs2p2 + Qs3p2 + 3._dp*(Qsp2) + & 
&  9._dp*(Qup2) + 3._dp*(Qvp2)) + gpp2*(QHdp2 + QHup2 - Qsp2)*Conjg(lam)*(2*M4*lam -     & 
&  Tlam)) + (4*Conjg(lam)*(-40*AbsTlam*lam + 3*g1p2*mHd2*lam + 15*g2p2*mHd2*lam +        & 
&  3*g1p2*mHu2*lam + 15*g2p2*mHu2*lam + 3*g1p2*ms2*lam + 15*g2p2*ms2*lam +               & 
&  10*gpp2*mHd2*QHdp2*lam + 10*gpp2*mHu2*QHdp2*lam + 10*gpp2*ms2*QHdp2*lam +             & 
&  10*gpp2*mHd2*QHup2*lam + 10*gpp2*mHu2*QHup2*lam + 10*gpp2*ms2*QHup2*lam -             & 
&  10*gpp2*mHd2*Qsp2*lam - 10*gpp2*mHu2*Qsp2*lam - 10*gpp2*ms2*Qsp2*lam - 15*TrCTdTpTd*lam -& 
&  5*TrCTeTpTe*lam - 15*TrCTuTpTu*lam - 5*TrCTvTpTv*lam - 15*Trmd2YdadjYd*lam -          & 
&  5*Trme2YeadjYe*lam - 5*Trml2adjYeYe*lam - 15*Trmq2adjYdYd*lam - 15*Trmq2adjYuYu*lam - & 
&  15*Trmu2YuadjYu*lam - 30*mHd2*TrYdadjYd*lam - 15*mHu2*TrYdadjYd*lam - 15*ms2*TrYdadjYd*lam -& 
&  10*mHd2*TrYeadjYe*lam - 5*mHu2*TrYeadjYe*lam - 5*ms2*TrYeadjYe*lam - 15*mHd2*TrYuadjYu*lam -& 
&  30*mHu2*TrYuadjYu*lam - 15*ms2*TrYuadjYu*lam - 5*mHd2*TrYvadjYv*lam - 10*mHu2*TrYvadjYv*lam -& 
&  5*ms2*TrYvadjYv*lam - 5*TrYvadjYvCml2*lam - 5*TrYvCmv2adjYv*lam + 3*g1p2*Conjg(M1)*(2*M1*lam -& 
&  Tlam) + 15*g2p2*Conjg(M2)*(2*M2*lam - Tlam) - 15*TrCTdTpYd*Tlam - 5*TrCTeTpYe*Tlam -  & 
&  15*TrCTuTpYu*Tlam - 5*TrCTvTpYv*Tlam))/5._dp + 8*gpp2*Qsp2*Tr2U1(4,4)  
betams22 =  betams22+ 8*gp*Qs*Tr3(4)

 
Dms2 = oo16pi2*( betams21 + oo16pi2 * betams22 ) 

 
Else 
Dms2 = oo16pi2* betams21 
End If 
 
 
!-------------------- 
! ms12 
!-------------------- 
 
betams121  = (2*(AbsTk + Abskap*(ms12 + ms22 + ms32) - 36*AbsM4*gpp2*Qs1p2 +          & 
&  9*gp*Qs1*Tr1(4)))/9._dp

 
 
If (TwoLoopRGE) Then 
betams122 = (4*(-2*Ckapp2*kapp2*(ms12 + ms22 + ms32) + Abskap*(-4._dp*(AbsTk) - 9*gpp2*(ms12 +    & 
&  ms22 + ms32)*(Qs1p2 - Qs2p2 - Qs3p2)) + 9*Conjg(M4)*(54*gpp4*M4*Qs1p2*(9._dp*(Qdp2) + & 
&  3._dp*(Qep2) + 2._dp*(QHdp2) + 2._dp*(QHup2) + 6._dp*(Qlp2) + 18._dp*(Qqp2) +         & 
&  3._dp*(Qs1p2) + Qs2p2 + Qs3p2 + Qsp2 + 9._dp*(Qup2) + 3._dp*(Qvp2)) - gpp2*(Qs1p2 -   & 
&  Qs2p2 - Qs3p2)*Conjg(kap)*(2*M4*kap - Tk)) + 9*gp*(gp*(Qs1p2 - Qs2p2 - Qs3p2)*Conjg(Tk)*(M4*kap -& 
&  Tk) + 18*Qs1*(gp*Qs1*Tr2U1(4,4) + Tr3(4)))))/81._dp

 
Dms12 = oo16pi2*( betams121 + oo16pi2 * betams122 ) 

 
Else 
Dms12 = oo16pi2* betams121 
End If 
 
 
!-------------------- 
! ms22 
!-------------------- 
 
betams221  = (2*(AbsTk + Abskap*(ms12 + ms22 + ms32) - 36*AbsM4*gpp2*Qs2p2 +          & 
&  9*gp*Qs2*Tr1(4)))/9._dp

 
 
If (TwoLoopRGE) Then 
betams222 = (4*(-2*Ckapp2*kapp2*(ms12 + ms22 + ms32) + Abskap*(-4._dp*(AbsTk) + 9*gpp2*(ms12 +    & 
&  ms22 + ms32)*(Qs1p2 - Qs2p2 + Qs3p2)) + 9*Conjg(M4)*(54*gpp4*M4*Qs2p2*(9._dp*(Qdp2) + & 
&  3._dp*(Qep2) + 2._dp*(QHdp2) + 2._dp*(QHup2) + 6._dp*(Qlp2) + 18._dp*(Qqp2) +         & 
&  Qs1p2 + 3._dp*(Qs2p2) + Qs3p2 + Qsp2 + 9._dp*(Qup2) + 3._dp*(Qvp2)) + gpp2*(Qs1p2 -   & 
&  Qs2p2 + Qs3p2)*Conjg(kap)*(2*M4*kap - Tk)) + 9*gp*(-(gp*(Qs1p2 - Qs2p2 +              & 
&  Qs3p2)*Conjg(Tk)*(M4*kap - Tk)) + 18*Qs2*(gp*Qs2*Tr2U1(4,4) + Tr3(4)))))/81._dp

 
Dms22 = oo16pi2*( betams221 + oo16pi2 * betams222 ) 

 
Else 
Dms22 = oo16pi2* betams221 
End If 
 
 
!-------------------- 
! ms32 
!-------------------- 
 
betams321  = (2*(AbsTk + Abskap*(ms12 + ms22 + ms32) - 36*AbsM4*gpp2*Qs3p2 +          & 
&  9*gp*Qs3*Tr1(4)))/9._dp

 
 
If (TwoLoopRGE) Then 
betams322 = (4*(-2*Ckapp2*kapp2*(ms12 + ms22 + ms32) + Abskap*(-4._dp*(AbsTk) + 9*gpp2*(ms12 +    & 
&  ms22 + ms32)*(Qs1p2 + Qs2p2 - Qs3p2)) + 9*Conjg(M4)*(54*gpp4*M4*Qs3p2*(9._dp*(Qdp2) + & 
&  3._dp*(Qep2) + 2._dp*(QHdp2) + 2._dp*(QHup2) + 6._dp*(Qlp2) + 18._dp*(Qqp2) +         & 
&  Qs1p2 + Qs2p2 + 3._dp*(Qs3p2) + Qsp2 + 9._dp*(Qup2) + 3._dp*(Qvp2)) + gpp2*(Qs1p2 +   & 
&  Qs2p2 - Qs3p2)*Conjg(kap)*(2*M4*kap - Tk)) + 9*gp*(-(gp*(Qs1p2 + Qs2p2 -              & 
&  Qs3p2)*Conjg(Tk)*(M4*kap - Tk)) + 18*Qs3*(gp*Qs3*Tr2U1(4,4) + Tr3(4)))))/81._dp

 
Dms32 = oo16pi2*( betams321 + oo16pi2 * betams322 ) 

 
Else 
Dms32 = oo16pi2* betams321 
End If 
 
 
!-------------------- 
! mv2 
!-------------------- 
 
betamv21  = 2*(mv2TpYvCYv - 4*AbsM4*gpp2*id3R*Qvp2 + 2._dp*(TpTvCTv) + 2*mHu2*TpYvCYv +& 
&  TpYvCYvmv2 + 2._dp*(TpYvml2CYv) + gp*id3R*Qv*Tr1(4))

 
 
If (TwoLoopRGE) Then 
betamv22 = -2._dp*(mv2TpYvadjYeYeCYv) - 2*Abslam*mv2TpYvCYv + (6*g1p2*mv2TpYvCYv)/5._dp +        & 
&  6*g2p2*mv2TpYvCYv - 2._dp*(mv2TpYvCYvTpYvCYv) + 4*gpp2*mv2TpYvCYv*QHup2 +             & 
&  4*gpp2*mv2TpYvCYv*Qlp2 - 4*gpp2*mv2TpYvCYv*Qvp2 - 4._dp*(TpTvadjTeYeCYv) -            & 
&  4._dp*(TpTvadjYeYeCTv) - 4*Abslam*TpTvCTv + (12*g1p2*TpTvCTv)/5._dp + 12*g2p2*TpTvCTv +& 
&  8*gpp2*QHup2*TpTvCTv + 8*gpp2*Qlp2*TpTvCTv - 8*gpp2*Qvp2*TpTvCTv - 4._dp*(TpTvCTvTpYvCYv) -& 
&  4._dp*(TpTvCYvTpYvCTv) - 4._dp*(TpYvadjTeTeCYv) - 4._dp*(TpYvadjYeme2YeCYv) -         & 
&  4._dp*(TpYvadjYeTeCTv) - 4*mHd2*TpYvadjYeYeCYv - 4*mHu2*TpYvadjYeYeCYv -              & 
&  2._dp*(TpYvadjYeYeCYvmv2) - 4._dp*(TpYvadjYeYeml2CYv) - (12*g1p2*M1*TpYvCTv)/5._dp -  & 
&  12*g2p2*M2*TpYvCTv - 8*gpp2*M4*QHup2*TpYvCTv - 8*gpp2*M4*Qlp2*TpYvCTv +               & 
&  8*gpp2*M4*Qvp2*TpYvCTv - 4._dp*(TpYvCTvTpTvCYv) - 4*AbsTlam*TpYvCYv + (24*AbsM1*g1p2*TpYvCYv)/5._dp +& 
&  24*AbsM2*g2p2*TpYvCYv - 4*Abslam*mHd2*TpYvCYv - 8*Abslam*mHu2*TpYvCYv +               & 
&  (12*g1p2*mHu2*TpYvCYv)/5._dp + 12*g2p2*mHu2*TpYvCYv - 4*Abslam*ms2*TpYvCYv +          & 
&  8*gpp2*mHu2*QHup2*TpYvCYv + 8*gpp2*mHu2*Qlp2*TpYvCYv - 8*gpp2*mHu2*Qvp2*TpYvCYv -     & 
&  2*Abslam*TpYvCYvmv2 + (6*g1p2*TpYvCYvmv2)/5._dp + 6*g2p2*TpYvCYvmv2 + 4*gpp2*QHup2*TpYvCYvmv2 +& 
&  4*gpp2*Qlp2*TpYvCYvmv2 - 4*gpp2*Qvp2*TpYvCYvmv2 - 4._dp*(TpYvCYvmv2TpYvCYv) -         & 
&  4._dp*(TpYvCYvTpTvCTv) - 8*mHu2*TpYvCYvTpYvCYv - 2._dp*(TpYvCYvTpYvCYvmv2) -          & 
&  4._dp*(TpYvCYvTpYvml2CYv) - 4._dp*(TpYvml2adjYeYeCYv) - 4*Abslam*TpYvml2CYv +         & 
&  (12*g1p2*TpYvml2CYv)/5._dp + 12*g2p2*TpYvml2CYv + 8*gpp2*QHup2*TpYvml2CYv +           & 
&  8*gpp2*Qlp2*TpYvml2CYv - 8*gpp2*Qvp2*TpYvml2CYv - 4._dp*(TpYvml2CYvTpYvCYv) -         & 
&  12*TpYvCTv*TradjYuTu - 4*TpYvCTv*TradjYvTv - 12*TpYvCYv*TrCTuTpTu - 12*TpTvCYv*TrCTuTpYu -& 
&  4*TpYvCYv*TrCTvTpTv - 4*TpTvCYv*TrCTvTpYv - 12*TpYvCYv*Trmq2adjYuYu - 12*TpYvCYv*Trmu2YuadjYu  
betamv22 =  betamv22- 6*mv2TpYvCYv*TrYuadjYu - 12*TpTvCTv*TrYuadjYu - 24*mHu2*TpYvCYv*TrYuadjYu -           & 
&  6*TpYvCYvmv2*TrYuadjYu - 12*TpYvml2CYv*TrYuadjYu - 2*mv2TpYvCYv*TrYvadjYv -           & 
&  4*TpTvCTv*TrYvadjYv - 8*mHu2*TpYvCYv*TrYvadjYv - 2*TpYvCYvmv2*TrYvadjYv -             & 
&  4*TpYvml2CYv*TrYvadjYv - 4*TpYvCYv*TrYvadjYvCml2 - 4*TpYvCYv*TrYvCmv2adjYv -          & 
&  (12*g1p2*TpTvCYv*Conjg(M1))/5._dp + 8*(3*gpp4*id3R*M4*Qvp2*(9._dp*(Qdp2) +            & 
&  3._dp*(Qep2) + 2._dp*(QHdp2) + 2._dp*(QHup2) + 6._dp*(Qlp2) + 18._dp*(Qqp2) +         & 
&  Qs1p2 + Qs2p2 + Qs3p2 + Qsp2 + 9._dp*(Qup2) + 5._dp*(Qvp2)) + gpp2*(QHup2 +           & 
&  Qlp2 - Qvp2)*(-1._dp*(TpTvCYv) + 2*M4*TpYvCYv))*Conjg(M4) - 12*g2p2*TpTvCYv*Conjg(M2) -& 
&  4*TpTvCYv*lam*Conjg(Tlam) - 4*TpYvCTv*Conjg(lam)*Tlam + 8*gp*id3R*Qv*(gp*Qv*Tr2U1(4,  & 
& 4) + Tr3(4))

 
Dmv2 = oo16pi2*( betamv21 + oo16pi2 * betamv22 ) 

 
Else 
Dmv2 = oo16pi2* betamv21 
End If 
 
 
Call Chop(Dmv2) 

Forall(i1=1:3) Dmv2(i1,i1) =  Real(Dmv2(i1,i1),dp) 
Dmv2 = 0.5_dp*(Dmv2+ Conjg(Transpose(Dmv2)) ) 
!-------------------- 
! M1 
!-------------------- 
 
betaM11  = (66*g1p2*M1)/5._dp

 
 
If (TwoLoopRGE) Then 
betaM12 = (2*g1p2*(398*g1p2*M1 + 135*g2p2*M1 + 440*g3p2*M1 + 440*g3p2*M3 + 135*g2p2*M2 +        & 
&  60*gpp2*M1*Qdp2 + 60*gpp2*M4*Qdp2 + 180*gpp2*M1*Qep2 + 180*gpp2*M4*Qep2 +             & 
&  30*gpp2*M1*QHdp2 + 30*gpp2*M4*QHdp2 + 30*gpp2*M1*QHup2 + 30*gpp2*M4*QHup2 +           & 
&  90*gpp2*M1*Qlp2 + 90*gpp2*M4*Qlp2 + 30*gpp2*M1*Qqp2 + 30*gpp2*M4*Qqp2 +               & 
&  240*gpp2*M1*Qup2 + 240*gpp2*M4*Qup2 + 70._dp*(TradjYdTd) + 90._dp*(TradjYeTe) +       & 
&  130._dp*(TradjYuTu) + 30._dp*(TradjYvTv) - 70*M1*TrYdadjYd - 90*M1*TrYeadjYe -        & 
&  130*M1*TrYuadjYu - 30*M1*TrYvadjYv - 30*Conjg(lam)*(M1*lam - Tlam)))/25._dp

 
DM1 = oo16pi2*( betaM11 + oo16pi2 * betaM12 ) 

 
Else 
DM1 = oo16pi2* betaM11 
End If 
 
 
Call Chop(DM1) 

!-------------------- 
! M2 
!-------------------- 
 
betaM21  = 2*g2p2*M2

 
 
If (TwoLoopRGE) Then 
betaM22 = (2*g2p2*(9*g1p2*M1 + 120*g3p2*M3 + 9*g1p2*M2 + 250*g2p2*M2 + 120*g3p2*M2 +            & 
&  10*gpp2*M4*QHdp2 + 10*gpp2*M2*QHdp2 + 10*gpp2*M4*QHup2 + 10*gpp2*M2*QHup2 +           & 
&  30*gpp2*M4*Qlp2 + 30*gpp2*M2*Qlp2 + 90*gpp2*M4*Qqp2 + 90*gpp2*M2*Qqp2 +               & 
&  30._dp*(TradjYdTd) + 10._dp*(TradjYeTe) + 30._dp*(TradjYuTu) + 10._dp*(TradjYvTv) -   & 
&  30*M2*TrYdadjYd - 10*M2*TrYeadjYe - 30*M2*TrYuadjYu - 10*M2*TrYvadjYv -               & 
&  10*Conjg(lam)*(M2*lam - Tlam)))/5._dp

 
DM2 = oo16pi2*( betaM21 + oo16pi2 * betaM22 ) 

 
Else 
DM2 = oo16pi2* betaM21 
End If 
 
 
Call Chop(DM2) 

!-------------------- 
! M3 
!-------------------- 
 
betaM31  = -6*g3p2*M3

 
 
If (TwoLoopRGE) Then 
betaM32 = (2*g3p2*(11*g1p2*M1 + 11*g1p2*M3 + 45*g2p2*M3 + 140*g3p2*M3 + 45*g2p2*M2 +            & 
&  30*gpp2*M3*Qdp2 + 30*gpp2*M4*Qdp2 + 60*gpp2*M3*Qqp2 + 60*gpp2*M4*Qqp2 +               & 
&  30*gpp2*M3*Qup2 + 30*gpp2*M4*Qup2 + 20._dp*(TradjYdTd) + 20._dp*(TradjYuTu) -         & 
&  20*M3*TrYdadjYd - 20*M3*TrYuadjYu))/5._dp

 
DM3 = oo16pi2*( betaM31 + oo16pi2 * betaM32 ) 

 
Else 
DM3 = oo16pi2* betaM31 
End If 
 
 
Call Chop(DM3) 

!-------------------- 
! M4 
!-------------------- 
 
betaM41  = 2*gpp2*M4*(9._dp*(Qdp2) + 3._dp*(Qep2) + 2._dp*(QHdp2) + 2._dp*(QHup2)     & 
&  + 6._dp*(Qlp2) + 18._dp*(Qqp2) + Qs1p2 + Qs2p2 + Qs3p2 + Qsp2 + 9._dp*(Qup2)          & 
&  + 3._dp*(Qvp2))

 
 
If (TwoLoopRGE) Then 
betaM42 = (4*gpp2*(-5*(Qs1p2 + Qs2p2 + Qs3p2)*Conjg(kap)*(M4*kap - Tk) + 9*(6*g1p2*M1*Qdp2 +    & 
&  120*g3p2*M3*Qdp2 + 6*g1p2*M4*Qdp2 + 120*g3p2*M4*Qdp2 + 180*gpp2*M4*Qdp4 +             & 
&  18*g1p2*M1*Qep2 + 18*g1p2*M4*Qep2 + 60*gpp2*M4*Qep4 + 3*g1p2*M1*QHdp2 +               & 
&  3*g1p2*M4*QHdp2 + 15*g2p2*M4*QHdp2 + 15*g2p2*M2*QHdp2 + 40*gpp2*M4*QHdp4 +            & 
&  3*g1p2*M1*QHup2 + 3*g1p2*M4*QHup2 + 15*g2p2*M4*QHup2 + 15*g2p2*M2*QHup2 +             & 
&  40*gpp2*M4*QHup4 + 9*g1p2*M1*Qlp2 + 9*g1p2*M4*Qlp2 + 45*g2p2*M4*Qlp2 + 45*g2p2*M2*Qlp2 +& 
&  120*gpp2*M4*Qlp4 + 3*g1p2*M1*Qqp2 + 240*g3p2*M3*Qqp2 + 3*g1p2*M4*Qqp2 +               & 
&  135*g2p2*M4*Qqp2 + 240*g3p2*M4*Qqp2 + 135*g2p2*M2*Qqp2 + 360*gpp2*M4*Qqp4 +           & 
&  20*gpp2*M4*Qs1p4 + 20*gpp2*M4*Qs2p4 + 20*gpp2*M4*Qs3p4 + 20*gpp2*M4*Qsp4 +            & 
&  24*g1p2*M1*Qup2 + 120*g3p2*M3*Qup2 + 24*g1p2*M4*Qup2 + 120*g3p2*M4*Qup2 +             & 
&  180*gpp2*M4*Qup4 + 60*gpp2*M4*Qvp4 + 30*Qdp2*TradjYdTd + 30*QHdp2*TradjYdTd +         & 
&  30*Qqp2*TradjYdTd + 10*Qep2*TradjYeTe + 10*QHdp2*TradjYeTe + 10*Qlp2*TradjYeTe +      & 
&  30*QHup2*TradjYuTu + 30*Qqp2*TradjYuTu + 30*Qup2*TradjYuTu + 10*QHup2*TradjYvTv +     & 
&  10*Qlp2*TradjYvTv + 10*Qvp2*TradjYvTv - 30*M4*(Qdp2 + QHdp2 + Qqp2)*TrYdadjYd -       & 
&  10*M4*Qep2*TrYeadjYe - 10*M4*QHdp2*TrYeadjYe - 10*M4*Qlp2*TrYeadjYe - 30*M4*QHup2*TrYuadjYu -& 
&  30*M4*Qqp2*TrYuadjYu - 30*M4*Qup2*TrYuadjYu - 10*M4*QHup2*TrYvadjYv - 10*M4*Qlp2*TrYvadjYv -& 
&  10*M4*Qvp2*TrYvadjYv - 10*(QHdp2 + QHup2 + Qsp2)*Conjg(lam)*(M4*lam - Tlam))))/45._dp

 
DM4 = oo16pi2*( betaM41 + oo16pi2 * betaM42 ) 

 
Else 
DM4 = oo16pi2* betaM41 
End If 
 
 
Call Chop(DM4) 

!-------------------- 
! vd 
!-------------------- 
 
betavd1  = (vd*(-20._dp*(Abslam) + 3._dp*(g1p2) + 15._dp*(g2p2) + 20*gpp2*QHdp2 -     & 
&  60._dp*(TrYdadjYd) - 20._dp*(TrYeadjYe) + 3*g1p2*Xi + 15*g2p2*Xi + 20*gpp2*QHdp2*Xi))/20._dp

 
 
If (TwoLoopRGE) Then 
betavd2 = (vd*(-207._dp*(g1p4) - 90*g1p2*g2p2 - 600._dp*(g2p4) + 600*Clamp2*lamp2 +             & 
&  360*g1p2*gpp2*Qd*QHd + 360*g1p2*gpp2*Qe*QHd - 240*g1p2*gpp2*QHdp2 - 600*g2p2*gpp2*QHdp2 -& 
&  1800*gpp4*Qdp2*QHdp2 - 600*gpp4*Qep2*QHdp2 - 800*gpp4*QHdp4 + 120*g1p2*gpp2*QHd*QHu - & 
&  400*gpp4*QHdp2*QHup2 - 360*g1p2*gpp2*QHd*Ql - 1200*gpp4*QHdp2*Qlp2 + 360*g1p2*gpp2*QHd*Qq -& 
&  3600*gpp4*QHdp2*Qqp2 - 200*gpp4*QHdp2*Qs1p2 - 200*gpp4*QHdp2*Qs2p2 - 200*gpp4*QHdp2*Qs3p2 -& 
&  200*gpp4*QHdp2*Qsp2 - 720*g1p2*gpp2*QHd*Qu - 1800*gpp4*QHdp2*Qup2 - 600*gpp4*QHdp2*Qvp2 +& 
&  1800._dp*(TrYdadjYdYdadjYd) + 600._dp*(TrYdadjYuYuadjYd) - 240*g1p2*TrYeadjYe -       & 
&  400*gpp2*Qep2*TrYeadjYe + 400*gpp2*QHdp2*TrYeadjYe - 400*gpp2*Qlp2*TrYeadjYe +        & 
&  600._dp*(TrYeadjYeYeadjYe) + 200._dp*(TrYvadjYvTpYeCYe) - 9*g1p4*Xi - 90*g1p2*g2p2*Xi +& 
&  325*g2p4*Xi - 120*g1p2*gpp2*QHdp2*Xi - 600*g2p2*gpp2*QHdp2*Xi - 400*gpp4*QHdp4*Xi -   & 
&  60*g1p2*TrYeadjYe*Xi - 300*g2p2*TrYeadjYe*Xi - 400*gpp2*QHdp2*TrYeadjYe*Xi -          & 
&  20*Abslam*(-20*gpp2*QHdp2 + 20*gpp2*QHup2 + 20*gpp2*Qsp2 - 30._dp*(TrYuadjYu) -       & 
&  10._dp*(TrYvadjYv) + 3*g1p2*Xi + 15*g2p2*Xi + 20*gpp2*QHdp2*Xi) - 20*TrYdadjYd*(160._dp*(g3p2) +& 
&  60*gpp2*(Qdp2 + Qqp2 + QHdp2*(-1 + Xi)) + 45*g2p2*Xi + g1p2*(-4 + 9._dp*(Xi))) +      & 
&  9*g1p4*Xip2 + 90*g1p2*g2p2*Xip2 + 120*g1p2*gpp2*QHdp2*Xip2 + 600*g2p2*gpp2*QHdp2*Xip2 +& 
&  400*gpp4*QHdp4*Xip2))/200._dp

 
Dvd = oo16pi2*( betavd1 + oo16pi2 * betavd2 ) 

 
Else 
Dvd = oo16pi2* betavd1 
End If 
 
 
!-------------------- 
! vu 
!-------------------- 
 
betavu1  = (vu*(-20._dp*(Abslam) + 3._dp*(g1p2) + 15._dp*(g2p2) + 20*gpp2*QHup2 -     & 
&  60._dp*(TrYuadjYu) - 20._dp*(TrYvadjYv) + 3*g1p2*Xi + 15*g2p2*Xi + 20*gpp2*QHup2*Xi))/20._dp

 
 
If (TwoLoopRGE) Then 
betavu2 = (vu*(-207._dp*(g1p4) - 90*g1p2*g2p2 - 600._dp*(g2p4) + 600*Clamp2*lamp2 -             & 
&  360*g1p2*gpp2*Qd*QHu - 360*g1p2*gpp2*Qe*QHu + 120*g1p2*gpp2*QHd*QHu - 240*g1p2*gpp2*QHup2 -& 
&  600*g2p2*gpp2*QHup2 - 1800*gpp4*Qdp2*QHup2 - 600*gpp4*Qep2*QHup2 - 400*gpp4*QHdp2*QHup2 -& 
&  800*gpp4*QHup4 + 360*g1p2*gpp2*QHu*Ql - 1200*gpp4*QHup2*Qlp2 - 360*g1p2*gpp2*QHu*Qq - & 
&  3600*gpp4*QHup2*Qqp2 - 200*gpp4*QHup2*Qs1p2 - 200*gpp4*QHup2*Qs2p2 - 200*gpp4*QHup2*Qs3p2 -& 
&  200*gpp4*QHup2*Qsp2 + 720*g1p2*gpp2*QHu*Qu - 1800*gpp4*QHup2*Qup2 - 600*gpp4*QHup2*Qvp2 +& 
&  600._dp*(TrYdadjYuYuadjYd) + 1800._dp*(TrYuadjYuYuadjYu) + 400*gpp2*QHup2*TrYvadjYv - & 
&  400*gpp2*Qlp2*TrYvadjYv - 400*gpp2*Qvp2*TrYvadjYv + 200._dp*(TrYvadjYvTpYeCYe) +      & 
&  600._dp*(TrYvadjYvYvadjYv) - 9*g1p4*Xi - 90*g1p2*g2p2*Xi + 325*g2p4*Xi -              & 
&  120*g1p2*gpp2*QHup2*Xi - 600*g2p2*gpp2*QHup2*Xi - 400*gpp4*QHup4*Xi - 60*g1p2*TrYvadjYv*Xi -& 
&  300*g2p2*TrYvadjYv*Xi - 400*gpp2*QHup2*TrYvadjYv*Xi - 20*Abslam*(20*gpp2*QHdp2 -      & 
&  20*gpp2*QHup2 + 20*gpp2*Qsp2 - 30._dp*(TrYdadjYd) - 10._dp*(TrYeadjYe) +              & 
&  3*g1p2*Xi + 15*g2p2*Xi + 20*gpp2*QHup2*Xi) - 20*TrYuadjYu*(160._dp*(g3p2) +           & 
&  60*gpp2*(Qqp2 + Qup2 + QHup2*(-1 + Xi)) + 45*g2p2*Xi + g1p2*(8 + 9._dp*(Xi))) +       & 
&  9*g1p4*Xip2 + 90*g1p2*g2p2*Xip2 + 120*g1p2*gpp2*QHup2*Xip2 + 600*g2p2*gpp2*QHup2*Xip2 +& 
&  400*gpp4*QHup4*Xip2))/200._dp

 
Dvu = oo16pi2*( betavu1 + oo16pi2 * betavu2 ) 

 
Else 
Dvu = oo16pi2* betavu1 
End If 
 
 
!-------------------- 
! vS 
!-------------------- 
 
betavS1  = vS*(-2._dp*(Abslam) + gpp2*Qsp2*(1 + Xi))

 
 
If (TwoLoopRGE) Then 
betavS2 = 4*Clamp2*lamp2*vS - (2*Abslam*vS*(3._dp*(g1p2) + 15._dp*(g2p2) + 10*gpp2*QHdp2 +      & 
&  10*gpp2*QHup2 - 10*gpp2*Qsp2 - 15._dp*(TrYdadjYd) - 5._dp*(TrYeadjYe) -               & 
&  15._dp*(TrYuadjYu) - 5._dp*(TrYvadjYv) + 10*gpp2*Qsp2*Xi))/5._dp - gpp4*Qsp2*vS*(9._dp*(Qdp2) +& 
&  3._dp*(Qep2) + 2._dp*(QHdp2) + 2._dp*(QHup2) + 6._dp*(Qlp2) + 18._dp*(Qqp2) +         & 
&  Qs1p2 + Qs2p2 + Qs3p2 + 3._dp*(Qsp2) + 9._dp*(Qup2) + 3._dp*(Qvp2) + 2*Qsp2*Xi -      & 
&  2*Qsp2*Xip2)

 
DvS = oo16pi2*( betavS1 + oo16pi2 * betavS2 ) 

 
Else 
DvS = oo16pi2* betavS1 
End If 
 
 
!-------------------- 
! vS1 
!-------------------- 
 
betavS11  = -(Abskap*vS1)/9._dp + gpp2*Qs1p2*vS1*(1 + Xi)

 
 
If (TwoLoopRGE) Then 
betavS12 = -(vS1*(-2*Ckapp2*kapp2 + 18*Abskap*gpp2*(Qs2p2 + Qs3p2 + Qs1p2*(-1 + Xi)) +           & 
&  81*gpp4*Qs1p2*(9._dp*(Qdp2) + 3._dp*(Qep2) + 2._dp*(QHdp2) + 2._dp*(QHup2) +          & 
&  6._dp*(Qlp2) + 18._dp*(Qqp2) + 3._dp*(Qs1p2) + Qs2p2 + Qs3p2 + Qsp2 + 9._dp*(Qup2) +  & 
&  3._dp*(Qvp2) + 2*Qs1p2*Xi - 2*Qs1p2*Xip2)))/81._dp

 
DvS1 = oo16pi2*( betavS11 + oo16pi2 * betavS12 ) 

 
Else 
DvS1 = oo16pi2* betavS11 
End If 
 
 
!-------------------- 
! vS2 
!-------------------- 
 
betavS21  = -(Abskap*vS2)/9._dp + gpp2*Qs2p2*vS2*(1 + Xi)

 
 
If (TwoLoopRGE) Then 
betavS22 = -(vS2*(-2*Ckapp2*kapp2 + 18*Abskap*gpp2*(Qs1p2 + Qs3p2 + Qs2p2*(-1 + Xi)) +           & 
&  81*gpp4*Qs2p2*(9._dp*(Qdp2) + 3._dp*(Qep2) + 2._dp*(QHdp2) + 2._dp*(QHup2) +          & 
&  6._dp*(Qlp2) + 18._dp*(Qqp2) + Qs1p2 + 3._dp*(Qs2p2) + Qs3p2 + Qsp2 + 9._dp*(Qup2) +  & 
&  3._dp*(Qvp2) + 2*Qs2p2*Xi - 2*Qs2p2*Xip2)))/81._dp

 
DvS2 = oo16pi2*( betavS21 + oo16pi2 * betavS22 ) 

 
Else 
DvS2 = oo16pi2* betavS21 
End If 
 
 
!-------------------- 
! vS3 
!-------------------- 
 
betavS31  = -(Abskap*vS3)/9._dp + gpp2*Qs3p2*vS3*(1 + Xi)

 
 
If (TwoLoopRGE) Then 
betavS32 = -(vS3*(-2*Ckapp2*kapp2 + 18*Abskap*gpp2*(Qs1p2 + Qs2p2 + Qs3p2*(-1 + Xi)) +           & 
&  81*gpp4*Qs3p2*(9._dp*(Qdp2) + 3._dp*(Qep2) + 2._dp*(QHdp2) + 2._dp*(QHup2) +          & 
&  6._dp*(Qlp2) + 18._dp*(Qqp2) + Qs1p2 + Qs2p2 + 3._dp*(Qs3p2) + Qsp2 + 9._dp*(Qup2) +  & 
&  3._dp*(Qvp2) + 2*Qs3p2*Xi - 2*Qs3p2*Xip2)))/81._dp

 
DvS3 = oo16pi2*( betavS31 + oo16pi2 * betavS32 ) 

 
Else 
DvS3 = oo16pi2* betavS31 
End If 
 
 
Call ParametersToG284(Dg1,Dg2,Dg3,Dgp,DYd,DYe,Dlam,DYv,Dkap,DYu,DTd,DTe,              & 
& DTlam,DTv,DTk,DTu,Dmq2,Dml2,DmHd2,DmHu2,Dmd2,Dmu2,Dme2,Dms2,Dms12,Dms22,               & 
& Dms32,Dmv2,DM1,DM2,DM3,DM4,Dvd,Dvu,DvS,DvS1,DvS2,DvS3,f)

Iname = Iname - 1 
 
End Subroutine rge284  

End Module RGEs_sec_UMSSM 
 
