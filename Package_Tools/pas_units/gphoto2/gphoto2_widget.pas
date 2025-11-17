unit gphoto2_widget;

interface

uses
  fp_glib2, fp_gphoto2 ,gphoto2_camera, gphoto2_context;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PCameraWidgetType = ^TCameraWidgetType;
  TCameraWidgetType = longint;

const
  GP_WIDGET_WINDOW = 0;
  GP_WIDGET_SECTION = 1;
  GP_WIDGET_TEXT = 2;
  GP_WIDGET_RANGE = 3;
  GP_WIDGET_TOGGLE = 4;
  GP_WIDGET_RADIO = 5;
  GP_WIDGET_MENU = 6;
  GP_WIDGET_BUTTON = 7;
  GP_WIDGET_DATE = 8;

type
  TCameraWidgetCallback = function(para1: PCamera; para2: PCameraWidget; para3: PGPContext): longint; cdecl;

function gp_widget_new(_type: TCameraWidgetType; _label: pchar; widget: PPCameraWidget): longint; cdecl; external libgphoto2;
function gp_widget_free(widget: PCameraWidget): longint; cdecl; external libgphoto2;
function gp_widget_ref(widget: PCameraWidget): longint; cdecl; external libgphoto2;
function gp_widget_unref(widget: PCameraWidget): longint; cdecl; external libgphoto2;
function gp_widget_append(widget: PCameraWidget; child: PCameraWidget): longint; cdecl; external libgphoto2;
function gp_widget_prepend(widget: PCameraWidget; child: PCameraWidget): longint; cdecl; external libgphoto2;
function gp_widget_count_children(widget: PCameraWidget): longint; cdecl; external libgphoto2;
function gp_widget_get_child(widget: PCameraWidget; child_number: longint; child: PPCameraWidget): longint; cdecl; external libgphoto2;
function gp_widget_get_child_by_label(widget: PCameraWidget; _label: pchar; child: PPCameraWidget): longint; cdecl; external libgphoto2;
function gp_widget_get_child_by_id(widget: PCameraWidget; id: longint; child: PPCameraWidget): longint; cdecl; external libgphoto2;
function gp_widget_get_child_by_name(widget: PCameraWidget; name: pchar; child: PPCameraWidget): longint; cdecl; external libgphoto2;
function gp_widget_get_root(widget: PCameraWidget; root: PPCameraWidget): longint; cdecl; external libgphoto2;
function gp_widget_get_parent(widget: PCameraWidget; parent: PPCameraWidget): longint; cdecl; external libgphoto2;
function gp_widget_set_value(widget: PCameraWidget; value: pointer): longint; cdecl; external libgphoto2;
function gp_widget_get_value(widget: PCameraWidget; value: pointer): longint; cdecl; external libgphoto2;
function gp_widget_set_name(widget: PCameraWidget; name: pchar): longint; cdecl; external libgphoto2;
function gp_widget_get_name(widget: PCameraWidget; name: PPchar): longint; cdecl; external libgphoto2;
function gp_widget_set_info(widget: PCameraWidget; info: pchar): longint; cdecl; external libgphoto2;
function gp_widget_get_info(widget: PCameraWidget; info: PPchar): longint; cdecl; external libgphoto2;
function gp_widget_get_id(widget: PCameraWidget; id: Plongint): longint; cdecl; external libgphoto2;
function gp_widget_get_type(widget: PCameraWidget; _type: PCameraWidgetType): longint; cdecl; external libgphoto2;
function gp_widget_get_label(widget: PCameraWidget; _label: PPchar): longint; cdecl; external libgphoto2;
function gp_widget_set_range(range: PCameraWidget; low: single; high: single; increment: single): longint; cdecl; external libgphoto2;
function gp_widget_get_range(range: PCameraWidget; min: Psingle; max: Psingle; increment: Psingle): longint; cdecl; external libgphoto2;
function gp_widget_add_choice(widget: PCameraWidget; choice: pchar): longint; cdecl; external libgphoto2;
function gp_widget_count_choices(widget: PCameraWidget): longint; cdecl; external libgphoto2;
function gp_widget_get_choice(widget: PCameraWidget; choice_number: longint; choice: PPchar): longint; cdecl; external libgphoto2;
function gp_widget_changed(widget: PCameraWidget): longint; cdecl; external libgphoto2;
function gp_widget_set_changed(widget: PCameraWidget; changed: longint): longint; cdecl; external libgphoto2;
function gp_widget_set_readonly(widget: PCameraWidget; readonly: longint): longint; cdecl; external libgphoto2;
function gp_widget_get_readonly(widget: PCameraWidget; readonly: Plongint): longint; cdecl; external libgphoto2;

// === Konventiert am: 17-11-25 15:47:23 ===


implementation



end.
