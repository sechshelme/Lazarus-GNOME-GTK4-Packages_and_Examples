{$IFDEF read_interface}


function _ecore_x_vsync_wakeup_time_get: double; cdecl; external libecore_x;

const
  ECORE_X_VERSION_MAJOR = EFL_VERSION_MAJOR;
  ECORE_X_VERSION_MINOR = EFL_VERSION_MINOR;

type
  TEcore_X_Version = record
    major: longint;
    minor: longint;
    micro: longint;
    revision: longint;
  end;
  PEcore_X_Version = ^TEcore_X_Version;

var
  ecore_x_version: PEcore_X_Version; cvar;external libecore_x;

const
  HAVE_ECORE_X_XLIB = 1;

type
  PPEcore_X_ID = ^PEcore_X_ID;
  PEcore_X_ID = ^TEcore_X_ID;
  TEcore_X_ID = dword;

  PPEcore_X_Window = ^PEcore_X_Window;
  PEcore_X_Window = ^TEcore_X_Window;
  TEcore_X_Window = TEcore_X_ID;

  PEcore_X_Pixmap = ^TEcore_X_Pixmap;
  TEcore_X_Pixmap = TEcore_X_ID;

  PPEcore_X_Atom = ^PEcore_X_Atom;
  PEcore_X_Atom = ^TEcore_X_Atom;
  TEcore_X_Atom = TEcore_X_ID;

  TEcore_X_Icon = record
    width: dword;
    height: dword;
    data: Pdword;
  end;
  PEcore_X_Icon = ^TEcore_X_Icon;
  PPEcore_X_Icon = ^PEcore_X_Icon;

type
  PEcore_X_Visual = ^TEcore_X_Visual;
  TEcore_X_Visual = pointer;

  PEcore_X_Drawable = ^TEcore_X_Drawable;
  TEcore_X_Drawable = TEcore_X_ID;

  PEcore_X_GC = ^TEcore_X_GC;
  TEcore_X_GC = pointer;

  PEcore_X_Colormap = ^TEcore_X_Colormap;
  TEcore_X_Colormap = TEcore_X_ID;

  PEcore_X_Time = ^TEcore_X_Time;
  TEcore_X_Time = TEcore_X_ID;

  PEcore_X_Cursor = ^TEcore_X_Cursor;
  TEcore_X_Cursor = TEcore_X_ID;

  PEcore_X_Display = ^TEcore_X_Display;
  TEcore_X_Display = pointer;

  PEcore_X_Connection = ^TEcore_X_Connection;
  TEcore_X_Connection = pointer;

  PEcore_X_Screen = ^TEcore_X_Screen;
  TEcore_X_Screen = pointer;

  PEcore_X_Sync_Counter = ^TEcore_X_Sync_Counter;
  TEcore_X_Sync_Counter = TEcore_X_ID;

  PEcore_X_Sync_Alarm = ^TEcore_X_Sync_Alarm;
  TEcore_X_Sync_Alarm = TEcore_X_ID;

  PEcore_X_Sync_Fence = ^TEcore_X_Sync_Fence;
  TEcore_X_Sync_Fence = TEcore_X_ID;

  PEcore_X_XRegion = ^TEcore_X_XRegion;
  TEcore_X_XRegion = pointer;

  PPEcore_X_Randr_Output = ^PEcore_X_Randr_Output;
  PEcore_X_Randr_Output = ^TEcore_X_Randr_Output;
  TEcore_X_Randr_Output = TEcore_X_ID;

  PEcore_X_Randr_Crtc = ^TEcore_X_Randr_Crtc;
  TEcore_X_Randr_Crtc = TEcore_X_ID;

  PPEcore_X_Randr_Mode = ^PEcore_X_Randr_Mode;
  PEcore_X_Randr_Mode = ^TEcore_X_Randr_Mode;
  TEcore_X_Randr_Mode = TEcore_X_ID;

  PEcore_X_Randr_Size_ID = ^TEcore_X_Randr_Size_ID;
  TEcore_X_Randr_Size_ID = word;

  PEcore_X_Randr_Screen = ^TEcore_X_Randr_Screen;
  TEcore_X_Randr_Screen = longint;

  PEcore_X_Device = ^TEcore_X_Device;
  TEcore_X_Device = TEcore_X_ID;

  TEcore_X_Rectangle = record
    x: longint;
    y: longint;
    width: dword;
    height: dword;
  end;
  PEcore_X_Rectangle = ^TEcore_X_Rectangle;

  PEcore_X_GC_Value_Mask = ^TEcore_X_GC_Value_Mask;
  TEcore_X_GC_Value_Mask = longint;

const
  ECORE_X_GC_VALUE_MASK_FUNCTION = 1 shl 0;
  ECORE_X_GC_VALUE_MASK_PLANE_MASK = 1 shl 1;
  ECORE_X_GC_VALUE_MASK_FOREGROUND = 1 shl 2;
  ECORE_X_GC_VALUE_MASK_BACKGROUND = 1 shl 3;
  ECORE_X_GC_VALUE_MASK_LINE_WIDTH = 1 shl 4;
  ECORE_X_GC_VALUE_MASK_LINE_STYLE = 1 shl 5;
  ECORE_X_GC_VALUE_MASK_CAP_STYLE = 1 shl 6;
  ECORE_X_GC_VALUE_MASK_JOIN_STYLE = 1 shl 7;
  ECORE_X_GC_VALUE_MASK_FILL_STYLE = 1 shl 8;
  ECORE_X_GC_VALUE_MASK_FILL_RULE = 1 shl 9;
  ECORE_X_GC_VALUE_MASK_TILE = 1 shl 10;
  ECORE_X_GC_VALUE_MASK_STIPPLE = 1 shl 11;
  ECORE_X_GC_VALUE_MASK_TILE_STIPPLE_ORIGIN_X = 1 shl 12;
  ECORE_X_GC_VALUE_MASK_TILE_STIPPLE_ORIGIN_Y = 1 shl 13;
  ECORE_X_GC_VALUE_MASK_FONT = 1 shl 14;
  ECORE_X_GC_VALUE_MASK_SUBWINDOW_MODE = 1 shl 15;
  ECORE_X_GC_VALUE_MASK_GRAPHICS_EXPOSURES = 1 shl 16;
  ECORE_X_GC_VALUE_MASK_CLIP_ORIGIN_X = 1 shl 17;
  ECORE_X_GC_VALUE_MASK_CLIP_ORIGIN_Y = 1 shl 18;
  ECORE_X_GC_VALUE_MASK_CLIP_MASK = 1 shl 19;
  ECORE_X_GC_VALUE_MASK_DASH_OFFSET = 1 shl 20;
  ECORE_X_GC_VALUE_MASK_DASH_LIST = 1 shl 21;
  ECORE_X_GC_VALUE_MASK_ARC_MODE = 1 shl 22;

type
  PEcore_X_Composite_Update_Type = ^TEcore_X_Composite_Update_Type;
  TEcore_X_Composite_Update_Type = longint;

const
  ECORE_X_COMPOSITE_UPDATE_AUTOMATIC = 0;
  ECORE_X_COMPOSITE_UPDATE_MANUAL = 1;

type
  PPEcore_X_Window_State = ^PEcore_X_Window_State;
  PEcore_X_Window_State = ^TEcore_X_Window_State;
  TEcore_X_Window_State = longint;

const
  ECORE_X_WINDOW_STATE_UNKNOWN = 0;
  ECORE_X_WINDOW_STATE_ICONIFIED = 1;
  ECORE_X_WINDOW_STATE_MODAL = 2;
  ECORE_X_WINDOW_STATE_STICKY = 3;
  ECORE_X_WINDOW_STATE_MAXIMIZED_VERT = 4;
  ECORE_X_WINDOW_STATE_MAXIMIZED_HORZ = 5;
  ECORE_X_WINDOW_STATE_SHADED = 6;
  ECORE_X_WINDOW_STATE_SKIP_TASKBAR = 7;
  ECORE_X_WINDOW_STATE_SKIP_PAGER = 8;
  ECORE_X_WINDOW_STATE_HIDDEN = 9;
  ECORE_X_WINDOW_STATE_FULLSCREEN = 10;
  ECORE_X_WINDOW_STATE_ABOVE = 11;
  ECORE_X_WINDOW_STATE_BELOW = 12;
  ECORE_X_WINDOW_STATE_DEMANDS_ATTENTION = 13;

type
  PEcore_X_Window_State_Action = ^TEcore_X_Window_State_Action;
  TEcore_X_Window_State_Action = longint;

const
  ECORE_X_WINDOW_STATE_ACTION_REMOVE = 0;
  ECORE_X_WINDOW_STATE_ACTION_ADD = 1;
  ECORE_X_WINDOW_STATE_ACTION_TOGGLE = 2;

type
  PEcore_X_Window_Stack_Mode = ^TEcore_X_Window_Stack_Mode;
  TEcore_X_Window_Stack_Mode = longint;

const
  ECORE_X_WINDOW_STACK_ABOVE = 0;
  ECORE_X_WINDOW_STACK_BELOW = 1;
  ECORE_X_WINDOW_STACK_TOP_IF = 2;
  ECORE_X_WINDOW_STACK_BOTTOM_IF = 3;
  ECORE_X_WINDOW_STACK_OPPOSITE = 4;

type
  PEcore_X_Randr_Orientation = ^TEcore_X_Randr_Orientation;
  TEcore_X_Randr_Orientation = longint;

const
  ECORE_X_RANDR_ORIENTATION_ROT_0 = 1 shl 0;
  ECORE_X_RANDR_ORIENTATION_ROT_90 = 1 shl 1;
  ECORE_X_RANDR_ORIENTATION_ROT_180 = 1 shl 2;
  ECORE_X_RANDR_ORIENTATION_ROT_270 = 1 shl 3;
  ECORE_X_RANDR_ORIENTATION_FLIP_X = 1 shl 4;
  ECORE_X_RANDR_ORIENTATION_FLIP_Y = 1 shl 5;

type
  PEcore_X_Randr_Connection_Status = ^TEcore_X_Randr_Connection_Status;
  TEcore_X_Randr_Connection_Status = longint;

const
  ECORE_X_RANDR_CONNECTION_STATUS_CONNECTED = 0;
  ECORE_X_RANDR_CONNECTION_STATUS_DISCONNECTED = 1;
  ECORE_X_RANDR_CONNECTION_STATUS_UNKNOWN = 2;

type
  PEcore_X_Randr_Output_Policy = ^TEcore_X_Randr_Output_Policy;
  TEcore_X_Randr_Output_Policy = longint;

const
  ECORE_X_RANDR_OUTPUT_POLICY_ABOVE = 1;
  ECORE_X_RANDR_OUTPUT_POLICY_RIGHT = 2;
  ECORE_X_RANDR_OUTPUT_POLICY_BELOW = 3;
  ECORE_X_RANDR_OUTPUT_POLICY_LEFT = 4;
  ECORE_X_RANDR_OUTPUT_POLICY_CLONE = 5;
  ECORE_X_RANDR_OUTPUT_POLICY_NONE = 6;
  ECORE_X_RANDR_OUTPUT_POLICY_ASK = 7;

type
  PEcore_X_Randr_Relative_Alignment = ^TEcore_X_Randr_Relative_Alignment;
  TEcore_X_Randr_Relative_Alignment = longint;

const
  ECORE_X_RANDR_RELATIVE_ALIGNMENT_NONE = 0;
  ECORE_X_RANDR_RELATIVE_ALIGNMENT_CENTER_REL = 1;
  ECORE_X_RANDR_RELATIVE_ALIGNMENT_CENTER_SCR = 2;

type
  PEcore_X_Render_Subpixel_Order = ^TEcore_X_Render_Subpixel_Order;
  TEcore_X_Render_Subpixel_Order = longint;

const
  ECORE_X_RENDER_SUBPIXEL_ORDER_UNKNOWN = 0;
  ECORE_X_RENDER_SUBPIXEL_ORDER_HORIZONTAL_RGB = 1;
  ECORE_X_RENDER_SUBPIXEL_ORDER_HORIZONTAL_BGR = 2;
  ECORE_X_RENDER_SUBPIXEL_ORDER_VERTICAL_RGB = 3;
  ECORE_X_RENDER_SUBPIXEL_ORDER_VERTICAL_BGR = 4;
  ECORE_X_RENDER_SUBPIXEL_ORDER_NONE = 5;

type
  PEcore_X_Randr_Edid_Display_Interface_Type = ^TEcore_X_Randr_Edid_Display_Interface_Type;
  TEcore_X_Randr_Edid_Display_Interface_Type = longint;

const
  ECORE_X_RANDR_EDID_DISPLAY_INTERFACE_UNDEFINED = 0;
  ECORE_X_RANDR_EDID_DISPLAY_INTERFACE_DVI = 1;
  ECORE_X_RANDR_EDID_DISPLAY_INTERFACE_HDMI_A = 2;
  ECORE_X_RANDR_EDID_DISPLAY_INTERFACE_HDMI_B = 3;
  ECORE_X_RANDR_EDID_DISPLAY_INTERFACE_MDDI = 4;
  ECORE_X_RANDR_EDID_DISPLAY_INTERFACE_DISPLAY_PORT = 5;

type
  PEcore_X_Randr_Edid_Display_Colorscheme = ^TEcore_X_Randr_Edid_Display_Colorscheme;
  TEcore_X_Randr_Edid_Display_Colorscheme = longint;

const
  ECORE_X_RANDR_EDID_DISPLAY_COLORSCHEME_MONOCHROME_GRAYSCALE = $00;
  ECORE_X_RANDR_EDID_DISPLAY_COLORSCHEME_COLOR_RGB = $08;
  ECORE_X_RANDR_EDID_DISPLAY_COLORSCHEME_COLOR_NON_RGB = $10;
  ECORE_X_RANDR_EDID_DISPLAY_COLORSCHEME_COLOR_UNDEFINED = $18;
  ECORE_X_RANDR_EDID_DISPLAY_COLORSCHEME_COLOR_RGB_4_4_4 = $444000;
  ECORE_X_RANDR_EDID_DISPLAY_COLORSCHEME_COLOR_RGB_YCRCB_4_4_4 = $444;
  ECORE_X_RANDR_EDID_DISPLAY_COLORSCHEME_COLOR_RGB_YCRCB_4_2_2 = $422;

type
  PEcore_X_Randr_Edid_Aspect_Ratio = ^TEcore_X_Randr_Edid_Aspect_Ratio;
  TEcore_X_Randr_Edid_Aspect_Ratio = longint;

const
  ECORE_X_RANDR_EDID_ASPECT_RATIO_4_3 = $0;
  ECORE_X_RANDR_EDID_ASPECT_RATIO_16_9 = $1;
  ECORE_X_RANDR_EDID_ASPECT_RATIO_16_10 = $2;
  ECORE_X_RANDR_EDID_ASPECT_RATIO_5_4 = $4;
  ECORE_X_RANDR_EDID_ASPECT_RATIO_15_9 = $8;

  ECORE_X_RANDR_EDID_UNKNOWN_VALUE = -(1);
  ECORE_X_SELECTION_TARGET_TARGETS = 'TARGETS';
  ECORE_X_SELECTION_TARGET_TEXT = 'TEXT';
  ECORE_X_SELECTION_TARGET_COMPOUND_TEXT = 'COMPOUND_TEXT';
  ECORE_X_SELECTION_TARGET_STRING = 'STRING';
  ECORE_X_SELECTION_TARGET_UTF8_STRING = 'UTF8_STRING';
  ECORE_X_SELECTION_TARGET_FILENAME = 'FILENAME';
  ECORE_X_SELECTION_TARGET_X_MOZ_URL = 'X_MOZ_URL';
  ECORE_X_DND_VERSION = 5;

type
  PEcore_X_Selection = ^TEcore_X_Selection;
  TEcore_X_Selection = longint;

const
  ECORE_X_SELECTION_PRIMARY = 0;
  ECORE_X_SELECTION_SECONDARY = 1;
  ECORE_X_SELECTION_XDND = 2;
  ECORE_X_SELECTION_CLIPBOARD = 3;
  ECORE_X_SELECTION_OTHER = 4;

type
  PEcore_X_Event_Mode = ^TEcore_X_Event_Mode;
  TEcore_X_Event_Mode = longint;

const
  ECORE_X_EVENT_MODE_NORMAL = 0;
  ECORE_X_EVENT_MODE_WHILE_GRABBED = 1;
  ECORE_X_EVENT_MODE_GRAB = 2;
  ECORE_X_EVENT_MODE_UNGRAB = 3;

type
  PEcore_X_Event_Detail = ^TEcore_X_Event_Detail;
  TEcore_X_Event_Detail = longint;

const
  ECORE_X_EVENT_DETAIL_ANCESTOR = 0;
  ECORE_X_EVENT_DETAIL_VIRTUAL = 1;
  ECORE_X_EVENT_DETAIL_INFERIOR = 2;
  ECORE_X_EVENT_DETAIL_NON_LINEAR = 3;
  ECORE_X_EVENT_DETAIL_NON_LINEAR_VIRTUAL = 4;
  ECORE_X_EVENT_DETAIL_POINTER = 5;
  ECORE_X_EVENT_DETAIL_POINTER_ROOT = 6;
  ECORE_X_EVENT_DETAIL_DETAIL_NONE = 7;

type
  PEcore_X_Event_Mask = ^TEcore_X_Event_Mask;
  TEcore_X_Event_Mask = longint;

const
  ECORE_X_EVENT_MASK_NONE = 0;
  ECORE_X_EVENT_MASK_KEY_DOWN = 1 shl 0;
  ECORE_X_EVENT_MASK_KEY_UP = 1 shl 1;
  ECORE_X_EVENT_MASK_MOUSE_DOWN = 1 shl 2;
  ECORE_X_EVENT_MASK_MOUSE_UP = 1 shl 3;
  ECORE_X_EVENT_MASK_MOUSE_IN = 1 shl 4;
  ECORE_X_EVENT_MASK_MOUSE_OUT = 1 shl 5;
  ECORE_X_EVENT_MASK_MOUSE_MOVE = 1 shl 6;
  ECORE_X_EVENT_MASK_WINDOW_DAMAGE = 1 shl 15;
  ECORE_X_EVENT_MASK_WINDOW_VISIBILITY = 1 shl 16;
  ECORE_X_EVENT_MASK_WINDOW_CONFIGURE = 1 shl 17;
  ECORE_X_EVENT_MASK_WINDOW_RESIZE_MANAGE = 1 shl 18;
  ECORE_X_EVENT_MASK_WINDOW_MANAGE = 1 shl 19;
  ECORE_X_EVENT_MASK_WINDOW_CHILD_CONFIGURE = 1 shl 20;
  ECORE_X_EVENT_MASK_WINDOW_FOCUS_CHANGE = 1 shl 21;
  ECORE_X_EVENT_MASK_WINDOW_PROPERTY = 1 shl 22;
  ECORE_X_EVENT_MASK_WINDOW_COLORMAP = 1 shl 23;
  ECORE_X_EVENT_MASK_WINDOW_GRAB = 1 shl 24;
  ECORE_X_EVENT_MASK_MOUSE_WHEEL = 1 shl 29;
  ECORE_X_EVENT_MASK_WINDOW_FOCUS_IN = 1 shl 30;
  ECORE_X_EVENT_MASK_WINDOW_FOCUS_OUT = 1 shl 31;

type
  PEcore_X_Gravity = ^TEcore_X_Gravity;
  TEcore_X_Gravity = longint;

const
  ECORE_X_GRAVITY_FORGET = 0;
  ECORE_X_GRAVITY_UNMAP = 0;
  ECORE_X_GRAVITY_NW = 1;
  ECORE_X_GRAVITY_N = 2;
  ECORE_X_GRAVITY_NE = 3;
  ECORE_X_GRAVITY_W = 4;
  ECORE_X_GRAVITY_CENTER = 5;
  ECORE_X_GRAVITY_E = 6;
  ECORE_X_GRAVITY_SW = 7;
  ECORE_X_GRAVITY_S = 8;
  ECORE_X_GRAVITY_SE = 9;
  ECORE_X_GRAVITY_STATIC = 10;

type
  PEcore_X_Shape_Type = ^TEcore_X_Shape_Type;
  TEcore_X_Shape_Type = longint;

const
  ECORE_X_SHAPE_BOUNDING = 0;
  ECORE_X_SHAPE_CLIP = 1;
  ECORE_X_SHAPE_INPUT = 2;

type
  PEcore_X_Mapping_Type = ^TEcore_X_Mapping_Type;
  TEcore_X_Mapping_Type = longint;

const
  ECORE_X_MAPPING_MODIFIER = 0;
  ECORE_X_MAPPING_KEYBOARD = 1;
  ECORE_X_MAPPING_MOUSE = 2;

