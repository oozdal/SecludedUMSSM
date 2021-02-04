! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.13.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 0:56 on 7.11.2019   
! ----------------------------------------------------------------------  
 
 
Module TreeLevelMasses_sec_UMSSM 
 
Use Control 
Use Mathematics 
Use MathematicsQP 
Use Settings 
Use Model_Data_sec_UMSSM 

 
Logical :: SignOfMassChanged =.False.  
Logical :: SignOfMuChanged =.False.  
Contains 
 
Subroutine TreeMasses(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,vS2,vS3,            & 
& g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,mHu2,md2,             & 
& mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,GenerationMixing,kont)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp),Intent(out) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(out) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp),Intent(in) :: vd,vu,vS,vS1,vS2,vS3

Logical, Intent(in) :: GenerationMixing 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,kontSave 
Complex(dp) :: MGluC 
Iname = Iname + 1 
NameOfUnit(Iname) = 'TreeMassessecluded_UMSSM'
 
kont = 0 
Call CalculateVPVZVZp(g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,vd,vu,vS,vS1,vS2,               & 
& vS3,ZZ,MVZ,MVZp,MVZ2,MVZp2,TW,TWp,kont)

Call CalculateVWm(g2,vd,vu,ZW,MVWm,MVWm2,kont)

! ------------------------------- 
! Mass of Glu 
MGluC = M3 
If (RotateNegativeFermionMasses) Then 
pG = Abs(MGluC)/MGluC
pG = Sqrt(pG)
MGlu = Abs(MGluC) 
MGlu2 = MGlu**2 
Else 
pG = 1._dp
MGlu = Real(MGluC,dp) 
MGlu2 = MGlu**2 
End if
! ------------------------------- 
Call CalculateMSd(g1,g2,gp,Qq,QHd,QHu,Qd,Qs,Qs1,Qs2,Qs3,Yd,Td,lam,mq2,md2,            & 
& vd,vu,vS,vS1,vS2,vS3,ZD,MSd,MSd2,kont)

Call CalculateMSv(g1,g2,gp,Ql,QHd,QHu,Qs,Qs1,Qs2,Qs3,Qv,lam,Yv,Tv,ml2,mv2,            & 
& vd,vu,vS,vS1,vS2,vS3,ZV,MSv,MSv2,kont)

Call CalculateMSu(g1,g2,gp,Qq,QHd,QHu,Qu,Qs,Qs1,Qs2,Qs3,lam,Yu,Tu,mq2,mu2,            & 
& vd,vu,vS,vS1,vS2,vS3,ZU,MSu,MSu2,kont)

Call CalculateMSe(g1,g2,gp,Ql,QHd,QHu,Qe,Qs,Qs1,Qs2,Qs3,Ye,Te,lam,ml2,me2,            & 
& vd,vu,vS,vS1,vS2,vS3,ZE,MSe,MSe2,kont)

Call CalculateMhh(g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,lam,Tlam,kap,Tk,mHd2,               & 
& mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3,ZH,Mhh,Mhh2,kont)

kontSave = kont 
Call CalculateMAh(g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,lam,Tlam,kap,Tk,mHd2,               & 
& mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3,TW,TWp,ZA,MAh,MAh2,kont)

kont = kontSave 
kontSave = kont 
Call CalculateMHpm(g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,lam,Tlam,mHd2,mHu2,vd,             & 
& vu,vS,vS1,vS2,vS3,ZP,MHpm,MHpm2,kont)

kont = kontSave 
Call CalculateMChi(g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,lam,kap,M1,M2,M4,vd,               & 
& vu,vS,vS1,vS2,vS3,ZN,MChi,kont)

MChi2 = MChi**2 
Call CalculateMFv(Yv,vu,ZVL,ZVR,MFv,kont)

MFv2 = MFv**2 
Call CalculateMCha(g2,lam,M2,vd,vu,vS,UM,UP,MCha,kont)

