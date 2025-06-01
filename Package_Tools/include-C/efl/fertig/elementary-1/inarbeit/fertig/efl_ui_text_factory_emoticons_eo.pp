
unit efl_ui_text_factory_emoticons_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_text_factory_emoticons_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_text_factory_emoticons_eo.h
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
PEfl_Ui_Text_Factory_Emoticons  = ^Efl_Ui_Text_Factory_Emoticons;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_TEXT_FACTORY_EMOTICONS_EO_H_}
{$define _EFL_UI_TEXT_FACTORY_EMOTICONS_EO_H_}
{$ifndef _EFL_UI_TEXT_FACTORY_EMOTICONS_EO_CLASS_TYPE}
{$define _EFL_UI_TEXT_FACTORY_EMOTICONS_EO_CLASS_TYPE}
type
  PEfl_Ui_Text_Factory_Emoticons = ^TEfl_Ui_Text_Factory_Emoticons;
  TEfl_Ui_Text_Factory_Emoticons = TEo;
{$endif}
{$ifndef _EFL_UI_TEXT_FACTORY_EMOTICONS_EO_TYPES}
{$define _EFL_UI_TEXT_FACTORY_EMOTICONS_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Factory that creates emoticons from the current theme given a key.
 *
 * @ingroup Efl_Ui_Text_Factory_Emoticons
  }

{ was #define dname def_expr }
function EFL_UI_TEXT_FACTORY_EMOTICONS_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_text_factory_emoticons_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_TEXT_FACTORY_EMOTICONS_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_TEXT_FACTORY_EMOTICONS_CLASS:=efl_ui_text_factory_emoticons_class_get;
  end;


end.
