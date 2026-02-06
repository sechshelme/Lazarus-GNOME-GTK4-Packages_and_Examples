{$IFDEF read_interface}


procedure Lcm3(a: TValue; b: TValue; c: PValue); cdecl; external libpolylib;
function AddANullColumn(M: PMatrix): PMatrix; cdecl; external libpolylib;
function AddANullRow(M: PMatrix): PMatrix; cdecl; external libpolylib;
procedure ExchangeColumns(M: PMatrix; Column1: longint; Column2: longint); cdecl; external libpolylib;
procedure ExchangeRows(M: PMatrix; Row1: longint; Row2: longint); cdecl; external libpolylib;
function findHermiteBasis(M: PMatrix; Result: PPMatrix): longint; cdecl; external libpolylib;
function Identity(size: dword): PMatrix; cdecl; external libpolylib;
function isinHnf(A: PMatrix): TBool; cdecl; external libpolylib;
function isIntegral(A: PMatrix): TBool; cdecl; external libpolylib;
function Lcm(i: TValue; j: TValue): PValue; cdecl; external libpolylib;
function Matrix_Copy(Src: PMatrix): PMatrix; cdecl; external libpolylib;
procedure PutColumnFirst(X: PMatrix; Columnnumber: longint); cdecl; external libpolylib;
procedure PutColumnLast(X: PMatrix; Columnnumber: longint); cdecl; external libpolylib;
procedure PutRowFirst(X: PMatrix; Rownumber: longint); cdecl; external libpolylib;
procedure PutRowLast(X: PMatrix; Rownumber: longint); cdecl; external libpolylib;
function RemoveNColumns(M: PMatrix; FirstColumnnumber: longint; NumColumns: longint): PMatrix; cdecl; external libpolylib;
function RemoveColumn(M: PMatrix; Columnnumber: longint): PMatrix; cdecl; external libpolylib;
function RemoveRow(M: PMatrix; Rownumber: longint): PMatrix; cdecl; external libpolylib;
function Transpose(A: PMatrix): PMatrix; cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:36:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
