
  {$IFDEF read_struct}
type
  PGtkDrawingArea = ^TGtkDrawingArea;

  TGtkDrawingAreaDrawFunc = procedure(drawing_area: PGtkDrawingArea; cr: Pcairo_t; width: longint; height: longint; user_data: Tgpointer); cdecl;

  TGtkDrawingArea = record
    widget: TGtkWidget;
  end;

  PGtkDrawingAreaClass = ^TGtkDrawingAreaClass;
  TGtkDrawingAreaClass = record
    parent_class: TGtkWidgetClass;
    resize: procedure(area: PGtkDrawingArea; width: longint; height: longint); cdecl;
    padding: array[0..7] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_drawing_area_get_type: TGType; cdecl; external libgtk4;
function gtk_drawing_area_new: PGtkWidget; cdecl; external libgtk4;
procedure gtk_drawing_area_set_content_width(self: PGtkDrawingArea; width: longint); cdecl; external libgtk4;
function gtk_drawing_area_get_content_width(self: PGtkDrawingArea): longint; cdecl; external libgtk4;
procedure gtk_drawing_area_set_content_height(self: PGtkDrawingArea; height: longint); cdecl; external libgtk4;
function gtk_drawing_area_get_content_height(self: PGtkDrawingArea): longint; cdecl; external libgtk4;
procedure gtk_drawing_area_set_draw_func(self: PGtkDrawingArea; draw_func: TGtkDrawingAreaDrawFunc; user_data: Tgpointer; destroy: TGDestroyNotify); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:25:30 ===

function GTK_TYPE_DRAWING_AREA: TGType;
function GTK_DRAWING_AREA(obj: Pointer): PGtkDrawingArea;
function GTK_DRAWING_AREA_CLASS(klass: Pointer): PGtkDrawingAreaClass;
function GTK_IS_DRAWING_AREA(obj: Pointer): Tgboolean;
function GTK_IS_DRAWING_AREA_CLASS(klass: Pointer): Tgboolean;
function GTK_DRAWING_AREA_GET_CLASS(obj: Pointer): PGtkDrawingAreaClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_DRAWING_AREA: TGType;
begin
  GTK_TYPE_DRAWING_AREA := gtk_drawing_area_get_type;
end;

function GTK_DRAWING_AREA(obj: Pointer): PGtkDrawingArea;
begin
  Result := PGtkDrawingArea(g_type_check_instance_cast(obj, GTK_TYPE_DRAWING_AREA));
end;

function GTK_DRAWING_AREA_CLASS(klass: Pointer): PGtkDrawingAreaClass;
begin
  Result := PGtkDrawingAreaClass(g_type_check_class_cast(klass, GTK_TYPE_DRAWING_AREA));
end;

function GTK_IS_DRAWING_AREA(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_DRAWING_AREA);
end;

function GTK_IS_DRAWING_AREA_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_DRAWING_AREA);
end;

function GTK_DRAWING_AREA_GET_CLASS(obj: Pointer): PGtkDrawingAreaClass;
begin
  Result := PGtkDrawingAreaClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
