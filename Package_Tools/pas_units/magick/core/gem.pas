unit gem;

interface

uses
  fp_magiccore, magick_type, geometry, random_, visual_effects;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function ExpandAffine(para1: PAffineMatrix): double; cdecl; external libmagickcore;
function GenerateDifferentialNoise(para1: PRandomInfo; para2: TQuantum; para3: TNoiseType; para4: TMagickRealType): double; cdecl; external libmagickcore;
function GetOptimalKernelWidth(para1: double; para2: double): Tsize_t; cdecl; external libmagickcore;
function GetOptimalKernelWidth1D(para1: double; para2: double): Tsize_t; cdecl; external libmagickcore;
function GetOptimalKernelWidth2D(para1: double; para2: double): Tsize_t; cdecl; external libmagickcore;
procedure ConvertHCLToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagickcore;
procedure ConvertHCLpToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagickcore;
procedure ConvertHSBToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagickcore;
procedure ConvertHSIToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagickcore;
procedure ConvertHSLToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagickcore;
procedure ConvertHSVToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagickcore;
procedure ConvertHWBToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagickcore;
procedure ConvertLCHabToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagickcore;
procedure ConvertLCHuvToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagickcore;
procedure ConvertRGBToHCL(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagickcore;
procedure ConvertRGBToHCLp(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagickcore;
procedure ConvertRGBToHSB(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagickcore;
procedure ConvertRGBToHSI(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagickcore;
procedure ConvertRGBToHSL(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagickcore;
procedure ConvertRGBToHSV(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagickcore;
procedure ConvertRGBToHWB(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagickcore;
procedure ConvertRGBToLCHab(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagickcore;
procedure ConvertRGBToLCHuv(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:36:31 ===


implementation



end.
