/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  GST_PROTECTION_SYSTEM_ID_CAPS_FIELD = 'protection-system';
  GST_PROTECTION_UNSPECIFIED_SYSTEM_ID = 'unspecified-system-id';

type
  TGstProtectionMeta = record
    meta: TGstMeta;
    info: PGstStructure;
  end;
  PGstProtectionMeta = ^TGstProtectionMeta;


function gst_protection_meta_get_info: PGstMetaInfo; cdecl; external libgstreamer;
function gst_buffer_add_protection_meta(buffer: PGstBuffer; info: PGstStructure): PGstProtectionMeta; cdecl; external libgstreamer;
function gst_protection_select_system(system_identifiers: PPgchar): Pgchar; cdecl; external libgstreamer;
function gst_protection_filter_systems_by_available_decryptors(system_identifiers: PPgchar): PPgchar; cdecl; external libgstreamer;

function gst_protection_meta_api_get_type: TGType; cdecl; external libgstreamer;
function gst_buffer_get_protection_meta(b: PGstBuffer): PGstProtectionMeta;

function GST_PROTECTION_META_INFO: PGstMetaInfo;

// === Konventiert am: 18-9-24 13:45:43 ===

function GST_PROTECTION_META_API_TYPE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_PROTECTION_META_API_TYPE: TGType;
begin
  GST_PROTECTION_META_API_TYPE := gst_protection_meta_api_get_type;
end;

function gst_buffer_get_protection_meta(b: PGstBuffer): PGstProtectionMeta;
begin
  gst_buffer_get_protection_meta := PGstProtectionMeta(gst_buffer_get_meta(b, GST_PROTECTION_META_API_TYPE));
end;

function GST_PROTECTION_META_INFO: PGstMetaInfo;
begin
  GST_PROTECTION_META_INFO := gst_protection_meta_get_info;
end;


{$ENDIF read_implementation}
