unit gtkcssprovider;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkCssProvider = ^TGtkCssProvider;
  TGtkCssProvider = record
    parent_instance: TGObject;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_css_provider_get_type: TGType; cdecl; external libgtk4;
function gtk_css_provider_new: PGtkCssProvider; cdecl; external libgtk4;
function gtk_css_provider_to_string(provider: PGtkCssProvider): pchar; cdecl; external libgtk4;
procedure gtk_css_provider_load_from_data(css_provider: PGtkCssProvider; data: pchar; length: Tgssize); cdecl; external libgtk4; deprecated;
procedure gtk_css_provider_load_from_string(css_provider: PGtkCssProvider; _string: pchar); cdecl; external libgtk4;
procedure gtk_css_provider_load_from_bytes(css_provider: PGtkCssProvider; data: PGBytes); cdecl; external libgtk4;
procedure gtk_css_provider_load_from_file(css_provider: PGtkCssProvider; file_: PGFile); cdecl; external libgtk4;
procedure gtk_css_provider_load_from_path(css_provider: PGtkCssProvider; path: pchar); cdecl; external libgtk4;
procedure gtk_css_provider_load_from_resource(css_provider: PGtkCssProvider; resource_path: pchar); cdecl; external libgtk4;
procedure gtk_css_provider_load_named(provider: PGtkCssProvider; name: pchar; variant: pchar); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 14:08:35 ===

function GTK_TYPE_CSS_PROVIDER: TGType;
function GTK_CSS_PROVIDER(obj: Pointer): PGtkCssProvider;
function GTK_IS_CSS_PROVIDER(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_CSS_PROVIDER: TGType;
begin
  GTK_TYPE_CSS_PROVIDER := gtk_css_provider_get_type;
end;

function GTK_CSS_PROVIDER(obj: Pointer): PGtkCssProvider;
begin
  Result := PGtkCssProvider(g_type_check_instance_cast(obj, GTK_TYPE_CSS_PROVIDER));
end;

function GTK_IS_CSS_PROVIDER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CSS_PROVIDER);
end;



end.
