{$IFDEF read_interface}



  {G_DECLARE_FINAL_TYPE (GtkSourceHoverDisplay, gtk_source_hover_display, GTK_SOURCE, HOVER_DISPLAY, GtkWidget) }
type
  TGtkSourceHoverDisplay = record
  end;
  PGtkSourceHoverDisplay = ^TGtkSourceHoverDisplay;

  TGtkSourceHoverDisplayClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkSourceHoverDisplayClass = ^TGtkSourceHoverDisplayClass;

function gtk_source_hover_display_get_type: TGType; cdecl; external libgtksourceview5;
procedure gtk_source_hover_display_append(self: PGtkSourceHoverDisplay; child: PGtkWidget); cdecl; external libgtksourceview5;
procedure gtk_source_hover_display_prepend(self: PGtkSourceHoverDisplay; child: PGtkWidget); cdecl; external libgtksourceview5;
procedure gtk_source_hover_display_insert_after(self: PGtkSourceHoverDisplay; child: PGtkWidget; sibling: PGtkWidget); cdecl; external libgtksourceview5;
procedure gtk_source_hover_display_remove(self: PGtkSourceHoverDisplay; child: PGtkWidget); cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 15:48:56 ===

function GTK_SOURCE_TYPE_HOVER_DISPLAY: TGType;
function GTK_SOURCE_HOVER_DISPLAY(obj: Pointer): PGtkSourceHoverDisplay;
function GTK_SOURCE_IS_HOVER_DISPLAY(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_HOVER_DISPLAY: TGType;
begin
  Result := gtk_source_hover_display_get_type;
end;

function GTK_SOURCE_HOVER_DISPLAY(obj: Pointer): PGtkSourceHoverDisplay;
begin
  Result := PGtkSourceHoverDisplay(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_HOVER_DISPLAY));
end;

function GTK_SOURCE_IS_HOVER_DISPLAY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_HOVER_DISPLAY);
end;


{$ENDIF read_implementation}
