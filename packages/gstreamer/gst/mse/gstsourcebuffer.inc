/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 03-10-2024   17:46                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstSourceBufferAppendMode = ^TGstSourceBufferAppendMode;
  TGstSourceBufferAppendMode = longint;

const
  GST_SOURCE_BUFFER_APPEND_MODE_SEGMENTS = 0;
  GST_SOURCE_BUFFER_APPEND_MODE_SEQUENCE = 1;

type
  PGstSourceBufferInterval = ^TGstSourceBufferInterval;

  TGstSourceBufferInterval = record
    start: TGstClockTime;
    end_: TGstClockTime;
  end;

  {G_DECLARE_FINAL_TYPE (GstSourceBuffer, gst_source_buffer, GST, SOURCE_BUFFER, GstObject); }
type
  TGstSourceBuffer = record
  end;
  PGstSourceBuffer = ^TGstSourceBuffer;

  TGstSourceBufferClass = record
    parent_class: TGstObjectClass;
  end;
  PGstSourceBufferClass = ^TGstSourceBufferClass;

function gst_source_buffer_get_type: TGType; cdecl; external libgstmse;
function gst_source_buffer_get_append_mode(self: PGstSourceBuffer): TGstSourceBufferAppendMode; cdecl; external libgstmse;
function gst_source_buffer_set_append_mode(self: PGstSourceBuffer; mode: TGstSourceBufferAppendMode; error: PPGError): Tgboolean; cdecl; external libgstmse;
function gst_source_buffer_get_content_type(self: PGstSourceBuffer): Pgchar; cdecl; external libgstmse;
function gst_source_buffer_get_updating(self: PGstSourceBuffer): Tgboolean; cdecl; external libgstmse;
function gst_source_buffer_get_buffered(self: PGstSourceBuffer; error: PPGError): PGArray; cdecl; external libgstmse;
function gst_source_buffer_set_timestamp_offset(self: PGstSourceBuffer; offset: TGstClockTime; error: PPGError): Tgboolean; cdecl; external libgstmse;
function gst_source_buffer_get_timestamp_offset(self: PGstSourceBuffer): TGstClockTime; cdecl; external libgstmse;
function gst_source_buffer_set_append_window_start(self: PGstSourceBuffer; start: TGstClockTime; error: PPGError): Tgboolean; cdecl; external libgstmse;
function gst_source_buffer_get_append_window_start(self: PGstSourceBuffer): TGstClockTime; cdecl; external libgstmse;
function gst_source_buffer_set_append_window_end(self: PGstSourceBuffer; end_: TGstClockTime; error: PPGError): Tgboolean; cdecl; external libgstmse;
function gst_source_buffer_get_append_window_end(self: PGstSourceBuffer): TGstClockTime; cdecl; external libgstmse;
function gst_source_buffer_append_buffer(self: PGstSourceBuffer; buf: PGstBuffer; error: PPGError): Tgboolean; cdecl; external libgstmse;
function gst_source_buffer_abort(self: PGstSourceBuffer; error: PPGError): Tgboolean; cdecl; external libgstmse;
function gst_source_buffer_change_content_type(self: PGstSourceBuffer; _type: Pgchar; error: PPGError): Tgboolean; cdecl; external libgstmse;
function gst_source_buffer_remove(self: PGstSourceBuffer; start: TGstClockTime; end_: TGstClockTime; error: PPGError): Tgboolean; cdecl; external libgstmse;

// === Konventiert am: 3-10-24 17:29:05 ===

function GST_TYPE_SOURCE_BUFFER: TGType;
function GST_SOURCE_BUFFER(obj: Pointer): PGstSourceBuffer;
function GST_IS_SOURCE_BUFFER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_SOURCE_BUFFER: TGType;
begin
  Result := gst_source_buffer_get_type;
end;

function GST_SOURCE_BUFFER(obj: Pointer): PGstSourceBuffer;
begin
  Result := PGstSourceBuffer(g_type_check_instance_cast(obj, GST_TYPE_SOURCE_BUFFER));
end;

function GST_IS_SOURCE_BUFFER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_SOURCE_BUFFER);
end;




{$ENDIF read_implementation}
