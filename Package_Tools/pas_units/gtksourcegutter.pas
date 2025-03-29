unit gtksourcegutter;

interface

uses
  fp_glib2, fp_GTK4, gtksourcetypes, gtksourcegutterrenderer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_FINAL_TYPE (GtkSourceGutter, gtk_source_gutter, GTK_SOURCE, GUTTER, GtkWidget) }
type
  TGtkSourceGutter = record
  end;
  PGtkSourceGutter = ^TGtkSourceGutter;

  TGtkSourceGutterClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkSourceGutterClass = ^TGtkSourceGutterClass;

function gtk_source_gutter_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_gutter_get_view(gutter: PGtkSourceGutter): PGtkSourceView; cdecl; external libgtksourceview5;
function gtk_source_gutter_insert(gutter: PGtkSourceGutter; renderer: PGtkSourceGutterRenderer; position: Tgint): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_gutter_reorder(gutter: PGtkSourceGutter; renderer: PGtkSourceGutterRenderer; position: Tgint); cdecl; external libgtksourceview5;
procedure gtk_source_gutter_remove(gutter: PGtkSourceGutter; renderer: PGtkSourceGutterRenderer); cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 15:53:21 ===

function GTK_SOURCE_TYPE_GUTTER: TGType;
function GTK_SOURCE_GUTTER(obj: Pointer): PGtkSourceGutter;
function GTK_SOURCE_IS_GUTTER(obj: Pointer): Tgboolean;

implementation

function GTK_SOURCE_TYPE_GUTTER: TGType;
begin
  Result := gtk_source_gutter_get_type;
end;

function GTK_SOURCE_GUTTER(obj: Pointer): PGtkSourceGutter;
begin
  Result := PGtkSourceGutter(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_GUTTER));
end;

function GTK_SOURCE_IS_GUTTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_GUTTER);
end;


end.
