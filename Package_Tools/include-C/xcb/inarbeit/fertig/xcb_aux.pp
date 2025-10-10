
unit xcb_aux;
interface

{
  Automatically converted by H2Pas 1.0.0 from xcb_aux.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xcb_aux.h
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
Puint16_t  = ^uint16_t;
Pxcb_connection_t  = ^xcb_connection_t;
Pxcb_params_configure_window_t  = ^xcb_params_configure_window_t;
Pxcb_params_cw_t  = ^xcb_params_cw_t;
Pxcb_params_gc_t  = ^xcb_params_gc_t;
Pxcb_params_keyboard_t  = ^xcb_params_keyboard_t;
Pxcb_screen_t  = ^xcb_screen_t;
Pxcb_visualtype_t  = ^xcb_visualtype_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef __XCB_AUX_H__}
{$define __XCB_AUX_H__}
{ C++ extern C conditionnal removed }

function xcb_aux_get_depth(c:Pxcb_connection_t; screen:Pxcb_screen_t):Tuint8_t;cdecl;external;
function xcb_aux_get_depth_of_visual(screen:Pxcb_screen_t; id:Txcb_visualid_t):Tuint8_t;cdecl;external;
function xcb_aux_get_screen(c:Pxcb_connection_t; screen:longint):Pxcb_screen_t;cdecl;external;
function xcb_aux_get_visualtype(c:Pxcb_connection_t; screen:longint; vid:Txcb_visualid_t):Pxcb_visualtype_t;cdecl;external;
function xcb_aux_find_visual_by_id(screen:Pxcb_screen_t; id:Txcb_visualid_t):Pxcb_visualtype_t;cdecl;external;
function xcb_aux_find_visual_by_attrs(screen:Pxcb_screen_t; class_:Tint8_t; depth:Tint8_t):Pxcb_visualtype_t;cdecl;external;
procedure xcb_aux_sync(c:Pxcb_connection_t);cdecl;external;
{ internal helper macro for XCB_AUX_ADD_PARAM
It gives the offset of the field 'param' in the structure pointed to by
'paramsp' in multiples of an uint32_t's size.  }
{ add an optional parameter to an xcb_params_* structure
parameters:
    maskp: pointer to bitmask whos bits mark used parameters
    paramsp: pointer to structure with parameters
    param: parameter to set
    value: value to set the parameter to
 }
type
  Pxcb_params_cw_t = ^Txcb_params_cw_t;
  Txcb_params_cw_t = record
      back_pixmap : Tuint32_t;
      back_pixel : Tuint32_t;
      border_pixmap : Tuint32_t;
      border_pixel : Tuint32_t;
      bit_gravity : Tuint32_t;
      win_gravity : Tuint32_t;
      backing_store : Tuint32_t;
      backing_planes : Tuint32_t;
      backing_pixel : Tuint32_t;
      override_redirect : Tuint32_t;
      save_under : Tuint32_t;
      event_mask : Tuint32_t;
      dont_propagate : Tuint32_t;
      colormap : Tuint32_t;
      cursor : Tuint32_t;
    end;
(* Const before type ignored *)

function xcb_aux_create_window(c:Pxcb_connection_t; depth:Tuint8_t; wid:Txcb_window_t; parent:Txcb_window_t; x:Tint16_t; 
           y:Tint16_t; width:Tuint16_t; height:Tuint16_t; border_width:Tuint16_t; class_:Tuint16_t; 
           visual:Txcb_visualid_t; mask:Tuint32_t; params:Pxcb_params_cw_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_aux_create_window_checked(c:Pxcb_connection_t; depth:Tuint8_t; wid:Txcb_window_t; parent:Txcb_window_t; x:Tint16_t; 
           y:Tint16_t; width:Tuint16_t; height:Tuint16_t; border_width:Tuint16_t; class_:Tuint16_t; 
           visual:Txcb_visualid_t; mask:Tuint32_t; params:Pxcb_params_cw_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_aux_change_window_attributes(c:Pxcb_connection_t; window:Txcb_window_t; mask:Tuint32_t; params:Pxcb_params_cw_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_aux_change_window_attributes_checked(c:Pxcb_connection_t; window:Txcb_window_t; mask:Tuint32_t; params:Pxcb_params_cw_t):Txcb_void_cookie_t;cdecl;external;
type
  Pxcb_params_configure_window_t = ^Txcb_params_configure_window_t;
  Txcb_params_configure_window_t = record
      x : Tint32_t;
      y : Tint32_t;
      width : Tuint32_t;
      height : Tuint32_t;
      border_width : Tuint32_t;
      sibling : Tuint32_t;
      stack_mode : Tuint32_t;
    end;
(* Const before type ignored *)

function xcb_aux_configure_window(c:Pxcb_connection_t; window:Txcb_window_t; mask:Tuint16_t; params:Pxcb_params_configure_window_t):Txcb_void_cookie_t;cdecl;external;
type
  Pxcb_params_gc_t = ^Txcb_params_gc_t;
  Txcb_params_gc_t = record
      _function : Tuint32_t;
      plane_mask : Tuint32_t;
      foreground : Tuint32_t;
      background : Tuint32_t;
      line_width : Tuint32_t;
      line_style : Tuint32_t;
      cap_style : Tuint32_t;
      join_style : Tuint32_t;
      fill_style : Tuint32_t;
      fill_rule : Tuint32_t;
      tile : Tuint32_t;
      stipple : Tuint32_t;
      tile_stipple_origin_x : Tuint32_t;
      tile_stipple_origin_y : Tuint32_t;
      font : Tuint32_t;
      subwindow_mode : Tuint32_t;
      graphics_exposures : Tuint32_t;
      clip_originX : Tuint32_t;
      clip_originY : Tuint32_t;
      mask : Tuint32_t;
      dash_offset : Tuint32_t;
      dash_list : Tuint32_t;
      arc_mode : Tuint32_t;
    end;
(* Const before type ignored *)

function xcb_aux_create_gc(c:Pxcb_connection_t; cid:Txcb_gcontext_t; drawable:Txcb_drawable_t; mask:Tuint32_t; params:Pxcb_params_gc_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_aux_create_gc_checked(c:Pxcb_connection_t; gid:Txcb_gcontext_t; drawable:Txcb_drawable_t; mask:Tuint32_t; params:Pxcb_params_gc_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_aux_change_gc(c:Pxcb_connection_t; gc:Txcb_gcontext_t; mask:Tuint32_t; params:Pxcb_params_gc_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_aux_change_gc_checked(c:Pxcb_connection_t; gc:Txcb_gcontext_t; mask:Tuint32_t; params:Pxcb_params_gc_t):Txcb_void_cookie_t;cdecl;external;
type
  Pxcb_params_keyboard_t = ^Txcb_params_keyboard_t;
  Txcb_params_keyboard_t = record
      key_click_percent : Tuint32_t;
      bell_percent : Tuint32_t;
      bell_pitch : Tuint32_t;
      bell_duration : Tuint32_t;
      led : Tuint32_t;
      led_mode : Tuint32_t;
      key : Tuint32_t;
      auto_repeat_mode : Tuint32_t;
    end;
(* Const before type ignored *)

function xcb_aux_change_keyboard_control(c:Pxcb_connection_t; mask:Tuint32_t; params:Pxcb_params_keyboard_t):Txcb_void_cookie_t;cdecl;external;
(* Const before type ignored *)
function xcb_aux_parse_color(color_name:Pchar; red:Puint16_t; green:Puint16_t; blue:Puint16_t):longint;cdecl;external;
function xcb_aux_set_line_attributes_checked(dpy:Pxcb_connection_t; gc:Txcb_gcontext_t; linewidth:Tuint16_t; linestyle:Tint32_t; capstyle:Tint32_t; 
           joinstyle:Tint32_t):Txcb_void_cookie_t;cdecl;external;
function xcb_aux_clear_window(dpy:Pxcb_connection_t; w:Txcb_window_t):Txcb_void_cookie_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ __XCB_AUX_H__  }

implementation


end.
