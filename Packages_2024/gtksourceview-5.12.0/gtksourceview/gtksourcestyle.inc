{$IFDEF read_interface}



  {G_DECLARE_FINAL_TYPE (GtkSourceStyle, gtk_source_style, GTK_SOURCE, STYLE, GObject) }
type
  TGtkSourceStyle = record
  end;
  PGtkSourceStyle = ^TGtkSourceStyle;

  TGtkSourceStyleClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSourceStyleClass = ^TGtkSourceStyleClass;

function gtk_source_style_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_style_copy(style: PGtkSourceStyle): PGtkSourceStyle; cdecl; external libgtksourceview5;
procedure gtk_source_style_apply(style: PGtkSourceStyle; tag: PGtkTextTag); cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 13:59:05 ===

function GTK_SOURCE_TYPE_STYLE: TGType;
function GTK_SOURCE_STYLE(obj: Pointer): PGtkSourceStyle;
function GTK_SOURCE_IS_STYLE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_STYLE: TGType;
begin
  Result := gtk_source_style_get_type;
end;

function GTK_SOURCE_STYLE(obj: Pointer): PGtkSourceStyle;
begin
  Result := PGtkSourceStyle(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_STYLE));
end;

function GTK_SOURCE_IS_STYLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_STYLE);
end;


{$ENDIF read_implementation}
