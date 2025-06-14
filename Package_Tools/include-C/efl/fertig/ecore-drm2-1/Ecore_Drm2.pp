
unit Ecore_Drm2;
interface

{
  Automatically converted by H2Pas 1.0.0 from Ecore_Drm2.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Ecore_Drm2.h
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
Pdword  = ^dword;
PEcore_Drm2_Context  = ^Ecore_Drm2_Context;
PEcore_Drm2_Device  = ^Ecore_Drm2_Device;
PEcore_Drm2_Event_Activate  = ^Ecore_Drm2_Event_Activate;
PEcore_Drm2_Event_Output_Changed  = ^Ecore_Drm2_Event_Output_Changed;
PEcore_Drm2_Fb  = ^Ecore_Drm2_Fb;
PEcore_Drm2_Fb_Status  = ^Ecore_Drm2_Fb_Status;
PEcore_Drm2_Output  = ^Ecore_Drm2_Output;
PEcore_Drm2_Output_Mode  = ^Ecore_Drm2_Output_Mode;
PEcore_Drm2_Plane  = ^Ecore_Drm2_Plane;
PEcore_Drm2_Relative_Mode  = ^Ecore_Drm2_Relative_Mode;
PEcore_Drm2_Rotation  = ^Ecore_Drm2_Rotation;
PEina_List  = ^Eina_List;
PEina_Rectangle  = ^Eina_Rectangle;
Plongint  = ^longint;
Puint16_t  = ^uint16_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_DRM2_H}
{$define _ECORE_DRM2_H}
{$include <Ecore.h>}
{$ifdef extern}
{$undef extern}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
type
  PEcore_Drm2_Rotation = ^TEcore_Drm2_Rotation;
  TEcore_Drm2_Rotation =  Longint;
  Const
    ECORE_DRM2_ROTATION_NORMAL = 1;
    ECORE_DRM2_ROTATION_90 = 2;
    ECORE_DRM2_ROTATION_180 = 4;
    ECORE_DRM2_ROTATION_270 = 8;
    ECORE_DRM2_ROTATION_REFLECT_X = 16;
    ECORE_DRM2_ROTATION_REFLECT_Y = 32;
;
type
  PEcore_Drm2_Fb_Status = ^TEcore_Drm2_Fb_Status;
  TEcore_Drm2_Fb_Status =  Longint;
  Const
    ECORE_DRM2_FB_STATUS_SCANOUT_ON = 1;
    ECORE_DRM2_FB_STATUS_SCANOUT_OFF = 2;
    ECORE_DRM2_FB_STATUS_RELEASE = 4;
    ECORE_DRM2_FB_STATUS_DELETED = 8;
    ECORE_DRM2_FB_STATUS_PLANE_ASSIGN = 16;
    ECORE_DRM2_FB_STATUS_PLANE_RELEASE = 32;
;
type
  PEcore_Drm2_Relative_Mode = ^TEcore_Drm2_Relative_Mode;
  TEcore_Drm2_Relative_Mode =  Longint;
  Const
    ECORE_DRM2_RELATIVE_MODE_UNKNOWN = 0;
    ECORE_DRM2_RELATIVE_MODE_NONE = 1;
    ECORE_DRM2_RELATIVE_MODE_CLONE = 2;
    ECORE_DRM2_RELATIVE_MODE_TO_LEFT = 3;
    ECORE_DRM2_RELATIVE_MODE_TO_RIGHT = 4;
    ECORE_DRM2_RELATIVE_MODE_TO_ABOVE = 5;
    ECORE_DRM2_RELATIVE_MODE_TO_BELOW = 6;
;
{ opaque structure to represent a drm device  }
type
{ opaque structure to represent a framebuffer object  }
{ opaque structure to represent an output device  }
{ opaque structure to represent an output mode  }
{ opaque structure to represent a hardware plane  }
{ structure to represent event for output changes  }
(* Const before type ignored *)

  PEcore_Drm2_Event_Output_Changed = ^TEcore_Drm2_Event_Output_Changed;
  TEcore_Drm2_Event_Output_Changed = record
      id : dword;
      x : longint;
      y : longint;
      w : longint;
      h : longint;
      phys_width : longint;
      phys_height : longint;
      refresh : dword;
      scale : dword;
      subpixel : longint;
      transform : longint;
      make : Pchar;
      model : Pchar;
      name : Pchar;
      flag0 : word;
    end;

const
  bm__Ecore_Drm2_Event_Output_Changed_connected = $1;
  bp__Ecore_Drm2_Event_Output_Changed_connected = 0;
  bm__Ecore_Drm2_Event_Output_Changed_enabled = $2;
  bp__Ecore_Drm2_Event_Output_Changed_enabled = 1;

