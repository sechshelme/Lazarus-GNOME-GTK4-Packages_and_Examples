
unit efl_io_closer_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_io_closer_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_io_closer_eo.h
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
PEfl_Io_Closer  = ^Efl_Io_Closer;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_IO_CLOSER_EO_H_}
{$define _EFL_IO_CLOSER_EO_H_}
{$ifndef _EFL_IO_CLOSER_EO_CLASS_TYPE}
{$define _EFL_IO_CLOSER_EO_CLASS_TYPE}
type
  PEfl_Io_Closer = ^TEfl_Io_Closer;
  TEfl_Io_Closer = TEo;
{$endif}
{$ifndef _EFL_IO_CLOSER_EO_TYPES}
{$define _EFL_IO_CLOSER_EO_TYPES}
{$endif}
{*
 * @brief Generic interface for objects that can close themselves.
 *
 * This interface allows external objects to transparently close an input or
 * output stream, cleaning up its resources.
 *
 * Calls to @ref efl_io_closer_close() may or may not block, that's not up to
 * this interface to specify.
 *
 * @since 1.22
 *
 * @ingroup Efl_Io_Closer
  }

{ was #define dname def_expr }
function EFL_IO_CLOSER_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_io_closer_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Closes the Input/Output object.
 *
 * This operation will be executed immediately and may or may not block the
 * caller thread for some time. The details of blocking behavior is to be
 * defined by the implementation and may be subject to other parameters such as
 * non-blocking flags, maximum timeout or even retry attempts.
 *
 * You can understand this method as close(2) libc function.
 *
 * @param[in] obj The object.
 *
 * @return 0 on succeed, a mapping of errno otherwise
 *
 * @since 1.22
 *
 * @ingroup Efl_Io_Closer
  }
function efl_io_closer_close(obj:PEo):TEina_Error;cdecl;external;
{*
 * @brief If true will notify object was closed.
 *
 * @param[in] obj The object.
 *
 * @return @c true if closed, @c false otherwise
 *
 * @since 1.22
 *
 * @ingroup Efl_Io_Closer
  }
(* Const before type ignored *)
function efl_io_closer_closed_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief If true will automatically close resources on exec() calls.
 *
 * When using file descriptors this should set FD_CLOEXEC so they are not
 * inherited by the processes (children or self) doing exec().
 *
 * If @c true, will close on exec() call.
 *
 * @param[in] obj The object.
 * @param[in] close_on_exec @c true if close on exec(), @c false otherwise
 *
 * @return @c true if could set, @c false if not supported or failed.
 *
 * @since 1.22
 *
 * @ingroup Efl_Io_Closer
  }
function efl_io_closer_close_on_exec_set(obj:PEo; close_on_exec:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief If true will automatically close resources on exec() calls.
 *
 * When using file descriptors this should set FD_CLOEXEC so they are not
 * inherited by the processes (children or self) doing exec().
 *
 * @param[in] obj The object.
 *
 * @return @c true if close on exec(), @c false otherwise
 *
 * @since 1.22
 *
 * @ingroup Efl_Io_Closer
  }
(* Const before type ignored *)
function efl_io_closer_close_on_exec_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief If true will automatically close() on object invalidate.
 *
 * If the object was disconnected from its parent (including the main loop)
 * without close, this property will state whenever it should be closed or not.
 *
 * @param[in] obj The object.
 * @param[in] close_on_invalidate @c true if close on invalidate, @c false
 * otherwise
 *
 * @since 1.22
 *
 * @ingroup Efl_Io_Closer
  }
procedure efl_io_closer_close_on_invalidate_set(obj:PEo; close_on_invalidate:TEina_Bool);cdecl;external;
{*
 * @brief If true will automatically close() on object invalidate.
 *
 * If the object was disconnected from its parent (including the main loop)
 * without close, this property will state whenever it should be closed or not.
 *
 * @param[in] obj The object.
 *
 * @return @c true if close on invalidate, @c false otherwise
 *
 * @since 1.22
 *
 * @ingroup Efl_Io_Closer
  }
(* Const before type ignored *)
function efl_io_closer_close_on_invalidate_get(obj:PEo):TEina_Bool;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_IO_CLOSER_EVENT_CLOSED : TEfl_Event_Description;cvar;external;
{* Notifies closed, when property is marked as true
 *
 * @since 1.22
 *
 * @ingroup Efl_Io_Closer
  }

{ was #define dname def_expr }
function EFL_IO_CLOSER_EVENT_CLOSED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_IO_CLOSER_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_IO_CLOSER_INTERFACE:=efl_io_closer_interface_get;
  end;

{ was #define dname def_expr }
function EFL_IO_CLOSER_EVENT_CLOSED : longint; { return type might be wrong }
  begin
    EFL_IO_CLOSER_EVENT_CLOSED:=@(_EFL_IO_CLOSER_EVENT_CLOSED);
  end;


end.
