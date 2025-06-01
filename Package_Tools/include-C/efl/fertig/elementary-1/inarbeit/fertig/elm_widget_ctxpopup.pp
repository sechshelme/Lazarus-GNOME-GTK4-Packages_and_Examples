
unit elm_widget_ctxpopup;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_ctxpopup.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_ctxpopup.h
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
PEina_List  = ^Eina_List;
PElm_Ctxpopup_Data  = ^Elm_Ctxpopup_Data;
PElm_Ctxpopup_Item_Data  = ^Elm_Ctxpopup_Item_Data;
PElm_Object_Item  = ^Elm_Object_Item;
PElm_Widget_Item_Data  = ^Elm_Widget_Item_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_CTXPOPUP_H}
{$define ELM_WIDGET_CTXPOPUP_H}
{$include "elm_widget_layout.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-ctxpopup-class The Elementary Ctxpopup Class
 *
 * Elementary, besides having the @ref Ctxpopup widget, exposes its
 * foundation -- the Elementary Ctxpopup Class -- in order to create other
 * widgets which are a ctxpopup with some more logic on top.
  }
type
{*
 * Base widget smart data extended with ctxpopup instance data.
  }
(* Const before type ignored *)
  PElm_Ctxpopup_Item_Data = ^TElm_Ctxpopup_Item_Data;
  TElm_Ctxpopup_Item_Data = record
      base : PElm_Widget_Item_Data;
      list_item : PElm_Object_Item;
      wcb : record
          org_func_cb : TEvas_Smart_Cb;
          org_data : pointer;
          cobj : PEvas_Object;
        end;
      flag0 : word;
    end;


const
  bm_TElm_Ctxpopup_Item_Data_selected = $1;
  bp_TElm_Ctxpopup_Item_Data_selected = 0;

function selected(var a : TElm_Ctxpopup_Item_Data) : TEina_Bool;
procedure set_selected(var a : TElm_Ctxpopup_Item_Data; __selected : TEina_Bool);
{*< auto hide mode triggered by ctxpopup policy }
type
  PElm_Ctxpopup_Data = ^TElm_Ctxpopup_Data;
  TElm_Ctxpopup_Data = record
      parent : PEvas_Object;
      list : PEvas_Object;
      box : PEvas_Object;
      items : PEina_List;
      arrow : PEvas_Object;
      bg : PEvas_Object;
      content : PEvas_Object;
      dir : TElm_Ctxpopup_Direction;
      dir_priority : array[0..3] of TElm_Ctxpopup_Direction;
      flag0 : word;
    end;


const
  bm_TElm_Ctxpopup_Data_list_visible = $1;
  bp_TElm_Ctxpopup_Data_list_visible = 0;
  bm_TElm_Ctxpopup_Data_horizontal = $2;
  bp_TElm_Ctxpopup_Data_horizontal = 1;
  bm_TElm_Ctxpopup_Data_finished = $4;
  bp_TElm_Ctxpopup_Data_finished = 2;
  bm_TElm_Ctxpopup_Data_emitted = $8;
  bp_TElm_Ctxpopup_Data_emitted = 3;
  bm_TElm_Ctxpopup_Data_visible = $10;
  bp_TElm_Ctxpopup_Data_visible = 4;
  bm_TElm_Ctxpopup_Data_auto_hide = $20;
  bp_TElm_Ctxpopup_Data_auto_hide = 5;

function list_visible(var a : TElm_Ctxpopup_Data) : TEina_Bool;
procedure set_list_visible(var a : TElm_Ctxpopup_Data; __list_visible : TEina_Bool);
function horizontal(var a : TElm_Ctxpopup_Data) : TEina_Bool;
procedure set_horizontal(var a : TElm_Ctxpopup_Data; __horizontal : TEina_Bool);
function finished(var a : TElm_Ctxpopup_Data) : TEina_Bool;
procedure set_finished(var a : TElm_Ctxpopup_Data; __finished : TEina_Bool);
function emitted(var a : TElm_Ctxpopup_Data) : TEina_Bool;
procedure set_emitted(var a : TElm_Ctxpopup_Data; __emitted : TEina_Bool);
function visible(var a : TElm_Ctxpopup_Data) : TEina_Bool;
procedure set_visible(var a : TElm_Ctxpopup_Data; __visible : TEina_Bool);
function auto_hide(var a : TElm_Ctxpopup_Data) : TEina_Bool;
procedure set_auto_hide(var a : TElm_Ctxpopup_Data; __auto_hide : TEina_Bool);

