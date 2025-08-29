{$IFDEF read_interface}



type
  TXdpPortal = record
  end;
  PXdpPortal = ^TXdpPortal;

  TXdpPortalClass = record
    parent_class: TGObjectClass;
  end;
  PXdpPortalClass = ^TXdpPortalClass;

function xdp_portal_get_type: TGType; cdecl; external libportal;
function xdp_portal_new: PXdpPortal; cdecl; external libportal;
function xdp_portal_initable_new(error: PPGError): PXdpPortal; cdecl; external libportal;
function xdp_portal_running_under_flatpak: Tgboolean; cdecl; external libportal;
function xdp_portal_running_under_snap(error: PPGError): Tgboolean; cdecl; external libportal;
function xdp_portal_running_under_sandbox: Tgboolean; cdecl; external libportal;

// === Konventiert am: 29-8-25 15:36:12 ===

function XDP_TYPE_PORTAL: TGType;
function XDP_PORTAL(obj: Pointer): PXdpPortal;
function XDP_IS_PORTAL(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XDP_TYPE_PORTAL: TGType;
begin
  Result := xdp_portal_get_type;
end;

function XDP_PORTAL(obj: Pointer): PXdpPortal;
begin
  Result := PXdpPortal(g_type_check_instance_cast(obj, XDP_TYPE_PORTAL));
end;

function XDP_IS_PORTAL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, XDP_TYPE_PORTAL);
end;


{$ENDIF read_implementation}
