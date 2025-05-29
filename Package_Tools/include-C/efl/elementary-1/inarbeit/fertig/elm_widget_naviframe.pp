
unit elm_widget_naviframe;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_naviframe.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_naviframe.h
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
PEina_Inlist  = ^Eina_Inlist;
PEina_List  = ^Eina_List;
PElm_Naviframe_Content_Item_Pair  = ^Elm_Naviframe_Content_Item_Pair;
PElm_Naviframe_Data  = ^Elm_Naviframe_Data;
PElm_Naviframe_Item_Data  = ^Elm_Naviframe_Item_Data;
PElm_Naviframe_Op  = ^Elm_Naviframe_Op;
PElm_Naviframe_Text_Item_Pair  = ^Elm_Naviframe_Text_Item_Pair;
PElm_Widget_Item_Data  = ^Elm_Widget_Item_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_NAVIFRAME_H}
{$define ELM_WIDGET_NAVIFRAME_H}
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
 * @section elm-naviframe-class The Elementary Naviframe Class
 *
 * Elementary, besides having the @ref Naviframe widget, exposes its
 * foundation -- the Elementary Naviframe Class -- in order to create other
 * widgets which are a naviframe with some more logic on top.
  }
{*
 * Base layout smart data extended with naviframe instance data.
  }
type
{ the object itself  }
{ top item is the list's LAST item  }
  PElm_Naviframe_Data = ^TElm_Naviframe_Data;
  TElm_Naviframe_Data = record
      obj : PEvas_Object;
      stack : PEina_Inlist;
      popping : PEina_List;
      ops : PEina_List;
      dummy_edje : PEvas_Object;
      dispmode : TEvas_Display_Mode;
      flag0 : word;
    end;


const
  bm_TElm_Naviframe_Data_preserve = $1;
  bp_TElm_Naviframe_Data_preserve = 0;
  bm_TElm_Naviframe_Data_on_deletion = $2;
  bp_TElm_Naviframe_Data_on_deletion = 1;
  bm_TElm_Naviframe_Data_auto_pushed = $4;
  bp_TElm_Naviframe_Data_auto_pushed = 2;
  bm_TElm_Naviframe_Data_freeze_events = $8;
  bp_TElm_Naviframe_Data_freeze_events = 3;

function preserve(var a : TElm_Naviframe_Data) : TEina_Bool;
procedure set_preserve(var a : TElm_Naviframe_Data; __preserve : TEina_Bool);
function on_deletion(var a : TElm_Naviframe_Data) : TEina_Bool;
procedure set_on_deletion(var a : TElm_Naviframe_Data; __on_deletion : TEina_Bool);
function auto_pushed(var a : TElm_Naviframe_Data) : TEina_Bool;
procedure set_auto_pushed(var a : TElm_Naviframe_Data; __auto_pushed : TEina_Bool);
function freeze_events(var a : TElm_Naviframe_Data) : TEina_Bool;
procedure set_freeze_events(var a : TElm_Naviframe_Data; __freeze_events : TEina_Bool);
type
(* Const before type ignored *)
(* Const before type ignored *)
{*< a flag to notify the item is on pushing. This flag is set true at the start of item push.  }
{*< a flag to notify the item is on poping. this flag is set true at the start of item pop.  }
{*< a flag to notify the item is on deletion. this flag is set true at the start of item deletion.  }
  PElm_Naviframe_Item_Data = ^TElm_Naviframe_Item_Data;
  TElm_Naviframe_Item_Data = record
      base : PElm_Widget_Item_Data;
      __in_list : TEina_Inlist;
      content_list : PEina_Inlist;
      text_list : PEina_Inlist;
      content : PEvas_Object;
      title_prev_btn : PEvas_Object;
      title_next_btn : PEvas_Object;
      title_icon : PEvas_Object;
      auto_pushed_btn : PEvas_Object;
      dispmode : TEvas_Display_Mode;
      pop_cb : TElm_Naviframe_Item_Pop_Cb;
      pop_data : pointer;
      title_label : Pchar;
      subtitle_label : Pchar;
      minw : TEvas_Coord;
      minh : TEvas_Coord;
      flag0 : word;
    end;


const
  bm_TElm_Naviframe_Item_Data_title_enabled = $1;
  bp_TElm_Naviframe_Item_Data_title_enabled = 0;
  bm_TElm_Naviframe_Item_Data_pushing = $2;
  bp_TElm_Naviframe_Item_Data_pushing = 1;
  bm_TElm_Naviframe_Item_Data_popping = $4;
  bp_TElm_Naviframe_Item_Data_popping = 2;
  bm_TElm_Naviframe_Item_Data_delete_me = $8;
  bp_TElm_Naviframe_Item_Data_delete_me = 3;

function title_enabled(var a : TElm_Naviframe_Item_Data) : TEina_Bool;
procedure set_title_enabled(var a : TElm_Naviframe_Item_Data; __title_enabled : TEina_Bool);
function pushing(var a : TElm_Naviframe_Item_Data) : TEina_Bool;
procedure set_pushing(var a : TElm_Naviframe_Item_Data; __pushing : TEina_Bool);
function popping(var a : TElm_Naviframe_Item_Data) : TEina_Bool;
procedure set_popping(var a : TElm_Naviframe_Item_Data; __popping : TEina_Bool);
function delete_me(var a : TElm_Naviframe_Item_Data) : TEina_Bool;
procedure set_delete_me(var a : TElm_Naviframe_Item_Data; __delete_me : TEina_Bool);
type
  PElm_Naviframe_Op = ^TElm_Naviframe_Op;
  TElm_Naviframe_Op = record
      self : PElm_Naviframe_Item_Data;
      related : PElm_Naviframe_Item_Data;
      flag0 : word;
    end;


const
  bm_TElm_Naviframe_Op_push = $1;
  bp_TElm_Naviframe_Op_push = 0;

function push(var a : TElm_Naviframe_Op) : TEina_Bool;
procedure set_push(var a : TElm_Naviframe_Op; __push : TEina_Bool);
type
(* Const before type ignored *)
  PElm_Naviframe_Content_Item_Pair = ^TElm_Naviframe_Content_Item_Pair;
  TElm_Naviframe_Content_Item_Pair = record
      __in_list : TEina_Inlist;
      part : Pchar;
      content : PEvas_Object;
      it : PElm_Naviframe_Item_Data;
    end;

(* Const before type ignored *)
  PElm_Naviframe_Text_Item_Pair = ^TElm_Naviframe_Text_Item_Pair;
  TElm_Naviframe_Text_Item_Pair = record
      __in_list : TEina_Inlist;
      part : Pchar;
    end;

{*
 * @
  }

implementation

function preserve(var a : TElm_Naviframe_Data) : TEina_Bool;
begin
  preserve:=(a.flag0 and bm_TElm_Naviframe_Data_preserve) shr bp_TElm_Naviframe_Data_preserve;
end;

procedure set_preserve(var a : TElm_Naviframe_Data; __preserve : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__preserve shl bp_TElm_Naviframe_Data_preserve) and bm_TElm_Naviframe_Data_preserve);
end;