MCha2 = MCha**2 
Call CalculateMFe(Ye,vd,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 
Call CalculateMFd(Yd,vd,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
Call CalculateMFu(Yu,vu,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 

 
 Call SortGoldstones(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,MFu,             & 
& MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,               & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,kont)

If (MatchingOrder.eq.-1) Then 
 If (SignOfMassChanged) Then  
 If (.Not.IgnoreNegativeMasses) Then 
  Write(*,*) " Stopping calculation because of negative mass squared." 
  Call TerminateProgram 
 Else 
  SignOfMassChanged= .False. 
  kont=0  
 End If 
End If 
If (SignOfMuChanged) Then 
 If (.Not.IgnoreMuSignFlip) Then 
  Write(*,*) " Stopping calculation because of negative mass squared in tadpoles." 
  Call TerminateProgram 
 Else 
  SignOfMuChanged= .False. 
  kont=0 
 End If 
End If 
End if 
 
 ! -------------------------------- 
! Setting Goldstone masses 
! -------------------------------- 
 
MAh(1)=MVZ*sqrt(RXiZ)
MAh2(1)=MVZ2*RXiZ
MAh(2)=MVZp*sqrt(RXiZp)
MAh2(2)=MVZp2*RXiZp
MHpm(1)=MVWm*sqrt(RXiWm)
MHpm2(1)=MVWm2*RXiWm
v = Sqrt(vd**2 + vu**2)
betaH = ASin(Abs(ZP(1,2)))
TW = ACos(Abs(ZZ(1,1)))
TWp = ACos(Abs(ZZ(3,3)))
Iname = Iname - 1 
 
End Subroutine  TreeMasses 
 
 
Subroutine RunningFermionMasses(MFeIN,MFe2IN,MFdIN,MFd2IN,MFuIN,MFu2IN,               & 
& vd,vu,vS,vS1,vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,kont)

Implicit None 
 
Integer, Intent(inout) :: kont 
Real(dp),Intent(in) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp),Intent(in) :: vd,vu,vS,vS1,vS2,vS3

Real(dp),Intent(inout) :: MFeIN(3),MFe2IN(3),MFdIN(3),MFd2IN(3),MFuIN(3),MFu2IN(3)

Real(dp) :: MFe(3),MFe2(3),MFd(3),MFd2(3),MFu(3),MFu2(3)

Call CalculateMFe(Ye,vd,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 
MFeIN(1:2) = MFe(1:2) 
MFe2IN(1:2) = MFe2(1:2) 
Call CalculateMFd(Yd,vd,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
MFdIN(1:2) = MFd(1:2) 
MFd2IN(1:2) = MFd2(1:2) 
Call CalculateMFu(Yu,vu,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
MFuIN(1:2) = MFu(1:2) 
MFu2IN(1:2) = MFu2(1:2) 
End Subroutine RunningFermionMasses 

Subroutine TreeMassesEffPot(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,              & 
& ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,vd,vu,vS,vS1,            & 
& vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,mHd2,              & 
& mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,GenerationMixing,kont)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp),Intent(out) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(out) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp),Intent(in) :: vd,vu,vS,vS1,vS2,vS3

Logical, Intent(in) :: GenerationMixing 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,kontSave 
Complex(dp) :: MGluC 
Iname = Iname + 1 
NameOfUnit(Iname) = 'TreeMassessecluded_UMSSM'
 
kont = 0 
Call CalculateVPVZVZpEffPot(g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,vd,vu,vS,vS1,             & 
& vS2,vS3,ZZ,MVZ,MVZp,MVZ2,MVZp2,TW,TWp,kont)

Call CalculateVWmEffPot(g2,vd,vu,ZW,MVWm,MVWm2,kont)

! ------------------------------- 
! Mass of Glu 
MGluC = M3 
If (RotateNegativeFermionMasses) Then 
pG = Abs(MGluC)/MGluC
pG = Sqrt(pG)
MGlu = Abs(MGluC) 
MGlu2 = MGlu**2 
Else 
pG = 1._dp
MGlu = Real(MGluC,dp) 
MGlu2 = MGlu**2 
End if
! ------------------------------- 
Call CalculateMSdEffPot(g1,g2,gp,Qq,QHd,QHu,Qd,Qs,Qs1,Qs2,Qs3,Yd,Td,lam,              & 
& mq2,md2,vd,vu,vS,vS1,vS2,vS3,ZD,MSd,MSd2,kont)

Call CalculateMSvEffPot(g1,g2,gp,Ql,QHd,QHu,Qs,Qs1,Qs2,Qs3,Qv,lam,Yv,Tv,              & 
& ml2,mv2,vd,vu,vS,vS1,vS2,vS3,ZV,MSv,MSv2,kont)

Call CalculateMSuEffPot(g1,g2,gp,Qq,QHd,QHu,Qu,Qs,Qs1,Qs2,Qs3,lam,Yu,Tu,              & 
& mq2,mu2,vd,vu,vS,vS1,vS2,vS3,ZU,MSu,MSu2,kont)

Call CalculateMSeEffPot(g1,g2,gp,Ql,QHd,QHu,Qe,Qs,Qs1,Qs2,Qs3,Ye,Te,lam,              & 
& ml2,me2,vd,vu,vS,vS1,vS2,vS3,ZE,MSe,MSe2,kont)

Call CalculateMhhEffPot(g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,lam,Tlam,kap,Tk,              & 
& mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3,ZH,Mhh,Mhh2,kont)

kontSave = kont 
Call CalculateMAhEffPot(g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,lam,Tlam,kap,Tk,              & 
& mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3,TW,TWp,ZA,MAh,MAh2,kont)

kont = kontSave 
kontSave = kont 
Call CalculateMHpmEffPot(g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,lam,Tlam,mHd2,               & 
& mHu2,vd,vu,vS,vS1,vS2,vS3,ZP,MHpm,MHpm2,kont)

kont = kontSave 
Call CalculateMChiEffPot(g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,lam,kap,M1,M2,               & 
& M4,vd,vu,vS,vS1,vS2,vS3,ZN,MChi,kont)

MChi2 = MChi**2 
Call CalculateMFvEffPot(Yv,vu,ZVL,ZVR,MFv,kont)

MFv2 = MFv**2 
Call CalculateMChaEffPot(g2,lam,M2,vd,vu,vS,UM,UP,MCha,kont)

MCha2 = MCha**2 
Call CalculateMFeEffPot(Ye,vd,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 
Call CalculateMFdEffPot(Yd,vd,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
Call CalculateMFuEffPot(Yu,vu,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 

 
 If (MatchingOrder.eq.-1) Then 
 If (SignOfMassChanged) Then  
 If (.Not.IgnoreNegativeMasses) Then 
  Write(*,*) " Stopping calculation because of negative mass squared." 
  Call TerminateProgram 
 Else 
  SignOfMassChanged= .False. 
  kont=0  
 End If 
End If 
If (SignOfMuChanged) Then 
 If (.Not.IgnoreMuSignFlip) Then 
  Write(*,*) " Stopping calculation because of negative mass squared in tadpoles." 
  Call TerminateProgram 
 Else 
  SignOfMuChanged= .False. 
  kont=0 
 End If 
End If 
End if 
 Iname = Iname - 1 
 
End Subroutine  TreeMassesEffPot 
 
 
Subroutine CalculateMSd(g1,g2,gp,Qq,QHd,QHu,Qd,Qs,Qs1,Qs2,Qs3,Yd,Td,lam,              & 
& mq2,md2,vd,vu,vS,vS1,vS2,vS3,ZD,MSd,MSd2,kont)

Real(dp), Intent(in) :: g1,g2,gp,Qq,QHd,QHu,Qd,Qs,Qs1,Qs2,Qs3,vd,vu,vS,vS1,vS2,vS3

Complex(dp), Intent(in) :: Yd(3,3),Td(3,3),lam,mq2(3,3),md2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MSd(6), MSd2(6) 
Complex(dp), Intent(out) :: ZD(6,6) 
 
Complex(dp) :: mat(6,6)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMSd'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-(g1**2*vd**2)/24._dp
mat(1,1) = mat(1,1)-(g2**2*vd**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qq*vd**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Qq*Qs*vS**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Qq*Qs1*vS1**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Qq*Qs2*vS2**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Qq*Qs3*vS3**2)/2._dp
mat(1,1) = mat(1,1)+(g1**2*vu**2)/24._dp
mat(1,1) = mat(1,1)+(g2**2*vu**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHu*Qq*vu**2)/2._dp
mat(1,1) = mat(1,1)+mq2(1,1)
Do j1 = 1,3
mat(1,1) = mat(1,1)+(vd**2*Conjg(Yd(j1,1))*Yd(j1,1))/2._dp
End Do 
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+mq2(1,2)
Do j1 = 1,3
mat(1,2) = mat(1,2)+(vd**2*Conjg(Yd(j1,1))*Yd(j1,2))/2._dp
End Do 
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+mq2(1,3)
Do j1 = 1,3
mat(1,3) = mat(1,3)+(vd**2*Conjg(Yd(j1,1))*Yd(j1,3))/2._dp
End Do 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-(vS*vu*lam*Conjg(Yd(1,1)))/2._dp
mat(1,4) = mat(1,4)+(vd*Conjg(Td(1,1)))/sqrt(2._dp)
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)-(vS*vu*lam*Conjg(Yd(2,1)))/2._dp
mat(1,5) = mat(1,5)+(vd*Conjg(Td(2,1)))/sqrt(2._dp)
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)-(vS*vu*lam*Conjg(Yd(3,1)))/2._dp
mat(1,6) = mat(1,6)+(vd*Conjg(Td(3,1)))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-(g1**2*vd**2)/24._dp
mat(2,2) = mat(2,2)-(g2**2*vd**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHd*Qq*vd**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Qq*Qs*vS**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Qq*Qs1*vS1**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Qq*Qs2*vS2**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Qq*Qs3*vS3**2)/2._dp
mat(2,2) = mat(2,2)+(g1**2*vu**2)/24._dp
mat(2,2) = mat(2,2)+(g2**2*vu**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qq*vu**2)/2._dp
mat(2,2) = mat(2,2)+mq2(2,2)
Do j1 = 1,3
mat(2,2) = mat(2,2)+(vd**2*Conjg(Yd(j1,2))*Yd(j1,2))/2._dp
End Do 
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+mq2(2,3)
Do j1 = 1,3
mat(2,3) = mat(2,3)+(vd**2*Conjg(Yd(j1,2))*Yd(j1,3))/2._dp
End Do 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-(vS*vu*lam*Conjg(Yd(1,2)))/2._dp
mat(2,4) = mat(2,4)+(vd*Conjg(Td(1,2)))/sqrt(2._dp)
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)-(vS*vu*lam*Conjg(Yd(2,2)))/2._dp
mat(2,5) = mat(2,5)+(vd*Conjg(Td(2,2)))/sqrt(2._dp)
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)-(vS*vu*lam*Conjg(Yd(3,2)))/2._dp
mat(2,6) = mat(2,6)+(vd*Conjg(Td(3,2)))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-(g1**2*vd**2)/24._dp
mat(3,3) = mat(3,3)-(g2**2*vd**2)/8._dp
mat(3,3) = mat(3,3)+(gp**2*QHd*Qq*vd**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qq*Qs*vS**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qq*Qs1*vS1**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qq*Qs2*vS2**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qq*Qs3*vS3**2)/2._dp
mat(3,3) = mat(3,3)+(g1**2*vu**2)/24._dp
mat(3,3) = mat(3,3)+(g2**2*vu**2)/8._dp
mat(3,3) = mat(3,3)+(gp**2*QHu*Qq*vu**2)/2._dp
mat(3,3) = mat(3,3)+mq2(3,3)
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vd**2*Conjg(Yd(j1,3))*Yd(j1,3))/2._dp
End Do 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)-(vS*vu*lam*Conjg(Yd(1,3)))/2._dp
mat(3,4) = mat(3,4)+(vd*Conjg(Td(1,3)))/sqrt(2._dp)
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)-(vS*vu*lam*Conjg(Yd(2,3)))/2._dp
mat(3,5) = mat(3,5)+(vd*Conjg(Td(2,3)))/sqrt(2._dp)
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)-(vS*vu*lam*Conjg(Yd(3,3)))/2._dp
mat(3,6) = mat(3,6)+(vd*Conjg(Td(3,3)))/sqrt(2._dp)
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)-(g1**2*vd**2)/12._dp
mat(4,4) = mat(4,4)+(gp**2*Qd*QHd*vd**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qd*Qs*vS**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qd*Qs1*vS1**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qd*Qs2*vS2**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qd*Qs3*vS3**2)/2._dp
mat(4,4) = mat(4,4)+(g1**2*vu**2)/12._dp
mat(4,4) = mat(4,4)+(gp**2*Qd*QHu*vu**2)/2._dp
mat(4,4) = mat(4,4)+md2(1,1)
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vd**2*Conjg(Yd(1,j1))*Yd(1,j1))/2._dp
End Do 
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+md2(1,2)
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vd**2*Conjg(Yd(2,j1))*Yd(1,j1))/2._dp
End Do 
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)+md2(1,3)
Do j1 = 1,3
mat(4,6) = mat(4,6)+(vd**2*Conjg(Yd(3,j1))*Yd(1,j1))/2._dp
End Do 
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)-(g1**2*vd**2)/12._dp
mat(5,5) = mat(5,5)+(gp**2*Qd*QHd*vd**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qd*Qs*vS**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qd*Qs1*vS1**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qd*Qs2*vS2**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qd*Qs3*vS3**2)/2._dp
mat(5,5) = mat(5,5)+(g1**2*vu**2)/12._dp
mat(5,5) = mat(5,5)+(gp**2*Qd*QHu*vu**2)/2._dp
mat(5,5) = mat(5,5)+md2(2,2)
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vd**2*Conjg(Yd(2,j1))*Yd(2,j1))/2._dp
End Do 
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+md2(2,3)
Do j1 = 1,3
mat(5,6) = mat(5,6)+(vd**2*Conjg(Yd(3,j1))*Yd(2,j1))/2._dp
End Do 
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)-(g1**2*vd**2)/12._dp
mat(6,6) = mat(6,6)+(gp**2*Qd*QHd*vd**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qd*Qs*vS**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qd*Qs1*vS1**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qd*Qs2*vS2**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qd*Qs3*vS3**2)/2._dp
mat(6,6) = mat(6,6)+(g1**2*vu**2)/12._dp
mat(6,6) = mat(6,6)+(gp**2*Qd*QHu*vu**2)/2._dp
mat(6,6) = mat(6,6)+md2(3,3)
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vd**2*Conjg(Yd(3,j1))*Yd(3,j1))/2._dp
End Do 

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,MSd2,ZD,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,6
  If (Abs(MSd2(i1)).Le.MaxMassNumericalZero) MSd2(i1) = 1.E-10_dp 
  If (MSd2(i1).ne.MSd2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MSd2(i1).Ge.0._dp) Then 
  MSd(i1)=Sqrt(MSd2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MSd2(i1) 
    End If 
  MSd(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MSd2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MSd2(i1) 
  MSd2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMSd 

Subroutine CalculateMSv(g1,g2,gp,Ql,QHd,QHu,Qs,Qs1,Qs2,Qs3,Qv,lam,Yv,Tv,              & 
& ml2,mv2,vd,vu,vS,vS1,vS2,vS3,ZV,MSv,MSv2,kont)

Real(dp), Intent(in) :: g1,g2,gp,Ql,QHd,QHu,Qs,Qs1,Qs2,Qs3,Qv,vd,vu,vS,vS1,vS2,vS3

Complex(dp), Intent(in) :: lam,Yv(3,3),Tv(3,3),ml2(3,3),mv2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MSv(6), MSv2(6) 
Complex(dp), Intent(out) :: ZV(6,6) 
 
Complex(dp) :: mat(6,6)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMSv'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g1**2*vd**2)/8._dp
mat(1,1) = mat(1,1)+(g2**2*vd**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Ql*vd**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Ql*Qs*vS**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Ql*Qs1*vS1**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Ql*Qs2*vS2**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Ql*Qs3*vS3**2)/2._dp
mat(1,1) = mat(1,1)-(g1**2*vu**2)/8._dp
mat(1,1) = mat(1,1)-(g2**2*vu**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHu*Ql*vu**2)/2._dp
mat(1,1) = mat(1,1)+ml2(1,1)
Do j1 = 1,3
mat(1,1) = mat(1,1)+(vu**2*Conjg(Yv(1,j1))*Yv(1,j1))/2._dp
End Do 
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+ml2(1,2)
Do j1 = 1,3
mat(1,2) = mat(1,2)+(vu**2*Conjg(Yv(1,j1))*Yv(2,j1))/2._dp
End Do 
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+ml2(1,3)
Do j1 = 1,3
mat(1,3) = mat(1,3)+(vu**2*Conjg(Yv(1,j1))*Yv(3,j1))/2._dp
End Do 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-(vd*vS*lam*Conjg(Yv(1,1)))/2._dp
mat(1,4) = mat(1,4)+(vu*Conjg(Tv(1,1)))/sqrt(2._dp)
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)-(vd*vS*lam*Conjg(Yv(1,2)))/2._dp
mat(1,5) = mat(1,5)+(vu*Conjg(Tv(1,2)))/sqrt(2._dp)
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)-(vd*vS*lam*Conjg(Yv(1,3)))/2._dp
mat(1,6) = mat(1,6)+(vu*Conjg(Tv(1,3)))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g1**2*vd**2)/8._dp
mat(2,2) = mat(2,2)+(g2**2*vd**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHd*Ql*vd**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Ql*Qs*vS**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Ql*Qs1*vS1**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Ql*Qs2*vS2**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Ql*Qs3*vS3**2)/2._dp
mat(2,2) = mat(2,2)-(g1**2*vu**2)/8._dp
mat(2,2) = mat(2,2)-(g2**2*vu**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Ql*vu**2)/2._dp
mat(2,2) = mat(2,2)+ml2(2,2)
Do j1 = 1,3
mat(2,2) = mat(2,2)+(vu**2*Conjg(Yv(2,j1))*Yv(2,j1))/2._dp
End Do 
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+ml2(2,3)
Do j1 = 1,3
mat(2,3) = mat(2,3)+(vu**2*Conjg(Yv(2,j1))*Yv(3,j1))/2._dp
End Do 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-(vd*vS*lam*Conjg(Yv(2,1)))/2._dp
mat(2,4) = mat(2,4)+(vu*Conjg(Tv(2,1)))/sqrt(2._dp)
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)-(vd*vS*lam*Conjg(Yv(2,2)))/2._dp
mat(2,5) = mat(2,5)+(vu*Conjg(Tv(2,2)))/sqrt(2._dp)
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)-(vd*vS*lam*Conjg(Yv(2,3)))/2._dp
mat(2,6) = mat(2,6)+(vu*Conjg(Tv(2,3)))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(g1**2*vd**2)/8._dp
mat(3,3) = mat(3,3)+(g2**2*vd**2)/8._dp
mat(3,3) = mat(3,3)+(gp**2*QHd*Ql*vd**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Ql*Qs*vS**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Ql*Qs1*vS1**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Ql*Qs2*vS2**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Ql*Qs3*vS3**2)/2._dp
mat(3,3) = mat(3,3)-(g1**2*vu**2)/8._dp
mat(3,3) = mat(3,3)-(g2**2*vu**2)/8._dp
mat(3,3) = mat(3,3)+(gp**2*QHu*Ql*vu**2)/2._dp
mat(3,3) = mat(3,3)+ml2(3,3)
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vu**2*Conjg(Yv(3,j1))*Yv(3,j1))/2._dp
End Do 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)-(vd*vS*lam*Conjg(Yv(3,1)))/2._dp
mat(3,4) = mat(3,4)+(vu*Conjg(Tv(3,1)))/sqrt(2._dp)
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)-(vd*vS*lam*Conjg(Yv(3,2)))/2._dp
mat(3,5) = mat(3,5)+(vu*Conjg(Tv(3,2)))/sqrt(2._dp)
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)-(vd*vS*lam*Conjg(Yv(3,3)))/2._dp
mat(3,6) = mat(3,6)+(vu*Conjg(Tv(3,3)))/sqrt(2._dp)
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+(gp**2*QHd*Qv*vd**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs*Qv*vS**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs1*Qv*vS1**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs2*Qv*vS2**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs3*Qv*vS3**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*QHu*Qv*vu**2)/2._dp
mat(4,4) = mat(4,4)+mv2(1,1)
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vu**2*Conjg(Yv(j1,1))*Yv(j1,1))/2._dp
End Do 
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+mv2(1,2)
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vu**2*Conjg(Yv(j1,2))*Yv(j1,1))/2._dp
End Do 
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)+mv2(1,3)
Do j1 = 1,3
mat(4,6) = mat(4,6)+(vu**2*Conjg(Yv(j1,3))*Yv(j1,1))/2._dp
End Do 
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+(gp**2*QHd*Qv*vd**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs*Qv*vS**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs1*Qv*vS1**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs2*Qv*vS2**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs3*Qv*vS3**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*QHu*Qv*vu**2)/2._dp
mat(5,5) = mat(5,5)+mv2(2,2)
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vu**2*Conjg(Yv(j1,2))*Yv(j1,2))/2._dp
End Do 
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+mv2(2,3)
Do j1 = 1,3
mat(5,6) = mat(5,6)+(vu**2*Conjg(Yv(j1,3))*Yv(j1,2))/2._dp
End Do 
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)+(gp**2*QHd*Qv*vd**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs*Qv*vS**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs1*Qv*vS1**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs2*Qv*vS2**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs3*Qv*vS3**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*QHu*Qv*vu**2)/2._dp
mat(6,6) = mat(6,6)+mv2(3,3)
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vu**2*Conjg(Yv(j1,3))*Yv(j1,3))/2._dp
End Do 

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,MSv2,ZV,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,6
  If (Abs(MSv2(i1)).Le.MaxMassNumericalZero) MSv2(i1) = 1.E-10_dp 
  If (MSv2(i1).ne.MSv2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MSv2(i1).Ge.0._dp) Then 
  MSv(i1)=Sqrt(MSv2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MSv2(i1) 
    End If 
  MSv(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MSv2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MSv2(i1) 
  MSv2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMSv 

Subroutine CalculateMSu(g1,g2,gp,Qq,QHd,QHu,Qu,Qs,Qs1,Qs2,Qs3,lam,Yu,Tu,              & 
& mq2,mu2,vd,vu,vS,vS1,vS2,vS3,ZU,MSu,MSu2,kont)

Real(dp), Intent(in) :: g1,g2,gp,Qq,QHd,QHu,Qu,Qs,Qs1,Qs2,Qs3,vd,vu,vS,vS1,vS2,vS3

Complex(dp), Intent(in) :: lam,Yu(3,3),Tu(3,3),mq2(3,3),mu2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MSu(6), MSu2(6) 
Complex(dp), Intent(out) :: ZU(6,6) 
 
Complex(dp) :: mat(6,6)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMSu'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-(g1**2*vd**2)/24._dp
mat(1,1) = mat(1,1)+(g2**2*vd**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qq*vd**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Qq*Qs*vS**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Qq*Qs1*vS1**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Qq*Qs2*vS2**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Qq*Qs3*vS3**2)/2._dp
mat(1,1) = mat(1,1)+(g1**2*vu**2)/24._dp
mat(1,1) = mat(1,1)-(g2**2*vu**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHu*Qq*vu**2)/2._dp
mat(1,1) = mat(1,1)+mq2(1,1)
Do j1 = 1,3
mat(1,1) = mat(1,1)+(vu**2*Conjg(Yu(j1,1))*Yu(j1,1))/2._dp
End Do 
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+mq2(1,2)
Do j1 = 1,3
mat(1,2) = mat(1,2)+(vu**2*Conjg(Yu(j1,1))*Yu(j1,2))/2._dp
End Do 
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+mq2(1,3)
Do j1 = 1,3
mat(1,3) = mat(1,3)+(vu**2*Conjg(Yu(j1,1))*Yu(j1,3))/2._dp
End Do 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-(vd*vS*lam*Conjg(Yu(1,1)))/2._dp
mat(1,4) = mat(1,4)+(vu*Conjg(Tu(1,1)))/sqrt(2._dp)
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)-(vd*vS*lam*Conjg(Yu(2,1)))/2._dp
mat(1,5) = mat(1,5)+(vu*Conjg(Tu(2,1)))/sqrt(2._dp)
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)-(vd*vS*lam*Conjg(Yu(3,1)))/2._dp
mat(1,6) = mat(1,6)+(vu*Conjg(Tu(3,1)))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-(g1**2*vd**2)/24._dp
mat(2,2) = mat(2,2)+(g2**2*vd**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHd*Qq*vd**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Qq*Qs*vS**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Qq*Qs1*vS1**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Qq*Qs2*vS2**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Qq*Qs3*vS3**2)/2._dp
mat(2,2) = mat(2,2)+(g1**2*vu**2)/24._dp
mat(2,2) = mat(2,2)-(g2**2*vu**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qq*vu**2)/2._dp
mat(2,2) = mat(2,2)+mq2(2,2)
Do j1 = 1,3
mat(2,2) = mat(2,2)+(vu**2*Conjg(Yu(j1,2))*Yu(j1,2))/2._dp
End Do 
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+mq2(2,3)
Do j1 = 1,3
mat(2,3) = mat(2,3)+(vu**2*Conjg(Yu(j1,2))*Yu(j1,3))/2._dp
End Do 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-(vd*vS*lam*Conjg(Yu(1,2)))/2._dp
mat(2,4) = mat(2,4)+(vu*Conjg(Tu(1,2)))/sqrt(2._dp)
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)-(vd*vS*lam*Conjg(Yu(2,2)))/2._dp
mat(2,5) = mat(2,5)+(vu*Conjg(Tu(2,2)))/sqrt(2._dp)
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)-(vd*vS*lam*Conjg(Yu(3,2)))/2._dp
mat(2,6) = mat(2,6)+(vu*Conjg(Tu(3,2)))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-(g1**2*vd**2)/24._dp
mat(3,3) = mat(3,3)+(g2**2*vd**2)/8._dp
mat(3,3) = mat(3,3)+(gp**2*QHd*Qq*vd**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qq*Qs*vS**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qq*Qs1*vS1**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qq*Qs2*vS2**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qq*Qs3*vS3**2)/2._dp
mat(3,3) = mat(3,3)+(g1**2*vu**2)/24._dp
mat(3,3) = mat(3,3)-(g2**2*vu**2)/8._dp
mat(3,3) = mat(3,3)+(gp**2*QHu*Qq*vu**2)/2._dp
mat(3,3) = mat(3,3)+mq2(3,3)
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vu**2*Conjg(Yu(j1,3))*Yu(j1,3))/2._dp
End Do 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)-(vd*vS*lam*Conjg(Yu(1,3)))/2._dp
mat(3,4) = mat(3,4)+(vu*Conjg(Tu(1,3)))/sqrt(2._dp)
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)-(vd*vS*lam*Conjg(Yu(2,3)))/2._dp
mat(3,5) = mat(3,5)+(vu*Conjg(Tu(2,3)))/sqrt(2._dp)
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)-(vd*vS*lam*Conjg(Yu(3,3)))/2._dp
mat(3,6) = mat(3,6)+(vu*Conjg(Tu(3,3)))/sqrt(2._dp)
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+(g1**2*vd**2)/6._dp
mat(4,4) = mat(4,4)+(gp**2*QHd*Qu*vd**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs*Qu*vS**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs1*Qu*vS1**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs2*Qu*vS2**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs3*Qu*vS3**2)/2._dp
mat(4,4) = mat(4,4)-(g1**2*vu**2)/6._dp
mat(4,4) = mat(4,4)+(gp**2*QHu*Qu*vu**2)/2._dp
mat(4,4) = mat(4,4)+mu2(1,1)
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vu**2*Conjg(Yu(1,j1))*Yu(1,j1))/2._dp
End Do 
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+mu2(1,2)
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vu**2*Conjg(Yu(2,j1))*Yu(1,j1))/2._dp
End Do 
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)+mu2(1,3)
Do j1 = 1,3
mat(4,6) = mat(4,6)+(vu**2*Conjg(Yu(3,j1))*Yu(1,j1))/2._dp
End Do 
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+(g1**2*vd**2)/6._dp
mat(5,5) = mat(5,5)+(gp**2*QHd*Qu*vd**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs*Qu*vS**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs1*Qu*vS1**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs2*Qu*vS2**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs3*Qu*vS3**2)/2._dp
mat(5,5) = mat(5,5)-(g1**2*vu**2)/6._dp
mat(5,5) = mat(5,5)+(gp**2*QHu*Qu*vu**2)/2._dp
mat(5,5) = mat(5,5)+mu2(2,2)
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vu**2*Conjg(Yu(2,j1))*Yu(2,j1))/2._dp
End Do 
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+mu2(2,3)
Do j1 = 1,3
mat(5,6) = mat(5,6)+(vu**2*Conjg(Yu(3,j1))*Yu(2,j1))/2._dp
End Do 
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)+(g1**2*vd**2)/6._dp
mat(6,6) = mat(6,6)+(gp**2*QHd*Qu*vd**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs*Qu*vS**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs1*Qu*vS1**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs2*Qu*vS2**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs3*Qu*vS3**2)/2._dp
mat(6,6) = mat(6,6)-(g1**2*vu**2)/6._dp
mat(6,6) = mat(6,6)+(gp**2*QHu*Qu*vu**2)/2._dp
mat(6,6) = mat(6,6)+mu2(3,3)
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vu**2*Conjg(Yu(3,j1))*Yu(3,j1))/2._dp
End Do 

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,MSu2,ZU,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,6
  If (Abs(MSu2(i1)).Le.MaxMassNumericalZero) MSu2(i1) = 1.E-10_dp 
  If (MSu2(i1).ne.MSu2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MSu2(i1).Ge.0._dp) Then 
  MSu(i1)=Sqrt(MSu2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MSu2(i1) 
    End If 
  MSu(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MSu2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MSu2(i1) 
  MSu2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMSu 

Subroutine CalculateMSe(g1,g2,gp,Ql,QHd,QHu,Qe,Qs,Qs1,Qs2,Qs3,Ye,Te,lam,              & 
& ml2,me2,vd,vu,vS,vS1,vS2,vS3,ZE,MSe,MSe2,kont)

Real(dp), Intent(in) :: g1,g2,gp,Ql,QHd,QHu,Qe,Qs,Qs1,Qs2,Qs3,vd,vu,vS,vS1,vS2,vS3

Complex(dp), Intent(in) :: Ye(3,3),Te(3,3),lam,ml2(3,3),me2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MSe(6), MSe2(6) 
Complex(dp), Intent(out) :: ZE(6,6) 
 
Complex(dp) :: mat(6,6)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMSe'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g1**2*vd**2)/8._dp
mat(1,1) = mat(1,1)-(g2**2*vd**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Ql*vd**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Ql*Qs*vS**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Ql*Qs1*vS1**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Ql*Qs2*vS2**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Ql*Qs3*vS3**2)/2._dp
mat(1,1) = mat(1,1)-(g1**2*vu**2)/8._dp
mat(1,1) = mat(1,1)+(g2**2*vu**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHu*Ql*vu**2)/2._dp
mat(1,1) = mat(1,1)+ml2(1,1)
Do j1 = 1,3
mat(1,1) = mat(1,1)+(vd**2*Conjg(Ye(j1,1))*Ye(j1,1))/2._dp
End Do 
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+ml2(1,2)
Do j1 = 1,3
mat(1,2) = mat(1,2)+(vd**2*Conjg(Ye(j1,1))*Ye(j1,2))/2._dp
End Do 
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+ml2(1,3)
Do j1 = 1,3
mat(1,3) = mat(1,3)+(vd**2*Conjg(Ye(j1,1))*Ye(j1,3))/2._dp
End Do 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-(vS*vu*lam*Conjg(Ye(1,1)))/2._dp
mat(1,4) = mat(1,4)+(vd*Conjg(Te(1,1)))/sqrt(2._dp)
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)-(vS*vu*lam*Conjg(Ye(2,1)))/2._dp
mat(1,5) = mat(1,5)+(vd*Conjg(Te(2,1)))/sqrt(2._dp)
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)-(vS*vu*lam*Conjg(Ye(3,1)))/2._dp
mat(1,6) = mat(1,6)+(vd*Conjg(Te(3,1)))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g1**2*vd**2)/8._dp
mat(2,2) = mat(2,2)-(g2**2*vd**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHd*Ql*vd**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Ql*Qs*vS**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Ql*Qs1*vS1**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Ql*Qs2*vS2**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Ql*Qs3*vS3**2)/2._dp
mat(2,2) = mat(2,2)-(g1**2*vu**2)/8._dp
mat(2,2) = mat(2,2)+(g2**2*vu**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Ql*vu**2)/2._dp
mat(2,2) = mat(2,2)+ml2(2,2)
Do j1 = 1,3
mat(2,2) = mat(2,2)+(vd**2*Conjg(Ye(j1,2))*Ye(j1,2))/2._dp
End Do 
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+ml2(2,3)
Do j1 = 1,3
mat(2,3) = mat(2,3)+(vd**2*Conjg(Ye(j1,2))*Ye(j1,3))/2._dp
End Do 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-(vS*vu*lam*Conjg(Ye(1,2)))/2._dp
mat(2,4) = mat(2,4)+(vd*Conjg(Te(1,2)))/sqrt(2._dp)
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)-(vS*vu*lam*Conjg(Ye(2,2)))/2._dp
mat(2,5) = mat(2,5)+(vd*Conjg(Te(2,2)))/sqrt(2._dp)
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)-(vS*vu*lam*Conjg(Ye(3,2)))/2._dp
mat(2,6) = mat(2,6)+(vd*Conjg(Te(3,2)))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(g1**2*vd**2)/8._dp
mat(3,3) = mat(3,3)-(g2**2*vd**2)/8._dp
mat(3,3) = mat(3,3)+(gp**2*QHd*Ql*vd**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Ql*Qs*vS**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Ql*Qs1*vS1**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Ql*Qs2*vS2**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Ql*Qs3*vS3**2)/2._dp
mat(3,3) = mat(3,3)-(g1**2*vu**2)/8._dp
mat(3,3) = mat(3,3)+(g2**2*vu**2)/8._dp
mat(3,3) = mat(3,3)+(gp**2*QHu*Ql*vu**2)/2._dp
mat(3,3) = mat(3,3)+ml2(3,3)
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vd**2*Conjg(Ye(j1,3))*Ye(j1,3))/2._dp
End Do 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)-(vS*vu*lam*Conjg(Ye(1,3)))/2._dp
mat(3,4) = mat(3,4)+(vd*Conjg(Te(1,3)))/sqrt(2._dp)
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)-(vS*vu*lam*Conjg(Ye(2,3)))/2._dp
mat(3,5) = mat(3,5)+(vd*Conjg(Te(2,3)))/sqrt(2._dp)
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)-(vS*vu*lam*Conjg(Ye(3,3)))/2._dp
mat(3,6) = mat(3,6)+(vd*Conjg(Te(3,3)))/sqrt(2._dp)
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)-(g1**2*vd**2)/4._dp
mat(4,4) = mat(4,4)+(gp**2*Qe*QHd*vd**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qe*Qs*vS**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qe*Qs1*vS1**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qe*Qs2*vS2**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qe*Qs3*vS3**2)/2._dp
mat(4,4) = mat(4,4)+(g1**2*vu**2)/4._dp
mat(4,4) = mat(4,4)+(gp**2*Qe*QHu*vu**2)/2._dp
mat(4,4) = mat(4,4)+me2(1,1)
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vd**2*Conjg(Ye(1,j1))*Ye(1,j1))/2._dp
End Do 
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+me2(1,2)
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vd**2*Conjg(Ye(2,j1))*Ye(1,j1))/2._dp
End Do 
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)+me2(1,3)
Do j1 = 1,3
mat(4,6) = mat(4,6)+(vd**2*Conjg(Ye(3,j1))*Ye(1,j1))/2._dp
End Do 
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)-(g1**2*vd**2)/4._dp
mat(5,5) = mat(5,5)+(gp**2*Qe*QHd*vd**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qe*Qs*vS**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qe*Qs1*vS1**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qe*Qs2*vS2**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qe*Qs3*vS3**2)/2._dp
mat(5,5) = mat(5,5)+(g1**2*vu**2)/4._dp
mat(5,5) = mat(5,5)+(gp**2*Qe*QHu*vu**2)/2._dp
mat(5,5) = mat(5,5)+me2(2,2)
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vd**2*Conjg(Ye(2,j1))*Ye(2,j1))/2._dp
End Do 
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+me2(2,3)
Do j1 = 1,3
mat(5,6) = mat(5,6)+(vd**2*Conjg(Ye(3,j1))*Ye(2,j1))/2._dp
End Do 
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)-(g1**2*vd**2)/4._dp
mat(6,6) = mat(6,6)+(gp**2*Qe*QHd*vd**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qe*Qs*vS**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qe*Qs1*vS1**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qe*Qs2*vS2**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qe*Qs3*vS3**2)/2._dp
mat(6,6) = mat(6,6)+(g1**2*vu**2)/4._dp
mat(6,6) = mat(6,6)+(gp**2*Qe*QHu*vu**2)/2._dp
mat(6,6) = mat(6,6)+me2(3,3)
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vd**2*Conjg(Ye(3,j1))*Ye(3,j1))/2._dp
End Do 

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,MSe2,ZE,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,6
  If (Abs(MSe2(i1)).Le.MaxMassNumericalZero) MSe2(i1) = 1.E-10_dp 
  If (MSe2(i1).ne.MSe2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MSe2(i1).Ge.0._dp) Then 
  MSe(i1)=Sqrt(MSe2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MSe2(i1) 
    End If 
  MSe(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MSe2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MSe2(i1) 
  MSe2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMSe 

Subroutine CalculateMhh(g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,lam,Tlam,kap,Tk,              & 
& mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3,ZH,Mhh,Mhh2,kont)

Real(dp), Intent(in) :: g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp), Intent(in) :: lam,Tlam,kap,Tk

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: Mhh(6), Mhh2(6) 
Complex(dp), Intent(out) :: ZH(6,6) 
 
Complex(dp) :: mat(6,6)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMhh'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mHd2
mat(1,1) = mat(1,1)+(3*g1**2*vd**2)/8._dp
mat(1,1) = mat(1,1)+(3*g2**2*vd**2)/8._dp
mat(1,1) = mat(1,1)+(3*gp**2*QHd**2*vd**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs*vS**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs1*vS1**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs2*vS2**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs3*vS3**2)/2._dp
mat(1,1) = mat(1,1)-(g1**2*vu**2)/8._dp
mat(1,1) = mat(1,1)-(g2**2*vu**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*QHu*vu**2)/2._dp
mat(1,1) = mat(1,1)+(vS**2*lam*Conjg(lam))/2._dp
mat(1,1) = mat(1,1)+(vu**2*lam*Conjg(lam))/2._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-(g1**2*vd*vu)/4._dp
mat(1,2) = mat(1,2)-(g2**2*vd*vu)/4._dp
mat(1,2) = mat(1,2)+gp**2*QHd*QHu*vd*vu
mat(1,2) = mat(1,2)+vd*vu*lam*Conjg(lam)
mat(1,2) = mat(1,2)-(vS*Conjg(Tlam))/(2._dp*sqrt(2._dp))
mat(1,2) = mat(1,2)-(vS*Tlam)/(2._dp*sqrt(2._dp))
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+gp**2*QHd*Qs*vd*vS
mat(1,3) = mat(1,3)+vd*vS*lam*Conjg(lam)
mat(1,3) = mat(1,3)-(vu*Conjg(Tlam))/(2._dp*sqrt(2._dp))
mat(1,3) = mat(1,3)-(vu*Tlam)/(2._dp*sqrt(2._dp))
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)+gp**2*QHd*Qs1*vd*vS1
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)+gp**2*QHd*Qs2*vd*vS2
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)+gp**2*QHd*Qs3*vd*vS3
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mHu2
mat(2,2) = mat(2,2)-(g1**2*vd**2)/8._dp
mat(2,2) = mat(2,2)-(g2**2*vd**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHd*QHu*vd**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs*vS**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs1*vS1**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs2*vS2**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs3*vS3**2)/2._dp
mat(2,2) = mat(2,2)+(3*g1**2*vu**2)/8._dp
mat(2,2) = mat(2,2)+(3*g2**2*vu**2)/8._dp
mat(2,2) = mat(2,2)+(3*gp**2*QHu**2*vu**2)/2._dp
mat(2,2) = mat(2,2)+(vd**2*lam*Conjg(lam))/2._dp
mat(2,2) = mat(2,2)+(vS**2*lam*Conjg(lam))/2._dp
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+gp**2*QHu*Qs*vS*vu
mat(2,3) = mat(2,3)+vS*vu*lam*Conjg(lam)
mat(2,3) = mat(2,3)-(vd*Conjg(Tlam))/(2._dp*sqrt(2._dp))
mat(2,3) = mat(2,3)-(vd*Tlam)/(2._dp*sqrt(2._dp))
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)+gp**2*QHu*Qs1*vS1*vu
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)+gp**2*QHu*Qs2*vS2*vu
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)+gp**2*QHu*Qs3*vS3*vu
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+ms2
mat(3,3) = mat(3,3)+(gp**2*QHd*Qs*vd**2)/2._dp
mat(3,3) = mat(3,3)+(3*gp**2*Qs**2*vS**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qs*Qs1*vS1**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qs*Qs2*vS2**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qs*Qs3*vS3**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*QHu*Qs*vu**2)/2._dp
mat(3,3) = mat(3,3)+(vd**2*lam*Conjg(lam))/2._dp
mat(3,3) = mat(3,3)+(vu**2*lam*Conjg(lam))/2._dp
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+gp**2*Qs*Qs1*vS*vS1
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)+gp**2*Qs*Qs2*vS*vS2
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)+gp**2*Qs*Qs3*vS*vS3
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+ms12
mat(4,4) = mat(4,4)+(gp**2*QHd*Qs1*vd**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs*Qs1*vS**2)/2._dp
mat(4,4) = mat(4,4)+(3*gp**2*Qs1**2*vS1**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs1*Qs2*vS2**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs1*Qs3*vS3**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*QHu*Qs1*vu**2)/2._dp
mat(4,4) = mat(4,4)+(vS2**2*kap*Conjg(kap))/18._dp
mat(4,4) = mat(4,4)+(vS3**2*kap*Conjg(kap))/18._dp
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+gp**2*Qs1*Qs2*vS1*vS2
mat(4,5) = mat(4,5)+(vS1*vS2*kap*Conjg(kap))/9._dp
mat(4,5) = mat(4,5)+(vS3*Conjg(Tk))/(6._dp*sqrt(2._dp))
mat(4,5) = mat(4,5)+(vS3*Tk)/(6._dp*sqrt(2._dp))
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)+gp**2*Qs1*Qs3*vS1*vS3
mat(4,6) = mat(4,6)+(vS1*vS3*kap*Conjg(kap))/9._dp
mat(4,6) = mat(4,6)+(vS2*Conjg(Tk))/(6._dp*sqrt(2._dp))
mat(4,6) = mat(4,6)+(vS2*Tk)/(6._dp*sqrt(2._dp))
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+ms22
mat(5,5) = mat(5,5)+(gp**2*QHd*Qs2*vd**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs*Qs2*vS**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs1*Qs2*vS1**2)/2._dp
mat(5,5) = mat(5,5)+(3*gp**2*Qs2**2*vS2**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs2*Qs3*vS3**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*QHu*Qs2*vu**2)/2._dp
mat(5,5) = mat(5,5)+(vS1**2*kap*Conjg(kap))/18._dp
mat(5,5) = mat(5,5)+(vS3**2*kap*Conjg(kap))/18._dp
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+gp**2*Qs2*Qs3*vS2*vS3
mat(5,6) = mat(5,6)+(vS2*vS3*kap*Conjg(kap))/9._dp
mat(5,6) = mat(5,6)+(vS1*Conjg(Tk))/(6._dp*sqrt(2._dp))
mat(5,6) = mat(5,6)+(vS1*Tk)/(6._dp*sqrt(2._dp))
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)+ms32
mat(6,6) = mat(6,6)+(gp**2*QHd*Qs3*vd**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs*Qs3*vS**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs1*Qs3*vS1**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs2*Qs3*vS2**2)/2._dp
mat(6,6) = mat(6,6)+(3*gp**2*Qs3**2*vS3**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*QHu*Qs3*vu**2)/2._dp
mat(6,6) = mat(6,6)+(vS1**2*kap*Conjg(kap))/18._dp
mat(6,6) = mat(6,6)+(vS2**2*kap*Conjg(kap))/18._dp

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,Mhh2,ZH,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,6
  If (Abs(Mhh2(i1)).Le.MaxMassNumericalZero) Mhh2(i1) = 1.E-10_dp 
  If (Mhh2(i1).ne.Mhh2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Mhh2(i1).Ge.0._dp) Then 
  Mhh(i1)=Sqrt(Mhh2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Mhh2(i1) 
    End If 
  Mhh(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Mhh2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,Mhh2(i1) 
  Mhh2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMhh 

Subroutine CalculateMAh(g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,lam,Tlam,kap,Tk,              & 
& mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3,TW,TWp,ZA,MAh,MAh2,kont)

Real(dp), Intent(in) :: g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,            & 
& vS2,vS3,TW,TWp

Complex(dp), Intent(in) :: lam,Tlam,kap,Tk

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MAh(6), MAh2(6) 
Complex(dp), Intent(out) :: ZA(6,6) 
 
Complex(dp) :: mat(6,6)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMAh'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mHd2
mat(1,1) = mat(1,1)+(g1**2*vd**2)/8._dp
mat(1,1) = mat(1,1)+(g2**2*vd**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHd**2*vd**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs*vS**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs1*vS1**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs2*vS2**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs3*vS3**2)/2._dp
mat(1,1) = mat(1,1)-(g1**2*vu**2)/8._dp
mat(1,1) = mat(1,1)-(g2**2*vu**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*QHu*vu**2)/2._dp
mat(1,1) = mat(1,1)+(vS**2*lam*Conjg(lam))/2._dp
mat(1,1) = mat(1,1)+(vu**2*lam*Conjg(lam))/2._dp
mat(1,1) = mat(1,1)+(g2**2*vd**2*Cos(TW)**2*Cos(TWp)**2*RXiZ)/4._dp
mat(1,1) = mat(1,1)+gp**2*QHd**2*vd**2*Cos(TWp)**2*RXiZp
mat(1,1) = mat(1,1)+(g1*g2*vd**2*Cos(TW)*Cos(TWp)**2*RXiZ*Sin(TW))/2._dp
mat(1,1) = mat(1,1)+(g1**2*vd**2*Cos(TWp)**2*RXiZ*Sin(TW)**2)/4._dp
mat(1,1) = mat(1,1)+g2*gp*QHd*vd**2*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp)
mat(1,1) = mat(1,1)-(g2*gp*QHd*vd**2*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))
mat(1,1) = mat(1,1)+g1*gp*QHd*vd**2*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp)
mat(1,1) = mat(1,1)-(g1*gp*QHd*vd**2*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))
mat(1,1) = mat(1,1)+gp**2*QHd**2*vd**2*RXiZ*Sin(TWp)**2
mat(1,1) = mat(1,1)+(g2**2*vd**2*Cos(TW)**2*RXiZp*Sin(TWp)**2)/4._dp
mat(1,1) = mat(1,1)+(g1*g2*vd**2*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)**2)/2._dp
mat(1,1) = mat(1,1)+(g1**2*vd**2*RXiZp*Sin(TW)**2*Sin(TWp)**2)/4._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(vS*Conjg(Tlam))/(2._dp*sqrt(2._dp))
mat(1,2) = mat(1,2)-(g2**2*vd*vu*Cos(TW)**2*Cos(TWp)**2*RXiZ)/4._dp
mat(1,2) = mat(1,2)+gp**2*QHd*QHu*vd*vu*Cos(TWp)**2*RXiZp
mat(1,2) = mat(1,2)-(g1*g2*vd*vu*Cos(TW)*Cos(TWp)**2*RXiZ*Sin(TW))/2._dp
mat(1,2) = mat(1,2)-(g1**2*vd*vu*Cos(TWp)**2*RXiZ*Sin(TW)**2)/4._dp
mat(1,2) = mat(1,2)-(g2*gp*QHd*vd*vu*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))/2._dp
mat(1,2) = mat(1,2)+(g2*gp*QHu*vd*vu*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))/2._dp
mat(1,2) = mat(1,2)+(g2*gp*QHd*vd*vu*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat(1,2) = mat(1,2)-(g2*gp*QHu*vd*vu*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat(1,2) = mat(1,2)-(g1*gp*QHd*vd*vu*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat(1,2) = mat(1,2)+(g1*gp*QHu*vd*vu*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat(1,2) = mat(1,2)+(g1*gp*QHd*vd*vu*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat(1,2) = mat(1,2)-(g1*gp*QHu*vd*vu*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat(1,2) = mat(1,2)+gp**2*QHd*QHu*vd*vu*RXiZ*Sin(TWp)**2
mat(1,2) = mat(1,2)-(g2**2*vd*vu*Cos(TW)**2*RXiZp*Sin(TWp)**2)/4._dp
mat(1,2) = mat(1,2)-(g1*g2*vd*vu*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)**2)/2._dp
mat(1,2) = mat(1,2)-(g1**2*vd*vu*RXiZp*Sin(TW)**2*Sin(TWp)**2)/4._dp
mat(1,2) = mat(1,2)+(vS*Tlam)/(2._dp*sqrt(2._dp))
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(vu*Conjg(Tlam))/(2._dp*sqrt(2._dp))
mat(1,3) = mat(1,3)+gp**2*QHd*Qs*vd*vS*Cos(TWp)**2*RXiZp
mat(1,3) = mat(1,3)+(g2*gp*Qs*vd*vS*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))/2._dp
mat(1,3) = mat(1,3)-(g2*gp*Qs*vd*vS*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat(1,3) = mat(1,3)+(g1*gp*Qs*vd*vS*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat(1,3) = mat(1,3)-(g1*gp*Qs*vd*vS*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat(1,3) = mat(1,3)+gp**2*QHd*Qs*vd*vS*RXiZ*Sin(TWp)**2
mat(1,3) = mat(1,3)+(vu*Tlam)/(2._dp*sqrt(2._dp))
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)+gp**2*QHd*Qs1*vd*vS1*Cos(TWp)**2*RXiZp
mat(1,4) = mat(1,4)+(g2*gp*Qs1*vd*vS1*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))/2._dp
mat(1,4) = mat(1,4)-(g2*gp*Qs1*vd*vS1*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat(1,4) = mat(1,4)+(g1*gp*Qs1*vd*vS1*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat(1,4) = mat(1,4)-(g1*gp*Qs1*vd*vS1*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat(1,4) = mat(1,4)+gp**2*QHd*Qs1*vd*vS1*RXiZ*Sin(TWp)**2
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)+gp**2*QHd*Qs2*vd*vS2*Cos(TWp)**2*RXiZp
mat(1,5) = mat(1,5)+(g2*gp*Qs2*vd*vS2*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))/2._dp
mat(1,5) = mat(1,5)-(g2*gp*Qs2*vd*vS2*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat(1,5) = mat(1,5)+(g1*gp*Qs2*vd*vS2*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat(1,5) = mat(1,5)-(g1*gp*Qs2*vd*vS2*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat(1,5) = mat(1,5)+gp**2*QHd*Qs2*vd*vS2*RXiZ*Sin(TWp)**2
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)+gp**2*QHd*Qs3*vd*vS3*Cos(TWp)**2*RXiZp
mat(1,6) = mat(1,6)+(g2*gp*Qs3*vd*vS3*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))/2._dp
mat(1,6) = mat(1,6)-(g2*gp*Qs3*vd*vS3*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat(1,6) = mat(1,6)+(g1*gp*Qs3*vd*vS3*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat(1,6) = mat(1,6)-(g1*gp*Qs3*vd*vS3*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat(1,6) = mat(1,6)+gp**2*QHd*Qs3*vd*vS3*RXiZ*Sin(TWp)**2
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mHu2
mat(2,2) = mat(2,2)-(g1**2*vd**2)/8._dp
mat(2,2) = mat(2,2)-(g2**2*vd**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHd*QHu*vd**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs*vS**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs1*vS1**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs2*vS2**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs3*vS3**2)/2._dp
mat(2,2) = mat(2,2)+(g1**2*vu**2)/8._dp
mat(2,2) = mat(2,2)+(g2**2*vu**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHu**2*vu**2)/2._dp
mat(2,2) = mat(2,2)+(vd**2*lam*Conjg(lam))/2._dp
mat(2,2) = mat(2,2)+(vS**2*lam*Conjg(lam))/2._dp
mat(2,2) = mat(2,2)+(g2**2*vu**2*Cos(TW)**2*Cos(TWp)**2*RXiZ)/4._dp
mat(2,2) = mat(2,2)+gp**2*QHu**2*vu**2*Cos(TWp)**2*RXiZp
mat(2,2) = mat(2,2)+(g1*g2*vu**2*Cos(TW)*Cos(TWp)**2*RXiZ*Sin(TW))/2._dp
mat(2,2) = mat(2,2)+(g1**2*vu**2*Cos(TWp)**2*RXiZ*Sin(TW)**2)/4._dp
mat(2,2) = mat(2,2)-(g2*gp*QHu*vu**2*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))
mat(2,2) = mat(2,2)+g2*gp*QHu*vu**2*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp)
mat(2,2) = mat(2,2)-(g1*gp*QHu*vu**2*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))
mat(2,2) = mat(2,2)+g1*gp*QHu*vu**2*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp)
mat(2,2) = mat(2,2)+gp**2*QHu**2*vu**2*RXiZ*Sin(TWp)**2
mat(2,2) = mat(2,2)+(g2**2*vu**2*Cos(TW)**2*RXiZp*Sin(TWp)**2)/4._dp
mat(2,2) = mat(2,2)+(g1*g2*vu**2*Cos(TW)*RXiZp*Sin(TW)*Sin(TWp)**2)/2._dp
mat(2,2) = mat(2,2)+(g1**2*vu**2*RXiZp*Sin(TW)**2*Sin(TWp)**2)/4._dp
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(vd*Conjg(Tlam))/(2._dp*sqrt(2._dp))
mat(2,3) = mat(2,3)+gp**2*QHu*Qs*vS*vu*Cos(TWp)**2*RXiZp
mat(2,3) = mat(2,3)-(g2*gp*Qs*vS*vu*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))/2._dp
mat(2,3) = mat(2,3)+(g2*gp*Qs*vS*vu*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat(2,3) = mat(2,3)-(g1*gp*Qs*vS*vu*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat(2,3) = mat(2,3)+(g1*gp*Qs*vS*vu*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat(2,3) = mat(2,3)+gp**2*QHu*Qs*vS*vu*RXiZ*Sin(TWp)**2
mat(2,3) = mat(2,3)+(vd*Tlam)/(2._dp*sqrt(2._dp))
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)+gp**2*QHu*Qs1*vS1*vu*Cos(TWp)**2*RXiZp
mat(2,4) = mat(2,4)-(g2*gp*Qs1*vS1*vu*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))/2._dp
mat(2,4) = mat(2,4)+(g2*gp*Qs1*vS1*vu*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat(2,4) = mat(2,4)-(g1*gp*Qs1*vS1*vu*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat(2,4) = mat(2,4)+(g1*gp*Qs1*vS1*vu*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat(2,4) = mat(2,4)+gp**2*QHu*Qs1*vS1*vu*RXiZ*Sin(TWp)**2
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)+gp**2*QHu*Qs2*vS2*vu*Cos(TWp)**2*RXiZp
mat(2,5) = mat(2,5)-(g2*gp*Qs2*vS2*vu*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))/2._dp
mat(2,5) = mat(2,5)+(g2*gp*Qs2*vS2*vu*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat(2,5) = mat(2,5)-(g1*gp*Qs2*vS2*vu*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat(2,5) = mat(2,5)+(g1*gp*Qs2*vS2*vu*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat(2,5) = mat(2,5)+gp**2*QHu*Qs2*vS2*vu*RXiZ*Sin(TWp)**2
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)+gp**2*QHu*Qs3*vS3*vu*Cos(TWp)**2*RXiZp
mat(2,6) = mat(2,6)-(g2*gp*Qs3*vS3*vu*Cos(TW)*Cos(TWp)*RXiZ*Sin(TWp))/2._dp
mat(2,6) = mat(2,6)+(g2*gp*Qs3*vS3*vu*Cos(TW)*Cos(TWp)*RXiZp*Sin(TWp))/2._dp
mat(2,6) = mat(2,6)-(g1*gp*Qs3*vS3*vu*Cos(TWp)*RXiZ*Sin(TW)*Sin(TWp))/2._dp
mat(2,6) = mat(2,6)+(g1*gp*Qs3*vS3*vu*Cos(TWp)*RXiZp*Sin(TW)*Sin(TWp))/2._dp
mat(2,6) = mat(2,6)+gp**2*QHu*Qs3*vS3*vu*RXiZ*Sin(TWp)**2
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+ms2
mat(3,3) = mat(3,3)+(gp**2*QHd*Qs*vd**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qs**2*vS**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qs*Qs1*vS1**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qs*Qs2*vS2**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qs*Qs3*vS3**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*QHu*Qs*vu**2)/2._dp
mat(3,3) = mat(3,3)+(vd**2*lam*Conjg(lam))/2._dp
mat(3,3) = mat(3,3)+(vu**2*lam*Conjg(lam))/2._dp
mat(3,3) = mat(3,3)+gp**2*Qs**2*vS**2*Cos(TWp)**2*RXiZp
mat(3,3) = mat(3,3)+gp**2*Qs**2*vS**2*RXiZ*Sin(TWp)**2
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+gp**2*Qs*Qs1*vS*vS1*Cos(TWp)**2*RXiZp
mat(3,4) = mat(3,4)+gp**2*Qs*Qs1*vS*vS1*RXiZ*Sin(TWp)**2
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)+gp**2*Qs*Qs2*vS*vS2*Cos(TWp)**2*RXiZp
mat(3,5) = mat(3,5)+gp**2*Qs*Qs2*vS*vS2*RXiZ*Sin(TWp)**2
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)+gp**2*Qs*Qs3*vS*vS3*Cos(TWp)**2*RXiZp
mat(3,6) = mat(3,6)+gp**2*Qs*Qs3*vS*vS3*RXiZ*Sin(TWp)**2
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+ms12
mat(4,4) = mat(4,4)+(gp**2*QHd*Qs1*vd**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs*Qs1*vS**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs1**2*vS1**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs1*Qs2*vS2**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs1*Qs3*vS3**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*QHu*Qs1*vu**2)/2._dp
mat(4,4) = mat(4,4)+(vS2**2*kap*Conjg(kap))/18._dp
mat(4,4) = mat(4,4)+(vS3**2*kap*Conjg(kap))/18._dp
mat(4,4) = mat(4,4)+gp**2*Qs1**2*vS1**2*Cos(TWp)**2*RXiZp
mat(4,4) = mat(4,4)+gp**2*Qs1**2*vS1**2*RXiZ*Sin(TWp)**2
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)-(vS3*Conjg(Tk))/(6._dp*sqrt(2._dp))
mat(4,5) = mat(4,5)+gp**2*Qs1*Qs2*vS1*vS2*Cos(TWp)**2*RXiZp
mat(4,5) = mat(4,5)+gp**2*Qs1*Qs2*vS1*vS2*RXiZ*Sin(TWp)**2
mat(4,5) = mat(4,5)-(vS3*Tk)/(6._dp*sqrt(2._dp))
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)-(vS2*Conjg(Tk))/(6._dp*sqrt(2._dp))
mat(4,6) = mat(4,6)+gp**2*Qs1*Qs3*vS1*vS3*Cos(TWp)**2*RXiZp
mat(4,6) = mat(4,6)+gp**2*Qs1*Qs3*vS1*vS3*RXiZ*Sin(TWp)**2
mat(4,6) = mat(4,6)-(vS2*Tk)/(6._dp*sqrt(2._dp))
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+ms22
mat(5,5) = mat(5,5)+(gp**2*QHd*Qs2*vd**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs*Qs2*vS**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs1*Qs2*vS1**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs2**2*vS2**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs2*Qs3*vS3**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*QHu*Qs2*vu**2)/2._dp
mat(5,5) = mat(5,5)+(vS1**2*kap*Conjg(kap))/18._dp
mat(5,5) = mat(5,5)+(vS3**2*kap*Conjg(kap))/18._dp
mat(5,5) = mat(5,5)+gp**2*Qs2**2*vS2**2*Cos(TWp)**2*RXiZp
mat(5,5) = mat(5,5)+gp**2*Qs2**2*vS2**2*RXiZ*Sin(TWp)**2
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)-(vS1*Conjg(Tk))/(6._dp*sqrt(2._dp))
mat(5,6) = mat(5,6)+gp**2*Qs2*Qs3*vS2*vS3*Cos(TWp)**2*RXiZp
mat(5,6) = mat(5,6)+gp**2*Qs2*Qs3*vS2*vS3*RXiZ*Sin(TWp)**2
mat(5,6) = mat(5,6)-(vS1*Tk)/(6._dp*sqrt(2._dp))
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)+ms32
mat(6,6) = mat(6,6)+(gp**2*QHd*Qs3*vd**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs*Qs3*vS**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs1*Qs3*vS1**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs2*Qs3*vS2**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs3**2*vS3**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*QHu*Qs3*vu**2)/2._dp
mat(6,6) = mat(6,6)+(vS1**2*kap*Conjg(kap))/18._dp
mat(6,6) = mat(6,6)+(vS2**2*kap*Conjg(kap))/18._dp
mat(6,6) = mat(6,6)+gp**2*Qs3**2*vS3**2*Cos(TWp)**2*RXiZp
mat(6,6) = mat(6,6)+gp**2*Qs3**2*vS3**2*RXiZ*Sin(TWp)**2

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,MAh2,ZA,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,6
  If (Abs(MAh2(i1)).Le.MaxMassNumericalZero) MAh2(i1) = 1.E-10_dp 
  If (MAh2(i1).ne.MAh2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MAh2(i1).Ge.0._dp) Then 
  MAh(i1)=Sqrt(MAh2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MAh2(i1) 
    End If 
  MAh(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MAh2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MAh2(i1) 
  MAh2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMAh 

Subroutine CalculateMHpm(g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,lam,Tlam,mHd2,               & 
& mHu2,vd,vu,vS,vS1,vS2,vS3,ZP,MHpm,MHpm2,kont)

Real(dp), Intent(in) :: g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,mHd2,mHu2,vd,vu,vS,vS1,vS2,vS3

Complex(dp), Intent(in) :: lam,Tlam

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MHpm(2), MHpm2(2) 
Real(dp), Intent(out) :: ZP(2,2) 
 
Real(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMHpm'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mHd2
mat(1,1) = mat(1,1)+(g1**2*vd**2)/8._dp
mat(1,1) = mat(1,1)+(g2**2*vd**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHd**2*vd**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs*vS**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs1*vS1**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs2*vS2**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs3*vS3**2)/2._dp
mat(1,1) = mat(1,1)-(g1**2*vu**2)/8._dp
mat(1,1) = mat(1,1)+(g2**2*vu**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*QHu*vu**2)/2._dp
mat(1,1) = mat(1,1)+(vS**2*lam*Conjg(lam))/2._dp
mat(1,1) = mat(1,1)+(g2**2*vd**2*RXiWm)/4._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(g2**2*vd*vu)/4._dp
mat(1,2) = mat(1,2)-(vd*vu*lam*Conjg(lam))/2._dp
mat(1,2) = mat(1,2)+(vS*Conjg(Tlam))/sqrt(2._dp)
mat(1,2) = mat(1,2)-(g2**2*vd*vu*RXiWm)/4._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mHu2
mat(2,2) = mat(2,2)-(g1**2*vd**2)/8._dp
mat(2,2) = mat(2,2)+(g2**2*vd**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHd*QHu*vd**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs*vS**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs1*vS1**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs2*vS2**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs3*vS3**2)/2._dp
mat(2,2) = mat(2,2)+(g1**2*vu**2)/8._dp
mat(2,2) = mat(2,2)+(g2**2*vu**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHu**2*vu**2)/2._dp
mat(2,2) = mat(2,2)+(vS**2*lam*Conjg(lam))/2._dp
mat(2,2) = mat(2,2)+(g2**2*vu**2*RXiWm)/4._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,MHpm2,ZP,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(MHpm2(i1)).Le.MaxMassNumericalZero) MHpm2(i1) = 1.E-10_dp 
  If (MHpm2(i1).ne.MHpm2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MHpm2(i1).Ge.0._dp) Then 
  MHpm(i1)=Sqrt(MHpm2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MHpm2(i1) 
    End If 
  MHpm(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MHpm2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MHpm2(i1) 
  MHpm2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMHpm 

Subroutine CalculateMChi(g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,lam,kap,M1,M2,               & 
& M4,vd,vu,vS,vS1,vS2,vS3,ZN,MChi,kont)

Real(dp) ,Intent(in) :: g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,vd,vu,vS,vS1,vS2,vS3

Complex(dp) ,Intent(in) :: lam,kap,M1,M2,M4

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Logical :: SecondDiagonalisationNeeded 
Real(dp), Intent(out) :: MChi(9) 
Complex(dp), Intent(out) ::  ZN(9,9) 
                              
Complex(dp) :: mat(9,9), mat2(9,9), phaseM, E9(9) 

Real(dp) :: ZNa(9,9), test(2), eig(9) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMChi'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+M4
mat(1,2) = 0._dp 
mat(1,3) = 0._dp 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)+gp*QHd*vd
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)+gp*QHu*vu
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)+gp*Qs*vS
mat(1,7) = 0._dp 
mat(1,7) = mat(1,7)+gp*Qs1*vS1
mat(1,8) = 0._dp 
mat(1,8) = mat(1,8)+gp*Qs2*vS2
mat(1,9) = 0._dp 
mat(1,9) = mat(1,9)+gp*Qs3*vS3
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+M1
mat(2,3) = 0._dp 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-(g1*vd)/2._dp
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)+(g1*vu)/2._dp
mat(2,6) = 0._dp 
mat(2,7) = 0._dp 
mat(2,8) = 0._dp 
mat(2,9) = 0._dp 
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+M2
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+(g2*vd)/2._dp
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)-(g2*vu)/2._dp
mat(3,6) = 0._dp 
mat(3,7) = 0._dp 
mat(3,8) = 0._dp 
mat(3,9) = 0._dp 
mat(4,4) = 0._dp 
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)-((vS*lam)/sqrt(2._dp))
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)-((vu*lam)/sqrt(2._dp))
mat(4,7) = 0._dp 
mat(4,8) = 0._dp 
mat(4,9) = 0._dp 
mat(5,5) = 0._dp 
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)-((vd*lam)/sqrt(2._dp))
mat(5,7) = 0._dp 
mat(5,8) = 0._dp 
mat(5,9) = 0._dp 
mat(6,6) = 0._dp 
mat(6,7) = 0._dp 
mat(6,8) = 0._dp 
mat(6,9) = 0._dp 
mat(7,7) = 0._dp 
mat(7,8) = 0._dp 
mat(7,8) = mat(7,8)+(vS3*kap)/(3._dp*sqrt(2._dp))
mat(7,9) = 0._dp 
mat(7,9) = mat(7,9)+(vS2*kap)/(3._dp*sqrt(2._dp))
mat(8,8) = 0._dp 
mat(8,9) = 0._dp 
mat(8,9) = mat(8,9)+(vS1*kap)/(3._dp*sqrt(2._dp))
mat(9,9) = 0._dp 

 
 Do i1=2,9
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
If (Maxval(Abs(Aimag(mat))).Eq.0._dp) Then 
Call EigenSystem(Real(mat,dp),Eig,ZNa,ierr,test) 
 
   Do i1=1,9
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MChi(i1) = - Eig(i1) 
    ZN(i1,:) = (0._dp,1._dp)*ZNa(i1,:) 
   Else 
    MChi(i1) = Eig(i1) 
    ZN(i1,:) = ZNa(i1,:)
    End If 
   End Do 
 
