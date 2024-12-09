
{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GstSourceBufferList, gst_source_buffer_list, GST, SOURCE_BUFFER_LIST, GstObject); }
type
  TGstSourceBufferList = record
  end;
  PGstSourceBufferList = ^TGstSourceBufferList;

  TGstSourceBufferListClass = record
    parent_class: TGstObjectClass;
  end;
  PGstSourceBufferListClass = ^TGstSourceBufferListClass;

function gst_source_buffer_list_get_type: TGType; cdecl; external libgstmse;
function gst_source_buffer_list_index(self: PGstSourceBufferList; index: Tguint): PGstSourceBuffer; cdecl; external libgstmse;
function gst_source_buffer_list_get_length(self: PGstSourceBufferList): Tguint; cdecl; external libgstmse;

// === Konventiert am: 3-10-24 17:29:11 ===

function GST_TYPE_SOURCE_BUFFER_LIST: TGType;
function GST_SOURCE_BUFFER_LIST(obj: Pointer): PGstSourceBufferList;
function GST_IS_SOURCE_BUFFER_LIST(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_SOURCE_BUFFER_LIST: TGType;
begin
  Result := gst_source_buffer_list_get_type;
end;

function GST_SOURCE_BUFFER_LIST(obj: Pointer): PGstSourceBufferList;
begin
  Result := PGstSourceBufferList(g_type_check_instance_cast(obj, GST_TYPE_SOURCE_BUFFER_LIST));
end;

function GST_IS_SOURCE_BUFFER_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_SOURCE_BUFFER_LIST);
end;




{$ENDIF read_implementation}
