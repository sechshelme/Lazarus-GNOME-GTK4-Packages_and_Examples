{$IFDEF read_interface}

type
  TSoupWebsocketExtensionDeflate = record
  end;
  PSoupWebsocketExtensionDeflate = ^TSoupWebsocketExtensionDeflate;

  TSoupWebsocketExtensionDeflateClass = record
    parent_class: TSoupWebsocketExtensionClass;
  end;
  PSoupWebsocketExtensionDeflateClass = ^TSoupWebsocketExtensionDeflateClass;

function soup_websocket_extension_deflate_get_type: TGType; cdecl; external libsoup;


// === Konventiert am: 29-9-25 19:43:28 ===

function SOUP_TYPE_WEBSOCKET_EXTENSION_DEFLATE: TGType;
function SOUP_WEBSOCKET_EXTENSION_DEFLATE(obj: Pointer): PSoupWebsocketExtensionDeflate;
function SOUP_IS_WEBSOCKET_EXTENSION_DEFLATE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SOUP_TYPE_WEBSOCKET_EXTENSION_DEFLATE: TGType;
begin
  Result := soup_websocket_extension_deflate_get_type;
end;

function SOUP_WEBSOCKET_EXTENSION_DEFLATE(obj: Pointer): PSoupWebsocketExtensionDeflate;
begin
  Result := PSoupWebsocketExtensionDeflate(g_type_check_instance_cast(obj, SOUP_TYPE_WEBSOCKET_EXTENSION_DEFLATE));
end;

function SOUP_IS_WEBSOCKET_EXTENSION_DEFLATE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_WEBSOCKET_EXTENSION_DEFLATE);
end;


{$ENDIF read_implementation}
