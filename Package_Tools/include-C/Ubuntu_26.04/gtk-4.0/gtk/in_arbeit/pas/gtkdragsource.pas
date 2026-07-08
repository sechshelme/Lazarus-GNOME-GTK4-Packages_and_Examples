unit gtkdragsource;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  PGtkDragSource = type Pointer;
  PGtkDragSourceClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_drag_source_get_type: TGType; cdecl; external libgtk4;
function gtk_drag_source_new: PGtkDragSource; cdecl; external libgtk4;
procedure gtk_drag_source_set_content(source: PGtkDragSource; content: PGdkContentProvider); cdecl; external libgtk4;
function gtk_drag_source_get_content(source: PGtkDragSource): PGdkContentProvider; cdecl; external libgtk4;
procedure gtk_drag_source_set_actions(source: PGtkDragSource; actions: TGdkDragAction); cdecl; external libgtk4;
function gtk_drag_source_get_actions(source: PGtkDragSource): TGdkDragAction; cdecl; external libgtk4;
procedure gtk_drag_source_set_icon(source: PGtkDragSource; paintable: PGdkPaintable; hot_x: longint; hot_y: longint); cdecl; external libgtk4;
procedure gtk_drag_source_drag_cancel(source: PGtkDragSource); cdecl; external libgtk4;
function gtk_drag_source_get_drag(source: PGtkDragSource): PGdkDrag; cdecl; external libgtk4;
function gtk_drag_check_threshold(widget: PGtkWidget; start_x: longint; start_y: longint; current_x: longint; current_y: longint): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:33:39 ===

function GTK_TYPE_DRAG_SOURCE: TGType;
function GTK_DRAG_SOURCE(obj: Pointer): PGtkDragSource;
function GTK_DRAG_SOURCE_CLASS(klass: Pointer): PGtkDragSourceClass;
function GTK_IS_DRAG_SOURCE(obj: Pointer): Tgboolean;
function GTK_IS_DRAG_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GTK_DRAG_SOURCE_GET_CLASS(obj: Pointer): PGtkDragSourceClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_DRAG_SOURCE: TGType;
begin
  GTK_TYPE_DRAG_SOURCE := gtk_drag_source_get_type;
end;

function GTK_DRAG_SOURCE(obj: Pointer): PGtkDragSource;
begin
  Result := PGtkDragSource(g_type_check_instance_cast(obj, GTK_TYPE_DRAG_SOURCE));
end;

function GTK_DRAG_SOURCE_CLASS(klass: Pointer): PGtkDragSourceClass;
begin
  Result := PGtkDragSourceClass(g_type_check_class_cast(klass, GTK_TYPE_DRAG_SOURCE));
end;

function GTK_IS_DRAG_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_DRAG_SOURCE);
end;

function GTK_IS_DRAG_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_DRAG_SOURCE);
end;

function GTK_DRAG_SOURCE_GET_CLASS(obj: Pointer): PGtkDragSourceClass;
begin
  Result := PGtkDragSourceClass(PGTypeInstance(obj)^.g_class);
end;


end.
