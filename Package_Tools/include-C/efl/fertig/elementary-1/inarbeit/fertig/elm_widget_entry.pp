
unit elm_widget_entry;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_entry.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_entry.h
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
PEcore_Idler  = ^Ecore_Idler;
PEcore_Job  = ^Ecore_Job;
PEcore_Timer  = ^Ecore_Timer;
PEina_List  = ^Eina_List;
PElm_Entry_Context_Menu_Item  = ^Elm_Entry_Context_Menu_Item;
PElm_Entry_Data  = ^Elm_Entry_Data;
PElm_Entry_Item_Provider  = ^Elm_Entry_Item_Provider;
PElm_Entry_Markup_Filter  = ^Elm_Entry_Markup_Filter;
PEvas_Object  = ^Evas_Object;
PLength_Unit  = ^Length_Unit;
PMod_Api  = ^Mod_Api;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_ENTRY_H}
{$define ELM_WIDGET_ENTRY_H}
{$include "elm_interface_scrollable.h"}
{$include "elm_widget_layout.h"}
{$include "elm_entry_eo.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-entry-class The Elementary Entry Class
 *
 * Elementary, besides having the @ref Entry widget, exposes its
 * foundation -- the Elementary Entry Class -- in order to create
 * other widgets which are a entry with some more logic on top.
  }
