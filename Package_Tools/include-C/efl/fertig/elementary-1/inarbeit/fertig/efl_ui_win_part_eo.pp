
unit efl_ui_win_part_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_win_part_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_win_part_eo.h
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
PEfl_Ui_Win_Part  = ^Efl_Ui_Win_Part;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_WIN_PART_EO_H_}
{$define _EFL_UI_WIN_PART_EO_H_}
{$ifndef _EFL_UI_WIN_PART_EO_CLASS_TYPE}
{$define _EFL_UI_WIN_PART_EO_CLASS_TYPE}
type
  PEfl_Ui_Win_Part = ^TEfl_Ui_Win_Part;
  TEfl_Ui_Win_Part = TEo;
{$endif}
{$ifndef _EFL_UI_WIN_PART_EO_TYPES}
{$define _EFL_UI_WIN_PART_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl UI window interal part class
 *
 * @ingroup Efl_Ui_Win_Part
  }

{ was #define dname def_expr }
function EFL_UI_WIN_PART_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_win_part_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_WIN_PART_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_WIN_PART_CLASS:=efl_ui_win_part_class_get;
  end;


end.