type
  PEcore_X_Randr_Property_Change = ^TEcore_X_Randr_Property_Change;
  TEcore_X_Randr_Property_Change = longint;

const
  ECORE_X_RANDR_PROPERTY_CHANGE_ADD = 0;
  ECORE_X_RANDR_PROPERTY_CHANGE_DEL = 1;

type
  PEcore_X_Netwm_Direction = ^TEcore_X_Netwm_Direction;
  TEcore_X_Netwm_Direction = longint;

const
  ECORE_X_NETWM_DIRECTION_SIZE_TL = 0;
  ECORE_X_NETWM_DIRECTION_SIZE_T = 1;
  ECORE_X_NETWM_DIRECTION_SIZE_TR = 2;
  ECORE_X_NETWM_DIRECTION_SIZE_R = 3;
  ECORE_X_NETWM_DIRECTION_SIZE_BR = 4;
  ECORE_X_NETWM_DIRECTION_SIZE_B = 5;
  ECORE_X_NETWM_DIRECTION_SIZE_BL = 6;
  ECORE_X_NETWM_DIRECTION_SIZE_L = 7;
  ECORE_X_NETWM_DIRECTION_MOVE = 8;
  ECORE_X_NETWM_DIRECTION_CANCEL = 11;

type
  PEcore_X_Error_Code = ^TEcore_X_Error_Code;
  TEcore_X_Error_Code = longint;

const
  ECORE_X_ERROR_CODE_SUCCESS = 0;
  ECORE_X_ERROR_CODE_BAD_REQUEST = 1;
  ECORE_X_ERROR_CODE_BAD_VALUE = 2;
  ECORE_X_ERROR_CODE_BAD_WINDOW = 3;
  ECORE_X_ERROR_CODE_BAD_PIXMAP = 4;
  ECORE_X_ERROR_CODE_BAD_ATOM = 5;
  ECORE_X_ERROR_CODE_BAD_CURSOR = 6;
  ECORE_X_ERROR_CODE_BAD_FONT = 7;
  ECORE_X_ERROR_CODE_BAD_MATCH = 8;
  ECORE_X_ERROR_CODE_BAD_DRAWABLE = 9;
  ECORE_X_ERROR_CODE_BAD_ACCESS = 10;
  ECORE_X_ERROR_CODE_BAD_ALLOC = 11;
  ECORE_X_ERROR_CODE_BAD_COLOR = 12;
  ECORE_X_ERROR_CODE_BAD_GC = 13;
  ECORE_X_ERROR_CODE_BAD_ID_CHOICE = 14;
  ECORE_X_ERROR_CODE_BAD_NAME = 15;
  ECORE_X_ERROR_CODE_BAD_LENGTH = 16;
  ECORE_X_ERROR_CODE_BAD_IMPLEMENTATION = 17;

type
  PEcore_X_Dpms_Mode = ^TEcore_X_Dpms_Mode;
  TEcore_X_Dpms_Mode = longint;

const
  ECORE_X_DPMS_MODE_ON = 0;
  ECORE_X_DPMS_MODE_STANDBY = 1;
  ECORE_X_DPMS_MODE_SUSPEND = 2;
  ECORE_X_DPMS_MODE_OFF = 3;

type
  TEcore_X_Event_Mouse_In = record
  end;
  PEcore_X_Event_Mouse_In = ^TEcore_X_Event_Mouse_In;

type
  TEcore_X_Event_Mouse_Out = record
    modifiers: longint;
    x: longint;
    y: longint;
    same_screen: longint;
    root: record
      x: longint;
      y: longint;
      end;
    win: TEcore_X_Window;
    event_win: TEcore_X_Window;
    root_win: TEcore_X_Window;
    mode: TEcore_X_Event_Mode;
    detail: TEcore_X_Event_Detail;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Mouse_Out = ^TEcore_X_Event_Mouse_Out;

  TEcore_X_Event_Window_Focus_In = record
    win: TEcore_X_Window;
    mode: TEcore_X_Event_Mode;
    detail: TEcore_X_Event_Detail;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Focus_In = ^TEcore_X_Event_Window_Focus_In;

  TEcore_X_Event_Window_Focus_Out = record
    win: TEcore_X_Window;
    mode: TEcore_X_Event_Mode;
    detail: TEcore_X_Event_Detail;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Focus_Out = ^TEcore_X_Event_Window_Focus_Out;

  TEcore_X_Event_Window_Keymap = record
    win: TEcore_X_Window;
  end;
  PEcore_X_Event_Window_Keymap = ^TEcore_X_Event_Window_Keymap;

  TEcore_X_Event_Window_Damage = record
    win: TEcore_X_Window;
    x: longint;
    y: longint;
    w: longint;
    h: longint;
    count: longint;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Damage = ^TEcore_X_Event_Window_Damage;

  TEcore_X_Event_Window_Visibility_Change = record
    win: TEcore_X_Window;
    fully_obscured: longint;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Visibility_Change = ^TEcore_X_Event_Window_Visibility_Change;

  TEcore_X_Event_Window_Create = record
    win: TEcore_X_Window;
    parent: TEcore_X_Window;
    override: longint;
    x: longint;
    y: longint;
    w: longint;
    h: longint;
    border: longint;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Create = ^TEcore_X_Event_Window_Create;

  TEcore_X_Event_Window_Destroy = record
    win: TEcore_X_Window;
    event_win: TEcore_X_Window;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Destroy = ^TEcore_X_Event_Window_Destroy;

  TEcore_X_Event_Window_Hide = record
  end;
  PEcore_X_Event_Window_Hide = ^TEcore_X_Event_Window_Hide;

type
  TEcore_X_Event_Window_Show = record
    win: TEcore_X_Window;
    event_win: TEcore_X_Window;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Show = ^TEcore_X_Event_Window_Show;

  TEcore_X_Event_Window_Show_Request = record
    win: TEcore_X_Window;
    parent: TEcore_X_Window;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Show_Request = ^TEcore_X_Event_Window_Show_Request;

  TEcore_X_Event_Window_Reparent = record
    win: TEcore_X_Window;
    event_win: TEcore_X_Window;
    parent: TEcore_X_Window;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Reparent = ^TEcore_X_Event_Window_Reparent;

  TEcore_X_Event_Window_Configure = record
  end;
  PEcore_X_Event_Window_Configure = ^TEcore_X_Event_Window_Configure;

type
  TEcore_X_Event_Window_Configure_Request = record
    win: TEcore_X_Window;
    parent_win: TEcore_X_Window;
    abovewin: TEcore_X_Window;
    x: longint;
    y: longint;
    w: longint;
    h: longint;
    border: longint;
    detail: TEcore_X_Window_Stack_Mode;
    value_mask: dword;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Configure_Request = ^TEcore_X_Event_Window_Configure_Request;

  TEcore_X_Event_Window_Gravity = record
    win: TEcore_X_Window;
    event_win: TEcore_X_Window;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Gravity = ^TEcore_X_Event_Window_Gravity;

  TEcore_X_Event_Window_Resize_Request = record
    win: TEcore_X_Window;
    w: longint;
    h: longint;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Resize_Request = ^TEcore_X_Event_Window_Resize_Request;

  TEcore_X_Event_Window_Stack = record
    win: TEcore_X_Window;
    event_win: TEcore_X_Window;
    detail: TEcore_X_Window_Stack_Mode;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Stack = ^TEcore_X_Event_Window_Stack;

  TEcore_X_Event_Window_Stack_Request = record
    win: TEcore_X_Window;
    parent: TEcore_X_Window;
    detail: TEcore_X_Window_Stack_Mode;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Stack_Request = ^TEcore_X_Event_Window_Stack_Request;

  TEcore_X_Event_Window_Property = record
    win: TEcore_X_Window;
    atom: TEcore_X_Atom;
    time: TEcore_X_Time;
    state: TEina_Bool;
  end;
  PEcore_X_Event_Window_Property = ^TEcore_X_Event_Window_Property;

  TEcore_X_Event_Window_Colormap = record
  end;
  PEcore_X_Event_Window_Colormap = ^TEcore_X_Event_Window_Colormap;


type
  TEcore_X_Event_Mapping_Change = record
    _type: TEcore_X_Mapping_Type;
    keycode: longint;
    num: longint;
  end;
  PEcore_X_Event_Mapping_Change = ^TEcore_X_Event_Mapping_Change;

  TEcore_X_Event_Selection_Clear = record
    win: TEcore_X_Window;
    selection: TEcore_X_Selection;
    atom: TEcore_X_Atom;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Selection_Clear = ^TEcore_X_Event_Selection_Clear;

  TEcore_X_Event_Selection_Request = record
    owner: TEcore_X_Window;
    requestor: TEcore_X_Window;
    time: TEcore_X_Time;
    selection: TEcore_X_Atom;
    target: TEcore_X_Atom;
    _property: TEcore_X_Atom;
  end;
  PEcore_X_Event_Selection_Request = ^TEcore_X_Event_Selection_Request;

  PEcore_X_Owner_Change_Reason = ^TEcore_X_Owner_Change_Reason;
  TEcore_X_Owner_Change_Reason = longint;

const
  ECORE_X_OWNER_CHANGE_REASON_NEW_OWNER = 0;
  ECORE_X_OWNER_CHANGE_REASON_DESTROY = 1;
  ECORE_X_OWNER_CHANGE_REASON_CLOSE = 2;

type
  TEcore_X_Event_Fixes_Selection_Notify = record
    win: TEcore_X_Window;
    owner: TEcore_X_Window;
    time: TEcore_X_Time;
    selection_time: TEcore_X_Time;
    selection: TEcore_X_Selection;
    atom: TEcore_X_Atom;
    reason: TEcore_X_Owner_Change_Reason;
  end;
  PEcore_X_Event_Fixes_Selection_Notify = ^TEcore_X_Event_Fixes_Selection_Notify;

  TEcore_X_Event_Selection_Notify = record
    win: TEcore_X_Window;
    time: TEcore_X_Time;
    selection: TEcore_X_Selection;
    atom: TEcore_X_Atom;
    target: pchar;
    data: pointer;
    _property: TEcore_X_Atom;
  end;
  PEcore_X_Event_Selection_Notify = ^TEcore_X_Event_Selection_Notify;

const
  ECORE_X_SELECTION_CONTENT_NONE = 0;
  ECORE_X_SELECTION_CONTENT_TEXT = 1;
  ECORE_X_SELECTION_CONTENT_FILES = 2;
  ECORE_X_SELECTION_CONTENT_X_MOZ_URL = 3;
  ECORE_X_SELECTION_CONTENT_TARGETS = 4;
  ECORE_X_SELECTION_CONTENT_CUSTOM = 5;

type
  TEcore_X_Selection_Data = record
    content: longint;
    data: pbyte;
    length: longint;
    format: longint;
    free: function(data: pointer): longint; cdecl;
  end;
  PEcore_X_Selection_Data = ^TEcore_X_Selection_Data;

type
  TEcore_X_Selection_Data_Files = record
    data: TEcore_X_Selection_Data;
    files: ^pchar;
    num_files: longint;
  end;
  PEcore_X_Selection_Data_Files = ^TEcore_X_Selection_Data_Files;

  TEcore_X_Selection_Data_Text = record
    data: TEcore_X_Selection_Data;
    text: pchar;
  end;
  PEcore_X_Selection_Data_Text = ^TEcore_X_Selection_Data_Text;

  TEcore_X_Selection_Data_X_Moz_Url = record
    data: TEcore_X_Selection_Data;
    links: PEina_Inarray;
    link_names: PEina_Inarray;
  end;
  PEcore_X_Selection_Data_X_Moz_Url = ^TEcore_X_Selection_Data_X_Moz_Url;

  TEcore_X_Selection_Data_Targets = record
    data: TEcore_X_Selection_Data;
    targets: ^pchar;
    num_targets: longint;
  end;
  PEcore_X_Selection_Data_Targets = ^TEcore_X_Selection_Data_Targets;

  TEcore_X_Event_Xdnd_Enter = record
    win: TEcore_X_Window;
    source: TEcore_X_Window;
    types: ^pchar;
    num_types: longint;
  end;
  PEcore_X_Event_Xdnd_Enter = ^TEcore_X_Event_Xdnd_Enter;

  TEcore_X_Event_Xdnd_Position = record
    win: TEcore_X_Window;
    source: TEcore_X_Window;
    position: record
      x: longint;
      y: longint;
      end;
    action: TEcore_X_Atom;
  end;
  PEcore_X_Event_Xdnd_Position = ^TEcore_X_Event_Xdnd_Position;

  TEcore_X_Xdnd_Position = record
    win: TEcore_X_Window;
    prev: TEcore_X_Window;
    position: record
      x: longint;
      y: longint;
      end;
  end;
  PEcore_X_Xdnd_Position = ^TEcore_X_Xdnd_Position;

  TEcore_X_Event_Xdnd_Status = record
  end;
  PEcore_X_Event_Xdnd_Status = ^TEcore_X_Event_Xdnd_Status;

type
  TEcore_X_Event_Xdnd_Leave = record
    win: TEcore_X_Window;
    source: TEcore_X_Window;
  end;
  PEcore_X_Event_Xdnd_Leave = ^TEcore_X_Event_Xdnd_Leave;

  TEcore_X_Event_Xdnd_Drop = record
    win: TEcore_X_Window;
    source: TEcore_X_Window;
    action: TEcore_X_Atom;
    position: record
      x: longint;
      y: longint;
      end;
  end;
  PEcore_X_Event_Xdnd_Drop = ^TEcore_X_Event_Xdnd_Drop;

  PEcore_X_Event_Xdnd_Finished = ^TEcore_X_Event_Xdnd_Finished;
  TEcore_X_Event_Xdnd_Finished = record
  end;

type
  TEcore_X_Event_Client_Message = record
    win: TEcore_X_Window;
    message_type: TEcore_X_Atom;
    format: longint;
    data: record
      case longint of
        0: (b: array[0..19] of char);
        1: (s: array[0..9] of smallint);
        2: (l: array[0..4] of longint);
      end;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Client_Message = ^TEcore_X_Event_Client_Message;

  TEcore_X_Event_Window_Shape = record
  end;
  PEcore_X_Event_Window_Shape = ^TEcore_X_Event_Window_Shape;

type
  PEcore_X_Event_Screensaver_Notify = ^TEcore_X_Event_Screensaver_Notify;
  TEcore_X_Event_Screensaver_Notify = record
  end;

type
  TEcore_X_Event_Sync_Counter = record
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Sync_Counter = ^TEcore_X_Event_Sync_Counter;

  TEcore_X_Event_Sync_Alarm = record
    time: TEcore_X_Time;
    alarm: TEcore_X_Sync_Alarm;
  end;
  PEcore_X_Event_Sync_Alarm = ^TEcore_X_Event_Sync_Alarm;

  TEcore_X_Randr_Screen_Size = record
    width: longint;
    height: longint;
  end;
  PEcore_X_Randr_Screen_Size = ^TEcore_X_Randr_Screen_Size;

  TEcore_X_Randr_Screen_Size_MM = record
    width: longint;
    height: longint;
    width_mm: longint;
    height_mm: longint;
  end;
  PEcore_X_Randr_Screen_Size_MM = ^TEcore_X_Randr_Screen_Size_MM;

  TEcore_X_Randr_Crtc_Info = record
    timestamp: TEcore_X_Time;
    x: longint;
    y: longint;
    width: dword;
    height: dword;
    mode: TEcore_X_Randr_Mode;
    rotation: TEcore_X_Randr_Orientation;
    noutput: longint;
    outputs: PEcore_X_Randr_Output;
    rotations: TEcore_X_Randr_Orientation;
    npossible: longint;
    possible: PEcore_X_Randr_Output;
  end;
  PEcore_X_Randr_Crtc_Info = ^TEcore_X_Randr_Crtc_Info;

  TEcore_X_Event_Screen_Change = record
    win: TEcore_X_Window;
    root: TEcore_X_Window;
    size: TEcore_X_Randr_Screen_Size_MM;
    time: TEcore_X_Time;
    config_time: TEcore_X_Time;
    orientation: TEcore_X_Randr_Orientation;
    subpixel_order: TEcore_X_Render_Subpixel_Order;
    size_id: TEcore_X_Randr_Size_ID;
  end;
  PEcore_X_Event_Screen_Change = ^TEcore_X_Event_Screen_Change;

  TEcore_X_Event_Randr_Crtc_Change = record
    win: TEcore_X_Window;
    crtc: TEcore_X_Randr_Crtc;
    mode: TEcore_X_Randr_Mode;
    orientation: TEcore_X_Randr_Orientation;
    geo: TEina_Rectangle;
  end;
  PEcore_X_Event_Randr_Crtc_Change = ^TEcore_X_Event_Randr_Crtc_Change;

  TEcore_X_Event_Randr_Output_Change = record
    win: TEcore_X_Window;
    output: TEcore_X_Randr_Output;
    crtc: TEcore_X_Randr_Crtc;
    mode: TEcore_X_Randr_Mode;
    orientation: TEcore_X_Randr_Orientation;
    connection: TEcore_X_Randr_Connection_Status;
    subpixel_order: TEcore_X_Render_Subpixel_Order;
  end;
  PEcore_X_Event_Randr_Output_Change = ^TEcore_X_Event_Randr_Output_Change;

  TEcore_X_Event_Randr_Output_Property_Notify = record
    win: TEcore_X_Window;
    output: TEcore_X_Randr_Output;
    _property: TEcore_X_Atom;
    time: TEcore_X_Time;
    state: TEcore_X_Randr_Property_Change;
  end;
  PEcore_X_Event_Randr_Output_Property_Notify = ^TEcore_X_Event_Randr_Output_Property_Notify;

  TEcore_X_Event_Window_Delete_Request = record
    win: TEcore_X_Window;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Delete_Request = ^TEcore_X_Event_Window_Delete_Request;

  TEcore_X_Event_Window_Prop_Title_Change = record
    win: TEcore_X_Window;
    title: pchar;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Prop_Title_Change = ^TEcore_X_Event_Window_Prop_Title_Change;

  TEcore_X_Event_Window_Prop_Visible_Title_Change = record
    win: TEcore_X_Window;
    title: pchar;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Prop_Visible_Title_Change = ^TEcore_X_Event_Window_Prop_Visible_Title_Change;

  TEcore_X_Event_Window_Prop_Icon_Name_Change = record
    win: TEcore_X_Window;
    name: pchar;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Prop_Icon_Name_Change = ^TEcore_X_Event_Window_Prop_Icon_Name_Change;

  TEcore_X_Event_Window_Prop_Visible_Icon_Name_Change = record
    win: TEcore_X_Window;
    name: pchar;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Prop_Visible_Icon_Name_Change = ^TEcore_X_Event_Window_Prop_Visible_Icon_Name_Change;

  TEcore_X_Event_Window_Prop_Client_Machine_Change = record
    win: TEcore_X_Window;
    name: pchar;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Prop_Client_Machine_Change = ^TEcore_X_Event_Window_Prop_Client_Machine_Change;

  TEcore_X_Event_Window_Prop_Name_Class_Change = record
    win: TEcore_X_Window;
    name: pchar;
    clas: pchar;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Prop_Name_Class_Change = ^TEcore_X_Event_Window_Prop_Name_Class_Change;

  TEcore_X_Event_Window_Prop_Pid_Change = record
    win: TEcore_X_Window;
    pid: Tpid_t;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Prop_Pid_Change = ^TEcore_X_Event_Window_Prop_Pid_Change;

  TEcore_X_Event_Window_Prop_Desktop_Change = record
    win: TEcore_X_Window;
    desktop: longint;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Window_Prop_Desktop_Change = ^TEcore_X_Event_Window_Prop_Desktop_Change;

  TEcore_X_Event_Startup_Sequence = record
    win: TEcore_X_Window;
  end;
  PEcore_X_Event_Startup_Sequence = ^TEcore_X_Event_Startup_Sequence;

  TEcore_X_Event_Window_Move_Resize_Request = record
    win: TEcore_X_Window;
    x: longint;
    y: longint;
    direction: longint;
    button: longint;
    source: longint;
  end;
  PEcore_X_Event_Window_Move_Resize_Request = ^TEcore_X_Event_Window_Move_Resize_Request;

  TEcore_X_Event_Window_State_Request = record
    win: TEcore_X_Window;
    action: TEcore_X_Window_State_Action;
    state: array[0..1] of TEcore_X_Window_State;
    source: longint;
  end;
  PEcore_X_Event_Window_State_Request = ^TEcore_X_Event_Window_State_Request;

  TEcore_X_Event_Frame_Extents_Request = record
    win: TEcore_X_Window;
  end;
  PEcore_X_Event_Frame_Extents_Request = ^TEcore_X_Event_Frame_Extents_Request;

  TEcore_X_Event_Ping = record
    win: TEcore_X_Window;
    event_win: TEcore_X_Window;
    time: TEcore_X_Time;
  end;
  PEcore_X_Event_Ping = ^TEcore_X_Event_Ping;

  TEcore_X_Event_Desktop_Change = record
    win: TEcore_X_Window;
    desk: dword;
    source: longint;
  end;
  PEcore_X_Event_Desktop_Change = ^TEcore_X_Event_Desktop_Change;

  TEcore_X_Event_Generic = record
    extension: longint;
    evtype: longint;
    cookie: dword;
    data: pointer;
  end;
  PEcore_X_Event_Generic = ^TEcore_X_Event_Generic;

  PEcore_X_Present_Event_Mask = ^TEcore_X_Present_Event_Mask;
  TEcore_X_Present_Event_Mask = longint;

