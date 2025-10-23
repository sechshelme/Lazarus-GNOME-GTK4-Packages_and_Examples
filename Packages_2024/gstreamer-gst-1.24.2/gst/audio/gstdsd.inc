
{$IFDEF read_interface}

const
  GST_DSD_SILENCE_PATTERN_BYTE = $69;

type
  TGstDsdInfo = record
    format: TGstDsdFormat;
    rate: Tgint;
    channels: Tgint;
    layout: TGstAudioLayout;
    reversed_bytes: Tgboolean;
    positions: array[0..63] of TGstAudioChannelPosition;
    flags: TGstAudioFlags;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstDsdInfo = ^TGstDsdInfo;

function gst_dsd_info_get_type: TGType; cdecl; external libgstaudio;

const
  GST_META_TAG_DSD_PLANE_OFFSETS_STR = 'dsdplaneoffsets';

type
  PGstDsdPlaneOffsetMeta = ^TGstDsdPlaneOffsetMeta;

  TGstDsdPlaneOffsetMeta = record
    meta: TGstMeta;
    num_channels: Tgint;
    num_bytes_per_channel: Tgsize;
    offsets: Pgsize;
    priv_offsets_arr: array[0..7] of Tgsize;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;


function gst_dsd_plane_offset_meta_api_get_type: TGType; cdecl; external libgstaudio;
function gst_dsd_plane_offset_meta_get_info: PGstMetaInfo; cdecl; external libgstaudio;

function gst_buffer_add_dsd_plane_offset_meta(buffer: PGstBuffer; num_channels: Tgint; num_bytes_per_channel: Tgsize; offsets: Pgsize): PGstDsdPlaneOffsetMeta; cdecl; external libgstaudio;
function gst_dsd_info_new: PGstDsdInfo; cdecl; external libgstaudio;
function gst_dsd_info_new_from_caps(caps: PGstCaps): PGstDsdInfo; cdecl; external libgstaudio;
procedure gst_dsd_info_init(info: PGstDsdInfo); cdecl; external libgstaudio;
procedure gst_dsd_info_set_format(info: PGstDsdInfo; format: TGstDsdFormat; rate: Tgint; channels: Tgint; positions: PGstAudioChannelPosition); cdecl; external libgstaudio;
function gst_dsd_info_copy(info: PGstDsdInfo): PGstDsdInfo; cdecl; external libgstaudio;
procedure gst_dsd_info_free(info: PGstDsdInfo); cdecl; external libgstaudio;
function gst_dsd_info_from_caps(info: PGstDsdInfo; caps: PGstCaps): Tgboolean; cdecl; external libgstaudio;
function gst_dsd_info_to_caps(info: PGstDsdInfo): PGstCaps; cdecl; external libgstaudio;
function gst_dsd_info_is_equal(info: PGstDsdInfo; other: PGstDsdInfo): Tgboolean; cdecl; external libgstaudio;
procedure gst_dsd_convert(input_data: Pguint8; output_data: Pguint8; input_format: TGstDsdFormat; output_format: TGstDsdFormat; input_layout: TGstAudioLayout;
  output_layout: TGstAudioLayout; input_plane_offsets: Pgsize; output_plane_offsets: Pgsize; num_dsd_bytes: Tgsize; num_channels: Tgint;
  reverse_byte_bits: Tgboolean); cdecl; external libgstaudio;

function gst_dsd_format_is_le(format: TGstDsdFormat): Tgboolean;

function GST_DSD_MAKE_DSD_RATE_44x(multiplier: Tguint64): Tguint64;
function GST_DSD_MAKE_DSD_RATE_48x(multiplier: Tguint64): Tguint64;

function GST_TYPE_DSD_INFO: TGType;

function GST_DSD_INFO_IS_VALID(i: PGstDsdInfo): Tgboolean;
function GST_DSD_INFO_FORMAT(info: PGstDsdInfo): TGstDsdFormat;
function GST_DSD_INFO_RATE(info: PGstDsdInfo): Tgint;
function GST_DSD_INFO_CHANNELS(info: PGstDsdInfo): Tgint;
function GST_DSD_INFO_LAYOUT(info: PGstDsdInfo): TGstAudioLayout;
function GST_DSD_INFO_REVERSED_BYTES(info: PGstDsdInfo): Tgboolean;
function GST_DSD_INFO_POSITION(info: PGstDsdInfo; c: longint): TGstAudioChannelPosition;
function GST_DSD_INFO_STRIDE(info: PGstDsdInfo): longint;
function GST_DSD_PLANE_OFFSET_META_API_TYPE: TGType;
function GST_DSD_PLANE_OFFSET_META_INFO: PGstMetaInfo;

