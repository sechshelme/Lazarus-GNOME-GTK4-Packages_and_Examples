unit gstadapter;

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGstAdapter = type Pointer;
  PGstAdapterClass = type Pointer;

function gst_adapter_get_type: TGType; cdecl; external libgstbase;
function gst_adapter_new: PGstAdapter; cdecl; external libgstbase;
procedure gst_adapter_clear(adapter: PGstAdapter); cdecl; external libgstbase;
procedure gst_adapter_push(adapter: PGstAdapter; buf: PGstBuffer); cdecl; external libgstbase;
function gst_adapter_map(adapter: PGstAdapter; size: Tgsize): Tgconstpointer; cdecl; external libgstbase;
procedure gst_adapter_unmap(adapter: PGstAdapter); cdecl; external libgstbase;
procedure gst_adapter_copy(adapter: PGstAdapter; dest: Tgpointer; offset: Tgsize; size: Tgsize); cdecl; external libgstbase;
function gst_adapter_copy_bytes(adapter: PGstAdapter; offset: Tgsize; size: Tgsize): PGBytes; cdecl; external libgstbase;
procedure gst_adapter_flush(adapter: PGstAdapter; flush: Tgsize); cdecl; external libgstbase;
function gst_adapter_take(adapter: PGstAdapter; nbytes: Tgsize): Tgpointer; cdecl; external libgstbase;
function gst_adapter_take_buffer(adapter: PGstAdapter; nbytes: Tgsize): PGstBuffer; cdecl; external libgstbase;
function gst_adapter_take_list(adapter: PGstAdapter; nbytes: Tgsize): PGList; cdecl; external libgstbase;
function gst_adapter_take_buffer_fast(adapter: PGstAdapter; nbytes: Tgsize): PGstBuffer; cdecl; external libgstbase;
function gst_adapter_take_buffer_list(adapter: PGstAdapter; nbytes: Tgsize): PGstBufferList; cdecl; external libgstbase;
function gst_adapter_get_buffer(adapter: PGstAdapter; nbytes: Tgsize): PGstBuffer; cdecl; external libgstbase;
function gst_adapter_get_list(adapter: PGstAdapter; nbytes: Tgsize): PGList; cdecl; external libgstbase;
function gst_adapter_get_buffer_fast(adapter: PGstAdapter; nbytes: Tgsize): PGstBuffer; cdecl; external libgstbase;
function gst_adapter_get_buffer_list(adapter: PGstAdapter; nbytes: Tgsize): PGstBufferList; cdecl; external libgstbase;
function gst_adapter_available(adapter: PGstAdapter): Tgsize; cdecl; external libgstbase;
function gst_adapter_available_fast(adapter: PGstAdapter): Tgsize; cdecl; external libgstbase;
function gst_adapter_prev_pts(adapter: PGstAdapter; distance: Pguint64): TGstClockTime; cdecl; external libgstbase;
function gst_adapter_prev_dts(adapter: PGstAdapter; distance: Pguint64): TGstClockTime; cdecl; external libgstbase;
function gst_adapter_prev_pts_at_offset(adapter: PGstAdapter; offset: Tgsize; distance: Pguint64): TGstClockTime; cdecl; external libgstbase;
function gst_adapter_prev_dts_at_offset(adapter: PGstAdapter; offset: Tgsize; distance: Pguint64): TGstClockTime; cdecl; external libgstbase;
function gst_adapter_prev_offset(adapter: PGstAdapter; distance: Pguint64): Tguint64; cdecl; external libgstbase;
function gst_adapter_pts_at_discont(adapter: PGstAdapter): TGstClockTime; cdecl; external libgstbase;
function gst_adapter_dts_at_discont(adapter: PGstAdapter): TGstClockTime; cdecl; external libgstbase;
function gst_adapter_offset_at_discont(adapter: PGstAdapter): Tguint64; cdecl; external libgstbase;
function gst_adapter_distance_from_discont(adapter: PGstAdapter): Tguint64; cdecl; external libgstbase;
function gst_adapter_masked_scan_uint32(adapter: PGstAdapter; mask: Tguint32; pattern: Tguint32; offset: Tgsize; size: Tgsize): Tgssize; cdecl; external libgstbase;
function gst_adapter_masked_scan_uint32_peek(adapter: PGstAdapter; mask: Tguint32; pattern: Tguint32; offset: Tgsize; size: Tgsize;
  value: Pguint32): Tgssize; cdecl; external libgstbase;

// === Konventiert am: 13-7-26 19:26:52 ===

function GST_TYPE_ADAPTER: TGType;
function GST_ADAPTER(obj: Pointer): PGstAdapter;
function GST_ADAPTER_CLASS(klass: Pointer): PGstAdapterClass;
function GST_IS_ADAPTER(obj: Pointer): Tgboolean;
function GST_IS_ADAPTER_CLASS(klass: Pointer): Tgboolean;
function GST_ADAPTER_GET_CLASS(obj: Pointer): PGstAdapterClass;

implementation

function GST_TYPE_ADAPTER: TGType;
begin
  GST_TYPE_ADAPTER := gst_adapter_get_type;
end;

function GST_ADAPTER(obj: Pointer): PGstAdapter;
begin
  Result := PGstAdapter(g_type_check_instance_cast(obj, GST_TYPE_ADAPTER));
end;

function GST_ADAPTER_CLASS(klass: Pointer): PGstAdapterClass;
begin
  Result := PGstAdapterClass(g_type_check_class_cast(klass, GST_TYPE_ADAPTER));
end;

function GST_IS_ADAPTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_ADAPTER);
end;

function GST_IS_ADAPTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_ADAPTER);
end;

function GST_ADAPTER_GET_CLASS(obj: Pointer): PGstAdapterClass;
begin
  Result := PGstAdapterClass(PGTypeInstance(obj)^.g_class);
end;

end.
