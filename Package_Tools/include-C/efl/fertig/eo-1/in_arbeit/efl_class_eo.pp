
unit efl_class_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_class_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_class_eo.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CLASS_EO_H_}
{$define _EFL_CLASS_EO_H_}
{$ifndef _EFL_CLASS_EO_CLASS_TYPE}
{$define _EFL_CLASS_EO_CLASS_TYPE}
type
  PEfl_Class = ^TEfl_Class;
  TEfl_Class = TEo;
{$endif}
{$ifndef _EFL_CLASS_EO_TYPES}
{$define _EFL_CLASS_EO_TYPES}
{$endif}
{* Abstract Efl class
 *
 * @since 1.22
 *
 * @ingroup Efl_Class
  }

{ was #define dname def_expr }
function EFL_CLASS_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_class_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CLASS_CLASS : longint; { return type might be wrong }
  begin
    EFL_CLASS_CLASS:=efl_class_class_get;
  end;


end.
