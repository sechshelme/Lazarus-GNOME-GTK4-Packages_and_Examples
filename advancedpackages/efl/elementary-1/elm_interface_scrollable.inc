{$IFDEF read_interface}


type
  TElm_Pan_Smart_Data = record
    self: PEvas_Object;
    content: PEvas_Object;
    interface_object: PEvas_Object;
    x: TEvas_Coord;
    y: TEvas_Coord;
    w: TEvas_Coord;
    h: TEvas_Coord;
    content_w: TEvas_Coord;
    content_h: TEvas_Coord;
    px: TEvas_Coord;
    py: TEvas_Coord;
  end;
  PElm_Pan_Smart_Data = ^TElm_Pan_Smart_Data;

  TElm_Interface_Scrollable_Cb = procedure(para1: PEvas_Object; data: pointer); cdecl;
  TElm_Interface_Scrollable_Min_Limit_Cb = procedure(obj: PEvas_Object; w: TEina_Bool; h: TEina_Bool); cdecl;
  TElm_Interface_Scrollable_Resize_Cb = procedure(obj: PEvas_Object; w: TEvas_Coord; h: TEvas_Coord); cdecl;

type
  TElm_Scrollable_Smart_Interface_Data = bitpacked record
    x: TEvas_Coord;
    y: TEvas_Coord;
    w: TEvas_Coord;
    h: TEvas_Coord;
    wx: TEvas_Coord;
    wy: TEvas_Coord;
    ww: TEvas_Coord;
    wh: TEvas_Coord;
    obj: PEvas_Object;
    content: PEvas_Object;
    pan_obj: PEvas_Object;
    edje_obj: PEvas_Object;
    event_rect: PEvas_Object;
    parent_widget: PEvas_Object;
    hbar_flags: TElm_Scroller_Policy;
    vbar_flags: TElm_Scroller_Policy;
    one_direction_at_a_time: TElm_Scroller_Single_Direction;
    block: TEfl_Ui_Layout_Orientation;
    down: bitpacked record
      x: TEvas_Coord;
      y: TEvas_Coord;
      sx: TEvas_Coord;
      sy: TEvas_Coord;
      dx: TEvas_Coord;
      dy: TEvas_Coord;
      pdx: TEvas_Coord;
      pdy: TEvas_Coord;
      bx: TEvas_Coord;
      by: TEvas_Coord;
      ax: TEvas_Coord;
      ay: TEvas_Coord;
      bx0: TEvas_Coord;
      by0: TEvas_Coord;
      b0x: TEvas_Coord;
      b0y: TEvas_Coord;
      b2x: TEvas_Coord;
      b2y: TEvas_Coord;
      history: array[0..59] of record
        x: TEvas_Coord;
        y: TEvas_Coord;
        timestamp: double;
      end;
      est_timestamp_diff: double;
      dragged_began_timestamp: double;
      anim_start: double;
      anim_start2: double;
      anim_start3: double;
      anim_dur: double;
      onhold_vx: double;
      onhold_vy: double;
      onhold_tlast: double;
      onhold_vxe: double;
      onhold_vye: double;
      last_time_x_wheel: double;
      last_time_y_wheel: double;
      hold_x: TEvas_Coord;
      hold_y: TEvas_Coord;
      locked_x: TEvas_Coord;
      locked_y: TEvas_Coord;
      hdir: longint;
      vdir: longint;
      hold_enterer: PEcore_Idle_Enterer;
      hold_animator: 0..1;
      onhold_animator: 0..1;
      momentum_animator: 0..1;
      bounce_x_animator: 0..1;
      bounce_y_animator: 0..1;
      last_hold_x_wheel: 0..1;
      last_hold_y_wheel: 0..1;
      bounce_x_hold: 0..1;
      bounce_y_hold: 0..1;
      dragged_began: 0..1;
      want_dragged: 0..1;
      hold_parent: 0..1;
      want_reset: 0..1;
      cancelled: 0..1;
      dragged: 0..1;
      locked: 0..1;
      scroll: 0..1;
      dir_x: 0..1;
      dir_y: 0..1;
      hold: 0..1;
      now: 0..1;
    end;
    content_info: record
      w: TEvas_Coord;
      h: TEvas_Coord;
      flag0: word;
    end;
    step: record
      x: TEvas_Coord;
      y: TEvas_Coord;
    end;
    page: record
      x: TEvas_Coord;
      y: TEvas_Coord;
    end;
    current_page: record
      x: TEvas_Coord;
      y: TEvas_Coord;
    end;
    cb_func: record
      drag_start: TElm_Interface_Scrollable_Cb;
      drag_stop: TElm_Interface_Scrollable_Cb;
      animate_start: TElm_Interface_Scrollable_Cb;
      animate_stop: TElm_Interface_Scrollable_Cb;
      scroll: TElm_Interface_Scrollable_Cb;
      scroll_left: TElm_Interface_Scrollable_Cb;
      scroll_right: TElm_Interface_Scrollable_Cb;
      scroll_up: TElm_Interface_Scrollable_Cb;
      scroll_down: TElm_Interface_Scrollable_Cb;
      edge_left: TElm_Interface_Scrollable_Cb;
      edge_right: TElm_Interface_Scrollable_Cb;
      edge_top: TElm_Interface_Scrollable_Cb;
      edge_bottom: TElm_Interface_Scrollable_Cb;
      vbar_drag: TElm_Interface_Scrollable_Cb;
      vbar_press: TElm_Interface_Scrollable_Cb;
      vbar_unpress: TElm_Interface_Scrollable_Cb;
      hbar_drag: TElm_Interface_Scrollable_Cb;
      hbar_press: TElm_Interface_Scrollable_Cb;
      hbar_unpress: TElm_Interface_Scrollable_Cb;
      page_change: TElm_Interface_Scrollable_Cb;
      content_min_limit: TElm_Interface_Scrollable_Min_Limit_Cb;
      content_viewport_resize: TElm_Interface_Scrollable_Resize_Cb;
    end;
    scrollto: record
      x: record
        start: TEvas_Coord;
        end_: TEvas_Coord;
        t_start: double;
        t_end: double;
        animator: TEina_Bool;
      end;
      y: record
        start: TEvas_Coord;
        end_: TEvas_Coord;
        t_start: double;
        t_end: double;
        animator: TEina_Bool;
      end;
    end;
    pagerel_h: double;
    pagerel_v: double;
    pagesize_h: TEvas_Coord;
    pagesize_v: TEvas_Coord;
    page_limit_h: longint;
    page_limit_v: longint;
    current_calc: longint;
    last_wheel_mul: double;
    last_wheel: dword;
    size_adjust_recurse: byte;
    size_count: byte;
    event_info: pointer;
    gravity_x: double;
    gravity_y: double;
    prev_cw: TEvas_Coord;
    prev_ch: TEvas_Coord;

    size_adjust_recurse_abort: 0..1;
    momentum_animator_disabled: 0..1;
    bounce_animator_disabled: 0..1;
    page_snap_horiz: 0..1;
    page_snap_vert: 0..1;
    wheel_disabled: 0..1;
    hbar_visible: 0..1;
    vbar_visible: 0..1;
    bounce_horiz: 0..1;
    bounce_vert: 0..1;
    is_mirrored: 0..1;
    extern_pan: 0..1;
    bouncemey: 0..1;
    bouncemex: 0..1;
    freeze: 0..1;
    freeze_want: 0..1;
    hold: 0..1;
    min_w: 0..1;
    min_h: 0..1;
    go_left: 0..1;
    go_right: 0..1;
    go_up: 0..1;
    go_down: 0..1;
    loop_h: 0..1;
    loop_v: 0..1;
    manager: pointer;
  end;
  PElm_Scrollable_Smart_Interface_Data = ^TElm_Scrollable_Smart_Interface_Data;


{$ifdef EFL_BETA_API_SUPPORT}
procedure elm_pan_gravity_set(para1: PElm_Pan; x: double; para3: double); cdecl; external libelementary; deprecated;
procedure elm_pan_gravity_get(para1: PElm_Pan; para2: Pdouble; para3: Pdouble); cdecl; external libelementary; deprecated;
{$endif}

// === Konventiert am: 25-5-25 19:56:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
