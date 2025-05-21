
unit efl_loop_handler_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_loop_handler_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_loop_handler_eo.h
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
PEfl_Loop_Handler  = ^Efl_Loop_Handler;
PEfl_Loop_Handler_Flags  = ^Efl_Loop_Handler_Flags;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_LOOP_HANDLER_EO_H_}
{$define _EFL_LOOP_HANDLER_EO_H_}
{$ifndef _EFL_LOOP_HANDLER_EO_CLASS_TYPE}
{$define _EFL_LOOP_HANDLER_EO_CLASS_TYPE}
type
  PEfl_Loop_Handler = ^TEfl_Loop_Handler;
  TEfl_Loop_Handler = TEo;
{$endif}
{$ifndef _EFL_LOOP_HANDLER_EO_TYPES}
{$define _EFL_LOOP_HANDLER_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* A set of flags that can be OR'd together to indicate which are desired
 *
 * @ingroup Efl_Loop_Handler_Flags
  }
{*< No I/O is desired (generally useless)  }
{*< Reading is desired  }
{*< Writing is desired  }
{*< Error channel input is desired  }
type
  PEfl_Loop_Handler_Flags = ^TEfl_Loop_Handler_Flags;
  TEfl_Loop_Handler_Flags =  Longint;
  Const
    EFL_LOOP_HANDLER_FLAGS_NONE = 0;
    EFL_LOOP_HANDLER_FLAGS_READ = 1;
    EFL_LOOP_HANDLER_FLAGS_WRITE = 2;
    EFL_LOOP_HANDLER_FLAGS_ERROR = 4;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* An object that describes an low-level source of I/O to listen to for
 * available data to be read or written, depending on the OS and data source
 * type. When I/O becomes available various events are produced and the
 * callbacks attached to them will be called.
 *
 * @ingroup Efl_Loop_Handler
  }