Do i1=1,8
  Do i2=i1+1,9
    If (MChi(i1).Gt.MChi(i2)) Then 
      Eig(1) = MChi(i1) 
      MChi(i1) = MChi(i2) 
      MChi(i2) =  Eig(1) 
      E9 = ZN(i1,:) 
      ZN(i1,:) = ZN(i2,:) 
      ZN(i2,:) = E9
    End If 
   End Do 
End Do 
 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat) ), mat ) 
Call Eigensystem(mat2, Eig, ZN, ierr, test) 
mat2 = Matmul( Conjg(ZN), Matmul( mat, Transpose( Conjg(ZN)))) 
! Special efforts are needed for matrices like the Higgsinos one 
SecondDiagonalisationNeeded = .False. 
Do i1=1,9-1
If (MaxVal(Abs(mat2(i1,(i1+1):9))).gt.Abs(mat2(i1,i1))) SecondDiagonalisationNeeded = .True. 

  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End do 
If (SecondDiagonalisationNeeded) Then 
Call EigenSystem(Real(mat2,dp),Eig,ZNa,ierr,test) 
 
     ZN = MatMul(ZN,ZNa)
  Do i1=1,9
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MChi(i1) = - Eig(i1) 
    ZN(i1,:) = (0._dp,1._dp)*ZNa(i1,:) 
   Else 
    MChi(i1) = Eig(i1) 
    ZN(i1,:) = ZNa(i1,:)
    End If 
   End Do 
 
