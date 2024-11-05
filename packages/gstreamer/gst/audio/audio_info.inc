/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   16:45                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstAudioFlags = ^TGstAudioFlags;
  TGstAudioFlags = longint;

const
  GST_AUDIO_FLAG_NONE = 0;
  GST_AUDIO_FLAG_UNPOSITIONED = 1 shl 0;

type
  TGstAudioInfo = record
    finfo: PGstAudioFormatInfo;
    flags: TGstAudioFlags;
    layout: TGstAudioLayout;
    rate: Tgint;
    channels: Tgint;
    bpf: Tgint;
    position: array[0..63] of TGstAudioChannelPosition;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAudioInfo = ^TGstAudioInfo;

function gst_audio_info_get_type: TGType; cdecl; external libgstaudio;
function gst_audio_info_new: PGstAudioInfo; cdecl; external libgstaudio;
function gst_audio_info_new_from_caps(caps: PGstCaps): PGstAudioInfo; cdecl; external libgstaudio;
procedure gst_audio_info_init(info: PGstAudioInfo); cdecl; external libgstaudio;
function gst_audio_info_copy(info: PGstAudioInfo): PGstAudioInfo; cdecl; external libgstaudio;
procedure gst_audio_info_free(info: PGstAudioInfo); cdecl; external libgstaudio;
procedure gst_audio_info_set_format(info: PGstAudioInfo; format: TGstAudioFormat; rate: Tgint; channels: Tgint; position: PGstAudioChannelPosition); cdecl; external libgstaudio;
function gst_audio_info_from_caps(info: PGstAudioInfo; caps: PGstCaps): Tgboolean; cdecl; external libgstaudio;
function gst_audio_info_to_caps(info: PGstAudioInfo): PGstCaps; cdecl; external libgstaudio;
function gst_audio_info_convert(info: PGstAudioInfo; src_fmt: TGstFormat; src_val: Tgint64; dest_fmt: TGstFormat; dest_val: Pgint64): Tgboolean; cdecl; external libgstaudio;
function gst_audio_info_is_equal(info: PGstAudioInfo; other: PGstAudioInfo): Tgboolean; cdecl; external libgstaudio;

function GST_TYPE_AUDIO_INFO: TGType;
function GST_AUDIO_INFO_IS_VALID(i: PGstAudioInfo): Tgboolean;
function GST_AUDIO_INFO_FORMAT(i: PGstAudioInfo): TGstAudioFormat;
function GST_AUDIO_INFO_NAME(i: PGstAudioInfo): Pgchar;
function GST_AUDIO_INFO_WIDTH(i: PGstAudioInfo): Tgint;
function GST_AUDIO_INFO_DEPTH(i: PGstAudioInfo): Tgint;
function GST_AUDIO_INFO_BPS(info: PGstAudioInfo): Tgint;
function GST_AUDIO_INFO_IS_INTEGER(i: PGstAudioInfo): Tgboolean;
function GST_AUDIO_INFO_IS_FLOAT(i: PGstAudioInfo): Tgboolean;
function GST_AUDIO_INFO_IS_SIGNED(i: PGstAudioInfo): Tgboolean;
function GST_AUDIO_INFO_ENDIANNESS(i: PGstAudioInfo): Tgint;
function GST_AUDIO_INFO_IS_LITTLE_ENDIAN(i: PGstAudioInfo): Tgboolean;
function GST_AUDIO_INFO_IS_BIG_ENDIAN(i: PGstAudioInfo): Tgboolean;
function GST_AUDIO_INFO_FLAGS(info: PGstAudioInfo): TGstAudioFlags;
function GST_AUDIO_INFO_IS_UNPOSITIONED(info: PGstAudioInfo): Tgboolean;
function GST_AUDIO_INFO_LAYOUT(info: PGstAudioInfo): TGstAudioLayout;
function GST_AUDIO_INFO_RATE(info: PGstAudioInfo): Tgint;
function GST_AUDIO_INFO_CHANNELS(info: PGstAudioInfo): Tgint;
function GST_AUDIO_INFO_BPF(info: PGstAudioInfo): Tgint;
function GST_AUDIO_INFO_POSITION(info: PGstAudioInfo; c: integer): TGstAudioChannelPosition;


// === Konventiert am: 27-9-24 16:40:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_TYPE_AUDIO_INFO: TGType;
begin
  GST_TYPE_AUDIO_INFO := gst_audio_info_get_type;
end;

