{$IFDEF read_interface}


  {G_DECLARE_INTERFACE (GtkSourceStyleSchemeChooser, gtk_source_style_scheme_chooser, GTK_SOURCE, STYLE_SCHEME_CHOOSER, GObject) }
type
  TGtkSourceStyleSchemeChooser = record
  end;
  PGtkSourceStyleSchemeChooser = ^TGtkSourceStyleSchemeChooser;

  TGtkSourceStyleSchemeChooserInterface = record
    base_interface: TGTypeInterface;
    get_style_scheme: function(chooser: PGtkSourceStyleSchemeChooser): PGtkSourceStyleScheme; cdecl;
    set_style_scheme: procedure(chooser: PGtkSourceStyleSchemeChooser; scheme: PGtkSourceStyleScheme); cdecl;
    _reserved: array[0..11] of Tgpointer;
  end;
  PGtkSourceStyleSchemeChooserInterface = ^TGtkSourceStyleSchemeChooserInterface;

function gtk_source_style_scheme_chooser_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_style_scheme_chooser_get_style_scheme(chooser: PGtkSourceStyleSchemeChooser): PGtkSourceStyleScheme; cdecl; external libgtksourceview5;
procedure gtk_source_style_scheme_chooser_set_style_scheme(chooser: PGtkSourceStyleSchemeChooser; scheme: PGtkSourceStyleScheme); cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 17:25:07 ===

function GTK_SOURCE_TYPE_STYLE_SCHEME_CHOOSER: TGType;
function GTK_SOURCE_STYLE_SCHEME_CHOOSER(obj: Pointer): PGtkSourceStyleSchemeChooser;
function GTK_SOURCE_IS_STYLE_SCHEME_CHOOSER(obj: Pointer): Tgboolean;
function GTK_SOURCE_STYLE_SCHEME_CHOOSER_GET_IFACE(obj: Pointer): PGtkSourceStyleSchemeChooserInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_STYLE_SCHEME_CHOOSER: TGType;
begin
  Result := gtk_source_style_scheme_chooser_get_type;
end;

function GTK_SOURCE_STYLE_SCHEME_CHOOSER(obj: Pointer): PGtkSourceStyleSchemeChooser;
begin
  Result := PGtkSourceStyleSchemeChooser(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_STYLE_SCHEME_CHOOSER));
end;

function GTK_SOURCE_IS_STYLE_SCHEME_CHOOSER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_STYLE_SCHEME_CHOOSER);
end;

function GTK_SOURCE_STYLE_SCHEME_CHOOSER_GET_IFACE(obj: Pointer): PGtkSourceStyleSchemeChooserInterface;
begin
  Result := g_type_interface_peek(obj, GTK_SOURCE_TYPE_STYLE_SCHEME_CHOOSER);
end;


{$ENDIF read_implementation}