Else 
Do i1=1,9
  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  ZN(i1,:)= phaseM * ZN(i1,:) 
End if 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
MChi = Sqrt( Eig ) 
 
End if ! Second diagonalisation 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMChi, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Iname = Iname - 1 
 
End Subroutine CalculateMChi 

Subroutine CalculateMFv(Yv,vu,ZVL,ZVR,MFv,kont)

Real(dp),Intent(in) :: vu

Complex(dp),Intent(in) :: Yv(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFv(3) 
 Complex(dp), Intent(out) :: ZVL(3,3), ZVR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZVL2(3,3), ZVR2(3,3) 
 
 Real(dp) :: ZVL1(3,3), ZVR1(3,3), test(2), MFv2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFv'
 
MFv = 0._dp 
ZVL = 0._dp 
ZVR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(vu*Yv(1,1))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(vu*Yv(1,2))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(vu*Yv(1,3))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(vu*Yv(2,1))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(vu*Yv(2,2))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(vu*Yv(2,3))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(vu*Yv(3,1))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(vu*Yv(3,2))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(vu*Yv(3,3))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFv2,ZVR1,ierr,test) 
ZVR2 = ZVR1 
Else 
Call EigenSystem(mat2,MFv2,ZVR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFv2,ZVL1,ierr,test) 
                  
                  
ZVL2 = ZVL1 
Else 
Call EigenSystem(mat2,MFv2,ZVL2,ierr,test) 
 
 
End If 
ZVL2 = Conjg(ZVL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZVL2),mat),Transpose( Conjg(ZVR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZVR2(i1,:) = phaseM *ZVR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZVR2(i1,i1)).gt.0._dp) Then 
phaseM = ZVR2(i1,i1) / Abs(ZVR2(i1,i1)) 
ZVR2(i1,:) = Conjg(phaseM) *ZVR2(i1,:) 
 ZVL2(i1,:) = phaseM *ZVL2(i1,:) 
 End if 
  If (MFv2(i1).ne.MFv2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFv2(i1)).Le.MaxMassNumericalZero) MFv2(i1) = Abs(MFv2(i1))+1.E-10_dp 
  If (MFv2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MFv2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MFv2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MFv2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MFv2(i1) 
  MFv2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFv, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFv = Sqrt( MFv2 ) 
ZVL = ZVL2 
ZVR = ZVR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFv 

Subroutine CalculateMCha(g2,lam,M2,vd,vu,vS,UM,UP,MCha,kont)

Real(dp),Intent(in) :: g2,vd,vu,vS

Complex(dp),Intent(in) :: lam,M2

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MCha(2) 
 Complex(dp), Intent(out) :: UM(2,2), UP(2,2) 
 
 Complex(dp) :: mat(2,2)=0._dp, mat2(2,2)=0._dp, phaseM 

Complex(dp) :: UM2(2,2), UP2(2,2) 
 
 Real(dp) :: UM1(2,2), UP1(2,2), test(2), MCha2(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMCha'
 
MCha = 0._dp 
UM = 0._dp 
UP = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+M2
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(g2*vu)/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(g2*vd)/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(vS*lam)/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MCha2,UP1,ierr,test) 
UP2 = UP1 
Else 
Call EigenSystem(mat2,MCha2,UP2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MCha2,UM1,ierr,test) 
                  
                  
UM2 = UM1 
Else 
Call EigenSystem(mat2,MCha2,UM2,ierr,test) 
 
 
End If 
UM2 = Conjg(UM2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(UM2),mat),Transpose( Conjg(UP2))) 
Do i1=1,2
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
UP2(i1,:) = phaseM *UP2(i1,:) 
 End if 
End Do 
 
