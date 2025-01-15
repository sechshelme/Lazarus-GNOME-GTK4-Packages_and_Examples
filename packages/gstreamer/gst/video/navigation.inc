
{$IFDEF read_interface}

type
  PGstNavigationModifierType = ^TGstNavigationModifierType;
  TGstNavigationModifierType = longint;

const
  GST_NAVIGATION_MODIFIER_NONE = 0;
  GST_NAVIGATION_MODIFIER_SHIFT_MASK = 1 shl 0;
  GST_NAVIGATION_MODIFIER_LOCK_MASK = 1 shl 1;
  GST_NAVIGATION_MODIFIER_CONTROL_MASK = 1 shl 2;
  GST_NAVIGATION_MODIFIER_MOD1_MASK = 1 shl 3;
  GST_NAVIGATION_MODIFIER_MOD2_MASK = 1 shl 4;
  GST_NAVIGATION_MODIFIER_MOD3_MASK = 1 shl 5;
  GST_NAVIGATION_MODIFIER_MOD4_MASK = 1 shl 6;
  GST_NAVIGATION_MODIFIER_MOD5_MASK = 1 shl 7;
  GST_NAVIGATION_MODIFIER_BUTTON1_MASK = 1 shl 8;
  GST_NAVIGATION_MODIFIER_BUTTON2_MASK = 1 shl 9;
  GST_NAVIGATION_MODIFIER_BUTTON3_MASK = 1 shl 10;
  GST_NAVIGATION_MODIFIER_BUTTON4_MASK = 1 shl 11;
  GST_NAVIGATION_MODIFIER_BUTTON5_MASK = 1 shl 12;
  GST_NAVIGATION_MODIFIER_SUPER_MASK = 1 shl 26;
  GST_NAVIGATION_MODIFIER_HYPER_MASK = 1 shl 27;
  GST_NAVIGATION_MODIFIER_META_MASK = 1 shl 28;
  GST_NAVIGATION_MODIFIER_MASK = (((((((((((((((GST_NAVIGATION_MODIFIER_NONE or GST_NAVIGATION_MODIFIER_SHIFT_MASK) or GST_NAVIGATION_MODIFIER_LOCK_MASK) or GST_NAVIGATION_MODIFIER_CONTROL_MASK) or GST_NAVIGATION_MODIFIER_MOD1_MASK) or
    GST_NAVIGATION_MODIFIER_MOD2_MASK) or GST_NAVIGATION_MODIFIER_MOD3_MASK) or GST_NAVIGATION_MODIFIER_MOD4_MASK) or GST_NAVIGATION_MODIFIER_MOD5_MASK) or GST_NAVIGATION_MODIFIER_BUTTON1_MASK) or GST_NAVIGATION_MODIFIER_BUTTON2_MASK) or
    GST_NAVIGATION_MODIFIER_BUTTON3_MASK) or GST_NAVIGATION_MODIFIER_BUTTON4_MASK) or GST_NAVIGATION_MODIFIER_BUTTON5_MASK) or GST_NAVIGATION_MODIFIER_SUPER_MASK) or GST_NAVIGATION_MODIFIER_HYPER_MASK) or GST_NAVIGATION_MODIFIER_META_MASK;

type
  TGstNavigation = record
  end;
  PGstNavigation = ^TGstNavigation;

  TGstNavigationInterface = record
    iface: TGTypeInterface;
    send_event: procedure(navigation: PGstNavigation; structure: PGstStructure); cdecl;
    send_event_simple: procedure(navigation: PGstNavigation; event: PGstEvent); cdecl;
  end;
  PGstNavigationInterface = ^TGstNavigationInterface;


function gst_navigation_get_type: TGType; cdecl; external libgstvideo;

type
  PGstNavigationCommand = ^TGstNavigationCommand;
  TGstNavigationCommand = longint;

