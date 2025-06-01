
unit efl_ui_text_factory_fallback_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_text_factory_fallback_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_text_factory_fallback_eo.h
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
PEfl_Ui_Text_Factory_Fallback  = ^Efl_Ui_Text_Factory_Fallback;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_TEXT_FACTORY_FALLBACK_EO_H_}
{$define _EFL_UI_TEXT_FACTORY_FALLBACK_EO_H_}
{$ifndef _EFL_UI_TEXT_FACTORY_FALLBACK_EO_CLASS_TYPE}
{$define _EFL_UI_TEXT_FACTORY_FALLBACK_EO_CLASS_TYPE}
type
  PEfl_Ui_Text_Factory_Fallback = ^TEfl_Ui_Text_Factory_Fallback;
  TEfl_Ui_Text_Factory_Fallback = TEo;
{$endif}
{$ifndef _EFL_UI_TEXT_FACTORY_FALLBACK_EO_TYPES}
{$define _EFL_UI_TEXT_FACTORY_FALLBACK_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Internal factory for fallback cases.
 *
 * This wraps some internal functionality: - Contains 2 factories: image and
 * emoticon - Strips off "file://" prefix for image items, to be used with the
 * image factory.
 *
 * @ingroup Efl_Ui_Text_Factory_Fallback
  }

{ was #define dname def_expr }
function EFL_UI_TEXT_FACTORY_FALLBACK_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_text_factory_fallback_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_TEXT_FACTORY_FALLBACK_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_TEXT_FACTORY_FALLBACK_CLASS:=efl_ui_text_factory_fallback_class_get;
  end;


end.
