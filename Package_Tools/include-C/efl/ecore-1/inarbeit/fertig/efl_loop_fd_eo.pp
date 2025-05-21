
unit efl_loop_fd_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_loop_fd_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_loop_fd_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Loop_Fd  = ^Efl_Loop_Fd;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_LOOP_FD_EO_H_}
{$define _EFL_LOOP_FD_EO_H_}
{$ifndef _EFL_LOOP_FD_EO_CLASS_TYPE}
{$define _EFL_LOOP_FD_EO_CLASS_TYPE}
type
  PEfl_Loop_Fd = ^TEfl_Loop_Fd;
  TEfl_Loop_Fd = TEo;
{$endif}
{$ifndef _EFL_LOOP_FD_EO_TYPES}
{$define _EFL_LOOP_FD_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Fds are objects that watch the activity on a given file descriptor.
 * This file descriptor can be a network, a file, provided by a library.
 *
 * The object will trigger relevant events depending on what's happening.
 *
 * @ingroup Efl_Loop_Fd
  }

{ was #define dname def_expr }
function EFL_LOOP_FD_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_loop_fd_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Defines which file descriptor to watch. If it is a file, use file_fd
 * variant.
 *
 * Defines the fd to watch.
 *
 * @param[in] obj The object.
 * @param[in] fd The file descriptor.
 *
 * @ingroup Efl_Loop_Fd
  }
procedure efl_loop_fd_set(obj:PEo; fd:longint);cdecl;external;
{*
 * @brief Defines which file descriptor to watch. If it is a file, use file_fd
 * variant.
 *
 * @param[in] obj The object.
 *
 * @return The file descriptor.
 *
 * @ingroup Efl_Loop_Fd
  }
(* Const before type ignored *)
function efl_loop_fd_get(obj:PEo):longint;cdecl;external;
{*
 * @brief Defines which file descriptor to watch when watching a file.
 *
 * Defines the fd to watch on.
 *
 * @param[in] obj The object.
 * @param[in] fd The file descriptor.
 *
 * @ingroup Efl_Loop_Fd
  }
procedure efl_loop_fd_file_set(obj:PEo; fd:longint);cdecl;external;
{*
 * @brief Defines which file descriptor to watch when watching a file.
 *
 * @param[in] obj The object.
 *
 * @return The file descriptor.
 *
 * @ingroup Efl_Loop_Fd
  }
(* Const before type ignored *)
function efl_loop_fd_file_get(obj:PEo):longint;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_LOOP_FD_EVENT_READ : TEfl_Event_Description;cvar;external;
{* Called when a read happened on the file descriptor
 *
 * @ingroup Efl_Loop_Fd
  }
(* Const before type ignored *)
    _EFL_LOOP_FD_EVENT_WRITE : TEfl_Event_Description;cvar;external;
{* Called when a write happened on the file descriptor
 *
 * @ingroup Efl_Loop_Fd
  }
(* Const before type ignored *)
    _EFL_LOOP_FD_EVENT_ERROR : TEfl_Event_Description;cvar;external;
{* Called when a error occurred on the file descriptor
 *
 * @ingroup Efl_Loop_Fd
  }

{ was #define dname def_expr }
function EFL_LOOP_FD_EVENT_READ : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_LOOP_FD_EVENT_WRITE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_LOOP_FD_EVENT_ERROR : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_LOOP_FD_CLASS : longint; { return type might be wrong }
  begin
    EFL_LOOP_FD_CLASS:=efl_loop_fd_class_get;
  end;

{ was #define dname def_expr }
function EFL_LOOP_FD_EVENT_READ : longint; { return type might be wrong }
  begin
    EFL_LOOP_FD_EVENT_READ:=@(_EFL_LOOP_FD_EVENT_READ);
  end;

{ was #define dname def_expr }
function EFL_LOOP_FD_EVENT_WRITE : longint; { return type might be wrong }
  begin
    EFL_LOOP_FD_EVENT_WRITE:=@(_EFL_LOOP_FD_EVENT_WRITE);
  end;

{ was #define dname def_expr }
function EFL_LOOP_FD_EVENT_ERROR : longint; { return type might be wrong }
  begin
    EFL_LOOP_FD_EVENT_ERROR:=@(_EFL_LOOP_FD_EVENT_ERROR);
  end;


end.
