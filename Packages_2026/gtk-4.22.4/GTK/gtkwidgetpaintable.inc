

  {$IFDEF read_struct}
type
  PGtkWidgetPaintable = type Pointer;

  TGtkWidgetPaintableClass = record
    parent_class: TGObjectClass;
  end;
  PGtkWidgetPaintableClass = ^TGtkWidgetPaintableClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_widget_paintable_get_type: TGType; cdecl; external libgtk4;
function gtk_widget_paintable_new(widget: PGtkWidget): PGdkPaintable; cdecl; external libgtk4;
function gtk_widget_paintable_get_widget(self: PGtkWidgetPaintable): PGtkWidget; cdecl; external libgtk4;
procedure gtk_widget_paintable_set_widget(self: PGtkWidgetPaintable; widget: PGtkWidget); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:18:01 ===

function GTK_TYPE_WIDGET_PAINTABLE: TGType;
function GTK_WIDGET_PAINTABLE(obj: Pointer): PGtkWidgetPaintable;
function GTK_IS_WIDGET_PAINTABLE(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_WIDGET_PAINTABLE: TGType;
begin
  Result := gtk_widget_paintable_get_type;
end;

function GTK_WIDGET_PAINTABLE(obj: Pointer): PGtkWidgetPaintable;
begin
  Result := PGtkWidgetPaintable(g_type_check_instance_cast(obj, GTK_TYPE_WIDGET_PAINTABLE));
end;

function GTK_IS_WIDGET_PAINTABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_WIDGET_PAINTABLE);
end;

{$ENDIF read_implementation}
