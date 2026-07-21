

  {$IFDEF read_struct}
type
  PGstRTSPMountPointsPrivate = type Pointer;

  PGstRTSPMountPoints = ^TGstRTSPMountPoints;
  TGstRTSPMountPoints = record
    parent: TGObject;
    priv: PGstRTSPMountPointsPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstRTSPMountPointsClass = ^TGstRTSPMountPointsClass;
  TGstRTSPMountPointsClass = record
    parent_class: TGObjectClass;
    make_path: function(mounts: PGstRTSPMountPoints; url: PGstRTSPUrl): Pgchar; cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_rtsp_mount_points_get_type: TGType; cdecl; external libgstrtspserver;
function gst_rtsp_mount_points_new: PGstRTSPMountPoints; cdecl; external libgstrtspserver;
function gst_rtsp_mount_points_make_path(mounts: PGstRTSPMountPoints; url: PGstRTSPUrl): Pgchar; cdecl; external libgstrtspserver;
function gst_rtsp_mount_points_match(mounts: PGstRTSPMountPoints; path: Pgchar; matched: Pgint): PGstRTSPMediaFactory; cdecl; external libgstrtspserver;
procedure gst_rtsp_mount_points_add_factory(mounts: PGstRTSPMountPoints; path: Pgchar; factory: PGstRTSPMediaFactory); cdecl; external libgstrtspserver;
procedure gst_rtsp_mount_points_remove_factory(mounts: PGstRTSPMountPoints; path: Pgchar); cdecl; external libgstrtspserver;

// === Konventiert am: 20-7-26 13:45:20 ===

function GST_TYPE_RTSP_MOUNT_POINTS: TGType;
function GST_RTSP_MOUNT_POINTS(obj: Pointer): PGstRTSPMountPoints;
function GST_RTSP_MOUNT_POINTS_CLASS(klass: Pointer): PGstRTSPMountPointsClass;
function GST_IS_RTSP_MOUNT_POINTS(obj: Pointer): Tgboolean;
function GST_IS_RTSP_MOUNT_POINTS_CLASS(klass: Pointer): Tgboolean;
function GST_RTSP_MOUNT_POINTS_GET_CLASS(obj: Pointer): PGstRTSPMountPointsClass;
function GST_RTSP_MOUNT_POINTS_CAST(obj: Pointer): PGstRTSPMountPoints;
function GST_RTSP_MOUNT_POINTS_CLASS_CAST(klass: Pointer): PGstRTSPMountPointsClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_RTSP_MOUNT_POINTS: TGType;
begin
  Result := gst_rtsp_mount_points_get_type;
end;

function GST_RTSP_MOUNT_POINTS(obj: Pointer): PGstRTSPMountPoints;
begin
  Result := PGstRTSPMountPoints(g_type_check_instance_cast(obj, GST_TYPE_RTSP_MOUNT_POINTS));
end;

function GST_RTSP_MOUNT_POINTS_CLASS(klass: Pointer): PGstRTSPMountPointsClass;
begin
  Result := PGstRTSPMountPointsClass(g_type_check_class_cast(klass, GST_TYPE_RTSP_MOUNT_POINTS));
end;

function GST_IS_RTSP_MOUNT_POINTS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTSP_MOUNT_POINTS);
end;

function GST_IS_RTSP_MOUNT_POINTS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_RTSP_MOUNT_POINTS);
end;

function GST_RTSP_MOUNT_POINTS_GET_CLASS(obj: Pointer): PGstRTSPMountPointsClass;
begin
  Result := PGstRTSPMountPointsClass(PGTypeInstance(obj)^.g_class);
end;

function GST_RTSP_MOUNT_POINTS_CAST(obj: Pointer): PGstRTSPMountPoints;
begin
  Result := PGstRTSPMountPoints(obj);
end;

function GST_RTSP_MOUNT_POINTS_CLASS_CAST(klass: Pointer): PGstRTSPMountPointsClass;
begin
  Result := PGstRTSPMountPointsClass(klass);
end;

{$ENDIF read_implementation}
