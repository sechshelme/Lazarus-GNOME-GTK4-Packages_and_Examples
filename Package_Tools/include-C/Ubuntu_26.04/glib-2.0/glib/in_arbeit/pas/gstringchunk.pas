unit gstringchunk;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGStringChunk = type Pointer;

function g_string_chunk_new(size: Tgsize): PGStringChunk; cdecl; external libglib2;
procedure g_string_chunk_free(chunk: PGStringChunk); cdecl; external libglib2;
procedure g_string_chunk_clear(chunk: PGStringChunk); cdecl; external libglib2;
function g_string_chunk_insert(chunk: PGStringChunk; _string: Pgchar): Pgchar; cdecl; external libglib2;
function g_string_chunk_insert_len(chunk: PGStringChunk; _string: Pgchar; len: Tgssize): Pgchar; cdecl; external libglib2;
function g_string_chunk_insert_const(chunk: PGStringChunk; _string: Pgchar): Pgchar; cdecl; external libglib2;

// === Konventiert am: 22-6-26 19:40:13 ===


implementation



end.