function GST_AUDIO_INFO_IS_VALID(i: PGstAudioInfo): Tgboolean;
begin
  Result := (i^.finfo <> nil) and (i^.rate > 0) and (i^.channels > 0) and (i^.bpf > 0);
end;

function GST_AUDIO_INFO_FORMAT(i: PGstAudioInfo): TGstAudioFormat;
begin
  GST_AUDIO_INFO_FORMAT := GST_AUDIO_FORMAT_INFO_FORMAT(i^.finfo);
end;

function GST_AUDIO_INFO_NAME(i: PGstAudioInfo): Pgchar;
begin
  GST_AUDIO_INFO_NAME := GST_AUDIO_FORMAT_INFO_NAME(i^.finfo);
end;

function GST_AUDIO_INFO_WIDTH(i: PGstAudioInfo): Tgint;
begin
  GST_AUDIO_INFO_WIDTH := GST_AUDIO_FORMAT_INFO_WIDTH(i^.finfo);
end;

function GST_AUDIO_INFO_DEPTH(i: PGstAudioInfo): Tgint;
begin
  GST_AUDIO_INFO_DEPTH := GST_AUDIO_FORMAT_INFO_DEPTH(i^.finfo);
end;

function GST_AUDIO_INFO_BPS(info: PGstAudioInfo): Tgint;
begin
  GST_AUDIO_INFO_BPS := (GST_AUDIO_INFO_DEPTH(info)) shr 3;
end;

function GST_AUDIO_INFO_IS_INTEGER(i: PGstAudioInfo): Tgboolean;
begin
  GST_AUDIO_INFO_IS_INTEGER := GST_AUDIO_FORMAT_INFO_IS_INTEGER(i^.finfo);
end;

function GST_AUDIO_INFO_IS_FLOAT(i: PGstAudioInfo): Tgboolean;
begin
  GST_AUDIO_INFO_IS_FLOAT := GST_AUDIO_FORMAT_INFO_IS_FLOAT(i^.finfo);
end;

function GST_AUDIO_INFO_IS_SIGNED(i: PGstAudioInfo): Tgboolean;
begin
  GST_AUDIO_INFO_IS_SIGNED := GST_AUDIO_FORMAT_INFO_IS_SIGNED(i^.finfo);
end;

function GST_AUDIO_INFO_ENDIANNESS(i: PGstAudioInfo): Tgint;
begin
  GST_AUDIO_INFO_ENDIANNESS := GST_AUDIO_FORMAT_INFO_ENDIANNESS(i^.finfo);
end;

function GST_AUDIO_INFO_IS_LITTLE_ENDIAN(i: PGstAudioInfo): Tgboolean;
begin
  GST_AUDIO_INFO_IS_LITTLE_ENDIAN := GST_AUDIO_FORMAT_INFO_IS_LITTLE_ENDIAN(i^.finfo);
end;

function GST_AUDIO_INFO_IS_BIG_ENDIAN(i: PGstAudioInfo): Tgboolean;
begin
  GST_AUDIO_INFO_IS_BIG_ENDIAN := GST_AUDIO_FORMAT_INFO_IS_BIG_ENDIAN(i^.finfo);
end;

function GST_AUDIO_INFO_FLAGS(info: PGstAudioInfo): TGstAudioFlags;
begin
  GST_AUDIO_INFO_FLAGS := info^.flags;
end;

function GST_AUDIO_INFO_IS_UNPOSITIONED(info: PGstAudioInfo): Tgboolean;
begin
  GST_AUDIO_INFO_IS_UNPOSITIONED := ((info^.flags) and GST_AUDIO_FLAG_UNPOSITIONED) <> 0;
end;

function GST_AUDIO_INFO_LAYOUT(info: PGstAudioInfo): TGstAudioLayout;
begin
  GST_AUDIO_INFO_LAYOUT := info^.layout;
end;

function GST_AUDIO_INFO_RATE(info: PGstAudioInfo): Tgint;
begin
  GST_AUDIO_INFO_RATE := info^.rate;
end;

function GST_AUDIO_INFO_CHANNELS(info: PGstAudioInfo): Tgint;
begin
  GST_AUDIO_INFO_CHANNELS := info^.channels;
end;

function GST_AUDIO_INFO_BPF(info: PGstAudioInfo): Tgint;
begin
  GST_AUDIO_INFO_BPF := info^.bpf;
end;

function GST_AUDIO_INFO_POSITION(info: PGstAudioInfo; c: integer): TGstAudioChannelPosition;
begin
  GST_AUDIO_INFO_POSITION := info^.position[c];
end;


{$ENDIF read_implementation}
