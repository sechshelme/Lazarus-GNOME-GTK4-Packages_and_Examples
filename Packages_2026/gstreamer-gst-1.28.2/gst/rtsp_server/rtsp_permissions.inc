

  {$IFDEF read_struct}
type
  PGstRTSPPermissions = ^TGstRTSPPermissions;
  TGstRTSPPermissions = record
    mini_object: TGstMiniObject;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_rtsp_permissions_get_type: TGType; cdecl; external libgstrtsp;
function gst_rtsp_permissions_new: PGstRTSPPermissions; cdecl; external libgstrtsp;
procedure gst_rtsp_permissions_add_role(permissions: PGstRTSPPermissions; role: Pgchar; fieldname: Pgchar); cdecl; varargs; external libgstrtsp;
procedure gst_rtsp_permissions_add_role_valist(permissions: PGstRTSPPermissions; role: Pgchar; fieldname: Pgchar; var_args: Tva_list); cdecl; external libgstrtsp;
procedure gst_rtsp_permissions_add_role_empty(permissions: PGstRTSPPermissions; role: Pgchar); cdecl; external libgstrtsp;
procedure gst_rtsp_permissions_add_role_from_structure(permissions: PGstRTSPPermissions; structure: PGstStructure); cdecl; external libgstrtsp;
procedure gst_rtsp_permissions_add_permission_for_role(permissions: PGstRTSPPermissions; role: Pgchar; permission: Pgchar; allowed: Tgboolean); cdecl; external libgstrtsp;
procedure gst_rtsp_permissions_remove_role(permissions: PGstRTSPPermissions; role: Pgchar); cdecl; external libgstrtsp;
function gst_rtsp_permissions_get_role(permissions: PGstRTSPPermissions; role: Pgchar): PGstStructure; cdecl; external libgstrtsp;
function gst_rtsp_permissions_is_allowed(permissions: PGstRTSPPermissions; role: Pgchar; permission: Pgchar): Tgboolean; cdecl; external libgstrtsp;

// === Konventiert am: 20-7-26 13:44:34 ===

function GST_TYPE_RTSP_PERMISSIONS: TGType;
function GST_IS_RTSP_PERMISSIONS(obj: Pointer): Tgboolean;
function GST_RTSPPERMISSIONS_CAST(obj: Pointer): PGstRTSPPermissions;
function GST_RTSPPERMISSIONS(obj: Pointer): PGstRTSPPermissions;

function gst_rtsp_permissions_ref(permissions: PGstRTSPPermissions): PGstRTSPPermissions;
procedure gst_rtsp_permissions_unref(permissions: PGstRTSPPermissions);
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_RTSP_PERMISSIONS: TGType;
begin
  Result := gst_rtsp_permissions_get_type;
end;

function GST_IS_RTSP_PERMISSIONS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTSP_PERMISSIONS);
end;

function GST_RTSPPERMISSIONS_CAST(obj: Pointer): PGstRTSPPermissions;
begin
  Result := PGstRTSPPermissions(obj);
end;

function GST_RTSPPERMISSIONS(obj: Pointer): PGstRTSPPermissions;
begin
  Result := PGstRTSPPermissions(obj);
end;


function gst_rtsp_permissions_ref(permissions: PGstRTSPPermissions): PGstRTSPPermissions;
begin
  Result := PGstRTSPPermissions(gst_mini_object_ref(PGstMiniObject(permissions)));
end;

procedure gst_rtsp_permissions_unref(permissions: PGstRTSPPermissions);
begin
  gst_mini_object_unref(PGstMiniObject(permissions));
end;

{$ENDIF read_implementation}
