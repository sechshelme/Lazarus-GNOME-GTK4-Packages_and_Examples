
unit efl_app_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_app_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_app_eo.h
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
PEfl_App  = ^Efl_App;
PEfl_Class  = ^Efl_Class;
PEfl_Version  = ^Efl_Version;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_APP_EO_H_}
{$define _EFL_APP_EO_H_}
{$ifndef _EFL_APP_EO_CLASS_TYPE}
{$define _EFL_APP_EO_CLASS_TYPE}
type
  PEfl_App = ^TEfl_App;
  TEfl_App = TEo;
{$endif}
{$ifndef _EFL_APP_EO_TYPES}
{$define _EFL_APP_EO_TYPES}
{$endif}
{* Object representing the application itself.
 *
 * @since 1.22
 *
 * @ingroup Efl_App
  }

{ was #define dname def_expr }
function EFL_APP_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_app_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Returns the app object that is representing this process
 *
 * @note This function call only works in the main loop thread of the process.
 *
 * @return Application for this process
 *
 * @since 1.22
 *
 * @ingroup Efl_App
  }
function efl_app_main_get:PEfl_App;cdecl;external;
{*
 * @brief Indicates the version of EFL with which this application was compiled
 * against/for.
 *
 * This might differ from @ref efl_app_efl_version_get.
 *
 * @param[in] obj The object.
 *
 * @return Efl build version
 *
 * @since 1.22
 *
 * @ingroup Efl_App
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_app_build_efl_version_get(obj:PEo):PEfl_Version;cdecl;external;
{*
 * @brief Indicates the currently running version of EFL.
 *
 * This might differ from @ref efl_app_build_efl_version_get.
 *
 * @param[in] obj The object.
 *
 * @return Efl version
 *
 * @since 1.22
 *
 * @ingroup Efl_App
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_app_efl_version_get(obj:PEo):PEfl_Version;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_APP_EVENT_PAUSE : TEfl_Event_Description;cvar;external;
{* Called when the application is not going be displayed or otherwise used by
 * a user for some time
 *
 * @since 1.22
 *
 * @ingroup Efl_App
  }
(* Const before type ignored *)
    _EFL_APP_EVENT_RESUME : TEfl_Event_Description;cvar;external;
{* Called before a window is rendered after a pause event
 *
 * @since 1.22
 *
 * @ingroup Efl_App
  }
(* Const before type ignored *)
    _EFL_APP_EVENT_STANDBY : TEfl_Event_Description;cvar;external;
{* Called when the application's windows are all destroyed
 *
 * @since 1.22
 *
 * @ingroup Efl_App
  }
(* Const before type ignored *)
    _EFL_APP_EVENT_TERMINATE : TEfl_Event_Description;cvar;external;
{* Called before starting the shutdown of the application
 *
 * @since 1.22
 *
 * @ingroup Efl_App
  }
(* Const before type ignored *)
    _EFL_APP_EVENT_SIGNAL_USR1 : TEfl_Event_Description;cvar;external;
{* System specific, but on unix maps to SIGUSR1 signal to the process - only
 * called on main loop object
 *
 * @since 1.22
 *
 * @ingroup Efl_App
  }
(* Const before type ignored *)
    _EFL_APP_EVENT_SIGNAL_USR2 : TEfl_Event_Description;cvar;external;
{* System specific, but on unix maps to SIGUSR2 signal to the process - only
 * called on main loop object
 *
 * @since 1.22
 *
 * @ingroup Efl_App
  }
(* Const before type ignored *)
    _EFL_APP_EVENT_SIGNAL_HUP : TEfl_Event_Description;cvar;external;
{* System specific, but on unix maps to SIGHUP signal to the process - only
 * called on main loop object
 *
 * @since 1.22
 *
 * @ingroup Efl_App
  }

{ was #define dname def_expr }
function EFL_APP_EVENT_PAUSE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_APP_EVENT_RESUME : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_APP_EVENT_STANDBY : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_APP_EVENT_TERMINATE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_APP_EVENT_SIGNAL_USR1 : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_APP_EVENT_SIGNAL_USR2 : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_APP_EVENT_SIGNAL_HUP : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_APP_CLASS : longint; { return type might be wrong }
  begin
    EFL_APP_CLASS:=efl_app_class_get;
  end;

{ was #define dname def_expr }
function EFL_APP_EVENT_PAUSE : longint; { return type might be wrong }
  begin
    EFL_APP_EVENT_PAUSE:=@(_EFL_APP_EVENT_PAUSE);
  end;

{ was #define dname def_expr }
function EFL_APP_EVENT_RESUME : longint; { return type might be wrong }
  begin
    EFL_APP_EVENT_RESUME:=@(_EFL_APP_EVENT_RESUME);
  end;

{ was #define dname def_expr }
function EFL_APP_EVENT_STANDBY : longint; { return type might be wrong }
  begin
    EFL_APP_EVENT_STANDBY:=@(_EFL_APP_EVENT_STANDBY);
  end;

{ was #define dname def_expr }
function EFL_APP_EVENT_TERMINATE : longint; { return type might be wrong }
  begin
    EFL_APP_EVENT_TERMINATE:=@(_EFL_APP_EVENT_TERMINATE);
  end;

{ was #define dname def_expr }
function EFL_APP_EVENT_SIGNAL_USR1 : longint; { return type might be wrong }
  begin
    EFL_APP_EVENT_SIGNAL_USR1:=@(_EFL_APP_EVENT_SIGNAL_USR1);
  end;

{ was #define dname def_expr }
function EFL_APP_EVENT_SIGNAL_USR2 : longint; { return type might be wrong }
  begin
    EFL_APP_EVENT_SIGNAL_USR2:=@(_EFL_APP_EVENT_SIGNAL_USR2);
  end;

{ was #define dname def_expr }
function EFL_APP_EVENT_SIGNAL_HUP : longint; { return type might be wrong }
  begin
    EFL_APP_EVENT_SIGNAL_HUP:=@(_EFL_APP_EVENT_SIGNAL_HUP);
  end;


end.