const
  GST_NAVIGATION_COMMAND_INVALID = 0;
  GST_NAVIGATION_COMMAND_MENU1 = 1;
  GST_NAVIGATION_COMMAND_MENU2 = 2;
  GST_NAVIGATION_COMMAND_MENU3 = 3;
  GST_NAVIGATION_COMMAND_MENU4 = 4;
  GST_NAVIGATION_COMMAND_MENU5 = 5;
  GST_NAVIGATION_COMMAND_MENU6 = 6;
  GST_NAVIGATION_COMMAND_MENU7 = 7;
  GST_NAVIGATION_COMMAND_LEFT = 20;
  GST_NAVIGATION_COMMAND_RIGHT = 21;
  GST_NAVIGATION_COMMAND_UP = 22;
  GST_NAVIGATION_COMMAND_DOWN = 23;
  GST_NAVIGATION_COMMAND_ACTIVATE = 24;
  GST_NAVIGATION_COMMAND_PREV_ANGLE = 30;
  GST_NAVIGATION_COMMAND_NEXT_ANGLE = 31;

const
  GST_NAVIGATION_COMMAND_DVD_MENU = GST_NAVIGATION_COMMAND_MENU1;
  GST_NAVIGATION_COMMAND_DVD_TITLE_MENU = GST_NAVIGATION_COMMAND_MENU2;
  GST_NAVIGATION_COMMAND_DVD_ROOT_MENU = GST_NAVIGATION_COMMAND_MENU3;
  GST_NAVIGATION_COMMAND_DVD_SUBPICTURE_MENU = GST_NAVIGATION_COMMAND_MENU4;
  GST_NAVIGATION_COMMAND_DVD_AUDIO_MENU = GST_NAVIGATION_COMMAND_MENU5;
  GST_NAVIGATION_COMMAND_DVD_ANGLE_MENU = GST_NAVIGATION_COMMAND_MENU6;
  GST_NAVIGATION_COMMAND_DVD_CHAPTER_MENU = GST_NAVIGATION_COMMAND_MENU7;

type
  PGstNavigationQueryType = ^TGstNavigationQueryType;
  TGstNavigationQueryType = longint;

const
  GST_NAVIGATION_QUERY_INVALID = 0;
  GST_NAVIGATION_QUERY_COMMANDS = 1;
  GST_NAVIGATION_QUERY_ANGLES = 2;

function gst_navigation_query_get_type(query: PGstQuery): TGstNavigationQueryType; cdecl; external libgstvideo;
function gst_navigation_query_new_commands: PGstQuery; cdecl; external libgstvideo;
procedure gst_navigation_query_set_commands(query: PGstQuery; n_cmds: Tgint); varargs; cdecl; external libgstvideo;
procedure gst_navigation_query_set_commandsv(query: PGstQuery; n_cmds: Tgint; cmds: PGstNavigationCommand); cdecl; external libgstvideo;
function gst_navigation_query_parse_commands_length(query: PGstQuery; n_cmds: Pguint): Tgboolean; cdecl; external libgstvideo;
function gst_navigation_query_parse_commands_nth(query: PGstQuery; nth: Tguint; cmd: PGstNavigationCommand): Tgboolean; cdecl; external libgstvideo;
function gst_navigation_query_new_angles: PGstQuery; cdecl; external libgstvideo;
procedure gst_navigation_query_set_angles(query: PGstQuery; cur_angle: Tguint; n_angles: Tguint); cdecl; external libgstvideo;
function gst_navigation_query_parse_angles(query: PGstQuery; cur_angle: Pguint; n_angles: Pguint): Tgboolean; cdecl; external libgstvideo;

type
  PGstNavigationMessageType = ^TGstNavigationMessageType;
  TGstNavigationMessageType = longint;

const
  GST_NAVIGATION_MESSAGE_INVALID = 0;
  GST_NAVIGATION_MESSAGE_MOUSE_OVER = 1;
  GST_NAVIGATION_MESSAGE_COMMANDS_CHANGED = 2;
  GST_NAVIGATION_MESSAGE_ANGLES_CHANGED = 3;
  GST_NAVIGATION_MESSAGE_EVENT = 4;

