unit matrix;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PMatrixInfo = type Pointer;

function AcquireMagickMatrix(para1: Tsize_t; para2: Tsize_t): PPdouble; cdecl; external libmagiccore;
function RelinquishMagickMatrix(para1: PPdouble; para2: Tsize_t): PPdouble; cdecl; external libmagiccore;
function MatrixToImage(para1: PMatrixInfo; para2: PExceptionInfo): PImage; cdecl; external libmagiccore;
function GaussJordanElimination(para1: PPdouble; para2: PPdouble; para3: Tsize_t; para4: Tsize_t): TMagickBooleanType; cdecl; external libmagiccore;
function GetMatrixElement(para1: PMatrixInfo; para2: Tssize_t; para3: Tssize_t; para4: pointer): TMagickBooleanType; cdecl; external libmagiccore;
function NullMatrix(para1: PMatrixInfo): TMagickBooleanType; cdecl; external libmagiccore;
function SetMatrixElement(para1: PMatrixInfo; para2: Tssize_t; para3: Tssize_t; para4: pointer): TMagickBooleanType; cdecl; external libmagiccore;
function AcquireMatrixInfo(para1: Tsize_t; para2: Tsize_t; para3: Tsize_t; para4: PExceptionInfo): PMatrixInfo; cdecl; external libmagiccore;
function DestroyMatrixInfo(para1: PMatrixInfo): PMatrixInfo; cdecl; external libmagiccore;
function GetMatrixColumns(para1: PMatrixInfo): Tsize_t; cdecl; external libmagiccore;
function GetMatrixRows(para1: PMatrixInfo): Tsize_t; cdecl; external libmagiccore;
procedure LeastSquaresAddTerms(para1: PPdouble; para2: PPdouble; para3: Pdouble; para4: Pdouble; para5: Tsize_t;
  para6: Tsize_t); cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 17:33:23 ===


implementation



end.
