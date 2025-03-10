
{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkDragIcon, gtk_drag_icon, GTK, DRAG_ICON, GtkWidget) }
type
  TGtkDragIcon = record
  end;
  PGtkDragIcon = ^TGtkDragIcon;

  TGtkDragIconClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkDragIconClass = ^TGtkDragIconClass;

function gtk_drag_icon_get_type: TGType; cdecl; external libgtk4;
function gtk_drag_icon_get_for_drag(drag: PGdkDrag): PGtkWidget; cdecl; external libgtk4;
procedure gtk_drag_icon_set_child(self: PGtkDragIcon; child: PGtkWidget); cdecl; external libgtk4;
function gtk_drag_icon_get_child(self: PGtkDragIcon): PGtkWidget; cdecl; external libgtk4;
procedure gtk_drag_icon_set_from_paintable(drag: PGdkDrag; paintable: PGdkPaintable; hot_x: longint; hot_y: longint); cdecl; external libgtk4;
function gtk_drag_icon_create_widget_for_value(Value: PGValue): PGtkWidget; cdecl; external libgtk4;

// === Konventiert am: 25-7-24 18:07:54 ===

function GTK_TYPE_DRAG_ICON: TGType;
function GTK_DRAG_ICON(obj: Pointer): PGtkDragIcon;
function GTK_IS_DRAG_ICON(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

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




{$ENDIF read_implementation}