function on_deletion(var a : TElm_Naviframe_Data) : TEina_Bool;
begin
  on_deletion:=(a.flag0 and bm_TElm_Naviframe_Data_on_deletion) shr bp_TElm_Naviframe_Data_on_deletion;
end;

procedure set_on_deletion(var a : TElm_Naviframe_Data; __on_deletion : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__on_deletion shl bp_TElm_Naviframe_Data_on_deletion) and bm_TElm_Naviframe_Data_on_deletion);
end;

function auto_pushed(var a : TElm_Naviframe_Data) : TEina_Bool;
begin
  auto_pushed:=(a.flag0 and bm_TElm_Naviframe_Data_auto_pushed) shr bp_TElm_Naviframe_Data_auto_pushed;
end;

procedure set_auto_pushed(var a : TElm_Naviframe_Data; __auto_pushed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__auto_pushed shl bp_TElm_Naviframe_Data_auto_pushed) and bm_TElm_Naviframe_Data_auto_pushed);
end;

function freeze_events(var a : TElm_Naviframe_Data) : TEina_Bool;
begin
  freeze_events:=(a.flag0 and bm_TElm_Naviframe_Data_freeze_events) shr bp_TElm_Naviframe_Data_freeze_events;
end;

procedure set_freeze_events(var a : TElm_Naviframe_Data; __freeze_events : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__freeze_events shl bp_TElm_Naviframe_Data_freeze_events) and bm_TElm_Naviframe_Data_freeze_events);
end;

function title_enabled(var a : TElm_Naviframe_Item_Data) : TEina_Bool;
begin
  title_enabled:=(a.flag0 and bm_TElm_Naviframe_Item_Data_title_enabled) shr bp_TElm_Naviframe_Item_Data_title_enabled;
end;

procedure set_title_enabled(var a : TElm_Naviframe_Item_Data; __title_enabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__title_enabled shl bp_TElm_Naviframe_Item_Data_title_enabled) and bm_TElm_Naviframe_Item_Data_title_enabled);
end;

function pushing(var a : TElm_Naviframe_Item_Data) : TEina_Bool;
begin
  pushing:=(a.flag0 and bm_TElm_Naviframe_Item_Data_pushing) shr bp_TElm_Naviframe_Item_Data_pushing;
end;

procedure set_pushing(var a : TElm_Naviframe_Item_Data; __pushing : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__pushing shl bp_TElm_Naviframe_Item_Data_pushing) and bm_TElm_Naviframe_Item_Data_pushing);
end;

function popping(var a : TElm_Naviframe_Item_Data) : TEina_Bool;
begin
  popping:=(a.flag0 and bm_TElm_Naviframe_Item_Data_popping) shr bp_TElm_Naviframe_Item_Data_popping;
end;

procedure set_popping(var a : TElm_Naviframe_Item_Data; __popping : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__popping shl bp_TElm_Naviframe_Item_Data_popping) and bm_TElm_Naviframe_Item_Data_popping);
end;

function delete_me(var a : TElm_Naviframe_Item_Data) : TEina_Bool;
begin
  delete_me:=(a.flag0 and bm_TElm_Naviframe_Item_Data_delete_me) shr bp_TElm_Naviframe_Item_Data_delete_me;
end;

procedure set_delete_me(var a : TElm_Naviframe_Item_Data; __delete_me : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__delete_me shl bp_TElm_Naviframe_Item_Data_delete_me) and bm_TElm_Naviframe_Item_Data_delete_me);
end;

function push(var a : TElm_Naviframe_Op) : TEina_Bool;
begin
  push:=(a.flag0 and bm_TElm_Naviframe_Op_push) shr bp_TElm_Naviframe_Op_push;
end;

procedure set_push(var a : TElm_Naviframe_Op; __push : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__push shl bp_TElm_Naviframe_Op_push) and bm_TElm_Naviframe_Op_push);
end;


end.
