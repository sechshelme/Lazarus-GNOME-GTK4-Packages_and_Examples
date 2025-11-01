unit fp_colord_gtk4;

interface

uses
  fp_glib2, fp_GTK4, fp_colord;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  // ======================   cd-sample-widget.h

type
  PCdSampleWidgetPrivate = type Pointer;

  TCdSampleWidget = record
    parent: TGtkDrawingArea;
    priv: PCdSampleWidgetPrivate;
  end;
  PCdSampleWidget = ^TCdSampleWidget;

  TCdSampleWidgetClass = record
    parent_class: TGtkDrawingAreaClass;
  end;
  PCdSampleWidgetClass = ^TCdSampleWidgetClass;

function cd_sample_widget_get_type: TGType; cdecl; external libcolord_gtk;
function cd_sample_widget_new: PGtkWidget; cdecl; external libcolord_gtk;
procedure cd_sample_widget_set_color(sample: PCdSampleWidget; color: PCdColorRGB); cdecl; external libcolord_gtk;

function CD_TYPE_SAMPLE_WIDGET: TGType;
function CD_SAMPLE_WIDGET(obj: Pointer): PCdSampleWidget;
function CD_SAMPLE_WIDGET_CLASS(klass: Pointer): PCdSampleWidgetClass;
function CD_IS_SAMPLE_WIDGET(obj: Pointer): Tgboolean;
function CD_IS_SAMPLE_WIDGET_CLASS(klass: Pointer): Tgboolean;
function CD_SAMPLE_WIDGET_GET_CLASS(obj: Pointer): PCdSampleWidgetClass;


// ======================   cd-sample-window.h

type
  PCdSampleWindowPrivate = type Pointer;

  TCdSampleWindow = record
    parent: TGtkWindow;
    priv: PCdSampleWindowPrivate;
  end;
  PCdSampleWindow = ^TCdSampleWindow;

  TCdSampleWindowClass = record
    parent_class: TGtkWindowClass;
  end;
  PCdSampleWindowClass = ^TCdSampleWindowClass;

function cd_sample_window_get_type: TGType; cdecl; external libcolord_gtk;
function cd_sample_window_new: PGtkWindow; cdecl; external libcolord_gtk;
procedure cd_sample_window_set_color(sample_window: PCdSampleWindow; color: PCdColorRGB); cdecl; external libcolord_gtk;
procedure cd_sample_window_set_fraction(sample_window: PCdSampleWindow; fraction: Tgdouble); cdecl; external libcolord_gtk;

function CD_TYPE_SAMPLE_WINDOW: TGType;
function CD_SAMPLE_WINDOW(obj: Pointer): PCdSampleWindow;
function CD_IS_SAMPLE_WINDOW(obj: Pointer): Tgboolean;

// ======================   cd-version.h

const
  CD_GTK_MAJOR_VERSION = 0;
  CD_GTK_MINOR_VERSION = 3;
  CD_GTK_MICRO_VERSION = 1;

function CD_CHECK_VERSION(major, minor, micro: integer): boolean;


// ======================   cd-window.h

type
  PCdWindowPrivate = type Pointer;

  TCdWindow = record
    parent: TGObject;
    priv: PCdWindowPrivate;
  end;
  PCdWindow = ^TCdWindow;

  TCdWindowClass = record
    parent_class: TGObjectClass;
    changed: procedure(window: PCdWindow; profile: PCdProfile); cdecl;
    _cd_window_reserved1: procedure; cdecl;
    _cd_window_reserved2: procedure; cdecl;
    _cd_window_reserved3: procedure; cdecl;
    _cd_window_reserved4: procedure; cdecl;
    _cd_window_reserved5: procedure; cdecl;
    _cd_window_reserved6: procedure; cdecl;
    _cd_window_reserved7: procedure; cdecl;
    _cd_window_reserved8: procedure; cdecl;
  end;
  PCdWindowClass = ^TCdWindowClass;

type
  PCdWindowError = ^TCdWindowError;
  TCdWindowError = longint;

const
  CD_WINDOW_ERROR_FAILED = 0;
  CD_WINDOW_ERROR_LAST = 1;

