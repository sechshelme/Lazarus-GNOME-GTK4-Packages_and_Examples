{$IFDEF read_interface}


const
  XRAYLIB_MAJOR = 4;
  XRAYLIB_MINOR = 0;
  XRAYLIB_MICRO = 0;

const
  TWOPI = 2 * PI;
  RADEG = 180.0 / PI;
  DEGRAD = PI / 180.0;
  AVOGNUM = 0.602214129;
  KEV2ANGST = 12.39841930;
  MEC2 = 510.998928;
  RE2 = 0.079407877;
  R_E = 2.8179403267e-15;

const
  KA_LINE = 0;
  KB_LINE = 1;
  LA_LINE = 2;
  LB_LINE = 3;

  KA1_LINE = KL3_LINE;
  KA2_LINE = KL2_LINE;
  KA3_LINE = KL1_LINE;
  KB1_LINE = KM3_LINE;
  KB2_LINE = KN3_LINE;
  KB3_LINE = KM2_LINE;
  KB4_LINE = KN5_LINE;
  KB5_LINE = KM5_LINE;
  LA1_LINE = L3M5_LINE;
  LA2_LINE = L3M4_LINE;
  LB1_LINE = L2M4_LINE;
  LB2_LINE = L3N5_LINE;
  LB3_LINE = L1M3_LINE;
  LB4_LINE = L1M2_LINE;
  LB5_LINE = L3O45_LINE;
  LB6_LINE = L3N1_LINE;
  LB7_LINE = L3O1_LINE;
  LB9_LINE = L1M5_LINE;
  LB10_LINE = L1M4_LINE;
  LB15_LINE = L3N4_LINE;
  LB17_LINE = L2M3_LINE;
  LG1_LINE = L2N4_LINE;
  LG2_LINE = L1N2_LINE;
  LG3_LINE = L1N3_LINE;
  LG4_LINE = L1O3_LINE;
  LG5_LINE = L2N1_LINE;
  LG6_LINE = L2O4_LINE;
  LG8_LINE = L2O1_LINE;
  LE_LINE = L2M1_LINE;
  LH_LINE = L2M1_LINE;
  LL_LINE = L3M1_LINE;
  LS_LINE = L3M3_LINE;
  LT_LINE = L3M2_LINE;
  LU_LINE = L3N6_LINE;
  LV_LINE = L2N6_LINE;
  MA1_LINE = M5N7_LINE;
  MA2_LINE = M5N6_LINE;
  MB_LINE = M4N6_LINE;
  MG_LINE = M3N5_LINE;
  FL12_TRANS = 1;
  FL13_TRANS = 2;
  FLP13_TRANS = 3;
  FL23_TRANS = 4;
  FM12_TRANS = 5;
  FM13_TRANS = 6;
  FM14_TRANS = 7;
  FM15_TRANS = 8;
  FM23_TRANS = 9;
  FM24_TRANS = 10;
  FM25_TRANS = 11;
  FM34_TRANS = 12;
  FM35_TRANS = 13;
  FM45_TRANS = 14;

