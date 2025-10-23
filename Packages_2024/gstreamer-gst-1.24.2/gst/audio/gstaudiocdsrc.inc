
{$IFDEF read_interface}

type
  PGstAudioCdSrcMode = ^TGstAudioCdSrcMode;
  TGstAudioCdSrcMode = longint;

const
  GST_AUDIO_CD_SRC_MODE_NORMAL = 0;
  GST_AUDIO_CD_SRC_MODE_CONTINUOUS = 1;

type
  TGstAudioCdSrcTrack = record
    is_audio: Tgboolean;
    num: Tguint;
    start: Tguint;
    end_: Tguint;
    tags: PGstTagList;
    _gst_reserved1: array[0..(GST_PADDING div 2) - 1] of Tguint;
    _gst_reserved2: array[0..(GST_PADDING div 2) - 1] of Tgpointer;
  end;
  PGstAudioCdSrcTrack = ^TGstAudioCdSrcTrack;

  TGstAudioCdSrcPrivate = record
  end;
  PGstAudioCdSrcPrivate = ^TGstAudioCdSrcPrivate;

  TGstAudioCdSrc = record
    pushsrc: TGstPushSrc;
    tags: PGstTagList;
    priv: PGstAudioCdSrcPrivate;
    _gst_reserved1: array[0..(GST_PADDING div 2) - 1] of Tguint;
    _gst_reserved2: array[0..(GST_PADDING div 2) - 1] of Tgpointer;
  end;
  PGstAudioCdSrc = ^TGstAudioCdSrc;

type
  TGstAudioCdSrcClass = record
    pushsrc_class: TGstPushSrcClass;
    Open: function(src: PGstAudioCdSrc; device: Pgchar): Tgboolean; cdecl;
    Close: procedure(src: PGstAudioCdSrc); cdecl;
    read_sector: function(src: PGstAudioCdSrc; sector: Tgint): PGstBuffer; cdecl;
    get_default_device: function(src: PGstAudioCdSrc): Pgchar; cdecl;
    probe_devices: function(src: PGstAudioCdSrc): PPgchar; cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;
  PGstAudioCdSrcClass = ^TGstAudioCdSrcClass;

function gst_audio_cd_src_get_type: TGType; cdecl; external libgstaudio;
function gst_audio_cd_src_add_track(src: PGstAudioCdSrc; track: PGstAudioCdSrcTrack): Tgboolean; cdecl; external libgstaudio;

// === Konventiert am: 28-9-24 19:15:31 ===

function GST_TYPE_AUDIO_CD_SRC: TGType;
function GST_AUDIO_CD_SRC(obj: Pointer): PGstAudioCdSrc;
function GST_AUDIO_CD_SRC_CLASS(klass: Pointer): PGstAudioCdSrcClass;
function GST_IS_AUDIO_CD_SRC(obj: Pointer): Tgboolean;
function GST_IS_AUDIO_CD_SRC_CLASS(klass: Pointer): Tgboolean;
function GST_AUDIO_CD_SRC_GET_CLASS(obj: Pointer): PGstAudioCdSrcClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_AUDIO_CD_SRC: TGType;
begin
  GST_TYPE_AUDIO_CD_SRC := gst_audio_cd_src_get_type;
end;

function GST_AUDIO_CD_SRC(obj: Pointer): PGstAudioCdSrc;
begin
  Result := PGstAudioCdSrc(g_type_check_instance_cast(obj, GST_TYPE_AUDIO_CD_SRC));
end;

function GST_AUDIO_CD_SRC_CLASS(klass: Pointer): PGstAudioCdSrcClass;
begin
  Result := PGstAudioCdSrcClass(g_type_check_class_cast(klass, GST_TYPE_AUDIO_CD_SRC));
end;

function GST_IS_AUDIO_CD_SRC(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_AUDIO_CD_SRC);
end;

function GST_IS_AUDIO_CD_SRC_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_AUDIO_CD_SRC);
end;

function GST_AUDIO_CD_SRC_GET_CLASS(obj: Pointer): PGstAudioCdSrcClass;
begin
  Result := PGstAudioCdSrcClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