Do i1=1,2
If (Abs(UP2(i1,i1)).gt.0._dp) Then 
phaseM = UP2(i1,i1) / Abs(UP2(i1,i1)) 
UP2(i1,:) = Conjg(phaseM) *UP2(i1,:) 
 UM2(i1,:) = phaseM *UM2(i1,:) 
 End if 
  If (MCha2(i1).ne.MCha2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MCha2(i1)).Le.MaxMassNumericalZero) MCha2(i1) = Abs(MCha2(i1))+1.E-10_dp 
  If (MCha2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MCha2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MCha2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MCha2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MCha2(i1) 
  MCha2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMCha, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MCha = Sqrt( MCha2 ) 
UM = UM2 
UP = UP2 
Iname = Iname - 1 
 
End Subroutine CalculateMCha 

Subroutine CalculateMFe(Ye,vd,ZEL,ZER,MFe,kont)

Real(dp),Intent(in) :: vd

Complex(dp),Intent(in) :: Ye(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFe(3) 
 Complex(dp), Intent(out) :: ZEL(3,3), ZER(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZEL2(3,3), ZER2(3,3) 
 
 Real(dp) :: ZEL1(3,3), ZER1(3,3), test(2), MFe2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFe'
 
MFe = 0._dp 
ZEL = 0._dp 
ZER = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(vd*Ye(1,1))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(vd*Ye(2,1))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(vd*Ye(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(vd*Ye(1,2))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(vd*Ye(2,2))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(vd*Ye(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(vd*Ye(1,3))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(vd*Ye(2,3))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(vd*Ye(3,3))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFe2,ZEL1,ierr,test) 
                  
                  
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat),Transpose( Conjg(ZER2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZER2(i1,i1)).gt.0._dp) Then 
phaseM = ZER2(i1,i1) / Abs(ZER2(i1,i1)) 
ZER2(i1,:) = Conjg(phaseM) *ZER2(i1,:) 
 ZEL2(i1,:) = phaseM *ZEL2(i1,:) 
 End if 
  If (MFe2(i1).ne.MFe2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFe2(i1)).Le.MaxMassNumericalZero) MFe2(i1) = Abs(MFe2(i1))+1.E-10_dp 
  If (MFe2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MFe2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MFe2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MFe2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MFe2(i1) 
  MFe2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFe, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFe = Sqrt( MFe2 ) 
ZEL = ZEL2 
ZER = ZER2 
Iname = Iname - 1 
 
End Subroutine CalculateMFe 

Subroutine CalculateMFd(Yd,vd,ZDL,ZDR,MFd,kont)

Real(dp),Intent(in) :: vd

Complex(dp),Intent(in) :: Yd(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFd(3) 
 Complex(dp), Intent(out) :: ZDL(3,3), ZDR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZDL2(3,3), ZDR2(3,3) 
 
 Real(dp) :: ZDL1(3,3), ZDR1(3,3), test(2), MFd2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFd'
 
MFd = 0._dp 
ZDL = 0._dp 
ZDR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(vd*Yd(1,1))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(vd*Yd(2,1))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(vd*Yd(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(vd*Yd(1,2))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(vd*Yd(2,2))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(vd*Yd(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(vd*Yd(1,3))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(vd*Yd(2,3))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(vd*Yd(3,3))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFd2,ZDL1,ierr,test) 
                  
                  
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat),Transpose( Conjg(ZDR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZDR2(i1,i1)).gt.0._dp) Then 
phaseM = ZDR2(i1,i1) / Abs(ZDR2(i1,i1)) 
ZDR2(i1,:) = Conjg(phaseM) *ZDR2(i1,:) 
 ZDL2(i1,:) = phaseM *ZDL2(i1,:) 
 End if 
  If (MFd2(i1).ne.MFd2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFd2(i1)).Le.MaxMassNumericalZero) MFd2(i1) = Abs(MFd2(i1))+1.E-10_dp 
  If (MFd2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MFd2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MFd2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MFd2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MFd2(i1) 
  MFd2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFd, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFd = Sqrt( MFd2 ) 
ZDL = ZDL2 
ZDR = ZDR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFd 

Subroutine CalculateMFu(Yu,vu,ZUL,ZUR,MFu,kont)

Real(dp),Intent(in) :: vu

Complex(dp),Intent(in) :: Yu(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFu(3) 
 Complex(dp), Intent(out) :: ZUL(3,3), ZUR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZUL2(3,3), ZUR2(3,3) 
 
 Real(dp) :: ZUL1(3,3), ZUR1(3,3), test(2), MFu2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFu'
 
MFu = 0._dp 
ZUL = 0._dp 
ZUR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(vu*Yu(1,1))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(vu*Yu(2,1))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(vu*Yu(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(vu*Yu(1,2))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(vu*Yu(2,2))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(vu*Yu(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(vu*Yu(1,3))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(vu*Yu(2,3))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(vu*Yu(3,3))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFu2,ZUL1,ierr,test) 
                  
                  
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat),Transpose( Conjg(ZUR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZUR2(i1,i1)).gt.0._dp) Then 
phaseM = ZUR2(i1,i1) / Abs(ZUR2(i1,i1)) 
ZUR2(i1,:) = Conjg(phaseM) *ZUR2(i1,:) 
 ZUL2(i1,:) = phaseM *ZUL2(i1,:) 
 End if 
  If (MFu2(i1).ne.MFu2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFu2(i1)).Le.MaxMassNumericalZero) MFu2(i1) = Abs(MFu2(i1))+1.E-10_dp 
  If (MFu2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MFu2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MFu2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MFu2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MFu2(i1) 
  MFu2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFu, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFu = Sqrt( MFu2 ) 
ZUL = ZUL2 
ZUR = ZUR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFu 

Subroutine CalculateVPVZVZp(g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,vd,vu,vS,vS1,             & 
& vS2,vS3,ZZ,MVZ,MVZp,MVZ2,MVZp2,TW,TWp,kont)

Real(dp), Intent(in) :: g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,vd,vu,vS,vS1,vS2,vS3

Real(dp), Intent(out) :: TW,TWp

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVZ, MVZ2
Real(dp), Intent(out) :: MVZp, MVZp2
Real(dp) :: VPVZVZp2(3),VPVZVZp(3)  

Real(dp), Intent(out) :: ZZ(3,3) 
 
Real(dp) :: mat(3,3)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVPVZVZp'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g1**2*vd**2)/4._dp
mat(1,1) = mat(1,1)+(g1**2*vu**2)/4._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-(g1*g2*vd**2)/4._dp
mat(1,2) = mat(1,2)-(g1*g2*vu**2)/4._dp
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-(g1*gp*QHd*vd**2)/2._dp
mat(1,3) = mat(1,3)+(g1*gp*QHu*vu**2)/2._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*vd**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*vu**2)/4._dp
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(g2*gp*QHd*vd**2)/2._dp
mat(2,3) = mat(2,3)-(g2*gp*QHu*vu**2)/2._dp
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+gp**2*QHd**2*vd**2
mat(3,3) = mat(3,3)+gp**2*Qs**2*vS**2
mat(3,3) = mat(3,3)+gp**2*Qs1**2*vS1**2
mat(3,3) = mat(3,3)+gp**2*Qs2**2*vS2**2
mat(3,3) = mat(3,3)+gp**2*Qs3**2*vS3**2
mat(3,3) = mat(3,3)+gp**2*QHu**2*vu**2

 
 Do i1=2,3
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,VPVZVZp2,ZZ,ierr,test) 
 
 
ZZ = Transpose(ZZ) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,3
  If (Abs(VPVZVZp2(i1)).Le.1.E-10_dp*(Maxval(VPVZVZp2))) VPVZVZp2(i1) = 1.E-10_dp 
  If (VPVZVZp2(i1).ne.VPVZVZp2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VPVZVZp2(i1).Ge.0._dp) Then 
  VPVZVZp(i1) =Sqrt(VPVZVZp2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,VPVZVZp2(i1) 
    End If 
  VPVZVZp(i1)= 1._dp 
  VPVZVZp2(i1)= 1._dp  
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,VPVZVZp2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,VPVZVZp2(i1) 
  VPVZVZp(i1)= 1._dp 
  VPVZVZp2(i1) = 1._dp  
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
MVZ = VPVZVZp(2) 
MVZ2 = VPVZVZp2(2) 
MVZp = VPVZVZp(3) 
MVZp2 = VPVZVZp2(3) 
TW = ACos(Abs(ZZ(1,1)))
TWp = ACos(Abs(ZZ(3,3)))

 Iname = Iname - 1 
 
End Subroutine CalculateVPVZVZp 

Subroutine CalculateVWm(g2,vd,vu,ZW,MVWm,MVWm2,kont)

Real(dp), Intent(in) :: g2,vd,vu

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVWm, MVWm2
Real(dp) :: VWm2(2),VWm(2)  

Complex(dp), Intent(out) :: ZW(2,2) 
 
Complex(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVWm'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g2**2*vd**2)/4._dp
mat(1,1) = mat(1,1)+(g2**2*vu**2)/4._dp
mat(1,2) = 0._dp 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*vd**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*vu**2)/4._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,VWm2,ZW,ierr,test) 
 
 
ZW = Transpose(ZW) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(VWm2(i1)).Le.1.E-10_dp*(Maxval(VWm2))) VWm2(i1) = 1.E-10_dp 
  If (VWm2(i1).ne.VWm2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VWm2(i1).Ge.0._dp) Then 
  VWm(i1) =Sqrt(VWm2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,VWm2(i1) 
    End If 
  VWm(i1)= 1._dp 
  VWm2(i1)= 1._dp  
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,VWm2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,VWm2(i1) 
  VWm(i1)= 1._dp 
  VWm2(i1) = 1._dp  
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
MVWm = VWm(1) 
MVWm2 = VWm2(1) 

 Iname = Iname - 1 
 
End Subroutine CalculateVWm 

Subroutine CalculateMSdEffPot(g1,g2,gp,Qq,QHd,QHu,Qd,Qs,Qs1,Qs2,Qs3,Yd,               & 
& Td,lam,mq2,md2,vd,vu,vS,vS1,vS2,vS3,ZD,MSd,MSd2,kont)

Real(dp), Intent(in) :: g1,g2,gp,Qq,QHd,QHu,Qd,Qs,Qs1,Qs2,Qs3,vd,vu,vS,vS1,vS2,vS3

Complex(dp), Intent(in) :: Yd(3,3),Td(3,3),lam,mq2(3,3),md2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MSd(6), MSd2(6) 
Complex(dp), Intent(out) :: ZD(6,6) 
 
Complex(dp) :: mat(6,6)  

Real(dp) :: MSd2temp(6), Q2 
Complex(dp) :: ZDtemp(6,6), ZDtemp2(6,6) 
 
Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMSd'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-(g1**2*vdFix**2)/24._dp
mat(1,1) = mat(1,1)-(g2**2*vdFix**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qq*vdFix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Qq*Qs1*vS1Fix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Qq*Qs2*vS2Fix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Qq*Qs3*vS3Fix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Qq*Qs*vSFix**2)/2._dp
mat(1,1) = mat(1,1)+(g1**2*vuFix**2)/24._dp
mat(1,1) = mat(1,1)+(g2**2*vuFix**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHu*Qq*vuFix**2)/2._dp
mat(1,1) = mat(1,1)+mq2(1,1)
Do j1 = 1,3
mat(1,1) = mat(1,1)+(vd**2*Conjg(Yd(j1,1))*Yd(j1,1))/2._dp
End Do 
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+mq2(1,2)
Do j1 = 1,3
mat(1,2) = mat(1,2)+(vd**2*Conjg(Yd(j1,1))*Yd(j1,2))/2._dp
End Do 
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+mq2(1,3)
Do j1 = 1,3
mat(1,3) = mat(1,3)+(vd**2*Conjg(Yd(j1,1))*Yd(j1,3))/2._dp
End Do 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-(vS*vu*lam*Conjg(Yd(1,1)))/2._dp
mat(1,4) = mat(1,4)+(vd*Conjg(Td(1,1)))/sqrt(2._dp)
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)-(vS*vu*lam*Conjg(Yd(2,1)))/2._dp
mat(1,5) = mat(1,5)+(vd*Conjg(Td(2,1)))/sqrt(2._dp)
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)-(vS*vu*lam*Conjg(Yd(3,1)))/2._dp
mat(1,6) = mat(1,6)+(vd*Conjg(Td(3,1)))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-(g1**2*vdFix**2)/24._dp
mat(2,2) = mat(2,2)-(g2**2*vdFix**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHd*Qq*vdFix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Qq*Qs1*vS1Fix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Qq*Qs2*vS2Fix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Qq*Qs3*vS3Fix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Qq*Qs*vSFix**2)/2._dp
mat(2,2) = mat(2,2)+(g1**2*vuFix**2)/24._dp
mat(2,2) = mat(2,2)+(g2**2*vuFix**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qq*vuFix**2)/2._dp
mat(2,2) = mat(2,2)+mq2(2,2)
Do j1 = 1,3
mat(2,2) = mat(2,2)+(vd**2*Conjg(Yd(j1,2))*Yd(j1,2))/2._dp
End Do 
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+mq2(2,3)
Do j1 = 1,3
mat(2,3) = mat(2,3)+(vd**2*Conjg(Yd(j1,2))*Yd(j1,3))/2._dp
End Do 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-(vS*vu*lam*Conjg(Yd(1,2)))/2._dp
mat(2,4) = mat(2,4)+(vd*Conjg(Td(1,2)))/sqrt(2._dp)
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)-(vS*vu*lam*Conjg(Yd(2,2)))/2._dp
mat(2,5) = mat(2,5)+(vd*Conjg(Td(2,2)))/sqrt(2._dp)
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)-(vS*vu*lam*Conjg(Yd(3,2)))/2._dp
mat(2,6) = mat(2,6)+(vd*Conjg(Td(3,2)))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-(g1**2*vdFix**2)/24._dp
mat(3,3) = mat(3,3)-(g2**2*vdFix**2)/8._dp
mat(3,3) = mat(3,3)+(gp**2*QHd*Qq*vdFix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qq*Qs1*vS1Fix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qq*Qs2*vS2Fix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qq*Qs3*vS3Fix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qq*Qs*vSFix**2)/2._dp
mat(3,3) = mat(3,3)+(g1**2*vuFix**2)/24._dp
mat(3,3) = mat(3,3)+(g2**2*vuFix**2)/8._dp
mat(3,3) = mat(3,3)+(gp**2*QHu*Qq*vuFix**2)/2._dp
mat(3,3) = mat(3,3)+mq2(3,3)
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vd**2*Conjg(Yd(j1,3))*Yd(j1,3))/2._dp
End Do 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)-(vS*vu*lam*Conjg(Yd(1,3)))/2._dp
mat(3,4) = mat(3,4)+(vd*Conjg(Td(1,3)))/sqrt(2._dp)
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)-(vS*vu*lam*Conjg(Yd(2,3)))/2._dp
mat(3,5) = mat(3,5)+(vd*Conjg(Td(2,3)))/sqrt(2._dp)
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)-(vS*vu*lam*Conjg(Yd(3,3)))/2._dp
mat(3,6) = mat(3,6)+(vd*Conjg(Td(3,3)))/sqrt(2._dp)
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)-(g1**2*vdFix**2)/12._dp
mat(4,4) = mat(4,4)+(gp**2*Qd*QHd*vdFix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qd*Qs1*vS1Fix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qd*Qs2*vS2Fix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qd*Qs3*vS3Fix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qd*Qs*vSFix**2)/2._dp
mat(4,4) = mat(4,4)+(g1**2*vuFix**2)/12._dp
mat(4,4) = mat(4,4)+(gp**2*Qd*QHu*vuFix**2)/2._dp
mat(4,4) = mat(4,4)+md2(1,1)
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vd**2*Conjg(Yd(1,j1))*Yd(1,j1))/2._dp
End Do 
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+md2(1,2)
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vd**2*Conjg(Yd(2,j1))*Yd(1,j1))/2._dp
End Do 
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)+md2(1,3)
Do j1 = 1,3
mat(4,6) = mat(4,6)+(vd**2*Conjg(Yd(3,j1))*Yd(1,j1))/2._dp
End Do 
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)-(g1**2*vdFix**2)/12._dp
mat(5,5) = mat(5,5)+(gp**2*Qd*QHd*vdFix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qd*Qs1*vS1Fix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qd*Qs2*vS2Fix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qd*Qs3*vS3Fix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qd*Qs*vSFix**2)/2._dp
mat(5,5) = mat(5,5)+(g1**2*vuFix**2)/12._dp
mat(5,5) = mat(5,5)+(gp**2*Qd*QHu*vuFix**2)/2._dp
mat(5,5) = mat(5,5)+md2(2,2)
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vd**2*Conjg(Yd(2,j1))*Yd(2,j1))/2._dp
End Do 
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+md2(2,3)
Do j1 = 1,3
mat(5,6) = mat(5,6)+(vd**2*Conjg(Yd(3,j1))*Yd(2,j1))/2._dp
End Do 
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)-(g1**2*vdFix**2)/12._dp
mat(6,6) = mat(6,6)+(gp**2*Qd*QHd*vdFix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qd*Qs1*vS1Fix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qd*Qs2*vS2Fix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qd*Qs3*vS3Fix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qd*Qs*vSFix**2)/2._dp
mat(6,6) = mat(6,6)+(g1**2*vuFix**2)/12._dp
mat(6,6) = mat(6,6)+(gp**2*Qd*QHu*vuFix**2)/2._dp
mat(6,6) = mat(6,6)+md2(3,3)
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vd**2*Conjg(Yd(3,j1))*Yd(3,j1))/2._dp
End Do 

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,MSd2,ZD,ierr,test) 
 
 
! Fix order
  ZDtemp2=ZD
Do i1=1,6
  pos=Maxloc(Abs(ZDtemp2(i1,:)),1)
  ZDtemp(pos,:)=ZD(i1,:)
  MSd2temp(pos)=MSd2(i1)
  ZDtemp2(:,pos)=0._dp
End do
  MSd2 = MSd2temp
  ZD = ZDtemp
! Fix phases
Do i1=1,6
  pos=Maxloc(Abs(ZD(i1,:)),1)
  If (Real(ZD(i1,pos),dp).lt.0._dp) Then
    ZD(i1,:)=-ZD(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,6
  If (MSd2(i1).ne.MSd2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MSd2(i1).Ge.0._dp) Then 
  MSd(i1)=Sqrt(MSd2(i1) ) 
  Else 
  MSd(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMSdEffPot 

Subroutine CalculateMSvEffPot(g1,g2,gp,Ql,QHd,QHu,Qs,Qs1,Qs2,Qs3,Qv,lam,              & 
& Yv,Tv,ml2,mv2,vd,vu,vS,vS1,vS2,vS3,ZV,MSv,MSv2,kont)

Real(dp), Intent(in) :: g1,g2,gp,Ql,QHd,QHu,Qs,Qs1,Qs2,Qs3,Qv,vd,vu,vS,vS1,vS2,vS3

Complex(dp), Intent(in) :: lam,Yv(3,3),Tv(3,3),ml2(3,3),mv2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MSv(6), MSv2(6) 
Complex(dp), Intent(out) :: ZV(6,6) 
 
Complex(dp) :: mat(6,6)  

Real(dp) :: MSv2temp(6), Q2 
Complex(dp) :: ZVtemp(6,6), ZVtemp2(6,6) 
 
Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMSv'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g1**2*vdFix**2)/8._dp
mat(1,1) = mat(1,1)+(g2**2*vdFix**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Ql*vdFix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Ql*Qs1*vS1Fix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Ql*Qs2*vS2Fix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Ql*Qs3*vS3Fix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Ql*Qs*vSFix**2)/2._dp
mat(1,1) = mat(1,1)-(g1**2*vuFix**2)/8._dp
mat(1,1) = mat(1,1)-(g2**2*vuFix**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHu*Ql*vuFix**2)/2._dp
mat(1,1) = mat(1,1)+ml2(1,1)
Do j1 = 1,3
mat(1,1) = mat(1,1)+(vu**2*Conjg(Yv(1,j1))*Yv(1,j1))/2._dp
End Do 
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+ml2(1,2)
Do j1 = 1,3
mat(1,2) = mat(1,2)+(vu**2*Conjg(Yv(1,j1))*Yv(2,j1))/2._dp
End Do 
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+ml2(1,3)
Do j1 = 1,3
mat(1,3) = mat(1,3)+(vu**2*Conjg(Yv(1,j1))*Yv(3,j1))/2._dp
End Do 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-(vd*vS*lam*Conjg(Yv(1,1)))/2._dp
mat(1,4) = mat(1,4)+(vu*Conjg(Tv(1,1)))/sqrt(2._dp)
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)-(vd*vS*lam*Conjg(Yv(1,2)))/2._dp
mat(1,5) = mat(1,5)+(vu*Conjg(Tv(1,2)))/sqrt(2._dp)
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)-(vd*vS*lam*Conjg(Yv(1,3)))/2._dp
mat(1,6) = mat(1,6)+(vu*Conjg(Tv(1,3)))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g1**2*vdFix**2)/8._dp
mat(2,2) = mat(2,2)+(g2**2*vdFix**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHd*Ql*vdFix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Ql*Qs1*vS1Fix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Ql*Qs2*vS2Fix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Ql*Qs3*vS3Fix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Ql*Qs*vSFix**2)/2._dp
mat(2,2) = mat(2,2)-(g1**2*vuFix**2)/8._dp
mat(2,2) = mat(2,2)-(g2**2*vuFix**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Ql*vuFix**2)/2._dp
mat(2,2) = mat(2,2)+ml2(2,2)
Do j1 = 1,3
mat(2,2) = mat(2,2)+(vu**2*Conjg(Yv(2,j1))*Yv(2,j1))/2._dp
End Do 
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+ml2(2,3)
Do j1 = 1,3
mat(2,3) = mat(2,3)+(vu**2*Conjg(Yv(2,j1))*Yv(3,j1))/2._dp
End Do 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-(vd*vS*lam*Conjg(Yv(2,1)))/2._dp
mat(2,4) = mat(2,4)+(vu*Conjg(Tv(2,1)))/sqrt(2._dp)
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)-(vd*vS*lam*Conjg(Yv(2,2)))/2._dp
mat(2,5) = mat(2,5)+(vu*Conjg(Tv(2,2)))/sqrt(2._dp)
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)-(vd*vS*lam*Conjg(Yv(2,3)))/2._dp
mat(2,6) = mat(2,6)+(vu*Conjg(Tv(2,3)))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(g1**2*vdFix**2)/8._dp
mat(3,3) = mat(3,3)+(g2**2*vdFix**2)/8._dp
mat(3,3) = mat(3,3)+(gp**2*QHd*Ql*vdFix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Ql*Qs1*vS1Fix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Ql*Qs2*vS2Fix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Ql*Qs3*vS3Fix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Ql*Qs*vSFix**2)/2._dp
mat(3,3) = mat(3,3)-(g1**2*vuFix**2)/8._dp
mat(3,3) = mat(3,3)-(g2**2*vuFix**2)/8._dp
mat(3,3) = mat(3,3)+(gp**2*QHu*Ql*vuFix**2)/2._dp
mat(3,3) = mat(3,3)+ml2(3,3)
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vu**2*Conjg(Yv(3,j1))*Yv(3,j1))/2._dp
End Do 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)-(vd*vS*lam*Conjg(Yv(3,1)))/2._dp
mat(3,4) = mat(3,4)+(vu*Conjg(Tv(3,1)))/sqrt(2._dp)
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)-(vd*vS*lam*Conjg(Yv(3,2)))/2._dp
mat(3,5) = mat(3,5)+(vu*Conjg(Tv(3,2)))/sqrt(2._dp)
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)-(vd*vS*lam*Conjg(Yv(3,3)))/2._dp
mat(3,6) = mat(3,6)+(vu*Conjg(Tv(3,3)))/sqrt(2._dp)
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+(gp**2*QHd*Qv*vdFix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs1*Qv*vS1Fix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs2*Qv*vS2Fix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs3*Qv*vS3Fix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs*Qv*vSFix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*QHu*Qv*vuFix**2)/2._dp
mat(4,4) = mat(4,4)+mv2(1,1)
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vu**2*Conjg(Yv(j1,1))*Yv(j1,1))/2._dp
End Do 
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+mv2(1,2)
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vu**2*Conjg(Yv(j1,2))*Yv(j1,1))/2._dp
End Do 
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)+mv2(1,3)
Do j1 = 1,3
mat(4,6) = mat(4,6)+(vu**2*Conjg(Yv(j1,3))*Yv(j1,1))/2._dp
End Do 
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+(gp**2*QHd*Qv*vdFix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs1*Qv*vS1Fix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs2*Qv*vS2Fix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs3*Qv*vS3Fix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs*Qv*vSFix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*QHu*Qv*vuFix**2)/2._dp
mat(5,5) = mat(5,5)+mv2(2,2)
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vu**2*Conjg(Yv(j1,2))*Yv(j1,2))/2._dp
End Do 
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+mv2(2,3)
Do j1 = 1,3
mat(5,6) = mat(5,6)+(vu**2*Conjg(Yv(j1,3))*Yv(j1,2))/2._dp
End Do 
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)+(gp**2*QHd*Qv*vdFix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs1*Qv*vS1Fix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs2*Qv*vS2Fix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs3*Qv*vS3Fix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs*Qv*vSFix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*QHu*Qv*vuFix**2)/2._dp
mat(6,6) = mat(6,6)+mv2(3,3)
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vu**2*Conjg(Yv(j1,3))*Yv(j1,3))/2._dp
End Do 

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,MSv2,ZV,ierr,test) 
 
 
! Fix order
  ZVtemp2=ZV
