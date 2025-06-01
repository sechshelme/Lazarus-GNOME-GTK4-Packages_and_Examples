
unit elm_entry_part_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_entry_part_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_entry_part_eo.h
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
PElm_Entry_Part  = ^Elm_Entry_Part;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_ENTRY_PART_EO_H_}
{$define _ELM_ENTRY_PART_EO_H_}
{$ifndef _ELM_ENTRY_PART_EO_CLASS_TYPE}
{$define _ELM_ENTRY_PART_EO_CLASS_TYPE}
type
  PElm_Entry_Part = ^TElm_Entry_Part;
  TElm_Entry_Part = TEo;
{$endif}
{$ifndef _ELM_ENTRY_PART_EO_TYPES}
{$define _ELM_ENTRY_PART_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Elementary entry internal part class
 *
 * @ingroup Elm_Entry_Part
  }

{ was #define dname def_expr }
function ELM_ENTRY_PART_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function elm_entry_part_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function ELM_ENTRY_PART_CLASS : longint; { return type might be wrong }
  begin
    ELM_ENTRY_PART_CLASS:=elm_entry_part_class_get;
  end;


end.
