
unit efl_ui_navigation_bar_part_back_button_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_navigation_bar_part_back_button_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_navigation_bar_part_back_button_eo.h
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
PEfl_Ui_Navigation_Bar_Part_Back_Button  = ^Efl_Ui_Navigation_Bar_Part_Back_Button;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_NAVIGATION_BAR_PART_BACK_BUTTON_EO_H_}
{$define _EFL_UI_NAVIGATION_BAR_PART_BACK_BUTTON_EO_H_}
{$ifndef _EFL_UI_NAVIGATION_BAR_PART_BACK_BUTTON_EO_CLASS_TYPE}
{$define _EFL_UI_NAVIGATION_BAR_PART_BACK_BUTTON_EO_CLASS_TYPE}
type
  PEfl_Ui_Navigation_Bar_Part_Back_Button = ^TEfl_Ui_Navigation_Bar_Part_Back_Button;
  TEfl_Ui_Navigation_Bar_Part_Back_Button = TEo;
{$endif}
{$ifndef _EFL_UI_NAVIGATION_BAR_PART_BACK_BUTTON_EO_TYPES}
{$define _EFL_UI_NAVIGATION_BAR_PART_BACK_BUTTON_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* @ref Efl_Ui_Navigation_Bar internal part back button class.
 *
 * @ingroup Efl_Ui_Navigation_Bar_Part_Back_Button
  }

{ was #define dname def_expr }
function EFL_UI_NAVIGATION_BAR_PART_BACK_BUTTON_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_navigation_bar_part_back_button_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_NAVIGATION_BAR_PART_BACK_BUTTON_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_NAVIGATION_BAR_PART_BACK_BUTTON_CLASS:=efl_ui_navigation_bar_part_back_button_class_get;
  end;


end.
