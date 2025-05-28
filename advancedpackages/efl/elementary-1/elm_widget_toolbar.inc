{$IFDEF read_interface}


type
  PElm_Toolbar_Item_Data = ^TElm_Toolbar_Item_Data;

  TElm_Toolbar_Data = bitpacked record
    hit_rect: PEvas_Object;
    bx: PEvas_Object;
    more: PEvas_Object;
    bx_more: PEvas_Object;
    bx_more2: PEvas_Object;
    menu_parent: PEvas_Object;
    items: PEina_Inlist;
    more_item: PElm_Toolbar_Item_Data;
    selected_item: PElm_Object_Item;
    focused_item: PElm_Object_Item;
    last_focused_item: PElm_Object_Item;
    reorder_empty: PElm_Toolbar_Item_Data;
    reorder_item: PElm_Toolbar_Item_Data;
    shrink_mode: TElm_Toolbar_Shrink_Mode;
    theme_icon_size: longint;
    priv_icon_size: longint;
    icon_size: longint;
    standard_priority: longint;
    minw_bx: longint;
    minh_bx: longint;
    item_count: dword;
    separator_count: dword;
    align: double;
    select_mode: TElm_Object_Select_Mode;
    long_timer: PEcore_Timer;
    resize_job: PEcore_Job;
    dir: TEfl_Ui_Layout_Orientation;
    long_press: 0..1;
    homogeneous: 0..1;
    delete_me: 0..1;
    reorder_mode: 0..1;
    transverse_expanded: 0..1;
    mouse_down: 0..1;
  end;
  PElm_Toolbar_Data = ^TElm_Toolbar_Data;

  TElm_Toolbar_Item_Data = bitpacked record
    base: PElm_Widget_Item_Data;
    __in_list: TEina_Inlist;
    _label: pchar;
    icon_str: pchar;
    icon: PEvas_Object;
    obj: PEvas_Object;
    o_menu: PEvas_Object;
    in_box: PEvas_Object;
    proxy: PEvas_Object;
    func: TEvas_Smart_Cb;
    trans: PElm_Transit;
    reorder_to: PElm_Toolbar_Item_Data;
    prio: bitpacked record
      priority: longint;
      visible: 0..1;
    end;
    states: PEina_List;
    current_state: PEina_List;
    separator: 0..1;
    selected: 0..1;
    menu: 0..1;
    on_move: 0..1;
  end;


  // === Konventiert am: 26-5-25 17:07:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
