
unit efl_ui_legacy_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_legacy_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_legacy_eo.h
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
PEfl_Ui_Legacy  = ^Efl_Ui_Legacy;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_LEGACY_EO_H_}
{$define _EFL_UI_LEGACY_EO_H_}
{$ifndef _EFL_UI_LEGACY_EO_CLASS_TYPE}
{$define _EFL_UI_LEGACY_EO_CLASS_TYPE}
type
  PEfl_Ui_Legacy = ^TEfl_Ui_Legacy;
  TEfl_Ui_Legacy = TEo;
{$endif}
{$ifndef _EFL_UI_LEGACY_EO_TYPES}
{$define _EFL_UI_LEGACY_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief The bg (background) widget is used for setting (solid) background
 * decorations
 *
 * in a window (unless it has transparency enabled) or on any container object.
 * It works just like an image but has some properties useful for backgrounds,
 * such as setting it to tiled, centered, scaled or stretched.
 *
 * @ingroup Efl_Ui_Legacy
  }

{ was #define dname def_expr }
function EFL_UI_LEGACY_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_legacy_interface_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_LEGACY_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_LEGACY_INTERFACE:=efl_ui_legacy_interface_get;
  end;


end.
