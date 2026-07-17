

  {$IFDEF read_struct}
type
  PGstStreamVolume = type Pointer;

  PGstStreamVolumeInterface = ^TGstStreamVolumeInterface;
  TGstStreamVolumeInterface = record
    iface: TGTypeInterface;
  end;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
type
  PGstStreamVolumeFormat = ^TGstStreamVolumeFormat;
  TGstStreamVolumeFormat = longint;
const
  GST_STREAM_VOLUME_FORMAT_LINEAR = 0;
  GST_STREAM_VOLUME_FORMAT_CUBIC = 1;
  GST_STREAM_VOLUME_FORMAT_DB = 2;
  {$ENDIF read_enum}

{$IFDEF read_function}
function gst_stream_volume_get_type: TGType; cdecl; external libgstaudio;
procedure gst_stream_volume_set_volume(volume: PGstStreamVolume; format: TGstStreamVolumeFormat; val: Tgdouble); cdecl; external libgstaudio;
function gst_stream_volume_get_volume(volume: PGstStreamVolume; format: TGstStreamVolumeFormat): Tgdouble; cdecl; external libgstaudio;
procedure gst_stream_volume_set_mute(volume: PGstStreamVolume; mute: Tgboolean); cdecl; external libgstaudio;
function gst_stream_volume_get_mute(volume: PGstStreamVolume): Tgboolean; cdecl; external libgstaudio;
function gst_stream_volume_convert_volume(from: TGstStreamVolumeFormat; to_: TGstStreamVolumeFormat; val: Tgdouble): Tgdouble; cdecl; external libgstaudio;

// === Konventiert am: 16-7-26 15:26:06 ===

function GST_TYPE_STREAM_VOLUME: TGType;
function GST_STREAM_VOLUME(obj: Pointer): PGstStreamVolume;
function GST_IS_STREAM_VOLUME(obj: Pointer): Tgboolean;
function GST_STREAM_VOLUME_GET_IFACE(obj: Pointer): PGstStreamVolumeInterface;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_STREAM_VOLUME: TGType;
begin
  Result := gst_stream_volume_get_type;
end;

function GST_STREAM_VOLUME(obj: Pointer): PGstStreamVolume;
begin
  Result := PGstStreamVolume(g_type_check_instance_cast(obj, GST_TYPE_STREAM_VOLUME));
end;

function GST_IS_STREAM_VOLUME(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_STREAM_VOLUME);
end;

function GST_STREAM_VOLUME_GET_IFACE(obj: Pointer): PGstStreamVolumeInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_STREAM_VOLUME);
end;

{$ENDIF read_implementation}