const
  ECORE_X_PRESENT_EVENT_MASK_NO_EVENT = 0;
  ECORE_X_PRESENT_EVENT_MASK_CONFIGURE_NOTIFY = 1;
  ECORE_X_PRESENT_EVENT_MASK_COMPLETE_NOTIFY = 2;
  ECORE_X_PRESENT_EVENT_MASK_IDLE_NOTIFY = 4;

type
  TEcore_X_Present = record
    win: TEcore_X_Window;
    serial: dword;
  end;
  PEcore_X_Present = ^TEcore_X_Present;

  TEcore_X_Event_Present_Configure = record
    win: TEcore_X_Window;
    x: longint;
    y: longint;
    width: dword;
    height: dword;
    off_x: longint;
    off_y: longint;
    pixmap_width: longint;
    pixmap_height: longint;
    pixmap_flags: longint;
  end;
  PEcore_X_Event_Present_Configure = ^TEcore_X_Event_Present_Configure;
  PEcore_X_Present_Complete_Mode = ^TEcore_X_Present_Complete_Mode;
  TEcore_X_Present_Complete_Mode = longint;

const
  ECORE_X_PRESENT_COMPLETE_MODE_COPY = 0;
  ECORE_X_PRESENT_COMPLETE_MODE_FLIP = 1;
  ECORE_X_PRESENT_COMPLETE_MODE_SKIP = 2;

type
  TEcore_X_Event_Present_Complete = record
  end;
  PEcore_X_Event_Present_Complete = ^TEcore_X_Event_Present_Complete;

type
  TEcore_X_Event_Present_Idle = record
    win: TEcore_X_Window;
    serial: dword;
    pixmap: TEcore_X_Pixmap;
    idle_fence: TEcore_X_Sync_Fence;
  end;
  PEcore_X_Event_Present_Idle = ^TEcore_X_Event_Present_Idle;

var
  ECORE_X_EVENT_ANY: longint; cvar;external libecore_x;
  ECORE_X_EVENT_MOUSE_IN: longint; cvar;external libecore_x;
  ECORE_X_EVENT_MOUSE_OUT: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_FOCUS_IN: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_FOCUS_OUT: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_KEYMAP: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_DAMAGE: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_VISIBILITY_CHANGE: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_CREATE: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_DESTROY: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_HIDE: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_SHOW: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_SHOW_REQUEST: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_REPARENT: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_CONFIGURE: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_CONFIGURE_REQUEST: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_GRAVITY: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_RESIZE_REQUEST: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_STACK: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_STACK_REQUEST: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_PROPERTY: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_COLORMAP: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_MAPPING: longint; cvar;external libecore_x;
  ECORE_X_EVENT_MAPPING_CHANGE: longint; cvar;external libecore_x;
  ECORE_X_EVENT_SELECTION_CLEAR: longint; cvar;external libecore_x;
  ECORE_X_EVENT_SELECTION_REQUEST: longint; cvar;external libecore_x;
  ECORE_X_EVENT_SELECTION_NOTIFY: longint; cvar;external libecore_x;
  ECORE_X_EVENT_FIXES_SELECTION_NOTIFY: longint; cvar;external libecore_x;
  ECORE_X_EVENT_CLIENT_MESSAGE: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_SHAPE: longint; cvar;external libecore_x;
  ECORE_X_EVENT_SCREENSAVER_NOTIFY: longint; cvar;external libecore_x;
  ECORE_X_EVENT_GESTURE_NOTIFY_FLICK: longint; cvar;external libecore_x;
  ECORE_X_EVENT_GESTURE_NOTIFY_PAN: longint; cvar;external libecore_x;
  ECORE_X_EVENT_GESTURE_NOTIFY_PINCHROTATION: longint; cvar;external libecore_x;
  ECORE_X_EVENT_GESTURE_NOTIFY_TAP: longint; cvar;external libecore_x;
  ECORE_X_EVENT_GESTURE_NOTIFY_TAPNHOLD: longint; cvar;external libecore_x;
  ECORE_X_EVENT_GESTURE_NOTIFY_HOLD: longint; cvar;external libecore_x;
  ECORE_X_EVENT_GESTURE_NOTIFY_GROUP: longint; cvar;external libecore_x;
  ECORE_X_EVENT_SYNC_COUNTER: longint; cvar;external libecore_x;
  ECORE_X_EVENT_SYNC_ALARM: longint; cvar;external libecore_x;
  ECORE_X_EVENT_SCREEN_CHANGE: longint; cvar;external libecore_x;
  ECORE_X_EVENT_RANDR_CRTC_CHANGE: longint; cvar;external libecore_x;
  ECORE_X_EVENT_RANDR_OUTPUT_CHANGE: longint; cvar;external libecore_x;
  ECORE_X_EVENT_RANDR_OUTPUT_PROPERTY_NOTIFY: longint; cvar;external libecore_x;
  ECORE_X_EVENT_DAMAGE_NOTIFY: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_DELETE_REQUEST: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_MOVE_RESIZE_REQUEST: longint; cvar;external libecore_x;
  ECORE_X_EVENT_WINDOW_STATE_REQUEST: longint; cvar;external libecore_x;
  ECORE_X_EVENT_FRAME_EXTENTS_REQUEST: longint; cvar;external libecore_x;
  ECORE_X_EVENT_PING: longint; cvar;external libecore_x;
  ECORE_X_EVENT_DESKTOP_CHANGE: longint; cvar;external libecore_x;
  ECORE_X_EVENT_STARTUP_SEQUENCE_NEW: longint; cvar;external libecore_x;
  ECORE_X_EVENT_STARTUP_SEQUENCE_CHANGE: longint; cvar;external libecore_x;
  ECORE_X_EVENT_STARTUP_SEQUENCE_REMOVE: longint; cvar;external libecore_x;
  ECORE_X_EVENT_XKB_STATE_NOTIFY: longint; cvar;external libecore_x;
  ECORE_X_EVENT_XKB_NEWKBD_NOTIFY: longint; cvar;external libecore_x;
  ECORE_X_EVENT_GENERIC: longint; cvar;external libecore_x;
  ECORE_X_EVENT_PRESENT_CONFIGURE: longint; cvar;external libecore_x;
  ECORE_X_EVENT_PRESENT_COMPLETE: longint; cvar;external libecore_x;
  ECORE_X_EVENT_PRESENT_IDLE: longint; cvar;external libecore_x;
  ECORE_X_EVENT_XDND_ENTER: longint; cvar;external libecore_x;
  ECORE_X_EVENT_XDND_POSITION: longint; cvar;external libecore_x;
  ECORE_X_EVENT_XDND_STATUS: longint; cvar;external libecore_x;
  ECORE_X_EVENT_XDND_LEAVE: longint; cvar;external libecore_x;
  ECORE_X_EVENT_XDND_DROP: longint; cvar;external libecore_x;
  ECORE_X_EVENT_XDND_FINISHED: longint; cvar;external libecore_x;
  ECORE_X_MODIFIER_SHIFT: longint; cvar;external libecore_x;
  ECORE_X_MODIFIER_CTRL: longint; cvar;external libecore_x;
  ECORE_X_MODIFIER_ALT: longint; cvar;external libecore_x;
  ECORE_X_MODIFIER_WIN: longint; cvar;external libecore_x;
  ECORE_X_MODIFIER_ALTGR: longint; cvar;external libecore_x;
  ECORE_X_LOCK_SCROLL: longint; cvar;external libecore_x;
  ECORE_X_LOCK_NUM: longint; cvar;external libecore_x;
  ECORE_X_LOCK_CAPS: longint; cvar;external libecore_x;
  ECORE_X_LOCK_SHIFT: longint; cvar;external libecore_x;
  ECORE_X_RAW_BUTTON_PRESS: longint; cvar;external libecore_x;
  ECORE_X_RAW_BUTTON_RELEASE: longint; cvar;external libecore_x;
  ECORE_X_RAW_MOTION: longint; cvar;external libecore_x;
  ECORE_X_DEVICES_CHANGE: longint; cvar;external libecore_x;

type
  PEcore_X_WM_Protocol = ^TEcore_X_WM_Protocol;
  TEcore_X_WM_Protocol = longint;

const
  ECORE_X_WM_PROTOCOL_DELETE_REQUEST = 0;
  ECORE_X_WM_PROTOCOL_TAKE_FOCUS = 1;
  ECORE_X_NET_WM_PROTOCOL_PING = 2;
  ECORE_X_NET_WM_PROTOCOL_SYNC_REQUEST = 3;
  ECORE_X_WM_PROTOCOL_NUM = 4;

type
  PEcore_X_Window_Input_Mode = ^TEcore_X_Window_Input_Mode;
  TEcore_X_Window_Input_Mode = longint;

const
  ECORE_X_WINDOW_INPUT_MODE_NONE = 0;
  ECORE_X_WINDOW_INPUT_MODE_PASSIVE = 1;
  ECORE_X_WINDOW_INPUT_MODE_ACTIVE_LOCAL = 2;
  ECORE_X_WINDOW_INPUT_MODE_ACTIVE_GLOBAL = 3;

type
  PEcore_X_Window_State_Hint = ^TEcore_X_Window_State_Hint;
  TEcore_X_Window_State_Hint = longint;

const
  ECORE_X_WINDOW_STATE_HINT_NONE = -(1);
  ECORE_X_WINDOW_STATE_HINT_WITHDRAWN = (-(1)) + 1;
  ECORE_X_WINDOW_STATE_HINT_NORMAL = (-(1)) + 2;
  ECORE_X_WINDOW_STATE_HINT_ICONIC = (-(1)) + 3;

type
  PPEcore_X_Window_Type = ^PEcore_X_Window_Type;
  PEcore_X_Window_Type = ^TEcore_X_Window_Type;
  TEcore_X_Window_Type = longint;

const
  ECORE_X_WINDOW_TYPE_UNKNOWN = 0;
  ECORE_X_WINDOW_TYPE_DESKTOP = 1;
  ECORE_X_WINDOW_TYPE_DOCK = 2;
  ECORE_X_WINDOW_TYPE_TOOLBAR = 3;
  ECORE_X_WINDOW_TYPE_MENU = 4;
  ECORE_X_WINDOW_TYPE_UTILITY = 5;
  ECORE_X_WINDOW_TYPE_SPLASH = 6;
  ECORE_X_WINDOW_TYPE_DIALOG = 7;
  ECORE_X_WINDOW_TYPE_NORMAL = 8;
  ECORE_X_WINDOW_TYPE_DROPDOWN_MENU = 9;
  ECORE_X_WINDOW_TYPE_POPUP_MENU = 10;
  ECORE_X_WINDOW_TYPE_TOOLTIP = 11;
  ECORE_X_WINDOW_TYPE_NOTIFICATION = 12;
  ECORE_X_WINDOW_TYPE_COMBO = 13;
  ECORE_X_WINDOW_TYPE_DND = 14;

type
  PPEcore_X_Action = ^PEcore_X_Action;
  PEcore_X_Action = ^TEcore_X_Action;
  TEcore_X_Action = longint;

const
  ECORE_X_ACTION_MOVE = 0;
  ECORE_X_ACTION_RESIZE = 1;
  ECORE_X_ACTION_MINIMIZE = 2;
  ECORE_X_ACTION_SHADE = 3;
  ECORE_X_ACTION_STICK = 4;
  ECORE_X_ACTION_MAXIMIZE_HORZ = 5;
  ECORE_X_ACTION_MAXIMIZE_VERT = 6;
  ECORE_X_ACTION_FULLSCREEN = 7;
  ECORE_X_ACTION_CHANGE_DESKTOP = 8;
  ECORE_X_ACTION_CLOSE = 9;
  ECORE_X_ACTION_ABOVE = 10;
  ECORE_X_ACTION_BELOW = 11;

type
  PEcore_X_Window_Configure_Mask = ^TEcore_X_Window_Configure_Mask;
  TEcore_X_Window_Configure_Mask = longint;

const
  ECORE_X_WINDOW_CONFIGURE_MASK_X = 1 shl 0;
  ECORE_X_WINDOW_CONFIGURE_MASK_Y = 1 shl 1;
  ECORE_X_WINDOW_CONFIGURE_MASK_W = 1 shl 2;
  ECORE_X_WINDOW_CONFIGURE_MASK_H = 1 shl 3;
  ECORE_X_WINDOW_CONFIGURE_MASK_BORDER_WIDTH = 1 shl 4;
  ECORE_X_WINDOW_CONFIGURE_MASK_SIBLING = 1 shl 5;
  ECORE_X_WINDOW_CONFIGURE_MASK_STACK_MODE = 1 shl 6;

type
  PEcore_X_Virtual_Keyboard_State = ^TEcore_X_Virtual_Keyboard_State;
  TEcore_X_Virtual_Keyboard_State = longint;

const
  ECORE_X_VIRTUAL_KEYBOARD_STATE_UNKNOWN = 0;
  ECORE_X_VIRTUAL_KEYBOARD_STATE_OFF = 1;
  ECORE_X_VIRTUAL_KEYBOARD_STATE_ON = 2;
  ECORE_X_VIRTUAL_KEYBOARD_STATE_ALPHA = 3;
  ECORE_X_VIRTUAL_KEYBOARD_STATE_NUMERIC = 4;
  ECORE_X_VIRTUAL_KEYBOARD_STATE_PIN = 5;
  ECORE_X_VIRTUAL_KEYBOARD_STATE_PHONE_NUMBER = 6;
  ECORE_X_VIRTUAL_KEYBOARD_STATE_HEX = 7;
  ECORE_X_VIRTUAL_KEYBOARD_STATE_TERMINAL = 8;
  ECORE_X_VIRTUAL_KEYBOARD_STATE_PASSWORD = 9;
  ECORE_X_VIRTUAL_KEYBOARD_STATE_IP = 10;
  ECORE_X_VIRTUAL_KEYBOARD_STATE_HOST = 11;
  ECORE_X_VIRTUAL_KEYBOARD_STATE_FILE = 12;
  ECORE_X_VIRTUAL_KEYBOARD_STATE_URL = 13;
  ECORE_X_VIRTUAL_KEYBOARD_STATE_KEYPAD = 14;
  ECORE_X_VIRTUAL_KEYBOARD_STATE_J2ME = 15;

type
  PEcore_X_Illume_Mode = ^TEcore_X_Illume_Mode;
  TEcore_X_Illume_Mode = longint;

const
  ECORE_X_ILLUME_MODE_UNKNOWN = 0;
  ECORE_X_ILLUME_MODE_SINGLE = 1;
  ECORE_X_ILLUME_MODE_DUAL_TOP = 2;
  ECORE_X_ILLUME_MODE_DUAL_LEFT = 3;

type
  PEcore_X_Illume_Quickpanel_State = ^TEcore_X_Illume_Quickpanel_State;
  TEcore_X_Illume_Quickpanel_State = longint;

const
  ECORE_X_ILLUME_QUICKPANEL_STATE_UNKNOWN = 0;
  ECORE_X_ILLUME_QUICKPANEL_STATE_OFF = 1;
  ECORE_X_ILLUME_QUICKPANEL_STATE_ON = 2;

type
  PEcore_X_Illume_Indicator_State = ^TEcore_X_Illume_Indicator_State;
  TEcore_X_Illume_Indicator_State = longint;

const
  ECORE_X_ILLUME_INDICATOR_STATE_UNKNOWN = 0;
  ECORE_X_ILLUME_INDICATOR_STATE_OFF = 1;
  ECORE_X_ILLUME_INDICATOR_STATE_ON = 2;

type
  PEcore_X_Illume_Clipboard_State = ^TEcore_X_Illume_Clipboard_State;
  TEcore_X_Illume_Clipboard_State = longint;

const
  ECORE_X_ILLUME_CLIPBOARD_STATE_UNKNOWN = 0;
  ECORE_X_ILLUME_CLIPBOARD_STATE_OFF = 1;
  ECORE_X_ILLUME_CLIPBOARD_STATE_ON = 2;

type
  PEcore_X_Illume_Indicator_Opacity_Mode = ^TEcore_X_Illume_Indicator_Opacity_Mode;
  TEcore_X_Illume_Indicator_Opacity_Mode = longint;

const
  ECORE_X_ILLUME_INDICATOR_OPACITY_UNKNOWN = 0;
  ECORE_X_ILLUME_INDICATOR_OPAQUE = 1;
  ECORE_X_ILLUME_INDICATOR_TRANSLUCENT = 2;
  ECORE_X_ILLUME_INDICATOR_TRANSPARENT = 3;

type
  PEcore_X_Illume_Indicator_Type_Mode = ^TEcore_X_Illume_Indicator_Type_Mode;
  TEcore_X_Illume_Indicator_Type_Mode = longint;

const
  ECORE_X_ILLUME_INDICATOR_TYPE_UNKNOWN = 0;
  ECORE_X_ILLUME_INDICATOR_TYPE_1 = 1;
  ECORE_X_ILLUME_INDICATOR_TYPE_2 = 2;
  ECORE_X_ILLUME_INDICATOR_TYPE_3 = 3;

type
  PEcore_X_Illume_Window_State = ^TEcore_X_Illume_Window_State;
  TEcore_X_Illume_Window_State = longint;

const
  ECORE_X_ILLUME_WINDOW_STATE_NORMAL = 0;
  ECORE_X_ILLUME_WINDOW_STATE_FLOATING = 1;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEcore_X_Stack_Type = ^TEcore_X_Stack_Type;
  TEcore_X_Stack_Type = longint;

const
  ECORE_X_STACK_NONE = 0;
  ECORE_X_STACK_BASE = 1;
  ECORE_X_STACK_STANDARD = 2;
  ECORE_X_STACK_LAST = 3;

type
  PEcore_X_Stack_Position = ^TEcore_X_Stack_Position;
  TEcore_X_Stack_Position = longint;

const
  ECORE_X_STACK_POSITION_NONE = 0;
  ECORE_X_STACK_POSITION_BOTTOM = 1;
  ECORE_X_STACK_POSITION_MIDDLE = 2;
  ECORE_X_STACK_POSITION_TOP = 3;
  ECORE_X_STACK_POSITION_LAST = 4;
  {$endif}

const
  ECORE_X_WINDOW_LAYER_BELOW = 2;
  ECORE_X_WINDOW_LAYER_NORMAL = 4;
  ECORE_X_WINDOW_LAYER_ABOVE = 6;
  ECORE_X_PROP_LIST_REMOVE = 0;
  ECORE_X_PROP_LIST_ADD = 1;
  ECORE_X_PROP_LIST_TOGGLE = 2;

