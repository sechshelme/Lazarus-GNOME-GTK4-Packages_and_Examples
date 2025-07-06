unit fp_ecore_fb;

interface

uses
  efl, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TEcore_Fb_Input_Device = record
  end;
  PEcore_Fb_Input_Device = ^TEcore_Fb_Input_Device;

  PEcore_Fb_Input_Device_Cap = ^TEcore_Fb_Input_Device_Cap;
  TEcore_Fb_Input_Device_Cap = longint;

const
  ECORE_FB_INPUT_DEVICE_CAP_NONE = $00000000;
  ECORE_FB_INPUT_DEVICE_CAP_RELATIVE = $00000001;
  ECORE_FB_INPUT_DEVICE_CAP_ABSOLUTE = $00000002;
  ECORE_FB_INPUT_DEVICE_CAP_KEYS_OR_BUTTONS = $00000004;

type
  Tfunc = procedure(data: pointer); cdecl;

procedure ecore_fb_callback_gain_set(func: Tfunc; data: pointer); cdecl; external libecore_fb;
procedure ecore_fb_callback_lose_set(func: Tfunc; data: pointer); cdecl; external libecore_fb;
function ecore_fb_input_device_open(dev: pchar): PEcore_Fb_Input_Device; cdecl; external libecore_fb;
procedure ecore_fb_input_device_close(dev: PEcore_Fb_Input_Device); cdecl; external libecore_fb;
procedure ecore_fb_input_device_listen(dev: PEcore_Fb_Input_Device; listen: TEina_Bool); cdecl; external libecore_fb;
function ecore_fb_input_device_name_get(dev: PEcore_Fb_Input_Device): pchar; cdecl; external libecore_fb;
function ecore_fb_input_device_cap_get(dev: PEcore_Fb_Input_Device): TEcore_Fb_Input_Device_Cap; cdecl; external libecore_fb;
procedure ecore_fb_input_device_axis_size_set(dev: PEcore_Fb_Input_Device; w: longint; h: longint); cdecl; external libecore_fb;
procedure ecore_fb_input_threshold_click_set(dev: PEcore_Fb_Input_Device; threshold: double); cdecl; external libecore_fb;
function ecore_fb_input_threshold_click_get(dev: PEcore_Fb_Input_Device): double; cdecl; external libecore_fb;
procedure ecore_fb_input_device_window_set(dev: PEcore_Fb_Input_Device; window: pointer); cdecl; external libecore_fb;
function ecore_fb_init(name: pchar): longint; cdecl; external libecore_fb;
function ecore_fb_shutdown: longint; cdecl; external libecore_fb;
procedure ecore_fb_size_get(w: Plongint; h: Plongint); cdecl; external libecore_fb;
procedure ecore_fb_touch_screen_calibrate_set(xscale: longint; xtrans: longint; yscale: longint; ytrans: longint; xyswap: longint); cdecl; external libecore_fb;
procedure ecore_fb_touch_screen_calibrate_get(xscale: Plongint; xtrans: Plongint; yscale: Plongint; ytrans: Plongint; xyswap: Plongint); cdecl; external libecore_fb;

// === Konventiert am: 14-6-25 17:02:25 ===


implementation



end.