function connected(var a : _Ecore_Drm2_Event_Output_Changed) : TEina_Bool;
procedure set_connected(var a : _Ecore_Drm2_Event_Output_Changed; __connected : TEina_Bool);
function enabled(var a : _Ecore_Drm2_Event_Output_Changed) : TEina_Bool;
procedure set_enabled(var a : _Ecore_Drm2_Event_Output_Changed; __enabled : TEina_Bool);
{ structure to represent event for session state changes  }
type
  PEcore_Drm2_Event_Activate = ^TEcore_Drm2_Event_Activate;
  TEcore_Drm2_Event_Activate = record
      flag0 : word;
    end;

const
  bm__Ecore_Drm2_Event_Activate_active = $1;
  bp__Ecore_Drm2_Event_Activate_active = 0;

function active(var a : _Ecore_Drm2_Event_Activate) : TEina_Bool;
procedure set_active(var a : _Ecore_Drm2_Event_Activate; __active : TEina_Bool);
{ structure to represent a drm event context  }
type
  PEcore_Drm2_Context = ^TEcore_Drm2_Context;
  TEcore_Drm2_Context = record
      version : longint;
      vblank_handler : procedure (fd:longint; sequence:dword; tv_sec:dword; tv_usec:dword; user_data:pointer);cdecl;
      page_flip_handler : procedure (fd:longint; sequence:dword; tv_sec:dword; tv_usec:dword; user_data:pointer);cdecl;
      page_flip_handler2 : procedure (fd:longint; sequence:dword; tv_sec:dword; tv_usec:dword; crtc_id:dword; 
                    user_data:pointer);cdecl;
    end;
  var
    ECORE_DRM2_EVENT_OUTPUT_CHANGED : longint;cvar;external;
    ECORE_DRM2_EVENT_ACTIVATE : longint;cvar;external;
type

  TEcore_Drm2_Release_Handler = procedure (data:pointer; b:PEcore_Drm2_Fb);cdecl;

  TEcore_Drm2_Fb_Status_Handler = procedure (b:PEcore_Drm2_Fb; status:TEcore_Drm2_Fb_Status; data:pointer);cdecl;
{*
 * @file
 * @brief Ecore functions for dealing with drm, virtual terminals
 *
 * @defgroup Ecore_Drm2_Group Ecore_Drm2 - Drm Integration
 * @ingroup Ecore
 *
 * Ecore_Drm2 provides a wrapper and functions for using libdrm
 *
 * @li @ref Ecore_Drm2_Init_Group
 * @li @ref Ecore_Drm2_Device_Group
 * @li @ref Ecore_Drm2_Output_Group
 * @li @ref Ecore_Drm2_Fb_Group
 * @li @ref Ecore_Drm2_Plane_Group
  }
{*
 * @defgroup Ecore_Drm2_Init_Group Drm library Init and Shutdown functions
 *
 * Functions that start and shutdown the Ecore_Drm2 library
  }
{*
 * Initialize the Ecore_Drm2 library
 *
 * @return  The number of times the library has been initialized without
 *          being shut down. 0 is returned if an error occurs.
 *
 * @ingroup Ecore_Drm2_Init_Group
 * @since 1.18
  }

function ecore_drm2_init:longint;cdecl;external;
{*
 * Shutdown the Ecore_Drm2 library
 *
 * @return  The number of times the library has been initialized without
 *          being shutdown. 0 is returned if an error occurs.
 *
 * @ingroup Ecore_Drm2_Init_Group
 * @since 1.18
  }
function ecore_drm2_shutdown:longint;cdecl;external;
{*
 * Read and process pending Drm events
 *
 * @param dev drm device
 * @param drmctx
 *
 * @return 0 on success, -1 otherwise
 *
 * @note: Do not ever use this function in applications !!!
 * This is a special-purpose API function and should not be used by
 * application developers.
 *
 * @ingroup Ecore_Drm_Init_Group
 * @since 1.19
  }
function ecore_drm2_event_handle(dev:PEcore_Drm2_Device; drmctx:PEcore_Drm2_Context):longint;cdecl;external;
{*
 * @defgroup Ecore_Drm2_Device_Group Drm device functions
 *
 * Functions that deal with finding, opening, closing, or obtaining various
 * information about a drm device
  }
{*
 * Try to open the Ecore_Drm2_Device for a given seat
 *
 * @param seat
 * @param tty
 *
 * @return An Ecore_Drm2_Device or NULL on failure.
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.18
  }
