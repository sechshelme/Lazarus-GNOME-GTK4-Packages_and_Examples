/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstStreamType = ^TGstStreamType;
  TGstStreamType = longint;

const
  GST_STREAM_TYPE_UNKNOWN = 1 shl 0;
  GST_STREAM_TYPE_AUDIO = 1 shl 1;
  GST_STREAM_TYPE_VIDEO = 1 shl 2;
  GST_STREAM_TYPE_CONTAINER = 1 shl 3;
  GST_STREAM_TYPE_TEXT = 1 shl 4;

type

  TGstStreamClass = record
    parent_class: TGstObjectClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstStreamClass = ^TGstStreamClass;

function gst_stream_get_type: TGType; cdecl; external libgstreamer;
function gst_stream_new(stream_id: Pgchar; caps: PGstCaps; _type: TGstStreamType; flags: TGstStreamFlags): PGstStream; cdecl; external libgstreamer;
function gst_stream_get_stream_id(stream: PGstStream): Pgchar; cdecl; external libgstreamer;
procedure gst_stream_set_stream_flags(stream: PGstStream; flags: TGstStreamFlags); cdecl; external libgstreamer;
function gst_stream_get_stream_flags(stream: PGstStream): TGstStreamFlags; cdecl; external libgstreamer;
procedure gst_stream_set_stream_type(stream: PGstStream; stream_type: TGstStreamType); cdecl; external libgstreamer;
function gst_stream_get_stream_type(stream: PGstStream): TGstStreamType; cdecl; external libgstreamer;
procedure gst_stream_set_tags(stream: PGstStream; tags: PGstTagList); cdecl; external libgstreamer;
function gst_stream_get_tags(stream: PGstStream): PGstTagList; cdecl; external libgstreamer;
procedure gst_stream_set_caps(stream: PGstStream; caps: PGstCaps); cdecl; external libgstreamer;
function gst_stream_get_caps(stream: PGstStream): PGstCaps; cdecl; external libgstreamer;
function gst_stream_type_get_name(stype: TGstStreamType): Pgchar; cdecl; external libgstreamer;

function GST_STREAM_CAST(obj: Pointer): PGstStream;


// === Konventiert am: 14-9-24 16:49:52 ===

function GST_TYPE_STREAM: TGType;
function GST_STREAM(obj: Pointer): PGstStream;
function GST_STREAM_CLASS(klass: Pointer): PGstStreamClass;
function GST_IS_STREAM(obj: Pointer): Tgboolean;
function GST_IS_STREAM_CLASS(klass: Pointer): Tgboolean;
function GST_STREAM_GET_CLASS(obj: Pointer): PGstStreamClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_STREAM: TGType;
begin
  GST_TYPE_STREAM := gst_stream_get_type;
end;

function GST_STREAM(obj: Pointer): PGstStream;
begin
  Result := PGstStream(g_type_check_instance_cast(obj, GST_TYPE_STREAM));
end;

function GST_STREAM_CLASS(klass: Pointer): PGstStreamClass;
begin
  Result := PGstStreamClass(g_type_check_class_cast(klass, GST_TYPE_STREAM));
end;

function GST_IS_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_STREAM);
end;

function GST_IS_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_STREAM);
end;

function GST_STREAM_GET_CLASS(obj: Pointer): PGstStreamClass;
begin
  Result := PGstStreamClass(PGTypeInstance(obj)^.g_class);
end;


function GST_STREAM_CAST(obj: Pointer): PGstStream;
begin
  GST_STREAM_CAST := PGstStream(obj);
end;


{$ENDIF read_implementation}
