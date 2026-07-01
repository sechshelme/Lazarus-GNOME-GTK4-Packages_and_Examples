

  {$IFDEF read_struct}
type
  PGLoadableIconIface = ^TGLoadableIconIface;
  TGLoadableIconIface = record
    g_iface: TGTypeInterface;
    load: function(icon: PGLoadableIcon; size: longint; _type: PPchar; cancellable: PGCancellable; error: PPGError): PGInputStream; cdecl;
    load_async: procedure(icon: PGLoadableIcon; size: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    load_finish: function(icon: PGLoadableIcon; res: PGAsyncResult; _type: PPchar; error: PPGError): PGInputStream; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_loadable_icon_get_type: TGType; cdecl; external libgio2;
function g_loadable_icon_load(icon: PGLoadableIcon; size: longint; _type: PPchar; cancellable: PGCancellable; error: PPGError): PGInputStream; cdecl; external libgio2;
procedure g_loadable_icon_load_async(icon: PGLoadableIcon; size: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_loadable_icon_load_finish(icon: PGLoadableIcon; res: PGAsyncResult; _type: PPchar; error: PPGError): PGInputStream; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:39:48 ===

function G_TYPE_LOADABLE_ICON: TGType;
function G_LOADABLE_ICON(obj: Pointer): PGLoadableIcon;
function G_IS_LOADABLE_ICON(obj: Pointer): Tgboolean;
function G_LOADABLE_ICON_GET_IFACE(obj: Pointer): PGLoadableIconIface;
{$ENDIF read_function}


{$IFDEF read_implementation}

function G_TYPE_LOADABLE_ICON: TGType;
begin
  G_TYPE_LOADABLE_ICON := g_loadable_icon_get_type;
end;

function G_LOADABLE_ICON(obj: Pointer): PGLoadableIcon;
begin
  Result := PGLoadableIcon(g_type_check_instance_cast(obj, G_TYPE_LOADABLE_ICON));
end;

function G_IS_LOADABLE_ICON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_LOADABLE_ICON);
end;

function G_LOADABLE_ICON_GET_IFACE(obj: Pointer): PGLoadableIconIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_LOADABLE_ICON);
end;



{$ENDIF read_implementation}
