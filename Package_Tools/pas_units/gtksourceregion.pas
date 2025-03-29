unit gtksourceregion;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_DERIVABLE_TYPE (GtkSourceRegion, gtk_source_region, GTK_SOURCE, REGION, GObject) }
type
  TGtkSourceRegionClass = record
    parent_class: TGObjectClass;
    _reserved: array[0..9] of Tgpointer;
  end;
  PGtkSourceRegionClass = ^TGtkSourceRegionClass;

  TGtkSourceRegionIter = record
    dummy1: Tgpointer;
    dummy2: Tguint32;
    dummy3: Tgpointer;
  end;
  PGtkSourceRegionIter = ^TGtkSourceRegionIter;

  TGtkSourceRegion = record
  end;
  PGtkSourceRegion = ^TGtkSourceRegion;

function gtk_source_region_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_region_new(buffer: PGtkTextBuffer): PGtkSourceRegion; cdecl; external libgtksourceview5;
function gtk_source_region_get_buffer(region: PGtkSourceRegion): PGtkTextBuffer; cdecl; external libgtksourceview5;
procedure gtk_source_region_add_subregion(region: PGtkSourceRegion; _start: PGtkTextIter; _end: PGtkTextIter); cdecl; external libgtksourceview5;
procedure gtk_source_region_add_region(region: PGtkSourceRegion; region_to_add: PGtkSourceRegion); cdecl; external libgtksourceview5;
procedure gtk_source_region_subtract_subregion(region: PGtkSourceRegion; _start: PGtkTextIter; _end: PGtkTextIter); cdecl; external libgtksourceview5;
procedure gtk_source_region_subtract_region(region: PGtkSourceRegion; region_to_subtract: PGtkSourceRegion); cdecl; external libgtksourceview5;
function gtk_source_region_intersect_subregion(region: PGtkSourceRegion; _start: PGtkTextIter; _end: PGtkTextIter): PGtkSourceRegion; cdecl; external libgtksourceview5;
function gtk_source_region_intersect_region(region1: PGtkSourceRegion; region2: PGtkSourceRegion): PGtkSourceRegion; cdecl; external libgtksourceview5;
function gtk_source_region_is_empty(region: PGtkSourceRegion): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_region_get_bounds(region: PGtkSourceRegion; start: PGtkTextIter; end_: PGtkTextIter): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_region_get_start_region_iter(region: PGtkSourceRegion; iter: PGtkSourceRegionIter); cdecl; external libgtksourceview5;
function gtk_source_region_iter_is_end(iter: PGtkSourceRegionIter): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_region_iter_next(iter: PGtkSourceRegionIter): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_region_iter_get_subregion(iter: PGtkSourceRegionIter; start: PGtkTextIter; end_: PGtkTextIter): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_region_to_string(region: PGtkSourceRegion): Pgchar; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 17:13:55 ===

function GTK_SOURCE_TYPE_REGION: TGType;
function GTK_SOURCE_REGION(obj: Pointer): PGtkSourceRegion;
function GTK_SOURCE_IS_REGION(obj: Pointer): Tgboolean;
function GTK_SOURCE_REGION_CLASS(klass: Pointer): PGtkSourceRegionClass;
function GTK_SOURCE_IS_REGION_CLASS(klass: Pointer): Tgboolean;
function GTK_SOURCE_REGION_GET_CLASS(obj: Pointer): PGtkSourceRegionClass;

implementation

function GTK_SOURCE_TYPE_REGION: TGType;
begin
  Result := gtk_source_region_get_type;
end;

function GTK_SOURCE_REGION(obj: Pointer): PGtkSourceRegion;
begin
  Result := PGtkSourceRegion(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_REGION));
end;

function GTK_SOURCE_IS_REGION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_REGION);
end;

function GTK_SOURCE_REGION_CLASS(klass: Pointer): PGtkSourceRegionClass;
begin
  Result := PGtkSourceRegionClass(g_type_check_class_cast(klass, GTK_SOURCE_TYPE_REGION));
end;

function GTK_SOURCE_IS_REGION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_SOURCE_TYPE_REGION);
end;

function GTK_SOURCE_REGION_GET_CLASS(obj: Pointer): PGtkSourceRegionClass;
begin
  Result := PGtkSourceRegionClass(PGTypeInstance(obj)^.g_class);
end;


end.
