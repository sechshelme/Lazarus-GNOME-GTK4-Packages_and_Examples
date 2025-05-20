
unit efl_io_positioner_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_io_positioner_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_io_positioner_eo.h
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
PEfl_Io_Positioner  = ^Efl_Io_Positioner;
PEfl_Io_Positioner_Whence  = ^Efl_Io_Positioner_Whence;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_IO_POSITIONER_EO_H_}
{$define _EFL_IO_POSITIONER_EO_H_}
{$ifndef _EFL_IO_POSITIONER_EO_CLASS_TYPE}
{$define _EFL_IO_POSITIONER_EO_CLASS_TYPE}
type
  PEfl_Io_Positioner = ^TEfl_Io_Positioner;
  TEfl_Io_Positioner = TEo;
{$endif}
{$ifndef _EFL_IO_POSITIONER_EO_TYPES}
{$define _EFL_IO_POSITIONER_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Seek position modes
 *
 * @ingroup Efl_Io_Positioner_Whence
  }
{*< Seek from start of the stream/file  }
{*< Seek from current position  }
{*< Seek from the end of stream/file  }
type
  PEfl_Io_Positioner_Whence = ^TEfl_Io_Positioner_Whence;
  TEfl_Io_Positioner_Whence =  Longint;
  Const
    EFL_IO_POSITIONER_WHENCE_START = 0;
    EFL_IO_POSITIONER_WHENCE_CURRENT = 1;
    EFL_IO_POSITIONER_WHENCE_END = 2;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Generic interface for objects that can change or report position.
 *
 * @ingroup Efl_Io_Positioner
  }

{ was #define dname def_expr }
function EFL_IO_POSITIONER_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_io_positioner_mixin_get:PEfl_Class;cdecl;external;
{*
 * @brief Seek in data
 *
 * @param[in] obj The object.
 * @param[in] offset Offset in byte relative to whence
 * @param[in] whence Whence
 *
 * @return 0 on succeed, a mapping of errno otherwise
 *
 * @ingroup Efl_Io_Positioner
  }
function efl_io_positioner_seek(obj:PEo; offset:Tint64_t; whence:TEfl_Io_Positioner_Whence):TEina_Error;cdecl;external;
{*
 * @brief Position property
 *
 * Try to set position object, relative to start of file. See
 * @ref efl_io_positioner_seek()
 *
 * @param[in] obj The object.
 * @param[in] position Position in file or buffer
 *
 * @return @c true if could reposition, @c false if errors.
 *
 * @ingroup Efl_Io_Positioner
  }
function efl_io_positioner_position_set(obj:PEo; position:Tuint64_t):TEina_Bool;cdecl;external;
{*
 * @brief Position property
 *
 * @param[in] obj The object.
 *
 * @return Position in file or buffer
 *
 * @ingroup Efl_Io_Positioner
  }
(* Const before type ignored *)
function efl_io_positioner_position_get(obj:PEo):Tuint64_t;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_IO_POSITIONER_EVENT_POSITION_CHANGED : TEfl_Event_Description;cvar;external;
{* Notifies position changed
 *
 * @ingroup Efl_Io_Positioner
  }

{ was #define dname def_expr }
function EFL_IO_POSITIONER_EVENT_POSITION_CHANGED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_IO_POSITIONER_MIXIN : longint; { return type might be wrong }
  begin
    EFL_IO_POSITIONER_MIXIN:=efl_io_positioner_mixin_get;
  end;

{ was #define dname def_expr }
function EFL_IO_POSITIONER_EVENT_POSITION_CHANGED : longint; { return type might be wrong }
  begin
    EFL_IO_POSITIONER_EVENT_POSITION_CHANGED:=@(_EFL_IO_POSITIONER_EVENT_POSITION_CHANGED);
  end;


end.
