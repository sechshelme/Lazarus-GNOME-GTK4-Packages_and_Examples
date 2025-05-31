
unit efl_ui_button_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_button_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_button_eo.h
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
PEfl_Ui_Button  = ^Efl_Ui_Button;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_BUTTON_EO_H_}
{$define _EFL_UI_BUTTON_EO_H_}
{$ifndef _EFL_UI_BUTTON_EO_CLASS_TYPE}
{$define _EFL_UI_BUTTON_EO_CLASS_TYPE}
type
  PEfl_Ui_Button = ^TEfl_Ui_Button;
  TEfl_Ui_Button = TEo;
{$endif}
{$ifndef _EFL_UI_BUTTON_EO_TYPES}
{$define _EFL_UI_BUTTON_EO_TYPES}
{$endif}
{*
 * @brief Push-button widget
 *
 * Press it and run some function. It can contain a simple label and icon
 * object and it also has an autorepeat feature.
 *
 * The icon can be set using @ref efl_content_get, the text can be set using
 * @ref efl_text_get.
 *
 * The events of @ref Efl_Input_Clickable can be used to listen to a click
 * event from the user.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Button
  }

{ was #define dname def_expr }
function EFL_UI_BUTTON_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_button_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_BUTTON_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_BUTTON_CLASS:=efl_ui_button_class_get;
  end;


end.
