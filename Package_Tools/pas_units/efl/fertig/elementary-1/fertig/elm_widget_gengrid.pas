unit elm_widget_gengrid;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_general, elm_widget_item_eo_legacy, elm_gen, elm_gengrid_eo_legacy;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TElm_Gengrid_Data = bitpacked record
    state: PEina_Inlist_Sorted_State;
    hit_rect: PEvas_Object;
    pan_obj: PEvas_Object;
    obj: PEvas_Object;
    stack: PEvas_Object;
    selected: PEina_List;
    group_items: PEina_List;
    items: PEina_Inlist;
    reorder_it: PElm_Gen_Item;
    last_selected_item: PElm_Object_Item;
    focused_item: PElm_Object_Item;
    last_focused_item: PElm_Object_Item;
    show_it: PElm_Object_Item;
    bring_in_it: PElm_Object_Item;
    scroll_to_type: TElm_Gengrid_Item_Scrollto_Type;
    content_item_map: PEina_Hash;
    provider: PEo;
    focus_on_realization: PElm_Gen_Item;
    calc_job: PEcore_Job;
    walking: longint;
    item_width: longint;
    item_height: longint;
    group_item_width: longint;
    group_item_height: longint;
    minw: longint;
    minh: longint;
    item_count: dword;
    pan_x: TEvas_Coord;
    pan_y: TEvas_Coord;
    select_mode: TElm_Object_Select_Mode;
    multi_select_mode: TElm_Object_Multi_Select_Mode;
    calc_cb: TEcore_Cb;
    clear_cb: TEcore_Cb;
    longpress_timeout: double;
    generation: longint;
    item_compare_cb: TEina_Compare_Cb;
    nmax: dword;
    reorder_item_x: TEvas_Coord;
    reorder_item_y: TEvas_Coord;
    old_pan_x: TEvas_Coord;
    old_pan_y: TEvas_Coord;
    items_lost: longint;
    align_x: double;
    align_y: double;
    reorderbitpacked: record
      it1: PElm_Gen_Item;
      it2: PElm_Gen_Item;
      data: pointer;
      dir: TElm_Focus_Direction;
      tween_mode: TEcore_Pos_Map;
      x1: TEvas_Coord;
      y1: TEvas_Coord;
      x2: TEvas_Coord;
      y2: TEvas_Coord;
      _type: TElm_Gengrid_Reorder_Type;
      running: 0..1;
      end;
    mode: TElm_Focus_Region_Show_Mode;
    reorder_item_changed: 0..1;
    move_effect_enabled: 0..1;
    old_h_bounce: TEina_Bool;
    old_v_bounce: TEina_Bool;
    reorder_mode: 0..1;
    was_selected: 0..1;
    longpressed: 0..1;
    pan_changed: 0..1;
    horizontal: 0..1;
    highlight: 0..1;
    clear_me: 0..1;
    on_hold: 0..1;
    filled: 0..1;
    multi: 0..1;
    show_region: 0..1;
    bring_in: 0..1;
    mouse_down: 0..1;
    item_loop_enable: 0..1;
    item_cache: PEina_Inlist;
    item_cache_count: longint;
    item_cache_max: longint;
    custom_size_mode: 0..1;
    custom_size_sum: Pdword;
    custom_tot_sum: Pdword;
    custom_tot_max: dword;
    custom_alloc_size: dword;
    scr_minw: TEina_Bool;
    scr_minh: TEina_Bool;
    order_dirty: TEina_Bool;
  end;
  PElm_Gengrid_Data = ^TElm_Gengrid_Data;

type
  TElm_Gen_Item_Type = record
    it: PElm_Gen_Item;
    wsd: PElm_Gengrid_Data;
    item_reorder_move_animator: PEcore_Animator;
    gx: TEvas_Coord;
    gy: TEvas_Coord;
    ox: TEvas_Coord;
    oy: TEvas_Coord;
    tx: TEvas_Coord;
    ty: TEvas_Coord;
    rx: TEvas_Coord;
    ry: TEvas_Coord;
    moving_effect_start_time: dword;
    prev_group: longint;
    group_realized: 0..1;
    moving: 0..1;
    nocache_once: 0..1;
    nocache: 0.. 1;
    w: TEvas_Coord;
    h: TEvas_Coord;
    sw: TEvas_Coord;
    sh: TEvas_Coord;
  end;
  PElm_Gen_Item_Type = ^TElm_Gen_Item_Type;

type
  TItem_Cache = record
    __in_list: TEina_Inlist;
    base_view: PEvas_Object;
    spacer: PEvas_Object;
    item_style: pchar;
    contents: PEina_List;
  end;
  PItem_Cache = ^TItem_Cache;

  TElm_Gengrid_Pan_Data = record
    wobj: PEvas_Object;
    wsd: PElm_Gengrid_Data;
    resize_job: PEcore_Job;
  end;
  PElm_Gengrid_Pan_Data = ^TElm_Gengrid_Pan_Data;


  // === Konventiert am: 27-5-25 19:21:13 ===


implementation


end.
