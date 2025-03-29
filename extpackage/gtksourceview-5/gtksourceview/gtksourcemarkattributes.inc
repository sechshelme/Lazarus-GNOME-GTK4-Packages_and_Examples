{$IFDEF read_interface}



  {G_DECLARE_FINAL_TYPE (GtkSourceMarkAttributes, gtk_source_mark_attributes, GTK_SOURCE, MARK_ATTRIBUTES, GObject) }
type
  TGtkSourceMarkAttributes = record
  end;
  PGtkSourceMarkAttributes = ^TGtkSourceMarkAttributes;

  TGtkSourceMarkAttributesClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSourceMarkAttributesClass = ^TGtkSourceMarkAttributesClass;

function gtk_source_mark_attributes_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_mark_attributes_new: PGtkSourceMarkAttributes; cdecl; external libgtksourceview5;
procedure gtk_source_mark_attributes_set_background(attributes: PGtkSourceMarkAttributes; background: PGdkRGBA); cdecl; external libgtksourceview5;
function gtk_source_mark_attributes_get_background(attributes: PGtkSourceMarkAttributes; background: PGdkRGBA): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_mark_attributes_set_icon_name(attributes: PGtkSourceMarkAttributes; icon_name: Pgchar); cdecl; external libgtksourceview5;
function gtk_source_mark_attributes_get_icon_name(attributes: PGtkSourceMarkAttributes): Pgchar; cdecl; external libgtksourceview5;
procedure gtk_source_mark_attributes_set_gicon(attributes: PGtkSourceMarkAttributes; gicon: PGIcon); cdecl; external libgtksourceview5;
function gtk_source_mark_attributes_get_gicon(attributes: PGtkSourceMarkAttributes): PGIcon; cdecl; external libgtksourceview5;
procedure gtk_source_mark_attributes_set_pixbuf(attributes: PGtkSourceMarkAttributes; pixbuf: PGdkPixbuf); cdecl; external libgtksourceview5;
function gtk_source_mark_attributes_get_pixbuf(attributes: PGtkSourceMarkAttributes): PGdkPixbuf; cdecl; external libgtksourceview5;
function gtk_source_mark_attributes_render_icon(attributes: PGtkSourceMarkAttributes; widget: PGtkWidget; size: Tgint): PGdkPaintable; cdecl; external libgtksourceview5;
function gtk_source_mark_attributes_get_tooltip_text(attributes: PGtkSourceMarkAttributes; mark: PGtkSourceMark): Pgchar; cdecl; external libgtksourceview5;
function gtk_source_mark_attributes_get_tooltip_markup(attributes: PGtkSourceMarkAttributes; mark: PGtkSourceMark): Pgchar; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 15:21:02 ===

function GTK_SOURCE_TYPE_MARK_ATTRIBUTES: TGType;
function GTK_SOURCE_MARK_ATTRIBUTES(obj: Pointer): PGtkSourceMarkAttributes;
function GTK_SOURCE_IS_MARK_ATTRIBUTES(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_MARK_ATTRIBUTES: TGType;
begin
  Result := gtk_source_mark_attributes_get_type;
end;

function GTK_SOURCE_MARK_ATTRIBUTES(obj: Pointer): PGtkSourceMarkAttributes;
begin
  Result := PGtkSourceMarkAttributes(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_MARK_ATTRIBUTES));
end;

function GTK_SOURCE_IS_MARK_ATTRIBUTES(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_MARK_ATTRIBUTES);
end;


{$ENDIF read_implementation}
