unit gpollableutils;

interface

uses
  fp_glib2, giotypes, ginputstream, goutputstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function g_pollable_source_new(pollable_stream: PGObject): PGSource; cdecl; external libgio2;
function g_pollable_source_new_full(pollable_stream: Tgpointer; child_source: PGSource; cancellable: PGCancellable): PGSource; cdecl; external libgio2;
function g_pollable_stream_read(stream: PGInputStream; buffer: pointer; count: Tgsize; blocking: Tgboolean; cancellable: PGCancellable;
  error: PPGError): Tgssize; cdecl; external libgio2;
function g_pollable_stream_write(stream: PGOutputStream; buffer: pointer; count: Tgsize; blocking: Tgboolean; cancellable: PGCancellable;
  error: PPGError): Tgssize; cdecl; external libgio2;
function g_pollable_stream_write_all(stream: PGOutputStream; buffer: pointer; count: Tgsize; blocking: Tgboolean; bytes_written: Pgsize;
  cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:48:44 ===


implementation



end.
