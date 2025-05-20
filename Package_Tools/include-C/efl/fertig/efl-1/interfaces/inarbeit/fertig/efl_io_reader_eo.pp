
unit efl_io_reader_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_io_reader_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_io_reader_eo.h
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
PEfl_Io_Reader  = ^Efl_Io_Reader;
PEina_Rw_Slice  = ^Eina_Rw_Slice;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_IO_READER_EO_H_}
{$define _EFL_IO_READER_EO_H_}
{$ifndef _EFL_IO_READER_EO_CLASS_TYPE}
{$define _EFL_IO_READER_EO_CLASS_TYPE}
type
  PEfl_Io_Reader = ^TEfl_Io_Reader;
  TEfl_Io_Reader = TEo;
{$endif}
{$ifndef _EFL_IO_READER_EO_TYPES}
{$define _EFL_IO_READER_EO_TYPES}
{$endif}
{*
 * @brief Generic interface for objects that can read data into a provided
 * memory.
 *
 * This interface allows external objects to transparently monitor for new data
 * and as it to be read into a provided memory slice.
 *
 * Calls to @ref efl_io_reader_read may or may not block, that's not up to this
 * interface to specify. The user can check based on @ref efl_io_reader_eos_get
 * property and signal if the stream reached an end, with event
 * "can_read,changed" or property @ref efl_io_reader_can_read_get to known
 * whenever a read would have data to return.
 *
 * @since 1.22
 *
 * @ingroup Efl_Io_Reader
  }

{ was #define dname def_expr }
function EFL_IO_READER_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_io_reader_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Reads data into a pre-allocated buffer.
 *
 * This operation will be executed immediately and may or may not block the
 * caller thread for some time. The details of blocking behavior is to be
 * defined by the implementation and may be subject to other parameters such as
 * non-blocking flags, maximum timeout or even retry attempts.
 *
 * You can understand this method as read(2) libc function.
 *
 * @param[in] obj The object.
 * @param[in,out] rw_slice Provides a pre-allocated memory to be filled up to
 * rw_slice.len. It will be populated and the length will be set to the
 * actually used amount of bytes, which can be smaller than the request.
 *
 * @return 0 on succeed, a mapping of errno otherwise
 *
 * @since 1.22
 *
 * @ingroup Efl_Io_Reader
  }
function efl_io_reader_read(obj:PEo; rw_slice:PEina_Rw_Slice):TEina_Error;cdecl;external;
{$ifdef EFL_IO_READER_PROTECTED}
{*
 * @brief If @c true will notify @ref efl_io_reader_read can be called without
 * blocking or failing.
 *
 * @param[in] obj The object.
 * @param[in] can_read @c true if it can be read without blocking or failing,
 * @c false otherwise
 *
 * @since 1.22
 *
 * @ingroup Efl_Io_Reader
  }
procedure efl_io_reader_can_read_set(obj:PEo; can_read:TEina_Bool);cdecl;external;
{$endif}
{*
 * @brief If @c true will notify @ref efl_io_reader_read can be called without
 * blocking or failing.
 *
 * @param[in] obj The object.
 *
 * @return @c true if it can be read without blocking or failing, @c false
 * otherwise
 *
 * @since 1.22
 *
 * @ingroup Efl_Io_Reader
  }
(* Const before type ignored *)

function efl_io_reader_can_read_get(obj:PEo):TEina_Bool;cdecl;external;
{$ifdef EFL_IO_READER_PROTECTED}
{*
 * @brief If @c true will notify end of stream.
 *
 * @param[in] obj The object.
 * @param[in] is_eos @c true if end of stream, @c false otherwise
 *
 * @since 1.22
 *
 * @ingroup Efl_Io_Reader
  }
procedure efl_io_reader_eos_set(obj:PEo; is_eos:TEina_Bool);cdecl;external;
{$endif}
{*
 * @brief If @c true will notify end of stream.
 *
 * @param[in] obj The object.
 *
 * @return @c true if end of stream, @c false otherwise
 *
 * @since 1.22
 *
 * @ingroup Efl_Io_Reader
  }
(* Const before type ignored *)

function efl_io_reader_eos_get(obj:PEo):TEina_Bool;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_IO_READER_EVENT_CAN_READ_CHANGED : TEfl_Event_Description;cvar;external;
{*
 * @brief Notifies can_read property changed.
 *
 * If @ref efl_io_reader_can_read_get is @c true there is data to
 * @ref efl_io_reader_read without blocking/error. If
 * @ref efl_io_reader_can_read_get is @c false, @ref efl_io_reader_read would
 * either block or fail.
 *
 * Note that usually this event is dispatched from inside
 * @ref efl_io_reader_read, thus before it returns.
 *
 * @return Eina_Bool
 *
 * @since 1.22
 *
 * @ingroup Efl_Io_Reader
  }
(* Const before type ignored *)
    _EFL_IO_READER_EVENT_EOS : TEfl_Event_Description;cvar;external;

{ was #define dname def_expr }
function EFL_IO_READER_EVENT_CAN_READ_CHANGED : longint; { return type might be wrong }

{*
 * @brief Notifies end of stream, when property is marked as true.
 *
 * If this is used alongside with an @ref Efl_Io_Closer, then it should be
 * emitted before that call.
 *
 * It should be emitted only once for an object unless it implements
 * @ref efl_io_positioner_seek.
 *
 * The property @ref efl_io_reader_can_read_get should change to @c false
 * before this event is dispatched.
 *
 * @since 1.22
 *
 * @ingroup Efl_Io_Reader
  }
{ was #define dname def_expr }
function EFL_IO_READER_EVENT_EOS : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_IO_READER_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_IO_READER_INTERFACE:=efl_io_reader_interface_get;
  end;

{ was #define dname def_expr }
function EFL_IO_READER_EVENT_CAN_READ_CHANGED : longint; { return type might be wrong }
  begin
    EFL_IO_READER_EVENT_CAN_READ_CHANGED:=@(_EFL_IO_READER_EVENT_CAN_READ_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_IO_READER_EVENT_EOS : longint; { return type might be wrong }
  begin
    EFL_IO_READER_EVENT_EOS:=@(_EFL_IO_READER_EVENT_EOS);
  end;


end.
