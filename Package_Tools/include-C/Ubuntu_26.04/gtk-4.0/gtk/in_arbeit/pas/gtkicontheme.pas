unit gtkicontheme;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkenums, gtkiconpaintable;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
type
  PGtkIconLookupFlags = ^TGtkIconLookupFlags;
  TGtkIconLookupFlags = longint;
const
  GTK_ICON_LOOKUP_NONE = 0;
  GTK_ICON_LOOKUP_FORCE_REGULAR = 1 shl 0;
  GTK_ICON_LOOKUP_FORCE_SYMBOLIC = 1 shl 1;
  GTK_ICON_LOOKUP_PRELOAD = 1 shl 2;

type
  PGtkIconThemeError = ^TGtkIconThemeError;
  TGtkIconThemeError = longint;
const
  GTK_ICON_THEME_NOT_FOUND = 0;
  GTK_ICON_THEME_FAILED = 1;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGtkIconTheme = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_icon_theme_error_quark: TGQuark; cdecl; external libgtk4;
function gtk_icon_theme_get_type: TGType; cdecl; external libgtk4;
function gtk_icon_theme_new: PGtkIconTheme; cdecl; external libgtk4;
function gtk_icon_theme_get_for_display(display: PGdkDisplay): PGtkIconTheme; cdecl; external libgtk4;
function gtk_icon_theme_get_display(self: PGtkIconTheme): PGdkDisplay; cdecl; external libgtk4;
procedure gtk_icon_theme_set_search_path(self: PGtkIconTheme; path: PPchar); cdecl; external libgtk4;
function gtk_icon_theme_get_search_path(self: PGtkIconTheme): PPchar; cdecl; external libgtk4;
procedure gtk_icon_theme_add_search_path(self: PGtkIconTheme; path: pchar); cdecl; external libgtk4;
procedure gtk_icon_theme_set_resource_path(self: PGtkIconTheme; path: PPchar); cdecl; external libgtk4;
function gtk_icon_theme_get_resource_path(self: PGtkIconTheme): PPchar; cdecl; external libgtk4;
procedure gtk_icon_theme_add_resource_path(self: PGtkIconTheme; path: pchar); cdecl; external libgtk4;
procedure gtk_icon_theme_set_theme_name(self: PGtkIconTheme; theme_name: pchar); cdecl; external libgtk4;
function gtk_icon_theme_get_theme_name(self: PGtkIconTheme): pchar; cdecl; external libgtk4;
function gtk_icon_theme_has_icon(self: PGtkIconTheme; icon_name: pchar): Tgboolean; cdecl; external libgtk4;
function gtk_icon_theme_has_gicon(self: PGtkIconTheme; gicon: PGIcon): Tgboolean; cdecl; external libgtk4;
function gtk_icon_theme_get_icon_sizes(self: PGtkIconTheme; icon_name: pchar): Plongint; cdecl; external libgtk4;
function gtk_icon_theme_lookup_icon(self: PGtkIconTheme; icon_name: pchar; fallbacks: PPchar; size: longint; scale: longint;
  direction: TGtkTextDirection; flags: TGtkIconLookupFlags): PGtkIconPaintable; cdecl; external libgtk4;
function gtk_icon_theme_lookup_by_gicon(self: PGtkIconTheme; icon: PGIcon; size: longint; scale: longint; direction: TGtkTextDirection;
  flags: TGtkIconLookupFlags): PGtkIconPaintable; cdecl; external libgtk4;
function gtk_icon_theme_get_icon_names(self: PGtkIconTheme): Ppchar; cdecl; external libgtk4;

function GTK_ICON_THEME_ERROR: TGQuark;


// === Konventiert am: 6-7-26 16:14:48 ===

function GTK_TYPE_ICON_THEME: TGType;
function GTK_ICON_THEME(obj: Pointer): PGtkIconTheme;
function GTK_IS_ICON_THEME(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_ICON_THEME: TGType;
begin
  GTK_TYPE_ICON_THEME := gtk_icon_theme_get_type;
end;

function GTK_ICON_THEME(obj: Pointer): PGtkIconTheme;
begin
  Result := PGtkIconTheme(g_type_check_instance_cast(obj, GTK_TYPE_ICON_THEME));
end;

function GTK_IS_ICON_THEME(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_ICON_THEME);
end;


function GTK_ICON_THEME_ERROR: TGQuark;
begin
  GTK_ICON_THEME_ERROR := gtk_icon_theme_error_quark;
end;


end.
