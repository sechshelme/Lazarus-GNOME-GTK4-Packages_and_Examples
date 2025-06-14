
unit Ecore_Fb;
interface

{
  Automatically converted by H2Pas 1.0.0 from Ecore_Fb.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Ecore_Fb.h
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
PEcore_Fb_Input_Device  = ^Ecore_Fb_Input_Device;
PEcore_Fb_Input_Device_Cap  = ^Ecore_Fb_Input_Device_Cap;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_FB_H}
{$define _ECORE_FB_H}
{$include <Eina.h>}
{$ifdef extern}
{$undef extern}
{$endif}
{ FIXME:
 * maybe a new module?
 * - code to get battery info
 * - code to get thermal info
 * ecore evas fb isn't good enough for weird things, like multiple fb's, same happens here.
 * backlight support using new kernel interface
 * absolute axis
 * joystick
 * ecore_fb_li_device_close_all ? or a shutdown of the subsystem?
 *
  }
{ C++ extern C conditionnal removed }
{*
 * @defgroup Ecore_FB_Group Ecore_FB - Frame buffer convenience functions.
 * @ingroup Ecore
 *
 * Functions used to set up and shut down the Ecore_Framebuffer functions.
 *
 * @
  }
{*
 * @typedef Ecore_Fb_Input_Device
 * Input device handler.
  }
type
{*
 * @enum _Ecore_Fb_Input_Device_Cap
 * Device capabilities.
  }
  TEcore_Fb_Input_Device_Cap =  Longint;
  Const
    ECORE_FB_INPUT_DEVICE_CAP_NONE = $00000000;
    ECORE_FB_INPUT_DEVICE_CAP_RELATIVE = $00000001;
    ECORE_FB_INPUT_DEVICE_CAP_ABSOLUTE = $00000002;
    ECORE_FB_INPUT_DEVICE_CAP_KEYS_OR_BUTTONS = $00000004;

{*
 * @typedef Ecore_Fb_Input_Device_Cap
 * Device capabilities.
  }
type
  PEcore_Fb_Input_Device_Cap = ^TEcore_Fb_Input_Device_Cap;
  TEcore_Fb_Input_Device_Cap = TEcore_Fb_Input_Device_Cap;
{ ecore_fb_vt.c  }

procedure ecore_fb_callback_gain_set(func:procedure (data:pointer); data:pointer);cdecl;external;
procedure ecore_fb_callback_lose_set(func:procedure (data:pointer); data:pointer);cdecl;external;
{ ecore_fb_li.c  }
(* Const before type ignored *)
function ecore_fb_input_device_open(dev:Pchar):PEcore_Fb_Input_Device;cdecl;external;
procedure ecore_fb_input_device_close(dev:PEcore_Fb_Input_Device);cdecl;external;
procedure ecore_fb_input_device_listen(dev:PEcore_Fb_Input_Device; listen:TEina_Bool);cdecl;external;
(* Const before type ignored *)
function ecore_fb_input_device_name_get(dev:PEcore_Fb_Input_Device):Pchar;cdecl;external;
function ecore_fb_input_device_cap_get(dev:PEcore_Fb_Input_Device):TEcore_Fb_Input_Device_Cap;cdecl;external;
procedure ecore_fb_input_device_axis_size_set(dev:PEcore_Fb_Input_Device; w:longint; h:longint);cdecl;external;
procedure ecore_fb_input_threshold_click_set(dev:PEcore_Fb_Input_Device; threshold:Tdouble);cdecl;external;
function ecore_fb_input_threshold_click_get(dev:PEcore_Fb_Input_Device):Tdouble;cdecl;external;
procedure ecore_fb_input_device_window_set(dev:PEcore_Fb_Input_Device; window:pointer);cdecl;external;
{ ecore_fb.c  }
(* Const before type ignored *)
function ecore_fb_init(name:Pchar):longint;cdecl;external;
function ecore_fb_shutdown:longint;cdecl;external;
procedure ecore_fb_size_get(w:Plongint; h:Plongint);cdecl;external;
procedure ecore_fb_touch_screen_calibrate_set(xscale:longint; xtrans:longint; yscale:longint; ytrans:longint; xyswap:longint);cdecl;external;
procedure ecore_fb_touch_screen_calibrate_get(xscale:Plongint; xtrans:Plongint; yscale:Plongint; ytrans:Plongint; xyswap:Plongint);cdecl;external;
{$endif}

implementation


end.
