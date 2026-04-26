
unit colour;
interface

{
  Automatically converted by H2Pas 1.0.0 from colour.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    colour.h
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
Plongint  = ^longint;
Psingle  = ^single;
PVipsBlob  = ^VipsBlob;
PVipsImage  = ^VipsImage;
PVipsIntent  = ^VipsIntent;
PVipsPCS  = ^VipsPCS;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Definitions for VIPS colour package.
 *
 * J.Cupitt, 8/4/93
 * 15/7/96 JC
 *	- C++ stuff added
 * 20/2/98 JC
 *	- new display calibration added
 * 26/9/05
 * 	- added IM_ prefix to colour temps
  }
{

	This file is part of VIPS.

	VIPS is free software; you can redistribute it and/or modify
	it under the terms of the GNU Lesser General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
	02110-1301  USA

  }
{

	These files are distributed with VIPS - http://www.vips.ecs.soton.ac.uk

  }
{$ifndef VIPS_COLOUR_H}
{$define VIPS_COLOUR_H}
{ C++ extern C conditionnal removed }
{__cplusplus }
{ Areas under curves for Dxx. 2 degree observer.
  }

const
  VIPS_D93_X0 = 89.7400;  
  VIPS_D93_Y0 = 100.0;  
  VIPS_D93_Z0 = 130.7700;  
  VIPS_D75_X0 = 94.9682;  
  VIPS_D75_Y0 = 100.0;  
  VIPS_D75_Z0 = 122.5710;  
{ D65 temp 6504.
  }
  VIPS_D65_X0 = 95.0470;  
  VIPS_D65_Y0 = 100.0;  
  VIPS_D65_Z0 = 108.8827;  
  VIPS_D55_X0 = 95.6831;  
  VIPS_D55_Y0 = 100.0;  
  VIPS_D55_Z0 = 92.0871;  
  VIPS_D50_X0 = 96.4250;  
  VIPS_D50_Y0 = 100.0;  
  VIPS_D50_Z0 = 82.4680;  
{ A temp 2856k.
  }
  VIPS_A_X0 = 109.8503;  
  VIPS_A_Y0 = 100.0;  
  VIPS_A_Z0 = 35.5849;  
{ B temp 4874k.
  }
  VIPS_B_X0 = 99.0720;  
  VIPS_B_Y0 = 100.0;  
  VIPS_B_Z0 = 85.2230;  
{ C temp 6774k.
  }
  VIPS_C_X0 = 98.0700;  
  VIPS_C_Y0 = 100.0;  
  VIPS_C_Z0 = 118.2300;  
  VIPS_E_X0 = 100.0;  
  VIPS_E_Y0 = 100.0;  
  VIPS_E_Z0 = 100.0;  
  VIPS_D3250_X0 = 105.6590;  
  VIPS_D3250_Y0 = 100.0;  
  VIPS_D3250_Z0 = 45.8501;  
type
  PVipsIntent = ^TVipsIntent;
  TVipsIntent =  Longint;
  Const
    VIPS_INTENT_PERCEPTUAL = 0;
    VIPS_INTENT_RELATIVE = 1;
    VIPS_INTENT_SATURATION = 2;
    VIPS_INTENT_ABSOLUTE = 3;
    VIPS_INTENT_LAST = 4;
;
type
  PVipsPCS = ^TVipsPCS;
  TVipsPCS =  Longint;
  Const
    VIPS_PCS_LAB = 0;
    VIPS_PCS_XYZ = 1;
    VIPS_PCS_LAST = 2;
;
(* Const before type ignored *)

