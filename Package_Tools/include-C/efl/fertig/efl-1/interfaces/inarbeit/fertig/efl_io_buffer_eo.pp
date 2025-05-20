
unit efl_io_buffer_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_io_buffer_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_io_buffer_eo.h
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
PEfl_Io_Buffer  = ^Efl_Io_Buffer;
PEina_Binbuf  = ^Eina_Binbuf;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_IO_BUFFER_EO_H_}
{$define _EFL_IO_BUFFER_EO_H_}
{$ifndef _EFL_IO_BUFFER_EO_CLASS_TYPE}
{$define _EFL_IO_BUFFER_EO_CLASS_TYPE}
type
  PEfl_Io_Buffer = ^TEfl_Io_Buffer;
  TEfl_Io_Buffer = TEo;
{$endif}
{$ifndef _EFL_IO_BUFFER_EO_TYPES}
{$define _EFL_IO_BUFFER_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Generic In-memory buffer of data to be used as I/O.
 *
 * This class offers both input and output, which can be used at the same time
 * since @ref efl_io_reader_read and @ref efl_io_writer_write use different
 * offsets/position internally.
 *
 * One can get temporary direct access to internal buffer with
 * @ref efl_io_buffer_slice_get or steal the buffer with
 * @ref efl_io_buffer_binbuf_steal.
 *
 * A fixed sized buffer can be implemented by setting
 * @ref efl_io_buffer_limit_get followed by @ref efl_io_buffer_preallocate
 *
 * @ingroup Efl_Io_Buffer
  }

{ was #define dname def_expr }
function EFL_IO_BUFFER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_io_buffer_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Immediately pre-allocate a buffer of at least a given size.
 *
 * @param[in] obj The object.
 * @param[in] size Amount of bytes to pre-allocate.
 *
 * @ingroup Efl_Io_Buffer
  }
procedure efl_io_buffer_preallocate(obj:PEo; size:Tsize_t);cdecl;external;
{*
 * @brief Adopt a read-only slice as buffer's backing store.
 *
 * The slice memory will not be copied and must remain alive during the
 * buffer's lifetime. Usually this is guaranteed by some global static-const
 * memory or some parent object and this buffer being a view of that -- be
 * aware of parent memory remaining alive, such as "slice,changed" events.
 *
 * @param[in] obj The object.
 * @param[in] slice Slice to adopt as read-only
 *
 * @ingroup Efl_Io_Buffer
  }
(* Const before type ignored *)
procedure efl_io_buffer_adopt_readonly(obj:PEo; slice:TEina_Slice);cdecl;external;
{*
 * @brief Adopt a read-write slice as buffer's backing store.
 *
 * The slice memory will not be copied and must remain alive during the
 * buffer's lifetime. Usually this is guaranteed by some global static memory
 * or some parent object and this buffer being a view of that -- be aware of
 * parent memory remaining alive, such as "slice,changed" events.
 *
 * The memory will be disposed using free() and reallocated using realloc().
 *
 * @param[in] obj The object.
 * @param[in] slice Slice to adopt as read-write
 *
 * @ingroup Efl_Io_Buffer
  }
procedure efl_io_buffer_adopt_readwrite(obj:PEo; slice:TEina_Rw_Slice);cdecl;external;
{*
 * @brief Limit how big the buffer can grow.
 *
 * This affects both @ref efl_io_buffer_preallocate and how buffer grows when
 * @ref efl_io_writer_write is called.
 *
 * If you want a buffer of an exact size always set the limit before any
 * further calls that can expand it.
 *
 * Constructor-only property to set buffer limit. 0 is unlimited
 *
 * @param[in] obj The object.
 * @param[in] size Defines a maximum buffer size, or 0 to allow unlimited
 * amount of bytes
 *
 * @ingroup Efl_Io_Buffer
  }
procedure efl_io_buffer_limit_set(obj:PEo; size:Tsize_t);cdecl;external;
{*
 * @brief Limit how big the buffer can grow.
 *
 * This affects both @ref efl_io_buffer_preallocate and how buffer grows when
 * @ref efl_io_writer_write is called.
 *
 * If you want a buffer of an exact size always set the limit before any
 * further calls that can expand it.
 *
 * @param[in] obj The object.
 *
 * @return Defines a maximum buffer size, or 0 to allow unlimited amount of
 * bytes
 *
 * @ingroup Efl_Io_Buffer
  }
(* Const before type ignored *)
function efl_io_buffer_limit_get(obj:PEo):Tsize_t;cdecl;external;
{*
 * @brief The position used by @ref efl_io_reader_read.
 *
 * Note that @ref efl_io_positioner_seek or @ref efl_io_positioner_position_set
 * will affect this property and @ref efl_io_buffer_position_write_get.
 *
 * @ref efl_io_positioner_position_get will return the greatest of
 * @ref efl_io_buffer_position_read_get and
 * @ref efl_io_buffer_position_write_get.
 *
 * @param[in] obj The object.
 * @param[in] position Position in buffer
 *
 * @return @c true if setting the position succeeded, @c false otherwise
 *
 * @ingroup Efl_Io_Buffer
  }