implementation

function selected(var a : TElm_Ctxpopup_Item_Data) : TEina_Bool;
begin
  selected:=(a.flag0 and bm_TElm_Ctxpopup_Item_Data_selected) shr bp_TElm_Ctxpopup_Item_Data_selected;
end;

procedure set_selected(var a : TElm_Ctxpopup_Item_Data; __selected : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__selected shl bp_TElm_Ctxpopup_Item_Data_selected) and bm_TElm_Ctxpopup_Item_Data_selected);
end;

function list_visible(var a : TElm_Ctxpopup_Data) : TEina_Bool;
begin
  list_visible:=(a.flag0 and bm_TElm_Ctxpopup_Data_list_visible) shr bp_TElm_Ctxpopup_Data_list_visible;
end;

procedure set_list_visible(var a : TElm_Ctxpopup_Data; __list_visible : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__list_visible shl bp_TElm_Ctxpopup_Data_list_visible) and bm_TElm_Ctxpopup_Data_list_visible);
end;

function horizontal(var a : TElm_Ctxpopup_Data) : TEina_Bool;
begin
  horizontal:=(a.flag0 and bm_TElm_Ctxpopup_Data_horizontal) shr bp_TElm_Ctxpopup_Data_horizontal;
end;

procedure set_horizontal(var a : TElm_Ctxpopup_Data; __horizontal : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__horizontal shl bp_TElm_Ctxpopup_Data_horizontal) and bm_TElm_Ctxpopup_Data_horizontal);
end;

function finished(var a : TElm_Ctxpopup_Data) : TEina_Bool;
begin
  finished:=(a.flag0 and bm_TElm_Ctxpopup_Data_finished) shr bp_TElm_Ctxpopup_Data_finished;
end;

procedure set_finished(var a : TElm_Ctxpopup_Data; __finished : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__finished shl bp_TElm_Ctxpopup_Data_finished) and bm_TElm_Ctxpopup_Data_finished);
end;

function emitted(var a : TElm_Ctxpopup_Data) : TEina_Bool;
begin
  emitted:=(a.flag0 and bm_TElm_Ctxpopup_Data_emitted) shr bp_TElm_Ctxpopup_Data_emitted;
end;

procedure set_emitted(var a : TElm_Ctxpopup_Data; __emitted : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__emitted shl bp_TElm_Ctxpopup_Data_emitted) and bm_TElm_Ctxpopup_Data_emitted);
end;

function visible(var a : TElm_Ctxpopup_Data) : TEina_Bool;
begin
  visible:=(a.flag0 and bm_TElm_Ctxpopup_Data_visible) shr bp_TElm_Ctxpopup_Data_visible;
end;

procedure set_visible(var a : TElm_Ctxpopup_Data; __visible : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__visible shl bp_TElm_Ctxpopup_Data_visible) and bm_TElm_Ctxpopup_Data_visible);
end;

function auto_hide(var a : TElm_Ctxpopup_Data) : TEina_Bool;
begin
  auto_hide:=(a.flag0 and bm_TElm_Ctxpopup_Data_auto_hide) shr bp_TElm_Ctxpopup_Data_auto_hide;
end;

procedure set_auto_hide(var a : TElm_Ctxpopup_Data; __auto_hide : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__auto_hide shl bp_TElm_Ctxpopup_Data_auto_hide) and bm_TElm_Ctxpopup_Data_auto_hide);
end;


end.