function vips_colourspace_issupported(image:PVipsImage):Tgboolean;cdecl;external;
function vips_colourspace(in:PVipsImage; out:PPVipsImage; space:TVipsInterpretation; args:array of const):longint;cdecl;external;
function vips_colourspace(in:PVipsImage; out:PPVipsImage; space:TVipsInterpretation):longint;cdecl;external;
function vips_LabQ2sRGB(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_LabQ2sRGB(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_rad2float(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_rad2float(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_float2rad(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_float2rad(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_LabS2LabQ(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_LabS2LabQ(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_LabQ2LabS(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_LabQ2LabS(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_LabQ2Lab(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_LabQ2Lab(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_Lab2LabQ(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_Lab2LabQ(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_LCh2Lab(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_LCh2Lab(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_Lab2LCh(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_Lab2LCh(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_Yxy2Lab(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_Yxy2Lab(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_CMC2XYZ(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_CMC2XYZ(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_Lab2XYZ(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_Lab2XYZ(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_XYZ2Lab(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_XYZ2Lab(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_XYZ2scRGB(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_XYZ2scRGB(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_scRGB2sRGB(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_scRGB2sRGB(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_scRGB2BW(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_scRGB2BW(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_sRGB2scRGB(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_sRGB2scRGB(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_scRGB2XYZ(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_scRGB2XYZ(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_HSV2sRGB(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_HSV2sRGB(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_sRGB2HSV(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_sRGB2HSV(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_LCh2CMC(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_LCh2CMC(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_CMC2LCh(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_CMC2LCh(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_XYZ2Yxy(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_XYZ2Yxy(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_Yxy2XYZ(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_Yxy2XYZ(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_LabS2Lab(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_LabS2Lab(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_Lab2LabS(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_Lab2LabS(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_CMYK2XYZ(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_CMYK2XYZ(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_XYZ2CMYK(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_XYZ2CMYK(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_profile_load(name:Pchar; profile:PPVipsBlob; args:array of const):longint;cdecl;external;
function vips_profile_load(name:Pchar; profile:PPVipsBlob):longint;cdecl;external;
function vips_icc_present:longint;cdecl;external;
(* Const before type ignored *)
function vips_icc_transform(in:PVipsImage; out:PPVipsImage; output_profile:Pchar; args:array of const):longint;cdecl;external;
function vips_icc_transform(in:PVipsImage; out:PPVipsImage; output_profile:Pchar):longint;cdecl;external;
function vips_icc_import(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_icc_import(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_icc_export(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_icc_export(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_icc_ac2rc(in:PVipsImage; out:PPVipsImage; profile_filename:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function vips_icc_is_compatible_profile(image:PVipsImage; data:pointer; data_length:Tsize_t):Tgboolean;cdecl;external;
function vips_dE76(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_dE76(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_dE00(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_dE00(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_dECMC(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_dECMC(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
procedure vips_col_Lab2XYZ(L:single; a:single; b:single; X:Psingle; Y:Psingle; 
            Z:Psingle);cdecl;external;
procedure vips_col_XYZ2Lab(X:single; Y:single; Z:single; L:Psingle; a:Psingle; 
            b:Psingle);cdecl;external;
function vips_col_ab2h(a:Tdouble; b:Tdouble):Tdouble;cdecl;external;
procedure vips_col_ab2Ch(a:single; b:single; C:Psingle; h:Psingle);cdecl;external;
procedure vips_col_Ch2ab(C:single; h:single; a:Psingle; b:Psingle);cdecl;external;
function vips_col_L2Lcmc(L:single):single;cdecl;external;
function vips_col_C2Ccmc(C:single):single;cdecl;external;
function vips_col_Ch2hcmc(C:single; h:single):single;cdecl;external;
procedure vips_col_make_tables_CMC;cdecl;external;
function vips_col_Lcmc2L(Lcmc:single):single;cdecl;external;
function vips_col_Ccmc2C(Ccmc:single):single;cdecl;external;
function vips_col_Chcmc2h(C:single; hcmc:single):single;cdecl;external;
function vips_col_sRGB2scRGB_8(r:longint; g:longint; b:longint; R:Psingle; G:Psingle; 
           B:Psingle):longint;cdecl;external;
function vips_col_sRGB2scRGB_16(r:longint; g:longint; b:longint; R:Psingle; G:Psingle; 
           B:Psingle):longint;cdecl;external;
function vips_col_sRGB2scRGB_8_noclip(r:longint; g:longint; b:longint; R:Psingle; G:Psingle; 
           B:Psingle):longint;cdecl;external;
function vips_col_sRGB2scRGB_16_noclip(r:longint; g:longint; b:longint; R:Psingle; G:Psingle; 
           B:Psingle):longint;cdecl;external;
function vips_col_scRGB2XYZ(R:single; G:single; B:single; X:Psingle; Y:Psingle; 
           Z:Psingle):longint;cdecl;external;
function vips_col_XYZ2scRGB(X:single; Y:single; Z:single; R:Psingle; G:Psingle; 
           B:Psingle):longint;cdecl;external;
function vips_col_scRGB2sRGB_8(R:single; G:single; B:single; r:Plongint; g:Plongint; 
           b:Plongint; og:Plongint):longint;cdecl;external;
function vips_col_scRGB2sRGB_16(R:single; G:single; B:single; r:Plongint; g:Plongint; 
           b:Plongint; og:Plongint):longint;cdecl;external;
function vips_col_scRGB2BW_16(R:single; G:single; B:single; g:Plongint; og:Plongint):longint;cdecl;external;
function vips_col_scRGB2BW_8(R:single; G:single; B:single; g:Plongint; og:Plongint):longint;cdecl;external;
function vips_pythagoras(L1:single; a1:single; b1:single; L2:single; a2:single; 
           b2:single):single;cdecl;external;
function vips_col_dE00(L1:single; a1:single; b1:single; L2:single; a2:single; 
           b2:single):single;cdecl;external;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_COLOUR_H }

implementation


end.
