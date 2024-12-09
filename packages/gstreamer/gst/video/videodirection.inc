
{$IFDEF read_interface}

type
  TGstVideoDirection = record
  end;
  PGstVideoDirection = ^TGstVideoDirection;

  TGstVideoDirectionInterface = record
    iface: TGTypeInterface;
  end;
  PGstVideoDirectionInterface = ^TGstVideoDirectionInterface;


function gst_video_direction_get_type: TGType; cdecl; external libgstvideo;

// === Konventiert am: 1-10-24 15:18:46 ===

function GST_TYPE_VIDEO_DIRECTION: TGType;
function GST_VIDEO_DIRECTION(obj: Pointer): PGstVideoDirection;
function GST_IS_VIDEO_DIRECTION(obj: Pointer): Tgboolean;
function GST_VIDEO_DIRECTION_GET_INTERFACE(obj: Pointer): PGstVideoDirectionInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VIDEO_DIRECTION: TGType;
begin
  GST_TYPE_VIDEO_DIRECTION := gst_video_direction_get_type;
end;

function GST_VIDEO_DIRECTION(obj: Pointer): PGstVideoDirection;
begin
  Result := PGstVideoDirection(g_type_check_instance_cast(obj, GST_TYPE_VIDEO_DIRECTION));
end;

function GST_IS_VIDEO_DIRECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VIDEO_DIRECTION);
end;

function GST_VIDEO_DIRECTION_GET_INTERFACE(obj: Pointer): PGstVideoDirectionInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_VIDEO_DIRECTION);
end;



{$ENDIF read_implementation}
