unit soup_websocket_extension_deflate;

interface

uses
  fp_glib2, fp_soup, soup_websocket_extension;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

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

implementation

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


end.
