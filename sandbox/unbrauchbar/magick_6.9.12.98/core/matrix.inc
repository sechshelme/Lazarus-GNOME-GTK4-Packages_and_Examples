{$IFDEF read_interface}


type
  PMatrixInfo = type Pointer;

function AcquireMagickMatrix(para1: Tsize_t; para2: Tsize_t): PPdouble; cdecl; external libmagickcore;
function RelinquishMagickMatrix(para1: PPdouble; para2: Tsize_t): PPdouble; cdecl; external libmagickcore;
function MatrixToImage(para1: PMatrixInfo; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function GaussJordanElimination(para1: PPdouble; para2: PPdouble; para3: Tsize_t; para4: Tsize_t): TMagickBooleanType; cdecl; external libmagickcore;
function GetMatrixElement(para1: PMatrixInfo; para2: Tssize_t; para3: Tssize_t; para4: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function NullMatrix(para1: PMatrixInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SetMatrixElement(para1: PMatrixInfo; para2: Tssize_t; para3: Tssize_t; para4: pointer): TMagickBooleanType; cdecl; external libmagickcore;
function AcquireMatrixInfo(para1: Tsize_t; para2: Tsize_t; para3: Tsize_t; para4: PExceptionInfo): PMatrixInfo; cdecl; external libmagickcore;
function DestroyMatrixInfo(para1: PMatrixInfo): PMatrixInfo; cdecl; external libmagickcore;
function GetMatrixColumns(para1: PMatrixInfo): Tsize_t; cdecl; external libmagickcore;
function GetMatrixRows(para1: PMatrixInfo): Tsize_t; cdecl; external libmagickcore;
procedure LeastSquaresAddTerms(para1: PPdouble; para2: PPdouble; para3: Pdouble; para4: Pdouble; para5: Tsize_t;
  para6: Tsize_t); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:33:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
