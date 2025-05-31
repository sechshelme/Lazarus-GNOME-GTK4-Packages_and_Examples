
unit efl_ui_layout_part_content_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_layout_part_content_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_layout_part_content_eo.h
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
PEfl_Ui_Layout_Part_Content  = ^Efl_Ui_Layout_Part_Content;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_LAYOUT_PART_CONTENT_EO_H_}
{$define _EFL_UI_LAYOUT_PART_CONTENT_EO_H_}
{$ifndef _EFL_UI_LAYOUT_PART_CONTENT_EO_CLASS_TYPE}
{$define _EFL_UI_LAYOUT_PART_CONTENT_EO_CLASS_TYPE}
type
  PEfl_Ui_Layout_Part_Content = ^TEfl_Ui_Layout_Part_Content;
  TEfl_Ui_Layout_Part_Content = TEo;
{$endif}
{$ifndef _EFL_UI_LAYOUT_PART_CONTENT_EO_TYPES}
{$define _EFL_UI_LAYOUT_PART_CONTENT_EO_TYPES}
{$endif}
{* Elementary layout internal part class
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Layout_Part_Content
  }

{ was #define dname def_expr }
function EFL_UI_LAYOUT_PART_CONTENT_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_layout_part_content_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_LAYOUT_PART_CONTENT_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_LAYOUT_PART_CONTENT_CLASS:=efl_ui_layout_part_content_class_get;
  end;


end.
