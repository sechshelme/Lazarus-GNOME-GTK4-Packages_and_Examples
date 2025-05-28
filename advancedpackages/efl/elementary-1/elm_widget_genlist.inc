{$IFDEF read_interface}

const
  SWIPE_MOVES = 12;

type
  PElm_Genlist_Item_Move_Effect_Mode = ^TElm_Genlist_Item_Move_Effect_Mode;
  TElm_Genlist_Item_Move_Effect_Mode = longint;

const
  ELM_GENLIST_TREE_EFFECT_NONE = 0;
  ELM_GENLIST_TREE_EFFECT_EXPAND = 1;
  ELM_GENLIST_TREE_EFFECT_CONTRACT = 2;

type
  TElm_Genlist_Data = bitpacked record
    state: PEina_Inlist_Sorted_State;
    hit_rect: PEvas_Object;
    pan_obj: PEvas_Object;
    stack: array[0..1] of PEvas_Object;
    obj: PEvas_Object;
    selected: PEina_List;
    deselecting: PEina_List;
    group_items: PEina_List;
    items: PEina_Inlist;
    reorder_it: PElm_Gen_Item;
    last_selected_item: PElm_Object_Item;
    focused_item: PElm_Object_Item;
    last_focused_item: PElm_Object_Item;
    walking: longint;
    minw: longint;
    minh: longint;
    item_count: dword;
    pan_x: TEvas_Coord;
    pan_y: TEvas_Coord;
    select_mode: TElm_Object_Select_Mode;
    multi_select_mode: TElm_Object_Multi_Select_Mode;
    blocks: PEina_Inlist;
    reorder_old_pan_y: TEvas_Coord;
    w: TEvas_Coord;
    h: TEvas_Coord;
    realminw: TEvas_Coord;
    prev_viewport_w: TEvas_Coord;
    update_job: PEcore_Job;
    queue_idle_enterer: PEcore_Idle_Enterer;
    must_recalc_idler: PEcore_Idler;
    queue: PEina_List;
    show_item: PElm_Gen_Item;
    anchor_item: PElm_Gen_Item;
    mode_item: PElm_Gen_Item;
    reorder_rel: PElm_Gen_Item;
    expanded_item: PElm_Gen_Item;
    pin_item: PElm_Gen_Item;
    item_cache: PEina_Inlist;
    anchor_y: TEvas_Coord;
    reorder_start_y: TEvas_Coord;
    mode: TElm_List_Mode;
    multi_timer: PEcore_Timer;
    scr_hold_timer: PEcore_Timer;
    reorder_move_animator: PEcore_Animator;
    decorate_it_type: pchar;
    start_time: double;
    prev_x: TEvas_Coord;
    prev_y: TEvas_Coord;
    prev_mx: TEvas_Coord;
    prev_my: TEvas_Coord;
    cur_x: TEvas_Coord;
    cur_y: TEvas_Coord;
    cur_mx: TEvas_Coord;
    cur_my: TEvas_Coord;
    history: array[0..(SWIPE_MOVES) - 1] of record
      x: TEvas_Coord;
      y: TEvas_Coord;
      end;
    multi_device: longint;
    item_cache_count: longint;
    item_cache_max: longint;
    movements: longint;
    max_items_per_block: longint;
    longpress_timeout: double;
    item_compare_cb: TEina_Compare_Cb;
    item_compare_data_cb: TEina_Compare_Cb;
    scroll_to_type: TElm_Genlist_Item_Scrollto_Type;
    event_block_rect: PEvas_Object;
    move_items: PEina_List;
    expanded_next_item: PElm_Gen_Item;
    move_effect_mode: TElm_Genlist_Item_Move_Effect_Mode;
    reorder_fast: longint;
    filter_queue: PEina_List;
    filtered_list: PEina_List;
    filter_data: pointer;
    processed_count: dword;
    filtered_count: dword;
    top_level_parent_items: dword;
    queue_filter_enterer: PEcore_Idle_Enterer;
    size_caches: PEina_Hash;
    content_item_map: PEina_Hash;
    provider: PEo;
    focus_on_realization: PElm_Gen_Item;
    scr_minw: 0..1;
    scr_minh: 0..1;
    filter: 0..1;
    focus_on_selection_enabled: 0..1;
    tree_effect_enabled: 0..1;
    auto_scroll_enabled: 0..1;
    decorate_all_mode: 0..1;
    height_for_width: 0..1;
    reorder_pan_move: 0..1;
    multi_timeout: 0..1;
    multi_touched: 0..1;
    reorder_mode: 0..1;
    check_scroll: 0..1;
    pan_changed: 0..1;
    wasselected: 0..1;
    homogeneous: 0..1;
    longpressed: 0..1;
    mouse_down: 0..1;
    multi_down: 0..1;
    on_sub_del: 0..1;
    highlight: 0..1;
    h_bounce: 0..1;
    v_bounce: 0..1;
    bring_in: 0..1;
    requeued: 0..1;
    on_hold: 0..1;
    multi: 0..1;
    swipe: 0..1;
    item_loop_enable: 0..1;
    item_looping_on: 0..1;
    tree_effect_animator: 0..1;
    pin_item_top: 0..1;
    need_calc: 0..1;
  end;
  PElm_Genlist_Data = ^TElm_Genlist_Data;

type
  PItem_Block = ^TItem_Block;

  TElm_Gen_Item_Type = record
  end;
  PElm_Gen_Item_Type = ^TElm_Gen_Item_Type;

  TItem_Block = bitpacked record
    __in_list: TEina_Inlist;
    count: longint;
    vis_count: longint;
    num: longint;
    reorder_offset: longint;
    sd: PElm_Genlist_Data;
    items: PEina_List;
    x: TEvas_Coord;
    y: TEvas_Coord;
    w: TEvas_Coord;
    h: TEvas_Coord;
    minw: TEvas_Coord;
    minh: TEvas_Coord;
    position: longint;
    item_position_stamp: longint;
    adapter: PEo;
    position_update: 0..1;
    want_unrealize: 0..1;
    must_recalc: 0..1;
    realized: 0..1;
    updateme: 0..1;
    changed: 0..1;
    show_me: 0..1;
  end;

type
  TItem_Cache = record
  end;
  PItem_Cache = ^TItem_Cache;

type
  TItem_Size = record
    itc: PElm_Genlist_Item_Class;
    minw: TEvas_Coord;
    minh: TEvas_Coord;
    expanded_depth: longint;
  end;
  PItem_Size = ^TItem_Size;

  TElm_Genlist_Pan_Data = record
    wobj: PEvas_Object;
    wsd: PElm_Genlist_Data;
    resize_job: PEcore_Job;
  end;
  PElm_Genlist_Pan_Data = ^TElm_Genlist_Pan_Data;

  TElm_Genlist_Filter = record
    iterator: TEina_Iterator;
    head: PEina_Inlist;
    current: PEina_Inlist;
    obj: PEvas_Object;
  end;
  PElm_Genlist_Filter = ^TElm_Genlist_Filter;


  // === Konventiert am: 26-5-25 17:32:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
