unit gtkdragicon;

interface

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

uses
  fp_glib2, fp_gtk4, gtkwidget;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkDragIcon = type Pointer;

  TGtkDragIconClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkDragIconClass = ^TGtkDragIconClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_drag_icon_get_type: TGType; cdecl; external libgtk4;
function gtk_drag_icon_get_for_drag(drag: PGdkDrag): PGtkWidget; cdecl; external libgtk4;
procedure gtk_drag_icon_set_child(self: PGtkDragIcon; child: PGtkWidget); cdecl; external libgtk4;
function gtk_drag_icon_get_child(self: PGtkDragIcon): PGtkWidget; cdecl; external libgtk4;
procedure gtk_drag_icon_set_from_paintable(drag: PGdkDrag; paintable: PGdkPaintable; hot_x: longint; hot_y: longint); cdecl; external libgtk4;
function gtk_drag_icon_create_widget_for_value(value: PGValue): PGtkWidget; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 14:07:56 ===

function GTK_TYPE_DRAG_ICON: TGType;
function GTK_DRAG_ICON(obj: Pointer): PGtkDragIcon;
function GTK_IS_DRAG_ICON(obj: Pointer): Tgboolean;
{$ENDIF read_struct}

implementation

function GTK_TYPE_DRAG_ICON: TGType;
begin
  Result := gtk_drag_icon_get_type;
end;

function GTK_DRAG_ICON(obj: Pointer): PGtkDragIcon;
begin
  Result := PGtkDragIcon(g_type_check_instance_cast(obj, GTK_TYPE_DRAG_ICON));
end;

function GTK_IS_DRAG_ICON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_DRAG_ICON);
end;

end.
