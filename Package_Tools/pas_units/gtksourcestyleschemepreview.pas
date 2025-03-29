unit gtksourcestyleschemepreview;

interface

uses
  fp_glib2, fp_GTK4, gtksourcestylescheme;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_FINAL_TYPE (GtkSourceStyleSchemePreview, gtk_source_style_scheme_preview, GTK_SOURCE, STYLE_SCHEME_PREVIEW, GtkWidget) }
type
  TGtkSourceStyleSchemePreview = record
  end;
  PGtkSourceStyleSchemePreview = ^TGtkSourceStyleSchemePreview;

  TGtkSourceStyleSchemePreviewClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkSourceStyleSchemePreviewClass = ^TGtkSourceStyleSchemePreviewClass;

function gtk_source_style_scheme_preview_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_style_scheme_preview_new(scheme: PGtkSourceStyleScheme): PGtkWidget; cdecl; external libgtksourceview5;
function gtk_source_style_scheme_preview_get_scheme(self: PGtkSourceStyleSchemePreview): PGtkSourceStyleScheme; cdecl; external libgtksourceview5;
function gtk_source_style_scheme_preview_get_selected(self: PGtkSourceStyleSchemePreview): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_style_scheme_preview_set_selected(self: PGtkSourceStyleSchemePreview; selected: Tgboolean); cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 17:25:10 ===

function GTK_SOURCE_TYPE_STYLE_SCHEME_PREVIEW: TGType;
function GTK_SOURCE_STYLE_SCHEME_PREVIEW(obj: Pointer): PGtkSourceStyleSchemePreview;
function GTK_SOURCE_IS_STYLE_SCHEME_PREVIEW(obj: Pointer): Tgboolean;

implementation

function GTK_SOURCE_TYPE_STYLE_SCHEME_PREVIEW: TGType;
begin
  Result := gtk_source_style_scheme_preview_get_type;
end;

function GTK_SOURCE_STYLE_SCHEME_PREVIEW(obj: Pointer): PGtkSourceStyleSchemePreview;
begin
  Result := PGtkSourceStyleSchemePreview(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_STYLE_SCHEME_PREVIEW));
end;

function GTK_SOURCE_IS_STYLE_SCHEME_PREVIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_STYLE_SCHEME_PREVIEW);
end;


end.
