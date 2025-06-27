
unit wnd_cf;
interface

{
  Automatically converted by H2Pas 1.0.0 from wnd_cf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    wnd_cf.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pmreal  = ^mreal;
Ppthread_mutex_t  = ^pthread_mutex_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



procedure mgl_set_click_func(gr:THMGL; func:procedure (p:pointer));cdecl;external;
procedure mgl_wnd_set_mutex(gr:THMGL; mutex:Ppthread_mutex_t);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
procedure mgl_wnd_make_dialog(gr:THMGL; ids:Pchar; args:PPchar; title:Pchar);cdecl;external;
procedure mgl_wnd_set_func(gr:THMGL; draw:function (gr:THMGL; p:pointer):longint; par:pointer; reload:procedure (p:pointer));cdecl;external;
(* Const before type ignored *)
procedure mgl_wnd_set_prop(gr:THMGL; prop:procedure (id:char; val:Pchar; p:pointer); par:pointer);cdecl;external;
procedure mgl_wnd_set_delay(gr:THMGL; dt:Tdouble);cdecl;external;
function mgl_wnd_get_delay(gr:THMGL):Tdouble;cdecl;external;
procedure mgl_setup_window(gr:THMGL; clf_upd:longint; showpos:longint);cdecl;external;
procedure mgl_wnd_toggle_alpha(gr:THMGL);cdecl;external;
procedure mgl_wnd_toggle_light(gr:THMGL);cdecl;external;
procedure mgl_wnd_toggle_zoom(gr:THMGL);cdecl;external;
procedure mgl_wnd_toggle_rotate(gr:THMGL);cdecl;external;
procedure mgl_wnd_toggle_no(gr:THMGL);cdecl;external;
procedure mgl_wnd_update(gr:THMGL);cdecl;external;
procedure mgl_wnd_reload(gr:THMGL);cdecl;external;
procedure mgl_wnd_adjust(gr:THMGL);cdecl;external;
procedure mgl_wnd_next_frame(gr:THMGL);cdecl;external;
procedure mgl_wnd_prev_frame(gr:THMGL);cdecl;external;
procedure mgl_wnd_animation(gr:THMGL);cdecl;external;
procedure mgl_get_last_mouse_pos(gr:THMGL; x:Pmreal; y:Pmreal; z:Pmreal);cdecl;external;
function mgl_wnd_window(gr:THMGL):pointer;cdecl;external;
function mgl_wnd_widget(gr:THMGL):pointer;cdecl;external;
procedure mgl_wnd_move(gr:THMGL; x:longint; y:longint);cdecl;external;
procedure mgl_wnd_size(gr:THMGL; w:longint; h:longint);cdecl;external;

implementation


end.
