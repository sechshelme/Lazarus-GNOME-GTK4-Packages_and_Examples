unit fp_soundio;

interface

const
  {$IFDEF Linux}
  libsoundio = 'soundio';
  {$ENDIF}

  {$IFDEF Windows}
  libsoundio = 'libsoundio-2.dll'; 
  {$ENDIF}


{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  TSoundIoError = longint;

const
  SoundIoErrorNone = 0;
  SoundIoErrorNoMem = 1;
  SoundIoErrorInitAudioBackend = 2;
  SoundIoErrorSystemResources = 3;
  SoundIoErrorOpeningDevice = 4;
  SoundIoErrorNoSuchDevice = 5;
  SoundIoErrorInvalid = 6;
  SoundIoErrorBackendUnavailable = 7;
  SoundIoErrorStreaming = 8;
  SoundIoErrorIncompatibleDevice = 9;
  SoundIoErrorNoSuchClient = 10;
  SoundIoErrorIncompatibleBackend = 11;
  SoundIoErrorBackendDisconnected = 12;
  SoundIoErrorInterrupted = 13;
  SoundIoErrorUnderflow = 14;
  SoundIoErrorEncodingString = 15;

type
  TSoundIoChannelId = longint;

const
  SoundIoChannelIdInvalid = 0;
  SoundIoChannelIdFrontLeft = 1;
  SoundIoChannelIdFrontRight = 2;
  SoundIoChannelIdFrontCenter = 3;
  SoundIoChannelIdLfe = 4;
  SoundIoChannelIdBackLeft = 5;
  SoundIoChannelIdBackRight = 6;
  SoundIoChannelIdFrontLeftCenter = 7;
  SoundIoChannelIdFrontRightCenter = 8;
  SoundIoChannelIdBackCenter = 9;
  SoundIoChannelIdSideLeft = 10;
  SoundIoChannelIdSideRight = 11;
  SoundIoChannelIdTopCenter = 12;
  SoundIoChannelIdTopFrontLeft = 13;
  SoundIoChannelIdTopFrontCenter = 14;
  SoundIoChannelIdTopFrontRight = 15;
  SoundIoChannelIdTopBackLeft = 16;
  SoundIoChannelIdTopBackCenter = 17;
  SoundIoChannelIdTopBackRight = 18;
  SoundIoChannelIdBackLeftCenter = 19;
  SoundIoChannelIdBackRightCenter = 20;
  SoundIoChannelIdFrontLeftWide = 21;
  SoundIoChannelIdFrontRightWide = 22;
  SoundIoChannelIdFrontLeftHigh = 23;
  SoundIoChannelIdFrontCenterHigh = 24;
  SoundIoChannelIdFrontRightHigh = 25;
  SoundIoChannelIdTopFrontLeftCenter = 26;
  SoundIoChannelIdTopFrontRightCenter = 27;
  SoundIoChannelIdTopSideLeft = 28;
  SoundIoChannelIdTopSideRight = 29;
  SoundIoChannelIdLeftLfe = 30;
  SoundIoChannelIdRightLfe = 31;
  SoundIoChannelIdLfe2 = 32;
  SoundIoChannelIdBottomCenter = 33;
  SoundIoChannelIdBottomLeftCenter = 34;
  SoundIoChannelIdBottomRightCenter = 35;
  SoundIoChannelIdMsMid = 36;
  SoundIoChannelIdMsSide = 37;
  SoundIoChannelIdAmbisonicW = 38;
  SoundIoChannelIdAmbisonicX = 39;
  SoundIoChannelIdAmbisonicY = 40;
  SoundIoChannelIdAmbisonicZ = 41;
  SoundIoChannelIdXyX = 42;
  SoundIoChannelIdXyY = 43;
  SoundIoChannelIdHeadphonesLeft = 44;
  SoundIoChannelIdHeadphonesRight = 45;
  SoundIoChannelIdClickTrack = 46;
  SoundIoChannelIdForeignLanguage = 47;
  SoundIoChannelIdHearingImpaired = 48;
  SoundIoChannelIdNarration = 49;
  SoundIoChannelIdHaptic = 50;
  SoundIoChannelIdDialogCentricMix = 51;
  SoundIoChannelIdAux = 52;
  SoundIoChannelIdAux0 = 53;
  SoundIoChannelIdAux1 = 54;
  SoundIoChannelIdAux2 = 55;
  SoundIoChannelIdAux3 = 56;
  SoundIoChannelIdAux4 = 57;
  SoundIoChannelIdAux5 = 58;
  SoundIoChannelIdAux6 = 59;
  SoundIoChannelIdAux7 = 60;
  SoundIoChannelIdAux8 = 61;
  SoundIoChannelIdAux9 = 62;
  SoundIoChannelIdAux10 = 63;
  SoundIoChannelIdAux11 = 64;
  SoundIoChannelIdAux12 = 65;
  SoundIoChannelIdAux13 = 66;
  SoundIoChannelIdAux14 = 67;
  SoundIoChannelIdAux15 = 68;

type
  TSoundIoChannelLayoutId = longint;

const
  SoundIoChannelLayoutIdMono = 0;
  SoundIoChannelLayoutIdStereo = 1;
  SoundIoChannelLayoutId2Point1 = 2;
  SoundIoChannelLayoutId3Point0 = 3;
  SoundIoChannelLayoutId3Point0Back = 4;
  SoundIoChannelLayoutId3Point1 = 5;
  SoundIoChannelLayoutId4Point0 = 6;
  SoundIoChannelLayoutIdQuad = 7;
  SoundIoChannelLayoutIdQuadSide = 8;
  SoundIoChannelLayoutId4Point1 = 9;
  SoundIoChannelLayoutId5Point0Back = 10;
  SoundIoChannelLayoutId5Point0Side = 11;
  SoundIoChannelLayoutId5Point1 = 12;
  SoundIoChannelLayoutId5Point1Back = 13;
  SoundIoChannelLayoutId6Point0Side = 14;
  SoundIoChannelLayoutId6Point0Front = 15;
  SoundIoChannelLayoutIdHexagonal = 16;
  SoundIoChannelLayoutId6Point1 = 17;
  SoundIoChannelLayoutId6Point1Back = 18;
  SoundIoChannelLayoutId6Point1Front = 19;
  SoundIoChannelLayoutId7Point0 = 20;
  SoundIoChannelLayoutId7Point0Front = 21;
  SoundIoChannelLayoutId7Point1 = 22;
  SoundIoChannelLayoutId7Point1Wide = 23;
  SoundIoChannelLayoutId7Point1WideBack = 24;
  SoundIoChannelLayoutIdOctagonal = 25;

type
  TSoundIoBackend = longint;

const
  SoundIoBackendNone = 0;
  SoundIoBackendJack = 1;
  SoundIoBackendPulseAudio = 2;
  SoundIoBackendAlsa = 3;
  SoundIoBackendCoreAudio = 4;
  SoundIoBackendWasapi = 5;
  SoundIoBackendDummy = 6;

type
  TSoundIoDeviceAim = longint;

const
  SoundIoDeviceAimInput = 0;
  SoundIoDeviceAimOutput = 1;

type
  TSoundIoFormat = longint;
  PSoundIoFormat = ^TSoundIoFormat;

const
  SoundIoFormatInvalid = 0;
  SoundIoFormatS8 = 1;
  SoundIoFormatU8 = 2;
  SoundIoFormatS16LE = 3;
  SoundIoFormatS16BE = 4;
  SoundIoFormatU16LE = 5;
  SoundIoFormatU16BE = 6;
  SoundIoFormatS24LE = 7;
  SoundIoFormatS24BE = 8;
  SoundIoFormatU24LE = 9;
  SoundIoFormatU24BE = 10;
  SoundIoFormatS32LE = 11;
  SoundIoFormatS32BE = 12;
  SoundIoFormatU32LE = 13;
  SoundIoFormatU32BE = 14;
  SoundIoFormatFloat32LE = 15;
  SoundIoFormatFloat32BE = 16;
  SoundIoFormatFloat64LE = 17;
  SoundIoFormatFloat64BE = 18;

const
  SoundIoFormatS16NE = SoundIoFormatS16LE;
  SoundIoFormatU16NE = SoundIoFormatU16LE;
  SoundIoFormatS24NE = SoundIoFormatS24LE;
  SoundIoFormatU24NE = SoundIoFormatU24LE;
  SoundIoFormatS32NE = SoundIoFormatS32LE;
  SoundIoFormatU32NE = SoundIoFormatU32LE;
  SoundIoFormatFloat32NE = SoundIoFormatFloat32LE;
  SoundIoFormatFloat64NE = SoundIoFormatFloat64LE;
  SoundIoFormatS16FE = SoundIoFormatS16BE;
  SoundIoFormatU16FE = SoundIoFormatU16BE;
  SoundIoFormatS24FE = SoundIoFormatS24BE;
  SoundIoFormatU24FE = SoundIoFormatU24BE;
  SoundIoFormatS32FE = SoundIoFormatS32BE;
  SoundIoFormatU32FE = SoundIoFormatU32BE;
  SoundIoFormatFloat32FE = SoundIoFormatFloat32BE;
  SoundIoFormatFloat64FE = SoundIoFormatFloat64BE;

const
  SOUNDIO_MAX_CHANNELS = 24;

type
  TSoundIoChannelLayout = record
    name: pchar;
    channel_count: longint;
    channels: array[0..(SOUNDIO_MAX_CHANNELS) - 1] of TSoundIoChannelId;
  end;
  PSoundIoChannelLayout = ^TSoundIoChannelLayout;

  TSoundIoSampleRateRange = record
    min: longint;
    max: longint;
  end;
  PSoundIoSampleRateRange = ^TSoundIoSampleRateRange;

  TSoundIoChannelArea = record
    ptr: pchar;
    step: longint;
  end;
  PSoundIoChannelArea = ^TSoundIoChannelArea;
  PPSoundIoChannelArea = ^PSoundIoChannelArea;

  PSoundIo = ^TSoundIo;
  TSoundIo = record
    userdata : pointer;
    on_devices_change : procedure (soundio: PSoundIo);cdecl;
    on_backend_disconnect : procedure (soundio: PSoundIo; err:longint);cdecl;
    on_events_signal : procedure (soundio: PSoundIo);cdecl;
    current_backend : TSoundIoBackend;
    app_name : Pchar;
    emit_rtprio_warning : procedure ;cdecl;
    jack_info_callback : procedure (msg:Pchar);cdecl;
    jack_error_callback : procedure (msg:Pchar);cdecl;
  end;

  TSoundIoDevice = record
    soundio: PSoundIo;
    id: pchar;
    name: pchar;
    aim: TSoundIoDeviceAim;
    layouts: PSoundIoChannelLayout;
    layout_count: longint;
    current_layout: TSoundIoChannelLayout;
    formats: PSoundIoFormat;
    format_count: longint;
    current_format: TSoundIoFormat;
    sample_rates: PSoundIoSampleRateRange;
    sample_rate_count: longint;
    sample_rate_current: longint;
    software_latency_min: double;
    software_latency_max: double;
    software_latency_current: double;
    is_raw: boolean;
    ref_count: longint;
    probe_error: longint;
  end;
  PSoundIoDevice = ^TSoundIoDevice;

  PSoundIoOutStream = ^TSoundIoOutStream;
  TSoundIoOutStream = record
    device : PSoundIoDevice;
    format : TSoundIoFormat;
    sample_rate : longint;
    layout : TSoundIoChannelLayout;
    software_latency : double;
    volume : single;
    userdata : pointer;
    write_callback : procedure (stream: PSoundIoOutStream; frame_count_min:longint; frame_count_max:longint);cdecl;
    underflow_callback : procedure (stream: PSoundIoOutStream);cdecl;
    error_callback : procedure (stream: PSoundIoOutStream; err:longint);cdecl;
    name : Pchar;
    non_terminal_hint : Boolean;
    bytes_per_frame : longint;
    bytes_per_sample : longint;
    layout_error : longint;
  end;

  PSoundIoInStream = ^TSoundIoInStream;
  TSoundIoInStream = record
    device : PSoundIoDevice;
    format : TSoundIoFormat;
    sample_rate : longint;
    layout : TSoundIoChannelLayout;
    software_latency : double;
    userdata : pointer;
    read_callback : procedure (stream: PSoundIoInStream; frame_count_min:longint; frame_count_max:longint);cdecl;
    overflow_callback : procedure (stream: PSoundIoInStream);cdecl;
    error_callback : procedure (stream: PSoundIoInStream; err:longint);cdecl;
    name : Pchar;
    non_terminal_hint : Boolean;
    bytes_per_frame : longint;
    bytes_per_sample : longint;
    layout_error : longint;
    end;

function soundio_version_string: pchar; cdecl; external libsoundio;
function soundio_version_major: longint; cdecl; external libsoundio;
function soundio_version_minor: longint; cdecl; external libsoundio;
function soundio_version_patch: longint; cdecl; external libsoundio;
function soundio_create: PSoundIo; cdecl; external libsoundio;
procedure soundio_destroy(soundio: PSoundIo); cdecl; external libsoundio;
function soundio_connect(soundio: PSoundIo): longint; cdecl; external libsoundio;
function soundio_connect_backend(soundio: PSoundIo; backend: TSoundIoBackend): longint; cdecl; external libsoundio;
procedure soundio_disconnect(soundio: PSoundIo); cdecl; external libsoundio;
function soundio_strerror(error: longint): pchar; cdecl; external libsoundio;
function soundio_backend_name(backend: TSoundIoBackend): pchar; cdecl; external libsoundio;
function soundio_backend_count(soundio: PSoundIo): longint; cdecl; external libsoundio;
function soundio_get_backend(soundio: PSoundIo; index: longint): TSoundIoBackend; cdecl; external libsoundio;
function soundio_have_backend(backend: TSoundIoBackend): boolean; cdecl; external libsoundio;
procedure soundio_flush_events(soundio: PSoundIo); cdecl; external libsoundio;
procedure soundio_wait_events(soundio: PSoundIo); cdecl; external libsoundio;
procedure soundio_wakeup(soundio: PSoundIo); cdecl; external libsoundio;
procedure soundio_force_device_scan(soundio: PSoundIo); cdecl; external libsoundio;
function soundio_channel_layout_equal(a: PSoundIoChannelLayout; b: PSoundIoChannelLayout): boolean; cdecl; external libsoundio;
function soundio_get_channel_name(id: TSoundIoChannelId): pchar; cdecl; external libsoundio;
function soundio_parse_channel_id(str: pchar; str_len: longint): TSoundIoChannelId; cdecl; external libsoundio;
function soundio_channel_layout_builtin_count: longint; cdecl; external libsoundio;
function soundio_channel_layout_get_builtin(index: longint): PSoundIoChannelLayout; cdecl; external libsoundio;
function soundio_channel_layout_get_default(channel_count: longint): PSoundIoChannelLayout; cdecl; external libsoundio;
function soundio_channel_layout_find_channel(layout: PSoundIoChannelLayout; channel: TSoundIoChannelId): longint; cdecl; external libsoundio;
function soundio_channel_layout_detect_builtin(layout: PSoundIoChannelLayout): boolean; cdecl; external libsoundio;
function soundio_best_matching_channel_layout(preferred_layouts: PSoundIoChannelLayout; preferred_layout_count: longint; available_layouts: PSoundIoChannelLayout; available_layout_count: longint): PSoundIoChannelLayout; cdecl; external libsoundio;
procedure soundio_sort_channel_layouts(layouts: PSoundIoChannelLayout; layout_count: longint); cdecl; external libsoundio;
function soundio_get_bytes_per_sample(format: TSoundIoFormat): longint; cdecl; external libsoundio;

function soundio_get_bytes_per_frame(format: TSoundIoFormat; channel_count: Integer): Integer;
function soundio_get_bytes_per_second(format: TSoundIoFormat; channel_count: Integer; sample_rate: Integer): Integer;

function soundio_format_string(format: TSoundIoFormat): pchar; cdecl; external libsoundio;
function soundio_input_device_count(soundio: PSoundIo): longint; cdecl; external libsoundio;
function soundio_output_device_count(soundio: PSoundIo): longint; cdecl; external libsoundio;
function soundio_get_input_device(soundio: PSoundIo; index: longint): PSoundIoDevice; cdecl; external libsoundio;
function soundio_get_output_device(soundio: PSoundIo; index: longint): PSoundIoDevice; cdecl; external libsoundio;
function soundio_default_input_device_index(soundio: PSoundIo): longint; cdecl; external libsoundio;
function soundio_default_output_device_index(soundio: PSoundIo): longint; cdecl; external libsoundio;
procedure soundio_device_ref(device: PSoundIoDevice); cdecl; external libsoundio;
procedure soundio_device_unref(device: PSoundIoDevice); cdecl; external libsoundio;
function soundio_device_equal(a: PSoundIoDevice; b: PSoundIoDevice): boolean; cdecl; external libsoundio;
procedure soundio_device_sort_channel_layouts(device: PSoundIoDevice); cdecl; external libsoundio;
function soundio_device_supports_format(device: PSoundIoDevice; format: TSoundIoFormat): boolean; cdecl; external libsoundio;
function soundio_device_supports_layout(device: PSoundIoDevice; layout: PSoundIoChannelLayout): boolean; cdecl; external libsoundio;
function soundio_device_supports_sample_rate(device: PSoundIoDevice; sample_rate: longint): boolean; cdecl; external libsoundio;
function soundio_device_nearest_sample_rate(device: PSoundIoDevice; sample_rate: longint): longint; cdecl; external libsoundio;
function soundio_outstream_create(device: PSoundIoDevice): PSoundIoOutStream; cdecl; external libsoundio;
procedure soundio_outstream_destroy(outstream: PSoundIoOutStream); cdecl; external libsoundio;
function soundio_outstream_open(outstream: PSoundIoOutStream): longint; cdecl; external libsoundio;
function soundio_outstream_start(outstream: PSoundIoOutStream): longint; cdecl; external libsoundio;
function soundio_outstream_begin_write(outstream: PSoundIoOutStream; areas: PPSoundIoChannelArea; frame_count: Plongint): longint; cdecl; external libsoundio;
function soundio_outstream_end_write(outstream: PSoundIoOutStream): longint; cdecl; external libsoundio;
function soundio_outstream_clear_buffer(outstream: PSoundIoOutStream): longint; cdecl; external libsoundio;
function soundio_outstream_pause(outstream: PSoundIoOutStream; pause: boolean): longint; cdecl; external libsoundio;
function soundio_outstream_get_latency(outstream: PSoundIoOutStream; out_latency: Pdouble): longint; cdecl; external libsoundio;
function soundio_outstream_set_volume(outstream: PSoundIoOutStream; volume: double): longint; cdecl; external libsoundio;
function soundio_instream_create(device: PSoundIoDevice): PSoundIoInStream; cdecl; external libsoundio;
procedure soundio_instream_destroy(instream: PSoundIoInStream); cdecl; external libsoundio;
function soundio_instream_open(instream: PSoundIoInStream): longint; cdecl; external libsoundio;
function soundio_instream_start(instream: PSoundIoInStream): longint; cdecl; external libsoundio;
function soundio_instream_begin_read(instream: PSoundIoInStream; areas: PPSoundIoChannelArea; frame_count: Plongint): longint; cdecl; external libsoundio;
function soundio_instream_end_read(instream: PSoundIoInStream): longint; cdecl; external libsoundio;
function soundio_instream_pause(instream: PSoundIoInStream; pause: boolean): longint; cdecl; external libsoundio;
function soundio_instream_get_latency(instream: PSoundIoInStream; out_latency: Pdouble): longint; cdecl; external libsoundio;
type
  PSoundIoRingBuffer = type Pointer;

function soundio_ring_buffer_create(soundio: PSoundIo; requested_capacity: longint): PSoundIoRingBuffer; cdecl; external libsoundio;
procedure soundio_ring_buffer_destroy(ring_buffer: PSoundIoRingBuffer); cdecl; external libsoundio;
function soundio_ring_buffer_capacity(ring_buffer: PSoundIoRingBuffer): longint; cdecl; external libsoundio;
function soundio_ring_buffer_write_ptr(ring_buffer: PSoundIoRingBuffer): pchar; cdecl; external libsoundio;
procedure soundio_ring_buffer_advance_write_ptr(ring_buffer: PSoundIoRingBuffer; count: longint); cdecl; external libsoundio;
function soundio_ring_buffer_read_ptr(ring_buffer: PSoundIoRingBuffer): pchar; cdecl; external libsoundio;
procedure soundio_ring_buffer_advance_read_ptr(ring_buffer: PSoundIoRingBuffer; count: longint); cdecl; external libsoundio;
function soundio_ring_buffer_fill_count(ring_buffer: PSoundIoRingBuffer): longint; cdecl; external libsoundio;
function soundio_ring_buffer_free_count(ring_buffer: PSoundIoRingBuffer): longint; cdecl; external libsoundio;
procedure soundio_ring_buffer_clear(ring_buffer: PSoundIoRingBuffer); cdecl; external libsoundio;

// === Konventiert am: 18-11-25 15:15:34 ===


implementation

function soundio_get_bytes_per_frame(format: TSoundIoFormat; channel_count: integer): integer;
begin
  Result := soundio_get_bytes_per_sample(format) * channel_count;
end;

function soundio_get_bytes_per_second(format: TSoundIoFormat; channel_count: integer; sample_rate: integer): integer;
begin
  Result := soundio_get_bytes_per_frame(format, channel_count) * sample_rate;
end;


end.
