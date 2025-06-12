
unit eio_sentry;
interface

{
  Automatically converted by H2Pas 1.0.0 from eio_sentry.eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eio_sentry.eo.h
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
PEfl_Class  = ^Efl_Class;
PEio_Sentry  = ^Eio_Sentry;
PEio_Sentry_Event  = ^Eio_Sentry_Event;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EIO_SENTRY_EO_H_}
{$define _EIO_SENTRY_EO_H_}
{$ifndef _EIO_SENTRY_EO_CLASS_TYPE}
{$define _EIO_SENTRY_EO_CLASS_TYPE}
type
  PEio_Sentry = ^TEio_Sentry;
  TEio_Sentry = TEo;
{$endif}
{$ifndef _EIO_SENTRY_EO_TYPES}
{$define _EIO_SENTRY_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Wraps the data about a monitor event on a file.
 *
 * @ingroup Eio_Sentry_Event
  }
(* Const before type ignored *)
{*< The cause of the event.  }
(* Const before type ignored *)
{*< The original monitored path.  }
type
  PEio_Sentry_Event = ^TEio_Sentry_Event;
  TEio_Sentry_Event = record
      trigger : Pchar;
      source : Pchar;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Monitors files and directories for changes.
 *
 * @ingroup Eio_Sentry
  }

{ was #define dname def_expr }
function EIO_SENTRY_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function eio_sentry_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Adds a new path to the list of monitored paths.
 *
 * @param[in] obj The object.
 * @param[in] path Path to monitor
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Eio_Sentry
  }
(* Const before type ignored *)
function eio_sentry_add(obj:PEo; path:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Removes the given path from the monitored list.
 *
 * @param[in] obj The object.
 * @param[in] path Path to remove from monitoring
 *
 * @ingroup Eio_Sentry
  }
