unit soup_websocket_extension;

interface

uses
  fp_glib2, fp_soup, soup_websocket;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TSoupWebsocketExtension = record
    parent_instance: TGObject;
  end;
  PSoupWebsocketExtension = ^TSoupWebsocketExtension;

  TSoupWebsocketExtensionClass = record
    parent_class: TGObjectClass;
    name: pchar;
    configure: function(extension: PSoupWebsocketExtension; connection_type: TSoupWebsocketConnectionType; params: PGHashTable; error: PPGError): Tgboolean; cdecl;
    get_request_params: function(extension: PSoupWebsocketExtension): pchar; cdecl;
    get_response_params: function(extension: PSoupWebsocketExtension): pchar; cdecl;
    process_outgoing_message: function(extension: PSoupWebsocketExtension; header: Pguint8; payload: PGBytes; error: PPGError): PGBytes; cdecl;
    process_incoming_message: function(extension: PSoupWebsocketExtension; header: Pguint8; payload: PGBytes; error: PPGError): PGBytes; cdecl;
    padding: array[0..5] of Tgpointer;
  end;
  PSoupWebsocketExtensionClass = ^TSoupWebsocketExtensionClass;

function soup_websocket_extension_get_type: TGType; cdecl; external libsoup;
function soup_websocket_extension_configure(extension: PSoupWebsocketExtension; connection_type: TSoupWebsocketConnectionType; params: PGHashTable; error: PPGError): Tgboolean; cdecl; external libsoup;
function soup_websocket_extension_get_request_params(extension: PSoupWebsocketExtension): pchar; cdecl; external libsoup;
function soup_websocket_extension_get_response_params(extension: PSoupWebsocketExtension): pchar; cdecl; external libsoup;
function soup_websocket_extension_process_outgoing_message(extension: PSoupWebsocketExtension; header: Pguint8; payload: PGBytes; error: PPGError): PGBytes; cdecl; external libsoup;
function soup_websocket_extension_process_incoming_message(extension: PSoupWebsocketExtension; header: Pguint8; payload: PGBytes; error: PPGError): PGBytes; cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:43:32 ===

function SOUP_TYPE_WEBSOCKET_EXTENSION: TGType;
function SOUP_WEBSOCKET_EXTENSION(obj: Pointer): PSoupWebsocketExtension;
function SOUP_IS_WEBSOCKET_EXTENSION(obj: Pointer): Tgboolean;
function SOUP_WEBSOCKET_EXTENSION_CLASS(klass: Pointer): PSoupWebsocketExtensionClass;
function SOUP_IS_WEBSOCKET_EXTENSION_CLASS(klass: Pointer): Tgboolean;
function SOUP_WEBSOCKET_EXTENSION_GET_CLASS(obj: Pointer): PSoupWebsocketExtensionClass;

implementation

function SOUP_TYPE_WEBSOCKET_EXTENSION: TGType;
begin
  Result := soup_websocket_extension_get_type;
end;

function SOUP_WEBSOCKET_EXTENSION(obj: Pointer): PSoupWebsocketExtension;
begin
  Result := PSoupWebsocketExtension(g_type_check_instance_cast(obj, SOUP_TYPE_WEBSOCKET_EXTENSION));
end;

function SOUP_IS_WEBSOCKET_EXTENSION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_WEBSOCKET_EXTENSION);
end;

function SOUP_WEBSOCKET_EXTENSION_CLASS(klass: Pointer): PSoupWebsocketExtensionClass;
begin
  Result := PSoupWebsocketExtensionClass(g_type_check_class_cast(klass, SOUP_TYPE_WEBSOCKET_EXTENSION));
end;

function SOUP_IS_WEBSOCKET_EXTENSION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, SOUP_TYPE_WEBSOCKET_EXTENSION);
end;

function SOUP_WEBSOCKET_EXTENSION_GET_CLASS(obj: Pointer): PSoupWebsocketExtensionClass;
begin
  Result := PSoupWebsocketExtensionClass(PGTypeInstance(obj)^.g_class);
end;




end.
