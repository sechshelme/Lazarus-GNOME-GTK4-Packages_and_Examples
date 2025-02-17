
{$IFDEF read_interface}

const
  GTK_STYLE_PROVIDER_PRIORITY_FALLBACK = 1;
  GTK_STYLE_PROVIDER_PRIORITY_THEME = 200;
  GTK_STYLE_PROVIDER_PRIORITY_SETTINGS = 400;
  GTK_STYLE_PROVIDER_PRIORITY_APPLICATION = 600;
  GTK_STYLE_PROVIDER_PRIORITY_USER = 800;

type
  TGtkStyleProvider = record // _GtkStyleProvider
  end;
  PGtkStyleProvider = ^TGtkStyleProvider;

function gtk_style_provider_get_type: TGType; cdecl; external libgtk4;
procedure gtk_style_context_add_provider_for_display(display: PGdkDisplay; provider: PGtkStyleProvider; priority: Tguint); cdecl; external libgtk4;
procedure gtk_style_context_remove_provider_for_display(display: PGdkDisplay; provider: PGtkStyleProvider); cdecl; external libgtk4;

// === Konventiert am: 17-7-24 16:33:43 ===

function GTK_TYPE_STYLE_PROVIDER: TGType;
function GTK_STYLE_PROVIDER(obj: Pointer): PGtkStyleProvider;
function GTK_IS_STYLE_PROVIDER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_STYLE_PROVIDER: TGType;
begin
  GTK_TYPE_STYLE_PROVIDER := gtk_style_provider_get_type;
end;

function GTK_STYLE_PROVIDER(obj: Pointer): PGtkStyleProvider;
begin
  Result := PGtkStyleProvider(g_type_check_instance_cast(obj, GTK_TYPE_STYLE_PROVIDER));
end;

function GTK_IS_STYLE_PROVIDER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_STYLE_PROVIDER);
end;



{$ENDIF read_implementation}
