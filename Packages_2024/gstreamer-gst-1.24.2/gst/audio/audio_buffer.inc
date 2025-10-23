
{$IFDEF read_interface}

type
  TGstAudioBuffer = record
    info: TGstAudioInfo;
    n_samples: Tgsize;
    n_planes: Tgint;
    planes: Pgpointer;
    buffer: PGstBuffer;
    map_infos: PGstMapInfo;
    priv_planes_arr: array[0..7] of Tgpointer;
    priv_map_infos_arr: array[0..7] of TGstMapInfo;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstAudioBuffer = ^TGstAudioBuffer;

function gst_audio_buffer_map(buffer: PGstAudioBuffer; info: PGstAudioInfo; gstbuffer: PGstBuffer; flags: TGstMapFlags): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_buffer_unmap(buffer: PGstAudioBuffer); cdecl; external libgstaudio;

function GST_AUDIO_BUFFER_FORMAT(b: PGstAudioBuffer): TGstAudioFormat;
function GST_AUDIO_BUFFER_CHANNELS(b: PGstAudioBuffer): Tgint;
function GST_AUDIO_BUFFER_LAYOUT(b: PGstAudioBuffer): TGstAudioLayout;
function GST_AUDIO_BUFFER_RATE(b: PGstAudioBuffer): Tgint;
function GST_AUDIO_BUFFER_WIDTH(b: PGstAudioBuffer): Tgint;
function GST_AUDIO_BUFFER_DEPTH(b: PGstAudioBuffer): Tgint;
function GST_AUDIO_BUFFER_SAMPLE_STRIDE(b: PGstAudioBuffer): Tgint;
function GST_AUDIO_BUFFER_BPS(b: PGstAudioBuffer): Tgint;
function GST_AUDIO_BUFFER_BPF(b: PGstAudioBuffer): Tgint;
function GST_AUDIO_BUFFER_N_SAMPLES(b: PGstAudioBuffer): Tgsize;
function GST_AUDIO_BUFFER_N_PLANES(b: PGstAudioBuffer): Tgint;
function GST_AUDIO_BUFFER_PLANE_DATA(b: PGstAudioBuffer; p: integer): Pgpointer;
function GST_AUDIO_BUFFER_PLANE_SIZE(b: PGstAudioBuffer): Tgint;


// === Konventiert am: 28-9-24 19:49:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_AUDIO_BUFFER_FORMAT(b: PGstAudioBuffer): TGstAudioFormat;
begin
  GST_AUDIO_BUFFER_FORMAT := GST_AUDIO_INFO_FORMAT(@(b^.info));
end;

function GST_AUDIO_BUFFER_CHANNELS(b: PGstAudioBuffer): Tgint;
begin
  GST_AUDIO_BUFFER_CHANNELS := GST_AUDIO_INFO_CHANNELS(@(b^.info));
end;

function GST_AUDIO_BUFFER_LAYOUT(b: PGstAudioBuffer): TGstAudioLayout;
begin
  GST_AUDIO_BUFFER_LAYOUT := GST_AUDIO_INFO_LAYOUT(@(b^.info));
end;

function GST_AUDIO_BUFFER_RATE(b: PGstAudioBuffer): Tgint;
begin
  GST_AUDIO_BUFFER_RATE := GST_AUDIO_INFO_RATE(@(b^.info));
end;

function GST_AUDIO_BUFFER_WIDTH(b: PGstAudioBuffer): Tgint;
begin
  GST_AUDIO_BUFFER_WIDTH := GST_AUDIO_INFO_WIDTH(@(b^.info));
end;

function GST_AUDIO_BUFFER_DEPTH(b: PGstAudioBuffer): Tgint;
begin
  GST_AUDIO_BUFFER_DEPTH := GST_AUDIO_INFO_DEPTH(@(b^.info));
end;

function GST_AUDIO_BUFFER_SAMPLE_STRIDE(b: PGstAudioBuffer): Tgint;
begin
  GST_AUDIO_BUFFER_SAMPLE_STRIDE := (GST_AUDIO_INFO_WIDTH(@(b^.info))) shr 3;
end;

function GST_AUDIO_BUFFER_BPS(b: PGstAudioBuffer): Tgint;
begin
  GST_AUDIO_BUFFER_BPS := (GST_AUDIO_INFO_DEPTH(@(b^.info))) shr 3;
end;

function GST_AUDIO_BUFFER_BPF(b: PGstAudioBuffer): Tgint;
begin
  GST_AUDIO_BUFFER_BPF := GST_AUDIO_INFO_BPF(@(b^.info));
end;

function GST_AUDIO_BUFFER_N_SAMPLES(b: PGstAudioBuffer): Tgsize;
begin
  GST_AUDIO_BUFFER_N_SAMPLES := b^.n_samples;
end;

function GST_AUDIO_BUFFER_N_PLANES(b: PGstAudioBuffer): Tgint;
begin
  GST_AUDIO_BUFFER_N_PLANES := b^.n_planes;
end;

function GST_AUDIO_BUFFER_PLANE_DATA(b: PGstAudioBuffer; p: integer): Pgpointer;
begin
  GST_AUDIO_BUFFER_PLANE_DATA := b^.planes[p];
end;

function GST_AUDIO_BUFFER_PLANE_SIZE(b: PGstAudioBuffer): Tgint;
begin
  GST_AUDIO_BUFFER_PLANE_SIZE := (((GST_AUDIO_BUFFER_N_SAMPLES(b)) * (GST_AUDIO_BUFFER_SAMPLE_STRIDE(b))) * (GST_AUDIO_BUFFER_CHANNELS(b))) div (GST_AUDIO_BUFFER_N_PLANES(b));
end;


{$ENDIF read_implementation}
