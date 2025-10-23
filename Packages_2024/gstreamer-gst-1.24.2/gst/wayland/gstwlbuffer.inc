
{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GstWlBuffer, gst_wl_buffer, GST, WL_BUFFER, GObject); }
type
  PGstWlBuffer = ^TGstWlBuffer;

  TGstWlBuffer = record
    parent_instance: TGObject;
  end;

  TGstWlBufferClass = record
    parent_class: TGObjectClass;
  end;
  PGstWlBufferClass = ^TGstWlBufferClass;

function gst_wl_buffer_get_type: TGType; cdecl; external libgstwayland;
function gst_buffer_add_wl_buffer(gstbuffer: PGstBuffer; wlbuffer: Pwl_buffer; display: PGstWlDisplay): PGstWlBuffer; cdecl; external libgstwayland;
function gst_buffer_get_wl_buffer(display: PGstWlDisplay; gstbuffer: PGstBuffer): PGstWlBuffer; cdecl; external libgstwayland;
procedure gst_wl_buffer_force_release_and_unref(buf: PGstBuffer; self: PGstWlBuffer); cdecl; external libgstwayland;
procedure gst_wl_buffer_attach(self: PGstWlBuffer; surface: Pwl_surface); cdecl; external libgstwayland;
procedure gst_wl_buffer_ref_gst_buffer(self: PGstWlBuffer); cdecl; external libgstwayland;
procedure gst_wl_buffer_unref_buffer(self: PGstWlBuffer); cdecl; external libgstwayland;
function gst_wl_buffer_get_display(self: PGstWlBuffer): PGstWlDisplay; cdecl; external libgstwayland;

// === Konventiert am: 8-10-24 14:14:53 ===

function GST_TYPE_WL_BUFFER: TGType;
function GST_WL_BUFFER(obj: Pointer): PGstWlBuffer;
function GST_IS_WL_BUFFER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_WL_BUFFER: TGType;
begin
  Result := gst_wl_buffer_get_type;
end;

function GST_WL_BUFFER(obj: Pointer): PGstWlBuffer;
begin
  Result := PGstWlBuffer(g_type_check_instance_cast(obj, GST_TYPE_WL_BUFFER));
end;

function GST_IS_WL_BUFFER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_WL_BUFFER);
end;



{$ENDIF read_implementation}
