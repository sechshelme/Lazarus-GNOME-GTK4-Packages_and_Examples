unit gstlcevcmeta;

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}




const
  GST_CAPS_FEATURE_META_GST_LCEVC_META = 'meta:GstLcevcMeta';

type
  PGstLcevcMeta = ^TGstLcevcMeta;
  TGstLcevcMeta = record
    meta: TGstMeta;
    id: Tgint;
    enhancement_data: PGstBuffer;
  end;

function gst_lcevc_meta_api_get_type: TGType; cdecl; external libgstcodecparsers;
function gst_lcevc_meta_get_info: PGstMetaInfo; cdecl; external libgstcodecparsers;
function gst_buffer_get_lcevc_meta(buffer: PGstBuffer): PGstLcevcMeta; cdecl; external libgstcodecparsers;
function gst_buffer_get_lcevc_meta_id(buffer: PGstBuffer; id: Tgint): PGstLcevcMeta; cdecl; external libgstcodecparsers;
function gst_buffer_add_lcevc_meta(buffer: PGstBuffer; enhancement_data: PGstBuffer): PGstLcevcMeta; cdecl; external libgstcodecparsers;

// === Konventiert am: 21-7-26 17:01:35 ===

function GST_LCEVC_META_INFO: PGstMetaInfo;
function GST_LCEVC_META_API_TYPE: TGType;

implementation

function GST_LCEVC_META_API_TYPE: TGType;
begin
  GST_LCEVC_META_API_TYPE := gst_lcevc_meta_api_get_type;
end;

function GST_LCEVC_META_INFO: PGstMetaInfo;
begin
  GST_LCEVC_META_INFO := gst_lcevc_meta_get_info;
end;

end.