function gst_navigation_message_get_type(message: PGstMessage): TGstNavigationMessageType; cdecl; external libgstvideo;
function gst_navigation_message_new_mouse_over(src: PGstObject; active: Tgboolean): PGstMessage; cdecl; external libgstvideo;
function gst_navigation_message_parse_mouse_over(message: PGstMessage; active: Pgboolean): Tgboolean; cdecl; external libgstvideo;
function gst_navigation_message_new_commands_changed(src: PGstObject): PGstMessage; cdecl; external libgstvideo;
function gst_navigation_message_new_angles_changed(src: PGstObject; cur_angle: Tguint; n_angles: Tguint): PGstMessage; cdecl; external libgstvideo;
function gst_navigation_message_parse_angles_changed(message: PGstMessage; cur_angle: Pguint; n_angles: Pguint): Tgboolean; cdecl; external libgstvideo;
function gst_navigation_message_new_event(src: PGstObject; event: PGstEvent): PGstMessage; cdecl; external libgstvideo;
function gst_navigation_message_parse_event(message: PGstMessage; event: PPGstEvent): Tgboolean; cdecl; external libgstvideo;

type
  PGstNavigationEventType = ^TGstNavigationEventType;
  TGstNavigationEventType = longint;

const
  GST_NAVIGATION_EVENT_INVALID = 0;
  GST_NAVIGATION_EVENT_KEY_PRESS = 1;
  GST_NAVIGATION_EVENT_KEY_RELEASE = 2;
  GST_NAVIGATION_EVENT_MOUSE_BUTTON_PRESS = 3;
  GST_NAVIGATION_EVENT_MOUSE_BUTTON_RELEASE = 4;
  GST_NAVIGATION_EVENT_MOUSE_MOVE = 5;
  GST_NAVIGATION_EVENT_COMMAND = 6;
  GST_NAVIGATION_EVENT_MOUSE_SCROLL = 7;
  GST_NAVIGATION_EVENT_TOUCH_DOWN = 8;
  GST_NAVIGATION_EVENT_TOUCH_MOTION = 9;
  GST_NAVIGATION_EVENT_TOUCH_UP = 10;
  GST_NAVIGATION_EVENT_TOUCH_FRAME = 11;
  GST_NAVIGATION_EVENT_TOUCH_CANCEL = 12;

