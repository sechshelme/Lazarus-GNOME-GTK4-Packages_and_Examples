{$IFDEF read_interface}


type
  PGstSourceBufferList = type Pointer;
  PPGstSourceBufferList = ^PGstSourceBufferList;

  TGstSourceBufferListClass = record
    parent_class: TGstObjectClass;
  end;
  PGstSourceBufferListClass = ^TGstSourceBufferListClass;

function gst_source_buffer_list_get_type: TGType; cdecl; external libgstmse;
function gst_source_buffer_list_index(self: PGstSourceBufferList; index: Tguint): PGstSourceBuffer; cdecl; external libgstmse;
function gst_source_buffer_list_get_length(self: PGstSourceBufferList): Tguint; cdecl; external libgstmse;

// === Konventiert am: 26-7-26 14:04:08 ===

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
