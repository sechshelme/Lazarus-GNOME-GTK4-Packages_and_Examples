unit colour;

interface

uses
  fp_glib2, fp_vips;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  VIPS_D93_X0 = 89.7400;
  VIPS_D93_Y0 = 100.0;
  VIPS_D93_Z0 = 130.7700;
  VIPS_D75_X0 = 94.9682;
  VIPS_D75_Y0 = 100.0;
  VIPS_D75_Z0 = 122.5710;
  VIPS_D65_X0 = 95.0470;
  VIPS_D65_Y0 = 100.0;
  VIPS_D65_Z0 = 108.8827;
  VIPS_D55_X0 = 95.6831;
  VIPS_D55_Y0 = 100.0;
  VIPS_D55_Z0 = 92.0871;
  VIPS_D50_X0 = 96.4250;
  VIPS_D50_Y0 = 100.0;
  VIPS_D50_Z0 = 82.4680;
  VIPS_A_X0 = 109.8503;
  VIPS_A_Y0 = 100.0;
  VIPS_A_Z0 = 35.5849;
  VIPS_B_X0 = 99.0720;
  VIPS_B_Y0 = 100.0;
  VIPS_B_Z0 = 85.2230;
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
  TVipsIntent = longint;

const
  VIPS_INTENT_PERCEPTUAL = 0;
  VIPS_INTENT_RELATIVE = 1;
  VIPS_INTENT_SATURATION = 2;
  VIPS_INTENT_ABSOLUTE = 3;
  VIPS_INTENT_LAST = 4;

type
  PVipsPCS = ^TVipsPCS;
  TVipsPCS = longint;

const
  VIPS_PCS_LAB = 0;
  VIPS_PCS_XYZ = 1;
  VIPS_PCS_LAST = 2;


function vips_colourspace_issupported(image: PVipsImage): Tgboolean; cdecl; external libvips;

function vips_colourspace(in_: PVipsImage; out_: PPVipsImage; space: TVipsInterpretation): longint; varargs; cdecl; external libvips;
function vips_LabQ2sRGB(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_rad2float(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_float2rad(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_LabS2LabQ(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_LabQ2LabS(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_LabQ2Lab(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_Lab2LabQ(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_LCh2Lab(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_Lab2LCh(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_Yxy2Lab(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_CMC2XYZ(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_Lab2XYZ(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_XYZ2Lab(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_XYZ2scRGB(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_scRGB2sRGB(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_scRGB2BW(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_sRGB2scRGB(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_scRGB2XYZ(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_HSV2sRGB(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_sRGB2HSV(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_LCh2CMC(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_CMC2LCh(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_XYZ2Yxy(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_Yxy2XYZ(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_LabS2Lab(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_Lab2LabS(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_CMYK2XYZ(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_XYZ2CMYK(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_profile_load(name: pchar; profile: PPVipsBlob): longint; varargs; cdecl; external libvips;
function vips_icc_present: longint; cdecl; external libvips;
function vips_icc_transform(in_: PVipsImage; out_: PPVipsImage; output_profile: pchar): longint; varargs; cdecl; external libvips;
function vips_icc_import(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_icc_export(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_icc_ac2rc(in_: PVipsImage; out_: PPVipsImage; profile_filename: pchar): longint; cdecl; external libvips;
function vips_icc_is_compatible_profile(image: PVipsImage; data: pointer; data_length: Tsize_t): Tgboolean; cdecl; external libvips;
function vips_dE76(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_dE00(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_dECMC(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
procedure vips_col_Lab2XYZ(L: single; a: single; b: single; X: Psingle; Y: Psingle; Z: Psingle); cdecl; external libvips;
procedure vips_col_XYZ2Lab(X: single; Y: single; Z: single; L: Psingle; a: Psingle; b: Psingle); cdecl; external libvips;
function vips_col_ab2h(a: double; b: double): double; cdecl; external libvips;
procedure vips_col_ab2Ch(a: single; b: single; C: Psingle; h: Psingle); cdecl; external libvips;
procedure vips_col_Ch2ab(C: single; h: single; a: Psingle; b: Psingle); cdecl; external libvips;
function vips_col_L2Lcmc(L: single): single; cdecl; external libvips;
function vips_col_C2Ccmc(C: single): single; cdecl; external libvips;
function vips_col_Ch2hcmc(C: single; h: single): single; cdecl; external libvips;
procedure vips_col_make_tables_CMC; cdecl; external libvips;
function vips_col_Lcmc2L(Lcmc: single): single; cdecl; external libvips;
function vips_col_Ccmc2C(Ccmc: single): single; cdecl; external libvips;
function vips_col_Chcmc2h(C: single; hcmc: single): single; cdecl; external libvips;
function vips_col_sRGB2scRGB_8(r: longint; g: longint; b: longint; R_: Psingle; G_: Psingle; B_: Psingle): longint; cdecl; external libvips;
function vips_col_sRGB2scRGB_16(r: longint; g: longint; b: longint; R_: Psingle; G_: Psingle; B_: Psingle): longint; cdecl; external libvips;
function vips_col_sRGB2scRGB_8_noclip(r: longint; g: longint; b: longint; R_: Psingle; G_: Psingle; B_: Psingle): longint; cdecl; external libvips;
function vips_col_sRGB2scRGB_16_noclip(r: longint; g: longint; b: longint; R_: Psingle; G_: Psingle; B_: Psingle): longint; cdecl; external libvips;
function vips_col_scRGB2XYZ(R: single; G: single; B: single; X: Psingle; Y: Psingle; Z: Psingle): longint; cdecl; external libvips;
function vips_col_XYZ2scRGB(X: single; Y: single; Z: single; R: Psingle; G: Psingle; B: Psingle): longint; cdecl; external libvips;
function vips_col_scRGB2sRGB_8(R: single; G: single; B: single; r_: Plongint; g_: Plongint; b_: Plongint; og: Plongint): longint; cdecl; external libvips;
function vips_col_scRGB2sRGB_16(R: single; G: single; B: single; r_: Plongint; g_: Plongint; b_: Plongint; og: Plongint): longint; cdecl; external libvips;
function vips_col_scRGB2BW_16(R: single; G: single; B: single; g_: Plongint; og: Plongint): longint; cdecl; external libvips;
function vips_col_scRGB2BW_8(R: single; G: single; B: single; g_: Plongint; og: Plongint): longint; cdecl; external libvips;
function vips_pythagoras(L1: single; a1: single; b1: single; L2: single; a2: single; b2: single): single; cdecl; external libvips;
function vips_col_dE00(L1: single; a1: single; b1: single; L2: single; a2: single; b2: single): single; cdecl; external libvips;

// === Konventiert am: 26-4-26 16:15:13 ===


implementation



end.
