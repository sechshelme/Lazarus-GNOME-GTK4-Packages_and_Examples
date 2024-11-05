/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   16:45                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


type
  TGstAudioDownmixMeta = record
    meta: TGstMeta;
    from_position: PGstAudioChannelPosition;
    to_position: PGstAudioChannelPosition;
    from_channels: Tgint;
    to_channels: Tgint;
    matrix: ^Pgfloat;
  end;
  PGstAudioDownmixMeta = ^TGstAudioDownmixMeta;

function gst_audio_downmix_meta_api_get_type: TGType; cdecl; external libgstaudio;
function gst_audio_downmix_meta_get_info: PGstMetaInfo; cdecl; external libgstaudio;

function gst_buffer_get_audio_downmix_meta_for_channels(buffer: PGstBuffer; to_position: PGstAudioChannelPosition; to_channels: Tgint): PGstAudioDownmixMeta; cdecl; external libgstaudio;
function gst_buffer_add_audio_downmix_meta(buffer: PGstBuffer; from_position: PGstAudioChannelPosition; from_channels: Tgint; to_position: PGstAudioChannelPosition; to_channels: Tgint;
  matrix: PPgfloat): PGstAudioDownmixMeta; cdecl; external libgstaudio;

type
  TGstAudioClippingMeta = record
    meta: TGstMeta;
    format: TGstFormat;
    start: Tguint64;
    end_: Tguint64;
  end;
  PGstAudioClippingMeta = ^TGstAudioClippingMeta;

function gst_audio_clipping_meta_api_get_type: TGType; cdecl; external libgstaudio;
function gst_audio_clipping_meta_get_info: PGstMetaInfo; cdecl; external libgstaudio;

type
  TGstAudioMeta = record
    meta: TGstMeta;
    info: TGstAudioInfo;
    samples: Tgsize;
    offsets: Pgsize;
    priv_offsets_arr: array[0..7] of Tgsize;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAudioMeta = ^TGstAudioMeta;


function gst_audio_meta_api_get_type: TGType; cdecl; external libgstaudio;
function gst_audio_meta_get_info: PGstMetaInfo; cdecl; external libgstaudio;

function gst_buffer_add_audio_meta(buffer: PGstBuffer; info: PGstAudioInfo; samples: Tgsize; offsets: Pgsize): PGstAudioMeta; cdecl; external libgstaudio;

type
  PGstAudioLevelMeta = ^TGstAudioLevelMeta;

  TGstAudioLevelMeta = record
    meta: TGstMeta;
    level: Tguint8;
    voice_activity: Tgboolean;
  end;


function gst_audio_level_meta_api_get_type: TGType; cdecl; external libgstaudio;
function gst_audio_level_meta_get_info: PGstMetaInfo; cdecl; external libgstaudio;
function gst_buffer_add_audio_level_meta(buffer: PGstBuffer; level: Tguint8; voice_activity: Tgboolean): PGstAudioLevelMeta; cdecl; external libgstaudio;
function gst_buffer_get_audio_level_meta(buffer: PGstBuffer): PGstAudioLevelMeta; cdecl; external libgstaudio;
function gst_buffer_add_audio_clipping_meta(buffer: PGstBuffer; format: TGstFormat; start: Tguint64; end_: Tguint64): PGstAudioClippingMeta; cdecl; external libgstaudio;

function GST_AUDIO_DOWNMIX_META_INFO: PGstMetaInfo;
function gst_buffer_get_audio_downmix_meta(b: PGstBuffer): PGstAudioDownmixMeta;
function GST_AUDIO_CLIPPING_META_API_TYPE: TGType;
function GST_AUDIO_CLIPPING_META_INFO: PGstMetaInfo;

function gst_buffer_get_audio_clipping_meta(b: PGstBuffer): PGstAudioClippingMeta;
function GST_AUDIO_META_API_TYPE: TGType;
function GST_AUDIO_META_INFO: PGstMetaInfo;

function gst_buffer_get_audio_meta(b: PGstBuffer): PGstAudioMeta;
function GST_AUDIO_LEVEL_META_API_TYPE: TGType;
function GST_AUDIO_LEVEL_META_INFO: PGstMetaInfo;

// === Konventiert am: 28-9-24 16:57:16 ===

function GST_AUDIO_DOWNMIX_META_API_TYPE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_AUDIO_DOWNMIX_META_API_TYPE: TGType;
begin
  GST_AUDIO_DOWNMIX_META_API_TYPE := gst_audio_downmix_meta_api_get_type;
end;


function GST_AUDIO_DOWNMIX_META_INFO: PGstMetaInfo;
begin
  GST_AUDIO_DOWNMIX_META_INFO := gst_audio_downmix_meta_get_info;
end;

function gst_buffer_get_audio_downmix_meta(b: PGstBuffer): PGstAudioDownmixMeta;
begin
  gst_buffer_get_audio_downmix_meta := PGstAudioDownmixMeta(gst_buffer_get_meta(b, GST_AUDIO_DOWNMIX_META_API_TYPE));
end;

function GST_AUDIO_CLIPPING_META_API_TYPE: TGType;
begin
  GST_AUDIO_CLIPPING_META_API_TYPE := gst_audio_clipping_meta_api_get_type;
end;

function GST_AUDIO_CLIPPING_META_INFO: PGstMetaInfo;
begin
  GST_AUDIO_CLIPPING_META_INFO := gst_audio_clipping_meta_get_info;
end;

function gst_buffer_get_audio_clipping_meta(b: PGstBuffer
  ): PGstAudioClippingMeta;
begin
  gst_buffer_get_audio_clipping_meta := PGstAudioClippingMeta(gst_buffer_get_meta(b, GST_AUDIO_CLIPPING_META_API_TYPE));
end;

function GST_AUDIO_META_API_TYPE: TGType;
begin
  GST_AUDIO_META_API_TYPE := gst_audio_meta_api_get_type;
end;

function GST_AUDIO_META_INFO: PGstMetaInfo;
begin
  GST_AUDIO_META_INFO := gst_audio_meta_get_info;
end;

function gst_buffer_get_audio_meta(b: PGstBuffer): PGstAudioMeta;
begin
  gst_buffer_get_audio_meta := PGstAudioMeta(gst_buffer_get_meta(b, GST_AUDIO_META_API_TYPE));
end;

function GST_AUDIO_LEVEL_META_API_TYPE: TGType;
begin
  GST_AUDIO_LEVEL_META_API_TYPE := gst_audio_level_meta_api_get_type;
end;

function GST_AUDIO_LEVEL_META_INFO: PGstMetaInfo;
begin
  GST_AUDIO_LEVEL_META_INFO := gst_audio_level_meta_get_info;
end;


{$ENDIF read_implementation}