procedure XRayInit; cdecl; external libxrl;
function AtomicWeight(Z: longint; error: PPxrl_error): double; cdecl; external libxrl;
function ElementDensity(Z: longint; error: PPxrl_error): double; cdecl; external libxrl;
function CS_Total(Z: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CS_Photo(Z: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CS_Rayl(Z: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CS_Compt(Z: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CS_KN(E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CS_Energy(Z: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CSb_Total(Z: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CSb_Photo(Z: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CSb_Rayl(Z: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CSb_Compt(Z: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function DCS_Thoms(theta: double; error: PPxrl_error): double; cdecl; external libxrl;
function DCS_KN(E: double; theta: double; error: PPxrl_error): double; cdecl; external libxrl;
function DCS_Rayl(Z: longint; E: double; theta: double; error: PPxrl_error): double; cdecl; external libxrl;
function DCS_Compt(Z: longint; E: double; theta: double; error: PPxrl_error): double; cdecl; external libxrl;
function DCSb_Rayl(Z: longint; E: double; theta: double; error: PPxrl_error): double; cdecl; external libxrl;
function DCSb_Compt(Z: longint; E: double; theta: double; error: PPxrl_error): double; cdecl; external libxrl;
function DCSP_Thoms(theta: double; phi: double; error: PPxrl_error): double; cdecl; external libxrl;
function DCSP_KN(E: double; theta: double; phi: double; error: PPxrl_error): double; cdecl; external libxrl;
function DCSP_Rayl(Z: longint; E: double; theta: double; phi: double; error: PPxrl_error): double; cdecl; external libxrl;
function DCSP_Compt(Z: longint; E: double; theta: double; phi: double; error: PPxrl_error): double; cdecl; external libxrl;
function DCSPb_Rayl(Z: longint; E: double; theta: double; phi: double; error: PPxrl_error): double; cdecl; external libxrl;
function DCSPb_Compt(Z: longint; E: double; theta: double; phi: double; error: PPxrl_error): double; cdecl; external libxrl;
function FF_Rayl(Z: longint; q: double; error: PPxrl_error): double; cdecl; external libxrl;
function SF_Compt(Z: longint; q: double; error: PPxrl_error): double; cdecl; external libxrl;
function MomentTransf(E: double; theta: double; error: PPxrl_error): double; cdecl; external libxrl;
function LineEnergy(Z: longint; line: longint; error: PPxrl_error): double; cdecl; external libxrl;
function FluorYield(Z: longint; shell: longint; error: PPxrl_error): double; cdecl; external libxrl;
function CosKronTransProb(Z: longint; trans: longint; error: PPxrl_error): double; cdecl; external libxrl;
function EdgeEnergy(Z: longint; shell: longint; error: PPxrl_error): double; cdecl; external libxrl;
function JumpFactor(Z: longint; shell: longint; error: PPxrl_error): double; cdecl; external libxrl;
function CS_FluorLine(Z: longint; line: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CSb_FluorLine(Z: longint; line: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function RadRate(Z: longint; line: longint; error: PPxrl_error): double; cdecl; external libxrl;
function ComptonEnergy(E0: double; theta: double; error: PPxrl_error): double; cdecl; external libxrl;
function Fi(Z: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function Fii(Z: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CS_Photo_Total(Z: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CSb_Photo_Total(Z: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CS_Photo_Partial(Z: longint; shell: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CSb_Photo_Partial(Z: longint; shell: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CS_FluorLine_Kissel(Z: longint; line: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CSb_FluorLine_Kissel(Z: longint; line: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CS_FluorLine_Kissel_Cascade(Z: longint; line: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CSb_FluorLine_Kissel_Cascade(Z: longint; line: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CS_FluorLine_Kissel_Nonradiative_Cascade(Z: longint; line: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CSb_FluorLine_Kissel_Nonradiative_Cascade(Z: longint; line: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CS_FluorLine_Kissel_Radiative_Cascade(Z: longint; line: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CSb_FluorLine_Kissel_Radiative_Cascade(Z: longint; line: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CS_FluorLine_Kissel_no_Cascade(Z: longint; line: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CSb_FluorLine_Kissel_no_Cascade(Z: longint; line: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CS_Total_Kissel(Z: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CSb_Total_Kissel(Z: longint; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function ElectronConfig(Z: longint; shell: longint; error: PPxrl_error): double; cdecl; external libxrl;
function CS_Total_CP(compound: pchar; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CS_Photo_CP(compound: pchar; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CS_Rayl_CP(compound: pchar; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CS_Compt_CP(compound: pchar; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CSb_Total_CP(compound: pchar; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CSb_Photo_CP(compound: pchar; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CSb_Rayl_CP(compound: pchar; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CSb_Compt_CP(compound: pchar; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function DCS_Rayl_CP(compound: pchar; E: double; theta: double; error: PPxrl_error): double; cdecl; external libxrl;
function DCS_Compt_CP(compound: pchar; E: double; theta: double; error: PPxrl_error): double; cdecl; external libxrl;
function DCSb_Rayl_CP(compound: pchar; E: double; theta: double; error: PPxrl_error): double; cdecl; external libxrl;
function DCSb_Compt_CP(compound: pchar; E: double; theta: double; error: PPxrl_error): double; cdecl; external libxrl;
function DCSP_Rayl_CP(compound: pchar; E: double; theta: double; phi: double; error: PPxrl_error): double; cdecl; external libxrl;
function DCSP_Compt_CP(compound: pchar; E: double; theta: double; phi: double; error: PPxrl_error): double; cdecl; external libxrl;
function DCSPb_Rayl_CP(compound: pchar; E: double; theta: double; phi: double; error: PPxrl_error): double; cdecl; external libxrl;
function DCSPb_Compt_CP(compound: pchar; E: double; theta: double; phi: double; error: PPxrl_error): double; cdecl; external libxrl;
function CS_Photo_Total_CP(compound: pchar; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CSb_Photo_Total_CP(compound: pchar; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CS_Total_Kissel_CP(compound: pchar; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CSb_Total_Kissel_CP(compound: pchar; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function CS_Energy_CP(compound: pchar; E: double; error: PPxrl_error): double; cdecl; external libxrl;
function Refractive_Index_Re(compound: pchar; E: double; density: double; error: PPxrl_error): double; cdecl; external libxrl;
function Refractive_Index_Im(compound: pchar; E: double; density: double; error: PPxrl_error): double; cdecl; external libxrl;
function Refractive_Index(compound: pchar; E: double; density: double; error: PPxrl_error): TxrlComplex; cdecl; external libxrl;
function ComptonProfile(Z: longint; pz: double; error: PPxrl_error): double; cdecl; external libxrl;
function ComptonProfile_Partial(Z: longint; shell: longint; pz: double; error: PPxrl_error): double; cdecl; external libxrl;
function AtomicLevelWidth(Z: longint; shell: longint; error: PPxrl_error): double; cdecl; external libxrl;
function AugerRate(Z: longint; auger_trans: longint; error: PPxrl_error): double; cdecl; external libxrl;
function AugerYield(Z: longint; shell: longint; error: PPxrl_error): double; cdecl; external libxrl;

// === Konventiert am: 8-9-26 17:31:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
