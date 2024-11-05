/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 01-10-2024   15:41                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstPbUtilsCapsDescriptionFlags = ^TGstPbUtilsCapsDescriptionFlags;
  TGstPbUtilsCapsDescriptionFlags = longint;

const
  GST_PBUTILS_CAPS_DESCRIPTION_FLAG_CONTAINER = 1 shl 0;
  GST_PBUTILS_CAPS_DESCRIPTION_FLAG_AUDIO = 1 shl 1;
  GST_PBUTILS_CAPS_DESCRIPTION_FLAG_VIDEO = 1 shl 2;
  GST_PBUTILS_CAPS_DESCRIPTION_FLAG_IMAGE = 1 shl 3;
  GST_PBUTILS_CAPS_DESCRIPTION_FLAG_SUBTITLE = 1 shl 4;
  GST_PBUTILS_CAPS_DESCRIPTION_FLAG_TAG = 1 shl 5;
  GST_PBUTILS_CAPS_DESCRIPTION_FLAG_GENERIC = 1 shl 6;
  GST_PBUTILS_CAPS_DESCRIPTION_FLAG_METADATA = 1 shl 7;

function gst_pb_utils_add_codec_description_to_tag_list(taglist: PGstTagList; codec_tag: Pgchar; caps: PGstCaps): Tgboolean; cdecl; external libgstpbutils;
function gst_pb_utils_get_codec_description(caps: PGstCaps): Pgchar; cdecl; external libgstpbutils;
function gst_pb_utils_get_source_description(protocol: Pgchar): Pgchar; cdecl; external libgstpbutils;
function gst_pb_utils_get_sink_description(protocol: Pgchar): Pgchar; cdecl; external libgstpbutils;
function gst_pb_utils_get_decoder_description(caps: PGstCaps): Pgchar; cdecl; external libgstpbutils;
function gst_pb_utils_get_encoder_description(caps: PGstCaps): Pgchar; cdecl; external libgstpbutils;
function gst_pb_utils_get_element_description(factory_name: Pgchar): Pgchar; cdecl; external libgstpbutils;
function gst_pb_utils_get_caps_description_flags(caps: PGstCaps): TGstPbUtilsCapsDescriptionFlags; cdecl; external libgstpbutils;
function gst_pb_utils_get_file_extension_from_caps(caps: PGstCaps): Pgchar; cdecl; external libgstpbutils;

// === Konventiert am: 27-9-24 16:15:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
