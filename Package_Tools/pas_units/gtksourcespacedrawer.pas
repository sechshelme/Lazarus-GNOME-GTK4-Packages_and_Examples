unit gtksourcespacedrawer;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGtkSourceSpaceTypeFlags = ^TGtkSourceSpaceTypeFlags;
  TGtkSourceSpaceTypeFlags = longint;

const
  GTK_SOURCE_SPACE_TYPE_NONE = 0;
  GTK_SOURCE_SPACE_TYPE_SPACE = 1 shl 0;
  GTK_SOURCE_SPACE_TYPE_TAB = 1 shl 1;
  GTK_SOURCE_SPACE_TYPE_NEWLINE = 1 shl 2;
  GTK_SOURCE_SPACE_TYPE_NBSP = 1 shl 3;
  GTK_SOURCE_SPACE_TYPE_ALL = $f;

type
  PGtkSourceSpaceLocationFlags = ^TGtkSourceSpaceLocationFlags;
  TGtkSourceSpaceLocationFlags = longint;

const
  GTK_SOURCE_SPACE_LOCATION_NONE = 0;
  GTK_SOURCE_SPACE_LOCATION_LEADING = 1 shl 0;
  GTK_SOURCE_SPACE_LOCATION_INSIDE_TEXT = 1 shl 1;
  GTK_SOURCE_SPACE_LOCATION_TRAILING = 1 shl 2;
  GTK_SOURCE_SPACE_LOCATION_ALL = $7;

  {G_DECLARE_FINAL_TYPE (GtkSourceSpaceDrawer, gtk_source_space_drawer, GTK_SOURCE, SPACE_DRAWER, GObject) }
type
  TGtkSourceSpaceDrawer = record
  end;
  PGtkSourceSpaceDrawer = ^TGtkSourceSpaceDrawer;

  TGtkSourceSpaceDrawerClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSourceSpaceDrawerClass = ^TGtkSourceSpaceDrawerClass;

function gtk_source_space_drawer_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_space_drawer_new: PGtkSourceSpaceDrawer; cdecl; external libgtksourceview5;
function gtk_source_space_drawer_get_types_for_locations(drawer: PGtkSourceSpaceDrawer; locations: TGtkSourceSpaceLocationFlags): TGtkSourceSpaceTypeFlags; cdecl; external libgtksourceview5;
procedure gtk_source_space_drawer_set_types_for_locations(drawer: PGtkSourceSpaceDrawer; locations: TGtkSourceSpaceLocationFlags; types: TGtkSourceSpaceTypeFlags); cdecl; external libgtksourceview5;
function gtk_source_space_drawer_get_matrix(drawer: PGtkSourceSpaceDrawer): PGVariant; cdecl; external libgtksourceview5;
procedure gtk_source_space_drawer_set_matrix(drawer: PGtkSourceSpaceDrawer; matrix: PGVariant); cdecl; external libgtksourceview5;
function gtk_source_space_drawer_get_enable_matrix(drawer: PGtkSourceSpaceDrawer): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_space_drawer_set_enable_matrix(drawer: PGtkSourceSpaceDrawer; enable_matrix: Tgboolean); cdecl; external libgtksourceview5;
procedure gtk_source_space_drawer_bind_matrix_setting(drawer: PGtkSourceSpaceDrawer; settings: PGSettings; key: Pgchar; flags: TGSettingsBindFlags); cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 16:26:37 ===

function GTK_SOURCE_TYPE_SPACE_DRAWER: TGType;
function GTK_SOURCE_SPACE_DRAWER(obj: Pointer): PGtkSourceSpaceDrawer;
function GTK_SOURCE_IS_SPACE_DRAWER(obj: Pointer): Tgboolean;

implementation

function GTK_SOURCE_TYPE_SPACE_DRAWER: TGType;
begin
  Result := gtk_source_space_drawer_get_type;
end;

function GTK_SOURCE_SPACE_DRAWER(obj: Pointer): PGtkSourceSpaceDrawer;
begin
  Result := PGtkSourceSpaceDrawer(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_SPACE_DRAWER));
end;

function GTK_SOURCE_IS_SPACE_DRAWER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_SPACE_DRAWER);
end;


end.
