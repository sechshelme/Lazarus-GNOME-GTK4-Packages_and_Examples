unit gem;

interface

uses
  fp_magiccore, magick_type, geometry, random_, visual_effects;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function ExpandAffine(para1: PAffineMatrix): double; cdecl; external libmagiccore;
function GenerateDifferentialNoise(para1: PRandomInfo; para2: TQuantum; para3: TNoiseType; para4: TMagickRealType): double; cdecl; external libmagiccore;
function GetOptimalKernelWidth(para1: double; para2: double): Tsize_t; cdecl; external libmagiccore;
function GetOptimalKernelWidth1D(para1: double; para2: double): Tsize_t; cdecl; external libmagiccore;
function GetOptimalKernelWidth2D(para1: double; para2: double): Tsize_t; cdecl; external libmagiccore;
procedure ConvertHCLToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagiccore;
procedure ConvertHCLpToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagiccore;
procedure ConvertHSBToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagiccore;
procedure ConvertHSIToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagiccore;
procedure ConvertHSLToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagiccore;
procedure ConvertHSVToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagiccore;
procedure ConvertHWBToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagiccore;
procedure ConvertLCHabToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagiccore;
procedure ConvertLCHuvToRGB(para1: double; para2: double; para3: double; para4: PQuantum; para5: PQuantum;
  para6: PQuantum); cdecl; external libmagiccore;
procedure ConvertRGBToHCL(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagiccore;
procedure ConvertRGBToHCLp(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagiccore;
procedure ConvertRGBToHSB(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagiccore;
procedure ConvertRGBToHSI(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagiccore;
procedure ConvertRGBToHSL(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagiccore;
procedure ConvertRGBToHSV(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagiccore;
procedure ConvertRGBToHWB(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagiccore;
procedure ConvertRGBToLCHab(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagiccore;
procedure ConvertRGBToLCHuv(para1: TQuantum; para2: TQuantum; para3: TQuantum; para4: Pdouble; para5: Pdouble;
  para6: Pdouble); cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 15:36:31 ===


implementation



end.
