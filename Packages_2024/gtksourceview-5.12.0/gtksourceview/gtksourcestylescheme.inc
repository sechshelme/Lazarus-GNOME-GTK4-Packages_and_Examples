{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkSourceStyleScheme, gtk_source_style_scheme, GTK_SOURCE, STYLE_SCHEME, GObject) }
type
  TGtkSourceStyleScheme = record
  end;
  PGtkSourceStyleScheme = ^TGtkSourceStyleScheme;

  TGtkSourceStyleSchemeClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSourceStyleSchemeClass = ^TGtkSourceStyleSchemeClass;

function gtk_source_style_scheme_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_style_scheme_get_id(scheme: PGtkSourceStyleScheme): Pgchar; cdecl; external libgtksourceview5;
function gtk_source_style_scheme_get_name(scheme: PGtkSourceStyleScheme): Pgchar; cdecl; external libgtksourceview5;
function gtk_source_style_scheme_get_description(scheme: PGtkSourceStyleScheme): Pgchar; cdecl; external libgtksourceview5;
function gtk_source_style_scheme_get_authors(scheme: PGtkSourceStyleScheme): PPgchar; cdecl; external libgtksourceview5;
function gtk_source_style_scheme_get_filename(scheme: PGtkSourceStyleScheme): Pgchar; cdecl; external libgtksourceview5;
function gtk_source_style_scheme_get_style(scheme: PGtkSourceStyleScheme; style_id: Pgchar): PGtkSourceStyle; cdecl; external libgtksourceview5;
function gtk_source_style_scheme_get_metadata(scheme: PGtkSourceStyleScheme; Name: pchar): pchar; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 13:56:42 ===

function GTK_SOURCE_TYPE_STYLE_SCHEME: TGType;
function GTK_SOURCE_STYLE_SCHEME(obj: Pointer): PGtkSourceStyleScheme;
function GTK_SOURCE_IS_STYLE_SCHEME(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_STYLE_SCHEME: TGType;
begin
  Result := gtk_source_style_scheme_get_type;
end;

function GTK_SOURCE_STYLE_SCHEME(obj: Pointer): PGtkSourceStyleScheme;
begin
  Result := PGtkSourceStyleScheme(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_STYLE_SCHEME));
end;

function GTK_SOURCE_IS_STYLE_SCHEME(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_STYLE_SCHEME);
end;




{$ENDIF read_implementation}
