/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   16:45                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}



type
  TGstStreamVolumeInterface = record
    iface: TGTypeInterface;
  end;
  PGstStreamVolumeInterface = ^TGstStreamVolumeInterface;

  PGstStreamVolumeFormat = ^TGstStreamVolumeFormat;
  TGstStreamVolumeFormat = longint;

const
  GST_STREAM_VOLUME_FORMAT_LINEAR = 0;
  GST_STREAM_VOLUME_FORMAT_CUBIC = 1;
  GST_STREAM_VOLUME_FORMAT_DB = 2;

type
  TGstStreamVolume = record
  end;
  PGstStreamVolume = ^TGstStreamVolume;

function gst_stream_volume_get_type: TGType; cdecl; external libgstaudio;
procedure gst_stream_volume_set_volume(volume: PGstStreamVolume; format: TGstStreamVolumeFormat; val: Tgdouble); cdecl; external libgstaudio;
function gst_stream_volume_get_volume(volume: PGstStreamVolume; format: TGstStreamVolumeFormat): Tgdouble; cdecl; external libgstaudio;
procedure gst_stream_volume_set_mute(volume: PGstStreamVolume; mute: Tgboolean); cdecl; external libgstaudio;
function gst_stream_volume_get_mute(volume: PGstStreamVolume): Tgboolean; cdecl; external libgstaudio;
function gst_stream_volume_convert_volume(from: TGstStreamVolumeFormat; to_: TGstStreamVolumeFormat; val: Tgdouble): Tgdouble; cdecl; external libgstaudio;

function GST_STREAM_VOLUME_GET_INTERFACE(obj: Pointer): PGstStreamVolumeInterface;

// === Konventiert am: 28-9-24 20:07:37 ===

function GST_TYPE_STREAM_VOLUME: TGType;
function GST_STREAM_VOLUME(obj: Pointer): PGstStreamVolume;
function GST_IS_STREAM_VOLUME(obj: Pointer): Tgboolean;
function GST_STREAM_VOLUME_GET_IFACE(obj: Pointer): PGstStreamVolumeInterface;

{$ENDIF read_interface}


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

// ====

function GST_STREAM_VOLUME_GET_INTERFACE(obj: Pointer): PGstStreamVolumeInterface;
begin
  GST_STREAM_VOLUME_GET_INTERFACE := GST_STREAM_VOLUME_GET_IFACE(obj);
end;


{$ENDIF read_implementation}
