
unit xraylib;
interface

{
  Automatically converted by H2Pas 1.0.0 from xraylib.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xraylib.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pxrl_error  = ^xrl_error;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
Copyright (c) 2009-2016, Bruno Golosio, Antonio Brunetti, Manuel Sanchez del Rio, Tom Schoonjans and Teemu Ikonen
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
    * The names of the contributors may not be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY Bruno Golosio, Antonio Brunetti, Manuel Sanchez del Rio, Tom Schoonjans and Teemu Ikonen ''AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Bruno Golosio, Antonio Brunetti, Manuel Sanchez del Rio, Tom Schoonjans and Teemu Ikonen BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 }
{$ifndef XRAYLIB_H}
{$define XRAYLIB_H}
{ C++ extern C conditionnal removed }

const
  XRAYLIB_MAJOR = 4;  
  XRAYLIB_MINOR = 0;  
  XRAYLIB_MICRO = 0;  
{$ifndef PI}

const
  PI = 3.1415926535897932384626433832795;  
{$endif}
{$ifndef TWOPI}

const
  TWOPI = 2*PI;  
{$endif}

const
  RADEG = 180.0/PI;  
  DEGRAD = PI/180.0;  
{
 *
 * values taken from physics.nist.gov
 *
  }
{ Avogadro number (mol-1 * barn-1 * cm2)  }
  AVOGNUM = 0.602214129;  
{ keV to angstrom-1 conversion factor  }
  KEV2ANGST = 12.39841930;  
{ electron rest mass (keV)  }
  MEC2 = 510.998928;  
{ square of classical electron radius (barn)  }
  RE2 = 0.079407877;  
{ Classical electron radius (m)  }
  R_E = 2.8179403267e-15;  
{$include "xraylib-error.h"}
{$include "xraylib-shells.h"}
{$include "xraylib-lines.h"}
{$include "xraylib-parser.h"}
{$include "xraylib-auger.h"}
{$include "xraylib-defs.h"}
{$include "xraylib-crystal-diffraction.h"}
{$include "xraylib-nist-compounds.h"}
{$include "xraylib-radionuclides.h"}
{$include "xraylib-deprecated.h"}
{$include "xraylib-aux.h"}
{
 * Siegbahn notation
 * according to Table VIII.2 from Nomenclature system for X-ray spectroscopy
 * Linegroups -> usage is discouraged
 *
  }

const
  KA_LINE = 0;  
  KB_LINE = 1;  
  LA_LINE = 2;  
  LB_LINE = 3;  
{ single lines  }
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
{ Initialization  }

