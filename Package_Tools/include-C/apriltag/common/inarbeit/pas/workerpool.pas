unit workerpool;

interface

uses
  fp_apriltag;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pworkerpool_t = type Pointer;

function workerpool_create(nthreads: longint): Pworkerpool_t; cdecl; external libapriltag;
procedure workerpool_destroy(wp: Pworkerpool_t); cdecl; external libapriltag;
procedure workerpool_add_task(wp: Pworkerpool_t; f: Pointer; p: pointer); cdecl; external libapriltag;
procedure workerpool_run(wp: Pworkerpool_t); cdecl; external libapriltag;
procedure workerpool_run_single(wp: Pworkerpool_t); cdecl; external libapriltag;
function workerpool_get_nthreads(wp: Pworkerpool_t): longint; cdecl; external libapriltag;
function workerpool_get_nprocs: longint; cdecl; external libapriltag;

// === Konventiert am: 12-9-26 17:28:34 ===


implementation



end.
