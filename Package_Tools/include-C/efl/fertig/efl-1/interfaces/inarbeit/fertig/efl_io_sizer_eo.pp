
unit efl_io_sizer_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_io_sizer_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_io_sizer_eo.h
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
PEfl_Io_Sizer  = ^Efl_Io_Sizer;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_IO_SIZER_EO_H_}
{$define _EFL_IO_SIZER_EO_H_}
{$ifndef _EFL_IO_SIZER_EO_CLASS_TYPE}
{$define _EFL_IO_SIZER_EO_CLASS_TYPE}
type
  PEfl_Io_Sizer = ^TEfl_Io_Sizer;
  TEfl_Io_Sizer = TEo;
{$endif}
{$ifndef _EFL_IO_SIZER_EO_TYPES}
{$define _EFL_IO_SIZER_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Generic interface for objects that can resize or report size of
 * themselves.
 *
 * This interface allows external objects to transparently resize or report its
 * size.
 *
 * @ingroup Efl_Io_Sizer
  }

{ was #define dname def_expr }
function EFL_IO_SIZER_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_io_sizer_mixin_get:PEfl_Class;cdecl;external;
{*
 * @brief Resize object
 *
 * @param[in] obj The object.
 * @param[in] size Object size
 *
 * @return 0 on succeed, a mapping of errno otherwise
 *
 * @ingroup Efl_Io_Sizer
  }
function efl_io_sizer_resize(obj:PEo; size:Tuint64_t):TEina_Error;cdecl;external;
{*
 * @brief Size property
 *
 * Try to resize the object, check with get if the value was accepted or not.
 *
 * @param[in] obj The object.
 * @param[in] size Object size
 *
 * @return @c true if could resize, @c false if errors.
 *
 * @ingroup Efl_Io_Sizer
  }
function efl_io_sizer_size_set(obj:PEo; size:Tuint64_t):TEina_Bool;cdecl;external;
{*
 * @brief Size property
 *
 * @param[in] obj The object.
 *
 * @return Object size
 *
 * @ingroup Efl_Io_Sizer
  }
(* Const before type ignored *)
function efl_io_sizer_size_get(obj:PEo):Tuint64_t;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_IO_SIZER_EVENT_SIZE_CHANGED : TEfl_Event_Description;cvar;external;
{* Notifies size changed
 *
 * @ingroup Efl_Io_Sizer
  }

{ was #define dname def_expr }
function EFL_IO_SIZER_EVENT_SIZE_CHANGED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_IO_SIZER_MIXIN : longint; { return type might be wrong }
  begin
    EFL_IO_SIZER_MIXIN:=efl_io_sizer_mixin_get;
  end;

{ was #define dname def_expr }
function EFL_IO_SIZER_EVENT_SIZE_CHANGED : longint; { return type might be wrong }
  begin
    EFL_IO_SIZER_EVENT_SIZE_CHANGED:=@(_EFL_IO_SIZER_EVENT_SIZE_CHANGED);
  end;


end.
