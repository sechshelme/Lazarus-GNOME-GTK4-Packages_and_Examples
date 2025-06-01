
unit efl_ui_layout_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_layout_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_layout_eo.h
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
PEfl_Ui_Layout  = ^Efl_Ui_Layout;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_LAYOUT_EO_H_}
{$define _EFL_UI_LAYOUT_EO_H_}
{$ifndef _EFL_UI_LAYOUT_EO_CLASS_TYPE}
{$define _EFL_UI_LAYOUT_EO_CLASS_TYPE}
type
  PEfl_Ui_Layout = ^TEfl_Ui_Layout;
  TEfl_Ui_Layout = TEo;
{$endif}
{$ifndef _EFL_UI_LAYOUT_EO_TYPES}
{$define _EFL_UI_LAYOUT_EO_TYPES}
{$endif}
{*
 * @brief EFL layout widget class.
 *
 * When loading layouts from a file, use the @ref efl_file_key_get property to
 * specify the group that the data belongs to, in case it's an EET file
 * (including Edje files).
 *
 * By default, layouts do not apply the finger_size global configuration value
 * when calculating their geometries.
 *
 * @since 1.22
 *
 * @ingroup Efl_Ui_Layout
  }

{ was #define dname def_expr }
function EFL_UI_LAYOUT_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_layout_class_get:PEfl_Class;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_LAYOUT_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_LAYOUT_CLASS:=efl_ui_layout_class_get;
  end;


end.