Do i1=1,6
  pos=Maxloc(Abs(ZVtemp2(i1,:)),1)
  ZVtemp(pos,:)=ZV(i1,:)
  MSv2temp(pos)=MSv2(i1)
  ZVtemp2(:,pos)=0._dp
End do
  MSv2 = MSv2temp
  ZV = ZVtemp
! Fix phases
Do i1=1,6
  pos=Maxloc(Abs(ZV(i1,:)),1)
  If (Real(ZV(i1,pos),dp).lt.0._dp) Then
    ZV(i1,:)=-ZV(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,6
  If (MSv2(i1).ne.MSv2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MSv2(i1).Ge.0._dp) Then 
  MSv(i1)=Sqrt(MSv2(i1) ) 
  Else 
  MSv(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMSvEffPot 

Subroutine CalculateMSuEffPot(g1,g2,gp,Qq,QHd,QHu,Qu,Qs,Qs1,Qs2,Qs3,lam,              & 
& Yu,Tu,mq2,mu2,vd,vu,vS,vS1,vS2,vS3,ZU,MSu,MSu2,kont)

Real(dp), Intent(in) :: g1,g2,gp,Qq,QHd,QHu,Qu,Qs,Qs1,Qs2,Qs3,vd,vu,vS,vS1,vS2,vS3

Complex(dp), Intent(in) :: lam,Yu(3,3),Tu(3,3),mq2(3,3),mu2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MSu(6), MSu2(6) 
Complex(dp), Intent(out) :: ZU(6,6) 
 
Complex(dp) :: mat(6,6)  

Real(dp) :: MSu2temp(6), Q2 
Complex(dp) :: ZUtemp(6,6), ZUtemp2(6,6) 
 
Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMSu'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-(g1**2*vdFix**2)/24._dp
mat(1,1) = mat(1,1)+(g2**2*vdFix**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qq*vdFix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Qq*Qs1*vS1Fix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Qq*Qs2*vS2Fix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Qq*Qs3*vS3Fix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Qq*Qs*vSFix**2)/2._dp
mat(1,1) = mat(1,1)+(g1**2*vuFix**2)/24._dp
mat(1,1) = mat(1,1)-(g2**2*vuFix**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHu*Qq*vuFix**2)/2._dp
mat(1,1) = mat(1,1)+mq2(1,1)
Do j1 = 1,3
mat(1,1) = mat(1,1)+(vu**2*Conjg(Yu(j1,1))*Yu(j1,1))/2._dp
End Do 
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+mq2(1,2)
Do j1 = 1,3
mat(1,2) = mat(1,2)+(vu**2*Conjg(Yu(j1,1))*Yu(j1,2))/2._dp
End Do 
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+mq2(1,3)
Do j1 = 1,3
mat(1,3) = mat(1,3)+(vu**2*Conjg(Yu(j1,1))*Yu(j1,3))/2._dp
End Do 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-(vd*vS*lam*Conjg(Yu(1,1)))/2._dp
mat(1,4) = mat(1,4)+(vu*Conjg(Tu(1,1)))/sqrt(2._dp)
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)-(vd*vS*lam*Conjg(Yu(2,1)))/2._dp
mat(1,5) = mat(1,5)+(vu*Conjg(Tu(2,1)))/sqrt(2._dp)
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)-(vd*vS*lam*Conjg(Yu(3,1)))/2._dp
mat(1,6) = mat(1,6)+(vu*Conjg(Tu(3,1)))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-(g1**2*vdFix**2)/24._dp
mat(2,2) = mat(2,2)+(g2**2*vdFix**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHd*Qq*vdFix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Qq*Qs1*vS1Fix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Qq*Qs2*vS2Fix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Qq*Qs3*vS3Fix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Qq*Qs*vSFix**2)/2._dp
mat(2,2) = mat(2,2)+(g1**2*vuFix**2)/24._dp
mat(2,2) = mat(2,2)-(g2**2*vuFix**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qq*vuFix**2)/2._dp
mat(2,2) = mat(2,2)+mq2(2,2)
Do j1 = 1,3
mat(2,2) = mat(2,2)+(vu**2*Conjg(Yu(j1,2))*Yu(j1,2))/2._dp
End Do 
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+mq2(2,3)
Do j1 = 1,3
mat(2,3) = mat(2,3)+(vu**2*Conjg(Yu(j1,2))*Yu(j1,3))/2._dp
End Do 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-(vd*vS*lam*Conjg(Yu(1,2)))/2._dp
mat(2,4) = mat(2,4)+(vu*Conjg(Tu(1,2)))/sqrt(2._dp)
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)-(vd*vS*lam*Conjg(Yu(2,2)))/2._dp
mat(2,5) = mat(2,5)+(vu*Conjg(Tu(2,2)))/sqrt(2._dp)
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)-(vd*vS*lam*Conjg(Yu(3,2)))/2._dp
mat(2,6) = mat(2,6)+(vu*Conjg(Tu(3,2)))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-(g1**2*vdFix**2)/24._dp
mat(3,3) = mat(3,3)+(g2**2*vdFix**2)/8._dp
mat(3,3) = mat(3,3)+(gp**2*QHd*Qq*vdFix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qq*Qs1*vS1Fix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qq*Qs2*vS2Fix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qq*Qs3*vS3Fix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qq*Qs*vSFix**2)/2._dp
mat(3,3) = mat(3,3)+(g1**2*vuFix**2)/24._dp
mat(3,3) = mat(3,3)-(g2**2*vuFix**2)/8._dp
mat(3,3) = mat(3,3)+(gp**2*QHu*Qq*vuFix**2)/2._dp
mat(3,3) = mat(3,3)+mq2(3,3)
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vu**2*Conjg(Yu(j1,3))*Yu(j1,3))/2._dp
End Do 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)-(vd*vS*lam*Conjg(Yu(1,3)))/2._dp
mat(3,4) = mat(3,4)+(vu*Conjg(Tu(1,3)))/sqrt(2._dp)
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)-(vd*vS*lam*Conjg(Yu(2,3)))/2._dp
mat(3,5) = mat(3,5)+(vu*Conjg(Tu(2,3)))/sqrt(2._dp)
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)-(vd*vS*lam*Conjg(Yu(3,3)))/2._dp
mat(3,6) = mat(3,6)+(vu*Conjg(Tu(3,3)))/sqrt(2._dp)
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+(g1**2*vdFix**2)/6._dp
mat(4,4) = mat(4,4)+(gp**2*QHd*Qu*vdFix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs1*Qu*vS1Fix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs2*Qu*vS2Fix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs3*Qu*vS3Fix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs*Qu*vSFix**2)/2._dp
mat(4,4) = mat(4,4)-(g1**2*vuFix**2)/6._dp
mat(4,4) = mat(4,4)+(gp**2*QHu*Qu*vuFix**2)/2._dp
mat(4,4) = mat(4,4)+mu2(1,1)
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vu**2*Conjg(Yu(1,j1))*Yu(1,j1))/2._dp
End Do 
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+mu2(1,2)
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vu**2*Conjg(Yu(2,j1))*Yu(1,j1))/2._dp
End Do 
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)+mu2(1,3)
Do j1 = 1,3
mat(4,6) = mat(4,6)+(vu**2*Conjg(Yu(3,j1))*Yu(1,j1))/2._dp
End Do 
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+(g1**2*vdFix**2)/6._dp
mat(5,5) = mat(5,5)+(gp**2*QHd*Qu*vdFix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs1*Qu*vS1Fix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs2*Qu*vS2Fix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs3*Qu*vS3Fix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs*Qu*vSFix**2)/2._dp
mat(5,5) = mat(5,5)-(g1**2*vuFix**2)/6._dp
mat(5,5) = mat(5,5)+(gp**2*QHu*Qu*vuFix**2)/2._dp
mat(5,5) = mat(5,5)+mu2(2,2)
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vu**2*Conjg(Yu(2,j1))*Yu(2,j1))/2._dp
End Do 
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+mu2(2,3)
Do j1 = 1,3
mat(5,6) = mat(5,6)+(vu**2*Conjg(Yu(3,j1))*Yu(2,j1))/2._dp
End Do 
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)+(g1**2*vdFix**2)/6._dp
mat(6,6) = mat(6,6)+(gp**2*QHd*Qu*vdFix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs1*Qu*vS1Fix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs2*Qu*vS2Fix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs3*Qu*vS3Fix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs*Qu*vSFix**2)/2._dp
mat(6,6) = mat(6,6)-(g1**2*vuFix**2)/6._dp
mat(6,6) = mat(6,6)+(gp**2*QHu*Qu*vuFix**2)/2._dp
mat(6,6) = mat(6,6)+mu2(3,3)
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vu**2*Conjg(Yu(3,j1))*Yu(3,j1))/2._dp
End Do 

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,MSu2,ZU,ierr,test) 
 
 
! Fix order
  ZUtemp2=ZU
Do i1=1,6
  pos=Maxloc(Abs(ZUtemp2(i1,:)),1)
  ZUtemp(pos,:)=ZU(i1,:)
  MSu2temp(pos)=MSu2(i1)
  ZUtemp2(:,pos)=0._dp
End do
  MSu2 = MSu2temp
  ZU = ZUtemp
! Fix phases
Do i1=1,6
  pos=Maxloc(Abs(ZU(i1,:)),1)
  If (Real(ZU(i1,pos),dp).lt.0._dp) Then
    ZU(i1,:)=-ZU(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,6
  If (MSu2(i1).ne.MSu2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MSu2(i1).Ge.0._dp) Then 
  MSu(i1)=Sqrt(MSu2(i1) ) 
  Else 
  MSu(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMSuEffPot 

Subroutine CalculateMSeEffPot(g1,g2,gp,Ql,QHd,QHu,Qe,Qs,Qs1,Qs2,Qs3,Ye,               & 
& Te,lam,ml2,me2,vd,vu,vS,vS1,vS2,vS3,ZE,MSe,MSe2,kont)

Real(dp), Intent(in) :: g1,g2,gp,Ql,QHd,QHu,Qe,Qs,Qs1,Qs2,Qs3,vd,vu,vS,vS1,vS2,vS3

Complex(dp), Intent(in) :: Ye(3,3),Te(3,3),lam,ml2(3,3),me2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MSe(6), MSe2(6) 
Complex(dp), Intent(out) :: ZE(6,6) 
 
Complex(dp) :: mat(6,6)  

Real(dp) :: MSe2temp(6), Q2 
Complex(dp) :: ZEtemp(6,6), ZEtemp2(6,6) 
 
Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMSe'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g1**2*vdFix**2)/8._dp
mat(1,1) = mat(1,1)-(g2**2*vdFix**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Ql*vdFix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Ql*Qs1*vS1Fix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Ql*Qs2*vS2Fix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Ql*Qs3*vS3Fix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*Ql*Qs*vSFix**2)/2._dp
mat(1,1) = mat(1,1)-(g1**2*vuFix**2)/8._dp
mat(1,1) = mat(1,1)+(g2**2*vuFix**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHu*Ql*vuFix**2)/2._dp
mat(1,1) = mat(1,1)+ml2(1,1)
Do j1 = 1,3
mat(1,1) = mat(1,1)+(vd**2*Conjg(Ye(j1,1))*Ye(j1,1))/2._dp
End Do 
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+ml2(1,2)
Do j1 = 1,3
mat(1,2) = mat(1,2)+(vd**2*Conjg(Ye(j1,1))*Ye(j1,2))/2._dp
End Do 
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+ml2(1,3)
Do j1 = 1,3
mat(1,3) = mat(1,3)+(vd**2*Conjg(Ye(j1,1))*Ye(j1,3))/2._dp
End Do 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-(vS*vu*lam*Conjg(Ye(1,1)))/2._dp
mat(1,4) = mat(1,4)+(vd*Conjg(Te(1,1)))/sqrt(2._dp)
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)-(vS*vu*lam*Conjg(Ye(2,1)))/2._dp
mat(1,5) = mat(1,5)+(vd*Conjg(Te(2,1)))/sqrt(2._dp)
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)-(vS*vu*lam*Conjg(Ye(3,1)))/2._dp
mat(1,6) = mat(1,6)+(vd*Conjg(Te(3,1)))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g1**2*vdFix**2)/8._dp
mat(2,2) = mat(2,2)-(g2**2*vdFix**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHd*Ql*vdFix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Ql*Qs1*vS1Fix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Ql*Qs2*vS2Fix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Ql*Qs3*vS3Fix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*Ql*Qs*vSFix**2)/2._dp
mat(2,2) = mat(2,2)-(g1**2*vuFix**2)/8._dp
mat(2,2) = mat(2,2)+(g2**2*vuFix**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Ql*vuFix**2)/2._dp
mat(2,2) = mat(2,2)+ml2(2,2)
Do j1 = 1,3
mat(2,2) = mat(2,2)+(vd**2*Conjg(Ye(j1,2))*Ye(j1,2))/2._dp
End Do 
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+ml2(2,3)
Do j1 = 1,3
mat(2,3) = mat(2,3)+(vd**2*Conjg(Ye(j1,2))*Ye(j1,3))/2._dp
End Do 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-(vS*vu*lam*Conjg(Ye(1,2)))/2._dp
mat(2,4) = mat(2,4)+(vd*Conjg(Te(1,2)))/sqrt(2._dp)
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)-(vS*vu*lam*Conjg(Ye(2,2)))/2._dp
mat(2,5) = mat(2,5)+(vd*Conjg(Te(2,2)))/sqrt(2._dp)
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)-(vS*vu*lam*Conjg(Ye(3,2)))/2._dp
mat(2,6) = mat(2,6)+(vd*Conjg(Te(3,2)))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(g1**2*vdFix**2)/8._dp
mat(3,3) = mat(3,3)-(g2**2*vdFix**2)/8._dp
mat(3,3) = mat(3,3)+(gp**2*QHd*Ql*vdFix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Ql*Qs1*vS1Fix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Ql*Qs2*vS2Fix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Ql*Qs3*vS3Fix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Ql*Qs*vSFix**2)/2._dp
mat(3,3) = mat(3,3)-(g1**2*vuFix**2)/8._dp
mat(3,3) = mat(3,3)+(g2**2*vuFix**2)/8._dp
mat(3,3) = mat(3,3)+(gp**2*QHu*Ql*vuFix**2)/2._dp
mat(3,3) = mat(3,3)+ml2(3,3)
Do j1 = 1,3
mat(3,3) = mat(3,3)+(vd**2*Conjg(Ye(j1,3))*Ye(j1,3))/2._dp
End Do 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)-(vS*vu*lam*Conjg(Ye(1,3)))/2._dp
mat(3,4) = mat(3,4)+(vd*Conjg(Te(1,3)))/sqrt(2._dp)
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)-(vS*vu*lam*Conjg(Ye(2,3)))/2._dp
mat(3,5) = mat(3,5)+(vd*Conjg(Te(2,3)))/sqrt(2._dp)
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)-(vS*vu*lam*Conjg(Ye(3,3)))/2._dp
mat(3,6) = mat(3,6)+(vd*Conjg(Te(3,3)))/sqrt(2._dp)
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)-(g1**2*vdFix**2)/4._dp
mat(4,4) = mat(4,4)+(gp**2*Qe*QHd*vdFix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qe*Qs1*vS1Fix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qe*Qs2*vS2Fix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qe*Qs3*vS3Fix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qe*Qs*vSFix**2)/2._dp
mat(4,4) = mat(4,4)+(g1**2*vuFix**2)/4._dp
mat(4,4) = mat(4,4)+(gp**2*Qe*QHu*vuFix**2)/2._dp
mat(4,4) = mat(4,4)+me2(1,1)
Do j1 = 1,3
mat(4,4) = mat(4,4)+(vd**2*Conjg(Ye(1,j1))*Ye(1,j1))/2._dp
End Do 
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+me2(1,2)
Do j1 = 1,3
mat(4,5) = mat(4,5)+(vd**2*Conjg(Ye(2,j1))*Ye(1,j1))/2._dp
End Do 
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)+me2(1,3)
Do j1 = 1,3
mat(4,6) = mat(4,6)+(vd**2*Conjg(Ye(3,j1))*Ye(1,j1))/2._dp
End Do 
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)-(g1**2*vdFix**2)/4._dp
mat(5,5) = mat(5,5)+(gp**2*Qe*QHd*vdFix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qe*Qs1*vS1Fix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qe*Qs2*vS2Fix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qe*Qs3*vS3Fix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qe*Qs*vSFix**2)/2._dp
mat(5,5) = mat(5,5)+(g1**2*vuFix**2)/4._dp
mat(5,5) = mat(5,5)+(gp**2*Qe*QHu*vuFix**2)/2._dp
mat(5,5) = mat(5,5)+me2(2,2)
Do j1 = 1,3
mat(5,5) = mat(5,5)+(vd**2*Conjg(Ye(2,j1))*Ye(2,j1))/2._dp
End Do 
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+me2(2,3)
Do j1 = 1,3
mat(5,6) = mat(5,6)+(vd**2*Conjg(Ye(3,j1))*Ye(2,j1))/2._dp
End Do 
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)-(g1**2*vdFix**2)/4._dp
mat(6,6) = mat(6,6)+(gp**2*Qe*QHd*vdFix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qe*Qs1*vS1Fix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qe*Qs2*vS2Fix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qe*Qs3*vS3Fix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qe*Qs*vSFix**2)/2._dp
mat(6,6) = mat(6,6)+(g1**2*vuFix**2)/4._dp
mat(6,6) = mat(6,6)+(gp**2*Qe*QHu*vuFix**2)/2._dp
mat(6,6) = mat(6,6)+me2(3,3)
Do j1 = 1,3
mat(6,6) = mat(6,6)+(vd**2*Conjg(Ye(3,j1))*Ye(3,j1))/2._dp
End Do 

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,MSe2,ZE,ierr,test) 
 
 
! Fix order
  ZEtemp2=ZE
Do i1=1,6
  pos=Maxloc(Abs(ZEtemp2(i1,:)),1)
  ZEtemp(pos,:)=ZE(i1,:)
  MSe2temp(pos)=MSe2(i1)
  ZEtemp2(:,pos)=0._dp
End do
  MSe2 = MSe2temp
  ZE = ZEtemp