(* Const before type ignored *)
function ecore_drm2_device_open(seat:Pchar; tty:dword):PEcore_Drm2_Device;cdecl;external;
{*
 * Close an open Ecore_Drm2_Device
 *
 * @param device
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.18
  }
procedure ecore_drm2_device_close(device:PEcore_Drm2_Device);cdecl;external;
{*
 * Get the type of clock used by a given Ecore_Drm2_Device
 *
 * @param device
 *
 * @return The clockid_t used by this drm device
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.18
  }
function ecore_drm2_device_clock_id_get(device:PEcore_Drm2_Device):longint;cdecl;external;
{*
 * Get the size of the cursor supported by a given Ecore_Drm2_Device
 *
 * @param device
 * @param width
 * @param height
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.18
  }
procedure ecore_drm2_device_cursor_size_get(device:PEcore_Drm2_Device; width:Plongint; height:Plongint);cdecl;external;
{*
 * Get the current pointer position
 *
 * @param device
 * @param x
 * @param y
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.18
  }
procedure ecore_drm2_device_pointer_xy_get(device:PEcore_Drm2_Device; x:Plongint; y:Plongint);cdecl;external;
{*
 * Warp the pointer position to given coordinates
 *
 * @param device
 * @param x
 * @param y
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.18
  }
procedure ecore_drm2_device_pointer_warp(device:PEcore_Drm2_Device; x:longint; y:longint);cdecl;external;
{*
 * Set a left handed mode for the given device
 *
 * @param device
 * @param left
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.18
  }
function ecore_drm2_device_pointer_left_handed_set(device:PEcore_Drm2_Device; left:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * Set which window is to be used for input events
 *
 * @param device
 * @param window
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.18
  }
procedure ecore_drm2_device_window_set(device:PEcore_Drm2_Device; window:dword);cdecl;external;
{*
 * Set maximium position that pointer device is allowed to move
 *
 * @param device
 * @param w
 * @param h
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.18
  }
procedure ecore_drm2_device_pointer_max_set(device:PEcore_Drm2_Device; w:longint; h:longint);cdecl;external;
{*
 * Set pointer acceleration speed
 *
 * @param device
 * @param speed
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.21
  }
procedure ecore_drm2_device_pointer_accel_speed_set(device:PEcore_Drm2_Device; speed:Tdouble);cdecl;external;
{*
 * Set pointer acceleration profile
 *
 * @param device
 * @param profile
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.21
  }
procedure ecore_drm2_device_pointer_accel_profile_set(device:PEcore_Drm2_Device; profile:Tuint32_t);cdecl;external;
{*
 * Set pointer value rotation
 *
 * @param device
 * @param rotation
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.20
  }
function ecore_drm2_device_pointer_rotation_set(device:PEcore_Drm2_Device; rotation:longint):TEina_Bool;cdecl;external;
{*
 * Enable or disable pointer tap-to-click
 *
 * @param device
 * @param enabled
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.22
  }
procedure ecore_drm2_device_touch_tap_to_click_enabled_set(device:PEcore_Drm2_Device; enabled:TEina_Bool);cdecl;external;
{*
 * Set info to be used on keyboards
 *
 * @param device
 * @param context
 * @param keymap
 * @param group
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.20
  }
procedure ecore_drm2_device_keyboard_info_set(device:PEcore_Drm2_Device; context:pointer; keymap:pointer; group:longint);cdecl;external;
{*
 * Set a group layout to be used on keyboards
 *
 * @param device
 * @param group
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.20
  }
procedure ecore_drm2_device_keyboard_group_set(device:PEcore_Drm2_Device; group:longint);cdecl;external;
{*
 * Get the crtcs of a given device
 *
 * @param device
 * @param num
 *
 * @return The crtcs of this given device or NULL on failure
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.18
  }
function ecore_drm2_device_crtcs_get(device:PEcore_Drm2_Device; num:Plongint):Pdword;cdecl;external;
{*
 * Get the minimum and maximum screen size range
 *
 * @param device
 * @param *minw
 * @param *minh
 * @param *maxw
 * @param *maxh
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.18
  }
procedure ecore_drm2_device_screen_size_range_get(device:PEcore_Drm2_Device; minw:Plongint; minh:Plongint; maxw:Plongint; maxh:Plongint);cdecl;external;
{*
 * Calibrate any input devices for given screen size
 *
 * @param device
 * @param w
 * @param h
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.18
  }
procedure ecore_drm2_device_calibrate(device:PEcore_Drm2_Device; w:longint; h:longint);cdecl;external;
{*
 * Try to switch to a given virtual terminal
 *
 * @param device
 * @param vt
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.18
  }