{ was #define dname def_expr }
function EFL_LOOP_HANDLER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_loop_handler_class_get:PEfl_Class;cdecl;external;
{*
 * @brief This sets what kind of I/O should be listened to only when using a fd
 * or fd_file for the handler
 *
 * @param[in] obj The object.
 * @param[in] flags The flags that indicate what kind of I/O should be listened
 * for like read, write or error channels.
 *
 * @ingroup Efl_Loop_Handler
  }
procedure efl_loop_handler_active_set(obj:PEo; flags:TEfl_Loop_Handler_Flags);cdecl;external;
{*
 * @brief This sets what kind of I/O should be listened to only when using a fd
 * or fd_file for the handler
 *
 * @param[in] obj The object.
 *
 * @return The flags that indicate what kind of I/O should be listened for like
 * read, write or error channels.
 *
 * @ingroup Efl_Loop_Handler
  }
(* Const before type ignored *)
function efl_loop_handler_active_get(obj:PEo):TEfl_Loop_Handler_Flags;cdecl;external;
{*
 * @brief Controls a file descriptor to listen to for I/O, which points to a
 * data pipe such as a device, socket or pipe etc.
 *
 * @param[in] obj The object.
 * @param[in] fd The file descriptor
 *
 * @ingroup Efl_Loop_Handler
  }
procedure efl_loop_handler_fd_set(obj:PEo; fd:longint);cdecl;external;
{*
 * @brief Controls a file descriptor to listen to for I/O, which points to a
 * data pipe such as a device, socket or pipe etc.
 *
 * @param[in] obj The object.
 *
 * @return The file descriptor
 *
 * @ingroup Efl_Loop_Handler
  }
(* Const before type ignored *)
function efl_loop_handler_fd_get(obj:PEo):longint;cdecl;external;
{*
 * @brief Controls a file descriptor to listen to for I/O that specifically
 * points to a file in storage and not a device, socket or pipe etc.
 *
 * @param[in] obj The object.
 * @param[in] fd The file descriptor
 *
 * @ingroup Efl_Loop_Handler
  }
procedure efl_loop_handler_fd_file_set(obj:PEo; fd:longint);cdecl;external;
{*
 * @brief Controls a file descriptor to listen to for I/O that specifically
 * points to a file in storage and not a device, socket or pipe etc.
 *
 * @param[in] obj The object.
 *
 * @return The file descriptor
 *
 * @ingroup Efl_Loop_Handler
  }
(* Const before type ignored *)
function efl_loop_handler_fd_file_get(obj:PEo):longint;cdecl;external;
{*
 * @brief Controls a windows win32 object handle to listen to for I/O. When it
 * becomes available for any data the read event will be produced.
 *
 * @param[in] obj The object.
 * @param[in] handle A win32 object handle
 *
 * @ingroup Efl_Loop_Handler
  }
procedure efl_loop_handler_win32_set(obj:PEo; handle:pointer);cdecl;external;
{*
 * @brief Controls a windows win32 object handle to listen to for I/O. When it
 * becomes available for any data the read event will be produced.
 *
 * @param[in] obj The object.
 *
 * @return A win32 object handle
 *
 * @ingroup Efl_Loop_Handler
  }
(* Const before type ignored *)
function efl_loop_handler_win32_get(obj:PEo):pointer;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_LOOP_HANDLER_EVENT_READ : TEfl_Event_Description;cvar;external;
{* Called when a read occurs on the descriptor.
 *
 * @ingroup Efl_Loop_Handler
  }
(* Const before type ignored *)
    _EFL_LOOP_HANDLER_EVENT_WRITE : TEfl_Event_Description;cvar;external;
{* Called when a write occurs on the descriptor.
 *
 * @ingroup Efl_Loop_Handler
  }
(* Const before type ignored *)
    _EFL_LOOP_HANDLER_EVENT_ERROR : TEfl_Event_Description;cvar;external;
{* Called when a error occurrs on the descriptor.
 *
 * @ingroup Efl_Loop_Handler
  }
(* Const before type ignored *)
    _EFL_LOOP_HANDLER_EVENT_BUFFER : TEfl_Event_Description;cvar;external;
{* Called when buffered data already read from the descriptor should be
 * processed.
 *
 * @ingroup Efl_Loop_Handler
  }
(* Const before type ignored *)
    _EFL_LOOP_HANDLER_EVENT_PREPARE : TEfl_Event_Description;cvar;external;
{* Called when preparing a descriptor for listening.
 *
 * @ingroup Efl_Loop_Handler
  }

{ was #define dname def_expr }
function EFL_LOOP_HANDLER_EVENT_READ : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_LOOP_HANDLER_EVENT_WRITE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_LOOP_HANDLER_EVENT_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_LOOP_HANDLER_EVENT_BUFFER : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_LOOP_HANDLER_EVENT_PREPARE : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_LOOP_HANDLER_CLASS : longint; { return type might be wrong }
  begin
    EFL_LOOP_HANDLER_CLASS:=efl_loop_handler_class_get;
  end;

{ was #define dname def_expr }
function EFL_LOOP_HANDLER_EVENT_READ : longint; { return type might be wrong }
  begin
    EFL_LOOP_HANDLER_EVENT_READ:=@(_EFL_LOOP_HANDLER_EVENT_READ);
  end;

{ was #define dname def_expr }
function EFL_LOOP_HANDLER_EVENT_WRITE : longint; { return type might be wrong }
  begin
    EFL_LOOP_HANDLER_EVENT_WRITE:=@(_EFL_LOOP_HANDLER_EVENT_WRITE);
  end;

{ was #define dname def_expr }
function EFL_LOOP_HANDLER_EVENT_ERROR : longint; { return type might be wrong }
  begin
    EFL_LOOP_HANDLER_EVENT_ERROR:=@(_EFL_LOOP_HANDLER_EVENT_ERROR);
  end;

{ was #define dname def_expr }
function EFL_LOOP_HANDLER_EVENT_BUFFER : longint; { return type might be wrong }
  begin
    EFL_LOOP_HANDLER_EVENT_BUFFER:=@(_EFL_LOOP_HANDLER_EVENT_BUFFER);
  end;

{ was #define dname def_expr }
function EFL_LOOP_HANDLER_EVENT_PREPARE : longint; { return type might be wrong }
  begin
    EFL_LOOP_HANDLER_EVENT_PREPARE:=@(_EFL_LOOP_HANDLER_EVENT_PREPARE);
  end;


end.