(* Const before type ignored *)
procedure eio_sentry_remove(obj:PEo; path:Pchar);cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Return if the sentry is using the fallback monitoring method
 *
 * The fallback method of monitoring cannot provide certain events.
 *
 * @param[in] obj The object.
 * @param[in] path Path to check for fallback monitoring
 *
 * @return @c true only if the sentry is using the fallback mechanism
 *
 * @ingroup Eio_Sentry
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eio_sentry_fallback_check(obj:PEo; path:Pchar):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
(* Const before type ignored *)
  var
    _EIO_SENTRY_EVENT_FILE_CREATED : TEfl_Event_Description;cvar;external;
{* Called when a file was created
 * @return Eio_Sentry_Event
 *
 * @ingroup Eio_Sentry
  }

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_FILE_CREATED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EIO_SENTRY_EVENT_FILE_DELETED : TEfl_Event_Description;cvar;external;
{* Called when a file was deleted
 * @return Eio_Sentry_Event
 *
 * @ingroup Eio_Sentry
  }

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_FILE_DELETED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EIO_SENTRY_EVENT_FILE_MODIFIED : TEfl_Event_Description;cvar;external;
{* Called when a file was modified
 * @return Eio_Sentry_Event
 *
 * @ingroup Eio_Sentry
  }

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_FILE_MODIFIED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EIO_SENTRY_EVENT_FILE_CLOSED : TEfl_Event_Description;cvar;external;
{* Called for non-fallback sentries when a file was closed
 * @return Eio_Sentry_Event
 *
 * @ingroup Eio_Sentry
  }

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_FILE_CLOSED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EIO_SENTRY_EVENT_DIRECTORY_CREATED : TEfl_Event_Description;cvar;external;
{* Called when a directory was created
 * @return Eio_Sentry_Event
 *
 * @ingroup Eio_Sentry
  }

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_DIRECTORY_CREATED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EIO_SENTRY_EVENT_DIRECTORY_DELETED : TEfl_Event_Description;cvar;external;
{* Called when a directory was deleted
 * @return Eio_Sentry_Event
 *
 * @ingroup Eio_Sentry
  }

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_DIRECTORY_DELETED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EIO_SENTRY_EVENT_DIRECTORY_MODIFIED : TEfl_Event_Description;cvar;external;
{* called when a directory was modified
 * @return Eio_Sentry_Event
 *
 * @ingroup Eio_Sentry
  }

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_DIRECTORY_MODIFIED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EIO_SENTRY_EVENT_DIRECTORY_CLOSED : TEfl_Event_Description;cvar;external;
{* Called for non-fallback sentries when a directory was closed
 * @return Eio_Sentry_Event
 *
 * @ingroup Eio_Sentry
  }

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_DIRECTORY_CLOSED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EIO_SENTRY_EVENT_SELF_RENAME : TEfl_Event_Description;cvar;external;
{* Called for non-fallback sentries when the object was renamed
 * @return Eio_Sentry_Event
 *
 * @ingroup Eio_Sentry
  }

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_SELF_RENAME : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EIO_SENTRY_EVENT_SELF_DELETED : TEfl_Event_Description;cvar;external;
{* Called when the object was deleted
 * @return Eio_Sentry_Event
 *
 * @ingroup Eio_Sentry
  }

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_SELF_DELETED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EIO_SENTRY_EVENT_ERROR : TEfl_Event_Description;cvar;external;
{* Called in case of an error
 * @return Eio_Sentry_Event
 *
 * @ingroup Eio_Sentry
  }

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_ERROR : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EIO_SENTRY_CLASS : longint; { return type might be wrong }
  begin
    EIO_SENTRY_CLASS:=eio_sentry_class_get;
  end;

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_FILE_CREATED : longint; { return type might be wrong }
  begin
    EIO_SENTRY_EVENT_FILE_CREATED:=@(_EIO_SENTRY_EVENT_FILE_CREATED);
  end;

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_FILE_DELETED : longint; { return type might be wrong }
  begin
    EIO_SENTRY_EVENT_FILE_DELETED:=@(_EIO_SENTRY_EVENT_FILE_DELETED);
  end;

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_FILE_MODIFIED : longint; { return type might be wrong }
  begin
    EIO_SENTRY_EVENT_FILE_MODIFIED:=@(_EIO_SENTRY_EVENT_FILE_MODIFIED);
  end;

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_FILE_CLOSED : longint; { return type might be wrong }
  begin
    EIO_SENTRY_EVENT_FILE_CLOSED:=@(_EIO_SENTRY_EVENT_FILE_CLOSED);
  end;

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_DIRECTORY_CREATED : longint; { return type might be wrong }
  begin
    EIO_SENTRY_EVENT_DIRECTORY_CREATED:=@(_EIO_SENTRY_EVENT_DIRECTORY_CREATED);
  end;

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_DIRECTORY_DELETED : longint; { return type might be wrong }
  begin
    EIO_SENTRY_EVENT_DIRECTORY_DELETED:=@(_EIO_SENTRY_EVENT_DIRECTORY_DELETED);
  end;

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_DIRECTORY_MODIFIED : longint; { return type might be wrong }
  begin
    EIO_SENTRY_EVENT_DIRECTORY_MODIFIED:=@(_EIO_SENTRY_EVENT_DIRECTORY_MODIFIED);
  end;

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_DIRECTORY_CLOSED : longint; { return type might be wrong }
  begin
    EIO_SENTRY_EVENT_DIRECTORY_CLOSED:=@(_EIO_SENTRY_EVENT_DIRECTORY_CLOSED);
  end;

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_SELF_RENAME : longint; { return type might be wrong }
  begin
    EIO_SENTRY_EVENT_SELF_RENAME:=@(_EIO_SENTRY_EVENT_SELF_RENAME);
  end;

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_SELF_DELETED : longint; { return type might be wrong }
  begin
    EIO_SENTRY_EVENT_SELF_DELETED:=@(_EIO_SENTRY_EVENT_SELF_DELETED);
  end;

{ was #define dname def_expr }
function EIO_SENTRY_EVENT_ERROR : longint; { return type might be wrong }
  begin
    EIO_SENTRY_EVENT_ERROR:=@(_EIO_SENTRY_EVENT_ERROR);
  end;


end.