function gst_buffer_get_dsd_plane_offset_meta(b: PGstBuffer): PGstDsdPlaneOffsetMeta;


// === Konventiert am: 28-9-24 16:57:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{
static inline gboolean
gst_dsd_format_is_le (GstDsdFormat format)
  switch (format)
    case GST_DSD_FORMAT_U16LE:
    case GST_DSD_FORMAT_U32LE:
      return TRUE;
    default:
      return FALSE;
 }
function gst_dsd_format_is_le(format: TGstDsdFormat): Tgboolean;
begin
  case format of
    GST_DSD_FORMAT_U16LE, GST_DSD_FORMAT_U32LE: begin
      Exit(gTrue);
    end;
    else begin
      Exit(gFalse);
    end;
  end;
end;

function GST_DSD_MAKE_DSD_RATE_44x(multiplier: Tguint64): Tguint64;
begin
  GST_DSD_MAKE_DSD_RATE_44x := ((Tgint(Tgint64(multiplier))) * 44100) div 8;
end;

function GST_DSD_MAKE_DSD_RATE_48x(multiplier: Tguint64): Tguint64;
begin
  GST_DSD_MAKE_DSD_RATE_48x := ((Tgint(Tgint64(multiplier))) * 48000) div 8;
end;

function GST_TYPE_DSD_INFO: TGType;
begin
  GST_TYPE_DSD_INFO := gst_dsd_info_get_type;
end;

function GST_DSD_INFO_IS_VALID(i: PGstDsdInfo): Tgboolean;
begin
  Result := (i^.format < GST_NUM_DSD_FORMATS) and (i^.rate > 0) and (i^.channels > 0);
end;

function GST_DSD_INFO_FORMAT(info: PGstDsdInfo): TGstDsdFormat;
begin
  GST_DSD_INFO_FORMAT := info^.format;
end;

function GST_DSD_INFO_RATE(info: PGstDsdInfo): Tgint;
begin
  GST_DSD_INFO_RATE := info^.rate;
end;

function GST_DSD_INFO_CHANNELS(info: PGstDsdInfo): Tgint;
begin
  GST_DSD_INFO_CHANNELS := info^.channels;
end;

function GST_DSD_INFO_LAYOUT(info: PGstDsdInfo): TGstAudioLayout;
begin
  GST_DSD_INFO_LAYOUT := info^.layout;
end;

function GST_DSD_INFO_REVERSED_BYTES(info: PGstDsdInfo): Tgboolean;
begin
  GST_DSD_INFO_REVERSED_BYTES := info^.reversed_bytes;
end;

function GST_DSD_INFO_POSITION(info: PGstDsdInfo; c: longint): TGstAudioChannelPosition;
begin
  GST_DSD_INFO_POSITION := info^.positions[c];
end;

function GST_DSD_INFO_STRIDE(info: PGstDsdInfo): longint;
begin
  GST_DSD_INFO_STRIDE := (gst_dsd_format_get_width(info^.format)) * (info^.channels);
end;

function GST_DSD_PLANE_OFFSET_META_API_TYPE: TGType;
begin
  GST_DSD_PLANE_OFFSET_META_API_TYPE := gst_dsd_plane_offset_meta_api_get_type;
end;

function GST_DSD_PLANE_OFFSET_META_INFO: PGstMetaInfo;
begin
  GST_DSD_PLANE_OFFSET_META_INFO := gst_dsd_plane_offset_meta_get_info;
end;

function gst_buffer_get_dsd_plane_offset_meta(b: PGstBuffer): PGstDsdPlaneOffsetMeta;
begin
  gst_buffer_get_dsd_plane_offset_meta := PGstDsdPlaneOffsetMeta(gst_buffer_get_meta(b, GST_DSD_PLANE_OFFSET_META_API_TYPE));
end;


{$ENDIF read_implementation}
