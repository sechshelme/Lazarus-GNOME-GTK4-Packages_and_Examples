
unit efl_access_window_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_access_window_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_access_window_eo.h
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
PEfl_Access_Window  = ^Efl_Access_Window;
PEfl_Class  = ^Efl_Class;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_ACCESS_WINDOW_EO_H_}
{$define _EFL_ACCESS_WINDOW_EO_H_}
{$ifndef _EFL_ACCESS_WINDOW_EO_CLASS_TYPE}
{$define _EFL_ACCESS_WINDOW_EO_CLASS_TYPE}
type
  PEfl_Access_Window = ^TEfl_Access_Window;
  TEfl_Access_Window = TEo;
{$endif}
{$ifndef _EFL_ACCESS_WINDOW_EO_TYPES}
{$define _EFL_ACCESS_WINDOW_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Elementary accessible window interface
 *
 * @ingroup Efl_Access_Window
  }
(* Const before type ignored *)

function efl_access_window_interface_get:PEfl_Class;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_ACCESS_WINDOW_EVENT_WINDOW_CREATED : TEfl_Event_Description;cvar;external;
{* Called when new window has been created.
 *
 * @ingroup Efl_Access_Window
  }
(* Const before type ignored *)
    _EFL_ACCESS_WINDOW_EVENT_WINDOW_DESTROYED : TEfl_Event_Description;cvar;external;
{* Called when window has been destroyed.
 *
 * @ingroup Efl_Access_Window
  }
(* Const before type ignored *)
    _EFL_ACCESS_WINDOW_EVENT_WINDOW_ACTIVATED : TEfl_Event_Description;cvar;external;
{* Called when window has been activated. (focused)
 *
 * @ingroup Efl_Access_Window
  }
(* Const before type ignored *)
    _EFL_ACCESS_WINDOW_EVENT_WINDOW_DEACTIVATED : TEfl_Event_Description;cvar;external;
{* Called when window has been deactivated (unfocused).
 *
 * @ingroup Efl_Access_Window
  }
(* Const before type ignored *)
    _EFL_ACCESS_WINDOW_EVENT_WINDOW_MAXIMIZED : TEfl_Event_Description;cvar;external;
{* Called when window has been maximized
 *
 * @ingroup Efl_Access_Window
  }
(* Const before type ignored *)
    _EFL_ACCESS_WINDOW_EVENT_WINDOW_MINIMIZED : TEfl_Event_Description;cvar;external;
{* Called when window has been minimized
 *
 * @ingroup Efl_Access_Window
  }
(* Const before type ignored *)
    _EFL_ACCESS_WINDOW_EVENT_WINDOW_RESTORED : TEfl_Event_Description;cvar;external;
{* Called when window has been restored
 *
 * @ingroup Efl_Access_Window
  }

{ was #define dname def_expr }
function EFL_ACCESS_WINDOW_INTERFACE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_ACCESS_WINDOW_EVENT_WINDOW_CREATED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_ACCESS_WINDOW_EVENT_WINDOW_DESTROYED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_ACCESS_WINDOW_EVENT_WINDOW_ACTIVATED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_ACCESS_WINDOW_EVENT_WINDOW_DEACTIVATED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_ACCESS_WINDOW_EVENT_WINDOW_MAXIMIZED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_ACCESS_WINDOW_EVENT_WINDOW_MINIMIZED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_ACCESS_WINDOW_EVENT_WINDOW_RESTORED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_ACCESS_WINDOW_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_ACCESS_WINDOW_INTERFACE:=efl_access_window_interface_get;
  end;

{ was #define dname def_expr }
function EFL_ACCESS_WINDOW_EVENT_WINDOW_CREATED : longint; { return type might be wrong }
  begin
    EFL_ACCESS_WINDOW_EVENT_WINDOW_CREATED:=@(_EFL_ACCESS_WINDOW_EVENT_WINDOW_CREATED);
  end;

{ was #define dname def_expr }
function EFL_ACCESS_WINDOW_EVENT_WINDOW_DESTROYED : longint; { return type might be wrong }
  begin
    EFL_ACCESS_WINDOW_EVENT_WINDOW_DESTROYED:=@(_EFL_ACCESS_WINDOW_EVENT_WINDOW_DESTROYED);
  end;

{ was #define dname def_expr }
function EFL_ACCESS_WINDOW_EVENT_WINDOW_ACTIVATED : longint; { return type might be wrong }
  begin
    EFL_ACCESS_WINDOW_EVENT_WINDOW_ACTIVATED:=@(_EFL_ACCESS_WINDOW_EVENT_WINDOW_ACTIVATED);
  end;

{ was #define dname def_expr }
function EFL_ACCESS_WINDOW_EVENT_WINDOW_DEACTIVATED : longint; { return type might be wrong }
  begin
    EFL_ACCESS_WINDOW_EVENT_WINDOW_DEACTIVATED:=@(_EFL_ACCESS_WINDOW_EVENT_WINDOW_DEACTIVATED);
  end;

{ was #define dname def_expr }
function EFL_ACCESS_WINDOW_EVENT_WINDOW_MAXIMIZED : longint; { return type might be wrong }
  begin
    EFL_ACCESS_WINDOW_EVENT_WINDOW_MAXIMIZED:=@(_EFL_ACCESS_WINDOW_EVENT_WINDOW_MAXIMIZED);
  end;

{ was #define dname def_expr }
function EFL_ACCESS_WINDOW_EVENT_WINDOW_MINIMIZED : longint; { return type might be wrong }
  begin
    EFL_ACCESS_WINDOW_EVENT_WINDOW_MINIMIZED:=@(_EFL_ACCESS_WINDOW_EVENT_WINDOW_MINIMIZED);
  end;

{ was #define dname def_expr }
function EFL_ACCESS_WINDOW_EVENT_WINDOW_RESTORED : longint; { return type might be wrong }
  begin
    EFL_ACCESS_WINDOW_EVENT_WINDOW_RESTORED:=@(_EFL_ACCESS_WINDOW_EVENT_WINDOW_RESTORED);
  end;


end.
