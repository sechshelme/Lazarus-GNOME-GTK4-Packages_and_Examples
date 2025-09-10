unit sdl2_event;

interface

uses
  fp_tcod, console_types, mouse_types, sys;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


function TCOD_sys_process_key_event(in_:PSDL_Event; out_:PTCOD_key_t):TTCOD_event_t;cdecl;external libtcod;
function TCOD_sys_process_mouse_event(in_:PSDL_Event; out_:PTCOD_mouse_t):TTCOD_event_t;cdecl;external libtcod;

// === Konventiert am: 10-9-25 16:54:07 ===


implementation



end.
