
  {$IFDEF read_enum}
const
  GST_PROTECTION_SYSTEM_ID_CAPS_FIELD = 'protection-system';
  GST_PROTECTION_UNSPECIFIED_SYSTEM_ID = 'unspecified-system-id';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstProtectionMeta = ^TGstProtectionMeta;
  TGstProtectionMeta = record
    meta: TGstMeta;
    info: PGstStructure;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_protection_meta_api_get_type: TGType; cdecl; external libgstreamer;
function gst_protection_meta_get_info: PGstMetaInfo; cdecl; external libgstreamer;
function gst_buffer_add_protection_meta(buffer: PGstBuffer; info: PGstStructure): PGstProtectionMeta; cdecl; external libgstreamer;
function gst_protection_select_system(system_identifiers: PPgchar): Pgchar; cdecl; external libgstreamer;
function gst_protection_filter_systems_by_available_decryptors(system_identifiers: PPgchar): PPgchar; cdecl; external libgstreamer;

// === Konventiert am: 11-7-26 15:24:58 ===

function gst_buffer_get_protection_meta(b: PGstBuffer_): PGstProtectionMeta;

function GST_PROTECTION_META_API_TYPE: TGType;
function GST_PROTECTION_META_INFO: PGstMetaInfo;
{$ENDIF read_function}


{$IFDEF read_implementation}


function gst_buffer_get_protection_meta(b: PGstBuffer_): PGstProtectionMeta;
begin
  gst_buffer_get_protection_meta := PGstProtectionMeta(gst_buffer_get_meta(b, GST_PROTECTION_META_API_TYPE));
end;


function GST_PROTECTION_META_API_TYPE: TGType;
begin
  GST_PROTECTION_META_API_TYPE := gst_protection_meta_api_get_type;
end;

function GST_PROTECTION_META_INFO: PGstMetaInfo;
begin
  GST_PROTECTION_META_INFO := gst_protection_meta_get_info;
end;


{$ENDIF read_implementation}
