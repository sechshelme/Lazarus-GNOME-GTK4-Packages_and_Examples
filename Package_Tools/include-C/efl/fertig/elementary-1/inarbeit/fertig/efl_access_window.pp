
unit efl_access_window;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_access_window.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_access_window.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_ACCESS_WINDOW_H}
{$define EFL_ACCESS_WINDOW_H}
{$ifdef EFL_BETA_API_SUPPORT}
{$include "efl_access_window.eo.h"}
{*
 * Emits 'Window:Activated' accessible signal.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function efl_access_window_activated_signal_emit(obj : longint) : longint;

{*
 * Emits 'Window:Deactivated' accessible signal.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_access_window_deactivated_signal_emit(obj : longint) : longint;

{*
 * Emits 'Window:Created' accessible signal.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_access_window_created_signal_emit(obj : longint) : longint;

{*
 * Emits 'Window:Destroyed' accessible signal.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_access_window_destroyed_signal_emit(obj : longint) : longint;

{*
 * Emits 'Window:Maximized' accessible signal.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_access_window_maximized_signal_emit(obj : longint) : longint;

{*
 * Emits 'Window:Minimized' accessible signal.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_access_window_minimized_signal_emit(obj : longint) : longint;

{*
 * Emits 'Window:Restored' accessible signal.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_access_window_restored_signal_emit(obj : longint) : longint;

{$endif}
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_access_window_activated_signal_emit(obj : longint) : longint;
begin
  efl_access_window_activated_signal_emit:=efl_access_object_event_emit(obj,EFL_ACCESS_WINDOW_EVENT_WINDOW_ACTIVATED,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_access_window_deactivated_signal_emit(obj : longint) : longint;
begin
  efl_access_window_deactivated_signal_emit:=efl_access_object_event_emit(obj,EFL_ACCESS_WINDOW_EVENT_WINDOW_DEACTIVATED,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_access_window_created_signal_emit(obj : longint) : longint;
begin
  efl_access_window_created_signal_emit:=efl_access_object_event_emit(obj,EFL_ACCESS_WINDOW_EVENT_WINDOW_CREATED,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_access_window_destroyed_signal_emit(obj : longint) : longint;
begin
  efl_access_window_destroyed_signal_emit:=efl_access_object_event_emit(obj,EFL_ACCESS_WINDOW_EVENT_WINDOW_DESTROYED,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_access_window_maximized_signal_emit(obj : longint) : longint;
begin
  efl_access_window_maximized_signal_emit:=efl_access_object_event_emit(obj,EFL_ACCESS_WINDOW_EVENT_WINDOW_MAXIMIZED,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_access_window_minimized_signal_emit(obj : longint) : longint;
begin
  efl_access_window_minimized_signal_emit:=efl_access_object_event_emit(obj,EFL_ACCESS_WINDOW_EVENT_WINDOW_MINIMIZED,NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_access_window_restored_signal_emit(obj : longint) : longint;
begin
  efl_access_window_restored_signal_emit:=efl_access_object_event_emit(obj,EFL_ACCESS_WINDOW_EVENT_WINDOW_RESTORED,NULL);
end;


end.