function ecore_drm2_device_vt_set(device:PEcore_Drm2_Device; vt:longint):TEina_Bool;cdecl;external;
{*
 * Get if a given device prefers the use of shadow buffers
 *
 * @param device
 *
 * @return EINA_TRUE if preferred, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.19
  }
function ecore_drm2_device_prefer_shadow(device:PEcore_Drm2_Device):TEina_Bool;cdecl;external;
{*
 * Get the default depth & bpp from a given device
 *
 * @param device
 * @param depth
 * @param bpp
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.25
  }
procedure ecore_drm2_device_preferred_depth_get(device:PEcore_Drm2_Device; depth:Plongint; bpp:Plongint);cdecl;external;
{*
 * @defgroup Ecore_Drm2_Output_Group Drm output functions
 *
 * Functions that deal with setup of outputs
  }
{*
 * Iterate drm resources and create outputs
 *
 * @param device
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
function ecore_drm2_outputs_create(device:PEcore_Drm2_Device):TEina_Bool;cdecl;external;
{*
 * Destroy any created outputs
 *
 * @param device
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
procedure ecore_drm2_outputs_destroy(device:PEcore_Drm2_Device);cdecl;external;
{*
 * Get the list of outputs from a drm device
 *
 * @param device
 *
 * @return
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
(* Const before type ignored *)
function ecore_drm2_outputs_get(device:PEcore_Drm2_Device):PEina_List;cdecl;external;
{*
 * Get the dpms level of a given output
 *
 * @param output
 *
 * @return Integer value representing the state of DPMS on a given output
 *         or -1 on error
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
function ecore_drm2_output_dpms_get(output:PEcore_Drm2_Output):longint;cdecl;external;
{*
 * Set the dpms level of a given output
 *
 * @param output
 * @param level
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
procedure ecore_drm2_output_dpms_set(output:PEcore_Drm2_Output; level:longint);cdecl;external;
{*
 * Get the edid of a given output
 *
 * @param output
 *
 * @return A string representing the edid
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
function ecore_drm2_output_edid_get(output:PEcore_Drm2_Output):Pchar;cdecl;external;
{*
 * Get if a given output has a backlight
 *
 * @param output
 *
 * @return EINA_TRUE if this output has a backlight, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
function ecore_drm2_output_backlight_get(output:PEcore_Drm2_Output):TEina_Bool;cdecl;external;
{*
 * Find an output at the given position
 *
 * @param device
 * @param x
 * @param y
 *
 * @return An Ecore_Drm2_Output which exists at the given coordinates, or NULL on failure
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
function ecore_drm2_output_find(device:PEcore_Drm2_Device; x:longint; y:longint):PEcore_Drm2_Output;cdecl;external;
{*
 * Get the dpi of a given output
 *
 * @param output
 * @param xdpi
 * @param ydpi
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.19
  }
procedure ecore_drm2_output_dpi_get(output:PEcore_Drm2_Output; xdpi:Plongint; ydpi:Plongint);cdecl;external;
{*
 * Get the id of the crtc that an output is using
 *
 * @param output
 *
 * @return A valid crtc id or 0 on failure
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
function ecore_drm2_output_crtc_get(output:PEcore_Drm2_Output):dword;cdecl;external;
{*
 * Return the most recently set Ecore_Drm2_Fb for a given output
 *
 * This may be the currently scanned out buffer, a buffer currently being
 * flipped to scanout, or a buffer that has been submit but may not
 * actually ever hit scanout at all.
 *
 * @param output
 *
 * @return The latest Ecore_Drm2_Fb submit for this output, or NULL otherwise
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.19
  }
function ecore_drm2_output_latest_fb_get(output:PEcore_Drm2_Output):PEcore_Drm2_Fb;cdecl;external;
{*
 * Get if a given output is marked as the primary output
 *
 * @param output
 *
 * @return EINA_TRUE if output is primary, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
function ecore_drm2_output_primary_get(output:PEcore_Drm2_Output):TEina_Bool;cdecl;external;
{*
 * Set a given output to be primary
 *
 * @param output
 * @param primary
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
procedure ecore_drm2_output_primary_set(output:PEcore_Drm2_Output; primary:TEina_Bool);cdecl;external;
{*
 * Get if a given output is enabled
 *
 * @param output
 *
 * @return EINA_TRUE if enabled, EINA_FALSE otherwise.
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
function ecore_drm2_output_enabled_get(output:PEcore_Drm2_Output):TEina_Bool;cdecl;external;
{*
 * Set if a given output is enabled
 *
 * @param output
 * @param enabled
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
procedure ecore_drm2_output_enabled_set(output:PEcore_Drm2_Output; enabled:TEina_Bool);cdecl;external;
{*
 * Get the physical size of a given output
 *
 * This function will give the physical size (in mm) of an output
 *
 * @param output
 * @param *w
 * @param *h
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
procedure ecore_drm2_output_physical_size_get(output:PEcore_Drm2_Output; w:Plongint; h:Plongint);cdecl;external;
{*
 * Get a list of the modes supported on a given output
 *
 * @param output
 *
 * @return An Eina_List of the modes supported for this output
 *
 * @note The returned list should not be freed
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
(* Const before type ignored *)
function ecore_drm2_output_modes_get(output:PEcore_Drm2_Output):PEina_List;cdecl;external;
{*
 * Get information from an existing output mode
 *
 * @param mode
 * @param w
 * @param h
 * @param refresh
 * @param flags
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
procedure ecore_drm2_output_mode_info_get(mode:PEcore_Drm2_Output_Mode; w:Plongint; h:Plongint; refresh:Pdword; flags:Pdword);cdecl;external;
{*
 * Set a given mode to be used on a given output
 *
 * @param output
 * @param mode
 * @param x
 * @param y
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
function ecore_drm2_output_mode_set(output:PEcore_Drm2_Output; mode:PEcore_Drm2_Output_Mode; x:longint; y:longint):TEina_Bool;cdecl;external;
{*
 * Get the name of a given output
 *
 * @param output
 *
 * @return A string representing the output's name. Caller should free this return.
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
function ecore_drm2_output_name_get(output:PEcore_Drm2_Output):Pchar;cdecl;external;
{*
 * Get the model of a given output
 *
 * @param output
 *
 * @return A string representing the output's model. Caller should free this return.
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
function ecore_drm2_output_model_get(output:PEcore_Drm2_Output):Pchar;cdecl;external;
{*
 * Get if a given output is connected
 *
 * @param output
 *
 * @return EINA_TRUE if connected, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
function ecore_drm2_output_connected_get(output:PEcore_Drm2_Output):TEina_Bool;cdecl;external;
{*
 * Get if a given output is cloned
 *
 * @param output
 *
 * @return EINA_TRUE if cloned, EINA_FALSE otherwise.
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
function ecore_drm2_output_cloned_get(output:PEcore_Drm2_Output):TEina_Bool;cdecl;external;
{*
 * Get the connector type of a given output
 *
 * @param output
 *
 * @return An unsigned integer representing the type of connector for this output
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
function ecore_drm2_output_connector_type_get(output:PEcore_Drm2_Output):dword;cdecl;external;
{*
 * Get the geometry and refresh rate for a given output
 *
 * @param output
 * @param *x
 * @param *y
 * @param *w
 * @param *h
 * @param *refresh
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.21
  }
procedure ecore_drm2_output_info_get(output:PEcore_Drm2_Output; x:Plongint; y:Plongint; w:Plongint; h:Plongint; 
            refresh:Pdword);cdecl;external;
{*
 * Get if an output can be used on a given crtc
 *
 * This function will loop the possible crtcs of an encoder to determine if
 * a given output can be assigned to a given crtc
 *
 * @param output
 * @param crtc
 *
 * @return EINA_TRUE if the output can be assigned to given crtc, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.18
  }
function ecore_drm2_output_possible_crtc_get(output:PEcore_Drm2_Output; crtc:dword):TEina_Bool;cdecl;external;
{*
 * Set the gamma level of an Ecore_Drm_Output
 *
 * This function will set the gamma of an Ecore_Drm2_Output
 *
 * @param output The Ecore_Drm2_Output to set the gamma level on
 * @param size The gamma table size to set
 * @param red The amount to scale the red channel
 * @param green The amount to scale the green channel
 * @param blue The amount to scale the blue channel
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.19
  }
procedure ecore_drm2_output_gamma_set(output:PEcore_Drm2_Output; size:Tuint16_t; red:Puint16_t; green:Puint16_t; blue:Puint16_t);cdecl;external;
{*
 * Get the supported rotations of a given output
 *
 * @param output
 *
 * @return An integer representing possible rotations, or -1 on failure
 *
 * @note This function will only return valid values if Atomic support
 *       is enabled as it requires hardware plane support.
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.19
  }
function ecore_drm2_output_supported_rotations_get(output:PEcore_Drm2_Output):longint;cdecl;external;
{*
 * Set a rotation on a given output
 *
 * @param output
 * @param rotation
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise
 *
 * @note This function will only work if Atomic support
 *       is enabled as it requires hardware plane support.
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.19
  }
function ecore_drm2_output_rotation_set(output:PEcore_Drm2_Output; rotation:longint):TEina_Bool;cdecl;external;
{*
 * Get current output rotation
 *
 * @param output
 *
 * @return An integer representing the output current rotation
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.22
  }
function ecore_drm2_output_rotation_get(output:PEcore_Drm2_Output):longint;cdecl;external;
{*
 * Set the user data for the output's page flip handler
 *
 * @param o The output to update user data for
 * @param data The new user data pointer
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.19
  }
procedure ecore_drm2_output_user_data_set(o:PEcore_Drm2_Output; data:pointer);cdecl;external;
{*
 * Get the user data for a given output
 *
 * @param output The output to get user data for
 *
 * @return The user data associated with given output
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.21
  }
function ecore_drm2_output_user_data_get(output:PEcore_Drm2_Output):pointer;cdecl;external;
{*
 * Get the subpixel state of the output
 * @param output the output
 * @return The state value
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.20
  }
(* Const before type ignored *)
function ecore_drm2_output_subpixel_get(output:PEcore_Drm2_Output):dword;cdecl;external;
{*
 * Set the relative mode for an output
 *
 * @param output The output to set relative mode
 * @param mode The relative mode to set
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.21
  }
procedure ecore_drm2_output_relative_mode_set(output:PEcore_Drm2_Output; mode:TEcore_Drm2_Relative_Mode);cdecl;external;
{*
 * Get the relative mode of an output
 *
 * @param output The output to retrieve relative mode for
 *
 * @return The relative mode of a given output
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.21
  }
function ecore_drm2_output_relative_mode_get(output:PEcore_Drm2_Output):TEcore_Drm2_Relative_Mode;cdecl;external;
{*
 * Set which output a given output is relative to
 *
 * @param output The output for which to set relative
 * @param relative The output for which the first output is relative to
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.21
  }
(* Const before type ignored *)
procedure ecore_drm2_output_relative_to_set(output:PEcore_Drm2_Output; relative:Pchar);cdecl;external;
{*
 * Get which output is relative to a given output
 *
 * @param output The output for which to retrieve relative
 *
 * @return The name of the output which is relative to the given output or NULL
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.21
  }
(* Const before type ignored *)
function ecore_drm2_output_relative_to_get(output:PEcore_Drm2_Output):Pchar;cdecl;external;
{*
 * @defgroup Ecore_Drm2_Fb_Group Drm framebuffer functions
 *
 * Functions that deal with setup of framebuffers
  }
{*
 * Create a new framebuffer object
 *
 * @param dev
 * @param width
 * @param height
 * @param depth
 * @param bpp
 * @param format
 *
 * @return A newly create framebuffer object, or NULL on failure
 *
 * @ingroup Ecore_Drm2_Fb_Group
 * @since 1.18
  }
function ecore_drm2_fb_create(dev:PEcore_Drm2_Device; width:longint; height:longint; depth:longint; bpp:longint; 
           format:dword):PEcore_Drm2_Fb;cdecl;external;
function ecore_drm2_fb_gbm_create(dev:PEcore_Drm2_Device; width:longint; height:longint; depth:longint; bpp:longint; 
           format:dword; handle:dword; stride:dword; bo:pointer):PEcore_Drm2_Fb;cdecl;external;
{*
 * Get a framebuffer's mmap'd data
 *
 * @param fb
 *
 * @return The mmap'd area of the framebuffer or NULL on failure
 *
 * @ingroup Ecore_Drm2_Fb_Group
 * @since 1.18
  }
function ecore_drm2_fb_data_get(fb:PEcore_Drm2_Fb):pointer;cdecl;external;
{*
 * Get a framebuffer's size
 *
 * @param fb
 *
 * @return size of the framebuffers' mmap'd data or 0 on failure
 *
 * @ingroup Ecore_Drm2_Fb_Group
 * @since 1.18
  }
function ecore_drm2_fb_size_get(fb:PEcore_Drm2_Fb):dword;cdecl;external;
{*
 * Get a framebuffer's stride
 *
 * @param fb
 *
 * @return stride of the framebuffer or 0 on failure
 *
 * @ingroup Ecore_Drm2_Fb_Group
 * @since 1.18
  }
function ecore_drm2_fb_stride_get(fb:PEcore_Drm2_Fb):dword;cdecl;external;
{*
 * Mark regions of a framebuffer as dirty
 *
 * @param fb
 * @param rects
 * @param count
 *
 * @ingroup Ecore_Drm2_Fb_Group
 * @since 1.18
  }
procedure ecore_drm2_fb_dirty(fb:PEcore_Drm2_Fb; rects:PEina_Rectangle; count:dword);cdecl;external;
{*
 * Schedule a pageflip to the given Ecore_Drm2_Fb
 *
 * The caller is responsible for running a page flip handler
 * and calling ecore_drm2_fb_flip_complete() when it completes.
 *
 * @param fb
 * @param output
 *
 * @return The result of drmModePageFlip function call
 *
 * @ingroup Ecore_Drm2_Fb_Group
 * @since 1.18
  }
function ecore_drm2_fb_flip(fb:PEcore_Drm2_Fb; output:PEcore_Drm2_Output):longint;cdecl;external;
{*
 * Must be called by a page flip handler when the flip completes.
 *
 * @param output
 *
 * @return Whether there's an undisplayed buffer still in the queue.
 *
 * @ingroup Ecore_Drm2_Fb_Group
 * @since 1.18
  }
function ecore_drm2_fb_flip_complete(output:PEcore_Drm2_Output):TEina_Bool;cdecl;external;
{*
 * Return the Ecore_Drm2_Fb's busy status
 *
 * @param fb
 *
 * @return The busy status
 *
 * @ingroup Ecore_Drm2_Fb_Group
 * @since 1.19
  }
function ecore_drm2_fb_busy_get(fb:PEcore_Drm2_Fb):TEina_Bool;cdecl;external;
{*
 * Try to force a framebuffer release for an output
 *
 * This tries to release the next or optionally pending, or current
 * buffer from the output.  If successful there will be a release callback
 * to the registered handler, and the fb will no longer be flagged busy.
 *
 * Releasing buffers committed to scanout will potentially cause flicker,
 * so this is only done when the panic flag is set.
 *
 * @param o The output to force release
 * @param panic Try to release even buffers committed to scanout
 *
 * @return EINA_TRUE if a buffer was released
 *
 * @ingroup Ecore_Drm2_Fb_Group
 * @since 1.19
  }
function ecore_drm2_fb_release(o:PEcore_Drm2_Output; panic:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * Get the Framebuffer's gbm buffer object
 *
 * @param fb The framebuffer to query
 *
 * @return The gbm bo for the framebuffer
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.19
  }
function ecore_drm2_fb_bo_get(fb:PEcore_Drm2_Fb):pointer;cdecl;external;
{*
 * Import a dmabuf object as a Framebuffer
 *
 * @param dev
 * @param width
 * @param height
 * @param depth
 * @param bpp
 * @param format
 * @param strides
 * @param dmabuf_fd
 * @param dmabuf_fd_count
 *
 * @return A newly created framebuffer object, or NULL on failure
 *
 * @ingroup Ecore_Drm2_Fb_Group
 * @since 1.20
 *
  }
function ecore_drm2_fb_dmabuf_import(dev:PEcore_Drm2_Device; width:longint; height:longint; depth:longint; bpp:longint; 
           format:dword; strides:array[0..3] of dword; dmabuf_fd:array[0..3] of longint; dmabuf_fd_count:longint):PEcore_Drm2_Fb;cdecl;external;
{*
 * Discard a framebuffer object
 *
 * Decreases the refcount on a fb object.  It will be destroyed when it's
 * no longer attached to scanout or otherwise in use.
 *
 * @param fb
 *
 * @ingroup Ecore_Drm2_Fb_Group
 * @since 1.20
  }
procedure ecore_drm2_fb_discard(fb:PEcore_Drm2_Fb);cdecl;external;
{*
 * @defgroup Ecore_Drm2_Plane_Group Functions that deal with hardware planes
 *
 * Functions that deal with hardware plane manipulation
  }
{*
 * Find a hardware plane where a given Ecore_Drm2_Fb can go based on format and size
 *
 * @param output
 * @param fb
 *
 * @return A newly allocated plane object, or NULL otherwise
 *
 * @ingroup Ecore_Drm2_Plane_Group
 * @since 1.20
  }
function ecore_drm2_plane_assign(output:PEcore_Drm2_Output; fb:PEcore_Drm2_Fb; x:longint; y:longint):PEcore_Drm2_Plane;cdecl;external;
{*
 * Remove a hardware plane from display
 *
 * @param plane
 *
 * @ingroup Ecore_Drm2_Plane_Group
 * @since 1.20
  }
procedure ecore_drm2_plane_release(plane:PEcore_Drm2_Plane);cdecl;external;
{*
 * Set plane destination values
 *
 * @param plane
 * @param x
 * @param y
 * @param w
 * @param h
 *
 * @ingroup Ecore_Drm2_Plane_Group
 * @since 1.20
  }
procedure ecore_drm2_plane_destination_set(plane:PEcore_Drm2_Plane; x:longint; y:longint; w:longint; h:longint);cdecl;external;
{*
 * Set plane frame buffer
 *
 * @param plane
 * @param fb
 *
 * @return whether the plane state has been successfully changed or not
 *
 * @ingroup Ecore_Drm2_Plane_Group
 * @since 1.20
  }
function ecore_drm2_plane_fb_set(plane:PEcore_Drm2_Plane; fb:PEcore_Drm2_Fb):TEina_Bool;cdecl;external;
{*
 * Register a callback for buffer status updates
 *
 * When a flip completes ecore_drm2 may release a buffer.  Use this callback
 * if you need to do bookkeeping or locking on buffer release.
 *
 * Additionally, an fb may be placed on scanout or removed from scanout by
 * evas.  When this happens a compositor needs to ensure the buffers aren't
 * released back to a client while they're on scanout.
 *
 * @param fb The fb to register the callback on
 * @param handler The function to handle the callback
 * @param data The user data to pass to the callback
 * @ingroup Ecore_Drm2_Fb_Group
 * @since 1.20
  }
procedure ecore_drm2_fb_status_handler_set(fb:PEcore_Drm2_Fb; handler:TEcore_Drm2_Fb_Status_Handler; data:pointer);cdecl;external;
{*
 * Get the time of the last vblank
 *
 * Query the display hardware for the time of a vblank, potentially blocking.
 *
 * If sequence is 0 the time of the last vblank will be immediately returned,
 * if it's above zero that number of vblanks will pass before the function
 * returns.
 *
 * @param output
 * @param sequence
 * @param sec
 * @param usec
 *
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.20
  }
function ecore_drm2_output_blanktime_get(output:PEcore_Drm2_Output; sequence:longint; sec:Plongint; usec:Plongint):TEina_Bool;cdecl;external;
{*
 * Get the fd of an Ecore_Drm2_Device
 *
 * Query the fd of the device.
 *
 * @param device
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.20
  }
function ecore_drm2_device_fd_get(device:PEcore_Drm2_Device):longint;cdecl;external;
{*
 * Check if there's a pageflip in progress for an output
 *
 * Checks whether an output has submit a flip but not yet had
 * a callback completion event for that flip yet.
 *
 * @param output
 * @return Whether there's a flip in progress or not
 * @ingroup Ecore_Drm2_Output_Group
 * @since 1.20
  }
function ecore_drm2_output_pending_get(output:PEcore_Drm2_Output):TEina_Bool;cdecl;external;
{*
 * Set the background color of an output's crtc
 *
 * @param output
 * @param r
 * @param g
 * @param b
 * @param a
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise
 *
 * @note This requires support from the video driver in order to function
 *
 * @since 1.23
  }
function ecore_drm2_output_background_color_set(output:PEcore_Drm2_Output; r:Tuint64_t; g:Tuint64_t; b:Tuint64_t; a:Tuint64_t):TEina_Bool;cdecl;external;
{*
 * Check if vblank is supported by the current video driver
 *
 * @param dev
 *
 * @return EINA_TRUE if vblank is supported, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Drm2_Device_Group
 * @since 1.23  }
function ecore_drm2_vblank_supported(dev:PEcore_Drm2_Device):TEina_Bool;cdecl;external;
{$endif}
{$endif}

implementation

function connected(var a : _Ecore_Drm2_Event_Output_Changed) : TEina_Bool;
begin
  connected:=(a.flag0 and bm__Ecore_Drm2_Event_Output_Changed_connected) shr bp__Ecore_Drm2_Event_Output_Changed_connected;
end;

procedure set_connected(var a : _Ecore_Drm2_Event_Output_Changed; __connected : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__connected shl bp__Ecore_Drm2_Event_Output_Changed_connected) and bm__Ecore_Drm2_Event_Output_Changed_connected);
end;

function enabled(var a : _Ecore_Drm2_Event_Output_Changed) : TEina_Bool;
begin
  enabled:=(a.flag0 and bm__Ecore_Drm2_Event_Output_Changed_enabled) shr bp__Ecore_Drm2_Event_Output_Changed_enabled;
end;

procedure set_enabled(var a : _Ecore_Drm2_Event_Output_Changed; __enabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__enabled shl bp__Ecore_Drm2_Event_Output_Changed_enabled) and bm__Ecore_Drm2_Event_Output_Changed_enabled);
end;

function active(var a : _Ecore_Drm2_Event_Activate) : TEina_Bool;
begin
  active:=(a.flag0 and bm__Ecore_Drm2_Event_Activate_active) shr bp__Ecore_Drm2_Event_Activate_active;
end;

procedure set_active(var a : _Ecore_Drm2_Event_Activate; __active : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__active shl bp__Ecore_Drm2_Event_Activate_active) and bm__Ecore_Drm2_Event_Activate_active);
end;


end.
