unit elm_store;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_general, elm_widget_item_eo_legacy, elm_icon_legacy, elm_gen;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Store_Item_Mapping_Type = ^TElm_Store_Item_Mapping_Type;
  TElm_Store_Item_Mapping_Type = longint;

const
  ELM_STORE_ITEM_MAPPING_NONE = 0;
  ELM_STORE_ITEM_MAPPING_LABEL = 1;
  ELM_STORE_ITEM_MAPPING_STATE = 2;
  ELM_STORE_ITEM_MAPPING_ICON = 3;
  ELM_STORE_ITEM_MAPPING_PHOTO = 4;
  ELM_STORE_ITEM_MAPPING_CUSTOM = 5;
  ELM_STORE_ITEM_MAPPING_LAST = 6;

type
  TElm_Store = record
  end;
  PElm_Store = ^TElm_Store;

  TElm_Store_Item = record
  end;
  PElm_Store_Item = ^TElm_Store_Item;

  TElm_Store_Item_Mapping_Icon = bitpacked record
    w: longint;
    h: longint;
    lookup_order: TElm_Icon_Lookup_Order;
    standard_name: 0..1;
    no_scale: 0..1;
    smooth: 0..1;
    scale_up: 0..1;
    scale_down: 0..1;
  end;
  PElm_Store_Item_Mapping_Icon = ^TElm_Store_Item_Mapping_Icon;

type
  TElm_Store_Item_Mapping_Empty = record
    dummy: TEina_Bool;
  end;
  PElm_Store_Item_Mapping_Empty = ^TElm_Store_Item_Mapping_Empty;

  TElm_Store_Item_Mapping_Photo = record
    size: longint;
  end;
  PElm_Store_Item_Mapping_Photo = ^TElm_Store_Item_Mapping_Photo;

  PElm_Store_Item_Mapping = ^TElm_Store_Item_Mapping;

  TElm_Store_Item_Info = record
    item_class: PElm_Genlist_Item_Class;
    mapping: PElm_Store_Item_Mapping;
    data: pointer;
    sort_id: pchar;
  end;
  PElm_Store_Item_Info = ^TElm_Store_Item_Info;

  TElm_Store_Item_Info_Filesystem = record
    base: TElm_Store_Item_Info;
    path: pchar;
  end;
  PElm_Store_Item_Info_Filesystem = ^TElm_Store_Item_Info_Filesystem;

  TElm_Store_Item_List_Cb = function(data: pointer; info: PElm_Store_Item_Info): TEina_Bool; cdecl;
  TElm_Store_Item_Fetch_Cb = procedure(data: pointer; sti: PElm_Store_Item); cdecl;
  TElm_Store_Item_Unfetch_Cb = procedure(data: pointer; sti: PElm_Store_Item); cdecl;
  PElm_Store_Item_Mapping_Cb = ^TElm_Store_Item_Mapping_Cb;
  TElm_Store_Item_Mapping_Cb = function(data: pointer; sti: PElm_Store_Item; part: pchar): pointer; cdecl;

  TElm_Store_Item_Mapping_Custom = record
    func: TElm_Store_Item_Mapping_Cb;
  end;
  PElm_Store_Item_Mapping_Custom = ^TElm_Store_Item_Mapping_Custom;

  TElm_Store_Item_Mapping = record
    _type: TElm_Store_Item_Mapping_Type;
    part: pchar;
    offset: longint;
    details: record
      case longint of
        0: (empty: TElm_Store_Item_Mapping_Empty);
        1: (icon: TElm_Store_Item_Mapping_Icon);
        2: (photo: TElm_Store_Item_Mapping_Photo);
        3: (custom: TElm_Store_Item_Mapping_Custom);
      end;
  end;

function elm_store_filesystem_new: PElm_Store; cdecl; external libelementary;
procedure elm_store_free(st: PElm_Store); cdecl; external libelementary;
procedure elm_store_filesystem_directory_set(st: PElm_Store; dir: pchar); cdecl; external libelementary;
function elm_store_filesystem_directory_get(st: PElm_Store): pchar; cdecl; external libelementary;
function elm_store_item_filesystem_path_get(sti: PElm_Store_Item): pchar; cdecl; external libelementary;
procedure elm_store_target_genlist_set(st: PElm_Store; obj: PEvas_Object); cdecl; external libelementary;
procedure elm_store_cache_set(st: PElm_Store; max: longint); cdecl; external libelementary;
function elm_store_cache_get(st: PElm_Store): longint; cdecl; external libelementary;
procedure elm_store_list_func_set(st: PElm_Store; func: TElm_Store_Item_List_Cb; data: pointer); cdecl; external libelementary;
procedure elm_store_fetch_func_set(st: PElm_Store; func: TElm_Store_Item_Fetch_Cb; data: pointer); cdecl; external libelementary;
procedure elm_store_unfetch_func_set(st: PElm_Store; func: TElm_Store_Item_Unfetch_Cb; data: pointer); cdecl; external libelementary;
procedure elm_store_fetch_thread_set(st: PElm_Store; use_thread: TEina_Bool); cdecl; external libelementary;
function elm_store_fetch_thread_get(st: PElm_Store): TEina_Bool; cdecl; external libelementary;
procedure elm_store_sorted_set(st: PElm_Store; sorted: TEina_Bool); cdecl; external libelementary;
function elm_store_sorted_get(st: PElm_Store): TEina_Bool; cdecl; external libelementary;
procedure elm_store_item_data_set(sti: PElm_Store_Item; data: pointer); cdecl; external libelementary;
function elm_store_item_data_get(sti: PElm_Store_Item): pointer; cdecl; external libelementary;
function elm_store_item_store_get(sti: PElm_Store_Item): PElm_Store; cdecl; external libelementary;
function elm_store_item_genlist_item_get(sti: PElm_Store_Item): PElm_Object_Item; cdecl; external libelementary;

// === Konventiert am: 26-5-25 15:23:33 ===


implementation


end.