function cd_window_get_type: TGType; cdecl; external libcolord_gtk;
function cd_window_error_quark: TGQuark; cdecl; external libcolord_gtk;
function cd_window_new: PCdWindow; cdecl; external libcolord_gtk;
procedure cd_window_get_profile(window: PCdWindow; widget: PGtkWidget; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libcolord_gtk;
function cd_window_get_profile_finish(window: PCdWindow; res: PGAsyncResult; error: PPGError): PCdProfile; cdecl; external libcolord_gtk;
function cd_window_get_last_profile(window: PCdWindow): PCdProfile; cdecl; external libcolord_gtk;

function CD_WINDOW_ERROR: TGQuark;
function CD_WINDOW_TYPE_ERROR: TGType;

function CD_TYPE_WINDOW: TGType;
function CD_WINDOW(obj: Pointer): PCdWindow;
function CD_WINDOW_CLASS(klass: Pointer): PCdWindowClass;
function CD_IS_WINDOW(obj: Pointer): Tgboolean;
function CD_IS_WINDOW_CLASS(klass: Pointer): Tgboolean;
function CD_WINDOW_GET_CLASS(obj: Pointer): PCdWindowClass;


// ======================   cd-window-sync.h

function cd_window_get_profile_sync(window: PCdWindow; widget: PGtkWidget; cancellable: PGCancellable; error: PPGError): PCdProfile; cdecl; external libcolord_gtk;


implementation

// ======================   cd-sample-widget.h

function CD_TYPE_SAMPLE_WIDGET: TGType;
begin
  CD_TYPE_SAMPLE_WIDGET := cd_sample_widget_get_type;
end;

function CD_SAMPLE_WIDGET(obj: Pointer): PCdSampleWidget;
begin
  Result := PCdSampleWidget(g_type_check_instance_cast(obj, CD_TYPE_SAMPLE_WIDGET));
end;

function CD_SAMPLE_WIDGET_CLASS(klass: Pointer): PCdSampleWidgetClass;
begin
  Result := PCdSampleWidgetClass(g_type_check_class_cast(klass, CD_TYPE_SAMPLE_WIDGET));
end;

function CD_IS_SAMPLE_WIDGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, CD_TYPE_SAMPLE_WIDGET);
end;

function CD_IS_SAMPLE_WIDGET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, CD_TYPE_SAMPLE_WIDGET);
end;

function CD_SAMPLE_WIDGET_GET_CLASS(obj: Pointer): PCdSampleWidgetClass;
begin
  Result := PCdSampleWidgetClass(PGTypeInstance(obj)^.g_class);
end;


// ======================   cd-sample-window.h

function CD_TYPE_SAMPLE_WINDOW: TGType;
begin
  CD_TYPE_SAMPLE_WINDOW := cd_sample_window_get_type;
end;

function CD_SAMPLE_WINDOW(obj: Pointer): PCdSampleWindow;
begin
  Result := PCdSampleWindow(g_type_check_instance_cast(obj, CD_TYPE_SAMPLE_WINDOW));
end;

function CD_IS_SAMPLE_WINDOW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, CD_TYPE_SAMPLE_WINDOW);
end;


// ======================   cd-version.h

function CD_CHECK_VERSION(major, minor, micro: integer): boolean;
begin
  Result :=
    (CD_GTK_MAJOR_VERSION > major) or
    ((CD_GTK_MAJOR_VERSION = major) and (CD_GTK_MINOR_VERSION > minor)) or
    ((CD_GTK_MAJOR_VERSION = major) and (CD_GTK_MINOR_VERSION = minor) and
    (CD_GTK_MICRO_VERSION >= micro));
end;


// ======================   cd-window.h

function CD_TYPE_WINDOW: TGType;
begin
  CD_TYPE_WINDOW := cd_window_get_type;
end;

function CD_WINDOW(obj: Pointer): PCdWindow;
begin
  Result := PCdWindow(g_type_check_instance_cast(obj, CD_TYPE_WINDOW));
end;

function CD_WINDOW_CLASS(klass: Pointer): PCdWindowClass;
begin
  Result := PCdWindowClass(g_type_check_class_cast(klass, CD_TYPE_WINDOW));
end;

function CD_IS_WINDOW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, CD_TYPE_WINDOW);
end;

function CD_IS_WINDOW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, CD_TYPE_WINDOW);
end;

function CD_WINDOW_GET_CLASS(obj: Pointer): PCdWindowClass;
begin
  Result := PCdWindowClass(PGTypeInstance(obj)^.g_class);
end;


function CD_WINDOW_ERROR: TGQuark;
begin
  CD_WINDOW_ERROR := cd_window_error_quark;
end;

function CD_WINDOW_TYPE_ERROR: TGType;
begin
  // Fehlt in der Original Source
//  CD_WINDOW_TYPE_ERROR := cd_window_error_get_type;
end;

end.
