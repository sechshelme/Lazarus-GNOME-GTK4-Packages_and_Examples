unit soup_websocket_extension_manager;

interface

uses
  fp_glib2, fp_soup;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



type
  TSoupWebsocketExtensionManager = record
  end;
  PSoupWebsocketExtensionManager = ^TSoupWebsocketExtensionManager;

  TSoupWebsocketExtensionManagerClass = record
    parent_class: TGObjectClass;
  end;
  PSoupWebsocketExtensionManagerClass = ^TSoupWebsocketExtensionManagerClass;

function soup_websocket_extension_manager_get_type: TGType; cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:42:42 ===

function SOUP_TYPE_WEBSOCKET_EXTENSION_MANAGER: TGType;
function SOUP_WEBSOCKET_EXTENSION_MANAGER(obj: Pointer): PSoupWebsocketExtensionManager;
function SOUP_IS_WEBSOCKET_EXTENSION_MANAGER(obj: Pointer): Tgboolean;

implementation

function SOUP_TYPE_WEBSOCKET_EXTENSION_MANAGER: TGType;
begin
  Result := soup_websocket_extension_manager_get_type;
end;

function SOUP_WEBSOCKET_EXTENSION_MANAGER(obj: Pointer): PSoupWebsocketExtensionManager;
begin
  Result := PSoupWebsocketExtensionManager(g_type_check_instance_cast(obj, SOUP_TYPE_WEBSOCKET_EXTENSION_MANAGER));
end;

function SOUP_IS_WEBSOCKET_EXTENSION_MANAGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_WEBSOCKET_EXTENSION_MANAGER);
end;



end.
