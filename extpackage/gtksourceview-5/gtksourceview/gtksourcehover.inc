{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkSourceHover, gtk_source_hover, GTK_SOURCE, HOVER, GObject) }
type
  TGtkSourceHover = record
  end;
  PGtkSourceHover = ^TGtkSourceHover;

  TGtkSourceHoverClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSourceHoverClass = ^TGtkSourceHoverClass;

function gtk_source_hover_get_type: TGType; cdecl; external libgtksourceview5;
procedure gtk_source_hover_add_provider(self: PGtkSourceHover; provider: PGtkSourceHoverProvider); cdecl; external libgtksourceview5;
procedure gtk_source_hover_remove_provider(self: PGtkSourceHover; provider: PGtkSourceHoverProvider); cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 15:43:24 ===

function GTK_SOURCE_TYPE_HOVER: TGType;
function GTK_SOURCE_HOVER(obj: Pointer): PGtkSourceHover;
function GTK_SOURCE_IS_HOVER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_HOVER: TGType;
begin
  Result := gtk_source_hover_get_type;
end;

function GTK_SOURCE_HOVER(obj: Pointer): PGtkSourceHover;
begin
  Result := PGtkSourceHover(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_HOVER));
end;

function GTK_SOURCE_IS_HOVER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_HOVER);
end;


{$ENDIF read_implementation}