! Fix phases
Do i1=1,6
  pos=Maxloc(Abs(ZE(i1,:)),1)
  If (Real(ZE(i1,pos),dp).lt.0._dp) Then
    ZE(i1,:)=-ZE(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,6
  If (MSe2(i1).ne.MSe2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MSe2(i1).Ge.0._dp) Then 
  MSe(i1)=Sqrt(MSe2(i1) ) 
  Else 
  MSe(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMSeEffPot 

Subroutine CalculateMhhEffPot(g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,lam,Tlam,               & 
& kap,Tk,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3,ZH,Mhh,Mhh2,kont)

Real(dp), Intent(in) :: g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3

Complex(dp), Intent(in) :: lam,Tlam,kap,Tk

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: Mhh(6), Mhh2(6) 
Complex(dp), Intent(out) :: ZH(6,6) 
 
Complex(dp) :: mat(6,6)  

Real(dp) :: Mhh2temp(6), Q2 
Complex(dp) :: ZHtemp(6,6), ZHtemp2(6,6) 
 
Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMhh'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mHd2
mat(1,1) = mat(1,1)+(3*g1**2*vdFix**2)/8._dp
mat(1,1) = mat(1,1)+(3*g2**2*vdFix**2)/8._dp
mat(1,1) = mat(1,1)+(3*gp**2*QHd**2*vdFix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs1*vS1Fix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs2*vS2Fix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs3*vS3Fix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs*vSFix**2)/2._dp
mat(1,1) = mat(1,1)-(g1**2*vuFix**2)/8._dp
mat(1,1) = mat(1,1)-(g2**2*vuFix**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*QHu*vuFix**2)/2._dp
mat(1,1) = mat(1,1)+(vS**2*lam*Conjg(lam))/2._dp
mat(1,1) = mat(1,1)+(vu**2*lam*Conjg(lam))/2._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-(g1**2*vdFix*vuFix)/4._dp
mat(1,2) = mat(1,2)-(g2**2*vdFix*vuFix)/4._dp
mat(1,2) = mat(1,2)+gp**2*QHd*QHu*vdFix*vuFix
mat(1,2) = mat(1,2)+vd*vu*lam*Conjg(lam)
mat(1,2) = mat(1,2)-(vS*Conjg(Tlam))/(2._dp*sqrt(2._dp))
mat(1,2) = mat(1,2)-(vS*Tlam)/(2._dp*sqrt(2._dp))
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+gp**2*QHd*Qs*vdFix*vSFix
mat(1,3) = mat(1,3)+vd*vS*lam*Conjg(lam)
mat(1,3) = mat(1,3)-(vu*Conjg(Tlam))/(2._dp*sqrt(2._dp))
mat(1,3) = mat(1,3)-(vu*Tlam)/(2._dp*sqrt(2._dp))
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)+gp**2*QHd*Qs1*vdFix*vS1Fix
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)+gp**2*QHd*Qs2*vdFix*vS2Fix
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)+gp**2*QHd*Qs3*vdFix*vS3Fix
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mHu2
mat(2,2) = mat(2,2)-(g1**2*vdFix**2)/8._dp
mat(2,2) = mat(2,2)-(g2**2*vdFix**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHd*QHu*vdFix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs1*vS1Fix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs2*vS2Fix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs3*vS3Fix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs*vSFix**2)/2._dp
mat(2,2) = mat(2,2)+(3*g1**2*vuFix**2)/8._dp
mat(2,2) = mat(2,2)+(3*g2**2*vuFix**2)/8._dp
mat(2,2) = mat(2,2)+(3*gp**2*QHu**2*vuFix**2)/2._dp
mat(2,2) = mat(2,2)+(vd**2*lam*Conjg(lam))/2._dp
mat(2,2) = mat(2,2)+(vS**2*lam*Conjg(lam))/2._dp
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+gp**2*QHu*Qs*vSFix*vuFix
mat(2,3) = mat(2,3)+vS*vu*lam*Conjg(lam)
mat(2,3) = mat(2,3)-(vd*Conjg(Tlam))/(2._dp*sqrt(2._dp))
mat(2,3) = mat(2,3)-(vd*Tlam)/(2._dp*sqrt(2._dp))
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)+gp**2*QHu*Qs1*vS1Fix*vuFix
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)+gp**2*QHu*Qs2*vS2Fix*vuFix
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)+gp**2*QHu*Qs3*vS3Fix*vuFix
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+ms2
mat(3,3) = mat(3,3)+(gp**2*QHd*Qs*vdFix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qs*Qs1*vS1Fix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qs*Qs2*vS2Fix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qs*Qs3*vS3Fix**2)/2._dp
mat(3,3) = mat(3,3)+(3*gp**2*Qs**2*vSFix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*QHu*Qs*vuFix**2)/2._dp
mat(3,3) = mat(3,3)+(vd**2*lam*Conjg(lam))/2._dp
mat(3,3) = mat(3,3)+(vu**2*lam*Conjg(lam))/2._dp
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+gp**2*Qs*Qs1*vS1Fix*vSFix
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)+gp**2*Qs*Qs2*vS2Fix*vSFix
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)+gp**2*Qs*Qs3*vS3Fix*vSFix
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+ms12
mat(4,4) = mat(4,4)+(gp**2*QHd*Qs1*vdFix**2)/2._dp
mat(4,4) = mat(4,4)+(3*gp**2*Qs1**2*vS1Fix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs1*Qs2*vS2Fix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs1*Qs3*vS3Fix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs*Qs1*vSFix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*QHu*Qs1*vuFix**2)/2._dp
mat(4,4) = mat(4,4)+(vS2**2*kap*Conjg(kap))/18._dp
mat(4,4) = mat(4,4)+(vS3**2*kap*Conjg(kap))/18._dp
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)+gp**2*Qs1*Qs2*vS1Fix*vS2Fix
mat(4,5) = mat(4,5)+(vS1*vS2*kap*Conjg(kap))/9._dp
mat(4,5) = mat(4,5)+(vS3*Conjg(Tk))/(6._dp*sqrt(2._dp))
mat(4,5) = mat(4,5)+(vS3*Tk)/(6._dp*sqrt(2._dp))
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)+gp**2*Qs1*Qs3*vS1Fix*vS3Fix
mat(4,6) = mat(4,6)+(vS1*vS3*kap*Conjg(kap))/9._dp
mat(4,6) = mat(4,6)+(vS2*Conjg(Tk))/(6._dp*sqrt(2._dp))
mat(4,6) = mat(4,6)+(vS2*Tk)/(6._dp*sqrt(2._dp))
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+ms22
mat(5,5) = mat(5,5)+(gp**2*QHd*Qs2*vdFix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs1*Qs2*vS1Fix**2)/2._dp
mat(5,5) = mat(5,5)+(3*gp**2*Qs2**2*vS2Fix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs2*Qs3*vS3Fix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs*Qs2*vSFix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*QHu*Qs2*vuFix**2)/2._dp
mat(5,5) = mat(5,5)+(vS1**2*kap*Conjg(kap))/18._dp
mat(5,5) = mat(5,5)+(vS3**2*kap*Conjg(kap))/18._dp
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)+gp**2*Qs2*Qs3*vS2Fix*vS3Fix
mat(5,6) = mat(5,6)+(vS2*vS3*kap*Conjg(kap))/9._dp
mat(5,6) = mat(5,6)+(vS1*Conjg(Tk))/(6._dp*sqrt(2._dp))
mat(5,6) = mat(5,6)+(vS1*Tk)/(6._dp*sqrt(2._dp))
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)+ms32
mat(6,6) = mat(6,6)+(gp**2*QHd*Qs3*vdFix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs1*Qs3*vS1Fix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs2*Qs3*vS2Fix**2)/2._dp
mat(6,6) = mat(6,6)+(3*gp**2*Qs3**2*vS3Fix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs*Qs3*vSFix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*QHu*Qs3*vuFix**2)/2._dp
mat(6,6) = mat(6,6)+(vS1**2*kap*Conjg(kap))/18._dp
mat(6,6) = mat(6,6)+(vS2**2*kap*Conjg(kap))/18._dp

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,Mhh2,ZH,ierr,test) 
 
 
! Fix order
  ZHtemp2=ZH
Do i1=1,6
  pos=Maxloc(Abs(ZHtemp2(i1,:)),1)
  ZHtemp(pos,:)=ZH(i1,:)
  Mhh2temp(pos)=Mhh2(i1)
  ZHtemp2(:,pos)=0._dp
End do
  Mhh2 = Mhh2temp
  ZH = ZHtemp
! Fix phases
Do i1=1,6
  pos=Maxloc(Abs(ZH(i1,:)),1)
  If (Real(ZH(i1,pos),dp).lt.0._dp) Then
    ZH(i1,:)=-ZH(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,6
  If (Mhh2(i1).ne.Mhh2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Mhh2(i1).Ge.0._dp) Then 
  Mhh(i1)=Sqrt(Mhh2(i1) ) 
  Else 
  Mhh(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMhhEffPot 

Subroutine CalculateMAhEffPot(g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,lam,Tlam,               & 
& kap,Tk,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,vS2,vS3,TW,TWp,ZA,MAh,MAh2,kont)

Real(dp), Intent(in) :: g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,mHd2,mHu2,ms2,ms12,ms22,ms32,vd,vu,vS,vS1,            & 
& vS2,vS3,TW,TWp

Complex(dp), Intent(in) :: lam,Tlam,kap,Tk

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MAh(6), MAh2(6) 
Complex(dp), Intent(out) :: ZA(6,6) 
 
Complex(dp) :: ZAFIX(6,6) 
 
Complex(dp) :: mat(6,6)  

Real(dp) ::  test(2), Q2 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMAh'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mHd2
mat(1,1) = mat(1,1)+(g1**2*vdFix**2)/8._dp
mat(1,1) = mat(1,1)+(g2**2*vdFix**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHd**2*vdFix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs1*vS1Fix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs2*vS2Fix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs3*vS3Fix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs*vSFix**2)/2._dp
mat(1,1) = mat(1,1)-(g1**2*vuFix**2)/8._dp
mat(1,1) = mat(1,1)-(g2**2*vuFix**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*QHu*vuFix**2)/2._dp
mat(1,1) = mat(1,1)+(vS**2*lam*Conjg(lam))/2._dp
mat(1,1) = mat(1,1)+(vu**2*lam*Conjg(lam))/2._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(vS*Conjg(Tlam))/(2._dp*sqrt(2._dp))
mat(1,2) = mat(1,2)+(vS*Tlam)/(2._dp*sqrt(2._dp))
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(vu*Conjg(Tlam))/(2._dp*sqrt(2._dp))
mat(1,3) = mat(1,3)+(vu*Tlam)/(2._dp*sqrt(2._dp))
mat(1,4) = 0._dp 
mat(1,5) = 0._dp 
mat(1,6) = 0._dp 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mHu2
mat(2,2) = mat(2,2)-(g1**2*vdFix**2)/8._dp
mat(2,2) = mat(2,2)-(g2**2*vdFix**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHd*QHu*vdFix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs1*vS1Fix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs2*vS2Fix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs3*vS3Fix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs*vSFix**2)/2._dp
mat(2,2) = mat(2,2)+(g1**2*vuFix**2)/8._dp
mat(2,2) = mat(2,2)+(g2**2*vuFix**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHu**2*vuFix**2)/2._dp
mat(2,2) = mat(2,2)+(vd**2*lam*Conjg(lam))/2._dp
mat(2,2) = mat(2,2)+(vS**2*lam*Conjg(lam))/2._dp
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(vd*Conjg(Tlam))/(2._dp*sqrt(2._dp))
mat(2,3) = mat(2,3)+(vd*Tlam)/(2._dp*sqrt(2._dp))
mat(2,4) = 0._dp 
mat(2,5) = 0._dp 
mat(2,6) = 0._dp 
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+ms2
mat(3,3) = mat(3,3)+(gp**2*QHd*Qs*vdFix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qs*Qs1*vS1Fix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qs*Qs2*vS2Fix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qs*Qs3*vS3Fix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*Qs**2*vSFix**2)/2._dp
mat(3,3) = mat(3,3)+(gp**2*QHu*Qs*vuFix**2)/2._dp
mat(3,3) = mat(3,3)+(vd**2*lam*Conjg(lam))/2._dp
mat(3,3) = mat(3,3)+(vu**2*lam*Conjg(lam))/2._dp
mat(3,4) = 0._dp 
mat(3,5) = 0._dp 
mat(3,6) = 0._dp 
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+ms12
mat(4,4) = mat(4,4)+(gp**2*QHd*Qs1*vdFix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs1**2*vS1Fix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs1*Qs2*vS2Fix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs1*Qs3*vS3Fix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*Qs*Qs1*vSFix**2)/2._dp
mat(4,4) = mat(4,4)+(gp**2*QHu*Qs1*vuFix**2)/2._dp
mat(4,4) = mat(4,4)+(vS2**2*kap*Conjg(kap))/18._dp
mat(4,4) = mat(4,4)+(vS3**2*kap*Conjg(kap))/18._dp
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)-(vS3*Conjg(Tk))/(6._dp*sqrt(2._dp))
mat(4,5) = mat(4,5)-(vS3*Tk)/(6._dp*sqrt(2._dp))
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)-(vS2*Conjg(Tk))/(6._dp*sqrt(2._dp))
mat(4,6) = mat(4,6)-(vS2*Tk)/(6._dp*sqrt(2._dp))
mat(5,5) = 0._dp 
mat(5,5) = mat(5,5)+ms22
mat(5,5) = mat(5,5)+(gp**2*QHd*Qs2*vdFix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs1*Qs2*vS1Fix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs2**2*vS2Fix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs2*Qs3*vS3Fix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*Qs*Qs2*vSFix**2)/2._dp
mat(5,5) = mat(5,5)+(gp**2*QHu*Qs2*vuFix**2)/2._dp
mat(5,5) = mat(5,5)+(vS1**2*kap*Conjg(kap))/18._dp
mat(5,5) = mat(5,5)+(vS3**2*kap*Conjg(kap))/18._dp
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)-(vS1*Conjg(Tk))/(6._dp*sqrt(2._dp))
mat(5,6) = mat(5,6)-(vS1*Tk)/(6._dp*sqrt(2._dp))
mat(6,6) = 0._dp 
mat(6,6) = mat(6,6)+ms32
mat(6,6) = mat(6,6)+(gp**2*QHd*Qs3*vdFix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs1*Qs3*vS1Fix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs2*Qs3*vS2Fix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs3**2*vS3Fix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*Qs*Qs3*vSFix**2)/2._dp
mat(6,6) = mat(6,6)+(gp**2*QHu*Qs3*vuFix**2)/2._dp
mat(6,6) = mat(6,6)+(vS1**2*kap*Conjg(kap))/18._dp
mat(6,6) = mat(6,6)+(vS2**2*kap*Conjg(kap))/18._dp

 
 Do i1=2,6
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,MAh2,ZA,ierr,test) 
 
 
! Fix phases
Do i1=1,6
  pos=Maxloc(Abs(ZA(i1,:)),1)
  If (Real(ZA(i1,pos),dp).lt.0._dp) Then
    ZA(i1,:)=-ZA(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,6
  If (MAh2(i1).ne.MAh2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MAh2(i1).Ge.0._dp) Then 
  MAh(i1)=Sqrt(MAh2(i1) ) 
  Else 
  MAh(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMAhEffPot 

Subroutine CalculateMHpmEffPot(g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,lam,Tlam,              & 
& mHd2,mHu2,vd,vu,vS,vS1,vS2,vS3,ZP,MHpm,MHpm2,kont)

Real(dp), Intent(in) :: g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,mHd2,mHu2,vd,vu,vS,vS1,vS2,vS3

Complex(dp), Intent(in) :: lam,Tlam

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MHpm(2), MHpm2(2) 
Real(dp), Intent(out) :: ZP(2,2) 
 
Real(dp) :: ZPFIX(2,2) 
 
Real(dp) :: mat(2,2)  

Real(dp) ::  test(2), Q2 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMHpm'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mHd2
mat(1,1) = mat(1,1)+(g1**2*vdFix**2)/8._dp
mat(1,1) = mat(1,1)+(g2**2*vdFix**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHd**2*vdFix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs1*vS1Fix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs2*vS2Fix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs3*vS3Fix**2)/2._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*Qs*vSFix**2)/2._dp
mat(1,1) = mat(1,1)-(g1**2*vuFix**2)/8._dp
mat(1,1) = mat(1,1)+(g2**2*vuFix**2)/8._dp
mat(1,1) = mat(1,1)+(gp**2*QHd*QHu*vuFix**2)/2._dp
mat(1,1) = mat(1,1)+(vS**2*lam*Conjg(lam))/2._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(g2**2*vdFix*vuFix)/4._dp
mat(1,2) = mat(1,2)-(vd*vu*lam*Conjg(lam))/2._dp
mat(1,2) = mat(1,2)+(vS*Conjg(Tlam))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mHu2
mat(2,2) = mat(2,2)-(g1**2*vdFix**2)/8._dp
mat(2,2) = mat(2,2)+(g2**2*vdFix**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHd*QHu*vdFix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs1*vS1Fix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs2*vS2Fix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs3*vS3Fix**2)/2._dp
mat(2,2) = mat(2,2)+(gp**2*QHu*Qs*vSFix**2)/2._dp
mat(2,2) = mat(2,2)+(g1**2*vuFix**2)/8._dp
mat(2,2) = mat(2,2)+(g2**2*vuFix**2)/8._dp
mat(2,2) = mat(2,2)+(gp**2*QHu**2*vuFix**2)/2._dp
mat(2,2) = mat(2,2)+(vS**2*lam*Conjg(lam))/2._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,MHpm2,ZP,ierr,test) 
 
 
! Fix phases
Do i1=1,2
  pos=Maxloc(Abs(ZP(i1,:)),1)
  If (Real(ZP(i1,pos),dp).lt.0._dp) Then
    ZP(i1,:)=-ZP(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (MHpm2(i1).ne.MHpm2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MHpm2(i1).Ge.0._dp) Then 
  MHpm(i1)=Sqrt(MHpm2(i1) ) 
  Else 
  MHpm(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMHpmEffPot 

Subroutine CalculateMChiEffPot(g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,lam,kap,               & 
& M1,M2,M4,vd,vu,vS,vS1,vS2,vS3,ZN,MChi,kont)

Real(dp) ,Intent(in) :: g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,vd,vu,vS,vS1,vS2,vS3

Complex(dp) ,Intent(in) :: lam,kap,M1,M2,M4

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Logical :: SecondDiagonalisationNeeded 
Real(dp), Intent(out) :: MChi(9) 
Complex(dp), Intent(out) ::  ZN(9,9) 
                              
Complex(dp) :: mat(9,9), mat2(9,9), phaseM, E9(9) 

Real(dp) :: ZNa(9,9), test(2), eig(9) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMChi'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+M4
mat(1,2) = 0._dp 
mat(1,3) = 0._dp 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)+gp*QHd*vd
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)+gp*QHu*vu
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)+gp*Qs*vS
mat(1,7) = 0._dp 
mat(1,7) = mat(1,7)+gp*Qs1*vS1
mat(1,8) = 0._dp 
mat(1,8) = mat(1,8)+gp*Qs2*vS2
mat(1,9) = 0._dp 
mat(1,9) = mat(1,9)+gp*Qs3*vS3
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+M1
mat(2,3) = 0._dp 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-(g1*vd)/2._dp
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)+(g1*vu)/2._dp
mat(2,6) = 0._dp 
mat(2,7) = 0._dp 
mat(2,8) = 0._dp 
mat(2,9) = 0._dp 
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+M2
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+(g2*vd)/2._dp
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)-(g2*vu)/2._dp
mat(3,6) = 0._dp 
mat(3,7) = 0._dp 
mat(3,8) = 0._dp 
mat(3,9) = 0._dp 
mat(4,4) = 0._dp 
mat(4,5) = 0._dp 
mat(4,5) = mat(4,5)-((vS*lam)/sqrt(2._dp))
mat(4,6) = 0._dp 
mat(4,6) = mat(4,6)-((vu*lam)/sqrt(2._dp))
mat(4,7) = 0._dp 
mat(4,8) = 0._dp 
mat(4,9) = 0._dp 
mat(5,5) = 0._dp 
mat(5,6) = 0._dp 
mat(5,6) = mat(5,6)-((vd*lam)/sqrt(2._dp))
mat(5,7) = 0._dp 
mat(5,8) = 0._dp 
mat(5,9) = 0._dp 
mat(6,6) = 0._dp 
mat(6,7) = 0._dp 
mat(6,8) = 0._dp 
mat(6,9) = 0._dp 
mat(7,7) = 0._dp 
mat(7,8) = 0._dp 
mat(7,8) = mat(7,8)+(vS3*kap)/(3._dp*sqrt(2._dp))
mat(7,9) = 0._dp 
mat(7,9) = mat(7,9)+(vS2*kap)/(3._dp*sqrt(2._dp))
mat(8,8) = 0._dp 
mat(8,9) = 0._dp 
mat(8,9) = mat(8,9)+(vS1*kap)/(3._dp*sqrt(2._dp))
mat(9,9) = 0._dp 

 
 Do i1=2,9
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
If (Maxval(Abs(Aimag(mat))).Eq.0._dp) Then 
Call EigenSystem(Real(mat,dp),Eig,ZNa,ierr,test) 
 
   Do i1=1,9
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MChi(i1) = - Eig(i1) 
    ZN(i1,:) = (0._dp,1._dp)*ZNa(i1,:) 
   Else 
    MChi(i1) = Eig(i1) 
    ZN(i1,:) = ZNa(i1,:)
    End If 
   End Do 
 
  Do i1=1,9
   pos=Maxloc(Abs(ZN(i1,:)),1) 
   If (Abs(Real(ZN(i1,pos),dp)).gt.Abs(Aimag(ZN(i1,pos)))) Then 
      If (Real(ZN(i1,pos),dp).lt.0._dp) Then 
        ZN(i1,:)=-ZN(i1,:) 
       End If 
    Else 
      If (Aimag(ZN(i1,pos)).lt.0._dp) Then 
        ZN(i1,:)=-ZN(i1,:) 
      End If 
    End If 
 End Do 
 
