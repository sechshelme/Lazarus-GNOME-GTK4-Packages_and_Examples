/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   16:45                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstAudioFormat = ^TGstAudioFormat;
  TGstAudioFormat = longint;

const
  GST_AUDIO_FORMAT_UNKNOWN = 0;
  GST_AUDIO_FORMAT_ENCODED = 1;
  GST_AUDIO_FORMAT_S8 = 2;
  GST_AUDIO_FORMAT_U8 = 3;
  GST_AUDIO_FORMAT_S16LE = 4;
  GST_AUDIO_FORMAT_S16BE = 5;
  GST_AUDIO_FORMAT_U16LE = 6;
  GST_AUDIO_FORMAT_U16BE = 7;
  GST_AUDIO_FORMAT_S24_32LE = 8;
  GST_AUDIO_FORMAT_S24_32BE = 9;
  GST_AUDIO_FORMAT_U24_32LE = 10;
  GST_AUDIO_FORMAT_U24_32BE = 11;
  GST_AUDIO_FORMAT_S32LE = 12;
  GST_AUDIO_FORMAT_S32BE = 13;
  GST_AUDIO_FORMAT_U32LE = 14;
  GST_AUDIO_FORMAT_U32BE = 15;
  GST_AUDIO_FORMAT_S24LE = 16;
  GST_AUDIO_FORMAT_S24BE = 17;
  GST_AUDIO_FORMAT_U24LE = 18;
  GST_AUDIO_FORMAT_U24BE = 19;
  GST_AUDIO_FORMAT_S20LE = 20;
  GST_AUDIO_FORMAT_S20BE = 21;
  GST_AUDIO_FORMAT_U20LE = 22;
  GST_AUDIO_FORMAT_U20BE = 23;
  GST_AUDIO_FORMAT_S18LE = 24;
  GST_AUDIO_FORMAT_S18BE = 25;
  GST_AUDIO_FORMAT_U18LE = 26;
  GST_AUDIO_FORMAT_U18BE = 27;
  GST_AUDIO_FORMAT_F32LE = 28;
  GST_AUDIO_FORMAT_F32BE = 29;
  GST_AUDIO_FORMAT_F64LE = 30;
  GST_AUDIO_FORMAT_F64BE = 31;
  GST_AUDIO_FORMAT_S16 = GST_AUDIO_FORMAT_S16LE;
  GST_AUDIO_FORMAT_U16 = GST_AUDIO_FORMAT_U16LE;
  GST_AUDIO_FORMAT_S24_32 = GST_AUDIO_FORMAT_S24_32LE;
  GST_AUDIO_FORMAT_U24_32 = GST_AUDIO_FORMAT_U24_32LE;
  GST_AUDIO_FORMAT_S32 = GST_AUDIO_FORMAT_S32LE;
  GST_AUDIO_FORMAT_U32 = GST_AUDIO_FORMAT_U32LE;
  GST_AUDIO_FORMAT_S24 = GST_AUDIO_FORMAT_S24LE;
  GST_AUDIO_FORMAT_U24 = GST_AUDIO_FORMAT_U24LE;
  GST_AUDIO_FORMAT_S20 = GST_AUDIO_FORMAT_S20LE;
  GST_AUDIO_FORMAT_U20 = GST_AUDIO_FORMAT_U20LE;
  GST_AUDIO_FORMAT_S18 = GST_AUDIO_FORMAT_S18LE;
  GST_AUDIO_FORMAT_U18 = GST_AUDIO_FORMAT_U18LE;
  GST_AUDIO_FORMAT_F32 = GST_AUDIO_FORMAT_F32LE;
  GST_AUDIO_FORMAT_F64 = GST_AUDIO_FORMAT_F64LE;

type
  PGstAudioFormatFlags = ^TGstAudioFormatFlags;
  TGstAudioFormatFlags = longint;

