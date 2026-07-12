unit gstsample;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstsegment, gststructure;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstSample = type Pointer;
  {$ENDIF read_struct}

  {$IFDEF read_function}
var
  _gst_sample_type: TGType; cvar;external libgstreamer;

function gst_sample_get_type: TGType; cdecl; external libgstreamer;
function gst_sample_new(buffer: PGstBuffer; caps: PGstCaps; segment: PGstSegment; info: PGstStructure): PGstSample; cdecl; external libgstreamer;
function gst_sample_get_buffer(sample: PGstSample): PGstBuffer; cdecl; external libgstreamer;
function gst_sample_get_caps(sample: PGstSample): PGstCaps; cdecl; external libgstreamer;
function gst_sample_get_segment(sample: PGstSample): PGstSegment; cdecl; external libgstreamer;
function gst_sample_get_info(sample: PGstSample): PGstStructure; cdecl; external libgstreamer;
function gst_sample_get_buffer_list(sample: PGstSample): PGstBufferList; cdecl; external libgstreamer;
procedure gst_sample_set_buffer_list(sample: PGstSample; buffer_list: PGstBufferList); cdecl; external libgstreamer;
procedure gst_sample_set_buffer(sample: PGstSample; buffer: PGstBuffer); cdecl; external libgstreamer;
procedure gst_sample_set_caps(sample: PGstSample; caps: PGstCaps); cdecl; external libgstreamer;
procedure gst_sample_set_segment(sample: PGstSample; segment: PGstSegment); cdecl; external libgstreamer;
function gst_sample_set_info(sample: PGstSample; info: PGstStructure): Tgboolean; cdecl; external libgstreamer;
function gst_sample_ref(sample: PGstSample): PGstSample; cdecl; external libgstreamer;
procedure gst_sample_unref(sample: PGstSample); cdecl; external libgstreamer;
function gst_sample_copy(sample: PGstSample): PGstSample; cdecl; external libgstreamer;
procedure gst_clear_sample(sample_ptr: PPGstSample); cdecl; external libgstreamer;
function gst_sample_make_writable(sample: PGstSample): PGstSample; cdecl; external libgstreamer;
function gst_sample_is_writable(sample: PGstSample): Tgboolean; cdecl; external libgstreamer;

// === Konventiert am: 11-7-26 15:24:32 ===

function GST_TYPE_SAMPLE: TGType;
function GST_IS_SAMPLE(obj: Pointer): Tgboolean;
function GST_SAMPLE_CAST(obj: Pointer): PGstSample;
function GST_SAMPLE(obj: Pointer): PGstSample;

function gst_sample_is_writable(sample: PGstSample): Tgboolean;
function gst_sample_make_writable(sample: PGstSample): PGstSample;

procedure gst_value_set_sample(v: PGValue; b: Tgconstpointer);
procedure gst_value_take_sample(v: PGValue; b: Tgconstpointer);
function gst_value_get_sample(v: PGValue): PGstSample;
{$ENDIF read_function}

implementation

function GST_TYPE_SAMPLE: TGType;
begin
  Result := _gst_sample_type;
end;

function GST_IS_SAMPLE(obj: Pointer): Tgboolean;
begin
  GST_IS_SAMPLE := GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_SAMPLE);
end;

function GST_SAMPLE_CAST(obj: Pointer): PGstSample;
begin
  GST_SAMPLE_CAST := PGstSample(obj);
end;

function GST_SAMPLE(obj: Pointer): PGstSample;
begin
  GST_SAMPLE := GST_SAMPLE_CAST(obj);
end;

function gst_sample_is_writable(sample: PGstSample): Tgboolean;
begin
  gst_sample_is_writable := gst_mini_object_is_writable(GST_MINI_OBJECT_CAST(sample));
end;

function gst_sample_make_writable(sample: PGstSample): PGstSample;
begin
  gst_sample_make_writable := GST_SAMPLE_CAST(gst_mini_object_make_writable(GST_MINI_OBJECT_CAST(sample)));
end;

procedure gst_value_set_sample(v: PGValue; b: Tgconstpointer);
begin
  g_value_set_boxed(v, b);
end;

procedure gst_value_take_sample(v: PGValue; b: Tgconstpointer);
begin
  g_value_take_boxed(v, b);
end;

function gst_value_get_sample(v: PGValue): PGstSample;
begin
  gst_value_get_sample := GST_SAMPLE_CAST(g_value_get_boxed(v));
end;

end.
