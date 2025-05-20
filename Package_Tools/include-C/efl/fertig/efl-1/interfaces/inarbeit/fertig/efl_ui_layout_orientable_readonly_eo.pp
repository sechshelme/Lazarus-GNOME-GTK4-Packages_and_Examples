
unit efl_ui_layout_orientable_readonly_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_layout_orientable_readonly_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_layout_orientable_readonly_eo.h
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
PEfl_Ui_Layout_Orientable_Readonly  = ^Efl_Ui_Layout_Orientable_Readonly;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_LAYOUT_ORIENTABLE_READONLY_EO_H_}
{$define _EFL_UI_LAYOUT_ORIENTABLE_READONLY_EO_H_}
{$ifndef _EFL_UI_LAYOUT_ORIENTABLE_READONLY_EO_CLASS_TYPE}
{$define _EFL_UI_LAYOUT_ORIENTABLE_READONLY_EO_CLASS_TYPE}
type
  PEfl_Ui_Layout_Orientable_Readonly = ^TEfl_Ui_Layout_Orientable_Readonly;
  TEfl_Ui_Layout_Orientable_Readonly = TEo;
{$endif}
{$ifndef _EFL_UI_LAYOUT_ORIENTABLE_READONLY_EO_TYPES}
{$define _EFL_UI_LAYOUT_ORIENTABLE_READONLY_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}

{ was #define dname def_expr }
function EFL_UI_LAYOUT_ORIENTABLE_READONLY_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_layout_orientable_readonly_mixin_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_LAYOUT_ORIENTABLE_READONLY_MIXIN : longint; { return type might be wrong }
  begin
    EFL_UI_LAYOUT_ORIENTABLE_READONLY_MIXIN:=efl_ui_layout_orientable_readonly_mixin_get;
  end;


end.