type
{*
 * Base widget smart data extended with entry instance data.
  }
{ for deferred appending  }
{ Only for clipboard  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{* context menu item list  }
{ module api if supplied }
{*< hover parent object. entry is a hover parent object by default  }
{*< hidden icon for hover target  }
{*< hover object  }
(* Const before type ignored *)
{*< style of a hover object  }
  PElm_Entry_Data = ^TElm_Entry_Data;
  TElm_Entry_Data = record
      hit_rect : PEvas_Object;
      entry_edje : PEvas_Object;
      scr_edje : PEvas_Object;
      hoversel : PEvas_Object;
      mgf_bg : PEvas_Object;
      mgf_clip : PEvas_Object;
      mgf_proxy : PEvas_Object;
      start_handler : PEvas_Object;
      end_handler : PEvas_Object;
      deferred_recalc_job : PEcore_Job;
      longpress_timer : PEcore_Timer;
      delay_write : PEcore_Timer;
      append_text_idler : PEcore_Idler;
      append_text_left : Pchar;
      prediction_hint : Pchar;
      append_text_position : longint;
      append_text_len : longint;
      append_text_chunk : longint;
      append_text_last_time : Tdouble;
      cut_sel : Pchar;
      text : Pchar;
      file : Pchar;
      format : TElm_Text_Format;
      last_w : TEvas_Coord;
      ent_mw : TEvas_Coord;
      ent_mh : TEvas_Coord;
      downx : TEvas_Coord;
      downy : TEvas_Coord;
      ox : TEvas_Coord;
      oy : TEvas_Coord;
      items : PEina_List;
      item_providers : PEina_List;
      markup_filters : PEina_List;
      hov_deljob : PEcore_Job;
      api : PMod_Api;
      cursor_pos : longint;
      policy_h : TElm_Scroller_Policy;
      policy_v : TElm_Scroller_Policy;
      line_wrap : TElm_Wrap_Type;
      input_panel_layout : TElm_Input_Panel_Layout;
      autocapital_type : TElm_Autocapital_Type;
      input_panel_lang : TElm_Input_Panel_Lang;
      input_panel_return_key_type : TElm_Input_Panel_Return_Key_Type;
      input_hints : TElm_Input_Hints;
      sel_handler_cursor : TEdje_Cursor;
      input_panel_imdata : pointer;
      edje_signals : PEina_List;
      input_panel_imdata_len : longint;
      input_panel_layout_variation : longint;
      validators : longint;
      anchor_hover : record
          hover_parent : PEvas_Object;
          pop : PEvas_Object;
          hover : PEvas_Object;
          hover_style : Pchar;
        end;
      cnp_mode : TElm_Cnp_Mode;
      drop_format : TElm_Sel_Format;
      flag0 : longint;
    end;


const
  bm_TElm_Entry_Data_input_panel_return_key_disabled = $1;
  bp_TElm_Entry_Data_input_panel_return_key_disabled = 0;
  bm_TElm_Entry_Data_drag_selection_asked = $2;
  bp_TElm_Entry_Data_drag_selection_asked = 1;
  bm_TElm_Entry_Data_sel_handler_disabled = $4;
  bp_TElm_Entry_Data_sel_handler_disabled = 2;
  bm_TElm_Entry_Data_start_handler_down = $8;
  bp_TElm_Entry_Data_start_handler_down = 3;
  bm_TElm_Entry_Data_start_handler_shown = $10;
  bp_TElm_Entry_Data_start_handler_shown = 4;
  bm_TElm_Entry_Data_end_handler_down = $20;
  bp_TElm_Entry_Data_end_handler_down = 5;
  bm_TElm_Entry_Data_end_handler_shown = $40;
  bp_TElm_Entry_Data_end_handler_shown = 6;
  bm_TElm_Entry_Data_input_panel_enable = $80;
  bp_TElm_Entry_Data_input_panel_enable = 7;
  bm_TElm_Entry_Data_prediction_allow = $100;
  bp_TElm_Entry_Data_prediction_allow = 8;
  bm_TElm_Entry_Data_selection_asked = $200;
  bp_TElm_Entry_Data_selection_asked = 9;
  bm_TElm_Entry_Data_auto_return_key = $400;
  bp_TElm_Entry_Data_auto_return_key = 10;
  bm_TElm_Entry_Data_have_selection = $800;
  bp_TElm_Entry_Data_have_selection = 11;
  bm_TElm_Entry_Data_deferred_cur = $1000;
  bp_TElm_Entry_Data_deferred_cur = 12;
  bm_TElm_Entry_Data_context_menu = $2000;
  bp_TElm_Entry_Data_context_menu = 13;
  bm_TElm_Entry_Data_long_pressed = $4000;
  bp_TElm_Entry_Data_long_pressed = 14;
  bm_TElm_Entry_Data_cur_changed = $8000;
  bp_TElm_Entry_Data_cur_changed = 15;
  bm_TElm_Entry_Data_single_line = $10000;
  bp_TElm_Entry_Data_single_line = 16;
  bm_TElm_Entry_Data_can_write = $20000;
  bp_TElm_Entry_Data_can_write = 17;
  bm_TElm_Entry_Data_auto_save = $40000;
  bp_TElm_Entry_Data_auto_save = 18;
  bm_TElm_Entry_Data_password = $80000;
  bp_TElm_Entry_Data_password = 19;
  bm_TElm_Entry_Data_editable = $100000;
  bp_TElm_Entry_Data_editable = 20;
  bm_TElm_Entry_Data_disabled = $200000;
  bp_TElm_Entry_Data_disabled = 21;
  bm_TElm_Entry_Data_h_bounce = $400000;
  bp_TElm_Entry_Data_h_bounce = 22;
  bm_TElm_Entry_Data_v_bounce = $800000;
  bp_TElm_Entry_Data_v_bounce = 23;
  bm_TElm_Entry_Data_has_text = $1000000;
  bp_TElm_Entry_Data_has_text = 24;
  bm_TElm_Entry_Data_use_down = $2000000;
  bp_TElm_Entry_Data_use_down = 25;
  bm_TElm_Entry_Data_sel_mode = $4000000;
  bp_TElm_Entry_Data_sel_mode = 26;
  bm_TElm_Entry_Data_sel_allow = $8000000;
  bp_TElm_Entry_Data_sel_allow = 27;
  bm_TElm_Entry_Data_changed = $10000000;
  bp_TElm_Entry_Data_changed = 28;
  bm_TElm_Entry_Data_scroll = $20000000;
  bp_TElm_Entry_Data_scroll = 29;
  bm_TElm_Entry_Data_input_panel_show_on_demand = $40000000;
  bp_TElm_Entry_Data_input_panel_show_on_demand = 30;
  bm_TElm_Entry_Data_file_setting = $80000000;
  bp_TElm_Entry_Data_file_setting = 31;

function input_panel_return_key_disabled(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_input_panel_return_key_disabled(var a : TElm_Entry_Data; __input_panel_return_key_disabled : TEina_Bool);
function drag_selection_asked(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_drag_selection_asked(var a : TElm_Entry_Data; __drag_selection_asked : TEina_Bool);
function sel_handler_disabled(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_sel_handler_disabled(var a : TElm_Entry_Data; __sel_handler_disabled : TEina_Bool);
function start_handler_down(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_start_handler_down(var a : TElm_Entry_Data; __start_handler_down : TEina_Bool);
function start_handler_shown(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_start_handler_shown(var a : TElm_Entry_Data; __start_handler_shown : TEina_Bool);
function end_handler_down(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_end_handler_down(var a : TElm_Entry_Data; __end_handler_down : TEina_Bool);
function end_handler_shown(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_end_handler_shown(var a : TElm_Entry_Data; __end_handler_shown : TEina_Bool);
function input_panel_enable(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_input_panel_enable(var a : TElm_Entry_Data; __input_panel_enable : TEina_Bool);
function prediction_allow(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_prediction_allow(var a : TElm_Entry_Data; __prediction_allow : TEina_Bool);
function selection_asked(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_selection_asked(var a : TElm_Entry_Data; __selection_asked : TEina_Bool);
function auto_return_key(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_auto_return_key(var a : TElm_Entry_Data; __auto_return_key : TEina_Bool);
function have_selection(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_have_selection(var a : TElm_Entry_Data; __have_selection : TEina_Bool);
function deferred_cur(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_deferred_cur(var a : TElm_Entry_Data; __deferred_cur : TEina_Bool);
function context_menu(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_context_menu(var a : TElm_Entry_Data; __context_menu : TEina_Bool);
function long_pressed(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_long_pressed(var a : TElm_Entry_Data; __long_pressed : TEina_Bool);
function cur_changed(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_cur_changed(var a : TElm_Entry_Data; __cur_changed : TEina_Bool);
function single_line(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_single_line(var a : TElm_Entry_Data; __single_line : TEina_Bool);
function can_write(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_can_write(var a : TElm_Entry_Data; __can_write : TEina_Bool);
function auto_save(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_auto_save(var a : TElm_Entry_Data; __auto_save : TEina_Bool);
function password(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_password(var a : TElm_Entry_Data; __password : TEina_Bool);
function editable(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_editable(var a : TElm_Entry_Data; __editable : TEina_Bool);
function disabled(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_disabled(var a : TElm_Entry_Data; __disabled : TEina_Bool);
function h_bounce(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_h_bounce(var a : TElm_Entry_Data; __h_bounce : TEina_Bool);
function v_bounce(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_v_bounce(var a : TElm_Entry_Data; __v_bounce : TEina_Bool);
function has_text(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_has_text(var a : TElm_Entry_Data; __has_text : TEina_Bool);
function use_down(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_use_down(var a : TElm_Entry_Data; __use_down : TEina_Bool);
function sel_mode(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_sel_mode(var a : TElm_Entry_Data; __sel_mode : TEina_Bool);
function sel_allow(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_sel_allow(var a : TElm_Entry_Data; __sel_allow : TEina_Bool);
function changed(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_changed(var a : TElm_Entry_Data; __changed : TEina_Bool);
function scroll(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_scroll(var a : TElm_Entry_Data; __scroll : TEina_Bool);
function input_panel_show_on_demand(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_input_panel_show_on_demand(var a : TElm_Entry_Data; __input_panel_show_on_demand : TEina_Bool);
function file_setting(var a : TElm_Entry_Data) : TEina_Bool;
procedure set_file_setting(var a : TElm_Entry_Data; __file_setting : TEina_Bool);
type
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  PElm_Entry_Context_Menu_Item = ^TElm_Entry_Context_Menu_Item;
  TElm_Entry_Context_Menu_Item = record
      obj : PEvas_Object;
      _label : Pchar;
      icon_file : Pchar;
      icon_group : Pchar;
      icon_type : TElm_Icon_Type;
      func : TEvas_Smart_Cb;
      data : pointer;
    end;

(* Const before type ignored *)
  PElm_Entry_Item_Provider = ^TElm_Entry_Item_Provider;
  TElm_Entry_Item_Provider = record
      func : function (data:pointer; entry:PEvas_Object; item:Pchar):PEvas_Object;cdecl;
      data : pointer;
    end;

  PElm_Entry_Markup_Filter = ^TElm_Entry_Markup_Filter;
  TElm_Entry_Markup_Filter = record
      func : TElm_Entry_Filter_Cb;
      data : pointer;
      orig_data : pointer;
    end;


  PLength_Unit = ^TLength_Unit;
  TLength_Unit =  Longint;
  Const
    LENGTH_UNIT_CHAR = 0;
    LENGTH_UNIT_BYTE = 1;
    LENGTH_UNIT_LAST = 2;
;
{*
 * @
  }
{$endif}

implementation

function input_panel_return_key_disabled(var a : TElm_Entry_Data) : TEina_Bool;
begin
  input_panel_return_key_disabled:=(a.flag0 and bm_TElm_Entry_Data_input_panel_return_key_disabled) shr bp_TElm_Entry_Data_input_panel_return_key_disabled;
end;

procedure set_input_panel_return_key_disabled(var a : TElm_Entry_Data; __input_panel_return_key_disabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__input_panel_return_key_disabled shl bp_TElm_Entry_Data_input_panel_return_key_disabled) and bm_TElm_Entry_Data_input_panel_return_key_disabled);
end;

function drag_selection_asked(var a : TElm_Entry_Data) : TEina_Bool;
begin
  drag_selection_asked:=(a.flag0 and bm_TElm_Entry_Data_drag_selection_asked) shr bp_TElm_Entry_Data_drag_selection_asked;
end;

procedure set_drag_selection_asked(var a : TElm_Entry_Data; __drag_selection_asked : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__drag_selection_asked shl bp_TElm_Entry_Data_drag_selection_asked) and bm_TElm_Entry_Data_drag_selection_asked);
end;

function sel_handler_disabled(var a : TElm_Entry_Data) : TEina_Bool;
begin
  sel_handler_disabled:=(a.flag0 and bm_TElm_Entry_Data_sel_handler_disabled) shr bp_TElm_Entry_Data_sel_handler_disabled;
end;

procedure set_sel_handler_disabled(var a : TElm_Entry_Data; __sel_handler_disabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__sel_handler_disabled shl bp_TElm_Entry_Data_sel_handler_disabled) and bm_TElm_Entry_Data_sel_handler_disabled);
end;

function start_handler_down(var a : TElm_Entry_Data) : TEina_Bool;
begin
  start_handler_down:=(a.flag0 and bm_TElm_Entry_Data_start_handler_down) shr bp_TElm_Entry_Data_start_handler_down;
end;

procedure set_start_handler_down(var a : TElm_Entry_Data; __start_handler_down : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__start_handler_down shl bp_TElm_Entry_Data_start_handler_down) and bm_TElm_Entry_Data_start_handler_down);
end;

function start_handler_shown(var a : TElm_Entry_Data) : TEina_Bool;
begin
  start_handler_shown:=(a.flag0 and bm_TElm_Entry_Data_start_handler_shown) shr bp_TElm_Entry_Data_start_handler_shown;
end;

procedure set_start_handler_shown(var a : TElm_Entry_Data; __start_handler_shown : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__start_handler_shown shl bp_TElm_Entry_Data_start_handler_shown) and bm_TElm_Entry_Data_start_handler_shown);
end;

function end_handler_down(var a : TElm_Entry_Data) : TEina_Bool;
begin
  end_handler_down:=(a.flag0 and bm_TElm_Entry_Data_end_handler_down) shr bp_TElm_Entry_Data_end_handler_down;
end;

procedure set_end_handler_down(var a : TElm_Entry_Data; __end_handler_down : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__end_handler_down shl bp_TElm_Entry_Data_end_handler_down) and bm_TElm_Entry_Data_end_handler_down);
end;

function end_handler_shown(var a : TElm_Entry_Data) : TEina_Bool;
begin
  end_handler_shown:=(a.flag0 and bm_TElm_Entry_Data_end_handler_shown) shr bp_TElm_Entry_Data_end_handler_shown;
end;

procedure set_end_handler_shown(var a : TElm_Entry_Data; __end_handler_shown : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__end_handler_shown shl bp_TElm_Entry_Data_end_handler_shown) and bm_TElm_Entry_Data_end_handler_shown);
end;

function input_panel_enable(var a : TElm_Entry_Data) : TEina_Bool;
begin
  input_panel_enable:=(a.flag0 and bm_TElm_Entry_Data_input_panel_enable) shr bp_TElm_Entry_Data_input_panel_enable;
end;

procedure set_input_panel_enable(var a : TElm_Entry_Data; __input_panel_enable : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__input_panel_enable shl bp_TElm_Entry_Data_input_panel_enable) and bm_TElm_Entry_Data_input_panel_enable);
end;

function prediction_allow(var a : TElm_Entry_Data) : TEina_Bool;
begin
  prediction_allow:=(a.flag0 and bm_TElm_Entry_Data_prediction_allow) shr bp_TElm_Entry_Data_prediction_allow;
end;

procedure set_prediction_allow(var a : TElm_Entry_Data; __prediction_allow : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__prediction_allow shl bp_TElm_Entry_Data_prediction_allow) and bm_TElm_Entry_Data_prediction_allow);
end;

function selection_asked(var a : TElm_Entry_Data) : TEina_Bool;
begin
  selection_asked:=(a.flag0 and bm_TElm_Entry_Data_selection_asked) shr bp_TElm_Entry_Data_selection_asked;
end;

procedure set_selection_asked(var a : TElm_Entry_Data; __selection_asked : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__selection_asked shl bp_TElm_Entry_Data_selection_asked) and bm_TElm_Entry_Data_selection_asked);
end;

function auto_return_key(var a : TElm_Entry_Data) : TEina_Bool;
begin
  auto_return_key:=(a.flag0 and bm_TElm_Entry_Data_auto_return_key) shr bp_TElm_Entry_Data_auto_return_key;
end;

procedure set_auto_return_key(var a : TElm_Entry_Data; __auto_return_key : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__auto_return_key shl bp_TElm_Entry_Data_auto_return_key) and bm_TElm_Entry_Data_auto_return_key);
end;

function have_selection(var a : TElm_Entry_Data) : TEina_Bool;
begin
  have_selection:=(a.flag0 and bm_TElm_Entry_Data_have_selection) shr bp_TElm_Entry_Data_have_selection;
end;

procedure set_have_selection(var a : TElm_Entry_Data; __have_selection : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__have_selection shl bp_TElm_Entry_Data_have_selection) and bm_TElm_Entry_Data_have_selection);
end;

function deferred_cur(var a : TElm_Entry_Data) : TEina_Bool;
begin
  deferred_cur:=(a.flag0 and bm_TElm_Entry_Data_deferred_cur) shr bp_TElm_Entry_Data_deferred_cur;
end;

procedure set_deferred_cur(var a : TElm_Entry_Data; __deferred_cur : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__deferred_cur shl bp_TElm_Entry_Data_deferred_cur) and bm_TElm_Entry_Data_deferred_cur);
end;

function context_menu(var a : TElm_Entry_Data) : TEina_Bool;
begin
  context_menu:=(a.flag0 and bm_TElm_Entry_Data_context_menu) shr bp_TElm_Entry_Data_context_menu;
end;

procedure set_context_menu(var a : TElm_Entry_Data; __context_menu : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__context_menu shl bp_TElm_Entry_Data_context_menu) and bm_TElm_Entry_Data_context_menu);
end;

function long_pressed(var a : TElm_Entry_Data) : TEina_Bool;
begin
  long_pressed:=(a.flag0 and bm_TElm_Entry_Data_long_pressed) shr bp_TElm_Entry_Data_long_pressed;
end;

procedure set_long_pressed(var a : TElm_Entry_Data; __long_pressed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__long_pressed shl bp_TElm_Entry_Data_long_pressed) and bm_TElm_Entry_Data_long_pressed);
end;

function cur_changed(var a : TElm_Entry_Data) : TEina_Bool;
begin
  cur_changed:=(a.flag0 and bm_TElm_Entry_Data_cur_changed) shr bp_TElm_Entry_Data_cur_changed;
end;

procedure set_cur_changed(var a : TElm_Entry_Data; __cur_changed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__cur_changed shl bp_TElm_Entry_Data_cur_changed) and bm_TElm_Entry_Data_cur_changed);
end;

function single_line(var a : TElm_Entry_Data) : TEina_Bool;
begin
  single_line:=(a.flag0 and bm_TElm_Entry_Data_single_line) shr bp_TElm_Entry_Data_single_line;
end;

procedure set_single_line(var a : TElm_Entry_Data; __single_line : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__single_line shl bp_TElm_Entry_Data_single_line) and bm_TElm_Entry_Data_single_line);
end;

function can_write(var a : TElm_Entry_Data) : TEina_Bool;
begin
  can_write:=(a.flag0 and bm_TElm_Entry_Data_can_write) shr bp_TElm_Entry_Data_can_write;
end;

procedure set_can_write(var a : TElm_Entry_Data; __can_write : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__can_write shl bp_TElm_Entry_Data_can_write) and bm_TElm_Entry_Data_can_write);
end;

function auto_save(var a : TElm_Entry_Data) : TEina_Bool;
begin
  auto_save:=(a.flag0 and bm_TElm_Entry_Data_auto_save) shr bp_TElm_Entry_Data_auto_save;
end;

procedure set_auto_save(var a : TElm_Entry_Data; __auto_save : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__auto_save shl bp_TElm_Entry_Data_auto_save) and bm_TElm_Entry_Data_auto_save);
end;

function password(var a : TElm_Entry_Data) : TEina_Bool;
begin
  password:=(a.flag0 and bm_TElm_Entry_Data_password) shr bp_TElm_Entry_Data_password;
end;

procedure set_password(var a : TElm_Entry_Data; __password : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__password shl bp_TElm_Entry_Data_password) and bm_TElm_Entry_Data_password);
end;

function editable(var a : TElm_Entry_Data) : TEina_Bool;
begin
  editable:=(a.flag0 and bm_TElm_Entry_Data_editable) shr bp_TElm_Entry_Data_editable;
end;

procedure set_editable(var a : TElm_Entry_Data; __editable : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__editable shl bp_TElm_Entry_Data_editable) and bm_TElm_Entry_Data_editable);
end;

function disabled(var a : TElm_Entry_Data) : TEina_Bool;
begin
  disabled:=(a.flag0 and bm_TElm_Entry_Data_disabled) shr bp_TElm_Entry_Data_disabled;
end;

procedure set_disabled(var a : TElm_Entry_Data; __disabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__disabled shl bp_TElm_Entry_Data_disabled) and bm_TElm_Entry_Data_disabled);
end;

function h_bounce(var a : TElm_Entry_Data) : TEina_Bool;
begin
  h_bounce:=(a.flag0 and bm_TElm_Entry_Data_h_bounce) shr bp_TElm_Entry_Data_h_bounce;
end;

procedure set_h_bounce(var a : TElm_Entry_Data; __h_bounce : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__h_bounce shl bp_TElm_Entry_Data_h_bounce) and bm_TElm_Entry_Data_h_bounce);
end;

function v_bounce(var a : TElm_Entry_Data) : TEina_Bool;
begin
  v_bounce:=(a.flag0 and bm_TElm_Entry_Data_v_bounce) shr bp_TElm_Entry_Data_v_bounce;
end;

procedure set_v_bounce(var a : TElm_Entry_Data; __v_bounce : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__v_bounce shl bp_TElm_Entry_Data_v_bounce) and bm_TElm_Entry_Data_v_bounce);
end;

function has_text(var a : TElm_Entry_Data) : TEina_Bool;
begin
  has_text:=(a.flag0 and bm_TElm_Entry_Data_has_text) shr bp_TElm_Entry_Data_has_text;
end;

procedure set_has_text(var a : TElm_Entry_Data; __has_text : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__has_text shl bp_TElm_Entry_Data_has_text) and bm_TElm_Entry_Data_has_text);
end;

function use_down(var a : TElm_Entry_Data) : TEina_Bool;
begin
  use_down:=(a.flag0 and bm_TElm_Entry_Data_use_down) shr bp_TElm_Entry_Data_use_down;
end;

procedure set_use_down(var a : TElm_Entry_Data; __use_down : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__use_down shl bp_TElm_Entry_Data_use_down) and bm_TElm_Entry_Data_use_down);
end;

function sel_mode(var a : TElm_Entry_Data) : TEina_Bool;
begin
  sel_mode:=(a.flag0 and bm_TElm_Entry_Data_sel_mode) shr bp_TElm_Entry_Data_sel_mode;
end;

procedure set_sel_mode(var a : TElm_Entry_Data; __sel_mode : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__sel_mode shl bp_TElm_Entry_Data_sel_mode) and bm_TElm_Entry_Data_sel_mode);
end;

function sel_allow(var a : TElm_Entry_Data) : TEina_Bool;
begin
  sel_allow:=(a.flag0 and bm_TElm_Entry_Data_sel_allow) shr bp_TElm_Entry_Data_sel_allow;
end;

procedure set_sel_allow(var a : TElm_Entry_Data; __sel_allow : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__sel_allow shl bp_TElm_Entry_Data_sel_allow) and bm_TElm_Entry_Data_sel_allow);
end;

function changed(var a : TElm_Entry_Data) : TEina_Bool;
begin
  changed:=(a.flag0 and bm_TElm_Entry_Data_changed) shr bp_TElm_Entry_Data_changed;
end;

procedure set_changed(var a : TElm_Entry_Data; __changed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__changed shl bp_TElm_Entry_Data_changed) and bm_TElm_Entry_Data_changed);
end;

function scroll(var a : TElm_Entry_Data) : TEina_Bool;
begin
  scroll:=(a.flag0 and bm_TElm_Entry_Data_scroll) shr bp_TElm_Entry_Data_scroll;
end;

procedure set_scroll(var a : TElm_Entry_Data; __scroll : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__scroll shl bp_TElm_Entry_Data_scroll) and bm_TElm_Entry_Data_scroll);
end;

function input_panel_show_on_demand(var a : TElm_Entry_Data) : TEina_Bool;
begin
  input_panel_show_on_demand:=(a.flag0 and bm_TElm_Entry_Data_input_panel_show_on_demand) shr bp_TElm_Entry_Data_input_panel_show_on_demand;
end;

procedure set_input_panel_show_on_demand(var a : TElm_Entry_Data; __input_panel_show_on_demand : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__input_panel_show_on_demand shl bp_TElm_Entry_Data_input_panel_show_on_demand) and bm_TElm_Entry_Data_input_panel_show_on_demand);
end;

function file_setting(var a : TElm_Entry_Data) : TEina_Bool;
begin
  file_setting:=(a.flag0 and bm_TElm_Entry_Data_file_setting) shr bp_TElm_Entry_Data_file_setting;
end;

procedure set_file_setting(var a : TElm_Entry_Data; __file_setting : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__file_setting shl bp_TElm_Entry_Data_file_setting) and bm_TElm_Entry_Data_file_setting);
end;


end.
