unit grefstring;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function g_ref_string_new(str: pchar): pchar; cdecl; external libglib2;
function g_ref_string_new_len(str: pchar; len: Tgssize): pchar; cdecl; external libglib2;
function g_ref_string_new_intern(str: pchar): pchar; cdecl; external libglib2;
function g_ref_string_acquire(str: pchar): pchar; cdecl; external libglib2;
procedure g_ref_string_release(str: pchar); cdecl; external libglib2;
function g_ref_string_length(str: pchar): Tgsize; cdecl; external libglib2;

type
  PGRefString = ^TGRefString;
  TGRefString = char;

function g_ref_string_equal(str1: pchar; str2: pchar): Tgboolean; cdecl; external libglib2;

// === Konventiert am: 22-6-26 19:22:42 ===


implementation



end.
