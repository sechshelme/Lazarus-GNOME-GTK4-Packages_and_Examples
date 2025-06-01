
unit efl_ui_tags_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_tags_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_tags_private.h
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
Pchar  = ^char;
PEcore_Timer  = ^Ecore_Timer;
PEfl_Ui_Tags_Data  = ^Efl_Ui_Tags_Data;
PEina_Array  = ^Eina_Array;
PEina_List  = ^Eina_List;
PEo  = ^Eo;
PTags_It_State  = ^Tags_It_State;
PTags_View_State  = ^Tags_View_State;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_TAGS_PRIVATE_H}
{$define EFL_UI_TAGS_PRIVATE_H}
{$include "elm_widget_layout.h"}
type
  PTags_View_State = ^TTags_View_State;
  TTags_View_State =  Longint;
  Const
    TAGS_VIEW_NONE = 0;
    TAGS_VIEW_GUIDETEXT = 1;
    TAGS_VIEW_ENTRY = 2;
    TAGS_VIEW_SHRINK = 3;
;
type
  PTags_It_State = ^TTags_It_State;
  TTags_It_State =  Longint;
  Const
    TAGS_IT_STATE_DEFAULT = 0;
    TAGS_IT_STATE_SELECTED = 1;
;
type
(* Const before type ignored *)
  PEfl_Ui_Tags_Data = ^TEfl_Ui_Tags_Data;
  TEfl_Ui_Tags_Data = record
      it_array : PEina_Array;
      layouts : PEina_List;
      parent : PEo;
      box : PEo;
      _label : PEo;
      end : PEo;
      entry : PEo;
      selected_it : PEo;
      focused_it : PEo;
      downed_it : PEo;
      view_state : TTags_View_State;
      longpress_timer : PEcore_Timer;
      label_str : Pchar;
      guide_text_str : Pchar;
      n_str : longint;
      w_box : TEvas_Coord;
      h_box : TEvas_Coord;
      shrink : longint;
      flag0 : word;
    end;


const
  bm_TEfl_Ui_Tags_Data_last_it_select = $1;
  bp_TEfl_Ui_Tags_Data_last_it_select = 0;
  bm_TEfl_Ui_Tags_Data_editable = $2;
  bp_TEfl_Ui_Tags_Data_editable = 1;
  bm_TEfl_Ui_Tags_Data_focused = $4;
  bp_TEfl_Ui_Tags_Data_focused = 2;
  bm_TEfl_Ui_Tags_Data_label_packed = $8;
  bp_TEfl_Ui_Tags_Data_label_packed = 3;
  bm_TEfl_Ui_Tags_Data_item_setting = $10;
  bp_TEfl_Ui_Tags_Data_item_setting = 4;

function last_it_select(var a : TEfl_Ui_Tags_Data) : TEina_Bool;
procedure set_last_it_select(var a : TEfl_Ui_Tags_Data; __last_it_select : TEina_Bool);
function editable(var a : TEfl_Ui_Tags_Data) : TEina_Bool;
procedure set_editable(var a : TEfl_Ui_Tags_Data; __editable : TEina_Bool);
function focused(var a : TEfl_Ui_Tags_Data) : TEina_Bool;
procedure set_focused(var a : TEfl_Ui_Tags_Data; __focused : TEina_Bool);
function label_packed(var a : TEfl_Ui_Tags_Data) : TEina_Bool;
procedure set_label_packed(var a : TEfl_Ui_Tags_Data; __label_packed : TEina_Bool);
function item_setting(var a : TEfl_Ui_Tags_Data) : TEina_Bool;
procedure set_item_setting(var a : TEfl_Ui_Tags_Data; __item_setting : TEina_Bool);
{$endif}

implementation

function last_it_select(var a : TEfl_Ui_Tags_Data) : TEina_Bool;
begin
  last_it_select:=(a.flag0 and bm_TEfl_Ui_Tags_Data_last_it_select) shr bp_TEfl_Ui_Tags_Data_last_it_select;
end;

procedure set_last_it_select(var a : TEfl_Ui_Tags_Data; __last_it_select : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__last_it_select shl bp_TEfl_Ui_Tags_Data_last_it_select) and bm_TEfl_Ui_Tags_Data_last_it_select);
end;

function editable(var a : TEfl_Ui_Tags_Data) : TEina_Bool;
begin
  editable:=(a.flag0 and bm_TEfl_Ui_Tags_Data_editable) shr bp_TEfl_Ui_Tags_Data_editable;
end;

procedure set_editable(var a : TEfl_Ui_Tags_Data; __editable : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__editable shl bp_TEfl_Ui_Tags_Data_editable) and bm_TEfl_Ui_Tags_Data_editable);
end;

function focused(var a : TEfl_Ui_Tags_Data) : TEina_Bool;
begin
  focused:=(a.flag0 and bm_TEfl_Ui_Tags_Data_focused) shr bp_TEfl_Ui_Tags_Data_focused;
end;

procedure set_focused(var a : TEfl_Ui_Tags_Data; __focused : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__focused shl bp_TEfl_Ui_Tags_Data_focused) and bm_TEfl_Ui_Tags_Data_focused);
end;

function label_packed(var a : TEfl_Ui_Tags_Data) : TEina_Bool;
begin
  label_packed:=(a.flag0 and bm_TEfl_Ui_Tags_Data_label_packed) shr bp_TEfl_Ui_Tags_Data_label_packed;
end;

procedure set_label_packed(var a : TEfl_Ui_Tags_Data; __label_packed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__label_packed shl bp_TEfl_Ui_Tags_Data_label_packed) and bm_TEfl_Ui_Tags_Data_label_packed);
end;

function item_setting(var a : TEfl_Ui_Tags_Data) : TEina_Bool;
begin
  item_setting:=(a.flag0 and bm_TEfl_Ui_Tags_Data_item_setting) shr bp_TEfl_Ui_Tags_Data_item_setting;
end;

procedure set_item_setting(var a : TEfl_Ui_Tags_Data; __item_setting : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__item_setting shl bp_TEfl_Ui_Tags_Data_item_setting) and bm_TEfl_Ui_Tags_Data_item_setting);
end;


end.
