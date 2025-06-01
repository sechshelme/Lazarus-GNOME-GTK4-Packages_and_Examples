
unit efl_ui_panes_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_panes_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_panes_private.h
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
PEfl_Ui_Panes_Data  = ^Efl_Ui_Panes_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_PANES_H}
{$define ELM_WIDGET_PANES_H}
{$include "Elementary.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-panes-class The Elementary Panes Class
 *
 * Elementary, besides having the @ref Panes widget, exposes its
 * foundation -- the Elementary Panes Class -- in order to create other
 * widgets which are a panes with some more logic on top.
  }
{*
 * Base layout smart data extended with panes instance data.
  }
type
  PEfl_Ui_Panes_Data = ^TEfl_Ui_Panes_Data;
  TEfl_Ui_Panes_Data = record
      event : PEvas_Object;
      move : record
          x_diff : longint;
          y_diff : longint;
          move : TEina_Bool;
        end;
      dir : TEfl_Ui_Layout_Orientation;
      left_min_relative_size : Tdouble;
      right_min_relative_size : Tdouble;
      first_min : TEina_Size2D;
      second_min : TEina_Size2D;
      first_min_split_ratio : Tdouble;
      second_min_split_ratio : Tdouble;
      left_min_size : TEvas_Coord;
      right_min_size : TEvas_Coord;
      flag0 : word;
    end;


const
  bm_TEfl_Ui_Panes_Data_double_clicked = $1;
  bp_TEfl_Ui_Panes_Data_double_clicked = 0;
  bm_TEfl_Ui_Panes_Data_fixed = $2;
  bp_TEfl_Ui_Panes_Data_fixed = 1;
  bm_TEfl_Ui_Panes_Data_left_min_size_is_relative = $4;
  bp_TEfl_Ui_Panes_Data_left_min_size_is_relative = 2;
  bm_TEfl_Ui_Panes_Data_right_min_size_is_relative = $8;
  bp_TEfl_Ui_Panes_Data_right_min_size_is_relative = 3;
  bm_TEfl_Ui_Panes_Data_first_hint_min_allow = $10;
  bp_TEfl_Ui_Panes_Data_first_hint_min_allow = 4;
  bm_TEfl_Ui_Panes_Data_second_hint_min_allow = $20;
  bp_TEfl_Ui_Panes_Data_second_hint_min_allow = 5;

function double_clicked(var a : TEfl_Ui_Panes_Data) : TEina_Bool;
procedure set_double_clicked(var a : TEfl_Ui_Panes_Data; __double_clicked : TEina_Bool);
function fixed(var a : TEfl_Ui_Panes_Data) : TEina_Bool;
procedure set_fixed(var a : TEfl_Ui_Panes_Data; __fixed : TEina_Bool);
function left_min_size_is_relative(var a : TEfl_Ui_Panes_Data) : TEina_Bool;
procedure set_left_min_size_is_relative(var a : TEfl_Ui_Panes_Data; __left_min_size_is_relative : TEina_Bool);
function right_min_size_is_relative(var a : TEfl_Ui_Panes_Data) : TEina_Bool;
procedure set_right_min_size_is_relative(var a : TEfl_Ui_Panes_Data; __right_min_size_is_relative : TEina_Bool);
function first_hint_min_allow(var a : TEfl_Ui_Panes_Data) : TEina_Bool;
procedure set_first_hint_min_allow(var a : TEfl_Ui_Panes_Data; __first_hint_min_allow : TEina_Bool);
function second_hint_min_allow(var a : TEfl_Ui_Panes_Data) : TEina_Bool;
procedure set_second_hint_min_allow(var a : TEfl_Ui_Panes_Data; __second_hint_min_allow : TEina_Bool);
{*
 * @
  }

implementation

function double_clicked(var a : TEfl_Ui_Panes_Data) : TEina_Bool;
begin
  double_clicked:=(a.flag0 and bm_TEfl_Ui_Panes_Data_double_clicked) shr bp_TEfl_Ui_Panes_Data_double_clicked;
end;

procedure set_double_clicked(var a : TEfl_Ui_Panes_Data; __double_clicked : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__double_clicked shl bp_TEfl_Ui_Panes_Data_double_clicked) and bm_TEfl_Ui_Panes_Data_double_clicked);
end;

function fixed(var a : TEfl_Ui_Panes_Data) : TEina_Bool;
begin
  fixed:=(a.flag0 and bm_TEfl_Ui_Panes_Data_fixed) shr bp_TEfl_Ui_Panes_Data_fixed;
end;

procedure set_fixed(var a : TEfl_Ui_Panes_Data; __fixed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__fixed shl bp_TEfl_Ui_Panes_Data_fixed) and bm_TEfl_Ui_Panes_Data_fixed);
end;

function left_min_size_is_relative(var a : TEfl_Ui_Panes_Data) : TEina_Bool;
begin
  left_min_size_is_relative:=(a.flag0 and bm_TEfl_Ui_Panes_Data_left_min_size_is_relative) shr bp_TEfl_Ui_Panes_Data_left_min_size_is_relative;
end;

procedure set_left_min_size_is_relative(var a : TEfl_Ui_Panes_Data; __left_min_size_is_relative : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__left_min_size_is_relative shl bp_TEfl_Ui_Panes_Data_left_min_size_is_relative) and bm_TEfl_Ui_Panes_Data_left_min_size_is_relative);
end;

function right_min_size_is_relative(var a : TEfl_Ui_Panes_Data) : TEina_Bool;
begin
  right_min_size_is_relative:=(a.flag0 and bm_TEfl_Ui_Panes_Data_right_min_size_is_relative) shr bp_TEfl_Ui_Panes_Data_right_min_size_is_relative;
end;

procedure set_right_min_size_is_relative(var a : TEfl_Ui_Panes_Data; __right_min_size_is_relative : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__right_min_size_is_relative shl bp_TEfl_Ui_Panes_Data_right_min_size_is_relative) and bm_TEfl_Ui_Panes_Data_right_min_size_is_relative);
end;

function first_hint_min_allow(var a : TEfl_Ui_Panes_Data) : TEina_Bool;
begin
  first_hint_min_allow:=(a.flag0 and bm_TEfl_Ui_Panes_Data_first_hint_min_allow) shr bp_TEfl_Ui_Panes_Data_first_hint_min_allow;
end;

procedure set_first_hint_min_allow(var a : TEfl_Ui_Panes_Data; __first_hint_min_allow : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__first_hint_min_allow shl bp_TEfl_Ui_Panes_Data_first_hint_min_allow) and bm_TEfl_Ui_Panes_Data_first_hint_min_allow);
end;

function second_hint_min_allow(var a : TEfl_Ui_Panes_Data) : TEina_Bool;
begin
  second_hint_min_allow:=(a.flag0 and bm_TEfl_Ui_Panes_Data_second_hint_min_allow) shr bp_TEfl_Ui_Panes_Data_second_hint_min_allow;
end;

procedure set_second_hint_min_allow(var a : TEfl_Ui_Panes_Data; __second_hint_min_allow : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__second_hint_min_allow shl bp_TEfl_Ui_Panes_Data_second_hint_min_allow) and bm_TEfl_Ui_Panes_Data_second_hint_min_allow);
end;


end.
