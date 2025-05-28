unit elm_gen_common;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_general, elm_tooltip, elm_widget, elm_widget_genlist, elm_gen;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TElm_Gen_Item_Tooltip = bitpacked record
    data: pointer;
    content_cb: TElm_Tooltip_Item_Content_Cb;
    del_cb: TEvas_Smart_Cb;
    style: pchar;
    free_size: 0..1;
  end;
  PElm_Gen_Item_Tooltip = ^TElm_Gen_Item_Tooltip;

type
  TElm_Gen_Item = bitpacked record
    base: PElm_Widget_Item_Data;
    __in_list: TEina_Inlist;
    item: PElm_Gen_Item_Type;
    itc: PElm_Gen_Item_Class;
    x: TEvas_Coord;
    y: TEvas_Coord;
    dx: TEvas_Coord;
    dy: TEvas_Coord;
    spacer: PEvas_Object;
    deco_all_view: PEvas_Object;
    parent: PElm_Gen_Item;
    texts: PEina_List;
    contents: PEina_List;
    states: PEina_List;
    content_objs: PEina_List;
    long_timer: PEcore_Timer;
    generation: longint;
    mouse_cursor: pchar;
    item_focus_chain: PEina_List;
    func: record
      func: TEvas_Smart_Cb;
      data: pointer;
      end;
    tooltip: TElm_Gen_Item_Tooltip;
    del_cb: TEcore_Cb;
    unrealize_cb: TEcore_Cb;
    sel_cb: TEcore_Cb;
    unsel_cb: TEcore_Cb;
    highlight_cb: TEcore_Cb;
    unhighlight_cb: TEcore_Cb;
    position: longint;
    select_mode: TElm_Object_Select_Mode;
    position_update: 0..1;
    want_unrealize: 0..1;
    realized: 0..1;
    selected: 0..1;
    highlighted: 0..1;
    dragging: 0..1;
    down: 0..1;
    group: 0..1;
    reorder: 0..1;
    decorate_it_set: 0..1;
    flipped: 0..1;
    has_contents: 0..1;
    cursor_engine_only: 0..1;
    hide: 0..1;
    filtered: 0..1;
    callbacks: 0..1;
  end;
  PElm_Gen_Item = ^TElm_Gen_Item;

  // === Konventiert am: 26-5-25 19:23:14 ===


implementation


end.
