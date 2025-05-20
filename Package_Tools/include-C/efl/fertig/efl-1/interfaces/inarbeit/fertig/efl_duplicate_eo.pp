
unit efl_duplicate_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_duplicate_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_duplicate_eo.h
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
PEfl_Duplicate  = ^Efl_Duplicate;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_DUPLICATE_EO_H_}
{$define _EFL_DUPLICATE_EO_H_}
{$ifndef _EFL_DUPLICATE_EO_CLASS_TYPE}
{$define _EFL_DUPLICATE_EO_CLASS_TYPE}
type
  PEfl_Duplicate = ^TEfl_Duplicate;
  TEfl_Duplicate = TEo;
{$endif}
{$ifndef _EFL_DUPLICATE_EO_TYPES}
{$define _EFL_DUPLICATE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief An interface for duplication of objects.
 *
 * Objects implementing this interface can be duplicated with
 * @ref efl_duplicate.
 *
 * @ingroup Efl_Duplicate
  }

{ was #define dname def_expr }
function EFL_DUPLICATE_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_duplicate_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Creates a carbon copy of this object and returns it.
 *
 * The newly created object will have no event handlers or anything of the
 * sort.
 *
 * @param[in] obj The object.
 *
 * @return Returned carbon copy
 *
 * @ingroup Efl_Duplicate
  }
(* Const before type ignored *)
function efl_duplicate(obj:PEo):PEfl_Duplicate;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_DUPLICATE_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_DUPLICATE_INTERFACE:=efl_duplicate_interface_get;
  end;


end.
