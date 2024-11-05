/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 06-10-2024   19:37                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_tag_demux_result_get_type: TGType; cdecl; external libgsttag;
function GST_TYPE_TAG_DEMUX_RESULT: TGType;

function gst_tag_image_type_get_type: TGType; cdecl; external libgsttag;
function GST_TYPE_TAG_IMAGE_TYPE: TGType;

function gst_tag_license_flags_get_type: TGType; cdecl; external libgsttag;
function GST_TYPE_TAG_LICENSE_FLAGS: TGType;


// === Konventiert am: 6-10-24 19:21:25 ===


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