function efl_io_buffer_position_read_set(obj:PEo; position:Tuint64_t):TEina_Bool;cdecl;external;
{*
 * @brief The position used by @ref efl_io_reader_read.
 *
 * Note that @ref efl_io_positioner_seek or @ref efl_io_positioner_position_set
 * will affect this property and @ref efl_io_buffer_position_write_get.
 *
 * @ref efl_io_positioner_position_get will return the greatest of
 * @ref efl_io_buffer_position_read_get and
 * @ref efl_io_buffer_position_write_get.
 *
 * @param[in] obj The object.
 *
 * @return Position in buffer
 *
 * @ingroup Efl_Io_Buffer
  }
(* Const before type ignored *)
function efl_io_buffer_position_read_get(obj:PEo):Tuint64_t;cdecl;external;
{*
 * @brief The position used by @ref efl_io_writer_write.
 *
 * Note that @ref efl_io_positioner_seek or @ref efl_io_positioner_position_set
 * will affect this property and @ref efl_io_buffer_position_read_get.
 *
 * @ref efl_io_positioner_position_get will return the greatest of
 * @ref efl_io_buffer_position_read_get and
 * @ref efl_io_buffer_position_write_get.
 *
 * @param[in] obj The object.
 * @param[in] position Position in buffer
 *
 * @return @c true if setting the position succeeded, @c false otherwise
 *
 * @ingroup Efl_Io_Buffer
  }
function efl_io_buffer_position_write_set(obj:PEo; position:Tuint64_t):TEina_Bool;cdecl;external;
{*
 * @brief The position used by @ref efl_io_writer_write.
 *
 * Note that @ref efl_io_positioner_seek or @ref efl_io_positioner_position_set
 * will affect this property and @ref efl_io_buffer_position_read_get.
 *
 * @ref efl_io_positioner_position_get will return the greatest of
 * @ref efl_io_buffer_position_read_get and
 * @ref efl_io_buffer_position_write_get.
 *
 * @param[in] obj The object.
 *
 * @return Position in buffer
 *
 * @ingroup Efl_Io_Buffer
  }
(* Const before type ignored *)
function efl_io_buffer_position_write_get(obj:PEo):Tuint64_t;cdecl;external;
{*
 * @brief Get a temporary access to buffer's internal memory.
 *
 * The memory pointed by slice may be changed by other methods of this class.
 * The event "reallocated" will be called in those situations.
 *
 * @param[in] obj The object.
 *
 * @return Slice of the current buffer, may be invalidated if
 * @ref efl_io_writer_write, @ref efl_io_closer_close or
 * @ref efl_io_sizer_resize are called. It is the full slice, not a partial one
 * starting at current position.
 *
 * @ingroup Efl_Io_Buffer
  }
(* Const before type ignored *)
function efl_io_buffer_slice_get(obj:PEo):TEina_Slice;cdecl;external;
{*
 * @brief Steals the internal buffer memory and returns it as a binbuf.
 *
 * The returned memory must be freed with eina_binbuf_free().
 *
 * On failure, for example a read-only backing store was adopted with
 * @ref efl_io_buffer_adopt_readonly, @c NULL is returned.
 *
 * @param[in] obj The object.
 *
 * @return Binbuf
 *
 * @ingroup Efl_Io_Buffer
  }
function efl_io_buffer_binbuf_steal(obj:PEo):PEina_Binbuf;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_IO_BUFFER_EVENT_POSITION_READ_CHANGED : TEfl_Event_Description;cvar;external;
{* Notifies @ref efl_io_buffer_position_read_get changed
 *
 * @ingroup Efl_Io_Buffer
  }

{ was #define dname def_expr }
function EFL_IO_BUFFER_EVENT_POSITION_READ_CHANGED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_IO_BUFFER_EVENT_POSITION_WRITE_CHANGED : TEfl_Event_Description;cvar;external;
{* Notifies @ref efl_io_buffer_position_write_get changed
 *
 * @ingroup Efl_Io_Buffer
  }

{ was #define dname def_expr }
function EFL_IO_BUFFER_EVENT_POSITION_WRITE_CHANGED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_IO_BUFFER_EVENT_REALLOCATED : TEfl_Event_Description;cvar;external;
{* Notifies the internal buffer was reallocated, thus whatever was returned by
 * @ref efl_io_buffer_slice_get becomes invalid.
 *
 * @ingroup Efl_Io_Buffer
  }

{ was #define dname def_expr }
function EFL_IO_BUFFER_EVENT_REALLOCATED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_IO_BUFFER_CLASS : longint; { return type might be wrong }
  begin
    EFL_IO_BUFFER_CLASS:=efl_io_buffer_class_get;
  end;

{ was #define dname def_expr }
function EFL_IO_BUFFER_EVENT_POSITION_READ_CHANGED : longint; { return type might be wrong }
  begin
    EFL_IO_BUFFER_EVENT_POSITION_READ_CHANGED:=@(_EFL_IO_BUFFER_EVENT_POSITION_READ_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_IO_BUFFER_EVENT_POSITION_WRITE_CHANGED : longint; { return type might be wrong }
  begin
    EFL_IO_BUFFER_EVENT_POSITION_WRITE_CHANGED:=@(_EFL_IO_BUFFER_EVENT_POSITION_WRITE_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_IO_BUFFER_EVENT_REALLOCATED : longint; { return type might be wrong }
  begin
    EFL_IO_BUFFER_EVENT_REALLOCATED:=@(_EFL_IO_BUFFER_EVENT_REALLOCATED);
  end;


end.