const
  GST_AUDIO_FORMAT_FLAG_INTEGER = 1 shl 0;
  GST_AUDIO_FORMAT_FLAG_FLOAT = 1 shl 1;
  GST_AUDIO_FORMAT_FLAG_SIGNED = 1 shl 2;
  GST_AUDIO_FORMAT_FLAG_COMPLEX = 1 shl 4;
  GST_AUDIO_FORMAT_FLAG_UNPACK = 1 shl 5;

type
  PGstAudioPackFlags = ^TGstAudioPackFlags;
  TGstAudioPackFlags = longint;

const
  GST_AUDIO_PACK_FLAG_NONE = 0;
  GST_AUDIO_PACK_FLAG_TRUNCATE_RANGE = 1 shl 0;

type
  PGstAudioFormatInfo = ^TGstAudioFormatInfo;

  TGstAudioFormatUnpack = procedure(info: PGstAudioFormatInfo; flags: TGstAudioPackFlags; dest: Tgpointer; Data: Tgconstpointer; length: Tgint); cdecl;
  TGstAudioFormatPack = procedure(info: PGstAudioFormatInfo; flags: TGstAudioPackFlags; src: Tgconstpointer; Data: Tgpointer; length: Tgint); cdecl;

  TGstAudioFormatInfo = record
    format: TGstAudioFormat;
    Name: Pgchar;
    description: Pgchar;
    flags: TGstAudioFormatFlags;
    endianness: Tgint;
    Width: Tgint;
    depth: Tgint;
    silence: array[0..7] of Tguint8;
    unpack_format: TGstAudioFormat;
    unpack_func: TGstAudioFormatUnpack;
    pack_func: TGstAudioFormatPack;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

function gst_audio_format_info_get_type: TGType; cdecl; external libgstaudio;

function gst_audio_format_build_integer(sign: Tgboolean; endianness: Tgint; Width: Tgint; depth: Tgint): TGstAudioFormat; cdecl; external libgstaudio;
function gst_audio_format_from_string(format: Pgchar): TGstAudioFormat; cdecl; external libgstaudio;
function gst_audio_format_to_string(format: TGstAudioFormat): Pgchar; cdecl; external libgstaudio;
function gst_audio_format_get_info(format: TGstAudioFormat): PGstAudioFormatInfo; cdecl; external libgstaudio;
procedure gst_audio_format_info_fill_silence(info: PGstAudioFormatInfo; dest: Tgpointer; length: Tgsize); cdecl; external libgstaudio;
procedure gst_audio_format_fill_silence(info: PGstAudioFormatInfo; dest: Tgpointer; length: Tgsize); cdecl; external libgstaudio;

const
  GST_AUDIO_RATE_RANGE = '(int) [ 1, max ]';
  GST_AUDIO_CHANNELS_RANGE = '(int) [ 1, max ]';

function gst_audio_formats_raw(len: Pguint): PGstAudioFormat; cdecl; external libgstaudio;

const
  GST_AUDIO_DEF_RATE = 44100;
  GST_AUDIO_DEF_CHANNELS = 2;
  GST_AUDIO_DEF_FORMAT = 'S16LE';

type
  PGstAudioLayout = ^TGstAudioLayout;
  TGstAudioLayout = longint;

const
  GST_AUDIO_LAYOUT_INTERLEAVED = 0;
  GST_AUDIO_LAYOUT_NON_INTERLEAVED = 1;

function gst_audio_make_raw_caps(formats: PGstAudioFormat; len: Tguint; layout: TGstAudioLayout): PGstCaps; cdecl; external libgstaudio;

