
unit efl_object_override_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_object_override_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_object_override_eo.h
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
PEfl_Object_Override  = ^Efl_Object_Override;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_OBJECT_OVERRIDE_EO_H_}
{$define _EFL_OBJECT_OVERRIDE_EO_H_}
{$ifndef _EFL_OBJECT_OVERRIDE_EO_CLASS_TYPE}
{$define _EFL_OBJECT_OVERRIDE_EO_CLASS_TYPE}
type
  PEfl_Object_Override = ^TEfl_Object_Override;
  TEfl_Object_Override = TEo;
{$endif}
{$ifndef _EFL_OBJECT_OVERRIDE_EO_TYPES}
{$define _EFL_OBJECT_OVERRIDE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief A special class to pass to #eo_super() when using #eo_override()
 *
 * Shouldn't be inherited from or anything of this sort.
 *
 * @ingroup Efl_Object_Override
  }

{ was #define dname def_expr }
function EFL_OBJECT_OVERRIDE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_object_override_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_OBJECT_OVERRIDE_CLASS : longint; { return type might be wrong }
  begin
    EFL_OBJECT_OVERRIDE_CLASS:=efl_object_override_class_get;
  end;


end.
