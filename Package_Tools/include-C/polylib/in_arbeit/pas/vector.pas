unit vector;

interface

uses
  fp_polylib64, types, arithmetique;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function ConstraintSimplify(old: PValue; n: PValue; len: longint; v: PValue): longint; cdecl; external libpolylib;
function value_alloc(want: longint; got: Plongint): PValue; cdecl; external libpolylib;
procedure value_free(p: PValue; size: longint); cdecl; external libpolylib;
procedure Factorial(n: longint; result: PValue); cdecl; external libpolylib;
procedure Binomial(n: longint; p: longint; result: PValue); cdecl; external libpolylib;
procedure CNP(a: longint; b: longint; result: PValue); cdecl; external libpolylib;
procedure Gcd(a: TValue; b: TValue; result: PValue); cdecl; external libpolylib;
function First_Non_Zero(p: PValue; length: dword): longint; cdecl; external libpolylib;
function Vector_Alloc(length: dword): PVector; cdecl; external libpolylib;
procedure Vector_Free(vector: PVector); cdecl; external libpolylib;
procedure Vector_Print(Dst: PFILE; Format: pchar; Vec: PVector); cdecl; external libpolylib;
function Vector_Read: PVector; cdecl; external libpolylib;
procedure Vector_Set(p: PValue; n: longint; length: dword); cdecl; external libpolylib;
procedure Vector_Exchange(p1: PValue; p2: PValue; length: dword); cdecl; external libpolylib;
procedure Vector_Copy(p1: PValue; p2: PValue; length: dword); cdecl; external libpolylib;
procedure Vector_Add(p1: PValue; p2: PValue; p3: PValue; length: dword); cdecl; external libpolylib;
procedure Vector_Sub(p1: PValue; p2: PValue; p3: PValue; length: dword); cdecl; external libpolylib;
procedure Vector_Or(p1: PValue; p2: PValue; p3: PValue; length: dword); cdecl; external libpolylib;
procedure Vector_Scale(p1: PValue; p2: PValue; lambda: TValue; length: dword); cdecl; external libpolylib;
procedure Vector_AntiScale(p1: PValue; p2: PValue; lambda: TValue; length: dword); cdecl; external libpolylib;
procedure Vector_Oppose(p1: PValue; p2: PValue; length: dword); cdecl; external libpolylib;
procedure Inner_Product(p1: PValue; p2: PValue; length: dword; result: PValue); cdecl; external libpolylib;
procedure Vector_Max(p: PValue; length: dword; result: PValue); cdecl; external libpolylib;
procedure Vector_Min(p: PValue; length: dword; result: PValue); cdecl; external libpolylib;
procedure Vector_Combine(p1: PValue; p2: PValue; p3: PValue; lambda: TValue; mu: TValue;
  length: dword); cdecl; external libpolylib;
function Vector_Equal(Vec1: PValue; Vec2: PValue; n: dword): longint; cdecl; external libpolylib;
procedure Vector_Min_Not_Zero(p: PValue; length: dword; index: Plongint; result: PValue); cdecl; external libpolylib;
procedure Vector_Gcd(p: PValue; length: dword; result: PValue); cdecl; external libpolylib;

type
  Tvector_map_func = function(para1: TValue; para2: TValue): PValue; cdecl;

procedure Vector_Map(p1: PValue; p2: PValue; p3: PValue; length: dword; f: Tvector_map_func); cdecl; external libpolylib;
procedure Vector_Normalize(p: PValue; length: dword); cdecl; external libpolylib;
procedure Vector_Normalize_Positive(p: PValue; length: longint; pos: longint); cdecl; external libpolylib;

type
  Treduce_func = procedure(para1: TValue; para2: PValue); cdecl;

procedure Vector_Reduce(p: PValue; length: dword; f: Treduce_func; result: PValue); cdecl; external libpolylib;
procedure Vector_Sort(vector: PValue; n: dword); cdecl; external libpolylib;
function Vector_IsZero(v: PValue; length: dword): longint; cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:36:26 ===


implementation



end.
