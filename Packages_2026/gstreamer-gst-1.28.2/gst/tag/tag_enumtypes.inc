{$IFDEF read_interface}


function gst_tag_demux_result_get_type: TGType; cdecl; external libgsttag;
function gst_tag_image_type_get_type: TGType; cdecl; external libgsttag;
function gst_tag_license_flags_get_type: TGType; cdecl; external libgsttag;

// === Konventiert am: 26-7-26 17:18:32 ===

function GST_TYPE_TAG_DEMUX_RESULT: TGType;
function GST_TYPE_TAG_IMAGE_TYPE: TGType;
function GST_TYPE_TAG_LICENSE_FLAGS: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_TAG_DEMUX_RESULT: TGType;
begin
  GST_TYPE_TAG_DEMUX_RESULT := gst_tag_demux_result_get_type;
end;

function GST_TYPE_TAG_IMAGE_TYPE: TGType;
begin
  GST_TYPE_TAG_IMAGE_TYPE := gst_tag_image_type_get_type;
end;

function GST_TYPE_TAG_LICENSE_FLAGS: TGType;
begin
  GST_TYPE_TAG_LICENSE_FLAGS := gst_tag_license_flags_get_type;
end;

{$ENDIF read_implementation}
