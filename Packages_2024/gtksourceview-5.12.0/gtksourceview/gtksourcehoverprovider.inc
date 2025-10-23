{$IFDEF read_interface}


  {G_DECLARE_INTERFACE (GtkSourceHoverProvider, gtk_source_hover_provider, GTK_SOURCE, HOVER_PROVIDER, GObject) }
type
  TGtkSourceHoverProvider = record
  end;
  PGtkSourceHoverProvider = ^TGtkSourceHoverProvider;

  TGtkSourceHoverProviderInterface = record
    parent_iface: TGTypeInterface;
    populate: function(self: PGtkSourceHoverProvider; context: PGtkSourceHoverContext; display: PGtkSourceHoverDisplay; error: PPGError): Tgboolean; cdecl;
    populate_async: procedure(self: PGtkSourceHoverProvider; context: PGtkSourceHoverContext; display: PGtkSourceHoverDisplay; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    populate_finish: function(self: PGtkSourceHoverProvider; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl;
  end;
  PGtkSourceHoverProviderInterface = ^TGtkSourceHoverProviderInterface;

function gtk_source_hover_provider_get_type: TGType; cdecl; external libgtksourceview5;
procedure gtk_source_hover_provider_populate_async(self: PGtkSourceHoverProvider; context: PGtkSourceHoverContext; display: PGtkSourceHoverDisplay; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgtksourceview5;
function gtk_source_hover_provider_populate_finish(self: PGtkSourceHoverProvider; Result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 15:45:03 ===

function GTK_SOURCE_TYPE_HOVER_PROVIDER: TGType;
function GTK_SOURCE_HOVER_PROVIDER(obj: Pointer): PGtkSourceHoverProvider;
function GTK_SOURCE_IS_HOVER_PROVIDER(obj: Pointer): Tgboolean;
function GTK_SOURCE_HOVER_PROVIDER_GET_IFACE(obj: Pointer): PGtkSourceHoverProviderInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_HOVER_PROVIDER: TGType;
begin
  Result := gtk_source_hover_provider_get_type;
end;

function GTK_SOURCE_HOVER_PROVIDER(obj: Pointer): PGtkSourceHoverProvider;
begin
  Result := PGtkSourceHoverProvider(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_HOVER_PROVIDER));
end;

function GTK_SOURCE_IS_HOVER_PROVIDER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_HOVER_PROVIDER);
end;

function GTK_SOURCE_HOVER_PROVIDER_GET_IFACE(obj: Pointer): PGtkSourceHoverProviderInterface;
begin
  Result := g_type_interface_peek(obj, GTK_SOURCE_TYPE_HOVER_PROVIDER);
end;


{$ENDIF read_implementation}