function GST_AUDIO_FORMAT_INFO_IS_VALID_RAW(info: PGstAudioFormatInfo): Tgboolean;
function GST_AUDIO_FORMAT_INFO_FORMAT(info: PGstAudioFormatInfo): TGstAudioFormat;
function GST_AUDIO_FORMAT_INFO_NAME(info: PGstAudioFormatInfo): Pgchar;
function GST_AUDIO_FORMAT_INFO_FLAGS(info: PGstAudioFormatInfo): TGstAudioFormatFlags;
function GST_AUDIO_FORMAT_INFO_IS_INTEGER(info: PGstAudioFormatInfo): Tgboolean;
function GST_AUDIO_FORMAT_INFO_IS_FLOAT(info: PGstAudioFormatInfo): Tgboolean;
function GST_AUDIO_FORMAT_INFO_IS_SIGNED(info: PGstAudioFormatInfo): Tgboolean;
function GST_AUDIO_FORMAT_INFO_ENDIANNESS(info: PGstAudioFormatInfo): Tgint;
function GST_AUDIO_FORMAT_INFO_IS_LITTLE_ENDIAN(info: PGstAudioFormatInfo): Tgboolean;
function GST_AUDIO_FORMAT_INFO_IS_BIG_ENDIAN(info: PGstAudioFormatInfo): Tgboolean;
function GST_AUDIO_FORMAT_INFO_WIDTH(info: PGstAudioFormatInfo): Tgint;
function GST_AUDIO_FORMAT_INFO_DEPTH(info: PGstAudioFormatInfo): Tgint;

// === Konventiert am: 27-9-24 17:00:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_AUDIO_FORMAT_INFO_IS_VALID_RAW(info: PGstAudioFormatInfo): Tgboolean;
begin
  Result := (info <> nil) and (info^.format > GST_AUDIO_FORMAT_ENCODED) and (info^.Width > 0) and (info^.depth > 0);
end;

function GST_AUDIO_FORMAT_INFO_FORMAT(info: PGstAudioFormatInfo): TGstAudioFormat;
begin
  GST_AUDIO_FORMAT_INFO_FORMAT := info^.format;
end;

function GST_AUDIO_FORMAT_INFO_NAME(info: PGstAudioFormatInfo): Pgchar;
begin
  GST_AUDIO_FORMAT_INFO_NAME := info^.Name;
end;

function GST_AUDIO_FORMAT_INFO_FLAGS(info: PGstAudioFormatInfo
  ): TGstAudioFormatFlags;
begin
  GST_AUDIO_FORMAT_INFO_FLAGS := info^.flags;
end;

function GST_AUDIO_FORMAT_INFO_IS_INTEGER(info: PGstAudioFormatInfo): Tgboolean;
begin
  Result := info^.flags and GST_AUDIO_FORMAT_FLAG_INTEGER <> 0;
end;

function GST_AUDIO_FORMAT_INFO_IS_FLOAT(info: PGstAudioFormatInfo): Tgboolean;
begin
  Result := info^.flags and GST_AUDIO_FORMAT_FLAG_FLOAT <> 0;
end;

function GST_AUDIO_FORMAT_INFO_IS_SIGNED(info: PGstAudioFormatInfo): Tgboolean;
begin
  Result := info^.flags and GST_AUDIO_FORMAT_FLAG_SIGNED <> 0;
end;

function GST_AUDIO_FORMAT_INFO_ENDIANNESS(info: PGstAudioFormatInfo): Tgint;
begin
  GST_AUDIO_FORMAT_INFO_ENDIANNESS := info^.endianness;
end;

function GST_AUDIO_FORMAT_INFO_IS_LITTLE_ENDIAN(info: PGstAudioFormatInfo): Tgboolean;
begin
  GST_AUDIO_FORMAT_INFO_IS_LITTLE_ENDIAN := (info^.endianness) = G_LITTLE_ENDIAN;
end;

function GST_AUDIO_FORMAT_INFO_IS_BIG_ENDIAN(info: PGstAudioFormatInfo): Tgboolean;
begin
  GST_AUDIO_FORMAT_INFO_IS_BIG_ENDIAN := (info^.endianness) = G_BIG_ENDIAN;
end;

function GST_AUDIO_FORMAT_INFO_WIDTH(info: PGstAudioFormatInfo): Tgint;
begin
  GST_AUDIO_FORMAT_INFO_WIDTH := info^.Width;
end;

function GST_AUDIO_FORMAT_INFO_DEPTH(info: PGstAudioFormatInfo): Tgint;
begin
  GST_AUDIO_FORMAT_INFO_DEPTH := info^.depth;
end;


{$ENDIF read_implementation}