Do i1=1,8
  Do i2=i1+1,9
    If (MChi(i1).Gt.MChi(i2)) Then 
      Eig(1) = MChi(i1) 
      MChi(i1) = MChi(i2) 
      MChi(i2) =  Eig(1) 
      E9 = ZN(i1,:) 
      ZN(i1,:) = ZN(i2,:) 
      ZN(i2,:) = E9
    End If 
   End Do 
End Do 
 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat) ), mat ) 
Call Eigensystem(mat2, Eig, ZN, ierr, test) 
mat2 = Matmul( Conjg(ZN), Matmul( mat, Transpose( Conjg(ZN)))) 
! Special efforts are needed for matrices like the Higgsinos one 
SecondDiagonalisationNeeded = .False. 
Do i1=1,9-1
If (MaxVal(Abs(mat2(i1,(i1+1):9))).gt.Abs(mat2(i1,i1))) SecondDiagonalisationNeeded = .True. 

  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End do 
If (SecondDiagonalisationNeeded) Then 
Call EigenSystem(Real(mat2,dp),Eig,ZNa,ierr,test) 
 
     ZN = MatMul(ZN,ZNa)
  Do i1=1,9
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MChi(i1) = - Eig(i1) 
    ZN(i1,:) = (0._dp,1._dp)*ZNa(i1,:) 
   Else 
    MChi(i1) = Eig(i1) 
    ZN(i1,:) = ZNa(i1,:)
    End If 
   End Do 
 
Else 
Do i1=1,9
  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  ZN(i1,:)= phaseM * ZN(i1,:) 
End if 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
MChi = Sqrt( Eig ) 
 
End if ! Second diagonalisation 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMChi, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Iname = Iname - 1 
 
End Subroutine CalculateMChiEffPot 

Subroutine CalculateMFvEffPot(Yv,vu,ZVL,ZVR,MFv,kont)

Real(dp),Intent(in) :: vu

Complex(dp),Intent(in) :: Yv(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFv(3) 
 Complex(dp), Intent(out) :: ZVL(3,3), ZVR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZVL2(3,3), ZVR2(3,3) 
 
 Real(dp) :: ZVL1(3,3), ZVR1(3,3), test(2), MFv2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFv'
 
MFv = 0._dp 
ZVL = 0._dp 
ZVR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(vu*Yv(1,1))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(vu*Yv(1,2))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(vu*Yv(1,3))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(vu*Yv(2,1))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(vu*Yv(2,2))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(vu*Yv(2,3))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(vu*Yv(3,1))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(vu*Yv(3,2))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(vu*Yv(3,3))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFv2,ZVR1,ierr,test) 
ZVR2 = ZVR1 
Else 
Call EigenSystem(mat2,MFv2,ZVR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFv2,ZVL1,ierr,test) 
                  
                  
ZVL2 = ZVL1 
Else 
Call EigenSystem(mat2,MFv2,ZVL2,ierr,test) 
 
 
End If 
ZVL2 = Conjg(ZVL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZVL2),mat),Transpose( Conjg(ZVR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZVR2(i1,:) = phaseM *ZVR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZVR2(i1,i1)).gt.0._dp) Then 
phaseM = ZVR2(i1,i1) / Abs(ZVR2(i1,i1)) 
ZVR2(i1,:) = Conjg(phaseM) *ZVR2(i1,:) 
 ZVL2(i1,:) = phaseM *ZVL2(i1,:) 
 End if 
  If (MFv2(i1).ne.MFv2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFv2(i1)).Le.MaxMassNumericalZero) MFv2(i1) = Abs(MFv2(i1))+1.E-10_dp 
  If (MFv2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFv, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFv = Sqrt( MFv2 ) 
ZVL = ZVL2 
ZVR = ZVR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFvEffPot 

Subroutine CalculateMChaEffPot(g2,lam,M2,vd,vu,vS,UM,UP,MCha,kont)

Real(dp),Intent(in) :: g2,vd,vu,vS

Complex(dp),Intent(in) :: lam,M2

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MCha(2) 
 Complex(dp), Intent(out) :: UM(2,2), UP(2,2) 
 
 Complex(dp) :: mat(2,2)=0._dp, mat2(2,2)=0._dp, phaseM 

Complex(dp) :: UM2(2,2), UP2(2,2) 
 
 Real(dp) :: UM1(2,2), UP1(2,2), test(2), MCha2(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMCha'
 
MCha = 0._dp 
UM = 0._dp 
UP = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+M2
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(g2*vu)/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(g2*vd)/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(vS*lam)/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MCha2,UP1,ierr,test) 
UP2 = UP1 
Else 
Call EigenSystem(mat2,MCha2,UP2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MCha2,UM1,ierr,test) 
                  
                  
UM2 = UM1 
Else 
Call EigenSystem(mat2,MCha2,UM2,ierr,test) 
 
 
End If 
UM2 = Conjg(UM2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(UM2),mat),Transpose( Conjg(UP2))) 
Do i1=1,2
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
UP2(i1,:) = phaseM *UP2(i1,:) 
 End if 
End Do 
 
Do i1=1,2
If (Abs(UP2(i1,i1)).gt.0._dp) Then 
phaseM = UP2(i1,i1) / Abs(UP2(i1,i1)) 
UP2(i1,:) = Conjg(phaseM) *UP2(i1,:) 
 UM2(i1,:) = phaseM *UM2(i1,:) 
 End if 
  If (MCha2(i1).ne.MCha2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MCha2(i1)).Le.MaxMassNumericalZero) MCha2(i1) = Abs(MCha2(i1))+1.E-10_dp 
  If (MCha2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMCha, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MCha = Sqrt( MCha2 ) 
UM = UM2 
UP = UP2 
Iname = Iname - 1 
 
End Subroutine CalculateMChaEffPot 

Subroutine CalculateMFeEffPot(Ye,vd,ZEL,ZER,MFe,kont)

Real(dp),Intent(in) :: vd

Complex(dp),Intent(in) :: Ye(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFe(3) 
 Complex(dp), Intent(out) :: ZEL(3,3), ZER(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZEL2(3,3), ZER2(3,3) 
 
 Real(dp) :: ZEL1(3,3), ZER1(3,3), test(2), MFe2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFe'
 
MFe = 0._dp 
ZEL = 0._dp 
ZER = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(vd*Ye(1,1))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(vd*Ye(2,1))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(vd*Ye(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(vd*Ye(1,2))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(vd*Ye(2,2))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(vd*Ye(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(vd*Ye(1,3))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(vd*Ye(2,3))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(vd*Ye(3,3))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFe2,ZEL1,ierr,test) 
                  
                  
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat),Transpose( Conjg(ZER2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZER2(i1,i1)).gt.0._dp) Then 
phaseM = ZER2(i1,i1) / Abs(ZER2(i1,i1)) 
ZER2(i1,:) = Conjg(phaseM) *ZER2(i1,:) 
 ZEL2(i1,:) = phaseM *ZEL2(i1,:) 
 End if 
  If (MFe2(i1).ne.MFe2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFe2(i1)).Le.MaxMassNumericalZero) MFe2(i1) = Abs(MFe2(i1))+1.E-10_dp 
  If (MFe2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFe, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFe = Sqrt( MFe2 ) 
ZEL = ZEL2 
ZER = ZER2 
Iname = Iname - 1 
 
End Subroutine CalculateMFeEffPot 

Subroutine CalculateMFdEffPot(Yd,vd,ZDL,ZDR,MFd,kont)

Real(dp),Intent(in) :: vd

Complex(dp),Intent(in) :: Yd(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFd(3) 
 Complex(dp), Intent(out) :: ZDL(3,3), ZDR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZDL2(3,3), ZDR2(3,3) 
 
 Real(dp) :: ZDL1(3,3), ZDR1(3,3), test(2), MFd2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFd'
 
MFd = 0._dp 
ZDL = 0._dp 
ZDR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(vd*Yd(1,1))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(vd*Yd(2,1))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(vd*Yd(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(vd*Yd(1,2))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(vd*Yd(2,2))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(vd*Yd(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(vd*Yd(1,3))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(vd*Yd(2,3))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(vd*Yd(3,3))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFd2,ZDL1,ierr,test) 
                  
                  
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat),Transpose( Conjg(ZDR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZDR2(i1,i1)).gt.0._dp) Then 
phaseM = ZDR2(i1,i1) / Abs(ZDR2(i1,i1)) 
ZDR2(i1,:) = Conjg(phaseM) *ZDR2(i1,:) 
 ZDL2(i1,:) = phaseM *ZDL2(i1,:) 
 End if 
  If (MFd2(i1).ne.MFd2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFd2(i1)).Le.MaxMassNumericalZero) MFd2(i1) = Abs(MFd2(i1))+1.E-10_dp 
  If (MFd2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFd, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFd = Sqrt( MFd2 ) 
ZDL = ZDL2 
ZDR = ZDR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFdEffPot 

Subroutine CalculateMFuEffPot(Yu,vu,ZUL,ZUR,MFu,kont)

Real(dp),Intent(in) :: vu

Complex(dp),Intent(in) :: Yu(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFu(3) 
 Complex(dp), Intent(out) :: ZUL(3,3), ZUR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZUL2(3,3), ZUR2(3,3) 
 
 Real(dp) :: ZUL1(3,3), ZUR1(3,3), test(2), MFu2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFu'
 
MFu = 0._dp 
ZUL = 0._dp 
ZUR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(vu*Yu(1,1))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(vu*Yu(2,1))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(vu*Yu(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(vu*Yu(1,2))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(vu*Yu(2,2))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(vu*Yu(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(vu*Yu(1,3))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(vu*Yu(2,3))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(vu*Yu(3,3))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFu2,ZUL1,ierr,test) 
                  
                  
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat),Transpose( Conjg(ZUR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZUR2(i1,i1)).gt.0._dp) Then 
phaseM = ZUR2(i1,i1) / Abs(ZUR2(i1,i1)) 
ZUR2(i1,:) = Conjg(phaseM) *ZUR2(i1,:) 
 ZUL2(i1,:) = phaseM *ZUL2(i1,:) 
 End if 
  If (MFu2(i1).ne.MFu2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFu2(i1)).Le.MaxMassNumericalZero) MFu2(i1) = Abs(MFu2(i1))+1.E-10_dp 
  If (MFu2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFu, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFu = Sqrt( MFu2 ) 
ZUL = ZUL2 
ZUR = ZUR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFuEffPot 

Subroutine CalculateVPVZVZpEffPot(g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,vd,vu,              & 
& vS,vS1,vS2,vS3,ZZ,MVZ,MVZp,MVZ2,MVZp2,TW,TWp,kont)

Real(dp), Intent(in) :: g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,vd,vu,vS,vS1,vS2,vS3

Real(dp), Intent(out) :: TW,TWp

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVZ, MVZ2
Real(dp), Intent(out) :: MVZp, MVZp2
Real(dp) :: VPVZVZp2(3),VPVZVZp(3)  

Real(dp), Intent(out) :: ZZ(3,3) 
 
Real(dp) :: mat(3,3)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVPVZVZp'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g1**2*vdFix**2)/4._dp
mat(1,1) = mat(1,1)+(g1**2*vuFix**2)/4._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-(g1*g2*vdFix**2)/4._dp
mat(1,2) = mat(1,2)-(g1*g2*vuFix**2)/4._dp
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-(g1*gp*QHd*vdFix**2)/2._dp
mat(1,3) = mat(1,3)+(g1*gp*QHu*vuFix**2)/2._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*vdFix**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*vuFix**2)/4._dp
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(g2*gp*QHd*vdFix**2)/2._dp
mat(2,3) = mat(2,3)-(g2*gp*QHu*vuFix**2)/2._dp
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+gp**2*QHd**2*vdFix**2
mat(3,3) = mat(3,3)+gp**2*Qs1**2*vS1Fix**2
mat(3,3) = mat(3,3)+gp**2*Qs2**2*vS2Fix**2
mat(3,3) = mat(3,3)+gp**2*Qs3**2*vS3Fix**2
mat(3,3) = mat(3,3)+gp**2*Qs**2*vSFix**2
mat(3,3) = mat(3,3)+gp**2*QHu**2*vuFix**2

 
 Do i1=2,3
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,VPVZVZp2,ZZ,ierr,test) 
 
 
ZZ = Transpose(ZZ) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,3
  If (Abs(VPVZVZp2(i1)).Le.1.E-10_dp*(Maxval(VPVZVZp2))) VPVZVZp2(i1) = 1.E-10_dp 
  If (VPVZVZp2(i1).ne.VPVZVZp2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VPVZVZp2(i1).Ge.0._dp) Then 
  VPVZVZp(i1) =Sqrt(VPVZVZp2(i1) ) 
  Else 
  VPVZVZp(i1)= 1._dp 
  VPVZVZp(i1)= 1._dp 
! kont = -104 
 End if 
End Do 
 
MVZ = VPVZVZp(2) 
MVZ2 = VPVZVZp2(2) 
MVZp = VPVZVZp(3) 
MVZp2 = VPVZVZp2(3) 

 Iname = Iname - 1 
 
End Subroutine CalculateVPVZVZpEffPot 

Subroutine CalculateVWmEffPot(g2,vd,vu,ZW,MVWm,MVWm2,kont)

Real(dp), Intent(in) :: g2,vd,vu

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVWm, MVWm2
Real(dp) :: VWm2(2),VWm(2)  

Complex(dp), Intent(out) :: ZW(2,2) 
 
Complex(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVWm'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g2**2*vdFix**2)/4._dp
mat(1,1) = mat(1,1)+(g2**2*vuFix**2)/4._dp
mat(1,2) = 0._dp 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*vdFix**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*vuFix**2)/4._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,VWm2,ZW,ierr,test) 
 
 
ZW = Transpose(ZW) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(VWm2(i1)).Le.1.E-10_dp*(Maxval(VWm2))) VWm2(i1) = 1.E-10_dp 
  If (VWm2(i1).ne.VWm2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VWm2(i1).Ge.0._dp) Then 
  VWm(i1) =Sqrt(VWm2(i1) ) 
  Else 
  VWm(i1)= 1._dp 
  VWm(i1)= 1._dp 
! kont = -104 
 End if 
End Do 
 
MVWm = VWm(1) 
MVWm2 = VWm2(1) 

 Iname = Iname - 1 
 
End Subroutine CalculateVWmEffPot 

Subroutine TreeMassesSM(MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVWm,MVWm2,               & 
& MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZDL,ZDR,ZEL,ZER,ZUL,ZUR,ZVL,ZVR,ZW,ZZ,vd,vu,vS,             & 
& vS1,vS2,vS3,g1,g2,g3,gp,Yd,Ye,lam,Yv,kap,Yu,Td,Te,Tlam,Tv,Tk,Tu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,ms2,ms12,ms22,ms32,mv2,M1,M2,M3,M4,GenerationMixing,kont)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,gp,mHd2,mHu2,ms2,ms12,ms22,ms32

Complex(dp),Intent(in) :: Yd(3,3),Ye(3,3),lam,Yv(3,3),kap,Yu(3,3),Td(3,3),Te(3,3),Tlam,Tv(3,3),Tk,              & 
& Tu(3,3),mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),M1,M2,M3,M4

Real(dp),Intent(out) :: MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MVWm,MVWm2,               & 
& MVZ,MVZ2,MVZp,MVZp2,TW,TWp,ZZ(3,3)

Complex(dp),Intent(out) :: ZDL(3,3),ZDR(3,3),ZEL(3,3),ZER(3,3),ZUL(3,3),ZUR(3,3),ZVL(3,3),ZVR(3,3),ZW(2,2)

Real(dp),Intent(in) :: vd,vu,vS,vS1,vS2,vS3

Logical, Intent(in) :: GenerationMixing 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,kontSave 
Iname = Iname + 1 
NameOfUnit(Iname) = 'TreeMassessecluded_UMSSM'
 
kont = 0 
Call CalculateMFv(Yv,vu,ZVL,ZVR,MFv,kont)

MFv2 = MFv**2 
Call CalculateMFe(Ye,vd,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 
Call CalculateMFd(Yd,vd,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
Call CalculateMFu(Yu,vu,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 

 
 Call CalculateVPVZVZp(g1,g2,gp,QHd,QHu,Qs,Qs1,Qs2,Qs3,vd,vu,vS,vS1,vS2,               & 
& vS3,ZZ,MVZ,MVZp,MVZ2,MVZp2,TW,TWp,kont)

Call CalculateVWm(g2,vd,vu,ZW,MVWm,MVWm2,kont)

Iname = Iname - 1 
 
End Subroutine  TreeMassesSM 
 
 
Subroutine SortGoldstones(MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSv,MSv2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,v,ZA,ZD,ZDL,ZDR,               & 
& ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZV,ZVL,ZVR,ZW,ZZ,betaH,kont)

Real(dp),Intent(inout) :: MAh(6),MAh2(6),MCha(2),MCha2(2),MChi(9),MChi2(9),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MGlu,MGlu2,Mhh(6),Mhh2(6),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSv(6),MSv2(6),MVWm,             & 
& MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(inout) :: pG,UM(2,2),UP(2,2),ZA(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZH(6,6),ZN(9,9),ZU(6,6),ZUL(3,3),ZUR(3,3),ZV(6,6),ZVL(3,3),ZVR(3,3),ZW(2,2)

Integer, Intent(inout) :: kont 
Integer :: i1, i2, pos 
Real(dp) :: MAhtemp(6) 
Complex(dp) :: ZAhtemp(6,6) 
Real(dp) :: MHpmtemp(2) 
Complex(dp) :: ZHpmtemp(2,2) 


pos = MinLoc(Abs(MAh2-MVZ2*RXiZ),1) 
If (pos.ne.1) Then 
  MAhtemp = MAh2 
  ZAhtemp = ZA 
  MAh2(1) = MAhtemp(pos) 
  ZA(1,:) = ZAhtemp(pos,:) 
  MAh2(pos) = MAhtemp(1) 
  ZA(pos,:) = ZAhtemp(1,:) 
End if 
pos = MinLoc(Abs(MAh2-MVZp2*RXiZp),1) 
If (pos.ne.2) Then 
  MAhtemp = MAh2 
  ZAhtemp = ZA 
  MAh2(2) = MAhtemp(pos) 
  ZA(2,:) = ZAhtemp(pos,:) 
  MAh2(pos) = MAhtemp(2) 
  ZA(pos,:) = ZAhtemp(2,:) 
End if 

 ! Reorder the physical states by their mass 
Do i1=3,6
 pos = Minloc(MAh2(i1:6),1) + i1 -1  
If (pos.ne.i1) Then 
  MAhtemp = MAh2 
  ZAhtemp = ZA 
  MAh2(i1) = MAhtemp(pos) 
  ZA(i1,:) = ZAhtemp(pos,:) 
  MAh2(pos) = MAhtemp(i1) 
  ZA(pos,:) = ZAhtemp(i1,:) 
End if 
End do 
MAh = sqrt(MAh2) 

 
 
pos = MinLoc(Abs(MHpm2-MVWm2*RXiWm),1) 
If (pos.ne.1) Then 
  MHpmtemp = MHpm2 
  ZHpmtemp = ZP 
  MHpm2(1) = MHpmtemp(pos) 
  ZP(1,:) = ZHpmtemp(pos,:) 
  MHpm2(pos) = MHpmtemp(1) 
  ZP(pos,:) = ZHpmtemp(1,:) 
End if 

 ! Reorder the physical states by their mass 
Do i1=2,2
 pos = Minloc(MHpm2(i1:2),1) + i1 -1  
If (pos.ne.i1) Then 
  MHpmtemp = MHpm2 
  ZHpmtemp = ZP 
  MHpm2(i1) = MHpmtemp(pos) 
  ZP(i1,:) = ZHpmtemp(pos,:) 
  MHpm2(pos) = MHpmtemp(i1) 
  ZP(pos,:) = ZHpmtemp(i1,:) 
End if 
End do 
MHpm = sqrt(MHpm2) 

 
 
End subroutine SortGoldstones 


End Module TreeLevelMasses_sec_UMSSM 
 