function ecore_x_init(name: pchar): longint; cdecl; external libecore_x;
function ecore_x_init_from_display(display: PEcore_X_Display): longint; cdecl; external libecore_x;
function ecore_x_shutdown: longint; cdecl; external libecore_x;
function ecore_x_disconnect: longint; cdecl; external libecore_x;
function ecore_x_display_get: PEcore_X_Display; cdecl; external libecore_x;
function ecore_x_connection_get: PEcore_X_Connection; cdecl; external libecore_x;
function ecore_x_fd_get: longint; cdecl; external libecore_x;
function ecore_x_default_screen_get: PEcore_X_Screen; cdecl; external libecore_x;
procedure ecore_x_screen_size_get(screen: PEcore_X_Screen; w: Plongint; h: Plongint); cdecl; external libecore_x;
function ecore_x_screen_count_get: longint; cdecl; external libecore_x;
function ecore_x_screen_index_get(screen: PEcore_X_Screen): longint; cdecl; external libecore_x;
function ecore_x_screen_get(index: longint): PEcore_X_Screen; cdecl; external libecore_x;
procedure ecore_x_double_click_time_set(t: double); cdecl; external libecore_x;
function ecore_x_double_click_time_get: double; cdecl; external libecore_x;
procedure ecore_x_flush; cdecl; external libecore_x;
procedure ecore_x_sync; cdecl; external libecore_x;
procedure ecore_x_killall(root: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_kill(win: TEcore_X_Window); cdecl; external libecore_x;
function ecore_x_dpi_get: longint; cdecl; external libecore_x;
function ecore_x_bell(percent: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_visual_id_get(visual: TEcore_X_Visual): dword; cdecl; external libecore_x;
function ecore_x_default_visual_get(disp: PEcore_X_Display; screen: PEcore_X_Screen): TEcore_X_Visual; cdecl; external libecore_x;
function ecore_x_default_colormap_get(disp: PEcore_X_Display; screen: PEcore_X_Screen): TEcore_X_Colormap; cdecl; external libecore_x;
function ecore_x_default_depth_get(disp: PEcore_X_Display; screen: PEcore_X_Screen): longint; cdecl; external libecore_x;
function ecore_x_current_time_get: TEcore_X_Time; cdecl; external libecore_x;

type
  Tecore_x_error_handler_set_func = procedure(data: pointer); cdecl;

procedure ecore_x_error_handler_set(func: Tecore_x_error_handler_set_func; data: pointer); cdecl; external libecore_x;
procedure ecore_x_io_error_handler_set(func: Tecore_x_error_handler_set_func; data: pointer); cdecl; external libecore_x;
function ecore_x_error_request_get: longint; cdecl; external libecore_x;
function ecore_x_error_code_get: longint; cdecl; external libecore_x;
function ecore_x_error_resource_id_get: TEcore_X_ID; cdecl; external libecore_x;
procedure ecore_x_event_mask_set(w: TEcore_X_Window; mask: TEcore_X_Event_Mask); cdecl; external libecore_x;
procedure ecore_x_event_mask_unset(w: TEcore_X_Window; mask: TEcore_X_Event_Mask); cdecl; external libecore_x;
function ecore_x_selection_notify_send(requestor: TEcore_X_Window; selection: TEcore_X_Atom; target: TEcore_X_Atom; _property: TEcore_X_Atom; time: TEcore_X_Time): TEina_Bool; cdecl; external libecore_x;
function ecore_x_selection_primary_set(w: TEcore_X_Window; data: pointer; size: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_selection_primary_clear: TEina_Bool; cdecl; external libecore_x;
function ecore_x_selection_secondary_set(w: TEcore_X_Window; data: pointer; size: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_selection_secondary_clear: TEina_Bool; cdecl; external libecore_x;
function ecore_x_selection_xdnd_set(w: TEcore_X_Window; data: pointer; size: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_selection_xdnd_clear: TEina_Bool; cdecl; external libecore_x;
function ecore_x_selection_clipboard_set(w: TEcore_X_Window; data: pointer; size: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_selection_clipboard_clear: TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_selection_primary_request(w: TEcore_X_Window; target: pchar); cdecl; external libecore_x;
procedure ecore_x_selection_secondary_request(w: TEcore_X_Window; target: pchar); cdecl; external libecore_x;
procedure ecore_x_selection_xdnd_request(w: TEcore_X_Window; target: pchar); cdecl; external libecore_x;
procedure ecore_x_selection_clipboard_request(w: TEcore_X_Window; target: pchar); cdecl; external libecore_x;
function ecore_x_selection_convert(selection: TEcore_X_Atom; target: TEcore_X_Atom; data_ret: Ppointer; len: Plongint; targprop: PEcore_X_Atom;
  targsize: Plongint): TEina_Bool; cdecl; external libecore_x;

type
  Tecore_x_selection_converter_add_func = function(target: pchar; data: pointer; size: longint; data_ret: Ppointer; size_ret: Plongint; para6: PEcore_X_Atom; para7: Plongint): TEina_Bool; cdecl;

procedure ecore_x_selection_converter_add(target: pchar; func: Tecore_x_selection_converter_add_func); cdecl; external libecore_x;

type
  Tecore_x_selection_converter_atom_add_func = function(target: pchar; data: pointer; size: longint; data_ret: Ppointer; size_ret: Plongint; tprop: PEcore_X_Atom; tsize: Plongint): TEina_Bool; cdecl;

procedure ecore_x_selection_converter_atom_add(target: TEcore_X_Atom; func: Tecore_x_selection_converter_atom_add_func); cdecl; external libecore_x;
procedure ecore_x_selection_converter_del(target: pchar); cdecl; external libecore_x;
procedure ecore_x_selection_converter_atom_del(target: TEcore_X_Atom); cdecl; external libecore_x;

type
  Tecore_x_selection_parser_add_func = function(target: pchar; data: pointer; size: longint; format: longint): pointer; cdecl;

procedure ecore_x_selection_parser_add(target: pchar; func: Tecore_x_selection_parser_add_func); cdecl; external libecore_x;
procedure ecore_x_selection_parser_del(target: pchar); cdecl; external libecore_x;
procedure ecore_x_selection_owner_set(win: TEcore_X_Window; atom: TEcore_X_Atom; tm: TEcore_X_Time); cdecl; external libecore_x;
function ecore_x_selection_owner_get(atom: TEcore_X_Atom): TEcore_X_Window; cdecl; external libecore_x;
function ecore_x_selection_converter_text(target: pchar; data: pointer; size: longint; data_ret: Ppointer; size_ret: Plongint;
  targprop: PEcore_X_Atom; s: Plongint): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_dnd_aware_set(win: TEcore_X_Window; on: TEina_Bool); cdecl; external libecore_x;
function ecore_x_dnd_version_get(win: TEcore_X_Window): longint; cdecl; external libecore_x;
function ecore_x_dnd_type_isset(win: TEcore_X_Window; _type: pchar): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_dnd_type_set(win: TEcore_X_Window; _type: pchar; on: TEina_Bool); cdecl; external libecore_x;
procedure ecore_x_dnd_types_set(win: TEcore_X_Window; types: PPchar; num_types: dword); cdecl; external libecore_x;
procedure ecore_x_dnd_actions_set(win: TEcore_X_Window; actions: PEcore_X_Atom; num_actions: dword); cdecl; external libecore_x;
function ecore_x_dnd_begin(source: TEcore_X_Window; data: pbyte; size: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_dnd_drop: TEina_Bool; cdecl; external libecore_x;
function ecore_x_dnd_self_begin(source: TEcore_X_Window; data: pbyte; size: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_dnd_self_drop: TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_dnd_send_status(will_accept: TEina_Bool; suppress: TEina_Bool; rectangle: TEcore_X_Rectangle; action: TEcore_X_Atom); cdecl; external libecore_x;
procedure ecore_x_dnd_send_finished; cdecl; external libecore_x;
procedure ecore_x_dnd_source_action_set(action: TEcore_X_Atom); cdecl; external libecore_x;
function ecore_x_dnd_source_action_get: TEcore_X_Atom; cdecl; external libecore_x;

type
  Tecore_x_dnd_callback_pos_update_set_func = procedure(para1: pointer; data: PEcore_X_Xdnd_Position); cdecl;

procedure ecore_x_dnd_callback_pos_update_set(cb: Tecore_x_dnd_callback_pos_update_set_func; data: pointer); cdecl; external libecore_x;
function ecore_x_dnd_abort(xwin_source: TEcore_X_Window): TEina_Bool; cdecl; external libecore_x;
function ecore_x_window_full_new(parent: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint;
  visual: PEcore_X_Visual; colormap: TEcore_X_Colormap; depth: longint; override: TEina_Bool): TEcore_X_Window; cdecl; external libecore_x;
function ecore_x_window_new(parent: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint): TEcore_X_Window; cdecl; external libecore_x;
function ecore_x_window_override_new(parent: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint): TEcore_X_Window; cdecl; external libecore_x;
function ecore_x_window_argb_get(win: TEcore_X_Window): longint; cdecl; external libecore_x;
function ecore_x_window_manager_argb_new(parent: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint): TEcore_X_Window; cdecl; external libecore_x;
function ecore_x_window_argb_new(parent: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint): TEcore_X_Window; cdecl; external libecore_x;
function ecore_x_window_override_argb_new(parent: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint): TEcore_X_Window; cdecl; external libecore_x;
function ecore_x_window_permanent_new(parent: TEcore_X_Window; unique_atom: TEcore_X_Atom): TEcore_X_Window; cdecl; external libecore_x;
function ecore_x_window_input_new(parent: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint): TEcore_X_Window; cdecl; external libecore_x;
procedure ecore_x_window_configure(win: TEcore_X_Window; mask: TEcore_X_Window_Configure_Mask; x: longint; y: longint; w: longint;
  h: longint; border_width: longint; sibling: TEcore_X_Window; stack_mode: longint); cdecl; external libecore_x;
procedure ecore_x_window_cursor_set(win: TEcore_X_Window; c: TEcore_X_Cursor); cdecl; external libecore_x;
procedure ecore_x_window_free(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_window_ignore_set(win: TEcore_X_Window; ignore: longint); cdecl; external libecore_x;
function ecore_x_window_ignore_list(num: Plongint): PEcore_X_Window; cdecl; external libecore_x;
procedure ecore_x_window_delete_request_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_window_show(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_window_hide(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_window_move(win: TEcore_X_Window; x: longint; y: longint); cdecl; external libecore_x;
procedure ecore_x_window_resize(win: TEcore_X_Window; w: longint; h: longint); cdecl; external libecore_x;
procedure ecore_x_window_move_resize(win: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_x;
procedure ecore_x_window_focus(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_window_focus_at_time(win: TEcore_X_Window; t: TEcore_X_Time); cdecl; external libecore_x;
function ecore_x_window_focus_get: TEcore_X_Window; cdecl; external libecore_x;
procedure ecore_x_window_raise(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_window_lower(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_window_reparent(win: TEcore_X_Window; new_parent: TEcore_X_Window; x: longint; y: longint); cdecl; external libecore_x;
procedure ecore_x_window_size_get(win: TEcore_X_Window; w: Plongint; h: Plongint); cdecl; external libecore_x;
procedure ecore_x_window_geometry_get(win: TEcore_X_Window; x: Plongint; y: Plongint; w: Plongint; h: Plongint); cdecl; external libecore_x;
function ecore_x_window_border_width_get(win: TEcore_X_Window): longint; cdecl; external libecore_x;
procedure ecore_x_window_border_width_set(win: TEcore_X_Window; width: longint); cdecl; external libecore_x;
function ecore_x_window_depth_get(win: TEcore_X_Window): longint; cdecl; external libecore_x;
procedure ecore_x_window_cursor_show(win: TEcore_X_Window; show: TEina_Bool); cdecl; external libecore_x;
procedure ecore_x_window_defaults_set(win: TEcore_X_Window); cdecl; external libecore_x;
function ecore_x_window_visible_get(win: TEcore_X_Window): longint; cdecl; external libecore_x;
function ecore_x_window_shadow_tree_at_xy_with_skip_get(base: TEcore_X_Window; x: longint; y: longint; skip: PEcore_X_Window; skip_num: longint): TEcore_X_Window; cdecl; external libecore_x;
function ecore_x_window_shadow_parent_get(root: TEcore_X_Window; win: TEcore_X_Window): TEcore_X_Window; cdecl; external libecore_x;
procedure ecore_x_window_shadow_tree_flush; cdecl; external libecore_x;
function ecore_x_window_root_get(win: TEcore_X_Window): TEcore_X_Window; cdecl; external libecore_x;
function ecore_x_window_at_xy_get(x: longint; y: longint): TEcore_X_Window; cdecl; external libecore_x;
function ecore_x_window_at_xy_with_skip_get(x: longint; y: longint; skip: PEcore_X_Window; skip_num: longint): TEcore_X_Window; cdecl; external libecore_x;
function ecore_x_window_at_xy_begin_get(begin_: TEcore_X_Window; x: longint; y: longint): TEcore_X_Window; cdecl; external libecore_x;
function ecore_x_window_parent_get(win: TEcore_X_Window): TEcore_X_Window; cdecl; external libecore_x;
procedure ecore_x_window_background_color_set(win: TEcore_X_Window; r: word; g: word; b: word); cdecl; external libecore_x;
procedure ecore_x_window_gravity_set(win: TEcore_X_Window; grav: TEcore_X_Gravity); cdecl; external libecore_x;
procedure ecore_x_window_pixel_gravity_set(win: TEcore_X_Window; grav: TEcore_X_Gravity); cdecl; external libecore_x;
procedure ecore_x_window_pixmap_set(win: TEcore_X_Window; pmap: TEcore_X_Pixmap); cdecl; external libecore_x;
procedure ecore_x_window_area_clear(win: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_x;
procedure ecore_x_window_area_expose(win: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_x;
procedure ecore_x_window_override_set(win: TEcore_X_Window; override: TEina_Bool); cdecl; external libecore_x;
procedure ecore_x_window_prop_card32_set(win: TEcore_X_Window; atom: TEcore_X_Atom; val: Pdword; num: dword); cdecl; external libecore_x;
function ecore_x_window_prop_card32_get(win: TEcore_X_Window; atom: TEcore_X_Atom; val: Pdword; len: dword): longint; cdecl; external libecore_x;
function ecore_x_window_prop_card32_list_get(win: TEcore_X_Window; atom: TEcore_X_Atom; plst: PPdword): longint; cdecl; external libecore_x;
procedure ecore_x_window_prop_xid_set(win: TEcore_X_Window; atom: TEcore_X_Atom; _type: TEcore_X_Atom; lst: PEcore_X_ID; num: dword); cdecl; external libecore_x;
function ecore_x_window_prop_xid_get(win: TEcore_X_Window; atom: TEcore_X_Atom; _type: TEcore_X_Atom; lst: PEcore_X_ID; len: dword): longint; cdecl; external libecore_x;
function ecore_x_window_prop_xid_list_get(win: TEcore_X_Window; atom: TEcore_X_Atom; _type: TEcore_X_Atom; plst: PPEcore_X_ID): longint; cdecl; external libecore_x;
procedure ecore_x_window_prop_xid_list_change(win: TEcore_X_Window; atom: TEcore_X_Atom; _type: TEcore_X_Atom; item: TEcore_X_ID; op: longint); cdecl; external libecore_x;
procedure ecore_x_window_prop_atom_set(win: TEcore_X_Window; atom: TEcore_X_Atom; val: PEcore_X_Atom; num: dword); cdecl; external libecore_x;
function ecore_x_window_prop_atom_get(win: TEcore_X_Window; atom: TEcore_X_Atom; val: PEcore_X_Atom; len: dword): longint; cdecl; external libecore_x;
function ecore_x_window_prop_atom_list_get(win: TEcore_X_Window; atom: TEcore_X_Atom; plst: PPEcore_X_Atom): longint; cdecl; external libecore_x;
procedure ecore_x_window_prop_atom_list_change(win: TEcore_X_Window; atom: TEcore_X_Atom; item: TEcore_X_Atom; op: longint); cdecl; external libecore_x;
procedure ecore_x_window_prop_window_set(win: TEcore_X_Window; atom: TEcore_X_Atom; val: PEcore_X_Window; num: dword); cdecl; external libecore_x;
function ecore_x_window_prop_window_get(win: TEcore_X_Window; atom: TEcore_X_Atom; val: PEcore_X_Window; len: dword): longint; cdecl; external libecore_x;
function ecore_x_window_prop_window_list_get(win: TEcore_X_Window; atom: TEcore_X_Atom; plst: PPEcore_X_Window): longint; cdecl; external libecore_x;
function ecore_x_window_prop_any_type: TEcore_X_Atom; cdecl; external libecore_x;
procedure ecore_x_window_prop_property_set(win: TEcore_X_Window; _type: TEcore_X_Atom; format: TEcore_X_Atom; size: longint; data: pointer;
  number: longint); cdecl; external libecore_x;
function ecore_x_window_prop_property_get(win: TEcore_X_Window; _property: TEcore_X_Atom; _type: TEcore_X_Atom; size: longint; data: PPbyte;
  num: Plongint): longint; cdecl; external libecore_x;
procedure ecore_x_window_prop_property_del(win: TEcore_X_Window; _property: TEcore_X_Atom); cdecl; external libecore_x;
function ecore_x_window_prop_list(win: TEcore_X_Window; num_ret: Plongint): PEcore_X_Atom; cdecl; external libecore_x;
procedure ecore_x_window_prop_string_set(win: TEcore_X_Window; _type: TEcore_X_Atom; str: pchar); cdecl; external libecore_x;
function ecore_x_window_prop_string_get(win: TEcore_X_Window; _type: TEcore_X_Atom): pchar; cdecl; external libecore_x;
function ecore_x_window_prop_protocol_isset(win: TEcore_X_Window; protocol: TEcore_X_WM_Protocol): TEina_Bool; cdecl; external libecore_x;
function ecore_x_window_prop_protocol_list_get(win: TEcore_X_Window; num_ret: Plongint): PEcore_X_WM_Protocol; cdecl; external libecore_x;
procedure ecore_x_window_shape_mask_set(win: TEcore_X_Window; mask: TEcore_X_Pixmap); cdecl; external libecore_x;
procedure ecore_x_window_shape_window_set(win: TEcore_X_Window; shape_win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_window_shape_window_set_xy(win: TEcore_X_Window; shape_win: TEcore_X_Window; x: longint; y: longint); cdecl; external libecore_x;
procedure ecore_x_window_shape_rectangle_set(win: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_x;
procedure ecore_x_window_shape_rectangles_set(win: TEcore_X_Window; rects: PEcore_X_Rectangle; num: longint); cdecl; external libecore_x;
procedure ecore_x_window_shape_input_rectangle_set(win: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_x;
procedure ecore_x_window_shape_input_rectangles_set(win: TEcore_X_Window; rects: PEcore_X_Rectangle; num: longint); cdecl; external libecore_x;
procedure ecore_x_window_shape_input_rectangle_add(win: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_x;
procedure ecore_x_window_shape_rectangle_subtract(win: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_x;
procedure ecore_x_window_shape_input_rectangle_subtract(win: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_x;
procedure ecore_x_window_shape_input_window_set_xy(win: TEcore_X_Window; shape_win: TEcore_X_Window; x: longint; y: longint); cdecl; external libecore_x;
procedure ecore_x_window_shape_input_window_set(win: TEcore_X_Window; shape_win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_window_shape_window_add(win: TEcore_X_Window; shape_win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_window_shape_window_add_xy(win: TEcore_X_Window; shape_win: TEcore_X_Window; x: longint; y: longint); cdecl; external libecore_x;
procedure ecore_x_window_shape_input_window_add_xy(win: TEcore_X_Window; shape_win: TEcore_X_Window; x: longint; y: longint); cdecl; external libecore_x;
procedure ecore_x_window_shape_rectangle_add(win: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_x;
procedure ecore_x_window_shape_rectangle_clip(win: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_x;
procedure ecore_x_window_shape_input_rectangle_clip(win: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_x;
procedure ecore_x_window_shape_rectangles_add(win: TEcore_X_Window; rects: PEcore_X_Rectangle; num: longint); cdecl; external libecore_x;
procedure ecore_x_window_shape_input_rectangles_add(win: TEcore_X_Window; rects: PEcore_X_Rectangle; num: longint); cdecl; external libecore_x;
function ecore_x_window_shape_rectangles_get(win: TEcore_X_Window; num_ret: Plongint): PEcore_X_Rectangle; cdecl; external libecore_x;
function ecore_x_window_shape_input_rectangles_get(win: TEcore_X_Window; num_ret: Plongint): PEcore_X_Rectangle; cdecl; external libecore_x;
procedure ecore_x_window_shape_events_select(win: TEcore_X_Window; on: TEina_Bool); cdecl; external libecore_x;
procedure ecore_x_window_shape_input_mask_set(win: TEcore_X_Window; mask: TEcore_X_Pixmap); cdecl; external libecore_x;
function ecore_x_pixmap_new(win: TEcore_X_Window; w: longint; h: longint; dep: longint): TEcore_X_Pixmap; cdecl; external libecore_x;
procedure ecore_x_pixmap_free(pmap: TEcore_X_Pixmap); cdecl; external libecore_x;
procedure ecore_x_pixmap_paste(pmap: TEcore_X_Pixmap; dest: TEcore_X_Drawable; gc: TEcore_X_GC; sx: longint; sy: longint;
  w: longint; h: longint; dx: longint; dy: longint); cdecl; external libecore_x;
procedure ecore_x_pixmap_geometry_get(pmap: TEcore_X_Pixmap; x: Plongint; y: Plongint; w: Plongint; h: Plongint); cdecl; external libecore_x;
function ecore_x_pixmap_depth_get(pmap: TEcore_X_Pixmap): longint; cdecl; external libecore_x;
function ecore_x_gc_new(draw: TEcore_X_Drawable; value_mask: TEcore_X_GC_Value_Mask; value_list: Pdword): TEcore_X_GC; cdecl; external libecore_x;
procedure ecore_x_gc_free(gc: TEcore_X_GC); cdecl; external libecore_x;
procedure ecore_x_gc_foreground_set(gc: TEcore_X_GC; foreground: dword); cdecl; external libecore_x;
procedure ecore_x_gc_background_set(gc: TEcore_X_GC; background: dword); cdecl; external libecore_x;
function ecore_x_client_message32_send(win: TEcore_X_Window; _type: TEcore_X_Atom; mask: TEcore_X_Event_Mask; d0: longint; d1: longint;
  d2: longint; d3: longint; d4: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_client_message8_send(win: TEcore_X_Window; _type: TEcore_X_Atom; data: pointer; len: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_mouse_move_send(win: TEcore_X_Window; x: longint; y: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_mouse_down_send(win: TEcore_X_Window; x: longint; y: longint; b: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_mouse_up_send(win: TEcore_X_Window; x: longint; y: longint; b: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_mouse_in_send(win: TEcore_X_Window; x: longint; y: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_mouse_out_send(win: TEcore_X_Window; x: longint; y: longint): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_drawable_geometry_get(d: TEcore_X_Drawable; x: Plongint; y: Plongint; w: Plongint; h: Plongint); cdecl; external libecore_x;
function ecore_x_drawable_border_width_get(d: TEcore_X_Drawable): longint; cdecl; external libecore_x;
function ecore_x_drawable_depth_get(d: TEcore_X_Drawable): longint; cdecl; external libecore_x;
procedure ecore_x_drawable_rectangle_fill(d: TEcore_X_Drawable; gc: TEcore_X_GC; x: longint; y: longint; width: longint;
  height: longint); cdecl; external libecore_x;
function ecore_x_cursor_color_supported_get: TEina_Bool; cdecl; external libecore_x;
function ecore_x_cursor_new(win: TEcore_X_Window; pixels: Plongint; w: longint; h: longint; hot_x: longint;
  hot_y: longint): TEcore_X_Cursor; cdecl; external libecore_x;
procedure ecore_x_cursor_free(c: TEcore_X_Cursor); cdecl; external libecore_x;
function ecore_x_cursor_shape_get(shape: longint): TEcore_X_Cursor; cdecl; external libecore_x;
procedure ecore_x_cursor_size_set(size: longint); cdecl; external libecore_x;
function ecore_x_cursor_size_get: longint; cdecl; external libecore_x;
function ecore_x_window_root_list(num_ret: Plongint): PEcore_X_Window; cdecl; external libecore_x;
function ecore_x_window_root_first_get: TEcore_X_Window; cdecl; external libecore_x;
function ecore_x_window_manage(win: TEcore_X_Window): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_window_container_manage(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_window_client_manage(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_window_sniff(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_window_client_sniff(win: TEcore_X_Window); cdecl; external libecore_x;
function ecore_x_atom_get(name: pchar): TEcore_X_Atom; cdecl; external libecore_x;
procedure ecore_x_atoms_get(names: PPchar; num: longint; atoms: PEcore_X_Atom); cdecl; external libecore_x;
function ecore_x_atom_name_get(atom: TEcore_X_Atom): pchar; cdecl; external libecore_x;
procedure ecore_x_icccm_init; cdecl; external libecore_x;
procedure ecore_x_icccm_state_set(win: TEcore_X_Window; state: TEcore_X_Window_State_Hint); cdecl; external libecore_x;
function ecore_x_icccm_state_get(win: TEcore_X_Window): TEcore_X_Window_State_Hint; cdecl; external libecore_x;
procedure ecore_x_icccm_delete_window_send(win: TEcore_X_Window; t: TEcore_X_Time); cdecl; external libecore_x;
procedure ecore_x_icccm_take_focus_send(win: TEcore_X_Window; t: TEcore_X_Time); cdecl; external libecore_x;
procedure ecore_x_icccm_save_yourself_send(win: TEcore_X_Window; t: TEcore_X_Time); cdecl; external libecore_x;
procedure ecore_x_icccm_move_resize_send(win: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_x;
procedure ecore_x_icccm_hints_set(win: TEcore_X_Window; accepts_focus: TEina_Bool; initial_state: TEcore_X_Window_State_Hint; icon_pixmap: TEcore_X_Pixmap; icon_mask: TEcore_X_Pixmap;
  icon_window: TEcore_X_Window; window_group: TEcore_X_Window; is_urgent: TEina_Bool); cdecl; external libecore_x;
function ecore_x_icccm_hints_get(win: TEcore_X_Window; accepts_focus: PEina_Bool; initial_state: PEcore_X_Window_State_Hint; icon_pixmap: PEcore_X_Pixmap; icon_mask: PEcore_X_Pixmap;
  icon_window: PEcore_X_Window; window_group: PEcore_X_Window; is_urgent: PEina_Bool): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_icccm_size_pos_hints_set(win: TEcore_X_Window; request_pos: TEina_Bool; gravity: TEcore_X_Gravity; min_w: longint; min_h: longint;
  max_w: longint; max_h: longint; base_w: longint; base_h: longint; step_x: longint;
  step_y: longint; min_aspect: double; max_aspect: double); cdecl; external libecore_x;
function ecore_x_icccm_size_pos_hints_get(win: TEcore_X_Window; request_pos: PEina_Bool; gravity: PEcore_X_Gravity; min_w: Plongint; min_h: Plongint;
  max_w: Plongint; max_h: Plongint; base_w: Plongint; base_h: Plongint; step_x: Plongint;
  step_y: Plongint; min_aspect: Pdouble; max_aspect: Pdouble): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_icccm_title_set(win: TEcore_X_Window; t: pchar); cdecl; external libecore_x;
function ecore_x_icccm_title_get(win: TEcore_X_Window): pchar; cdecl; external libecore_x;
procedure ecore_x_icccm_protocol_atoms_set(win: TEcore_X_Window; protos: PEcore_X_Atom; num: longint); cdecl; external libecore_x;
procedure ecore_x_icccm_protocol_set(win: TEcore_X_Window; protocol: TEcore_X_WM_Protocol; on: TEina_Bool); cdecl; external libecore_x;
function ecore_x_icccm_protocol_isset(win: TEcore_X_Window; protocol: TEcore_X_WM_Protocol): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_icccm_name_class_set(win: TEcore_X_Window; n: pchar; c: pchar); cdecl; external libecore_x;
procedure ecore_x_icccm_name_class_get(win: TEcore_X_Window; n: PPchar; c: PPchar); cdecl; external libecore_x;
function ecore_x_icccm_client_machine_get(win: TEcore_X_Window): pchar; cdecl; external libecore_x;
procedure ecore_x_icccm_command_set(win: TEcore_X_Window; argc: longint; argv: PPchar); cdecl; external libecore_x;
procedure ecore_x_icccm_command_get(win: TEcore_X_Window; argc: Plongint; argv: PPPchar); cdecl; external libecore_x;
function ecore_x_icccm_icon_name_get(win: TEcore_X_Window): pchar; cdecl; external libecore_x;
procedure ecore_x_icccm_icon_name_set(win: TEcore_X_Window; t: pchar); cdecl; external libecore_x;
procedure ecore_x_icccm_colormap_window_set(win: TEcore_X_Window; subwin: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_icccm_colormap_window_unset(win: TEcore_X_Window; subwin: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_icccm_transient_for_set(win: TEcore_X_Window; forwin: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_icccm_transient_for_unset(win: TEcore_X_Window); cdecl; external libecore_x;
function ecore_x_icccm_transient_for_get(win: TEcore_X_Window): TEcore_X_Window; cdecl; external libecore_x;
procedure ecore_x_icccm_window_role_set(win: TEcore_X_Window; role: pchar); cdecl; external libecore_x;
function ecore_x_icccm_window_role_get(win: TEcore_X_Window): pchar; cdecl; external libecore_x;
procedure ecore_x_icccm_client_leader_set(win: TEcore_X_Window; l: TEcore_X_Window); cdecl; external libecore_x;
function ecore_x_icccm_client_leader_get(win: TEcore_X_Window): TEcore_X_Window; cdecl; external libecore_x;
procedure ecore_x_icccm_iconic_request_send(win: TEcore_X_Window; root: TEcore_X_Window); cdecl; external libecore_x;

type
  PEcore_X_MWM_Hint_Func = ^TEcore_X_MWM_Hint_Func;
  TEcore_X_MWM_Hint_Func = longint;

const
  ECORE_X_MWM_HINT_FUNC_ALL = 1 shl 0;
  ECORE_X_MWM_HINT_FUNC_RESIZE = 1 shl 1;
  ECORE_X_MWM_HINT_FUNC_MOVE = 1 shl 2;
  ECORE_X_MWM_HINT_FUNC_MINIMIZE = 1 shl 3;
  ECORE_X_MWM_HINT_FUNC_MAXIMIZE = 1 shl 4;
  ECORE_X_MWM_HINT_FUNC_CLOSE = 1 shl 5;

type
  PEcore_X_MWM_Hint_Decor = ^TEcore_X_MWM_Hint_Decor;
  TEcore_X_MWM_Hint_Decor = longint;

const
  ECORE_X_MWM_HINT_DECOR_ALL = 1 shl 0;
  ECORE_X_MWM_HINT_DECOR_BORDER = 1 shl 1;
  ECORE_X_MWM_HINT_DECOR_RESIZEH = 1 shl 2;
  ECORE_X_MWM_HINT_DECOR_TITLE = 1 shl 3;
  ECORE_X_MWM_HINT_DECOR_MENU = 1 shl 4;
  ECORE_X_MWM_HINT_DECOR_MINIMIZE = 1 shl 5;
  ECORE_X_MWM_HINT_DECOR_MAXIMIZE = 1 shl 6;

type
  PEcore_X_MWM_Hint_Input = ^TEcore_X_MWM_Hint_Input;
  TEcore_X_MWM_Hint_Input = longint;

const
  ECORE_X_MWM_HINT_INPUT_MODELESS = 0;
  ECORE_X_MWM_HINT_INPUT_PRIMARY_APPLICATION_MODAL = 1;
  ECORE_X_MWM_HINT_INPUT_SYSTEM_MODAL = 2;
  ECORE_X_MWM_HINT_INPUT_FULL_APPLICATION_MODAL = 3;

function ecore_x_mwm_hints_get(win: TEcore_X_Window; fhint: PEcore_X_MWM_Hint_Func; dhint: PEcore_X_MWM_Hint_Decor; ihint: PEcore_X_MWM_Hint_Input): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_mwm_borderless_set(win: TEcore_X_Window; borderless: TEina_Bool); cdecl; external libecore_x;
procedure ecore_x_netwm_init; cdecl; external libecore_x;
procedure ecore_x_netwm_shutdown; cdecl; external libecore_x;
procedure ecore_x_netwm_wm_identify(root: TEcore_X_Window; check: TEcore_X_Window; wm_name: pchar); cdecl; external libecore_x;
procedure ecore_x_netwm_supported_set(root: TEcore_X_Window; supported: PEcore_X_Atom; num: longint); cdecl; external libecore_x;
function ecore_x_netwm_supported_get(root: TEcore_X_Window; supported: PPEcore_X_Atom; num: Plongint): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_netwm_desk_count_set(root: TEcore_X_Window; n_desks: dword); cdecl; external libecore_x;
procedure ecore_x_netwm_desk_roots_set(root: TEcore_X_Window; vroots: PEcore_X_Window; n_desks: dword); cdecl; external libecore_x;
procedure ecore_x_netwm_desk_names_set(root: TEcore_X_Window; names: PPchar; n_desks: dword); cdecl; external libecore_x;
procedure ecore_x_netwm_desk_size_set(root: TEcore_X_Window; width: dword; height: dword); cdecl; external libecore_x;
procedure ecore_x_netwm_desk_workareas_set(root: TEcore_X_Window; areas: Pdword; n_desks: dword); cdecl; external libecore_x;
function ecore_x_netwm_desk_workareas_get(root: TEcore_X_Window; n_desks: Pdword): Pdword; cdecl; external libecore_x;
procedure ecore_x_netwm_desk_current_set(root: TEcore_X_Window; desk: dword); cdecl; external libecore_x;
procedure ecore_x_netwm_desk_viewports_set(root: TEcore_X_Window; origins: Pdword; n_desks: dword); cdecl; external libecore_x;
procedure ecore_x_netwm_desk_layout_set(root: TEcore_X_Window; orientation: longint; columns: longint; rows: longint; starting_corner: longint); cdecl; external libecore_x;
procedure ecore_x_netwm_showing_desktop_set(root: TEcore_X_Window; on: TEina_Bool); cdecl; external libecore_x;
procedure ecore_x_netwm_client_list_set(root: TEcore_X_Window; p_clients: PEcore_X_Window; n_clients: dword); cdecl; external libecore_x;
procedure ecore_x_netwm_client_list_stacking_set(root: TEcore_X_Window; p_clients: PEcore_X_Window; n_clients: dword); cdecl; external libecore_x;
procedure ecore_x_netwm_client_active_set(root: TEcore_X_Window; win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_netwm_client_active_request(root: TEcore_X_Window; win: TEcore_X_Window; _type: longint; current_win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_netwm_name_set(win: TEcore_X_Window; name: pchar); cdecl; external libecore_x;
function ecore_x_netwm_name_get(win: TEcore_X_Window; name: PPchar): longint; cdecl; external libecore_x;
procedure ecore_x_netwm_startup_id_set(win: TEcore_X_Window; id: pchar); cdecl; external libecore_x;
function ecore_x_netwm_startup_id_get(win: TEcore_X_Window; id: PPchar): longint; cdecl; external libecore_x;
procedure ecore_x_netwm_visible_name_set(win: TEcore_X_Window; name: pchar); cdecl; external libecore_x;
function ecore_x_netwm_visible_name_get(win: TEcore_X_Window; name: PPchar): longint; cdecl; external libecore_x;
procedure ecore_x_netwm_icon_name_set(win: TEcore_X_Window; name: pchar); cdecl; external libecore_x;
function ecore_x_netwm_icon_name_get(win: TEcore_X_Window; name: PPchar): longint; cdecl; external libecore_x;
procedure ecore_x_netwm_visible_icon_name_set(win: TEcore_X_Window; name: pchar); cdecl; external libecore_x;
function ecore_x_netwm_visible_icon_name_get(win: TEcore_X_Window; name: PPchar): longint; cdecl; external libecore_x;
procedure ecore_x_netwm_desktop_set(win: TEcore_X_Window; desk: dword); cdecl; external libecore_x;
function ecore_x_netwm_desktop_get(win: TEcore_X_Window; desk: Pdword): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_netwm_strut_set(win: TEcore_X_Window; left: longint; right: longint; top: longint; bottom: longint); cdecl; external libecore_x;
function ecore_x_netwm_strut_get(win: TEcore_X_Window; left: Plongint; right: Plongint; top: Plongint; bottom: Plongint): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_netwm_strut_partial_set(win: TEcore_X_Window; left: longint; right: longint; top: longint; bottom: longint;
  left_start_y: longint; left_end_y: longint; right_start_y: longint; right_end_y: longint; top_start_x: longint;
  top_end_x: longint; bottom_start_x: longint; bottom_end_x: longint); cdecl; external libecore_x;
function ecore_x_netwm_strut_partial_get(win: TEcore_X_Window; left: Plongint; right: Plongint; top: Plongint; bottom: Plongint;
  left_start_y: Plongint; left_end_y: Plongint; right_start_y: Plongint; right_end_y: Plongint; top_start_x: Plongint;
  top_end_x: Plongint; bottom_start_x: Plongint; bottom_end_x: Plongint): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_netwm_icons_set(win: TEcore_X_Window; icon: PEcore_X_Icon; num: longint); cdecl; external libecore_x;
function ecore_x_netwm_icons_get(win: TEcore_X_Window; icon: PPEcore_X_Icon; num: Plongint): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_netwm_icon_geometry_set(win: TEcore_X_Window; x: longint; y: longint; width: longint; height: longint); cdecl; external libecore_x;
function ecore_x_netwm_icon_geometry_get(win: TEcore_X_Window; x: Plongint; y: Plongint; width: Plongint; height: Plongint): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_netwm_pid_set(win: TEcore_X_Window; pid: longint); cdecl; external libecore_x;
function ecore_x_netwm_pid_get(win: TEcore_X_Window; pid: Plongint): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_netwm_handled_icons_set(win: TEcore_X_Window); cdecl; external libecore_x;
function ecore_x_netwm_handled_icons_get(win: TEcore_X_Window): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_netwm_user_time_set(win: TEcore_X_Window; time: dword); cdecl; external libecore_x;
function ecore_x_netwm_user_time_get(win: TEcore_X_Window; time: Pdword): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_netwm_window_state_set(win: TEcore_X_Window; state: PEcore_X_Window_State; num: dword); cdecl; external libecore_x;
function ecore_x_netwm_window_state_get(win: TEcore_X_Window; state: PPEcore_X_Window_State; num: Pdword): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_netwm_window_type_set(win: TEcore_X_Window; _type: TEcore_X_Window_Type); cdecl; external libecore_x;
function ecore_x_netwm_window_type_get(win: TEcore_X_Window; _type: PEcore_X_Window_Type): TEina_Bool; cdecl; external libecore_x;
function ecore_x_netwm_window_types_get(win: TEcore_X_Window; types: PPEcore_X_Window_Type): longint; cdecl; external libecore_x;
function ecore_x_netwm_allowed_action_isset(win: TEcore_X_Window; action: TEcore_X_Action): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_netwm_allowed_action_set(win: TEcore_X_Window; action: PEcore_X_Action; num: dword); cdecl; external libecore_x;
function ecore_x_netwm_allowed_action_get(win: TEcore_X_Window; action: PPEcore_X_Action; num: Pdword): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_netwm_opacity_set(win: TEcore_X_Window; opacity: dword); cdecl; external libecore_x;
function ecore_x_netwm_opacity_get(win: TEcore_X_Window; opacity: Pdword): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_netwm_frame_size_set(win: TEcore_X_Window; fl: longint; fr: longint; ft: longint; fb: longint); cdecl; external libecore_x;
function ecore_x_netwm_frame_size_get(win: TEcore_X_Window; fl: Plongint; fr: Plongint; ft: Plongint; fb: Plongint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_netwm_sync_counter_get(win: TEcore_X_Window; counter: PEcore_X_Sync_Counter): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_netwm_ping_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_netwm_sync_request_send(win: TEcore_X_Window; serial: dword); cdecl; external libecore_x;
procedure ecore_x_netwm_state_request_send(win: TEcore_X_Window; root: TEcore_X_Window; s1: TEcore_X_Window_State; s2: TEcore_X_Window_State; set_: TEina_Bool); cdecl; external libecore_x;
procedure ecore_x_netwm_desktop_request_send(win: TEcore_X_Window; root: TEcore_X_Window; desktop: dword); cdecl; external libecore_x;
procedure ecore_x_netwm_moveresize_request_send(win: TEcore_X_Window; x: longint; y: longint; direction: TEcore_X_Netwm_Direction; button: dword); cdecl; external libecore_x;
procedure ecore_x_e_init; cdecl; external libecore_x;
procedure ecore_x_e_frame_size_set(win: TEcore_X_Window; fl: longint; fr: longint; ft: longint; fb: longint); cdecl; external libecore_x;
procedure ecore_x_e_virtual_keyboard_set(win: TEcore_X_Window; is_keyboard: dword); cdecl; external libecore_x;
function ecore_x_e_virtual_keyboard_get(win: TEcore_X_Window): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_e_virtual_keyboard_state_set(win: TEcore_X_Window; state: TEcore_X_Virtual_Keyboard_State); cdecl; external libecore_x;
function ecore_x_e_virtual_keyboard_state_get(win: TEcore_X_Window): TEcore_X_Virtual_Keyboard_State; cdecl; external libecore_x;
procedure ecore_x_e_virtual_keyboard_state_send(win: TEcore_X_Window; state: TEcore_X_Virtual_Keyboard_State); cdecl; external libecore_x;
procedure ecore_x_e_illume_zone_set(win: TEcore_X_Window; zone: TEcore_X_Window); cdecl; external libecore_x;
function ecore_x_e_illume_zone_get(win: TEcore_X_Window): TEcore_X_Window; cdecl; external libecore_x;
procedure ecore_x_e_illume_zone_list_set(win: TEcore_X_Window; zones: PEcore_X_Window; n_zones: dword); cdecl; external libecore_x;
procedure ecore_x_e_illume_conformant_set(win: TEcore_X_Window; is_conformant: dword); cdecl; external libecore_x;
function ecore_x_e_illume_conformant_get(win: TEcore_X_Window): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_e_illume_mode_set(win: TEcore_X_Window; mode: TEcore_X_Illume_Mode); cdecl; external libecore_x;
function ecore_x_e_illume_mode_get(win: TEcore_X_Window): TEcore_X_Illume_Mode; cdecl; external libecore_x;
procedure ecore_x_e_illume_mode_send(win: TEcore_X_Window; mode: TEcore_X_Illume_Mode); cdecl; external libecore_x;
procedure ecore_x_e_illume_focus_back_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_illume_focus_forward_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_illume_focus_home_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_illume_close_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_illume_home_new_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_illume_home_del_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_illume_access_action_next_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_illume_access_action_prev_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_illume_access_action_activate_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_illume_access_action_over_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_illume_access_action_read_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_illume_access_action_read_next_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_illume_access_action_read_prev_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_illume_access_action_up_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_illume_access_action_down_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_illume_drag_set(win: TEcore_X_Window; drag: dword); cdecl; external libecore_x;
function ecore_x_e_illume_drag_get(win: TEcore_X_Window): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_e_illume_drag_locked_set(win: TEcore_X_Window; is_locked: dword); cdecl; external libecore_x;
function ecore_x_e_illume_drag_locked_get(win: TEcore_X_Window): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_e_illume_drag_start_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_illume_drag_end_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_illume_indicator_geometry_set(win: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_x;
function ecore_x_e_illume_indicator_geometry_get(win: TEcore_X_Window; x: Plongint; y: Plongint; w: Plongint; h: Plongint): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_e_illume_softkey_geometry_set(win: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_x;
function ecore_x_e_illume_softkey_geometry_get(win: TEcore_X_Window; x: Plongint; y: Plongint; w: Plongint; h: Plongint): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_e_illume_keyboard_geometry_set(win: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_x;
function ecore_x_e_illume_keyboard_geometry_get(win: TEcore_X_Window; x: Plongint; y: Plongint; w: Plongint; h: Plongint): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_e_illume_quickpanel_set(win: TEcore_X_Window; is_quickpanel: dword); cdecl; external libecore_x;
function ecore_x_e_illume_quickpanel_get(win: TEcore_X_Window): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_e_illume_quickpanel_state_set(win: TEcore_X_Window; state: TEcore_X_Illume_Quickpanel_State); cdecl; external libecore_x;
function ecore_x_e_illume_quickpanel_state_get(win: TEcore_X_Window): TEcore_X_Illume_Quickpanel_State; cdecl; external libecore_x;
procedure ecore_x_e_illume_quickpanel_state_send(win: TEcore_X_Window; state: TEcore_X_Illume_Quickpanel_State); cdecl; external libecore_x;
procedure ecore_x_e_illume_quickpanel_state_toggle(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_illume_quickpanel_priority_major_set(win: TEcore_X_Window; priority: dword); cdecl; external libecore_x;
function ecore_x_e_illume_quickpanel_priority_major_get(win: TEcore_X_Window): longint; cdecl; external libecore_x;
procedure ecore_x_e_illume_quickpanel_priority_minor_set(win: TEcore_X_Window; priority: dword); cdecl; external libecore_x;
function ecore_x_e_illume_quickpanel_priority_minor_get(win: TEcore_X_Window): longint; cdecl; external libecore_x;
procedure ecore_x_e_illume_quickpanel_zone_set(win: TEcore_X_Window; zone: dword); cdecl; external libecore_x;
function ecore_x_e_illume_quickpanel_zone_get(win: TEcore_X_Window): longint; cdecl; external libecore_x;
procedure ecore_x_e_illume_quickpanel_zone_request_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_illume_quickpanel_position_update_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_illume_clipboard_state_set(win: TEcore_X_Window; state: TEcore_X_Illume_Clipboard_State); cdecl; external libecore_x;
function ecore_x_e_illume_clipboard_state_get(win: TEcore_X_Window): TEcore_X_Illume_Clipboard_State; cdecl; external libecore_x;
procedure ecore_x_e_illume_clipboard_geometry_set(win: TEcore_X_Window; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_x;
function ecore_x_e_illume_clipboard_geometry_get(win: TEcore_X_Window; x: Plongint; y: Plongint; w: Plongint; h: Plongint): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_e_comp_sync_counter_set(win: TEcore_X_Window; counter: TEcore_X_Sync_Counter); cdecl; external libecore_x;
function ecore_x_e_comp_sync_counter_get(win: TEcore_X_Window): TEcore_X_Sync_Counter; cdecl; external libecore_x;
procedure ecore_x_e_comp_sync_draw_done_send(root: TEcore_X_Window; win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_comp_sync_draw_size_done_send(root: TEcore_X_Window; win: TEcore_X_Window; w: longint; h: longint); cdecl; external libecore_x;
procedure ecore_x_e_comp_sync_supported_set(root: TEcore_X_Window; enabled: TEina_Bool); cdecl; external libecore_x;
function ecore_x_e_comp_sync_supported_get(root: TEcore_X_Window): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_e_comp_sync_begin_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_comp_sync_end_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_comp_sync_cancel_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_comp_flush_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_comp_dump_send(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_e_comp_pixmap_set(win: TEcore_X_Window; pixmap: TEcore_X_Pixmap); cdecl; external libecore_x;
function ecore_x_e_comp_pixmap_get(win: TEcore_X_Window): TEcore_X_Pixmap; cdecl; external libecore_x;
function ecore_x_e_window_profile_get(win: TEcore_X_Window): pchar; cdecl; external libecore_x;
procedure ecore_x_e_window_profile_set(win: TEcore_X_Window; profile: pchar); cdecl; external libecore_x;
procedure ecore_x_e_window_profile_list_set(win: TEcore_X_Window; profiles: PPchar; num_profiles: dword); cdecl; external libecore_x;
function ecore_x_e_window_profile_list_get(win: TEcore_X_Window; profiles: PPPchar; ret_num: Plongint): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_e_window_profile_supported_set(root: TEcore_X_Window; enabled: TEina_Bool); cdecl; external libecore_x;
function ecore_x_e_window_profile_supported_get(root: TEcore_X_Window): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_e_window_available_profiles_set(win: TEcore_X_Window; profiles: PPchar; count: dword); cdecl; external libecore_x;
function ecore_x_e_window_available_profiles_get(win: TEcore_X_Window; profiles: PPPchar; count: Plongint): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_e_window_profile_change_send(root: TEcore_X_Window; win: TEcore_X_Window; profile: pchar); cdecl; external libecore_x;
procedure ecore_x_e_window_profile_change_request_send(win: TEcore_X_Window; profile: pchar); cdecl; external libecore_x;
procedure ecore_x_e_window_profile_change_done_send(root: TEcore_X_Window; win: TEcore_X_Window; profile: pchar); cdecl; external libecore_x;
function ecore_x_sync_alarm_new(counter: TEcore_X_Sync_Counter): TEcore_X_Sync_Alarm; cdecl; external libecore_x;
function ecore_x_sync_alarm_free(alarm: TEcore_X_Sync_Alarm): TEina_Bool; cdecl; external libecore_x;
function ecore_x_sync_counter_query(counter: TEcore_X_Sync_Counter; val: Pdword): TEina_Bool; cdecl; external libecore_x;
function ecore_x_sync_counter_new(val: longint): TEcore_X_Sync_Counter; cdecl; external libecore_x;
procedure ecore_x_sync_counter_free(counter: TEcore_X_Sync_Counter); cdecl; external libecore_x;
procedure ecore_x_sync_counter_inc(counter: TEcore_X_Sync_Counter; by: longint); cdecl; external libecore_x;
procedure ecore_x_sync_counter_val_wait(counter: TEcore_X_Sync_Counter; val: longint); cdecl; external libecore_x;
procedure ecore_x_sync_counter_set(counter: TEcore_X_Sync_Counter; val: longint); cdecl; external libecore_x;
procedure ecore_x_sync_counter_2_set(counter: TEcore_X_Sync_Counter; val_hi: longint; val_lo: dword); cdecl; external libecore_x;
function ecore_x_sync_counter_2_query(counter: TEcore_X_Sync_Counter; val_hi: Plongint; val_lo: Pdword): TEina_Bool; cdecl; external libecore_x;
function ecore_x_xinerama_screen_count_get: longint; cdecl; external libecore_x;
function ecore_x_xinerama_screen_geometry_get(screen: longint; x: Plongint; y: Plongint; w: Plongint; h: Plongint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_screensaver_event_available_get: TEina_Bool; cdecl; external libecore_x;
function ecore_x_screensaver_idle_time_get: longint; cdecl; external libecore_x;
procedure ecore_x_screensaver_set(timeout: longint; interval: longint; prefer_blanking: longint; allow_exposures: longint); cdecl; external libecore_x;
procedure ecore_x_screensaver_timeout_set(timeout: longint); cdecl; external libecore_x;
function ecore_x_screensaver_timeout_get: longint; cdecl; external libecore_x;
procedure ecore_x_screensaver_blank_set(timeout: longint); cdecl; external libecore_x;
function ecore_x_screensaver_blank_get: longint; cdecl; external libecore_x;
procedure ecore_x_screensaver_expose_set(timeout: longint); cdecl; external libecore_x;
function ecore_x_screensaver_expose_get: longint; cdecl; external libecore_x;
procedure ecore_x_screensaver_interval_set(timeout: longint); cdecl; external libecore_x;
function ecore_x_screensaver_interval_get: longint; cdecl; external libecore_x;
procedure ecore_x_screensaver_event_listen_set(on: TEina_Bool); cdecl; external libecore_x;
function ecore_x_screensaver_custom_blanking_enable: TEina_Bool; cdecl; external libecore_x;
function ecore_x_screensaver_custom_blanking_disable: TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_screensaver_supend; cdecl; external libecore_x; deprecated;
procedure ecore_x_screensaver_resume; cdecl; external libecore_x;
procedure ecore_x_screensaver_reset; cdecl; external libecore_x;
procedure ecore_x_screensaver_activate; cdecl; external libecore_x;
procedure ecore_x_screensaver_suspend; cdecl; external libecore_x;

type
  PEcore_X_Window_Attributes = ^TEcore_X_Window_Attributes;
  TEcore_X_Window_Attributes = record
  end;

function ecore_x_window_attributes_get(win: TEcore_X_Window; att_ret: PEcore_X_Window_Attributes): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_window_save_set_add(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_window_save_set_del(win: TEcore_X_Window); cdecl; external libecore_x;
function ecore_x_window_children_get(win: TEcore_X_Window; num: Plongint): PEcore_X_Window; cdecl; external libecore_x;
function ecore_x_pointer_control_set(accel_num: longint; accel_denom: longint; threshold: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_pointer_control_get(accel_num: Plongint; accel_denom: Plongint; threshold: Plongint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_pointer_mapping_set(map: pbyte; nmap: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_pointer_mapping_get(map: pbyte; nmap: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_pointer_grab(win: TEcore_X_Window): TEina_Bool; cdecl; external libecore_x;
function ecore_x_pointer_confine_grab(win: TEcore_X_Window): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_pointer_ungrab; cdecl; external libecore_x;
function ecore_x_pointer_warp(win: TEcore_X_Window; x: longint; y: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_keyboard_grab(win: TEcore_X_Window): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_keyboard_ungrab; cdecl; external libecore_x;
procedure ecore_x_grab; cdecl; external libecore_x;
procedure ecore_x_ungrab; cdecl; external libecore_x;

type
  Tecore_x_passive_grab_replay_func_set_func = function(data: pointer; event_type: longint; event: pointer): TEina_Bool; cdecl; 

procedure ecore_x_passive_grab_replay_func_set(func: Tecore_x_passive_grab_replay_func_set_func; data: pointer); cdecl; external libecore_x;
procedure ecore_x_window_button_grab(win: TEcore_X_Window; button: longint; event_mask: TEcore_X_Event_Mask; mod_: longint; any_mod: longint); cdecl; external libecore_x;
procedure ecore_x_window_button_ungrab(win: TEcore_X_Window; button: longint; mod_: longint; any_mod: longint); cdecl; external libecore_x;
procedure ecore_x_window_key_grab(win: TEcore_X_Window; key: pchar; mod_: longint; any_mod: longint); cdecl; external libecore_x;
procedure ecore_x_window_key_ungrab(win: TEcore_X_Window; key: pchar; mod_: longint; any_mod: longint); cdecl; external libecore_x;
procedure ecore_x_focus_reset; cdecl; external libecore_x;
procedure ecore_x_events_allow_all; cdecl; external libecore_x;
procedure ecore_x_pointer_last_xy_get(x: Plongint; y: Plongint); cdecl; external libecore_x;
procedure ecore_x_pointer_xy_get(win: TEcore_X_Window; x: Plongint; y: Plongint); cdecl; external libecore_x;
procedure ecore_x_pointer_root_xy_get(x: Plongint; y: Plongint); cdecl; external libecore_x;
function ecore_x_xregion_new: PEcore_X_XRegion; cdecl; external libecore_x;
procedure ecore_x_xregion_free(region: PEcore_X_XRegion); cdecl; external libecore_x;
function ecore_x_xregion_set(region: PEcore_X_XRegion; gc: TEcore_X_GC): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_xregion_translate(region: PEcore_X_XRegion; x: longint; y: longint); cdecl; external libecore_x;
function ecore_x_xregion_intersect(dst: PEcore_X_XRegion; r1: PEcore_X_XRegion; r2: PEcore_X_XRegion): TEina_Bool; cdecl; external libecore_x;
function ecore_x_xregion_union(dst: PEcore_X_XRegion; r1: PEcore_X_XRegion; r2: PEcore_X_XRegion): TEina_Bool; cdecl; external libecore_x;
function ecore_x_xregion_union_rect(dst: PEcore_X_XRegion; src: PEcore_X_XRegion; rect: PEcore_X_Rectangle): TEina_Bool; cdecl; external libecore_x;
function ecore_x_xregion_subtract(dst: PEcore_X_XRegion; r1: PEcore_X_XRegion; r2: PEcore_X_XRegion): TEina_Bool; cdecl; external libecore_x;
function ecore_x_xregion_is_empty(region: PEcore_X_XRegion): TEina_Bool; cdecl; external libecore_x;
function ecore_x_xregion_is_equal(r1: PEcore_X_XRegion; r2: PEcore_X_XRegion): TEina_Bool; cdecl; external libecore_x;
function ecore_x_xregion_point_contain(region: PEcore_X_XRegion; x: longint; y: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_xregion_rect_contain(region: PEcore_X_XRegion; rect: PEcore_X_Rectangle): TEina_Bool; cdecl; external libecore_x;

type
  PEcore_X_Randr_Refresh_Rate = ^TEcore_X_Randr_Refresh_Rate;
  TEcore_X_Randr_Refresh_Rate = smallint;

  PPEcore_X_Randr_Crtc_Gamma = ^PEcore_X_Randr_Crtc_Gamma;
  PEcore_X_Randr_Crtc_Gamma = ^TEcore_X_Randr_Crtc_Gamma;
  TEcore_X_Randr_Crtc_Gamma = longint;

  PEcore_X_Randr_Signal_Format = ^TEcore_X_Randr_Signal_Format;
  TEcore_X_Randr_Signal_Format = longint;

  PEcore_X_Randr_Signal_Property = ^TEcore_X_Randr_Signal_Property;
  TEcore_X_Randr_Signal_Property = longint;

  PEcore_X_Randr_Connector_Type = ^TEcore_X_Randr_Connector_Type;
  TEcore_X_Randr_Connector_Type = longint;

  PEcore_X_Randr_Mode_Flags = ^TEcore_X_Randr_Mode_Flags;
  TEcore_X_Randr_Mode_Flags = longint;

const
  ECORE_X_RANDR_MODE_HSYNC_POSITIVE = $00000001;
  ECORE_X_RANDR_MODE_HSYNC_NEGATIVE = $00000002;
  ECORE_X_RANDR_MODE_VSYNC_POSITIVE = $00000004;
  ECORE_X_RANDR_MODE_VSYNC_NEGATIVE = $00000008;
  ECORE_X_RANDR_MODE_INTERLACE = $00000010;
  ECORE_X_RANDR_MODE_DOUBLE_SCAN = $00000020;
  ECORE_X_RANDR_MODE_CSYNC = $00000040;
  ECORE_X_RANDR_MODE_CSYNC_POSITIVE = $00000080;
  ECORE_X_RANDR_MODE_CSYNC_NEGATIVE = $00000100;
  ECORE_X_RANDR_MODE_HSKEW_PRESENT = $00000200;
  ECORE_X_RANDR_MODE_BCAST = $00000400;
  ECORE_X_RANDR_MODE_PIXEL_MULTIPLEX = $00000800;
  ECORE_X_RANDR_MODE_DOUBLE_CLOCK = $00001000;
  ECORE_X_RANDR_MODE_CLOCK_DIV_BY_2 = $00002000;

type
  TEcore_X_Randr_Mode_Info = record
    xid: TEcore_X_ID;
    width: dword;
    height: dword;
    dotClock: dword;
    hSyncStart: dword;
    hSyncEnd: dword;
    hTotal: dword;
    hSkew: dword;
    vSyncStart: dword;
    vSyncEnd: dword;
    vTotal: dword;
    name: pchar;
    nameLength: dword;
    modeFlags: dword;
  end;
  PEcore_X_Randr_Mode_Info = ^TEcore_X_Randr_Mode_Info;
  PPEcore_X_Randr_Mode_Info = ^PEcore_X_Randr_Mode_Info;

  TEcore_X_Randr_Crtc_Gamma_Info = record
    size: longint;
    red: Pword;
    green: Pword;
    blue: Pword;
  end;
  PEcore_X_Randr_Crtc_Gamma_Info = ^TEcore_X_Randr_Crtc_Gamma_Info;

function ecore_x_randr_version_get: longint; cdecl; external libecore_x;
function ecore_x_randr_query: TEina_Bool; cdecl; external libecore_x;
function ecore_x_randr_config_timestamp_get(root: TEcore_X_Window): TEcore_X_Time; cdecl; external libecore_x;
function ecore_x_randr_screen_primary_output_orientations_get(root: TEcore_X_Window): TEcore_X_Randr_Orientation; cdecl; external libecore_x;
function ecore_x_randr_screen_primary_output_orientation_get(root: TEcore_X_Window): TEcore_X_Randr_Orientation; cdecl; external libecore_x;
function ecore_x_randr_screen_primary_output_orientation_set(root: TEcore_X_Window; orientation: TEcore_X_Randr_Orientation): TEina_Bool; cdecl; external libecore_x;
function ecore_x_randr_screen_primary_output_sizes_get(root: TEcore_X_Window; num: Plongint): PEcore_X_Randr_Screen_Size_MM; cdecl; external libecore_x;
procedure ecore_x_randr_screen_primary_output_current_size_get(root: TEcore_X_Window; w: Plongint; h: Plongint; w_mm: Plongint; h_mm: Plongint;
  size_index: Plongint); cdecl; external libecore_x;
function ecore_x_randr_screen_primary_output_size_set(root: TEcore_X_Window; size_index: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_randr_screen_primary_output_current_refresh_rate_get(root: TEcore_X_Window): TEcore_X_Randr_Refresh_Rate; cdecl; external libecore_x;
function ecore_x_randr_screen_primary_output_refresh_rates_get(root: TEcore_X_Window; size_index: longint; num: Plongint): PEcore_X_Randr_Refresh_Rate; cdecl; external libecore_x;
function ecore_x_randr_screen_primary_output_refresh_rate_set(root: TEcore_X_Window; size_index: longint; rate: TEcore_X_Randr_Refresh_Rate): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_randr_events_select(win: TEcore_X_Window; on: TEina_Bool); cdecl; external libecore_x;
procedure ecore_x_randr_screen_current_size_get(root: TEcore_X_Window; w: Plongint; h: Plongint; w_mm: Plongint; h_mm: Plongint); cdecl; external libecore_x;
procedure ecore_x_randr_screen_size_range_get(root: TEcore_X_Window; wmin: Plongint; hmin: Plongint; wmax: Plongint; hmax: Plongint); cdecl; external libecore_x;
procedure ecore_x_randr_screen_reset(root: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_randr_screen_refresh(root: TEcore_X_Window); cdecl; external libecore_x;
function ecore_x_randr_screen_current_size_set(root: TEcore_X_Window; w: longint; h: longint; w_mm: longint; h_mm: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_randr_modes_info_get(root: TEcore_X_Window; num: Plongint): PPEcore_X_Randr_Mode_Info; cdecl; external libecore_x;
function ecore_x_randr_mode_info_add(root: TEcore_X_Window; mode_info: PEcore_X_Randr_Mode_Info): TEcore_X_Randr_Mode; cdecl; external libecore_x;
procedure ecore_x_randr_mode_del(mode: TEcore_X_Randr_Mode); cdecl; external libecore_x;
function ecore_x_randr_mode_info_get(root: TEcore_X_Window; mode: TEcore_X_Randr_Mode): PEcore_X_Randr_Mode_Info; cdecl; external libecore_x;
procedure ecore_x_randr_mode_info_free(mode_info: PEcore_X_Randr_Mode_Info); cdecl; external libecore_x;
function ecore_x_randr_crtcs_get(root: TEcore_X_Window; num: Plongint): PEcore_X_Randr_Crtc; cdecl; external libecore_x;
function ecore_x_randr_outputs_get(root: TEcore_X_Window; num: Plongint): PEcore_X_Randr_Output; cdecl; external libecore_x;
function ecore_x_randr_window_outputs_get(window: TEcore_X_Window; num: Plongint): PEcore_X_Randr_Output; cdecl; external libecore_x;
function ecore_x_randr_current_output_get(window: TEcore_X_Window; num: Plongint): PEcore_X_Randr_Output; cdecl; external libecore_x;
function ecore_x_randr_window_crtcs_get(window: TEcore_X_Window; num: Plongint): PEcore_X_Randr_Crtc; cdecl; external libecore_x;
function ecore_x_randr_current_crtc_get(window: TEcore_X_Window; num: Plongint): PEcore_X_Randr_Crtc; cdecl; external libecore_x;
function ecore_x_randr_crtc_outputs_get(root: TEcore_X_Window; crtc: TEcore_X_Randr_Crtc; num: Plongint): PEcore_X_Randr_Output; cdecl; external libecore_x;
function ecore_x_randr_crtc_possible_outputs_get(root: TEcore_X_Window; crtc: TEcore_X_Randr_Crtc; num: Plongint): PEcore_X_Randr_Output; cdecl; external libecore_x;
procedure ecore_x_randr_crtc_geometry_get(root: TEcore_X_Window; crtc: TEcore_X_Randr_Crtc; x: Plongint; y: Plongint; w: Plongint;
  h: Plongint); cdecl; external libecore_x;
procedure ecore_x_randr_crtc_pos_get(root: TEcore_X_Window; crtc: TEcore_X_Randr_Crtc; x: Plongint; y: Plongint); cdecl; external libecore_x;
function ecore_x_randr_crtc_pos_set(root: TEcore_X_Window; crtc: TEcore_X_Randr_Crtc; x: longint; y: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_randr_crtc_mode_get(root: TEcore_X_Window; crtc: TEcore_X_Randr_Crtc): TEcore_X_Randr_Mode; cdecl; external libecore_x;
function ecore_x_randr_crtc_mode_set(root: TEcore_X_Window; crtc: TEcore_X_Randr_Crtc; outputs: PEcore_X_Randr_Output; noutputs: longint; mode: TEcore_X_Randr_Mode): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_randr_crtc_size_get(root: TEcore_X_Window; crtc: TEcore_X_Randr_Crtc; w: Plongint; h: Plongint); cdecl; external libecore_x;
function ecore_x_randr_crtc_refresh_rate_get(root: TEcore_X_Window; crtc: TEcore_X_Randr_Crtc; mode: TEcore_X_Randr_Mode): TEcore_X_Randr_Refresh_Rate; cdecl; external libecore_x;
function ecore_x_randr_crtc_orientations_get(root: TEcore_X_Window; crtc: TEcore_X_Randr_Crtc): TEcore_X_Randr_Orientation; cdecl; external libecore_x;
function ecore_x_randr_crtc_orientation_get(root: TEcore_X_Window; crtc: TEcore_X_Randr_Crtc): TEcore_X_Randr_Orientation; cdecl; external libecore_x;
function ecore_x_randr_crtc_orientation_set(root: TEcore_X_Window; crtc: TEcore_X_Randr_Crtc; orientation: TEcore_X_Randr_Orientation): TEina_Bool; cdecl; external libecore_x;
function ecore_x_randr_crtc_clone_set(root: TEcore_X_Window; original: TEcore_X_Randr_Crtc; clone: TEcore_X_Randr_Crtc): TEina_Bool; cdecl; external libecore_x;
function ecore_x_randr_crtc_settings_set(root: TEcore_X_Window; crtc: TEcore_X_Randr_Crtc; outputs: PEcore_X_Randr_Output; noutputs: longint; x: longint;
  y: longint; mode: TEcore_X_Randr_Mode; orientation: TEcore_X_Randr_Orientation): TEina_Bool; cdecl; external libecore_x;
function ecore_x_randr_crtc_pos_relative_set(root: TEcore_X_Window; crtc_r1: TEcore_X_Randr_Crtc; crtc_r2: TEcore_X_Randr_Crtc; policy: TEcore_X_Randr_Output_Policy; alignment: TEcore_X_Randr_Relative_Alignment): TEina_Bool; cdecl; external libecore_x;
function ecore_x_randr_crtc_info_get(root: TEcore_X_Window; crtc: TEcore_X_Randr_Crtc): PEcore_X_Randr_Crtc_Info; cdecl; external libecore_x;
procedure ecore_x_randr_crtc_info_free(info: PEcore_X_Randr_Crtc_Info); cdecl; external libecore_x;
function ecore_x_randr_output_mode_add(output: TEcore_X_Randr_Output; mode: TEcore_X_Randr_Mode): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_randr_output_mode_del(output: TEcore_X_Randr_Output; mode: TEcore_X_Randr_Mode); cdecl; external libecore_x;
function ecore_x_randr_output_modes_get(root: TEcore_X_Window; output: TEcore_X_Randr_Output; num: Plongint; npreferred: Plongint): PEcore_X_Randr_Mode; cdecl; external libecore_x;
function ecore_x_randr_output_clones_get(root: TEcore_X_Window; output: TEcore_X_Randr_Output; num: Plongint): PEcore_X_Randr_Output; cdecl; external libecore_x;
function ecore_x_randr_output_possible_crtcs_get(root: TEcore_X_Window; output: TEcore_X_Randr_Output; num: Plongint): PEcore_X_Randr_Crtc; cdecl; external libecore_x;
function ecore_x_randr_output_crtc_get(root: TEcore_X_Window; output: TEcore_X_Randr_Output): TEcore_X_Randr_Crtc; cdecl; external libecore_x;
function ecore_x_randr_output_name_get(root: TEcore_X_Window; output: TEcore_X_Randr_Output; len: Plongint): pchar; cdecl; external libecore_x;
function ecore_x_randr_crtc_gamma_ramp_size_get(crtc: TEcore_X_Randr_Crtc): longint; cdecl; external libecore_x; deprecated;
function ecore_x_randr_crtc_gamma_ramps_get(crtc: TEcore_X_Randr_Crtc): PPEcore_X_Randr_Crtc_Gamma; cdecl; external libecore_x; deprecated;
function ecore_x_randr_crtc_gamma_ramps_set(crtc: TEcore_X_Randr_Crtc; red: PEcore_X_Randr_Crtc_Gamma; green: PEcore_X_Randr_Crtc_Gamma; blue: PEcore_X_Randr_Crtc_Gamma): TEina_Bool; cdecl; external libecore_x; deprecated;
function ecore_x_randr_move_all_crtcs_but(root: TEcore_X_Window; not_moved: PEcore_X_Randr_Crtc; nnot_moved: longint; dx: longint; dy: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_randr_move_crtcs(root: TEcore_X_Window; crtcs: PEcore_X_Randr_Crtc; ncrtc: longint; dx: longint; dy: longint): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_randr_mode_size_get(root: TEcore_X_Window; mode: TEcore_X_Randr_Mode; w: Plongint; h: Plongint); cdecl; external libecore_x;
function ecore_x_randr_output_connection_status_get(root: TEcore_X_Window; output: TEcore_X_Randr_Output): TEcore_X_Randr_Connection_Status; cdecl; external libecore_x;
procedure ecore_x_randr_output_size_mm_get(root: TEcore_X_Window; output: TEcore_X_Randr_Output; w: Plongint; h: Plongint); cdecl; external libecore_x;
function ecore_x_randr_output_crtc_set(root: TEcore_X_Window; output: TEcore_X_Randr_Output; crtc: TEcore_X_Randr_Crtc): TEina_Bool; cdecl; external libecore_x;
function ecore_x_randr_crtc_gamma_size_get(crtc: TEcore_X_Randr_Crtc): longint; cdecl; external libecore_x;
function ecore_x_randr_crtc_gamma_get(crtc: TEcore_X_Randr_Crtc): PEcore_X_Randr_Crtc_Gamma_Info; cdecl; external libecore_x;
function ecore_x_randr_crtc_gamma_set(crtc: TEcore_X_Randr_Crtc; gamma: PEcore_X_Randr_Crtc_Gamma_Info): TEina_Bool; cdecl; external libecore_x;
function ecore_x_randr_edid_has_valid_header(edid: pbyte; edid_length: dword): TEina_Bool; cdecl; external libecore_x;
function ecore_x_randr_edid_info_has_valid_checksum(edid: pbyte; edid_length: dword): TEina_Bool; cdecl; external libecore_x;
function ecore_x_randr_edid_version_get(edid: pbyte; edid_length: dword): longint; cdecl; external libecore_x;
function ecore_x_randr_edid_manufacturer_name_get(edid: pbyte; edid_length: dword): pchar; cdecl; external libecore_x;
function ecore_x_randr_edid_display_name_get(edid: pbyte; edid_length: dword): pchar; cdecl; external libecore_x;
function ecore_x_randr_edid_display_ascii_get(edid: pbyte; edid_length: dword): pchar; cdecl; external libecore_x;
function ecore_x_randr_edid_display_serial_get(edid: pbyte; edid_length: dword): pchar; cdecl; external libecore_x;
function ecore_x_randr_edid_model_get(edid: pbyte; edid_length: dword): longint; cdecl; external libecore_x;
function ecore_x_randr_edid_manufacturer_serial_number_get(edid: pbyte; edid_length: dword): longint; cdecl; external libecore_x;
function ecore_x_randr_edid_manufacturer_model_get(edid: pbyte; edid_length: dword): longint; cdecl; external libecore_x;
function ecore_x_randr_edid_dpms_available_get(edid: pbyte; edid_length: dword): TEina_Bool; cdecl; external libecore_x;
function ecore_x_randr_edid_dpms_standby_available_get(edid: pbyte; edid_length: dword): TEina_Bool; cdecl; external libecore_x;
function ecore_x_randr_edid_dpms_suspend_available_get(edid: pbyte; edid_length: dword): TEina_Bool; cdecl; external libecore_x;
function ecore_x_randr_edid_dpms_off_available_get(edid: pbyte; edid_length: dword): TEina_Bool; cdecl; external libecore_x;
function ecore_x_randr_edid_display_aspect_ratio_preferred_get(edid: pbyte; edid_length: dword): TEcore_X_Randr_Edid_Aspect_Ratio; cdecl; external libecore_x;
function ecore_x_randr_edid_display_aspect_ratios_get(edid: pbyte; edid_length: dword): TEcore_X_Randr_Edid_Aspect_Ratio; cdecl; external libecore_x;
function ecore_x_randr_edid_display_colorscheme_get(edid: pbyte; edid_length: dword): TEcore_X_Randr_Edid_Display_Colorscheme; cdecl; external libecore_x;
function ecore_x_randr_edid_display_type_digital_get(edid: pbyte; edid_length: dword): TEina_Bool; cdecl; external libecore_x;
function ecore_x_randr_edid_display_interface_type_get(edid: pbyte; edid_length: dword): TEcore_X_Randr_Edid_Display_Interface_Type; cdecl; external libecore_x;
function ecore_x_randr_output_backlight_available: TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_randr_screen_backlight_level_set(root: TEcore_X_Window; level: double); cdecl; external libecore_x;
function ecore_x_randr_output_backlight_level_get(root: TEcore_X_Window; output: TEcore_X_Randr_Output): double; cdecl; external libecore_x;
function ecore_x_randr_output_backlight_level_set(root: TEcore_X_Window; output: TEcore_X_Randr_Output; level: double): TEina_Bool; cdecl; external libecore_x;
function ecore_x_randr_primary_output_get(root: TEcore_X_Window): TEcore_X_Randr_Output; cdecl; external libecore_x;
procedure ecore_x_randr_primary_output_set(root: TEcore_X_Window; output: TEcore_X_Randr_Output); cdecl; external libecore_x;
function ecore_x_randr_output_subpixel_order_get(root: TEcore_X_Window; output: TEcore_X_Randr_Output): TEcore_X_Render_Subpixel_Order; cdecl; external libecore_x;
function ecore_x_randr_output_edid_get(root: TEcore_X_Window; output: TEcore_X_Randr_Output; length: Pdword): pbyte; cdecl; external libecore_x;
function ecore_x_randr_output_wired_clones_get(root: TEcore_X_Window; output: TEcore_X_Randr_Output; num: Plongint): PEcore_X_Randr_Output; cdecl; external libecore_x;
function ecore_x_randr_output_compatibility_list_get(root: TEcore_X_Window; output: TEcore_X_Randr_Output; num: Plongint): PPEcore_X_Randr_Output; cdecl; external libecore_x;
function ecore_x_randr_output_signal_formats_get(root: TEcore_X_Window; output: TEcore_X_Randr_Output; num: Plongint): PEcore_X_Randr_Signal_Format; cdecl; external libecore_x;
function ecore_x_randr_output_signal_format_set(root: TEcore_X_Window; output: TEcore_X_Randr_Output; signal: PEcore_X_Randr_Signal_Format): TEina_Bool; cdecl; external libecore_x;
function ecore_x_randr_output_signal_properties_get(root: TEcore_X_Window; output: TEcore_X_Randr_Output; num: Plongint): PEcore_X_Randr_Signal_Property; cdecl; external libecore_x;
function ecore_x_randr_output_connector_number_get(root: TEcore_X_Window; output: TEcore_X_Randr_Output): longint; cdecl; external libecore_x;
function ecore_x_randr_output_connector_type_get(root: TEcore_X_Window; output: TEcore_X_Randr_Output): TEcore_X_Randr_Connector_Type; cdecl; external libecore_x;
procedure ecore_x_randr_crtc_panning_area_get(root: TEcore_X_Window; crtc: TEcore_X_Randr_Crtc; x: Plongint; y: Plongint; w: Plongint;
  h: Plongint); cdecl; external libecore_x;
function ecore_x_randr_crtc_panning_area_set(root: TEcore_X_Window; crtc: TEcore_X_Randr_Crtc; x: longint; y: longint; w: longint;
  h: longint): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_randr_crtc_tracking_area_get(root: TEcore_X_Window; crtc: TEcore_X_Randr_Crtc; x: Plongint; y: Plongint; w: Plongint;
  h: Plongint); cdecl; external libecore_x;
function ecore_x_randr_crtc_tracking_area_set(root: TEcore_X_Window; crtc: TEcore_X_Randr_Crtc; x: longint; y: longint; w: longint;
  h: longint): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_randr_crtc_border_area_get(root: TEcore_X_Window; crtc: TEcore_X_Randr_Crtc; x: Plongint; y: Plongint; w: Plongint;
  h: Plongint); cdecl; external libecore_x;
function ecore_x_randr_crtc_border_area_set(root: TEcore_X_Window; crtc: TEcore_X_Randr_Crtc; left: longint; top: longint; right: longint;
  bottom: longint): TEina_Bool; cdecl; external libecore_x;

type
  PEcore_X_Picture = ^TEcore_X_Picture;
  TEcore_X_Picture = TEcore_X_ID;

  PEcore_X_Region = ^TEcore_X_Region;
  TEcore_X_Region = TEcore_X_ID;

  PEcore_X_Region_Type = ^TEcore_X_Region_Type;
  TEcore_X_Region_Type = longint;

const
  ECORE_X_REGION_BOUNDING = 0;
  ECORE_X_REGION_CLIP = 1;

function ecore_x_region_new(rects: PEcore_X_Rectangle; num: longint): TEcore_X_Region; cdecl; external libecore_x;
function ecore_x_region_new_from_bitmap(bitmap: TEcore_X_Pixmap): TEcore_X_Region; cdecl; external libecore_x;
function ecore_x_region_new_from_window(win: TEcore_X_Window; _type: TEcore_X_Region_Type): TEcore_X_Region; cdecl; external libecore_x;
function ecore_x_region_new_from_gc(gc: TEcore_X_GC): TEcore_X_Region; cdecl; external libecore_x;
function ecore_x_region_new_from_picture(picture: TEcore_X_Picture): TEcore_X_Region; cdecl; external libecore_x;
procedure ecore_x_region_free(region: TEcore_X_Region); cdecl; external libecore_x;
procedure ecore_x_region_set(region: TEcore_X_Region; rects: PEcore_X_Rectangle; num: longint); cdecl; external libecore_x;
procedure ecore_x_region_copy(dest: TEcore_X_Region; source: TEcore_X_Region); cdecl; external libecore_x;
procedure ecore_x_region_combine(dest: TEcore_X_Region; source1: TEcore_X_Region; source2: TEcore_X_Region); cdecl; external libecore_x;
procedure ecore_x_region_intersect(dest: TEcore_X_Region; source1: TEcore_X_Region; source2: TEcore_X_Region); cdecl; external libecore_x;
procedure ecore_x_region_subtract(dest: TEcore_X_Region; source1: TEcore_X_Region; source2: TEcore_X_Region); cdecl; external libecore_x;
procedure ecore_x_region_invert(dest: TEcore_X_Region; bounds: PEcore_X_Rectangle; source: TEcore_X_Region); cdecl; external libecore_x;
procedure ecore_x_region_translate(region: TEcore_X_Region; dx: longint; dy: longint); cdecl; external libecore_x;
procedure ecore_x_region_extents(dest: TEcore_X_Region; source: TEcore_X_Region); cdecl; external libecore_x;
function ecore_x_region_fetch(region: TEcore_X_Region; num: Plongint; bounds: PEcore_X_Rectangle): PEcore_X_Rectangle; cdecl; external libecore_x;
procedure ecore_x_region_expand(dest: TEcore_X_Region; source: TEcore_X_Region; left: dword; right: dword; top: dword;
  bottom: dword); cdecl; external libecore_x;
procedure ecore_x_region_gc_clip_set(region: TEcore_X_Region; gc: TEcore_X_GC; x_origin: longint; y_origin: longint); cdecl; external libecore_x;
procedure ecore_x_region_window_shape_set(region: TEcore_X_Region; win: TEcore_X_Window; _type: TEcore_X_Shape_Type; x_offset: longint; y_offset: longint); cdecl; external libecore_x;
procedure ecore_x_region_picture_clip_set(region: TEcore_X_Region; picture: TEcore_X_Picture; x_origin: longint; y_origin: longint); cdecl; external libecore_x;
procedure ecore_x_cursor_show; cdecl; external libecore_x;
procedure ecore_x_cursor_hide; cdecl; external libecore_x;
procedure ecore_x_root_screen_barriers_set(screens: PEcore_X_Rectangle; num: longint); cdecl; external libecore_x;
function ecore_x_fixes_selection_notification_request(selection: TEcore_X_Atom): TEina_Bool; cdecl; external libecore_x;
function ecore_x_fixes_window_selection_notification_request(window: TEcore_X_Window; selection: TEcore_X_Atom): TEina_Bool; cdecl; external libecore_x;
function ecore_x_composite_query: TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_composite_redirect_window(win: TEcore_X_Window; _type: TEcore_X_Composite_Update_Type); cdecl; external libecore_x;
procedure ecore_x_composite_redirect_subwindows(win: TEcore_X_Window; _type: TEcore_X_Composite_Update_Type); cdecl; external libecore_x;
procedure ecore_x_composite_unredirect_window(win: TEcore_X_Window; _type: TEcore_X_Composite_Update_Type); cdecl; external libecore_x;
procedure ecore_x_composite_unredirect_subwindows(win: TEcore_X_Window; _type: TEcore_X_Composite_Update_Type); cdecl; external libecore_x;
function ecore_x_composite_name_window_pixmap_get(win: TEcore_X_Window): TEcore_X_Pixmap; cdecl; external libecore_x;
procedure ecore_x_composite_window_events_disable(win: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_composite_window_events_enable(win: TEcore_X_Window); cdecl; external libecore_x;
function ecore_x_composite_render_window_enable(root: TEcore_X_Window): TEcore_X_Window; cdecl; external libecore_x;
procedure ecore_x_composite_render_window_disable(root: TEcore_X_Window); cdecl; external libecore_x;
procedure ecore_x_present_select_events(win: TEcore_X_Window; events: dword); cdecl; external libecore_x;
procedure ecore_x_present_notify_msc(win: TEcore_X_Window; serial: dword; target_msc: qword; divisor: qword; remainder: qword); cdecl; external libecore_x;
procedure ecore_x_present_pixmap(win: TEcore_X_Window; pixmap: TEcore_X_Pixmap; serial: dword; valid: TEcore_X_Region; update: TEcore_X_Region;
  x_off: longint; y_off: longint; target_crtc: TEcore_X_Randr_Crtc; wait_fence: TEcore_X_Sync_Fence; idle_fence: TEcore_X_Sync_Fence;
  options: dword; target_msc: qword; divisor: qword; remainder: qword; notifies: PEcore_X_Present;
  num_notifies: longint); cdecl; external libecore_x;
function ecore_x_present_exists: TEina_Bool; cdecl; external libecore_x;

type
  PEcore_X_Damage = ^TEcore_X_Damage;
  TEcore_X_Damage = TEcore_X_ID;

  PEcore_X_Damage_Report_Level = ^TEcore_X_Damage_Report_Level;
  TEcore_X_Damage_Report_Level = longint;

const
  ECORE_X_DAMAGE_REPORT_RAW_RECTANGLES = 0;
  ECORE_X_DAMAGE_REPORT_DELTA_RECTANGLES = 1;
  ECORE_X_DAMAGE_REPORT_BOUNDING_BOX = 2;
  ECORE_X_DAMAGE_REPORT_NON_EMPTY = 3;

type
  TEcore_X_Event_Damage = record
    level: TEcore_X_Damage_Report_Level;
    drawable: TEcore_X_Drawable;
    damage: TEcore_X_Damage;
    more: longint;
    time: TEcore_X_Time;
    area: TEcore_X_Rectangle;
    geometry: TEcore_X_Rectangle;
  end;
  PEcore_X_Event_Damage = ^TEcore_X_Event_Damage;

  TEcore_X_Event_Xkb = record
    group: longint;
    base_group: longint;
    latched_group: longint;
    locked_group: longint;
    mods: dword;
    base_mods: dword;
    latched_mods: dword;
    locked_mods: dword;
    map_notify: TEina_Bool;
  end;
  PEcore_X_Event_Xkb = ^TEcore_X_Event_Xkb;

  TEcore_X_Xkb_State = TEcore_X_Event_Xkb;
  PEcore_X_Xkb_State = ^TEcore_X_Xkb_State;

function ecore_x_damage_query: TEina_Bool; cdecl; external libecore_x;
function ecore_x_damage_new(d: TEcore_X_Drawable; level: TEcore_X_Damage_Report_Level): TEcore_X_Damage; cdecl; external libecore_x;
procedure ecore_x_damage_free(damage: TEcore_X_Damage); cdecl; external libecore_x;
procedure ecore_x_damage_subtract(damage: TEcore_X_Damage; repair: TEcore_X_Region; parts: TEcore_X_Region); cdecl; external libecore_x;
function ecore_x_screen_is_composited(screen: longint): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_screen_is_composited_set(screen: longint; win: TEcore_X_Window); cdecl; external libecore_x;
function ecore_x_dpms_query: TEina_Bool; cdecl; external libecore_x;
function ecore_x_dpms_capable_get: TEina_Bool; cdecl; external libecore_x;
function ecore_x_dpms_enabled_get: TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_dpms_enabled_set(enabled: longint); cdecl; external libecore_x;
function ecore_x_dpms_power_level_get: TEcore_X_Dpms_Mode; cdecl; external libecore_x;
procedure ecore_x_dpms_timeouts_get(standby: Pdword; suspend: Pdword; off: Pdword); cdecl; external libecore_x;
function ecore_x_dpms_timeouts_set(standby: dword; suspend: dword; off: dword): TEina_Bool; cdecl; external libecore_x;
function ecore_x_dpms_timeout_standby_get: dword; cdecl; external libecore_x;
function ecore_x_dpms_timeout_suspend_get: dword; cdecl; external libecore_x;
function ecore_x_dpms_timeout_off_get: dword; cdecl; external libecore_x;
procedure ecore_x_dpms_timeout_standby_set(new_timeout: dword); cdecl; external libecore_x;
procedure ecore_x_dpms_timeout_suspend_set(new_timeout: dword); cdecl; external libecore_x;
procedure ecore_x_dpms_timeout_off_set(new_timeout: dword); cdecl; external libecore_x;
procedure ecore_x_dpms_force(on: TEina_Bool); cdecl; external libecore_x;
function ecore_x_test_fake_key_down(key: pchar): TEina_Bool; cdecl; external libecore_x;
function ecore_x_test_fake_key_up(key: pchar): TEina_Bool; cdecl; external libecore_x;
function ecore_x_test_fake_key_press(key: pchar): TEina_Bool; cdecl; external libecore_x;
function ecore_x_keysym_string_get(keysym: longint): pchar; cdecl; external libecore_x;
function ecore_x_keysym_keycode_get(keyname: pchar): longint; cdecl; external libecore_x;
function ecore_x_keysym_get(_string: pchar): dword; cdecl; external libecore_x;

type
  TEcore_X_Image = record
  end;
  PEcore_X_Image = ^TEcore_X_Image;

function ecore_x_image_new(w: longint; h: longint; vis: TEcore_X_Visual; depth: longint): PEcore_X_Image; cdecl; external libecore_x;
procedure ecore_x_image_free(im: PEcore_X_Image); cdecl; external libecore_x;
function ecore_x_image_get(im: PEcore_X_Image; draw: TEcore_X_Drawable; x: longint; y: longint; sx: longint;
  sy: longint; w: longint; h: longint): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_image_put(im: PEcore_X_Image; draw: TEcore_X_Drawable; gc: TEcore_X_GC; x: longint; y: longint;
  sx: longint; sy: longint; w: longint; h: longint); cdecl; external libecore_x;
function ecore_x_image_data_get(im: PEcore_X_Image; bpl: Plongint; rows: Plongint; bpp: Plongint): pointer; cdecl; external libecore_x;
function ecore_x_image_is_argb32_get(im: PEcore_X_Image): TEina_Bool; cdecl; external libecore_x;
function ecore_x_image_to_argb_convert(src: pointer; sbpp: longint; sbpl: longint; c: TEcore_X_Colormap; v: TEcore_X_Visual;
  x: longint; y: longint; w: longint; h: longint; dst: Pdword;
  dbpl: longint; dx: longint; dy: longint): TEina_Bool; cdecl; external libecore_x;
function ecore_x_input_multi_select(win: TEcore_X_Window): TEina_Bool; cdecl; external libecore_x;
function ecore_x_input_raw_select(win: TEcore_X_Window): TEina_Bool; cdecl; external libecore_x;
function ecore_x_input_touch_devices_grab(win: TEcore_X_Window): TEina_Bool; cdecl; external libecore_x;
function ecore_x_input_touch_devices_ungrab: TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_input_devices_update; cdecl; external libecore_x;
function ecore_x_input_device_num_get: longint; cdecl; external libecore_x;
function ecore_x_input_device_id_get(slot: longint): longint; cdecl; external libecore_x;
function ecore_x_input_device_name_get(slot: longint): pchar; cdecl; external libecore_x;
function ecore_x_input_device_properties_list(slot: longint; num_ret: Plongint): PPchar; cdecl; external libecore_x;
procedure ecore_x_input_device_properties_free(list: PPchar; num: longint); cdecl; external libecore_x;
function ecore_x_input_device_property_get(slot: longint; prop: pchar; num_ret: Plongint; format_ret: PEcore_X_Atom; unit_size_ret: Plongint): pointer; cdecl; external libecore_x;
procedure ecore_x_input_device_property_set(slot: longint; prop: pchar; data: pointer; num: longint; format: TEcore_X_Atom;
  unit_size: longint); cdecl; external libecore_x;
function ecore_x_vsync_animator_tick_source_set(win: TEcore_X_Window): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_vsync_animator_tick_delay_set(delay: double); cdecl; external libecore_x;

type
  PEcore_X_Gesture_Event_Mask = ^TEcore_X_Gesture_Event_Mask;
  TEcore_X_Gesture_Event_Mask = longint;

const
  ECORE_X_GESTURE_EVENT_MASK_NONE = 0;
  ECORE_X_GESTURE_EVENT_MASK_FLICK = 1 shl 0;
  ECORE_X_GESTURE_EVENT_MASK_PAN = 1 shl 1;
  ECORE_X_GESTURE_EVENT_MASK_PINCHROTATION = 1 shl 2;
  ECORE_X_GESTURE_EVENT_MASK_TAP = 1 shl 3;
  ECORE_X_GESTURE_EVENT_MASK_TAPNHOLD = 1 shl 4;
  ECORE_X_GESTURE_EVENT_MASK_HOLD = 1 shl 5;
  ECORE_X_GESTURE_EVENT_MASK_GROUP = 1 shl 6;

type
  PEcore_X_Gesture_Event_Type = ^TEcore_X_Gesture_Event_Type;
  TEcore_X_Gesture_Event_Type = longint;

const
  ECORE_X_GESTURE_EVENT_FLICK = 0;
  ECORE_X_GESTURE_EVENT_PAN = 1;
  ECORE_X_GESTURE_EVENT_PINCHROTATION = 2;
  ECORE_X_GESTURE_EVENT_TAP = 3;
  ECORE_X_GESTURE_EVENT_TAPNHOLD = 4;
  ECORE_X_GESTURE_EVENT_HOLD = 5;
  ECORE_X_GESTURE_EVENT_GROUP = 6;

type
  PEcore_X_Gesture_Event_Subtype = ^TEcore_X_Gesture_Event_Subtype;
  TEcore_X_Gesture_Event_Subtype = longint;

const
  ECORE_X_GESTURE_END = 0;
  ECORE_X_GESTURE_BEGIN = 1;
  ECORE_X_GESTURE_UPDATE = 2;
  ECORE_X_GESTURE_DONE = 3;

type
  PEcore_X_Gesture_Group_Subtype = ^TEcore_X_Gesture_Group_Subtype;
  TEcore_X_Gesture_Group_Subtype = longint;

const
  ECORE_X_GESTURE_GROUP_REMOVED = 0;
  ECORE_X_GESTURE_GROUP_ADDED = 1;
  ECORE_X_GESTURE_GROUP_CURRENT = 2;

type
  PEcore_X_Gesture_Direction = ^TEcore_X_Gesture_Direction;
  TEcore_X_Gesture_Direction = longint;

const
  ECORE_X_GESTURE_NORTHWARD = 0;
  ECORE_X_GESTURE_NORTHEASTWARD = 1;
  ECORE_X_GESTURE_EASTWARD = 2;
  ECORE_X_GESTURE_SOUTHEASTWARD = 3;
  ECORE_X_GESTURE_SOUTHWARD = 4;
  ECORE_X_GESTURE_SOUTHWESTWARD = 5;
  ECORE_X_GESTURE_WESTWARD = 6;
  ECORE_X_GESTURE_NORTHWESTWARD = 7;

type
  TEcore_X_Event_Gesture_Notify_Flick = record
    win: TEcore_X_Window;
    time: TEcore_X_Time;
    subtype: TEcore_X_Gesture_Event_Subtype;
    num_fingers: longint;
    distance: longint;
    duration: TEcore_X_Time;
    direction: TEcore_X_Gesture_Direction;
    angle: double;
  end;
  PEcore_X_Event_Gesture_Notify_Flick = ^TEcore_X_Event_Gesture_Notify_Flick;

  TEcore_X_Event_Gesture_Notify_Pan = record
    win: TEcore_X_Window;
    time: TEcore_X_Time;
    subtype: TEcore_X_Gesture_Event_Subtype;
    num_fingers: longint;
    dx: longint;
    dy: longint;
    distance: longint;
    duration: TEcore_X_Time;
    direction: TEcore_X_Gesture_Direction;
  end;
  PEcore_X_Event_Gesture_Notify_Pan = ^TEcore_X_Event_Gesture_Notify_Pan;

  TEcore_X_Event_Gesture_Notify_PinchRotation = record
    win: TEcore_X_Window;
    time: TEcore_X_Time;
    subtype: TEcore_X_Gesture_Event_Subtype;
    num_fingers: longint;
    distance: longint;
    cx: longint;
    cy: longint;
    zoom: double;
    angle: double;
  end;
  PEcore_X_Event_Gesture_Notify_PinchRotation = ^TEcore_X_Event_Gesture_Notify_PinchRotation;

  TEcore_X_Event_Gesture_Notify_Tap = record
    win: TEcore_X_Window;
    time: TEcore_X_Time;
    subtype: TEcore_X_Gesture_Event_Subtype;
    num_fingers: longint;
    cx: longint;
    cy: longint;
    tap_repeat: longint;
    interval: TEcore_X_Time;
  end;
  PEcore_X_Event_Gesture_Notify_Tap = ^TEcore_X_Event_Gesture_Notify_Tap;

  TEcore_X_Event_Gesture_Notify_TapNHold = record
    win: TEcore_X_Window;
    time: TEcore_X_Time;
    subtype: TEcore_X_Gesture_Event_Subtype;
    num_fingers: longint;
    cx: longint;
    cy: longint;
    interval: TEcore_X_Time;
    hold_time: TEcore_X_Time;
  end;
  PEcore_X_Event_Gesture_Notify_TapNHold = ^TEcore_X_Event_Gesture_Notify_TapNHold;

  TEcore_X_Event_Gesture_Notify_Hold = record
    win: TEcore_X_Window;
    time: TEcore_X_Time;
    subtype: TEcore_X_Gesture_Event_Subtype;
    num_fingers: longint;
    cx: longint;
    cy: longint;
    hold_time: TEcore_X_Time;
  end;
  PEcore_X_Event_Gesture_Notify_Hold = ^TEcore_X_Event_Gesture_Notify_Hold;

  TEcore_X_Event_Gesture_Notify_Group = record
    win: TEcore_X_Window;
    time: TEcore_X_Time;
    subtype: TEcore_X_Gesture_Group_Subtype;
    num_groups: longint;
    group_id: longint;
  end;
  PEcore_X_Event_Gesture_Notify_Group = ^TEcore_X_Event_Gesture_Notify_Group;

function ecore_x_gesture_supported: TEina_Bool; cdecl; external libecore_x; deprecated;
function ecore_x_gesture_events_select(win: TEcore_X_Window; mask: TEcore_X_Gesture_Event_Mask): TEina_Bool; cdecl; external libecore_x; deprecated;
function ecore_x_gesture_events_selected_get(win: TEcore_X_Window): TEcore_X_Gesture_Event_Mask; cdecl; external libecore_x; deprecated;
function ecore_x_gesture_event_grab(win: TEcore_X_Window; _type: TEcore_X_Gesture_Event_Type; num_fingers: longint): TEina_Bool; cdecl; external libecore_x; deprecated;
function ecore_x_gesture_event_ungrab(win: TEcore_X_Window; _type: TEcore_X_Gesture_Event_Type; num_fingers: longint): TEina_Bool; cdecl; external libecore_x; deprecated;
procedure ecore_x_e_illume_indicator_state_set(win: TEcore_X_Window; state: TEcore_X_Illume_Indicator_State); cdecl; external libecore_x;
function ecore_x_e_illume_indicator_state_get(win: TEcore_X_Window): TEcore_X_Illume_Indicator_State; cdecl; external libecore_x;
procedure ecore_x_e_illume_indicator_state_send(win: TEcore_X_Window; state: TEcore_X_Illume_Indicator_State); cdecl; external libecore_x;
procedure ecore_x_e_illume_indicator_opacity_set(win: TEcore_X_Window; mode: TEcore_X_Illume_Indicator_Opacity_Mode); cdecl; external libecore_x;
function ecore_x_e_illume_indicator_opacity_get(win: TEcore_X_Window): TEcore_X_Illume_Indicator_Opacity_Mode; cdecl; external libecore_x;
procedure ecore_x_e_illume_indicator_opacity_send(win: TEcore_X_Window; mode: TEcore_X_Illume_Indicator_Opacity_Mode); cdecl; external libecore_x;
procedure ecore_x_e_illume_indicator_type_set(win: TEcore_X_Window; mode: TEcore_X_Illume_Indicator_Type_Mode); cdecl; external libecore_x;
function ecore_x_e_illume_indicator_type_get(win: TEcore_X_Window): TEcore_X_Illume_Indicator_Type_Mode; cdecl; external libecore_x;
procedure ecore_x_e_illume_indicator_type_send(win: TEcore_X_Window; mode: TEcore_X_Illume_Indicator_Type_Mode); cdecl; external libecore_x;
procedure ecore_x_e_illume_window_state_set(win: TEcore_X_Window; state: TEcore_X_Illume_Window_State); cdecl; external libecore_x;
function ecore_x_e_illume_window_state_get(win: TEcore_X_Window): TEcore_X_Illume_Window_State; cdecl; external libecore_x;
procedure ecore_x_e_illume_window_state_send(win: TEcore_X_Window; state: TEcore_X_Illume_Window_State); cdecl; external libecore_x;
procedure ecore_x_xkb_select_group(group: longint); cdecl; external libecore_x;
function ecore_x_xkb_track_state: TEina_Bool; cdecl; external libecore_x;
function ecore_x_xkb_state_get(state: PEcore_X_Xkb_State): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_e_window_rotation_supported_set(root: TEcore_X_Window; enabled: TEina_Bool); cdecl; external libecore_x;
function ecore_x_e_window_rotation_supported_get(root: TEcore_X_Window): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_e_window_rotation_app_set(win: TEcore_X_Window; set_: TEina_Bool); cdecl; external libecore_x;
function ecore_x_e_window_rotation_app_get(win: TEcore_X_Window): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_e_window_rotation_preferred_rotation_set(win: TEcore_X_Window; rot: longint); cdecl; external libecore_x;
function ecore_x_e_window_rotation_preferred_rotation_get(win: TEcore_X_Window; rot: Plongint): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_e_window_rotation_available_rotations_set(win: TEcore_X_Window; rots: Plongint; count: dword); cdecl; external libecore_x;
function ecore_x_e_window_rotation_available_rotations_get(win: TEcore_X_Window; rots: PPlongint; count: Pdword): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_e_window_rotation_change_prepare_send(win: TEcore_X_Window; rot: longint; resize: TEina_Bool; w: longint; h: longint); cdecl; external libecore_x;
procedure ecore_x_e_window_rotation_change_prepare_done_send(root: TEcore_X_Window; win: TEcore_X_Window; rot: longint); cdecl; external libecore_x;
procedure ecore_x_e_window_rotation_change_request_send(win: TEcore_X_Window; rot: longint); cdecl; external libecore_x;
procedure ecore_x_e_window_rotation_change_done_send(root: TEcore_X_Window; win: TEcore_X_Window; rot: longint; w: longint; h: longint); cdecl; external libecore_x;

type
  PEcore_X_Win_Keygrab_Mode = ^TEcore_X_Win_Keygrab_Mode;
  TEcore_X_Win_Keygrab_Mode = longint;

const
  ECORE_X_WIN_KEYGRAB_UNKNOWN = 0;
  ECORE_X_WIN_KEYGRAB_SHARED = 1 shl 8;
  ECORE_X_WIN_KEYGRAB_TOPMOST = 1 shl 9;
  ECORE_X_WIN_KEYGRAB_EXCLUSIVE = 1 shl 10;
  ECORE_X_WIN_KEYGRAB_OVERRIDE_EXCLUSIVE = 1 shl 11;

function ecore_x_window_keygrab_set(win: TEcore_X_Window; key: pchar; mod_: longint; any_mod: longint; priority: longint;
  grab_mode: TEcore_X_Win_Keygrab_Mode): TEina_Bool; cdecl; external libecore_x;
function ecore_x_window_keygrab_unset(win: TEcore_X_Window; key: pchar; mod_: longint; any_mod: longint): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_e_keyrouter_set(root: TEcore_X_Window; on: TEina_Bool); cdecl; external libecore_x;
function ecore_x_e_keyrouter_get(root: TEcore_X_Window): TEina_Bool; cdecl; external libecore_x;
procedure ecore_x_rersource_load(file_: pchar); cdecl; external libecore_x;
procedure ecore_x_resource_db_string_set(key: pchar; val: pchar); cdecl; external libecore_x;
function ecore_x_resource_db_string_get(key: pchar): pchar; cdecl; external libecore_x;
procedure ecore_x_resource_db_flush; cdecl; external libecore_x;

{$ifdef EFL_BETA_API_SUPPORT}
procedure ecore_x_e_stack_type_set(win: TEcore_X_Window; stack_type: TEcore_X_Stack_Type); cdecl; external libecore_x;
function ecore_x_e_stack_type_get(win: TEcore_X_Window): TEcore_X_Stack_Type; cdecl; external libecore_x;
procedure ecore_x_e_stack_position_set(win: TEcore_X_Window; stack_position: TEcore_X_Stack_Position); cdecl; external libecore_x;
function ecore_x_e_stack_position_get(win: TEcore_X_Window): TEcore_X_Stack_Position; cdecl; external libecore_x;
{$endif}

// === Konventiert am: 14-6-25 15:04:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
