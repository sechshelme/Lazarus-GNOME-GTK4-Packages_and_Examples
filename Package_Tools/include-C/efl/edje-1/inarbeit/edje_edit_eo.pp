
unit edje_edit_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from edje_edit_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    edje_edit_eo.h
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
PEdje_Edit  = ^Edje_Edit;
PEfl_Class  = ^Efl_Class;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EDJE_EDIT_EO_H_}
{$define _EDJE_EDIT_EO_H_}
{$ifndef _EDJE_EDIT_EO_CLASS_TYPE}
{$define _EDJE_EDIT_EO_CLASS_TYPE}
type
  PEdje_Edit = ^TEdje_Edit;
  TEdje_Edit = TEo;
{$endif}
{$ifndef _EDJE_EDIT_EO_TYPES}
{$define _EDJE_EDIT_EO_TYPES}
{$endif}
{*
 * @brief Edje editing class to access edje object internals.
 *
 * This was intended ONLY for use in an actual edje editor program. Unless you
 * are writing one of these, do NOT use this API here.
 *
 * @ingroup Edje_Edit
  }

{ was #define dname def_expr }
function EDJE_EDIT_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function edje_edit_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EDJE_EDIT_CLASS : longint; { return type might be wrong }
  begin
    EDJE_EDIT_CLASS:=edje_edit_class_get;
  end;


end.
