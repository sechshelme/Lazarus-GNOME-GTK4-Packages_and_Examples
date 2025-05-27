
unit efl_ui_spotlight_util_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_spotlight_util_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_spotlight_util_eo.h
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
PEfl_Ui_Spotlight_Container  = ^Efl_Ui_Spotlight_Container;
PEfl_Ui_Spotlight_Util  = ^Efl_Ui_Spotlight_Util;
PEfl_Ui_Widget  = ^Efl_Ui_Widget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_SPOTLIGHT_UTIL_EO_H_}
{$define _EFL_UI_SPOTLIGHT_UTIL_EO_H_}
{$ifndef _EFL_UI_SPOTLIGHT_UTIL_EO_CLASS_TYPE}
{$define _EFL_UI_SPOTLIGHT_UTIL_EO_CLASS_TYPE}
type
  PEfl_Ui_Spotlight_Util = ^TEfl_Ui_Spotlight_Util;
  TEfl_Ui_Spotlight_Util = TEo;
{$endif}
{$ifndef _EFL_UI_SPOTLIGHT_UTIL_EO_TYPES}
{$define _EFL_UI_SPOTLIGHT_UTIL_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}

{ was #define dname def_expr }
function EFL_UI_SPOTLIGHT_UTIL_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_spotlight_util_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Get a preconfigured stack obejct
 *
 * @param[in] parent
 *
 * @ingroup Efl_Ui_Spotlight_Util
  }
function efl_ui_spotlight_util_stack_gen(parent:PEfl_Ui_Widget):PEfl_Ui_Spotlight_Container;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_SPOTLIGHT_UTIL_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_SPOTLIGHT_UTIL_CLASS:=efl_ui_spotlight_util_class_get;
  end;


end.
