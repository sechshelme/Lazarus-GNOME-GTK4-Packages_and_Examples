unit gtksourcemap;

interface

uses
  fp_glib2, fp_GTK4, gtksourcetypes, gtksourceview;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_DERIVABLE_TYPE (GtkSourceMap, gtk_source_map, GTK_SOURCE, MAP, GtkSourceView) }
type
  TGtkSourceMap = record
    parent_instance: TGtkSourceView;
  end;
  PGtkSourceMap = ^TGtkSourceMap;

  TGtkSourceMapClass = record
    parent_class: TGtkSourceViewClass;
    _reserved: array[0..9] of Tgpointer;
  end;
  PGtkSourceMapClass = ^TGtkSourceMapClass;

function gtk_source_map_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_map_new: PGtkWidget; cdecl; external libgtksourceview5;
procedure gtk_source_map_set_view(map: PGtkSourceMap; view: PGtkSourceView); cdecl; external libgtksourceview5;
function gtk_source_map_get_view(map: PGtkSourceMap): PGtkSourceView; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 17:37:39 ===

function GTK_SOURCE_TYPE_MAP: TGType;
function GTK_SOURCE_MAP(obj: Pointer): PGtkSourceMap;
function GTK_SOURCE_IS_MAP(obj: Pointer): Tgboolean;
function GTK_SOURCE_MAP_CLASS(klass: Pointer): PGtkSourceMapClass;
function GTK_SOURCE_IS_MAP_CLASS(klass: Pointer): Tgboolean;
function GTK_SOURCE_MAP_GET_CLASS(obj: Pointer): PGtkSourceMapClass;

implementation

function GTK_SOURCE_TYPE_MAP: TGType;
begin
  Result := gtk_source_map_get_type;
end;

function GTK_SOURCE_MAP(obj: Pointer): PGtkSourceMap;
begin
  Result := PGtkSourceMap(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_MAP));
end;

function GTK_SOURCE_IS_MAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_MAP);
end;

function GTK_SOURCE_MAP_CLASS(klass: Pointer): PGtkSourceMapClass;
begin
  Result := PGtkSourceMapClass(g_type_check_class_cast(klass, GTK_SOURCE_TYPE_MAP));
end;

function GTK_SOURCE_IS_MAP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_SOURCE_TYPE_MAP);
end;

function GTK_SOURCE_MAP_GET_CLASS(obj: Pointer): PGtkSourceMapClass;
begin
  Result := PGtkSourceMapClass(PGTypeInstance(obj)^.g_class);
end;


end.
