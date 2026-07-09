unit gtkwindowhandle;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkWindowHandle = type Pointer;

  TGtkWindowHandleClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkWindowHandleClass = ^TGtkWindowHandleClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_window_handle_get_type: TGType; cdecl; external libgtk4;
function gtk_window_handle_new: PGtkWidget; cdecl; external libgtk4;
function gtk_window_handle_get_child(self: PGtkWindowHandle): PGtkWidget; cdecl; external libgtk4;
procedure gtk_window_handle_set_child(self: PGtkWindowHandle; child: PGtkWidget); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:17:57 ===

function GTK_TYPE_WINDOW_HANDLE: TGType;
function GTK_WINDOW_HANDLE(obj: Pointer): PGtkWindowHandle;
function GTK_IS_WINDOW_HANDLE(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_WINDOW_HANDLE: TGType;
begin
  Result := gtk_window_handle_get_type;
end;

function GTK_WINDOW_HANDLE(obj: Pointer): PGtkWindowHandle;
begin
  Result := PGtkWindowHandle(g_type_check_instance_cast(obj, GTK_TYPE_WINDOW_HANDLE));
end;

function GTK_IS_WINDOW_HANDLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_WINDOW_HANDLE);
end;

end.
