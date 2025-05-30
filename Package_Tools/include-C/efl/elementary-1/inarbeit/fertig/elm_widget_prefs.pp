
unit elm_widget_prefs;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_prefs.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_prefs.h
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
PEcore_Poller  = ^Ecore_Poller;
PEina_Hash  = ^Eina_Hash;
PEina_List  = ^Eina_List;
PElm_Prefs_Data  = ^Elm_Prefs_Data;
PElm_Prefs_Item_Iface  = ^Elm_Prefs_Item_Iface;
PElm_Prefs_Item_Node  = ^Elm_Prefs_Item_Node;
PElm_Prefs_Page_Iface  = ^Elm_Prefs_Page_Iface;
PElm_Prefs_Page_Node  = ^Elm_Prefs_Page_Node;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_PREFS_H}
{$define ELM_WIDGET_PREFS_H}
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
 * @section elm-prefs-class The Elementary Prefs Class
 *
 * Elementary, besides having the @ref Prefs widget, exposes its
 * foundation -- the Elementary Prefs Class -- in order to create
 * other widgets which are a prefs with some more logic on top.
  }
{ not to be serialized  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  PElm_Prefs_Page_Node = ^TElm_Prefs_Page_Node;
  TElm_Prefs_Page_Node = record
      version : dword;
      prefs : PEvas_Object;
      parent : PEvas_Object;
      w_obj : PEvas_Object;
      w_impl : PElm_Prefs_Page_Iface;
      name : Pchar;
      title : Pchar;
      sub_title : Pchar;
      widget : Pchar;
      style : Pchar;
      icon : Pchar;
      items : PEina_List;
      autosave : TEina_Bool;
    end;
{ not to be serialized  }
{ page item type only  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  PElm_Prefs_Item_Node = ^TElm_Prefs_Item_Node;
  TElm_Prefs_Item_Node = record
      _type : TElm_Prefs_Item_Type;
      prefs : PEvas_Object;
      page : PElm_Prefs_Page_Node;
      subpage : PElm_Prefs_Page_Node;
      w_obj : PEvas_Object;
      w_impl : PElm_Prefs_Item_Iface;
      available : TEina_Bool;
      name : Pchar;
      _label : Pchar;
      icon : Pchar;
      style : Pchar;
      widget : Pchar;
      spec : TElm_Prefs_Item_Spec;
      persistent : TEina_Bool;
      editable : TEina_Bool;
      visible : TEina_Bool;
    end;
{*
 * Base widget smart data extended with prefs instance data.
  }
(* Const before type ignored *)
(* Const before type ignored *)
  PElm_Prefs_Data = ^TElm_Prefs_Data;
  TElm_Prefs_Data = record
      root : PElm_Prefs_Page_Node;
      prefs_data : PElm_Prefs_Data;
      file : Pchar;
      page : Pchar;
      saving_poller : PEcore_Poller;
      flag0 : word;
    end;


const
  bm_TElm_Prefs_Data_changing_from_ui = $1;
  bp_TElm_Prefs_Data_changing_from_ui = 0;
  bm_TElm_Prefs_Data_values_fetching = $2;
  bp_TElm_Prefs_Data_values_fetching = 1;
  bm_TElm_Prefs_Data_delete_me = $4;
  bp_TElm_Prefs_Data_delete_me = 2;
  bm_TElm_Prefs_Data_autosave = $8;
  bp_TElm_Prefs_Data_autosave = 3;
  bm_TElm_Prefs_Data_dirty = $10;
  bp_TElm_Prefs_Data_dirty = 4;

function changing_from_ui(var a : TElm_Prefs_Data) : TEina_Bool;
procedure set_changing_from_ui(var a : TElm_Prefs_Data; __changing_from_ui : TEina_Bool);
function values_fetching(var a : TElm_Prefs_Data) : TEina_Bool;
procedure set_values_fetching(var a : TElm_Prefs_Data; __values_fetching : TEina_Bool);
function delete_me(var a : TElm_Prefs_Data) : TEina_Bool;
procedure set_delete_me(var a : TElm_Prefs_Data; __delete_me : TEina_Bool);
function autosave(var a : TElm_Prefs_Data) : TEina_Bool;
procedure set_autosave(var a : TElm_Prefs_Data; __autosave : TEina_Bool);
function dirty(var a : TElm_Prefs_Data) : TEina_Bool;
procedure set_dirty(var a : TElm_Prefs_Data; __dirty : TEina_Bool);
{*
 * @
  }
(* Const before type ignored *)
  var
    elm_prefs_item_widgets_map : PEina_Hash;cvar;external;
(* Const before type ignored *)
    elm_prefs_item_type_widgets_map : PEina_Hash;cvar;external;
(* Const before type ignored *)
    elm_prefs_item_default_widget : PElm_Prefs_Item_Iface;cvar;external;

implementation

function changing_from_ui(var a : TElm_Prefs_Data) : TEina_Bool;
begin
  changing_from_ui:=(a.flag0 and bm_TElm_Prefs_Data_changing_from_ui) shr bp_TElm_Prefs_Data_changing_from_ui;
end;

procedure set_changing_from_ui(var a : TElm_Prefs_Data; __changing_from_ui : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__changing_from_ui shl bp_TElm_Prefs_Data_changing_from_ui) and bm_TElm_Prefs_Data_changing_from_ui);
end;

function values_fetching(var a : TElm_Prefs_Data) : TEina_Bool;
begin
  values_fetching:=(a.flag0 and bm_TElm_Prefs_Data_values_fetching) shr bp_TElm_Prefs_Data_values_fetching;
end;

procedure set_values_fetching(var a : TElm_Prefs_Data; __values_fetching : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__values_fetching shl bp_TElm_Prefs_Data_values_fetching) and bm_TElm_Prefs_Data_values_fetching);
end;

function delete_me(var a : TElm_Prefs_Data) : TEina_Bool;
begin
  delete_me:=(a.flag0 and bm_TElm_Prefs_Data_delete_me) shr bp_TElm_Prefs_Data_delete_me;
end;

procedure set_delete_me(var a : TElm_Prefs_Data; __delete_me : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__delete_me shl bp_TElm_Prefs_Data_delete_me) and bm_TElm_Prefs_Data_delete_me);
end;

function autosave(var a : TElm_Prefs_Data) : TEina_Bool;
begin
  autosave:=(a.flag0 and bm_TElm_Prefs_Data_autosave) shr bp_TElm_Prefs_Data_autosave;
end;

procedure set_autosave(var a : TElm_Prefs_Data; __autosave : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__autosave shl bp_TElm_Prefs_Data_autosave) and bm_TElm_Prefs_Data_autosave);
end;

function dirty(var a : TElm_Prefs_Data) : TEina_Bool;
begin
  dirty:=(a.flag0 and bm_TElm_Prefs_Data_dirty) shr bp_TElm_Prefs_Data_dirty;
end;

procedure set_dirty(var a : TElm_Prefs_Data; __dirty : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__dirty shl bp_TElm_Prefs_Data_dirty) and bm_TElm_Prefs_Data_dirty);
end;


end.