procedure XRayInit;cdecl;external;
{ Atomic weights  }
function AtomicWeight(Z:longint; error:PPxrl_error):Tdouble;cdecl;external;
{ Density of pure atomic element  }
function ElementDensity(Z:longint; error:PPxrl_error):Tdouble;cdecl;external;
{ Cross sections (cm2/g)  }
function CS_Total(Z:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CS_Photo(Z:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CS_Rayl(Z:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CS_Compt(Z:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CS_KN(E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CS_Energy(Z:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
{ barn/atom  }
function CSb_Total(Z:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CSb_Photo(Z:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CSb_Rayl(Z:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CSb_Compt(Z:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
{ Unpolarized differential scattering cross sections  }
function DCS_Thoms(theta:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function DCS_KN(E:Tdouble; theta:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function DCS_Rayl(Z:longint; E:Tdouble; theta:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function DCS_Compt(Z:longint; E:Tdouble; theta:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function DCSb_Rayl(Z:longint; E:Tdouble; theta:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function DCSb_Compt(Z:longint; E:Tdouble; theta:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
{ Polarized differential scattering cross sections  }
function DCSP_Thoms(theta:Tdouble; phi:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function DCSP_KN(E:Tdouble; theta:Tdouble; phi:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function DCSP_Rayl(Z:longint; E:Tdouble; theta:Tdouble; phi:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function DCSP_Compt(Z:longint; E:Tdouble; theta:Tdouble; phi:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function DCSPb_Rayl(Z:longint; E:Tdouble; theta:Tdouble; phi:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function DCSPb_Compt(Z:longint; E:Tdouble; theta:Tdouble; phi:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
{ Scattering factors  }
function FF_Rayl(Z:longint; q:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function SF_Compt(Z:longint; q:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function MomentTransf(E:Tdouble; theta:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
{ X-ray fluorescent line energy  }
function LineEnergy(Z:longint; line:longint; error:PPxrl_error):Tdouble;cdecl;external;
{ Fluorescence yield  }
function FluorYield(Z:longint; shell:longint; error:PPxrl_error):Tdouble;cdecl;external;
{ Coster-Kronig transition Probability  }
function CosKronTransProb(Z:longint; trans:longint; error:PPxrl_error):Tdouble;cdecl;external;
{ Absorption-edge energies  }
function EdgeEnergy(Z:longint; shell:longint; error:PPxrl_error):Tdouble;cdecl;external;
{ Jump ratio  }
function JumpFactor(Z:longint; shell:longint; error:PPxrl_error):Tdouble;cdecl;external;
{ Fluorescent-lines cross sections  }
function CS_FluorLine(Z:longint; line:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CSb_FluorLine(Z:longint; line:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
{ Fractional radiative rate  }
function RadRate(Z:longint; line:longint; error:PPxrl_error):Tdouble;cdecl;external;
{ Photon energy after Compton scattering  }
function ComptonEnergy(E0:Tdouble; theta:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
{ Anomalous Scattering Factors  }
function Fi(Z:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function Fii(Z:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
{ Kissel Photoelectric cross sections  }
function CS_Photo_Total(Z:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CSb_Photo_Total(Z:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CS_Photo_Partial(Z:longint; shell:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CSb_Photo_Partial(Z:longint; shell:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
{ XRF cross sections using Kissel partial photoelectric cross sections  }
function CS_FluorLine_Kissel(Z:longint; line:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CSb_FluorLine_Kissel(Z:longint; line:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CS_FluorLine_Kissel_Cascade(Z:longint; line:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CSb_FluorLine_Kissel_Cascade(Z:longint; line:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CS_FluorLine_Kissel_Nonradiative_Cascade(Z:longint; line:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CSb_FluorLine_Kissel_Nonradiative_Cascade(Z:longint; line:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CS_FluorLine_Kissel_Radiative_Cascade(Z:longint; line:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CSb_FluorLine_Kissel_Radiative_Cascade(Z:longint; line:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CS_FluorLine_Kissel_no_Cascade(Z:longint; line:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CSb_FluorLine_Kissel_no_Cascade(Z:longint; line:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
{ Total cross sections (photoionization+Rayleigh+Compton) using Kissel Total photoelectric cross sections  }
function CS_Total_Kissel(Z:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function CSb_Total_Kissel(Z:longint; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
{ Electron configuration (according to Kissel)  }
function ElectronConfig(Z:longint; shell:longint; error:PPxrl_error):Tdouble;cdecl;external;
{ Cross Section functions using the compound parser  }
(* Const before type ignored *)
function CS_Total_CP(compound:Pchar; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function CS_Photo_CP(compound:Pchar; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function CS_Rayl_CP(compound:Pchar; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function CS_Compt_CP(compound:Pchar; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function CSb_Total_CP(compound:Pchar; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function CSb_Photo_CP(compound:Pchar; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function CSb_Rayl_CP(compound:Pchar; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function CSb_Compt_CP(compound:Pchar; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function DCS_Rayl_CP(compound:Pchar; E:Tdouble; theta:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function DCS_Compt_CP(compound:Pchar; E:Tdouble; theta:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function DCSb_Rayl_CP(compound:Pchar; E:Tdouble; theta:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function DCSb_Compt_CP(compound:Pchar; E:Tdouble; theta:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function DCSP_Rayl_CP(compound:Pchar; E:Tdouble; theta:Tdouble; phi:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function DCSP_Compt_CP(compound:Pchar; E:Tdouble; theta:Tdouble; phi:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function DCSPb_Rayl_CP(compound:Pchar; E:Tdouble; theta:Tdouble; phi:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function DCSPb_Compt_CP(compound:Pchar; E:Tdouble; theta:Tdouble; phi:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function CS_Photo_Total_CP(compound:Pchar; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function CSb_Photo_Total_CP(compound:Pchar; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function CS_Total_Kissel_CP(compound:Pchar; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function CSb_Total_Kissel_CP(compound:Pchar; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function CS_Energy_CP(compound:Pchar; E:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
{ Refractive indices functions  }
(* Const before type ignored *)
function Refractive_Index_Re(compound:Pchar; E:Tdouble; density:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function Refractive_Index_Im(compound:Pchar; E:Tdouble; density:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
(* Const before type ignored *)
function Refractive_Index(compound:Pchar; E:Tdouble; density:Tdouble; error:PPxrl_error):TxrlComplex;cdecl;external;
{ ComptonProfiles  }
function ComptonProfile(Z:longint; pz:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
function ComptonProfile_Partial(Z:longint; shell:longint; pz:Tdouble; error:PPxrl_error):Tdouble;cdecl;external;
{ Atomic level widths  }
function AtomicLevelWidth(Z:longint; shell:longint; error:PPxrl_error):Tdouble;cdecl;external;
{ Auger non-radiative rates  }
function AugerRate(Z:longint; auger_trans:longint; error:PPxrl_error):Tdouble;cdecl;external;
{ Auger yield  }
function AugerYield(Z:longint; shell:longint; error:PPxrl_error):Tdouble;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
