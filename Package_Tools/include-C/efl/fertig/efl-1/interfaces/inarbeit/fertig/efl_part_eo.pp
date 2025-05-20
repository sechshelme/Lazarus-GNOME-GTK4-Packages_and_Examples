
unit efl_part_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_part_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_part_eo.h
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
PEfl_Object  = ^Efl_Object;
PEfl_Part  = ^Efl_Part;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_PART_EO_H_}
{$define _EFL_PART_EO_H_}
{$ifndef _EFL_PART_EO_CLASS_TYPE}
{$define _EFL_PART_EO_CLASS_TYPE}
type
  PEfl_Part = ^TEfl_Part;
  TEfl_Part = TEo;
{$endif}
{$ifndef _EFL_PART_EO_TYPES}
{$define _EFL_PART_EO_TYPES}
{$endif}
{*
 * @brief Interface for objects supporting named parts.
 *
 * An object implementing this interface will be able to provide access to some
 * of its sub-objects by name. This gives access to parts as defined in a
 * widget's theme.
 *
 * Part proxy objects have a special lifetime that is limited to one and only
 * one function call. This behavior is implemented in efl_part() which call
 * @ref efl_part_get(). Calling @ref efl_part_get() directly should be avoided.
 *
 * In other words, the caller does not hold a reference to this proxy object.
 * It may be possible, in languages that allow it, to get an extra reference to
 * this part object and extend its lifetime to more than a single function
 * call.
 *
 * In pseudo-code, this means only the following two use cases are supported:
 *
 * obj.func(part(obj, "part"), args)
 *
 * And:
 *
 * part = ref(part(obj, "part")) func1(part, args) func2(part, args)
 * func3(part, args) unref(part)
 *
 * @since 1.22
 *
 * @ingroup Efl_Part
  }

{ was #define dname def_expr }
function EFL_PART_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_part_interface_get:PEfl_Class;cdecl;external;
{$ifdef EFL_PART_PROTECTED}
{*
 * @brief Get a proxy object referring to a part of an object.
 *
 * @param[in] obj The object.
 * @param[in] name The part name.
 *
 * @return A (proxy) object, valid for a single call.
 *
 * @since 1.22
 *
 * @ingroup Efl_Part
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_part_get(obj:PEo; name:Pchar):PEfl_Object;cdecl;external;
{$endif}
{$endif}

implementation

{ was #define dname def_expr }
function EFL_PART_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_PART_INTERFACE:=efl_part_interface_get;
  end;


end.