function gst_navigation_event_get_type(event: PGstEvent): TGstNavigationEventType; cdecl; external libgstvideo;
function gst_navigation_event_new_key_press(key: Pgchar; state: TGstNavigationModifierType): PGstEvent; cdecl; external libgstvideo;
function gst_navigation_event_new_key_release(key: Pgchar; state: TGstNavigationModifierType): PGstEvent; cdecl; external libgstvideo;
function gst_navigation_event_new_mouse_button_press(button: Tgint; x: Tgdouble; y: Tgdouble; state: TGstNavigationModifierType): PGstEvent; cdecl; external libgstvideo;
function gst_navigation_event_new_mouse_button_release(button: Tgint; x: Tgdouble; y: Tgdouble; state: TGstNavigationModifierType): PGstEvent; cdecl; external libgstvideo;
function gst_navigation_event_new_mouse_move(x: Tgdouble; y: Tgdouble; state: TGstNavigationModifierType): PGstEvent; cdecl; external libgstvideo;
function gst_navigation_event_new_mouse_scroll(x: Tgdouble; y: Tgdouble; delta_x: Tgdouble; delta_y: Tgdouble; state: TGstNavigationModifierType): PGstEvent; cdecl; external libgstvideo;
function gst_navigation_event_new_command(command: TGstNavigationCommand): PGstEvent; cdecl; external libgstvideo;
function gst_navigation_event_new_touch_down(identifier: Tguint; x: Tgdouble; y: Tgdouble; pressure: Tgdouble; state: TGstNavigationModifierType): PGstEvent; cdecl; external libgstvideo;
function gst_navigation_event_new_touch_motion(identifier: Tguint; x: Tgdouble; y: Tgdouble; pressure: Tgdouble; state: TGstNavigationModifierType): PGstEvent; cdecl; external libgstvideo;
function gst_navigation_event_new_touch_up(identifier: Tguint; x: Tgdouble; y: Tgdouble; state: TGstNavigationModifierType): PGstEvent; cdecl; external libgstvideo;
function gst_navigation_event_new_touch_frame(state: TGstNavigationModifierType): PGstEvent; cdecl; external libgstvideo;
function gst_navigation_event_new_touch_cancel(state: TGstNavigationModifierType): PGstEvent; cdecl; external libgstvideo;
function gst_navigation_event_parse_key_event(event: PGstEvent; key: PPgchar): Tgboolean; cdecl; external libgstvideo;
function gst_navigation_event_parse_mouse_button_event(event: PGstEvent; button: Pgint; x: Pgdouble; y: Pgdouble): Tgboolean; cdecl; external libgstvideo;
function gst_navigation_event_parse_mouse_move_event(event: PGstEvent; x: Pgdouble; y: Pgdouble): Tgboolean; cdecl; external libgstvideo;
function gst_navigation_event_parse_mouse_scroll_event(event: PGstEvent; x: Pgdouble; y: Pgdouble; delta_x: Pgdouble; delta_y: Pgdouble): Tgboolean; cdecl; external libgstvideo;
function gst_navigation_event_parse_command(event: PGstEvent; command: PGstNavigationCommand): Tgboolean; cdecl; external libgstvideo;
function gst_navigation_event_parse_touch_event(event: PGstEvent; identifier: Pguint; x: Pgdouble; y: Pgdouble; pressure: Pgdouble): Tgboolean; cdecl; external libgstvideo;
function gst_navigation_event_parse_touch_up_event(event: PGstEvent; identifier: Pguint; x: Pgdouble; y: Pgdouble): Tgboolean; cdecl; external libgstvideo;
function gst_navigation_event_get_coordinates(event: PGstEvent; x: Pgdouble; y: Pgdouble): Tgboolean; cdecl; external libgstvideo;
function gst_navigation_event_set_coordinates(event: PGstEvent; x: Tgdouble; y: Tgdouble): Tgboolean; cdecl; external libgstvideo;
procedure gst_navigation_send_event(navigation: PGstNavigation; structure: PGstStructure); cdecl; external libgstvideo; deprecated 'GST_VIDEO_DEPRECATED_FOR(gst_navigation_send_event_simple)';
procedure gst_navigation_send_key_event(navigation: PGstNavigation; event: pchar; key: pchar); cdecl; external libgstvideo; deprecated 'GST_VIDEO_DEPRECATED_FOR(gst_navigation_send_event_simple)';
procedure gst_navigation_send_mouse_event(navigation: PGstNavigation; event: pchar; button: longint; x: Tdouble; y: Tdouble); cdecl; external libgstvideo; deprecated 'GST_VIDEO_DEPRECATED_FOR(gst_navigation_send_event_simple)';
procedure gst_navigation_send_mouse_scroll_event(navigation: PGstNavigation; x: Tdouble; y: Tdouble; delta_x: Tdouble; delta_y: Tdouble); cdecl; external libgstvideo; deprecated 'GST_VIDEO_DEPRECATED_FOR(gst_navigation_send_event_simple)';
procedure gst_navigation_send_command(navigation: PGstNavigation; command: TGstNavigationCommand); cdecl; external libgstvideo; deprecated 'GST_VIDEO_DEPRECATED_FOR(gst_navigation_send_event_simple)';
procedure gst_navigation_send_event_simple(navigation: PGstNavigation; event: PGstEvent); cdecl; external libgstvideo;
function gst_navigation_event_parse_modifier_state(event: PGstEvent; state: PGstNavigationModifierType): Tgboolean; cdecl; external libgstvideo;

// === Konventiert am: 29-9-24 17:23:29 ===

function GST_TYPE_NAVIGATION: TGType;
function GST_NAVIGATION(obj: Pointer): PGstNavigation;
function GST_IS_NAVIGATION(obj: Pointer): Tgboolean;
function GST_NAVIGATION_GET_INTERFACE(obj: Pointer): PGstNavigationInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_NAVIGATION: TGType;
begin
  GST_TYPE_NAVIGATION := gst_navigation_get_type;
end;

function GST_NAVIGATION(obj: Pointer): PGstNavigation;
begin
  Result := PGstNavigation(g_type_check_instance_cast(obj, GST_TYPE_NAVIGATION));
end;

function GST_IS_NAVIGATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_NAVIGATION);
end;

function GST_NAVIGATION_GET_INTERFACE(obj: Pointer): PGstNavigationInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_NAVIGATION);
end;



{$ENDIF read_implementation}
