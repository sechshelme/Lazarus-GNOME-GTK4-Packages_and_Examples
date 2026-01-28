unit hpdf_utils;

interface

uses
  fp_hpdf, hpdf_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function HPDF_AToI(s: pchar): THPDF_INT; cdecl; external libhpdf;
function HPDF_AToF(s: pchar): THPDF_DOUBLE; cdecl; external libhpdf;
function HPDF_IToA(s: pchar; val: THPDF_INT32; eptr: pchar): pchar; cdecl; external libhpdf;
function HPDF_IToA2(s: pchar; val: THPDF_UINT32; len: THPDF_UINT): pchar; cdecl; external libhpdf;
function HPDF_FToA(s: pchar; val: THPDF_REAL; eptr: pchar): pchar; cdecl; external libhpdf;
function HPDF_MemCpy(out_: PHPDF_BYTE; in_: PHPDF_BYTE; n: THPDF_UINT): PHPDF_BYTE; cdecl; external libhpdf;
function HPDF_StrCpy(out_: pchar; in_: pchar; eptr: pchar): PHPDF_BYTE; cdecl; external libhpdf;
function HPDF_MemCmp(s1: PHPDF_BYTE; s2: PHPDF_BYTE; n: THPDF_UINT): THPDF_INT; cdecl; external libhpdf;
function HPDF_StrCmp(s1: pchar; s2: pchar): THPDF_INT; cdecl; external libhpdf;
function HPDF_StrStr(s1: pchar; s2: pchar; maxlen: THPDF_UINT): pchar; cdecl; external libhpdf;
function HPDF_MemSet(s: pointer; c: THPDF_BYTE; n: THPDF_UINT): pointer; cdecl; external libhpdf;
function HPDF_StrLen(s: pchar; maxlen: THPDF_INT): THPDF_UINT; cdecl; external libhpdf;
function HPDF_ToBox(left: THPDF_INT16; bottom: THPDF_INT16; right: THPDF_INT16; top: THPDF_INT16): THPDF_Box; cdecl; external libhpdf;
function HPDF_ToPoint(x: THPDF_INT16; y: THPDF_INT16): THPDF_Point; cdecl; external libhpdf;
function HPDF_ToRect(left: THPDF_REAL; bottom: THPDF_REAL; right: THPDF_REAL; top: THPDF_REAL): THPDF_Rect; cdecl; external libhpdf;
procedure HPDF_UInt16Swap(value: PHPDF_UINT16); cdecl; external libhpdf;

function HPDF_NEEDS_ESCAPE(c: byte): boolean;
function HPDF_IS_WHITE_SPACE(c: byte): boolean;


// === Konventiert am: 28-1-26 14:09:52 ===


implementation


function HPDF_NEEDS_ESCAPE(c: byte): boolean;
begin
  Result := (c < $20) or (c > $7E) or (c = Ord('\')) or (c = Ord('%')) or (c = Ord('#')) or
    (c = Ord('/')) or (c = Ord('(')) or (c = Ord(')')) or (c = Ord('<')) or (c = Ord('>')) or
    (c = Ord('[')) or (c = Ord(']')) or (c = Ord('{')) or (c = Ord('}'));
end;

function HPDF_IS_WHITE_SPACE(c: byte): boolean;
begin
  Result := (c = $00) or (c = $09) or (c = $0A) or (c = $0C) or (c = $0D) or (c = $20);
end;

end.
