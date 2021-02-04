
ParticleDefinitions[GaugeES] = {
      {SdL,  {  Description -> "Left Down-Squarks"}},
      {SdR,  { Description -> "Right Down-Squarks"}},
      {SuL,  { Description -> "Left Up-Squarks"}}, 
      {SuR,  { Description -> "Right Up-Squarks" }},                
      {SeL,  { Description -> "Left Selectron"}}, 
      {SeR,  { Description -> "Right Selectron"}},                         
      {SvL,  { Description -> "Left Sneutrino"}},
      {SvR,  { 
      	       Description -> "Right Sneutrino",
               Width -> 0,
               Mass -> Automatic,
               LaTeX -> "\\tilde{\\nu}_R",
               OutputName -> "SR" }},

      {SHd0, { Description -> "Neutral Down-Higgs"}},                         
      {SHdm, { Description -> "Charged Down-Higgs"}}, 
      {SHu0, { Description -> "Neutral Up-Higgs"}},                         
      {SHup, { Description -> "Charged Up-Higgs"}},                                                   
      {VB,   { Description -> "B-Boson"}},                                                   
      {VG,   { Description -> "Gluon"}},          
      {VWB,  { Description -> "W-Bosons"}},          
      {gB,   { Description -> "B-Boson Ghost"}},                                                   
      {gG,   { Description -> "Gluon Ghost" }},          
      {gWB,  { Description -> "W-Boson Ghost"}},    
      {Glu,  { Description -> "Gluino"}},
      {Wino, { Description -> "Wino"}},
      {Bino, { Description -> "Bino"}},                                                                                           
      {H0,   { Description -> "Neutral Higgsinos"}},
      {HC,   { Description -> "Charged Higgsinos"}},  

      {SsR,  { Description -> "Singlet"}},                     
      {FS,   { Description -> "Singlino" }},
      {Fd1,  { Description -> "Dirac Left Down-Quark"}},
      {Fd2,  { Description -> "Dirac Right Down-Quark"}},
      {Fu1,  { Description -> "Dirac Left Up-Quark"}},
      {Fu2,  { Description -> "Dirac Right Up-Quark"}},
      {Fe1,  { Description -> "Dirac Left Electron"}},
      {Fe2,  { Description -> "Dirac Right Electron"}},
      {Fv1,  { Description -> "Neutrinos" }},

      {Fv2,  {
               Width -> 0,
               Mass -> Automatic,
               LaTeX -> "\\nu_R",
               OutputName -> "nR"}},


      {VU,   { LaTeX -> "U",
               OutputName -> VU,
               FeynArtsNr -> 10 }},

      {gU,   { LaTeX -> "g_U",
               OutputName -> gU,
               FeynArtsNr -> 10 }},
      {Fs1,  { LaTeX -> "\\tilde{S}_1",
               FeynArtsNr -> 31,
               OutputName -> Fs1}},
      {Fs2,  { LaTeX -> "\\tilde{S}_2",
               FeynArtsNr -> 32,
               OutputName -> Fs2}},
      {Fs3,  { LaTeX -> "\\tilde{S}_3",
               FeynArtsNr -> 33,
               OutputName -> Fs3}},

      {SS1,  { LaTeX -> "S_1",
               FeynArtsNr -> 31,
               OutputName -> SS1}},
      {SS2,  { LaTeX -> "S_2",
               FeynArtsNr -> 32,
               OutputName -> SS2}},
      {SS3,  { LaTeX -> "S_3",
               FeynArtsNr -> 33,
               OutputName -> SS3}},
      {FU,  { LaTeX -> "\\tilde{u}_1",
               FeynArtsNr -> 10,
               OutputName -> FU}}

      };
      
      
  ParticleDefinitions[TEMP] = {
    {VZ,   { Description -> "Z-Boson" }}, 
    {gZ,   { Description -> "Z-Boson Ghost" }}
    };
      
      
  ParticleDefinitions[EWSB] = {

     {Sd ,  { Description -> "Down-Squarks"}},
     {Su ,  { Description -> "Up-Squarks"}},   
     {Se ,  { Description -> "Sleptons"}}, 
     {Sv ,  { Description -> "Sneutrinos",
          PDG->{1000012,1000014,1000016,2000012,2000014,2000016} }},
     {hh   ,  {  Description -> "Higgs",
                 PDG -> {25, 35,45,55,65,75},
                 PDG.IX ->{101000001,101000002,101000003,101000004,101000005,101000006  } }},
     {Ah   ,  {    Description -> "Pseudo-Scalar Higgs",
                 PDG -> {0, 0, 36, 46,56,66},
                 PDG.IX ->{0,0,  102000001,102000002,102000003,102000004  } }},
     {Hpm,  { Description -> "Charged Higgs"}},                                                   
     {VP,   { Description -> "Photon"}},
     {VZ,   { Description -> "Z-Boson" }}, 
     {VZp,    { Description -> "Z'-Boson"}},  
     {gZp,    { Description -> "Z'-Ghost" }}, 
      {VG,   { Description -> "Gluon" }},          
      {VWm,  { Description -> "W-Boson" }},         
      {gP,   { Description -> "Photon Ghost"}},                                                   
      {gWm,  { Description -> "Negative W-Boson Ghost"}}, 
      {gWmC, { Description -> "Positive W-Boson Ghost" }}, 
      {gZ,   { Description -> "Z-Boson Ghost" }},  
      {gG,   { Description -> "Gluon Ghost" }},                  
      {Fd,   { Description -> "Down-Quarks"}},   
      {Fu,   { Description -> "Up-Quarks"}},   
      {Fe,   { Description -> "Leptons" }},
      {Fv,   { Description -> "Neutrinos" }},                                                                     
      {Glu,  { Description -> "Gluino" }},                 
      {Chi,    {   Description -> "Neutralinos",
                 PDG -> {1000022,1000023,1000025,1000035,1000045,1000055,1000065,1000075,1000085},
                 PDG.IX ->{211000001,211000002,211000003,211000004,211000005,211000006,211000007,211000008,211000009} }},
      {Cha,  { Description -> "Charginos"}}                                                                                          
     
        };    
        
        
        
 WeylFermionAndIndermediate = {
       {FHd0, { Description -> "Neutral Down-Higgsino"}},      
       {FHu0, { Description -> "Neutral Up-Higgsino" }}, 
       {FHdm, { Description -> "Charged Down-Higgsino"}}, 
       {FHup, { Description -> "Charged Up-Higgsino"}},
       {L0,   { Description -> "Neutralino Weyl-Spinor"}},
       {Lm,   { Description -> "Negative Chargino Weyl-Spinor"}},
       {Lp,   { Description -> "Positive Chargino Weyl-Spinor"}}, 
       {fG,   { Description ->"Gluino Weyl-Spinor"}},
       {fWB,  { Description ->"Wino Weyl-Spinor"}},
       {fW0,  { Description ->"Neutral Wino" }},
       {fWm,  { Description ->"Negative Wino"}},                 
       {fWp,  { Description ->"Positive Wino"}},                 
       {fB,   { Description ->"Bino Weyl-Spinor"}},    
       {phid, { Description -> "Scalar Down"}},                                                                       
       {phiu, { Description -> "Scalar Up"}}, 
       {sigmad,   { Description -> "Pseudo Scalar Down"}},                                                                                        
       {sigmau,   { Description -> "Pseudo Scalar Up" }},

       {phi1,  { LaTeX -> "\\phi_1"}},
       {phi2,  { LaTeX -> "\\phi_2"}},
       {phi3,  { LaTeX -> "\\phi_3"}},

       {sigma1,  { LaTeX -> "\\sigma_1"}},
       {sigma2,  { LaTeX -> "\\sigma_2"}},
       {sigma3,  { LaTeX -> "\\sigma_3"}},


       {SHd,  { Description -> "Down-Higgs"}},
       {SHu,  { Description -> "Up-Higgs"}},
       {Sl,   { Description -> "Left Slepton" }},
       {Sq,   { Description -> "Left Squark" }},
       {FeL,  { Description -> "Left Electron" }},
       {FeR,  { Description -> "Right Electron" }} ,
       {FdL,  { Description -> "Left Down-Quark" }},
       {FdR,  { Description -> "Right Down-Quark" }},              
       {FuL,  { Description -> "Left Up-Quark" }},
       {FuR,  { Description -> "Right Up-Quark" }},
       {FEL,  { Description -> "Rotated Left Electron" }},
       {FER,  { Description -> "Rotated Right Electron" }} ,
       {FDL,  { Description -> "Rotated Left Up-Quark" }},
       {FDR,  { Description -> "Rotated Right Up-Quark" }},              
       {FUL,  { Description -> "Rotated Left Down-Quark"}},
       {FUR,  { Description -> "Rotated Right Down-Quark" }},                
       {FHd,  { Description -> "Down-Higgsino" }},
       {FHu,  { Description -> "Up-Higgsino" }},
       {Fl,   { Description -> "Left Leptons"}},
       {Fq,   { Description -> "Left Quarks"}}, 
       {FvL,  { Description -> "Left Neutrino"}},
       {FvR,  {
               Width -> 0,
               Mass -> Automatic,
               LaTeX -> "\\nu_R",
               OutputName -> "FvR"}},

       {FsR,   { Description -> "Weyl Spinor of Singlino"}}, 
                 
 {sigmaS,      {Description -> "Scalar Singlet" }}  ,
                 
 {phiS,      { Description -> "Pseudo Scalar Singlet"}},


       {e,    { Description -> "Right Electron Superfield" }},
       {d,    { Description -> "Right Down-Quark Superfield" }},                 
       {q,    { Description -> "Left Quark Superfield" }},                 
       {u,    { Description -> "Right Up-Quark Superfield" }},                 
       {l,    { Description -> "left Lepton Superfield" }},  
       {Hd,   { Description -> "Down-Higgs Superfield"}},                                         
       {Hu,   { Description -> "Up-Higgs Superfield" }},                 
       {s,    { Description -> "Singlet Superfield" }}, 
       {G,    { Description -> "Gluon Superfield" }},                 
       {B,    { Description -> "B Superfield" }},                 
       {WB,   { Description -> "W Superfield" }},
       {U,    { LaTeX -> "\\hat{U}"}},
       {S,    { LaTeX -> "\\hat{S}" }},
       {s1,    { LaTeX -> "\\hat{s}_1" }},
       {s2,    { LaTeX -> "\\hat{s}_2" }},
       {s3,    { LaTeX -> "\\hat{s}_3" }},

       {FS1,    { LaTeX -> "\\tilde{s}_1" }},
       {FS2,    { LaTeX -> "\\tilde{s}_2" }},
       {FS3,    { LaTeX -> "\\tilde{s}_3" }},

       {fU,    { LaTeX -> "\\tilde{U}" }}


        };       


